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
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_68 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_86 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_64 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_70 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_84 [[user(locn9)]];
    float4 m_80 [[user(locn10)]];
    float4 m_82 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_76 [[attribute(0)]];
    float4 m_66 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_50 [[attribute(3)]];
    float4 m_60 [[attribute(4)]];
    float4 m_72 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2899 = false;
    bool _1964 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_48.w;
    float _102 = in.m_50.w;
    float _104 = trunc(_100);
    int _107 = int(_104);
    float _109 = -_102;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _111;
    bool _115 = _107 >= 1;
    float _117 = 0.0;
    float _119 = _102;
    float _121 = _111;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _117;
    if (!_115)
    {
        out.m_55.x = 0.0;
    }
    int _125 = 0;
    if (!_115)
    {
        float _127 = _123 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3215 = as_type<float>(_129);
        out.gl_Position.z = _3215;
    }
    if (!_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _133 = _102 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_102);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = float(_107);
    bool _145 = _111 >= _143;
    bool _147 = !_141;
    bool _149 = _145 || _147;
    if (_149)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _119;
    if (_149)
    {
        out.m_55.x = 0.0;
    }
    if (_149)
    {
        float _153 = _151 * 5.0;
        _131 = as_type<int>(_153);
    }
    int _155 = _131;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3270 = as_type<float>(_155);
        out.gl_Position.z = _3270;
    }
    if (_149)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _157 = as_type<float>(int(gl_VertexIndex));
    float _159 = 1.0 / _143;
    bool _161 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _163 = _111 * _159;
    int _165 = as_type<int>(_157) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_157) & 2;
    bool _171 = _169 != 0;
    bool _173 = !_167;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_161;
    float _183 = _163;
    float _201;
    if (!_181)
    {
        float _185 = in.m_60.x;
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        _201 = _163;
    }
    _203 = false;
    float _205 = _201;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _209 = _205 + _207;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _205 + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _217 = _205 + _215;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _225 = _223 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _233 = _231 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _235 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _237 = isnan(_205);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _243 = _239 || _241;
    float _245 = float(_243);
    float _247 = 1.0 / _225;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _251 = 1.0 / _221;
    bool _253 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _255 = isnan(_205);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = 1.0 / _229;
    float _267 = _209 * _247;
    bool _269 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _271 = isnan(_205);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = 1.0 / _233;
    float _283 = _213 * _251;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _287 = _205 + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _289;
    float _293 = fma(_291, _283, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _295 = _217 * _265;
    float _297 = -_245;
    float _299 = _297 + 1.0;
    float _301 = -_263;
    float _303 = _301 + 1.0;
    float _305 = _279 * _299;
    bool _307 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _309 = isnan(_205);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = _287 * _281;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _321;
    float _325 = -_279;
    float _327 = _325 + 1.0;
    bool _329 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _331 = isnan(_205);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _345 = fma(_323, _283, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _347 = _317 * _303;
    float _349 = -_317;
    float _351 = _349 + 1.0;
    float _353 = _263 * _327;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _359 = -_339;
    float _361 = _359 + 1.0;
    float _363 = _339 * _351;
    float _365 = fma(_343, _267, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _367;
    float _371 = fma(_357, _267, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _373 = _345 * _363;
    float _375 = _293 * _363;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _377;
    float _381 = fma(_369, _295, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _383 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].x, _373);
    float _385 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].y, _375);
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _391 = fma(_379, _295, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _393 = fma(_365, _347, _383);
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _397 = _395 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _399 = fma(_371, _347, _385);
    float _401 = fma(_389, _319, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _403 = fma(_381, _353, _393);
    float _405 = fma(_397, _319, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _407 = fma(_391, _353, _399);
    float _409 = fma(_401, _305, _403);
    float _411 = fma(_405, _305, _407);
    float _413 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[147].x, _409);
    float _415 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[147].y, _411);
    bool _417 = !_249;
    if (!_417)
    {
        float _419 = in.m_60.x;
        float _421 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _423 = _419 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _425 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _427 = _425 * _421;
        float _429 = floor(_427);
        float _431 = -_429;
        float _433 = _427 + _431;
        _183 = _433;
    }
    float _435 = _183;
    float _437 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _439 = int(_437);
    float _441 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _443 = int(_441);
    bool _445 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _447 = isnan(_435);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = float(_439);
    float _459 = 1.0 / _457;
    float _461 = float(uint(_443));
    int _463 = ~_443;
    int _465 = _463 + 1;
    int _467 = ~_443;
    int _469 = _467 + 1;
    float _471 = 1.0 / _461;
    bool _473 = _443 == 0;
    int _475 = ~_443;
    int _477 = _475 + 1;
    int _479 = ~_443;
    int _481 = _479 + 1;
    float _483 = _459 * _111;
    float _485 = trunc(_483);
    int _487 = int(_485);
    int _489 = as_type<int>(_471) + (-2);
    int _491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _493 = _491 != 0;
    bool _495 = !_493;
    float _497 = _495 ? 7.345489978790283203125 : 1.0;
    float _499 = float(uint(_487));
    float _501 = as_type<float>(_489) * _499;
    float _503 = in.m_60.x;
    float _505 = in.m_60.y;
    float _507 = in.m_60.z;
    float _509 = in.m_60.w;
    float _511 = trunc(_501);
    float _513 = precise::max(_511, 0.0);
    uint _516 = uint(_513);
    int _518 = _465 * int(_516);
    int _520 = _518 + _487;
    float _522 = float(uint(_520));
    float _524 = _497 * _503;
    float _526 = as_type<float>(_489) * _522;
    float _528 = float(_487);
    float _530 = floor(_524);
    float _532 = trunc(_526);
    float _534 = precise::max(_532, 0.0);
    uint _536 = uint(_534);
    float _538 = -_530;
    float _540 = _524 + _538;
    int _542 = int(_516) + int(_536);
    float _544 = float(_443);
    int _546 = _469 * _542;
    int _548 = _546 + _487;
    bool _550 = _528 >= _544;
    bool _552 = isnan(_528);
    bool _554 = _550 || _552;
    bool _556 = isnan(_544);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    bool _562 = uint(_548) >= uint(_443);
    float _564 = trunc(_560);
    int _566 = int(_564);
    bool _568 = !_562;
    int _570 = _568 ? 0 : (-1);
    int _572 = ~_542;
    int _574 = _572 + _570;
    int _576 = _574 + 1;
    float _578 = _540 * _544;
    float _580 = _544 * _111;
    int _582 = _443 * _576;
    int _584 = _582 + _487;
    float _586 = _580 * _159;
    float _588 = trunc(_578);
    int _590 = int(_588);
    int _592 = ~_566;
    int _594 = _592 + 1;
    int _596 = _594 + 1;
    bool _598 = !_473;
    int _600 = _598 ? _584 : (-1);
    float _602 = trunc(_586);
    int _604 = int(_602);
    int _606 = _600 * _596;
    int _608 = _443 + (-1);
    int _610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _612 = _610 != 0;
    int _614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _616 = _614 != 0;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _620 = _618 != 0;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _624 = _622 != 0;
    int _626 = _566 * _608;
    int _628 = _626 + _606;
    bool _630 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _632 = isnan(0.0);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _638 = _634 || _636;
    bool _640 = !_616;
    int _642 = _640 ? 0 : 1;
    bool _644 = !_612;
    int _646 = _644 ? 0 : 1;
    bool _648 = !_624;
    int _650 = _648 ? 0 : 1;
    int _652 = abs(_642);
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _656 = _654 != 0;
    bool _658 = !_620;
    int _660 = _658 ? 0 : 1;
    int _662 = _628 * _652;
    int _664 = abs(_646);
    int _666 = abs(_650);
    bool _668 = !_656;
    int _670 = _668 ? 0 : 1;
    int _672 = abs(_660);
    int _674 = _590 * _666;
    int _676 = _674 + _487;
    int _678 = abs(_670);
    int _680 = _604 * _664;
    int _682 = _680 + _662;
    int _684 = ~_443;
    int _686 = _684 + 1;
    int _688 = _676 * _672;
    int _690 = _688 + _682;
    int _692 = ~_443;
    int _694 = _692 + 1;
    int _696 = _590 * _678;
    int _698 = _696 + _690;
    float _700 = float(uint(_698));
    float _702 = as_type<float>(_489) * _700;
    float _704 = trunc(_702);
    float _706 = precise::max(_704, 0.0);
    uint _708 = uint(_706);
    float _710 = _503 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _712 = _694 * int(_708);
    int _714 = _712 + _698;
    float _716 = float(uint(_714));
    float _718 = as_type<float>(_489) * _716;
    float _720 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _722 = log2(_720);
    float _724 = trunc(_718);
    float _726 = precise::max(_724, 0.0);
    uint _728 = uint(_726);
    float _730 = _722 * _111;
    float _732 = exp2(_730);
    int _734 = int(_708) + int(_728);
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _738 = _503 * 2.0;
    int _740 = _686 * _734;
    int _742 = _740 + _698;
    float _744 = -_736;
    float _746 = fma(_710, 2.0, _744);
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _750 = _505 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _752 = floor(_738);
    bool _754 = uint(_742) >= uint(_443);
    float _756 = fma(_750, -2.0, _748);
    float _758 = -_732;
    float _760 = _758 + 1.0;
    bool _762 = !_754;
    int _764 = _762 ? 0 : (-1);
    bool _766 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _768 = isnan(1.0);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _774 = _770 || _772;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _778 = ~_734;
    int _780 = _778 + _764;
    int _782 = _780 + 1;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _786 = 1.0 + _784;
    float _788 = _638 ? _760 : 0.0;
    int _790 = _443 * _782;
    int _792 = _790 + _698;
    float _794 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[78].z, _776);
    float _796 = 1.0 / _786;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _800 = _752 > 0.0;
    float _802 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].z, _794);
    bool _804 = !_473;
    int _806 = _804 ? _792 : (-1);
    float _808 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[78].w, _798);
    float _810 = float(uint(_676));
    float _812 = -_111;
    float _814 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[76].x, _746);
    int _816 = _806 & 3;
    bool _818 = _816 != 0;
    float _820 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[76].y, _756);
    int _822 = _806 & 3;
    bool _824 = _822 != 0;
    float _826 = as_type<float>(_489) * _810;
    int _828 = _818 ? 0 : 1;
    float _830 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].w, _808);
    bool _832 = uint(_822) > 1u;
    float _834 = -_802;
    float _836 = _834 + 1.0;
    bool _838 = _822 != 3;
    float _840 = trunc(_826);
    float _842 = precise::max(_840, 0.0);
    uint _844 = uint(_842);
    bool _846 = _752 >= 0.0;
    bool _848 = isnan(_752);
    bool _850 = _846 || _848;
    bool _852 = isnan(0.0);
    bool _854 = _850 || _852;
    if (_774)
    {
        float _856 = _788 * _796;
        _121 = _856;
    }
    float _858 = _121;
    bool _860 = uint(_822) >= 2u;
    float _862 = -_830;
    float _864 = _862 + 1.0;
    int _866 = _854 ? 0 : 1;
    int _868 = _860 ? 0 : 1;
    bool _870 = _509 > 0.5;
    float _872 = _505 * 2.0;
    int _874 = ~_866;
    int _876 = _874 + 1;
    int _878 = _876 + 1;
    int _880 = ~_828;
    int _882 = _880 + 1;
    int _884 = _882 + 1;
    float _886 = floor(_872);
    int _888 = ~_868;
    int _890 = _888 + 1;
    int _892 = _890 + 1;
    int _894 = _878;
    int _896 = _884;
    int _898 = _892;
    if (!_800)
    {
        int _900 = ~_866;
        int _902 = _900 + 1;
        _894 = _902;
    }
    int _904 = _894;
    if (!_832)
    {
        int _906 = ~_828;
        int _908 = _906 + 1;
        _896 = _908;
    }
    int _910 = _896;
    if (_838)
    {
        int _912 = ~_868;
        int _914 = _912 + 1;
        _898 = _914;
    }
    int _916 = _898;
    float _918 = in.m_48.x;
    float _920 = in.m_48.y;
    float _922 = in.m_48.z;
    bool _924 = _503 > 0.5;
    int _926 = _477 * int(_844);
    int _928 = _926 + _676;
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _932 = _930 != 0;
    float _934 = -_175;
    int _936 = _924 ? as_type<int>(_934) : as_type<int>(_175);
    bool _938 = _505 > 0.5;
    bool _940 = !_932;
    float _942 = _940 ? _175 : as_type<float>(_936);
    float _944 = float(uint(_928));
    float _946 = _942 + 0.5;
    float _948 = -_179;
    int _950 = _938 ? as_type<int>(_948) : as_type<int>(_179);
    float _952 = as_type<float>(_489) * _944;
    bool _954 = _886 >= 0.0;
    bool _956 = isnan(_886);
    bool _958 = _954 || _956;
    bool _960 = isnan(0.0);
    bool _962 = _958 || _960;
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _966 = _964 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _968 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _970 = _968 != 0;
    float _972 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[80].x, _814);
    int _974 = _962 ? 0 : 1;
    float _976 = trunc(_952);
    float _978 = precise::max(_976, 0.0);
    uint _980 = uint(_978);
    bool _982 = !_970;
    int _984 = _982 ? 0 : 1;
    float _986 = _920 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _988 = _886 > 0.0;
    float _990 = _920 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _992 = _920 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _996 = _994 != 0;
    float _998 = 1.0 / _966;
    int _1000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1002 = _1000 != 0;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1006 = _1004 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1010 = _1008 != 0;
    float _1012 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[4].x, _986);
    float _1014 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[6].x, _992);
    float _1016 = 1.0 / _1006;
    float _1018 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1020 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[5].x, _990);
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1024 = int(_844) + int(_980);
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1028 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1030 = _1018 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1032 = _1022 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1034 = _1026 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1036;
    float _1040 = _505 + _507;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1044 = _1042 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    out.m_62.x = _1030;
    out.m_62.y = _1032;
    out.m_62.z = _1034;
    out.m_62.w = _1028;
    float _1046 = _1038 * _998;
    float _1048 = _507 * 2.0;
    int _1050 = _481 * _1024;
    int _1052 = _1050 + _676;
    bool _1054 = !_996;
    float _1056 = _1054 ? _179 : as_type<float>(_950);
    float _1058 = _1040 + (-1.0);
    int _1060 = ~_974;
    int _1062 = _1060 + 1;
    int _1064 = _1062 + 1;
    float _1066 = _1044 * _1016;
    bool _1068 = uint(_1052) >= uint(_443);
    float _1070 = _505 + _503;
    int _1072 = _1064;
    if (!_988)
    {
        int _1074 = ~_974;
        int _1076 = _1074 + 1;
        _1072 = _1076;
    }
    int _1078 = _1072;
    float _1080 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1012);
    bool _1082 = !_1068;
    int _1084 = _1082 ? 0 : (-1);
    float _1086 = _1070 + (-1.0);
    int _1088 = _806 >> 31;
    float _1090 = floor(_1048);
    float _1092 = _1056 + (-0.5);
    int _1094 = _1088 & 3;
    float _1096 = _505 + (-0.5);
    bool _1098 = !_824;
    int _1100 = _1098 ? 0 : 1;
    float _1102 = -_1092;
    float _1104 = -_820;
    float _1106 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1104);
    int _1108 = _806 + _1094;
    bool _1110 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1112 = isnan(_435);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1118 = _1114 || _1116;
    float _1120 = float(_1118);
    float _1122 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1124 = _1108 >> 2;
    float _1126 = fma(_1056, _864, _1106);
    float _1128 = -_1120;
    float _1130 = _1128 + 1.0;
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1134 = _1132 != 0;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1138 = _1136 != 0;
    int _1140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1142 = _1140 != 0;
    bool _1144 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1146 = isnan(_435);
    bool _1148 = _1144 || _1146;
    bool _1150 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1152 = _1148 || _1150;
    float _1154 = float(_1152);
    float _1156 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1158 = _1124 << 4;
    int _1160 = _1158 + 368;
    bool _1162 = !_1138;
    int _1164 = _1162 ? 0 : 1;
    float _1166 = _1154 * _1130;
    float _1168 = -_1154;
    float _1170 = _1168 + 1.0;
    bool _1172 = _1090 > 0.0;
    uint _1174 = uint(int(uint(_1160) >> uint(2)));
    uint _1176 = uint(int(uint(int(_1174)) >> uint(2)));
    int _1178 = int(_1174) & 3;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[int(_1176)][_1178];
    int _1182 = int(_1174) + 1;
    uint _1184 = uint(int(uint(_1182) >> uint(2)));
    int _1186 = _1182 & 3;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[int(_1184)][_1186];
    bool _1190 = !_1134;
    int _1192 = _1190 ? 0 : 1;
    float _1194 = _455 * _1170;
    bool _1196 = _1090 >= 0.0;
    bool _1198 = isnan(_1090);
    bool _1200 = _1196 || _1198;
    bool _1202 = isnan(0.0);
    bool _1204 = _1200 || _1202;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1208 = _435 + _1206;
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1212 = _435 + _1210;
    float _1214 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1020);
    float _1216 = -_455;
    float _1218 = _1216 + 1.0;
    float _1220 = fma(_1046, _1208, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1222 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1014);
    int _1224 = _1204 ? 0 : 1;
    float _1226 = fma(_1066, _1212, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1228 = _507 > 0.5;
    float _1230 = _1220 * _1194;
    float _1232 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1234 = ~_1224;
    int _1236 = _1234 + 1;
    int _1238 = _1236 + 1;
    int _1240 = _1160 + 8;
    uint _1242 = uint(int(uint(_1240) >> uint(2)));
    uint _1244 = uint(int(uint(int(_1242)) >> uint(2)));
    int _1246 = int(_1242) & 3;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[int(_1244)][_1246];
    int _1250 = int(_1242) + 1;
    uint _1252 = uint(int(uint(_1250) >> uint(2)));
    int _1254 = _1250 & 3;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[int(_1252)][_1254];
    int _1258 = _1238;
    float _1260 = _1126;
    if (!_1172)
    {
        int _1262 = ~_1224;
        int _1264 = _1262 + 1;
        _1258 = _1264;
    }
    int _1266 = _1258;
    float _1268 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1230);
    float _1270 = -_175;
    int _1272 = _1228 ? as_type<int>(_1270) : as_type<int>(_175);
    int _1274 = abs(_1164);
    float _1276 = fma(_1226, _1166, _1268);
    bool _1278 = !_1002;
    float _1280 = _1278 ? _175 : as_type<float>(_1272);
    float _1282 = -_836;
    float _1284 = fma(_942, _1282, _972);
    float _1286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1288 = -_179;
    int _1290 = _870 ? as_type<int>(_1288) : as_type<int>(_179);
    float _1292 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _1294 = abs(_910);
    bool _1296 = !_1010;
    float _1298 = _1296 ? _179 : as_type<float>(_1290);
    float _1300 = _1292 * _1232;
    float _1302 = float(_904);
    float _1304 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1306 = float(_1274);
    int _1308 = ~_1024;
    int _1310 = _1308 + _1084;
    int _1312 = _1310 + 1;
    float _1314 = _1306 * _1302;
    float _1316 = _1304 * _1286;
    int _1318 = _443 * _1312;
    int _1320 = _1318 + _676;
    float _1322 = _1214 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1324 = ~_1294;
    int _1326 = _1324 + 1;
    int _1328 = _1326 + 1;
    float _1330 = _1080 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1332 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1276);
    float _1334 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1336 = _1322 + _1334;
    out.m_64.x = _1284;
    out.m_64.y = _1126;
    out.m_64.z = _1300;
    out.m_64.w = _1316;
    int _1338 = _1328 * as_type<int>(_1188);
    int _1340 = abs(_1100);
    float _1342 = _1222 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1344 = abs(_916);
    float _1346 = _1336 * _1336;
    int _1348 = ~_1340;
    int _1350 = _1348 + 1;
    int _1352 = _1350 + 1;
    float _1354 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1356 = _1342 + _1354;
    int _1358 = _1352 * as_type<int>(_1180);
    int _1360 = _1358 + _1338;
    float _1362 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1364 = _1330 + _1362;
    float _1366 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1372 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1366);
    bool _1374 = !_473;
    int _1376 = _1374 ? _1320 : (-1);
    float _1378 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1380 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1372);
    bool _1382 = _822 != 3;
    float _1384 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1386 = ~_1344;
    int _1388 = _1386 + 1;
    int _1390 = _1388 + 1;
    bool _1392 = !_1382;
    int _1394 = _1392 ? 0 : (-1);
    bool _1396 = _1380 >= 0.0;
    int _1398 = _1390 * as_type<int>(_1248);
    int _1400 = _1398 + _1360;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1404 = abs(_1394);
    float _1406 = in.m_66.x;
    float _1408 = in.m_66.y;
    float _1410 = in.m_66.z;
    int _1412 = abs(_1192);
    float _1414 = _1402 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1416 = abs(_984);
    int _1418 = ~_1404;
    int _1420 = _1418 + 1;
    int _1422 = _1420 + 1;
    float _1424 = _1284;
    if (_1396)
    {
        out.m_55.x = 0.0;
    }
    float _1426 = float(_1266);
    int _1428 = _1422 * as_type<int>(_1256);
    int _1430 = _1428 + _1400;
    float _1432 = float(_1412);
    float _1434 = fma(_1364, _1364, _1346);
    int _1436 = ~_1416;
    int _1438 = _1436 + 1;
    int _1440 = _1438 + 1;
    float _1442 = _1332 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1444 = _503 + (-0.5);
    float _1446 = _1432 * _1426;
    float _1448 = fma(_1356, _1356, _1434);
    int _1450 = _1430 * _1440;
    out.m_68.x = _1378;
    out.m_68.y = _1384;
    out.m_68.z = _1414;
    out.m_68.w = _1442;
    float _1452 = _1446 * (-2.0);
    float _1454 = _1446;
    if (_1396)
    {
        _1454 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1456 = _1454;
    int _1458 = _1376 * _1416;
    int _1460 = _1458 + _1450;
    float _1462 = rsqrt(_1448);
    float _1464 = fma(_1452, _1406, _1406);
    bool _1466 = !_1142;
    int _1468 = _1466 ? 0 : 1;
    int _1470 = as_type<int>(_1456);
    if (_1396)
    {
        float _1472 = _1456 * 5.0;
        _1470 = as_type<int>(_1472);
    }
    int _1474 = _1470;
    float _1476 = fma(_1156, _1452, _1156);
    float _1478 = fma(_1444, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1464);
    if (_1396)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5265 = as_type<float>(_1474);
        out.gl_Position.z = _5265;
    }
    int _1480 = abs(_1468);
    float _1482 = fma(_1476, _858, _1478);
    float _1484 = float(_1460);
    float _1486 = _1336 * _1462;
    out.m_70.x = _1484;
    float _1488 = _1364 * _1462;
    float _1490 = _1484;
    if (_1396)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1492 = -_1486;
    float _1494 = fma(_1492, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1322);
    float _1496 = _1356 * _1462;
    float _1498 = -_1488;
    float _1500 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1330);
    float _1502 = _1314 * (-2.0);
    float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1506 = _1494 + _1504;
    float _1508 = float(_1078);
    float _1510 = -_1496;
    float _1512 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1342);
    float _1514 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1516 = _1500 + _1514;
    float _1518 = _1506 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1520 = float(_1480);
    float _1522 = fma(_1502, _1408, _1408);
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1526 = _1512 + _1524;
    float _1528 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1518);
    float _1530 = fma(_1122, _1502, _1122);
    float _1532 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1522);
    float _1534 = _1520 * _1508;
    float _1536 = _507 + _503;
    float _1538 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1528);
    float _1540 = fma(_1530, _858, _1532);
    float _1542 = -_1486;
    float _1544 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1336);
    float _1546 = _1536 + (-1.0);
    float _1548 = _1534 * (-2.0);
    float _1550 = _1540 * 0.15915493667125701904296875;
    bool _1552 = _1538 >= 0.0;
    float _1554 = -_1488;
    float _1556 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1364);
    float _1558 = _1544 * _1544;
    float _1560 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1562 = _507 + (-0.5);
    float _1564 = fma(_1548, _1410, _1410);
    float _1566 = in.m_72.x;
    float _1568 = in.m_72.y;
    float _1570 = fma(_1556, _1556, _1558);
    float _1572 = -_1496;
    float _1574 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1356);
    float _1576 = fma(_1560, _1548, _1560);
    float _1578 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1564);
    float _1580 = _1482 * 0.15915493667125701904296875;
    float _1582 = fma(_1574, _1574, _1570);
    float _1584 = _1574;
    int _1586 = as_type<int>(_1562);
    float _1588 = _1526;
    float _1590 = _1500;
    if (_1552)
    {
        _1584 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1592 = _1584;
    float _1594 = fma(_1576, _858, _1578);
    float _1596 = _1580 * 6.283185482025146484375;
    float _1598 = sin(_1596);
    if (_1552)
    {
        out.m_55.x = 0.0;
    }
    float _1600 = _1594 * 0.15915493667125701904296875;
    if (_1552)
    {
        float _1602 = _1592 * 5.0;
        _1586 = as_type<int>(_1602);
    }
    int _1604 = _1586;
    float _1606 = _1580 * 6.283185482025146484375;
    float _1608 = cos(_1606);
    if (_1552)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5485 = as_type<float>(_1604);
        out.gl_Position.z = _5485;
    }
    float _1610 = _415 * _1568;
    float _1612 = _1550 * 6.283185482025146484375;
    float _1614 = sin(_1612);
    float _1616 = sqrt(_1582);
    float _1618 = _1550 * 6.283185482025146484375;
    float _1620 = cos(_1618);
    if (_1552)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1622 = _1600 * 6.283185482025146484375;
    float _1624 = cos(_1622);
    float _1626 = _1462 * _1616;
    float _1628 = _1610 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1630 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _1632 = _413 * _1566;
    float _1634 = _1608 * _1620;
    float _1636 = _1628 * _1626;
    float _1638 = _1608 * _1614;
    float _1640 = _1600 * 6.283185482025146484375;
    float _1642 = sin(_1640);
    float _1644 = _1598 * _1620;
    float _1646 = _1630 * _1636;
    float _1648 = _1632 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1650 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _1652 = _1598 * _1614;
    float _1654 = _1626 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1656 = _1654 * 0.5;
    float _1658 = _1648 * _1626;
    float _1660 = _1608 * _1624;
    float _1662 = _1620 * _1624;
    float _1664 = _1598 * _1624;
    float _1666 = _1650 * _1658;
    float _1668 = _1660 * _1646;
    float _1670 = _1614 * _1624;
    float _1672 = _1660 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1674 = fma(_1642, _1634, _1652);
    float _1676 = -_1644;
    float _1678 = fma(_1642, _1638, _1676);
    float _1680 = -_1646;
    float _1682 = _1642 * _1680;
    float _1684 = -_1638;
    float _1686 = fma(_1642, _1644, _1684);
    float _1688 = fma(_1674, _1666, _1668);
    float _1690 = _1664 * _1646;
    float _1692 = fma(_1662, _1666, _1682);
    float _1694 = fma(_1642, _1652, _1634);
    float _1696 = fma(_1678, _1656, _1688);
    float _1698 = fma(_1686, _1666, _1690);
    float _1700 = fma(_1670, _1656, _1692);
    float _1702 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1704 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1706 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1708 = fma(_1694, _1656, _1698);
    float _1710 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1712 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1704);
    float _1714 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1706);
    float _1716 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1718 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1702);
    float _1720 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1712);
    float _1722 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1714);
    float _1724 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1716);
    float _1726 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1728 = _1720 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1730 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1732 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1710);
    float _1734 = _1660 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1736 = _1330 + _1728;
    float _1738 = _1342 + _1730;
    float _1740 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1726);
    float _1742 = _1660 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1744 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1746 = _1736 + _1744;
    float _1748 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1750 = _1738 + _1748;
    float _1752 = -_1642;
    float _1754 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1672);
    float _1756 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1740);
    float _1758 = _1746 * _1746;
    float _1760 = _1750 * _1750;
    float _1762 = -_1642;
    float _1764 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1734);
    float _1766 = -_1642;
    float _1768 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1742);
    float _1770 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1718);
    float _1772 = _1758 + _1760;
    float _1774 = _1678 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1776 = _1756 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1778 = _1678 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1780 = sqrt(_1772);
    float _1782 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1774);
    float _1784 = _1678 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1786 = _1322 + _1776;
    float _1788 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1778);
    float _1790 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1732);
    float _1792 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1784);
    float _1794 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1724);
    bool _1796 = _1780 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1798 = _1784;
    float _1800 = _1758;
    float _1802 = _1760;
    float _1804 = _1738;
    float _1806 = _1736;
    if (!_1796)
    {
        _1798 = _1786;
    }
    float _1808 = _1798;
    bool _1810 = !_1796;
    float _1812 = _1808;
    if (!_1810)
    {
        float _1814 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1816 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1818 = _1780 + _1816;
        float _1820 = _1786 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1822 = rsqrt(_1772);
        float _1824 = _1818 * _1814;
        float _1826 = _1824 * 0.15915493667125701904296875;
        float _1828 = _1826 * 6.283185482025146484375;
        float _1830 = sin(_1828);
        float _1832 = _1826 * 6.283185482025146484375;
        float _1834 = cos(_1832);
        float _1836 = fma(_1830, _1820, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1838 = _1822 * _1836;
        float _1840 = fma(_1746, _1838, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1842 = _1834 + (-1.0);
        float _1844 = fma(_1750, _1838, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1846 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1848 = _1840 + _1846;
        float _1850 = _1842 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1852 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1854 = _1844 + _1852;
        float _1856 = _1848 * _1848;
        float _1858 = fma(_1786, _1834, _1850);
        float _1860 = _1854 * _1854;
        _1812 = _1858;
        _1800 = _1856;
        _1802 = _1860;
        _1804 = _1844;
        _1806 = _1840;
    }
    float _1862 = _1812;
    float _1864 = _1800;
    float _1866 = _1802;
    float _1868 = _1804;
    float _1870 = _1806;
    float _1872 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1874 = _1862 + _1872;
    float _1876 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1764);
    float _1878 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1754);
    float _1880 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1882 = fma(_1874, _1874, _1864);
    float _1884 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1768);
    float _1886 = _175 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1888 = _1880 * _1876;
    float _1890 = _1882 + _1866;
    float _1892 = _1880 * _1878;
    float _1894 = _1880 * _1884;
    float _1896 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1788);
    float _1898 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1782);
    float _1900 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1792);
    float _1902 = sqrt(_1890);
    float _1904 = fma(_1886, _1770, _1888);
    float _1906 = fma(_1886, _1790, _1892);
    float _1908 = fma(_1886, _1794, _1894);
    float _1910 = _1896 + _1904;
    float _1912 = _1898 + _1906;
    float _1914 = _1900 + _1908;
    out.m_74.x = _1910;
    out.m_74.y = _1912;
    out.m_74.z = _1914;
    bool _1916 = _1902 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1918 = isnan(_1902);
    bool _1920 = _1916 || _1918;
    bool _1922 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1924 = _1920 || _1922;
    float _1926 = _1888;
    float _1928 = _1874;
    if (!_1924)
    {
        _1926 = 1.0;
    }
    float _1930 = _1926;
    bool _1932 = !_1924;
    float _1934 = _1930;
    if (!_1932)
    {
        bool _1936 = _1902 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1938 = isnan(_1902);
        bool _1940 = _1936 || _1938;
        bool _1942 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1944 = _1940 || _1942;
        if (!_1944)
        {
            float _1946 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1948 = _1902 + _1946;
            float _1950 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1952 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1950;
            float _1954 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1956 = _1954 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1958 = 1.0 / _1952;
            float _1960 = _1948 * _1958;
            float _1962 = fma(_1960, _1956, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1934 = _1962;
            _1964 = true;
        }
        else
        {
            bool _1966 = _1902 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1968 = isnan(_1902);
            bool _1970 = _1966 || _1968;
            bool _1972 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1974 = _1970 || _1972;
            if (!_1974)
            {
                float _1976 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1978 = _1902 + _1976;
                float _1980 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1982 = _1980 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1984 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1986 = _1984 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1988 = 1.0 / _1982;
                float _1990 = _1978 * _1988;
                float _1992 = fma(_1990, _1986, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1934 = _1992;
                _1964 = true;
            }
            else
            {
                _1934 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1964 = false;
    float _1994 = _1934;
    float _1996 = _1494 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1998 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2000 = _1862 + _1998;
    float _2002 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1996);
    float _2004 = _1494 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2006 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2008 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2010 = _2006 || _2008;
    bool _2012 = isnan(0.5);
    bool _2014 = _2010 || _2012;
    float _2016 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2018 = _1868 + _2016;
    float _2020 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2002);
    bool _2022 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2024 = isnan(0.5);
    bool _2026 = _2022 || _2024;
    bool _2028 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2030 = _2026 || _2028;
    float _2032 = fma(_2000, _1994, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2034 = _2020 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2036 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2004);
    float _2038 = 1.0 / _2034;
    float _2040 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2036);
    float _2042 = _2040 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (_2030)
    {
        _1928 = 1.0;
    }
    float _2044 = _1928;
    float _2046 = _2042 + _2034;
    float _2048 = _2046 * _2038;
    float _2050 = _2048 * 0.5;
    float _2052 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2054 = _1870 + _2052;
    float _2056 = fma(_2018, _1994, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2058 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2060 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2058);
    float _2062 = fma(_2054, _1994, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2064 = -_1486;
    float _2066 = fma(_2064, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2032);
    float _2068 = -_1496;
    float _2070 = fma(_2068, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2056);
    float _2072 = -_1488;
    float _2074 = fma(_2072, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2062);
    float _2076 = 1.0 / _2060;
    float _2078 = _2066;
    float _2080 = _2074;
    float _2082 = _2070;
    float _2084 = _2076;
    float _2086 = _2044;
    float _2088 = _2062;
    float _2090 = _2056;
    if (!_2014)
    {
        float _2092 = _1506 * _1506;
        float _2094 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2096 = -_1342;
        float _2098 = _2096 + _2056;
        float _2100 = -_1330;
        float _2102 = _2100 + _2062;
        float _2104 = fma(_1516, _1516, _2092);
        float _2106 = fma(_1526, _1526, _2104);
        float _2108 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2110 = sqrt(_2106);
        float _2112 = 1.0 / _1626;
        float _2114 = _2108 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2116 = precise::min(_2110, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2118 = _2116 * _2094;
        float _2120 = -_1322;
        float _2122 = _2120 + _2032;
        float _2124 = _2118 * _2112;
        float _2126 = _2114 * _2124;
        float _2128 = _2098 * _2124;
        float _2130 = fma(_2122, _2126, _1494);
        float _2132 = fma(_2102, _2126, _1500);
        float _2134 = fma(_2114, _2128, _1512);
        _2078 = _2130;
        _2080 = _2132;
        _2082 = _2134;
        _1588 = _2124;
    }
    float _2136 = _2078;
    float _2138 = _2080;
    float _2140 = _2082;
    float _2142 = _1588;
    float _2144 = _2142;
    if (_2030)
    {
        _2144 = 1.0;
    }
    float _2146 = _2144;
    float _2148 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2150 = _2076 * _2148;
    float _2152 = _2146;
    if (!_2030)
    {
        float _2154 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2156 = _2154 * 0.15915493667125701904296875;
        float _2158 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2160 = _2156 * 6.283185482025146484375;
        float _2162 = cos(_2160);
        float _2164 = _2158 * 0.15915493667125701904296875;
        float _2166 = _2156 * 6.283185482025146484375;
        float _2168 = sin(_2166);
        float _2170 = 1.0 / _2162;
        float _2172 = _2164 * 6.283185482025146484375;
        float _2174 = cos(_2172);
        float _2176 = _2168 * _2170;
        float _2178 = _2164 * 6.283185482025146484375;
        float _2180 = sin(_2178);
        float _2182 = _2174 * _2176;
        float _2184 = 1.0 / _2182;
        float _2186 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2188 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2186;
        float _2190 = 1.0 / _2188;
        float _2192 = _2180 * _2184;
        float _2194 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2196 = fma(_2150, _2192, _2194);
        float _2198 = _2196 * _2190;
        float _2200 = precise::clamp(_2198, 0.0, 1.0);
        _2084 = _2164;
        _2086 = _2200;
    }
    float _2202 = _2084;
    float _2204 = _2086;
    float _2206 = _2202;
    if (!_2030)
    {
        float _2208 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2210 = _2208 * 0.15915493667125701904296875;
        float _2212 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2214 = _2210 * 6.283185482025146484375;
        float _2216 = cos(_2214);
        float _2218 = _2212 * 0.15915493667125701904296875;
        float _2220 = _2210 * 6.283185482025146484375;
        float _2222 = sin(_2220);
        float _2224 = 1.0 / _2216;
        float _2226 = _2218 * 6.283185482025146484375;
        float _2228 = cos(_2226);
        float _2230 = _2222 * _2224;
        float _2232 = _2218 * 6.283185482025146484375;
        float _2234 = sin(_2232);
        float _2236 = _2228 * _2230;
        float _2238 = 1.0 / _2236;
        float _2240 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2242 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2240;
        float _2244 = 1.0 / _2242;
        float _2246 = _2234 * _2238;
        float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2250 = fma(_2150, _2246, _2248);
        float _2252 = _2250 * _2244;
        float _2254 = precise::clamp(_2252, 0.0, 1.0);
        float _2256 = -_2254;
        float _2258 = _2256 + 1.0;
        _2206 = _2236;
        _2152 = _2258;
    }
    float _2260 = _2206;
    float _2262 = _2152;
    float _2264 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2266 = _2136 + _2264;
    float _2268 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2270 = _2138 + _2268;
    float _2272 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2274 = _2140 + _2272;
    float _2276 = _2266 * _2266;
    float _2278 = fma(_2270, _2270, _2276);
    float _2280 = fma(_2274, _2274, _2278);
    float _2282 = rsqrt(_2280);
    float _2284 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2286 = _2270 * _2284;
    float _2288 = _2274 * _2284;
    float _2290 = _2286 * _2286;
    float _2292 = _2288 * _2288;
    float _2294 = _2290 + _2292;
    float _2296 = sqrt(_2294);
    bool _2298 = _2296 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2300 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2302 = _2296 + _2300;
    float _2304 = _2282;
    float _2306 = _2302;
    float _2308 = _2266;
    float _2310 = _2294;
    if (_2298)
    {
        float _2312 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2304 = _2312;
    }
    float _2314 = _2304;
    float _2316 = _2314;
    if (_2298)
    {
        float _2318 = _2302 * _2314;
        _2306 = _2318;
    }
    float _2320 = _2306;
    if (_2298)
    {
        float _2322 = rsqrt(_2294);
        _2316 = _2322;
    }
    float _2324 = _2316;
    float _2326 = _2324;
    if (_2298)
    {
        float _2328 = _2320 * 0.15915493667125701904296875;
        _2088 = _2328;
    }
    float _2330 = _2088;
    float _2332 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2334 = _2274;
    float _2336 = _2330;
    if (_2298)
    {
        float _2338 = _2330 * 6.283185482025146484375;
        float _2340 = sin(_2338);
        _2334 = _2340;
    }
    float _2342 = _2334;
    float _2344 = precise::max(0.0, _2332);
    float _2346 = _2260;
    float _2348 = _2344;
    if (_2298)
    {
        float _2350 = _2330 * 6.283185482025146484375;
        float _2352 = cos(_2350);
        _2346 = _2352;
    }
    float _2354 = _2346;
    float _2356 = -_2284;
    float _2358 = -_2344;
    float _2360 = fma(_2266, _2356, _2358);
    if (_2298)
    {
        float _2362 = _2360 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2308 = _2362;
    }
    float _2364 = _2308;
    float _2366 = _2364;
    if (_2298)
    {
        float _2368 = fma(_2342, _2364, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2090 = _2368;
    }
    float _2370 = _2090;
    float _2372 = _2370;
    if (!_2298)
    {
        _2336 = _2360;
    }
    float _2374 = _2336;
    float _2376 = fma(_1500, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2378 = _2374;
    if (!_2298)
    {
        _2366 = _2288;
    }
    float _2380 = _2366;
    float _2382 = _2380;
    if (_2298)
    {
        float _2384 = _2324 * _2370;
        _2372 = _2384;
    }
    float _2386 = _2372;
    if (!_2298)
    {
        _2326 = _2286;
    }
    float _2388 = _2326;
    float _2390 = sqrt(_2280);
    float _2392 = _2388;
    if (_2298)
    {
        float _2394 = _2354 + (-1.0);
        _2348 = _2394;
    }
    float _2396 = _2348;
    float _2398 = _2396;
    if (_2298)
    {
        float _2400 = _2286 * _2386;
        _2392 = _2400;
    }
    float _2402 = _2392;
    if (_2298)
    {
        float _2404 = _2288 * _2386;
        _2382 = _2404;
    }
    float _2406 = _2382;
    if (!_2298)
    {
        _1590 = _2292;
    }
    float _2408 = _1590;
    float _2410 = _2408;
    if (_2298)
    {
        float _2412 = _2396 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2310 = _2412;
    }
    float _2414 = _2310;
    if (!_2298)
    {
        _2398 = _2290;
    }
    float _2416 = _2398;
    float _2418 = _2416;
    if (_2298)
    {
        float _2420 = _2402 * _2402;
        _2418 = _2420;
    }
    float _2422 = _2418;
    if (_2298)
    {
        float _2424 = _2406 * _2406;
        _2410 = _2424;
    }
    float _2426 = _2410;
    if (_2298)
    {
        float _2428 = fma(_2360, _2354, _2414);
        _2378 = _2428;
    }
    float _2430 = _2378;
    float _2432 = floor(_2376);
    float _2434 = fma(_2430, _2430, _2422);
    float _2436 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2438 = _2434 + _2426;
    float _2440 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2436);
    float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2444 = fma(_2390, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2442);
    float _2446 = precise::clamp(_2444, 0.0, 1.0);
    float _2448 = fma(_1512, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2450 = rsqrt(_2438);
    float _2452 = fma(_2140, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2440);
    float _2454 = -_2446;
    float _2456 = _2454 + 1.0;
    float _2458 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2460 = _2452 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2462 = -_2432;
    float _2464 = _2376 + _2462;
    float _2466 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2468 = floor(_2448);
    float _2470 = _2460 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2472 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2474 = -_2470;
    float _2476 = fma(_2474, _2466, 1.0);
    float _2478 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2480 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2472);
    float _2482 = _2450 * _2402;
    float _2484 = _2450 * _2430;
    float _2486 = _2450 * _2406;
    float _2488 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2478);
    float _2490 = fma(_2140, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2480);
    float _2492 = abs(_2456);
    float _2494 = log2(_2492);
    float _2496 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2458);
    float _2498 = fma(_2140, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2488);
    float _2500 = _2490 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2502 = _2482 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2504 = fma(_2140, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2496);
    float _2506 = _2498 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2508 = _2500 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2510 = -_2502;
    float _2512 = fma(_2484, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2510);
    float _2514 = _2504 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2516 = log2(_2476);
    float _2518 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2508);
    float _2520 = -_2486;
    float _2522 = fma(_2520, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2512);
    float _2524 = _2500 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2526 = -_2468;
    float _2528 = _2448 + _2526;
    float _2530 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2518);
    float _2532 = _2494 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2534 = fma(_2522, -0.5, 0.5);
    float _2536 = fma(_2522, 0.5, 0.5);
    float _2538 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2530);
    float _2540 = _2500 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2542 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2524);
    float _2544 = exp2(_2532);
    float _2546 = fma(_2536, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2548 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2540);
    float _2550 = _2484 + 1.0;
    float _2552 = fma(_2536, _2546, -0.212114393711090087890625);
    float _2554 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2548);
    float _2556 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2542);
    float _2558 = 1.0 / _2538;
    float _2560 = fma(_2536, _2552, 1.570728778839111328125);
    float _2562 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2554);
    float _2564 = _2516 * 0.693147182464599609375;
    float _2566 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2556);
    float _2568 = _2564 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2570 = sqrt(_2534);
    float _2572 = -_2484;
    float _2574 = fma(_2544, _2550, _2572);
    float _2576 = fma(_2574, 0.5, 0.5);
    float _2578 = _2562 * _2558;
    float _2580 = _2566 * _2558;
    float _2582 = fma(_2578, -0.5, 0.5);
    float _2584 = fma(_2580, 0.5, 0.5);
    float2 _7079 = float2(_2464, _2528);
    float _2586 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7079, float2(0.0), isnan(_7079)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7079, float2(0.0), isnan(_7079)), level(0.0)).x;
    float _2588 = _2570 * 0.636619746685028076171875;
    float3 _7093 = float3(_2584, _2582, _2568);
    float _2590 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7093, float3(0.0), isnan(_7093)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7093, float3(0.0), isnan(_7093)), level(0.0)).x;
    float3 _7104 = float3(_2584, _2582, _2568);
    float4 _2593 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7104, float3(0.0), isnan(_7104)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7104, float3(0.0), isnan(_7104)), level(0.0)).xyzw;
    float _2595 = _2593.x;
    float _2597 = _2593.y;
    float _2599 = _2593.z;
    float _2601 = _2593.w;
    float _2603 = -_2560;
    float _2605 = fma(_2588, _2603, 1.0);
    float2 _7125 = float2(_2605, _2576);
    float3 _2609 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7125, float2(0.0), isnan(_7125)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7125, float2(0.0), isnan(_7125)), level(0.0)).xyz;
    float _2611 = _2609.x;
    float _2613 = _2609.y;
    float _2615 = _2609.z;
    float _2617 = _1912 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2619 = _1912 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2621 = _1912 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2623 = abs(_2150);
    float _2625 = log2(_2623);
    float _2627 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2617);
    float _2629 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2619);
    float _2631 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2621);
    float _2633 = _2500 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2635 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2627);
    float _2637 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2629);
    float _2639 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2631);
    float _2641 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2633);
    float _2643 = _2635 * _2635;
    float _2645 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2641);
    float _2647 = fma(_2637, _2637, _2643);
    out.m_70.x = _1484;
    float _2649 = _2625 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2651 = fma(_2639, _2639, _2647);
    float _2653 = exp2(_2649);
    float _2655 = rsqrt(_2651);
    float _2657 = fma(_2653, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2659 = precise::clamp(_2657, 0.0, 1.0);
    float _2661 = fma(_2659, -2.0, 3.0);
    float _2663 = _2659 * _2659;
    float _2665 = _2635 * _2655;
    float _2667 = _2637 * _2655;
    float _2669 = _2663 * _2661;
    float _2671 = fma(_2665, -0.5, 0.5);
    float _2673 = fma(_2667, 0.5, 0.5);
    float _2675 = -_2669;
    float _2677 = _2675 + 1.0;
    float _2679 = _2671;
    float _2681 = _2673;
    if (_1010)
    {
        float _2683 = -_2671;
        float _2685 = _870 ? _2683 : _2671;
        _2679 = _2685;
    }
    float _2687 = _2679;
    float _2689 = fma(_2677, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2669);
    if (_1002)
    {
        float _2691 = -_2673;
        float _2693 = _1228 ? _2691 : _2673;
        _2681 = _2693;
    }
    float _2695 = _2681;
    bool _2697 = _2390 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2699 = isnan(_2390);
    bool _2701 = _2697 || _2699;
    bool _2703 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2705 = _2701 || _2703;
    float _2707 = _2687 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2709 = in.m_76.x;
    float _2711 = _2695 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2713 = _2707 * _1286;
    float _2715 = _2494 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2717 = _2150 <= 8000.0;
    bool _2719 = isnan(_2150);
    bool _2721 = _2717 || _2719;
    bool _2723 = isnan(8000.0);
    bool _2725 = _2721 || _2723;
    float _2727 = float(_2725);
    float _2729 = _2711 * _1232;
    float _2731 = _2538 * 0.5;
    float _2733 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2645);
    float _2735 = _2566 + _2538;
    float _2737 = exp2(_2715);
    float _2739 = _2727 * _2689;
    float _2741 = fma(_2562, -0.5, _2731);
    float _2743 = _2733 + _2538;
    float _2745 = _2739 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _2566;
    out.gl_Position.y = _2562;
    out.gl_Position.z = _2733;
    out.gl_Position.w = _2538;
    float _2747 = _2743 * 0.5;
    float _2749 = _2735 * 0.5;
    float _2751 = _2713;
    float _2753 = _2729;
    if (!_2705)
    {
        _1490 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2755 = _1490;
    out.m_64.x = _1284;
    out.m_64.y = _1126;
    out.m_64.z = _2729;
    out.m_64.w = _2713;
    out.m_78.x = _2749;
    out.m_78.y = _2741;
    out.m_78.z = _2747;
    out.m_78.w = _2538;
    float _2757 = -_2737;
    float _2759 = _2757 + 1.0;
    float _2761 = _2759 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2763 = _2755;
    float _2765 = _2755;
    if (!_2705)
    {
        _2751 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2767 = _2751;
    float _2769 = _2767;
    float _2771 = _2767;
    if (!_2705)
    {
        _2753 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2773 = _2753;
    float _2775 = _2773;
    float _2777 = _2773;
    if (!_2705)
    {
        _1260 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2779 = _1260;
    float _2781 = _2779;
    float _2783 = _2779;
    if (!_2705)
    {
        _1424 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2785 = _1424;
    float _2787 = -_2586;
    float _2789 = _2787 + 1.0;
    float _2791 = _2761 * _2590;
    float _2793 = _2789 * _2745;
    float _2795 = precise::clamp(_2793, 0.0, 1.0);
    float _2797 = -_2761;
    float _2799 = _2797 + 1.0;
    float _2801 = -_2795;
    float _2803 = fma(_2801, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2805 = _2601 * _2791;
    float _2807 = _2601 * _2799;
    float _2809 = _2803 * _2709;
    float _2811 = _2615 * _2791;
    float _2813 = fma(_2611, _2805, _2595);
    float _2815 = fma(_2613, _2805, _2597);
    float _2817 = _2809 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2819 = fma(_2601, _2811, _2599);
    float _2821 = _2204 * _2262;
    out.m_80.x = _2817;
    float _2823 = _2821 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2825 = _2821;
    float _2827 = _2785;
    float _2829 = _2785;
    if (!_2705)
    {
        _2825 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2831 = _2825;
    out.m_82.x = _2813;
    out.m_82.y = _2815;
    out.m_82.z = _2819;
    out.m_82.w = _2807;
    bool _2833 = !_2705;
    float _2835 = _2831;
    float _2837 = _2831;
    if (!_2833)
    {
        bool _2839 = _2390 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2841 = isnan(_2390);
        bool _2843 = _2839 || _2841;
        bool _2845 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2847 = _2843 || _2845;
        if (!_2847)
        {
            float _2849 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2851 = _2390 + _2849;
            float _2853 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2855 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2853;
            float _2857 = 1.0 / _2855;
            float _2859 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2861 = _2859 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2863 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2865 = _2863 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2867 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2869 = _2867 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2871 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2873 = _2871 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2875 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2877 = _2875 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2879 = _2851 * _2857;
            float _2881 = precise::clamp(_2879, 0.0, 1.0);
            float _2883 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2885 = _2883 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2887 = fma(_2881, _2861, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2889 = fma(_2881, _2885, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2891 = fma(_2881, _2865, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2893 = fma(_2881, _2869, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2895 = fma(_2881, _2873, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2897 = fma(_2881, _2877, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2771 = _2889;
            _2829 = _2895;
            _2765 = _2887;
            _2783 = _2893;
            _2777 = _2891;
            _2837 = _2897;
            _2899 = true;
        }
        else
        {
            bool _2901 = _2390 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2903 = isnan(_2390);
            bool _2905 = _2901 || _2903;
            bool _2907 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2909 = _2905 || _2907;
            if (!_2909)
            {
                _2763 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2911 = _2763;
            _2765 = _2911;
            if (!_2909)
            {
                _2769 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2913 = _2769;
            _2771 = _2913;
            if (!_2909)
            {
                _2775 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2915 = _2775;
            _2777 = _2915;
            if (!_2909)
            {
                _2781 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2917 = _2781;
            _2783 = _2917;
            if (!_2909)
            {
                _2827 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2919 = _2827;
            _2829 = _2919;
            if (!_2909)
            {
                _2835 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2921 = _2835;
            bool _2923 = !_2909;
            _2837 = _2921;
            if (!_2923)
            {
                bool _2925 = _2390 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2927 = isnan(_2390);
                bool _2929 = _2925 || _2927;
                bool _2931 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2933 = _2929 || _2931;
                if (!_2933)
                {
                    float _2935 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2937 = _2390 + _2935;
                    float _2939 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2941 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2939;
                    float _2943 = 1.0 / _2941;
                    float _2945 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2947 = _2945 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2949 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2951 = _2949 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2953 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2955 = _2953 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2957 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2959 = _2957 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2961 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2963 = _2961 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2965 = _2937 * _2943;
                    float _2967 = precise::clamp(_2965, 0.0, 1.0);
                    float _2969 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2971 = _2969 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2973 = fma(_2967, _2947, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2975 = fma(_2967, _2971, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2977 = fma(_2967, _2951, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2979 = fma(_2967, _2955, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2981 = fma(_2967, _2959, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2983 = fma(_2967, _2963, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2771 = _2975;
                    _2829 = _2981;
                    _2765 = _2973;
                    _2783 = _2979;
                    _2777 = _2977;
                    _2837 = _2983;
                    _2899 = true;
                }
                else
                {
                    _2771 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2829 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2765 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2783 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2777 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2837 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2899 = false;
    float _2985 = _2771;
    float _2987 = _2829;
    float _2989 = _2765;
    float _2991 = _2783;
    float _2993 = _2777;
    float _2995 = _2837;
    float _2997 = fma(_1912, -0.5, 0.5);
    float _2999 = precise::clamp(_2997, 0.0, 1.0);
    float _3001 = -_2985;
    float _3003 = _3001 + _2987;
    float _3005 = _2823 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3007 = -_2989;
    float _3009 = _3007 + _2991;
    float _3011 = fma(_2999, _3003, _2985);
    out.m_84.x = 0.0;
    float _3013 = -_2993;
    float _3015 = _3013 + _2995;
    float _3017 = fma(_2999, _3009, _2989);
    float _3019 = _3011 * 0.586610972881317138671875;
    out.m_55.x = _3005;
    bool _3021 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3023 = fma(_2999, _3015, _2993);
    float _3025 = fma(_3017, 0.298911988735198974609375, _3019);
    bool _3027 = _2204 > 0.0;
    bool _3029 = isnan(_2204);
    bool _3031 = _3027 || _3029;
    bool _3033 = isnan(0.0);
    bool _3035 = _3031 || _3033;
    float _3037 = fma(_3023, 0.114477999508380889892578125, _3025);
    bool _3039 = _2262 <= 0.0;
    bool _3041 = !_3035;
    bool _3043 = _3039 || _3041;
    float _3045 = -_3037;
    float _3047 = _3017 + _3045;
    float _3049 = -_3037;
    float _3051 = _3011 + _3049;
    float _3053 = -_3037;
    float _3055 = _3023 + _3053;
    float _3057 = fma(_3047, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3037);
    float _3059 = fma(_3051, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3037);
    float _3061 = fma(_3055, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3037);
    bool _3063 = !_3021;
    if (!_3063)
    {
        float _3065 = -_2136;
        float _3067 = _3065 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3069 = -_2138;
        float _3071 = _3069 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3073 = -_2140;
        float _3075 = _3073 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3077 = _3067 * _3067;
        float _3079 = fma(_3071, _3071, _3077);
        float _3081 = fma(_3075, _3075, _3079);
        float _3083 = sqrt(_3081);
        float _3085 = rsqrt(_3081);
        float _3087 = -_3083;
        float _3089 = _3087 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3091 = _3089 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3093 = precise::clamp(_3091, 0.0, 1.0);
        float _3095 = _3071 * _3085;
        float _3097 = _3067 * _3085;
        float _3099 = abs(_3093);
        float _3101 = log2(_3099);
        float _3103 = _3075 * _3085;
        float _3105 = _3095 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3107 = _1912 * _3097;
        float _3109 = -_3097;
        float _3111 = -_3105;
        float _3113 = fma(_3109, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3111);
        float _3115 = fma(_1910, _3095, _3107);
        float _3117 = -_3103;
        float _3119 = fma(_3117, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3113);
        float _3121 = fma(_1914, _3103, _3115);
        float _3123 = precise::clamp(_3121, 0.0, 1.0);
        float _3125 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3127 = _3119 + _3125;
        float _3129 = _3101 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3131 = _3127 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3133 = precise::clamp(_3131, 0.0, 1.0);
        float _3135 = exp2(_3129);
        float _3137 = _3135 * _3133;
        float _3139 = _3123 * _3137;
        float _3141 = _3139 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3143 = _3139 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3145 = _3139 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _3141;
        out.m_84.y = _3143;
        out.m_84.z = _3145;
    }
    out.m_86.x = _3057;
    out.m_86.y = _3059;
    out.m_86.z = _3061;
    if (!_3043)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_55.x = 0.0;
    float _3147 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3147;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2899 = false;
    bool _1964 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_48.w;
    float _102 = in.m_50.w;
    float _104 = trunc(_100);
    int _107 = int(_104);
    float _109 = -_102;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _111;
    bool _115 = _107 >= 1;
    float _117 = 0.0;
    float _119 = _102;
    float _121 = _111;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _117;
    if (!_115)
    {
        out.m_55.x = 0.0;
    }
    int _125 = 0;
    if (!_115)
    {
        float _127 = _123 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3215 = as_type<float>(_129);
        out.gl_Position.z = _3215;
    }
    if (!_115)
    {
        return out;
    }
    bool _133 = _102 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_102);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = float(_107);
    bool _145 = _111 >= _143;
    bool _147 = !_141;
    bool _149 = _145 || _147;
    if (_149)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _119;
    if (_149)
    {
        out.m_55.x = 0.0;
    }
    if (_149)
    {
        float _153 = _151 * 5.0;
        _131 = as_type<int>(_153);
    }
    int _155 = _131;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3270 = as_type<float>(_155);
        out.gl_Position.z = _3270;
    }
    if (_149)
    {
        return out;
    }
    float _157 = as_type<float>(int(gl_VertexIndex));
    float _159 = 1.0 / _143;
    bool _161 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _163 = _111 * _159;
    int _165 = as_type<int>(_157) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_157) & 2;
    bool _171 = _169 != 0;
    bool _173 = !_167;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_161;
    float _183 = _163;
    float _201;
    if (!_181)
    {
        float _185 = in.m_60.x;
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        _201 = _163;
    }
    _203 = false;
    float _205 = _201;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _209 = _205 + _207;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _205 + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _217 = _205 + _215;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _225 = _223 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _233 = _231 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _235 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _237 = isnan(_205);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _243 = _239 || _241;
    float _245 = float(_243);
    float _247 = 1.0 / _225;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _251 = 1.0 / _221;
    bool _253 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _255 = isnan(_205);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = 1.0 / _229;
    float _267 = _209 * _247;
    bool _269 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _271 = isnan(_205);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = 1.0 / _233;
    float _283 = _213 * _251;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _287 = _205 + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _289;
    float _293 = fma(_291, _283, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _295 = _217 * _265;
    float _297 = -_245;
    float _299 = _297 + 1.0;
    float _301 = -_263;
    float _303 = _301 + 1.0;
    float _305 = _279 * _299;
    bool _307 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _309 = isnan(_205);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = _287 * _281;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _321;
    float _325 = -_279;
    float _327 = _325 + 1.0;
    bool _329 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _331 = isnan(_205);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _345 = fma(_323, _283, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _347 = _317 * _303;
    float _349 = -_317;
    float _351 = _349 + 1.0;
    float _353 = _263 * _327;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _359 = -_339;
    float _361 = _359 + 1.0;
    float _363 = _339 * _351;
    float _365 = fma(_343, _267, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _367;
    float _371 = fma(_357, _267, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _373 = _345 * _363;
    float _375 = _293 * _363;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _377;
    float _381 = fma(_369, _295, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _383 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].x, _373);
    float _385 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].y, _375);
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _391 = fma(_379, _295, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _393 = fma(_365, _347, _383);
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _397 = _395 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _399 = fma(_371, _347, _385);
    float _401 = fma(_389, _319, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _403 = fma(_381, _353, _393);
    float _405 = fma(_397, _319, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _407 = fma(_391, _353, _399);
    float _409 = fma(_401, _305, _403);
    float _411 = fma(_405, _305, _407);
    float _413 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[147].x, _409);
    float _415 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[147].y, _411);
    bool _417 = !_249;
    if (!_417)
    {
        float _419 = in.m_60.x;
        float _421 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _423 = _419 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _425 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _427 = _425 * _421;
        float _429 = floor(_427);
        float _431 = -_429;
        float _433 = _427 + _431;
        _183 = _433;
    }
    float _435 = _183;
    float _437 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _439 = int(_437);
    float _441 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _443 = int(_441);
    bool _445 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _447 = isnan(_435);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = float(_439);
    float _459 = 1.0 / _457;
    float _461 = float(uint(_443));
    int _463 = ~_443;
    int _465 = _463 + 1;
    int _467 = ~_443;
    int _469 = _467 + 1;
    float _471 = 1.0 / _461;
    bool _473 = _443 == 0;
    int _475 = ~_443;
    int _477 = _475 + 1;
    int _479 = ~_443;
    int _481 = _479 + 1;
    float _483 = _459 * _111;
    float _485 = trunc(_483);
    int _487 = int(_485);
    int _489 = as_type<int>(_471) + (-2);
    int _491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _493 = _491 != 0;
    bool _495 = !_493;
    float _497 = _495 ? 7.345489978790283203125 : 1.0;
    float _499 = float(uint(_487));
    float _501 = as_type<float>(_489) * _499;
    float _503 = in.m_60.x;
    float _505 = in.m_60.y;
    float _507 = in.m_60.z;
    float _509 = in.m_60.w;
    float _511 = trunc(_501);
    float _513 = precise::max(_511, 0.0);
    uint _516 = uint(_513);
    int _518 = _465 * int(_516);
    int _520 = _518 + _487;
    float _522 = float(uint(_520));
    float _524 = _497 * _503;
    float _526 = as_type<float>(_489) * _522;
    float _528 = float(_487);
    float _530 = floor(_524);
    float _532 = trunc(_526);
    float _534 = precise::max(_532, 0.0);
    uint _536 = uint(_534);
    float _538 = -_530;
    float _540 = _524 + _538;
    int _542 = int(_516) + int(_536);
    float _544 = float(_443);
    int _546 = _469 * _542;
    int _548 = _546 + _487;
    bool _550 = _528 >= _544;
    bool _552 = isnan(_528);
    bool _554 = _550 || _552;
    bool _556 = isnan(_544);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    bool _562 = uint(_548) >= uint(_443);
    float _564 = trunc(_560);
    int _566 = int(_564);
    bool _568 = !_562;
    int _570 = _568 ? 0 : (-1);
    int _572 = ~_542;
    int _574 = _572 + _570;
    int _576 = _574 + 1;
    float _578 = _540 * _544;
    float _580 = _544 * _111;
    int _582 = _443 * _576;
    int _584 = _582 + _487;
    float _586 = _580 * _159;
    float _588 = trunc(_578);
    int _590 = int(_588);
    int _592 = ~_566;
    int _594 = _592 + 1;
    int _596 = _594 + 1;
    bool _598 = !_473;
    int _600 = _598 ? _584 : (-1);
    float _602 = trunc(_586);
    int _604 = int(_602);
    int _606 = _600 * _596;
    int _608 = _443 + (-1);
    int _610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _612 = _610 != 0;
    int _614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _616 = _614 != 0;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _620 = _618 != 0;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _624 = _622 != 0;
    int _626 = _566 * _608;
    int _628 = _626 + _606;
    bool _630 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _632 = isnan(0.0);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _638 = _634 || _636;
    bool _640 = !_616;
    int _642 = _640 ? 0 : 1;
    bool _644 = !_612;
    int _646 = _644 ? 0 : 1;
    bool _648 = !_624;
    int _650 = _648 ? 0 : 1;
    int _652 = abs(_642);
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _656 = _654 != 0;
    bool _658 = !_620;
    int _660 = _658 ? 0 : 1;
    int _662 = _628 * _652;
    int _664 = abs(_646);
    int _666 = abs(_650);
    bool _668 = !_656;
    int _670 = _668 ? 0 : 1;
    int _672 = abs(_660);
    int _674 = _590 * _666;
    int _676 = _674 + _487;
    int _678 = abs(_670);
    int _680 = _604 * _664;
    int _682 = _680 + _662;
    int _684 = ~_443;
    int _686 = _684 + 1;
    int _688 = _676 * _672;
    int _690 = _688 + _682;
    int _692 = ~_443;
    int _694 = _692 + 1;
    int _696 = _590 * _678;
    int _698 = _696 + _690;
    float _700 = float(uint(_698));
    float _702 = as_type<float>(_489) * _700;
    float _704 = trunc(_702);
    float _706 = precise::max(_704, 0.0);
    uint _708 = uint(_706);
    float _710 = _503 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _712 = _694 * int(_708);
    int _714 = _712 + _698;
    float _716 = float(uint(_714));
    float _718 = as_type<float>(_489) * _716;
    float _720 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _722 = log2(_720);
    float _724 = trunc(_718);
    float _726 = precise::max(_724, 0.0);
    uint _728 = uint(_726);
    float _730 = _722 * _111;
    float _732 = exp2(_730);
    int _734 = int(_708) + int(_728);
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _738 = _503 * 2.0;
    int _740 = _686 * _734;
    int _742 = _740 + _698;
    float _744 = -_736;
    float _746 = fma(_710, 2.0, _744);
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _750 = _505 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _752 = floor(_738);
    bool _754 = uint(_742) >= uint(_443);
    float _756 = fma(_750, -2.0, _748);
    float _758 = -_732;
    float _760 = _758 + 1.0;
    bool _762 = !_754;
    int _764 = _762 ? 0 : (-1);
    bool _766 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _768 = isnan(1.0);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _774 = _770 || _772;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _778 = ~_734;
    int _780 = _778 + _764;
    int _782 = _780 + 1;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _786 = 1.0 + _784;
    float _788 = _638 ? _760 : 0.0;
    int _790 = _443 * _782;
    int _792 = _790 + _698;
    float _794 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[78].z, _776);
    float _796 = 1.0 / _786;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _800 = _752 > 0.0;
    float _802 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].z, _794);
    bool _804 = !_473;
    int _806 = _804 ? _792 : (-1);
    float _808 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[78].w, _798);
    float _810 = float(uint(_676));
    float _812 = -_111;
    float _814 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[76].x, _746);
    int _816 = _806 & 3;
    bool _818 = _816 != 0;
    float _820 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[76].y, _756);
    int _822 = _806 & 3;
    bool _824 = _822 != 0;
    float _826 = as_type<float>(_489) * _810;
    int _828 = _818 ? 0 : 1;
    float _830 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].w, _808);
    bool _832 = uint(_822) > 1u;
    float _834 = -_802;
    float _836 = _834 + 1.0;
    bool _838 = _822 != 3;
    float _840 = trunc(_826);
    float _842 = precise::max(_840, 0.0);
    uint _844 = uint(_842);
    bool _846 = _752 >= 0.0;
    bool _848 = isnan(_752);
    bool _850 = _846 || _848;
    bool _852 = isnan(0.0);
    bool _854 = _850 || _852;
    if (_774)
    {
        float _856 = _788 * _796;
        _121 = _856;
    }
    float _858 = _121;
    bool _860 = uint(_822) >= 2u;
    float _862 = -_830;
    float _864 = _862 + 1.0;
    int _866 = _854 ? 0 : 1;
    int _868 = _860 ? 0 : 1;
    bool _870 = _509 > 0.5;
    float _872 = _505 * 2.0;
    int _874 = ~_866;
    int _876 = _874 + 1;
    int _878 = _876 + 1;
    int _880 = ~_828;
    int _882 = _880 + 1;
    int _884 = _882 + 1;
    float _886 = floor(_872);
    int _888 = ~_868;
    int _890 = _888 + 1;
    int _892 = _890 + 1;
    int _894 = _878;
    int _896 = _884;
    int _898 = _892;
    if (!_800)
    {
        int _900 = ~_866;
        int _902 = _900 + 1;
        _894 = _902;
    }
    int _904 = _894;
    if (!_832)
    {
        int _906 = ~_828;
        int _908 = _906 + 1;
        _896 = _908;
    }
    int _910 = _896;
    if (_838)
    {
        int _912 = ~_868;
        int _914 = _912 + 1;
        _898 = _914;
    }
    int _916 = _898;
    float _918 = in.m_48.x;
    float _920 = in.m_48.y;
    float _922 = in.m_48.z;
    bool _924 = _503 > 0.5;
    int _926 = _477 * int(_844);
    int _928 = _926 + _676;
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _932 = _930 != 0;
    float _934 = -_175;
    int _936 = _924 ? as_type<int>(_934) : as_type<int>(_175);
    bool _938 = _505 > 0.5;
    bool _940 = !_932;
    float _942 = _940 ? _175 : as_type<float>(_936);
    float _944 = float(uint(_928));
    float _946 = _942 + 0.5;
    float _948 = -_179;
    int _950 = _938 ? as_type<int>(_948) : as_type<int>(_179);
    float _952 = as_type<float>(_489) * _944;
    bool _954 = _886 >= 0.0;
    bool _956 = isnan(_886);
    bool _958 = _954 || _956;
    bool _960 = isnan(0.0);
    bool _962 = _958 || _960;
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _966 = _964 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _968 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _970 = _968 != 0;
    float _972 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[80].x, _814);
    int _974 = _962 ? 0 : 1;
    float _976 = trunc(_952);
    float _978 = precise::max(_976, 0.0);
    uint _980 = uint(_978);
    bool _982 = !_970;
    int _984 = _982 ? 0 : 1;
    float _986 = _920 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _988 = _886 > 0.0;
    float _990 = _920 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _992 = _920 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _996 = _994 != 0;
    float _998 = 1.0 / _966;
    int _1000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1002 = _1000 != 0;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1006 = _1004 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1010 = _1008 != 0;
    float _1012 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[4].x, _986);
    float _1014 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[6].x, _992);
    float _1016 = 1.0 / _1006;
    float _1018 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1020 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[5].x, _990);
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1024 = int(_844) + int(_980);
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1028 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1030 = _1018 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1032 = _1022 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1034 = _1026 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1036;
    float _1040 = _505 + _507;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1044 = _1042 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    out.m_62.x = _1030;
    out.m_62.y = _1032;
    out.m_62.z = _1034;
    out.m_62.w = _1028;
    float _1046 = _1038 * _998;
    float _1048 = _507 * 2.0;
    int _1050 = _481 * _1024;
    int _1052 = _1050 + _676;
    bool _1054 = !_996;
    float _1056 = _1054 ? _179 : as_type<float>(_950);
    float _1058 = _1040 + (-1.0);
    int _1060 = ~_974;
    int _1062 = _1060 + 1;
    int _1064 = _1062 + 1;
    float _1066 = _1044 * _1016;
    bool _1068 = uint(_1052) >= uint(_443);
    float _1070 = _505 + _503;
    int _1072 = _1064;
    if (!_988)
    {
        int _1074 = ~_974;
        int _1076 = _1074 + 1;
        _1072 = _1076;
    }
    int _1078 = _1072;
    float _1080 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1012);
    bool _1082 = !_1068;
    int _1084 = _1082 ? 0 : (-1);
    float _1086 = _1070 + (-1.0);
    int _1088 = _806 >> 31;
    float _1090 = floor(_1048);
    float _1092 = _1056 + (-0.5);
    int _1094 = _1088 & 3;
    float _1096 = _505 + (-0.5);
    bool _1098 = !_824;
    int _1100 = _1098 ? 0 : 1;
    float _1102 = -_1092;
    float _1104 = -_820;
    float _1106 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1104);
    int _1108 = _806 + _1094;
    bool _1110 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1112 = isnan(_435);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1118 = _1114 || _1116;
    float _1120 = float(_1118);
    float _1122 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1124 = _1108 >> 2;
    float _1126 = fma(_1056, _864, _1106);
    float _1128 = -_1120;
    float _1130 = _1128 + 1.0;
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1134 = _1132 != 0;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1138 = _1136 != 0;
    int _1140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1142 = _1140 != 0;
    bool _1144 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1146 = isnan(_435);
    bool _1148 = _1144 || _1146;
    bool _1150 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1152 = _1148 || _1150;
    float _1154 = float(_1152);
    float _1156 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1158 = _1124 << 4;
    int _1160 = _1158 + 368;
    bool _1162 = !_1138;
    int _1164 = _1162 ? 0 : 1;
    float _1166 = _1154 * _1130;
    float _1168 = -_1154;
    float _1170 = _1168 + 1.0;
    bool _1172 = _1090 > 0.0;
    uint _1174 = uint(int(uint(_1160) >> uint(2)));
    uint _1176 = uint(int(uint(int(_1174)) >> uint(2)));
    int _1178 = int(_1174) & 3;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[int(_1176)][_1178];
    int _1182 = int(_1174) + 1;
    uint _1184 = uint(int(uint(_1182) >> uint(2)));
    int _1186 = _1182 & 3;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[int(_1184)][_1186];
    bool _1190 = !_1134;
    int _1192 = _1190 ? 0 : 1;
    float _1194 = _455 * _1170;
    bool _1196 = _1090 >= 0.0;
    bool _1198 = isnan(_1090);
    bool _1200 = _1196 || _1198;
    bool _1202 = isnan(0.0);
    bool _1204 = _1200 || _1202;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1208 = _435 + _1206;
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1212 = _435 + _1210;
    float _1214 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1020);
    float _1216 = -_455;
    float _1218 = _1216 + 1.0;
    float _1220 = fma(_1046, _1208, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1222 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1014);
    int _1224 = _1204 ? 0 : 1;
    float _1226 = fma(_1066, _1212, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1228 = _507 > 0.5;
    float _1230 = _1220 * _1194;
    float _1232 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1234 = ~_1224;
    int _1236 = _1234 + 1;
    int _1238 = _1236 + 1;
    int _1240 = _1160 + 8;
    uint _1242 = uint(int(uint(_1240) >> uint(2)));
    uint _1244 = uint(int(uint(int(_1242)) >> uint(2)));
    int _1246 = int(_1242) & 3;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[int(_1244)][_1246];
    int _1250 = int(_1242) + 1;
    uint _1252 = uint(int(uint(_1250) >> uint(2)));
    int _1254 = _1250 & 3;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[int(_1252)][_1254];
    int _1258 = _1238;
    float _1260 = _1126;
    if (!_1172)
    {
        int _1262 = ~_1224;
        int _1264 = _1262 + 1;
        _1258 = _1264;
    }
    int _1266 = _1258;
    float _1268 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1230);
    float _1270 = -_175;
    int _1272 = _1228 ? as_type<int>(_1270) : as_type<int>(_175);
    int _1274 = abs(_1164);
    float _1276 = fma(_1226, _1166, _1268);
    bool _1278 = !_1002;
    float _1280 = _1278 ? _175 : as_type<float>(_1272);
    float _1282 = -_836;
    float _1284 = fma(_942, _1282, _972);
    float _1286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1288 = -_179;
    int _1290 = _870 ? as_type<int>(_1288) : as_type<int>(_179);
    float _1292 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _1294 = abs(_910);
    bool _1296 = !_1010;
    float _1298 = _1296 ? _179 : as_type<float>(_1290);
    float _1300 = _1292 * _1232;
    float _1302 = float(_904);
    float _1304 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1306 = float(_1274);
    int _1308 = ~_1024;
    int _1310 = _1308 + _1084;
    int _1312 = _1310 + 1;
    float _1314 = _1306 * _1302;
    float _1316 = _1304 * _1286;
    int _1318 = _443 * _1312;
    int _1320 = _1318 + _676;
    float _1322 = _1214 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1324 = ~_1294;
    int _1326 = _1324 + 1;
    int _1328 = _1326 + 1;
    float _1330 = _1080 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1332 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1276);
    float _1334 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1336 = _1322 + _1334;
    out.m_64.x = _1284;
    out.m_64.y = _1126;
    out.m_64.z = _1300;
    out.m_64.w = _1316;
    int _1338 = _1328 * as_type<int>(_1188);
    int _1340 = abs(_1100);
    float _1342 = _1222 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1344 = abs(_916);
    float _1346 = _1336 * _1336;
    int _1348 = ~_1340;
    int _1350 = _1348 + 1;
    int _1352 = _1350 + 1;
    float _1354 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1356 = _1342 + _1354;
    int _1358 = _1352 * as_type<int>(_1180);
    int _1360 = _1358 + _1338;
    float _1362 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1364 = _1330 + _1362;
    float _1366 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1372 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1366);
    bool _1374 = !_473;
    int _1376 = _1374 ? _1320 : (-1);
    float _1378 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1380 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1372);
    bool _1382 = _822 != 3;
    float _1384 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1386 = ~_1344;
    int _1388 = _1386 + 1;
    int _1390 = _1388 + 1;
    bool _1392 = !_1382;
    int _1394 = _1392 ? 0 : (-1);
    bool _1396 = _1380 >= 0.0;
    int _1398 = _1390 * as_type<int>(_1248);
    int _1400 = _1398 + _1360;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1404 = abs(_1394);
    float _1406 = in.m_66.x;
    float _1408 = in.m_66.y;
    float _1410 = in.m_66.z;
    int _1412 = abs(_1192);
    float _1414 = _1402 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1416 = abs(_984);
    int _1418 = ~_1404;
    int _1420 = _1418 + 1;
    int _1422 = _1420 + 1;
    float _1424 = _1284;
    if (_1396)
    {
        out.m_55.x = 0.0;
    }
    float _1426 = float(_1266);
    int _1428 = _1422 * as_type<int>(_1256);
    int _1430 = _1428 + _1400;
    float _1432 = float(_1412);
    float _1434 = fma(_1364, _1364, _1346);
    int _1436 = ~_1416;
    int _1438 = _1436 + 1;
    int _1440 = _1438 + 1;
    float _1442 = _1332 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1444 = _503 + (-0.5);
    float _1446 = _1432 * _1426;
    float _1448 = fma(_1356, _1356, _1434);
    int _1450 = _1430 * _1440;
    out.m_68.x = _1378;
    out.m_68.y = _1384;
    out.m_68.z = _1414;
    out.m_68.w = _1442;
    float _1452 = _1446 * (-2.0);
    float _1454 = _1446;
    if (_1396)
    {
        _1454 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1456 = _1454;
    int _1458 = _1376 * _1416;
    int _1460 = _1458 + _1450;
    float _1462 = rsqrt(_1448);
    float _1464 = fma(_1452, _1406, _1406);
    bool _1466 = !_1142;
    int _1468 = _1466 ? 0 : 1;
    int _1470 = as_type<int>(_1456);
    if (_1396)
    {
        float _1472 = _1456 * 5.0;
        _1470 = as_type<int>(_1472);
    }
    int _1474 = _1470;
    float _1476 = fma(_1156, _1452, _1156);
    float _1478 = fma(_1444, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1464);
    if (_1396)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5265 = as_type<float>(_1474);
        out.gl_Position.z = _5265;
    }
    int _1480 = abs(_1468);
    float _1482 = fma(_1476, _858, _1478);
    float _1484 = float(_1460);
    float _1486 = _1336 * _1462;
    out.m_70.x = _1484;
    float _1488 = _1364 * _1462;
    float _1490 = _1484;
    if (_1396)
    {
        return out;
    }
    float _1492 = -_1486;
    float _1494 = fma(_1492, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1322);
    float _1496 = _1356 * _1462;
    float _1498 = -_1488;
    float _1500 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1330);
    float _1502 = _1314 * (-2.0);
    float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1506 = _1494 + _1504;
    float _1508 = float(_1078);
    float _1510 = -_1496;
    float _1512 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1342);
    float _1514 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1516 = _1500 + _1514;
    float _1518 = _1506 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1520 = float(_1480);
    float _1522 = fma(_1502, _1408, _1408);
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1526 = _1512 + _1524;
    float _1528 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1518);
    float _1530 = fma(_1122, _1502, _1122);
    float _1532 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1522);
    float _1534 = _1520 * _1508;
    float _1536 = _507 + _503;
    float _1538 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1528);
    float _1540 = fma(_1530, _858, _1532);
    float _1542 = -_1486;
    float _1544 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1336);
    float _1546 = _1536 + (-1.0);
    float _1548 = _1534 * (-2.0);
    float _1550 = _1540 * 0.15915493667125701904296875;
    bool _1552 = _1538 >= 0.0;
    float _1554 = -_1488;
    float _1556 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1364);
    float _1558 = _1544 * _1544;
    float _1560 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1562 = _507 + (-0.5);
    float _1564 = fma(_1548, _1410, _1410);
    float _1566 = in.m_72.x;
    float _1568 = in.m_72.y;
    float _1570 = fma(_1556, _1556, _1558);
    float _1572 = -_1496;
    float _1574 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1356);
    float _1576 = fma(_1560, _1548, _1560);
    float _1578 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1564);
    float _1580 = _1482 * 0.15915493667125701904296875;
    float _1582 = fma(_1574, _1574, _1570);
    float _1584 = _1574;
    int _1586 = as_type<int>(_1562);
    float _1588 = _1526;
    float _1590 = _1500;
    if (_1552)
    {
        _1584 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1592 = _1584;
    float _1594 = fma(_1576, _858, _1578);
    float _1596 = _1580 * 6.283185482025146484375;
    float _1598 = sin(_1596);
    if (_1552)
    {
        out.m_55.x = 0.0;
    }
    float _1600 = _1594 * 0.15915493667125701904296875;
    if (_1552)
    {
        float _1602 = _1592 * 5.0;
        _1586 = as_type<int>(_1602);
    }
    int _1604 = _1586;
    float _1606 = _1580 * 6.283185482025146484375;
    float _1608 = cos(_1606);
    if (_1552)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5485 = as_type<float>(_1604);
        out.gl_Position.z = _5485;
    }
    float _1610 = _415 * _1568;
    float _1612 = _1550 * 6.283185482025146484375;
    float _1614 = sin(_1612);
    float _1616 = sqrt(_1582);
    float _1618 = _1550 * 6.283185482025146484375;
    float _1620 = cos(_1618);
    if (_1552)
    {
        return out;
    }
    float _1622 = _1600 * 6.283185482025146484375;
    float _1624 = cos(_1622);
    float _1626 = _1462 * _1616;
    float _1628 = _1610 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1630 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _1632 = _413 * _1566;
    float _1634 = _1608 * _1620;
    float _1636 = _1628 * _1626;
    float _1638 = _1608 * _1614;
    float _1640 = _1600 * 6.283185482025146484375;
    float _1642 = sin(_1640);
    float _1644 = _1598 * _1620;
    float _1646 = _1630 * _1636;
    float _1648 = _1632 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1650 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _1652 = _1598 * _1614;
    float _1654 = _1626 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1656 = _1654 * 0.5;
    float _1658 = _1648 * _1626;
    float _1660 = _1608 * _1624;
    float _1662 = _1620 * _1624;
    float _1664 = _1598 * _1624;
    float _1666 = _1650 * _1658;
    float _1668 = _1660 * _1646;
    float _1670 = _1614 * _1624;
    float _1672 = _1660 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1674 = fma(_1642, _1634, _1652);
    float _1676 = -_1644;
    float _1678 = fma(_1642, _1638, _1676);
    float _1680 = -_1646;
    float _1682 = _1642 * _1680;
    float _1684 = -_1638;
    float _1686 = fma(_1642, _1644, _1684);
    float _1688 = fma(_1674, _1666, _1668);
    float _1690 = _1664 * _1646;
    float _1692 = fma(_1662, _1666, _1682);
    float _1694 = fma(_1642, _1652, _1634);
    float _1696 = fma(_1678, _1656, _1688);
    float _1698 = fma(_1686, _1666, _1690);
    float _1700 = fma(_1670, _1656, _1692);
    float _1702 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1704 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1706 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1708 = fma(_1694, _1656, _1698);
    float _1710 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1712 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1704);
    float _1714 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1706);
    float _1716 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1718 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1702);
    float _1720 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1712);
    float _1722 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1714);
    float _1724 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1716);
    float _1726 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1728 = _1720 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1730 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1732 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1710);
    float _1734 = _1660 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1736 = _1330 + _1728;
    float _1738 = _1342 + _1730;
    float _1740 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1726);
    float _1742 = _1660 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1744 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1746 = _1736 + _1744;
    float _1748 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1750 = _1738 + _1748;
    float _1752 = -_1642;
    float _1754 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1672);
    float _1756 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1740);
    float _1758 = _1746 * _1746;
    float _1760 = _1750 * _1750;
    float _1762 = -_1642;
    float _1764 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1734);
    float _1766 = -_1642;
    float _1768 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1742);
    float _1770 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1718);
    float _1772 = _1758 + _1760;
    float _1774 = _1678 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1776 = _1756 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1778 = _1678 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1780 = sqrt(_1772);
    float _1782 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1774);
    float _1784 = _1678 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1786 = _1322 + _1776;
    float _1788 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1778);
    float _1790 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1732);
    float _1792 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1784);
    float _1794 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1724);
    bool _1796 = _1780 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1798 = _1784;
    float _1800 = _1758;
    float _1802 = _1760;
    float _1804 = _1738;
    float _1806 = _1736;
    if (!_1796)
    {
        _1798 = _1786;
    }
    float _1808 = _1798;
    bool _1810 = !_1796;
    float _1812 = _1808;
    if (!_1810)
    {
        float _1814 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1816 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1818 = _1780 + _1816;
        float _1820 = _1786 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1822 = rsqrt(_1772);
        float _1824 = _1818 * _1814;
        float _1826 = _1824 * 0.15915493667125701904296875;
        float _1828 = _1826 * 6.283185482025146484375;
        float _1830 = sin(_1828);
        float _1832 = _1826 * 6.283185482025146484375;
        float _1834 = cos(_1832);
        float _1836 = fma(_1830, _1820, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1838 = _1822 * _1836;
        float _1840 = fma(_1746, _1838, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1842 = _1834 + (-1.0);
        float _1844 = fma(_1750, _1838, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1846 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1848 = _1840 + _1846;
        float _1850 = _1842 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1852 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1854 = _1844 + _1852;
        float _1856 = _1848 * _1848;
        float _1858 = fma(_1786, _1834, _1850);
        float _1860 = _1854 * _1854;
        _1812 = _1858;
        _1800 = _1856;
        _1802 = _1860;
        _1804 = _1844;
        _1806 = _1840;
    }
    float _1862 = _1812;
    float _1864 = _1800;
    float _1866 = _1802;
    float _1868 = _1804;
    float _1870 = _1806;
    float _1872 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1874 = _1862 + _1872;
    float _1876 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1764);
    float _1878 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1754);
    float _1880 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1882 = fma(_1874, _1874, _1864);
    float _1884 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1768);
    float _1886 = _175 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1888 = _1880 * _1876;
    float _1890 = _1882 + _1866;
    float _1892 = _1880 * _1878;
    float _1894 = _1880 * _1884;
    float _1896 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1788);
    float _1898 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1782);
    float _1900 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1792);
    float _1902 = sqrt(_1890);
    float _1904 = fma(_1886, _1770, _1888);
    float _1906 = fma(_1886, _1790, _1892);
    float _1908 = fma(_1886, _1794, _1894);
    float _1910 = _1896 + _1904;
    float _1912 = _1898 + _1906;
    float _1914 = _1900 + _1908;
    out.m_74.x = _1910;
    out.m_74.y = _1912;
    out.m_74.z = _1914;
    bool _1916 = _1902 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1918 = isnan(_1902);
    bool _1920 = _1916 || _1918;
    bool _1922 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1924 = _1920 || _1922;
    float _1926 = _1888;
    float _1928 = _1874;
    if (!_1924)
    {
        _1926 = 1.0;
    }
    float _1930 = _1926;
    bool _1932 = !_1924;
    float _1934 = _1930;
    if (!_1932)
    {
        bool _1936 = _1902 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1938 = isnan(_1902);
        bool _1940 = _1936 || _1938;
        bool _1942 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1944 = _1940 || _1942;
        if (!_1944)
        {
            float _1946 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1948 = _1902 + _1946;
            float _1950 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1952 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1950;
            float _1954 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1956 = _1954 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1958 = 1.0 / _1952;
            float _1960 = _1948 * _1958;
            float _1962 = fma(_1960, _1956, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1934 = _1962;
            _1964 = true;
        }
        else
        {
            bool _1966 = _1902 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1968 = isnan(_1902);
            bool _1970 = _1966 || _1968;
            bool _1972 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1974 = _1970 || _1972;
            if (!_1974)
            {
                float _1976 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1978 = _1902 + _1976;
                float _1980 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1982 = _1980 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1984 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1986 = _1984 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1988 = 1.0 / _1982;
                float _1990 = _1978 * _1988;
                float _1992 = fma(_1990, _1986, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1934 = _1992;
                _1964 = true;
            }
            else
            {
                _1934 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1964 = false;
    float _1994 = _1934;
    float _1996 = _1494 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1998 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2000 = _1862 + _1998;
    float _2002 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1996);
    float _2004 = _1494 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2006 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2008 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2010 = _2006 || _2008;
    bool _2012 = isnan(0.5);
    bool _2014 = _2010 || _2012;
    float _2016 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2018 = _1868 + _2016;
    float _2020 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2002);
    bool _2022 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2024 = isnan(0.5);
    bool _2026 = _2022 || _2024;
    bool _2028 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2030 = _2026 || _2028;
    float _2032 = fma(_2000, _1994, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2034 = _2020 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2036 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2004);
    float _2038 = 1.0 / _2034;
    float _2040 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2036);
    float _2042 = _2040 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (_2030)
    {
        _1928 = 1.0;
    }
    float _2044 = _1928;
    float _2046 = _2042 + _2034;
    float _2048 = _2046 * _2038;
    float _2050 = _2048 * 0.5;
    float _2052 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2054 = _1870 + _2052;
    float _2056 = fma(_2018, _1994, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2058 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2060 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2058);
    float _2062 = fma(_2054, _1994, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2064 = -_1486;
    float _2066 = fma(_2064, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2032);
    float _2068 = -_1496;
    float _2070 = fma(_2068, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2056);
    float _2072 = -_1488;
    float _2074 = fma(_2072, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2062);
    float _2076 = 1.0 / _2060;
    float _2078 = _2066;
    float _2080 = _2074;
    float _2082 = _2070;
    float _2084 = _2076;
    float _2086 = _2044;
    float _2088 = _2062;
    float _2090 = _2056;
    if (!_2014)
    {
        float _2092 = _1506 * _1506;
        float _2094 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2096 = -_1342;
        float _2098 = _2096 + _2056;
        float _2100 = -_1330;
        float _2102 = _2100 + _2062;
        float _2104 = fma(_1516, _1516, _2092);
        float _2106 = fma(_1526, _1526, _2104);
        float _2108 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2110 = sqrt(_2106);
        float _2112 = 1.0 / _1626;
        float _2114 = _2108 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2116 = precise::min(_2110, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2118 = _2116 * _2094;
        float _2120 = -_1322;
        float _2122 = _2120 + _2032;
        float _2124 = _2118 * _2112;
        float _2126 = _2114 * _2124;
        float _2128 = _2098 * _2124;
        float _2130 = fma(_2122, _2126, _1494);
        float _2132 = fma(_2102, _2126, _1500);
        float _2134 = fma(_2114, _2128, _1512);
        _2078 = _2130;
        _2080 = _2132;
        _2082 = _2134;
        _1588 = _2124;
    }
    float _2136 = _2078;
    float _2138 = _2080;
    float _2140 = _2082;
    float _2142 = _1588;
    float _2144 = _2142;
    if (_2030)
    {
        _2144 = 1.0;
    }
    float _2146 = _2144;
    float _2148 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2150 = _2076 * _2148;
    float _2152 = _2146;
    if (!_2030)
    {
        float _2154 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2156 = _2154 * 0.15915493667125701904296875;
        float _2158 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2160 = _2156 * 6.283185482025146484375;
        float _2162 = cos(_2160);
        float _2164 = _2158 * 0.15915493667125701904296875;
        float _2166 = _2156 * 6.283185482025146484375;
        float _2168 = sin(_2166);
        float _2170 = 1.0 / _2162;
        float _2172 = _2164 * 6.283185482025146484375;
        float _2174 = cos(_2172);
        float _2176 = _2168 * _2170;
        float _2178 = _2164 * 6.283185482025146484375;
        float _2180 = sin(_2178);
        float _2182 = _2174 * _2176;
        float _2184 = 1.0 / _2182;
        float _2186 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2188 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2186;
        float _2190 = 1.0 / _2188;
        float _2192 = _2180 * _2184;
        float _2194 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2196 = fma(_2150, _2192, _2194);
        float _2198 = _2196 * _2190;
        float _2200 = precise::clamp(_2198, 0.0, 1.0);
        _2084 = _2164;
        _2086 = _2200;
    }
    float _2202 = _2084;
    float _2204 = _2086;
    float _2206 = _2202;
    if (!_2030)
    {
        float _2208 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2210 = _2208 * 0.15915493667125701904296875;
        float _2212 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2214 = _2210 * 6.283185482025146484375;
        float _2216 = cos(_2214);
        float _2218 = _2212 * 0.15915493667125701904296875;
        float _2220 = _2210 * 6.283185482025146484375;
        float _2222 = sin(_2220);
        float _2224 = 1.0 / _2216;
        float _2226 = _2218 * 6.283185482025146484375;
        float _2228 = cos(_2226);
        float _2230 = _2222 * _2224;
        float _2232 = _2218 * 6.283185482025146484375;
        float _2234 = sin(_2232);
        float _2236 = _2228 * _2230;
        float _2238 = 1.0 / _2236;
        float _2240 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2242 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2240;
        float _2244 = 1.0 / _2242;
        float _2246 = _2234 * _2238;
        float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2250 = fma(_2150, _2246, _2248);
        float _2252 = _2250 * _2244;
        float _2254 = precise::clamp(_2252, 0.0, 1.0);
        float _2256 = -_2254;
        float _2258 = _2256 + 1.0;
        _2206 = _2236;
        _2152 = _2258;
    }
    float _2260 = _2206;
    float _2262 = _2152;
    float _2264 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2266 = _2136 + _2264;
    float _2268 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2270 = _2138 + _2268;
    float _2272 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2274 = _2140 + _2272;
    float _2276 = _2266 * _2266;
    float _2278 = fma(_2270, _2270, _2276);
    float _2280 = fma(_2274, _2274, _2278);
    float _2282 = rsqrt(_2280);
    float _2284 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2286 = _2270 * _2284;
    float _2288 = _2274 * _2284;
    float _2290 = _2286 * _2286;
    float _2292 = _2288 * _2288;
    float _2294 = _2290 + _2292;
    float _2296 = sqrt(_2294);
    bool _2298 = _2296 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2300 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2302 = _2296 + _2300;
    float _2304 = _2282;
    float _2306 = _2302;
    float _2308 = _2266;
    float _2310 = _2294;
    if (_2298)
    {
        float _2312 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2304 = _2312;
    }
    float _2314 = _2304;
    float _2316 = _2314;
    if (_2298)
    {
        float _2318 = _2302 * _2314;
        _2306 = _2318;
    }
    float _2320 = _2306;
    if (_2298)
    {
        float _2322 = rsqrt(_2294);
        _2316 = _2322;
    }
    float _2324 = _2316;
    float _2326 = _2324;
    if (_2298)
    {
        float _2328 = _2320 * 0.15915493667125701904296875;
        _2088 = _2328;
    }
    float _2330 = _2088;
    float _2332 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2334 = _2274;
    float _2336 = _2330;
    if (_2298)
    {
        float _2338 = _2330 * 6.283185482025146484375;
        float _2340 = sin(_2338);
        _2334 = _2340;
    }
    float _2342 = _2334;
    float _2344 = precise::max(0.0, _2332);
    float _2346 = _2260;
    float _2348 = _2344;
    if (_2298)
    {
        float _2350 = _2330 * 6.283185482025146484375;
        float _2352 = cos(_2350);
        _2346 = _2352;
    }
    float _2354 = _2346;
    float _2356 = -_2284;
    float _2358 = -_2344;
    float _2360 = fma(_2266, _2356, _2358);
    if (_2298)
    {
        float _2362 = _2360 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2308 = _2362;
    }
    float _2364 = _2308;
    float _2366 = _2364;
    if (_2298)
    {
        float _2368 = fma(_2342, _2364, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2090 = _2368;
    }
    float _2370 = _2090;
    float _2372 = _2370;
    if (!_2298)
    {
        _2336 = _2360;
    }
    float _2374 = _2336;
    float _2376 = fma(_1500, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2378 = _2374;
    if (!_2298)
    {
        _2366 = _2288;
    }
    float _2380 = _2366;
    float _2382 = _2380;
    if (_2298)
    {
        float _2384 = _2324 * _2370;
        _2372 = _2384;
    }
    float _2386 = _2372;
    if (!_2298)
    {
        _2326 = _2286;
    }
    float _2388 = _2326;
    float _2390 = sqrt(_2280);
    float _2392 = _2388;
    if (_2298)
    {
        float _2394 = _2354 + (-1.0);
        _2348 = _2394;
    }
    float _2396 = _2348;
    float _2398 = _2396;
    if (_2298)
    {
        float _2400 = _2286 * _2386;
        _2392 = _2400;
    }
    float _2402 = _2392;
    if (_2298)
    {
        float _2404 = _2288 * _2386;
        _2382 = _2404;
    }
    float _2406 = _2382;
    if (!_2298)
    {
        _1590 = _2292;
    }
    float _2408 = _1590;
    float _2410 = _2408;
    if (_2298)
    {
        float _2412 = _2396 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2310 = _2412;
    }
    float _2414 = _2310;
    if (!_2298)
    {
        _2398 = _2290;
    }
    float _2416 = _2398;
    float _2418 = _2416;
    if (_2298)
    {
        float _2420 = _2402 * _2402;
        _2418 = _2420;
    }
    float _2422 = _2418;
    if (_2298)
    {
        float _2424 = _2406 * _2406;
        _2410 = _2424;
    }
    float _2426 = _2410;
    if (_2298)
    {
        float _2428 = fma(_2360, _2354, _2414);
        _2378 = _2428;
    }
    float _2430 = _2378;
    float _2432 = floor(_2376);
    float _2434 = fma(_2430, _2430, _2422);
    float _2436 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2438 = _2434 + _2426;
    float _2440 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2436);
    float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2444 = fma(_2390, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2442);
    float _2446 = precise::clamp(_2444, 0.0, 1.0);
    float _2448 = fma(_1512, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2450 = rsqrt(_2438);
    float _2452 = fma(_2140, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2440);
    float _2454 = -_2446;
    float _2456 = _2454 + 1.0;
    float _2458 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2460 = _2452 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2462 = -_2432;
    float _2464 = _2376 + _2462;
    float _2466 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2468 = floor(_2448);
    float _2470 = _2460 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2472 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2474 = -_2470;
    float _2476 = fma(_2474, _2466, 1.0);
    float _2478 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2480 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2472);
    float _2482 = _2450 * _2402;
    float _2484 = _2450 * _2430;
    float _2486 = _2450 * _2406;
    float _2488 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2478);
    float _2490 = fma(_2140, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2480);
    float _2492 = abs(_2456);
    float _2494 = log2(_2492);
    float _2496 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2458);
    float _2498 = fma(_2140, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2488);
    float _2500 = _2490 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2502 = _2482 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2504 = fma(_2140, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2496);
    float _2506 = _2498 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2508 = _2500 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2510 = -_2502;
    float _2512 = fma(_2484, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2510);
    float _2514 = _2504 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2516 = log2(_2476);
    float _2518 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2508);
    float _2520 = -_2486;
    float _2522 = fma(_2520, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2512);
    float _2524 = _2500 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2526 = -_2468;
    float _2528 = _2448 + _2526;
    float _2530 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2518);
    float _2532 = _2494 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2534 = fma(_2522, -0.5, 0.5);
    float _2536 = fma(_2522, 0.5, 0.5);
    float _2538 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2530);
    float _2540 = _2500 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2542 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2524);
    float _2544 = exp2(_2532);
    float _2546 = fma(_2536, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2548 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2540);
    float _2550 = _2484 + 1.0;
    float _2552 = fma(_2536, _2546, -0.212114393711090087890625);
    float _2554 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2548);
    float _2556 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2542);
    float _2558 = 1.0 / _2538;
    float _2560 = fma(_2536, _2552, 1.570728778839111328125);
    float _2562 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2554);
    float _2564 = _2516 * 0.693147182464599609375;
    float _2566 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2556);
    float _2568 = _2564 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2570 = sqrt(_2534);
    float _2572 = -_2484;
    float _2574 = fma(_2544, _2550, _2572);
    float _2576 = fma(_2574, 0.5, 0.5);
    float _2578 = _2562 * _2558;
    float _2580 = _2566 * _2558;
    float _2582 = fma(_2578, -0.5, 0.5);
    float _2584 = fma(_2580, 0.5, 0.5);
    float2 _7079 = float2(_2464, _2528);
    float _2586 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7079, float2(0.0), isnan(_7079)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7079, float2(0.0), isnan(_7079)), level(0.0)).x;
    float _2588 = _2570 * 0.636619746685028076171875;
    float3 _7093 = float3(_2584, _2582, _2568);
    float _2590 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7093, float3(0.0), isnan(_7093)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7093, float3(0.0), isnan(_7093)), level(0.0)).x;
    float3 _7104 = float3(_2584, _2582, _2568);
    float4 _2593 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7104, float3(0.0), isnan(_7104)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7104, float3(0.0), isnan(_7104)), level(0.0)).xyzw;
    float _2595 = _2593.x;
    float _2597 = _2593.y;
    float _2599 = _2593.z;
    float _2601 = _2593.w;
    float _2603 = -_2560;
    float _2605 = fma(_2588, _2603, 1.0);
    float2 _7125 = float2(_2605, _2576);
    float3 _2609 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7125, float2(0.0), isnan(_7125)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7125, float2(0.0), isnan(_7125)), level(0.0)).xyz;
    float _2611 = _2609.x;
    float _2613 = _2609.y;
    float _2615 = _2609.z;
    float _2617 = _1912 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2619 = _1912 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2621 = _1912 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2623 = abs(_2150);
    float _2625 = log2(_2623);
    float _2627 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2617);
    float _2629 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2619);
    float _2631 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2621);
    float _2633 = _2500 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2635 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2627);
    float _2637 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2629);
    float _2639 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2631);
    float _2641 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2633);
    float _2643 = _2635 * _2635;
    float _2645 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2641);
    float _2647 = fma(_2637, _2637, _2643);
    out.m_70.x = _1484;
    float _2649 = _2625 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2651 = fma(_2639, _2639, _2647);
    float _2653 = exp2(_2649);
    float _2655 = rsqrt(_2651);
    float _2657 = fma(_2653, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2659 = precise::clamp(_2657, 0.0, 1.0);
    float _2661 = fma(_2659, -2.0, 3.0);
    float _2663 = _2659 * _2659;
    float _2665 = _2635 * _2655;
    float _2667 = _2637 * _2655;
    float _2669 = _2663 * _2661;
    float _2671 = fma(_2665, -0.5, 0.5);
    float _2673 = fma(_2667, 0.5, 0.5);
    float _2675 = -_2669;
    float _2677 = _2675 + 1.0;
    float _2679 = _2671;
    float _2681 = _2673;
    if (_1010)
    {
        float _2683 = -_2671;
        float _2685 = _870 ? _2683 : _2671;
        _2679 = _2685;
    }
    float _2687 = _2679;
    float _2689 = fma(_2677, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2669);
    if (_1002)
    {
        float _2691 = -_2673;
        float _2693 = _1228 ? _2691 : _2673;
        _2681 = _2693;
    }
    float _2695 = _2681;
    bool _2697 = _2390 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2699 = isnan(_2390);
    bool _2701 = _2697 || _2699;
    bool _2703 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2705 = _2701 || _2703;
    float _2707 = _2687 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2709 = in.m_76.x;
    float _2711 = _2695 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2713 = _2707 * _1286;
    float _2715 = _2494 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2717 = _2150 <= 8000.0;
    bool _2719 = isnan(_2150);
    bool _2721 = _2717 || _2719;
    bool _2723 = isnan(8000.0);
    bool _2725 = _2721 || _2723;
    float _2727 = float(_2725);
    float _2729 = _2711 * _1232;
    float _2731 = _2538 * 0.5;
    float _2733 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2645);
    float _2735 = _2566 + _2538;
    float _2737 = exp2(_2715);
    float _2739 = _2727 * _2689;
    float _2741 = fma(_2562, -0.5, _2731);
    float _2743 = _2733 + _2538;
    float _2745 = _2739 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _2566;
    out.gl_Position.y = _2562;
    out.gl_Position.z = _2733;
    out.gl_Position.w = _2538;
    float _2747 = _2743 * 0.5;
    float _2749 = _2735 * 0.5;
    float _2751 = _2713;
    float _2753 = _2729;
    if (!_2705)
    {
        _1490 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2755 = _1490;
    out.m_64.x = _1284;
    out.m_64.y = _1126;
    out.m_64.z = _2729;
    out.m_64.w = _2713;
    out.m_78.x = _2749;
    out.m_78.y = _2741;
    out.m_78.z = _2747;
    out.m_78.w = _2538;
    float _2757 = -_2737;
    float _2759 = _2757 + 1.0;
    float _2761 = _2759 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2763 = _2755;
    float _2765 = _2755;
    if (!_2705)
    {
        _2751 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2767 = _2751;
    float _2769 = _2767;
    float _2771 = _2767;
    if (!_2705)
    {
        _2753 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2773 = _2753;
    float _2775 = _2773;
    float _2777 = _2773;
    if (!_2705)
    {
        _1260 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2779 = _1260;
    float _2781 = _2779;
    float _2783 = _2779;
    if (!_2705)
    {
        _1424 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2785 = _1424;
    float _2787 = -_2586;
    float _2789 = _2787 + 1.0;
    float _2791 = _2761 * _2590;
    float _2793 = _2789 * _2745;
    float _2795 = precise::clamp(_2793, 0.0, 1.0);
    float _2797 = -_2761;
    float _2799 = _2797 + 1.0;
    float _2801 = -_2795;
    float _2803 = fma(_2801, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2805 = _2601 * _2791;
    float _2807 = _2601 * _2799;
    float _2809 = _2803 * _2709;
    float _2811 = _2615 * _2791;
    float _2813 = fma(_2611, _2805, _2595);
    float _2815 = fma(_2613, _2805, _2597);
    float _2817 = _2809 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2819 = fma(_2601, _2811, _2599);
    float _2821 = _2204 * _2262;
    out.m_80.x = _2817;
    float _2823 = _2821 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2825 = _2821;
    float _2827 = _2785;
    float _2829 = _2785;
    if (!_2705)
    {
        _2825 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2831 = _2825;
    out.m_82.x = _2813;
    out.m_82.y = _2815;
    out.m_82.z = _2819;
    out.m_82.w = _2807;
    bool _2833 = !_2705;
    float _2835 = _2831;
    float _2837 = _2831;
    if (!_2833)
    {
        bool _2839 = _2390 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2841 = isnan(_2390);
        bool _2843 = _2839 || _2841;
        bool _2845 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2847 = _2843 || _2845;
        if (!_2847)
        {
            float _2849 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2851 = _2390 + _2849;
            float _2853 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2855 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2853;
            float _2857 = 1.0 / _2855;
            float _2859 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2861 = _2859 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2863 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2865 = _2863 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2867 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2869 = _2867 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2871 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2873 = _2871 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2875 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2877 = _2875 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2879 = _2851 * _2857;
            float _2881 = precise::clamp(_2879, 0.0, 1.0);
            float _2883 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2885 = _2883 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2887 = fma(_2881, _2861, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2889 = fma(_2881, _2885, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2891 = fma(_2881, _2865, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2893 = fma(_2881, _2869, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2895 = fma(_2881, _2873, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2897 = fma(_2881, _2877, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2771 = _2889;
            _2829 = _2895;
            _2765 = _2887;
            _2783 = _2893;
            _2777 = _2891;
            _2837 = _2897;
            _2899 = true;
        }
        else
        {
            bool _2901 = _2390 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2903 = isnan(_2390);
            bool _2905 = _2901 || _2903;
            bool _2907 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2909 = _2905 || _2907;
            if (!_2909)
            {
                _2763 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2911 = _2763;
            _2765 = _2911;
            if (!_2909)
            {
                _2769 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2913 = _2769;
            _2771 = _2913;
            if (!_2909)
            {
                _2775 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2915 = _2775;
            _2777 = _2915;
            if (!_2909)
            {
                _2781 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2917 = _2781;
            _2783 = _2917;
            if (!_2909)
            {
                _2827 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2919 = _2827;
            _2829 = _2919;
            if (!_2909)
            {
                _2835 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2921 = _2835;
            bool _2923 = !_2909;
            _2837 = _2921;
            if (!_2923)
            {
                bool _2925 = _2390 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2927 = isnan(_2390);
                bool _2929 = _2925 || _2927;
                bool _2931 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2933 = _2929 || _2931;
                if (!_2933)
                {
                    float _2935 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2937 = _2390 + _2935;
                    float _2939 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2941 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2939;
                    float _2943 = 1.0 / _2941;
                    float _2945 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2947 = _2945 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2949 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2951 = _2949 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2953 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2955 = _2953 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2957 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2959 = _2957 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2961 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2963 = _2961 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2965 = _2937 * _2943;
                    float _2967 = precise::clamp(_2965, 0.0, 1.0);
                    float _2969 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2971 = _2969 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2973 = fma(_2967, _2947, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2975 = fma(_2967, _2971, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2977 = fma(_2967, _2951, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2979 = fma(_2967, _2955, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2981 = fma(_2967, _2959, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2983 = fma(_2967, _2963, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2771 = _2975;
                    _2829 = _2981;
                    _2765 = _2973;
                    _2783 = _2979;
                    _2777 = _2977;
                    _2837 = _2983;
                    _2899 = true;
                }
                else
                {
                    _2771 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2829 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2765 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2783 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2777 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2837 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2899 = false;
    float _2985 = _2771;
    float _2987 = _2829;
    float _2989 = _2765;
    float _2991 = _2783;
    float _2993 = _2777;
    float _2995 = _2837;
    float _2997 = fma(_1912, -0.5, 0.5);
    float _2999 = precise::clamp(_2997, 0.0, 1.0);
    float _3001 = -_2985;
    float _3003 = _3001 + _2987;
    float _3005 = _2823 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3007 = -_2989;
    float _3009 = _3007 + _2991;
    float _3011 = fma(_2999, _3003, _2985);
    out.m_84.x = 0.0;
    float _3013 = -_2993;
    float _3015 = _3013 + _2995;
    float _3017 = fma(_2999, _3009, _2989);
    float _3019 = _3011 * 0.586610972881317138671875;
    out.m_55.x = _3005;
    bool _3021 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3023 = fma(_2999, _3015, _2993);
    float _3025 = fma(_3017, 0.298911988735198974609375, _3019);
    bool _3027 = _2204 > 0.0;
    bool _3029 = isnan(_2204);
    bool _3031 = _3027 || _3029;
    bool _3033 = isnan(0.0);
    bool _3035 = _3031 || _3033;
    float _3037 = fma(_3023, 0.114477999508380889892578125, _3025);
    bool _3039 = _2262 <= 0.0;
    bool _3041 = !_3035;
    bool _3043 = _3039 || _3041;
    float _3045 = -_3037;
    float _3047 = _3017 + _3045;
    float _3049 = -_3037;
    float _3051 = _3011 + _3049;
    float _3053 = -_3037;
    float _3055 = _3023 + _3053;
    float _3057 = fma(_3047, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3037);
    float _3059 = fma(_3051, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3037);
    float _3061 = fma(_3055, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3037);
    bool _3063 = !_3021;
    if (!_3063)
    {
        float _3065 = -_2136;
        float _3067 = _3065 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3069 = -_2138;
        float _3071 = _3069 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3073 = -_2140;
        float _3075 = _3073 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3077 = _3067 * _3067;
        float _3079 = fma(_3071, _3071, _3077);
        float _3081 = fma(_3075, _3075, _3079);
        float _3083 = sqrt(_3081);
        float _3085 = rsqrt(_3081);
        float _3087 = -_3083;
        float _3089 = _3087 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3091 = _3089 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3093 = precise::clamp(_3091, 0.0, 1.0);
        float _3095 = _3071 * _3085;
        float _3097 = _3067 * _3085;
        float _3099 = abs(_3093);
        float _3101 = log2(_3099);
        float _3103 = _3075 * _3085;
        float _3105 = _3095 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3107 = _1912 * _3097;
        float _3109 = -_3097;
        float _3111 = -_3105;
        float _3113 = fma(_3109, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3111);
        float _3115 = fma(_1910, _3095, _3107);
        float _3117 = -_3103;
        float _3119 = fma(_3117, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3113);
        float _3121 = fma(_1914, _3103, _3115);
        float _3123 = precise::clamp(_3121, 0.0, 1.0);
        float _3125 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3127 = _3119 + _3125;
        float _3129 = _3101 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3131 = _3127 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3133 = precise::clamp(_3131, 0.0, 1.0);
        float _3135 = exp2(_3129);
        float _3137 = _3135 * _3133;
        float _3139 = _3123 * _3137;
        float _3141 = _3139 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3143 = _3139 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3145 = _3139 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _3141;
        out.m_84.y = _3143;
        out.m_84.z = _3145;
    }
    out.m_86.x = _3057;
    out.m_86.y = _3059;
    out.m_86.z = _3061;
    if (!_3043)
    {
        return out;
    }
    out.m_55.x = 0.0;
    float _3147 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3147;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2899 = false;
    bool _1964 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_48.w;
    float _102 = in.m_50.w;
    float _104 = trunc(_100);
    int _107 = int(_104);
    float _109 = -_102;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _111;
    bool _115 = _107 >= 1;
    float _117 = 0.0;
    float _119 = _102;
    float _121 = _111;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _117;
    if (!_115)
    {
        out.m_55.x = 0.0;
    }
    int _125 = 0;
    if (!_115)
    {
        float _127 = _123 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3215 = as_type<float>(_129);
        out.gl_Position.z = _3215;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _133 = _102 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_102);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = float(_107);
    bool _145 = _111 >= _143;
    bool _147 = !_141;
    bool _149 = _145 || _147;
    if (_149)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _119;
    if (_149)
    {
        out.m_55.x = 0.0;
    }
    if (_149)
    {
        float _153 = _151 * 5.0;
        _131 = as_type<int>(_153);
    }
    int _155 = _131;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3270 = as_type<float>(_155);
        out.gl_Position.z = _3270;
    }
    if (_149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _157 = as_type<float>(int(gl_VertexIndex));
    float _159 = 1.0 / _143;
    bool _161 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _163 = _111 * _159;
    int _165 = as_type<int>(_157) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_157) & 2;
    bool _171 = _169 != 0;
    bool _173 = !_167;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_161;
    float _183 = _163;
    float _201;
    if (!_181)
    {
        float _185 = in.m_60.x;
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        _201 = _163;
    }
    _203 = false;
    float _205 = _201;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _209 = _205 + _207;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _205 + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _217 = _205 + _215;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _225 = _223 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _233 = _231 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _235 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _237 = isnan(_205);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _243 = _239 || _241;
    float _245 = float(_243);
    float _247 = 1.0 / _225;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _251 = 1.0 / _221;
    bool _253 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _255 = isnan(_205);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = 1.0 / _229;
    float _267 = _209 * _247;
    bool _269 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _271 = isnan(_205);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = 1.0 / _233;
    float _283 = _213 * _251;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _287 = _205 + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _289;
    float _293 = fma(_291, _283, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _295 = _217 * _265;
    float _297 = -_245;
    float _299 = _297 + 1.0;
    float _301 = -_263;
    float _303 = _301 + 1.0;
    float _305 = _279 * _299;
    bool _307 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _309 = isnan(_205);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = _287 * _281;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _321;
    float _325 = -_279;
    float _327 = _325 + 1.0;
    bool _329 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _331 = isnan(_205);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _345 = fma(_323, _283, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _347 = _317 * _303;
    float _349 = -_317;
    float _351 = _349 + 1.0;
    float _353 = _263 * _327;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _359 = -_339;
    float _361 = _359 + 1.0;
    float _363 = _339 * _351;
    float _365 = fma(_343, _267, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _367;
    float _371 = fma(_357, _267, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _373 = _345 * _363;
    float _375 = _293 * _363;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _377;
    float _381 = fma(_369, _295, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _383 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].x, _373);
    float _385 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].y, _375);
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _391 = fma(_379, _295, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _393 = fma(_365, _347, _383);
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _397 = _395 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _399 = fma(_371, _347, _385);
    float _401 = fma(_389, _319, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _403 = fma(_381, _353, _393);
    float _405 = fma(_397, _319, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _407 = fma(_391, _353, _399);
    float _409 = fma(_401, _305, _403);
    float _411 = fma(_405, _305, _407);
    float _413 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[147].x, _409);
    float _415 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[147].y, _411);
    bool _417 = !_249;
    if (!_417)
    {
        float _419 = in.m_60.x;
        float _421 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _423 = _419 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _425 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _427 = _425 * _421;
        float _429 = floor(_427);
        float _431 = -_429;
        float _433 = _427 + _431;
        _183 = _433;
    }
    float _435 = _183;
    float _437 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _439 = int(_437);
    float _441 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _443 = int(_441);
    bool _445 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _447 = isnan(_435);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = float(_439);
    float _459 = 1.0 / _457;
    float _461 = float(uint(_443));
    int _463 = ~_443;
    int _465 = _463 + 1;
    int _467 = ~_443;
    int _469 = _467 + 1;
    float _471 = 1.0 / _461;
    bool _473 = _443 == 0;
    int _475 = ~_443;
    int _477 = _475 + 1;
    int _479 = ~_443;
    int _481 = _479 + 1;
    float _483 = _459 * _111;
    float _485 = trunc(_483);
    int _487 = int(_485);
    int _489 = as_type<int>(_471) + (-2);
    int _491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _493 = _491 != 0;
    bool _495 = !_493;
    float _497 = _495 ? 7.345489978790283203125 : 1.0;
    float _499 = float(uint(_487));
    float _501 = as_type<float>(_489) * _499;
    float _503 = in.m_60.x;
    float _505 = in.m_60.y;
    float _507 = in.m_60.z;
    float _509 = in.m_60.w;
    float _511 = trunc(_501);
    float _513 = precise::max(_511, 0.0);
    uint _516 = uint(_513);
    int _518 = _465 * int(_516);
    int _520 = _518 + _487;
    float _522 = float(uint(_520));
    float _524 = _497 * _503;
    float _526 = as_type<float>(_489) * _522;
    float _528 = float(_487);
    float _530 = floor(_524);
    float _532 = trunc(_526);
    float _534 = precise::max(_532, 0.0);
    uint _536 = uint(_534);
    float _538 = -_530;
    float _540 = _524 + _538;
    int _542 = int(_516) + int(_536);
    float _544 = float(_443);
    int _546 = _469 * _542;
    int _548 = _546 + _487;
    bool _550 = _528 >= _544;
    bool _552 = isnan(_528);
    bool _554 = _550 || _552;
    bool _556 = isnan(_544);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    bool _562 = uint(_548) >= uint(_443);
    float _564 = trunc(_560);
    int _566 = int(_564);
    bool _568 = !_562;
    int _570 = _568 ? 0 : (-1);
    int _572 = ~_542;
    int _574 = _572 + _570;
    int _576 = _574 + 1;
    float _578 = _540 * _544;
    float _580 = _544 * _111;
    int _582 = _443 * _576;
    int _584 = _582 + _487;
    float _586 = _580 * _159;
    float _588 = trunc(_578);
    int _590 = int(_588);
    int _592 = ~_566;
    int _594 = _592 + 1;
    int _596 = _594 + 1;
    bool _598 = !_473;
    int _600 = _598 ? _584 : (-1);
    float _602 = trunc(_586);
    int _604 = int(_602);
    int _606 = _600 * _596;
    int _608 = _443 + (-1);
    int _610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _612 = _610 != 0;
    int _614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _616 = _614 != 0;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _620 = _618 != 0;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _624 = _622 != 0;
    int _626 = _566 * _608;
    int _628 = _626 + _606;
    bool _630 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _632 = isnan(0.0);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _638 = _634 || _636;
    bool _640 = !_616;
    int _642 = _640 ? 0 : 1;
    bool _644 = !_612;
    int _646 = _644 ? 0 : 1;
    bool _648 = !_624;
    int _650 = _648 ? 0 : 1;
    int _652 = abs(_642);
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _656 = _654 != 0;
    bool _658 = !_620;
    int _660 = _658 ? 0 : 1;
    int _662 = _628 * _652;
    int _664 = abs(_646);
    int _666 = abs(_650);
    bool _668 = !_656;
    int _670 = _668 ? 0 : 1;
    int _672 = abs(_660);
    int _674 = _590 * _666;
    int _676 = _674 + _487;
    int _678 = abs(_670);
    int _680 = _604 * _664;
    int _682 = _680 + _662;
    int _684 = ~_443;
    int _686 = _684 + 1;
    int _688 = _676 * _672;
    int _690 = _688 + _682;
    int _692 = ~_443;
    int _694 = _692 + 1;
    int _696 = _590 * _678;
    int _698 = _696 + _690;
    float _700 = float(uint(_698));
    float _702 = as_type<float>(_489) * _700;
    float _704 = trunc(_702);
    float _706 = precise::max(_704, 0.0);
    uint _708 = uint(_706);
    float _710 = _503 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _712 = _694 * int(_708);
    int _714 = _712 + _698;
    float _716 = float(uint(_714));
    float _718 = as_type<float>(_489) * _716;
    float _720 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _722 = log2(_720);
    float _724 = trunc(_718);
    float _726 = precise::max(_724, 0.0);
    uint _728 = uint(_726);
    float _730 = _722 * _111;
    float _732 = exp2(_730);
    int _734 = int(_708) + int(_728);
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _738 = _503 * 2.0;
    int _740 = _686 * _734;
    int _742 = _740 + _698;
    float _744 = -_736;
    float _746 = fma(_710, 2.0, _744);
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _750 = _505 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _752 = floor(_738);
    bool _754 = uint(_742) >= uint(_443);
    float _756 = fma(_750, -2.0, _748);
    float _758 = -_732;
    float _760 = _758 + 1.0;
    bool _762 = !_754;
    int _764 = _762 ? 0 : (-1);
    bool _766 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _768 = isnan(1.0);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _774 = _770 || _772;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _778 = ~_734;
    int _780 = _778 + _764;
    int _782 = _780 + 1;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _786 = 1.0 + _784;
    float _788 = _638 ? _760 : 0.0;
    int _790 = _443 * _782;
    int _792 = _790 + _698;
    float _794 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[78].z, _776);
    float _796 = 1.0 / _786;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _800 = _752 > 0.0;
    float _802 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].z, _794);
    bool _804 = !_473;
    int _806 = _804 ? _792 : (-1);
    float _808 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[78].w, _798);
    float _810 = float(uint(_676));
    float _812 = -_111;
    float _814 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[76].x, _746);
    int _816 = _806 & 3;
    bool _818 = _816 != 0;
    float _820 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[76].y, _756);
    int _822 = _806 & 3;
    bool _824 = _822 != 0;
    float _826 = as_type<float>(_489) * _810;
    int _828 = _818 ? 0 : 1;
    float _830 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].w, _808);
    bool _832 = uint(_822) > 1u;
    float _834 = -_802;
    float _836 = _834 + 1.0;
    bool _838 = _822 != 3;
    float _840 = trunc(_826);
    float _842 = precise::max(_840, 0.0);
    uint _844 = uint(_842);
    bool _846 = _752 >= 0.0;
    bool _848 = isnan(_752);
    bool _850 = _846 || _848;
    bool _852 = isnan(0.0);
    bool _854 = _850 || _852;
    if (_774)
    {
        float _856 = _788 * _796;
        _121 = _856;
    }
    float _858 = _121;
    bool _860 = uint(_822) >= 2u;
    float _862 = -_830;
    float _864 = _862 + 1.0;
    int _866 = _854 ? 0 : 1;
    int _868 = _860 ? 0 : 1;
    bool _870 = _509 > 0.5;
    float _872 = _505 * 2.0;
    int _874 = ~_866;
    int _876 = _874 + 1;
    int _878 = _876 + 1;
    int _880 = ~_828;
    int _882 = _880 + 1;
    int _884 = _882 + 1;
    float _886 = floor(_872);
    int _888 = ~_868;
    int _890 = _888 + 1;
    int _892 = _890 + 1;
    int _894 = _878;
    int _896 = _884;
    int _898 = _892;
    if (!_800)
    {
        int _900 = ~_866;
        int _902 = _900 + 1;
        _894 = _902;
    }
    int _904 = _894;
    if (!_832)
    {
        int _906 = ~_828;
        int _908 = _906 + 1;
        _896 = _908;
    }
    int _910 = _896;
    if (_838)
    {
        int _912 = ~_868;
        int _914 = _912 + 1;
        _898 = _914;
    }
    int _916 = _898;
    float _918 = in.m_48.x;
    float _920 = in.m_48.y;
    float _922 = in.m_48.z;
    bool _924 = _503 > 0.5;
    int _926 = _477 * int(_844);
    int _928 = _926 + _676;
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _932 = _930 != 0;
    float _934 = -_175;
    int _936 = _924 ? as_type<int>(_934) : as_type<int>(_175);
    bool _938 = _505 > 0.5;
    bool _940 = !_932;
    float _942 = _940 ? _175 : as_type<float>(_936);
    float _944 = float(uint(_928));
    float _946 = _942 + 0.5;
    float _948 = -_179;
    int _950 = _938 ? as_type<int>(_948) : as_type<int>(_179);
    float _952 = as_type<float>(_489) * _944;
    bool _954 = _886 >= 0.0;
    bool _956 = isnan(_886);
    bool _958 = _954 || _956;
    bool _960 = isnan(0.0);
    bool _962 = _958 || _960;
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _966 = _964 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _968 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _970 = _968 != 0;
    float _972 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[80].x, _814);
    int _974 = _962 ? 0 : 1;
    float _976 = trunc(_952);
    float _978 = precise::max(_976, 0.0);
    uint _980 = uint(_978);
    bool _982 = !_970;
    int _984 = _982 ? 0 : 1;
    float _986 = _920 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _988 = _886 > 0.0;
    float _990 = _920 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _992 = _920 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _996 = _994 != 0;
    float _998 = 1.0 / _966;
    int _1000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1002 = _1000 != 0;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1006 = _1004 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1010 = _1008 != 0;
    float _1012 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[4].x, _986);
    float _1014 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[6].x, _992);
    float _1016 = 1.0 / _1006;
    float _1018 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1020 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[5].x, _990);
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1024 = int(_844) + int(_980);
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1028 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1030 = _1018 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1032 = _1022 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1034 = _1026 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1036;
    float _1040 = _505 + _507;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1044 = _1042 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    out.m_62.x = _1030;
    out.m_62.y = _1032;
    out.m_62.z = _1034;
    out.m_62.w = _1028;
    float _1046 = _1038 * _998;
    float _1048 = _507 * 2.0;
    int _1050 = _481 * _1024;
    int _1052 = _1050 + _676;
    bool _1054 = !_996;
    float _1056 = _1054 ? _179 : as_type<float>(_950);
    float _1058 = _1040 + (-1.0);
    int _1060 = ~_974;
    int _1062 = _1060 + 1;
    int _1064 = _1062 + 1;
    float _1066 = _1044 * _1016;
    bool _1068 = uint(_1052) >= uint(_443);
    float _1070 = _505 + _503;
    int _1072 = _1064;
    if (!_988)
    {
        int _1074 = ~_974;
        int _1076 = _1074 + 1;
        _1072 = _1076;
    }
    int _1078 = _1072;
    float _1080 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1012);
    bool _1082 = !_1068;
    int _1084 = _1082 ? 0 : (-1);
    float _1086 = _1070 + (-1.0);
    int _1088 = _806 >> 31;
    float _1090 = floor(_1048);
    float _1092 = _1056 + (-0.5);
    int _1094 = _1088 & 3;
    float _1096 = _505 + (-0.5);
    bool _1098 = !_824;
    int _1100 = _1098 ? 0 : 1;
    float _1102 = -_1092;
    float _1104 = -_820;
    float _1106 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1104);
    int _1108 = _806 + _1094;
    bool _1110 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1112 = isnan(_435);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1118 = _1114 || _1116;
    float _1120 = float(_1118);
    float _1122 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1124 = _1108 >> 2;
    float _1126 = fma(_1056, _864, _1106);
    float _1128 = -_1120;
    float _1130 = _1128 + 1.0;
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1134 = _1132 != 0;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1138 = _1136 != 0;
    int _1140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1142 = _1140 != 0;
    bool _1144 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1146 = isnan(_435);
    bool _1148 = _1144 || _1146;
    bool _1150 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1152 = _1148 || _1150;
    float _1154 = float(_1152);
    float _1156 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1158 = _1124 << 4;
    int _1160 = _1158 + 368;
    bool _1162 = !_1138;
    int _1164 = _1162 ? 0 : 1;
    float _1166 = _1154 * _1130;
    float _1168 = -_1154;
    float _1170 = _1168 + 1.0;
    bool _1172 = _1090 > 0.0;
    uint _1174 = uint(int(uint(_1160) >> uint(2)));
    uint _1176 = uint(int(uint(int(_1174)) >> uint(2)));
    int _1178 = int(_1174) & 3;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[int(_1176)][_1178];
    int _1182 = int(_1174) + 1;
    uint _1184 = uint(int(uint(_1182) >> uint(2)));
    int _1186 = _1182 & 3;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[int(_1184)][_1186];
    bool _1190 = !_1134;
    int _1192 = _1190 ? 0 : 1;
    float _1194 = _455 * _1170;
    bool _1196 = _1090 >= 0.0;
    bool _1198 = isnan(_1090);
    bool _1200 = _1196 || _1198;
    bool _1202 = isnan(0.0);
    bool _1204 = _1200 || _1202;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1208 = _435 + _1206;
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1212 = _435 + _1210;
    float _1214 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1020);
    float _1216 = -_455;
    float _1218 = _1216 + 1.0;
    float _1220 = fma(_1046, _1208, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1222 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1014);
    int _1224 = _1204 ? 0 : 1;
    float _1226 = fma(_1066, _1212, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1228 = _507 > 0.5;
    float _1230 = _1220 * _1194;
    float _1232 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1234 = ~_1224;
    int _1236 = _1234 + 1;
    int _1238 = _1236 + 1;
    int _1240 = _1160 + 8;
    uint _1242 = uint(int(uint(_1240) >> uint(2)));
    uint _1244 = uint(int(uint(int(_1242)) >> uint(2)));
    int _1246 = int(_1242) & 3;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[int(_1244)][_1246];
    int _1250 = int(_1242) + 1;
    uint _1252 = uint(int(uint(_1250) >> uint(2)));
    int _1254 = _1250 & 3;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[int(_1252)][_1254];
    int _1258 = _1238;
    float _1260 = _1126;
    if (!_1172)
    {
        int _1262 = ~_1224;
        int _1264 = _1262 + 1;
        _1258 = _1264;
    }
    int _1266 = _1258;
    float _1268 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1230);
    float _1270 = -_175;
    int _1272 = _1228 ? as_type<int>(_1270) : as_type<int>(_175);
    int _1274 = abs(_1164);
    float _1276 = fma(_1226, _1166, _1268);
    bool _1278 = !_1002;
    float _1280 = _1278 ? _175 : as_type<float>(_1272);
    float _1282 = -_836;
    float _1284 = fma(_942, _1282, _972);
    float _1286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1288 = -_179;
    int _1290 = _870 ? as_type<int>(_1288) : as_type<int>(_179);
    float _1292 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _1294 = abs(_910);
    bool _1296 = !_1010;
    float _1298 = _1296 ? _179 : as_type<float>(_1290);
    float _1300 = _1292 * _1232;
    float _1302 = float(_904);
    float _1304 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1306 = float(_1274);
    int _1308 = ~_1024;
    int _1310 = _1308 + _1084;
    int _1312 = _1310 + 1;
    float _1314 = _1306 * _1302;
    float _1316 = _1304 * _1286;
    int _1318 = _443 * _1312;
    int _1320 = _1318 + _676;
    float _1322 = _1214 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1324 = ~_1294;
    int _1326 = _1324 + 1;
    int _1328 = _1326 + 1;
    float _1330 = _1080 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1332 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1276);
    float _1334 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1336 = _1322 + _1334;
    out.m_64.x = _1284;
    out.m_64.y = _1126;
    out.m_64.z = _1300;
    out.m_64.w = _1316;
    int _1338 = _1328 * as_type<int>(_1188);
    int _1340 = abs(_1100);
    float _1342 = _1222 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1344 = abs(_916);
    float _1346 = _1336 * _1336;
    int _1348 = ~_1340;
    int _1350 = _1348 + 1;
    int _1352 = _1350 + 1;
    float _1354 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1356 = _1342 + _1354;
    int _1358 = _1352 * as_type<int>(_1180);
    int _1360 = _1358 + _1338;
    float _1362 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1364 = _1330 + _1362;
    float _1366 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1372 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1366);
    bool _1374 = !_473;
    int _1376 = _1374 ? _1320 : (-1);
    float _1378 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1380 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1372);
    bool _1382 = _822 != 3;
    float _1384 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1386 = ~_1344;
    int _1388 = _1386 + 1;
    int _1390 = _1388 + 1;
    bool _1392 = !_1382;
    int _1394 = _1392 ? 0 : (-1);
    bool _1396 = _1380 >= 0.0;
    int _1398 = _1390 * as_type<int>(_1248);
    int _1400 = _1398 + _1360;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1404 = abs(_1394);
    float _1406 = in.m_66.x;
    float _1408 = in.m_66.y;
    float _1410 = in.m_66.z;
    int _1412 = abs(_1192);
    float _1414 = _1402 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1416 = abs(_984);
    int _1418 = ~_1404;
    int _1420 = _1418 + 1;
    int _1422 = _1420 + 1;
    float _1424 = _1284;
    if (_1396)
    {
        out.m_55.x = 0.0;
    }
    float _1426 = float(_1266);
    int _1428 = _1422 * as_type<int>(_1256);
    int _1430 = _1428 + _1400;
    float _1432 = float(_1412);
    float _1434 = fma(_1364, _1364, _1346);
    int _1436 = ~_1416;
    int _1438 = _1436 + 1;
    int _1440 = _1438 + 1;
    float _1442 = _1332 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1444 = _503 + (-0.5);
    float _1446 = _1432 * _1426;
    float _1448 = fma(_1356, _1356, _1434);
    int _1450 = _1430 * _1440;
    out.m_68.x = _1378;
    out.m_68.y = _1384;
    out.m_68.z = _1414;
    out.m_68.w = _1442;
    float _1452 = _1446 * (-2.0);
    float _1454 = _1446;
    if (_1396)
    {
        _1454 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1456 = _1454;
    int _1458 = _1376 * _1416;
    int _1460 = _1458 + _1450;
    float _1462 = rsqrt(_1448);
    float _1464 = fma(_1452, _1406, _1406);
    bool _1466 = !_1142;
    int _1468 = _1466 ? 0 : 1;
    int _1470 = as_type<int>(_1456);
    if (_1396)
    {
        float _1472 = _1456 * 5.0;
        _1470 = as_type<int>(_1472);
    }
    int _1474 = _1470;
    float _1476 = fma(_1156, _1452, _1156);
    float _1478 = fma(_1444, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1464);
    if (_1396)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5265 = as_type<float>(_1474);
        out.gl_Position.z = _5265;
    }
    int _1480 = abs(_1468);
    float _1482 = fma(_1476, _858, _1478);
    float _1484 = float(_1460);
    float _1486 = _1336 * _1462;
    out.m_70.x = _1484;
    float _1488 = _1364 * _1462;
    float _1490 = _1484;
    if (_1396)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1492 = -_1486;
    float _1494 = fma(_1492, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1322);
    float _1496 = _1356 * _1462;
    float _1498 = -_1488;
    float _1500 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1330);
    float _1502 = _1314 * (-2.0);
    float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1506 = _1494 + _1504;
    float _1508 = float(_1078);
    float _1510 = -_1496;
    float _1512 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1342);
    float _1514 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1516 = _1500 + _1514;
    float _1518 = _1506 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1520 = float(_1480);
    float _1522 = fma(_1502, _1408, _1408);
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1526 = _1512 + _1524;
    float _1528 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1518);
    float _1530 = fma(_1122, _1502, _1122);
    float _1532 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1522);
    float _1534 = _1520 * _1508;
    float _1536 = _507 + _503;
    float _1538 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1528);
    float _1540 = fma(_1530, _858, _1532);
    float _1542 = -_1486;
    float _1544 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1336);
    float _1546 = _1536 + (-1.0);
    float _1548 = _1534 * (-2.0);
    float _1550 = _1540 * 0.15915493667125701904296875;
    bool _1552 = _1538 >= 0.0;
    float _1554 = -_1488;
    float _1556 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1364);
    float _1558 = _1544 * _1544;
    float _1560 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1562 = _507 + (-0.5);
    float _1564 = fma(_1548, _1410, _1410);
    float _1566 = in.m_72.x;
    float _1568 = in.m_72.y;
    float _1570 = fma(_1556, _1556, _1558);
    float _1572 = -_1496;
    float _1574 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1356);
    float _1576 = fma(_1560, _1548, _1560);
    float _1578 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1564);
    float _1580 = _1482 * 0.15915493667125701904296875;
    float _1582 = fma(_1574, _1574, _1570);
    float _1584 = _1574;
    int _1586 = as_type<int>(_1562);
    float _1588 = _1526;
    float _1590 = _1500;
    if (_1552)
    {
        _1584 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1592 = _1584;
    float _1594 = fma(_1576, _858, _1578);
    float _1596 = _1580 * 6.283185482025146484375;
    float _1598 = sin(_1596);
    if (_1552)
    {
        out.m_55.x = 0.0;
    }
    float _1600 = _1594 * 0.15915493667125701904296875;
    if (_1552)
    {
        float _1602 = _1592 * 5.0;
        _1586 = as_type<int>(_1602);
    }
    int _1604 = _1586;
    float _1606 = _1580 * 6.283185482025146484375;
    float _1608 = cos(_1606);
    if (_1552)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5485 = as_type<float>(_1604);
        out.gl_Position.z = _5485;
    }
    float _1610 = _415 * _1568;
    float _1612 = _1550 * 6.283185482025146484375;
    float _1614 = sin(_1612);
    float _1616 = sqrt(_1582);
    float _1618 = _1550 * 6.283185482025146484375;
    float _1620 = cos(_1618);
    if (_1552)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1622 = _1600 * 6.283185482025146484375;
    float _1624 = cos(_1622);
    float _1626 = _1462 * _1616;
    float _1628 = _1610 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1630 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _1632 = _413 * _1566;
    float _1634 = _1608 * _1620;
    float _1636 = _1628 * _1626;
    float _1638 = _1608 * _1614;
    float _1640 = _1600 * 6.283185482025146484375;
    float _1642 = sin(_1640);
    float _1644 = _1598 * _1620;
    float _1646 = _1630 * _1636;
    float _1648 = _1632 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1650 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _1652 = _1598 * _1614;
    float _1654 = _1626 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1656 = _1654 * 0.5;
    float _1658 = _1648 * _1626;
    float _1660 = _1608 * _1624;
    float _1662 = _1620 * _1624;
    float _1664 = _1598 * _1624;
    float _1666 = _1650 * _1658;
    float _1668 = _1660 * _1646;
    float _1670 = _1614 * _1624;
    float _1672 = _1660 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1674 = fma(_1642, _1634, _1652);
    float _1676 = -_1644;
    float _1678 = fma(_1642, _1638, _1676);
    float _1680 = -_1646;
    float _1682 = _1642 * _1680;
    float _1684 = -_1638;
    float _1686 = fma(_1642, _1644, _1684);
    float _1688 = fma(_1674, _1666, _1668);
    float _1690 = _1664 * _1646;
    float _1692 = fma(_1662, _1666, _1682);
    float _1694 = fma(_1642, _1652, _1634);
    float _1696 = fma(_1678, _1656, _1688);
    float _1698 = fma(_1686, _1666, _1690);
    float _1700 = fma(_1670, _1656, _1692);
    float _1702 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1704 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1706 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1708 = fma(_1694, _1656, _1698);
    float _1710 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1712 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1704);
    float _1714 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1706);
    float _1716 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1718 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1702);
    float _1720 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1712);
    float _1722 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1714);
    float _1724 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1716);
    float _1726 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1728 = _1720 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1730 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1732 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1710);
    float _1734 = _1660 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1736 = _1330 + _1728;
    float _1738 = _1342 + _1730;
    float _1740 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1726);
    float _1742 = _1660 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1744 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1746 = _1736 + _1744;
    float _1748 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1750 = _1738 + _1748;
    float _1752 = -_1642;
    float _1754 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1672);
    float _1756 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1740);
    float _1758 = _1746 * _1746;
    float _1760 = _1750 * _1750;
    float _1762 = -_1642;
    float _1764 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1734);
    float _1766 = -_1642;
    float _1768 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1742);
    float _1770 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1718);
    float _1772 = _1758 + _1760;
    float _1774 = _1678 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1776 = _1756 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1778 = _1678 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1780 = sqrt(_1772);
    float _1782 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1774);
    float _1784 = _1678 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1786 = _1322 + _1776;
    float _1788 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1778);
    float _1790 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1732);
    float _1792 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1784);
    float _1794 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1724);
    bool _1796 = _1780 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1798 = _1784;
    float _1800 = _1758;
    float _1802 = _1760;
    float _1804 = _1738;
    float _1806 = _1736;
    if (!_1796)
    {
        _1798 = _1786;
    }
    float _1808 = _1798;
    bool _1810 = !_1796;
    float _1812 = _1808;
    if (!_1810)
    {
        float _1814 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1816 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1818 = _1780 + _1816;
        float _1820 = _1786 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1822 = rsqrt(_1772);
        float _1824 = _1818 * _1814;
        float _1826 = _1824 * 0.15915493667125701904296875;
        float _1828 = _1826 * 6.283185482025146484375;
        float _1830 = sin(_1828);
        float _1832 = _1826 * 6.283185482025146484375;
        float _1834 = cos(_1832);
        float _1836 = fma(_1830, _1820, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1838 = _1822 * _1836;
        float _1840 = fma(_1746, _1838, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1842 = _1834 + (-1.0);
        float _1844 = fma(_1750, _1838, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1846 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1848 = _1840 + _1846;
        float _1850 = _1842 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1852 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1854 = _1844 + _1852;
        float _1856 = _1848 * _1848;
        float _1858 = fma(_1786, _1834, _1850);
        float _1860 = _1854 * _1854;
        _1812 = _1858;
        _1800 = _1856;
        _1802 = _1860;
        _1804 = _1844;
        _1806 = _1840;
    }
    float _1862 = _1812;
    float _1864 = _1800;
    float _1866 = _1802;
    float _1868 = _1804;
    float _1870 = _1806;
    float _1872 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1874 = _1862 + _1872;
    float _1876 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1764);
    float _1878 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1754);
    float _1880 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1882 = fma(_1874, _1874, _1864);
    float _1884 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1768);
    float _1886 = _175 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1888 = _1880 * _1876;
    float _1890 = _1882 + _1866;
    float _1892 = _1880 * _1878;
    float _1894 = _1880 * _1884;
    float _1896 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1788);
    float _1898 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1782);
    float _1900 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1792);
    float _1902 = sqrt(_1890);
    float _1904 = fma(_1886, _1770, _1888);
    float _1906 = fma(_1886, _1790, _1892);
    float _1908 = fma(_1886, _1794, _1894);
    float _1910 = _1896 + _1904;
    float _1912 = _1898 + _1906;
    float _1914 = _1900 + _1908;
    out.m_74.x = _1910;
    out.m_74.y = _1912;
    out.m_74.z = _1914;
    bool _1916 = _1902 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1918 = isnan(_1902);
    bool _1920 = _1916 || _1918;
    bool _1922 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1924 = _1920 || _1922;
    float _1926 = _1888;
    float _1928 = _1874;
    if (!_1924)
    {
        _1926 = 1.0;
    }
    float _1930 = _1926;
    bool _1932 = !_1924;
    float _1934 = _1930;
    if (!_1932)
    {
        bool _1936 = _1902 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1938 = isnan(_1902);
        bool _1940 = _1936 || _1938;
        bool _1942 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1944 = _1940 || _1942;
        if (!_1944)
        {
            float _1946 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1948 = _1902 + _1946;
            float _1950 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1952 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1950;
            float _1954 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1956 = _1954 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1958 = 1.0 / _1952;
            float _1960 = _1948 * _1958;
            float _1962 = fma(_1960, _1956, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1934 = _1962;
            _1964 = true;
        }
        else
        {
            bool _1966 = _1902 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1968 = isnan(_1902);
            bool _1970 = _1966 || _1968;
            bool _1972 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1974 = _1970 || _1972;
            if (!_1974)
            {
                float _1976 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1978 = _1902 + _1976;
                float _1980 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1982 = _1980 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1984 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1986 = _1984 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1988 = 1.0 / _1982;
                float _1990 = _1978 * _1988;
                float _1992 = fma(_1990, _1986, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1934 = _1992;
                _1964 = true;
            }
            else
            {
                _1934 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1964 = false;
    float _1994 = _1934;
    float _1996 = _1494 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1998 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2000 = _1862 + _1998;
    float _2002 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1996);
    float _2004 = _1494 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2006 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2008 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2010 = _2006 || _2008;
    bool _2012 = isnan(0.5);
    bool _2014 = _2010 || _2012;
    float _2016 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2018 = _1868 + _2016;
    float _2020 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2002);
    bool _2022 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2024 = isnan(0.5);
    bool _2026 = _2022 || _2024;
    bool _2028 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2030 = _2026 || _2028;
    float _2032 = fma(_2000, _1994, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2034 = _2020 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2036 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2004);
    float _2038 = 1.0 / _2034;
    float _2040 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2036);
    float _2042 = _2040 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (_2030)
    {
        _1928 = 1.0;
    }
    float _2044 = _1928;
    float _2046 = _2042 + _2034;
    float _2048 = _2046 * _2038;
    float _2050 = _2048 * 0.5;
    float _2052 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2054 = _1870 + _2052;
    float _2056 = fma(_2018, _1994, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2058 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2060 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2058);
    float _2062 = fma(_2054, _1994, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2064 = -_1486;
    float _2066 = fma(_2064, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2032);
    float _2068 = -_1496;
    float _2070 = fma(_2068, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2056);
    float _2072 = -_1488;
    float _2074 = fma(_2072, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2062);
    float _2076 = 1.0 / _2060;
    float _2078 = _2066;
    float _2080 = _2074;
    float _2082 = _2070;
    float _2084 = _2076;
    float _2086 = _2044;
    float _2088 = _2062;
    float _2090 = _2056;
    if (!_2014)
    {
        float _2092 = _1506 * _1506;
        float _2094 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2096 = -_1342;
        float _2098 = _2096 + _2056;
        float _2100 = -_1330;
        float _2102 = _2100 + _2062;
        float _2104 = fma(_1516, _1516, _2092);
        float _2106 = fma(_1526, _1526, _2104);
        float _2108 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2110 = sqrt(_2106);
        float _2112 = 1.0 / _1626;
        float _2114 = _2108 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2116 = precise::min(_2110, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2118 = _2116 * _2094;
        float _2120 = -_1322;
        float _2122 = _2120 + _2032;
        float _2124 = _2118 * _2112;
        float _2126 = _2114 * _2124;
        float _2128 = _2098 * _2124;
        float _2130 = fma(_2122, _2126, _1494);
        float _2132 = fma(_2102, _2126, _1500);
        float _2134 = fma(_2114, _2128, _1512);
        _2078 = _2130;
        _2080 = _2132;
        _2082 = _2134;
        _1588 = _2124;
    }
    float _2136 = _2078;
    float _2138 = _2080;
    float _2140 = _2082;
    float _2142 = _1588;
    float _2144 = _2142;
    if (_2030)
    {
        _2144 = 1.0;
    }
    float _2146 = _2144;
    float _2148 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2150 = _2076 * _2148;
    float _2152 = _2146;
    if (!_2030)
    {
        float _2154 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2156 = _2154 * 0.15915493667125701904296875;
        float _2158 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2160 = _2156 * 6.283185482025146484375;
        float _2162 = cos(_2160);
        float _2164 = _2158 * 0.15915493667125701904296875;
        float _2166 = _2156 * 6.283185482025146484375;
        float _2168 = sin(_2166);
        float _2170 = 1.0 / _2162;
        float _2172 = _2164 * 6.283185482025146484375;
        float _2174 = cos(_2172);
        float _2176 = _2168 * _2170;
        float _2178 = _2164 * 6.283185482025146484375;
        float _2180 = sin(_2178);
        float _2182 = _2174 * _2176;
        float _2184 = 1.0 / _2182;
        float _2186 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2188 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2186;
        float _2190 = 1.0 / _2188;
        float _2192 = _2180 * _2184;
        float _2194 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2196 = fma(_2150, _2192, _2194);
        float _2198 = _2196 * _2190;
        float _2200 = precise::clamp(_2198, 0.0, 1.0);
        _2084 = _2164;
        _2086 = _2200;
    }
    float _2202 = _2084;
    float _2204 = _2086;
    float _2206 = _2202;
    if (!_2030)
    {
        float _2208 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2210 = _2208 * 0.15915493667125701904296875;
        float _2212 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2214 = _2210 * 6.283185482025146484375;
        float _2216 = cos(_2214);
        float _2218 = _2212 * 0.15915493667125701904296875;
        float _2220 = _2210 * 6.283185482025146484375;
        float _2222 = sin(_2220);
        float _2224 = 1.0 / _2216;
        float _2226 = _2218 * 6.283185482025146484375;
        float _2228 = cos(_2226);
        float _2230 = _2222 * _2224;
        float _2232 = _2218 * 6.283185482025146484375;
        float _2234 = sin(_2232);
        float _2236 = _2228 * _2230;
        float _2238 = 1.0 / _2236;
        float _2240 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2242 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2240;
        float _2244 = 1.0 / _2242;
        float _2246 = _2234 * _2238;
        float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2250 = fma(_2150, _2246, _2248);
        float _2252 = _2250 * _2244;
        float _2254 = precise::clamp(_2252, 0.0, 1.0);
        float _2256 = -_2254;
        float _2258 = _2256 + 1.0;
        _2206 = _2236;
        _2152 = _2258;
    }
    float _2260 = _2206;
    float _2262 = _2152;
    float _2264 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2266 = _2136 + _2264;
    float _2268 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2270 = _2138 + _2268;
    float _2272 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2274 = _2140 + _2272;
    float _2276 = _2266 * _2266;
    float _2278 = fma(_2270, _2270, _2276);
    float _2280 = fma(_2274, _2274, _2278);
    float _2282 = rsqrt(_2280);
    float _2284 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2286 = _2270 * _2284;
    float _2288 = _2274 * _2284;
    float _2290 = _2286 * _2286;
    float _2292 = _2288 * _2288;
    float _2294 = _2290 + _2292;
    float _2296 = sqrt(_2294);
    bool _2298 = _2296 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2300 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2302 = _2296 + _2300;
    float _2304 = _2282;
    float _2306 = _2302;
    float _2308 = _2266;
    float _2310 = _2294;
    if (_2298)
    {
        float _2312 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2304 = _2312;
    }
    float _2314 = _2304;
    float _2316 = _2314;
    if (_2298)
    {
        float _2318 = _2302 * _2314;
        _2306 = _2318;
    }
    float _2320 = _2306;
    if (_2298)
    {
        float _2322 = rsqrt(_2294);
        _2316 = _2322;
    }
    float _2324 = _2316;
    float _2326 = _2324;
    if (_2298)
    {
        float _2328 = _2320 * 0.15915493667125701904296875;
        _2088 = _2328;
    }
    float _2330 = _2088;
    float _2332 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2334 = _2274;
    float _2336 = _2330;
    if (_2298)
    {
        float _2338 = _2330 * 6.283185482025146484375;
        float _2340 = sin(_2338);
        _2334 = _2340;
    }
    float _2342 = _2334;
    float _2344 = precise::max(0.0, _2332);
    float _2346 = _2260;
    float _2348 = _2344;
    if (_2298)
    {
        float _2350 = _2330 * 6.283185482025146484375;
        float _2352 = cos(_2350);
        _2346 = _2352;
    }
    float _2354 = _2346;
    float _2356 = -_2284;
    float _2358 = -_2344;
    float _2360 = fma(_2266, _2356, _2358);
    if (_2298)
    {
        float _2362 = _2360 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2308 = _2362;
    }
    float _2364 = _2308;
    float _2366 = _2364;
    if (_2298)
    {
        float _2368 = fma(_2342, _2364, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2090 = _2368;
    }
    float _2370 = _2090;
    float _2372 = _2370;
    if (!_2298)
    {
        _2336 = _2360;
    }
    float _2374 = _2336;
    float _2376 = fma(_1500, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2378 = _2374;
    if (!_2298)
    {
        _2366 = _2288;
    }
    float _2380 = _2366;
    float _2382 = _2380;
    if (_2298)
    {
        float _2384 = _2324 * _2370;
        _2372 = _2384;
    }
    float _2386 = _2372;
    if (!_2298)
    {
        _2326 = _2286;
    }
    float _2388 = _2326;
    float _2390 = sqrt(_2280);
    float _2392 = _2388;
    if (_2298)
    {
        float _2394 = _2354 + (-1.0);
        _2348 = _2394;
    }
    float _2396 = _2348;
    float _2398 = _2396;
    if (_2298)
    {
        float _2400 = _2286 * _2386;
        _2392 = _2400;
    }
    float _2402 = _2392;
    if (_2298)
    {
        float _2404 = _2288 * _2386;
        _2382 = _2404;
    }
    float _2406 = _2382;
    if (!_2298)
    {
        _1590 = _2292;
    }
    float _2408 = _1590;
    float _2410 = _2408;
    if (_2298)
    {
        float _2412 = _2396 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2310 = _2412;
    }
    float _2414 = _2310;
    if (!_2298)
    {
        _2398 = _2290;
    }
    float _2416 = _2398;
    float _2418 = _2416;
    if (_2298)
    {
        float _2420 = _2402 * _2402;
        _2418 = _2420;
    }
    float _2422 = _2418;
    if (_2298)
    {
        float _2424 = _2406 * _2406;
        _2410 = _2424;
    }
    float _2426 = _2410;
    if (_2298)
    {
        float _2428 = fma(_2360, _2354, _2414);
        _2378 = _2428;
    }
    float _2430 = _2378;
    float _2432 = floor(_2376);
    float _2434 = fma(_2430, _2430, _2422);
    float _2436 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2438 = _2434 + _2426;
    float _2440 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2436);
    float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2444 = fma(_2390, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2442);
    float _2446 = precise::clamp(_2444, 0.0, 1.0);
    float _2448 = fma(_1512, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2450 = rsqrt(_2438);
    float _2452 = fma(_2140, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2440);
    float _2454 = -_2446;
    float _2456 = _2454 + 1.0;
    float _2458 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2460 = _2452 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2462 = -_2432;
    float _2464 = _2376 + _2462;
    float _2466 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2468 = floor(_2448);
    float _2470 = _2460 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2472 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2474 = -_2470;
    float _2476 = fma(_2474, _2466, 1.0);
    float _2478 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2480 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2472);
    float _2482 = _2450 * _2402;
    float _2484 = _2450 * _2430;
    float _2486 = _2450 * _2406;
    float _2488 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2478);
    float _2490 = fma(_2140, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2480);
    float _2492 = abs(_2456);
    float _2494 = log2(_2492);
    float _2496 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2458);
    float _2498 = fma(_2140, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2488);
    float _2500 = _2490 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2502 = _2482 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2504 = fma(_2140, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2496);
    float _2506 = _2498 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2508 = _2500 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2510 = -_2502;
    float _2512 = fma(_2484, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2510);
    float _2514 = _2504 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2516 = log2(_2476);
    float _2518 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2508);
    float _2520 = -_2486;
    float _2522 = fma(_2520, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2512);
    float _2524 = _2500 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2526 = -_2468;
    float _2528 = _2448 + _2526;
    float _2530 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2518);
    float _2532 = _2494 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2534 = fma(_2522, -0.5, 0.5);
    float _2536 = fma(_2522, 0.5, 0.5);
    float _2538 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2530);
    float _2540 = _2500 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2542 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2524);
    float _2544 = exp2(_2532);
    float _2546 = fma(_2536, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2548 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2540);
    float _2550 = _2484 + 1.0;
    float _2552 = fma(_2536, _2546, -0.212114393711090087890625);
    float _2554 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2548);
    float _2556 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2542);
    float _2558 = 1.0 / _2538;
    float _2560 = fma(_2536, _2552, 1.570728778839111328125);
    float _2562 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2554);
    float _2564 = _2516 * 0.693147182464599609375;
    float _2566 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2556);
    float _2568 = _2564 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2570 = sqrt(_2534);
    float _2572 = -_2484;
    float _2574 = fma(_2544, _2550, _2572);
    float _2576 = fma(_2574, 0.5, 0.5);
    float _2578 = _2562 * _2558;
    float _2580 = _2566 * _2558;
    float _2582 = fma(_2578, -0.5, 0.5);
    float _2584 = fma(_2580, 0.5, 0.5);
    float2 _7079 = float2(_2464, _2528);
    float _2586 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7079, float2(0.0), isnan(_7079)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7079, float2(0.0), isnan(_7079)), level(0.0)).x;
    float _2588 = _2570 * 0.636619746685028076171875;
    float3 _7093 = float3(_2584, _2582, _2568);
    float _2590 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7093, float3(0.0), isnan(_7093)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7093, float3(0.0), isnan(_7093)), level(0.0)).x;
    float3 _7104 = float3(_2584, _2582, _2568);
    float4 _2593 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7104, float3(0.0), isnan(_7104)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7104, float3(0.0), isnan(_7104)), level(0.0)).xyzw;
    float _2595 = _2593.x;
    float _2597 = _2593.y;
    float _2599 = _2593.z;
    float _2601 = _2593.w;
    float _2603 = -_2560;
    float _2605 = fma(_2588, _2603, 1.0);
    float2 _7125 = float2(_2605, _2576);
    float3 _2609 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7125, float2(0.0), isnan(_7125)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7125, float2(0.0), isnan(_7125)), level(0.0)).xyz;
    float _2611 = _2609.x;
    float _2613 = _2609.y;
    float _2615 = _2609.z;
    float _2617 = _1912 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2619 = _1912 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2621 = _1912 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2623 = abs(_2150);
    float _2625 = log2(_2623);
    float _2627 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2617);
    float _2629 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2619);
    float _2631 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2621);
    float _2633 = _2500 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2635 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2627);
    float _2637 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2629);
    float _2639 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2631);
    float _2641 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2633);
    float _2643 = _2635 * _2635;
    float _2645 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2641);
    float _2647 = fma(_2637, _2637, _2643);
    out.m_70.x = _1484;
    float _2649 = _2625 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2651 = fma(_2639, _2639, _2647);
    float _2653 = exp2(_2649);
    float _2655 = rsqrt(_2651);
    float _2657 = fma(_2653, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2659 = precise::clamp(_2657, 0.0, 1.0);
    float _2661 = fma(_2659, -2.0, 3.0);
    float _2663 = _2659 * _2659;
    float _2665 = _2635 * _2655;
    float _2667 = _2637 * _2655;
    float _2669 = _2663 * _2661;
    float _2671 = fma(_2665, -0.5, 0.5);
    float _2673 = fma(_2667, 0.5, 0.5);
    float _2675 = -_2669;
    float _2677 = _2675 + 1.0;
    float _2679 = _2671;
    float _2681 = _2673;
    if (_1010)
    {
        float _2683 = -_2671;
        float _2685 = _870 ? _2683 : _2671;
        _2679 = _2685;
    }
    float _2687 = _2679;
    float _2689 = fma(_2677, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2669);
    if (_1002)
    {
        float _2691 = -_2673;
        float _2693 = _1228 ? _2691 : _2673;
        _2681 = _2693;
    }
    float _2695 = _2681;
    bool _2697 = _2390 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2699 = isnan(_2390);
    bool _2701 = _2697 || _2699;
    bool _2703 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2705 = _2701 || _2703;
    float _2707 = _2687 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2709 = in.m_76.x;
    float _2711 = _2695 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2713 = _2707 * _1286;
    float _2715 = _2494 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2717 = _2150 <= 8000.0;
    bool _2719 = isnan(_2150);
    bool _2721 = _2717 || _2719;
    bool _2723 = isnan(8000.0);
    bool _2725 = _2721 || _2723;
    float _2727 = float(_2725);
    float _2729 = _2711 * _1232;
    float _2731 = _2538 * 0.5;
    float _2733 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2645);
    float _2735 = _2566 + _2538;
    float _2737 = exp2(_2715);
    float _2739 = _2727 * _2689;
    float _2741 = fma(_2562, -0.5, _2731);
    float _2743 = _2733 + _2538;
    float _2745 = _2739 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _2566;
    out.gl_Position.y = _2562;
    out.gl_Position.z = _2733;
    out.gl_Position.w = _2538;
    float _2747 = _2743 * 0.5;
    float _2749 = _2735 * 0.5;
    float _2751 = _2713;
    float _2753 = _2729;
    if (!_2705)
    {
        _1490 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2755 = _1490;
    out.m_64.x = _1284;
    out.m_64.y = _1126;
    out.m_64.z = _2729;
    out.m_64.w = _2713;
    out.m_78.x = _2749;
    out.m_78.y = _2741;
    out.m_78.z = _2747;
    out.m_78.w = _2538;
    float _2757 = -_2737;
    float _2759 = _2757 + 1.0;
    float _2761 = _2759 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2763 = _2755;
    float _2765 = _2755;
    if (!_2705)
    {
        _2751 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2767 = _2751;
    float _2769 = _2767;
    float _2771 = _2767;
    if (!_2705)
    {
        _2753 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2773 = _2753;
    float _2775 = _2773;
    float _2777 = _2773;
    if (!_2705)
    {
        _1260 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2779 = _1260;
    float _2781 = _2779;
    float _2783 = _2779;
    if (!_2705)
    {
        _1424 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2785 = _1424;
    float _2787 = -_2586;
    float _2789 = _2787 + 1.0;
    float _2791 = _2761 * _2590;
    float _2793 = _2789 * _2745;
    float _2795 = precise::clamp(_2793, 0.0, 1.0);
    float _2797 = -_2761;
    float _2799 = _2797 + 1.0;
    float _2801 = -_2795;
    float _2803 = fma(_2801, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2805 = _2601 * _2791;
    float _2807 = _2601 * _2799;
    float _2809 = _2803 * _2709;
    float _2811 = _2615 * _2791;
    float _2813 = fma(_2611, _2805, _2595);
    float _2815 = fma(_2613, _2805, _2597);
    float _2817 = _2809 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2819 = fma(_2601, _2811, _2599);
    float _2821 = _2204 * _2262;
    out.m_80.x = _2817;
    float _2823 = _2821 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2825 = _2821;
    float _2827 = _2785;
    float _2829 = _2785;
    if (!_2705)
    {
        _2825 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2831 = _2825;
    out.m_82.x = _2813;
    out.m_82.y = _2815;
    out.m_82.z = _2819;
    out.m_82.w = _2807;
    bool _2833 = !_2705;
    float _2835 = _2831;
    float _2837 = _2831;
    if (!_2833)
    {
        bool _2839 = _2390 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2841 = isnan(_2390);
        bool _2843 = _2839 || _2841;
        bool _2845 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2847 = _2843 || _2845;
        if (!_2847)
        {
            float _2849 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2851 = _2390 + _2849;
            float _2853 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2855 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2853;
            float _2857 = 1.0 / _2855;
            float _2859 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2861 = _2859 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2863 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2865 = _2863 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2867 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2869 = _2867 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2871 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2873 = _2871 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2875 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2877 = _2875 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2879 = _2851 * _2857;
            float _2881 = precise::clamp(_2879, 0.0, 1.0);
            float _2883 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2885 = _2883 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2887 = fma(_2881, _2861, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2889 = fma(_2881, _2885, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2891 = fma(_2881, _2865, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2893 = fma(_2881, _2869, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2895 = fma(_2881, _2873, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2897 = fma(_2881, _2877, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2771 = _2889;
            _2829 = _2895;
            _2765 = _2887;
            _2783 = _2893;
            _2777 = _2891;
            _2837 = _2897;
            _2899 = true;
        }
        else
        {
            bool _2901 = _2390 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2903 = isnan(_2390);
            bool _2905 = _2901 || _2903;
            bool _2907 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2909 = _2905 || _2907;
            if (!_2909)
            {
                _2763 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2911 = _2763;
            _2765 = _2911;
            if (!_2909)
            {
                _2769 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2913 = _2769;
            _2771 = _2913;
            if (!_2909)
            {
                _2775 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2915 = _2775;
            _2777 = _2915;
            if (!_2909)
            {
                _2781 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2917 = _2781;
            _2783 = _2917;
            if (!_2909)
            {
                _2827 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2919 = _2827;
            _2829 = _2919;
            if (!_2909)
            {
                _2835 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2921 = _2835;
            bool _2923 = !_2909;
            _2837 = _2921;
            if (!_2923)
            {
                bool _2925 = _2390 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2927 = isnan(_2390);
                bool _2929 = _2925 || _2927;
                bool _2931 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2933 = _2929 || _2931;
                if (!_2933)
                {
                    float _2935 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2937 = _2390 + _2935;
                    float _2939 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2941 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2939;
                    float _2943 = 1.0 / _2941;
                    float _2945 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2947 = _2945 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2949 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2951 = _2949 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2953 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2955 = _2953 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2957 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2959 = _2957 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2961 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2963 = _2961 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2965 = _2937 * _2943;
                    float _2967 = precise::clamp(_2965, 0.0, 1.0);
                    float _2969 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2971 = _2969 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2973 = fma(_2967, _2947, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2975 = fma(_2967, _2971, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2977 = fma(_2967, _2951, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2979 = fma(_2967, _2955, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2981 = fma(_2967, _2959, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2983 = fma(_2967, _2963, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2771 = _2975;
                    _2829 = _2981;
                    _2765 = _2973;
                    _2783 = _2979;
                    _2777 = _2977;
                    _2837 = _2983;
                    _2899 = true;
                }
                else
                {
                    _2771 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2829 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2765 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2783 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2777 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2837 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2899 = false;
    float _2985 = _2771;
    float _2987 = _2829;
    float _2989 = _2765;
    float _2991 = _2783;
    float _2993 = _2777;
    float _2995 = _2837;
    float _2997 = fma(_1912, -0.5, 0.5);
    float _2999 = precise::clamp(_2997, 0.0, 1.0);
    float _3001 = -_2985;
    float _3003 = _3001 + _2987;
    float _3005 = _2823 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3007 = -_2989;
    float _3009 = _3007 + _2991;
    float _3011 = fma(_2999, _3003, _2985);
    out.m_84.x = 0.0;
    float _3013 = -_2993;
    float _3015 = _3013 + _2995;
    float _3017 = fma(_2999, _3009, _2989);
    float _3019 = _3011 * 0.586610972881317138671875;
    out.m_55.x = _3005;
    bool _3021 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3023 = fma(_2999, _3015, _2993);
    float _3025 = fma(_3017, 0.298911988735198974609375, _3019);
    bool _3027 = _2204 > 0.0;
    bool _3029 = isnan(_2204);
    bool _3031 = _3027 || _3029;
    bool _3033 = isnan(0.0);
    bool _3035 = _3031 || _3033;
    float _3037 = fma(_3023, 0.114477999508380889892578125, _3025);
    bool _3039 = _2262 <= 0.0;
    bool _3041 = !_3035;
    bool _3043 = _3039 || _3041;
    float _3045 = -_3037;
    float _3047 = _3017 + _3045;
    float _3049 = -_3037;
    float _3051 = _3011 + _3049;
    float _3053 = -_3037;
    float _3055 = _3023 + _3053;
    float _3057 = fma(_3047, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3037);
    float _3059 = fma(_3051, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3037);
    float _3061 = fma(_3055, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3037);
    bool _3063 = !_3021;
    if (!_3063)
    {
        float _3065 = -_2136;
        float _3067 = _3065 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3069 = -_2138;
        float _3071 = _3069 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3073 = -_2140;
        float _3075 = _3073 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3077 = _3067 * _3067;
        float _3079 = fma(_3071, _3071, _3077);
        float _3081 = fma(_3075, _3075, _3079);
        float _3083 = sqrt(_3081);
        float _3085 = rsqrt(_3081);
        float _3087 = -_3083;
        float _3089 = _3087 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3091 = _3089 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3093 = precise::clamp(_3091, 0.0, 1.0);
        float _3095 = _3071 * _3085;
        float _3097 = _3067 * _3085;
        float _3099 = abs(_3093);
        float _3101 = log2(_3099);
        float _3103 = _3075 * _3085;
        float _3105 = _3095 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3107 = _1912 * _3097;
        float _3109 = -_3097;
        float _3111 = -_3105;
        float _3113 = fma(_3109, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3111);
        float _3115 = fma(_1910, _3095, _3107);
        float _3117 = -_3103;
        float _3119 = fma(_3117, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3113);
        float _3121 = fma(_1914, _3103, _3115);
        float _3123 = precise::clamp(_3121, 0.0, 1.0);
        float _3125 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3127 = _3119 + _3125;
        float _3129 = _3101 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3131 = _3127 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3133 = precise::clamp(_3131, 0.0, 1.0);
        float _3135 = exp2(_3129);
        float _3137 = _3135 * _3133;
        float _3139 = _3123 * _3137;
        float _3141 = _3139 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3143 = _3139 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3145 = _3139 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _3141;
        out.m_84.y = _3143;
        out.m_84.z = _3145;
    }
    out.m_86.x = _3057;
    out.m_86.y = _3059;
    out.m_86.z = _3061;
    if (!_3043)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_55.x = 0.0;
    float _3147 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3147;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

