#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_62 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_66 [[user(locn2)]];
    float4 m_74 [[user(locn3)]];
    float4 m_84 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_68 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_78 [[user(locn9)]];
    float4 m_80 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_72 [[attribute(0)]];
    float4 m_70 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
    float4 m_60 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3139 = false;
    bool _441 = false;
    bool _325 = false;
    bool _223 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    float _113 = _111;
    if (!_107)
    {
        out.m_49.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _111 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3444 = as_type<float>(_119);
        out.gl_Position.z = _3444;
    }
    if (!_107)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = in.m_51.w;
    bool _125 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_123);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    float _135 = -_123;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _139 = _137;
    if (_133)
    {
        float _141 = float(_103);
        _113 = _141;
    }
    float _143 = _113;
    bool _145 = _137 >= _143;
    bool _147 = !_133;
    bool _149 = _145 || _147;
    float _151 = _143;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _151;
    if (_149)
    {
        out.m_49.x = 0.0;
    }
    if (_149)
    {
        float _155 = _153 * 5.0;
        _121 = as_type<int>(_155);
    }
    int _157 = _121;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3514 = as_type<float>(_157);
        out.gl_Position.z = _3514;
    }
    if (_149)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = in.m_56.x;
    float _163 = in.m_56.y;
    float _165 = in.m_56.z;
    int _167 = as_type<int>(_159) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_159) & 2;
    bool _173 = _171 != 0;
    bool _175 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _177 = _163 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _179 = _163 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _181 = _163 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _183 = !_169;
    float _185 = _183 ? (-0.5) : 0.5;
    float _187 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].x, _177);
    float _189 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].x, _179);
    float _191 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].x, _181);
    bool _193 = !_173;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].z, _187);
    float _199 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].z, _189);
    float _201 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].z, _191);
    bool _203 = !_175;
    float _221;
    if (!_203)
    {
        float _205 = in.m_58.x;
        float _207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _209 = _205 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _213 = _211 * _207;
        float _215 = floor(_213);
        float _217 = -_215;
        float _219 = _213 + _217;
        _221 = _219;
        _223 = true;
    }
    else
    {
        float _225 = float(_103);
        float _227 = 1.0 / _225;
        float _229 = _137 * _227;
        _221 = _229;
    }
    _223 = false;
    float _231 = _221;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = _231 + _233;
    bool _237 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _239 = isnan(_231);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _249;
    float _253 = -_247;
    float _255 = _253 + 1.0;
    bool _257 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _259 = isnan(_231);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _265 = _261 || _263;
    float _267 = float(_265);
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _269;
    bool _273 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _275 = 1.0 / _251;
    float _277 = _267 * _255;
    float _279 = -_267;
    float _281 = _279 + 1.0;
    float _283 = _235 * _275;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _285;
    float _289 = fma(_271, _283, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _291 = fma(_287, _283, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _293 = _289 * _277;
    float _295 = _291 * _277;
    float _297 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[143].x, _293);
    float _299 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[143].y, _295);
    float _301 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[144].x, _297);
    float _303 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[144].y, _299);
    bool _305 = !_273;
    float _323;
    if (!_305)
    {
        float _307 = in.m_58.x;
        float _309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _311 = _307 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[11].y, _137);
        float _315 = _313 * _309;
        float _317 = floor(_315);
        float _319 = -_317;
        float _321 = _315 + _319;
        _323 = _321;
        _325 = true;
    }
    else
    {
        float _327 = float(_103);
        float _329 = 1.0 / _327;
        float _331 = _137 * _329;
        _323 = _331;
    }
    _325 = false;
    float _333 = _323;
    float _335 = in.m_60.x;
    float _337 = in.m_60.y;
    bool _339 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _341 = isnan(_333);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _355 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _357 = isnan(_333);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _373 = _333 + _371;
    float _375 = -_349;
    float _377 = _375 + 1.0;
    bool _379 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _381 = 1.0 / _353;
    float _383 = _365 * _377;
    float _385 = -_365;
    float _387 = _385 + 1.0;
    float _389 = _303 * _337;
    float _391 = _301 * _335;
    float _393 = _369 * _381;
    float _395 = fma(_393, _373, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _397 = _395 * _383;
    float _399 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[115].x, _397);
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _407 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[116].x, _399);
    float _409 = _401 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = _403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _413 = _405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _415 = _407 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_62.x = _409;
    out.m_62.y = _411;
    out.m_62.z = _413;
    out.m_62.w = _415;
    bool _417 = !_379;
    float _437;
    float _439;
    if (!_417)
    {
        float _419 = in.m_58.x;
        float _421 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _423 = float(_103);
        float _425 = _419 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _427 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[11].w, _137);
        float _429 = _427 * _421;
        float _431 = floor(_429);
        float _433 = -_431;
        float _435 = _429 + _433;
        _437 = _423;
        _439 = _435;
        _441 = true;
    }
    else
    {
        float _443 = float(_103);
        float _445 = 1.0 / _443;
        float _447 = _137 * _445;
        _437 = _443;
        _439 = _447;
    }
    _441 = false;
    float _449 = _437;
    float _451 = _439;
    float _453 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _455 = int(_453);
    float _457 = _391 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _461 = _459 != 0;
    float _463 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _465 = int(_463);
    float _467 = float(_455);
    float _469 = 1.0 / _449;
    float _471 = float(uint(_465));
    float _473 = 1.0 / _467;
    float _475 = float(_465);
    int _477 = ~_465;
    int _479 = _477 + 1;
    bool _481 = _465 == 0;
    float _483 = 1.0 / _471;
    float _485 = _473 * _137;
    float _487 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _489 = as_type<int>(_483) + (-2);
    float _491 = trunc(_485);
    int _493 = int(_491);
    float _495 = float(uint(_493));
    float _497 = as_type<float>(_489) * _495;
    int _499 = ~_465;
    int _501 = _499 + 1;
    float _503 = trunc(_497);
    float _505 = precise::max(_503, 0.0);
    uint _508 = uint(_505);
    bool _510 = !_461;
    float _512 = _510 ? 5.839270114898681640625 : 1.0;
    int _514 = _501 * int(_508);
    int _516 = _514 + _493;
    float _518 = float(uint(_516));
    float _520 = as_type<float>(_489) * _518;
    float _522 = in.m_58.x;
    float _524 = in.m_58.y;
    float _526 = in.m_58.z;
    float _528 = in.m_58.w;
    float _530 = trunc(_520);
    float _532 = precise::max(_530, 0.0);
    uint _534 = uint(_532);
    int _536 = int(_508) + int(_534);
    float _538 = float(_493);
    bool _540 = _524 > 0.5;
    int _542 = _479 * _536;
    int _544 = _542 + _493;
    bool _546 = _538 >= _475;
    bool _548 = isnan(_538);
    bool _550 = _546 || _548;
    bool _552 = isnan(_475);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    bool _558 = !_461;
    float _560 = _558 ? _526 : _522;
    bool _562 = uint(_544) >= uint(_465);
    float _564 = trunc(_556);
    int _566 = int(_564);
    float _568 = -_185;
    int _570 = _540 ? as_type<int>(_568) : as_type<int>(_185);
    float _572 = _512 * _560;
    bool _574 = !_562;
    int _576 = _574 ? 0 : (-1);
    bool _578 = _526 > 0.5;
    int _580 = ~_536;
    int _582 = _580 + _576;
    int _584 = _582 + 1;
    float _586 = floor(_572);
    float _588 = -_195;
    int _590 = _578 ? as_type<int>(_588) : as_type<int>(_195);
    int _592 = _465 * _584;
    int _594 = _592 + _493;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _598 = _596 != 0;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _602 = _600 != 0;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _606 = _604 != 0;
    int _608 = ~_566;
    int _610 = _608 + 1;
    int _612 = _610 + 1;
    bool _614 = !_481;
    int _616 = _614 ? _594 : (-1);
    bool _618 = !_598;
    float _620 = _618 ? _185 : as_type<float>(_570);
    bool _622 = !_602;
    float _624 = _622 ? _195 : as_type<float>(_590);
    float _626 = -_586;
    float _628 = _572 + _626;
    int _630 = _616 * _612;
    int _632 = _465 + (-1);
    float _634 = _628 * _475;
    float _636 = _475 * _137;
    bool _638 = !_606;
    int _640 = _638 ? 0 : 1;
    float _642 = trunc(_634);
    int _644 = int(_642);
    float _646 = _636 * _469;
    int _648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _650 = _648 != 0;
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _654 = _652 != 0;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _658 = _656 != 0;
    int _660 = _566 * _632;
    int _662 = _660 + _630;
    int _664 = abs(_640);
    bool _666 = !_654;
    int _668 = _666 ? 0 : 1;
    float _670 = trunc(_646);
    int _672 = int(_670);
    bool _674 = !_650;
    int _676 = _674 ? 0 : 1;
    int _678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _680 = _678 != 0;
    int _682 = abs(_668);
    bool _684 = !_658;
    int _686 = _684 ? 0 : 1;
    int _688 = _644 * _664;
    int _690 = _688 + _493;
    int _692 = abs(_676);
    bool _694 = !_680;
    int _696 = _694 ? 0 : 1;
    int _698 = abs(_686);
    int _700 = _662 * _682;
    int _702 = abs(_696);
    int _704 = _672 * _692;
    int _706 = _704 + _700;
    int _708 = ~_465;
    int _710 = _708 + 1;
    int _712 = ~_465;
    int _714 = _712 + 1;
    int _716 = _690 * _698;
    int _718 = _716 + _706;
    int _720 = ~_465;
    int _722 = _720 + 1;
    int _724 = _644 * _702;
    int _726 = _724 + _718;
    float _728 = float(uint(_726));
    float _730 = as_type<float>(_489) * _728;
    float _732 = trunc(_730);
    float _734 = precise::max(_732, 0.0);
    uint _736 = uint(_734);
    int _738 = _722 * int(_736);
    int _740 = _738 + _726;
    float _742 = float(uint(_740));
    float _744 = as_type<float>(_489) * _742;
    float _746 = trunc(_744);
    float _748 = precise::max(_746, 0.0);
    uint _750 = uint(_748);
    int _752 = int(_736) + int(_750);
    int _754 = _710 * _752;
    int _756 = _754 + _726;
    bool _758 = uint(_756) >= uint(_465);
    bool _760 = !_758;
    int _762 = _760 ? 0 : (-1);
    int _764 = ~_752;
    int _766 = _764 + _762;
    int _768 = _766 + 1;
    float _770 = float(uint(_690));
    int _772 = _465 * _768;
    int _774 = _772 + _726;
    float _776 = as_type<float>(_489) * _770;
    int _778 = ~_465;
    int _780 = _778 + 1;
    bool _782 = !_481;
    int _784 = _782 ? _774 : (-1);
    float _786 = trunc(_776);
    float _788 = precise::max(_786, 0.0);
    uint _790 = uint(_788);
    int _792 = _784 >> 31;
    int _794 = _784 & 3;
    bool _796 = _794 != 0;
    int _798 = _792 & 3;
    int _800 = _784 + _798;
    int _802 = _800 >> 2;
    int _804 = _780 * int(_790);
    int _806 = _804 + _690;
    int _808 = _802 << 4;
    int _810 = _808 + 656;
    float _812 = float(uint(_806));
    uint _814 = uint(int(uint(_810) >> uint(2)));
    uint _816 = uint(int(uint(int(_814)) >> uint(2)));
    int _818 = int(_814) & 3;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[int(_816)][_818];
    int _822 = int(_814) + 1;
    uint _824 = uint(int(uint(_822) >> uint(2)));
    int _826 = _822 & 3;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[int(_824)][_826];
    float _830 = as_type<float>(_489) * _812;
    int _832 = _784 & 3;
    bool _834 = _832 != 0;
    int _836 = _796 ? 0 : 1;
    int _838 = _810 + 8;
    uint _840 = uint(int(uint(_838) >> uint(2)));
    uint _842 = uint(int(uint(int(_840)) >> uint(2)));
    int _844 = int(_840) & 3;
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[int(_842)][_844];
    int _848 = int(_840) + 1;
    uint _850 = uint(int(uint(_848) >> uint(2)));
    int _852 = _848 & 3;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[int(_850)][_852];
    float _856 = trunc(_830);
    float _858 = precise::max(_856, 0.0);
    uint _860 = uint(_858);
    bool _862 = uint(_832) > 1u;
    int _864 = ~_836;
    int _866 = _864 + 1;
    int _868 = _866 + 1;
    bool _870 = uint(_832) >= 2u;
    int _872 = _868;
    if (!_862)
    {
        int _874 = ~_836;
        int _876 = _874 + 1;
        _872 = _876;
    }
    int _878 = _872;
    int _880 = int(_790) + int(_860);
    bool _882 = _832 != 3;
    int _884 = _870 ? 0 : 1;
    int _886 = _714 * _880;
    int _888 = _886 + _690;
    int _890 = abs(_878);
    bool _892 = !_834;
    int _894 = _892 ? 0 : 1;
    float _896 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _898 = int(_896);
    bool _900 = uint(_888) >= uint(_465);
    int _902 = ~_890;
    int _904 = _902 + 1;
    int _906 = _904 + 1;
    bool _908 = !_900;
    int _910 = _908 ? 0 : (-1);
    int _912 = ~_884;
    int _914 = _912 + 1;
    int _916 = _914 + 1;
    bool _918 = _832 != 3;
    int _920 = _916;
    if (_882)
    {
        int _922 = ~_884;
        int _924 = _922 + 1;
        _920 = _924;
    }
    int _926 = _920;
    int _928 = abs(_894);
    int _930 = _906 * as_type<int>(_828);
    int _932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _934 = _932 != 0;
    bool _936 = !_918;
    int _938 = _936 ? 0 : (-1);
    int _940 = abs(_926);
    bool _942 = !_934;
    int _944 = _942 ? 0 : 1;
    int _946 = abs(_938);
    int _948 = ~_928;
    int _950 = _948 + 1;
    int _952 = _950 + 1;
    int _954 = abs(_944);
    int _956 = _952 * as_type<int>(_820);
    int _958 = _956 + _930;
    int _960 = ~_940;
    int _962 = _960 + 1;
    int _964 = _962 + 1;
    int _966 = ~_880;
    int _968 = _966 + _910;
    int _970 = _968 + 1;
    float _972 = _522 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _974 = _964 * as_type<int>(_846);
    int _976 = _974 + _958;
    int _978 = ~_946;
    int _980 = _978 + 1;
    int _982 = _980 + 1;
    int _984 = _465 * _970;
    int _986 = _984 + _690;
    float _988 = float(uint(_898));
    float _990 = _524 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _992 = ~_954;
    int _994 = _992 + 1;
    int _996 = _994 + 1;
    int _998 = _982 * as_type<int>(_854);
    int _1000 = _998 + _976;
    bool _1002 = !_481;
    int _1004 = _1002 ? _986 : (-1);
    float _1006 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1008 = abs(_898);
    int _1010 = _1000 * _996;
    int _1012 = ~_898;
    int _1014 = _1012 + 1;
    int _1016 = _1004 * _954;
    int _1018 = _1016 + _1010;
    float _1020 = float(uint(_1008));
    float _1022 = 1.0 / _988;
    bool _1024 = _528 > 0.5;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1030 = float(uint(_1018));
    float _1032 = 1.0 / _1020;
    int _1034 = ~_1008;
    int _1036 = _1034 + 1;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1042 = _1040 != 0;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1048 = _1046 != 0;
    float _1050 = fma(_990, -2.0, _1038);
    float _1052 = _526 * 2.0;
    int _1054 = as_type<int>(_1022) + (-2);
    float _1056 = 1.0 / _1028;
    int _1058 = abs(_1018);
    float _1060 = -_1044;
    float _1062 = fma(_972, 2.0, _1060);
    float _1064 = -_195;
    int _1066 = _1024 ? as_type<int>(_1064) : as_type<int>(_195);
    float _1068 = as_type<float>(_1054) * _1030;
    float _1070 = float(uint(_1058));
    float _1072 = in.m_46.x;
    float _1074 = in.m_46.y;
    float _1076 = in.m_46.z;
    int _1078 = as_type<int>(_1032) + (-2);
    float _1080 = _522 * 2.0;
    int _1082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1084 = _1082 != 0;
    float _1086 = trunc(_1068);
    float _1088 = precise::max(_1086, 0.0);
    uint _1090 = uint(_1088);
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1094 = _1092 != 0;
    float _1096 = as_type<float>(_1078) * _1070;
    float _1098 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1050);
    bool _1100 = !_1084;
    float _1102 = _1100 ? _195 : as_type<float>(_1066);
    bool _1104 = _898 == 0;
    float _1106 = trunc(_1096);
    float _1108 = precise::max(_1106, 0.0);
    uint _1110 = uint(_1108);
    int _1112 = _1014 * int(_1090);
    int _1114 = _1112 + _1018;
    float _1116 = floor(_1080);
    float _1118 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1120 = float(uint(_1114));
    float _1122 = _524 + _522;
    int _1124 = _1036 * int(_1110);
    int _1126 = _1124 + _1058;
    float _1128 = floor(_1052);
    float _1130 = as_type<float>(_1054) * _1120;
    float _1132 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1134 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1136 = float(uint(_1126));
    float _1138 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1118);
    float _1140 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1132);
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1142;
    float _1146 = trunc(_1130);
    float _1148 = precise::max(_1146, 0.0);
    uint _1150 = uint(_1148);
    float _1152 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1134);
    float _1154 = as_type<float>(_1078) * _1136;
    float _1156 = _524 + _526;
    float _1158 = -_195;
    int _1160 = _540 ? as_type<int>(_1158) : as_type<int>(_195);
    float _1162 = _1122 + (-1.0);
    bool _1164 = _522 > 0.5;
    float _1166 = _1144 * _1056;
    float _1168 = _1156 + (-1.0);
    float _1170 = trunc(_1154);
    float _1172 = precise::max(_1170, 0.0);
    uint _1174 = uint(_1172);
    float _1176 = -_185;
    int _1178 = _1164 ? as_type<int>(_1176) : as_type<int>(_185);
    float _1180 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1184 = _451 + _1182;
    bool _1186 = !_1094;
    float _1188 = _1186 ? _185 : as_type<float>(_1178);
    float _1190 = -_185;
    int _1192 = _578 ? as_type<int>(_1190) : as_type<int>(_185);
    float _1194 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1196 = !_1042;
    float _1198 = _1196 ? _195 : as_type<float>(_1160);
    float _1200 = -_137;
    float _1202 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1062);
    bool _1204 = _1116 > 0.0;
    float _1206 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1152);
    bool _1208 = _1116 >= 0.0;
    bool _1210 = isnan(_1116);
    bool _1212 = _1208 || _1210;
    bool _1214 = isnan(0.0);
    bool _1216 = _1212 || _1214;
    float _1218 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1220 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1138);
    float _1222 = _1188 + 0.5;
    int _1224 = int(_1090) + int(_1150);
    float _1226 = fma(_1166, _1184, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1228 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1230 = isnan(_451);
    bool _1232 = _1228 || _1230;
    bool _1234 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1236 = _1232 || _1234;
    float _1238 = float(_1236);
    float _1240 = _487 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1242 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1140);
    float _1244 = fma(_1218, _1222, _1202);
    bool _1246 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1248 = isnan(_451);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    float _1258 = -_1238;
    float _1260 = _1258 + 1.0;
    int _1262 = ~_898;
    int _1264 = _1262 + 1;
    float _1266 = _1198 + (-0.5);
    int _1268 = int(_1110) + int(_1174);
    float _1270 = _1256 * _1260;
    int _1272 = ~_1008;
    int _1274 = _1272 + 1;
    int _1276 = _1264 * _1224;
    int _1278 = _1276 + _1018;
    float _1280 = -_1240;
    float _1282 = -_1098;
    float _1284 = fma(_1280, _1266, _1282);
    float _1286 = _1226 * _1270;
    int _1288 = _1274 * _1268;
    int _1290 = _1288 + _1058;
    bool _1292 = !_1048;
    float _1294 = _1292 ? _185 : as_type<float>(_1192);
    float _1296 = -_1256;
    float _1298 = _1296 + 1.0;
    bool _1300 = uint(_1278) >= uint(_898);
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1304 = as_type<float>(_1058);
    float _1306 = _1098;
    float _1308 = as_type<float>(_898);
    float _1310 = as_type<float>(_1018);
    float _1312 = as_type<float>(_1268);
    if (_461)
    {
        _1304 = _522;
    }
    float _1314 = _1304;
    float _1316 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1286);
    float _1318 = _1294 + 0.5;
    float _1320 = _1314;
    if (!_461)
    {
        _1306 = _524;
    }
    float _1322 = _1306;
    float _1324 = _1242 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1326 = _1322;
    if (!_461)
    {
        _1320 = _526;
    }
    float _1328 = _1320;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_461)
    {
        _1326 = _522;
    }
    float _1332 = _1326;
    float _1334 = _1220 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1336 = !_1300;
    int _1338 = _1336 ? 0 : (-1);
    float _1340 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1342 = uint(_1290) >= uint(_1008);
    float _1344 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1302);
    float _1346 = _1332 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1348 = ~_1224;
    int _1350 = _1348 + _1338;
    int _1352 = _1350 + 1;
    float _1354 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1356 = _1018 ^ _898;
    float _1358 = -_1330;
    float _1360 = fma(_1346, 2.0, _1358);
    bool _1362 = !_1342;
    int _1364 = _1362 ? 0 : (-1);
    int _1366 = _898 * _1352;
    int _1368 = _1366 + _1018;
    uint _1370 = uint(int(uint(_1356) >> uint(31)));
    float _1372 = _1206 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1374 = ~_1364;
    int _1376 = _1268 + _1374;
    int _1378 = _1376 + 1;
    float _1380 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1382 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1344);
    bool _1384 = _898 == 0;
    int _1386 = ~int(_1370);
    int _1388 = _1386 + 1;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_461)
    {
        _1308 = _526;
    }
    float _1392 = _1308;
    float _1394 = -_1382;
    float _1396 = _1394 + 1.0;
    float _1398 = _1392;
    if (_461)
    {
        _1398 = _524;
    }
    float _1400 = _1398;
    int _1402 = _1378 ^ _1388;
    float _1404 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1390);
    int _1406 = ~_1388;
    int _1408 = _1406 + _1402;
    int _1410 = _1408 + 1;
    bool _1412 = _1128 >= 0.0;
    bool _1414 = isnan(_1128);
    bool _1416 = _1412 || _1414;
    bool _1418 = isnan(0.0);
    bool _1420 = _1416 || _1418;
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (!_461)
    {
        _1310 = _526;
    }
    float _1424 = _1310;
    float _1426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1428 = -_1422;
    float _1430 = fma(_1340, 2.0, _1428);
    float _1432 = _1424;
    if (_461)
    {
        _1432 = _524;
    }
    float _1434 = _1432;
    float _1436 = -_137;
    float _1438 = fma(_1436, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1360);
    bool _1440 = !_1104;
    int _1442 = _1440 ? _1368 : (-1);
    float _1444 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1446 = _1334 + _1444;
    bool _1448 = !_1384;
    int _1450 = _1448 ? _1410 : (-1);
    float _1452 = -_137;
    float _1454 = fma(_1452, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1430);
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1458 = _1456 != 0;
    int _1460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1462 = _1460 != 0;
    int _1464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1466 = _1464 != 0;
    float _1468 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1470 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1472 = _1434 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1474 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1316);
    float _1476 = fma(_1468, _1318, _1438);
    if (_461)
    {
        _1312 = _524;
    }
    float _1478 = _1312;
    float _1480 = fma(_1472, -2.0, _1470);
    float _1482 = _1478;
    if (!_461)
    {
        _1482 = _522;
    }
    float _1484 = _1482;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1488 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1490 = _1324 + _1488;
    float _1492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1494 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1496 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1498 = _1490 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1500 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1480);
    float _1502 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1504 = _1372 + _1502;
    float _1506 = _1102 + (-0.5);
    float _1508 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1498);
    float _1510 = fma(_1496, -2.0, _1486);
    float _1512 = float(_1442);
    float _1514 = -_1494;
    float _1516 = -_1500;
    float _1518 = fma(_1514, _1506, _1516);
    float _1520 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1508);
    float _1522 = _1426 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1524 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1510);
    float _1526 = float(_1450);
    float _1528 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1530 = _1520 >= 0.0;
    float _1532 = fma(_1522, _1512, _1454);
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1536 = _620 + 0.5;
    float _1538 = -_1524;
    float _1540 = fma(_1528, _1526, _1538);
    float _1542 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1534);
    float _1544 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1546 = fma(_1522, _1536, _1532);
    float _1548 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1404);
    float _1550 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1542);
    float _1552 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1544);
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1556 = -_1548;
    float _1558 = _1556 + 1.0;
    float _1560 = _624 + (-0.5);
    float _1562 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1552);
    float _1564 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1554);
    float _1566 = -_1550;
    float _1568 = _1566 + 1.0;
    float _1570 = -_1562;
    float _1572 = _1570 + 1.0;
    float _1574 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1564);
    float _1576 = -_1528;
    float _1578 = fma(_1576, _1560, _1540);
    float _1580 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1582 = fma(_1198, _1572, _1284);
    float _1584 = -_1574;
    float _1586 = _1584 + 1.0;
    float _1588 = -_1396;
    float _1590 = fma(_1294, _1588, _1476);
    float _1592 = _1490 * _1490;
    float _1594 = fma(_1102, _1558, _1518);
    float _1596 = -_1586;
    float _1598 = fma(_1188, _1596, _1244);
    float _1600 = fma(_1446, _1446, _1592);
    float _1602 = _524 * 2.0;
    float _1604 = fma(_1504, _1504, _1600);
    float _1606 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1610 = floor(_1602);
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1614 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1606);
    float _1616 = _1606;
    if (_1530)
    {
        _1616 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1618 = _1616;
    float _1620 = -_1568;
    float _1622 = fma(_620, _1620, _1546);
    float _1624 = _1580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1626 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1614);
    float _1628 = _1612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1630 = rsqrt(_1604);
    float _1632 = _1608 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1634 = -_1626;
    float _1636 = _1634 + 1.0;
    float _1638 = _1474 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1640 = as_type<int>(_1618);
    if (_1530)
    {
        float _1642 = _1618 * 5.0;
        _1640 = as_type<int>(_1642);
    }
    int _1644 = _1640;
    float _1646 = fma(_624, _1636, _1578);
    float _1648 = _457 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1650 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1652 = log2(_1650);
    out.m_64.x = _1624;
    out.m_64.y = _1628;
    out.m_64.z = _1632;
    out.m_64.w = _1638;
    bool _1654 = !_1462;
    int _1656 = _1654 ? 0 : 1;
    bool _1658 = !_1466;
    int _1660 = _1658 ? 0 : 1;
    out.m_66.x = _1598;
    out.m_66.y = _1582;
    out.m_66.z = _1590;
    out.m_66.w = _1594;
    bool _1662 = _1610 > 0.0;
    float _1664 = _1648 * _1630;
    if (_1530)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5830 = as_type<float>(_1644);
        out.gl_Position.z = _5830;
    }
    bool _1666 = !_1458;
    int _1668 = _1666 ? 0 : 1;
    float _1670 = _1446 * _1664;
    out.m_68.x = _1622;
    out.m_68.y = _1646;
    float _1672 = _1490 * _1664;
    float _1674 = _1672;
    if (_1530)
    {
        out.m_49.x = 0.0;
    }
    if (_1530)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1676 = -_1672;
    float _1678 = _1324 + _1676;
    bool _1680 = _1128 > 0.0;
    float _1682 = -_1670;
    float _1684 = _1334 + _1682;
    int _1686 = _1420 ? 0 : 1;
    float _1688 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1690 = _1678 + _1688;
    float _1692 = _1652 * _137;
    float _1694 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1696 = _1684 + _1694;
    int _1698 = ~_1686;
    int _1700 = _1698 + 1;
    int _1702 = _1700 + 1;
    float _1704 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1706 = _1504 * _1664;
    float _1708 = exp2(_1692);
    float _1710 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1704);
    bool _1712 = _1610 >= 0.0;
    bool _1714 = isnan(_1610);
    bool _1716 = _1712 || _1714;
    bool _1718 = isnan(0.0);
    bool _1720 = _1716 || _1718;
    float _1722 = -_1706;
    float _1724 = _1372 + _1722;
    int _1726 = _1702;
    if (!_1680)
    {
        int _1728 = ~_1686;
        int _1730 = _1728 + 1;
        _1726 = _1730;
    }
    int _1732 = _1726;
    float _1734 = -_1672;
    float _1736 = _1490 + _1734;
    float _1738 = in.m_70.x;
    float _1740 = in.m_70.y;
    float _1742 = in.m_70.z;
    int _1744 = abs(_1668);
    float _1746 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1748 = _1724 + _1746;
    bool _1750 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1752 = isnan(1.0);
    bool _1754 = _1750 || _1752;
    bool _1756 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1758 = _1754 || _1756;
    float _1760 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1762 = 1.0 + _1760;
    float _1764 = float(_1732);
    float _1766 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1710);
    float _1768 = float(_1744);
    float _1770 = 1.0 / _1762;
    int _1772 = _1216 ? 0 : 1;
    float _1774 = -_1708;
    float _1776 = _1774 + 1.0;
    bool _1778 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1780 = isnan(0.0);
    bool _1782 = _1778 || _1780;
    bool _1784 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1786 = _1782 || _1784;
    float _1788 = _1768 * _1764;
    float _1790 = -_1670;
    float _1792 = _1446 + _1790;
    float _1794 = -_1706;
    float _1796 = _1504 + _1794;
    float _1798 = _1786 ? _1776 : 0.0;
    float _1800 = _1788 * (-2.0);
    float _1802 = _1736 * _1736;
    bool _1804 = _1766 >= 0.0;
    float _1806 = fma(_1180, _1800, _1180);
    float _1808 = fma(_1792, _1792, _1802);
    int _1810 = ~_1772;
    int _1812 = _1810 + 1;
    int _1814 = _1812 + 1;
    float _1816 = fma(_1800, _1738, _1738);
    float _1818 = _522 + (-0.5);
    int _1820 = _1814;
    float _1822 = _1764;
    if (_1758)
    {
        float _1824 = _1798 * _1770;
        _139 = _1824;
    }
    float _1826 = _139;
    float _1828 = fma(_1796, _1796, _1808);
    if (!_1204)
    {
        int _1830 = ~_1772;
        int _1832 = _1830 + 1;
        _1820 = _1832;
    }
    int _1834 = _1820;
    float _1836 = fma(_1818, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1816);
    int _1838 = abs(_1656);
    if (_1804)
    {
        _1822 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1840 = _1822;
    float _1842 = fma(_1806, _1826, _1836);
    int _1844 = _1720 ? 0 : 1;
    float _1846 = sqrt(_1828);
    float _1848 = float(_1834);
    float _1850 = _1842 * 0.15915493667125701904296875;
    int _1852 = as_type<int>(_1840);
    if (_1804)
    {
        float _1854 = _1840 * 5.0;
        _1852 = as_type<int>(_1854);
    }
    int _1856 = _1852;
    float _1858 = float(_1838);
    if (_1804)
    {
        out.m_49.x = 0.0;
    }
    int _1860 = ~_1844;
    int _1862 = _1860 + 1;
    int _1864 = _1862 + 1;
    float _1866 = _1850 * 6.283185482025146484375;
    float _1868 = sin(_1866);
    int _1870 = _1864;
    if (!_1662)
    {
        int _1872 = ~_1844;
        int _1874 = _1872 + 1;
        _1870 = _1874;
    }
    int _1876 = _1870;
    if (_1804)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6135 = as_type<float>(_1856);
        out.gl_Position.z = _6135;
    }
    int _1878 = abs(_1660);
    float _1880 = _1858 * _1848;
    float _1882 = _524 + (-0.5);
    float _1884 = float(_1876);
    if (_1804)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1886 = -_1324;
    float _1888 = _1886 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1890 = _1880 * (-2.0);
    float _1892 = -_1334;
    float _1894 = _1892 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1896 = -_1372;
    float _1898 = _1896 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1900 = _1888 * _1888;
    float _1902 = fma(_1890, _1740, _1740);
    float _1904 = fma(_1194, _1890, _1194);
    float _1906 = float(_1878);
    float _1908 = fma(_1894, _1894, _1900);
    float _1910 = fma(_1882, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1902);
    float _1912 = _526 + _522;
    float _1914 = fma(_1898, _1898, _1908);
    float _1916 = fma(_1904, _1826, _1910);
    float _1918 = _1906 * _1884;
    float _1920 = _1912 + (-1.0);
    float _1922 = rsqrt(_1914);
    float _1924 = _526 + (-0.5);
    float _1926 = _1918 * (-2.0);
    float _1928 = fma(_1920, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1930 = _1916 * 0.15915493667125701904296875;
    float _1932 = _389 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1934 = fma(_1926, _1742, _1742);
    float _1936 = fma(_1928, _1926, _1928);
    float _1938 = _1850 * 6.283185482025146484375;
    float _1940 = cos(_1938);
    float _1942 = fma(_1924, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1934);
    float _1944 = fma(_1936, _1826, _1942);
    float _1946 = _1894 * _1922;
    float _1948 = _1898 * _1922;
    float _1950 = _1944 * 0.15915493667125701904296875;
    float _1952 = _1888 * _1922;
    float _1954 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1956 = _1946 * _1954;
    float _1958 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1960 = _1948 * _1958;
    float _1962 = _1930 * 6.283185482025146484375;
    float _1964 = sin(_1962);
    float _1966 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1968 = -_1956;
    float _1970 = fma(_1948, _1966, _1968);
    float _1972 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1974 = _1952 * _1972;
    float _1976 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1978 = -_1960;
    float _1980 = fma(_1952, _1976, _1978);
    float _1982 = _1970 * _1970;
    float _1984 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1986 = -_1974;
    float _1988 = fma(_1946, _1984, _1986);
    float _1990 = _1930 * 6.283185482025146484375;
    float _1992 = cos(_1990);
    float _1994 = fma(_1980, _1980, _1982);
    float _1996 = fma(_1988, _1988, _1994);
    float _1998 = _1950 * 6.283185482025146484375;
    float _2000 = sin(_1998);
    float _2002 = _1630 * _1846;
    float _2004 = _1868 * _1964;
    float _2006 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _2008 = _1940 * _1964;
    float _2010 = _2002 * _1932;
    float _2012 = _457 * _2002;
    float _2014 = _1950 * 6.283185482025146484375;
    float _2016 = cos(_2014);
    float _2018 = _1940 * _1992;
    float _2020 = _2006 * _2010;
    float _2022 = _1868 * _1992;
    float _2024 = rsqrt(_1996);
    float _2026 = fma(_2000, _2018, _2004);
    float _2028 = fma(_2000, _2004, _2018);
    float _2030 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _2032 = -_2008;
    float _2034 = fma(_2000, _2022, _2032);
    float _2036 = -_2022;
    float _2038 = fma(_2000, _2008, _2036);
    float _2040 = -_2020;
    float _2042 = _2000 * _2040;
    float _2044 = _2030 * _2012;
    float _2046 = _1940 * _2016;
    float _2048 = _1868 * _2016;
    float _2050 = _1992 * _2016;
    float _2052 = _2002 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2054 = _2052 * 0.5;
    float _2056 = _2046 * _2020;
    float _2058 = _1964 * _2016;
    float _2060 = fma(_2050, _2044, _2042);
    float _2062 = _1980 * _2024;
    float _2064 = _1988 * _2024;
    float _2066 = _1970 * _2024;
    float _2068 = fma(_2026, _2044, _2056);
    float _2070 = _1952 * _2062;
    float _2072 = _2048 * _2020;
    float _2074 = _1948 * _2066;
    float _2076 = fma(_2038, _2054, _2068);
    float _2078 = -_2070;
    float _2080 = fma(_1946, _2066, _2078);
    float _2082 = fma(_2034, _2044, _2072);
    float _2084 = fma(_2058, _2054, _2060);
    float _2086 = -_2074;
    float _2088 = fma(_1952, _2064, _2086);
    float _2090 = _2080 * _2076;
    float _2092 = fma(_2028, _2054, _2082);
    float _2094 = _1946 * _2064;
    float _2096 = _2088 * _2076;
    float _2098 = fma(_2064, _2084, _2090);
    float _2100 = -_2094;
    float _2102 = fma(_1948, _2062, _2100);
    float _2104 = fma(_2062, _2084, _2096);
    float _2106 = fma(_1948, _2092, _2098);
    float _2108 = _2102 * _2076;
    float _2110 = fma(_1946, _2092, _2104);
    float _2112 = _1372 + _2106;
    float _2114 = _1334 + _2110;
    float _2116 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2118 = _2112 + _2116;
    float _2120 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2122 = _2114 + _2120;
    float _2124 = _2118 * _2118;
    float _2126 = fma(_2122, _2122, _2124);
    float _2128 = fma(_2066, _2084, _2108);
    float _2130 = sqrt(_2126);
    float _2132 = fma(_1952, _2092, _2128);
    float _2134 = _1324 + _2132;
    bool _2136 = _2130 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2138 = _2092;
    float _2140 = _2132;
    float _2142 = _2084;
    float _2144 = _2108;
    if (!_2136)
    {
        _2138 = _2114;
    }
    float _2146 = _2138;
    float _2148 = _2146;
    if (!_2136)
    {
        _2140 = _2112;
    }
    float _2150 = _2140;
    float _2152 = _2150;
    if (!_2136)
    {
        _2142 = _2134;
    }
    float _2154 = _2142;
    bool _2156 = !_2136;
    float _2158 = _2154;
    if (!_2156)
    {
        float _2160 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2162 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2164 = _2130 + _2162;
        float _2166 = _2134 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2168 = _2164 * _2160;
        float _2170 = rsqrt(_2126);
        float _2172 = _2168 * 0.15915493667125701904296875;
        float _2174 = _2172 * 6.283185482025146484375;
        float _2176 = cos(_2174);
        float _2178 = _2172 * 6.283185482025146484375;
        float _2180 = sin(_2178);
        float _2182 = _2176 + (-1.0);
        float _2184 = _2182 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2186 = fma(_2180, _2166, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2188 = fma(_2134, _2176, _2184);
        float _2190 = _2170 * _2186;
        float _2192 = fma(_2122, _2190, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2194 = fma(_2118, _2190, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2158 = _2188;
        _2148 = _2192;
        _2152 = _2194;
        _2144 = _2186;
    }
    float _2196 = _2158;
    float _2198 = _2148;
    float _2200 = _2152;
    float _2202 = _2144;
    float _2204 = -_1324;
    float _2206 = _2204 + _2196;
    float _2208 = -_1334;
    float _2210 = _2208 + _2198;
    float _2212 = -_1372;
    float _2214 = _2212 + _2200;
    float _2216 = _2206 * _2206;
    float _2218 = fma(_2210, _2210, _2216);
    float _2220 = fma(_2214, _2214, _2218);
    float _2222 = sqrt(_2220);
    bool _2224 = _2222 > 0.0;
    bool _2226 = !_2224;
    float _2228 = _2196;
    float _2230 = _2198;
    float _2232 = _2200;
    float _2234 = _2214;
    float _2236 = _2202;
    float _2238 = _2220;
    if (!_2226)
    {
        float _2240 = _199 * _199;
        float _2242 = fma(_197, _197, _2240);
        float _2244 = fma(_201, _201, _2242);
        float _2246 = rsqrt(_2220);
        float _2248 = sqrt(_2244);
        float _2250 = _2210 * _2246;
        float _2252 = _2206 * _2246;
        float _2254 = _2214 * _2246;
        bool _2256 = _2248 > 0.0;
        bool _2258 = !_2256;
        _2236 = _2248;
        if (!_2258)
        {
            float _2260 = rsqrt(_2244);
            float _2262 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2264 = _199 * _2260;
            float _2266 = _197 * _2260;
            float _2268 = _201 * _2260;
            float _2270 = _2252 * _2264;
            float _2272 = fma(_2250, _2266, _2270);
            float _2274 = _2262 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2276 = fma(_2254, _2268, _2272);
            float _2278 = _2276 * _2274;
            float _2280 = fma(_197, _2278, _2198);
            float _2282 = fma(_199, _2278, _2196);
            float _2284 = fma(_201, _2278, _2200);
            _2228 = _2282;
            _2230 = _2280;
            _2232 = _2284;
            _2234 = _2270;
            _2236 = _2274;
            _2238 = _2272;
        }
    }
    float _2286 = _2228;
    float _2288 = _2230;
    float _2290 = _2232;
    float _2292 = _2234;
    float _2294 = _2236;
    float _2296 = _2238;
    float _2298 = -_1672;
    float _2300 = _2298 + _2286;
    float _2302 = -_1670;
    float _2304 = _2302 + _2288;
    float _2306 = -_1706;
    float _2308 = _2306 + _2290;
    float _2310 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2312 = _2300 + _2310;
    float _2314 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2316 = _2304 + _2314;
    float _2318 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2320 = _2308 + _2318;
    float _2322 = _2312 * _2312;
    float _2324 = fma(_2316, _2316, _2322);
    float _2326 = fma(_2320, _2320, _2324);
    float _2328 = rsqrt(_2326);
    float _2330 = sqrt(_2326);
    float _2332 = _2328 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2334 = _2316 * _2332;
    float _2336 = _2320 * _2332;
    float _2338 = _2334 * _2334;
    float _2340 = _2336 * _2336;
    float _2342 = _2338 + _2340;
    float _2344 = sqrt(_2342);
    bool _2346 = _2344 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2348 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2350 = _2344 + _2348;
    float _2352 = _2320;
    float _2354 = _2342;
    float _2356 = _2350;
    float _2358 = _2292;
    float _2360 = _2312;
    float _2362 = _2296;
    if (_2346)
    {
        float _2364 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2352 = _2364;
    }
    float _2366 = _2352;
    if (_2346)
    {
        float _2368 = rsqrt(_2342);
        _2354 = _2368;
    }
    float _2370 = _2354;
    float _2372 = _2370;
    if (_2346)
    {
        float _2374 = _2350 * _2366;
        _2356 = _2374;
    }
    float _2376 = _2356;
    if (_2346)
    {
        float _2378 = _2376 * 0.15915493667125701904296875;
        _2358 = _2378;
    }
    float _2380 = _2358;
    float _2382 = _2366;
    float _2384 = _2380;
    if (_2346)
    {
        float _2386 = _2380 * 6.283185482025146484375;
        float _2388 = sin(_2386);
        _2382 = _2388;
    }
    float _2390 = _2382;
    float _2392 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2394 = precise::max(0.0, _2392);
    float _2396 = _2294;
    float _2398 = _2394;
    if (_2346)
    {
        float _2400 = _2380 * 6.283185482025146484375;
        float _2402 = cos(_2400);
        _2396 = _2402;
    }
    float _2404 = _2396;
    float _2406 = -_2332;
    float _2408 = -_2394;
    float _2410 = fma(_2312, _2406, _2408);
    if (!_2346)
    {
        _2360 = _2336;
    }
    float _2412 = _2360;
    float _2414 = _2412;
    if (_2346)
    {
        float _2416 = _2410 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2398 = _2416;
    }
    float _2418 = _2398;
    float _2420 = _2390;
    float _2422 = _2418;
    if (_2346)
    {
        float _2424 = fma(_2390, _2418, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2362 = _2424;
    }
    float _2426 = _2362;
    float _2428 = _2426;
    if (!_2346)
    {
        _2420 = _2334;
    }
    float _2430 = _2420;
    float _2432 = fma(_1684, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2434 = _2430;
    float _2436 = _2404;
    if (_2346)
    {
        float _2438 = _2404 + (-1.0);
        _2422 = _2438;
    }
    float _2440 = _2422;
    if (_2346)
    {
        float _2442 = _2370 * _2426;
        _1674 = _2442;
    }
    float _2444 = _1674;
    if (!_2346)
    {
        _2428 = _2410;
    }
    float _2446 = _2428;
    float _2448 = floor(_2432);
    float _2450 = _2446;
    if (_2346)
    {
        float _2452 = _2440 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2384 = _2452;
    }
    float _2454 = _2384;
    if (_2346)
    {
        float _2456 = _2334 * _2444;
        _2434 = _2456;
    }
    float _2458 = _2434;
    if (!_2346)
    {
        _2372 = _2338;
    }
    float _2460 = _2372;
    float _2462 = _2460;
    if (_2346)
    {
        float _2464 = _2336 * _2444;
        _2414 = _2464;
    }
    float _2466 = _2414;
    if (_2346)
    {
        float _2468 = fma(_2410, _2404, _2454);
        _2450 = _2468;
    }
    float _2470 = _2450;
    if (_2346)
    {
        float _2472 = _2458 * _2458;
        _2462 = _2472;
    }
    float _2474 = _2462;
    if (!_2346)
    {
        _2436 = _2340;
    }
    float _2476 = _2436;
    float _2478 = _2476;
    if (_2346)
    {
        float _2480 = _2466 * _2466;
        _2478 = _2480;
    }
    float _2482 = _2478;
    float _2484 = _2300 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2486 = fma(_2470, _2470, _2474);
    float _2488 = _2300 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2490 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2484);
    float _2492 = _2486 + _2482;
    float _2494 = _2300 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2496 = _2300 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2498 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2490);
    float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2502 = fma(_2330, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2500);
    float _2504 = precise::clamp(_2502, 0.0, 1.0);
    float _2506 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2494);
    float _2508 = rsqrt(_2492);
    float _2510 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2488);
    float _2512 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2496);
    float _2514 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2506);
    float _2516 = _2498 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2518 = -_2504;
    float _2520 = _2518 + 1.0;
    float _2522 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2510);
    float _2524 = _2514 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2526 = _2516 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2528 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2512);
    float _2530 = _2522 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2532 = abs(_2520);
    float _2534 = log2(_2532);
    float _2536 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2526);
    float _2538 = _2528 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2540 = _2530 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2542 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2536);
    float _2544 = _2508 * _2458;
    float _2546 = fma(_1724, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2548 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2542);
    float _2550 = _2508 * _2470;
    float _2552 = _2544 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2554 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2556 = _2508 * _2466;
    float _2558 = floor(_2546);
    float _2560 = -_2552;
    float _2562 = fma(_2550, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2560);
    float _2564 = _2534 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2566 = -_2540;
    float _2568 = fma(_2566, _2554, 1.0);
    float _2570 = -_2448;
    float _2572 = _2432 + _2570;
    float _2574 = -_2556;
    float _2576 = fma(_2574, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2562);
    float _2578 = _2516 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2580 = _2516 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2582 = exp2(_2564);
    float _2584 = fma(_2576, -0.5, 0.5);
    float _2586 = fma(_2576, 0.5, 0.5);
    float _2588 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2578);
    float _2590 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2580);
    float _2592 = fma(_2586, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2594 = log2(_2568);
    float _2596 = -_2558;
    float _2598 = _2546 + _2596;
    float _2600 = _2550 + 1.0;
    float _2602 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2588);
    float _2604 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2590);
    float _2606 = fma(_2586, _2592, -0.212114393711090087890625);
    float _2608 = 1.0 / _2548;
    float _2610 = -_2550;
    float _2612 = fma(_2582, _2600, _2610);
    float _2614 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2602);
    float _2616 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2604);
    float _2618 = fma(_2586, _2606, 1.570728778839111328125);
    float _2620 = fma(_2612, 0.5, 0.5);
    float _2622 = sqrt(_2584);
    float _2624 = _2594 * 0.693147182464599609375;
    float _2626 = _2624 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2628 = _2614 * _2608;
    float _2630 = _2616 * _2608;
    float _2632 = fma(_2628, 0.5, 0.5);
    float _2634 = fma(_2630, -0.5, 0.5);
    float _2636 = _2622 * 0.636619746685028076171875;
    float2 _7333 = float2(_2572, _2598);
    float _2638 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7333, float2(0.0), isnan(_7333)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7333, float2(0.0), isnan(_7333)), level(0.0)).x;
    float3 _7344 = float3(_2632, _2634, _2626);
    float _2640 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7344, float3(0.0), isnan(_7344)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7344, float3(0.0), isnan(_7344)), level(0.0)).x;
    float _2642 = -_2618;
    float _2644 = fma(_2636, _2642, 1.0);
    float3 _7360 = float3(_2632, _2634, _2626);
    float4 _2647 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7360, float3(0.0), isnan(_7360)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7360, float3(0.0), isnan(_7360)), level(0.0)).xyzw;
    float _2649 = _2647.x;
    float _2651 = _2647.y;
    float _2653 = _2647.z;
    float _2655 = _2647.w;
    float2 _7376 = float2(_2644, _2620);
    float3 _2659 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7376, float2(0.0), isnan(_7376)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7376, float2(0.0), isnan(_7376)), level(0.0)).xyz;
    float _2661 = _2659.x;
    float _2663 = _2659.y;
    float _2665 = _2659.z;
    float _2667 = _1678 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2669 = _1678 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2671 = _2038 * _2102;
    float _2673 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2675 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2667);
    float _2677 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2669);
    float _2679 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2675);
    float _2681 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2677);
    bool _2683 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2685 = isnan(0.5);
    bool _2687 = _2683 || _2685;
    bool _2689 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2691 = _2687 || _2689;
    float _2693 = _2679 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2695 = _2681 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2697 = _2046 * _2102;
    float _2699 = _2046 * _2080;
    float _2701 = 1.0 / _2693;
    float _2703 = _2695 + _2693;
    float _2705 = _2703 * _2701;
    float _2707 = _2705 * 0.5;
    float _2709 = _2038 * _2088;
    float _2711 = _2038 * _2080;
    float _2713 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2715 = fma(_2707, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2713);
    float _2717 = fma(_2058, _2062, _2709);
    float _2719 = 1.0 / _2715;
    float _2721 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2723 = _2719 * _2721;
    float _2725 = _2026 * _2088;
    float _2727 = abs(_2723);
    float _2729 = log2(_2727);
    float _2731 = _2729 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2733 = exp2(_2731);
    float _2735 = fma(_2733, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2737 = precise::clamp(_2735, 0.0, 1.0);
    float _2739 = _2026 * _2102;
    float _2741 = -_2000;
    float _2743 = fma(_2741, _2066, _2697);
    float _2745 = _2026 * _2080;
    float _2747 = fma(_2737, -2.0, 3.0);
    float _2749 = _2737 * _2737;
    float _2751 = fma(_2048, _1952, _2743);
    float _2753 = fma(_2050, _2066, _2739);
    float _2755 = fma(_2050, _2064, _2745);
    float _2757 = _2749 * _2747;
    float _2759 = _2046 * _2088;
    float _2761 = -_2000;
    float _2763 = fma(_2761, _2064, _2699);
    float _2765 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2767 = fma(_2058, _2064, _2711);
    float _2769 = -_2000;
    float _2771 = fma(_2769, _2062, _2759);
    float _2773 = fma(_2050, _2062, _2725);
    float _2775 = -_2757;
    float _2777 = _2775 + 1.0;
    float _2779 = in.m_72.x;
    float _2781 = fma(_2048, _1946, _2771);
    float _2783 = fma(_2048, _1948, _2763);
    float _2785 = fma(_2777, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2757);
    float _2787 = _2516 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2789 = fma(_2058, _2066, _2671);
    float _2791 = _2534 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2793 = fma(_2034, _1952, _2753);
    float _2795 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2787);
    float _2797 = fma(_2034, _1946, _2773);
    float _2799 = _2673 * _2781;
    float _2801 = _2673 * _2751;
    float _2803 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2795);
    float _2805 = exp2(_2791);
    float _2807 = fma(_2034, _1948, _2755);
    float _2809 = _2673 * _2783;
    float _2811 = fma(_2028, _1952, _2789);
    float _2813 = fma(_2028, _1946, _2717);
    float _2815 = fma(_2028, _1948, _2767);
    float _2817 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2803);
    float _2819 = fma(_2765, _2797, _2799);
    float _2821 = fma(_2765, _2793, _2801);
    float _2823 = fma(_2765, _2807, _2809);
    bool _2825 = _2723 <= 8000.0;
    bool _2827 = isnan(_2723);
    bool _2829 = _2825 || _2827;
    bool _2831 = isnan(8000.0);
    bool _2833 = _2829 || _2831;
    float _2835 = float(_2833);
    float _2837 = _2548 * 0.5;
    float _2839 = _2817 + _2548;
    float _2841 = _2614 + _2548;
    float _2843 = _2803;
    float _2845 = _2837;
    if (_2691)
    {
        _2843 = 1.0;
    }
    float _2847 = _2843;
    float _2849 = fma(_2616, -0.5, _2837);
    float _2851 = _2835 * _2785;
    float _2853 = _2839 * 0.5;
    float _2855 = _2841 * 0.5;
    float _2857 = _2847;
    if (_2691)
    {
        _2845 = 1.0;
    }
    float _2859 = _2845;
    float _2861 = _2859;
    float _2863 = _2663;
    float _2865 = _2661;
    float _2867 = _2655;
    float _2869 = _2653;
    float _2871 = _2651;
    if (!_2691)
    {
        float _2873 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2875 = _2873 * 0.15915493667125701904296875;
        float _2877 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2879 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2881 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2879;
        float _2883 = _2875 * 6.283185482025146484375;
        float _2885 = cos(_2883);
        float _2887 = _2877 * 0.15915493667125701904296875;
        float _2889 = _2875 * 6.283185482025146484375;
        float _2891 = sin(_2889);
        float _2893 = 1.0 / _2885;
        float _2895 = _2887 * 6.283185482025146484375;
        float _2897 = cos(_2895);
        float _2899 = _2891 * _2893;
        float _2901 = _2887 * 6.283185482025146484375;
        float _2903 = sin(_2901);
        float _2905 = _2897 * _2899;
        float _2907 = 1.0 / _2881;
        float _2909 = 1.0 / _2905;
        float _2911 = _2903 * _2909;
        float _2913 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2915 = fma(_2723, _2911, _2913);
        float _2917 = _2915 * _2907;
        float _2919 = precise::clamp(_2917, 0.0, 1.0);
        _2861 = _2919;
    }
    float _2921 = _2861;
    if (!_2691)
    {
        float _2923 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2925 = _2923 * 0.15915493667125701904296875;
        float _2927 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2929 = _2925 * 6.283185482025146484375;
        float _2931 = cos(_2929);
        float _2933 = _2927 * 0.15915493667125701904296875;
        float _2935 = _2925 * 6.283185482025146484375;
        float _2937 = sin(_2935);
        float _2939 = 1.0 / _2931;
        float _2941 = _2933 * 6.283185482025146484375;
        float _2943 = cos(_2941);
        float _2945 = _2937 * _2939;
        float _2947 = _2933 * 6.283185482025146484375;
        float _2949 = sin(_2947);
        float _2951 = _2943 * _2945;
        float _2953 = 1.0 / _2951;
        float _2955 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2957 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2955;
        float _2959 = 1.0 / _2957;
        float _2961 = _2949 * _2953;
        float _2963 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2965 = fma(_2723, _2961, _2963);
        float _2967 = _2965 * _2959;
        float _2969 = precise::clamp(_2967, 0.0, 1.0);
        float _2971 = -_2969;
        float _2973 = _2971 + 1.0;
        _2857 = _2973;
    }
    float _2975 = _2857;
    float _2977 = -_2805;
    float _2979 = _2977 + 1.0;
    float _2981 = _2851 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2983 = -_2638;
    float _2985 = _2983 + 1.0;
    float _2987 = _2813 + _2819;
    float _2989 = _2979 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2991 = _2985 * _2981;
    float _2993 = precise::clamp(_2991, 0.0, 1.0);
    out.gl_Position.x = _2614;
    out.gl_Position.y = _2616;
    out.gl_Position.z = _2817;
    out.gl_Position.w = _2548;
    float _2995 = _2811 + _2821;
    float _2997 = _2989 * _2640;
    float _2999 = -_2993;
    float _3001 = fma(_2999, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_74.x = _2855;
    out.m_74.y = _2849;
    out.m_74.z = _2853;
    out.m_74.w = _2548;
    float _3003 = _2815 + _2823;
    bool _3005 = _2330 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3007 = isnan(_2330);
    bool _3009 = _3005 || _3007;
    bool _3011 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3013 = _3009 || _3011;
    float _3015 = _3001 * _2779;
    out.m_76.x = _2987;
    out.m_76.y = _2995;
    out.m_76.z = _3003;
    float _3017 = _3015 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3019 = _2655 * _2997;
    float _3021 = _2665 * _2997;
    out.m_78.x = _3017;
    float _3023 = -_2989;
    float _3025 = _3023 + 1.0;
    float _3027 = fma(_2661, _3019, _2649);
    float _3029 = fma(_2663, _3019, _2651);
    float _3031 = fma(_2655, _3021, _2653);
    float _3033 = _2655 * _3025;
    float _3035 = _2921 * _2975;
    float _3037 = _3035;
    if (!_3013)
    {
        _2863 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3039 = _2863;
    float _3041 = _3039;
    float _3043 = _3039;
    if (!_3013)
    {
        _2865 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3045 = _2865;
    out.m_80.x = _3027;
    out.m_80.y = _3029;
    out.m_80.z = _3031;
    out.m_80.w = _3033;
    float _3047 = _3035 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3049 = _3045;
    float _3051 = _3045;
    if (!_3013)
    {
        _2867 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3053 = _2867;
    float _3055 = _3053;
    float _3057 = _3053;
    if (!_3013)
    {
        _2869 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3059 = _2869;
    float _3061 = _3059;
    float _3063 = _3059;
    if (!_3013)
    {
        _2871 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3065 = _2871;
    float _3067 = _3065;
    float _3069 = _3065;
    if (!_3013)
    {
        _3037 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3071 = _3037;
    bool _3073 = !_3013;
    float _3075 = _3071;
    float _3077 = _3071;
    if (!_3073)
    {
        bool _3079 = _2330 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3081 = isnan(_2330);
        bool _3083 = _3079 || _3081;
        bool _3085 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3087 = _3083 || _3085;
        if (!_3087)
        {
            float _3089 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3091 = _2330 + _3089;
            float _3093 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3095 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3093;
            float _3097 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3099 = _3097 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3101 = 1.0 / _3095;
            float _3103 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3105 = _3103 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3107 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3109 = _3107 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3111 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3113 = _3111 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3115 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3117 = _3115 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3119 = _3091 * _3101;
            float _3121 = precise::clamp(_3119, 0.0, 1.0);
            float _3123 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3125 = _3123 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3127 = fma(_3121, _3099, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3129 = fma(_3121, _3125, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3131 = fma(_3121, _3105, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3133 = fma(_3121, _3109, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3135 = fma(_3121, _3113, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3137 = fma(_3121, _3117, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3051 = _3129;
            _3069 = _3135;
            _3043 = _3127;
            _3063 = _3133;
            _3057 = _3131;
            _3077 = _3137;
            _3139 = true;
        }
        else
        {
            bool _3141 = _2330 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3143 = isnan(_2330);
            bool _3145 = _3141 || _3143;
            bool _3147 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3149 = _3145 || _3147;
            if (!_3149)
            {
                _3041 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3151 = _3041;
            _3043 = _3151;
            if (!_3149)
            {
                _3049 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3153 = _3049;
            _3051 = _3153;
            if (!_3149)
            {
                _3055 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3155 = _3055;
            _3057 = _3155;
            if (!_3149)
            {
                _3061 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3157 = _3061;
            _3063 = _3157;
            if (!_3149)
            {
                _3067 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3159 = _3067;
            _3069 = _3159;
            if (!_3149)
            {
                _3075 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3161 = _3075;
            bool _3163 = !_3149;
            _3077 = _3161;
            if (!_3163)
            {
                bool _3165 = _2330 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3167 = isnan(_2330);
                bool _3169 = _3165 || _3167;
                bool _3171 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3173 = _3169 || _3171;
                if (!_3173)
                {
                    float _3175 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3177 = _2330 + _3175;
                    float _3179 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3181 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3179;
                    float _3183 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3185 = _3183 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3187 = 1.0 / _3181;
                    float _3189 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3191 = _3189 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3193 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3195 = _3193 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3197 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3199 = _3197 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3201 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3203 = _3201 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3205 = _3177 * _3187;
                    float _3207 = precise::clamp(_3205, 0.0, 1.0);
                    float _3209 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3211 = _3209 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3213 = fma(_3207, _3185, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3215 = fma(_3207, _3211, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3217 = fma(_3207, _3191, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3219 = fma(_3207, _3195, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3221 = fma(_3207, _3199, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3223 = fma(_3207, _3203, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3051 = _3215;
                    _3069 = _3221;
                    _3043 = _3213;
                    _3063 = _3219;
                    _3057 = _3217;
                    _3077 = _3223;
                    _3139 = true;
                }
                else
                {
                    _3051 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3069 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3043 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3063 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3057 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3077 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3139 = false;
    float _3225 = _3051;
    float _3227 = _3069;
    float _3229 = _3043;
    float _3231 = _3063;
    float _3233 = _3057;
    float _3235 = _3077;
    float _3237 = fma(_2995, -0.5, 0.5);
    float _3239 = precise::clamp(_3237, 0.0, 1.0);
    float _3241 = -_3225;
    float _3243 = _3241 + _3227;
    float _3245 = -_3229;
    float _3247 = _3245 + _3231;
    out.m_82.x = 0.0;
    float _3249 = -_3233;
    float _3251 = _3249 + _3235;
    float _3253 = fma(_3239, _3243, _3225);
    float _3255 = fma(_3239, _3247, _3229);
    bool _3257 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3259 = _3253 * 0.586610972881317138671875;
    float _3261 = fma(_3239, _3251, _3233);
    float _3263 = _3047 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3265 = fma(_3255, 0.298911988735198974609375, _3259);
    bool _3267 = _2921 > 0.0;
    bool _3269 = isnan(_2921);
    bool _3271 = _3267 || _3269;
    bool _3273 = isnan(0.0);
    bool _3275 = _3271 || _3273;
    float _3277 = fma(_3261, 0.114477999508380889892578125, _3265);
    out.m_49.x = _3263;
    bool _3279 = _2975 <= 0.0;
    bool _3281 = !_3275;
    bool _3283 = _3279 || _3281;
    float _3285 = -_3277;
    float _3287 = _3255 + _3285;
    float _3289 = -_3277;
    float _3291 = _3261 + _3289;
    float _3293 = fma(_3287, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3277);
    float _3295 = -_3277;
    float _3297 = _3253 + _3295;
    float _3299 = fma(_3297, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3277);
    float _3301 = fma(_3291, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3277);
    bool _3303 = !_3257;
    if (!_3303)
    {
        float _3305 = -_2300;
        float _3307 = _3305 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3309 = -_2304;
        float _3311 = _3309 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3313 = -_2308;
        float _3315 = _3313 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3317 = _3307 * _3307;
        float _3319 = fma(_3311, _3311, _3317);
        float _3321 = fma(_3315, _3315, _3319);
        float _3323 = sqrt(_3321);
        float _3325 = rsqrt(_3321);
        float _3327 = -_3323;
        float _3329 = _3327 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3331 = _3329 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3333 = precise::clamp(_3331, 0.0, 1.0);
        float _3335 = _3311 * _3325;
        float _3337 = _3307 * _3325;
        float _3339 = abs(_3333);
        float _3341 = log2(_3339);
        float _3343 = _3315 * _3325;
        float _3345 = _3335 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3347 = _2995 * _3337;
        float _3349 = -_3337;
        float _3351 = -_3345;
        float _3353 = fma(_3349, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3351);
        float _3355 = fma(_2987, _3335, _3347);
        float _3357 = -_3343;
        float _3359 = fma(_3357, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3353);
        float _3361 = fma(_3003, _3343, _3355);
        float _3363 = precise::clamp(_3361, 0.0, 1.0);
        float _3365 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3367 = _3359 + _3365;
        float _3369 = _3341 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3371 = _3367 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3373 = precise::clamp(_3371, 0.0, 1.0);
        float _3375 = exp2(_3369);
        float _3377 = _3375 * _3373;
        float _3379 = _3363 * _3377;
        float _3381 = _3379 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3383 = _3379 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3385 = _3379 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _3381;
        out.m_82.y = _3383;
        out.m_82.z = _3385;
    }
    out.m_84.x = _3293;
    out.m_84.y = _3299;
    out.m_84.z = _3301;
    if (!_3283)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3387 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3387;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3139 = false;
    bool _441 = false;
    bool _325 = false;
    bool _223 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    float _113 = _111;
    if (!_107)
    {
        out.m_49.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _111 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3444 = as_type<float>(_119);
        out.gl_Position.z = _3444;
    }
    if (!_107)
    {
        return out;
    }
    float _123 = in.m_51.w;
    bool _125 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_123);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    float _135 = -_123;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _139 = _137;
    if (_133)
    {
        float _141 = float(_103);
        _113 = _141;
    }
    float _143 = _113;
    bool _145 = _137 >= _143;
    bool _147 = !_133;
    bool _149 = _145 || _147;
    float _151 = _143;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _151;
    if (_149)
    {
        out.m_49.x = 0.0;
    }
    if (_149)
    {
        float _155 = _153 * 5.0;
        _121 = as_type<int>(_155);
    }
    int _157 = _121;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3514 = as_type<float>(_157);
        out.gl_Position.z = _3514;
    }
    if (_149)
    {
        return out;
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = in.m_56.x;
    float _163 = in.m_56.y;
    float _165 = in.m_56.z;
    int _167 = as_type<int>(_159) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_159) & 2;
    bool _173 = _171 != 0;
    bool _175 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _177 = _163 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _179 = _163 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _181 = _163 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _183 = !_169;
    float _185 = _183 ? (-0.5) : 0.5;
    float _187 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].x, _177);
    float _189 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].x, _179);
    float _191 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].x, _181);
    bool _193 = !_173;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].z, _187);
    float _199 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].z, _189);
    float _201 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].z, _191);
    bool _203 = !_175;
    float _221;
    if (!_203)
    {
        float _205 = in.m_58.x;
        float _207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _209 = _205 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _213 = _211 * _207;
        float _215 = floor(_213);
        float _217 = -_215;
        float _219 = _213 + _217;
        _221 = _219;
        _223 = true;
    }
    else
    {
        float _225 = float(_103);
        float _227 = 1.0 / _225;
        float _229 = _137 * _227;
        _221 = _229;
    }
    _223 = false;
    float _231 = _221;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = _231 + _233;
    bool _237 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _239 = isnan(_231);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _249;
    float _253 = -_247;
    float _255 = _253 + 1.0;
    bool _257 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _259 = isnan(_231);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _265 = _261 || _263;
    float _267 = float(_265);
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _269;
    bool _273 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _275 = 1.0 / _251;
    float _277 = _267 * _255;
    float _279 = -_267;
    float _281 = _279 + 1.0;
    float _283 = _235 * _275;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _285;
    float _289 = fma(_271, _283, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _291 = fma(_287, _283, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _293 = _289 * _277;
    float _295 = _291 * _277;
    float _297 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[143].x, _293);
    float _299 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[143].y, _295);
    float _301 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[144].x, _297);
    float _303 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[144].y, _299);
    bool _305 = !_273;
    float _323;
    if (!_305)
    {
        float _307 = in.m_58.x;
        float _309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _311 = _307 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[11].y, _137);
        float _315 = _313 * _309;
        float _317 = floor(_315);
        float _319 = -_317;
        float _321 = _315 + _319;
        _323 = _321;
        _325 = true;
    }
    else
    {
        float _327 = float(_103);
        float _329 = 1.0 / _327;
        float _331 = _137 * _329;
        _323 = _331;
    }
    _325 = false;
    float _333 = _323;
    float _335 = in.m_60.x;
    float _337 = in.m_60.y;
    bool _339 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _341 = isnan(_333);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _355 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _357 = isnan(_333);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _373 = _333 + _371;
    float _375 = -_349;
    float _377 = _375 + 1.0;
    bool _379 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _381 = 1.0 / _353;
    float _383 = _365 * _377;
    float _385 = -_365;
    float _387 = _385 + 1.0;
    float _389 = _303 * _337;
    float _391 = _301 * _335;
    float _393 = _369 * _381;
    float _395 = fma(_393, _373, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _397 = _395 * _383;
    float _399 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[115].x, _397);
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _407 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[116].x, _399);
    float _409 = _401 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = _403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _413 = _405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _415 = _407 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_62.x = _409;
    out.m_62.y = _411;
    out.m_62.z = _413;
    out.m_62.w = _415;
    bool _417 = !_379;
    float _437;
    float _439;
    if (!_417)
    {
        float _419 = in.m_58.x;
        float _421 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _423 = float(_103);
        float _425 = _419 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _427 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[11].w, _137);
        float _429 = _427 * _421;
        float _431 = floor(_429);
        float _433 = -_431;
        float _435 = _429 + _433;
        _437 = _423;
        _439 = _435;
        _441 = true;
    }
    else
    {
        float _443 = float(_103);
        float _445 = 1.0 / _443;
        float _447 = _137 * _445;
        _437 = _443;
        _439 = _447;
    }
    _441 = false;
    float _449 = _437;
    float _451 = _439;
    float _453 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _455 = int(_453);
    float _457 = _391 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _461 = _459 != 0;
    float _463 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _465 = int(_463);
    float _467 = float(_455);
    float _469 = 1.0 / _449;
    float _471 = float(uint(_465));
    float _473 = 1.0 / _467;
    float _475 = float(_465);
    int _477 = ~_465;
    int _479 = _477 + 1;
    bool _481 = _465 == 0;
    float _483 = 1.0 / _471;
    float _485 = _473 * _137;
    float _487 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _489 = as_type<int>(_483) + (-2);
    float _491 = trunc(_485);
    int _493 = int(_491);
    float _495 = float(uint(_493));
    float _497 = as_type<float>(_489) * _495;
    int _499 = ~_465;
    int _501 = _499 + 1;
    float _503 = trunc(_497);
    float _505 = precise::max(_503, 0.0);
    uint _508 = uint(_505);
    bool _510 = !_461;
    float _512 = _510 ? 5.839270114898681640625 : 1.0;
    int _514 = _501 * int(_508);
    int _516 = _514 + _493;
    float _518 = float(uint(_516));
    float _520 = as_type<float>(_489) * _518;
    float _522 = in.m_58.x;
    float _524 = in.m_58.y;
    float _526 = in.m_58.z;
    float _528 = in.m_58.w;
    float _530 = trunc(_520);
    float _532 = precise::max(_530, 0.0);
    uint _534 = uint(_532);
    int _536 = int(_508) + int(_534);
    float _538 = float(_493);
    bool _540 = _524 > 0.5;
    int _542 = _479 * _536;
    int _544 = _542 + _493;
    bool _546 = _538 >= _475;
    bool _548 = isnan(_538);
    bool _550 = _546 || _548;
    bool _552 = isnan(_475);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    bool _558 = !_461;
    float _560 = _558 ? _526 : _522;
    bool _562 = uint(_544) >= uint(_465);
    float _564 = trunc(_556);
    int _566 = int(_564);
    float _568 = -_185;
    int _570 = _540 ? as_type<int>(_568) : as_type<int>(_185);
    float _572 = _512 * _560;
    bool _574 = !_562;
    int _576 = _574 ? 0 : (-1);
    bool _578 = _526 > 0.5;
    int _580 = ~_536;
    int _582 = _580 + _576;
    int _584 = _582 + 1;
    float _586 = floor(_572);
    float _588 = -_195;
    int _590 = _578 ? as_type<int>(_588) : as_type<int>(_195);
    int _592 = _465 * _584;
    int _594 = _592 + _493;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _598 = _596 != 0;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _602 = _600 != 0;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _606 = _604 != 0;
    int _608 = ~_566;
    int _610 = _608 + 1;
    int _612 = _610 + 1;
    bool _614 = !_481;
    int _616 = _614 ? _594 : (-1);
    bool _618 = !_598;
    float _620 = _618 ? _185 : as_type<float>(_570);
    bool _622 = !_602;
    float _624 = _622 ? _195 : as_type<float>(_590);
    float _626 = -_586;
    float _628 = _572 + _626;
    int _630 = _616 * _612;
    int _632 = _465 + (-1);
    float _634 = _628 * _475;
    float _636 = _475 * _137;
    bool _638 = !_606;
    int _640 = _638 ? 0 : 1;
    float _642 = trunc(_634);
    int _644 = int(_642);
    float _646 = _636 * _469;
    int _648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _650 = _648 != 0;
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _654 = _652 != 0;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _658 = _656 != 0;
    int _660 = _566 * _632;
    int _662 = _660 + _630;
    int _664 = abs(_640);
    bool _666 = !_654;
    int _668 = _666 ? 0 : 1;
    float _670 = trunc(_646);
    int _672 = int(_670);
    bool _674 = !_650;
    int _676 = _674 ? 0 : 1;
    int _678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _680 = _678 != 0;
    int _682 = abs(_668);
    bool _684 = !_658;
    int _686 = _684 ? 0 : 1;
    int _688 = _644 * _664;
    int _690 = _688 + _493;
    int _692 = abs(_676);
    bool _694 = !_680;
    int _696 = _694 ? 0 : 1;
    int _698 = abs(_686);
    int _700 = _662 * _682;
    int _702 = abs(_696);
    int _704 = _672 * _692;
    int _706 = _704 + _700;
    int _708 = ~_465;
    int _710 = _708 + 1;
    int _712 = ~_465;
    int _714 = _712 + 1;
    int _716 = _690 * _698;
    int _718 = _716 + _706;
    int _720 = ~_465;
    int _722 = _720 + 1;
    int _724 = _644 * _702;
    int _726 = _724 + _718;
    float _728 = float(uint(_726));
    float _730 = as_type<float>(_489) * _728;
    float _732 = trunc(_730);
    float _734 = precise::max(_732, 0.0);
    uint _736 = uint(_734);
    int _738 = _722 * int(_736);
    int _740 = _738 + _726;
    float _742 = float(uint(_740));
    float _744 = as_type<float>(_489) * _742;
    float _746 = trunc(_744);
    float _748 = precise::max(_746, 0.0);
    uint _750 = uint(_748);
    int _752 = int(_736) + int(_750);
    int _754 = _710 * _752;
    int _756 = _754 + _726;
    bool _758 = uint(_756) >= uint(_465);
    bool _760 = !_758;
    int _762 = _760 ? 0 : (-1);
    int _764 = ~_752;
    int _766 = _764 + _762;
    int _768 = _766 + 1;
    float _770 = float(uint(_690));
    int _772 = _465 * _768;
    int _774 = _772 + _726;
    float _776 = as_type<float>(_489) * _770;
    int _778 = ~_465;
    int _780 = _778 + 1;
    bool _782 = !_481;
    int _784 = _782 ? _774 : (-1);
    float _786 = trunc(_776);
    float _788 = precise::max(_786, 0.0);
    uint _790 = uint(_788);
    int _792 = _784 >> 31;
    int _794 = _784 & 3;
    bool _796 = _794 != 0;
    int _798 = _792 & 3;
    int _800 = _784 + _798;
    int _802 = _800 >> 2;
    int _804 = _780 * int(_790);
    int _806 = _804 + _690;
    int _808 = _802 << 4;
    int _810 = _808 + 656;
    float _812 = float(uint(_806));
    uint _814 = uint(int(uint(_810) >> uint(2)));
    uint _816 = uint(int(uint(int(_814)) >> uint(2)));
    int _818 = int(_814) & 3;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[int(_816)][_818];
    int _822 = int(_814) + 1;
    uint _824 = uint(int(uint(_822) >> uint(2)));
    int _826 = _822 & 3;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[int(_824)][_826];
    float _830 = as_type<float>(_489) * _812;
    int _832 = _784 & 3;
    bool _834 = _832 != 0;
    int _836 = _796 ? 0 : 1;
    int _838 = _810 + 8;
    uint _840 = uint(int(uint(_838) >> uint(2)));
    uint _842 = uint(int(uint(int(_840)) >> uint(2)));
    int _844 = int(_840) & 3;
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[int(_842)][_844];
    int _848 = int(_840) + 1;
    uint _850 = uint(int(uint(_848) >> uint(2)));
    int _852 = _848 & 3;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[int(_850)][_852];
    float _856 = trunc(_830);
    float _858 = precise::max(_856, 0.0);
    uint _860 = uint(_858);
    bool _862 = uint(_832) > 1u;
    int _864 = ~_836;
    int _866 = _864 + 1;
    int _868 = _866 + 1;
    bool _870 = uint(_832) >= 2u;
    int _872 = _868;
    if (!_862)
    {
        int _874 = ~_836;
        int _876 = _874 + 1;
        _872 = _876;
    }
    int _878 = _872;
    int _880 = int(_790) + int(_860);
    bool _882 = _832 != 3;
    int _884 = _870 ? 0 : 1;
    int _886 = _714 * _880;
    int _888 = _886 + _690;
    int _890 = abs(_878);
    bool _892 = !_834;
    int _894 = _892 ? 0 : 1;
    float _896 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _898 = int(_896);
    bool _900 = uint(_888) >= uint(_465);
    int _902 = ~_890;
    int _904 = _902 + 1;
    int _906 = _904 + 1;
    bool _908 = !_900;
    int _910 = _908 ? 0 : (-1);
    int _912 = ~_884;
    int _914 = _912 + 1;
    int _916 = _914 + 1;
    bool _918 = _832 != 3;
    int _920 = _916;
    if (_882)
    {
        int _922 = ~_884;
        int _924 = _922 + 1;
        _920 = _924;
    }
    int _926 = _920;
    int _928 = abs(_894);
    int _930 = _906 * as_type<int>(_828);
    int _932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _934 = _932 != 0;
    bool _936 = !_918;
    int _938 = _936 ? 0 : (-1);
    int _940 = abs(_926);
    bool _942 = !_934;
    int _944 = _942 ? 0 : 1;
    int _946 = abs(_938);
    int _948 = ~_928;
    int _950 = _948 + 1;
    int _952 = _950 + 1;
    int _954 = abs(_944);
    int _956 = _952 * as_type<int>(_820);
    int _958 = _956 + _930;
    int _960 = ~_940;
    int _962 = _960 + 1;
    int _964 = _962 + 1;
    int _966 = ~_880;
    int _968 = _966 + _910;
    int _970 = _968 + 1;
    float _972 = _522 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _974 = _964 * as_type<int>(_846);
    int _976 = _974 + _958;
    int _978 = ~_946;
    int _980 = _978 + 1;
    int _982 = _980 + 1;
    int _984 = _465 * _970;
    int _986 = _984 + _690;
    float _988 = float(uint(_898));
    float _990 = _524 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _992 = ~_954;
    int _994 = _992 + 1;
    int _996 = _994 + 1;
    int _998 = _982 * as_type<int>(_854);
    int _1000 = _998 + _976;
    bool _1002 = !_481;
    int _1004 = _1002 ? _986 : (-1);
    float _1006 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1008 = abs(_898);
    int _1010 = _1000 * _996;
    int _1012 = ~_898;
    int _1014 = _1012 + 1;
    int _1016 = _1004 * _954;
    int _1018 = _1016 + _1010;
    float _1020 = float(uint(_1008));
    float _1022 = 1.0 / _988;
    bool _1024 = _528 > 0.5;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1030 = float(uint(_1018));
    float _1032 = 1.0 / _1020;
    int _1034 = ~_1008;
    int _1036 = _1034 + 1;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1042 = _1040 != 0;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1048 = _1046 != 0;
    float _1050 = fma(_990, -2.0, _1038);
    float _1052 = _526 * 2.0;
    int _1054 = as_type<int>(_1022) + (-2);
    float _1056 = 1.0 / _1028;
    int _1058 = abs(_1018);
    float _1060 = -_1044;
    float _1062 = fma(_972, 2.0, _1060);
    float _1064 = -_195;
    int _1066 = _1024 ? as_type<int>(_1064) : as_type<int>(_195);
    float _1068 = as_type<float>(_1054) * _1030;
    float _1070 = float(uint(_1058));
    float _1072 = in.m_46.x;
    float _1074 = in.m_46.y;
    float _1076 = in.m_46.z;
    int _1078 = as_type<int>(_1032) + (-2);
    float _1080 = _522 * 2.0;
    int _1082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1084 = _1082 != 0;
    float _1086 = trunc(_1068);
    float _1088 = precise::max(_1086, 0.0);
    uint _1090 = uint(_1088);
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1094 = _1092 != 0;
    float _1096 = as_type<float>(_1078) * _1070;
    float _1098 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1050);
    bool _1100 = !_1084;
    float _1102 = _1100 ? _195 : as_type<float>(_1066);
    bool _1104 = _898 == 0;
    float _1106 = trunc(_1096);
    float _1108 = precise::max(_1106, 0.0);
    uint _1110 = uint(_1108);
    int _1112 = _1014 * int(_1090);
    int _1114 = _1112 + _1018;
    float _1116 = floor(_1080);
    float _1118 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1120 = float(uint(_1114));
    float _1122 = _524 + _522;
    int _1124 = _1036 * int(_1110);
    int _1126 = _1124 + _1058;
    float _1128 = floor(_1052);
    float _1130 = as_type<float>(_1054) * _1120;
    float _1132 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1134 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1136 = float(uint(_1126));
    float _1138 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1118);
    float _1140 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1132);
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1142;
    float _1146 = trunc(_1130);
    float _1148 = precise::max(_1146, 0.0);
    uint _1150 = uint(_1148);
    float _1152 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1134);
    float _1154 = as_type<float>(_1078) * _1136;
    float _1156 = _524 + _526;
    float _1158 = -_195;
    int _1160 = _540 ? as_type<int>(_1158) : as_type<int>(_195);
    float _1162 = _1122 + (-1.0);
    bool _1164 = _522 > 0.5;
    float _1166 = _1144 * _1056;
    float _1168 = _1156 + (-1.0);
    float _1170 = trunc(_1154);
    float _1172 = precise::max(_1170, 0.0);
    uint _1174 = uint(_1172);
    float _1176 = -_185;
    int _1178 = _1164 ? as_type<int>(_1176) : as_type<int>(_185);
    float _1180 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1184 = _451 + _1182;
    bool _1186 = !_1094;
    float _1188 = _1186 ? _185 : as_type<float>(_1178);
    float _1190 = -_185;
    int _1192 = _578 ? as_type<int>(_1190) : as_type<int>(_185);
    float _1194 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1196 = !_1042;
    float _1198 = _1196 ? _195 : as_type<float>(_1160);
    float _1200 = -_137;
    float _1202 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1062);
    bool _1204 = _1116 > 0.0;
    float _1206 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1152);
    bool _1208 = _1116 >= 0.0;
    bool _1210 = isnan(_1116);
    bool _1212 = _1208 || _1210;
    bool _1214 = isnan(0.0);
    bool _1216 = _1212 || _1214;
    float _1218 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1220 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1138);
    float _1222 = _1188 + 0.5;
    int _1224 = int(_1090) + int(_1150);
    float _1226 = fma(_1166, _1184, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1228 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1230 = isnan(_451);
    bool _1232 = _1228 || _1230;
    bool _1234 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1236 = _1232 || _1234;
    float _1238 = float(_1236);
    float _1240 = _487 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1242 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1140);
    float _1244 = fma(_1218, _1222, _1202);
    bool _1246 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1248 = isnan(_451);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    float _1258 = -_1238;
    float _1260 = _1258 + 1.0;
    int _1262 = ~_898;
    int _1264 = _1262 + 1;
    float _1266 = _1198 + (-0.5);
    int _1268 = int(_1110) + int(_1174);
    float _1270 = _1256 * _1260;
    int _1272 = ~_1008;
    int _1274 = _1272 + 1;
    int _1276 = _1264 * _1224;
    int _1278 = _1276 + _1018;
    float _1280 = -_1240;
    float _1282 = -_1098;
    float _1284 = fma(_1280, _1266, _1282);
    float _1286 = _1226 * _1270;
    int _1288 = _1274 * _1268;
    int _1290 = _1288 + _1058;
    bool _1292 = !_1048;
    float _1294 = _1292 ? _185 : as_type<float>(_1192);
    float _1296 = -_1256;
    float _1298 = _1296 + 1.0;
    bool _1300 = uint(_1278) >= uint(_898);
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1304 = as_type<float>(_1058);
    float _1306 = _1098;
    float _1308 = as_type<float>(_898);
    float _1310 = as_type<float>(_1018);
    float _1312 = as_type<float>(_1268);
    if (_461)
    {
        _1304 = _522;
    }
    float _1314 = _1304;
    float _1316 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1286);
    float _1318 = _1294 + 0.5;
    float _1320 = _1314;
    if (!_461)
    {
        _1306 = _524;
    }
    float _1322 = _1306;
    float _1324 = _1242 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1326 = _1322;
    if (!_461)
    {
        _1320 = _526;
    }
    float _1328 = _1320;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_461)
    {
        _1326 = _522;
    }
    float _1332 = _1326;
    float _1334 = _1220 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1336 = !_1300;
    int _1338 = _1336 ? 0 : (-1);
    float _1340 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1342 = uint(_1290) >= uint(_1008);
    float _1344 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1302);
    float _1346 = _1332 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1348 = ~_1224;
    int _1350 = _1348 + _1338;
    int _1352 = _1350 + 1;
    float _1354 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1356 = _1018 ^ _898;
    float _1358 = -_1330;
    float _1360 = fma(_1346, 2.0, _1358);
    bool _1362 = !_1342;
    int _1364 = _1362 ? 0 : (-1);
    int _1366 = _898 * _1352;
    int _1368 = _1366 + _1018;
    uint _1370 = uint(int(uint(_1356) >> uint(31)));
    float _1372 = _1206 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1374 = ~_1364;
    int _1376 = _1268 + _1374;
    int _1378 = _1376 + 1;
    float _1380 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1382 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1344);
    bool _1384 = _898 == 0;
    int _1386 = ~int(_1370);
    int _1388 = _1386 + 1;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_461)
    {
        _1308 = _526;
    }
    float _1392 = _1308;
    float _1394 = -_1382;
    float _1396 = _1394 + 1.0;
    float _1398 = _1392;
    if (_461)
    {
        _1398 = _524;
    }
    float _1400 = _1398;
    int _1402 = _1378 ^ _1388;
    float _1404 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1390);
    int _1406 = ~_1388;
    int _1408 = _1406 + _1402;
    int _1410 = _1408 + 1;
    bool _1412 = _1128 >= 0.0;
    bool _1414 = isnan(_1128);
    bool _1416 = _1412 || _1414;
    bool _1418 = isnan(0.0);
    bool _1420 = _1416 || _1418;
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (!_461)
    {
        _1310 = _526;
    }
    float _1424 = _1310;
    float _1426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1428 = -_1422;
    float _1430 = fma(_1340, 2.0, _1428);
    float _1432 = _1424;
    if (_461)
    {
        _1432 = _524;
    }
    float _1434 = _1432;
    float _1436 = -_137;
    float _1438 = fma(_1436, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1360);
    bool _1440 = !_1104;
    int _1442 = _1440 ? _1368 : (-1);
    float _1444 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1446 = _1334 + _1444;
    bool _1448 = !_1384;
    int _1450 = _1448 ? _1410 : (-1);
    float _1452 = -_137;
    float _1454 = fma(_1452, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1430);
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1458 = _1456 != 0;
    int _1460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1462 = _1460 != 0;
    int _1464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1466 = _1464 != 0;
    float _1468 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1470 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1472 = _1434 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1474 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1316);
    float _1476 = fma(_1468, _1318, _1438);
    if (_461)
    {
        _1312 = _524;
    }
    float _1478 = _1312;
    float _1480 = fma(_1472, -2.0, _1470);
    float _1482 = _1478;
    if (!_461)
    {
        _1482 = _522;
    }
    float _1484 = _1482;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1488 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1490 = _1324 + _1488;
    float _1492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1494 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1496 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1498 = _1490 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1500 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1480);
    float _1502 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1504 = _1372 + _1502;
    float _1506 = _1102 + (-0.5);
    float _1508 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1498);
    float _1510 = fma(_1496, -2.0, _1486);
    float _1512 = float(_1442);
    float _1514 = -_1494;
    float _1516 = -_1500;
    float _1518 = fma(_1514, _1506, _1516);
    float _1520 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1508);
    float _1522 = _1426 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1524 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1510);
    float _1526 = float(_1450);
    float _1528 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1530 = _1520 >= 0.0;
    float _1532 = fma(_1522, _1512, _1454);
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1536 = _620 + 0.5;
    float _1538 = -_1524;
    float _1540 = fma(_1528, _1526, _1538);
    float _1542 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1534);
    float _1544 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1546 = fma(_1522, _1536, _1532);
    float _1548 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1404);
    float _1550 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1542);
    float _1552 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1544);
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1556 = -_1548;
    float _1558 = _1556 + 1.0;
    float _1560 = _624 + (-0.5);
    float _1562 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1552);
    float _1564 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1554);
    float _1566 = -_1550;
    float _1568 = _1566 + 1.0;
    float _1570 = -_1562;
    float _1572 = _1570 + 1.0;
    float _1574 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1564);
    float _1576 = -_1528;
    float _1578 = fma(_1576, _1560, _1540);
    float _1580 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1582 = fma(_1198, _1572, _1284);
    float _1584 = -_1574;
    float _1586 = _1584 + 1.0;
    float _1588 = -_1396;
    float _1590 = fma(_1294, _1588, _1476);
    float _1592 = _1490 * _1490;
    float _1594 = fma(_1102, _1558, _1518);
    float _1596 = -_1586;
    float _1598 = fma(_1188, _1596, _1244);
    float _1600 = fma(_1446, _1446, _1592);
    float _1602 = _524 * 2.0;
    float _1604 = fma(_1504, _1504, _1600);
    float _1606 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1610 = floor(_1602);
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1614 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1606);
    float _1616 = _1606;
    if (_1530)
    {
        _1616 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1618 = _1616;
    float _1620 = -_1568;
    float _1622 = fma(_620, _1620, _1546);
    float _1624 = _1580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1626 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1614);
    float _1628 = _1612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1630 = rsqrt(_1604);
    float _1632 = _1608 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1634 = -_1626;
    float _1636 = _1634 + 1.0;
    float _1638 = _1474 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1640 = as_type<int>(_1618);
    if (_1530)
    {
        float _1642 = _1618 * 5.0;
        _1640 = as_type<int>(_1642);
    }
    int _1644 = _1640;
    float _1646 = fma(_624, _1636, _1578);
    float _1648 = _457 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1650 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1652 = log2(_1650);
    out.m_64.x = _1624;
    out.m_64.y = _1628;
    out.m_64.z = _1632;
    out.m_64.w = _1638;
    bool _1654 = !_1462;
    int _1656 = _1654 ? 0 : 1;
    bool _1658 = !_1466;
    int _1660 = _1658 ? 0 : 1;
    out.m_66.x = _1598;
    out.m_66.y = _1582;
    out.m_66.z = _1590;
    out.m_66.w = _1594;
    bool _1662 = _1610 > 0.0;
    float _1664 = _1648 * _1630;
    if (_1530)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5830 = as_type<float>(_1644);
        out.gl_Position.z = _5830;
    }
    bool _1666 = !_1458;
    int _1668 = _1666 ? 0 : 1;
    float _1670 = _1446 * _1664;
    out.m_68.x = _1622;
    out.m_68.y = _1646;
    float _1672 = _1490 * _1664;
    float _1674 = _1672;
    if (_1530)
    {
        out.m_49.x = 0.0;
    }
    if (_1530)
    {
        return out;
    }
    float _1676 = -_1672;
    float _1678 = _1324 + _1676;
    bool _1680 = _1128 > 0.0;
    float _1682 = -_1670;
    float _1684 = _1334 + _1682;
    int _1686 = _1420 ? 0 : 1;
    float _1688 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1690 = _1678 + _1688;
    float _1692 = _1652 * _137;
    float _1694 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1696 = _1684 + _1694;
    int _1698 = ~_1686;
    int _1700 = _1698 + 1;
    int _1702 = _1700 + 1;
    float _1704 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1706 = _1504 * _1664;
    float _1708 = exp2(_1692);
    float _1710 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1704);
    bool _1712 = _1610 >= 0.0;
    bool _1714 = isnan(_1610);
    bool _1716 = _1712 || _1714;
    bool _1718 = isnan(0.0);
    bool _1720 = _1716 || _1718;
    float _1722 = -_1706;
    float _1724 = _1372 + _1722;
    int _1726 = _1702;
    if (!_1680)
    {
        int _1728 = ~_1686;
        int _1730 = _1728 + 1;
        _1726 = _1730;
    }
    int _1732 = _1726;
    float _1734 = -_1672;
    float _1736 = _1490 + _1734;
    float _1738 = in.m_70.x;
    float _1740 = in.m_70.y;
    float _1742 = in.m_70.z;
    int _1744 = abs(_1668);
    float _1746 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1748 = _1724 + _1746;
    bool _1750 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1752 = isnan(1.0);
    bool _1754 = _1750 || _1752;
    bool _1756 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1758 = _1754 || _1756;
    float _1760 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1762 = 1.0 + _1760;
    float _1764 = float(_1732);
    float _1766 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1710);
    float _1768 = float(_1744);
    float _1770 = 1.0 / _1762;
    int _1772 = _1216 ? 0 : 1;
    float _1774 = -_1708;
    float _1776 = _1774 + 1.0;
    bool _1778 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1780 = isnan(0.0);
    bool _1782 = _1778 || _1780;
    bool _1784 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1786 = _1782 || _1784;
    float _1788 = _1768 * _1764;
    float _1790 = -_1670;
    float _1792 = _1446 + _1790;
    float _1794 = -_1706;
    float _1796 = _1504 + _1794;
    float _1798 = _1786 ? _1776 : 0.0;
    float _1800 = _1788 * (-2.0);
    float _1802 = _1736 * _1736;
    bool _1804 = _1766 >= 0.0;
    float _1806 = fma(_1180, _1800, _1180);
    float _1808 = fma(_1792, _1792, _1802);
    int _1810 = ~_1772;
    int _1812 = _1810 + 1;
    int _1814 = _1812 + 1;
    float _1816 = fma(_1800, _1738, _1738);
    float _1818 = _522 + (-0.5);
    int _1820 = _1814;
    float _1822 = _1764;
    if (_1758)
    {
        float _1824 = _1798 * _1770;
        _139 = _1824;
    }
    float _1826 = _139;
    float _1828 = fma(_1796, _1796, _1808);
    if (!_1204)
    {
        int _1830 = ~_1772;
        int _1832 = _1830 + 1;
        _1820 = _1832;
    }
    int _1834 = _1820;
    float _1836 = fma(_1818, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1816);
    int _1838 = abs(_1656);
    if (_1804)
    {
        _1822 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1840 = _1822;
    float _1842 = fma(_1806, _1826, _1836);
    int _1844 = _1720 ? 0 : 1;
    float _1846 = sqrt(_1828);
    float _1848 = float(_1834);
    float _1850 = _1842 * 0.15915493667125701904296875;
    int _1852 = as_type<int>(_1840);
    if (_1804)
    {
        float _1854 = _1840 * 5.0;
        _1852 = as_type<int>(_1854);
    }
    int _1856 = _1852;
    float _1858 = float(_1838);
    if (_1804)
    {
        out.m_49.x = 0.0;
    }
    int _1860 = ~_1844;
    int _1862 = _1860 + 1;
    int _1864 = _1862 + 1;
    float _1866 = _1850 * 6.283185482025146484375;
    float _1868 = sin(_1866);
    int _1870 = _1864;
    if (!_1662)
    {
        int _1872 = ~_1844;
        int _1874 = _1872 + 1;
        _1870 = _1874;
    }
    int _1876 = _1870;
    if (_1804)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6135 = as_type<float>(_1856);
        out.gl_Position.z = _6135;
    }
    int _1878 = abs(_1660);
    float _1880 = _1858 * _1848;
    float _1882 = _524 + (-0.5);
    float _1884 = float(_1876);
    if (_1804)
    {
        return out;
    }
    float _1886 = -_1324;
    float _1888 = _1886 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1890 = _1880 * (-2.0);
    float _1892 = -_1334;
    float _1894 = _1892 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1896 = -_1372;
    float _1898 = _1896 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1900 = _1888 * _1888;
    float _1902 = fma(_1890, _1740, _1740);
    float _1904 = fma(_1194, _1890, _1194);
    float _1906 = float(_1878);
    float _1908 = fma(_1894, _1894, _1900);
    float _1910 = fma(_1882, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1902);
    float _1912 = _526 + _522;
    float _1914 = fma(_1898, _1898, _1908);
    float _1916 = fma(_1904, _1826, _1910);
    float _1918 = _1906 * _1884;
    float _1920 = _1912 + (-1.0);
    float _1922 = rsqrt(_1914);
    float _1924 = _526 + (-0.5);
    float _1926 = _1918 * (-2.0);
    float _1928 = fma(_1920, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1930 = _1916 * 0.15915493667125701904296875;
    float _1932 = _389 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1934 = fma(_1926, _1742, _1742);
    float _1936 = fma(_1928, _1926, _1928);
    float _1938 = _1850 * 6.283185482025146484375;
    float _1940 = cos(_1938);
    float _1942 = fma(_1924, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1934);
    float _1944 = fma(_1936, _1826, _1942);
    float _1946 = _1894 * _1922;
    float _1948 = _1898 * _1922;
    float _1950 = _1944 * 0.15915493667125701904296875;
    float _1952 = _1888 * _1922;
    float _1954 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1956 = _1946 * _1954;
    float _1958 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1960 = _1948 * _1958;
    float _1962 = _1930 * 6.283185482025146484375;
    float _1964 = sin(_1962);
    float _1966 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1968 = -_1956;
    float _1970 = fma(_1948, _1966, _1968);
    float _1972 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1974 = _1952 * _1972;
    float _1976 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1978 = -_1960;
    float _1980 = fma(_1952, _1976, _1978);
    float _1982 = _1970 * _1970;
    float _1984 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1986 = -_1974;
    float _1988 = fma(_1946, _1984, _1986);
    float _1990 = _1930 * 6.283185482025146484375;
    float _1992 = cos(_1990);
    float _1994 = fma(_1980, _1980, _1982);
    float _1996 = fma(_1988, _1988, _1994);
    float _1998 = _1950 * 6.283185482025146484375;
    float _2000 = sin(_1998);
    float _2002 = _1630 * _1846;
    float _2004 = _1868 * _1964;
    float _2006 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _2008 = _1940 * _1964;
    float _2010 = _2002 * _1932;
    float _2012 = _457 * _2002;
    float _2014 = _1950 * 6.283185482025146484375;
    float _2016 = cos(_2014);
    float _2018 = _1940 * _1992;
    float _2020 = _2006 * _2010;
    float _2022 = _1868 * _1992;
    float _2024 = rsqrt(_1996);
    float _2026 = fma(_2000, _2018, _2004);
    float _2028 = fma(_2000, _2004, _2018);
    float _2030 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _2032 = -_2008;
    float _2034 = fma(_2000, _2022, _2032);
    float _2036 = -_2022;
    float _2038 = fma(_2000, _2008, _2036);
    float _2040 = -_2020;
    float _2042 = _2000 * _2040;
    float _2044 = _2030 * _2012;
    float _2046 = _1940 * _2016;
    float _2048 = _1868 * _2016;
    float _2050 = _1992 * _2016;
    float _2052 = _2002 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2054 = _2052 * 0.5;
    float _2056 = _2046 * _2020;
    float _2058 = _1964 * _2016;
    float _2060 = fma(_2050, _2044, _2042);
    float _2062 = _1980 * _2024;
    float _2064 = _1988 * _2024;
    float _2066 = _1970 * _2024;
    float _2068 = fma(_2026, _2044, _2056);
    float _2070 = _1952 * _2062;
    float _2072 = _2048 * _2020;
    float _2074 = _1948 * _2066;
    float _2076 = fma(_2038, _2054, _2068);
    float _2078 = -_2070;
    float _2080 = fma(_1946, _2066, _2078);
    float _2082 = fma(_2034, _2044, _2072);
    float _2084 = fma(_2058, _2054, _2060);
    float _2086 = -_2074;
    float _2088 = fma(_1952, _2064, _2086);
    float _2090 = _2080 * _2076;
    float _2092 = fma(_2028, _2054, _2082);
    float _2094 = _1946 * _2064;
    float _2096 = _2088 * _2076;
    float _2098 = fma(_2064, _2084, _2090);
    float _2100 = -_2094;
    float _2102 = fma(_1948, _2062, _2100);
    float _2104 = fma(_2062, _2084, _2096);
    float _2106 = fma(_1948, _2092, _2098);
    float _2108 = _2102 * _2076;
    float _2110 = fma(_1946, _2092, _2104);
    float _2112 = _1372 + _2106;
    float _2114 = _1334 + _2110;
    float _2116 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2118 = _2112 + _2116;
    float _2120 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2122 = _2114 + _2120;
    float _2124 = _2118 * _2118;
    float _2126 = fma(_2122, _2122, _2124);
    float _2128 = fma(_2066, _2084, _2108);
    float _2130 = sqrt(_2126);
    float _2132 = fma(_1952, _2092, _2128);
    float _2134 = _1324 + _2132;
    bool _2136 = _2130 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2138 = _2092;
    float _2140 = _2132;
    float _2142 = _2084;
    float _2144 = _2108;
    if (!_2136)
    {
        _2138 = _2114;
    }
    float _2146 = _2138;
    float _2148 = _2146;
    if (!_2136)
    {
        _2140 = _2112;
    }
    float _2150 = _2140;
    float _2152 = _2150;
    if (!_2136)
    {
        _2142 = _2134;
    }
    float _2154 = _2142;
    bool _2156 = !_2136;
    float _2158 = _2154;
    if (!_2156)
    {
        float _2160 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2162 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2164 = _2130 + _2162;
        float _2166 = _2134 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2168 = _2164 * _2160;
        float _2170 = rsqrt(_2126);
        float _2172 = _2168 * 0.15915493667125701904296875;
        float _2174 = _2172 * 6.283185482025146484375;
        float _2176 = cos(_2174);
        float _2178 = _2172 * 6.283185482025146484375;
        float _2180 = sin(_2178);
        float _2182 = _2176 + (-1.0);
        float _2184 = _2182 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2186 = fma(_2180, _2166, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2188 = fma(_2134, _2176, _2184);
        float _2190 = _2170 * _2186;
        float _2192 = fma(_2122, _2190, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2194 = fma(_2118, _2190, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2158 = _2188;
        _2148 = _2192;
        _2152 = _2194;
        _2144 = _2186;
    }
    float _2196 = _2158;
    float _2198 = _2148;
    float _2200 = _2152;
    float _2202 = _2144;
    float _2204 = -_1324;
    float _2206 = _2204 + _2196;
    float _2208 = -_1334;
    float _2210 = _2208 + _2198;
    float _2212 = -_1372;
    float _2214 = _2212 + _2200;
    float _2216 = _2206 * _2206;
    float _2218 = fma(_2210, _2210, _2216);
    float _2220 = fma(_2214, _2214, _2218);
    float _2222 = sqrt(_2220);
    bool _2224 = _2222 > 0.0;
    bool _2226 = !_2224;
    float _2228 = _2196;
    float _2230 = _2198;
    float _2232 = _2200;
    float _2234 = _2214;
    float _2236 = _2202;
    float _2238 = _2220;
    if (!_2226)
    {
        float _2240 = _199 * _199;
        float _2242 = fma(_197, _197, _2240);
        float _2244 = fma(_201, _201, _2242);
        float _2246 = rsqrt(_2220);
        float _2248 = sqrt(_2244);
        float _2250 = _2210 * _2246;
        float _2252 = _2206 * _2246;
        float _2254 = _2214 * _2246;
        bool _2256 = _2248 > 0.0;
        bool _2258 = !_2256;
        _2236 = _2248;
        if (!_2258)
        {
            float _2260 = rsqrt(_2244);
            float _2262 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2264 = _199 * _2260;
            float _2266 = _197 * _2260;
            float _2268 = _201 * _2260;
            float _2270 = _2252 * _2264;
            float _2272 = fma(_2250, _2266, _2270);
            float _2274 = _2262 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2276 = fma(_2254, _2268, _2272);
            float _2278 = _2276 * _2274;
            float _2280 = fma(_197, _2278, _2198);
            float _2282 = fma(_199, _2278, _2196);
            float _2284 = fma(_201, _2278, _2200);
            _2228 = _2282;
            _2230 = _2280;
            _2232 = _2284;
            _2234 = _2270;
            _2236 = _2274;
            _2238 = _2272;
        }
    }
    float _2286 = _2228;
    float _2288 = _2230;
    float _2290 = _2232;
    float _2292 = _2234;
    float _2294 = _2236;
    float _2296 = _2238;
    float _2298 = -_1672;
    float _2300 = _2298 + _2286;
    float _2302 = -_1670;
    float _2304 = _2302 + _2288;
    float _2306 = -_1706;
    float _2308 = _2306 + _2290;
    float _2310 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2312 = _2300 + _2310;
    float _2314 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2316 = _2304 + _2314;
    float _2318 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2320 = _2308 + _2318;
    float _2322 = _2312 * _2312;
    float _2324 = fma(_2316, _2316, _2322);
    float _2326 = fma(_2320, _2320, _2324);
    float _2328 = rsqrt(_2326);
    float _2330 = sqrt(_2326);
    float _2332 = _2328 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2334 = _2316 * _2332;
    float _2336 = _2320 * _2332;
    float _2338 = _2334 * _2334;
    float _2340 = _2336 * _2336;
    float _2342 = _2338 + _2340;
    float _2344 = sqrt(_2342);
    bool _2346 = _2344 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2348 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2350 = _2344 + _2348;
    float _2352 = _2320;
    float _2354 = _2342;
    float _2356 = _2350;
    float _2358 = _2292;
    float _2360 = _2312;
    float _2362 = _2296;
    if (_2346)
    {
        float _2364 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2352 = _2364;
    }
    float _2366 = _2352;
    if (_2346)
    {
        float _2368 = rsqrt(_2342);
        _2354 = _2368;
    }
    float _2370 = _2354;
    float _2372 = _2370;
    if (_2346)
    {
        float _2374 = _2350 * _2366;
        _2356 = _2374;
    }
    float _2376 = _2356;
    if (_2346)
    {
        float _2378 = _2376 * 0.15915493667125701904296875;
        _2358 = _2378;
    }
    float _2380 = _2358;
    float _2382 = _2366;
    float _2384 = _2380;
    if (_2346)
    {
        float _2386 = _2380 * 6.283185482025146484375;
        float _2388 = sin(_2386);
        _2382 = _2388;
    }
    float _2390 = _2382;
    float _2392 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2394 = precise::max(0.0, _2392);
    float _2396 = _2294;
    float _2398 = _2394;
    if (_2346)
    {
        float _2400 = _2380 * 6.283185482025146484375;
        float _2402 = cos(_2400);
        _2396 = _2402;
    }
    float _2404 = _2396;
    float _2406 = -_2332;
    float _2408 = -_2394;
    float _2410 = fma(_2312, _2406, _2408);
    if (!_2346)
    {
        _2360 = _2336;
    }
    float _2412 = _2360;
    float _2414 = _2412;
    if (_2346)
    {
        float _2416 = _2410 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2398 = _2416;
    }
    float _2418 = _2398;
    float _2420 = _2390;
    float _2422 = _2418;
    if (_2346)
    {
        float _2424 = fma(_2390, _2418, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2362 = _2424;
    }
    float _2426 = _2362;
    float _2428 = _2426;
    if (!_2346)
    {
        _2420 = _2334;
    }
    float _2430 = _2420;
    float _2432 = fma(_1684, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2434 = _2430;
    float _2436 = _2404;
    if (_2346)
    {
        float _2438 = _2404 + (-1.0);
        _2422 = _2438;
    }
    float _2440 = _2422;
    if (_2346)
    {
        float _2442 = _2370 * _2426;
        _1674 = _2442;
    }
    float _2444 = _1674;
    if (!_2346)
    {
        _2428 = _2410;
    }
    float _2446 = _2428;
    float _2448 = floor(_2432);
    float _2450 = _2446;
    if (_2346)
    {
        float _2452 = _2440 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2384 = _2452;
    }
    float _2454 = _2384;
    if (_2346)
    {
        float _2456 = _2334 * _2444;
        _2434 = _2456;
    }
    float _2458 = _2434;
    if (!_2346)
    {
        _2372 = _2338;
    }
    float _2460 = _2372;
    float _2462 = _2460;
    if (_2346)
    {
        float _2464 = _2336 * _2444;
        _2414 = _2464;
    }
    float _2466 = _2414;
    if (_2346)
    {
        float _2468 = fma(_2410, _2404, _2454);
        _2450 = _2468;
    }
    float _2470 = _2450;
    if (_2346)
    {
        float _2472 = _2458 * _2458;
        _2462 = _2472;
    }
    float _2474 = _2462;
    if (!_2346)
    {
        _2436 = _2340;
    }
    float _2476 = _2436;
    float _2478 = _2476;
    if (_2346)
    {
        float _2480 = _2466 * _2466;
        _2478 = _2480;
    }
    float _2482 = _2478;
    float _2484 = _2300 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2486 = fma(_2470, _2470, _2474);
    float _2488 = _2300 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2490 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2484);
    float _2492 = _2486 + _2482;
    float _2494 = _2300 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2496 = _2300 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2498 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2490);
    float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2502 = fma(_2330, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2500);
    float _2504 = precise::clamp(_2502, 0.0, 1.0);
    float _2506 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2494);
    float _2508 = rsqrt(_2492);
    float _2510 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2488);
    float _2512 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2496);
    float _2514 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2506);
    float _2516 = _2498 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2518 = -_2504;
    float _2520 = _2518 + 1.0;
    float _2522 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2510);
    float _2524 = _2514 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2526 = _2516 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2528 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2512);
    float _2530 = _2522 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2532 = abs(_2520);
    float _2534 = log2(_2532);
    float _2536 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2526);
    float _2538 = _2528 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2540 = _2530 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2542 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2536);
    float _2544 = _2508 * _2458;
    float _2546 = fma(_1724, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2548 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2542);
    float _2550 = _2508 * _2470;
    float _2552 = _2544 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2554 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2556 = _2508 * _2466;
    float _2558 = floor(_2546);
    float _2560 = -_2552;
    float _2562 = fma(_2550, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2560);
    float _2564 = _2534 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2566 = -_2540;
    float _2568 = fma(_2566, _2554, 1.0);
    float _2570 = -_2448;
    float _2572 = _2432 + _2570;
    float _2574 = -_2556;
    float _2576 = fma(_2574, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2562);
    float _2578 = _2516 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2580 = _2516 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2582 = exp2(_2564);
    float _2584 = fma(_2576, -0.5, 0.5);
    float _2586 = fma(_2576, 0.5, 0.5);
    float _2588 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2578);
    float _2590 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2580);
    float _2592 = fma(_2586, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2594 = log2(_2568);
    float _2596 = -_2558;
    float _2598 = _2546 + _2596;
    float _2600 = _2550 + 1.0;
    float _2602 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2588);
    float _2604 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2590);
    float _2606 = fma(_2586, _2592, -0.212114393711090087890625);
    float _2608 = 1.0 / _2548;
    float _2610 = -_2550;
    float _2612 = fma(_2582, _2600, _2610);
    float _2614 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2602);
    float _2616 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2604);
    float _2618 = fma(_2586, _2606, 1.570728778839111328125);
    float _2620 = fma(_2612, 0.5, 0.5);
    float _2622 = sqrt(_2584);
    float _2624 = _2594 * 0.693147182464599609375;
    float _2626 = _2624 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2628 = _2614 * _2608;
    float _2630 = _2616 * _2608;
    float _2632 = fma(_2628, 0.5, 0.5);
    float _2634 = fma(_2630, -0.5, 0.5);
    float _2636 = _2622 * 0.636619746685028076171875;
    float2 _7333 = float2(_2572, _2598);
    float _2638 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7333, float2(0.0), isnan(_7333)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7333, float2(0.0), isnan(_7333)), level(0.0)).x;
    float3 _7344 = float3(_2632, _2634, _2626);
    float _2640 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7344, float3(0.0), isnan(_7344)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7344, float3(0.0), isnan(_7344)), level(0.0)).x;
    float _2642 = -_2618;
    float _2644 = fma(_2636, _2642, 1.0);
    float3 _7360 = float3(_2632, _2634, _2626);
    float4 _2647 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7360, float3(0.0), isnan(_7360)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7360, float3(0.0), isnan(_7360)), level(0.0)).xyzw;
    float _2649 = _2647.x;
    float _2651 = _2647.y;
    float _2653 = _2647.z;
    float _2655 = _2647.w;
    float2 _7376 = float2(_2644, _2620);
    float3 _2659 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7376, float2(0.0), isnan(_7376)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7376, float2(0.0), isnan(_7376)), level(0.0)).xyz;
    float _2661 = _2659.x;
    float _2663 = _2659.y;
    float _2665 = _2659.z;
    float _2667 = _1678 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2669 = _1678 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2671 = _2038 * _2102;
    float _2673 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2675 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2667);
    float _2677 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2669);
    float _2679 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2675);
    float _2681 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2677);
    bool _2683 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2685 = isnan(0.5);
    bool _2687 = _2683 || _2685;
    bool _2689 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2691 = _2687 || _2689;
    float _2693 = _2679 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2695 = _2681 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2697 = _2046 * _2102;
    float _2699 = _2046 * _2080;
    float _2701 = 1.0 / _2693;
    float _2703 = _2695 + _2693;
    float _2705 = _2703 * _2701;
    float _2707 = _2705 * 0.5;
    float _2709 = _2038 * _2088;
    float _2711 = _2038 * _2080;
    float _2713 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2715 = fma(_2707, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2713);
    float _2717 = fma(_2058, _2062, _2709);
    float _2719 = 1.0 / _2715;
    float _2721 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2723 = _2719 * _2721;
    float _2725 = _2026 * _2088;
    float _2727 = abs(_2723);
    float _2729 = log2(_2727);
    float _2731 = _2729 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2733 = exp2(_2731);
    float _2735 = fma(_2733, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2737 = precise::clamp(_2735, 0.0, 1.0);
    float _2739 = _2026 * _2102;
    float _2741 = -_2000;
    float _2743 = fma(_2741, _2066, _2697);
    float _2745 = _2026 * _2080;
    float _2747 = fma(_2737, -2.0, 3.0);
    float _2749 = _2737 * _2737;
    float _2751 = fma(_2048, _1952, _2743);
    float _2753 = fma(_2050, _2066, _2739);
    float _2755 = fma(_2050, _2064, _2745);
    float _2757 = _2749 * _2747;
    float _2759 = _2046 * _2088;
    float _2761 = -_2000;
    float _2763 = fma(_2761, _2064, _2699);
    float _2765 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2767 = fma(_2058, _2064, _2711);
    float _2769 = -_2000;
    float _2771 = fma(_2769, _2062, _2759);
    float _2773 = fma(_2050, _2062, _2725);
    float _2775 = -_2757;
    float _2777 = _2775 + 1.0;
    float _2779 = in.m_72.x;
    float _2781 = fma(_2048, _1946, _2771);
    float _2783 = fma(_2048, _1948, _2763);
    float _2785 = fma(_2777, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2757);
    float _2787 = _2516 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2789 = fma(_2058, _2066, _2671);
    float _2791 = _2534 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2793 = fma(_2034, _1952, _2753);
    float _2795 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2787);
    float _2797 = fma(_2034, _1946, _2773);
    float _2799 = _2673 * _2781;
    float _2801 = _2673 * _2751;
    float _2803 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2795);
    float _2805 = exp2(_2791);
    float _2807 = fma(_2034, _1948, _2755);
    float _2809 = _2673 * _2783;
    float _2811 = fma(_2028, _1952, _2789);
    float _2813 = fma(_2028, _1946, _2717);
    float _2815 = fma(_2028, _1948, _2767);
    float _2817 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2803);
    float _2819 = fma(_2765, _2797, _2799);
    float _2821 = fma(_2765, _2793, _2801);
    float _2823 = fma(_2765, _2807, _2809);
    bool _2825 = _2723 <= 8000.0;
    bool _2827 = isnan(_2723);
    bool _2829 = _2825 || _2827;
    bool _2831 = isnan(8000.0);
    bool _2833 = _2829 || _2831;
    float _2835 = float(_2833);
    float _2837 = _2548 * 0.5;
    float _2839 = _2817 + _2548;
    float _2841 = _2614 + _2548;
    float _2843 = _2803;
    float _2845 = _2837;
    if (_2691)
    {
        _2843 = 1.0;
    }
    float _2847 = _2843;
    float _2849 = fma(_2616, -0.5, _2837);
    float _2851 = _2835 * _2785;
    float _2853 = _2839 * 0.5;
    float _2855 = _2841 * 0.5;
    float _2857 = _2847;
    if (_2691)
    {
        _2845 = 1.0;
    }
    float _2859 = _2845;
    float _2861 = _2859;
    float _2863 = _2663;
    float _2865 = _2661;
    float _2867 = _2655;
    float _2869 = _2653;
    float _2871 = _2651;
    if (!_2691)
    {
        float _2873 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2875 = _2873 * 0.15915493667125701904296875;
        float _2877 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2879 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2881 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2879;
        float _2883 = _2875 * 6.283185482025146484375;
        float _2885 = cos(_2883);
        float _2887 = _2877 * 0.15915493667125701904296875;
        float _2889 = _2875 * 6.283185482025146484375;
        float _2891 = sin(_2889);
        float _2893 = 1.0 / _2885;
        float _2895 = _2887 * 6.283185482025146484375;
        float _2897 = cos(_2895);
        float _2899 = _2891 * _2893;
        float _2901 = _2887 * 6.283185482025146484375;
        float _2903 = sin(_2901);
        float _2905 = _2897 * _2899;
        float _2907 = 1.0 / _2881;
        float _2909 = 1.0 / _2905;
        float _2911 = _2903 * _2909;
        float _2913 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2915 = fma(_2723, _2911, _2913);
        float _2917 = _2915 * _2907;
        float _2919 = precise::clamp(_2917, 0.0, 1.0);
        _2861 = _2919;
    }
    float _2921 = _2861;
    if (!_2691)
    {
        float _2923 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2925 = _2923 * 0.15915493667125701904296875;
        float _2927 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2929 = _2925 * 6.283185482025146484375;
        float _2931 = cos(_2929);
        float _2933 = _2927 * 0.15915493667125701904296875;
        float _2935 = _2925 * 6.283185482025146484375;
        float _2937 = sin(_2935);
        float _2939 = 1.0 / _2931;
        float _2941 = _2933 * 6.283185482025146484375;
        float _2943 = cos(_2941);
        float _2945 = _2937 * _2939;
        float _2947 = _2933 * 6.283185482025146484375;
        float _2949 = sin(_2947);
        float _2951 = _2943 * _2945;
        float _2953 = 1.0 / _2951;
        float _2955 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2957 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2955;
        float _2959 = 1.0 / _2957;
        float _2961 = _2949 * _2953;
        float _2963 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2965 = fma(_2723, _2961, _2963);
        float _2967 = _2965 * _2959;
        float _2969 = precise::clamp(_2967, 0.0, 1.0);
        float _2971 = -_2969;
        float _2973 = _2971 + 1.0;
        _2857 = _2973;
    }
    float _2975 = _2857;
    float _2977 = -_2805;
    float _2979 = _2977 + 1.0;
    float _2981 = _2851 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2983 = -_2638;
    float _2985 = _2983 + 1.0;
    float _2987 = _2813 + _2819;
    float _2989 = _2979 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2991 = _2985 * _2981;
    float _2993 = precise::clamp(_2991, 0.0, 1.0);
    out.gl_Position.x = _2614;
    out.gl_Position.y = _2616;
    out.gl_Position.z = _2817;
    out.gl_Position.w = _2548;
    float _2995 = _2811 + _2821;
    float _2997 = _2989 * _2640;
    float _2999 = -_2993;
    float _3001 = fma(_2999, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_74.x = _2855;
    out.m_74.y = _2849;
    out.m_74.z = _2853;
    out.m_74.w = _2548;
    float _3003 = _2815 + _2823;
    bool _3005 = _2330 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3007 = isnan(_2330);
    bool _3009 = _3005 || _3007;
    bool _3011 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3013 = _3009 || _3011;
    float _3015 = _3001 * _2779;
    out.m_76.x = _2987;
    out.m_76.y = _2995;
    out.m_76.z = _3003;
    float _3017 = _3015 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3019 = _2655 * _2997;
    float _3021 = _2665 * _2997;
    out.m_78.x = _3017;
    float _3023 = -_2989;
    float _3025 = _3023 + 1.0;
    float _3027 = fma(_2661, _3019, _2649);
    float _3029 = fma(_2663, _3019, _2651);
    float _3031 = fma(_2655, _3021, _2653);
    float _3033 = _2655 * _3025;
    float _3035 = _2921 * _2975;
    float _3037 = _3035;
    if (!_3013)
    {
        _2863 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3039 = _2863;
    float _3041 = _3039;
    float _3043 = _3039;
    if (!_3013)
    {
        _2865 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3045 = _2865;
    out.m_80.x = _3027;
    out.m_80.y = _3029;
    out.m_80.z = _3031;
    out.m_80.w = _3033;
    float _3047 = _3035 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3049 = _3045;
    float _3051 = _3045;
    if (!_3013)
    {
        _2867 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3053 = _2867;
    float _3055 = _3053;
    float _3057 = _3053;
    if (!_3013)
    {
        _2869 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3059 = _2869;
    float _3061 = _3059;
    float _3063 = _3059;
    if (!_3013)
    {
        _2871 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3065 = _2871;
    float _3067 = _3065;
    float _3069 = _3065;
    if (!_3013)
    {
        _3037 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3071 = _3037;
    bool _3073 = !_3013;
    float _3075 = _3071;
    float _3077 = _3071;
    if (!_3073)
    {
        bool _3079 = _2330 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3081 = isnan(_2330);
        bool _3083 = _3079 || _3081;
        bool _3085 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3087 = _3083 || _3085;
        if (!_3087)
        {
            float _3089 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3091 = _2330 + _3089;
            float _3093 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3095 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3093;
            float _3097 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3099 = _3097 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3101 = 1.0 / _3095;
            float _3103 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3105 = _3103 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3107 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3109 = _3107 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3111 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3113 = _3111 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3115 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3117 = _3115 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3119 = _3091 * _3101;
            float _3121 = precise::clamp(_3119, 0.0, 1.0);
            float _3123 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3125 = _3123 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3127 = fma(_3121, _3099, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3129 = fma(_3121, _3125, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3131 = fma(_3121, _3105, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3133 = fma(_3121, _3109, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3135 = fma(_3121, _3113, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3137 = fma(_3121, _3117, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3051 = _3129;
            _3069 = _3135;
            _3043 = _3127;
            _3063 = _3133;
            _3057 = _3131;
            _3077 = _3137;
            _3139 = true;
        }
        else
        {
            bool _3141 = _2330 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3143 = isnan(_2330);
            bool _3145 = _3141 || _3143;
            bool _3147 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3149 = _3145 || _3147;
            if (!_3149)
            {
                _3041 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3151 = _3041;
            _3043 = _3151;
            if (!_3149)
            {
                _3049 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3153 = _3049;
            _3051 = _3153;
            if (!_3149)
            {
                _3055 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3155 = _3055;
            _3057 = _3155;
            if (!_3149)
            {
                _3061 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3157 = _3061;
            _3063 = _3157;
            if (!_3149)
            {
                _3067 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3159 = _3067;
            _3069 = _3159;
            if (!_3149)
            {
                _3075 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3161 = _3075;
            bool _3163 = !_3149;
            _3077 = _3161;
            if (!_3163)
            {
                bool _3165 = _2330 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3167 = isnan(_2330);
                bool _3169 = _3165 || _3167;
                bool _3171 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3173 = _3169 || _3171;
                if (!_3173)
                {
                    float _3175 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3177 = _2330 + _3175;
                    float _3179 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3181 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3179;
                    float _3183 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3185 = _3183 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3187 = 1.0 / _3181;
                    float _3189 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3191 = _3189 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3193 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3195 = _3193 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3197 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3199 = _3197 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3201 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3203 = _3201 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3205 = _3177 * _3187;
                    float _3207 = precise::clamp(_3205, 0.0, 1.0);
                    float _3209 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3211 = _3209 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3213 = fma(_3207, _3185, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3215 = fma(_3207, _3211, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3217 = fma(_3207, _3191, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3219 = fma(_3207, _3195, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3221 = fma(_3207, _3199, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3223 = fma(_3207, _3203, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3051 = _3215;
                    _3069 = _3221;
                    _3043 = _3213;
                    _3063 = _3219;
                    _3057 = _3217;
                    _3077 = _3223;
                    _3139 = true;
                }
                else
                {
                    _3051 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3069 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3043 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3063 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3057 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3077 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3139 = false;
    float _3225 = _3051;
    float _3227 = _3069;
    float _3229 = _3043;
    float _3231 = _3063;
    float _3233 = _3057;
    float _3235 = _3077;
    float _3237 = fma(_2995, -0.5, 0.5);
    float _3239 = precise::clamp(_3237, 0.0, 1.0);
    float _3241 = -_3225;
    float _3243 = _3241 + _3227;
    float _3245 = -_3229;
    float _3247 = _3245 + _3231;
    out.m_82.x = 0.0;
    float _3249 = -_3233;
    float _3251 = _3249 + _3235;
    float _3253 = fma(_3239, _3243, _3225);
    float _3255 = fma(_3239, _3247, _3229);
    bool _3257 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3259 = _3253 * 0.586610972881317138671875;
    float _3261 = fma(_3239, _3251, _3233);
    float _3263 = _3047 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3265 = fma(_3255, 0.298911988735198974609375, _3259);
    bool _3267 = _2921 > 0.0;
    bool _3269 = isnan(_2921);
    bool _3271 = _3267 || _3269;
    bool _3273 = isnan(0.0);
    bool _3275 = _3271 || _3273;
    float _3277 = fma(_3261, 0.114477999508380889892578125, _3265);
    out.m_49.x = _3263;
    bool _3279 = _2975 <= 0.0;
    bool _3281 = !_3275;
    bool _3283 = _3279 || _3281;
    float _3285 = -_3277;
    float _3287 = _3255 + _3285;
    float _3289 = -_3277;
    float _3291 = _3261 + _3289;
    float _3293 = fma(_3287, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3277);
    float _3295 = -_3277;
    float _3297 = _3253 + _3295;
    float _3299 = fma(_3297, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3277);
    float _3301 = fma(_3291, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3277);
    bool _3303 = !_3257;
    if (!_3303)
    {
        float _3305 = -_2300;
        float _3307 = _3305 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3309 = -_2304;
        float _3311 = _3309 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3313 = -_2308;
        float _3315 = _3313 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3317 = _3307 * _3307;
        float _3319 = fma(_3311, _3311, _3317);
        float _3321 = fma(_3315, _3315, _3319);
        float _3323 = sqrt(_3321);
        float _3325 = rsqrt(_3321);
        float _3327 = -_3323;
        float _3329 = _3327 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3331 = _3329 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3333 = precise::clamp(_3331, 0.0, 1.0);
        float _3335 = _3311 * _3325;
        float _3337 = _3307 * _3325;
        float _3339 = abs(_3333);
        float _3341 = log2(_3339);
        float _3343 = _3315 * _3325;
        float _3345 = _3335 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3347 = _2995 * _3337;
        float _3349 = -_3337;
        float _3351 = -_3345;
        float _3353 = fma(_3349, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3351);
        float _3355 = fma(_2987, _3335, _3347);
        float _3357 = -_3343;
        float _3359 = fma(_3357, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3353);
        float _3361 = fma(_3003, _3343, _3355);
        float _3363 = precise::clamp(_3361, 0.0, 1.0);
        float _3365 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3367 = _3359 + _3365;
        float _3369 = _3341 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3371 = _3367 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3373 = precise::clamp(_3371, 0.0, 1.0);
        float _3375 = exp2(_3369);
        float _3377 = _3375 * _3373;
        float _3379 = _3363 * _3377;
        float _3381 = _3379 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3383 = _3379 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3385 = _3379 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _3381;
        out.m_82.y = _3383;
        out.m_82.z = _3385;
    }
    out.m_84.x = _3293;
    out.m_84.y = _3299;
    out.m_84.z = _3301;
    if (!_3283)
    {
        return out;
    }
    float _3387 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3387;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3139 = false;
    bool _441 = false;
    bool _325 = false;
    bool _223 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    float _113 = _111;
    if (!_107)
    {
        out.m_49.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _111 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3444 = as_type<float>(_119);
        out.gl_Position.z = _3444;
    }
    if (!_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = in.m_51.w;
    bool _125 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_123);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    float _135 = -_123;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _139 = _137;
    if (_133)
    {
        float _141 = float(_103);
        _113 = _141;
    }
    float _143 = _113;
    bool _145 = _137 >= _143;
    bool _147 = !_133;
    bool _149 = _145 || _147;
    float _151 = _143;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _151;
    if (_149)
    {
        out.m_49.x = 0.0;
    }
    if (_149)
    {
        float _155 = _153 * 5.0;
        _121 = as_type<int>(_155);
    }
    int _157 = _121;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3514 = as_type<float>(_157);
        out.gl_Position.z = _3514;
    }
    if (_149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = in.m_56.x;
    float _163 = in.m_56.y;
    float _165 = in.m_56.z;
    int _167 = as_type<int>(_159) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_159) & 2;
    bool _173 = _171 != 0;
    bool _175 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _177 = _163 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _179 = _163 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _181 = _163 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _183 = !_169;
    float _185 = _183 ? (-0.5) : 0.5;
    float _187 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].x, _177);
    float _189 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].x, _179);
    float _191 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].x, _181);
    bool _193 = !_173;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].z, _187);
    float _199 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].z, _189);
    float _201 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].z, _191);
    bool _203 = !_175;
    float _221;
    if (!_203)
    {
        float _205 = in.m_58.x;
        float _207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _209 = _205 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _213 = _211 * _207;
        float _215 = floor(_213);
        float _217 = -_215;
        float _219 = _213 + _217;
        _221 = _219;
        _223 = true;
    }
    else
    {
        float _225 = float(_103);
        float _227 = 1.0 / _225;
        float _229 = _137 * _227;
        _221 = _229;
    }
    _223 = false;
    float _231 = _221;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = _231 + _233;
    bool _237 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _239 = isnan(_231);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _249;
    float _253 = -_247;
    float _255 = _253 + 1.0;
    bool _257 = _231 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _259 = isnan(_231);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _265 = _261 || _263;
    float _267 = float(_265);
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _269;
    bool _273 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _275 = 1.0 / _251;
    float _277 = _267 * _255;
    float _279 = -_267;
    float _281 = _279 + 1.0;
    float _283 = _235 * _275;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _285;
    float _289 = fma(_271, _283, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _291 = fma(_287, _283, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _293 = _289 * _277;
    float _295 = _291 * _277;
    float _297 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[143].x, _293);
    float _299 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[143].y, _295);
    float _301 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[144].x, _297);
    float _303 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[144].y, _299);
    bool _305 = !_273;
    float _323;
    if (!_305)
    {
        float _307 = in.m_58.x;
        float _309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _311 = _307 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[11].y, _137);
        float _315 = _313 * _309;
        float _317 = floor(_315);
        float _319 = -_317;
        float _321 = _315 + _319;
        _323 = _321;
        _325 = true;
    }
    else
    {
        float _327 = float(_103);
        float _329 = 1.0 / _327;
        float _331 = _137 * _329;
        _323 = _331;
    }
    _325 = false;
    float _333 = _323;
    float _335 = in.m_60.x;
    float _337 = in.m_60.y;
    bool _339 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _341 = isnan(_333);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _355 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _357 = isnan(_333);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _373 = _333 + _371;
    float _375 = -_349;
    float _377 = _375 + 1.0;
    bool _379 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _381 = 1.0 / _353;
    float _383 = _365 * _377;
    float _385 = -_365;
    float _387 = _385 + 1.0;
    float _389 = _303 * _337;
    float _391 = _301 * _335;
    float _393 = _369 * _381;
    float _395 = fma(_393, _373, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _397 = _395 * _383;
    float _399 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[115].x, _397);
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _407 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[116].x, _399);
    float _409 = _401 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = _403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _413 = _405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _415 = _407 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_62.x = _409;
    out.m_62.y = _411;
    out.m_62.z = _413;
    out.m_62.w = _415;
    bool _417 = !_379;
    float _437;
    float _439;
    if (!_417)
    {
        float _419 = in.m_58.x;
        float _421 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _423 = float(_103);
        float _425 = _419 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _427 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[11].w, _137);
        float _429 = _427 * _421;
        float _431 = floor(_429);
        float _433 = -_431;
        float _435 = _429 + _433;
        _437 = _423;
        _439 = _435;
        _441 = true;
    }
    else
    {
        float _443 = float(_103);
        float _445 = 1.0 / _443;
        float _447 = _137 * _445;
        _437 = _443;
        _439 = _447;
    }
    _441 = false;
    float _449 = _437;
    float _451 = _439;
    float _453 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _455 = int(_453);
    float _457 = _391 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _461 = _459 != 0;
    float _463 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _465 = int(_463);
    float _467 = float(_455);
    float _469 = 1.0 / _449;
    float _471 = float(uint(_465));
    float _473 = 1.0 / _467;
    float _475 = float(_465);
    int _477 = ~_465;
    int _479 = _477 + 1;
    bool _481 = _465 == 0;
    float _483 = 1.0 / _471;
    float _485 = _473 * _137;
    float _487 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _489 = as_type<int>(_483) + (-2);
    float _491 = trunc(_485);
    int _493 = int(_491);
    float _495 = float(uint(_493));
    float _497 = as_type<float>(_489) * _495;
    int _499 = ~_465;
    int _501 = _499 + 1;
    float _503 = trunc(_497);
    float _505 = precise::max(_503, 0.0);
    uint _508 = uint(_505);
    bool _510 = !_461;
    float _512 = _510 ? 5.839270114898681640625 : 1.0;
    int _514 = _501 * int(_508);
    int _516 = _514 + _493;
    float _518 = float(uint(_516));
    float _520 = as_type<float>(_489) * _518;
    float _522 = in.m_58.x;
    float _524 = in.m_58.y;
    float _526 = in.m_58.z;
    float _528 = in.m_58.w;
    float _530 = trunc(_520);
    float _532 = precise::max(_530, 0.0);
    uint _534 = uint(_532);
    int _536 = int(_508) + int(_534);
    float _538 = float(_493);
    bool _540 = _524 > 0.5;
    int _542 = _479 * _536;
    int _544 = _542 + _493;
    bool _546 = _538 >= _475;
    bool _548 = isnan(_538);
    bool _550 = _546 || _548;
    bool _552 = isnan(_475);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    bool _558 = !_461;
    float _560 = _558 ? _526 : _522;
    bool _562 = uint(_544) >= uint(_465);
    float _564 = trunc(_556);
    int _566 = int(_564);
    float _568 = -_185;
    int _570 = _540 ? as_type<int>(_568) : as_type<int>(_185);
    float _572 = _512 * _560;
    bool _574 = !_562;
    int _576 = _574 ? 0 : (-1);
    bool _578 = _526 > 0.5;
    int _580 = ~_536;
    int _582 = _580 + _576;
    int _584 = _582 + 1;
    float _586 = floor(_572);
    float _588 = -_195;
    int _590 = _578 ? as_type<int>(_588) : as_type<int>(_195);
    int _592 = _465 * _584;
    int _594 = _592 + _493;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _598 = _596 != 0;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _602 = _600 != 0;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _606 = _604 != 0;
    int _608 = ~_566;
    int _610 = _608 + 1;
    int _612 = _610 + 1;
    bool _614 = !_481;
    int _616 = _614 ? _594 : (-1);
    bool _618 = !_598;
    float _620 = _618 ? _185 : as_type<float>(_570);
    bool _622 = !_602;
    float _624 = _622 ? _195 : as_type<float>(_590);
    float _626 = -_586;
    float _628 = _572 + _626;
    int _630 = _616 * _612;
    int _632 = _465 + (-1);
    float _634 = _628 * _475;
    float _636 = _475 * _137;
    bool _638 = !_606;
    int _640 = _638 ? 0 : 1;
    float _642 = trunc(_634);
    int _644 = int(_642);
    float _646 = _636 * _469;
    int _648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _650 = _648 != 0;
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _654 = _652 != 0;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _658 = _656 != 0;
    int _660 = _566 * _632;
    int _662 = _660 + _630;
    int _664 = abs(_640);
    bool _666 = !_654;
    int _668 = _666 ? 0 : 1;
    float _670 = trunc(_646);
    int _672 = int(_670);
    bool _674 = !_650;
    int _676 = _674 ? 0 : 1;
    int _678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _680 = _678 != 0;
    int _682 = abs(_668);
    bool _684 = !_658;
    int _686 = _684 ? 0 : 1;
    int _688 = _644 * _664;
    int _690 = _688 + _493;
    int _692 = abs(_676);
    bool _694 = !_680;
    int _696 = _694 ? 0 : 1;
    int _698 = abs(_686);
    int _700 = _662 * _682;
    int _702 = abs(_696);
    int _704 = _672 * _692;
    int _706 = _704 + _700;
    int _708 = ~_465;
    int _710 = _708 + 1;
    int _712 = ~_465;
    int _714 = _712 + 1;
    int _716 = _690 * _698;
    int _718 = _716 + _706;
    int _720 = ~_465;
    int _722 = _720 + 1;
    int _724 = _644 * _702;
    int _726 = _724 + _718;
    float _728 = float(uint(_726));
    float _730 = as_type<float>(_489) * _728;
    float _732 = trunc(_730);
    float _734 = precise::max(_732, 0.0);
    uint _736 = uint(_734);
    int _738 = _722 * int(_736);
    int _740 = _738 + _726;
    float _742 = float(uint(_740));
    float _744 = as_type<float>(_489) * _742;
    float _746 = trunc(_744);
    float _748 = precise::max(_746, 0.0);
    uint _750 = uint(_748);
    int _752 = int(_736) + int(_750);
    int _754 = _710 * _752;
    int _756 = _754 + _726;
    bool _758 = uint(_756) >= uint(_465);
    bool _760 = !_758;
    int _762 = _760 ? 0 : (-1);
    int _764 = ~_752;
    int _766 = _764 + _762;
    int _768 = _766 + 1;
    float _770 = float(uint(_690));
    int _772 = _465 * _768;
    int _774 = _772 + _726;
    float _776 = as_type<float>(_489) * _770;
    int _778 = ~_465;
    int _780 = _778 + 1;
    bool _782 = !_481;
    int _784 = _782 ? _774 : (-1);
    float _786 = trunc(_776);
    float _788 = precise::max(_786, 0.0);
    uint _790 = uint(_788);
    int _792 = _784 >> 31;
    int _794 = _784 & 3;
    bool _796 = _794 != 0;
    int _798 = _792 & 3;
    int _800 = _784 + _798;
    int _802 = _800 >> 2;
    int _804 = _780 * int(_790);
    int _806 = _804 + _690;
    int _808 = _802 << 4;
    int _810 = _808 + 656;
    float _812 = float(uint(_806));
    uint _814 = uint(int(uint(_810) >> uint(2)));
    uint _816 = uint(int(uint(int(_814)) >> uint(2)));
    int _818 = int(_814) & 3;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[int(_816)][_818];
    int _822 = int(_814) + 1;
    uint _824 = uint(int(uint(_822) >> uint(2)));
    int _826 = _822 & 3;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[int(_824)][_826];
    float _830 = as_type<float>(_489) * _812;
    int _832 = _784 & 3;
    bool _834 = _832 != 0;
    int _836 = _796 ? 0 : 1;
    int _838 = _810 + 8;
    uint _840 = uint(int(uint(_838) >> uint(2)));
    uint _842 = uint(int(uint(int(_840)) >> uint(2)));
    int _844 = int(_840) & 3;
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[int(_842)][_844];
    int _848 = int(_840) + 1;
    uint _850 = uint(int(uint(_848) >> uint(2)));
    int _852 = _848 & 3;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[int(_850)][_852];
    float _856 = trunc(_830);
    float _858 = precise::max(_856, 0.0);
    uint _860 = uint(_858);
    bool _862 = uint(_832) > 1u;
    int _864 = ~_836;
    int _866 = _864 + 1;
    int _868 = _866 + 1;
    bool _870 = uint(_832) >= 2u;
    int _872 = _868;
    if (!_862)
    {
        int _874 = ~_836;
        int _876 = _874 + 1;
        _872 = _876;
    }
    int _878 = _872;
    int _880 = int(_790) + int(_860);
    bool _882 = _832 != 3;
    int _884 = _870 ? 0 : 1;
    int _886 = _714 * _880;
    int _888 = _886 + _690;
    int _890 = abs(_878);
    bool _892 = !_834;
    int _894 = _892 ? 0 : 1;
    float _896 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _898 = int(_896);
    bool _900 = uint(_888) >= uint(_465);
    int _902 = ~_890;
    int _904 = _902 + 1;
    int _906 = _904 + 1;
    bool _908 = !_900;
    int _910 = _908 ? 0 : (-1);
    int _912 = ~_884;
    int _914 = _912 + 1;
    int _916 = _914 + 1;
    bool _918 = _832 != 3;
    int _920 = _916;
    if (_882)
    {
        int _922 = ~_884;
        int _924 = _922 + 1;
        _920 = _924;
    }
    int _926 = _920;
    int _928 = abs(_894);
    int _930 = _906 * as_type<int>(_828);
    int _932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _934 = _932 != 0;
    bool _936 = !_918;
    int _938 = _936 ? 0 : (-1);
    int _940 = abs(_926);
    bool _942 = !_934;
    int _944 = _942 ? 0 : 1;
    int _946 = abs(_938);
    int _948 = ~_928;
    int _950 = _948 + 1;
    int _952 = _950 + 1;
    int _954 = abs(_944);
    int _956 = _952 * as_type<int>(_820);
    int _958 = _956 + _930;
    int _960 = ~_940;
    int _962 = _960 + 1;
    int _964 = _962 + 1;
    int _966 = ~_880;
    int _968 = _966 + _910;
    int _970 = _968 + 1;
    float _972 = _522 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _974 = _964 * as_type<int>(_846);
    int _976 = _974 + _958;
    int _978 = ~_946;
    int _980 = _978 + 1;
    int _982 = _980 + 1;
    int _984 = _465 * _970;
    int _986 = _984 + _690;
    float _988 = float(uint(_898));
    float _990 = _524 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _992 = ~_954;
    int _994 = _992 + 1;
    int _996 = _994 + 1;
    int _998 = _982 * as_type<int>(_854);
    int _1000 = _998 + _976;
    bool _1002 = !_481;
    int _1004 = _1002 ? _986 : (-1);
    float _1006 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1008 = abs(_898);
    int _1010 = _1000 * _996;
    int _1012 = ~_898;
    int _1014 = _1012 + 1;
    int _1016 = _1004 * _954;
    int _1018 = _1016 + _1010;
    float _1020 = float(uint(_1008));
    float _1022 = 1.0 / _988;
    bool _1024 = _528 > 0.5;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1030 = float(uint(_1018));
    float _1032 = 1.0 / _1020;
    int _1034 = ~_1008;
    int _1036 = _1034 + 1;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1042 = _1040 != 0;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1048 = _1046 != 0;
    float _1050 = fma(_990, -2.0, _1038);
    float _1052 = _526 * 2.0;
    int _1054 = as_type<int>(_1022) + (-2);
    float _1056 = 1.0 / _1028;
    int _1058 = abs(_1018);
    float _1060 = -_1044;
    float _1062 = fma(_972, 2.0, _1060);
    float _1064 = -_195;
    int _1066 = _1024 ? as_type<int>(_1064) : as_type<int>(_195);
    float _1068 = as_type<float>(_1054) * _1030;
    float _1070 = float(uint(_1058));
    float _1072 = in.m_46.x;
    float _1074 = in.m_46.y;
    float _1076 = in.m_46.z;
    int _1078 = as_type<int>(_1032) + (-2);
    float _1080 = _522 * 2.0;
    int _1082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1084 = _1082 != 0;
    float _1086 = trunc(_1068);
    float _1088 = precise::max(_1086, 0.0);
    uint _1090 = uint(_1088);
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1094 = _1092 != 0;
    float _1096 = as_type<float>(_1078) * _1070;
    float _1098 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1050);
    bool _1100 = !_1084;
    float _1102 = _1100 ? _195 : as_type<float>(_1066);
    bool _1104 = _898 == 0;
    float _1106 = trunc(_1096);
    float _1108 = precise::max(_1106, 0.0);
    uint _1110 = uint(_1108);
    int _1112 = _1014 * int(_1090);
    int _1114 = _1112 + _1018;
    float _1116 = floor(_1080);
    float _1118 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1120 = float(uint(_1114));
    float _1122 = _524 + _522;
    int _1124 = _1036 * int(_1110);
    int _1126 = _1124 + _1058;
    float _1128 = floor(_1052);
    float _1130 = as_type<float>(_1054) * _1120;
    float _1132 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1134 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1136 = float(uint(_1126));
    float _1138 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1118);
    float _1140 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1132);
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1142;
    float _1146 = trunc(_1130);
    float _1148 = precise::max(_1146, 0.0);
    uint _1150 = uint(_1148);
    float _1152 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1134);
    float _1154 = as_type<float>(_1078) * _1136;
    float _1156 = _524 + _526;
    float _1158 = -_195;
    int _1160 = _540 ? as_type<int>(_1158) : as_type<int>(_195);
    float _1162 = _1122 + (-1.0);
    bool _1164 = _522 > 0.5;
    float _1166 = _1144 * _1056;
    float _1168 = _1156 + (-1.0);
    float _1170 = trunc(_1154);
    float _1172 = precise::max(_1170, 0.0);
    uint _1174 = uint(_1172);
    float _1176 = -_185;
    int _1178 = _1164 ? as_type<int>(_1176) : as_type<int>(_185);
    float _1180 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1184 = _451 + _1182;
    bool _1186 = !_1094;
    float _1188 = _1186 ? _185 : as_type<float>(_1178);
    float _1190 = -_185;
    int _1192 = _578 ? as_type<int>(_1190) : as_type<int>(_185);
    float _1194 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1196 = !_1042;
    float _1198 = _1196 ? _195 : as_type<float>(_1160);
    float _1200 = -_137;
    float _1202 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1062);
    bool _1204 = _1116 > 0.0;
    float _1206 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1152);
    bool _1208 = _1116 >= 0.0;
    bool _1210 = isnan(_1116);
    bool _1212 = _1208 || _1210;
    bool _1214 = isnan(0.0);
    bool _1216 = _1212 || _1214;
    float _1218 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1220 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1138);
    float _1222 = _1188 + 0.5;
    int _1224 = int(_1090) + int(_1150);
    float _1226 = fma(_1166, _1184, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1228 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1230 = isnan(_451);
    bool _1232 = _1228 || _1230;
    bool _1234 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1236 = _1232 || _1234;
    float _1238 = float(_1236);
    float _1240 = _487 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1242 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1140);
    float _1244 = fma(_1218, _1222, _1202);
    bool _1246 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1248 = isnan(_451);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    float _1258 = -_1238;
    float _1260 = _1258 + 1.0;
    int _1262 = ~_898;
    int _1264 = _1262 + 1;
    float _1266 = _1198 + (-0.5);
    int _1268 = int(_1110) + int(_1174);
    float _1270 = _1256 * _1260;
    int _1272 = ~_1008;
    int _1274 = _1272 + 1;
    int _1276 = _1264 * _1224;
    int _1278 = _1276 + _1018;
    float _1280 = -_1240;
    float _1282 = -_1098;
    float _1284 = fma(_1280, _1266, _1282);
    float _1286 = _1226 * _1270;
    int _1288 = _1274 * _1268;
    int _1290 = _1288 + _1058;
    bool _1292 = !_1048;
    float _1294 = _1292 ? _185 : as_type<float>(_1192);
    float _1296 = -_1256;
    float _1298 = _1296 + 1.0;
    bool _1300 = uint(_1278) >= uint(_898);
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1304 = as_type<float>(_1058);
    float _1306 = _1098;
    float _1308 = as_type<float>(_898);
    float _1310 = as_type<float>(_1018);
    float _1312 = as_type<float>(_1268);
    if (_461)
    {
        _1304 = _522;
    }
    float _1314 = _1304;
    float _1316 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1286);
    float _1318 = _1294 + 0.5;
    float _1320 = _1314;
    if (!_461)
    {
        _1306 = _524;
    }
    float _1322 = _1306;
    float _1324 = _1242 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1326 = _1322;
    if (!_461)
    {
        _1320 = _526;
    }
    float _1328 = _1320;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_461)
    {
        _1326 = _522;
    }
    float _1332 = _1326;
    float _1334 = _1220 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1336 = !_1300;
    int _1338 = _1336 ? 0 : (-1);
    float _1340 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1342 = uint(_1290) >= uint(_1008);
    float _1344 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1302);
    float _1346 = _1332 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1348 = ~_1224;
    int _1350 = _1348 + _1338;
    int _1352 = _1350 + 1;
    float _1354 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1356 = _1018 ^ _898;
    float _1358 = -_1330;
    float _1360 = fma(_1346, 2.0, _1358);
    bool _1362 = !_1342;
    int _1364 = _1362 ? 0 : (-1);
    int _1366 = _898 * _1352;
    int _1368 = _1366 + _1018;
    uint _1370 = uint(int(uint(_1356) >> uint(31)));
    float _1372 = _1206 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1374 = ~_1364;
    int _1376 = _1268 + _1374;
    int _1378 = _1376 + 1;
    float _1380 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1382 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1344);
    bool _1384 = _898 == 0;
    int _1386 = ~int(_1370);
    int _1388 = _1386 + 1;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_461)
    {
        _1308 = _526;
    }
    float _1392 = _1308;
    float _1394 = -_1382;
    float _1396 = _1394 + 1.0;
    float _1398 = _1392;
    if (_461)
    {
        _1398 = _524;
    }
    float _1400 = _1398;
    int _1402 = _1378 ^ _1388;
    float _1404 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1390);
    int _1406 = ~_1388;
    int _1408 = _1406 + _1402;
    int _1410 = _1408 + 1;
    bool _1412 = _1128 >= 0.0;
    bool _1414 = isnan(_1128);
    bool _1416 = _1412 || _1414;
    bool _1418 = isnan(0.0);
    bool _1420 = _1416 || _1418;
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (!_461)
    {
        _1310 = _526;
    }
    float _1424 = _1310;
    float _1426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1428 = -_1422;
    float _1430 = fma(_1340, 2.0, _1428);
    float _1432 = _1424;
    if (_461)
    {
        _1432 = _524;
    }
    float _1434 = _1432;
    float _1436 = -_137;
    float _1438 = fma(_1436, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1360);
    bool _1440 = !_1104;
    int _1442 = _1440 ? _1368 : (-1);
    float _1444 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1446 = _1334 + _1444;
    bool _1448 = !_1384;
    int _1450 = _1448 ? _1410 : (-1);
    float _1452 = -_137;
    float _1454 = fma(_1452, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1430);
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1458 = _1456 != 0;
    int _1460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1462 = _1460 != 0;
    int _1464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1466 = _1464 != 0;
    float _1468 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1470 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1472 = _1434 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1474 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1316);
    float _1476 = fma(_1468, _1318, _1438);
    if (_461)
    {
        _1312 = _524;
    }
    float _1478 = _1312;
    float _1480 = fma(_1472, -2.0, _1470);
    float _1482 = _1478;
    if (!_461)
    {
        _1482 = _522;
    }
    float _1484 = _1482;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1488 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1490 = _1324 + _1488;
    float _1492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1494 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1496 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1498 = _1490 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1500 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1480);
    float _1502 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1504 = _1372 + _1502;
    float _1506 = _1102 + (-0.5);
    float _1508 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1498);
    float _1510 = fma(_1496, -2.0, _1486);
    float _1512 = float(_1442);
    float _1514 = -_1494;
    float _1516 = -_1500;
    float _1518 = fma(_1514, _1506, _1516);
    float _1520 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1508);
    float _1522 = _1426 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1524 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1510);
    float _1526 = float(_1450);
    float _1528 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1530 = _1520 >= 0.0;
    float _1532 = fma(_1522, _1512, _1454);
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1536 = _620 + 0.5;
    float _1538 = -_1524;
    float _1540 = fma(_1528, _1526, _1538);
    float _1542 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1534);
    float _1544 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1546 = fma(_1522, _1536, _1532);
    float _1548 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1404);
    float _1550 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1542);
    float _1552 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1544);
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1556 = -_1548;
    float _1558 = _1556 + 1.0;
    float _1560 = _624 + (-0.5);
    float _1562 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1552);
    float _1564 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1554);
    float _1566 = -_1550;
    float _1568 = _1566 + 1.0;
    float _1570 = -_1562;
    float _1572 = _1570 + 1.0;
    float _1574 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1564);
    float _1576 = -_1528;
    float _1578 = fma(_1576, _1560, _1540);
    float _1580 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1582 = fma(_1198, _1572, _1284);
    float _1584 = -_1574;
    float _1586 = _1584 + 1.0;
    float _1588 = -_1396;
    float _1590 = fma(_1294, _1588, _1476);
    float _1592 = _1490 * _1490;
    float _1594 = fma(_1102, _1558, _1518);
    float _1596 = -_1586;
    float _1598 = fma(_1188, _1596, _1244);
    float _1600 = fma(_1446, _1446, _1592);
    float _1602 = _524 * 2.0;
    float _1604 = fma(_1504, _1504, _1600);
    float _1606 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1610 = floor(_1602);
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1614 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1606);
    float _1616 = _1606;
    if (_1530)
    {
        _1616 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1618 = _1616;
    float _1620 = -_1568;
    float _1622 = fma(_620, _1620, _1546);
    float _1624 = _1580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1626 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1614);
    float _1628 = _1612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1630 = rsqrt(_1604);
    float _1632 = _1608 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1634 = -_1626;
    float _1636 = _1634 + 1.0;
    float _1638 = _1474 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1640 = as_type<int>(_1618);
    if (_1530)
    {
        float _1642 = _1618 * 5.0;
        _1640 = as_type<int>(_1642);
    }
    int _1644 = _1640;
    float _1646 = fma(_624, _1636, _1578);
    float _1648 = _457 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1650 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1652 = log2(_1650);
    out.m_64.x = _1624;
    out.m_64.y = _1628;
    out.m_64.z = _1632;
    out.m_64.w = _1638;
    bool _1654 = !_1462;
    int _1656 = _1654 ? 0 : 1;
    bool _1658 = !_1466;
    int _1660 = _1658 ? 0 : 1;
    out.m_66.x = _1598;
    out.m_66.y = _1582;
    out.m_66.z = _1590;
    out.m_66.w = _1594;
    bool _1662 = _1610 > 0.0;
    float _1664 = _1648 * _1630;
    if (_1530)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5830 = as_type<float>(_1644);
        out.gl_Position.z = _5830;
    }
    bool _1666 = !_1458;
    int _1668 = _1666 ? 0 : 1;
    float _1670 = _1446 * _1664;
    out.m_68.x = _1622;
    out.m_68.y = _1646;
    float _1672 = _1490 * _1664;
    float _1674 = _1672;
    if (_1530)
    {
        out.m_49.x = 0.0;
    }
    if (_1530)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1676 = -_1672;
    float _1678 = _1324 + _1676;
    bool _1680 = _1128 > 0.0;
    float _1682 = -_1670;
    float _1684 = _1334 + _1682;
    int _1686 = _1420 ? 0 : 1;
    float _1688 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1690 = _1678 + _1688;
    float _1692 = _1652 * _137;
    float _1694 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1696 = _1684 + _1694;
    int _1698 = ~_1686;
    int _1700 = _1698 + 1;
    int _1702 = _1700 + 1;
    float _1704 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1706 = _1504 * _1664;
    float _1708 = exp2(_1692);
    float _1710 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1704);
    bool _1712 = _1610 >= 0.0;
    bool _1714 = isnan(_1610);
    bool _1716 = _1712 || _1714;
    bool _1718 = isnan(0.0);
    bool _1720 = _1716 || _1718;
    float _1722 = -_1706;
    float _1724 = _1372 + _1722;
    int _1726 = _1702;
    if (!_1680)
    {
        int _1728 = ~_1686;
        int _1730 = _1728 + 1;
        _1726 = _1730;
    }
    int _1732 = _1726;
    float _1734 = -_1672;
    float _1736 = _1490 + _1734;
    float _1738 = in.m_70.x;
    float _1740 = in.m_70.y;
    float _1742 = in.m_70.z;
    int _1744 = abs(_1668);
    float _1746 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1748 = _1724 + _1746;
    bool _1750 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1752 = isnan(1.0);
    bool _1754 = _1750 || _1752;
    bool _1756 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1758 = _1754 || _1756;
    float _1760 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1762 = 1.0 + _1760;
    float _1764 = float(_1732);
    float _1766 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1710);
    float _1768 = float(_1744);
    float _1770 = 1.0 / _1762;
    int _1772 = _1216 ? 0 : 1;
    float _1774 = -_1708;
    float _1776 = _1774 + 1.0;
    bool _1778 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1780 = isnan(0.0);
    bool _1782 = _1778 || _1780;
    bool _1784 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1786 = _1782 || _1784;
    float _1788 = _1768 * _1764;
    float _1790 = -_1670;
    float _1792 = _1446 + _1790;
    float _1794 = -_1706;
    float _1796 = _1504 + _1794;
    float _1798 = _1786 ? _1776 : 0.0;
    float _1800 = _1788 * (-2.0);
    float _1802 = _1736 * _1736;
    bool _1804 = _1766 >= 0.0;
    float _1806 = fma(_1180, _1800, _1180);
    float _1808 = fma(_1792, _1792, _1802);
    int _1810 = ~_1772;
    int _1812 = _1810 + 1;
    int _1814 = _1812 + 1;
    float _1816 = fma(_1800, _1738, _1738);
    float _1818 = _522 + (-0.5);
    int _1820 = _1814;
    float _1822 = _1764;
    if (_1758)
    {
        float _1824 = _1798 * _1770;
        _139 = _1824;
    }
    float _1826 = _139;
    float _1828 = fma(_1796, _1796, _1808);
    if (!_1204)
    {
        int _1830 = ~_1772;
        int _1832 = _1830 + 1;
        _1820 = _1832;
    }
    int _1834 = _1820;
    float _1836 = fma(_1818, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1816);
    int _1838 = abs(_1656);
    if (_1804)
    {
        _1822 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1840 = _1822;
    float _1842 = fma(_1806, _1826, _1836);
    int _1844 = _1720 ? 0 : 1;
    float _1846 = sqrt(_1828);
    float _1848 = float(_1834);
    float _1850 = _1842 * 0.15915493667125701904296875;
    int _1852 = as_type<int>(_1840);
    if (_1804)
    {
        float _1854 = _1840 * 5.0;
        _1852 = as_type<int>(_1854);
    }
    int _1856 = _1852;
    float _1858 = float(_1838);
    if (_1804)
    {
        out.m_49.x = 0.0;
    }
    int _1860 = ~_1844;
    int _1862 = _1860 + 1;
    int _1864 = _1862 + 1;
    float _1866 = _1850 * 6.283185482025146484375;
    float _1868 = sin(_1866);
    int _1870 = _1864;
    if (!_1662)
    {
        int _1872 = ~_1844;
        int _1874 = _1872 + 1;
        _1870 = _1874;
    }
    int _1876 = _1870;
    if (_1804)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6135 = as_type<float>(_1856);
        out.gl_Position.z = _6135;
    }
    int _1878 = abs(_1660);
    float _1880 = _1858 * _1848;
    float _1882 = _524 + (-0.5);
    float _1884 = float(_1876);
    if (_1804)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1886 = -_1324;
    float _1888 = _1886 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1890 = _1880 * (-2.0);
    float _1892 = -_1334;
    float _1894 = _1892 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1896 = -_1372;
    float _1898 = _1896 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1900 = _1888 * _1888;
    float _1902 = fma(_1890, _1740, _1740);
    float _1904 = fma(_1194, _1890, _1194);
    float _1906 = float(_1878);
    float _1908 = fma(_1894, _1894, _1900);
    float _1910 = fma(_1882, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1902);
    float _1912 = _526 + _522;
    float _1914 = fma(_1898, _1898, _1908);
    float _1916 = fma(_1904, _1826, _1910);
    float _1918 = _1906 * _1884;
    float _1920 = _1912 + (-1.0);
    float _1922 = rsqrt(_1914);
    float _1924 = _526 + (-0.5);
    float _1926 = _1918 * (-2.0);
    float _1928 = fma(_1920, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1930 = _1916 * 0.15915493667125701904296875;
    float _1932 = _389 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1934 = fma(_1926, _1742, _1742);
    float _1936 = fma(_1928, _1926, _1928);
    float _1938 = _1850 * 6.283185482025146484375;
    float _1940 = cos(_1938);
    float _1942 = fma(_1924, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1934);
    float _1944 = fma(_1936, _1826, _1942);
    float _1946 = _1894 * _1922;
    float _1948 = _1898 * _1922;
    float _1950 = _1944 * 0.15915493667125701904296875;
    float _1952 = _1888 * _1922;
    float _1954 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1956 = _1946 * _1954;
    float _1958 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1960 = _1948 * _1958;
    float _1962 = _1930 * 6.283185482025146484375;
    float _1964 = sin(_1962);
    float _1966 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1968 = -_1956;
    float _1970 = fma(_1948, _1966, _1968);
    float _1972 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1974 = _1952 * _1972;
    float _1976 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1978 = -_1960;
    float _1980 = fma(_1952, _1976, _1978);
    float _1982 = _1970 * _1970;
    float _1984 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1986 = -_1974;
    float _1988 = fma(_1946, _1984, _1986);
    float _1990 = _1930 * 6.283185482025146484375;
    float _1992 = cos(_1990);
    float _1994 = fma(_1980, _1980, _1982);
    float _1996 = fma(_1988, _1988, _1994);
    float _1998 = _1950 * 6.283185482025146484375;
    float _2000 = sin(_1998);
    float _2002 = _1630 * _1846;
    float _2004 = _1868 * _1964;
    float _2006 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _2008 = _1940 * _1964;
    float _2010 = _2002 * _1932;
    float _2012 = _457 * _2002;
    float _2014 = _1950 * 6.283185482025146484375;
    float _2016 = cos(_2014);
    float _2018 = _1940 * _1992;
    float _2020 = _2006 * _2010;
    float _2022 = _1868 * _1992;
    float _2024 = rsqrt(_1996);
    float _2026 = fma(_2000, _2018, _2004);
    float _2028 = fma(_2000, _2004, _2018);
    float _2030 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _2032 = -_2008;
    float _2034 = fma(_2000, _2022, _2032);
    float _2036 = -_2022;
    float _2038 = fma(_2000, _2008, _2036);
    float _2040 = -_2020;
    float _2042 = _2000 * _2040;
    float _2044 = _2030 * _2012;
    float _2046 = _1940 * _2016;
    float _2048 = _1868 * _2016;
    float _2050 = _1992 * _2016;
    float _2052 = _2002 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2054 = _2052 * 0.5;
    float _2056 = _2046 * _2020;
    float _2058 = _1964 * _2016;
    float _2060 = fma(_2050, _2044, _2042);
    float _2062 = _1980 * _2024;
    float _2064 = _1988 * _2024;
    float _2066 = _1970 * _2024;
    float _2068 = fma(_2026, _2044, _2056);
    float _2070 = _1952 * _2062;
    float _2072 = _2048 * _2020;
    float _2074 = _1948 * _2066;
    float _2076 = fma(_2038, _2054, _2068);
    float _2078 = -_2070;
    float _2080 = fma(_1946, _2066, _2078);
    float _2082 = fma(_2034, _2044, _2072);
    float _2084 = fma(_2058, _2054, _2060);
    float _2086 = -_2074;
    float _2088 = fma(_1952, _2064, _2086);
    float _2090 = _2080 * _2076;
    float _2092 = fma(_2028, _2054, _2082);
    float _2094 = _1946 * _2064;
    float _2096 = _2088 * _2076;
    float _2098 = fma(_2064, _2084, _2090);
    float _2100 = -_2094;
    float _2102 = fma(_1948, _2062, _2100);
    float _2104 = fma(_2062, _2084, _2096);
    float _2106 = fma(_1948, _2092, _2098);
    float _2108 = _2102 * _2076;
    float _2110 = fma(_1946, _2092, _2104);
    float _2112 = _1372 + _2106;
    float _2114 = _1334 + _2110;
    float _2116 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2118 = _2112 + _2116;
    float _2120 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2122 = _2114 + _2120;
    float _2124 = _2118 * _2118;
    float _2126 = fma(_2122, _2122, _2124);
    float _2128 = fma(_2066, _2084, _2108);
    float _2130 = sqrt(_2126);
    float _2132 = fma(_1952, _2092, _2128);
    float _2134 = _1324 + _2132;
    bool _2136 = _2130 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2138 = _2092;
    float _2140 = _2132;
    float _2142 = _2084;
    float _2144 = _2108;
    if (!_2136)
    {
        _2138 = _2114;
    }
    float _2146 = _2138;
    float _2148 = _2146;
    if (!_2136)
    {
        _2140 = _2112;
    }
    float _2150 = _2140;
    float _2152 = _2150;
    if (!_2136)
    {
        _2142 = _2134;
    }
    float _2154 = _2142;
    bool _2156 = !_2136;
    float _2158 = _2154;
    if (!_2156)
    {
        float _2160 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2162 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2164 = _2130 + _2162;
        float _2166 = _2134 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2168 = _2164 * _2160;
        float _2170 = rsqrt(_2126);
        float _2172 = _2168 * 0.15915493667125701904296875;
        float _2174 = _2172 * 6.283185482025146484375;
        float _2176 = cos(_2174);
        float _2178 = _2172 * 6.283185482025146484375;
        float _2180 = sin(_2178);
        float _2182 = _2176 + (-1.0);
        float _2184 = _2182 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2186 = fma(_2180, _2166, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2188 = fma(_2134, _2176, _2184);
        float _2190 = _2170 * _2186;
        float _2192 = fma(_2122, _2190, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2194 = fma(_2118, _2190, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2158 = _2188;
        _2148 = _2192;
        _2152 = _2194;
        _2144 = _2186;
    }
    float _2196 = _2158;
    float _2198 = _2148;
    float _2200 = _2152;
    float _2202 = _2144;
    float _2204 = -_1324;
    float _2206 = _2204 + _2196;
    float _2208 = -_1334;
    float _2210 = _2208 + _2198;
    float _2212 = -_1372;
    float _2214 = _2212 + _2200;
    float _2216 = _2206 * _2206;
    float _2218 = fma(_2210, _2210, _2216);
    float _2220 = fma(_2214, _2214, _2218);
    float _2222 = sqrt(_2220);
    bool _2224 = _2222 > 0.0;
    bool _2226 = !_2224;
    float _2228 = _2196;
    float _2230 = _2198;
    float _2232 = _2200;
    float _2234 = _2214;
    float _2236 = _2202;
    float _2238 = _2220;
    if (!_2226)
    {
        float _2240 = _199 * _199;
        float _2242 = fma(_197, _197, _2240);
        float _2244 = fma(_201, _201, _2242);
        float _2246 = rsqrt(_2220);
        float _2248 = sqrt(_2244);
        float _2250 = _2210 * _2246;
        float _2252 = _2206 * _2246;
        float _2254 = _2214 * _2246;
        bool _2256 = _2248 > 0.0;
        bool _2258 = !_2256;
        _2236 = _2248;
        if (!_2258)
        {
            float _2260 = rsqrt(_2244);
            float _2262 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2264 = _199 * _2260;
            float _2266 = _197 * _2260;
            float _2268 = _201 * _2260;
            float _2270 = _2252 * _2264;
            float _2272 = fma(_2250, _2266, _2270);
            float _2274 = _2262 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2276 = fma(_2254, _2268, _2272);
            float _2278 = _2276 * _2274;
            float _2280 = fma(_197, _2278, _2198);
            float _2282 = fma(_199, _2278, _2196);
            float _2284 = fma(_201, _2278, _2200);
            _2228 = _2282;
            _2230 = _2280;
            _2232 = _2284;
            _2234 = _2270;
            _2236 = _2274;
            _2238 = _2272;
        }
    }
    float _2286 = _2228;
    float _2288 = _2230;
    float _2290 = _2232;
    float _2292 = _2234;
    float _2294 = _2236;
    float _2296 = _2238;
    float _2298 = -_1672;
    float _2300 = _2298 + _2286;
    float _2302 = -_1670;
    float _2304 = _2302 + _2288;
    float _2306 = -_1706;
    float _2308 = _2306 + _2290;
    float _2310 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2312 = _2300 + _2310;
    float _2314 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2316 = _2304 + _2314;
    float _2318 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2320 = _2308 + _2318;
    float _2322 = _2312 * _2312;
    float _2324 = fma(_2316, _2316, _2322);
    float _2326 = fma(_2320, _2320, _2324);
    float _2328 = rsqrt(_2326);
    float _2330 = sqrt(_2326);
    float _2332 = _2328 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2334 = _2316 * _2332;
    float _2336 = _2320 * _2332;
    float _2338 = _2334 * _2334;
    float _2340 = _2336 * _2336;
    float _2342 = _2338 + _2340;
    float _2344 = sqrt(_2342);
    bool _2346 = _2344 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2348 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2350 = _2344 + _2348;
    float _2352 = _2320;
    float _2354 = _2342;
    float _2356 = _2350;
    float _2358 = _2292;
    float _2360 = _2312;
    float _2362 = _2296;
    if (_2346)
    {
        float _2364 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2352 = _2364;
    }
    float _2366 = _2352;
    if (_2346)
    {
        float _2368 = rsqrt(_2342);
        _2354 = _2368;
    }
    float _2370 = _2354;
    float _2372 = _2370;
    if (_2346)
    {
        float _2374 = _2350 * _2366;
        _2356 = _2374;
    }
    float _2376 = _2356;
    if (_2346)
    {
        float _2378 = _2376 * 0.15915493667125701904296875;
        _2358 = _2378;
    }
    float _2380 = _2358;
    float _2382 = _2366;
    float _2384 = _2380;
    if (_2346)
    {
        float _2386 = _2380 * 6.283185482025146484375;
        float _2388 = sin(_2386);
        _2382 = _2388;
    }
    float _2390 = _2382;
    float _2392 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2394 = precise::max(0.0, _2392);
    float _2396 = _2294;
    float _2398 = _2394;
    if (_2346)
    {
        float _2400 = _2380 * 6.283185482025146484375;
        float _2402 = cos(_2400);
        _2396 = _2402;
    }
    float _2404 = _2396;
    float _2406 = -_2332;
    float _2408 = -_2394;
    float _2410 = fma(_2312, _2406, _2408);
    if (!_2346)
    {
        _2360 = _2336;
    }
    float _2412 = _2360;
    float _2414 = _2412;
    if (_2346)
    {
        float _2416 = _2410 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2398 = _2416;
    }
    float _2418 = _2398;
    float _2420 = _2390;
    float _2422 = _2418;
    if (_2346)
    {
        float _2424 = fma(_2390, _2418, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2362 = _2424;
    }
    float _2426 = _2362;
    float _2428 = _2426;
    if (!_2346)
    {
        _2420 = _2334;
    }
    float _2430 = _2420;
    float _2432 = fma(_1684, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2434 = _2430;
    float _2436 = _2404;
    if (_2346)
    {
        float _2438 = _2404 + (-1.0);
        _2422 = _2438;
    }
    float _2440 = _2422;
    if (_2346)
    {
        float _2442 = _2370 * _2426;
        _1674 = _2442;
    }
    float _2444 = _1674;
    if (!_2346)
    {
        _2428 = _2410;
    }
    float _2446 = _2428;
    float _2448 = floor(_2432);
    float _2450 = _2446;
    if (_2346)
    {
        float _2452 = _2440 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2384 = _2452;
    }
    float _2454 = _2384;
    if (_2346)
    {
        float _2456 = _2334 * _2444;
        _2434 = _2456;
    }
    float _2458 = _2434;
    if (!_2346)
    {
        _2372 = _2338;
    }
    float _2460 = _2372;
    float _2462 = _2460;
    if (_2346)
    {
        float _2464 = _2336 * _2444;
        _2414 = _2464;
    }
    float _2466 = _2414;
    if (_2346)
    {
        float _2468 = fma(_2410, _2404, _2454);
        _2450 = _2468;
    }
    float _2470 = _2450;
    if (_2346)
    {
        float _2472 = _2458 * _2458;
        _2462 = _2472;
    }
    float _2474 = _2462;
    if (!_2346)
    {
        _2436 = _2340;
    }
    float _2476 = _2436;
    float _2478 = _2476;
    if (_2346)
    {
        float _2480 = _2466 * _2466;
        _2478 = _2480;
    }
    float _2482 = _2478;
    float _2484 = _2300 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2486 = fma(_2470, _2470, _2474);
    float _2488 = _2300 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2490 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2484);
    float _2492 = _2486 + _2482;
    float _2494 = _2300 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2496 = _2300 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2498 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2490);
    float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2502 = fma(_2330, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2500);
    float _2504 = precise::clamp(_2502, 0.0, 1.0);
    float _2506 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2494);
    float _2508 = rsqrt(_2492);
    float _2510 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2488);
    float _2512 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2496);
    float _2514 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2506);
    float _2516 = _2498 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2518 = -_2504;
    float _2520 = _2518 + 1.0;
    float _2522 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2510);
    float _2524 = _2514 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2526 = _2516 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2528 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2512);
    float _2530 = _2522 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2532 = abs(_2520);
    float _2534 = log2(_2532);
    float _2536 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2526);
    float _2538 = _2528 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2540 = _2530 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2542 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2536);
    float _2544 = _2508 * _2458;
    float _2546 = fma(_1724, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2548 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2542);
    float _2550 = _2508 * _2470;
    float _2552 = _2544 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2554 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2556 = _2508 * _2466;
    float _2558 = floor(_2546);
    float _2560 = -_2552;
    float _2562 = fma(_2550, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2560);
    float _2564 = _2534 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2566 = -_2540;
    float _2568 = fma(_2566, _2554, 1.0);
    float _2570 = -_2448;
    float _2572 = _2432 + _2570;
    float _2574 = -_2556;
    float _2576 = fma(_2574, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2562);
    float _2578 = _2516 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2580 = _2516 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2582 = exp2(_2564);
    float _2584 = fma(_2576, -0.5, 0.5);
    float _2586 = fma(_2576, 0.5, 0.5);
    float _2588 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2578);
    float _2590 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2580);
    float _2592 = fma(_2586, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2594 = log2(_2568);
    float _2596 = -_2558;
    float _2598 = _2546 + _2596;
    float _2600 = _2550 + 1.0;
    float _2602 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2588);
    float _2604 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2590);
    float _2606 = fma(_2586, _2592, -0.212114393711090087890625);
    float _2608 = 1.0 / _2548;
    float _2610 = -_2550;
    float _2612 = fma(_2582, _2600, _2610);
    float _2614 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2602);
    float _2616 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2604);
    float _2618 = fma(_2586, _2606, 1.570728778839111328125);
    float _2620 = fma(_2612, 0.5, 0.5);
    float _2622 = sqrt(_2584);
    float _2624 = _2594 * 0.693147182464599609375;
    float _2626 = _2624 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2628 = _2614 * _2608;
    float _2630 = _2616 * _2608;
    float _2632 = fma(_2628, 0.5, 0.5);
    float _2634 = fma(_2630, -0.5, 0.5);
    float _2636 = _2622 * 0.636619746685028076171875;
    float2 _7333 = float2(_2572, _2598);
    float _2638 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7333, float2(0.0), isnan(_7333)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7333, float2(0.0), isnan(_7333)), level(0.0)).x;
    float3 _7344 = float3(_2632, _2634, _2626);
    float _2640 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7344, float3(0.0), isnan(_7344)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7344, float3(0.0), isnan(_7344)), level(0.0)).x;
    float _2642 = -_2618;
    float _2644 = fma(_2636, _2642, 1.0);
    float3 _7360 = float3(_2632, _2634, _2626);
    float4 _2647 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7360, float3(0.0), isnan(_7360)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7360, float3(0.0), isnan(_7360)), level(0.0)).xyzw;
    float _2649 = _2647.x;
    float _2651 = _2647.y;
    float _2653 = _2647.z;
    float _2655 = _2647.w;
    float2 _7376 = float2(_2644, _2620);
    float3 _2659 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7376, float2(0.0), isnan(_7376)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7376, float2(0.0), isnan(_7376)), level(0.0)).xyz;
    float _2661 = _2659.x;
    float _2663 = _2659.y;
    float _2665 = _2659.z;
    float _2667 = _1678 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2669 = _1678 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2671 = _2038 * _2102;
    float _2673 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2675 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2667);
    float _2677 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2669);
    float _2679 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2675);
    float _2681 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2677);
    bool _2683 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2685 = isnan(0.5);
    bool _2687 = _2683 || _2685;
    bool _2689 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2691 = _2687 || _2689;
    float _2693 = _2679 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2695 = _2681 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2697 = _2046 * _2102;
    float _2699 = _2046 * _2080;
    float _2701 = 1.0 / _2693;
    float _2703 = _2695 + _2693;
    float _2705 = _2703 * _2701;
    float _2707 = _2705 * 0.5;
    float _2709 = _2038 * _2088;
    float _2711 = _2038 * _2080;
    float _2713 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2715 = fma(_2707, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2713);
    float _2717 = fma(_2058, _2062, _2709);
    float _2719 = 1.0 / _2715;
    float _2721 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2723 = _2719 * _2721;
    float _2725 = _2026 * _2088;
    float _2727 = abs(_2723);
    float _2729 = log2(_2727);
    float _2731 = _2729 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2733 = exp2(_2731);
    float _2735 = fma(_2733, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2737 = precise::clamp(_2735, 0.0, 1.0);
    float _2739 = _2026 * _2102;
    float _2741 = -_2000;
    float _2743 = fma(_2741, _2066, _2697);
    float _2745 = _2026 * _2080;
    float _2747 = fma(_2737, -2.0, 3.0);
    float _2749 = _2737 * _2737;
    float _2751 = fma(_2048, _1952, _2743);
    float _2753 = fma(_2050, _2066, _2739);
    float _2755 = fma(_2050, _2064, _2745);
    float _2757 = _2749 * _2747;
    float _2759 = _2046 * _2088;
    float _2761 = -_2000;
    float _2763 = fma(_2761, _2064, _2699);
    float _2765 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2767 = fma(_2058, _2064, _2711);
    float _2769 = -_2000;
    float _2771 = fma(_2769, _2062, _2759);
    float _2773 = fma(_2050, _2062, _2725);
    float _2775 = -_2757;
    float _2777 = _2775 + 1.0;
    float _2779 = in.m_72.x;
    float _2781 = fma(_2048, _1946, _2771);
    float _2783 = fma(_2048, _1948, _2763);
    float _2785 = fma(_2777, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2757);
    float _2787 = _2516 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2789 = fma(_2058, _2066, _2671);
    float _2791 = _2534 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2793 = fma(_2034, _1952, _2753);
    float _2795 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2787);
    float _2797 = fma(_2034, _1946, _2773);
    float _2799 = _2673 * _2781;
    float _2801 = _2673 * _2751;
    float _2803 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2795);
    float _2805 = exp2(_2791);
    float _2807 = fma(_2034, _1948, _2755);
    float _2809 = _2673 * _2783;
    float _2811 = fma(_2028, _1952, _2789);
    float _2813 = fma(_2028, _1946, _2717);
    float _2815 = fma(_2028, _1948, _2767);
    float _2817 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2803);
    float _2819 = fma(_2765, _2797, _2799);
    float _2821 = fma(_2765, _2793, _2801);
    float _2823 = fma(_2765, _2807, _2809);
    bool _2825 = _2723 <= 8000.0;
    bool _2827 = isnan(_2723);
    bool _2829 = _2825 || _2827;
    bool _2831 = isnan(8000.0);
    bool _2833 = _2829 || _2831;
    float _2835 = float(_2833);
    float _2837 = _2548 * 0.5;
    float _2839 = _2817 + _2548;
    float _2841 = _2614 + _2548;
    float _2843 = _2803;
    float _2845 = _2837;
    if (_2691)
    {
        _2843 = 1.0;
    }
    float _2847 = _2843;
    float _2849 = fma(_2616, -0.5, _2837);
    float _2851 = _2835 * _2785;
    float _2853 = _2839 * 0.5;
    float _2855 = _2841 * 0.5;
    float _2857 = _2847;
    if (_2691)
    {
        _2845 = 1.0;
    }
    float _2859 = _2845;
    float _2861 = _2859;
    float _2863 = _2663;
    float _2865 = _2661;
    float _2867 = _2655;
    float _2869 = _2653;
    float _2871 = _2651;
    if (!_2691)
    {
        float _2873 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2875 = _2873 * 0.15915493667125701904296875;
        float _2877 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2879 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2881 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2879;
        float _2883 = _2875 * 6.283185482025146484375;
        float _2885 = cos(_2883);
        float _2887 = _2877 * 0.15915493667125701904296875;
        float _2889 = _2875 * 6.283185482025146484375;
        float _2891 = sin(_2889);
        float _2893 = 1.0 / _2885;
        float _2895 = _2887 * 6.283185482025146484375;
        float _2897 = cos(_2895);
        float _2899 = _2891 * _2893;
        float _2901 = _2887 * 6.283185482025146484375;
        float _2903 = sin(_2901);
        float _2905 = _2897 * _2899;
        float _2907 = 1.0 / _2881;
        float _2909 = 1.0 / _2905;
        float _2911 = _2903 * _2909;
        float _2913 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2915 = fma(_2723, _2911, _2913);
        float _2917 = _2915 * _2907;
        float _2919 = precise::clamp(_2917, 0.0, 1.0);
        _2861 = _2919;
    }
    float _2921 = _2861;
    if (!_2691)
    {
        float _2923 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2925 = _2923 * 0.15915493667125701904296875;
        float _2927 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2929 = _2925 * 6.283185482025146484375;
        float _2931 = cos(_2929);
        float _2933 = _2927 * 0.15915493667125701904296875;
        float _2935 = _2925 * 6.283185482025146484375;
        float _2937 = sin(_2935);
        float _2939 = 1.0 / _2931;
        float _2941 = _2933 * 6.283185482025146484375;
        float _2943 = cos(_2941);
        float _2945 = _2937 * _2939;
        float _2947 = _2933 * 6.283185482025146484375;
        float _2949 = sin(_2947);
        float _2951 = _2943 * _2945;
        float _2953 = 1.0 / _2951;
        float _2955 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2957 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2955;
        float _2959 = 1.0 / _2957;
        float _2961 = _2949 * _2953;
        float _2963 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2965 = fma(_2723, _2961, _2963);
        float _2967 = _2965 * _2959;
        float _2969 = precise::clamp(_2967, 0.0, 1.0);
        float _2971 = -_2969;
        float _2973 = _2971 + 1.0;
        _2857 = _2973;
    }
    float _2975 = _2857;
    float _2977 = -_2805;
    float _2979 = _2977 + 1.0;
    float _2981 = _2851 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2983 = -_2638;
    float _2985 = _2983 + 1.0;
    float _2987 = _2813 + _2819;
    float _2989 = _2979 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2991 = _2985 * _2981;
    float _2993 = precise::clamp(_2991, 0.0, 1.0);
    out.gl_Position.x = _2614;
    out.gl_Position.y = _2616;
    out.gl_Position.z = _2817;
    out.gl_Position.w = _2548;
    float _2995 = _2811 + _2821;
    float _2997 = _2989 * _2640;
    float _2999 = -_2993;
    float _3001 = fma(_2999, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_74.x = _2855;
    out.m_74.y = _2849;
    out.m_74.z = _2853;
    out.m_74.w = _2548;
    float _3003 = _2815 + _2823;
    bool _3005 = _2330 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3007 = isnan(_2330);
    bool _3009 = _3005 || _3007;
    bool _3011 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3013 = _3009 || _3011;
    float _3015 = _3001 * _2779;
    out.m_76.x = _2987;
    out.m_76.y = _2995;
    out.m_76.z = _3003;
    float _3017 = _3015 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3019 = _2655 * _2997;
    float _3021 = _2665 * _2997;
    out.m_78.x = _3017;
    float _3023 = -_2989;
    float _3025 = _3023 + 1.0;
    float _3027 = fma(_2661, _3019, _2649);
    float _3029 = fma(_2663, _3019, _2651);
    float _3031 = fma(_2655, _3021, _2653);
    float _3033 = _2655 * _3025;
    float _3035 = _2921 * _2975;
    float _3037 = _3035;
    if (!_3013)
    {
        _2863 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3039 = _2863;
    float _3041 = _3039;
    float _3043 = _3039;
    if (!_3013)
    {
        _2865 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3045 = _2865;
    out.m_80.x = _3027;
    out.m_80.y = _3029;
    out.m_80.z = _3031;
    out.m_80.w = _3033;
    float _3047 = _3035 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3049 = _3045;
    float _3051 = _3045;
    if (!_3013)
    {
        _2867 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3053 = _2867;
    float _3055 = _3053;
    float _3057 = _3053;
    if (!_3013)
    {
        _2869 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3059 = _2869;
    float _3061 = _3059;
    float _3063 = _3059;
    if (!_3013)
    {
        _2871 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3065 = _2871;
    float _3067 = _3065;
    float _3069 = _3065;
    if (!_3013)
    {
        _3037 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3071 = _3037;
    bool _3073 = !_3013;
    float _3075 = _3071;
    float _3077 = _3071;
    if (!_3073)
    {
        bool _3079 = _2330 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3081 = isnan(_2330);
        bool _3083 = _3079 || _3081;
        bool _3085 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3087 = _3083 || _3085;
        if (!_3087)
        {
            float _3089 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3091 = _2330 + _3089;
            float _3093 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3095 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3093;
            float _3097 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3099 = _3097 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3101 = 1.0 / _3095;
            float _3103 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3105 = _3103 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3107 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3109 = _3107 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3111 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3113 = _3111 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3115 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3117 = _3115 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3119 = _3091 * _3101;
            float _3121 = precise::clamp(_3119, 0.0, 1.0);
            float _3123 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3125 = _3123 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3127 = fma(_3121, _3099, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3129 = fma(_3121, _3125, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3131 = fma(_3121, _3105, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3133 = fma(_3121, _3109, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3135 = fma(_3121, _3113, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3137 = fma(_3121, _3117, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3051 = _3129;
            _3069 = _3135;
            _3043 = _3127;
            _3063 = _3133;
            _3057 = _3131;
            _3077 = _3137;
            _3139 = true;
        }
        else
        {
            bool _3141 = _2330 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3143 = isnan(_2330);
            bool _3145 = _3141 || _3143;
            bool _3147 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3149 = _3145 || _3147;
            if (!_3149)
            {
                _3041 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3151 = _3041;
            _3043 = _3151;
            if (!_3149)
            {
                _3049 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3153 = _3049;
            _3051 = _3153;
            if (!_3149)
            {
                _3055 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3155 = _3055;
            _3057 = _3155;
            if (!_3149)
            {
                _3061 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3157 = _3061;
            _3063 = _3157;
            if (!_3149)
            {
                _3067 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3159 = _3067;
            _3069 = _3159;
            if (!_3149)
            {
                _3075 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3161 = _3075;
            bool _3163 = !_3149;
            _3077 = _3161;
            if (!_3163)
            {
                bool _3165 = _2330 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3167 = isnan(_2330);
                bool _3169 = _3165 || _3167;
                bool _3171 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3173 = _3169 || _3171;
                if (!_3173)
                {
                    float _3175 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3177 = _2330 + _3175;
                    float _3179 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3181 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3179;
                    float _3183 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3185 = _3183 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3187 = 1.0 / _3181;
                    float _3189 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3191 = _3189 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3193 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3195 = _3193 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3197 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3199 = _3197 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3201 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3203 = _3201 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3205 = _3177 * _3187;
                    float _3207 = precise::clamp(_3205, 0.0, 1.0);
                    float _3209 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3211 = _3209 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3213 = fma(_3207, _3185, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3215 = fma(_3207, _3211, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3217 = fma(_3207, _3191, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3219 = fma(_3207, _3195, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3221 = fma(_3207, _3199, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3223 = fma(_3207, _3203, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3051 = _3215;
                    _3069 = _3221;
                    _3043 = _3213;
                    _3063 = _3219;
                    _3057 = _3217;
                    _3077 = _3223;
                    _3139 = true;
                }
                else
                {
                    _3051 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3069 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3043 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3063 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3057 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3077 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3139 = false;
    float _3225 = _3051;
    float _3227 = _3069;
    float _3229 = _3043;
    float _3231 = _3063;
    float _3233 = _3057;
    float _3235 = _3077;
    float _3237 = fma(_2995, -0.5, 0.5);
    float _3239 = precise::clamp(_3237, 0.0, 1.0);
    float _3241 = -_3225;
    float _3243 = _3241 + _3227;
    float _3245 = -_3229;
    float _3247 = _3245 + _3231;
    out.m_82.x = 0.0;
    float _3249 = -_3233;
    float _3251 = _3249 + _3235;
    float _3253 = fma(_3239, _3243, _3225);
    float _3255 = fma(_3239, _3247, _3229);
    bool _3257 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3259 = _3253 * 0.586610972881317138671875;
    float _3261 = fma(_3239, _3251, _3233);
    float _3263 = _3047 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3265 = fma(_3255, 0.298911988735198974609375, _3259);
    bool _3267 = _2921 > 0.0;
    bool _3269 = isnan(_2921);
    bool _3271 = _3267 || _3269;
    bool _3273 = isnan(0.0);
    bool _3275 = _3271 || _3273;
    float _3277 = fma(_3261, 0.114477999508380889892578125, _3265);
    out.m_49.x = _3263;
    bool _3279 = _2975 <= 0.0;
    bool _3281 = !_3275;
    bool _3283 = _3279 || _3281;
    float _3285 = -_3277;
    float _3287 = _3255 + _3285;
    float _3289 = -_3277;
    float _3291 = _3261 + _3289;
    float _3293 = fma(_3287, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3277);
    float _3295 = -_3277;
    float _3297 = _3253 + _3295;
    float _3299 = fma(_3297, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3277);
    float _3301 = fma(_3291, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3277);
    bool _3303 = !_3257;
    if (!_3303)
    {
        float _3305 = -_2300;
        float _3307 = _3305 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3309 = -_2304;
        float _3311 = _3309 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3313 = -_2308;
        float _3315 = _3313 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3317 = _3307 * _3307;
        float _3319 = fma(_3311, _3311, _3317);
        float _3321 = fma(_3315, _3315, _3319);
        float _3323 = sqrt(_3321);
        float _3325 = rsqrt(_3321);
        float _3327 = -_3323;
        float _3329 = _3327 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3331 = _3329 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3333 = precise::clamp(_3331, 0.0, 1.0);
        float _3335 = _3311 * _3325;
        float _3337 = _3307 * _3325;
        float _3339 = abs(_3333);
        float _3341 = log2(_3339);
        float _3343 = _3315 * _3325;
        float _3345 = _3335 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3347 = _2995 * _3337;
        float _3349 = -_3337;
        float _3351 = -_3345;
        float _3353 = fma(_3349, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3351);
        float _3355 = fma(_2987, _3335, _3347);
        float _3357 = -_3343;
        float _3359 = fma(_3357, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3353);
        float _3361 = fma(_3003, _3343, _3355);
        float _3363 = precise::clamp(_3361, 0.0, 1.0);
        float _3365 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3367 = _3359 + _3365;
        float _3369 = _3341 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3371 = _3367 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3373 = precise::clamp(_3371, 0.0, 1.0);
        float _3375 = exp2(_3369);
        float _3377 = _3375 * _3373;
        float _3379 = _3363 * _3377;
        float _3381 = _3379 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3383 = _3379 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3385 = _3379 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _3381;
        out.m_82.y = _3383;
        out.m_82.z = _3385;
    }
    out.m_84.x = _3293;
    out.m_84.y = _3299;
    out.m_84.z = _3301;
    if (!_3283)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3387 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3387;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

