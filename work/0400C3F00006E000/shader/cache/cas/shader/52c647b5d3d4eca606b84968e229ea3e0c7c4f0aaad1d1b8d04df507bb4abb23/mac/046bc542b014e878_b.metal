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
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
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
    float4 m_47 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_76 [[user(locn3)]];
    float4 m_84 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
    float4 m_70 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
    float4 m_80 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_60 [[attribute(3)]];
    float4 m_66 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_56 [[attribute(7)]];
    float4 m_54 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3645 = false;
    bool _523 = false;
    bool _319 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _3930 = as_type<float>(_119);
        out.gl_Position.z = _3930;
    }
    if (!_107)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = in.m_49.w;
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
        out.m_47.x = 0.0;
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
        float _4000 = as_type<float>(_157);
        out.gl_Position.z = _4000;
    }
    if (_149)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = in.m_54.w;
    bool _163 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _165 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _167 = _163 || _165;
    bool _169 = isnan(1.0);
    bool _171 = _167 || _169;
    float _173 = in.m_49.x;
    float _175 = in.m_49.y;
    float _177 = in.m_49.z;
    float _179 = in.m_44.x;
    float _181 = in.m_44.y;
    float _183 = in.m_44.z;
    int _185 = as_type<int>(_159) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_159) & 2;
    bool _191 = _189 != 0;
    float _193 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _195 = 0.0;
    float _197 = _193;
    if (!_171)
    {
        float _199 = _193 * _193;
        float _201 = _199 * 0.5;
        _195 = _201;
    }
    float _203 = _195;
    bool _205 = !_187;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_191;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = _203;
    if (!_171)
    {
        float _215 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _215;
    }
    float _217 = _213;
    bool _219 = !_171;
    float _221 = _217;
    if (!_219)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = _193 * _225;
        float _235 = 1.0 / _229;
        float _237 = _231 * 0.693147182464599609375;
        float _239 = exp2(_233);
        float _241 = 1.0 / _237;
        float _243 = _239 + (-1.0);
        float _245 = -_243;
        float _247 = fma(_245, _241, _193);
        float _249 = _247 * _235;
        float _251 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _251;
    }
    float _253 = _221;
    bool _255 = !_171;
    if (!_255)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = 1.0 / _263;
        float _267 = _193 * _259;
        float _269 = exp2(_267);
        float _271 = -_269;
        float _273 = _271 + 1.0;
        float _275 = _273 * _265;
        _197 = _275;
    }
    float _277 = _197;
    bool _279 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _281 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _283 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _285 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _287 = fma(_277, _173, _281);
    float _289 = fma(_277, _175, _283);
    float _291 = fma(_277, _177, _285);
    float _293 = fma(_287, _161, _179);
    float _295 = fma(_289, _161, _181);
    float _297 = fma(_291, _161, _183);
    bool _299 = !_279;
    float _317;
    if (!_299)
    {
        float _301 = in.m_56.x;
        float _303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _305 = _301 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _309 = _307 * _303;
        float _311 = floor(_309);
        float _313 = -_311;
        float _315 = _309 + _313;
        _317 = _315;
        _319 = true;
    }
    else
    {
        float _321 = float(_103);
        float _323 = 1.0 / _321;
        float _325 = _137 * _323;
        _317 = _325;
    }
    _319 = false;
    float _327 = _317;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _331 = _327 + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = _327 + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _345;
    float _349 = in.m_54.x;
    float _351 = in.m_54.y;
    bool _353 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _355 = isnan(_327);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = 1.0 / _339;
    bool _367 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _369 = 1.0 / _343;
    float _371 = 1.0 / _347;
    float _373 = _331 * _365;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _377 = _327 + _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _379;
    float _383 = fma(_381, _373, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _385 = _377 * _369;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _387;
    bool _391 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _393 = isnan(_327);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = fma(_389, _373, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _405 = -_401;
    float _407 = _405 + 1.0;
    float _409 = _335 * _371;
    float _411 = -_363;
    float _413 = _411 + 1.0;
    bool _415 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _417 = isnan(_327);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = _401 * _413;
    bool _429 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _431 = isnan(_327);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = _425 * _407;
    float _443 = -_425;
    float _445 = _443 + 1.0;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _455 = _439 * _445;
    float _457 = fma(_449, _385, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _459 = fma(_453, _385, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _461 = -_439;
    float _463 = _461 + 1.0;
    float _465 = _383 * _455;
    float _467 = _403 * _455;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _473;
    float _477 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[143].x, _465);
    float _479 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[143].y, _467);
    float _481 = fma(_471, _409, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _483 = fma(_475, _409, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _485 = fma(_457, _441, _477);
    float _487 = fma(_459, _441, _479);
    float _489 = fma(_481, _427, _485);
    float _491 = fma(_483, _427, _487);
    float _493 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[146].x, _489);
    float _495 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[146].y, _491);
    float _497 = _493 * _349;
    float _499 = _495 * _351;
    bool _501 = !_367;
    float _503 = _409;
    float _521;
    if (!_501)
    {
        float _505 = in.m_56.x;
        float _507 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _509 = _505 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _511 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[11].x, _137);
        float _513 = _511 * _507;
        float _515 = floor(_513);
        float _517 = -_515;
        float _519 = _513 + _517;
        _521 = _519;
        _523 = true;
    }
    else
    {
        float _525 = float(_103);
        float _527 = 1.0 / _525;
        float _529 = _137 * _527;
        _521 = _529;
    }
    _523 = false;
    float _531 = _521;
    float _533 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _535 = int(_533);
    float _537 = float(_103);
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _541 = _539 != 0;
    float _543 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _545 = int(_543);
    float _547 = float(_535);
    float _549 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _551 = int(_549);
    if (_541)
    {
        float _553 = in.m_56.x;
        _503 = _553;
    }
    float _555 = _503;
    float _557 = _555;
    if (!_541)
    {
        float _559 = in.m_56.y;
        _557 = _559;
    }
    float _561 = _557;
    float _563 = float(_545);
    float _565 = 1.0 / _547;
    float _567 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _569 = int(_567);
    float _571 = float(uint(_551));
    float _573 = 1.0 / _563;
    float _575 = _565 * _137;
    float _577 = 1.0 / _571;
    float _579 = float(uint(_569));
    int _581 = ~_569;
    int _583 = _581 + 1;
    int _585 = ~_569;
    int _587 = _585 + 1;
    float _589 = trunc(_575);
    int _591 = int(_589);
    float _593 = _573 * _137;
    float _595 = 1.0 / _579;
    int _597 = as_type<int>(_577) + (-2);
    float _599 = in.m_56.x;
    float _601 = in.m_56.y;
    float _603 = in.m_56.z;
    float _605 = in.m_56.w;
    float _607 = trunc(_593);
    int _609 = int(_607);
    float _611 = float(uint(_591));
    float _613 = as_type<float>(_597) * _611;
    int _615 = as_type<int>(_595) + (-2);
    float _617 = trunc(_613);
    float _619 = precise::max(_617, 0.0);
    uint _622 = uint(_619);
    int _624 = ~_551;
    int _626 = _624 + 1;
    float _628 = float(uint(_609));
    float _630 = _613;
    float _632 = _628;
    if (_541)
    {
        _630 = 1.0;
    }
    float _634 = _630;
    float _636 = as_type<float>(_615) * _628;
    float _638 = _634;
    if (_541)
    {
        _632 = 1.0;
    }
    float _640 = _632;
    float _642 = _640;
    if (!_541)
    {
        _642 = 7.345489978790283203125;
    }
    float _644 = _642;
    float _646 = trunc(_636);
    float _648 = precise::max(_646, 0.0);
    uint _650 = uint(_648);
    int _652 = _626 * int(_622);
    int _654 = _652 + _591;
    if (!_541)
    {
        _638 = 1.2345600128173828125;
    }
    float _656 = _638;
    float _658 = _644 * _599;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _662 = _660 != 0;
    float _664 = float(uint(_654));
    float _666 = _561 * _656;
    float _668 = floor(_658);
    float _670 = as_type<float>(_597) * _664;
    int _672 = _583 * int(_650);
    int _674 = _672 + _609;
    float _676 = trunc(_670);
    float _678 = precise::max(_676, 0.0);
    uint _680 = uint(_678);
    float _682 = float(uint(_674));
    float _684 = -_668;
    float _686 = _658 + _684;
    float _688 = floor(_666);
    float _690 = as_type<float>(_615) * _682;
    int _692 = ~_551;
    int _694 = _692 + 1;
    float _696 = float(_569);
    float _698 = trunc(_690);
    float _700 = precise::max(_698, 0.0);
    uint _702 = uint(_700);
    int _704 = int(_622) + int(_680);
    float _706 = float(_551);
    float _708 = float(_609);
    int _710 = _694 * _704;
    int _712 = _710 + _591;
    float _714 = 1.0 / _537;
    float _716 = -_688;
    float _718 = _666 + _716;
    float _720 = _686 * _706;
    float _722 = float(_591);
    bool _724 = uint(_712) >= uint(_551);
    bool _726 = !_662;
    int _728 = _726 ? 0 : 1;
    float _730 = trunc(_720);
    int _732 = int(_730);
    int _734 = int(_650) + int(_702);
    int _736 = ~_569;
    int _738 = _736 + 1;
    bool _740 = _708 >= _696;
    bool _742 = isnan(_708);
    bool _744 = _740 || _742;
    bool _746 = isnan(_696);
    bool _748 = _744 || _746;
    float _750 = float(_748);
    float _752 = _714 * _137;
    bool _754 = _722 >= _706;
    bool _756 = isnan(_722);
    bool _758 = _754 || _756;
    bool _760 = isnan(_706);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = _718 * _696;
    int _768 = _738 * _734;
    int _770 = _768 + _609;
    float _772 = _706 * _752;
    float _774 = _696 * _752;
    int _776 = abs(_728);
    float _778 = trunc(_764);
    int _780 = int(_778);
    bool _782 = !_724;
    int _784 = _782 ? 0 : (-1);
    bool _786 = uint(_770) >= uint(_569);
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _790 = _788 != 0;
    int _792 = ~_704;
    int _794 = _792 + _784;
    int _796 = _794 + 1;
    float _798 = trunc(_750);
    int _800 = int(_798);
    int _802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _804 = _802 != 0;
    int _806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _808 = _806 != 0;
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _812 = _810 != 0;
    int _814 = _732 * _776;
    int _816 = _814 + _591;
    bool _818 = !_786;
    int _820 = _818 ? 0 : (-1);
    int _822 = _551 * _796;
    int _824 = _822 + _591;
    bool _826 = !_790;
    int _828 = _826 ? 0 : 1;
    bool _830 = !_808;
    int _832 = _830 ? 0 : 1;
    float _834 = trunc(_766);
    int _836 = int(_834);
    int _838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _840 = _838 != 0;
    int _842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _844 = _842 != 0;
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _848 = _846 != 0;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _852 = _850 != 0;
    bool _854 = _551 == 0;
    int _856 = ~_734;
    int _858 = _856 + _820;
    int _860 = _858 + 1;
    int _862 = ~_780;
    int _864 = _862 + 1;
    int _866 = _864 + 1;
    float _868 = trunc(_772);
    int _870 = int(_868);
    bool _872 = !_854;
    int _874 = _872 ? _824 : (-1);
    int _876 = _569 * _860;
    int _878 = _876 + _609;
    bool _880 = !_844;
    int _882 = _880 ? 0 : 1;
    bool _884 = _569 == 0;
    int _886 = _874 * _866;
    int _888 = abs(_828);
    int _890 = _551 + (-1);
    int _892 = ~_800;
    int _894 = _892 + 1;
    int _896 = _894 + 1;
    int _898 = _836 * _888;
    int _900 = _898 + _609;
    bool _902 = !_884;
    int _904 = _902 ? _878 : (-1);
    int _906 = _780 * _890;
    int _908 = _906 + _886;
    int _910 = abs(_832);
    int _912 = _569 + (-1);
    int _914 = _904 * _896;
    int _916 = abs(_882);
    int _918 = _908 * _910;
    bool _920 = !_804;
    int _922 = _920 ? 0 : 1;
    int _924 = _800 * _912;
    int _926 = _924 + _914;
    int _928 = abs(_922);
    float _930 = trunc(_774);
    int _932 = int(_930);
    int _934 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _936 = _934 != 0;
    int _938 = _926 * _916;
    bool _940 = !_812;
    int _942 = _940 ? 0 : 1;
    int _944 = _870 * _928;
    int _946 = _944 + _918;
    bool _948 = !_936;
    int _950 = _948 ? 0 : 1;
    int _952 = abs(_942);
    bool _954 = !_848;
    int _956 = _954 ? 0 : 1;
    int _958 = abs(_950);
    int _960 = _816 * _952;
    int _962 = _960 + _946;
    bool _964 = !_840;
    int _966 = _964 ? 0 : 1;
    int _968 = abs(_956);
    bool _970 = !_852;
    int _972 = _970 ? 0 : 1;
    int _974 = abs(_966);
    int _976 = _732 * _958;
    int _978 = _976 + _962;
    int _980 = abs(_972);
    int _982 = _932 * _974;
    int _984 = _982 + _938;
    float _986 = float(uint(_978));
    int _988 = ~_551;
    int _990 = _988 + 1;
    int _992 = _900 * _968;
    int _994 = _992 + _984;
    int _996 = ~_569;
    int _998 = _996 + 1;
    float _1000 = as_type<float>(_597) * _986;
    float _1002 = float(uint(_900));
    int _1004 = _836 * _980;
    int _1006 = _1004 + _994;
    float _1008 = float(uint(_816));
    float _1010 = trunc(_1000);
    float _1012 = precise::max(_1010, 0.0);
    uint _1014 = uint(_1012);
    float _1016 = float(uint(_1006));
    float _1018 = as_type<float>(_597) * _1008;
    float _1020 = as_type<float>(_615) * _1002;
    float _1022 = as_type<float>(_615) * _1016;
    float _1024 = trunc(_1018);
    float _1026 = precise::max(_1024, 0.0);
    uint _1028 = uint(_1026);
    float _1030 = trunc(_1022);
    float _1032 = precise::max(_1030, 0.0);
    uint _1034 = uint(_1032);
    int _1036 = _990 * int(_1014);
    int _1038 = _1036 + _978;
    float _1040 = float(uint(_1038));
    int _1042 = _990 * int(_1028);
    int _1044 = _1042 + _816;
    float _1046 = trunc(_1020);
    float _1048 = precise::max(_1046, 0.0);
    uint _1050 = uint(_1048);
    float _1052 = as_type<float>(_597) * _1040;
    float _1054 = float(uint(_1044));
    int _1056 = _998 * int(_1034);
    int _1058 = _1056 + _1006;
    float _1060 = as_type<float>(_597) * _1054;
    int _1062 = ~_551;
    int _1064 = _1062 + 1;
    float _1066 = float(uint(_1058));
    float _1068 = trunc(_1052);
    float _1070 = precise::max(_1068, 0.0);
    uint _1072 = uint(_1070);
    float _1074 = as_type<float>(_615) * _1066;
    float _1076 = trunc(_1060);
    float _1078 = precise::max(_1076, 0.0);
    uint _1080 = uint(_1078);
    int _1082 = ~_569;
    int _1084 = _1082 + 1;
    int _1086 = _1084 * int(_1050);
    int _1088 = _1086 + _900;
    float _1090 = trunc(_1074);
    float _1092 = precise::max(_1090, 0.0);
    uint _1094 = uint(_1092);
    int _1096 = int(_1014) + int(_1072);
    int _1098 = ~_569;
    int _1100 = _1098 + 1;
    int _1102 = ~_551;
    int _1104 = _1102 + 1;
    int _1106 = _1064 * _1096;
    int _1108 = _1106 + _978;
    int _1110 = int(_1028) + int(_1080);
    bool _1112 = uint(_1108) >= uint(_551);
    int _1114 = _1104 * _1110;
    int _1116 = _1114 + _816;
    bool _1118 = !_1112;
    int _1120 = _1118 ? 0 : (-1);
    int _1122 = int(_1034) + int(_1094);
    int _1124 = ~_1096;
    int _1126 = _1124 + _1120;
    int _1128 = _1126 + 1;
    float _1130 = float(uint(_1088));
    int _1132 = _1100 * _1122;
    int _1134 = _1132 + _1006;
    bool _1136 = uint(_1116) >= uint(_551);
    int _1138 = _551 * _1128;
    int _1140 = _1138 + _978;
    float _1142 = as_type<float>(_615) * _1130;
    bool _1144 = uint(_1134) >= uint(_569);
    bool _1146 = !_854;
    int _1148 = _1146 ? _1140 : (-1);
    float _1150 = trunc(_1142);
    float _1152 = precise::max(_1150, 0.0);
    uint _1154 = uint(_1152);
    bool _1156 = !_1144;
    int _1158 = _1156 ? 0 : (-1);
    int _1160 = _1148 & 3;
    bool _1162 = _1160 != 0;
    int _1164 = ~_1122;
    int _1166 = _1164 + _1158;
    int _1168 = _1166 + 1;
    bool _1170 = !_1136;
    int _1172 = _1170 ? 0 : (-1);
    bool _1174 = uint(_1160) >= 2u;
    int _1176 = _569 * _1168;
    int _1178 = _1176 + _1006;
    int _1180 = ~_1110;
    int _1182 = _1180 + _1172;
    int _1184 = _1182 + 1;
    int _1186 = _1174 ? 0 : 1;
    bool _1188 = _605 > 0.5;
    int _1190 = _551 * _1184;
    int _1192 = _1190 + _816;
    int _1194 = _1148 >> 31;
    int _1196 = _1148 & 3;
    bool _1198 = _1196 != 0;
    int _1200 = _1194 & 3;
    bool _1202 = !_884;
    int _1204 = _1202 ? _1178 : (-1);
    int _1206 = _1148 + _1200;
    int _1208 = _1198 ? 0 : 1;
    int _1210 = _1206 >> 2;
    bool _1212 = _1160 != 3;
    int _1214 = _1204 >> 31;
    int _1216 = _1210 << 4;
    int _1218 = _1216 + 368;
    bool _1220 = uint(_1160) > 1u;
    int _1222 = _1214 & 3;
    uint _1224 = uint(int(uint(_1218) >> uint(2)));
    uint _1226 = uint(int(uint(int(_1224)) >> uint(2)));
    int _1228 = int(_1224) & 3;
    float _1230 = (*spvDescriptorSet0.vp_c9)._m0[int(_1226)][_1228];
    int _1232 = int(_1224) + 1;
    uint _1234 = uint(int(uint(_1232) >> uint(2)));
    int _1236 = _1232 & 3;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[int(_1234)][_1236];
    int _1240 = ~_1186;
    int _1242 = _1240 + 1;
    int _1244 = _1242 + 1;
    int _1246 = _1204 + _1222;
    int _1248 = _1244;
    if (_1212)
    {
        int _1250 = ~_1186;
        int _1252 = _1250 + 1;
        _1248 = _1252;
    }
    int _1254 = _1248;
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1258 = _1256 != 0;
    int _1260 = _1218 + 8;
    uint _1262 = uint(int(uint(_1260) >> uint(2)));
    uint _1264 = uint(int(uint(int(_1262)) >> uint(2)));
    int _1266 = int(_1262) & 3;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[int(_1264)][_1266];
    int _1270 = int(_1262) + 1;
    uint _1272 = uint(int(uint(_1270) >> uint(2)));
    int _1274 = _1270 & 3;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[int(_1272)][_1274];
    int _1278 = _1246 >> 2;
    int _1280 = int(_1050) + int(_1154);
    int _1282 = ~_1208;
    int _1284 = _1282 + 1;
    int _1286 = _1284 + 1;
    float _1288 = in.m_58.x;
    float _1290 = in.m_58.y;
    float _1292 = in.m_58.z;
    float _1294 = in.m_58.w;
    bool _1296 = !_1258;
    int _1298 = _1296 ? 0 : 1;
    int _1300 = _587 * _1280;
    int _1302 = _1300 + _900;
    bool _1304 = !_854;
    int _1306 = _1304 ? _1192 : (-1);
    int _1308 = _1286;
    if (!_1220)
    {
        int _1310 = ~_1208;
        int _1312 = _1310 + 1;
        _1308 = _1312;
    }
    int _1314 = _1308;
    float _1316 = in.m_60.x;
    float _1318 = in.m_60.y;
    float _1320 = in.m_60.z;
    float _1322 = in.m_60.w;
    int _1324 = _1278 << 4;
    int _1326 = _1324 + 512;
    int _1328 = _1204 & 3;
    bool _1330 = _1328 != 0;
    int _1332 = _1204 & 3;
    bool _1334 = _1332 != 0;
    uint _1336 = uint(int(uint(_1326) >> uint(2)));
    uint _1338 = uint(int(uint(int(_1336)) >> uint(2)));
    int _1340 = int(_1336) & 3;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[int(_1338)][_1340];
    int _1344 = int(_1336) + 1;
    uint _1346 = uint(int(uint(_1344) >> uint(2)));
    int _1348 = _1344 & 3;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[int(_1346)][_1348];
    float _1352 = in.m_62.x;
    float _1354 = in.m_62.y;
    float _1356 = in.m_62.z;
    float _1358 = in.m_62.w;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1362 = _1360 != 0;
    bool _1364 = !_1162;
    int _1366 = _1364 ? 0 : 1;
    bool _1368 = uint(_1332) > 1u;
    bool _1370 = !_1362;
    int _1372 = _1370 ? 0 : 1;
    bool _1374 = _1332 != 3;
    int _1376 = _1330 ? 0 : 1;
    bool _1378 = uint(_1332) >= 2u;
    int _1380 = ~_1376;
    int _1382 = _1380 + 1;
    int _1384 = _1382 + 1;
    int _1386 = _1378 ? 0 : 1;
    bool _1388 = !_1334;
    int _1390 = _1388 ? 0 : 1;
    bool _1392 = uint(_1302) >= uint(_569);
    int _1394 = _1384;
    if (!_1368)
    {
        int _1396 = ~_1376;
        int _1398 = _1396 + 1;
        _1394 = _1398;
    }
    int _1400 = _1394;
    bool _1402 = _1160 != 3;
    bool _1404 = _1332 != 3;
    int _1406 = ~_1386;
    int _1408 = _1406 + 1;
    int _1410 = _1408 + 1;
    int _1412 = abs(_1314);
    int _1414 = _1410;
    if (_1374)
    {
        int _1416 = ~_1386;
        int _1418 = _1416 + 1;
        _1414 = _1418;
    }
    int _1420 = _1414;
    float _1422 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1424 = int(_1422);
    bool _1426 = !_1392;
    int _1428 = _1426 ? 0 : (-1);
    bool _1430 = !_1402;
    int _1432 = _1430 ? 0 : (-1);
    bool _1434 = !_1404;
    int _1436 = _1434 ? 0 : (-1);
    int _1438 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1440 = _1438 != 0;
    float _1442 = _295 * _1290;
    int _1444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1446 = _1444 != 0;
    int _1448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1450 = _1448 != 0;
    int _1452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1454 = _1452 != 0;
    int _1456 = _1326 + 8;
    uint _1458 = uint(int(uint(_1456) >> uint(2)));
    uint _1460 = uint(int(uint(int(_1458)) >> uint(2)));
    int _1462 = int(_1458) & 3;
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[int(_1460)][_1462];
    int _1466 = int(_1458) + 1;
    uint _1468 = uint(int(uint(_1466) >> uint(2)));
    int _1470 = _1466 & 3;
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[int(_1468)][_1470];
    float _1474 = _295 * _1354;
    int _1476 = abs(_1366);
    int _1478 = abs(_1400);
    float _1480 = _295 * _1318;
    int _1482 = ~_1412;
    int _1484 = _1482 + 1;
    int _1486 = _1484 + 1;
    float _1488 = fma(_293, _1288, _1442);
    int _1490 = abs(_1254);
    int _1492 = _1486 * as_type<int>(_1238);
    int _1494 = ~_1476;
    int _1496 = _1494 + 1;
    int _1498 = _1496 + 1;
    int _1500 = ~_1490;
    int _1502 = _1500 + 1;
    int _1504 = _1502 + 1;
    int _1506 = abs(_1424);
    int _1508 = _1498 * as_type<int>(_1230);
    int _1510 = _1508 + _1492;
    float _1512 = float(uint(_1424));
    int _1514 = _1504 * as_type<int>(_1268);
    int _1516 = _1514 + _1510;
    float _1518 = 1.0 / _1512;
    int _1520 = abs(_1432);
    int _1522 = abs(_1390);
    int _1524 = abs(_1298);
    int _1526 = abs(_1420);
    int _1528 = ~_1520;
    int _1530 = _1528 + 1;
    int _1532 = _1530 + 1;
    float _1534 = float(uint(_1506));
    int _1536 = ~_1524;
    int _1538 = _1536 + 1;
    int _1540 = _1538 + 1;
    int _1542 = _1532 * as_type<int>(_1276);
    int _1544 = _1542 + _1516;
    int _1546 = ~_1478;
    int _1548 = _1546 + 1;
    int _1550 = _1548 + 1;
    float _1552 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1554 = int(_1552);
    int _1556 = _1544 * _1540;
    int _1558 = ~_1522;
    int _1560 = _1558 + 1;
    int _1562 = _1560 + 1;
    int _1564 = _1550 * as_type<int>(_1350);
    int _1566 = ~_1526;
    int _1568 = _1566 + 1;
    int _1570 = _1568 + 1;
    int _1572 = _1306 * _1524;
    int _1574 = _1572 + _1556;
    int _1576 = abs(_1372);
    int _1578 = _1562 * as_type<int>(_1342);
    int _1580 = _1578 + _1564;
    float _1582 = 1.0 / _1534;
    int _1584 = abs(_1436);
    float _1586 = _601 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1588 = abs(_1574);
    int _1590 = _1570 * as_type<int>(_1464);
    int _1592 = _1590 + _1580;
    int _1594 = as_type<int>(_1518) + (-2);
    float _1596 = float(uint(_1574));
    int _1598 = ~_1280;
    int _1600 = _1598 + _1428;
    int _1602 = _1600 + 1;
    float _1604 = as_type<float>(_1594) * _1596;
    int _1606 = ~_1584;
    int _1608 = _1606 + 1;
    int _1610 = _1608 + 1;
    float _1612 = float(uint(_1554));
    int _1614 = _569 * _1602;
    int _1616 = _1614 + _900;
    int _1618 = as_type<int>(_1582) + (-2);
    int _1620 = _1610 * as_type<int>(_1472);
    int _1622 = _1620 + _1592;
    float _1624 = float(uint(_1588));
    float _1626 = trunc(_1604);
    float _1628 = precise::max(_1626, 0.0);
    uint _1630 = uint(_1628);
    int _1632 = ~_1576;
    int _1634 = _1632 + 1;
    int _1636 = _1634 + 1;
    float _1638 = fma(_293, _1316, _1480);
    float _1640 = as_type<float>(_1618) * _1624;
    float _1642 = fma(_293, _1352, _1474);
    bool _1644 = !_884;
    int _1646 = _1644 ? _1616 : (-1);
    int _1648 = _1622 * _1636;
    float _1650 = 1.0 / _1612;
    float _1652 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1654 = _1646 * _1576;
    int _1656 = _1654 + _1648;
    int _1658 = abs(_1554);
    float _1660 = fma(_297, _1356, _1642);
    int _1662 = ~_1424;
    int _1664 = _1662 + 1;
    float _1666 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1668 = _531 + _1666;
    float _1670 = trunc(_1640);
    float _1672 = precise::max(_1670, 0.0);
    uint _1674 = uint(_1672);
    float _1676 = float(uint(_1658));
    float _1678 = fma(_297, _1320, _1638);
    int _1680 = ~_1506;
    int _1682 = _1680 + 1;
    float _1684 = _599 + _601;
    float _1686 = float(uint(_1656));
    float _1688 = _1660 + _1358;
    float _1690 = 1.0 / _1676;
    float _1692 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1694 = as_type<int>(_1650) + (-2);
    int _1696 = _1664 * int(_1630);
    int _1698 = _1696 + _1574;
    float _1700 = _599 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1702 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1702;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1708 = _1706 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1710 = as_type<float>(_1694) * _1686;
    int _1712 = _1682 * int(_1674);
    int _1714 = _1712 + _1588;
    float _1716 = float(uint(_1698));
    float _1718 = -_1652;
    float _1720 = fma(_1700, 2.0, _1718);
    float _1722 = fma(_1586, -2.0, _1692);
    int _1724 = abs(_1656);
    float _1726 = trunc(_1710);
    float _1728 = precise::max(_1726, 0.0);
    uint _1730 = uint(_1728);
    float _1732 = float(uint(_1714));
    float _1734 = as_type<float>(_1594) * _1716;
    float _1736 = _1684 + (-1.0);
    float _1738 = as_type<float>(_1618) * _1732;
    int _1740 = as_type<int>(_1690) + (-2);
    float _1742 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1744 = float(uint(_1724));
    float _1746 = 1.0 / _1704;
    float _1748 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1742);
    int _1750 = ~_1554;
    int _1752 = _1750 + 1;
    float _1754 = as_type<float>(_1740) * _1744;
    float _1756 = fma(_297, _1292, _1488);
    float _1758 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1760 = 1.0 / _1708;
    int _1762 = _1752 * int(_1730);
    int _1764 = _1762 + _1656;
    float _1766 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1768 = _531 + _1766;
    float _1770 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1758);
    int _1772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1774 = _1772 != 0;
    float _1776 = _1678 + _1322;
    float _1778 = float(uint(_1764));
    float _1780 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1722);
    float _1782 = trunc(_1754);
    float _1784 = precise::max(_1782, 0.0);
    uint _1786 = uint(_1784);
    float _1788 = _1668 * _1746;
    int _1790 = ~_1424;
    int _1792 = _1790 + 1;
    float _1794 = as_type<float>(_1694) * _1778;
    int _1796 = ~_1506;
    int _1798 = _1796 + 1;
    float _1800 = trunc(_1734);
    float _1802 = precise::max(_1800, 0.0);
    uint _1804 = uint(_1802);
    float _1806 = _1768 * _1760;
    int _1808 = ~_1658;
    int _1810 = _1808 + 1;
    float _1812 = _599 * 2.0;
    float _1814 = fma(_1736, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1816 = -_211;
    int _1818 = _1188 ? as_type<int>(_1816) : as_type<int>(_211);
    int _1820 = ~_1658;
    int _1822 = _1820 + 1;
    float _1824 = trunc(_1738);
    float _1826 = precise::max(_1824, 0.0);
    uint _1828 = uint(_1826);
    int _1830 = _1810 * int(_1786);
    int _1832 = _1830 + _1724;
    float _1834 = floor(_1812);
    int _1836 = int(_1630) + int(_1804);
    float _1838 = float(uint(_1832));
    float _1840 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1840;
    int _1844 = _1792 * _1836;
    int _1846 = _1844 + _1574;
    float _1848 = as_type<float>(_1740) * _1838;
    int _1850 = int(_1674) + int(_1828);
    float _1852 = trunc(_1794);
    float _1854 = precise::max(_1852, 0.0);
    uint _1856 = uint(_1854);
    bool _1858 = uint(_1846) >= uint(_1424);
    float _1860 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1860;
    int _1864 = _1798 * _1850;
    int _1866 = _1864 + _1588;
    int _1868 = as_type<int>(_1812);
    float _1870 = as_type<float>(_1798);
    float _1872 = _1848;
    float _1874 = _1794;
    if (_1774)
    {
        _1868 = 0;
    }
    int _1876 = _1868;
    float _1878 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1880 = _1878 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    int _1882 = _1876;
    if (!_1774)
    {
        _1882 = 1;
    }
    int _1884 = _1882;
    float _1886 = trunc(_1848);
    float _1888 = precise::max(_1886, 0.0);
    uint _1890 = uint(_1888);
    bool _1892 = _1834 > 0.0;
    float _1894 = fma(_1880, _1806, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _1896 = _1834 >= 0.0;
    bool _1898 = isnan(_1834);
    bool _1900 = _1896 || _1898;
    bool _1902 = isnan(0.0);
    bool _1904 = _1900 || _1902;
    float _1906 = _603 + _601;
    bool _1908 = !_1858;
    int _1910 = _1908 ? 0 : (-1);
    bool _1912 = uint(_1866) >= uint(_1506);
    float _1914 = _1906 + (-1.0);
    int _1916 = ~_1554;
    int _1918 = _1916 + 1;
    float _1920 = _601 * 2.0;
    bool _1922 = !_1912;
    int _1924 = _1922 ? 0 : (-1);
    bool _1926 = _599 > 0.5;
    float _1928 = fma(_1914, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1930 = int(_1730) + int(_1856);
    float _1932 = -_207;
    int _1934 = _1926 ? as_type<int>(_1932) : as_type<int>(_207);
    bool _1936 = _601 > 0.5;
    int _1938 = _1918 * _1930;
    int _1940 = _1938 + _1656;
    int _1942 = int(_1786) + int(_1890);
    float _1944 = fma(_1862, _1788, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1946 = !_1440;
    float _1948 = _1946 ? _207 : as_type<float>(_1934);
    float _1950 = floor(_1920);
    bool _1952 = _1884 != 1;
    float _1954 = -_211;
    int _1956 = _1936 ? as_type<int>(_1954) : as_type<int>(_211);
    bool _1958 = uint(_1940) >= uint(_1554);
    int _1960 = _1822 * _1942;
    int _1962 = _1960 + _1724;
    int _1964 = ~_1836;
    int _1966 = _1964 + _1910;
    int _1968 = _1966 + 1;
    float _1970 = _603 * 2.0;
    bool _1972 = !_1450;
    float _1974 = _1972 ? _211 : as_type<float>(_1956);
    bool _1976 = _603 > 0.5;
    int _1978 = _1424 * _1968;
    int _1980 = _1978 + _1574;
    bool _1982 = !_1958;
    int _1984 = _1982 ? 0 : (-1);
    bool _1986 = uint(_1962) >= uint(_1658);
    float _1988 = -_207;
    int _1990 = _1976 ? as_type<int>(_1988) : as_type<int>(_207);
    float _1992 = floor(_1970);
    bool _1994 = _1424 == 0;
    bool _1996 = !_1454;
    float _1998 = _1996 ? _207 : as_type<float>(_1990);
    bool _2000 = !_1986;
    int _2002 = _2000 ? 0 : (-1);
    bool _2004 = !_1994;
    int _2006 = _2004 ? _1980 : (-1);
    int _2008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2010 = _2008 != 0;
    int _2012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2014 = _2012 != 0;
    int _2016 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2018 = _2016 != 0;
    int _2020 = _1904 ? 0 : 1;
    float _2022 = as_type<float>(_1980);
    if (!_1952)
    {
        _2022 = _601;
    }
    float _2024 = _2022;
    int _2026 = ~_2020;
    int _2028 = _2026 + 1;
    int _2030 = _2028 + 1;
    int _2032 = _2030;
    float _2034 = _2024;
    if (!_1892)
    {
        int _2036 = ~_2020;
        int _2038 = _2036 + 1;
        _2032 = _2038;
    }
    int _2040 = _2032;
    if (!_1952)
    {
        _1870 = _601;
    }
    float _2042 = _1870;
    float _2044 = _2042;
    if (!_1952)
    {
        _1872 = _603;
    }
    float _2046 = _1872;
    float _2048 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1748);
    float _2050 = _2046;
    if (!_1952)
    {
        _1874 = _603;
    }
    float _2052 = _1874;
    float _2054 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1770);
    float _2056 = _2052;
    if (_1952)
    {
        _2034 = _599;
    }
    float _2058 = _2034;
    float _2060 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _2062 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _2060;
    if (_1952)
    {
        _2044 = _599;
    }
    float _2064 = _2044;
    if (_1952)
    {
        _2050 = _601;
    }
    float _2066 = _2050;
    float _2068 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1952)
    {
        _2056 = _601;
    }
    float _2070 = _2056;
    bool _2072 = _1950 > 0.0;
    bool _2074 = _1950 >= 0.0;
    bool _2076 = isnan(_1950);
    bool _2078 = _2074 || _2076;
    bool _2080 = isnan(0.0);
    bool _2082 = _2078 || _2080;
    bool _2084 = _1992 > 0.0;
    bool _2086 = !_2014;
    int _2088 = _2086 ? 0 : 1;
    bool _2090 = _1992 >= 0.0;
    bool _2092 = isnan(_1992);
    bool _2094 = _2090 || _2092;
    bool _2096 = isnan(0.0);
    bool _2098 = _2094 || _2096;
    float _2100 = fma(_2062, _1788, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _2102 = fma(_1842, _1788, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _2104 = _531 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _2106 = isnan(_531);
    bool _2108 = _2104 || _2106;
    bool _2110 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _2112 = _2108 || _2110;
    float _2114 = float(_2112);
    bool _2116 = _531 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _2118 = isnan(_531);
    bool _2120 = _2116 || _2118;
    bool _2122 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _2124 = _2120 || _2122;
    float _2126 = float(_2124);
    bool _2128 = _531 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _2130 = isnan(_531);
    bool _2132 = _2128 || _2130;
    bool _2134 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _2136 = _2132 || _2134;
    float _2138 = float(_2136);
    float _2140 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _2142 = _2140 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    int _2144 = _2098 ? 0 : 1;
    float _2146 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _2148 = _2146 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _2150 = -_2114;
    float _2152 = _2150 + 1.0;
    float _2154 = fma(_2142, _1806, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _2156 = _1756 + _1294;
    int _2158 = ~_2144;
    int _2160 = _2158 + 1;
    int _2162 = _2160 + 1;
    float _2164 = _2138 * _2152;
    int _2166 = _2162;
    if (!_2084)
    {
        int _2168 = ~_2144;
        int _2170 = _2168 + 1;
        _2166 = _2170;
    }
    int _2172 = _2166;
    float _2174 = -_2138;
    float _2176 = _2174 + 1.0;
    bool _2178 = _1424 == 0;
    float _2180 = fma(_2148, _1806, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    int _2182 = _1574 ^ _1424;
    float _2184 = _2126 * _2176;
    float _2186 = -_2126;
    float _2188 = _2186 + 1.0;
    uint _2190 = uint(int(uint(_2182) >> uint(31)));
    float _2192 = _2100 * _2184;
    int _2194 = ~_1924;
    int _2196 = _1850 + _2194;
    int _2198 = _2196 + 1;
    float _2200 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2202 = ~int(_2190);
    int _2204 = _2202 + 1;
    float _2206 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2208 = _2102 * _2184;
    float _2210 = _1944 * _2184;
    int _2212 = ~_1930;
    int _2214 = _2212 + _1984;
    int _2216 = _2214 + 1;
    float _2218 = fma(_2188, (*spvDescriptorSet0.vp_c9)._m0[107].x, _2192);
    int _2220 = _2198 ^ _2204;
    float _2222 = fma(_2188, (*spvDescriptorSet0.vp_c9)._m0[107].y, _2208);
    float _2224 = fma(_2188, (*spvDescriptorSet0.vp_c9)._m0[107].z, _2210);
    float _2226 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2228 = ~_2204;
    int _2230 = _2228 + _2220;
    int _2232 = _2230 + 1;
    int _2234 = _1554 * _2216;
    int _2236 = _2234 + _1656;
    float _2238 = fma(_2154, _2164, _2218);
    bool _2240 = _1554 == 0;
    float _2242 = -_2226;
    float _2244 = fma(_2068, 2.0, _2242);
    bool _2246 = !_2178;
    int _2248 = _2246 ? _2232 : (-1);
    float _2250 = fma(_2114, (*spvDescriptorSet0.vp_c9)._m0[109].x, _2238);
    bool _2252 = _1554 == 0;
    float _2254 = fma(_2180, _2164, _2222);
    bool _2256 = !_2240;
    int _2258 = _2256 ? _2236 : (-1);
    float _2260 = fma(_1894, _2164, _2224);
    int _2262 = _1656 ^ _1554;
    float _2264 = fma(_2114, (*spvDescriptorSet0.vp_c9)._m0[109].y, _2254);
    int _2266 = abs(_2088);
    float _2268 = fma(_2114, (*spvDescriptorSet0.vp_c9)._m0[109].z, _2260);
    int _2270 = ~_2002;
    int _2272 = _1942 + _2270;
    int _2274 = _2272 + 1;
    float _2276 = _2206 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2278 = float(_2040);
    float _2280 = _2066 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2282 = fma(_2070, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2200);
    uint _2284 = uint(int(uint(_2262) >> uint(31)));
    float _2286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2288 = float(_2266);
    float _2290 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2292 = ~int(_2284);
    int _2294 = _2292 + 1;
    float _2296 = -_137;
    float _2298 = fma(_2296, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1720);
    float _2300 = float(_2006);
    float _2302 = _2288 * _2278;
    float _2304 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2306 = _1688 + _2304;
    float _2308 = fma(_2280, -2.0, _2290);
    int _2310 = _2274 ^ _2294;
    float _2312 = fma(_2276, _2300, _2298);
    float _2314 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2316 = _2156 + _2314;
    float _2318 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2320 = ~_2294;
    int _2322 = _2320 + _2310;
    int _2324 = _2322 + 1;
    float _2326 = _2264 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2328 = _1948 + 0.5;
    float _2330 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2318);
    float _2332 = _2250 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2334 = _2268 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2338 = _2326 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2340 = _2332 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2342 = _2334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2344 = fma(_2276, _2328, _2312);
    float _2346 = _2286 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.m_64.x = _2340;
    out.m_64.y = _2338;
    out.m_64.z = _2342;
    float _2348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2350 = float(_2248);
    float _2352 = -_137;
    float _2354 = fma(_2352, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2244);
    float _2356 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2358 = float(_2258);
    float _2360 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2362 = _1776 + _2360;
    bool _2364 = !_2252;
    int _2366 = _2364 ? _2324 : (-1);
    float _2368 = fma(_2064, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2356);
    float _2370 = _2336 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2372 = -_1780;
    float _2374 = fma(_2346, _2350, _2372);
    float _2376 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2378 = _1974 + (-0.5);
    float _2380 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2368);
    float _2382 = fma(_2370, _2358, _2354);
    float _2384 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2376);
    float _2386 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2388 = log2(_2386);
    float _2390 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2392 = -_2346;
    float _2394 = fma(_2392, _2378, _2374);
    float _2396 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2384);
    float _2398 = -_2380;
    float _2400 = _2398 + 1.0;
    float _2402 = float(_2366);
    float _2404 = _2348 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2406 = -_2396;
    float _2408 = _2406 + 1.0;
    bool _2410 = !_1446;
    float _2412 = _2410 ? _211 : as_type<float>(_1818);
    float _2414 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2308);
    float _2416 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2390);
    float _2418 = -_2408;
    float _2420 = fma(_1948, _2418, _2344);
    float _2422 = _2306 * _2306;
    float _2424 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2330);
    float _2426 = _1998 + 0.5;
    float _2428 = -_2414;
    float _2430 = fma(_2404, _2402, _2428);
    float _2432 = fma(_2316, _2316, _2422);
    float _2434 = _2412 + (-0.5);
    float _2436 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2416);
    float _2438 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2282);
    float _2440 = fma(_2362, _2362, _2432);
    bool _2442 = _2424 >= 0.0;
    float _2444 = fma(_2370, _2426, _2382);
    float _2446 = -_2404;
    float _2448 = fma(_2446, _2434, _2430);
    float _2450 = -_2436;
    float _2452 = _2450 + 1.0;
    float _2454 = -_2438;
    float _2456 = _2454 + 1.0;
    bool _2458 = !_2010;
    int _2460 = _2458 ? 0 : 1;
    float _2462 = _2388 * _137;
    float _2464 = -_2400;
    float _2466 = fma(_1998, _2464, _2444);
    float _2468 = fma(_2412, _2456, _2448);
    float _2470 = fma(_1974, _2452, _2394);
    float _2472 = rsqrt(_2440);
    int _2474 = abs(_2460);
    float _2476 = in.m_66.x;
    float _2478 = in.m_66.y;
    float _2480 = in.m_66.z;
    float _2482 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2484 = 1.0 + _2482;
    float _2486 = _2434;
    if (_2442)
    {
        _2486 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2488 = _2486;
    out.m_68.x = _2420;
    out.m_68.y = _2470;
    out.m_68.z = _2466;
    out.m_68.w = _2468;
    float _2490 = exp2(_2462);
    bool _2492 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2494 = isnan(0.0);
    bool _2496 = _2492 || _2494;
    bool _2498 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2500 = _2496 || _2498;
    int _2502 = as_type<int>(_2488);
    if (_2442)
    {
        float _2504 = _2488 * 5.0;
        _2502 = as_type<int>(_2504);
    }
    int _2506 = _2502;
    if (_2442)
    {
        out.m_47.x = 0.0;
    }
    bool _2508 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2510 = isnan(1.0);
    bool _2512 = _2508 || _2510;
    bool _2514 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2516 = _2512 || _2514;
    bool _2518 = !_2018;
    int _2520 = _2518 ? 0 : 1;
    if (_2442)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7409 = as_type<float>(_2506);
        out.gl_Position.z = _7409;
    }
    float _2522 = 1.0 / _2484;
    float _2524 = _2306 * _2472;
    float _2526 = _2316 * _2472;
    float _2528 = -_2490;
    float _2530 = _2528 + 1.0;
    float _2532 = float(_2474);
    float _2534 = float(_2172);
    if (_2442)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2536 = -_2524;
    float _2538 = fma(_2536, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1688);
    float _2540 = _2532 * _2534;
    float _2542 = _2362 * _2472;
    float _2544 = -_2526;
    float _2546 = fma(_2544, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2156);
    float _2548 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2550 = _2538 + _2548;
    float _2552 = _2500 ? _2530 : 0.0;
    float _2554 = _2540 * (-2.0);
    float _2556 = -_2542;
    float _2558 = fma(_2556, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1776);
    float _2560 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2562 = _2546 + _2560;
    float _2564 = _2550 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (_2516)
    {
        float _2566 = _2552 * _2522;
        _139 = _2566;
    }
    float _2568 = _139;
    float _2570 = _599 + (-0.5);
    float _2572 = fma(_2554, _2476, _2476);
    float _2574 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2576 = _2558 + _2574;
    float _2578 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2564);
    float _2580 = fma(_1814, _2554, _1814);
    float _2582 = fma(_2570, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2572);
    float _2584 = _2302 * (-2.0);
    float _2586 = fma(_2576, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2578);
    int _2588 = _2082 ? 0 : 1;
    float _2590 = fma(_2580, _2568, _2582);
    float _2592 = _601 + (-0.5);
    float _2594 = fma(_2584, _2478, _2478);
    bool _2596 = _2586 >= 0.0;
    float _2598 = rsqrt(_2048);
    int _2600 = abs(_2520);
    float _2602 = fma(_2592, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2594);
    int _2604 = ~_2588;
    int _2606 = _2604 + 1;
    int _2608 = _2606 + 1;
    float _2610 = fma(_1928, _2584, _1928);
    int _2612 = _2608;
    float _2614 = _2594;
    float _2616 = _2576;
    if (!_2072)
    {
        int _2618 = ~_2588;
        int _2620 = _2618 + 1;
        _2612 = _2620;
    }
    int _2622 = _2612;
    float _2624 = rsqrt(_2054);
    float _2626 = float(_2622);
    float _2628 = _2590 * 0.15915493667125701904296875;
    float _2630 = float(_2600);
    if (_2596)
    {
        _2614 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2632 = _2614;
    int _2634 = as_type<int>(_2632);
    if (_2596)
    {
        out.m_47.x = 0.0;
    }
    float _2636 = fma(_2610, _2568, _2602);
    float _2638 = _2630 * _2626;
    float _2640 = _2628 * 6.283185482025146484375;
    float _2642 = sin(_2640);
    if (_2596)
    {
        float _2644 = _2632 * 5.0;
        _2634 = as_type<int>(_2644);
    }
    int _2646 = _2634;
    if (_2596)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7614 = as_type<float>(_2646);
        out.gl_Position.z = _7614;
    }
    float _2648 = _2628 * 6.283185482025146484375;
    float _2650 = cos(_2648);
    if (_2596)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2652 = -_1688;
    float _2654 = _2652 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2656 = _603 + _599;
    float _2658 = -_2156;
    float _2660 = _2658 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2662 = _2636 * 0.15915493667125701904296875;
    float _2664 = _2654 * _2654;
    float _2666 = _2656 + (-1.0);
    float _2668 = -_1776;
    float _2670 = _2668 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2672 = _2638 * (-2.0);
    float _2674 = fma(_2660, _2660, _2664);
    float _2676 = fma(_2666, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2678 = _603 + (-0.5);
    float _2680 = fma(_2672, _2480, _2480);
    float _2682 = fma(_2670, _2670, _2674);
    float _2684 = -_2524;
    float _2686 = fma(_2684, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2306);
    float _2688 = fma(_2676, _2672, _2676);
    float _2690 = fma(_2678, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2680);
    float _2692 = -_2526;
    float _2694 = fma(_2692, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2316);
    float _2696 = _2686 * _2686;
    float _2698 = rsqrt(_2682);
    float _2700 = fma(_2688, _2568, _2690);
    float _2702 = -_2542;
    float _2704 = fma(_2702, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2362);
    float _2706 = fma(_2694, _2694, _2696);
    float _2708 = _207 * _2598;
    float _2710 = _2700 * 0.15915493667125701904296875;
    float _2712 = _499 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2714 = fma(_2704, _2704, _2706);
    float _2716 = _2662 * 6.283185482025146484375;
    float _2718 = sin(_2716);
    bool _2720 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2722 = isnan(0.5);
    bool _2724 = _2720 || _2722;
    bool _2726 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2728 = _2724 || _2726;
    float _2730 = _2660 * _2698;
    float _2732 = _2670 * _2698;
    float _2734 = _2654 * _2698;
    float _2736 = _2662 * 6.283185482025146484375;
    float _2738 = cos(_2736);
    float _2740 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2742 = _2730 * _2740;
    float _2744 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2746 = _2732 * _2744;
    float _2748 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2750 = _2734 * _2748;
    float _2752 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2754 = -_2742;
    float _2756 = fma(_2732, _2752, _2754);
    float _2758 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2760 = -_2746;
    float _2762 = fma(_2734, _2758, _2760);
    float _2764 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2766 = -_2750;
    float _2768 = fma(_2730, _2764, _2766);
    float _2770 = sqrt(_2714);
    float _2772 = _2756 * _2756;
    float _2774 = _2642 * _2718;
    float _2776 = fma(_2762, _2762, _2772);
    float _2778 = _211 * _2624;
    float _2780 = _2710 * 6.283185482025146484375;
    float _2782 = sin(_2780);
    float _2784 = fma(_2768, _2768, _2776);
    float _2786 = _2650 * _2738;
    float _2788 = _2710 * 6.283185482025146484375;
    float _2790 = cos(_2788);
    float _2792 = _2472 * _2770;
    float _2794 = _497 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2796 = _2642 * _2738;
    float _2798 = rsqrt(_2784);
    float _2800 = fma(_2782, _2786, _2774);
    float _2802 = fma(_2782, _2774, _2786);
    float _2804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2778);
    float _2806 = _2792 * _2712;
    float _2808 = _2650 * _2718;
    float _2810 = _2650 * _2790;
    float _2812 = _2738 * _2790;
    float _2814 = _2642 * _2790;
    float _2816 = _2718 * _2790;
    float _2818 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2708);
    float _2820 = _2792 * _2794;
    float _2822 = _2804 * _2806;
    float _2824 = -_2808;
    float _2826 = fma(_2782, _2796, _2824);
    float _2828 = _2762 * _2798;
    float _2830 = _2818 * _2820;
    float _2832 = _2810 * _2822;
    float _2834 = -_2796;
    float _2836 = fma(_2782, _2808, _2834);
    float _2838 = -_2822;
    float _2840 = _2782 * _2838;
    float _2842 = _2756 * _2798;
    float _2844 = _2792 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2846 = _2844 * 0.5;
    float _2848 = fma(_2800, _2830, _2832);
    float _2850 = _2734 * _2828;
    float _2852 = _2814 * _2822;
    float _2854 = fma(_2812, _2830, _2840);
    float _2856 = _2768 * _2798;
    float _2858 = fma(_2836, _2846, _2848);
    float _2860 = _2732 * _2842;
    float _2862 = -_2850;
    float _2864 = fma(_2730, _2842, _2862);
    float _2866 = fma(_2826, _2830, _2852);
    float _2868 = fma(_2816, _2846, _2854);
    float _2870 = -_2860;
    float _2872 = fma(_2734, _2856, _2870);
    float _2874 = _2864 * _2858;
    float _2876 = fma(_2802, _2846, _2866);
    float _2878 = _2730 * _2856;
    float _2880 = _2872 * _2858;
    float _2882 = fma(_2856, _2868, _2874);
    float _2884 = -_2878;
    float _2886 = fma(_2732, _2828, _2884);
    float _2888 = fma(_2828, _2868, _2880);
    float _2890 = fma(_2732, _2876, _2882);
    float _2892 = _2886 * _2858;
    float _2894 = fma(_2730, _2876, _2888);
    float _2896 = _1776 + _2890;
    float _2898 = _2156 + _2894;
    float _2900 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2902 = _2896 + _2900;
    float _2904 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2906 = _2898 + _2904;
    float _2908 = _2902 * _2902;
    float _2910 = fma(_2906, _2906, _2908);
    float _2912 = fma(_2842, _2868, _2892);
    float _2914 = sqrt(_2910);
    float _2916 = fma(_2734, _2876, _2912);
    float _2918 = _1688 + _2916;
    bool _2920 = _2914 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2922 = _2892;
    float _2924 = _2912;
    float _2926 = _2876;
    if (!_2920)
    {
        _2922 = _2898;
    }
    float _2928 = _2922;
    float _2930 = _2928;
    if (!_2920)
    {
        _2924 = _2896;
    }
    float _2932 = _2924;
    float _2934 = _2932;
    if (!_2920)
    {
        _2926 = _2918;
    }
    float _2936 = _2926;
    bool _2938 = !_2920;
    float _2940 = _2936;
    if (!_2938)
    {
        float _2942 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2944 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2946 = _2914 + _2944;
        float _2948 = rsqrt(_2910);
        float _2950 = _2946 * _2942;
        float _2952 = _2918 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2954 = _2950 * 0.15915493667125701904296875;
        float _2956 = _2954 * 6.283185482025146484375;
        float _2958 = cos(_2956);
        float _2960 = _2954 * 6.283185482025146484375;
        float _2962 = sin(_2960);
        float _2964 = _2958 + (-1.0);
        float _2966 = _2964 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2968 = fma(_2962, _2952, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2970 = fma(_2918, _2958, _2966);
        float _2972 = _2948 * _2968;
        float _2974 = fma(_2906, _2972, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2976 = fma(_2902, _2972, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2930 = _2974;
        _2940 = _2970;
        _2934 = _2976;
    }
    float _2978 = _2930;
    float _2980 = _2940;
    float _2982 = _2934;
    float _2984 = -_2526;
    float _2986 = fma(_2984, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2978);
    float _2988 = -_2524;
    float _2990 = fma(_2988, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2980);
    float _2992 = -_2542;
    float _2994 = fma(_2992, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2982);
    float _2996 = _2990;
    float _2998 = _2986;
    float _3000 = _2994;
    if (!_2728)
    {
        float _3002 = _2550 * _2550;
        float _3004 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3006 = -_1776;
        float _3008 = _3006 + _2982;
        float _3010 = fma(_2562, _2562, _3002);
        float _3012 = fma(_2576, _2576, _3010);
        float _3014 = 1.0 / _2792;
        float _3016 = sqrt(_3012);
        float _3018 = precise::min(_3016, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3020 = _3018 * _3004;
        float _3022 = -_2156;
        float _3024 = _3022 + _2978;
        float _3026 = _3020 * _3014;
        float _3028 = -_1688;
        float _3030 = _3028 + _2980;
        float _3032 = fma(_3024, _3026, _2546);
        float _3034 = fma(_3030, _3026, _2538);
        float _3036 = fma(_3008, _3026, _2558);
        _2996 = _3034;
        _2998 = _3032;
        _3000 = _3036;
    }
    float _3038 = _2996;
    float _3040 = _2998;
    float _3042 = _3000;
    float _3044 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3046 = _3038 + _3044;
    float _3048 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3050 = _3040 + _3048;
    float _3052 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3054 = _3042 + _3052;
    float _3056 = _3046 * _3046;
    float _3058 = fma(_3050, _3050, _3056);
    float _3060 = fma(_3054, _3054, _3058);
    float _3062 = rsqrt(_3060);
    float _3064 = sqrt(_3060);
    float _3066 = _3062 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3068 = _3050 * _3066;
    float _3070 = _3054 * _3066;
    float _3072 = _3068 * _3068;
    float _3074 = _3070 * _3070;
    float _3076 = _3072 + _3074;
    float _3078 = sqrt(_3076);
    bool _3080 = _3078 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3082 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3084 = _3078 + _3082;
    float _3086 = _3054;
    float _3088 = _3076;
    float _3090 = _3084;
    float _3092 = _3066;
    if (_3080)
    {
        float _3094 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3086 = _3094;
    }
    float _3096 = _3086;
    if (_3080)
    {
        float _3098 = rsqrt(_3076);
        _3088 = _3098;
    }
    float _3100 = _3088;
    if (_3080)
    {
        float _3102 = _3084 * _3096;
        _3090 = _3102;
    }
    float _3104 = _3090;
    if (_3080)
    {
        float _3106 = _3104 * 0.15915493667125701904296875;
        _2616 = _3106;
    }
    float _3108 = _2616;
    float _3110 = _3056;
    float _3112 = _3108;
    if (_3080)
    {
        float _3114 = _3108 * 6.283185482025146484375;
        float _3116 = sin(_3114);
        _3110 = _3116;
    }
    float _3118 = _3110;
    float _3120 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3122 = precise::max(0.0, _3120);
    float _3124 = _3062;
    float _3126 = _3122;
    float _3128 = _3120;
    if (_3080)
    {
        float _3130 = _3108 * 6.283185482025146484375;
        float _3132 = cos(_3130);
        _3124 = _3132;
    }
    float _3134 = _3124;
    float _3136 = -_3066;
    float _3138 = -_3122;
    float _3140 = fma(_3046, _3136, _3138);
    float _3142 = _3140;
    if (!_3080)
    {
        _3126 = _3068;
    }
    float _3144 = _3126;
    float _3146 = _3144;
    if (_3080)
    {
        float _3148 = _3140 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3128 = _3148;
    }
    float _3150 = _3128;
    float _3152 = _3118;
    float _3154 = _3150;
    if (_3080)
    {
        float _3156 = fma(_3118, _3150, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3152 = _3156;
    }
    float _3158 = _3152;
    float _3160 = _3158;
    float _3162 = _3134;
    if (_3080)
    {
        float _3164 = _3134 + (-1.0);
        _3154 = _3164;
    }
    float _3166 = _3154;
    float _3168 = _3166;
    if (_3080)
    {
        float _3170 = _3100 * _3158;
        _3092 = _3170;
    }
    float _3172 = _3092;
    if (!_3080)
    {
        _3160 = _3072;
    }
    float _3174 = _3160;
    float _3176 = _3038 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3178 = _3174;
    if (_3080)
    {
        float _3180 = _3166 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3112 = _3180;
    }
    float _3182 = _3112;
    if (_3080)
    {
        float _3184 = _3068 * _3172;
        _3146 = _3184;
    }
    float _3186 = _3146;
    if (!_3080)
    {
        _3168 = _3070;
    }
    float _3188 = _3168;
    float _3190 = _3188;
    if (_3080)
    {
        float _3192 = _3070 * _3172;
        _3190 = _3192;
    }
    float _3194 = _3190;
    if (_3080)
    {
        float _3196 = fma(_3140, _3134, _3182);
        _3142 = _3196;
    }
    float _3198 = _3142;
    if (_3080)
    {
        float _3200 = _3186 * _3186;
        _3178 = _3200;
    }
    float _3202 = _3178;
    if (!_3080)
    {
        _3162 = _3074;
    }
    float _3204 = _3162;
    float _3206 = _3204;
    if (_3080)
    {
        float _3208 = _3194 * _3194;
        _3206 = _3208;
    }
    float _3210 = _3206;
    float _3212 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3176);
    float _3214 = fma(_3198, _3198, _3202);
    float _3216 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3218 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3212);
    float _3220 = _3214 + _3210;
    float _3222 = _3038 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3224 = _3038 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3226 = _3218 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3228 = rsqrt(_3220);
    float _3230 = _3038 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3232 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3222);
    float _3234 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3236 = fma(_3064, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3234);
    float _3238 = precise::clamp(_3236, 0.0, 1.0);
    float _3240 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3224);
    float _3242 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3230);
    float _3244 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3232);
    float _3246 = -_3238;
    float _3248 = _3246 + 1.0;
    float _3250 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3240);
    float _3252 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3242);
    float _3254 = _3244 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3256 = abs(_3248);
    float _3258 = log2(_3256);
    float _3260 = _3250 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3262 = _3252 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3264 = _3254 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3266 = _3226 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3268 = _3228 * _3186;
    float _3270 = _3228 * _3198;
    float _3272 = fma(_3260, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3264);
    float _3274 = _3228 * _3194;
    float _3276 = _3268 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3278 = -_3266;
    float _3280 = fma(_3278, _3216, 1.0);
    float _3282 = fma(_3226, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3272);
    float _3284 = _3254 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3286 = -_3276;
    float _3288 = fma(_3270, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3286);
    float _3290 = log2(_3280);
    float _3292 = fma(_3262, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3282);
    float _3294 = _3258 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3296 = -_3274;
    float _3298 = fma(_3296, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3288);
    float _3300 = _3254 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3302 = fma(_3260, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3284);
    float _3304 = fma(_3298, -0.5, 0.5);
    float _3306 = 1.0 / _3292;
    float _3308 = fma(_3260, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3300);
    float _3310 = fma(_3298, 0.5, 0.5);
    float _3312 = fma(_3226, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3302);
    float _3314 = _3270 + 1.0;
    float _3316 = fma(_3226, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3308);
    float _3318 = fma(_3310, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3320 = fma(_3262, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3312);
    float _3322 = sqrt(_3304);
    float _3324 = fma(_3262, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3316);
    float _3326 = fma(_3310, _3318, -0.212114393711090087890625);
    float _3328 = _3290 * 0.693147182464599609375;
    float _3330 = fma(_3310, _3326, 1.570728778839111328125);
    float _3332 = _3328 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3334 = exp2(_3294);
    float _3336 = _3324 * _3306;
    float _3338 = fma(_3336, 0.5, 0.5);
    float _3340 = _3322 * 0.636619746685028076171875;
    float _3342 = _3320 * _3306;
    float _3344 = -_3330;
    float _3346 = fma(_3340, _3344, 1.0);
    float _3348 = fma(_3342, -0.5, 0.5);
    float _3350 = -_3270;
    float _3352 = fma(_3334, _3314, _3350);
    float3 _8745 = float3(_3338, _3348, _3332);
    float _3354 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8745, float3(0.0), isnan(_8745)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8745, float3(0.0), isnan(_8745)), level(0.0)).x;
    float _3356 = fma(_3352, 0.5, 0.5);
    float3 _8758 = float3(_3338, _3348, _3332);
    float4 _3359 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8758, float3(0.0), isnan(_8758)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8758, float3(0.0), isnan(_8758)), level(0.0)).xyzw;
    float _3361 = _3359.x;
    float _3363 = _3359.y;
    float _3365 = _3359.z;
    float _3367 = _3359.w;
    float2 _8775 = float2(_3346, _3356);
    float3 _3371 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8775, float2(0.0), isnan(_8775)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8775, float2(0.0), isnan(_8775)), level(0.0)).xyz;
    float _3373 = _3371.x;
    float _3375 = _3371.y;
    float _3377 = _3371.z;
    float _3379 = _3258 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3381 = _2800 * _2872;
    float _3383 = _2800 * _2886;
    float _3385 = _2800 * _2864;
    float _3387 = _2810 * _2872;
    float _3389 = _2810 * _2886;
    float _3391 = exp2(_3379);
    float _3393 = _2810 * _2864;
    float _3395 = _2778 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3397 = _2836 * _2872;
    float _3399 = _2836 * _2886;
    float _3401 = _2836 * _2864;
    float _3403 = fma(_3395, _3395, 1.0);
    float _3405 = fma(_2812, _2856, _3385);
    float _3407 = fma(_2812, _2842, _3383);
    float _3409 = -_2782;
    float _3411 = fma(_3409, _2828, _3387);
    float _3413 = -_2782;
    float _3415 = fma(_3413, _2842, _3389);
    float _3417 = -_2782;
    float _3419 = fma(_3417, _2856, _3393);
    float _3421 = rsqrt(_3403);
    float _3423 = fma(_2816, _2828, _3397);
    float _3425 = fma(_2812, _2828, _3381);
    float _3427 = fma(_2816, _2842, _3399);
    float _3429 = fma(_2814, _2730, _3411);
    float _3431 = fma(_2814, _2734, _3415);
    float _3433 = fma(_2814, _2732, _3419);
    float _3435 = fma(_2802, _2730, _3423);
    float _3437 = fma(_2826, _2730, _3425);
    float _3439 = fma(_2826, _2734, _3407);
    float _3441 = fma(_2826, _2732, _3405);
    float _3443 = _3254 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3445 = fma(_2816, _2856, _3401);
    float _3447 = fma(_2802, _2734, _3427);
    float _3449 = _2708 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3451 = _3395 * _3429;
    float _3453 = fma(_3260, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3443);
    float _3455 = -_3391;
    float _3457 = _3455 + 1.0;
    float _3459 = fma(_2802, _2732, _3445);
    float _3461 = fma(_3449, _3437, _3451);
    float _3463 = _3395 * _3421;
    float _3465 = _3395 * _3431;
    float _3467 = fma(_3226, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3453);
    float _3469 = _3457 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.x = _3437;
    out.m_70.y = _3439;
    out.m_70.z = _3441;
    float _3471 = fma(_3449, _3439, _3465);
    float _3473 = _3395 * _3433;
    float _3475 = fma(_3262, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3467);
    float _3477 = -_3435;
    float _3479 = _3463 * _3477;
    out.m_72.x = _3040;
    out.m_72.y = _3038;
    out.m_72.z = _3042;
    bool _3481 = _3064 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3483 = isnan(_3064);
    bool _3485 = _3481 || _3483;
    bool _3487 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3489 = _3485 || _3487;
    float _3491 = fma(_3421, _3429, _3479);
    float _3493 = -_3447;
    float _3495 = _3463 * _3493;
    float _3497 = fma(_3449, _3441, _3473);
    float _3499 = -_3459;
    float _3501 = _3463 * _3499;
    float _3503 = fma(_3421, _3431, _3495);
    float _3505 = _3475 + _3292;
    float _3507 = fma(_3421, _3433, _3501);
    float _3509 = _3447 + _3471;
    float _3511 = _3459 + _3497;
    float _3513 = _3505 * 0.5;
    float _3515 = _3435 + _3461;
    out.m_74.x = _3491;
    out.m_74.y = _3503;
    out.m_74.z = _3507;
    out.m_76.z = _3513;
    out.m_76.w = _3292;
    out.m_78.x = _3515;
    out.m_78.y = _3509;
    out.m_78.z = _3511;
    out.gl_Position.x = _3324;
    out.gl_Position.y = _3320;
    out.gl_Position.z = _3475;
    out.gl_Position.w = _3292;
    float _3517 = _3292;
    float _3519 = _3475;
    float _3521 = _3320;
    float _3523 = _3324;
    if (!_3489)
    {
        _3517 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3525 = _3517;
    float _3527 = _3525;
    float _3529 = _3525;
    if (!_3489)
    {
        _3519 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3531 = _3519;
    float _3533 = _3531;
    float _3535 = _3531;
    if (!_3489)
    {
        _3521 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3537 = _3521;
    float _3539 = _3537;
    float _3541 = _3537;
    if (!_3489)
    {
        _3523 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3543 = _3523;
    float _3545 = _3469 * _3354;
    float _3547 = -_3469;
    float _3549 = _3547 + 1.0;
    float _3551 = _3367 * _3545;
    float _3553 = _3367 * _3549;
    float _3555 = _3377 * _3545;
    float _3557 = fma(_3373, _3551, _3361);
    float _3559 = fma(_3375, _3551, _3363);
    float _3561 = _3361;
    float _3563 = _3545;
    float _3565 = _3543;
    float _3567 = _3543;
    if (!_3489)
    {
        _3561 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3569 = _3561;
    float _3571 = fma(_3367, _3555, _3365);
    float _3573 = _3569;
    float _3575 = _3569;
    if (!_3489)
    {
        _3563 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3577 = _3563;
    out.m_80.x = _3557;
    out.m_80.y = _3559;
    out.m_80.z = _3571;
    out.m_80.w = _3553;
    bool _3579 = !_3489;
    float _3581 = _3577;
    float _3583 = _3577;
    if (!_3579)
    {
        bool _3585 = _3064 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3587 = isnan(_3064);
        bool _3589 = _3585 || _3587;
        bool _3591 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3593 = _3589 || _3591;
        if (!_3593)
        {
            float _3595 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3597 = _3064 + _3595;
            float _3599 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3601 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3599;
            float _3603 = 1.0 / _3601;
            float _3605 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3607 = _3605 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3609 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3611 = _3609 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3613 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3615 = _3613 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3617 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3619 = _3617 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3621 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3623 = _3621 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3625 = _3597 * _3603;
            float _3627 = precise::clamp(_3625, 0.0, 1.0);
            float _3629 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3631 = _3629 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3633 = fma(_3627, _3607, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3635 = fma(_3627, _3631, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3637 = fma(_3627, _3611, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3639 = fma(_3627, _3615, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3641 = fma(_3627, _3619, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3643 = fma(_3627, _3623, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3529 = _3635;
            _3567 = _3641;
            _3575 = _3633;
            _3541 = _3639;
            _3535 = _3637;
            _3583 = _3643;
            _3645 = true;
        }
        else
        {
            bool _3647 = _3064 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3649 = isnan(_3064);
            bool _3651 = _3647 || _3649;
            bool _3653 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3655 = _3651 || _3653;
            if (!_3655)
            {
                _3573 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3657 = _3573;
            _3575 = _3657;
            if (!_3655)
            {
                _3527 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3659 = _3527;
            _3529 = _3659;
            if (!_3655)
            {
                _3533 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3661 = _3533;
            _3535 = _3661;
            if (!_3655)
            {
                _3539 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3663 = _3539;
            _3541 = _3663;
            if (!_3655)
            {
                _3565 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3665 = _3565;
            _3567 = _3665;
            if (!_3655)
            {
                _3581 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3667 = _3581;
            bool _3669 = !_3655;
            _3583 = _3667;
            if (!_3669)
            {
                bool _3671 = _3064 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3673 = isnan(_3064);
                bool _3675 = _3671 || _3673;
                bool _3677 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3679 = _3675 || _3677;
                if (!_3679)
                {
                    float _3681 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3683 = _3064 + _3681;
                    float _3685 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3687 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3685;
                    float _3689 = 1.0 / _3687;
                    float _3691 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3693 = _3691 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3695 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3697 = _3695 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3699 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3701 = _3699 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3703 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3705 = _3703 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3707 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3709 = _3707 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3711 = _3683 * _3689;
                    float _3713 = precise::clamp(_3711, 0.0, 1.0);
                    float _3715 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3717 = _3715 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3719 = fma(_3713, _3693, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3721 = fma(_3713, _3717, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3723 = fma(_3713, _3697, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3725 = fma(_3713, _3701, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3727 = fma(_3713, _3705, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3729 = fma(_3713, _3709, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3529 = _3721;
                    _3567 = _3727;
                    _3575 = _3719;
                    _3541 = _3725;
                    _3535 = _3723;
                    _3583 = _3729;
                    _3645 = true;
                }
                else
                {
                    _3529 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3567 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3575 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3541 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3535 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3583 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3645 = false;
    float _3731 = _3529;
    float _3733 = _3567;
    float _3735 = _3575;
    float _3737 = _3541;
    float _3739 = _3535;
    float _3741 = _3583;
    float _3743 = fma(_3509, -0.5, 0.5);
    float _3745 = precise::clamp(_3743, 0.0, 1.0);
    float _3747 = -_3731;
    float _3749 = _3747 + _3733;
    float _3751 = -_3735;
    float _3753 = _3751 + _3737;
    float _3755 = -_3739;
    float _3757 = _3755 + _3741;
    bool _3759 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3761 = fma(_3745, _3749, _3731);
    float _3763 = fma(_3745, _3753, _3735);
    float _3765 = fma(_3745, _3757, _3739);
    float _3767 = _3761 * 0.586610972881317138671875;
    out.m_82.x = 0.0;
    float _3769 = fma(_3763, 0.298911988735198974609375, _3767);
    float _3771 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3773 = fma(_3765, 0.114477999508380889892578125, _3769);
    out.m_47.x = _3771;
    float _3775 = -_3773;
    float _3777 = _3763 + _3775;
    float _3779 = -_3773;
    float _3781 = _3761 + _3779;
    float _3783 = -_3773;
    float _3785 = _3765 + _3783;
    float _3787 = fma(_3777, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3773);
    float _3789 = fma(_3781, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3773);
    float _3791 = fma(_3785, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3773);
    out.m_84.x = _3787;
    out.m_84.y = _3789;
    out.m_84.z = _3791;
    if (!_3759)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3793 = -_3038;
    float _3795 = _3793 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3797 = -_3040;
    float _3799 = _3797 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3801 = -_3042;
    float _3803 = _3801 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3805 = _3795 * _3795;
    float _3807 = fma(_3799, _3799, _3805);
    float _3809 = fma(_3803, _3803, _3807);
    float _3811 = sqrt(_3809);
    float _3813 = rsqrt(_3809);
    float _3815 = -_3811;
    float _3817 = _3815 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3819 = _3817 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3821 = precise::clamp(_3819, 0.0, 1.0);
    float _3823 = _3799 * _3813;
    float _3825 = _3795 * _3813;
    float _3827 = abs(_3821);
    float _3829 = log2(_3827);
    float _3831 = _3803 * _3813;
    float _3833 = _3823 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3835 = _3509 * _3825;
    float _3837 = -_3825;
    float _3839 = -_3833;
    float _3841 = fma(_3837, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3839);
    float _3843 = fma(_3515, _3823, _3835);
    float _3845 = -_3831;
    float _3847 = fma(_3845, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3841);
    float _3849 = fma(_3511, _3831, _3843);
    float _3851 = precise::clamp(_3849, 0.0, 1.0);
    float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3855 = _3847 + _3853;
    float _3857 = _3829 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3859 = _3855 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3861 = precise::clamp(_3859, 0.0, 1.0);
    float _3863 = exp2(_3857);
    float _3865 = _3863 * _3861;
    float _3867 = _3851 * _3865;
    float _3869 = _3867 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3871 = _3867 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3873 = _3867 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_82.x = _3869;
    out.m_82.y = _3871;
    out.m_82.z = _3873;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3645 = false;
    bool _523 = false;
    bool _319 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _3930 = as_type<float>(_119);
        out.gl_Position.z = _3930;
    }
    if (!_107)
    {
        return out;
    }
    float _123 = in.m_49.w;
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
        out.m_47.x = 0.0;
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
        float _4000 = as_type<float>(_157);
        out.gl_Position.z = _4000;
    }
    if (_149)
    {
        return out;
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = in.m_54.w;
    bool _163 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _165 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _167 = _163 || _165;
    bool _169 = isnan(1.0);
    bool _171 = _167 || _169;
    float _173 = in.m_49.x;
    float _175 = in.m_49.y;
    float _177 = in.m_49.z;
    float _179 = in.m_44.x;
    float _181 = in.m_44.y;
    float _183 = in.m_44.z;
    int _185 = as_type<int>(_159) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_159) & 2;
    bool _191 = _189 != 0;
    float _193 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _195 = 0.0;
    float _197 = _193;
    if (!_171)
    {
        float _199 = _193 * _193;
        float _201 = _199 * 0.5;
        _195 = _201;
    }
    float _203 = _195;
    bool _205 = !_187;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_191;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = _203;
    if (!_171)
    {
        float _215 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _215;
    }
    float _217 = _213;
    bool _219 = !_171;
    float _221 = _217;
    if (!_219)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = _193 * _225;
        float _235 = 1.0 / _229;
        float _237 = _231 * 0.693147182464599609375;
        float _239 = exp2(_233);
        float _241 = 1.0 / _237;
        float _243 = _239 + (-1.0);
        float _245 = -_243;
        float _247 = fma(_245, _241, _193);
        float _249 = _247 * _235;
        float _251 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _251;
    }
    float _253 = _221;
    bool _255 = !_171;
    if (!_255)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = 1.0 / _263;
        float _267 = _193 * _259;
        float _269 = exp2(_267);
        float _271 = -_269;
        float _273 = _271 + 1.0;
        float _275 = _273 * _265;
        _197 = _275;
    }
    float _277 = _197;
    bool _279 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _281 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _283 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _285 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _287 = fma(_277, _173, _281);
    float _289 = fma(_277, _175, _283);
    float _291 = fma(_277, _177, _285);
    float _293 = fma(_287, _161, _179);
    float _295 = fma(_289, _161, _181);
    float _297 = fma(_291, _161, _183);
    bool _299 = !_279;
    float _317;
    if (!_299)
    {
        float _301 = in.m_56.x;
        float _303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _305 = _301 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _309 = _307 * _303;
        float _311 = floor(_309);
        float _313 = -_311;
        float _315 = _309 + _313;
        _317 = _315;
        _319 = true;
    }
    else
    {
        float _321 = float(_103);
        float _323 = 1.0 / _321;
        float _325 = _137 * _323;
        _317 = _325;
    }
    _319 = false;
    float _327 = _317;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _331 = _327 + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = _327 + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _345;
    float _349 = in.m_54.x;
    float _351 = in.m_54.y;
    bool _353 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _355 = isnan(_327);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = 1.0 / _339;
    bool _367 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _369 = 1.0 / _343;
    float _371 = 1.0 / _347;
    float _373 = _331 * _365;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _377 = _327 + _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _379;
    float _383 = fma(_381, _373, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _385 = _377 * _369;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _387;
    bool _391 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _393 = isnan(_327);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = fma(_389, _373, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _405 = -_401;
    float _407 = _405 + 1.0;
    float _409 = _335 * _371;
    float _411 = -_363;
    float _413 = _411 + 1.0;
    bool _415 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _417 = isnan(_327);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = _401 * _413;
    bool _429 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _431 = isnan(_327);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = _425 * _407;
    float _443 = -_425;
    float _445 = _443 + 1.0;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _455 = _439 * _445;
    float _457 = fma(_449, _385, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _459 = fma(_453, _385, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _461 = -_439;
    float _463 = _461 + 1.0;
    float _465 = _383 * _455;
    float _467 = _403 * _455;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _473;
    float _477 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[143].x, _465);
    float _479 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[143].y, _467);
    float _481 = fma(_471, _409, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _483 = fma(_475, _409, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _485 = fma(_457, _441, _477);
    float _487 = fma(_459, _441, _479);
    float _489 = fma(_481, _427, _485);
    float _491 = fma(_483, _427, _487);
    float _493 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[146].x, _489);
    float _495 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[146].y, _491);
    float _497 = _493 * _349;
    float _499 = _495 * _351;
    bool _501 = !_367;
    float _503 = _409;
    float _521;
    if (!_501)
    {
        float _505 = in.m_56.x;
        float _507 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _509 = _505 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _511 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[11].x, _137);
        float _513 = _511 * _507;
        float _515 = floor(_513);
        float _517 = -_515;
        float _519 = _513 + _517;
        _521 = _519;
        _523 = true;
    }
    else
    {
        float _525 = float(_103);
        float _527 = 1.0 / _525;
        float _529 = _137 * _527;
        _521 = _529;
    }
    _523 = false;
    float _531 = _521;
    float _533 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _535 = int(_533);
    float _537 = float(_103);
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _541 = _539 != 0;
    float _543 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _545 = int(_543);
    float _547 = float(_535);
    float _549 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _551 = int(_549);
    if (_541)
    {
        float _553 = in.m_56.x;
        _503 = _553;
    }
    float _555 = _503;
    float _557 = _555;
    if (!_541)
    {
        float _559 = in.m_56.y;
        _557 = _559;
    }
    float _561 = _557;
    float _563 = float(_545);
    float _565 = 1.0 / _547;
    float _567 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _569 = int(_567);
    float _571 = float(uint(_551));
    float _573 = 1.0 / _563;
    float _575 = _565 * _137;
    float _577 = 1.0 / _571;
    float _579 = float(uint(_569));
    int _581 = ~_569;
    int _583 = _581 + 1;
    int _585 = ~_569;
    int _587 = _585 + 1;
    float _589 = trunc(_575);
    int _591 = int(_589);
    float _593 = _573 * _137;
    float _595 = 1.0 / _579;
    int _597 = as_type<int>(_577) + (-2);
    float _599 = in.m_56.x;
    float _601 = in.m_56.y;
    float _603 = in.m_56.z;
    float _605 = in.m_56.w;
    float _607 = trunc(_593);
    int _609 = int(_607);
    float _611 = float(uint(_591));
    float _613 = as_type<float>(_597) * _611;
    int _615 = as_type<int>(_595) + (-2);
    float _617 = trunc(_613);
    float _619 = precise::max(_617, 0.0);
    uint _622 = uint(_619);
    int _624 = ~_551;
    int _626 = _624 + 1;
    float _628 = float(uint(_609));
    float _630 = _613;
    float _632 = _628;
    if (_541)
    {
        _630 = 1.0;
    }
    float _634 = _630;
    float _636 = as_type<float>(_615) * _628;
    float _638 = _634;
    if (_541)
    {
        _632 = 1.0;
    }
    float _640 = _632;
    float _642 = _640;
    if (!_541)
    {
        _642 = 7.345489978790283203125;
    }
    float _644 = _642;
    float _646 = trunc(_636);
    float _648 = precise::max(_646, 0.0);
    uint _650 = uint(_648);
    int _652 = _626 * int(_622);
    int _654 = _652 + _591;
    if (!_541)
    {
        _638 = 1.2345600128173828125;
    }
    float _656 = _638;
    float _658 = _644 * _599;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _662 = _660 != 0;
    float _664 = float(uint(_654));
    float _666 = _561 * _656;
    float _668 = floor(_658);
    float _670 = as_type<float>(_597) * _664;
    int _672 = _583 * int(_650);
    int _674 = _672 + _609;
    float _676 = trunc(_670);
    float _678 = precise::max(_676, 0.0);
    uint _680 = uint(_678);
    float _682 = float(uint(_674));
    float _684 = -_668;
    float _686 = _658 + _684;
    float _688 = floor(_666);
    float _690 = as_type<float>(_615) * _682;
    int _692 = ~_551;
    int _694 = _692 + 1;
    float _696 = float(_569);
    float _698 = trunc(_690);
    float _700 = precise::max(_698, 0.0);
    uint _702 = uint(_700);
    int _704 = int(_622) + int(_680);
    float _706 = float(_551);
    float _708 = float(_609);
    int _710 = _694 * _704;
    int _712 = _710 + _591;
    float _714 = 1.0 / _537;
    float _716 = -_688;
    float _718 = _666 + _716;
    float _720 = _686 * _706;
    float _722 = float(_591);
    bool _724 = uint(_712) >= uint(_551);
    bool _726 = !_662;
    int _728 = _726 ? 0 : 1;
    float _730 = trunc(_720);
    int _732 = int(_730);
    int _734 = int(_650) + int(_702);
    int _736 = ~_569;
    int _738 = _736 + 1;
    bool _740 = _708 >= _696;
    bool _742 = isnan(_708);
    bool _744 = _740 || _742;
    bool _746 = isnan(_696);
    bool _748 = _744 || _746;
    float _750 = float(_748);
    float _752 = _714 * _137;
    bool _754 = _722 >= _706;
    bool _756 = isnan(_722);
    bool _758 = _754 || _756;
    bool _760 = isnan(_706);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = _718 * _696;
    int _768 = _738 * _734;
    int _770 = _768 + _609;
    float _772 = _706 * _752;
    float _774 = _696 * _752;
    int _776 = abs(_728);
    float _778 = trunc(_764);
    int _780 = int(_778);
    bool _782 = !_724;
    int _784 = _782 ? 0 : (-1);
    bool _786 = uint(_770) >= uint(_569);
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _790 = _788 != 0;
    int _792 = ~_704;
    int _794 = _792 + _784;
    int _796 = _794 + 1;
    float _798 = trunc(_750);
    int _800 = int(_798);
    int _802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _804 = _802 != 0;
    int _806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _808 = _806 != 0;
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _812 = _810 != 0;
    int _814 = _732 * _776;
    int _816 = _814 + _591;
    bool _818 = !_786;
    int _820 = _818 ? 0 : (-1);
    int _822 = _551 * _796;
    int _824 = _822 + _591;
    bool _826 = !_790;
    int _828 = _826 ? 0 : 1;
    bool _830 = !_808;
    int _832 = _830 ? 0 : 1;
    float _834 = trunc(_766);
    int _836 = int(_834);
    int _838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _840 = _838 != 0;
    int _842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _844 = _842 != 0;
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _848 = _846 != 0;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _852 = _850 != 0;
    bool _854 = _551 == 0;
    int _856 = ~_734;
    int _858 = _856 + _820;
    int _860 = _858 + 1;
    int _862 = ~_780;
    int _864 = _862 + 1;
    int _866 = _864 + 1;
    float _868 = trunc(_772);
    int _870 = int(_868);
    bool _872 = !_854;
    int _874 = _872 ? _824 : (-1);
    int _876 = _569 * _860;
    int _878 = _876 + _609;
    bool _880 = !_844;
    int _882 = _880 ? 0 : 1;
    bool _884 = _569 == 0;
    int _886 = _874 * _866;
    int _888 = abs(_828);
    int _890 = _551 + (-1);
    int _892 = ~_800;
    int _894 = _892 + 1;
    int _896 = _894 + 1;
    int _898 = _836 * _888;
    int _900 = _898 + _609;
    bool _902 = !_884;
    int _904 = _902 ? _878 : (-1);
    int _906 = _780 * _890;
    int _908 = _906 + _886;
    int _910 = abs(_832);
    int _912 = _569 + (-1);
    int _914 = _904 * _896;
    int _916 = abs(_882);
    int _918 = _908 * _910;
    bool _920 = !_804;
    int _922 = _920 ? 0 : 1;
    int _924 = _800 * _912;
    int _926 = _924 + _914;
    int _928 = abs(_922);
    float _930 = trunc(_774);
    int _932 = int(_930);
    int _934 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _936 = _934 != 0;
    int _938 = _926 * _916;
    bool _940 = !_812;
    int _942 = _940 ? 0 : 1;
    int _944 = _870 * _928;
    int _946 = _944 + _918;
    bool _948 = !_936;
    int _950 = _948 ? 0 : 1;
    int _952 = abs(_942);
    bool _954 = !_848;
    int _956 = _954 ? 0 : 1;
    int _958 = abs(_950);
    int _960 = _816 * _952;
    int _962 = _960 + _946;
    bool _964 = !_840;
    int _966 = _964 ? 0 : 1;
    int _968 = abs(_956);
    bool _970 = !_852;
    int _972 = _970 ? 0 : 1;
    int _974 = abs(_966);
    int _976 = _732 * _958;
    int _978 = _976 + _962;
    int _980 = abs(_972);
    int _982 = _932 * _974;
    int _984 = _982 + _938;
    float _986 = float(uint(_978));
    int _988 = ~_551;
    int _990 = _988 + 1;
    int _992 = _900 * _968;
    int _994 = _992 + _984;
    int _996 = ~_569;
    int _998 = _996 + 1;
    float _1000 = as_type<float>(_597) * _986;
    float _1002 = float(uint(_900));
    int _1004 = _836 * _980;
    int _1006 = _1004 + _994;
    float _1008 = float(uint(_816));
    float _1010 = trunc(_1000);
    float _1012 = precise::max(_1010, 0.0);
    uint _1014 = uint(_1012);
    float _1016 = float(uint(_1006));
    float _1018 = as_type<float>(_597) * _1008;
    float _1020 = as_type<float>(_615) * _1002;
    float _1022 = as_type<float>(_615) * _1016;
    float _1024 = trunc(_1018);
    float _1026 = precise::max(_1024, 0.0);
    uint _1028 = uint(_1026);
    float _1030 = trunc(_1022);
    float _1032 = precise::max(_1030, 0.0);
    uint _1034 = uint(_1032);
    int _1036 = _990 * int(_1014);
    int _1038 = _1036 + _978;
    float _1040 = float(uint(_1038));
    int _1042 = _990 * int(_1028);
    int _1044 = _1042 + _816;
    float _1046 = trunc(_1020);
    float _1048 = precise::max(_1046, 0.0);
    uint _1050 = uint(_1048);
    float _1052 = as_type<float>(_597) * _1040;
    float _1054 = float(uint(_1044));
    int _1056 = _998 * int(_1034);
    int _1058 = _1056 + _1006;
    float _1060 = as_type<float>(_597) * _1054;
    int _1062 = ~_551;
    int _1064 = _1062 + 1;
    float _1066 = float(uint(_1058));
    float _1068 = trunc(_1052);
    float _1070 = precise::max(_1068, 0.0);
    uint _1072 = uint(_1070);
    float _1074 = as_type<float>(_615) * _1066;
    float _1076 = trunc(_1060);
    float _1078 = precise::max(_1076, 0.0);
    uint _1080 = uint(_1078);
    int _1082 = ~_569;
    int _1084 = _1082 + 1;
    int _1086 = _1084 * int(_1050);
    int _1088 = _1086 + _900;
    float _1090 = trunc(_1074);
    float _1092 = precise::max(_1090, 0.0);
    uint _1094 = uint(_1092);
    int _1096 = int(_1014) + int(_1072);
    int _1098 = ~_569;
    int _1100 = _1098 + 1;
    int _1102 = ~_551;
    int _1104 = _1102 + 1;
    int _1106 = _1064 * _1096;
    int _1108 = _1106 + _978;
    int _1110 = int(_1028) + int(_1080);
    bool _1112 = uint(_1108) >= uint(_551);
    int _1114 = _1104 * _1110;
    int _1116 = _1114 + _816;
    bool _1118 = !_1112;
    int _1120 = _1118 ? 0 : (-1);
    int _1122 = int(_1034) + int(_1094);
    int _1124 = ~_1096;
    int _1126 = _1124 + _1120;
    int _1128 = _1126 + 1;
    float _1130 = float(uint(_1088));
    int _1132 = _1100 * _1122;
    int _1134 = _1132 + _1006;
    bool _1136 = uint(_1116) >= uint(_551);
    int _1138 = _551 * _1128;
    int _1140 = _1138 + _978;
    float _1142 = as_type<float>(_615) * _1130;
    bool _1144 = uint(_1134) >= uint(_569);
    bool _1146 = !_854;
    int _1148 = _1146 ? _1140 : (-1);
    float _1150 = trunc(_1142);
    float _1152 = precise::max(_1150, 0.0);
    uint _1154 = uint(_1152);
    bool _1156 = !_1144;
    int _1158 = _1156 ? 0 : (-1);
    int _1160 = _1148 & 3;
    bool _1162 = _1160 != 0;
    int _1164 = ~_1122;
    int _1166 = _1164 + _1158;
    int _1168 = _1166 + 1;
    bool _1170 = !_1136;
    int _1172 = _1170 ? 0 : (-1);
    bool _1174 = uint(_1160) >= 2u;
    int _1176 = _569 * _1168;
    int _1178 = _1176 + _1006;
    int _1180 = ~_1110;
    int _1182 = _1180 + _1172;
    int _1184 = _1182 + 1;
    int _1186 = _1174 ? 0 : 1;
    bool _1188 = _605 > 0.5;
    int _1190 = _551 * _1184;
    int _1192 = _1190 + _816;
    int _1194 = _1148 >> 31;
    int _1196 = _1148 & 3;
    bool _1198 = _1196 != 0;
    int _1200 = _1194 & 3;
    bool _1202 = !_884;
    int _1204 = _1202 ? _1178 : (-1);
    int _1206 = _1148 + _1200;
    int _1208 = _1198 ? 0 : 1;
    int _1210 = _1206 >> 2;
    bool _1212 = _1160 != 3;
    int _1214 = _1204 >> 31;
    int _1216 = _1210 << 4;
    int _1218 = _1216 + 368;
    bool _1220 = uint(_1160) > 1u;
    int _1222 = _1214 & 3;
    uint _1224 = uint(int(uint(_1218) >> uint(2)));
    uint _1226 = uint(int(uint(int(_1224)) >> uint(2)));
    int _1228 = int(_1224) & 3;
    float _1230 = (*spvDescriptorSet0.vp_c9)._m0[int(_1226)][_1228];
    int _1232 = int(_1224) + 1;
    uint _1234 = uint(int(uint(_1232) >> uint(2)));
    int _1236 = _1232 & 3;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[int(_1234)][_1236];
    int _1240 = ~_1186;
    int _1242 = _1240 + 1;
    int _1244 = _1242 + 1;
    int _1246 = _1204 + _1222;
    int _1248 = _1244;
    if (_1212)
    {
        int _1250 = ~_1186;
        int _1252 = _1250 + 1;
        _1248 = _1252;
    }
    int _1254 = _1248;
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1258 = _1256 != 0;
    int _1260 = _1218 + 8;
    uint _1262 = uint(int(uint(_1260) >> uint(2)));
    uint _1264 = uint(int(uint(int(_1262)) >> uint(2)));
    int _1266 = int(_1262) & 3;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[int(_1264)][_1266];
    int _1270 = int(_1262) + 1;
    uint _1272 = uint(int(uint(_1270) >> uint(2)));
    int _1274 = _1270 & 3;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[int(_1272)][_1274];
    int _1278 = _1246 >> 2;
    int _1280 = int(_1050) + int(_1154);
    int _1282 = ~_1208;
    int _1284 = _1282 + 1;
    int _1286 = _1284 + 1;
    float _1288 = in.m_58.x;
    float _1290 = in.m_58.y;
    float _1292 = in.m_58.z;
    float _1294 = in.m_58.w;
    bool _1296 = !_1258;
    int _1298 = _1296 ? 0 : 1;
    int _1300 = _587 * _1280;
    int _1302 = _1300 + _900;
    bool _1304 = !_854;
    int _1306 = _1304 ? _1192 : (-1);
    int _1308 = _1286;
    if (!_1220)
    {
        int _1310 = ~_1208;
        int _1312 = _1310 + 1;
        _1308 = _1312;
    }
    int _1314 = _1308;
    float _1316 = in.m_60.x;
    float _1318 = in.m_60.y;
    float _1320 = in.m_60.z;
    float _1322 = in.m_60.w;
    int _1324 = _1278 << 4;
    int _1326 = _1324 + 512;
    int _1328 = _1204 & 3;
    bool _1330 = _1328 != 0;
    int _1332 = _1204 & 3;
    bool _1334 = _1332 != 0;
    uint _1336 = uint(int(uint(_1326) >> uint(2)));
    uint _1338 = uint(int(uint(int(_1336)) >> uint(2)));
    int _1340 = int(_1336) & 3;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[int(_1338)][_1340];
    int _1344 = int(_1336) + 1;
    uint _1346 = uint(int(uint(_1344) >> uint(2)));
    int _1348 = _1344 & 3;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[int(_1346)][_1348];
    float _1352 = in.m_62.x;
    float _1354 = in.m_62.y;
    float _1356 = in.m_62.z;
    float _1358 = in.m_62.w;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1362 = _1360 != 0;
    bool _1364 = !_1162;
    int _1366 = _1364 ? 0 : 1;
    bool _1368 = uint(_1332) > 1u;
    bool _1370 = !_1362;
    int _1372 = _1370 ? 0 : 1;
    bool _1374 = _1332 != 3;
    int _1376 = _1330 ? 0 : 1;
    bool _1378 = uint(_1332) >= 2u;
    int _1380 = ~_1376;
    int _1382 = _1380 + 1;
    int _1384 = _1382 + 1;
    int _1386 = _1378 ? 0 : 1;
    bool _1388 = !_1334;
    int _1390 = _1388 ? 0 : 1;
    bool _1392 = uint(_1302) >= uint(_569);
    int _1394 = _1384;
    if (!_1368)
    {
        int _1396 = ~_1376;
        int _1398 = _1396 + 1;
        _1394 = _1398;
    }
    int _1400 = _1394;
    bool _1402 = _1160 != 3;
    bool _1404 = _1332 != 3;
    int _1406 = ~_1386;
    int _1408 = _1406 + 1;
    int _1410 = _1408 + 1;
    int _1412 = abs(_1314);
    int _1414 = _1410;
    if (_1374)
    {
        int _1416 = ~_1386;
        int _1418 = _1416 + 1;
        _1414 = _1418;
    }
    int _1420 = _1414;
    float _1422 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1424 = int(_1422);
    bool _1426 = !_1392;
    int _1428 = _1426 ? 0 : (-1);
    bool _1430 = !_1402;
    int _1432 = _1430 ? 0 : (-1);
    bool _1434 = !_1404;
    int _1436 = _1434 ? 0 : (-1);
    int _1438 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1440 = _1438 != 0;
    float _1442 = _295 * _1290;
    int _1444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1446 = _1444 != 0;
    int _1448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1450 = _1448 != 0;
    int _1452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1454 = _1452 != 0;
    int _1456 = _1326 + 8;
    uint _1458 = uint(int(uint(_1456) >> uint(2)));
    uint _1460 = uint(int(uint(int(_1458)) >> uint(2)));
    int _1462 = int(_1458) & 3;
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[int(_1460)][_1462];
    int _1466 = int(_1458) + 1;
    uint _1468 = uint(int(uint(_1466) >> uint(2)));
    int _1470 = _1466 & 3;
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[int(_1468)][_1470];
    float _1474 = _295 * _1354;
    int _1476 = abs(_1366);
    int _1478 = abs(_1400);
    float _1480 = _295 * _1318;
    int _1482 = ~_1412;
    int _1484 = _1482 + 1;
    int _1486 = _1484 + 1;
    float _1488 = fma(_293, _1288, _1442);
    int _1490 = abs(_1254);
    int _1492 = _1486 * as_type<int>(_1238);
    int _1494 = ~_1476;
    int _1496 = _1494 + 1;
    int _1498 = _1496 + 1;
    int _1500 = ~_1490;
    int _1502 = _1500 + 1;
    int _1504 = _1502 + 1;
    int _1506 = abs(_1424);
    int _1508 = _1498 * as_type<int>(_1230);
    int _1510 = _1508 + _1492;
    float _1512 = float(uint(_1424));
    int _1514 = _1504 * as_type<int>(_1268);
    int _1516 = _1514 + _1510;
    float _1518 = 1.0 / _1512;
    int _1520 = abs(_1432);
    int _1522 = abs(_1390);
    int _1524 = abs(_1298);
    int _1526 = abs(_1420);
    int _1528 = ~_1520;
    int _1530 = _1528 + 1;
    int _1532 = _1530 + 1;
    float _1534 = float(uint(_1506));
    int _1536 = ~_1524;
    int _1538 = _1536 + 1;
    int _1540 = _1538 + 1;
    int _1542 = _1532 * as_type<int>(_1276);
    int _1544 = _1542 + _1516;
    int _1546 = ~_1478;
    int _1548 = _1546 + 1;
    int _1550 = _1548 + 1;
    float _1552 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1554 = int(_1552);
    int _1556 = _1544 * _1540;
    int _1558 = ~_1522;
    int _1560 = _1558 + 1;
    int _1562 = _1560 + 1;
    int _1564 = _1550 * as_type<int>(_1350);
    int _1566 = ~_1526;
    int _1568 = _1566 + 1;
    int _1570 = _1568 + 1;
    int _1572 = _1306 * _1524;
    int _1574 = _1572 + _1556;
    int _1576 = abs(_1372);
    int _1578 = _1562 * as_type<int>(_1342);
    int _1580 = _1578 + _1564;
    float _1582 = 1.0 / _1534;
    int _1584 = abs(_1436);
    float _1586 = _601 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1588 = abs(_1574);
    int _1590 = _1570 * as_type<int>(_1464);
    int _1592 = _1590 + _1580;
    int _1594 = as_type<int>(_1518) + (-2);
    float _1596 = float(uint(_1574));
    int _1598 = ~_1280;
    int _1600 = _1598 + _1428;
    int _1602 = _1600 + 1;
    float _1604 = as_type<float>(_1594) * _1596;
    int _1606 = ~_1584;
    int _1608 = _1606 + 1;
    int _1610 = _1608 + 1;
    float _1612 = float(uint(_1554));
    int _1614 = _569 * _1602;
    int _1616 = _1614 + _900;
    int _1618 = as_type<int>(_1582) + (-2);
    int _1620 = _1610 * as_type<int>(_1472);
    int _1622 = _1620 + _1592;
    float _1624 = float(uint(_1588));
    float _1626 = trunc(_1604);
    float _1628 = precise::max(_1626, 0.0);
    uint _1630 = uint(_1628);
    int _1632 = ~_1576;
    int _1634 = _1632 + 1;
    int _1636 = _1634 + 1;
    float _1638 = fma(_293, _1316, _1480);
    float _1640 = as_type<float>(_1618) * _1624;
    float _1642 = fma(_293, _1352, _1474);
    bool _1644 = !_884;
    int _1646 = _1644 ? _1616 : (-1);
    int _1648 = _1622 * _1636;
    float _1650 = 1.0 / _1612;
    float _1652 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1654 = _1646 * _1576;
    int _1656 = _1654 + _1648;
    int _1658 = abs(_1554);
    float _1660 = fma(_297, _1356, _1642);
    int _1662 = ~_1424;
    int _1664 = _1662 + 1;
    float _1666 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1668 = _531 + _1666;
    float _1670 = trunc(_1640);
    float _1672 = precise::max(_1670, 0.0);
    uint _1674 = uint(_1672);
    float _1676 = float(uint(_1658));
    float _1678 = fma(_297, _1320, _1638);
    int _1680 = ~_1506;
    int _1682 = _1680 + 1;
    float _1684 = _599 + _601;
    float _1686 = float(uint(_1656));
    float _1688 = _1660 + _1358;
    float _1690 = 1.0 / _1676;
    float _1692 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1694 = as_type<int>(_1650) + (-2);
    int _1696 = _1664 * int(_1630);
    int _1698 = _1696 + _1574;
    float _1700 = _599 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1702 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1702;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1708 = _1706 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1710 = as_type<float>(_1694) * _1686;
    int _1712 = _1682 * int(_1674);
    int _1714 = _1712 + _1588;
    float _1716 = float(uint(_1698));
    float _1718 = -_1652;
    float _1720 = fma(_1700, 2.0, _1718);
    float _1722 = fma(_1586, -2.0, _1692);
    int _1724 = abs(_1656);
    float _1726 = trunc(_1710);
    float _1728 = precise::max(_1726, 0.0);
    uint _1730 = uint(_1728);
    float _1732 = float(uint(_1714));
    float _1734 = as_type<float>(_1594) * _1716;
    float _1736 = _1684 + (-1.0);
    float _1738 = as_type<float>(_1618) * _1732;
    int _1740 = as_type<int>(_1690) + (-2);
    float _1742 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1744 = float(uint(_1724));
    float _1746 = 1.0 / _1704;
    float _1748 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1742);
    int _1750 = ~_1554;
    int _1752 = _1750 + 1;
    float _1754 = as_type<float>(_1740) * _1744;
    float _1756 = fma(_297, _1292, _1488);
    float _1758 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1760 = 1.0 / _1708;
    int _1762 = _1752 * int(_1730);
    int _1764 = _1762 + _1656;
    float _1766 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1768 = _531 + _1766;
    float _1770 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1758);
    int _1772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1774 = _1772 != 0;
    float _1776 = _1678 + _1322;
    float _1778 = float(uint(_1764));
    float _1780 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1722);
    float _1782 = trunc(_1754);
    float _1784 = precise::max(_1782, 0.0);
    uint _1786 = uint(_1784);
    float _1788 = _1668 * _1746;
    int _1790 = ~_1424;
    int _1792 = _1790 + 1;
    float _1794 = as_type<float>(_1694) * _1778;
    int _1796 = ~_1506;
    int _1798 = _1796 + 1;
    float _1800 = trunc(_1734);
    float _1802 = precise::max(_1800, 0.0);
    uint _1804 = uint(_1802);
    float _1806 = _1768 * _1760;
    int _1808 = ~_1658;
    int _1810 = _1808 + 1;
    float _1812 = _599 * 2.0;
    float _1814 = fma(_1736, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1816 = -_211;
    int _1818 = _1188 ? as_type<int>(_1816) : as_type<int>(_211);
    int _1820 = ~_1658;
    int _1822 = _1820 + 1;
    float _1824 = trunc(_1738);
    float _1826 = precise::max(_1824, 0.0);
    uint _1828 = uint(_1826);
    int _1830 = _1810 * int(_1786);
    int _1832 = _1830 + _1724;
    float _1834 = floor(_1812);
    int _1836 = int(_1630) + int(_1804);
    float _1838 = float(uint(_1832));
    float _1840 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1840;
    int _1844 = _1792 * _1836;
    int _1846 = _1844 + _1574;
    float _1848 = as_type<float>(_1740) * _1838;
    int _1850 = int(_1674) + int(_1828);
    float _1852 = trunc(_1794);
    float _1854 = precise::max(_1852, 0.0);
    uint _1856 = uint(_1854);
    bool _1858 = uint(_1846) >= uint(_1424);
    float _1860 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1860;
    int _1864 = _1798 * _1850;
    int _1866 = _1864 + _1588;
    int _1868 = as_type<int>(_1812);
    float _1870 = as_type<float>(_1798);
    float _1872 = _1848;
    float _1874 = _1794;
    if (_1774)
    {
        _1868 = 0;
    }
    int _1876 = _1868;
    float _1878 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1880 = _1878 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    int _1882 = _1876;
    if (!_1774)
    {
        _1882 = 1;
    }
    int _1884 = _1882;
    float _1886 = trunc(_1848);
    float _1888 = precise::max(_1886, 0.0);
    uint _1890 = uint(_1888);
    bool _1892 = _1834 > 0.0;
    float _1894 = fma(_1880, _1806, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _1896 = _1834 >= 0.0;
    bool _1898 = isnan(_1834);
    bool _1900 = _1896 || _1898;
    bool _1902 = isnan(0.0);
    bool _1904 = _1900 || _1902;
    float _1906 = _603 + _601;
    bool _1908 = !_1858;
    int _1910 = _1908 ? 0 : (-1);
    bool _1912 = uint(_1866) >= uint(_1506);
    float _1914 = _1906 + (-1.0);
    int _1916 = ~_1554;
    int _1918 = _1916 + 1;
    float _1920 = _601 * 2.0;
    bool _1922 = !_1912;
    int _1924 = _1922 ? 0 : (-1);
    bool _1926 = _599 > 0.5;
    float _1928 = fma(_1914, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1930 = int(_1730) + int(_1856);
    float _1932 = -_207;
    int _1934 = _1926 ? as_type<int>(_1932) : as_type<int>(_207);
    bool _1936 = _601 > 0.5;
    int _1938 = _1918 * _1930;
    int _1940 = _1938 + _1656;
    int _1942 = int(_1786) + int(_1890);
    float _1944 = fma(_1862, _1788, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1946 = !_1440;
    float _1948 = _1946 ? _207 : as_type<float>(_1934);
    float _1950 = floor(_1920);
    bool _1952 = _1884 != 1;
    float _1954 = -_211;
    int _1956 = _1936 ? as_type<int>(_1954) : as_type<int>(_211);
    bool _1958 = uint(_1940) >= uint(_1554);
    int _1960 = _1822 * _1942;
    int _1962 = _1960 + _1724;
    int _1964 = ~_1836;
    int _1966 = _1964 + _1910;
    int _1968 = _1966 + 1;
    float _1970 = _603 * 2.0;
    bool _1972 = !_1450;
    float _1974 = _1972 ? _211 : as_type<float>(_1956);
    bool _1976 = _603 > 0.5;
    int _1978 = _1424 * _1968;
    int _1980 = _1978 + _1574;
    bool _1982 = !_1958;
    int _1984 = _1982 ? 0 : (-1);
    bool _1986 = uint(_1962) >= uint(_1658);
    float _1988 = -_207;
    int _1990 = _1976 ? as_type<int>(_1988) : as_type<int>(_207);
    float _1992 = floor(_1970);
    bool _1994 = _1424 == 0;
    bool _1996 = !_1454;
    float _1998 = _1996 ? _207 : as_type<float>(_1990);
    bool _2000 = !_1986;
    int _2002 = _2000 ? 0 : (-1);
    bool _2004 = !_1994;
    int _2006 = _2004 ? _1980 : (-1);
    int _2008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2010 = _2008 != 0;
    int _2012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2014 = _2012 != 0;
    int _2016 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2018 = _2016 != 0;
    int _2020 = _1904 ? 0 : 1;
    float _2022 = as_type<float>(_1980);
    if (!_1952)
    {
        _2022 = _601;
    }
    float _2024 = _2022;
    int _2026 = ~_2020;
    int _2028 = _2026 + 1;
    int _2030 = _2028 + 1;
    int _2032 = _2030;
    float _2034 = _2024;
    if (!_1892)
    {
        int _2036 = ~_2020;
        int _2038 = _2036 + 1;
        _2032 = _2038;
    }
    int _2040 = _2032;
    if (!_1952)
    {
        _1870 = _601;
    }
    float _2042 = _1870;
    float _2044 = _2042;
    if (!_1952)
    {
        _1872 = _603;
    }
    float _2046 = _1872;
    float _2048 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1748);
    float _2050 = _2046;
    if (!_1952)
    {
        _1874 = _603;
    }
    float _2052 = _1874;
    float _2054 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1770);
    float _2056 = _2052;
    if (_1952)
    {
        _2034 = _599;
    }
    float _2058 = _2034;
    float _2060 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _2062 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _2060;
    if (_1952)
    {
        _2044 = _599;
    }
    float _2064 = _2044;
    if (_1952)
    {
        _2050 = _601;
    }
    float _2066 = _2050;
    float _2068 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1952)
    {
        _2056 = _601;
    }
    float _2070 = _2056;
    bool _2072 = _1950 > 0.0;
    bool _2074 = _1950 >= 0.0;
    bool _2076 = isnan(_1950);
    bool _2078 = _2074 || _2076;
    bool _2080 = isnan(0.0);
    bool _2082 = _2078 || _2080;
    bool _2084 = _1992 > 0.0;
    bool _2086 = !_2014;
    int _2088 = _2086 ? 0 : 1;
    bool _2090 = _1992 >= 0.0;
    bool _2092 = isnan(_1992);
    bool _2094 = _2090 || _2092;
    bool _2096 = isnan(0.0);
    bool _2098 = _2094 || _2096;
    float _2100 = fma(_2062, _1788, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _2102 = fma(_1842, _1788, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _2104 = _531 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _2106 = isnan(_531);
    bool _2108 = _2104 || _2106;
    bool _2110 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _2112 = _2108 || _2110;
    float _2114 = float(_2112);
    bool _2116 = _531 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _2118 = isnan(_531);
    bool _2120 = _2116 || _2118;
    bool _2122 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _2124 = _2120 || _2122;
    float _2126 = float(_2124);
    bool _2128 = _531 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _2130 = isnan(_531);
    bool _2132 = _2128 || _2130;
    bool _2134 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _2136 = _2132 || _2134;
    float _2138 = float(_2136);
    float _2140 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _2142 = _2140 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    int _2144 = _2098 ? 0 : 1;
    float _2146 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _2148 = _2146 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _2150 = -_2114;
    float _2152 = _2150 + 1.0;
    float _2154 = fma(_2142, _1806, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _2156 = _1756 + _1294;
    int _2158 = ~_2144;
    int _2160 = _2158 + 1;
    int _2162 = _2160 + 1;
    float _2164 = _2138 * _2152;
    int _2166 = _2162;
    if (!_2084)
    {
        int _2168 = ~_2144;
        int _2170 = _2168 + 1;
        _2166 = _2170;
    }
    int _2172 = _2166;
    float _2174 = -_2138;
    float _2176 = _2174 + 1.0;
    bool _2178 = _1424 == 0;
    float _2180 = fma(_2148, _1806, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    int _2182 = _1574 ^ _1424;
    float _2184 = _2126 * _2176;
    float _2186 = -_2126;
    float _2188 = _2186 + 1.0;
    uint _2190 = uint(int(uint(_2182) >> uint(31)));
    float _2192 = _2100 * _2184;
    int _2194 = ~_1924;
    int _2196 = _1850 + _2194;
    int _2198 = _2196 + 1;
    float _2200 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2202 = ~int(_2190);
    int _2204 = _2202 + 1;
    float _2206 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2208 = _2102 * _2184;
    float _2210 = _1944 * _2184;
    int _2212 = ~_1930;
    int _2214 = _2212 + _1984;
    int _2216 = _2214 + 1;
    float _2218 = fma(_2188, (*spvDescriptorSet0.vp_c9)._m0[107].x, _2192);
    int _2220 = _2198 ^ _2204;
    float _2222 = fma(_2188, (*spvDescriptorSet0.vp_c9)._m0[107].y, _2208);
    float _2224 = fma(_2188, (*spvDescriptorSet0.vp_c9)._m0[107].z, _2210);
    float _2226 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2228 = ~_2204;
    int _2230 = _2228 + _2220;
    int _2232 = _2230 + 1;
    int _2234 = _1554 * _2216;
    int _2236 = _2234 + _1656;
    float _2238 = fma(_2154, _2164, _2218);
    bool _2240 = _1554 == 0;
    float _2242 = -_2226;
    float _2244 = fma(_2068, 2.0, _2242);
    bool _2246 = !_2178;
    int _2248 = _2246 ? _2232 : (-1);
    float _2250 = fma(_2114, (*spvDescriptorSet0.vp_c9)._m0[109].x, _2238);
    bool _2252 = _1554 == 0;
    float _2254 = fma(_2180, _2164, _2222);
    bool _2256 = !_2240;
    int _2258 = _2256 ? _2236 : (-1);
    float _2260 = fma(_1894, _2164, _2224);
    int _2262 = _1656 ^ _1554;
    float _2264 = fma(_2114, (*spvDescriptorSet0.vp_c9)._m0[109].y, _2254);
    int _2266 = abs(_2088);
    float _2268 = fma(_2114, (*spvDescriptorSet0.vp_c9)._m0[109].z, _2260);
    int _2270 = ~_2002;
    int _2272 = _1942 + _2270;
    int _2274 = _2272 + 1;
    float _2276 = _2206 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2278 = float(_2040);
    float _2280 = _2066 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2282 = fma(_2070, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2200);
    uint _2284 = uint(int(uint(_2262) >> uint(31)));
    float _2286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2288 = float(_2266);
    float _2290 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2292 = ~int(_2284);
    int _2294 = _2292 + 1;
    float _2296 = -_137;
    float _2298 = fma(_2296, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1720);
    float _2300 = float(_2006);
    float _2302 = _2288 * _2278;
    float _2304 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2306 = _1688 + _2304;
    float _2308 = fma(_2280, -2.0, _2290);
    int _2310 = _2274 ^ _2294;
    float _2312 = fma(_2276, _2300, _2298);
    float _2314 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2316 = _2156 + _2314;
    float _2318 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2320 = ~_2294;
    int _2322 = _2320 + _2310;
    int _2324 = _2322 + 1;
    float _2326 = _2264 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2328 = _1948 + 0.5;
    float _2330 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2318);
    float _2332 = _2250 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2334 = _2268 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2338 = _2326 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2340 = _2332 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2342 = _2334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2344 = fma(_2276, _2328, _2312);
    float _2346 = _2286 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.m_64.x = _2340;
    out.m_64.y = _2338;
    out.m_64.z = _2342;
    float _2348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2350 = float(_2248);
    float _2352 = -_137;
    float _2354 = fma(_2352, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2244);
    float _2356 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2358 = float(_2258);
    float _2360 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2362 = _1776 + _2360;
    bool _2364 = !_2252;
    int _2366 = _2364 ? _2324 : (-1);
    float _2368 = fma(_2064, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2356);
    float _2370 = _2336 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2372 = -_1780;
    float _2374 = fma(_2346, _2350, _2372);
    float _2376 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2378 = _1974 + (-0.5);
    float _2380 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2368);
    float _2382 = fma(_2370, _2358, _2354);
    float _2384 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2376);
    float _2386 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2388 = log2(_2386);
    float _2390 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2392 = -_2346;
    float _2394 = fma(_2392, _2378, _2374);
    float _2396 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2384);
    float _2398 = -_2380;
    float _2400 = _2398 + 1.0;
    float _2402 = float(_2366);
    float _2404 = _2348 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2406 = -_2396;
    float _2408 = _2406 + 1.0;
    bool _2410 = !_1446;
    float _2412 = _2410 ? _211 : as_type<float>(_1818);
    float _2414 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2308);
    float _2416 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2390);
    float _2418 = -_2408;
    float _2420 = fma(_1948, _2418, _2344);
    float _2422 = _2306 * _2306;
    float _2424 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2330);
    float _2426 = _1998 + 0.5;
    float _2428 = -_2414;
    float _2430 = fma(_2404, _2402, _2428);
    float _2432 = fma(_2316, _2316, _2422);
    float _2434 = _2412 + (-0.5);
    float _2436 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2416);
    float _2438 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2282);
    float _2440 = fma(_2362, _2362, _2432);
    bool _2442 = _2424 >= 0.0;
    float _2444 = fma(_2370, _2426, _2382);
    float _2446 = -_2404;
    float _2448 = fma(_2446, _2434, _2430);
    float _2450 = -_2436;
    float _2452 = _2450 + 1.0;
    float _2454 = -_2438;
    float _2456 = _2454 + 1.0;
    bool _2458 = !_2010;
    int _2460 = _2458 ? 0 : 1;
    float _2462 = _2388 * _137;
    float _2464 = -_2400;
    float _2466 = fma(_1998, _2464, _2444);
    float _2468 = fma(_2412, _2456, _2448);
    float _2470 = fma(_1974, _2452, _2394);
    float _2472 = rsqrt(_2440);
    int _2474 = abs(_2460);
    float _2476 = in.m_66.x;
    float _2478 = in.m_66.y;
    float _2480 = in.m_66.z;
    float _2482 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2484 = 1.0 + _2482;
    float _2486 = _2434;
    if (_2442)
    {
        _2486 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2488 = _2486;
    out.m_68.x = _2420;
    out.m_68.y = _2470;
    out.m_68.z = _2466;
    out.m_68.w = _2468;
    float _2490 = exp2(_2462);
    bool _2492 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2494 = isnan(0.0);
    bool _2496 = _2492 || _2494;
    bool _2498 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2500 = _2496 || _2498;
    int _2502 = as_type<int>(_2488);
    if (_2442)
    {
        float _2504 = _2488 * 5.0;
        _2502 = as_type<int>(_2504);
    }
    int _2506 = _2502;
    if (_2442)
    {
        out.m_47.x = 0.0;
    }
    bool _2508 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2510 = isnan(1.0);
    bool _2512 = _2508 || _2510;
    bool _2514 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2516 = _2512 || _2514;
    bool _2518 = !_2018;
    int _2520 = _2518 ? 0 : 1;
    if (_2442)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7409 = as_type<float>(_2506);
        out.gl_Position.z = _7409;
    }
    float _2522 = 1.0 / _2484;
    float _2524 = _2306 * _2472;
    float _2526 = _2316 * _2472;
    float _2528 = -_2490;
    float _2530 = _2528 + 1.0;
    float _2532 = float(_2474);
    float _2534 = float(_2172);
    if (_2442)
    {
        return out;
    }
    float _2536 = -_2524;
    float _2538 = fma(_2536, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1688);
    float _2540 = _2532 * _2534;
    float _2542 = _2362 * _2472;
    float _2544 = -_2526;
    float _2546 = fma(_2544, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2156);
    float _2548 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2550 = _2538 + _2548;
    float _2552 = _2500 ? _2530 : 0.0;
    float _2554 = _2540 * (-2.0);
    float _2556 = -_2542;
    float _2558 = fma(_2556, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1776);
    float _2560 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2562 = _2546 + _2560;
    float _2564 = _2550 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (_2516)
    {
        float _2566 = _2552 * _2522;
        _139 = _2566;
    }
    float _2568 = _139;
    float _2570 = _599 + (-0.5);
    float _2572 = fma(_2554, _2476, _2476);
    float _2574 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2576 = _2558 + _2574;
    float _2578 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2564);
    float _2580 = fma(_1814, _2554, _1814);
    float _2582 = fma(_2570, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2572);
    float _2584 = _2302 * (-2.0);
    float _2586 = fma(_2576, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2578);
    int _2588 = _2082 ? 0 : 1;
    float _2590 = fma(_2580, _2568, _2582);
    float _2592 = _601 + (-0.5);
    float _2594 = fma(_2584, _2478, _2478);
    bool _2596 = _2586 >= 0.0;
    float _2598 = rsqrt(_2048);
    int _2600 = abs(_2520);
    float _2602 = fma(_2592, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2594);
    int _2604 = ~_2588;
    int _2606 = _2604 + 1;
    int _2608 = _2606 + 1;
    float _2610 = fma(_1928, _2584, _1928);
    int _2612 = _2608;
    float _2614 = _2594;
    float _2616 = _2576;
    if (!_2072)
    {
        int _2618 = ~_2588;
        int _2620 = _2618 + 1;
        _2612 = _2620;
    }
    int _2622 = _2612;
    float _2624 = rsqrt(_2054);
    float _2626 = float(_2622);
    float _2628 = _2590 * 0.15915493667125701904296875;
    float _2630 = float(_2600);
    if (_2596)
    {
        _2614 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2632 = _2614;
    int _2634 = as_type<int>(_2632);
    if (_2596)
    {
        out.m_47.x = 0.0;
    }
    float _2636 = fma(_2610, _2568, _2602);
    float _2638 = _2630 * _2626;
    float _2640 = _2628 * 6.283185482025146484375;
    float _2642 = sin(_2640);
    if (_2596)
    {
        float _2644 = _2632 * 5.0;
        _2634 = as_type<int>(_2644);
    }
    int _2646 = _2634;
    if (_2596)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7614 = as_type<float>(_2646);
        out.gl_Position.z = _7614;
    }
    float _2648 = _2628 * 6.283185482025146484375;
    float _2650 = cos(_2648);
    if (_2596)
    {
        return out;
    }
    float _2652 = -_1688;
    float _2654 = _2652 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2656 = _603 + _599;
    float _2658 = -_2156;
    float _2660 = _2658 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2662 = _2636 * 0.15915493667125701904296875;
    float _2664 = _2654 * _2654;
    float _2666 = _2656 + (-1.0);
    float _2668 = -_1776;
    float _2670 = _2668 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2672 = _2638 * (-2.0);
    float _2674 = fma(_2660, _2660, _2664);
    float _2676 = fma(_2666, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2678 = _603 + (-0.5);
    float _2680 = fma(_2672, _2480, _2480);
    float _2682 = fma(_2670, _2670, _2674);
    float _2684 = -_2524;
    float _2686 = fma(_2684, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2306);
    float _2688 = fma(_2676, _2672, _2676);
    float _2690 = fma(_2678, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2680);
    float _2692 = -_2526;
    float _2694 = fma(_2692, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2316);
    float _2696 = _2686 * _2686;
    float _2698 = rsqrt(_2682);
    float _2700 = fma(_2688, _2568, _2690);
    float _2702 = -_2542;
    float _2704 = fma(_2702, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2362);
    float _2706 = fma(_2694, _2694, _2696);
    float _2708 = _207 * _2598;
    float _2710 = _2700 * 0.15915493667125701904296875;
    float _2712 = _499 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2714 = fma(_2704, _2704, _2706);
    float _2716 = _2662 * 6.283185482025146484375;
    float _2718 = sin(_2716);
    bool _2720 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2722 = isnan(0.5);
    bool _2724 = _2720 || _2722;
    bool _2726 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2728 = _2724 || _2726;
    float _2730 = _2660 * _2698;
    float _2732 = _2670 * _2698;
    float _2734 = _2654 * _2698;
    float _2736 = _2662 * 6.283185482025146484375;
    float _2738 = cos(_2736);
    float _2740 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2742 = _2730 * _2740;
    float _2744 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2746 = _2732 * _2744;
    float _2748 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2750 = _2734 * _2748;
    float _2752 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2754 = -_2742;
    float _2756 = fma(_2732, _2752, _2754);
    float _2758 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2760 = -_2746;
    float _2762 = fma(_2734, _2758, _2760);
    float _2764 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2766 = -_2750;
    float _2768 = fma(_2730, _2764, _2766);
    float _2770 = sqrt(_2714);
    float _2772 = _2756 * _2756;
    float _2774 = _2642 * _2718;
    float _2776 = fma(_2762, _2762, _2772);
    float _2778 = _211 * _2624;
    float _2780 = _2710 * 6.283185482025146484375;
    float _2782 = sin(_2780);
    float _2784 = fma(_2768, _2768, _2776);
    float _2786 = _2650 * _2738;
    float _2788 = _2710 * 6.283185482025146484375;
    float _2790 = cos(_2788);
    float _2792 = _2472 * _2770;
    float _2794 = _497 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2796 = _2642 * _2738;
    float _2798 = rsqrt(_2784);
    float _2800 = fma(_2782, _2786, _2774);
    float _2802 = fma(_2782, _2774, _2786);
    float _2804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2778);
    float _2806 = _2792 * _2712;
    float _2808 = _2650 * _2718;
    float _2810 = _2650 * _2790;
    float _2812 = _2738 * _2790;
    float _2814 = _2642 * _2790;
    float _2816 = _2718 * _2790;
    float _2818 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2708);
    float _2820 = _2792 * _2794;
    float _2822 = _2804 * _2806;
    float _2824 = -_2808;
    float _2826 = fma(_2782, _2796, _2824);
    float _2828 = _2762 * _2798;
    float _2830 = _2818 * _2820;
    float _2832 = _2810 * _2822;
    float _2834 = -_2796;
    float _2836 = fma(_2782, _2808, _2834);
    float _2838 = -_2822;
    float _2840 = _2782 * _2838;
    float _2842 = _2756 * _2798;
    float _2844 = _2792 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2846 = _2844 * 0.5;
    float _2848 = fma(_2800, _2830, _2832);
    float _2850 = _2734 * _2828;
    float _2852 = _2814 * _2822;
    float _2854 = fma(_2812, _2830, _2840);
    float _2856 = _2768 * _2798;
    float _2858 = fma(_2836, _2846, _2848);
    float _2860 = _2732 * _2842;
    float _2862 = -_2850;
    float _2864 = fma(_2730, _2842, _2862);
    float _2866 = fma(_2826, _2830, _2852);
    float _2868 = fma(_2816, _2846, _2854);
    float _2870 = -_2860;
    float _2872 = fma(_2734, _2856, _2870);
    float _2874 = _2864 * _2858;
    float _2876 = fma(_2802, _2846, _2866);
    float _2878 = _2730 * _2856;
    float _2880 = _2872 * _2858;
    float _2882 = fma(_2856, _2868, _2874);
    float _2884 = -_2878;
    float _2886 = fma(_2732, _2828, _2884);
    float _2888 = fma(_2828, _2868, _2880);
    float _2890 = fma(_2732, _2876, _2882);
    float _2892 = _2886 * _2858;
    float _2894 = fma(_2730, _2876, _2888);
    float _2896 = _1776 + _2890;
    float _2898 = _2156 + _2894;
    float _2900 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2902 = _2896 + _2900;
    float _2904 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2906 = _2898 + _2904;
    float _2908 = _2902 * _2902;
    float _2910 = fma(_2906, _2906, _2908);
    float _2912 = fma(_2842, _2868, _2892);
    float _2914 = sqrt(_2910);
    float _2916 = fma(_2734, _2876, _2912);
    float _2918 = _1688 + _2916;
    bool _2920 = _2914 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2922 = _2892;
    float _2924 = _2912;
    float _2926 = _2876;
    if (!_2920)
    {
        _2922 = _2898;
    }
    float _2928 = _2922;
    float _2930 = _2928;
    if (!_2920)
    {
        _2924 = _2896;
    }
    float _2932 = _2924;
    float _2934 = _2932;
    if (!_2920)
    {
        _2926 = _2918;
    }
    float _2936 = _2926;
    bool _2938 = !_2920;
    float _2940 = _2936;
    if (!_2938)
    {
        float _2942 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2944 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2946 = _2914 + _2944;
        float _2948 = rsqrt(_2910);
        float _2950 = _2946 * _2942;
        float _2952 = _2918 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2954 = _2950 * 0.15915493667125701904296875;
        float _2956 = _2954 * 6.283185482025146484375;
        float _2958 = cos(_2956);
        float _2960 = _2954 * 6.283185482025146484375;
        float _2962 = sin(_2960);
        float _2964 = _2958 + (-1.0);
        float _2966 = _2964 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2968 = fma(_2962, _2952, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2970 = fma(_2918, _2958, _2966);
        float _2972 = _2948 * _2968;
        float _2974 = fma(_2906, _2972, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2976 = fma(_2902, _2972, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2930 = _2974;
        _2940 = _2970;
        _2934 = _2976;
    }
    float _2978 = _2930;
    float _2980 = _2940;
    float _2982 = _2934;
    float _2984 = -_2526;
    float _2986 = fma(_2984, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2978);
    float _2988 = -_2524;
    float _2990 = fma(_2988, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2980);
    float _2992 = -_2542;
    float _2994 = fma(_2992, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2982);
    float _2996 = _2990;
    float _2998 = _2986;
    float _3000 = _2994;
    if (!_2728)
    {
        float _3002 = _2550 * _2550;
        float _3004 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3006 = -_1776;
        float _3008 = _3006 + _2982;
        float _3010 = fma(_2562, _2562, _3002);
        float _3012 = fma(_2576, _2576, _3010);
        float _3014 = 1.0 / _2792;
        float _3016 = sqrt(_3012);
        float _3018 = precise::min(_3016, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3020 = _3018 * _3004;
        float _3022 = -_2156;
        float _3024 = _3022 + _2978;
        float _3026 = _3020 * _3014;
        float _3028 = -_1688;
        float _3030 = _3028 + _2980;
        float _3032 = fma(_3024, _3026, _2546);
        float _3034 = fma(_3030, _3026, _2538);
        float _3036 = fma(_3008, _3026, _2558);
        _2996 = _3034;
        _2998 = _3032;
        _3000 = _3036;
    }
    float _3038 = _2996;
    float _3040 = _2998;
    float _3042 = _3000;
    float _3044 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3046 = _3038 + _3044;
    float _3048 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3050 = _3040 + _3048;
    float _3052 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3054 = _3042 + _3052;
    float _3056 = _3046 * _3046;
    float _3058 = fma(_3050, _3050, _3056);
    float _3060 = fma(_3054, _3054, _3058);
    float _3062 = rsqrt(_3060);
    float _3064 = sqrt(_3060);
    float _3066 = _3062 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3068 = _3050 * _3066;
    float _3070 = _3054 * _3066;
    float _3072 = _3068 * _3068;
    float _3074 = _3070 * _3070;
    float _3076 = _3072 + _3074;
    float _3078 = sqrt(_3076);
    bool _3080 = _3078 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3082 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3084 = _3078 + _3082;
    float _3086 = _3054;
    float _3088 = _3076;
    float _3090 = _3084;
    float _3092 = _3066;
    if (_3080)
    {
        float _3094 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3086 = _3094;
    }
    float _3096 = _3086;
    if (_3080)
    {
        float _3098 = rsqrt(_3076);
        _3088 = _3098;
    }
    float _3100 = _3088;
    if (_3080)
    {
        float _3102 = _3084 * _3096;
        _3090 = _3102;
    }
    float _3104 = _3090;
    if (_3080)
    {
        float _3106 = _3104 * 0.15915493667125701904296875;
        _2616 = _3106;
    }
    float _3108 = _2616;
    float _3110 = _3056;
    float _3112 = _3108;
    if (_3080)
    {
        float _3114 = _3108 * 6.283185482025146484375;
        float _3116 = sin(_3114);
        _3110 = _3116;
    }
    float _3118 = _3110;
    float _3120 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3122 = precise::max(0.0, _3120);
    float _3124 = _3062;
    float _3126 = _3122;
    float _3128 = _3120;
    if (_3080)
    {
        float _3130 = _3108 * 6.283185482025146484375;
        float _3132 = cos(_3130);
        _3124 = _3132;
    }
    float _3134 = _3124;
    float _3136 = -_3066;
    float _3138 = -_3122;
    float _3140 = fma(_3046, _3136, _3138);
    float _3142 = _3140;
    if (!_3080)
    {
        _3126 = _3068;
    }
    float _3144 = _3126;
    float _3146 = _3144;
    if (_3080)
    {
        float _3148 = _3140 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3128 = _3148;
    }
    float _3150 = _3128;
    float _3152 = _3118;
    float _3154 = _3150;
    if (_3080)
    {
        float _3156 = fma(_3118, _3150, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3152 = _3156;
    }
    float _3158 = _3152;
    float _3160 = _3158;
    float _3162 = _3134;
    if (_3080)
    {
        float _3164 = _3134 + (-1.0);
        _3154 = _3164;
    }
    float _3166 = _3154;
    float _3168 = _3166;
    if (_3080)
    {
        float _3170 = _3100 * _3158;
        _3092 = _3170;
    }
    float _3172 = _3092;
    if (!_3080)
    {
        _3160 = _3072;
    }
    float _3174 = _3160;
    float _3176 = _3038 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3178 = _3174;
    if (_3080)
    {
        float _3180 = _3166 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3112 = _3180;
    }
    float _3182 = _3112;
    if (_3080)
    {
        float _3184 = _3068 * _3172;
        _3146 = _3184;
    }
    float _3186 = _3146;
    if (!_3080)
    {
        _3168 = _3070;
    }
    float _3188 = _3168;
    float _3190 = _3188;
    if (_3080)
    {
        float _3192 = _3070 * _3172;
        _3190 = _3192;
    }
    float _3194 = _3190;
    if (_3080)
    {
        float _3196 = fma(_3140, _3134, _3182);
        _3142 = _3196;
    }
    float _3198 = _3142;
    if (_3080)
    {
        float _3200 = _3186 * _3186;
        _3178 = _3200;
    }
    float _3202 = _3178;
    if (!_3080)
    {
        _3162 = _3074;
    }
    float _3204 = _3162;
    float _3206 = _3204;
    if (_3080)
    {
        float _3208 = _3194 * _3194;
        _3206 = _3208;
    }
    float _3210 = _3206;
    float _3212 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3176);
    float _3214 = fma(_3198, _3198, _3202);
    float _3216 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3218 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3212);
    float _3220 = _3214 + _3210;
    float _3222 = _3038 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3224 = _3038 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3226 = _3218 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3228 = rsqrt(_3220);
    float _3230 = _3038 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3232 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3222);
    float _3234 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3236 = fma(_3064, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3234);
    float _3238 = precise::clamp(_3236, 0.0, 1.0);
    float _3240 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3224);
    float _3242 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3230);
    float _3244 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3232);
    float _3246 = -_3238;
    float _3248 = _3246 + 1.0;
    float _3250 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3240);
    float _3252 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3242);
    float _3254 = _3244 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3256 = abs(_3248);
    float _3258 = log2(_3256);
    float _3260 = _3250 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3262 = _3252 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3264 = _3254 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3266 = _3226 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3268 = _3228 * _3186;
    float _3270 = _3228 * _3198;
    float _3272 = fma(_3260, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3264);
    float _3274 = _3228 * _3194;
    float _3276 = _3268 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3278 = -_3266;
    float _3280 = fma(_3278, _3216, 1.0);
    float _3282 = fma(_3226, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3272);
    float _3284 = _3254 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3286 = -_3276;
    float _3288 = fma(_3270, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3286);
    float _3290 = log2(_3280);
    float _3292 = fma(_3262, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3282);
    float _3294 = _3258 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3296 = -_3274;
    float _3298 = fma(_3296, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3288);
    float _3300 = _3254 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3302 = fma(_3260, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3284);
    float _3304 = fma(_3298, -0.5, 0.5);
    float _3306 = 1.0 / _3292;
    float _3308 = fma(_3260, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3300);
    float _3310 = fma(_3298, 0.5, 0.5);
    float _3312 = fma(_3226, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3302);
    float _3314 = _3270 + 1.0;
    float _3316 = fma(_3226, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3308);
    float _3318 = fma(_3310, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3320 = fma(_3262, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3312);
    float _3322 = sqrt(_3304);
    float _3324 = fma(_3262, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3316);
    float _3326 = fma(_3310, _3318, -0.212114393711090087890625);
    float _3328 = _3290 * 0.693147182464599609375;
    float _3330 = fma(_3310, _3326, 1.570728778839111328125);
    float _3332 = _3328 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3334 = exp2(_3294);
    float _3336 = _3324 * _3306;
    float _3338 = fma(_3336, 0.5, 0.5);
    float _3340 = _3322 * 0.636619746685028076171875;
    float _3342 = _3320 * _3306;
    float _3344 = -_3330;
    float _3346 = fma(_3340, _3344, 1.0);
    float _3348 = fma(_3342, -0.5, 0.5);
    float _3350 = -_3270;
    float _3352 = fma(_3334, _3314, _3350);
    float3 _8745 = float3(_3338, _3348, _3332);
    float _3354 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8745, float3(0.0), isnan(_8745)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8745, float3(0.0), isnan(_8745)), level(0.0)).x;
    float _3356 = fma(_3352, 0.5, 0.5);
    float3 _8758 = float3(_3338, _3348, _3332);
    float4 _3359 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8758, float3(0.0), isnan(_8758)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8758, float3(0.0), isnan(_8758)), level(0.0)).xyzw;
    float _3361 = _3359.x;
    float _3363 = _3359.y;
    float _3365 = _3359.z;
    float _3367 = _3359.w;
    float2 _8775 = float2(_3346, _3356);
    float3 _3371 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8775, float2(0.0), isnan(_8775)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8775, float2(0.0), isnan(_8775)), level(0.0)).xyz;
    float _3373 = _3371.x;
    float _3375 = _3371.y;
    float _3377 = _3371.z;
    float _3379 = _3258 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3381 = _2800 * _2872;
    float _3383 = _2800 * _2886;
    float _3385 = _2800 * _2864;
    float _3387 = _2810 * _2872;
    float _3389 = _2810 * _2886;
    float _3391 = exp2(_3379);
    float _3393 = _2810 * _2864;
    float _3395 = _2778 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3397 = _2836 * _2872;
    float _3399 = _2836 * _2886;
    float _3401 = _2836 * _2864;
    float _3403 = fma(_3395, _3395, 1.0);
    float _3405 = fma(_2812, _2856, _3385);
    float _3407 = fma(_2812, _2842, _3383);
    float _3409 = -_2782;
    float _3411 = fma(_3409, _2828, _3387);
    float _3413 = -_2782;
    float _3415 = fma(_3413, _2842, _3389);
    float _3417 = -_2782;
    float _3419 = fma(_3417, _2856, _3393);
    float _3421 = rsqrt(_3403);
    float _3423 = fma(_2816, _2828, _3397);
    float _3425 = fma(_2812, _2828, _3381);
    float _3427 = fma(_2816, _2842, _3399);
    float _3429 = fma(_2814, _2730, _3411);
    float _3431 = fma(_2814, _2734, _3415);
    float _3433 = fma(_2814, _2732, _3419);
    float _3435 = fma(_2802, _2730, _3423);
    float _3437 = fma(_2826, _2730, _3425);
    float _3439 = fma(_2826, _2734, _3407);
    float _3441 = fma(_2826, _2732, _3405);
    float _3443 = _3254 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3445 = fma(_2816, _2856, _3401);
    float _3447 = fma(_2802, _2734, _3427);
    float _3449 = _2708 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3451 = _3395 * _3429;
    float _3453 = fma(_3260, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3443);
    float _3455 = -_3391;
    float _3457 = _3455 + 1.0;
    float _3459 = fma(_2802, _2732, _3445);
    float _3461 = fma(_3449, _3437, _3451);
    float _3463 = _3395 * _3421;
    float _3465 = _3395 * _3431;
    float _3467 = fma(_3226, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3453);
    float _3469 = _3457 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.x = _3437;
    out.m_70.y = _3439;
    out.m_70.z = _3441;
    float _3471 = fma(_3449, _3439, _3465);
    float _3473 = _3395 * _3433;
    float _3475 = fma(_3262, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3467);
    float _3477 = -_3435;
    float _3479 = _3463 * _3477;
    out.m_72.x = _3040;
    out.m_72.y = _3038;
    out.m_72.z = _3042;
    bool _3481 = _3064 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3483 = isnan(_3064);
    bool _3485 = _3481 || _3483;
    bool _3487 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3489 = _3485 || _3487;
    float _3491 = fma(_3421, _3429, _3479);
    float _3493 = -_3447;
    float _3495 = _3463 * _3493;
    float _3497 = fma(_3449, _3441, _3473);
    float _3499 = -_3459;
    float _3501 = _3463 * _3499;
    float _3503 = fma(_3421, _3431, _3495);
    float _3505 = _3475 + _3292;
    float _3507 = fma(_3421, _3433, _3501);
    float _3509 = _3447 + _3471;
    float _3511 = _3459 + _3497;
    float _3513 = _3505 * 0.5;
    float _3515 = _3435 + _3461;
    out.m_74.x = _3491;
    out.m_74.y = _3503;
    out.m_74.z = _3507;
    out.m_76.z = _3513;
    out.m_76.w = _3292;
    out.m_78.x = _3515;
    out.m_78.y = _3509;
    out.m_78.z = _3511;
    out.gl_Position.x = _3324;
    out.gl_Position.y = _3320;
    out.gl_Position.z = _3475;
    out.gl_Position.w = _3292;
    float _3517 = _3292;
    float _3519 = _3475;
    float _3521 = _3320;
    float _3523 = _3324;
    if (!_3489)
    {
        _3517 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3525 = _3517;
    float _3527 = _3525;
    float _3529 = _3525;
    if (!_3489)
    {
        _3519 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3531 = _3519;
    float _3533 = _3531;
    float _3535 = _3531;
    if (!_3489)
    {
        _3521 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3537 = _3521;
    float _3539 = _3537;
    float _3541 = _3537;
    if (!_3489)
    {
        _3523 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3543 = _3523;
    float _3545 = _3469 * _3354;
    float _3547 = -_3469;
    float _3549 = _3547 + 1.0;
    float _3551 = _3367 * _3545;
    float _3553 = _3367 * _3549;
    float _3555 = _3377 * _3545;
    float _3557 = fma(_3373, _3551, _3361);
    float _3559 = fma(_3375, _3551, _3363);
    float _3561 = _3361;
    float _3563 = _3545;
    float _3565 = _3543;
    float _3567 = _3543;
    if (!_3489)
    {
        _3561 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3569 = _3561;
    float _3571 = fma(_3367, _3555, _3365);
    float _3573 = _3569;
    float _3575 = _3569;
    if (!_3489)
    {
        _3563 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3577 = _3563;
    out.m_80.x = _3557;
    out.m_80.y = _3559;
    out.m_80.z = _3571;
    out.m_80.w = _3553;
    bool _3579 = !_3489;
    float _3581 = _3577;
    float _3583 = _3577;
    if (!_3579)
    {
        bool _3585 = _3064 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3587 = isnan(_3064);
        bool _3589 = _3585 || _3587;
        bool _3591 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3593 = _3589 || _3591;
        if (!_3593)
        {
            float _3595 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3597 = _3064 + _3595;
            float _3599 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3601 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3599;
            float _3603 = 1.0 / _3601;
            float _3605 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3607 = _3605 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3609 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3611 = _3609 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3613 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3615 = _3613 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3617 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3619 = _3617 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3621 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3623 = _3621 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3625 = _3597 * _3603;
            float _3627 = precise::clamp(_3625, 0.0, 1.0);
            float _3629 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3631 = _3629 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3633 = fma(_3627, _3607, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3635 = fma(_3627, _3631, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3637 = fma(_3627, _3611, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3639 = fma(_3627, _3615, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3641 = fma(_3627, _3619, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3643 = fma(_3627, _3623, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3529 = _3635;
            _3567 = _3641;
            _3575 = _3633;
            _3541 = _3639;
            _3535 = _3637;
            _3583 = _3643;
            _3645 = true;
        }
        else
        {
            bool _3647 = _3064 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3649 = isnan(_3064);
            bool _3651 = _3647 || _3649;
            bool _3653 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3655 = _3651 || _3653;
            if (!_3655)
            {
                _3573 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3657 = _3573;
            _3575 = _3657;
            if (!_3655)
            {
                _3527 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3659 = _3527;
            _3529 = _3659;
            if (!_3655)
            {
                _3533 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3661 = _3533;
            _3535 = _3661;
            if (!_3655)
            {
                _3539 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3663 = _3539;
            _3541 = _3663;
            if (!_3655)
            {
                _3565 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3665 = _3565;
            _3567 = _3665;
            if (!_3655)
            {
                _3581 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3667 = _3581;
            bool _3669 = !_3655;
            _3583 = _3667;
            if (!_3669)
            {
                bool _3671 = _3064 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3673 = isnan(_3064);
                bool _3675 = _3671 || _3673;
                bool _3677 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3679 = _3675 || _3677;
                if (!_3679)
                {
                    float _3681 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3683 = _3064 + _3681;
                    float _3685 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3687 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3685;
                    float _3689 = 1.0 / _3687;
                    float _3691 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3693 = _3691 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3695 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3697 = _3695 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3699 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3701 = _3699 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3703 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3705 = _3703 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3707 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3709 = _3707 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3711 = _3683 * _3689;
                    float _3713 = precise::clamp(_3711, 0.0, 1.0);
                    float _3715 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3717 = _3715 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3719 = fma(_3713, _3693, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3721 = fma(_3713, _3717, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3723 = fma(_3713, _3697, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3725 = fma(_3713, _3701, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3727 = fma(_3713, _3705, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3729 = fma(_3713, _3709, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3529 = _3721;
                    _3567 = _3727;
                    _3575 = _3719;
                    _3541 = _3725;
                    _3535 = _3723;
                    _3583 = _3729;
                    _3645 = true;
                }
                else
                {
                    _3529 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3567 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3575 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3541 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3535 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3583 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3645 = false;
    float _3731 = _3529;
    float _3733 = _3567;
    float _3735 = _3575;
    float _3737 = _3541;
    float _3739 = _3535;
    float _3741 = _3583;
    float _3743 = fma(_3509, -0.5, 0.5);
    float _3745 = precise::clamp(_3743, 0.0, 1.0);
    float _3747 = -_3731;
    float _3749 = _3747 + _3733;
    float _3751 = -_3735;
    float _3753 = _3751 + _3737;
    float _3755 = -_3739;
    float _3757 = _3755 + _3741;
    bool _3759 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3761 = fma(_3745, _3749, _3731);
    float _3763 = fma(_3745, _3753, _3735);
    float _3765 = fma(_3745, _3757, _3739);
    float _3767 = _3761 * 0.586610972881317138671875;
    out.m_82.x = 0.0;
    float _3769 = fma(_3763, 0.298911988735198974609375, _3767);
    float _3771 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3773 = fma(_3765, 0.114477999508380889892578125, _3769);
    out.m_47.x = _3771;
    float _3775 = -_3773;
    float _3777 = _3763 + _3775;
    float _3779 = -_3773;
    float _3781 = _3761 + _3779;
    float _3783 = -_3773;
    float _3785 = _3765 + _3783;
    float _3787 = fma(_3777, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3773);
    float _3789 = fma(_3781, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3773);
    float _3791 = fma(_3785, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3773);
    out.m_84.x = _3787;
    out.m_84.y = _3789;
    out.m_84.z = _3791;
    if (!_3759)
    {
        return out;
    }
    float _3793 = -_3038;
    float _3795 = _3793 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3797 = -_3040;
    float _3799 = _3797 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3801 = -_3042;
    float _3803 = _3801 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3805 = _3795 * _3795;
    float _3807 = fma(_3799, _3799, _3805);
    float _3809 = fma(_3803, _3803, _3807);
    float _3811 = sqrt(_3809);
    float _3813 = rsqrt(_3809);
    float _3815 = -_3811;
    float _3817 = _3815 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3819 = _3817 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3821 = precise::clamp(_3819, 0.0, 1.0);
    float _3823 = _3799 * _3813;
    float _3825 = _3795 * _3813;
    float _3827 = abs(_3821);
    float _3829 = log2(_3827);
    float _3831 = _3803 * _3813;
    float _3833 = _3823 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3835 = _3509 * _3825;
    float _3837 = -_3825;
    float _3839 = -_3833;
    float _3841 = fma(_3837, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3839);
    float _3843 = fma(_3515, _3823, _3835);
    float _3845 = -_3831;
    float _3847 = fma(_3845, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3841);
    float _3849 = fma(_3511, _3831, _3843);
    float _3851 = precise::clamp(_3849, 0.0, 1.0);
    float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3855 = _3847 + _3853;
    float _3857 = _3829 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3859 = _3855 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3861 = precise::clamp(_3859, 0.0, 1.0);
    float _3863 = exp2(_3857);
    float _3865 = _3863 * _3861;
    float _3867 = _3851 * _3865;
    float _3869 = _3867 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3871 = _3867 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3873 = _3867 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_82.x = _3869;
    out.m_82.y = _3871;
    out.m_82.z = _3873;
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
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3645 = false;
    bool _523 = false;
    bool _319 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _3930 = as_type<float>(_119);
        out.gl_Position.z = _3930;
    }
    if (!_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = in.m_49.w;
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
        out.m_47.x = 0.0;
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
        float _4000 = as_type<float>(_157);
        out.gl_Position.z = _4000;
    }
    if (_149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = in.m_54.w;
    bool _163 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _165 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _167 = _163 || _165;
    bool _169 = isnan(1.0);
    bool _171 = _167 || _169;
    float _173 = in.m_49.x;
    float _175 = in.m_49.y;
    float _177 = in.m_49.z;
    float _179 = in.m_44.x;
    float _181 = in.m_44.y;
    float _183 = in.m_44.z;
    int _185 = as_type<int>(_159) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_159) & 2;
    bool _191 = _189 != 0;
    float _193 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _195 = 0.0;
    float _197 = _193;
    if (!_171)
    {
        float _199 = _193 * _193;
        float _201 = _199 * 0.5;
        _195 = _201;
    }
    float _203 = _195;
    bool _205 = !_187;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_191;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = _203;
    if (!_171)
    {
        float _215 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _215;
    }
    float _217 = _213;
    bool _219 = !_171;
    float _221 = _217;
    if (!_219)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = _193 * _225;
        float _235 = 1.0 / _229;
        float _237 = _231 * 0.693147182464599609375;
        float _239 = exp2(_233);
        float _241 = 1.0 / _237;
        float _243 = _239 + (-1.0);
        float _245 = -_243;
        float _247 = fma(_245, _241, _193);
        float _249 = _247 * _235;
        float _251 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _251;
    }
    float _253 = _221;
    bool _255 = !_171;
    if (!_255)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = 1.0 / _263;
        float _267 = _193 * _259;
        float _269 = exp2(_267);
        float _271 = -_269;
        float _273 = _271 + 1.0;
        float _275 = _273 * _265;
        _197 = _275;
    }
    float _277 = _197;
    bool _279 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _281 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _283 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _285 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _287 = fma(_277, _173, _281);
    float _289 = fma(_277, _175, _283);
    float _291 = fma(_277, _177, _285);
    float _293 = fma(_287, _161, _179);
    float _295 = fma(_289, _161, _181);
    float _297 = fma(_291, _161, _183);
    bool _299 = !_279;
    float _317;
    if (!_299)
    {
        float _301 = in.m_56.x;
        float _303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _305 = _301 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _309 = _307 * _303;
        float _311 = floor(_309);
        float _313 = -_311;
        float _315 = _309 + _313;
        _317 = _315;
        _319 = true;
    }
    else
    {
        float _321 = float(_103);
        float _323 = 1.0 / _321;
        float _325 = _137 * _323;
        _317 = _325;
    }
    _319 = false;
    float _327 = _317;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _331 = _327 + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = _327 + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _345;
    float _349 = in.m_54.x;
    float _351 = in.m_54.y;
    bool _353 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _355 = isnan(_327);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = 1.0 / _339;
    bool _367 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _369 = 1.0 / _343;
    float _371 = 1.0 / _347;
    float _373 = _331 * _365;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _377 = _327 + _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _379;
    float _383 = fma(_381, _373, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _385 = _377 * _369;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _387;
    bool _391 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _393 = isnan(_327);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = fma(_389, _373, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _405 = -_401;
    float _407 = _405 + 1.0;
    float _409 = _335 * _371;
    float _411 = -_363;
    float _413 = _411 + 1.0;
    bool _415 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _417 = isnan(_327);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = _401 * _413;
    bool _429 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _431 = isnan(_327);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = _425 * _407;
    float _443 = -_425;
    float _445 = _443 + 1.0;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _455 = _439 * _445;
    float _457 = fma(_449, _385, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _459 = fma(_453, _385, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _461 = -_439;
    float _463 = _461 + 1.0;
    float _465 = _383 * _455;
    float _467 = _403 * _455;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _473;
    float _477 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[143].x, _465);
    float _479 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[143].y, _467);
    float _481 = fma(_471, _409, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _483 = fma(_475, _409, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _485 = fma(_457, _441, _477);
    float _487 = fma(_459, _441, _479);
    float _489 = fma(_481, _427, _485);
    float _491 = fma(_483, _427, _487);
    float _493 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[146].x, _489);
    float _495 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[146].y, _491);
    float _497 = _493 * _349;
    float _499 = _495 * _351;
    bool _501 = !_367;
    float _503 = _409;
    float _521;
    if (!_501)
    {
        float _505 = in.m_56.x;
        float _507 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _509 = _505 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _511 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[11].x, _137);
        float _513 = _511 * _507;
        float _515 = floor(_513);
        float _517 = -_515;
        float _519 = _513 + _517;
        _521 = _519;
        _523 = true;
    }
    else
    {
        float _525 = float(_103);
        float _527 = 1.0 / _525;
        float _529 = _137 * _527;
        _521 = _529;
    }
    _523 = false;
    float _531 = _521;
    float _533 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _535 = int(_533);
    float _537 = float(_103);
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _541 = _539 != 0;
    float _543 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _545 = int(_543);
    float _547 = float(_535);
    float _549 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _551 = int(_549);
    if (_541)
    {
        float _553 = in.m_56.x;
        _503 = _553;
    }
    float _555 = _503;
    float _557 = _555;
    if (!_541)
    {
        float _559 = in.m_56.y;
        _557 = _559;
    }
    float _561 = _557;
    float _563 = float(_545);
    float _565 = 1.0 / _547;
    float _567 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _569 = int(_567);
    float _571 = float(uint(_551));
    float _573 = 1.0 / _563;
    float _575 = _565 * _137;
    float _577 = 1.0 / _571;
    float _579 = float(uint(_569));
    int _581 = ~_569;
    int _583 = _581 + 1;
    int _585 = ~_569;
    int _587 = _585 + 1;
    float _589 = trunc(_575);
    int _591 = int(_589);
    float _593 = _573 * _137;
    float _595 = 1.0 / _579;
    int _597 = as_type<int>(_577) + (-2);
    float _599 = in.m_56.x;
    float _601 = in.m_56.y;
    float _603 = in.m_56.z;
    float _605 = in.m_56.w;
    float _607 = trunc(_593);
    int _609 = int(_607);
    float _611 = float(uint(_591));
    float _613 = as_type<float>(_597) * _611;
    int _615 = as_type<int>(_595) + (-2);
    float _617 = trunc(_613);
    float _619 = precise::max(_617, 0.0);
    uint _622 = uint(_619);
    int _624 = ~_551;
    int _626 = _624 + 1;
    float _628 = float(uint(_609));
    float _630 = _613;
    float _632 = _628;
    if (_541)
    {
        _630 = 1.0;
    }
    float _634 = _630;
    float _636 = as_type<float>(_615) * _628;
    float _638 = _634;
    if (_541)
    {
        _632 = 1.0;
    }
    float _640 = _632;
    float _642 = _640;
    if (!_541)
    {
        _642 = 7.345489978790283203125;
    }
    float _644 = _642;
    float _646 = trunc(_636);
    float _648 = precise::max(_646, 0.0);
    uint _650 = uint(_648);
    int _652 = _626 * int(_622);
    int _654 = _652 + _591;
    if (!_541)
    {
        _638 = 1.2345600128173828125;
    }
    float _656 = _638;
    float _658 = _644 * _599;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _662 = _660 != 0;
    float _664 = float(uint(_654));
    float _666 = _561 * _656;
    float _668 = floor(_658);
    float _670 = as_type<float>(_597) * _664;
    int _672 = _583 * int(_650);
    int _674 = _672 + _609;
    float _676 = trunc(_670);
    float _678 = precise::max(_676, 0.0);
    uint _680 = uint(_678);
    float _682 = float(uint(_674));
    float _684 = -_668;
    float _686 = _658 + _684;
    float _688 = floor(_666);
    float _690 = as_type<float>(_615) * _682;
    int _692 = ~_551;
    int _694 = _692 + 1;
    float _696 = float(_569);
    float _698 = trunc(_690);
    float _700 = precise::max(_698, 0.0);
    uint _702 = uint(_700);
    int _704 = int(_622) + int(_680);
    float _706 = float(_551);
    float _708 = float(_609);
    int _710 = _694 * _704;
    int _712 = _710 + _591;
    float _714 = 1.0 / _537;
    float _716 = -_688;
    float _718 = _666 + _716;
    float _720 = _686 * _706;
    float _722 = float(_591);
    bool _724 = uint(_712) >= uint(_551);
    bool _726 = !_662;
    int _728 = _726 ? 0 : 1;
    float _730 = trunc(_720);
    int _732 = int(_730);
    int _734 = int(_650) + int(_702);
    int _736 = ~_569;
    int _738 = _736 + 1;
    bool _740 = _708 >= _696;
    bool _742 = isnan(_708);
    bool _744 = _740 || _742;
    bool _746 = isnan(_696);
    bool _748 = _744 || _746;
    float _750 = float(_748);
    float _752 = _714 * _137;
    bool _754 = _722 >= _706;
    bool _756 = isnan(_722);
    bool _758 = _754 || _756;
    bool _760 = isnan(_706);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = _718 * _696;
    int _768 = _738 * _734;
    int _770 = _768 + _609;
    float _772 = _706 * _752;
    float _774 = _696 * _752;
    int _776 = abs(_728);
    float _778 = trunc(_764);
    int _780 = int(_778);
    bool _782 = !_724;
    int _784 = _782 ? 0 : (-1);
    bool _786 = uint(_770) >= uint(_569);
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _790 = _788 != 0;
    int _792 = ~_704;
    int _794 = _792 + _784;
    int _796 = _794 + 1;
    float _798 = trunc(_750);
    int _800 = int(_798);
    int _802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _804 = _802 != 0;
    int _806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _808 = _806 != 0;
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _812 = _810 != 0;
    int _814 = _732 * _776;
    int _816 = _814 + _591;
    bool _818 = !_786;
    int _820 = _818 ? 0 : (-1);
    int _822 = _551 * _796;
    int _824 = _822 + _591;
    bool _826 = !_790;
    int _828 = _826 ? 0 : 1;
    bool _830 = !_808;
    int _832 = _830 ? 0 : 1;
    float _834 = trunc(_766);
    int _836 = int(_834);
    int _838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _840 = _838 != 0;
    int _842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _844 = _842 != 0;
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _848 = _846 != 0;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _852 = _850 != 0;
    bool _854 = _551 == 0;
    int _856 = ~_734;
    int _858 = _856 + _820;
    int _860 = _858 + 1;
    int _862 = ~_780;
    int _864 = _862 + 1;
    int _866 = _864 + 1;
    float _868 = trunc(_772);
    int _870 = int(_868);
    bool _872 = !_854;
    int _874 = _872 ? _824 : (-1);
    int _876 = _569 * _860;
    int _878 = _876 + _609;
    bool _880 = !_844;
    int _882 = _880 ? 0 : 1;
    bool _884 = _569 == 0;
    int _886 = _874 * _866;
    int _888 = abs(_828);
    int _890 = _551 + (-1);
    int _892 = ~_800;
    int _894 = _892 + 1;
    int _896 = _894 + 1;
    int _898 = _836 * _888;
    int _900 = _898 + _609;
    bool _902 = !_884;
    int _904 = _902 ? _878 : (-1);
    int _906 = _780 * _890;
    int _908 = _906 + _886;
    int _910 = abs(_832);
    int _912 = _569 + (-1);
    int _914 = _904 * _896;
    int _916 = abs(_882);
    int _918 = _908 * _910;
    bool _920 = !_804;
    int _922 = _920 ? 0 : 1;
    int _924 = _800 * _912;
    int _926 = _924 + _914;
    int _928 = abs(_922);
    float _930 = trunc(_774);
    int _932 = int(_930);
    int _934 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _936 = _934 != 0;
    int _938 = _926 * _916;
    bool _940 = !_812;
    int _942 = _940 ? 0 : 1;
    int _944 = _870 * _928;
    int _946 = _944 + _918;
    bool _948 = !_936;
    int _950 = _948 ? 0 : 1;
    int _952 = abs(_942);
    bool _954 = !_848;
    int _956 = _954 ? 0 : 1;
    int _958 = abs(_950);
    int _960 = _816 * _952;
    int _962 = _960 + _946;
    bool _964 = !_840;
    int _966 = _964 ? 0 : 1;
    int _968 = abs(_956);
    bool _970 = !_852;
    int _972 = _970 ? 0 : 1;
    int _974 = abs(_966);
    int _976 = _732 * _958;
    int _978 = _976 + _962;
    int _980 = abs(_972);
    int _982 = _932 * _974;
    int _984 = _982 + _938;
    float _986 = float(uint(_978));
    int _988 = ~_551;
    int _990 = _988 + 1;
    int _992 = _900 * _968;
    int _994 = _992 + _984;
    int _996 = ~_569;
    int _998 = _996 + 1;
    float _1000 = as_type<float>(_597) * _986;
    float _1002 = float(uint(_900));
    int _1004 = _836 * _980;
    int _1006 = _1004 + _994;
    float _1008 = float(uint(_816));
    float _1010 = trunc(_1000);
    float _1012 = precise::max(_1010, 0.0);
    uint _1014 = uint(_1012);
    float _1016 = float(uint(_1006));
    float _1018 = as_type<float>(_597) * _1008;
    float _1020 = as_type<float>(_615) * _1002;
    float _1022 = as_type<float>(_615) * _1016;
    float _1024 = trunc(_1018);
    float _1026 = precise::max(_1024, 0.0);
    uint _1028 = uint(_1026);
    float _1030 = trunc(_1022);
    float _1032 = precise::max(_1030, 0.0);
    uint _1034 = uint(_1032);
    int _1036 = _990 * int(_1014);
    int _1038 = _1036 + _978;
    float _1040 = float(uint(_1038));
    int _1042 = _990 * int(_1028);
    int _1044 = _1042 + _816;
    float _1046 = trunc(_1020);
    float _1048 = precise::max(_1046, 0.0);
    uint _1050 = uint(_1048);
    float _1052 = as_type<float>(_597) * _1040;
    float _1054 = float(uint(_1044));
    int _1056 = _998 * int(_1034);
    int _1058 = _1056 + _1006;
    float _1060 = as_type<float>(_597) * _1054;
    int _1062 = ~_551;
    int _1064 = _1062 + 1;
    float _1066 = float(uint(_1058));
    float _1068 = trunc(_1052);
    float _1070 = precise::max(_1068, 0.0);
    uint _1072 = uint(_1070);
    float _1074 = as_type<float>(_615) * _1066;
    float _1076 = trunc(_1060);
    float _1078 = precise::max(_1076, 0.0);
    uint _1080 = uint(_1078);
    int _1082 = ~_569;
    int _1084 = _1082 + 1;
    int _1086 = _1084 * int(_1050);
    int _1088 = _1086 + _900;
    float _1090 = trunc(_1074);
    float _1092 = precise::max(_1090, 0.0);
    uint _1094 = uint(_1092);
    int _1096 = int(_1014) + int(_1072);
    int _1098 = ~_569;
    int _1100 = _1098 + 1;
    int _1102 = ~_551;
    int _1104 = _1102 + 1;
    int _1106 = _1064 * _1096;
    int _1108 = _1106 + _978;
    int _1110 = int(_1028) + int(_1080);
    bool _1112 = uint(_1108) >= uint(_551);
    int _1114 = _1104 * _1110;
    int _1116 = _1114 + _816;
    bool _1118 = !_1112;
    int _1120 = _1118 ? 0 : (-1);
    int _1122 = int(_1034) + int(_1094);
    int _1124 = ~_1096;
    int _1126 = _1124 + _1120;
    int _1128 = _1126 + 1;
    float _1130 = float(uint(_1088));
    int _1132 = _1100 * _1122;
    int _1134 = _1132 + _1006;
    bool _1136 = uint(_1116) >= uint(_551);
    int _1138 = _551 * _1128;
    int _1140 = _1138 + _978;
    float _1142 = as_type<float>(_615) * _1130;
    bool _1144 = uint(_1134) >= uint(_569);
    bool _1146 = !_854;
    int _1148 = _1146 ? _1140 : (-1);
    float _1150 = trunc(_1142);
    float _1152 = precise::max(_1150, 0.0);
    uint _1154 = uint(_1152);
    bool _1156 = !_1144;
    int _1158 = _1156 ? 0 : (-1);
    int _1160 = _1148 & 3;
    bool _1162 = _1160 != 0;
    int _1164 = ~_1122;
    int _1166 = _1164 + _1158;
    int _1168 = _1166 + 1;
    bool _1170 = !_1136;
    int _1172 = _1170 ? 0 : (-1);
    bool _1174 = uint(_1160) >= 2u;
    int _1176 = _569 * _1168;
    int _1178 = _1176 + _1006;
    int _1180 = ~_1110;
    int _1182 = _1180 + _1172;
    int _1184 = _1182 + 1;
    int _1186 = _1174 ? 0 : 1;
    bool _1188 = _605 > 0.5;
    int _1190 = _551 * _1184;
    int _1192 = _1190 + _816;
    int _1194 = _1148 >> 31;
    int _1196 = _1148 & 3;
    bool _1198 = _1196 != 0;
    int _1200 = _1194 & 3;
    bool _1202 = !_884;
    int _1204 = _1202 ? _1178 : (-1);
    int _1206 = _1148 + _1200;
    int _1208 = _1198 ? 0 : 1;
    int _1210 = _1206 >> 2;
    bool _1212 = _1160 != 3;
    int _1214 = _1204 >> 31;
    int _1216 = _1210 << 4;
    int _1218 = _1216 + 368;
    bool _1220 = uint(_1160) > 1u;
    int _1222 = _1214 & 3;
    uint _1224 = uint(int(uint(_1218) >> uint(2)));
    uint _1226 = uint(int(uint(int(_1224)) >> uint(2)));
    int _1228 = int(_1224) & 3;
    float _1230 = (*spvDescriptorSet0.vp_c9)._m0[int(_1226)][_1228];
    int _1232 = int(_1224) + 1;
    uint _1234 = uint(int(uint(_1232) >> uint(2)));
    int _1236 = _1232 & 3;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[int(_1234)][_1236];
    int _1240 = ~_1186;
    int _1242 = _1240 + 1;
    int _1244 = _1242 + 1;
    int _1246 = _1204 + _1222;
    int _1248 = _1244;
    if (_1212)
    {
        int _1250 = ~_1186;
        int _1252 = _1250 + 1;
        _1248 = _1252;
    }
    int _1254 = _1248;
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1258 = _1256 != 0;
    int _1260 = _1218 + 8;
    uint _1262 = uint(int(uint(_1260) >> uint(2)));
    uint _1264 = uint(int(uint(int(_1262)) >> uint(2)));
    int _1266 = int(_1262) & 3;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[int(_1264)][_1266];
    int _1270 = int(_1262) + 1;
    uint _1272 = uint(int(uint(_1270) >> uint(2)));
    int _1274 = _1270 & 3;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[int(_1272)][_1274];
    int _1278 = _1246 >> 2;
    int _1280 = int(_1050) + int(_1154);
    int _1282 = ~_1208;
    int _1284 = _1282 + 1;
    int _1286 = _1284 + 1;
    float _1288 = in.m_58.x;
    float _1290 = in.m_58.y;
    float _1292 = in.m_58.z;
    float _1294 = in.m_58.w;
    bool _1296 = !_1258;
    int _1298 = _1296 ? 0 : 1;
    int _1300 = _587 * _1280;
    int _1302 = _1300 + _900;
    bool _1304 = !_854;
    int _1306 = _1304 ? _1192 : (-1);
    int _1308 = _1286;
    if (!_1220)
    {
        int _1310 = ~_1208;
        int _1312 = _1310 + 1;
        _1308 = _1312;
    }
    int _1314 = _1308;
    float _1316 = in.m_60.x;
    float _1318 = in.m_60.y;
    float _1320 = in.m_60.z;
    float _1322 = in.m_60.w;
    int _1324 = _1278 << 4;
    int _1326 = _1324 + 512;
    int _1328 = _1204 & 3;
    bool _1330 = _1328 != 0;
    int _1332 = _1204 & 3;
    bool _1334 = _1332 != 0;
    uint _1336 = uint(int(uint(_1326) >> uint(2)));
    uint _1338 = uint(int(uint(int(_1336)) >> uint(2)));
    int _1340 = int(_1336) & 3;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[int(_1338)][_1340];
    int _1344 = int(_1336) + 1;
    uint _1346 = uint(int(uint(_1344) >> uint(2)));
    int _1348 = _1344 & 3;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[int(_1346)][_1348];
    float _1352 = in.m_62.x;
    float _1354 = in.m_62.y;
    float _1356 = in.m_62.z;
    float _1358 = in.m_62.w;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1362 = _1360 != 0;
    bool _1364 = !_1162;
    int _1366 = _1364 ? 0 : 1;
    bool _1368 = uint(_1332) > 1u;
    bool _1370 = !_1362;
    int _1372 = _1370 ? 0 : 1;
    bool _1374 = _1332 != 3;
    int _1376 = _1330 ? 0 : 1;
    bool _1378 = uint(_1332) >= 2u;
    int _1380 = ~_1376;
    int _1382 = _1380 + 1;
    int _1384 = _1382 + 1;
    int _1386 = _1378 ? 0 : 1;
    bool _1388 = !_1334;
    int _1390 = _1388 ? 0 : 1;
    bool _1392 = uint(_1302) >= uint(_569);
    int _1394 = _1384;
    if (!_1368)
    {
        int _1396 = ~_1376;
        int _1398 = _1396 + 1;
        _1394 = _1398;
    }
    int _1400 = _1394;
    bool _1402 = _1160 != 3;
    bool _1404 = _1332 != 3;
    int _1406 = ~_1386;
    int _1408 = _1406 + 1;
    int _1410 = _1408 + 1;
    int _1412 = abs(_1314);
    int _1414 = _1410;
    if (_1374)
    {
        int _1416 = ~_1386;
        int _1418 = _1416 + 1;
        _1414 = _1418;
    }
    int _1420 = _1414;
    float _1422 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1424 = int(_1422);
    bool _1426 = !_1392;
    int _1428 = _1426 ? 0 : (-1);
    bool _1430 = !_1402;
    int _1432 = _1430 ? 0 : (-1);
    bool _1434 = !_1404;
    int _1436 = _1434 ? 0 : (-1);
    int _1438 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1440 = _1438 != 0;
    float _1442 = _295 * _1290;
    int _1444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1446 = _1444 != 0;
    int _1448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1450 = _1448 != 0;
    int _1452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1454 = _1452 != 0;
    int _1456 = _1326 + 8;
    uint _1458 = uint(int(uint(_1456) >> uint(2)));
    uint _1460 = uint(int(uint(int(_1458)) >> uint(2)));
    int _1462 = int(_1458) & 3;
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[int(_1460)][_1462];
    int _1466 = int(_1458) + 1;
    uint _1468 = uint(int(uint(_1466) >> uint(2)));
    int _1470 = _1466 & 3;
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[int(_1468)][_1470];
    float _1474 = _295 * _1354;
    int _1476 = abs(_1366);
    int _1478 = abs(_1400);
    float _1480 = _295 * _1318;
    int _1482 = ~_1412;
    int _1484 = _1482 + 1;
    int _1486 = _1484 + 1;
    float _1488 = fma(_293, _1288, _1442);
    int _1490 = abs(_1254);
    int _1492 = _1486 * as_type<int>(_1238);
    int _1494 = ~_1476;
    int _1496 = _1494 + 1;
    int _1498 = _1496 + 1;
    int _1500 = ~_1490;
    int _1502 = _1500 + 1;
    int _1504 = _1502 + 1;
    int _1506 = abs(_1424);
    int _1508 = _1498 * as_type<int>(_1230);
    int _1510 = _1508 + _1492;
    float _1512 = float(uint(_1424));
    int _1514 = _1504 * as_type<int>(_1268);
    int _1516 = _1514 + _1510;
    float _1518 = 1.0 / _1512;
    int _1520 = abs(_1432);
    int _1522 = abs(_1390);
    int _1524 = abs(_1298);
    int _1526 = abs(_1420);
    int _1528 = ~_1520;
    int _1530 = _1528 + 1;
    int _1532 = _1530 + 1;
    float _1534 = float(uint(_1506));
    int _1536 = ~_1524;
    int _1538 = _1536 + 1;
    int _1540 = _1538 + 1;
    int _1542 = _1532 * as_type<int>(_1276);
    int _1544 = _1542 + _1516;
    int _1546 = ~_1478;
    int _1548 = _1546 + 1;
    int _1550 = _1548 + 1;
    float _1552 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1554 = int(_1552);
    int _1556 = _1544 * _1540;
    int _1558 = ~_1522;
    int _1560 = _1558 + 1;
    int _1562 = _1560 + 1;
    int _1564 = _1550 * as_type<int>(_1350);
    int _1566 = ~_1526;
    int _1568 = _1566 + 1;
    int _1570 = _1568 + 1;
    int _1572 = _1306 * _1524;
    int _1574 = _1572 + _1556;
    int _1576 = abs(_1372);
    int _1578 = _1562 * as_type<int>(_1342);
    int _1580 = _1578 + _1564;
    float _1582 = 1.0 / _1534;
    int _1584 = abs(_1436);
    float _1586 = _601 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1588 = abs(_1574);
    int _1590 = _1570 * as_type<int>(_1464);
    int _1592 = _1590 + _1580;
    int _1594 = as_type<int>(_1518) + (-2);
    float _1596 = float(uint(_1574));
    int _1598 = ~_1280;
    int _1600 = _1598 + _1428;
    int _1602 = _1600 + 1;
    float _1604 = as_type<float>(_1594) * _1596;
    int _1606 = ~_1584;
    int _1608 = _1606 + 1;
    int _1610 = _1608 + 1;
    float _1612 = float(uint(_1554));
    int _1614 = _569 * _1602;
    int _1616 = _1614 + _900;
    int _1618 = as_type<int>(_1582) + (-2);
    int _1620 = _1610 * as_type<int>(_1472);
    int _1622 = _1620 + _1592;
    float _1624 = float(uint(_1588));
    float _1626 = trunc(_1604);
    float _1628 = precise::max(_1626, 0.0);
    uint _1630 = uint(_1628);
    int _1632 = ~_1576;
    int _1634 = _1632 + 1;
    int _1636 = _1634 + 1;
    float _1638 = fma(_293, _1316, _1480);
    float _1640 = as_type<float>(_1618) * _1624;
    float _1642 = fma(_293, _1352, _1474);
    bool _1644 = !_884;
    int _1646 = _1644 ? _1616 : (-1);
    int _1648 = _1622 * _1636;
    float _1650 = 1.0 / _1612;
    float _1652 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1654 = _1646 * _1576;
    int _1656 = _1654 + _1648;
    int _1658 = abs(_1554);
    float _1660 = fma(_297, _1356, _1642);
    int _1662 = ~_1424;
    int _1664 = _1662 + 1;
    float _1666 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1668 = _531 + _1666;
    float _1670 = trunc(_1640);
    float _1672 = precise::max(_1670, 0.0);
    uint _1674 = uint(_1672);
    float _1676 = float(uint(_1658));
    float _1678 = fma(_297, _1320, _1638);
    int _1680 = ~_1506;
    int _1682 = _1680 + 1;
    float _1684 = _599 + _601;
    float _1686 = float(uint(_1656));
    float _1688 = _1660 + _1358;
    float _1690 = 1.0 / _1676;
    float _1692 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1694 = as_type<int>(_1650) + (-2);
    int _1696 = _1664 * int(_1630);
    int _1698 = _1696 + _1574;
    float _1700 = _599 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1702 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1702;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1708 = _1706 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1710 = as_type<float>(_1694) * _1686;
    int _1712 = _1682 * int(_1674);
    int _1714 = _1712 + _1588;
    float _1716 = float(uint(_1698));
    float _1718 = -_1652;
    float _1720 = fma(_1700, 2.0, _1718);
    float _1722 = fma(_1586, -2.0, _1692);
    int _1724 = abs(_1656);
    float _1726 = trunc(_1710);
    float _1728 = precise::max(_1726, 0.0);
    uint _1730 = uint(_1728);
    float _1732 = float(uint(_1714));
    float _1734 = as_type<float>(_1594) * _1716;
    float _1736 = _1684 + (-1.0);
    float _1738 = as_type<float>(_1618) * _1732;
    int _1740 = as_type<int>(_1690) + (-2);
    float _1742 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1744 = float(uint(_1724));
    float _1746 = 1.0 / _1704;
    float _1748 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1742);
    int _1750 = ~_1554;
    int _1752 = _1750 + 1;
    float _1754 = as_type<float>(_1740) * _1744;
    float _1756 = fma(_297, _1292, _1488);
    float _1758 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1760 = 1.0 / _1708;
    int _1762 = _1752 * int(_1730);
    int _1764 = _1762 + _1656;
    float _1766 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1768 = _531 + _1766;
    float _1770 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1758);
    int _1772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1774 = _1772 != 0;
    float _1776 = _1678 + _1322;
    float _1778 = float(uint(_1764));
    float _1780 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1722);
    float _1782 = trunc(_1754);
    float _1784 = precise::max(_1782, 0.0);
    uint _1786 = uint(_1784);
    float _1788 = _1668 * _1746;
    int _1790 = ~_1424;
    int _1792 = _1790 + 1;
    float _1794 = as_type<float>(_1694) * _1778;
    int _1796 = ~_1506;
    int _1798 = _1796 + 1;
    float _1800 = trunc(_1734);
    float _1802 = precise::max(_1800, 0.0);
    uint _1804 = uint(_1802);
    float _1806 = _1768 * _1760;
    int _1808 = ~_1658;
    int _1810 = _1808 + 1;
    float _1812 = _599 * 2.0;
    float _1814 = fma(_1736, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1816 = -_211;
    int _1818 = _1188 ? as_type<int>(_1816) : as_type<int>(_211);
    int _1820 = ~_1658;
    int _1822 = _1820 + 1;
    float _1824 = trunc(_1738);
    float _1826 = precise::max(_1824, 0.0);
    uint _1828 = uint(_1826);
    int _1830 = _1810 * int(_1786);
    int _1832 = _1830 + _1724;
    float _1834 = floor(_1812);
    int _1836 = int(_1630) + int(_1804);
    float _1838 = float(uint(_1832));
    float _1840 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1840;
    int _1844 = _1792 * _1836;
    int _1846 = _1844 + _1574;
    float _1848 = as_type<float>(_1740) * _1838;
    int _1850 = int(_1674) + int(_1828);
    float _1852 = trunc(_1794);
    float _1854 = precise::max(_1852, 0.0);
    uint _1856 = uint(_1854);
    bool _1858 = uint(_1846) >= uint(_1424);
    float _1860 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1860;
    int _1864 = _1798 * _1850;
    int _1866 = _1864 + _1588;
    int _1868 = as_type<int>(_1812);
    float _1870 = as_type<float>(_1798);
    float _1872 = _1848;
    float _1874 = _1794;
    if (_1774)
    {
        _1868 = 0;
    }
    int _1876 = _1868;
    float _1878 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1880 = _1878 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    int _1882 = _1876;
    if (!_1774)
    {
        _1882 = 1;
    }
    int _1884 = _1882;
    float _1886 = trunc(_1848);
    float _1888 = precise::max(_1886, 0.0);
    uint _1890 = uint(_1888);
    bool _1892 = _1834 > 0.0;
    float _1894 = fma(_1880, _1806, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _1896 = _1834 >= 0.0;
    bool _1898 = isnan(_1834);
    bool _1900 = _1896 || _1898;
    bool _1902 = isnan(0.0);
    bool _1904 = _1900 || _1902;
    float _1906 = _603 + _601;
    bool _1908 = !_1858;
    int _1910 = _1908 ? 0 : (-1);
    bool _1912 = uint(_1866) >= uint(_1506);
    float _1914 = _1906 + (-1.0);
    int _1916 = ~_1554;
    int _1918 = _1916 + 1;
    float _1920 = _601 * 2.0;
    bool _1922 = !_1912;
    int _1924 = _1922 ? 0 : (-1);
    bool _1926 = _599 > 0.5;
    float _1928 = fma(_1914, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1930 = int(_1730) + int(_1856);
    float _1932 = -_207;
    int _1934 = _1926 ? as_type<int>(_1932) : as_type<int>(_207);
    bool _1936 = _601 > 0.5;
    int _1938 = _1918 * _1930;
    int _1940 = _1938 + _1656;
    int _1942 = int(_1786) + int(_1890);
    float _1944 = fma(_1862, _1788, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1946 = !_1440;
    float _1948 = _1946 ? _207 : as_type<float>(_1934);
    float _1950 = floor(_1920);
    bool _1952 = _1884 != 1;
    float _1954 = -_211;
    int _1956 = _1936 ? as_type<int>(_1954) : as_type<int>(_211);
    bool _1958 = uint(_1940) >= uint(_1554);
    int _1960 = _1822 * _1942;
    int _1962 = _1960 + _1724;
    int _1964 = ~_1836;
    int _1966 = _1964 + _1910;
    int _1968 = _1966 + 1;
    float _1970 = _603 * 2.0;
    bool _1972 = !_1450;
    float _1974 = _1972 ? _211 : as_type<float>(_1956);
    bool _1976 = _603 > 0.5;
    int _1978 = _1424 * _1968;
    int _1980 = _1978 + _1574;
    bool _1982 = !_1958;
    int _1984 = _1982 ? 0 : (-1);
    bool _1986 = uint(_1962) >= uint(_1658);
    float _1988 = -_207;
    int _1990 = _1976 ? as_type<int>(_1988) : as_type<int>(_207);
    float _1992 = floor(_1970);
    bool _1994 = _1424 == 0;
    bool _1996 = !_1454;
    float _1998 = _1996 ? _207 : as_type<float>(_1990);
    bool _2000 = !_1986;
    int _2002 = _2000 ? 0 : (-1);
    bool _2004 = !_1994;
    int _2006 = _2004 ? _1980 : (-1);
    int _2008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2010 = _2008 != 0;
    int _2012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2014 = _2012 != 0;
    int _2016 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2018 = _2016 != 0;
    int _2020 = _1904 ? 0 : 1;
    float _2022 = as_type<float>(_1980);
    if (!_1952)
    {
        _2022 = _601;
    }
    float _2024 = _2022;
    int _2026 = ~_2020;
    int _2028 = _2026 + 1;
    int _2030 = _2028 + 1;
    int _2032 = _2030;
    float _2034 = _2024;
    if (!_1892)
    {
        int _2036 = ~_2020;
        int _2038 = _2036 + 1;
        _2032 = _2038;
    }
    int _2040 = _2032;
    if (!_1952)
    {
        _1870 = _601;
    }
    float _2042 = _1870;
    float _2044 = _2042;
    if (!_1952)
    {
        _1872 = _603;
    }
    float _2046 = _1872;
    float _2048 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1748);
    float _2050 = _2046;
    if (!_1952)
    {
        _1874 = _603;
    }
    float _2052 = _1874;
    float _2054 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1770);
    float _2056 = _2052;
    if (_1952)
    {
        _2034 = _599;
    }
    float _2058 = _2034;
    float _2060 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _2062 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _2060;
    if (_1952)
    {
        _2044 = _599;
    }
    float _2064 = _2044;
    if (_1952)
    {
        _2050 = _601;
    }
    float _2066 = _2050;
    float _2068 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1952)
    {
        _2056 = _601;
    }
    float _2070 = _2056;
    bool _2072 = _1950 > 0.0;
    bool _2074 = _1950 >= 0.0;
    bool _2076 = isnan(_1950);
    bool _2078 = _2074 || _2076;
    bool _2080 = isnan(0.0);
    bool _2082 = _2078 || _2080;
    bool _2084 = _1992 > 0.0;
    bool _2086 = !_2014;
    int _2088 = _2086 ? 0 : 1;
    bool _2090 = _1992 >= 0.0;
    bool _2092 = isnan(_1992);
    bool _2094 = _2090 || _2092;
    bool _2096 = isnan(0.0);
    bool _2098 = _2094 || _2096;
    float _2100 = fma(_2062, _1788, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _2102 = fma(_1842, _1788, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _2104 = _531 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _2106 = isnan(_531);
    bool _2108 = _2104 || _2106;
    bool _2110 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _2112 = _2108 || _2110;
    float _2114 = float(_2112);
    bool _2116 = _531 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _2118 = isnan(_531);
    bool _2120 = _2116 || _2118;
    bool _2122 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _2124 = _2120 || _2122;
    float _2126 = float(_2124);
    bool _2128 = _531 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _2130 = isnan(_531);
    bool _2132 = _2128 || _2130;
    bool _2134 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _2136 = _2132 || _2134;
    float _2138 = float(_2136);
    float _2140 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _2142 = _2140 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    int _2144 = _2098 ? 0 : 1;
    float _2146 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _2148 = _2146 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _2150 = -_2114;
    float _2152 = _2150 + 1.0;
    float _2154 = fma(_2142, _1806, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _2156 = _1756 + _1294;
    int _2158 = ~_2144;
    int _2160 = _2158 + 1;
    int _2162 = _2160 + 1;
    float _2164 = _2138 * _2152;
    int _2166 = _2162;
    if (!_2084)
    {
        int _2168 = ~_2144;
        int _2170 = _2168 + 1;
        _2166 = _2170;
    }
    int _2172 = _2166;
    float _2174 = -_2138;
    float _2176 = _2174 + 1.0;
    bool _2178 = _1424 == 0;
    float _2180 = fma(_2148, _1806, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    int _2182 = _1574 ^ _1424;
    float _2184 = _2126 * _2176;
    float _2186 = -_2126;
    float _2188 = _2186 + 1.0;
    uint _2190 = uint(int(uint(_2182) >> uint(31)));
    float _2192 = _2100 * _2184;
    int _2194 = ~_1924;
    int _2196 = _1850 + _2194;
    int _2198 = _2196 + 1;
    float _2200 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2202 = ~int(_2190);
    int _2204 = _2202 + 1;
    float _2206 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2208 = _2102 * _2184;
    float _2210 = _1944 * _2184;
    int _2212 = ~_1930;
    int _2214 = _2212 + _1984;
    int _2216 = _2214 + 1;
    float _2218 = fma(_2188, (*spvDescriptorSet0.vp_c9)._m0[107].x, _2192);
    int _2220 = _2198 ^ _2204;
    float _2222 = fma(_2188, (*spvDescriptorSet0.vp_c9)._m0[107].y, _2208);
    float _2224 = fma(_2188, (*spvDescriptorSet0.vp_c9)._m0[107].z, _2210);
    float _2226 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2228 = ~_2204;
    int _2230 = _2228 + _2220;
    int _2232 = _2230 + 1;
    int _2234 = _1554 * _2216;
    int _2236 = _2234 + _1656;
    float _2238 = fma(_2154, _2164, _2218);
    bool _2240 = _1554 == 0;
    float _2242 = -_2226;
    float _2244 = fma(_2068, 2.0, _2242);
    bool _2246 = !_2178;
    int _2248 = _2246 ? _2232 : (-1);
    float _2250 = fma(_2114, (*spvDescriptorSet0.vp_c9)._m0[109].x, _2238);
    bool _2252 = _1554 == 0;
    float _2254 = fma(_2180, _2164, _2222);
    bool _2256 = !_2240;
    int _2258 = _2256 ? _2236 : (-1);
    float _2260 = fma(_1894, _2164, _2224);
    int _2262 = _1656 ^ _1554;
    float _2264 = fma(_2114, (*spvDescriptorSet0.vp_c9)._m0[109].y, _2254);
    int _2266 = abs(_2088);
    float _2268 = fma(_2114, (*spvDescriptorSet0.vp_c9)._m0[109].z, _2260);
    int _2270 = ~_2002;
    int _2272 = _1942 + _2270;
    int _2274 = _2272 + 1;
    float _2276 = _2206 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2278 = float(_2040);
    float _2280 = _2066 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2282 = fma(_2070, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2200);
    uint _2284 = uint(int(uint(_2262) >> uint(31)));
    float _2286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2288 = float(_2266);
    float _2290 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2292 = ~int(_2284);
    int _2294 = _2292 + 1;
    float _2296 = -_137;
    float _2298 = fma(_2296, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1720);
    float _2300 = float(_2006);
    float _2302 = _2288 * _2278;
    float _2304 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2306 = _1688 + _2304;
    float _2308 = fma(_2280, -2.0, _2290);
    int _2310 = _2274 ^ _2294;
    float _2312 = fma(_2276, _2300, _2298);
    float _2314 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2316 = _2156 + _2314;
    float _2318 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2320 = ~_2294;
    int _2322 = _2320 + _2310;
    int _2324 = _2322 + 1;
    float _2326 = _2264 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2328 = _1948 + 0.5;
    float _2330 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2318);
    float _2332 = _2250 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2334 = _2268 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2338 = _2326 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2340 = _2332 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2342 = _2334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2344 = fma(_2276, _2328, _2312);
    float _2346 = _2286 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.m_64.x = _2340;
    out.m_64.y = _2338;
    out.m_64.z = _2342;
    float _2348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2350 = float(_2248);
    float _2352 = -_137;
    float _2354 = fma(_2352, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2244);
    float _2356 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2358 = float(_2258);
    float _2360 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2362 = _1776 + _2360;
    bool _2364 = !_2252;
    int _2366 = _2364 ? _2324 : (-1);
    float _2368 = fma(_2064, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2356);
    float _2370 = _2336 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2372 = -_1780;
    float _2374 = fma(_2346, _2350, _2372);
    float _2376 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2378 = _1974 + (-0.5);
    float _2380 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2368);
    float _2382 = fma(_2370, _2358, _2354);
    float _2384 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2376);
    float _2386 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2388 = log2(_2386);
    float _2390 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2392 = -_2346;
    float _2394 = fma(_2392, _2378, _2374);
    float _2396 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2384);
    float _2398 = -_2380;
    float _2400 = _2398 + 1.0;
    float _2402 = float(_2366);
    float _2404 = _2348 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2406 = -_2396;
    float _2408 = _2406 + 1.0;
    bool _2410 = !_1446;
    float _2412 = _2410 ? _211 : as_type<float>(_1818);
    float _2414 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2308);
    float _2416 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2390);
    float _2418 = -_2408;
    float _2420 = fma(_1948, _2418, _2344);
    float _2422 = _2306 * _2306;
    float _2424 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2330);
    float _2426 = _1998 + 0.5;
    float _2428 = -_2414;
    float _2430 = fma(_2404, _2402, _2428);
    float _2432 = fma(_2316, _2316, _2422);
    float _2434 = _2412 + (-0.5);
    float _2436 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2416);
    float _2438 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2282);
    float _2440 = fma(_2362, _2362, _2432);
    bool _2442 = _2424 >= 0.0;
    float _2444 = fma(_2370, _2426, _2382);
    float _2446 = -_2404;
    float _2448 = fma(_2446, _2434, _2430);
    float _2450 = -_2436;
    float _2452 = _2450 + 1.0;
    float _2454 = -_2438;
    float _2456 = _2454 + 1.0;
    bool _2458 = !_2010;
    int _2460 = _2458 ? 0 : 1;
    float _2462 = _2388 * _137;
    float _2464 = -_2400;
    float _2466 = fma(_1998, _2464, _2444);
    float _2468 = fma(_2412, _2456, _2448);
    float _2470 = fma(_1974, _2452, _2394);
    float _2472 = rsqrt(_2440);
    int _2474 = abs(_2460);
    float _2476 = in.m_66.x;
    float _2478 = in.m_66.y;
    float _2480 = in.m_66.z;
    float _2482 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2484 = 1.0 + _2482;
    float _2486 = _2434;
    if (_2442)
    {
        _2486 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2488 = _2486;
    out.m_68.x = _2420;
    out.m_68.y = _2470;
    out.m_68.z = _2466;
    out.m_68.w = _2468;
    float _2490 = exp2(_2462);
    bool _2492 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2494 = isnan(0.0);
    bool _2496 = _2492 || _2494;
    bool _2498 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2500 = _2496 || _2498;
    int _2502 = as_type<int>(_2488);
    if (_2442)
    {
        float _2504 = _2488 * 5.0;
        _2502 = as_type<int>(_2504);
    }
    int _2506 = _2502;
    if (_2442)
    {
        out.m_47.x = 0.0;
    }
    bool _2508 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2510 = isnan(1.0);
    bool _2512 = _2508 || _2510;
    bool _2514 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2516 = _2512 || _2514;
    bool _2518 = !_2018;
    int _2520 = _2518 ? 0 : 1;
    if (_2442)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7409 = as_type<float>(_2506);
        out.gl_Position.z = _7409;
    }
    float _2522 = 1.0 / _2484;
    float _2524 = _2306 * _2472;
    float _2526 = _2316 * _2472;
    float _2528 = -_2490;
    float _2530 = _2528 + 1.0;
    float _2532 = float(_2474);
    float _2534 = float(_2172);
    if (_2442)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2536 = -_2524;
    float _2538 = fma(_2536, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1688);
    float _2540 = _2532 * _2534;
    float _2542 = _2362 * _2472;
    float _2544 = -_2526;
    float _2546 = fma(_2544, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2156);
    float _2548 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2550 = _2538 + _2548;
    float _2552 = _2500 ? _2530 : 0.0;
    float _2554 = _2540 * (-2.0);
    float _2556 = -_2542;
    float _2558 = fma(_2556, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1776);
    float _2560 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2562 = _2546 + _2560;
    float _2564 = _2550 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (_2516)
    {
        float _2566 = _2552 * _2522;
        _139 = _2566;
    }
    float _2568 = _139;
    float _2570 = _599 + (-0.5);
    float _2572 = fma(_2554, _2476, _2476);
    float _2574 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2576 = _2558 + _2574;
    float _2578 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2564);
    float _2580 = fma(_1814, _2554, _1814);
    float _2582 = fma(_2570, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2572);
    float _2584 = _2302 * (-2.0);
    float _2586 = fma(_2576, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2578);
    int _2588 = _2082 ? 0 : 1;
    float _2590 = fma(_2580, _2568, _2582);
    float _2592 = _601 + (-0.5);
    float _2594 = fma(_2584, _2478, _2478);
    bool _2596 = _2586 >= 0.0;
    float _2598 = rsqrt(_2048);
    int _2600 = abs(_2520);
    float _2602 = fma(_2592, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2594);
    int _2604 = ~_2588;
    int _2606 = _2604 + 1;
    int _2608 = _2606 + 1;
    float _2610 = fma(_1928, _2584, _1928);
    int _2612 = _2608;
    float _2614 = _2594;
    float _2616 = _2576;
    if (!_2072)
    {
        int _2618 = ~_2588;
        int _2620 = _2618 + 1;
        _2612 = _2620;
    }
    int _2622 = _2612;
    float _2624 = rsqrt(_2054);
    float _2626 = float(_2622);
    float _2628 = _2590 * 0.15915493667125701904296875;
    float _2630 = float(_2600);
    if (_2596)
    {
        _2614 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2632 = _2614;
    int _2634 = as_type<int>(_2632);
    if (_2596)
    {
        out.m_47.x = 0.0;
    }
    float _2636 = fma(_2610, _2568, _2602);
    float _2638 = _2630 * _2626;
    float _2640 = _2628 * 6.283185482025146484375;
    float _2642 = sin(_2640);
    if (_2596)
    {
        float _2644 = _2632 * 5.0;
        _2634 = as_type<int>(_2644);
    }
    int _2646 = _2634;
    if (_2596)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7614 = as_type<float>(_2646);
        out.gl_Position.z = _7614;
    }
    float _2648 = _2628 * 6.283185482025146484375;
    float _2650 = cos(_2648);
    if (_2596)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2652 = -_1688;
    float _2654 = _2652 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2656 = _603 + _599;
    float _2658 = -_2156;
    float _2660 = _2658 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2662 = _2636 * 0.15915493667125701904296875;
    float _2664 = _2654 * _2654;
    float _2666 = _2656 + (-1.0);
    float _2668 = -_1776;
    float _2670 = _2668 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2672 = _2638 * (-2.0);
    float _2674 = fma(_2660, _2660, _2664);
    float _2676 = fma(_2666, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2678 = _603 + (-0.5);
    float _2680 = fma(_2672, _2480, _2480);
    float _2682 = fma(_2670, _2670, _2674);
    float _2684 = -_2524;
    float _2686 = fma(_2684, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2306);
    float _2688 = fma(_2676, _2672, _2676);
    float _2690 = fma(_2678, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2680);
    float _2692 = -_2526;
    float _2694 = fma(_2692, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2316);
    float _2696 = _2686 * _2686;
    float _2698 = rsqrt(_2682);
    float _2700 = fma(_2688, _2568, _2690);
    float _2702 = -_2542;
    float _2704 = fma(_2702, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2362);
    float _2706 = fma(_2694, _2694, _2696);
    float _2708 = _207 * _2598;
    float _2710 = _2700 * 0.15915493667125701904296875;
    float _2712 = _499 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2714 = fma(_2704, _2704, _2706);
    float _2716 = _2662 * 6.283185482025146484375;
    float _2718 = sin(_2716);
    bool _2720 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2722 = isnan(0.5);
    bool _2724 = _2720 || _2722;
    bool _2726 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2728 = _2724 || _2726;
    float _2730 = _2660 * _2698;
    float _2732 = _2670 * _2698;
    float _2734 = _2654 * _2698;
    float _2736 = _2662 * 6.283185482025146484375;
    float _2738 = cos(_2736);
    float _2740 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2742 = _2730 * _2740;
    float _2744 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2746 = _2732 * _2744;
    float _2748 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2750 = _2734 * _2748;
    float _2752 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2754 = -_2742;
    float _2756 = fma(_2732, _2752, _2754);
    float _2758 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2760 = -_2746;
    float _2762 = fma(_2734, _2758, _2760);
    float _2764 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2766 = -_2750;
    float _2768 = fma(_2730, _2764, _2766);
    float _2770 = sqrt(_2714);
    float _2772 = _2756 * _2756;
    float _2774 = _2642 * _2718;
    float _2776 = fma(_2762, _2762, _2772);
    float _2778 = _211 * _2624;
    float _2780 = _2710 * 6.283185482025146484375;
    float _2782 = sin(_2780);
    float _2784 = fma(_2768, _2768, _2776);
    float _2786 = _2650 * _2738;
    float _2788 = _2710 * 6.283185482025146484375;
    float _2790 = cos(_2788);
    float _2792 = _2472 * _2770;
    float _2794 = _497 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2796 = _2642 * _2738;
    float _2798 = rsqrt(_2784);
    float _2800 = fma(_2782, _2786, _2774);
    float _2802 = fma(_2782, _2774, _2786);
    float _2804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2778);
    float _2806 = _2792 * _2712;
    float _2808 = _2650 * _2718;
    float _2810 = _2650 * _2790;
    float _2812 = _2738 * _2790;
    float _2814 = _2642 * _2790;
    float _2816 = _2718 * _2790;
    float _2818 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2708);
    float _2820 = _2792 * _2794;
    float _2822 = _2804 * _2806;
    float _2824 = -_2808;
    float _2826 = fma(_2782, _2796, _2824);
    float _2828 = _2762 * _2798;
    float _2830 = _2818 * _2820;
    float _2832 = _2810 * _2822;
    float _2834 = -_2796;
    float _2836 = fma(_2782, _2808, _2834);
    float _2838 = -_2822;
    float _2840 = _2782 * _2838;
    float _2842 = _2756 * _2798;
    float _2844 = _2792 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2846 = _2844 * 0.5;
    float _2848 = fma(_2800, _2830, _2832);
    float _2850 = _2734 * _2828;
    float _2852 = _2814 * _2822;
    float _2854 = fma(_2812, _2830, _2840);
    float _2856 = _2768 * _2798;
    float _2858 = fma(_2836, _2846, _2848);
    float _2860 = _2732 * _2842;
    float _2862 = -_2850;
    float _2864 = fma(_2730, _2842, _2862);
    float _2866 = fma(_2826, _2830, _2852);
    float _2868 = fma(_2816, _2846, _2854);
    float _2870 = -_2860;
    float _2872 = fma(_2734, _2856, _2870);
    float _2874 = _2864 * _2858;
    float _2876 = fma(_2802, _2846, _2866);
    float _2878 = _2730 * _2856;
    float _2880 = _2872 * _2858;
    float _2882 = fma(_2856, _2868, _2874);
    float _2884 = -_2878;
    float _2886 = fma(_2732, _2828, _2884);
    float _2888 = fma(_2828, _2868, _2880);
    float _2890 = fma(_2732, _2876, _2882);
    float _2892 = _2886 * _2858;
    float _2894 = fma(_2730, _2876, _2888);
    float _2896 = _1776 + _2890;
    float _2898 = _2156 + _2894;
    float _2900 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2902 = _2896 + _2900;
    float _2904 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2906 = _2898 + _2904;
    float _2908 = _2902 * _2902;
    float _2910 = fma(_2906, _2906, _2908);
    float _2912 = fma(_2842, _2868, _2892);
    float _2914 = sqrt(_2910);
    float _2916 = fma(_2734, _2876, _2912);
    float _2918 = _1688 + _2916;
    bool _2920 = _2914 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2922 = _2892;
    float _2924 = _2912;
    float _2926 = _2876;
    if (!_2920)
    {
        _2922 = _2898;
    }
    float _2928 = _2922;
    float _2930 = _2928;
    if (!_2920)
    {
        _2924 = _2896;
    }
    float _2932 = _2924;
    float _2934 = _2932;
    if (!_2920)
    {
        _2926 = _2918;
    }
    float _2936 = _2926;
    bool _2938 = !_2920;
    float _2940 = _2936;
    if (!_2938)
    {
        float _2942 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2944 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2946 = _2914 + _2944;
        float _2948 = rsqrt(_2910);
        float _2950 = _2946 * _2942;
        float _2952 = _2918 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2954 = _2950 * 0.15915493667125701904296875;
        float _2956 = _2954 * 6.283185482025146484375;
        float _2958 = cos(_2956);
        float _2960 = _2954 * 6.283185482025146484375;
        float _2962 = sin(_2960);
        float _2964 = _2958 + (-1.0);
        float _2966 = _2964 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2968 = fma(_2962, _2952, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2970 = fma(_2918, _2958, _2966);
        float _2972 = _2948 * _2968;
        float _2974 = fma(_2906, _2972, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2976 = fma(_2902, _2972, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2930 = _2974;
        _2940 = _2970;
        _2934 = _2976;
    }
    float _2978 = _2930;
    float _2980 = _2940;
    float _2982 = _2934;
    float _2984 = -_2526;
    float _2986 = fma(_2984, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2978);
    float _2988 = -_2524;
    float _2990 = fma(_2988, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2980);
    float _2992 = -_2542;
    float _2994 = fma(_2992, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2982);
    float _2996 = _2990;
    float _2998 = _2986;
    float _3000 = _2994;
    if (!_2728)
    {
        float _3002 = _2550 * _2550;
        float _3004 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3006 = -_1776;
        float _3008 = _3006 + _2982;
        float _3010 = fma(_2562, _2562, _3002);
        float _3012 = fma(_2576, _2576, _3010);
        float _3014 = 1.0 / _2792;
        float _3016 = sqrt(_3012);
        float _3018 = precise::min(_3016, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3020 = _3018 * _3004;
        float _3022 = -_2156;
        float _3024 = _3022 + _2978;
        float _3026 = _3020 * _3014;
        float _3028 = -_1688;
        float _3030 = _3028 + _2980;
        float _3032 = fma(_3024, _3026, _2546);
        float _3034 = fma(_3030, _3026, _2538);
        float _3036 = fma(_3008, _3026, _2558);
        _2996 = _3034;
        _2998 = _3032;
        _3000 = _3036;
    }
    float _3038 = _2996;
    float _3040 = _2998;
    float _3042 = _3000;
    float _3044 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3046 = _3038 + _3044;
    float _3048 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3050 = _3040 + _3048;
    float _3052 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3054 = _3042 + _3052;
    float _3056 = _3046 * _3046;
    float _3058 = fma(_3050, _3050, _3056);
    float _3060 = fma(_3054, _3054, _3058);
    float _3062 = rsqrt(_3060);
    float _3064 = sqrt(_3060);
    float _3066 = _3062 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3068 = _3050 * _3066;
    float _3070 = _3054 * _3066;
    float _3072 = _3068 * _3068;
    float _3074 = _3070 * _3070;
    float _3076 = _3072 + _3074;
    float _3078 = sqrt(_3076);
    bool _3080 = _3078 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3082 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3084 = _3078 + _3082;
    float _3086 = _3054;
    float _3088 = _3076;
    float _3090 = _3084;
    float _3092 = _3066;
    if (_3080)
    {
        float _3094 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3086 = _3094;
    }
    float _3096 = _3086;
    if (_3080)
    {
        float _3098 = rsqrt(_3076);
        _3088 = _3098;
    }
    float _3100 = _3088;
    if (_3080)
    {
        float _3102 = _3084 * _3096;
        _3090 = _3102;
    }
    float _3104 = _3090;
    if (_3080)
    {
        float _3106 = _3104 * 0.15915493667125701904296875;
        _2616 = _3106;
    }
    float _3108 = _2616;
    float _3110 = _3056;
    float _3112 = _3108;
    if (_3080)
    {
        float _3114 = _3108 * 6.283185482025146484375;
        float _3116 = sin(_3114);
        _3110 = _3116;
    }
    float _3118 = _3110;
    float _3120 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3122 = precise::max(0.0, _3120);
    float _3124 = _3062;
    float _3126 = _3122;
    float _3128 = _3120;
    if (_3080)
    {
        float _3130 = _3108 * 6.283185482025146484375;
        float _3132 = cos(_3130);
        _3124 = _3132;
    }
    float _3134 = _3124;
    float _3136 = -_3066;
    float _3138 = -_3122;
    float _3140 = fma(_3046, _3136, _3138);
    float _3142 = _3140;
    if (!_3080)
    {
        _3126 = _3068;
    }
    float _3144 = _3126;
    float _3146 = _3144;
    if (_3080)
    {
        float _3148 = _3140 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3128 = _3148;
    }
    float _3150 = _3128;
    float _3152 = _3118;
    float _3154 = _3150;
    if (_3080)
    {
        float _3156 = fma(_3118, _3150, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3152 = _3156;
    }
    float _3158 = _3152;
    float _3160 = _3158;
    float _3162 = _3134;
    if (_3080)
    {
        float _3164 = _3134 + (-1.0);
        _3154 = _3164;
    }
    float _3166 = _3154;
    float _3168 = _3166;
    if (_3080)
    {
        float _3170 = _3100 * _3158;
        _3092 = _3170;
    }
    float _3172 = _3092;
    if (!_3080)
    {
        _3160 = _3072;
    }
    float _3174 = _3160;
    float _3176 = _3038 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3178 = _3174;
    if (_3080)
    {
        float _3180 = _3166 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3112 = _3180;
    }
    float _3182 = _3112;
    if (_3080)
    {
        float _3184 = _3068 * _3172;
        _3146 = _3184;
    }
    float _3186 = _3146;
    if (!_3080)
    {
        _3168 = _3070;
    }
    float _3188 = _3168;
    float _3190 = _3188;
    if (_3080)
    {
        float _3192 = _3070 * _3172;
        _3190 = _3192;
    }
    float _3194 = _3190;
    if (_3080)
    {
        float _3196 = fma(_3140, _3134, _3182);
        _3142 = _3196;
    }
    float _3198 = _3142;
    if (_3080)
    {
        float _3200 = _3186 * _3186;
        _3178 = _3200;
    }
    float _3202 = _3178;
    if (!_3080)
    {
        _3162 = _3074;
    }
    float _3204 = _3162;
    float _3206 = _3204;
    if (_3080)
    {
        float _3208 = _3194 * _3194;
        _3206 = _3208;
    }
    float _3210 = _3206;
    float _3212 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3176);
    float _3214 = fma(_3198, _3198, _3202);
    float _3216 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3218 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3212);
    float _3220 = _3214 + _3210;
    float _3222 = _3038 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3224 = _3038 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3226 = _3218 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3228 = rsqrt(_3220);
    float _3230 = _3038 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3232 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3222);
    float _3234 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3236 = fma(_3064, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3234);
    float _3238 = precise::clamp(_3236, 0.0, 1.0);
    float _3240 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3224);
    float _3242 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3230);
    float _3244 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3232);
    float _3246 = -_3238;
    float _3248 = _3246 + 1.0;
    float _3250 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3240);
    float _3252 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3242);
    float _3254 = _3244 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3256 = abs(_3248);
    float _3258 = log2(_3256);
    float _3260 = _3250 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3262 = _3252 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3264 = _3254 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3266 = _3226 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3268 = _3228 * _3186;
    float _3270 = _3228 * _3198;
    float _3272 = fma(_3260, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3264);
    float _3274 = _3228 * _3194;
    float _3276 = _3268 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3278 = -_3266;
    float _3280 = fma(_3278, _3216, 1.0);
    float _3282 = fma(_3226, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3272);
    float _3284 = _3254 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3286 = -_3276;
    float _3288 = fma(_3270, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3286);
    float _3290 = log2(_3280);
    float _3292 = fma(_3262, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3282);
    float _3294 = _3258 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3296 = -_3274;
    float _3298 = fma(_3296, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3288);
    float _3300 = _3254 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3302 = fma(_3260, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3284);
    float _3304 = fma(_3298, -0.5, 0.5);
    float _3306 = 1.0 / _3292;
    float _3308 = fma(_3260, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3300);
    float _3310 = fma(_3298, 0.5, 0.5);
    float _3312 = fma(_3226, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3302);
    float _3314 = _3270 + 1.0;
    float _3316 = fma(_3226, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3308);
    float _3318 = fma(_3310, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3320 = fma(_3262, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3312);
    float _3322 = sqrt(_3304);
    float _3324 = fma(_3262, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3316);
    float _3326 = fma(_3310, _3318, -0.212114393711090087890625);
    float _3328 = _3290 * 0.693147182464599609375;
    float _3330 = fma(_3310, _3326, 1.570728778839111328125);
    float _3332 = _3328 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3334 = exp2(_3294);
    float _3336 = _3324 * _3306;
    float _3338 = fma(_3336, 0.5, 0.5);
    float _3340 = _3322 * 0.636619746685028076171875;
    float _3342 = _3320 * _3306;
    float _3344 = -_3330;
    float _3346 = fma(_3340, _3344, 1.0);
    float _3348 = fma(_3342, -0.5, 0.5);
    float _3350 = -_3270;
    float _3352 = fma(_3334, _3314, _3350);
    float3 _8745 = float3(_3338, _3348, _3332);
    float _3354 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8745, float3(0.0), isnan(_8745)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8745, float3(0.0), isnan(_8745)), level(0.0)).x;
    float _3356 = fma(_3352, 0.5, 0.5);
    float3 _8758 = float3(_3338, _3348, _3332);
    float4 _3359 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8758, float3(0.0), isnan(_8758)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8758, float3(0.0), isnan(_8758)), level(0.0)).xyzw;
    float _3361 = _3359.x;
    float _3363 = _3359.y;
    float _3365 = _3359.z;
    float _3367 = _3359.w;
    float2 _8775 = float2(_3346, _3356);
    float3 _3371 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8775, float2(0.0), isnan(_8775)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8775, float2(0.0), isnan(_8775)), level(0.0)).xyz;
    float _3373 = _3371.x;
    float _3375 = _3371.y;
    float _3377 = _3371.z;
    float _3379 = _3258 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3381 = _2800 * _2872;
    float _3383 = _2800 * _2886;
    float _3385 = _2800 * _2864;
    float _3387 = _2810 * _2872;
    float _3389 = _2810 * _2886;
    float _3391 = exp2(_3379);
    float _3393 = _2810 * _2864;
    float _3395 = _2778 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3397 = _2836 * _2872;
    float _3399 = _2836 * _2886;
    float _3401 = _2836 * _2864;
    float _3403 = fma(_3395, _3395, 1.0);
    float _3405 = fma(_2812, _2856, _3385);
    float _3407 = fma(_2812, _2842, _3383);
    float _3409 = -_2782;
    float _3411 = fma(_3409, _2828, _3387);
    float _3413 = -_2782;
    float _3415 = fma(_3413, _2842, _3389);
    float _3417 = -_2782;
    float _3419 = fma(_3417, _2856, _3393);
    float _3421 = rsqrt(_3403);
    float _3423 = fma(_2816, _2828, _3397);
    float _3425 = fma(_2812, _2828, _3381);
    float _3427 = fma(_2816, _2842, _3399);
    float _3429 = fma(_2814, _2730, _3411);
    float _3431 = fma(_2814, _2734, _3415);
    float _3433 = fma(_2814, _2732, _3419);
    float _3435 = fma(_2802, _2730, _3423);
    float _3437 = fma(_2826, _2730, _3425);
    float _3439 = fma(_2826, _2734, _3407);
    float _3441 = fma(_2826, _2732, _3405);
    float _3443 = _3254 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3445 = fma(_2816, _2856, _3401);
    float _3447 = fma(_2802, _2734, _3427);
    float _3449 = _2708 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3451 = _3395 * _3429;
    float _3453 = fma(_3260, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3443);
    float _3455 = -_3391;
    float _3457 = _3455 + 1.0;
    float _3459 = fma(_2802, _2732, _3445);
    float _3461 = fma(_3449, _3437, _3451);
    float _3463 = _3395 * _3421;
    float _3465 = _3395 * _3431;
    float _3467 = fma(_3226, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3453);
    float _3469 = _3457 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.x = _3437;
    out.m_70.y = _3439;
    out.m_70.z = _3441;
    float _3471 = fma(_3449, _3439, _3465);
    float _3473 = _3395 * _3433;
    float _3475 = fma(_3262, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3467);
    float _3477 = -_3435;
    float _3479 = _3463 * _3477;
    out.m_72.x = _3040;
    out.m_72.y = _3038;
    out.m_72.z = _3042;
    bool _3481 = _3064 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3483 = isnan(_3064);
    bool _3485 = _3481 || _3483;
    bool _3487 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3489 = _3485 || _3487;
    float _3491 = fma(_3421, _3429, _3479);
    float _3493 = -_3447;
    float _3495 = _3463 * _3493;
    float _3497 = fma(_3449, _3441, _3473);
    float _3499 = -_3459;
    float _3501 = _3463 * _3499;
    float _3503 = fma(_3421, _3431, _3495);
    float _3505 = _3475 + _3292;
    float _3507 = fma(_3421, _3433, _3501);
    float _3509 = _3447 + _3471;
    float _3511 = _3459 + _3497;
    float _3513 = _3505 * 0.5;
    float _3515 = _3435 + _3461;
    out.m_74.x = _3491;
    out.m_74.y = _3503;
    out.m_74.z = _3507;
    out.m_76.z = _3513;
    out.m_76.w = _3292;
    out.m_78.x = _3515;
    out.m_78.y = _3509;
    out.m_78.z = _3511;
    out.gl_Position.x = _3324;
    out.gl_Position.y = _3320;
    out.gl_Position.z = _3475;
    out.gl_Position.w = _3292;
    float _3517 = _3292;
    float _3519 = _3475;
    float _3521 = _3320;
    float _3523 = _3324;
    if (!_3489)
    {
        _3517 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3525 = _3517;
    float _3527 = _3525;
    float _3529 = _3525;
    if (!_3489)
    {
        _3519 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3531 = _3519;
    float _3533 = _3531;
    float _3535 = _3531;
    if (!_3489)
    {
        _3521 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3537 = _3521;
    float _3539 = _3537;
    float _3541 = _3537;
    if (!_3489)
    {
        _3523 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3543 = _3523;
    float _3545 = _3469 * _3354;
    float _3547 = -_3469;
    float _3549 = _3547 + 1.0;
    float _3551 = _3367 * _3545;
    float _3553 = _3367 * _3549;
    float _3555 = _3377 * _3545;
    float _3557 = fma(_3373, _3551, _3361);
    float _3559 = fma(_3375, _3551, _3363);
    float _3561 = _3361;
    float _3563 = _3545;
    float _3565 = _3543;
    float _3567 = _3543;
    if (!_3489)
    {
        _3561 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3569 = _3561;
    float _3571 = fma(_3367, _3555, _3365);
    float _3573 = _3569;
    float _3575 = _3569;
    if (!_3489)
    {
        _3563 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3577 = _3563;
    out.m_80.x = _3557;
    out.m_80.y = _3559;
    out.m_80.z = _3571;
    out.m_80.w = _3553;
    bool _3579 = !_3489;
    float _3581 = _3577;
    float _3583 = _3577;
    if (!_3579)
    {
        bool _3585 = _3064 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3587 = isnan(_3064);
        bool _3589 = _3585 || _3587;
        bool _3591 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3593 = _3589 || _3591;
        if (!_3593)
        {
            float _3595 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3597 = _3064 + _3595;
            float _3599 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3601 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3599;
            float _3603 = 1.0 / _3601;
            float _3605 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3607 = _3605 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3609 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3611 = _3609 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3613 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3615 = _3613 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3617 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3619 = _3617 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3621 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3623 = _3621 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3625 = _3597 * _3603;
            float _3627 = precise::clamp(_3625, 0.0, 1.0);
            float _3629 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3631 = _3629 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3633 = fma(_3627, _3607, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3635 = fma(_3627, _3631, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3637 = fma(_3627, _3611, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3639 = fma(_3627, _3615, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3641 = fma(_3627, _3619, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3643 = fma(_3627, _3623, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3529 = _3635;
            _3567 = _3641;
            _3575 = _3633;
            _3541 = _3639;
            _3535 = _3637;
            _3583 = _3643;
            _3645 = true;
        }
        else
        {
            bool _3647 = _3064 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3649 = isnan(_3064);
            bool _3651 = _3647 || _3649;
            bool _3653 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3655 = _3651 || _3653;
            if (!_3655)
            {
                _3573 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3657 = _3573;
            _3575 = _3657;
            if (!_3655)
            {
                _3527 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3659 = _3527;
            _3529 = _3659;
            if (!_3655)
            {
                _3533 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3661 = _3533;
            _3535 = _3661;
            if (!_3655)
            {
                _3539 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3663 = _3539;
            _3541 = _3663;
            if (!_3655)
            {
                _3565 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3665 = _3565;
            _3567 = _3665;
            if (!_3655)
            {
                _3581 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3667 = _3581;
            bool _3669 = !_3655;
            _3583 = _3667;
            if (!_3669)
            {
                bool _3671 = _3064 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3673 = isnan(_3064);
                bool _3675 = _3671 || _3673;
                bool _3677 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3679 = _3675 || _3677;
                if (!_3679)
                {
                    float _3681 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3683 = _3064 + _3681;
                    float _3685 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3687 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3685;
                    float _3689 = 1.0 / _3687;
                    float _3691 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3693 = _3691 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3695 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3697 = _3695 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3699 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3701 = _3699 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3703 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3705 = _3703 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3707 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3709 = _3707 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3711 = _3683 * _3689;
                    float _3713 = precise::clamp(_3711, 0.0, 1.0);
                    float _3715 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3717 = _3715 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3719 = fma(_3713, _3693, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3721 = fma(_3713, _3717, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3723 = fma(_3713, _3697, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3725 = fma(_3713, _3701, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3727 = fma(_3713, _3705, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3729 = fma(_3713, _3709, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3529 = _3721;
                    _3567 = _3727;
                    _3575 = _3719;
                    _3541 = _3725;
                    _3535 = _3723;
                    _3583 = _3729;
                    _3645 = true;
                }
                else
                {
                    _3529 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3567 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3575 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3541 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3535 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3583 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3645 = false;
    float _3731 = _3529;
    float _3733 = _3567;
    float _3735 = _3575;
    float _3737 = _3541;
    float _3739 = _3535;
    float _3741 = _3583;
    float _3743 = fma(_3509, -0.5, 0.5);
    float _3745 = precise::clamp(_3743, 0.0, 1.0);
    float _3747 = -_3731;
    float _3749 = _3747 + _3733;
    float _3751 = -_3735;
    float _3753 = _3751 + _3737;
    float _3755 = -_3739;
    float _3757 = _3755 + _3741;
    bool _3759 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3761 = fma(_3745, _3749, _3731);
    float _3763 = fma(_3745, _3753, _3735);
    float _3765 = fma(_3745, _3757, _3739);
    float _3767 = _3761 * 0.586610972881317138671875;
    out.m_82.x = 0.0;
    float _3769 = fma(_3763, 0.298911988735198974609375, _3767);
    float _3771 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3773 = fma(_3765, 0.114477999508380889892578125, _3769);
    out.m_47.x = _3771;
    float _3775 = -_3773;
    float _3777 = _3763 + _3775;
    float _3779 = -_3773;
    float _3781 = _3761 + _3779;
    float _3783 = -_3773;
    float _3785 = _3765 + _3783;
    float _3787 = fma(_3777, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3773);
    float _3789 = fma(_3781, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3773);
    float _3791 = fma(_3785, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3773);
    out.m_84.x = _3787;
    out.m_84.y = _3789;
    out.m_84.z = _3791;
    if (!_3759)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3793 = -_3038;
    float _3795 = _3793 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3797 = -_3040;
    float _3799 = _3797 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3801 = -_3042;
    float _3803 = _3801 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3805 = _3795 * _3795;
    float _3807 = fma(_3799, _3799, _3805);
    float _3809 = fma(_3803, _3803, _3807);
    float _3811 = sqrt(_3809);
    float _3813 = rsqrt(_3809);
    float _3815 = -_3811;
    float _3817 = _3815 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3819 = _3817 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3821 = precise::clamp(_3819, 0.0, 1.0);
    float _3823 = _3799 * _3813;
    float _3825 = _3795 * _3813;
    float _3827 = abs(_3821);
    float _3829 = log2(_3827);
    float _3831 = _3803 * _3813;
    float _3833 = _3823 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3835 = _3509 * _3825;
    float _3837 = -_3825;
    float _3839 = -_3833;
    float _3841 = fma(_3837, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3839);
    float _3843 = fma(_3515, _3823, _3835);
    float _3845 = -_3831;
    float _3847 = fma(_3845, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3841);
    float _3849 = fma(_3511, _3831, _3843);
    float _3851 = precise::clamp(_3849, 0.0, 1.0);
    float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3855 = _3847 + _3853;
    float _3857 = _3829 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3859 = _3855 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3861 = precise::clamp(_3859, 0.0, 1.0);
    float _3863 = exp2(_3857);
    float _3865 = _3863 * _3861;
    float _3867 = _3851 * _3865;
    float _3869 = _3867 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3871 = _3867 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3873 = _3867 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_82.x = _3869;
    out.m_82.y = _3871;
    out.m_82.z = _3873;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

