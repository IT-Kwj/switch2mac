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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
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
    float4 m_74 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_72 [[user(locn5)]];
    float4 m_76 [[user(locn6)]];
    float4 m_70 [[user(locn7)]];
    float4 m_68 [[user(locn8)]];
    float4 m_62 [[user(locn9)]];
    float4 m_60 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    bool _293 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_44.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_47.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1555 = as_type<float>(_111);
        out.gl_Position.z = _1555;
    }
    if (!_99)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _115 = in.m_49.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = _129;
    if (_125)
    {
        float _133 = float(_95);
        _105 = _133;
    }
    float _135 = _105;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_47.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1625 = as_type<float>(_149);
        out.gl_Position.z = _1625;
    }
    if (_141)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _151 = in.m_51.w;
    float _153 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = in.m_49.x;
    float _167 = in.m_49.y;
    float _169 = in.m_49.z;
    float _171 = in.m_44.x;
    float _173 = in.m_44.y;
    float _175 = in.m_44.z;
    float _177 = 0.0;
    float _179 = _153;
    if (!_163)
    {
        float _181 = _153 * _153;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    float _187 = _185;
    if (!_163)
    {
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _189;
    }
    float _191 = _187;
    bool _193 = !_163;
    float _195 = _191;
    if (!_193)
    {
        float _197 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = log2(_197);
        float _201 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _203 = _201 + 1.0;
        float _205 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = _153 * _199;
        float _209 = 1.0 / _203;
        float _211 = _205 * 0.693147182464599609375;
        float _213 = exp2(_207);
        float _215 = 1.0 / _211;
        float _217 = _213 + (-1.0);
        float _219 = -_217;
        float _221 = fma(_219, _215, _153);
        float _223 = _221 * _209;
        float _225 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _225;
    }
    float _227 = _195;
    bool _229 = !_163;
    if (!_229)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = 1.0 / _237;
        float _241 = _153 * _233;
        float _243 = exp2(_241);
        float _245 = -_243;
        float _247 = _245 + 1.0;
        float _249 = _247 * _239;
        _179 = _249;
    }
    float _251 = _179;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _255 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _257 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _259 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _261 = fma(_251, _165, _255);
    float _263 = fma(_251, _167, _257);
    float _265 = fma(_251, _169, _259);
    float _267 = fma(_261, _151, _171);
    float _269 = fma(_263, _151, _173);
    float _271 = fma(_265, _151, _175);
    bool _273 = !_253;
    float _291;
    if (!_273)
    {
        float _275 = in.m_53.x;
        float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _279 = _275 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _283 = _281 * _277;
        float _285 = floor(_283);
        float _287 = -_285;
        float _289 = _283 + _287;
        _291 = _289;
        _293 = true;
    }
    else
    {
        float _295 = float(_95);
        float _297 = 1.0 / _295;
        float _299 = _129 * _297;
        _291 = _299;
    }
    _293 = false;
    float _301 = _291;
    float _303 = in.m_53.z;
    float _305 = _269 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _307 = _269 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _309 = _269 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _311 = in.m_53.x;
    float _313 = in.m_53.y;
    float _315 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].x, _305);
    float _317 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].x, _307);
    float _319 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[5].z, _315);
    float _321 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].x, _309);
    float _323 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _325 = log2(_323);
    int _327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _329 = _327 != 0;
    int _331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _333 = _331 != 0;
    int _335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _337 = _335 != 0;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _339;
    float _343 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[4].z, _317);
    float _345 = _319 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _349 = _301 + _347;
    bool _351 = !_329;
    int _353 = _351 ? 0 : 1;
    float _355 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[6].z, _321);
    float _357 = 1.0 / _341;
    bool _359 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _361 = isnan(_301);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = _343 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _373 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _375 = isnan(_301);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = _355 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _387 = _303 * 2.0;
    float _389 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _391 = _371 + _389;
    float _393 = _325 * _129;
    float _395 = _311 * 2.0;
    float _397 = _313 * 2.0;
    float _399 = floor(_387);
    float _401 = _313 + _303;
    float _403 = _313 + _311;
    int _405 = abs(_353);
    float _407 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _409 = _345 + _407;
    float _411 = _401 + (-1.0);
    float _413 = floor(_395);
    float _415 = _403 + (-1.0);
    float _417 = _349 * _357;
    float _419 = -_383;
    float _421 = _419 + 1.0;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _423;
    float _427 = _409 * _409;
    float _429 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _431 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _433 = _399 > 0.0;
    float _435 = floor(_397);
    bool _437 = _399 >= 0.0;
    bool _439 = isnan(_399);
    bool _441 = _437 || _439;
    bool _443 = isnan(0.0);
    bool _445 = _441 || _443;
    float _447 = _369 * _421;
    float _449 = fma(_425, _417, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _451 = fma(_391, _391, _427);
    int _453 = _445 ? 0 : 1;
    float _455 = in.m_55.x;
    float _457 = in.m_55.y;
    float _459 = in.m_55.z;
    bool _461 = _413 >= 0.0;
    bool _463 = isnan(_413);
    bool _465 = _461 || _463;
    bool _467 = isnan(0.0);
    bool _469 = _465 || _467;
    float _471 = exp2(_393);
    int _473 = ~_453;
    int _475 = _473 + 1;
    int _477 = _475 + 1;
    float _479 = -_369;
    float _481 = _479 + 1.0;
    bool _483 = _413 > 0.0;
    float _485 = _449 * _447;
    int _487 = _477;
    if (!_433)
    {
        int _489 = ~_453;
        int _491 = _489 + 1;
        _487 = _491;
    }
    int _493 = _487;
    float _495 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[143].x, _485);
    bool _497 = _435 > 0.0;
    bool _499 = _435 >= 0.0;
    bool _501 = isnan(_435);
    bool _503 = _499 || _501;
    bool _505 = isnan(0.0);
    bool _507 = _503 || _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _511 = 1.0 + _509;
    float _513 = in.m_51.x;
    float _515 = in.m_51.y;
    int _517 = _469 ? 0 : 1;
    float _519 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[144].x, _495);
    float _521 = -_471;
    float _523 = _521 + 1.0;
    bool _525 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _527 = isnan(0.0);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _533 = _529 || _531;
    float _535 = 1.0 / _511;
    bool _537 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _539 = isnan(1.0);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _545 = _541 || _543;
    float _547 = float(_405);
    float _549 = float(_493);
    bool _551 = !_333;
    int _553 = _551 ? 0 : 1;
    float _555 = _533 ? _523 : 0.0;
    float _557 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _559 = _385 + _557;
    float _561 = _547 * _549;
    bool _563 = !_337;
    int _565 = _563 ? 0 : 1;
    float _567 = fma(_559, _559, _451);
    int _569 = ~_517;
    int _571 = _569 + 1;
    int _573 = _571 + 1;
    int _575 = _573;
    if (_545)
    {
        float _577 = _555 * _535;
        _131 = _577;
    }
    float _579 = _131;
    int _581 = abs(_553);
    float _583 = sqrt(_567);
    float _585 = _519 * _513;
    float _587 = _561 * (-2.0);
    if (!_483)
    {
        int _589 = ~_517;
        int _591 = _589 + 1;
        _575 = _591;
    }
    int _593 = _575;
    float _595 = _311 + (-0.5);
    float _597 = _585 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _599 = rsqrt(_567);
    int _601 = abs(_565);
    float _603 = fma(_587, _455, _455);
    float _605 = float(_581);
    float _607 = fma(_431, _587, _431);
    float _609 = float(_593);
    float _611 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[196].x, _603);
    int _613 = _507 ? 0 : 1;
    float _615 = _583 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _617 = _597 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _619 = _605 * _609;
    float _621 = fma(_607, _579, _611);
    float _623 = _313 + (-0.5);
    float _625 = precise::min(_617, _615);
    float _627 = _619 * (-2.0);
    float _629 = float(_601);
    float _631 = _621 * 0.15915493667125701904296875;
    int _633 = ~_613;
    int _635 = _633 + 1;
    int _637 = _635 + 1;
    float _639 = _599 * _625;
    float _641 = fma(_627, _457, _457);
    float _643 = fma(_429, _627, _429);
    int _645 = _637;
    if (!_497)
    {
        int _647 = ~_613;
        int _649 = _647 + 1;
        _645 = _649;
    }
    int _651 = _645;
    float _653 = _409 * _639;
    float _655 = _391 * _639;
    float _657 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[196].y, _641);
    float _659 = float(_651);
    float _661 = -_653;
    float _663 = _409 + _661;
    float _665 = -_655;
    float _667 = _391 + _665;
    float _669 = fma(_643, _579, _657);
    float _671 = _559 * _639;
    float _673 = _663 * _663;
    float _675 = _629 * _659;
    float _677 = _669 * 0.15915493667125701904296875;
    float _679 = as_type<float>(int(gl_VertexIndex));
    float _681 = fma(_667, _667, _673);
    float _683 = -_671;
    float _685 = _559 + _683;
    float _687 = _675 * (-2.0);
    float _689 = _303 + _311;
    float _691 = fma(_685, _685, _681);
    float _693 = fma(_687, _459, _459);
    float _695 = _689 + (-1.0);
    float _697 = _303 + (-0.5);
    float _699 = _631 * 6.283185482025146484375;
    float _701 = sin(_699);
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _703;
    float _707 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _709 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[196].z, _693);
    float _711 = fma(_705, _417, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _713 = fma(_707, _687, _707);
    float _715 = _631 * 6.283185482025146484375;
    float _717 = cos(_715);
    float _719 = _711 * _447;
    float _721 = fma(_713, _579, _709);
    float _723 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[143].y, _719);
    float _725 = _721 * 0.15915493667125701904296875;
    int _727 = as_type<int>(_679) & 1;
    bool _729 = _727 != 0;
    int _731 = as_type<int>(_679) & 2;
    bool _733 = _731 != 0;
    float _735 = sqrt(_691);
    float _737 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[144].y, _723);
    float _739 = _737 * _515;
    bool _741 = !_733;
    float _743 = _741 ? (-0.5) : 0.5;
    float _745 = _677 * 6.283185482025146484375;
    float _747 = sin(_745);
    float _749 = _739 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _751 = !_729;
    float _753 = _751 ? (-0.5) : 0.5;
    bool _755 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _757 = isnan(0.5);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _763 = _759 || _761;
    float _765 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _753);
    float _767 = _677 * 6.283185482025146484375;
    float _769 = cos(_767);
    float _771 = _599 * _735;
    float _773 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _743);
    float _775 = _749 * _771;
    float _777 = _597 * _771;
    float _779 = _725 * 6.283185482025146484375;
    float _781 = cos(_779);
    float _783 = _775 * _773;
    float _785 = _701 * _747;
    float _787 = _717 * _747;
    float _789 = _725 * 6.283185482025146484375;
    float _791 = sin(_789);
    float _793 = _717 * _769;
    float _795 = _701 * _769;
    float _797 = _781 * _783;
    float _799 = _777 * _765;
    float _801 = _747 * _781;
    float _803 = _769 * _781;
    float _805 = _717 * _797;
    float _807 = fma(_791, _793, _785);
    float _809 = -_795;
    float _811 = fma(_791, _787, _809);
    float _813 = -_783;
    float _815 = _791 * _813;
    float _817 = -_787;
    float _819 = fma(_791, _795, _817);
    float _821 = fma(_807, _799, _805);
    float _823 = _771 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _825 = _823 * 0.5;
    float _827 = _701 * _797;
    float _829 = fma(_803, _799, _815);
    float _831 = fma(_791, _785, _793);
    float _833 = fma(_811, _825, _821);
    float _835 = fma(_819, _799, _827);
    float _837 = fma(_801, _825, _829);
    float _839 = _833 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _841 = fma(_831, _825, _835);
    float _843 = _833 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _845 = _833 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _847 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[26].x, _839);
    float _849 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[24].x, _843);
    float _851 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[25].x, _845);
    float _853 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[26].z, _847);
    float _855 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[24].z, _849);
    float _857 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[25].z, _851);
    float _859 = _853 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _861 = _855 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _863 = _385 + _859;
    float _865 = _371 + _861;
    float _867 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _869 = _863 + _867;
    float _871 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _873 = _865 + _871;
    float _875 = _869 * _869;
    float _877 = fma(_873, _873, _875);
    float _879 = _857 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _881 = sqrt(_877);
    float _883 = _345 + _879;
    float _885 = -_655;
    float _887 = _371 + _885;
    bool _889 = _881 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _891 = _857;
    float _893 = _863;
    float _895 = _865;
    float _897 = _671;
    float _899 = _797;
    if (!_889)
    {
        _891 = _863;
    }
    float _901 = _891;
    float _903 = _901;
    if (!_889)
    {
        _893 = _883;
    }
    float _905 = _893;
    bool _907 = !_889;
    float _909 = _905;
    if (!_907)
    {
        float _911 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _913 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _915 = _881 + _913;
        float _917 = rsqrt(_877);
        float _919 = _915 * _911;
        float _921 = _883 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _923 = _919 * 0.15915493667125701904296875;
        float _925 = _923 * 6.283185482025146484375;
        float _927 = cos(_925);
        float _929 = _923 * 6.283185482025146484375;
        float _931 = sin(_929);
        float _933 = _927 + (-1.0);
        float _935 = _933 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _937 = fma(_931, _921, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _939 = fma(_883, _927, _935);
        float _941 = _917 * _937;
        float _943 = fma(_873, _941, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _945 = fma(_869, _941, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _895 = _943;
        _909 = _939;
        _903 = _945;
    }
    float _947 = _895;
    float _949 = _909;
    float _951 = _903;
    float _953 = -_655;
    float _955 = _953 + _947;
    float _957 = -_653;
    float _959 = _957 + _949;
    float _961 = -_671;
    float _963 = _961 + _951;
    float _965 = -_653;
    float _967 = _345 + _965;
    float _969 = -_671;
    float _971 = _385 + _969;
    float _973 = _959;
    float _975 = _955;
    float _977 = _963;
    if (!_763)
    {
        float _979 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _981 = _967 + _979;
        float _983 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _985 = _887 + _983;
        float _987 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _989 = -_371;
        float _991 = _989 + _947;
        float _993 = _981 * _981;
        float _995 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _997 = _971 + _995;
        float _999 = -_345;
        float _1001 = _999 + _949;
        float _1003 = -_385;
        float _1005 = _1003 + _951;
        float _1007 = fma(_985, _985, _993);
        float _1009 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1011 = fma(_997, _997, _1007);
        float _1013 = sqrt(_1011);
        float _1015 = _987 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1017 = precise::min(_1013, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1019 = _1017 * _1009;
        float _1021 = _1015 * _1019;
        float _1023 = fma(_991, _1021, _887);
        float _1025 = fma(_1001, _1021, _967);
        float _1027 = fma(_1005, _1021, _971);
        _973 = _1025;
        _975 = _1023;
        _977 = _1027;
        _897 = _1021;
    }
    float _1029 = _973;
    float _1031 = _975;
    float _1033 = _977;
    float _1035 = _897;
    float _1037 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1039 = _1029 + _1037;
    float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1043 = _1031 + _1041;
    float _1045 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1047 = _1033 + _1045;
    float _1049 = _1039 * _1039;
    float _1051 = fma(_1043, _1043, _1049);
    float _1053 = fma(_1047, _1047, _1051);
    float _1055 = rsqrt(_1053);
    float _1057 = sqrt(_1053);
    float _1059 = _1055 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1061 = _1043 * _1059;
    float _1063 = _1047 * _1059;
    float _1065 = _1061 * _1061;
    float _1067 = _1063 * _1063;
    float _1069 = _1065 + _1067;
    float _1071 = sqrt(_1069);
    bool _1073 = _1071 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1075 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1077 = _1071 + _1075;
    float _1079 = _1055;
    float _1081 = _1077;
    float _1083 = _1035;
    float _1085 = _1039;
    if (_1073)
    {
        float _1087 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1079 = _1087;
    }
    float _1089 = _1079;
    float _1091 = _1089;
    if (_1073)
    {
        float _1093 = _1077 * _1089;
        _1081 = _1093;
    }
    float _1095 = _1081;
    if (_1073)
    {
        float _1097 = rsqrt(_1069);
        _1091 = _1097;
    }
    float _1099 = _1091;
    float _1101 = _1099;
    if (_1073)
    {
        float _1103 = _1095 * 0.15915493667125701904296875;
        _1083 = _1103;
    }
    float _1105 = _1083;
    float _1107 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1109 = _1047;
    float _1111 = _1105;
    if (_1073)
    {
        float _1113 = _1105 * 6.283185482025146484375;
        float _1115 = sin(_1113);
        _1109 = _1115;
    }
    float _1117 = _1109;
    float _1119 = precise::max(0.0, _1107);
    float _1121 = _949;
    float _1123 = _1119;
    if (_1073)
    {
        float _1125 = _1105 * 6.283185482025146484375;
        float _1127 = cos(_1125);
        _1121 = _1127;
    }
    float _1129 = _1121;
    float _1131 = -_1059;
    float _1133 = -_1119;
    float _1135 = fma(_1039, _1131, _1133);
    if (_1073)
    {
        float _1137 = _1135 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1085 = _1137;
    }
    float _1139 = _1085;
    float _1141 = _1117;
    float _1143 = _1139;
    if (_1073)
    {
        float _1145 = fma(_1117, _1139, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1141 = _1145;
    }
    float _1147 = _1141;
    float _1149 = _1147;
    if (!_1073)
    {
        _1143 = _1135;
    }
    float _1151 = _1143;
    float _1153 = _1151;
    if (_1073)
    {
        float _1155 = _1099 * _1147;
        _899 = _1155;
    }
    float _1157 = _899;
    if (!_1073)
    {
        _1101 = _1061;
    }
    float _1159 = _1101;
    float _1161 = _1159;
    float _1163 = _1129;
    if (_1073)
    {
        float _1165 = _1129 + (-1.0);
        _1123 = _1165;
    }
    float _1167 = _1123;
    float _1169 = _1167;
    if (_1073)
    {
        float _1171 = _1061 * _1157;
        _1161 = _1171;
    }
    float _1173 = _1161;
    if (!_1073)
    {
        _1149 = _1065;
    }
    float _1175 = _1149;
    float _1177 = _1029 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1179 = _1175;
    if (_1073)
    {
        float _1181 = _1167 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1111 = _1181;
    }
    float _1183 = _1111;
    if (!_1073)
    {
        _1169 = _1063;
    }
    float _1185 = _1169;
    float _1187 = _1185;
    if (_1073)
    {
        float _1189 = _1063 * _1157;
        _1187 = _1189;
    }
    float _1191 = _1187;
    if (_1073)
    {
        float _1193 = _1173 * _1173;
        _1179 = _1193;
    }
    float _1195 = _1179;
    if (_1073)
    {
        float _1197 = fma(_1135, _1129, _1183);
        _1153 = _1197;
    }
    float _1199 = _1153;
    if (!_1073)
    {
        _1163 = _1067;
    }
    float _1201 = _1163;
    float _1203 = _1201;
    if (_1073)
    {
        float _1205 = _1191 * _1191;
        _1203 = _1205;
    }
    float _1207 = _1203;
    float _1209 = fma(_1199, _1199, _1195);
    float _1211 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1177);
    float _1213 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1215 = _1029 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1217 = _1209 + _1207;
    float _1219 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1221 = fma(_1057, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1219);
    float _1223 = precise::clamp(_1221, 0.0, 1.0);
    float _1225 = _1029 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1227 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1211);
    float _1229 = rsqrt(_1217);
    float _1231 = -_1223;
    float _1233 = _1231 + 1.0;
    float _1235 = _1029 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1237 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1225);
    float _1239 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1241 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1215);
    float _1243 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1235);
    float _1245 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1237);
    float _1247 = abs(_1233);
    float _1249 = log2(_1247);
    float _1251 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1253 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1243);
    float _1255 = _1245 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1257 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1241);
    float _1259 = -_1251;
    float _1261 = fma(_1259, _1213, 1.0);
    float _1263 = _1253 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1265 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1267 = _1229 * _1173;
    float _1269 = _1229 * _1199;
    float _1271 = _1229 * _1191;
    float _1273 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1265);
    float _1275 = _1267 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1277 = _1257 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1279 = log2(_1261);
    float _1281 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1273);
    float _1283 = -_1275;
    float _1285 = fma(_1269, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1283);
    float _1287 = _1249 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1289 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1291 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1281);
    float _1293 = -_1271;
    float _1295 = fma(_1293, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1285);
    float _1297 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1299 = exp2(_1287);
    float _1301 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1289);
    float _1303 = fma(_1295, -0.5, 0.5);
    float _1305 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1297);
    float _1307 = _1269 + 1.0;
    float _1309 = fma(_1295, 0.5, 0.5);
    float _1311 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1301);
    float _1313 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1305);
    float _1315 = 1.0 / _1291;
    float _1317 = fma(_1309, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1319 = _1279 * 0.693147182464599609375;
    float _1321 = fma(_1309, _1317, -0.212114393711090087890625);
    float _1323 = _1319 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1325 = sqrt(_1303);
    float _1327 = -_1269;
    float _1329 = fma(_1299, _1307, _1327);
    float _1331 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1313);
    float _1333 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1311);
    float _1335 = fma(_1309, _1321, 1.570728778839111328125);
    float _1337 = _1331 * _1315;
    float _1339 = _1333 * _1315;
    float _1341 = fma(_1337, 0.5, 0.5);
    float _1343 = fma(_1339, -0.5, 0.5);
    float _1345 = fma(_1329, 0.5, 0.5);
    float _1347 = _1325 * 0.636619746685028076171875;
    float _1349 = -_1335;
    float _1351 = fma(_1347, _1349, 1.0);
    float3 _3468 = float3(_1341, _1343, _1323);
    float _1353 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3468, float3(0.0), isnan(_3468)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3468, float3(0.0), isnan(_3468)), level(0.0)).x;
    float3 _3479 = float3(_1341, _1343, _1323);
    float4 _1356 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3479, float3(0.0), isnan(_3479)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3479, float3(0.0), isnan(_3479)), level(0.0)).xyzw;
    float _1358 = _1356.x;
    float _1360 = _1356.y;
    float _1362 = _1356.z;
    float _1364 = _1356.w;
    float2 _3496 = float2(_1351, _1345);
    float3 _1368 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3496, float2(0.0), isnan(_3496)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3496, float2(0.0), isnan(_3496)), level(0.0)).xyz;
    float _1370 = _1368.x;
    float _1372 = _1368.y;
    float _1374 = _1368.z;
    float _1376 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1378 = _313 > 0.5;
    out.m_60.x = _887;
    out.m_60.y = _967;
    out.m_60.z = _971;
    bool _1380 = _311 > 0.5;
    float _1382 = _1291 * 0.5;
    int _1384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1386 = _1384 != 0;
    out.m_62.w = _625;
    float _1388 = -_743;
    int _1390 = _1378 ? as_type<int>(_1388) : as_type<int>(_743);
    float _1392 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1394 = _1249 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1396 = !_1386;
    float _1398 = _1396 ? _743 : as_type<float>(_1390);
    float _1400 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1404 = _1402 != 0;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1408 = -_753;
    int _1410 = _1380 ? as_type<int>(_1408) : as_type<int>(_753);
    float _1412 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1400);
    float _1414 = -_1398;
    float _1416 = _1414 + 0.5;
    bool _1418 = !_1404;
    float _1420 = _1418 ? _753 : as_type<float>(_1410);
    float _1422 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1412);
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1426 = _1416 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1428 = _1420 + 0.5;
    float _1430 = _1424 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1432 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1434 = _1428 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1436 = exp2(_1394);
    float _1438 = _1426 * _1392;
    float _1440 = _1434 * _1376;
    float _1442 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1422);
    float _1444 = _1331 + _1291;
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1448 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1452 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1454 = _1442 + _1291;
    float _1456 = _1444 * 0.5;
    float _1458 = -_1436;
    float _1460 = _1458 + 1.0;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1466 = _1446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1468 = _1460 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1470 = _1448 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1472 = _1450 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1474 = _1452 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1476 = _1454 * 0.5;
    float _1478 = fma(_1333, -0.5, _1382);
    float _1480 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_64.x = _1466;
    out.m_64.y = _1470;
    out.m_64.z = _1472;
    out.m_64.w = _1462;
    out.m_66.x = _1474;
    out.m_66.y = _1430;
    out.m_66.z = _1432;
    out.m_66.w = _1464;
    out.m_68.x = _1440;
    out.m_68.y = _1438;
    out.m_70.x = _777;
    out.m_72.x = _1031;
    out.m_72.y = _1029;
    out.m_72.z = _1033;
    out.gl_Position.x = _1331;
    out.gl_Position.y = _1333;
    out.gl_Position.z = _1442;
    out.gl_Position.w = _1291;
    out.m_74.x = _1456;
    out.m_74.y = _1478;
    out.m_74.z = _1476;
    out.m_74.w = _1291;
    out.m_47.x = _1480;
    float _1482 = _1468 * _1353;
    float _1484 = -_1468;
    float _1486 = _1484 + 1.0;
    float _1488 = _1364 * _1482;
    float _1490 = _1374 * _1482;
    float _1492 = _1364 * _1486;
    float _1494 = fma(_1370, _1488, _1358);
    float _1496 = fma(_1372, _1488, _1360);
    float _1498 = fma(_1364, _1490, _1362);
    out.m_76.x = _1494;
    out.m_76.y = _1496;
    out.m_76.z = _1498;
    out.m_76.w = _1492;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    bool _293 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_44.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_47.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1555 = as_type<float>(_111);
        out.gl_Position.z = _1555;
    }
    if (!_99)
    {
        return out;
    }
    float _115 = in.m_49.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = _129;
    if (_125)
    {
        float _133 = float(_95);
        _105 = _133;
    }
    float _135 = _105;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_47.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1625 = as_type<float>(_149);
        out.gl_Position.z = _1625;
    }
    if (_141)
    {
        return out;
    }
    float _151 = in.m_51.w;
    float _153 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = in.m_49.x;
    float _167 = in.m_49.y;
    float _169 = in.m_49.z;
    float _171 = in.m_44.x;
    float _173 = in.m_44.y;
    float _175 = in.m_44.z;
    float _177 = 0.0;
    float _179 = _153;
    if (!_163)
    {
        float _181 = _153 * _153;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    float _187 = _185;
    if (!_163)
    {
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _189;
    }
    float _191 = _187;
    bool _193 = !_163;
    float _195 = _191;
    if (!_193)
    {
        float _197 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = log2(_197);
        float _201 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _203 = _201 + 1.0;
        float _205 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = _153 * _199;
        float _209 = 1.0 / _203;
        float _211 = _205 * 0.693147182464599609375;
        float _213 = exp2(_207);
        float _215 = 1.0 / _211;
        float _217 = _213 + (-1.0);
        float _219 = -_217;
        float _221 = fma(_219, _215, _153);
        float _223 = _221 * _209;
        float _225 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _225;
    }
    float _227 = _195;
    bool _229 = !_163;
    if (!_229)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = 1.0 / _237;
        float _241 = _153 * _233;
        float _243 = exp2(_241);
        float _245 = -_243;
        float _247 = _245 + 1.0;
        float _249 = _247 * _239;
        _179 = _249;
    }
    float _251 = _179;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _255 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _257 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _259 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _261 = fma(_251, _165, _255);
    float _263 = fma(_251, _167, _257);
    float _265 = fma(_251, _169, _259);
    float _267 = fma(_261, _151, _171);
    float _269 = fma(_263, _151, _173);
    float _271 = fma(_265, _151, _175);
    bool _273 = !_253;
    float _291;
    if (!_273)
    {
        float _275 = in.m_53.x;
        float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _279 = _275 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _283 = _281 * _277;
        float _285 = floor(_283);
        float _287 = -_285;
        float _289 = _283 + _287;
        _291 = _289;
        _293 = true;
    }
    else
    {
        float _295 = float(_95);
        float _297 = 1.0 / _295;
        float _299 = _129 * _297;
        _291 = _299;
    }
    _293 = false;
    float _301 = _291;
    float _303 = in.m_53.z;
    float _305 = _269 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _307 = _269 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _309 = _269 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _311 = in.m_53.x;
    float _313 = in.m_53.y;
    float _315 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].x, _305);
    float _317 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].x, _307);
    float _319 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[5].z, _315);
    float _321 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].x, _309);
    float _323 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _325 = log2(_323);
    int _327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _329 = _327 != 0;
    int _331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _333 = _331 != 0;
    int _335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _337 = _335 != 0;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _339;
    float _343 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[4].z, _317);
    float _345 = _319 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _349 = _301 + _347;
    bool _351 = !_329;
    int _353 = _351 ? 0 : 1;
    float _355 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[6].z, _321);
    float _357 = 1.0 / _341;
    bool _359 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _361 = isnan(_301);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = _343 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _373 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _375 = isnan(_301);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = _355 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _387 = _303 * 2.0;
    float _389 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _391 = _371 + _389;
    float _393 = _325 * _129;
    float _395 = _311 * 2.0;
    float _397 = _313 * 2.0;
    float _399 = floor(_387);
    float _401 = _313 + _303;
    float _403 = _313 + _311;
    int _405 = abs(_353);
    float _407 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _409 = _345 + _407;
    float _411 = _401 + (-1.0);
    float _413 = floor(_395);
    float _415 = _403 + (-1.0);
    float _417 = _349 * _357;
    float _419 = -_383;
    float _421 = _419 + 1.0;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _423;
    float _427 = _409 * _409;
    float _429 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _431 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _433 = _399 > 0.0;
    float _435 = floor(_397);
    bool _437 = _399 >= 0.0;
    bool _439 = isnan(_399);
    bool _441 = _437 || _439;
    bool _443 = isnan(0.0);
    bool _445 = _441 || _443;
    float _447 = _369 * _421;
    float _449 = fma(_425, _417, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _451 = fma(_391, _391, _427);
    int _453 = _445 ? 0 : 1;
    float _455 = in.m_55.x;
    float _457 = in.m_55.y;
    float _459 = in.m_55.z;
    bool _461 = _413 >= 0.0;
    bool _463 = isnan(_413);
    bool _465 = _461 || _463;
    bool _467 = isnan(0.0);
    bool _469 = _465 || _467;
    float _471 = exp2(_393);
    int _473 = ~_453;
    int _475 = _473 + 1;
    int _477 = _475 + 1;
    float _479 = -_369;
    float _481 = _479 + 1.0;
    bool _483 = _413 > 0.0;
    float _485 = _449 * _447;
    int _487 = _477;
    if (!_433)
    {
        int _489 = ~_453;
        int _491 = _489 + 1;
        _487 = _491;
    }
    int _493 = _487;
    float _495 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[143].x, _485);
    bool _497 = _435 > 0.0;
    bool _499 = _435 >= 0.0;
    bool _501 = isnan(_435);
    bool _503 = _499 || _501;
    bool _505 = isnan(0.0);
    bool _507 = _503 || _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _511 = 1.0 + _509;
    float _513 = in.m_51.x;
    float _515 = in.m_51.y;
    int _517 = _469 ? 0 : 1;
    float _519 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[144].x, _495);
    float _521 = -_471;
    float _523 = _521 + 1.0;
    bool _525 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _527 = isnan(0.0);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _533 = _529 || _531;
    float _535 = 1.0 / _511;
    bool _537 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _539 = isnan(1.0);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _545 = _541 || _543;
    float _547 = float(_405);
    float _549 = float(_493);
    bool _551 = !_333;
    int _553 = _551 ? 0 : 1;
    float _555 = _533 ? _523 : 0.0;
    float _557 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _559 = _385 + _557;
    float _561 = _547 * _549;
    bool _563 = !_337;
    int _565 = _563 ? 0 : 1;
    float _567 = fma(_559, _559, _451);
    int _569 = ~_517;
    int _571 = _569 + 1;
    int _573 = _571 + 1;
    int _575 = _573;
    if (_545)
    {
        float _577 = _555 * _535;
        _131 = _577;
    }
    float _579 = _131;
    int _581 = abs(_553);
    float _583 = sqrt(_567);
    float _585 = _519 * _513;
    float _587 = _561 * (-2.0);
    if (!_483)
    {
        int _589 = ~_517;
        int _591 = _589 + 1;
        _575 = _591;
    }
    int _593 = _575;
    float _595 = _311 + (-0.5);
    float _597 = _585 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _599 = rsqrt(_567);
    int _601 = abs(_565);
    float _603 = fma(_587, _455, _455);
    float _605 = float(_581);
    float _607 = fma(_431, _587, _431);
    float _609 = float(_593);
    float _611 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[196].x, _603);
    int _613 = _507 ? 0 : 1;
    float _615 = _583 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _617 = _597 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _619 = _605 * _609;
    float _621 = fma(_607, _579, _611);
    float _623 = _313 + (-0.5);
    float _625 = precise::min(_617, _615);
    float _627 = _619 * (-2.0);
    float _629 = float(_601);
    float _631 = _621 * 0.15915493667125701904296875;
    int _633 = ~_613;
    int _635 = _633 + 1;
    int _637 = _635 + 1;
    float _639 = _599 * _625;
    float _641 = fma(_627, _457, _457);
    float _643 = fma(_429, _627, _429);
    int _645 = _637;
    if (!_497)
    {
        int _647 = ~_613;
        int _649 = _647 + 1;
        _645 = _649;
    }
    int _651 = _645;
    float _653 = _409 * _639;
    float _655 = _391 * _639;
    float _657 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[196].y, _641);
    float _659 = float(_651);
    float _661 = -_653;
    float _663 = _409 + _661;
    float _665 = -_655;
    float _667 = _391 + _665;
    float _669 = fma(_643, _579, _657);
    float _671 = _559 * _639;
    float _673 = _663 * _663;
    float _675 = _629 * _659;
    float _677 = _669 * 0.15915493667125701904296875;
    float _679 = as_type<float>(int(gl_VertexIndex));
    float _681 = fma(_667, _667, _673);
    float _683 = -_671;
    float _685 = _559 + _683;
    float _687 = _675 * (-2.0);
    float _689 = _303 + _311;
    float _691 = fma(_685, _685, _681);
    float _693 = fma(_687, _459, _459);
    float _695 = _689 + (-1.0);
    float _697 = _303 + (-0.5);
    float _699 = _631 * 6.283185482025146484375;
    float _701 = sin(_699);
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _703;
    float _707 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _709 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[196].z, _693);
    float _711 = fma(_705, _417, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _713 = fma(_707, _687, _707);
    float _715 = _631 * 6.283185482025146484375;
    float _717 = cos(_715);
    float _719 = _711 * _447;
    float _721 = fma(_713, _579, _709);
    float _723 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[143].y, _719);
    float _725 = _721 * 0.15915493667125701904296875;
    int _727 = as_type<int>(_679) & 1;
    bool _729 = _727 != 0;
    int _731 = as_type<int>(_679) & 2;
    bool _733 = _731 != 0;
    float _735 = sqrt(_691);
    float _737 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[144].y, _723);
    float _739 = _737 * _515;
    bool _741 = !_733;
    float _743 = _741 ? (-0.5) : 0.5;
    float _745 = _677 * 6.283185482025146484375;
    float _747 = sin(_745);
    float _749 = _739 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _751 = !_729;
    float _753 = _751 ? (-0.5) : 0.5;
    bool _755 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _757 = isnan(0.5);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _763 = _759 || _761;
    float _765 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _753);
    float _767 = _677 * 6.283185482025146484375;
    float _769 = cos(_767);
    float _771 = _599 * _735;
    float _773 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _743);
    float _775 = _749 * _771;
    float _777 = _597 * _771;
    float _779 = _725 * 6.283185482025146484375;
    float _781 = cos(_779);
    float _783 = _775 * _773;
    float _785 = _701 * _747;
    float _787 = _717 * _747;
    float _789 = _725 * 6.283185482025146484375;
    float _791 = sin(_789);
    float _793 = _717 * _769;
    float _795 = _701 * _769;
    float _797 = _781 * _783;
    float _799 = _777 * _765;
    float _801 = _747 * _781;
    float _803 = _769 * _781;
    float _805 = _717 * _797;
    float _807 = fma(_791, _793, _785);
    float _809 = -_795;
    float _811 = fma(_791, _787, _809);
    float _813 = -_783;
    float _815 = _791 * _813;
    float _817 = -_787;
    float _819 = fma(_791, _795, _817);
    float _821 = fma(_807, _799, _805);
    float _823 = _771 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _825 = _823 * 0.5;
    float _827 = _701 * _797;
    float _829 = fma(_803, _799, _815);
    float _831 = fma(_791, _785, _793);
    float _833 = fma(_811, _825, _821);
    float _835 = fma(_819, _799, _827);
    float _837 = fma(_801, _825, _829);
    float _839 = _833 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _841 = fma(_831, _825, _835);
    float _843 = _833 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _845 = _833 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _847 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[26].x, _839);
    float _849 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[24].x, _843);
    float _851 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[25].x, _845);
    float _853 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[26].z, _847);
    float _855 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[24].z, _849);
    float _857 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[25].z, _851);
    float _859 = _853 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _861 = _855 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _863 = _385 + _859;
    float _865 = _371 + _861;
    float _867 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _869 = _863 + _867;
    float _871 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _873 = _865 + _871;
    float _875 = _869 * _869;
    float _877 = fma(_873, _873, _875);
    float _879 = _857 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _881 = sqrt(_877);
    float _883 = _345 + _879;
    float _885 = -_655;
    float _887 = _371 + _885;
    bool _889 = _881 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _891 = _857;
    float _893 = _863;
    float _895 = _865;
    float _897 = _671;
    float _899 = _797;
    if (!_889)
    {
        _891 = _863;
    }
    float _901 = _891;
    float _903 = _901;
    if (!_889)
    {
        _893 = _883;
    }
    float _905 = _893;
    bool _907 = !_889;
    float _909 = _905;
    if (!_907)
    {
        float _911 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _913 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _915 = _881 + _913;
        float _917 = rsqrt(_877);
        float _919 = _915 * _911;
        float _921 = _883 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _923 = _919 * 0.15915493667125701904296875;
        float _925 = _923 * 6.283185482025146484375;
        float _927 = cos(_925);
        float _929 = _923 * 6.283185482025146484375;
        float _931 = sin(_929);
        float _933 = _927 + (-1.0);
        float _935 = _933 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _937 = fma(_931, _921, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _939 = fma(_883, _927, _935);
        float _941 = _917 * _937;
        float _943 = fma(_873, _941, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _945 = fma(_869, _941, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _895 = _943;
        _909 = _939;
        _903 = _945;
    }
    float _947 = _895;
    float _949 = _909;
    float _951 = _903;
    float _953 = -_655;
    float _955 = _953 + _947;
    float _957 = -_653;
    float _959 = _957 + _949;
    float _961 = -_671;
    float _963 = _961 + _951;
    float _965 = -_653;
    float _967 = _345 + _965;
    float _969 = -_671;
    float _971 = _385 + _969;
    float _973 = _959;
    float _975 = _955;
    float _977 = _963;
    if (!_763)
    {
        float _979 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _981 = _967 + _979;
        float _983 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _985 = _887 + _983;
        float _987 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _989 = -_371;
        float _991 = _989 + _947;
        float _993 = _981 * _981;
        float _995 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _997 = _971 + _995;
        float _999 = -_345;
        float _1001 = _999 + _949;
        float _1003 = -_385;
        float _1005 = _1003 + _951;
        float _1007 = fma(_985, _985, _993);
        float _1009 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1011 = fma(_997, _997, _1007);
        float _1013 = sqrt(_1011);
        float _1015 = _987 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1017 = precise::min(_1013, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1019 = _1017 * _1009;
        float _1021 = _1015 * _1019;
        float _1023 = fma(_991, _1021, _887);
        float _1025 = fma(_1001, _1021, _967);
        float _1027 = fma(_1005, _1021, _971);
        _973 = _1025;
        _975 = _1023;
        _977 = _1027;
        _897 = _1021;
    }
    float _1029 = _973;
    float _1031 = _975;
    float _1033 = _977;
    float _1035 = _897;
    float _1037 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1039 = _1029 + _1037;
    float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1043 = _1031 + _1041;
    float _1045 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1047 = _1033 + _1045;
    float _1049 = _1039 * _1039;
    float _1051 = fma(_1043, _1043, _1049);
    float _1053 = fma(_1047, _1047, _1051);
    float _1055 = rsqrt(_1053);
    float _1057 = sqrt(_1053);
    float _1059 = _1055 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1061 = _1043 * _1059;
    float _1063 = _1047 * _1059;
    float _1065 = _1061 * _1061;
    float _1067 = _1063 * _1063;
    float _1069 = _1065 + _1067;
    float _1071 = sqrt(_1069);
    bool _1073 = _1071 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1075 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1077 = _1071 + _1075;
    float _1079 = _1055;
    float _1081 = _1077;
    float _1083 = _1035;
    float _1085 = _1039;
    if (_1073)
    {
        float _1087 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1079 = _1087;
    }
    float _1089 = _1079;
    float _1091 = _1089;
    if (_1073)
    {
        float _1093 = _1077 * _1089;
        _1081 = _1093;
    }
    float _1095 = _1081;
    if (_1073)
    {
        float _1097 = rsqrt(_1069);
        _1091 = _1097;
    }
    float _1099 = _1091;
    float _1101 = _1099;
    if (_1073)
    {
        float _1103 = _1095 * 0.15915493667125701904296875;
        _1083 = _1103;
    }
    float _1105 = _1083;
    float _1107 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1109 = _1047;
    float _1111 = _1105;
    if (_1073)
    {
        float _1113 = _1105 * 6.283185482025146484375;
        float _1115 = sin(_1113);
        _1109 = _1115;
    }
    float _1117 = _1109;
    float _1119 = precise::max(0.0, _1107);
    float _1121 = _949;
    float _1123 = _1119;
    if (_1073)
    {
        float _1125 = _1105 * 6.283185482025146484375;
        float _1127 = cos(_1125);
        _1121 = _1127;
    }
    float _1129 = _1121;
    float _1131 = -_1059;
    float _1133 = -_1119;
    float _1135 = fma(_1039, _1131, _1133);
    if (_1073)
    {
        float _1137 = _1135 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1085 = _1137;
    }
    float _1139 = _1085;
    float _1141 = _1117;
    float _1143 = _1139;
    if (_1073)
    {
        float _1145 = fma(_1117, _1139, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1141 = _1145;
    }
    float _1147 = _1141;
    float _1149 = _1147;
    if (!_1073)
    {
        _1143 = _1135;
    }
    float _1151 = _1143;
    float _1153 = _1151;
    if (_1073)
    {
        float _1155 = _1099 * _1147;
        _899 = _1155;
    }
    float _1157 = _899;
    if (!_1073)
    {
        _1101 = _1061;
    }
    float _1159 = _1101;
    float _1161 = _1159;
    float _1163 = _1129;
    if (_1073)
    {
        float _1165 = _1129 + (-1.0);
        _1123 = _1165;
    }
    float _1167 = _1123;
    float _1169 = _1167;
    if (_1073)
    {
        float _1171 = _1061 * _1157;
        _1161 = _1171;
    }
    float _1173 = _1161;
    if (!_1073)
    {
        _1149 = _1065;
    }
    float _1175 = _1149;
    float _1177 = _1029 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1179 = _1175;
    if (_1073)
    {
        float _1181 = _1167 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1111 = _1181;
    }
    float _1183 = _1111;
    if (!_1073)
    {
        _1169 = _1063;
    }
    float _1185 = _1169;
    float _1187 = _1185;
    if (_1073)
    {
        float _1189 = _1063 * _1157;
        _1187 = _1189;
    }
    float _1191 = _1187;
    if (_1073)
    {
        float _1193 = _1173 * _1173;
        _1179 = _1193;
    }
    float _1195 = _1179;
    if (_1073)
    {
        float _1197 = fma(_1135, _1129, _1183);
        _1153 = _1197;
    }
    float _1199 = _1153;
    if (!_1073)
    {
        _1163 = _1067;
    }
    float _1201 = _1163;
    float _1203 = _1201;
    if (_1073)
    {
        float _1205 = _1191 * _1191;
        _1203 = _1205;
    }
    float _1207 = _1203;
    float _1209 = fma(_1199, _1199, _1195);
    float _1211 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1177);
    float _1213 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1215 = _1029 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1217 = _1209 + _1207;
    float _1219 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1221 = fma(_1057, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1219);
    float _1223 = precise::clamp(_1221, 0.0, 1.0);
    float _1225 = _1029 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1227 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1211);
    float _1229 = rsqrt(_1217);
    float _1231 = -_1223;
    float _1233 = _1231 + 1.0;
    float _1235 = _1029 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1237 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1225);
    float _1239 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1241 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1215);
    float _1243 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1235);
    float _1245 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1237);
    float _1247 = abs(_1233);
    float _1249 = log2(_1247);
    float _1251 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1253 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1243);
    float _1255 = _1245 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1257 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1241);
    float _1259 = -_1251;
    float _1261 = fma(_1259, _1213, 1.0);
    float _1263 = _1253 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1265 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1267 = _1229 * _1173;
    float _1269 = _1229 * _1199;
    float _1271 = _1229 * _1191;
    float _1273 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1265);
    float _1275 = _1267 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1277 = _1257 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1279 = log2(_1261);
    float _1281 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1273);
    float _1283 = -_1275;
    float _1285 = fma(_1269, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1283);
    float _1287 = _1249 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1289 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1291 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1281);
    float _1293 = -_1271;
    float _1295 = fma(_1293, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1285);
    float _1297 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1299 = exp2(_1287);
    float _1301 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1289);
    float _1303 = fma(_1295, -0.5, 0.5);
    float _1305 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1297);
    float _1307 = _1269 + 1.0;
    float _1309 = fma(_1295, 0.5, 0.5);
    float _1311 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1301);
    float _1313 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1305);
    float _1315 = 1.0 / _1291;
    float _1317 = fma(_1309, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1319 = _1279 * 0.693147182464599609375;
    float _1321 = fma(_1309, _1317, -0.212114393711090087890625);
    float _1323 = _1319 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1325 = sqrt(_1303);
    float _1327 = -_1269;
    float _1329 = fma(_1299, _1307, _1327);
    float _1331 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1313);
    float _1333 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1311);
    float _1335 = fma(_1309, _1321, 1.570728778839111328125);
    float _1337 = _1331 * _1315;
    float _1339 = _1333 * _1315;
    float _1341 = fma(_1337, 0.5, 0.5);
    float _1343 = fma(_1339, -0.5, 0.5);
    float _1345 = fma(_1329, 0.5, 0.5);
    float _1347 = _1325 * 0.636619746685028076171875;
    float _1349 = -_1335;
    float _1351 = fma(_1347, _1349, 1.0);
    float3 _3468 = float3(_1341, _1343, _1323);
    float _1353 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3468, float3(0.0), isnan(_3468)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3468, float3(0.0), isnan(_3468)), level(0.0)).x;
    float3 _3479 = float3(_1341, _1343, _1323);
    float4 _1356 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3479, float3(0.0), isnan(_3479)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3479, float3(0.0), isnan(_3479)), level(0.0)).xyzw;
    float _1358 = _1356.x;
    float _1360 = _1356.y;
    float _1362 = _1356.z;
    float _1364 = _1356.w;
    float2 _3496 = float2(_1351, _1345);
    float3 _1368 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3496, float2(0.0), isnan(_3496)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3496, float2(0.0), isnan(_3496)), level(0.0)).xyz;
    float _1370 = _1368.x;
    float _1372 = _1368.y;
    float _1374 = _1368.z;
    float _1376 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1378 = _313 > 0.5;
    out.m_60.x = _887;
    out.m_60.y = _967;
    out.m_60.z = _971;
    bool _1380 = _311 > 0.5;
    float _1382 = _1291 * 0.5;
    int _1384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1386 = _1384 != 0;
    out.m_62.w = _625;
    float _1388 = -_743;
    int _1390 = _1378 ? as_type<int>(_1388) : as_type<int>(_743);
    float _1392 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1394 = _1249 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1396 = !_1386;
    float _1398 = _1396 ? _743 : as_type<float>(_1390);
    float _1400 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1404 = _1402 != 0;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1408 = -_753;
    int _1410 = _1380 ? as_type<int>(_1408) : as_type<int>(_753);
    float _1412 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1400);
    float _1414 = -_1398;
    float _1416 = _1414 + 0.5;
    bool _1418 = !_1404;
    float _1420 = _1418 ? _753 : as_type<float>(_1410);
    float _1422 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1412);
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1426 = _1416 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1428 = _1420 + 0.5;
    float _1430 = _1424 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1432 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1434 = _1428 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1436 = exp2(_1394);
    float _1438 = _1426 * _1392;
    float _1440 = _1434 * _1376;
    float _1442 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1422);
    float _1444 = _1331 + _1291;
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1448 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1452 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1454 = _1442 + _1291;
    float _1456 = _1444 * 0.5;
    float _1458 = -_1436;
    float _1460 = _1458 + 1.0;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1466 = _1446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1468 = _1460 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1470 = _1448 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1472 = _1450 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1474 = _1452 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1476 = _1454 * 0.5;
    float _1478 = fma(_1333, -0.5, _1382);
    float _1480 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_64.x = _1466;
    out.m_64.y = _1470;
    out.m_64.z = _1472;
    out.m_64.w = _1462;
    out.m_66.x = _1474;
    out.m_66.y = _1430;
    out.m_66.z = _1432;
    out.m_66.w = _1464;
    out.m_68.x = _1440;
    out.m_68.y = _1438;
    out.m_70.x = _777;
    out.m_72.x = _1031;
    out.m_72.y = _1029;
    out.m_72.z = _1033;
    out.gl_Position.x = _1331;
    out.gl_Position.y = _1333;
    out.gl_Position.z = _1442;
    out.gl_Position.w = _1291;
    out.m_74.x = _1456;
    out.m_74.y = _1478;
    out.m_74.z = _1476;
    out.m_74.w = _1291;
    out.m_47.x = _1480;
    float _1482 = _1468 * _1353;
    float _1484 = -_1468;
    float _1486 = _1484 + 1.0;
    float _1488 = _1364 * _1482;
    float _1490 = _1374 * _1482;
    float _1492 = _1364 * _1486;
    float _1494 = fma(_1370, _1488, _1358);
    float _1496 = fma(_1372, _1488, _1360);
    float _1498 = fma(_1364, _1490, _1362);
    out.m_76.x = _1494;
    out.m_76.y = _1496;
    out.m_76.z = _1498;
    out.m_76.w = _1492;
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    bool _293 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_44.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_47.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1555 = as_type<float>(_111);
        out.gl_Position.z = _1555;
    }
    if (!_99)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _115 = in.m_49.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = _129;
    if (_125)
    {
        float _133 = float(_95);
        _105 = _133;
    }
    float _135 = _105;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_47.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1625 = as_type<float>(_149);
        out.gl_Position.z = _1625;
    }
    if (_141)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _151 = in.m_51.w;
    float _153 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = in.m_49.x;
    float _167 = in.m_49.y;
    float _169 = in.m_49.z;
    float _171 = in.m_44.x;
    float _173 = in.m_44.y;
    float _175 = in.m_44.z;
    float _177 = 0.0;
    float _179 = _153;
    if (!_163)
    {
        float _181 = _153 * _153;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    float _187 = _185;
    if (!_163)
    {
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _189;
    }
    float _191 = _187;
    bool _193 = !_163;
    float _195 = _191;
    if (!_193)
    {
        float _197 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = log2(_197);
        float _201 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _203 = _201 + 1.0;
        float _205 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = _153 * _199;
        float _209 = 1.0 / _203;
        float _211 = _205 * 0.693147182464599609375;
        float _213 = exp2(_207);
        float _215 = 1.0 / _211;
        float _217 = _213 + (-1.0);
        float _219 = -_217;
        float _221 = fma(_219, _215, _153);
        float _223 = _221 * _209;
        float _225 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _225;
    }
    float _227 = _195;
    bool _229 = !_163;
    if (!_229)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = 1.0 / _237;
        float _241 = _153 * _233;
        float _243 = exp2(_241);
        float _245 = -_243;
        float _247 = _245 + 1.0;
        float _249 = _247 * _239;
        _179 = _249;
    }
    float _251 = _179;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _255 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _257 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _259 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _261 = fma(_251, _165, _255);
    float _263 = fma(_251, _167, _257);
    float _265 = fma(_251, _169, _259);
    float _267 = fma(_261, _151, _171);
    float _269 = fma(_263, _151, _173);
    float _271 = fma(_265, _151, _175);
    bool _273 = !_253;
    float _291;
    if (!_273)
    {
        float _275 = in.m_53.x;
        float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _279 = _275 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _283 = _281 * _277;
        float _285 = floor(_283);
        float _287 = -_285;
        float _289 = _283 + _287;
        _291 = _289;
        _293 = true;
    }
    else
    {
        float _295 = float(_95);
        float _297 = 1.0 / _295;
        float _299 = _129 * _297;
        _291 = _299;
    }
    _293 = false;
    float _301 = _291;
    float _303 = in.m_53.z;
    float _305 = _269 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _307 = _269 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _309 = _269 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _311 = in.m_53.x;
    float _313 = in.m_53.y;
    float _315 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].x, _305);
    float _317 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].x, _307);
    float _319 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[5].z, _315);
    float _321 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].x, _309);
    float _323 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _325 = log2(_323);
    int _327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _329 = _327 != 0;
    int _331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _333 = _331 != 0;
    int _335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _337 = _335 != 0;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _339;
    float _343 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[4].z, _317);
    float _345 = _319 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _349 = _301 + _347;
    bool _351 = !_329;
    int _353 = _351 ? 0 : 1;
    float _355 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[6].z, _321);
    float _357 = 1.0 / _341;
    bool _359 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _361 = isnan(_301);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = _343 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _373 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _375 = isnan(_301);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = _355 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _387 = _303 * 2.0;
    float _389 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _391 = _371 + _389;
    float _393 = _325 * _129;
    float _395 = _311 * 2.0;
    float _397 = _313 * 2.0;
    float _399 = floor(_387);
    float _401 = _313 + _303;
    float _403 = _313 + _311;
    int _405 = abs(_353);
    float _407 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _409 = _345 + _407;
    float _411 = _401 + (-1.0);
    float _413 = floor(_395);
    float _415 = _403 + (-1.0);
    float _417 = _349 * _357;
    float _419 = -_383;
    float _421 = _419 + 1.0;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _423;
    float _427 = _409 * _409;
    float _429 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _431 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _433 = _399 > 0.0;
    float _435 = floor(_397);
    bool _437 = _399 >= 0.0;
    bool _439 = isnan(_399);
    bool _441 = _437 || _439;
    bool _443 = isnan(0.0);
    bool _445 = _441 || _443;
    float _447 = _369 * _421;
    float _449 = fma(_425, _417, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _451 = fma(_391, _391, _427);
    int _453 = _445 ? 0 : 1;
    float _455 = in.m_55.x;
    float _457 = in.m_55.y;
    float _459 = in.m_55.z;
    bool _461 = _413 >= 0.0;
    bool _463 = isnan(_413);
    bool _465 = _461 || _463;
    bool _467 = isnan(0.0);
    bool _469 = _465 || _467;
    float _471 = exp2(_393);
    int _473 = ~_453;
    int _475 = _473 + 1;
    int _477 = _475 + 1;
    float _479 = -_369;
    float _481 = _479 + 1.0;
    bool _483 = _413 > 0.0;
    float _485 = _449 * _447;
    int _487 = _477;
    if (!_433)
    {
        int _489 = ~_453;
        int _491 = _489 + 1;
        _487 = _491;
    }
    int _493 = _487;
    float _495 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[143].x, _485);
    bool _497 = _435 > 0.0;
    bool _499 = _435 >= 0.0;
    bool _501 = isnan(_435);
    bool _503 = _499 || _501;
    bool _505 = isnan(0.0);
    bool _507 = _503 || _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _511 = 1.0 + _509;
    float _513 = in.m_51.x;
    float _515 = in.m_51.y;
    int _517 = _469 ? 0 : 1;
    float _519 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[144].x, _495);
    float _521 = -_471;
    float _523 = _521 + 1.0;
    bool _525 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _527 = isnan(0.0);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _533 = _529 || _531;
    float _535 = 1.0 / _511;
    bool _537 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _539 = isnan(1.0);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _545 = _541 || _543;
    float _547 = float(_405);
    float _549 = float(_493);
    bool _551 = !_333;
    int _553 = _551 ? 0 : 1;
    float _555 = _533 ? _523 : 0.0;
    float _557 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _559 = _385 + _557;
    float _561 = _547 * _549;
    bool _563 = !_337;
    int _565 = _563 ? 0 : 1;
    float _567 = fma(_559, _559, _451);
    int _569 = ~_517;
    int _571 = _569 + 1;
    int _573 = _571 + 1;
    int _575 = _573;
    if (_545)
    {
        float _577 = _555 * _535;
        _131 = _577;
    }
    float _579 = _131;
    int _581 = abs(_553);
    float _583 = sqrt(_567);
    float _585 = _519 * _513;
    float _587 = _561 * (-2.0);
    if (!_483)
    {
        int _589 = ~_517;
        int _591 = _589 + 1;
        _575 = _591;
    }
    int _593 = _575;
    float _595 = _311 + (-0.5);
    float _597 = _585 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _599 = rsqrt(_567);
    int _601 = abs(_565);
    float _603 = fma(_587, _455, _455);
    float _605 = float(_581);
    float _607 = fma(_431, _587, _431);
    float _609 = float(_593);
    float _611 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[196].x, _603);
    int _613 = _507 ? 0 : 1;
    float _615 = _583 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _617 = _597 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _619 = _605 * _609;
    float _621 = fma(_607, _579, _611);
    float _623 = _313 + (-0.5);
    float _625 = precise::min(_617, _615);
    float _627 = _619 * (-2.0);
    float _629 = float(_601);
    float _631 = _621 * 0.15915493667125701904296875;
    int _633 = ~_613;
    int _635 = _633 + 1;
    int _637 = _635 + 1;
    float _639 = _599 * _625;
    float _641 = fma(_627, _457, _457);
    float _643 = fma(_429, _627, _429);
    int _645 = _637;
    if (!_497)
    {
        int _647 = ~_613;
        int _649 = _647 + 1;
        _645 = _649;
    }
    int _651 = _645;
    float _653 = _409 * _639;
    float _655 = _391 * _639;
    float _657 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[196].y, _641);
    float _659 = float(_651);
    float _661 = -_653;
    float _663 = _409 + _661;
    float _665 = -_655;
    float _667 = _391 + _665;
    float _669 = fma(_643, _579, _657);
    float _671 = _559 * _639;
    float _673 = _663 * _663;
    float _675 = _629 * _659;
    float _677 = _669 * 0.15915493667125701904296875;
    float _679 = as_type<float>(int(gl_VertexIndex));
    float _681 = fma(_667, _667, _673);
    float _683 = -_671;
    float _685 = _559 + _683;
    float _687 = _675 * (-2.0);
    float _689 = _303 + _311;
    float _691 = fma(_685, _685, _681);
    float _693 = fma(_687, _459, _459);
    float _695 = _689 + (-1.0);
    float _697 = _303 + (-0.5);
    float _699 = _631 * 6.283185482025146484375;
    float _701 = sin(_699);
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _703;
    float _707 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _709 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[196].z, _693);
    float _711 = fma(_705, _417, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _713 = fma(_707, _687, _707);
    float _715 = _631 * 6.283185482025146484375;
    float _717 = cos(_715);
    float _719 = _711 * _447;
    float _721 = fma(_713, _579, _709);
    float _723 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[143].y, _719);
    float _725 = _721 * 0.15915493667125701904296875;
    int _727 = as_type<int>(_679) & 1;
    bool _729 = _727 != 0;
    int _731 = as_type<int>(_679) & 2;
    bool _733 = _731 != 0;
    float _735 = sqrt(_691);
    float _737 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[144].y, _723);
    float _739 = _737 * _515;
    bool _741 = !_733;
    float _743 = _741 ? (-0.5) : 0.5;
    float _745 = _677 * 6.283185482025146484375;
    float _747 = sin(_745);
    float _749 = _739 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _751 = !_729;
    float _753 = _751 ? (-0.5) : 0.5;
    bool _755 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _757 = isnan(0.5);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _763 = _759 || _761;
    float _765 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _753);
    float _767 = _677 * 6.283185482025146484375;
    float _769 = cos(_767);
    float _771 = _599 * _735;
    float _773 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _743);
    float _775 = _749 * _771;
    float _777 = _597 * _771;
    float _779 = _725 * 6.283185482025146484375;
    float _781 = cos(_779);
    float _783 = _775 * _773;
    float _785 = _701 * _747;
    float _787 = _717 * _747;
    float _789 = _725 * 6.283185482025146484375;
    float _791 = sin(_789);
    float _793 = _717 * _769;
    float _795 = _701 * _769;
    float _797 = _781 * _783;
    float _799 = _777 * _765;
    float _801 = _747 * _781;
    float _803 = _769 * _781;
    float _805 = _717 * _797;
    float _807 = fma(_791, _793, _785);
    float _809 = -_795;
    float _811 = fma(_791, _787, _809);
    float _813 = -_783;
    float _815 = _791 * _813;
    float _817 = -_787;
    float _819 = fma(_791, _795, _817);
    float _821 = fma(_807, _799, _805);
    float _823 = _771 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _825 = _823 * 0.5;
    float _827 = _701 * _797;
    float _829 = fma(_803, _799, _815);
    float _831 = fma(_791, _785, _793);
    float _833 = fma(_811, _825, _821);
    float _835 = fma(_819, _799, _827);
    float _837 = fma(_801, _825, _829);
    float _839 = _833 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _841 = fma(_831, _825, _835);
    float _843 = _833 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _845 = _833 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _847 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[26].x, _839);
    float _849 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[24].x, _843);
    float _851 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[25].x, _845);
    float _853 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[26].z, _847);
    float _855 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[24].z, _849);
    float _857 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[25].z, _851);
    float _859 = _853 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _861 = _855 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _863 = _385 + _859;
    float _865 = _371 + _861;
    float _867 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _869 = _863 + _867;
    float _871 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _873 = _865 + _871;
    float _875 = _869 * _869;
    float _877 = fma(_873, _873, _875);
    float _879 = _857 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _881 = sqrt(_877);
    float _883 = _345 + _879;
    float _885 = -_655;
    float _887 = _371 + _885;
    bool _889 = _881 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _891 = _857;
    float _893 = _863;
    float _895 = _865;
    float _897 = _671;
    float _899 = _797;
    if (!_889)
    {
        _891 = _863;
    }
    float _901 = _891;
    float _903 = _901;
    if (!_889)
    {
        _893 = _883;
    }
    float _905 = _893;
    bool _907 = !_889;
    float _909 = _905;
    if (!_907)
    {
        float _911 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _913 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _915 = _881 + _913;
        float _917 = rsqrt(_877);
        float _919 = _915 * _911;
        float _921 = _883 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _923 = _919 * 0.15915493667125701904296875;
        float _925 = _923 * 6.283185482025146484375;
        float _927 = cos(_925);
        float _929 = _923 * 6.283185482025146484375;
        float _931 = sin(_929);
        float _933 = _927 + (-1.0);
        float _935 = _933 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _937 = fma(_931, _921, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _939 = fma(_883, _927, _935);
        float _941 = _917 * _937;
        float _943 = fma(_873, _941, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _945 = fma(_869, _941, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _895 = _943;
        _909 = _939;
        _903 = _945;
    }
    float _947 = _895;
    float _949 = _909;
    float _951 = _903;
    float _953 = -_655;
    float _955 = _953 + _947;
    float _957 = -_653;
    float _959 = _957 + _949;
    float _961 = -_671;
    float _963 = _961 + _951;
    float _965 = -_653;
    float _967 = _345 + _965;
    float _969 = -_671;
    float _971 = _385 + _969;
    float _973 = _959;
    float _975 = _955;
    float _977 = _963;
    if (!_763)
    {
        float _979 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _981 = _967 + _979;
        float _983 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _985 = _887 + _983;
        float _987 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _989 = -_371;
        float _991 = _989 + _947;
        float _993 = _981 * _981;
        float _995 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _997 = _971 + _995;
        float _999 = -_345;
        float _1001 = _999 + _949;
        float _1003 = -_385;
        float _1005 = _1003 + _951;
        float _1007 = fma(_985, _985, _993);
        float _1009 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1011 = fma(_997, _997, _1007);
        float _1013 = sqrt(_1011);
        float _1015 = _987 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1017 = precise::min(_1013, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1019 = _1017 * _1009;
        float _1021 = _1015 * _1019;
        float _1023 = fma(_991, _1021, _887);
        float _1025 = fma(_1001, _1021, _967);
        float _1027 = fma(_1005, _1021, _971);
        _973 = _1025;
        _975 = _1023;
        _977 = _1027;
        _897 = _1021;
    }
    float _1029 = _973;
    float _1031 = _975;
    float _1033 = _977;
    float _1035 = _897;
    float _1037 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1039 = _1029 + _1037;
    float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1043 = _1031 + _1041;
    float _1045 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1047 = _1033 + _1045;
    float _1049 = _1039 * _1039;
    float _1051 = fma(_1043, _1043, _1049);
    float _1053 = fma(_1047, _1047, _1051);
    float _1055 = rsqrt(_1053);
    float _1057 = sqrt(_1053);
    float _1059 = _1055 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1061 = _1043 * _1059;
    float _1063 = _1047 * _1059;
    float _1065 = _1061 * _1061;
    float _1067 = _1063 * _1063;
    float _1069 = _1065 + _1067;
    float _1071 = sqrt(_1069);
    bool _1073 = _1071 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1075 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1077 = _1071 + _1075;
    float _1079 = _1055;
    float _1081 = _1077;
    float _1083 = _1035;
    float _1085 = _1039;
    if (_1073)
    {
        float _1087 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1079 = _1087;
    }
    float _1089 = _1079;
    float _1091 = _1089;
    if (_1073)
    {
        float _1093 = _1077 * _1089;
        _1081 = _1093;
    }
    float _1095 = _1081;
    if (_1073)
    {
        float _1097 = rsqrt(_1069);
        _1091 = _1097;
    }
    float _1099 = _1091;
    float _1101 = _1099;
    if (_1073)
    {
        float _1103 = _1095 * 0.15915493667125701904296875;
        _1083 = _1103;
    }
    float _1105 = _1083;
    float _1107 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1109 = _1047;
    float _1111 = _1105;
    if (_1073)
    {
        float _1113 = _1105 * 6.283185482025146484375;
        float _1115 = sin(_1113);
        _1109 = _1115;
    }
    float _1117 = _1109;
    float _1119 = precise::max(0.0, _1107);
    float _1121 = _949;
    float _1123 = _1119;
    if (_1073)
    {
        float _1125 = _1105 * 6.283185482025146484375;
        float _1127 = cos(_1125);
        _1121 = _1127;
    }
    float _1129 = _1121;
    float _1131 = -_1059;
    float _1133 = -_1119;
    float _1135 = fma(_1039, _1131, _1133);
    if (_1073)
    {
        float _1137 = _1135 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1085 = _1137;
    }
    float _1139 = _1085;
    float _1141 = _1117;
    float _1143 = _1139;
    if (_1073)
    {
        float _1145 = fma(_1117, _1139, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1141 = _1145;
    }
    float _1147 = _1141;
    float _1149 = _1147;
    if (!_1073)
    {
        _1143 = _1135;
    }
    float _1151 = _1143;
    float _1153 = _1151;
    if (_1073)
    {
        float _1155 = _1099 * _1147;
        _899 = _1155;
    }
    float _1157 = _899;
    if (!_1073)
    {
        _1101 = _1061;
    }
    float _1159 = _1101;
    float _1161 = _1159;
    float _1163 = _1129;
    if (_1073)
    {
        float _1165 = _1129 + (-1.0);
        _1123 = _1165;
    }
    float _1167 = _1123;
    float _1169 = _1167;
    if (_1073)
    {
        float _1171 = _1061 * _1157;
        _1161 = _1171;
    }
    float _1173 = _1161;
    if (!_1073)
    {
        _1149 = _1065;
    }
    float _1175 = _1149;
    float _1177 = _1029 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1179 = _1175;
    if (_1073)
    {
        float _1181 = _1167 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1111 = _1181;
    }
    float _1183 = _1111;
    if (!_1073)
    {
        _1169 = _1063;
    }
    float _1185 = _1169;
    float _1187 = _1185;
    if (_1073)
    {
        float _1189 = _1063 * _1157;
        _1187 = _1189;
    }
    float _1191 = _1187;
    if (_1073)
    {
        float _1193 = _1173 * _1173;
        _1179 = _1193;
    }
    float _1195 = _1179;
    if (_1073)
    {
        float _1197 = fma(_1135, _1129, _1183);
        _1153 = _1197;
    }
    float _1199 = _1153;
    if (!_1073)
    {
        _1163 = _1067;
    }
    float _1201 = _1163;
    float _1203 = _1201;
    if (_1073)
    {
        float _1205 = _1191 * _1191;
        _1203 = _1205;
    }
    float _1207 = _1203;
    float _1209 = fma(_1199, _1199, _1195);
    float _1211 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1177);
    float _1213 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1215 = _1029 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1217 = _1209 + _1207;
    float _1219 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1221 = fma(_1057, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1219);
    float _1223 = precise::clamp(_1221, 0.0, 1.0);
    float _1225 = _1029 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1227 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1211);
    float _1229 = rsqrt(_1217);
    float _1231 = -_1223;
    float _1233 = _1231 + 1.0;
    float _1235 = _1029 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1237 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1225);
    float _1239 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1241 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1215);
    float _1243 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1235);
    float _1245 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1237);
    float _1247 = abs(_1233);
    float _1249 = log2(_1247);
    float _1251 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1253 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1243);
    float _1255 = _1245 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1257 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1241);
    float _1259 = -_1251;
    float _1261 = fma(_1259, _1213, 1.0);
    float _1263 = _1253 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1265 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1267 = _1229 * _1173;
    float _1269 = _1229 * _1199;
    float _1271 = _1229 * _1191;
    float _1273 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1265);
    float _1275 = _1267 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1277 = _1257 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1279 = log2(_1261);
    float _1281 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1273);
    float _1283 = -_1275;
    float _1285 = fma(_1269, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1283);
    float _1287 = _1249 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1289 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1291 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1281);
    float _1293 = -_1271;
    float _1295 = fma(_1293, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1285);
    float _1297 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1299 = exp2(_1287);
    float _1301 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1289);
    float _1303 = fma(_1295, -0.5, 0.5);
    float _1305 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1297);
    float _1307 = _1269 + 1.0;
    float _1309 = fma(_1295, 0.5, 0.5);
    float _1311 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1301);
    float _1313 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1305);
    float _1315 = 1.0 / _1291;
    float _1317 = fma(_1309, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1319 = _1279 * 0.693147182464599609375;
    float _1321 = fma(_1309, _1317, -0.212114393711090087890625);
    float _1323 = _1319 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1325 = sqrt(_1303);
    float _1327 = -_1269;
    float _1329 = fma(_1299, _1307, _1327);
    float _1331 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1313);
    float _1333 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1311);
    float _1335 = fma(_1309, _1321, 1.570728778839111328125);
    float _1337 = _1331 * _1315;
    float _1339 = _1333 * _1315;
    float _1341 = fma(_1337, 0.5, 0.5);
    float _1343 = fma(_1339, -0.5, 0.5);
    float _1345 = fma(_1329, 0.5, 0.5);
    float _1347 = _1325 * 0.636619746685028076171875;
    float _1349 = -_1335;
    float _1351 = fma(_1347, _1349, 1.0);
    float3 _3468 = float3(_1341, _1343, _1323);
    float _1353 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3468, float3(0.0), isnan(_3468)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3468, float3(0.0), isnan(_3468)), level(0.0)).x;
    float3 _3479 = float3(_1341, _1343, _1323);
    float4 _1356 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3479, float3(0.0), isnan(_3479)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3479, float3(0.0), isnan(_3479)), level(0.0)).xyzw;
    float _1358 = _1356.x;
    float _1360 = _1356.y;
    float _1362 = _1356.z;
    float _1364 = _1356.w;
    float2 _3496 = float2(_1351, _1345);
    float3 _1368 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3496, float2(0.0), isnan(_3496)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3496, float2(0.0), isnan(_3496)), level(0.0)).xyz;
    float _1370 = _1368.x;
    float _1372 = _1368.y;
    float _1374 = _1368.z;
    float _1376 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1378 = _313 > 0.5;
    out.m_60.x = _887;
    out.m_60.y = _967;
    out.m_60.z = _971;
    bool _1380 = _311 > 0.5;
    float _1382 = _1291 * 0.5;
    int _1384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1386 = _1384 != 0;
    out.m_62.w = _625;
    float _1388 = -_743;
    int _1390 = _1378 ? as_type<int>(_1388) : as_type<int>(_743);
    float _1392 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1394 = _1249 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1396 = !_1386;
    float _1398 = _1396 ? _743 : as_type<float>(_1390);
    float _1400 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1404 = _1402 != 0;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1408 = -_753;
    int _1410 = _1380 ? as_type<int>(_1408) : as_type<int>(_753);
    float _1412 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1400);
    float _1414 = -_1398;
    float _1416 = _1414 + 0.5;
    bool _1418 = !_1404;
    float _1420 = _1418 ? _753 : as_type<float>(_1410);
    float _1422 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1412);
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1426 = _1416 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1428 = _1420 + 0.5;
    float _1430 = _1424 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1432 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1434 = _1428 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1436 = exp2(_1394);
    float _1438 = _1426 * _1392;
    float _1440 = _1434 * _1376;
    float _1442 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1422);
    float _1444 = _1331 + _1291;
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1448 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1452 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1454 = _1442 + _1291;
    float _1456 = _1444 * 0.5;
    float _1458 = -_1436;
    float _1460 = _1458 + 1.0;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1466 = _1446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1468 = _1460 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1470 = _1448 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1472 = _1450 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1474 = _1452 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1476 = _1454 * 0.5;
    float _1478 = fma(_1333, -0.5, _1382);
    float _1480 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_64.x = _1466;
    out.m_64.y = _1470;
    out.m_64.z = _1472;
    out.m_64.w = _1462;
    out.m_66.x = _1474;
    out.m_66.y = _1430;
    out.m_66.z = _1432;
    out.m_66.w = _1464;
    out.m_68.x = _1440;
    out.m_68.y = _1438;
    out.m_70.x = _777;
    out.m_72.x = _1031;
    out.m_72.y = _1029;
    out.m_72.z = _1033;
    out.gl_Position.x = _1331;
    out.gl_Position.y = _1333;
    out.gl_Position.z = _1442;
    out.gl_Position.w = _1291;
    out.m_74.x = _1456;
    out.m_74.y = _1478;
    out.m_74.z = _1476;
    out.m_74.w = _1291;
    out.m_47.x = _1480;
    float _1482 = _1468 * _1353;
    float _1484 = -_1468;
    float _1486 = _1484 + 1.0;
    float _1488 = _1364 * _1482;
    float _1490 = _1374 * _1482;
    float _1492 = _1364 * _1486;
    float _1494 = fma(_1370, _1488, _1358);
    float _1496 = fma(_1372, _1488, _1360);
    float _1498 = fma(_1364, _1490, _1362);
    out.m_76.x = _1494;
    out.m_76.y = _1496;
    out.m_76.z = _1498;
    out.m_76.w = _1492;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

