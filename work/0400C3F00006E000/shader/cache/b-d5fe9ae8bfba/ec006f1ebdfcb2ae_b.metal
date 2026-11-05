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
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_64 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_72 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_70 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_62 [[user(locn7)]];
    float4 m_60 [[user(locn8)]];
    float4 m_58 [[user(locn9)]];
    float4 m_68 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_54 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _273 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_44.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _99;
    float _103 = _101;
    if (!_97)
    {
        out.m_47.x = 0.0;
    }
    int _105 = 0;
    if (!_97)
    {
        float _107 = _101 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1576 = as_type<float>(_109);
        out.gl_Position.z = _1576;
    }
    if (!_97)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = 0.0;
    if (_123)
    {
        float _131 = float(_93);
        _129 = _131;
    }
    float _133 = _129;
    bool _135 = _127 >= _133;
    bool _137 = !_123;
    bool _139 = _135 || _137;
    if (_139)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _103;
    if (_139)
    {
        out.m_47.x = 0.0;
    }
    if (_139)
    {
        float _143 = _141 * 5.0;
        _111 = as_type<int>(_143);
    }
    int _145 = _111;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1644 = as_type<float>(_145);
        out.gl_Position.z = _1644;
    }
    if (_139)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _151 = _127 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _153 = in.m_54.x;
    float _155 = _151 * _149;
    int _157 = as_type<int>(_147) & 1;
    bool _159 = _157 != 0;
    int _161 = as_type<int>(_147) & 2;
    bool _163 = _161 != 0;
    float _165 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[20].x, _155);
    bool _167 = !_163;
    float _169 = _167 ? (-0.5) : 0.5;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _173 = _171 != 0;
    int _175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _177 = _175 != 0;
    float _179 = _165 * 6.283185482025146484375;
    float _181 = floor(_165);
    float _183 = _179 * 0.15915493667125701904296875;
    bool _185 = !_159;
    float _187 = _185 ? (-0.5) : 0.5;
    int _189 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _191 = _189 != 0;
    bool _193 = !_173;
    int _195 = _193 ? 0 : 1;
    float _197 = _183 * 6.283185482025146484375;
    float _199 = cos(_197);
    bool _201 = !_191;
    int _203 = _201 ? 0 : 1;
    int _205 = abs(_195);
    int _207 = abs(_203);
    float _209 = -_181;
    float _211 = _165 + _209;
    float _213 = float(_205);
    float _215 = -_211;
    float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _221 = !_177;
    int _223 = _221 ? 0 : 1;
    float _225 = fma(_199, 0.5, 0.5);
    float _227 = abs(_217);
    float _229 = _213 * _227;
    bool _231 = _211 < 0.5;
    float _233 = float(_231);
    int _235 = abs(_223);
    float _237 = -_225;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _241 = float(_207);
    float _243 = -_233;
    float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _247 = float(_235);
    float _249 = fma(_241, _239, _229);
    float _251 = abs(_245);
    float _253 = fma(_247, _251, _249);
    bool _255 = !_219;
    float _271;
    if (!_255)
    {
        float _257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _259 = _153 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _263 = _261 * _257;
        float _265 = floor(_263);
        float _267 = -_265;
        float _269 = _263 + _267;
        _271 = _269;
        _273 = true;
    }
    else
    {
        float _275 = float(_93);
        float _277 = 1.0 / _275;
        float _279 = _127 * _277;
        _271 = _279;
    }
    _273 = false;
    float _281 = _271;
    float _283 = in.m_44.x;
    float _285 = in.m_44.y;
    float _287 = in.m_44.z;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _281 + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _281 + _293;
    bool _297 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _299 = isnan(_281);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _323 = _281 + _321;
    float _325 = 1.0 / _311;
    float _327 = -_307;
    float _329 = _327 + 1.0;
    bool _331 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _333 = isnan(_281);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = in.m_56.x;
    float _345 = in.m_56.y;
    bool _347 = _153 > 0.5;
    float _349 = in.m_54.y;
    float _351 = 1.0 / _315;
    float _353 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _355 = _285 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _357 = _285 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _359 = 1.0 / _319;
    float _361 = _285 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _363 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[5].x, _355);
    float _365 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[4].x, _357);
    float _367 = _295 * _325;
    float _369 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[6].x, _361);
    float _371 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[5].z, _363);
    bool _373 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _375 = isnan(_281);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = _291 * _351;
    float _387 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _389 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[6].z, _369);
    float _391 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[4].z, _365);
    float _393 = _371 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _395 = _387 * _153;
    float _397 = _383 * _329;
    float _399 = -_383;
    float _401 = _399 + 1.0;
    float _403 = _391 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _405 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _407 = _393 + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _409;
    float _413 = _323 * _359;
    float _415 = _353 * _153;
    float _417 = _389 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _419 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _421 = _403 + _419;
    float _423 = _407 * _407;
    float _425 = _341 * _401;
    float _427 = fma(_411, _367, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _429 = trunc(_415);
    int _431 = int(_429);
    bool _433 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _435 = isnan(_281);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _447 = _417 + _445;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _451 = _449 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _453 = -_341;
    float _455 = _453 + 1.0;
    float _457 = _427 * _425;
    float _459 = fma(_451, _385, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _461 = trunc(_395);
    int _463 = int(_461);
    float _465 = fma(_421, _421, _423);
    float _467 = -_443;
    float _469 = _467 + 1.0;
    float _471 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[143].x, _457);
    bool _473 = _349 > 0.5;
    float _475 = fma(_447, _447, _465);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _477;
    float _481 = _307 * _469;
    float _483 = fma(_459, _397, _471);
    float _485 = rsqrt(_475);
    float _487 = fma(_479, _413, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _489 = _431 << 4;
    int _491 = _489 + 1712;
    int _493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _495 = _493 != 0;
    float _497 = fma(_487, _481, _483);
    int _499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _501 = _499 != 0;
    float _503 = sqrt(_475);
    float _505 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[146].x, _497);
    int _507 = _463 << 4;
    int _509 = _507 + 1968;
    float _511 = -_187;
    int _513 = _347 ? as_type<int>(_511) : as_type<int>(_187);
    float _515 = _505 * _343;
    float _517 = _407 * _485;
    float _519 = _253 * _515;
    float _521 = _421 * _485;
    float _523 = _447 * _485;
    float _525 = -_517;
    float _527 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[18].w, _407);
    float _529 = _519 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _531 = -_521;
    float _533 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[18].w, _421);
    float _535 = -_523;
    float _537 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[18].w, _447);
    float _539 = _503 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _541 = _529 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _543 = _527 * _527;
    float _545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _548 = uint(int(uint(_491) >> uint(2)));
    uint _550 = uint(int(uint(int(_548)) >> uint(2)));
    int _552 = int(_548) & 3;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[int(_550)][_552];
    int _556 = int(_548) + 1;
    uint _558 = uint(int(uint(_556) >> uint(2)));
    int _560 = _556 & 3;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[int(_558)][_560];
    bool _564 = !_495;
    float _566 = _564 ? _187 : as_type<float>(_513);
    float _568 = fma(_533, _533, _543);
    float _570 = precise::min(_541, _539);
    float _572 = fma(_537, _537, _568);
    float _574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _576 = _517 * _570;
    uint _578 = uint(int(uint(_509) >> uint(2)));
    uint _580 = uint(int(uint(int(_578)) >> uint(2)));
    int _582 = int(_578) & 3;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[int(_580)][_582];
    int _586 = int(_578) + 1;
    uint _588 = uint(int(uint(_586) >> uint(2)));
    int _590 = _586 & 3;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[int(_588)][_590];
    float _594 = _521 * _570;
    float _596 = _523 * _570;
    float _598 = -_576;
    float _600 = _407 + _598;
    float _602 = _407 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _604 = -_594;
    float _606 = _421 + _604;
    float _608 = sqrt(_572);
    float _610 = _600 * _600;
    int _612 = _491 + 8;
    uint _614 = uint(int(uint(_612) >> uint(2)));
    uint _616 = uint(int(uint(int(_614)) >> uint(2)));
    int _618 = int(_614) & 3;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[int(_616)][_618];
    float _622 = fma(_421, (*spvDescriptorSet0.vp_c8)._m0[28].x, _602);
    out.m_58.w = _570;
    float _624 = fma(_606, _606, _610);
    float _626 = -_596;
    float _628 = _447 + _626;
    float _630 = fma(_447, (*spvDescriptorSet0.vp_c8)._m0[28].z, _622);
    float _632 = -_169;
    int _634 = _473 ? as_type<int>(_632) : as_type<int>(_169);
    int _636 = _509 + 8;
    uint _638 = uint(int(uint(_636) >> uint(2)));
    uint _640 = uint(int(uint(int(_638)) >> uint(2)));
    int _642 = int(_638) & 3;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[int(_640)][_642];
    float _646 = fma(_628, _628, _624);
    bool _648 = !_501;
    float _650 = _648 ? _169 : as_type<float>(_634);
    bool _652 = _630 >= 0.0;
    float _654 = _566 + 0.5;
    float _656 = _485 * _608;
    float _658 = sqrt(_646);
    float _660 = -_650;
    float _662 = _660 + 0.5;
    float _664 = _654 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _666 = _662 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _668 = _664 * _574;
    float _670 = _666 * _545;
    float _672 = _670;
    if (_652)
    {
        out.m_47.x = 0.0;
    }
    out.m_60.x = _668;
    out.m_60.y = _670;
    float _674 = _485 * _658;
    float _676 = _554 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _678 = _562 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _680 = _674 * _656;
    float _682 = _676 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _684 = _678 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _686 = _529 * _680;
    float _688 = _584 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _690 = _592 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _692 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _686;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _696 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = _620 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _702 = _698 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _704 = _644 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _706 = _644;
    float _708 = _694;
    if (_652)
    {
        _706 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _710 = _706;
    out.m_64.x = _682;
    out.m_64.y = _684;
    out.m_64.z = _702;
    out.m_64.w = _700;
    float _712 = _704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _714 = as_type<int>(_710);
    if (_652)
    {
        float _716 = _710 * 5.0;
        _714 = as_type<int>(_716);
    }
    int _718 = _714;
    out.m_66.x = _692;
    out.m_66.y = _696;
    out.m_66.z = _712;
    out.m_66.w = _694;
    if (_652)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2586 = as_type<float>(_718);
        out.gl_Position.z = _2586;
    }
    if (_652)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _720 = -_517;
    float _722 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[18].w, _393);
    float _724 = -_521;
    float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[18].w, _403);
    float _728 = -_523;
    float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[18].w, _417);
    float _732 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _734 = _722 + _732;
    float _736 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _738 = _726 + _736;
    float _740 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _742 = _730 + _740;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _744;
    float _748 = _734 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _750 = fma(_746, _367, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _752 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[28].x, _748);
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _758 = _750 * _425;
    float _760 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[28].z, _752);
    float _762 = fma(_756, _385, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _764;
    float _768 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[143].y, _758);
    bool _770 = _760 >= 0.0;
    float _772 = fma(_766, _413, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _774 = fma(_762, _397, _768);
    float _776 = fma(_772, _481, _774);
    float _778 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[146].y, _776);
    float _780 = _760;
    if (_770)
    {
        _780 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _782 = _780;
    float _784 = _778 * _345;
    int _786 = as_type<int>(_782);
    if (_770)
    {
        out.m_47.x = 0.0;
    }
    if (_770)
    {
        float _788 = _782 * 5.0;
        _786 = as_type<int>(_788);
    }
    int _790 = _786;
    float _792 = _253 * _784;
    if (_770)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2736 = as_type<float>(_790);
        out.gl_Position.z = _2736;
    }
    if (_770)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _794 = _792 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _796 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _169);
    float _798 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _800 = _794 * _680;
    float _802 = _680 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _804 = _802 * 0.5;
    float _806 = _686 * _798;
    bool _808 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _810 = isnan(0.5);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _816 = _812 || _814;
    float _818 = _800 * _796;
    float _820 = -_594;
    float _822 = _403 + _820;
    float _824 = _818 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _826 = _818 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _828 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[26].x, _824);
    float _830 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[24].x, _826);
    float _832 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[26].z, _828);
    float _834 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[24].z, _830);
    float _836 = _832 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _838 = _834 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _840 = _417 + _836;
    float _842 = _403 + _838;
    float _844 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _846 = _840 + _844;
    float _848 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _850 = _842 + _848;
    float _852 = _846 * _846;
    float _854 = fma(_850, _850, _852);
    float _856 = _818 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _858 = sqrt(_854);
    float _860 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[25].x, _856);
    float _862 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[25].z, _860);
    float _864 = _862 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _866 = _393 + _864;
    bool _868 = _858 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _870 = _842;
    float _872 = _840;
    float _874 = _818;
    if (!_868)
    {
        _708 = _866;
    }
    float _876 = _708;
    bool _878 = !_868;
    float _880 = _876;
    if (!_878)
    {
        float _882 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _884 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _886 = _858 + _884;
        float _888 = rsqrt(_854);
        float _890 = _886 * _882;
        float _892 = _866 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _894 = _890 * 0.15915493667125701904296875;
        float _896 = _894 * 6.283185482025146484375;
        float _898 = sin(_896);
        float _900 = _894 * 6.283185482025146484375;
        float _902 = cos(_900);
        float _904 = fma(_898, _892, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _906 = _888 * _904;
        float _908 = _902 + (-1.0);
        float _910 = fma(_850, _906, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _912 = fma(_846, _906, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _914 = _908 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _916 = fma(_866, _902, _914);
        _880 = _916;
        _870 = _910;
        _872 = _912;
    }
    float _918 = _880;
    float _920 = _870;
    float _922 = _872;
    float _924 = -_576;
    float _926 = _924 + _918;
    float _928 = -_594;
    float _930 = _928 + _920;
    float _932 = -_596;
    float _934 = _417 + _932;
    float _936 = -_596;
    float _938 = _936 + _922;
    float _940 = -_517;
    float _942 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[18].w, _926);
    float _944 = -_576;
    float _946 = _393 + _944;
    float _948 = -_521;
    float _950 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[18].w, _822);
    float _952 = -_521;
    float _954 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[18].w, _930);
    float _956 = -_523;
    float _958 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[18].w, _934);
    float _960 = -_523;
    float _962 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[18].w, _938);
    float _964 = -_517;
    float _966 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[18].w, _946);
    float _968 = _934;
    float _970 = _954;
    float _972 = _962;
    if (_816)
    {
        _968 = _942;
    }
    float _974 = _968;
    float _976 = _974;
    if (!_816)
    {
        float _978 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _980 = _966 + _978;
        float _982 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _984 = _950 + _982;
        float _986 = -_417;
        float _988 = _986 + _922;
        float _990 = _980 * _980;
        float _992 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _994 = _958 + _992;
        float _996 = fma(_984, _984, _990);
        float _998 = 1.0 / _656;
        float _1000 = fma(_994, _994, _996);
        float _1002 = sqrt(_1000);
        float _1004 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1006 = precise::min(_1002, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1008 = _1006 * _1004;
        float _1010 = -_403;
        float _1012 = _1010 + _920;
        float _1014 = -_393;
        float _1016 = _1014 + _918;
        float _1018 = _1008 * _998;
        float _1020 = fma(_1012, _1018, _950);
        float _1022 = fma(_1016, _1018, _966);
        float _1024 = fma(_988, _1018, _958);
        _976 = _1022;
        _970 = _1020;
        _972 = _1024;
    }
    float _1026 = _976;
    float _1028 = _970;
    float _1030 = _972;
    float _1032 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1034 = _1026 + _1032;
    float _1036 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1038 = _1028 + _1036;
    float _1040 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1042 = _1030 + _1040;
    float _1044 = _1034 * _1034;
    float _1046 = fma(_1038, _1038, _1044);
    float _1048 = fma(_1042, _1042, _1046);
    float _1050 = rsqrt(_1048);
    float _1052 = _1050 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1054 = _1038 * _1052;
    float _1056 = _1042 * _1052;
    float _1058 = _1054 * _1054;
    float _1060 = _1056 * _1056;
    float _1062 = _1058 + _1060;
    float _1064 = sqrt(_1062);
    bool _1066 = _1064 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1068 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1070 = _1064 + _1068;
    float _1072 = _1042;
    float _1074 = _1062;
    float _1076 = _1070;
    float _1078 = _1054;
    if (_1066)
    {
        float _1080 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1072 = _1080;
    }
    float _1082 = _1072;
    if (_1066)
    {
        float _1084 = rsqrt(_1062);
        _1074 = _1084;
    }
    float _1086 = _1074;
    float _1088 = _1086;
    if (_1066)
    {
        float _1090 = _1070 * _1082;
        _1076 = _1090;
    }
    float _1092 = _1076;
    if (_1066)
    {
        float _1094 = _1092 * 0.15915493667125701904296875;
        _672 = _1094;
    }
    float _1096 = _672;
    float _1098 = _1050;
    if (_1066)
    {
        float _1100 = _1096 * 6.283185482025146484375;
        float _1102 = sin(_1100);
        _1098 = _1102;
    }
    float _1104 = _1098;
    float _1106 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1108 = precise::max(0.0, _1106);
    float _1110 = _668;
    float _1112 = _1108;
    float _1114 = _1106;
    if (_1066)
    {
        float _1116 = _1096 * 6.283185482025146484375;
        float _1118 = cos(_1116);
        _1110 = _1118;
    }
    float _1120 = _1110;
    float _1122 = -_1052;
    float _1124 = -_1108;
    float _1126 = fma(_1034, _1122, _1124);
    if (_1066)
    {
        float _1128 = _1126 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1112 = _1128;
    }
    float _1130 = _1112;
    float _1132 = sqrt(_1048);
    float _1134 = _1026 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1136 = _1104;
    float _1138 = _1130;
    if (_1066)
    {
        float _1140 = fma(_1104, _1130, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1136 = _1140;
    }
    float _1142 = _1136;
    float _1144 = _1142;
    if (!_1066)
    {
        _1138 = _1056;
    }
    float _1146 = _1138;
    float _1148 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1134);
    float _1150 = _1146;
    if (_1066)
    {
        float _1152 = _1120 + (-1.0);
        _1114 = _1152;
    }
    float _1154 = _1114;
    float _1156 = _1154;
    if (_1066)
    {
        float _1158 = _1086 * _1142;
        _874 = _1158;
    }
    float _1160 = _874;
    if (!_1066)
    {
        _1144 = _1126;
    }
    float _1162 = _1144;
    float _1164 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1148);
    float _1166 = _1162;
    if (_1066)
    {
        float _1168 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1156 = _1168;
    }
    float _1170 = _1156;
    float _1172 = _1170;
    if (_1066)
    {
        float _1174 = _1054 * _1160;
        _1078 = _1174;
    }
    float _1176 = _1078;
    if (!_1066)
    {
        _1088 = _1058;
    }
    float _1178 = _1088;
    float _1180 = _1178;
    if (_1066)
    {
        float _1182 = _1056 * _1160;
        _1150 = _1182;
    }
    float _1184 = _1150;
    if (_1066)
    {
        float _1186 = fma(_1126, _1120, _1170);
        _1166 = _1186;
    }
    float _1188 = _1166;
    if (_1066)
    {
        float _1190 = _1176 * _1176;
        _1180 = _1190;
    }
    float _1192 = _1180;
    if (!_1066)
    {
        _1172 = _1060;
    }
    float _1194 = _1172;
    float _1196 = _1194;
    if (_1066)
    {
        float _1198 = _1184 * _1184;
        _1196 = _1198;
    }
    float _1200 = _1196;
    float _1202 = fma(_1188, _1188, _1192);
    float _1204 = _1026 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1206 = _1164 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1208 = _1202 + _1200;
    float _1210 = _1026 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1212 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1214 = fma(_1132, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1212);
    float _1216 = precise::clamp(_1214, 0.0, 1.0);
    float _1218 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1204);
    float _1220 = rsqrt(_1208);
    float _1222 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1210);
    float _1224 = _1026 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1226 = -_1216;
    float _1228 = _1226 + 1.0;
    float _1230 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1232 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1222);
    float _1234 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1224);
    float _1236 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1238 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1234);
    float _1240 = abs(_1228);
    float _1242 = log2(_1240);
    float _1244 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1218);
    float _1246 = _1236 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1248 = _1238 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1250 = _1220 * _1176;
    float _1252 = _1220 * _1188;
    float _1254 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1256 = -_1246;
    float _1258 = fma(_1256, _1230, 1.0);
    float _1260 = _1250 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1262 = _1220 * _1184;
    float _1264 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1254);
    float _1266 = _1244 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1268 = -_1260;
    float _1270 = fma(_1252, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1268);
    float _1272 = log2(_1258);
    float _1274 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1264);
    float _1276 = _1242 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1278 = -_1262;
    float _1280 = fma(_1278, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1270);
    float _1282 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1284 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1274);
    float _1286 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1288 = fma(_1280, -0.5, 0.5);
    float _1290 = exp2(_1276);
    float _1292 = fma(_1280, 0.5, 0.5);
    float _1294 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1282);
    float _1296 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1286);
    float _1298 = _1252 + 1.0;
    float _1300 = fma(_1292, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1302 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1294);
    float _1304 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1296);
    float _1306 = 1.0 / _1284;
    float _1308 = fma(_1292, _1300, -0.212114393711090087890625);
    float _1310 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1302);
    float _1312 = _1272 * 0.693147182464599609375;
    float _1314 = fma(_1292, _1308, 1.570728778839111328125);
    float _1316 = _1312 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1318 = sqrt(_1288);
    float _1320 = -_1252;
    float _1322 = fma(_1290, _1298, _1320);
    float _1324 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1304);
    float _1326 = _1310 * _1306;
    float _1328 = _1324 * _1306;
    float _1330 = fma(_1326, 0.5, 0.5);
    float _1332 = fma(_1328, -0.5, 0.5);
    float _1334 = _1318 * 0.636619746685028076171875;
    float3 _3626 = float3(_1330, _1332, _1316);
    float _1336 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3626, float3(0.0), isnan(_3626)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3626, float3(0.0), isnan(_3626)), level(0.0)).x;
    float3 _3637 = float3(_1330, _1332, _1316);
    float4 _1339 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3637, float3(0.0), isnan(_3637)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3637, float3(0.0), isnan(_3637)), level(0.0)).xyzw;
    float _1341 = _1339.x;
    float _1343 = _1339.y;
    float _1345 = _1339.z;
    float _1347 = _1339.w;
    float _1349 = -_1314;
    float _1351 = fma(_1334, _1349, 1.0);
    float _1353 = fma(_1322, 0.5, 0.5);
    float2 _3661 = float2(_1351, _1353);
    float3 _1357 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3661, float2(0.0), isnan(_3661)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3661, float2(0.0), isnan(_3661)), level(0.0)).xyz;
    float _1359 = _1357.x;
    float _1361 = _1357.y;
    float _1363 = _1357.z;
    float _1365 = _966 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1367 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1369 = isnan(0.5);
    bool _1371 = _1367 || _1369;
    bool _1373 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1375 = _1371 || _1373;
    out.m_68.x = _950;
    out.m_68.y = _966;
    out.m_68.z = _958;
    float _1377 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1365);
    out.m_70.x = _1028;
    out.m_70.y = _1026;
    out.m_70.z = _1030;
    float _1379 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1377);
    float _1381 = _966 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1383 = _1379 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1385 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1381);
    float _1387 = _1314;
    float _1389 = _1316;
    float _1391 = _1242;
    if (!_1375)
    {
        _1387 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1393 = _1387;
    float _1395 = 1.0 / _1383;
    float _1397 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1385);
    float _1399 = _1397 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1401 = _1399 + _1383;
    float _1403 = _1393;
    if (!_1375)
    {
        _1389 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1405 = _1389;
    float _1407 = _1401 * _1395;
    float _1409 = _1407 * 0.5;
    float _1411 = _1242 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1413 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1415 = _1409;
    float _1417 = _1413;
    if (_1375)
    {
        _1391 = 1.0;
    }
    float _1419 = _1391;
    float _1421 = _1419;
    if (!_1375)
    {
        float _1423 = -_1393;
        float _1425 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1423);
        _1415 = _1425;
    }
    float _1427 = _1415;
    if (!_1375)
    {
        float _1429 = -_1405;
        float _1431 = _1429 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1403 = _1431;
    }
    float _1433 = _1403;
    float _1435 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1413);
    float _1437 = exp2(_1411);
    float _1439 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1435);
    float _1441 = _1310 + _1284;
    float _1443 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1439);
    float _1445 = _1427;
    if (!_1375)
    {
        float _1447 = 1.0 / _1427;
        _1445 = _1447;
    }
    float _1449 = _1445;
    float _1451 = _1441 * 0.5;
    out.gl_Position.x = _1310;
    out.gl_Position.y = _1324;
    out.gl_Position.z = _1443;
    out.gl_Position.w = _1284;
    float _1453 = _1383;
    if (!_1375)
    {
        float _1455 = 1.0 / _1433;
        _1453 = _1455;
    }
    float _1457 = _1453;
    float _1459 = -_1437;
    float _1461 = _1459 + 1.0;
    float _1463 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1375)
    {
        float _1465 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1467 = -_1405;
        float _1469 = fma(_1449, _1465, _1467);
        _1417 = _1469;
    }
    float _1471 = _1417;
    float _1473 = _1284 * 0.5;
    float _1475 = -_1463;
    float _1477 = _1475 + 1.0;
    if (!_1375)
    {
        float _1479 = _1471 * _1457;
        float _1481 = precise::clamp(_1479, 0.0, 1.0);
        _1421 = _1481;
    }
    float _1483 = _1421;
    float _1485 = _1443 + _1284;
    float _1487 = fma(_1324, -0.5, _1473);
    float _1489 = _1483 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1491 = _1483 > 0.0;
    bool _1493 = isnan(_1483);
    bool _1495 = _1491 || _1493;
    bool _1497 = isnan(0.0);
    bool _1499 = _1495 || _1497;
    float _1501 = _1485 * 0.5;
    float _1503 = _1489 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_72.x = _1451;
    out.m_72.y = _1487;
    out.m_72.z = _1501;
    out.m_72.w = _1284;
    out.m_47.x = _1503;
    float _1505 = _1463 * _1336;
    float _1507 = _1347 * _1477;
    float _1509 = _1347 * _1505;
    float _1511 = _1363 * _1505;
    float _1513 = fma(_1359, _1509, _1341);
    float _1515 = fma(_1361, _1509, _1343);
    float _1517 = fma(_1347, _1511, _1345);
    out.m_74.x = _1513;
    out.m_74.y = _1515;
    out.m_74.z = _1517;
    out.m_74.w = _1507;
    if (_1499)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1519 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1519;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _273 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_44.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _99;
    float _103 = _101;
    if (!_97)
    {
        out.m_47.x = 0.0;
    }
    int _105 = 0;
    if (!_97)
    {
        float _107 = _101 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1576 = as_type<float>(_109);
        out.gl_Position.z = _1576;
    }
    if (!_97)
    {
        return out;
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = 0.0;
    if (_123)
    {
        float _131 = float(_93);
        _129 = _131;
    }
    float _133 = _129;
    bool _135 = _127 >= _133;
    bool _137 = !_123;
    bool _139 = _135 || _137;
    if (_139)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _103;
    if (_139)
    {
        out.m_47.x = 0.0;
    }
    if (_139)
    {
        float _143 = _141 * 5.0;
        _111 = as_type<int>(_143);
    }
    int _145 = _111;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1644 = as_type<float>(_145);
        out.gl_Position.z = _1644;
    }
    if (_139)
    {
        return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _151 = _127 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _153 = in.m_54.x;
    float _155 = _151 * _149;
    int _157 = as_type<int>(_147) & 1;
    bool _159 = _157 != 0;
    int _161 = as_type<int>(_147) & 2;
    bool _163 = _161 != 0;
    float _165 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[20].x, _155);
    bool _167 = !_163;
    float _169 = _167 ? (-0.5) : 0.5;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _173 = _171 != 0;
    int _175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _177 = _175 != 0;
    float _179 = _165 * 6.283185482025146484375;
    float _181 = floor(_165);
    float _183 = _179 * 0.15915493667125701904296875;
    bool _185 = !_159;
    float _187 = _185 ? (-0.5) : 0.5;
    int _189 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _191 = _189 != 0;
    bool _193 = !_173;
    int _195 = _193 ? 0 : 1;
    float _197 = _183 * 6.283185482025146484375;
    float _199 = cos(_197);
    bool _201 = !_191;
    int _203 = _201 ? 0 : 1;
    int _205 = abs(_195);
    int _207 = abs(_203);
    float _209 = -_181;
    float _211 = _165 + _209;
    float _213 = float(_205);
    float _215 = -_211;
    float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _221 = !_177;
    int _223 = _221 ? 0 : 1;
    float _225 = fma(_199, 0.5, 0.5);
    float _227 = abs(_217);
    float _229 = _213 * _227;
    bool _231 = _211 < 0.5;
    float _233 = float(_231);
    int _235 = abs(_223);
    float _237 = -_225;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _241 = float(_207);
    float _243 = -_233;
    float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _247 = float(_235);
    float _249 = fma(_241, _239, _229);
    float _251 = abs(_245);
    float _253 = fma(_247, _251, _249);
    bool _255 = !_219;
    float _271;
    if (!_255)
    {
        float _257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _259 = _153 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _263 = _261 * _257;
        float _265 = floor(_263);
        float _267 = -_265;
        float _269 = _263 + _267;
        _271 = _269;
        _273 = true;
    }
    else
    {
        float _275 = float(_93);
        float _277 = 1.0 / _275;
        float _279 = _127 * _277;
        _271 = _279;
    }
    _273 = false;
    float _281 = _271;
    float _283 = in.m_44.x;
    float _285 = in.m_44.y;
    float _287 = in.m_44.z;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _281 + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _281 + _293;
    bool _297 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _299 = isnan(_281);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _323 = _281 + _321;
    float _325 = 1.0 / _311;
    float _327 = -_307;
    float _329 = _327 + 1.0;
    bool _331 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _333 = isnan(_281);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = in.m_56.x;
    float _345 = in.m_56.y;
    bool _347 = _153 > 0.5;
    float _349 = in.m_54.y;
    float _351 = 1.0 / _315;
    float _353 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _355 = _285 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _357 = _285 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _359 = 1.0 / _319;
    float _361 = _285 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _363 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[5].x, _355);
    float _365 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[4].x, _357);
    float _367 = _295 * _325;
    float _369 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[6].x, _361);
    float _371 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[5].z, _363);
    bool _373 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _375 = isnan(_281);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = _291 * _351;
    float _387 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _389 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[6].z, _369);
    float _391 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[4].z, _365);
    float _393 = _371 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _395 = _387 * _153;
    float _397 = _383 * _329;
    float _399 = -_383;
    float _401 = _399 + 1.0;
    float _403 = _391 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _405 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _407 = _393 + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _409;
    float _413 = _323 * _359;
    float _415 = _353 * _153;
    float _417 = _389 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _419 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _421 = _403 + _419;
    float _423 = _407 * _407;
    float _425 = _341 * _401;
    float _427 = fma(_411, _367, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _429 = trunc(_415);
    int _431 = int(_429);
    bool _433 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _435 = isnan(_281);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _447 = _417 + _445;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _451 = _449 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _453 = -_341;
    float _455 = _453 + 1.0;
    float _457 = _427 * _425;
    float _459 = fma(_451, _385, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _461 = trunc(_395);
    int _463 = int(_461);
    float _465 = fma(_421, _421, _423);
    float _467 = -_443;
    float _469 = _467 + 1.0;
    float _471 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[143].x, _457);
    bool _473 = _349 > 0.5;
    float _475 = fma(_447, _447, _465);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _477;
    float _481 = _307 * _469;
    float _483 = fma(_459, _397, _471);
    float _485 = rsqrt(_475);
    float _487 = fma(_479, _413, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _489 = _431 << 4;
    int _491 = _489 + 1712;
    int _493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _495 = _493 != 0;
    float _497 = fma(_487, _481, _483);
    int _499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _501 = _499 != 0;
    float _503 = sqrt(_475);
    float _505 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[146].x, _497);
    int _507 = _463 << 4;
    int _509 = _507 + 1968;
    float _511 = -_187;
    int _513 = _347 ? as_type<int>(_511) : as_type<int>(_187);
    float _515 = _505 * _343;
    float _517 = _407 * _485;
    float _519 = _253 * _515;
    float _521 = _421 * _485;
    float _523 = _447 * _485;
    float _525 = -_517;
    float _527 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[18].w, _407);
    float _529 = _519 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _531 = -_521;
    float _533 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[18].w, _421);
    float _535 = -_523;
    float _537 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[18].w, _447);
    float _539 = _503 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _541 = _529 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _543 = _527 * _527;
    float _545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _548 = uint(int(uint(_491) >> uint(2)));
    uint _550 = uint(int(uint(int(_548)) >> uint(2)));
    int _552 = int(_548) & 3;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[int(_550)][_552];
    int _556 = int(_548) + 1;
    uint _558 = uint(int(uint(_556) >> uint(2)));
    int _560 = _556 & 3;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[int(_558)][_560];
    bool _564 = !_495;
    float _566 = _564 ? _187 : as_type<float>(_513);
    float _568 = fma(_533, _533, _543);
    float _570 = precise::min(_541, _539);
    float _572 = fma(_537, _537, _568);
    float _574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _576 = _517 * _570;
    uint _578 = uint(int(uint(_509) >> uint(2)));
    uint _580 = uint(int(uint(int(_578)) >> uint(2)));
    int _582 = int(_578) & 3;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[int(_580)][_582];
    int _586 = int(_578) + 1;
    uint _588 = uint(int(uint(_586) >> uint(2)));
    int _590 = _586 & 3;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[int(_588)][_590];
    float _594 = _521 * _570;
    float _596 = _523 * _570;
    float _598 = -_576;
    float _600 = _407 + _598;
    float _602 = _407 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _604 = -_594;
    float _606 = _421 + _604;
    float _608 = sqrt(_572);
    float _610 = _600 * _600;
    int _612 = _491 + 8;
    uint _614 = uint(int(uint(_612) >> uint(2)));
    uint _616 = uint(int(uint(int(_614)) >> uint(2)));
    int _618 = int(_614) & 3;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[int(_616)][_618];
    float _622 = fma(_421, (*spvDescriptorSet0.vp_c8)._m0[28].x, _602);
    out.m_58.w = _570;
    float _624 = fma(_606, _606, _610);
    float _626 = -_596;
    float _628 = _447 + _626;
    float _630 = fma(_447, (*spvDescriptorSet0.vp_c8)._m0[28].z, _622);
    float _632 = -_169;
    int _634 = _473 ? as_type<int>(_632) : as_type<int>(_169);
    int _636 = _509 + 8;
    uint _638 = uint(int(uint(_636) >> uint(2)));
    uint _640 = uint(int(uint(int(_638)) >> uint(2)));
    int _642 = int(_638) & 3;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[int(_640)][_642];
    float _646 = fma(_628, _628, _624);
    bool _648 = !_501;
    float _650 = _648 ? _169 : as_type<float>(_634);
    bool _652 = _630 >= 0.0;
    float _654 = _566 + 0.5;
    float _656 = _485 * _608;
    float _658 = sqrt(_646);
    float _660 = -_650;
    float _662 = _660 + 0.5;
    float _664 = _654 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _666 = _662 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _668 = _664 * _574;
    float _670 = _666 * _545;
    float _672 = _670;
    if (_652)
    {
        out.m_47.x = 0.0;
    }
    out.m_60.x = _668;
    out.m_60.y = _670;
    float _674 = _485 * _658;
    float _676 = _554 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _678 = _562 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _680 = _674 * _656;
    float _682 = _676 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _684 = _678 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _686 = _529 * _680;
    float _688 = _584 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _690 = _592 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _692 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _686;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _696 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = _620 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _702 = _698 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _704 = _644 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _706 = _644;
    float _708 = _694;
    if (_652)
    {
        _706 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _710 = _706;
    out.m_64.x = _682;
    out.m_64.y = _684;
    out.m_64.z = _702;
    out.m_64.w = _700;
    float _712 = _704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _714 = as_type<int>(_710);
    if (_652)
    {
        float _716 = _710 * 5.0;
        _714 = as_type<int>(_716);
    }
    int _718 = _714;
    out.m_66.x = _692;
    out.m_66.y = _696;
    out.m_66.z = _712;
    out.m_66.w = _694;
    if (_652)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2586 = as_type<float>(_718);
        out.gl_Position.z = _2586;
    }
    if (_652)
    {
        return out;
    }
    float _720 = -_517;
    float _722 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[18].w, _393);
    float _724 = -_521;
    float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[18].w, _403);
    float _728 = -_523;
    float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[18].w, _417);
    float _732 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _734 = _722 + _732;
    float _736 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _738 = _726 + _736;
    float _740 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _742 = _730 + _740;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _744;
    float _748 = _734 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _750 = fma(_746, _367, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _752 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[28].x, _748);
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _758 = _750 * _425;
    float _760 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[28].z, _752);
    float _762 = fma(_756, _385, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _764;
    float _768 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[143].y, _758);
    bool _770 = _760 >= 0.0;
    float _772 = fma(_766, _413, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _774 = fma(_762, _397, _768);
    float _776 = fma(_772, _481, _774);
    float _778 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[146].y, _776);
    float _780 = _760;
    if (_770)
    {
        _780 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _782 = _780;
    float _784 = _778 * _345;
    int _786 = as_type<int>(_782);
    if (_770)
    {
        out.m_47.x = 0.0;
    }
    if (_770)
    {
        float _788 = _782 * 5.0;
        _786 = as_type<int>(_788);
    }
    int _790 = _786;
    float _792 = _253 * _784;
    if (_770)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2736 = as_type<float>(_790);
        out.gl_Position.z = _2736;
    }
    if (_770)
    {
        return out;
    }
    float _794 = _792 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _796 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _169);
    float _798 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _800 = _794 * _680;
    float _802 = _680 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _804 = _802 * 0.5;
    float _806 = _686 * _798;
    bool _808 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _810 = isnan(0.5);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _816 = _812 || _814;
    float _818 = _800 * _796;
    float _820 = -_594;
    float _822 = _403 + _820;
    float _824 = _818 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _826 = _818 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _828 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[26].x, _824);
    float _830 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[24].x, _826);
    float _832 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[26].z, _828);
    float _834 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[24].z, _830);
    float _836 = _832 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _838 = _834 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _840 = _417 + _836;
    float _842 = _403 + _838;
    float _844 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _846 = _840 + _844;
    float _848 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _850 = _842 + _848;
    float _852 = _846 * _846;
    float _854 = fma(_850, _850, _852);
    float _856 = _818 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _858 = sqrt(_854);
    float _860 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[25].x, _856);
    float _862 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[25].z, _860);
    float _864 = _862 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _866 = _393 + _864;
    bool _868 = _858 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _870 = _842;
    float _872 = _840;
    float _874 = _818;
    if (!_868)
    {
        _708 = _866;
    }
    float _876 = _708;
    bool _878 = !_868;
    float _880 = _876;
    if (!_878)
    {
        float _882 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _884 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _886 = _858 + _884;
        float _888 = rsqrt(_854);
        float _890 = _886 * _882;
        float _892 = _866 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _894 = _890 * 0.15915493667125701904296875;
        float _896 = _894 * 6.283185482025146484375;
        float _898 = sin(_896);
        float _900 = _894 * 6.283185482025146484375;
        float _902 = cos(_900);
        float _904 = fma(_898, _892, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _906 = _888 * _904;
        float _908 = _902 + (-1.0);
        float _910 = fma(_850, _906, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _912 = fma(_846, _906, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _914 = _908 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _916 = fma(_866, _902, _914);
        _880 = _916;
        _870 = _910;
        _872 = _912;
    }
    float _918 = _880;
    float _920 = _870;
    float _922 = _872;
    float _924 = -_576;
    float _926 = _924 + _918;
    float _928 = -_594;
    float _930 = _928 + _920;
    float _932 = -_596;
    float _934 = _417 + _932;
    float _936 = -_596;
    float _938 = _936 + _922;
    float _940 = -_517;
    float _942 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[18].w, _926);
    float _944 = -_576;
    float _946 = _393 + _944;
    float _948 = -_521;
    float _950 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[18].w, _822);
    float _952 = -_521;
    float _954 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[18].w, _930);
    float _956 = -_523;
    float _958 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[18].w, _934);
    float _960 = -_523;
    float _962 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[18].w, _938);
    float _964 = -_517;
    float _966 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[18].w, _946);
    float _968 = _934;
    float _970 = _954;
    float _972 = _962;
    if (_816)
    {
        _968 = _942;
    }
    float _974 = _968;
    float _976 = _974;
    if (!_816)
    {
        float _978 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _980 = _966 + _978;
        float _982 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _984 = _950 + _982;
        float _986 = -_417;
        float _988 = _986 + _922;
        float _990 = _980 * _980;
        float _992 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _994 = _958 + _992;
        float _996 = fma(_984, _984, _990);
        float _998 = 1.0 / _656;
        float _1000 = fma(_994, _994, _996);
        float _1002 = sqrt(_1000);
        float _1004 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1006 = precise::min(_1002, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1008 = _1006 * _1004;
        float _1010 = -_403;
        float _1012 = _1010 + _920;
        float _1014 = -_393;
        float _1016 = _1014 + _918;
        float _1018 = _1008 * _998;
        float _1020 = fma(_1012, _1018, _950);
        float _1022 = fma(_1016, _1018, _966);
        float _1024 = fma(_988, _1018, _958);
        _976 = _1022;
        _970 = _1020;
        _972 = _1024;
    }
    float _1026 = _976;
    float _1028 = _970;
    float _1030 = _972;
    float _1032 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1034 = _1026 + _1032;
    float _1036 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1038 = _1028 + _1036;
    float _1040 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1042 = _1030 + _1040;
    float _1044 = _1034 * _1034;
    float _1046 = fma(_1038, _1038, _1044);
    float _1048 = fma(_1042, _1042, _1046);
    float _1050 = rsqrt(_1048);
    float _1052 = _1050 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1054 = _1038 * _1052;
    float _1056 = _1042 * _1052;
    float _1058 = _1054 * _1054;
    float _1060 = _1056 * _1056;
    float _1062 = _1058 + _1060;
    float _1064 = sqrt(_1062);
    bool _1066 = _1064 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1068 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1070 = _1064 + _1068;
    float _1072 = _1042;
    float _1074 = _1062;
    float _1076 = _1070;
    float _1078 = _1054;
    if (_1066)
    {
        float _1080 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1072 = _1080;
    }
    float _1082 = _1072;
    if (_1066)
    {
        float _1084 = rsqrt(_1062);
        _1074 = _1084;
    }
    float _1086 = _1074;
    float _1088 = _1086;
    if (_1066)
    {
        float _1090 = _1070 * _1082;
        _1076 = _1090;
    }
    float _1092 = _1076;
    if (_1066)
    {
        float _1094 = _1092 * 0.15915493667125701904296875;
        _672 = _1094;
    }
    float _1096 = _672;
    float _1098 = _1050;
    if (_1066)
    {
        float _1100 = _1096 * 6.283185482025146484375;
        float _1102 = sin(_1100);
        _1098 = _1102;
    }
    float _1104 = _1098;
    float _1106 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1108 = precise::max(0.0, _1106);
    float _1110 = _668;
    float _1112 = _1108;
    float _1114 = _1106;
    if (_1066)
    {
        float _1116 = _1096 * 6.283185482025146484375;
        float _1118 = cos(_1116);
        _1110 = _1118;
    }
    float _1120 = _1110;
    float _1122 = -_1052;
    float _1124 = -_1108;
    float _1126 = fma(_1034, _1122, _1124);
    if (_1066)
    {
        float _1128 = _1126 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1112 = _1128;
    }
    float _1130 = _1112;
    float _1132 = sqrt(_1048);
    float _1134 = _1026 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1136 = _1104;
    float _1138 = _1130;
    if (_1066)
    {
        float _1140 = fma(_1104, _1130, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1136 = _1140;
    }
    float _1142 = _1136;
    float _1144 = _1142;
    if (!_1066)
    {
        _1138 = _1056;
    }
    float _1146 = _1138;
    float _1148 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1134);
    float _1150 = _1146;
    if (_1066)
    {
        float _1152 = _1120 + (-1.0);
        _1114 = _1152;
    }
    float _1154 = _1114;
    float _1156 = _1154;
    if (_1066)
    {
        float _1158 = _1086 * _1142;
        _874 = _1158;
    }
    float _1160 = _874;
    if (!_1066)
    {
        _1144 = _1126;
    }
    float _1162 = _1144;
    float _1164 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1148);
    float _1166 = _1162;
    if (_1066)
    {
        float _1168 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1156 = _1168;
    }
    float _1170 = _1156;
    float _1172 = _1170;
    if (_1066)
    {
        float _1174 = _1054 * _1160;
        _1078 = _1174;
    }
    float _1176 = _1078;
    if (!_1066)
    {
        _1088 = _1058;
    }
    float _1178 = _1088;
    float _1180 = _1178;
    if (_1066)
    {
        float _1182 = _1056 * _1160;
        _1150 = _1182;
    }
    float _1184 = _1150;
    if (_1066)
    {
        float _1186 = fma(_1126, _1120, _1170);
        _1166 = _1186;
    }
    float _1188 = _1166;
    if (_1066)
    {
        float _1190 = _1176 * _1176;
        _1180 = _1190;
    }
    float _1192 = _1180;
    if (!_1066)
    {
        _1172 = _1060;
    }
    float _1194 = _1172;
    float _1196 = _1194;
    if (_1066)
    {
        float _1198 = _1184 * _1184;
        _1196 = _1198;
    }
    float _1200 = _1196;
    float _1202 = fma(_1188, _1188, _1192);
    float _1204 = _1026 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1206 = _1164 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1208 = _1202 + _1200;
    float _1210 = _1026 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1212 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1214 = fma(_1132, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1212);
    float _1216 = precise::clamp(_1214, 0.0, 1.0);
    float _1218 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1204);
    float _1220 = rsqrt(_1208);
    float _1222 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1210);
    float _1224 = _1026 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1226 = -_1216;
    float _1228 = _1226 + 1.0;
    float _1230 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1232 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1222);
    float _1234 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1224);
    float _1236 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1238 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1234);
    float _1240 = abs(_1228);
    float _1242 = log2(_1240);
    float _1244 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1218);
    float _1246 = _1236 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1248 = _1238 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1250 = _1220 * _1176;
    float _1252 = _1220 * _1188;
    float _1254 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1256 = -_1246;
    float _1258 = fma(_1256, _1230, 1.0);
    float _1260 = _1250 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1262 = _1220 * _1184;
    float _1264 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1254);
    float _1266 = _1244 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1268 = -_1260;
    float _1270 = fma(_1252, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1268);
    float _1272 = log2(_1258);
    float _1274 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1264);
    float _1276 = _1242 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1278 = -_1262;
    float _1280 = fma(_1278, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1270);
    float _1282 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1284 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1274);
    float _1286 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1288 = fma(_1280, -0.5, 0.5);
    float _1290 = exp2(_1276);
    float _1292 = fma(_1280, 0.5, 0.5);
    float _1294 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1282);
    float _1296 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1286);
    float _1298 = _1252 + 1.0;
    float _1300 = fma(_1292, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1302 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1294);
    float _1304 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1296);
    float _1306 = 1.0 / _1284;
    float _1308 = fma(_1292, _1300, -0.212114393711090087890625);
    float _1310 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1302);
    float _1312 = _1272 * 0.693147182464599609375;
    float _1314 = fma(_1292, _1308, 1.570728778839111328125);
    float _1316 = _1312 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1318 = sqrt(_1288);
    float _1320 = -_1252;
    float _1322 = fma(_1290, _1298, _1320);
    float _1324 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1304);
    float _1326 = _1310 * _1306;
    float _1328 = _1324 * _1306;
    float _1330 = fma(_1326, 0.5, 0.5);
    float _1332 = fma(_1328, -0.5, 0.5);
    float _1334 = _1318 * 0.636619746685028076171875;
    float3 _3626 = float3(_1330, _1332, _1316);
    float _1336 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3626, float3(0.0), isnan(_3626)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3626, float3(0.0), isnan(_3626)), level(0.0)).x;
    float3 _3637 = float3(_1330, _1332, _1316);
    float4 _1339 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3637, float3(0.0), isnan(_3637)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3637, float3(0.0), isnan(_3637)), level(0.0)).xyzw;
    float _1341 = _1339.x;
    float _1343 = _1339.y;
    float _1345 = _1339.z;
    float _1347 = _1339.w;
    float _1349 = -_1314;
    float _1351 = fma(_1334, _1349, 1.0);
    float _1353 = fma(_1322, 0.5, 0.5);
    float2 _3661 = float2(_1351, _1353);
    float3 _1357 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3661, float2(0.0), isnan(_3661)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3661, float2(0.0), isnan(_3661)), level(0.0)).xyz;
    float _1359 = _1357.x;
    float _1361 = _1357.y;
    float _1363 = _1357.z;
    float _1365 = _966 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1367 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1369 = isnan(0.5);
    bool _1371 = _1367 || _1369;
    bool _1373 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1375 = _1371 || _1373;
    out.m_68.x = _950;
    out.m_68.y = _966;
    out.m_68.z = _958;
    float _1377 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1365);
    out.m_70.x = _1028;
    out.m_70.y = _1026;
    out.m_70.z = _1030;
    float _1379 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1377);
    float _1381 = _966 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1383 = _1379 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1385 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1381);
    float _1387 = _1314;
    float _1389 = _1316;
    float _1391 = _1242;
    if (!_1375)
    {
        _1387 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1393 = _1387;
    float _1395 = 1.0 / _1383;
    float _1397 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1385);
    float _1399 = _1397 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1401 = _1399 + _1383;
    float _1403 = _1393;
    if (!_1375)
    {
        _1389 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1405 = _1389;
    float _1407 = _1401 * _1395;
    float _1409 = _1407 * 0.5;
    float _1411 = _1242 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1413 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1415 = _1409;
    float _1417 = _1413;
    if (_1375)
    {
        _1391 = 1.0;
    }
    float _1419 = _1391;
    float _1421 = _1419;
    if (!_1375)
    {
        float _1423 = -_1393;
        float _1425 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1423);
        _1415 = _1425;
    }
    float _1427 = _1415;
    if (!_1375)
    {
        float _1429 = -_1405;
        float _1431 = _1429 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1403 = _1431;
    }
    float _1433 = _1403;
    float _1435 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1413);
    float _1437 = exp2(_1411);
    float _1439 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1435);
    float _1441 = _1310 + _1284;
    float _1443 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1439);
    float _1445 = _1427;
    if (!_1375)
    {
        float _1447 = 1.0 / _1427;
        _1445 = _1447;
    }
    float _1449 = _1445;
    float _1451 = _1441 * 0.5;
    out.gl_Position.x = _1310;
    out.gl_Position.y = _1324;
    out.gl_Position.z = _1443;
    out.gl_Position.w = _1284;
    float _1453 = _1383;
    if (!_1375)
    {
        float _1455 = 1.0 / _1433;
        _1453 = _1455;
    }
    float _1457 = _1453;
    float _1459 = -_1437;
    float _1461 = _1459 + 1.0;
    float _1463 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1375)
    {
        float _1465 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1467 = -_1405;
        float _1469 = fma(_1449, _1465, _1467);
        _1417 = _1469;
    }
    float _1471 = _1417;
    float _1473 = _1284 * 0.5;
    float _1475 = -_1463;
    float _1477 = _1475 + 1.0;
    if (!_1375)
    {
        float _1479 = _1471 * _1457;
        float _1481 = precise::clamp(_1479, 0.0, 1.0);
        _1421 = _1481;
    }
    float _1483 = _1421;
    float _1485 = _1443 + _1284;
    float _1487 = fma(_1324, -0.5, _1473);
    float _1489 = _1483 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1491 = _1483 > 0.0;
    bool _1493 = isnan(_1483);
    bool _1495 = _1491 || _1493;
    bool _1497 = isnan(0.0);
    bool _1499 = _1495 || _1497;
    float _1501 = _1485 * 0.5;
    float _1503 = _1489 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_72.x = _1451;
    out.m_72.y = _1487;
    out.m_72.z = _1501;
    out.m_72.w = _1284;
    out.m_47.x = _1503;
    float _1505 = _1463 * _1336;
    float _1507 = _1347 * _1477;
    float _1509 = _1347 * _1505;
    float _1511 = _1363 * _1505;
    float _1513 = fma(_1359, _1509, _1341);
    float _1515 = fma(_1361, _1509, _1343);
    float _1517 = fma(_1347, _1511, _1345);
    out.m_74.x = _1513;
    out.m_74.y = _1515;
    out.m_74.z = _1517;
    out.m_74.w = _1507;
    if (_1499)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1519 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1519;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _273 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_44.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _99;
    float _103 = _101;
    if (!_97)
    {
        out.m_47.x = 0.0;
    }
    int _105 = 0;
    if (!_97)
    {
        float _107 = _101 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1576 = as_type<float>(_109);
        out.gl_Position.z = _1576;
    }
    if (!_97)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = 0.0;
    if (_123)
    {
        float _131 = float(_93);
        _129 = _131;
    }
    float _133 = _129;
    bool _135 = _127 >= _133;
    bool _137 = !_123;
    bool _139 = _135 || _137;
    if (_139)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _103;
    if (_139)
    {
        out.m_47.x = 0.0;
    }
    if (_139)
    {
        float _143 = _141 * 5.0;
        _111 = as_type<int>(_143);
    }
    int _145 = _111;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1644 = as_type<float>(_145);
        out.gl_Position.z = _1644;
    }
    if (_139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _151 = _127 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _153 = in.m_54.x;
    float _155 = _151 * _149;
    int _157 = as_type<int>(_147) & 1;
    bool _159 = _157 != 0;
    int _161 = as_type<int>(_147) & 2;
    bool _163 = _161 != 0;
    float _165 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[20].x, _155);
    bool _167 = !_163;
    float _169 = _167 ? (-0.5) : 0.5;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _173 = _171 != 0;
    int _175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _177 = _175 != 0;
    float _179 = _165 * 6.283185482025146484375;
    float _181 = floor(_165);
    float _183 = _179 * 0.15915493667125701904296875;
    bool _185 = !_159;
    float _187 = _185 ? (-0.5) : 0.5;
    int _189 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _191 = _189 != 0;
    bool _193 = !_173;
    int _195 = _193 ? 0 : 1;
    float _197 = _183 * 6.283185482025146484375;
    float _199 = cos(_197);
    bool _201 = !_191;
    int _203 = _201 ? 0 : 1;
    int _205 = abs(_195);
    int _207 = abs(_203);
    float _209 = -_181;
    float _211 = _165 + _209;
    float _213 = float(_205);
    float _215 = -_211;
    float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _221 = !_177;
    int _223 = _221 ? 0 : 1;
    float _225 = fma(_199, 0.5, 0.5);
    float _227 = abs(_217);
    float _229 = _213 * _227;
    bool _231 = _211 < 0.5;
    float _233 = float(_231);
    int _235 = abs(_223);
    float _237 = -_225;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _241 = float(_207);
    float _243 = -_233;
    float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _247 = float(_235);
    float _249 = fma(_241, _239, _229);
    float _251 = abs(_245);
    float _253 = fma(_247, _251, _249);
    bool _255 = !_219;
    float _271;
    if (!_255)
    {
        float _257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _259 = _153 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _263 = _261 * _257;
        float _265 = floor(_263);
        float _267 = -_265;
        float _269 = _263 + _267;
        _271 = _269;
        _273 = true;
    }
    else
    {
        float _275 = float(_93);
        float _277 = 1.0 / _275;
        float _279 = _127 * _277;
        _271 = _279;
    }
    _273 = false;
    float _281 = _271;
    float _283 = in.m_44.x;
    float _285 = in.m_44.y;
    float _287 = in.m_44.z;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _281 + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _281 + _293;
    bool _297 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _299 = isnan(_281);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _323 = _281 + _321;
    float _325 = 1.0 / _311;
    float _327 = -_307;
    float _329 = _327 + 1.0;
    bool _331 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _333 = isnan(_281);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = in.m_56.x;
    float _345 = in.m_56.y;
    bool _347 = _153 > 0.5;
    float _349 = in.m_54.y;
    float _351 = 1.0 / _315;
    float _353 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _355 = _285 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _357 = _285 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _359 = 1.0 / _319;
    float _361 = _285 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _363 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[5].x, _355);
    float _365 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[4].x, _357);
    float _367 = _295 * _325;
    float _369 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[6].x, _361);
    float _371 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[5].z, _363);
    bool _373 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _375 = isnan(_281);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = _291 * _351;
    float _387 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _389 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[6].z, _369);
    float _391 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[4].z, _365);
    float _393 = _371 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _395 = _387 * _153;
    float _397 = _383 * _329;
    float _399 = -_383;
    float _401 = _399 + 1.0;
    float _403 = _391 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _405 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _407 = _393 + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _409;
    float _413 = _323 * _359;
    float _415 = _353 * _153;
    float _417 = _389 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _419 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _421 = _403 + _419;
    float _423 = _407 * _407;
    float _425 = _341 * _401;
    float _427 = fma(_411, _367, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _429 = trunc(_415);
    int _431 = int(_429);
    bool _433 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _435 = isnan(_281);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _447 = _417 + _445;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _451 = _449 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _453 = -_341;
    float _455 = _453 + 1.0;
    float _457 = _427 * _425;
    float _459 = fma(_451, _385, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _461 = trunc(_395);
    int _463 = int(_461);
    float _465 = fma(_421, _421, _423);
    float _467 = -_443;
    float _469 = _467 + 1.0;
    float _471 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[143].x, _457);
    bool _473 = _349 > 0.5;
    float _475 = fma(_447, _447, _465);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _477;
    float _481 = _307 * _469;
    float _483 = fma(_459, _397, _471);
    float _485 = rsqrt(_475);
    float _487 = fma(_479, _413, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _489 = _431 << 4;
    int _491 = _489 + 1712;
    int _493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _495 = _493 != 0;
    float _497 = fma(_487, _481, _483);
    int _499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _501 = _499 != 0;
    float _503 = sqrt(_475);
    float _505 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[146].x, _497);
    int _507 = _463 << 4;
    int _509 = _507 + 1968;
    float _511 = -_187;
    int _513 = _347 ? as_type<int>(_511) : as_type<int>(_187);
    float _515 = _505 * _343;
    float _517 = _407 * _485;
    float _519 = _253 * _515;
    float _521 = _421 * _485;
    float _523 = _447 * _485;
    float _525 = -_517;
    float _527 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[18].w, _407);
    float _529 = _519 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _531 = -_521;
    float _533 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[18].w, _421);
    float _535 = -_523;
    float _537 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[18].w, _447);
    float _539 = _503 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _541 = _529 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _543 = _527 * _527;
    float _545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _548 = uint(int(uint(_491) >> uint(2)));
    uint _550 = uint(int(uint(int(_548)) >> uint(2)));
    int _552 = int(_548) & 3;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[int(_550)][_552];
    int _556 = int(_548) + 1;
    uint _558 = uint(int(uint(_556) >> uint(2)));
    int _560 = _556 & 3;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[int(_558)][_560];
    bool _564 = !_495;
    float _566 = _564 ? _187 : as_type<float>(_513);
    float _568 = fma(_533, _533, _543);
    float _570 = precise::min(_541, _539);
    float _572 = fma(_537, _537, _568);
    float _574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _576 = _517 * _570;
    uint _578 = uint(int(uint(_509) >> uint(2)));
    uint _580 = uint(int(uint(int(_578)) >> uint(2)));
    int _582 = int(_578) & 3;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[int(_580)][_582];
    int _586 = int(_578) + 1;
    uint _588 = uint(int(uint(_586) >> uint(2)));
    int _590 = _586 & 3;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[int(_588)][_590];
    float _594 = _521 * _570;
    float _596 = _523 * _570;
    float _598 = -_576;
    float _600 = _407 + _598;
    float _602 = _407 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _604 = -_594;
    float _606 = _421 + _604;
    float _608 = sqrt(_572);
    float _610 = _600 * _600;
    int _612 = _491 + 8;
    uint _614 = uint(int(uint(_612) >> uint(2)));
    uint _616 = uint(int(uint(int(_614)) >> uint(2)));
    int _618 = int(_614) & 3;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[int(_616)][_618];
    float _622 = fma(_421, (*spvDescriptorSet0.vp_c8)._m0[28].x, _602);
    out.m_58.w = _570;
    float _624 = fma(_606, _606, _610);
    float _626 = -_596;
    float _628 = _447 + _626;
    float _630 = fma(_447, (*spvDescriptorSet0.vp_c8)._m0[28].z, _622);
    float _632 = -_169;
    int _634 = _473 ? as_type<int>(_632) : as_type<int>(_169);
    int _636 = _509 + 8;
    uint _638 = uint(int(uint(_636) >> uint(2)));
    uint _640 = uint(int(uint(int(_638)) >> uint(2)));
    int _642 = int(_638) & 3;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[int(_640)][_642];
    float _646 = fma(_628, _628, _624);
    bool _648 = !_501;
    float _650 = _648 ? _169 : as_type<float>(_634);
    bool _652 = _630 >= 0.0;
    float _654 = _566 + 0.5;
    float _656 = _485 * _608;
    float _658 = sqrt(_646);
    float _660 = -_650;
    float _662 = _660 + 0.5;
    float _664 = _654 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _666 = _662 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _668 = _664 * _574;
    float _670 = _666 * _545;
    float _672 = _670;
    if (_652)
    {
        out.m_47.x = 0.0;
    }
    out.m_60.x = _668;
    out.m_60.y = _670;
    float _674 = _485 * _658;
    float _676 = _554 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _678 = _562 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _680 = _674 * _656;
    float _682 = _676 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _684 = _678 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _686 = _529 * _680;
    float _688 = _584 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _690 = _592 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _692 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _686;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _696 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = _620 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _702 = _698 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _704 = _644 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _706 = _644;
    float _708 = _694;
    if (_652)
    {
        _706 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _710 = _706;
    out.m_64.x = _682;
    out.m_64.y = _684;
    out.m_64.z = _702;
    out.m_64.w = _700;
    float _712 = _704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _714 = as_type<int>(_710);
    if (_652)
    {
        float _716 = _710 * 5.0;
        _714 = as_type<int>(_716);
    }
    int _718 = _714;
    out.m_66.x = _692;
    out.m_66.y = _696;
    out.m_66.z = _712;
    out.m_66.w = _694;
    if (_652)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2586 = as_type<float>(_718);
        out.gl_Position.z = _2586;
    }
    if (_652)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _720 = -_517;
    float _722 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[18].w, _393);
    float _724 = -_521;
    float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[18].w, _403);
    float _728 = -_523;
    float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[18].w, _417);
    float _732 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _734 = _722 + _732;
    float _736 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _738 = _726 + _736;
    float _740 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _742 = _730 + _740;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _744;
    float _748 = _734 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _750 = fma(_746, _367, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _752 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[28].x, _748);
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _758 = _750 * _425;
    float _760 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[28].z, _752);
    float _762 = fma(_756, _385, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _764;
    float _768 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[143].y, _758);
    bool _770 = _760 >= 0.0;
    float _772 = fma(_766, _413, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _774 = fma(_762, _397, _768);
    float _776 = fma(_772, _481, _774);
    float _778 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[146].y, _776);
    float _780 = _760;
    if (_770)
    {
        _780 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _782 = _780;
    float _784 = _778 * _345;
    int _786 = as_type<int>(_782);
    if (_770)
    {
        out.m_47.x = 0.0;
    }
    if (_770)
    {
        float _788 = _782 * 5.0;
        _786 = as_type<int>(_788);
    }
    int _790 = _786;
    float _792 = _253 * _784;
    if (_770)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2736 = as_type<float>(_790);
        out.gl_Position.z = _2736;
    }
    if (_770)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _794 = _792 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _796 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _169);
    float _798 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _800 = _794 * _680;
    float _802 = _680 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _804 = _802 * 0.5;
    float _806 = _686 * _798;
    bool _808 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _810 = isnan(0.5);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _816 = _812 || _814;
    float _818 = _800 * _796;
    float _820 = -_594;
    float _822 = _403 + _820;
    float _824 = _818 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _826 = _818 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _828 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[26].x, _824);
    float _830 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[24].x, _826);
    float _832 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[26].z, _828);
    float _834 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[24].z, _830);
    float _836 = _832 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _838 = _834 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _840 = _417 + _836;
    float _842 = _403 + _838;
    float _844 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _846 = _840 + _844;
    float _848 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _850 = _842 + _848;
    float _852 = _846 * _846;
    float _854 = fma(_850, _850, _852);
    float _856 = _818 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _858 = sqrt(_854);
    float _860 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[25].x, _856);
    float _862 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[25].z, _860);
    float _864 = _862 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _866 = _393 + _864;
    bool _868 = _858 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _870 = _842;
    float _872 = _840;
    float _874 = _818;
    if (!_868)
    {
        _708 = _866;
    }
    float _876 = _708;
    bool _878 = !_868;
    float _880 = _876;
    if (!_878)
    {
        float _882 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _884 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _886 = _858 + _884;
        float _888 = rsqrt(_854);
        float _890 = _886 * _882;
        float _892 = _866 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _894 = _890 * 0.15915493667125701904296875;
        float _896 = _894 * 6.283185482025146484375;
        float _898 = sin(_896);
        float _900 = _894 * 6.283185482025146484375;
        float _902 = cos(_900);
        float _904 = fma(_898, _892, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _906 = _888 * _904;
        float _908 = _902 + (-1.0);
        float _910 = fma(_850, _906, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _912 = fma(_846, _906, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _914 = _908 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _916 = fma(_866, _902, _914);
        _880 = _916;
        _870 = _910;
        _872 = _912;
    }
    float _918 = _880;
    float _920 = _870;
    float _922 = _872;
    float _924 = -_576;
    float _926 = _924 + _918;
    float _928 = -_594;
    float _930 = _928 + _920;
    float _932 = -_596;
    float _934 = _417 + _932;
    float _936 = -_596;
    float _938 = _936 + _922;
    float _940 = -_517;
    float _942 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[18].w, _926);
    float _944 = -_576;
    float _946 = _393 + _944;
    float _948 = -_521;
    float _950 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[18].w, _822);
    float _952 = -_521;
    float _954 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[18].w, _930);
    float _956 = -_523;
    float _958 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[18].w, _934);
    float _960 = -_523;
    float _962 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[18].w, _938);
    float _964 = -_517;
    float _966 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[18].w, _946);
    float _968 = _934;
    float _970 = _954;
    float _972 = _962;
    if (_816)
    {
        _968 = _942;
    }
    float _974 = _968;
    float _976 = _974;
    if (!_816)
    {
        float _978 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _980 = _966 + _978;
        float _982 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _984 = _950 + _982;
        float _986 = -_417;
        float _988 = _986 + _922;
        float _990 = _980 * _980;
        float _992 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _994 = _958 + _992;
        float _996 = fma(_984, _984, _990);
        float _998 = 1.0 / _656;
        float _1000 = fma(_994, _994, _996);
        float _1002 = sqrt(_1000);
        float _1004 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1006 = precise::min(_1002, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1008 = _1006 * _1004;
        float _1010 = -_403;
        float _1012 = _1010 + _920;
        float _1014 = -_393;
        float _1016 = _1014 + _918;
        float _1018 = _1008 * _998;
        float _1020 = fma(_1012, _1018, _950);
        float _1022 = fma(_1016, _1018, _966);
        float _1024 = fma(_988, _1018, _958);
        _976 = _1022;
        _970 = _1020;
        _972 = _1024;
    }
    float _1026 = _976;
    float _1028 = _970;
    float _1030 = _972;
    float _1032 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1034 = _1026 + _1032;
    float _1036 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1038 = _1028 + _1036;
    float _1040 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1042 = _1030 + _1040;
    float _1044 = _1034 * _1034;
    float _1046 = fma(_1038, _1038, _1044);
    float _1048 = fma(_1042, _1042, _1046);
    float _1050 = rsqrt(_1048);
    float _1052 = _1050 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1054 = _1038 * _1052;
    float _1056 = _1042 * _1052;
    float _1058 = _1054 * _1054;
    float _1060 = _1056 * _1056;
    float _1062 = _1058 + _1060;
    float _1064 = sqrt(_1062);
    bool _1066 = _1064 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1068 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1070 = _1064 + _1068;
    float _1072 = _1042;
    float _1074 = _1062;
    float _1076 = _1070;
    float _1078 = _1054;
    if (_1066)
    {
        float _1080 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1072 = _1080;
    }
    float _1082 = _1072;
    if (_1066)
    {
        float _1084 = rsqrt(_1062);
        _1074 = _1084;
    }
    float _1086 = _1074;
    float _1088 = _1086;
    if (_1066)
    {
        float _1090 = _1070 * _1082;
        _1076 = _1090;
    }
    float _1092 = _1076;
    if (_1066)
    {
        float _1094 = _1092 * 0.15915493667125701904296875;
        _672 = _1094;
    }
    float _1096 = _672;
    float _1098 = _1050;
    if (_1066)
    {
        float _1100 = _1096 * 6.283185482025146484375;
        float _1102 = sin(_1100);
        _1098 = _1102;
    }
    float _1104 = _1098;
    float _1106 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1108 = precise::max(0.0, _1106);
    float _1110 = _668;
    float _1112 = _1108;
    float _1114 = _1106;
    if (_1066)
    {
        float _1116 = _1096 * 6.283185482025146484375;
        float _1118 = cos(_1116);
        _1110 = _1118;
    }
    float _1120 = _1110;
    float _1122 = -_1052;
    float _1124 = -_1108;
    float _1126 = fma(_1034, _1122, _1124);
    if (_1066)
    {
        float _1128 = _1126 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1112 = _1128;
    }
    float _1130 = _1112;
    float _1132 = sqrt(_1048);
    float _1134 = _1026 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1136 = _1104;
    float _1138 = _1130;
    if (_1066)
    {
        float _1140 = fma(_1104, _1130, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1136 = _1140;
    }
    float _1142 = _1136;
    float _1144 = _1142;
    if (!_1066)
    {
        _1138 = _1056;
    }
    float _1146 = _1138;
    float _1148 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1134);
    float _1150 = _1146;
    if (_1066)
    {
        float _1152 = _1120 + (-1.0);
        _1114 = _1152;
    }
    float _1154 = _1114;
    float _1156 = _1154;
    if (_1066)
    {
        float _1158 = _1086 * _1142;
        _874 = _1158;
    }
    float _1160 = _874;
    if (!_1066)
    {
        _1144 = _1126;
    }
    float _1162 = _1144;
    float _1164 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1148);
    float _1166 = _1162;
    if (_1066)
    {
        float _1168 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1156 = _1168;
    }
    float _1170 = _1156;
    float _1172 = _1170;
    if (_1066)
    {
        float _1174 = _1054 * _1160;
        _1078 = _1174;
    }
    float _1176 = _1078;
    if (!_1066)
    {
        _1088 = _1058;
    }
    float _1178 = _1088;
    float _1180 = _1178;
    if (_1066)
    {
        float _1182 = _1056 * _1160;
        _1150 = _1182;
    }
    float _1184 = _1150;
    if (_1066)
    {
        float _1186 = fma(_1126, _1120, _1170);
        _1166 = _1186;
    }
    float _1188 = _1166;
    if (_1066)
    {
        float _1190 = _1176 * _1176;
        _1180 = _1190;
    }
    float _1192 = _1180;
    if (!_1066)
    {
        _1172 = _1060;
    }
    float _1194 = _1172;
    float _1196 = _1194;
    if (_1066)
    {
        float _1198 = _1184 * _1184;
        _1196 = _1198;
    }
    float _1200 = _1196;
    float _1202 = fma(_1188, _1188, _1192);
    float _1204 = _1026 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1206 = _1164 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1208 = _1202 + _1200;
    float _1210 = _1026 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1212 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1214 = fma(_1132, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1212);
    float _1216 = precise::clamp(_1214, 0.0, 1.0);
    float _1218 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1204);
    float _1220 = rsqrt(_1208);
    float _1222 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1210);
    float _1224 = _1026 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1226 = -_1216;
    float _1228 = _1226 + 1.0;
    float _1230 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1232 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1222);
    float _1234 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1224);
    float _1236 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1238 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1234);
    float _1240 = abs(_1228);
    float _1242 = log2(_1240);
    float _1244 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1218);
    float _1246 = _1236 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1248 = _1238 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1250 = _1220 * _1176;
    float _1252 = _1220 * _1188;
    float _1254 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1256 = -_1246;
    float _1258 = fma(_1256, _1230, 1.0);
    float _1260 = _1250 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1262 = _1220 * _1184;
    float _1264 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1254);
    float _1266 = _1244 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1268 = -_1260;
    float _1270 = fma(_1252, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1268);
    float _1272 = log2(_1258);
    float _1274 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1264);
    float _1276 = _1242 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1278 = -_1262;
    float _1280 = fma(_1278, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1270);
    float _1282 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1284 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1274);
    float _1286 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1288 = fma(_1280, -0.5, 0.5);
    float _1290 = exp2(_1276);
    float _1292 = fma(_1280, 0.5, 0.5);
    float _1294 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1282);
    float _1296 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1286);
    float _1298 = _1252 + 1.0;
    float _1300 = fma(_1292, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1302 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1294);
    float _1304 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1296);
    float _1306 = 1.0 / _1284;
    float _1308 = fma(_1292, _1300, -0.212114393711090087890625);
    float _1310 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1302);
    float _1312 = _1272 * 0.693147182464599609375;
    float _1314 = fma(_1292, _1308, 1.570728778839111328125);
    float _1316 = _1312 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1318 = sqrt(_1288);
    float _1320 = -_1252;
    float _1322 = fma(_1290, _1298, _1320);
    float _1324 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1304);
    float _1326 = _1310 * _1306;
    float _1328 = _1324 * _1306;
    float _1330 = fma(_1326, 0.5, 0.5);
    float _1332 = fma(_1328, -0.5, 0.5);
    float _1334 = _1318 * 0.636619746685028076171875;
    float3 _3626 = float3(_1330, _1332, _1316);
    float _1336 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3626, float3(0.0), isnan(_3626)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3626, float3(0.0), isnan(_3626)), level(0.0)).x;
    float3 _3637 = float3(_1330, _1332, _1316);
    float4 _1339 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3637, float3(0.0), isnan(_3637)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3637, float3(0.0), isnan(_3637)), level(0.0)).xyzw;
    float _1341 = _1339.x;
    float _1343 = _1339.y;
    float _1345 = _1339.z;
    float _1347 = _1339.w;
    float _1349 = -_1314;
    float _1351 = fma(_1334, _1349, 1.0);
    float _1353 = fma(_1322, 0.5, 0.5);
    float2 _3661 = float2(_1351, _1353);
    float3 _1357 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3661, float2(0.0), isnan(_3661)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3661, float2(0.0), isnan(_3661)), level(0.0)).xyz;
    float _1359 = _1357.x;
    float _1361 = _1357.y;
    float _1363 = _1357.z;
    float _1365 = _966 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1367 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1369 = isnan(0.5);
    bool _1371 = _1367 || _1369;
    bool _1373 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1375 = _1371 || _1373;
    out.m_68.x = _950;
    out.m_68.y = _966;
    out.m_68.z = _958;
    float _1377 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1365);
    out.m_70.x = _1028;
    out.m_70.y = _1026;
    out.m_70.z = _1030;
    float _1379 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1377);
    float _1381 = _966 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1383 = _1379 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1385 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1381);
    float _1387 = _1314;
    float _1389 = _1316;
    float _1391 = _1242;
    if (!_1375)
    {
        _1387 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1393 = _1387;
    float _1395 = 1.0 / _1383;
    float _1397 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1385);
    float _1399 = _1397 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1401 = _1399 + _1383;
    float _1403 = _1393;
    if (!_1375)
    {
        _1389 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1405 = _1389;
    float _1407 = _1401 * _1395;
    float _1409 = _1407 * 0.5;
    float _1411 = _1242 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1413 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1415 = _1409;
    float _1417 = _1413;
    if (_1375)
    {
        _1391 = 1.0;
    }
    float _1419 = _1391;
    float _1421 = _1419;
    if (!_1375)
    {
        float _1423 = -_1393;
        float _1425 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1423);
        _1415 = _1425;
    }
    float _1427 = _1415;
    if (!_1375)
    {
        float _1429 = -_1405;
        float _1431 = _1429 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1403 = _1431;
    }
    float _1433 = _1403;
    float _1435 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1413);
    float _1437 = exp2(_1411);
    float _1439 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1435);
    float _1441 = _1310 + _1284;
    float _1443 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1439);
    float _1445 = _1427;
    if (!_1375)
    {
        float _1447 = 1.0 / _1427;
        _1445 = _1447;
    }
    float _1449 = _1445;
    float _1451 = _1441 * 0.5;
    out.gl_Position.x = _1310;
    out.gl_Position.y = _1324;
    out.gl_Position.z = _1443;
    out.gl_Position.w = _1284;
    float _1453 = _1383;
    if (!_1375)
    {
        float _1455 = 1.0 / _1433;
        _1453 = _1455;
    }
    float _1457 = _1453;
    float _1459 = -_1437;
    float _1461 = _1459 + 1.0;
    float _1463 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1375)
    {
        float _1465 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1467 = -_1405;
        float _1469 = fma(_1449, _1465, _1467);
        _1417 = _1469;
    }
    float _1471 = _1417;
    float _1473 = _1284 * 0.5;
    float _1475 = -_1463;
    float _1477 = _1475 + 1.0;
    if (!_1375)
    {
        float _1479 = _1471 * _1457;
        float _1481 = precise::clamp(_1479, 0.0, 1.0);
        _1421 = _1481;
    }
    float _1483 = _1421;
    float _1485 = _1443 + _1284;
    float _1487 = fma(_1324, -0.5, _1473);
    float _1489 = _1483 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1491 = _1483 > 0.0;
    bool _1493 = isnan(_1483);
    bool _1495 = _1491 || _1493;
    bool _1497 = isnan(0.0);
    bool _1499 = _1495 || _1497;
    float _1501 = _1485 * 0.5;
    float _1503 = _1489 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_72.x = _1451;
    out.m_72.y = _1487;
    out.m_72.z = _1501;
    out.m_72.w = _1284;
    out.m_47.x = _1503;
    float _1505 = _1463 * _1336;
    float _1507 = _1347 * _1477;
    float _1509 = _1347 * _1505;
    float _1511 = _1363 * _1505;
    float _1513 = fma(_1359, _1509, _1341);
    float _1515 = fma(_1361, _1509, _1343);
    float _1517 = fma(_1347, _1511, _1345);
    out.m_74.x = _1513;
    out.m_74.y = _1515;
    out.m_74.z = _1517;
    out.m_74.w = _1507;
    if (_1499)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1519 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1519;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

