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
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_1C [[id(8)]];
    sampler vp_t_tcb_1CSmplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    sampler vp_t_tcb_30Smplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_72 [[user(locn0)]];
    float4 m_80 [[user(locn1)]];
    float4 m_86 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_74 [[user(locn4)]];
    float4 m_78 [[user(locn5)]];
    float4 m_90 [[user(locn6)]];
    float4 m_49 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_88 [[user(locn9)]];
    float4 m_92 [[user(locn10)]];
    float4 m_82 [[user(locn11)]];
    float4 m_51 [[user(locn12)]];
    float4 m_55 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_62 [[attribute(1)]];
    float4 m_64 [[attribute(2)]];
    float4 m_66 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
    float4 m_44 [[attribute(6)]];
    float4 m_46 [[attribute(7)]];
    float4 m_53 [[attribute(8)]];
    float4 m_70 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3193 = false;
    bool _253 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_44.w;
    float _108 = in.m_46.w;
    float _110 = trunc(_106);
    int _113 = int(_110);
    float _115 = -_108;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = as_type<float>(_113);
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _123;
    if (!_121)
    {
        out.m_51.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3503 = as_type<float>(_133);
        out.gl_Position.z = _3503;
    }
    if (!_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _137 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_108);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = in.m_53.x;
    float _149 = float(_113);
    float _151 = in.m_53.y;
    bool _153 = _117 >= _149;
    bool _155 = !_145;
    bool _157 = _153 || _155;
    float _159 = in.m_53.z;
    if (_157)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _125;
    if (_157)
    {
        out.m_51.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _135 = as_type<int>(_163);
    }
    int _165 = _135;
    out.m_55.x = _147;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3566 = as_type<float>(_165);
        out.gl_Position.z = _3566;
    }
    out.m_55.y = _151;
    out.m_55.z = _159;
    float _167 = _159;
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = 1.0 / _149;
    float _173 = in.m_60.x;
    float _175 = in.m_60.y;
    float _177 = in.m_60.z;
    float _179 = in.m_62.x;
    float _181 = in.m_62.y;
    float _183 = in.m_62.z;
    float _185 = in.m_64.x;
    float _187 = in.m_64.y;
    float _189 = in.m_64.z;
    float _191 = in.m_66.x;
    float _193 = in.m_66.y;
    float _195 = in.m_66.z;
    float _197 = _117 * _171;
    int _199 = as_type<int>(_169) & 1;
    bool _201 = _199 != 0;
    int _203 = as_type<int>(_169) & 2;
    bool _205 = _203 != 0;
    bool _207 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _209 = !_201;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = _175 * _181;
    float _215 = _175 * _187;
    float _217 = fma(_173, _179, _213);
    float _219 = _175 * _193;
    float _221 = fma(_173, _185, _215);
    float _223 = fma(_177, _183, _217);
    float _225 = fma(_173, _191, _219);
    float _227 = fma(_177, _189, _221);
    bool _229 = !_205;
    float _231 = _229 ? (-0.5) : 0.5;
    float _233 = fma(_177, _195, _225);
    bool _235 = !_207;
    float _251;
    if (!_235)
    {
        float _237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _239 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _243 = _241 * _237;
        float _245 = floor(_243);
        float _247 = -_245;
        float _249 = _243 + _247;
        _251 = _249;
        _253 = true;
    }
    else
    {
        _251 = _197;
    }
    _253 = false;
    float _255 = _251;
    float _257 = in.m_44.x;
    float _259 = in.m_44.y;
    float _261 = in.m_44.z;
    float _263 = _151 * 2.0;
    float _265 = _159 * 2.0;
    float _267 = _147 * 2.0;
    float _269 = floor(_263);
    float _271 = _117 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _273 = _271 * _147;
    float _275 = floor(_265);
    float _277 = _273 * 0.15915493667125701904296875;
    float _279 = floor(_267);
    bool _281 = _269 > 0.0;
    float _283 = _181 * _259;
    float _285 = _187 * _259;
    float _287 = _193 * _259;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _289;
    float _293 = fma(_179, _257, _283);
    float _295 = _151 + _159;
    float _297 = fma(_185, _257, _285);
    float _299 = fma(_191, _257, _287);
    float _301 = _295 + (-1.0);
    float _303 = _147 + _159;
    float _305 = 1.0 / _291;
    float _307 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _309 = _303 + (-1.0);
    float _311 = _147 + _151;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _317 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _327 = _311 + (-1.0);
    float _329 = 1.0 / _315;
    bool _331 = _275 > 0.0;
    float _333 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _335 = _275 >= 0.0;
    bool _337 = isnan(_275);
    bool _339 = _335 || _337;
    bool _341 = isnan(0.0);
    bool _343 = _339 || _341;
    float _345 = 1.0 / _325;
    float _347 = (*spvDescriptorSet0.vp_c10)._m0[9].z * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _349;
    float _353 = fma(_183, _261, _293);
    float _355 = fma(_189, _261, _297);
    float _357 = fma((*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].z, _347);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _361 = _255 + _359;
    float _363 = fma(_195, _261, _299);
    float _365 = 1.0 / _321;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _369 = _255 + _367;
    float _371 = _361 * _305;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _375 = _255 + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _385 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _387 = isnan(_255);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = _355 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _399 = 1.0 / _351;
    float _401 = _375 * _345;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _405 = _255 + _403;
    bool _407 = _279 > 0.0;
    float _409 = fma(_379, _371, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _411 = _279 >= 0.0;
    bool _413 = isnan(_279);
    bool _415 = _411 || _413;
    bool _417 = isnan(0.0);
    bool _419 = _415 || _417;
    float _421 = _405 * _329;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _423;
    float _427 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _429 = log2(_427);
    float _431 = _369 * _365;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _439 = _255 + _437;
    float _441 = fma(_383, _421, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _443 = fma(_435, _421, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _445 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _447 = isnan(_255);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = _439 * _399;
    float _459 = fma((*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].z, _357);
    float _461 = -_395;
    float _463 = _461 + 1.0;
    float _465 = -_455;
    float _467 = _465 + 1.0;
    float _469 = _455 * _463;
    float _471 = _117 * _429;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _477;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _485 = exp2(_471);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _493 = 1.0 + _491;
    float _495 = fma(_483, _401, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    bool _497 = _269 >= 0.0;
    bool _499 = isnan(_269);
    bool _501 = _497 || _499;
    bool _503 = isnan(0.0);
    bool _505 = _501 || _503;
    float _507 = fma(_489, _401, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _509 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _511 = isnan(_255);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = fma(_425, _371, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _523 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _525 = isnan(_255);
    bool _527 = _523 || _525;
    bool _529 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _531 = _527 || _529;
    float _533 = float(_531);
    float _535 = fma(_475, _431, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _537 = fma(_479, _431, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _539 = _343 ? 0 : 1;
    float _541 = 1.0 / _493;
    bool _543 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _545 = isnan(_255);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _555;
    bool _559 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _561 = isnan(_255);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _567 = _563 || _565;
    float _569 = float(_567);
    float _571 = _519 * _467;
    float _573 = -_519;
    float _575 = _573 + 1.0;
    float _577 = -_533;
    float _579 = _577 + 1.0;
    int _581 = ~_539;
    int _583 = _581 + 1;
    int _585 = _583 + 1;
    float _587 = _277 * 6.283185482025146484375;
    float _589 = cos(_587);
    int _591 = _585;
    if (!_331)
    {
        int _593 = ~_539;
        int _595 = _593 + 1;
        _591 = _595;
    }
    int _597 = _591;
    float _599 = _569 * _575;
    float _601 = -_485;
    float _603 = _601 + 1.0;
    float _605 = -_569;
    float _607 = _605 + 1.0;
    float _609 = _553 * _579;
    bool _611 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _613 = isnan(0.0);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _619 = _615 || _617;
    float _621 = -_553;
    float _623 = _621 + 1.0;
    float _625 = rsqrt(_459);
    float _627 = _533 * _607;
    float _629 = _521 * _609;
    float _631 = _619 ? _603 : 0.0;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _633;
    float _637 = _409 * _609;
    int _639 = _505 ? 0 : 1;
    float _641 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[143].x, _629);
    float _643 = _277 * 6.283185482025146484375;
    float _645 = sin(_643);
    int _647 = _419 ? 0 : 1;
    float _649 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[143].y, _637);
    int _651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _653 = _651 != 0;
    int _655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _657 = _655 != 0;
    int _659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _661 = _659 != 0;
    float _663 = _631 * _541;
    float _665 = -_589;
    float _667 = _665 + 1.0;
    float _669 = fma(_443, _627, _641);
    float _671 = fma(_441, _627, _649);
    float _673 = _625 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _675 = _625 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _677 = _625 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    bool _679 = !_657;
    int _681 = _679 ? 0 : 1;
    float _683 = _673 * _667;
    bool _685 = !_653;
    int _687 = _685 ? 0 : 1;
    float _689 = fma(_635, _457, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    bool _691 = !_661;
    int _693 = _691 ? 0 : 1;
    float _695 = _675 * _645;
    int _697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _699 = _697 != 0;
    int _701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _703 = _701 != 0;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _707 = _705 != 0;
    float _709 = _677 * _645;
    int _711 = ~_639;
    int _713 = _711 + 1;
    int _715 = _713 + 1;
    float _717 = _673 * _645;
    float _719 = _677 * _667;
    int _721 = _715;
    if (!_281)
    {
        int _723 = ~_639;
        int _725 = _723 + 1;
        _721 = _725;
    }
    int _727 = _721;
    float _729 = fma(_677, _683, _695);
    bool _731 = !_699;
    int _733 = _731 ? 0 : 1;
    float _735 = fma(_557, _457, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _737 = fma(_673, _683, _589);
    float _739 = -_695;
    float _741 = fma(_677, _683, _739);
    float _743 = -_709;
    float _745 = fma(_675, _683, _743);
    float _747 = fma(_675, _683, _709);
    float _749 = fma(_675, _719, _717);
    float _751 = -_717;
    float _753 = fma(_675, _719, _751);
    int _755 = ~_647;
    int _757 = _755 + 1;
    int _759 = _757 + 1;
    float _761 = _675 * _675;
    int _763 = _759;
    if (!_407)
    {
        int _765 = ~_647;
        int _767 = _765 + 1;
        _763 = _767;
    }
    int _769 = _763;
    float _771 = _353 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _773 = abs(_733);
    float _775 = in.m_68.x;
    float _777 = in.m_68.y;
    float _779 = in.m_68.z;
    float _781 = fma(_677, _719, _589);
    float _783 = fma(_667, _761, _589);
    float _785 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _787 = _397 + _785;
    float _789 = float(_597);
    float _791 = _363 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _793 = float(_773);
    float _795 = _787 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _797 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _799 = _771 + _797;
    float _801 = _787 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _803 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _805 = isnan(1.0);
    bool _807 = _803 || _805;
    bool _809 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _811 = _807 || _809;
    float _813 = _793 * _789;
    float _815 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[8].x, _795);
    float _817 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[8].y, _801);
    float _819 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _821 = _791 + _819;
    float _823 = fma(_535, _599, _669);
    float _825 = _813 * (-2.0);
    float _827 = fma(_537, _599, _671);
    float _829 = fma(_821, (*spvDescriptorSet0.vp_c10)._m0[10].y, _817);
    float _831 = fma(_821, (*spvDescriptorSet0.vp_c10)._m0[10].x, _815);
    float _833 = fma(_333, _825, _333);
    bool _835 = !_707;
    int _837 = _835 ? 0 : 1;
    float _839 = _829 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _841 = _829 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _843 = _829 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _845 = fma(_825, _775, _775);
    float _847 = fma(_831, (*spvDescriptorSet0.vp_c10)._m0[9].x, _839);
    float _849 = fma(_831, (*spvDescriptorSet0.vp_c10)._m0[8].x, _841);
    bool _851 = !_703;
    int _853 = _851 ? 0 : 1;
    float _855 = fma(_831, (*spvDescriptorSet0.vp_c10)._m0[10].x, _843);
    int _857 = abs(_837);
    float _859 = _847 * _847;
    int _861 = abs(_853);
    float _863 = _147 + (-0.5);
    float _865 = fma(_507, _571, _827);
    float _867 = float(_727);
    float _869 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[196].x, _845);
    float _871 = fma(_735, _469, _865);
    float _873 = float(_769);
    float _875 = float(_857);
    float _877 = fma(_849, _849, _859);
    float _879 = float(_861);
    bool _881 = !_811;
    float _883 = _881 ? _117 : _663;
    float _885 = fma(_855, _855, _877);
    float _887 = _875 * _867;
    float _889 = _879 * _873;
    float _891 = fma(_495, _571, _823);
    float _893 = fma(_883, _833, _869);
    float _895 = _151 + (-0.5);
    float _897 = rsqrt(_885);
    float _899 = _889 * (-2.0);
    float _901 = in.m_70.x;
    float _903 = in.m_70.y;
    float _905 = fma(_689, _469, _891);
    float _907 = _893 * 0.15915493667125701904296875;
    float _909 = fma(_899, _777, _777);
    float _911 = fma(_307, _899, _307);
    float _913 = _887 * (-2.0);
    float _915 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[148].x, _905);
    float _917 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[196].y, _909);
    float _919 = _159 + (-0.5);
    float _921 = fma(_913, _779, _779);
    float _923 = fma(_317, _913, _317);
    float _925 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[148].y, _871);
    float _927 = fma(_883, _911, _917);
    float _929 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[196].z, _921);
    float _931 = _897 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _933 = _907 * 6.283185482025146484375;
    float _935 = sin(_933);
    float _937 = _927 * 0.15915493667125701904296875;
    float _939 = fma(_883, _923, _929);
    float _941 = _847 * _931;
    float _943 = _849 * _931;
    float _945 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _231);
    float _947 = _939 * 0.15915493667125701904296875;
    float _949 = _941 * _781;
    float _951 = _941 * _741;
    float _953 = _925 * _903;
    float _955 = _855 * _931;
    float _957 = fma(_943, _729, _949);
    float _959 = _941 * _749;
    float _961 = fma(_943, _737, _951);
    float _963 = _915 * _901;
    float _965 = fma(_955, _753, _957);
    float _967 = fma(_943, _745, _959);
    float _969 = fma(_955, _747, _961);
    float _971 = _907 * 6.283185482025146484375;
    float _973 = cos(_971);
    float _975 = _397 + _965;
    float _977 = fma(_955, _783, _967);
    float _979 = _771 + _969;
    float _981 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _211);
    float _983 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _985 = _975 + _983;
    float _987 = _963 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _989 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _991 = _979 + _989;
    float _993 = _937 * 6.283185482025146484375;
    float _995 = sin(_993);
    float _997 = _985 * _985;
    float _999 = _791 + _977;
    float _1001 = _953 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1003 = fma(_991, _991, _997);
    float _1005 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1007 = _999 + _1005;
    float _1009 = _987 * _981;
    float _1011 = _937 * 6.283185482025146484375;
    float _1013 = cos(_1011);
    float _1015 = _1001 * _945;
    float _1017 = fma(_1007, _1007, _1003);
    float _1019 = _947 * 6.283185482025146484375;
    float _1021 = cos(_1019);
    float _1023 = _935 * _995;
    float _1025 = _973 * _995;
    float _1027 = _947 * 6.283185482025146484375;
    float _1029 = sin(_1027);
    float _1031 = _973 * _1013;
    float _1033 = _935 * _1013;
    float _1035 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
    float _1037 = _973 * _1021;
    float _1039 = _935 * _1021;
    float _1041 = _1013 * _1021;
    float _1043 = _995 * _1021;
    float _1045 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1047 = sqrt(_1017);
    float _1049 = fma(_1029, _1031, _1023);
    float _1051 = fma(_1029, _1023, _1031);
    float _1053 = _1037 * _1015;
    float _1055 = -_1025;
    float _1057 = fma(_1029, _1033, _1055);
    float _1059 = -_1033;
    float _1061 = fma(_1029, _1025, _1059);
    float _1063 = -_1015;
    float _1065 = _1029 * _1063;
    float _1067 = fma(_1049, _1009, _1053);
    float _1069 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
    float _1071 = _1039 * _1015;
    float _1073 = fma(_1041, _1009, _1065);
    float _1075 = fma(_1061, _1045, _1067);
    float _1077 = fma(_1057, _1009, _1071);
    float _1079 = fma(_1043, _1045, _1073);
    float _1081 = _1069 * _1047;
    float _1083 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1085 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1087 = fma(_1051, _1045, _1077);
    float _1089 = fma(_1081, 0.00449999980628490447998046875, 0.100000001490116119384765625);
    float _1091 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1083);
    float _1093 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1085);
    float _1095 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1097 = precise::max(_1089, 0.100000001490116119384765625);
    float _1099 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1091);
    float _1101 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1093);
    float _1103 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1095);
    float _1105 = precise::min(_1097, 1.0);
    float _1107 = _1099 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1109 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1111 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1103);
    float _1113 = fma(_1107, _1105, _999);
    float _1115 = fma(_1109, _1105, _979);
    float _1117 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1119 = _1113 + _1117;
    float _1121 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1123 = _1115 + _1121;
    float _1125 = _1119 * _1119;
    float _1127 = fma(_1123, _1123, _1125);
    float _1129 = _1111 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1131 = sqrt(_1127);
    float _1133 = fma(_1129, _1105, _975);
    bool _1135 = _1131 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1139 = _1137 != 0;
    int _1141 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1143 = _1141 != 0;
    int _1145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1147 = _1145 != 0;
    int _1149 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1151 = _1149 != 0;
    bool _1153 = !_1143;
    int _1155 = _1153 ? 0 : 1;
    bool _1157 = !_1139;
    int _1159 = _1157 ? 0 : 1;
    float _1161 = _975;
    float _1163 = _1115;
    float _1165 = _1129;
    if (!_1135)
    {
        _1161 = _1115;
    }
    float _1167 = _1161;
    bool _1169 = !_1147;
    int _1171 = _1169 ? 0 : 1;
    bool _1173 = !_1151;
    int _1175 = _1173 ? 0 : 1;
    float _1177 = _1167;
    if (!_1135)
    {
        _1163 = _1113;
    }
    float _1179 = _1163;
    float _1181 = _1179;
    if (!_1135)
    {
        _1165 = _1133;
    }
    float _1183 = _1165;
    bool _1185 = !_1135;
    float _1187 = _1183;
    if (!_1185)
    {
        float _1189 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1191 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1193 = _1131 + _1191;
        float _1195 = _1133 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1197 = rsqrt(_1127);
        float _1199 = _1193 * _1189;
        float _1201 = _1199 * 0.15915493667125701904296875;
        float _1203 = _1201 * 6.283185482025146484375;
        float _1205 = cos(_1203);
        float _1207 = _1201 * 6.283185482025146484375;
        float _1209 = sin(_1207);
        float _1211 = _1205 + (-1.0);
        float _1213 = _1211 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1215 = fma(_1209, _1195, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1217 = fma(_1133, _1205, _1213);
        float _1219 = _1197 * _1215;
        float _1221 = fma(_1123, _1219, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1223 = fma(_1119, _1219, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1187 = _1217;
        _1177 = _1221;
        _1181 = _1223;
    }
    float _1225 = _1187;
    float _1227 = _1177;
    float _1229 = _1181;
    float _1231 = -_397;
    float _1233 = _1231 + _1225;
    float _1235 = -_771;
    float _1237 = _1235 + _1227;
    float _1239 = -_791;
    float _1241 = _1239 + _1229;
    float _1243 = _1233 * _1233;
    float _1245 = fma(_1237, _1237, _1243);
    float _1247 = fma(_1241, _1241, _1245);
    float _1249 = sqrt(_1247);
    bool _1251 = _1249 > 0.0;
    bool _1253 = !_1251;
    float _1255 = _1225;
    float _1257 = _1227;
    float _1259 = _1229;
    float _1261 = _1237;
    if (!_1253)
    {
        float _1263 = _227 * _227;
        float _1265 = fma(_223, _223, _1263);
        float _1267 = fma(_233, _233, _1265);
        float _1269 = rsqrt(_1247);
        float _1271 = sqrt(_1267);
        float _1273 = _1237 * _1269;
        float _1275 = _1233 * _1269;
        float _1277 = _1241 * _1269;
        bool _1279 = _1271 > 0.0;
        bool _1281 = !_1279;
        if (!_1281)
        {
            float _1283 = rsqrt(_1267);
            float _1285 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1287 = _227 * _1283;
            float _1289 = _223 * _1283;
            float _1291 = _233 * _1283;
            float _1293 = _1275 * _1287;
            float _1295 = fma(_1273, _1289, _1293);
            float _1297 = _1285 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1299 = fma(_1277, _1291, _1295);
            float _1301 = _1299 * _1297;
            float _1303 = fma(_223, _1301, _1227);
            float _1305 = fma(_227, _1301, _1225);
            float _1307 = fma(_233, _1301, _1229);
            _1255 = _1305;
            _1257 = _1303;
            _1259 = _1307;
            _1261 = _1295;
        }
    }
    float _1309 = _1255;
    float _1311 = _1257;
    float _1313 = _1259;
    float _1315 = _1261;
    float _1317 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1319 = _1309 + _1317;
    float _1321 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1323 = _1311 + _1321;
    float _1325 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1327 = _1313 + _1325;
    float _1329 = _1319 * _1319;
    float _1331 = fma(_1323, _1323, _1329);
    float _1333 = fma(_1327, _1327, _1331);
    float _1335 = rsqrt(_1333);
    float _1337 = sqrt(_1333);
    float _1339 = _1335 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1341 = _1323 * _1339;
    float _1343 = _1327 * _1339;
    float _1345 = _1341 * _1341;
    float _1347 = _1343 * _1343;
    float _1349 = _1345 + _1347;
    float _1351 = sqrt(_1349);
    bool _1353 = _1351 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1355 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1357 = _1351 + _1355;
    float _1359 = _1327;
    float _1361 = _1329;
    float _1363 = _1357;
    float _1365 = _1315;
    float _1367 = _1339;
    if (_1353)
    {
        float _1369 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1359 = _1369;
    }
    float _1371 = _1359;
    if (_1353)
    {
        float _1373 = rsqrt(_1349);
        _1361 = _1373;
    }
    float _1375 = _1361;
    float _1377 = _1375;
    if (_1353)
    {
        float _1379 = _1357 * _1371;
        _1363 = _1379;
    }
    float _1381 = _1363;
    if (_1353)
    {
        float _1383 = _1381 * 0.15915493667125701904296875;
        _1365 = _1383;
    }
    float _1385 = _1365;
    float _1387 = _1371;
    if (_1353)
    {
        float _1389 = _1385 * 6.283185482025146484375;
        float _1391 = sin(_1389);
        _1387 = _1391;
    }
    float _1393 = _1387;
    float _1395 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1397 = precise::max(0.0, _1395);
    float _1399 = _1335;
    float _1401 = _1397;
    if (_1353)
    {
        float _1403 = _1385 * 6.283185482025146484375;
        float _1405 = cos(_1403);
        _1399 = _1405;
    }
    float _1407 = _1399;
    float _1409 = -_1339;
    float _1411 = -_1397;
    float _1413 = fma(_1319, _1409, _1411);
    float _1415 = _1413;
    if (_1353)
    {
        float _1417 = _1413 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1401 = _1417;
    }
    float _1419 = _1401;
    float _1421 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1423 = _1393;
    float _1425 = _1419;
    if (_1353)
    {
        float _1427 = fma(_1393, _1419, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1367 = _1427;
    }
    float _1429 = _1367;
    float _1431 = _1429;
    if (!_1353)
    {
        _1423 = _1341;
    }
    float _1433 = _1423;
    float _1435 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1421);
    float _1437 = _1433;
    float _1439 = _1407;
    if (_1353)
    {
        float _1441 = _1407 + (-1.0);
        _1425 = _1441;
    }
    float _1443 = _1425;
    float _1445 = _1443;
    if (_1353)
    {
        float _1447 = _1375 * _1429;
        _1431 = _1447;
    }
    float _1449 = _1431;
    float _1451 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1435);
    if (_1353)
    {
        float _1453 = _1443 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1377 = _1453;
    }
    float _1455 = _1377;
    float _1457 = _1455;
    if (_1353)
    {
        float _1459 = _1341 * _1449;
        _1437 = _1459;
    }
    float _1461 = _1437;
    if (!_1353)
    {
        _1445 = _1343;
    }
    float _1463 = _1445;
    float _1465 = _1463;
    if (_1353)
    {
        float _1467 = _1343 * _1449;
        _1465 = _1467;
    }
    float _1469 = _1465;
    if (_1353)
    {
        float _1471 = fma(_1413, _1407, _1455);
        _1415 = _1471;
    }
    float _1473 = _1415;
    if (!_1353)
    {
        _1439 = _1345;
    }
    float _1475 = _1439;
    float _1477 = _1475;
    if (_1353)
    {
        float _1479 = _1461 * _1461;
        _1477 = _1479;
    }
    float _1481 = _1477;
    if (!_1353)
    {
        _1457 = _1347;
    }
    float _1483 = _1457;
    float _1485 = _1483;
    if (_1353)
    {
        float _1487 = _1469 * _1469;
        _1485 = _1487;
    }
    float _1489 = _1485;
    float _1491 = _1451 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1493 = fma(_1473, _1473, _1481);
    float _1495 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1497 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1499 = _1493 + _1489;
    float _1501 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1503 = _1491 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1505 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1495);
    float _1507 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1497);
    float _1509 = rsqrt(_1499);
    float _1511 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1513 = fma(_1337, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1511);
    float _1515 = precise::clamp(_1513, 0.0, 1.0);
    float _1517 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1507);
    float _1519 = -_1515;
    float _1521 = _1519 + 1.0;
    float _1523 = -_1503;
    float _1525 = fma(_1523, _1501, 1.0);
    float _1527 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1529 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1505);
    float _1531 = _1517 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1533 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1527);
    float _1535 = abs(_1521);
    float _1537 = log2(_1535);
    float _1539 = _1529 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1541 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1533);
    float _1543 = _1509 * _1461;
    float _1545 = _1509 * _1473;
    float _1547 = _1509 * _1469;
    float _1549 = _1541 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1551 = _1543 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1553 = _1539 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1555 = log2(_1525);
    float _1557 = -_1551;
    float _1559 = fma(_1545, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1557);
    float _1561 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1553);
    float _1563 = -_1547;
    float _1565 = fma(_1563, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1559);
    float _1567 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1561);
    float _1569 = _1537 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1571 = _1539 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1573 = fma(_1565, -0.5, 0.5);
    float _1575 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1567);
    float _1577 = fma(_1565, 0.5, 0.5);
    float _1579 = exp2(_1569);
    float _1581 = _1539 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1583 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1571);
    float _1585 = fma(_1577, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1587 = _1545 + 1.0;
    float _1589 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1581);
    float _1591 = _1555 * 0.693147182464599609375;
    float _1593 = fma(_1577, _1585, -0.212114393711090087890625);
    float _1595 = sqrt(_1573);
    float _1597 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1583);
    float _1599 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1589);
    float _1601 = fma(_1577, _1593, 1.570728778839111328125);
    float _1603 = _1591 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1605 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1597);
    float _1607 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1599);
    float _1609 = 1.0 / _1575;
    float _1611 = -_1545;
    float _1613 = fma(_1579, _1587, _1611);
    float _1615 = fma(_1613, 0.5, 0.5);
    float _1617 = _1595 * 0.636619746685028076171875;
    float _1619 = -_1601;
    float _1621 = fma(_1617, _1619, 1.0);
    float _1623 = _1605 * _1609;
    float _1625 = _1607 * _1609;
    float _1627 = fma(_1623, 0.5, 0.5);
    float _1629 = fma(_1625, -0.5, 0.5);
    float3 _5866 = float3(_1627, _1629, _1603);
    float _1631 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5866, float3(0.0), isnan(_5866)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5866, float3(0.0), isnan(_5866)), level(0.0)).x;
    float2 _5877 = float2(_1621, _1615);
    float3 _1635 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5877, float2(0.0), isnan(_5877)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5877, float2(0.0), isnan(_5877)), level(0.0)).xyz;
    float _1637 = _1635.x;
    float _1639 = _1635.y;
    float _1641 = _1635.z;
    float3 _5894 = float3(_1627, _1629, _1603);
    float4 _1644 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5894, float3(0.0), isnan(_5894)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5894, float3(0.0), isnan(_5894)), level(0.0)).xyzw;
    float _1646 = _1644.x;
    float _1648 = _1644.y;
    float _1650 = _1644.z;
    float _1652 = _1644.w;
    float _1654 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1656 = int(_1654);
    float _1658 = in.m_53.w;
    int _1660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1662 = _1660 != 0;
    float _1664 = _1539 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_72.x = _771;
    out.m_72.y = _397;
    out.m_72.z = _791;
    bool _1666 = _147 > 0.5;
    float _1668 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1670 = int(_1668);
    bool _1672 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1674 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1676 = _1672 || _1674;
    bool _1678 = isnan(0.5);
    bool _1680 = _1676 || _1678;
    out.m_74.x = _1311;
    out.m_74.y = _1309;
    out.m_74.z = _1313;
    bool _1682 = _151 > 0.5;
    int _1684 = abs(_681);
    float _1686 = float(_1656);
    float _1688 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1690 = int(_1688);
    float _1692 = float(uint(_1670));
    float _1694 = 1.0 / _1686;
    bool _1696 = _1658 > 0.5;
    int _1698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1700 = _1698 != 0;
    float _1702 = 1.0 / _1692;
    float _1704 = float(_1690);
    float _1706 = _147 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1708 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1710 = _1708 != 0;
    float _1712 = _117 * _1694;
    float _1714 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1716 = int(_1714);
    float _1718 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1720 = _1605;
    float _1722 = _1575;
    float _1724 = _1607;
    if (_1700)
    {
        _1718 = _147;
    }
    float _1726 = _1718;
    float _1728 = _1726;
    if (!_1700)
    {
        _1728 = _151;
    }
    float _1730 = _1728;
    float _1732 = 0.0;
    if (_1700)
    {
        _1732 = 1.0;
    }
    float _1734 = _1732;
    int _1736 = as_type<int>(_1702) + (-2);
    float _1738 = trunc(_1712);
    int _1740 = int(_1738);
    float _1742 = _1734;
    if (!_1700)
    {
        _1742 = 7.345489978790283203125;
    }
    float _1744 = _1742;
    float _1746 = _1744 * _147;
    float _1748 = 1.0 / _1704;
    float _1750 = float(uint(_1716));
    int _1752 = ~_1716;
    int _1754 = _1752 + 1;
    int _1756 = ~_1716;
    int _1758 = _1756 + 1;
    float _1760 = float(uint(_1740));
    float _1762 = 1.0 / _1750;
    float _1764 = as_type<float>(_1736) * _1760;
    float _1766 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1768 = ~_1670;
    int _1770 = _1768 + 1;
    float _1772 = _117 * _1748;
    float _1774 = _1748;
    if (_1700)
    {
        _1774 = 1.0;
    }
    float _1776 = _1774;
    float _1778 = -_1766;
    float _1780 = fma(_1706, 2.0, _1778);
    float _1782 = trunc(_1764);
    float _1784 = precise::max(_1782, 0.0);
    uint _1787 = uint(_1784);
    float _1789 = _1776;
    if (!_1700)
    {
        _1789 = 1.2345600128173828125;
    }
    float _1791 = _1789;
    float _1793 = -_117;
    float _1795 = fma(_1793, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1780);
    float _1797 = _1791 * _1730;
    float _1799 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1801 = trunc(_1772);
    int _1803 = int(_1801);
    float _1805 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1807 = as_type<int>(_1762) + (-2);
    float _1809 = fma(_1799, -2.0, _1805);
    int _1811 = _1770 * int(_1787);
    int _1813 = _1811 + _1740;
    float _1815 = floor(_1746);
    float _1817 = -_211;
    int _1819 = _1666 ? as_type<int>(_1817) : as_type<int>(_211);
    float _1821 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1809);
    int _1823 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1825 = _1823 != 0;
    float _1827 = float(uint(_1813));
    float _1829 = float(uint(_1803));
    float _1831 = floor(_1797);
    float _1833 = -_231;
    int _1835 = _1682 ? as_type<int>(_1833) : as_type<int>(_231);
    bool _1837 = !_1710;
    float _1839 = _1837 ? _211 : as_type<float>(_1819);
    float _1841 = as_type<float>(_1807) * _1829;
    float _1843 = as_type<float>(_1736) * _1827;
    bool _1845 = !_1825;
    float _1847 = _1845 ? _231 : as_type<float>(_1835);
    int _1849 = as_type<int>(_1827);
    if (_1700)
    {
        _1849 = 0;
    }
    int _1851 = _1849;
    float _1853 = -_1815;
    float _1855 = _1746 + _1853;
    float _1857 = trunc(_1841);
    float _1859 = precise::max(_1857, 0.0);
    uint _1861 = uint(_1859);
    int _1863 = _1851;
    if (!_1700)
    {
        _1863 = 1;
    }
    int _1865 = _1863;
    float _1867 = _1839 + 0.5;
    float _1869 = _1847 + (-0.5);
    bool _1871 = _159 > 0.5;
    bool _1873 = _1865 != 1;
    float _1875 = fma(_1867, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1795);
    float _1877 = trunc(_1843);
    float _1879 = precise::max(_1877, 0.0);
    uint _1881 = uint(_1879);
    float _1883 = -_1869;
    float _1885 = -_1821;
    float _1887 = fma(_1883, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1885);
    float _1889 = -_1831;
    float _1891 = _1797 + _1889;
    int _1893 = ~_1670;
    int _1895 = _1893 + 1;
    int _1897 = _1754 * int(_1861);
    int _1899 = _1897 + _1803;
    int _1901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1903 = _1901 != 0;
    float _1905 = float(uint(_1899));
    int _1907 = int(_1787) + int(_1881);
    float _1909 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1911 = as_type<float>(_1807) * _1905;
    float _1913 = as_type<float>(_1881);
    float _1915 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    if (!_1873)
    {
        _1913 = _151;
    }
    float _1917 = _1913;
    int _1919 = _1895 * _1907;
    int _1921 = _1919 + _1740;
    float _1923 = trunc(_1911);
    float _1925 = precise::max(_1923, 0.0);
    uint _1927 = uint(_1925);
    float _1929 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1909);
    float _1931 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1933 = float(_1670);
    bool _1935 = uint(_1921) >= uint(_1670);
    float _1937 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1929);
    float _1939 = float(_1740);
    bool _1941 = !_1935;
    int _1943 = _1941 ? 0 : (-1);
    bool _1945 = _1939 >= _1933;
    bool _1947 = isnan(_1939);
    bool _1949 = _1945 || _1947;
    bool _1951 = isnan(_1933);
    bool _1953 = _1949 || _1951;
    float _1955 = float(_1953);
    float _1957 = _1917;
    float _1959 = _1931;
    if (!_1873)
    {
        _1915 = _151;
    }
    float _1961 = _1915;
    float _1963 = _1961;
    if (_1873)
    {
        _1957 = _147;
    }
    float _1965 = _1957;
    float _1967 = trunc(_1955);
    int _1969 = int(_1967);
    int _1971 = int(_1861) + int(_1927);
    int _1973 = ~_1907;
    int _1975 = _1973 + _1943;
    int _1977 = _1975 + 1;
    float _1979 = _1855 * _1933;
    float _1981 = float(_1716);
    int _1983 = _1758 * _1971;
    int _1985 = _1983 + _1803;
    float _1987 = float(_1803);
    int _1989 = _1670 * _1977;
    int _1991 = _1989 + _1740;
    if (_1873)
    {
        _1963 = _147;
    }
    float _1993 = _1963;
    float _1995 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1931);
    if (!_1873)
    {
        _1959 = _159;
    }
    float _1997 = _1959;
    float _1999 = _197 * _1933;
    float _2001 = _1997;
    if (_1873)
    {
        _167 = _151;
    }
    float _2003 = _167;
    float _2005 = _197 * _1981;
    if (_1873)
    {
        _2001 = _151;
    }
    float _2007 = _2001;
    float _2009 = trunc(_1979);
    int _2011 = int(_2009);
    bool _2013 = _1987 >= _1981;
    bool _2015 = isnan(_1987);
    bool _2017 = _2013 || _2015;
    bool _2019 = isnan(_1981);
    bool _2021 = _2017 || _2019;
    float _2023 = float(_2021);
    float _2025 = _1891 * _1981;
    float _2027 = _2003 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2029 = _1670 == 0;
    float _2031 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1995);
    bool _2033 = uint(_1985) >= uint(_1716);
    float _2035 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2037 = trunc(_2023);
    int _2039 = int(_2037);
    int _2041 = ~_1969;
    int _2043 = _2041 + 1;
    int _2045 = _2043 + 1;
    float _2047 = -_2031;
    float _2049 = _2047 + 1.0;
    bool _2051 = !_2029;
    int _2053 = _2051 ? _1991 : (-1);
    float _2055 = fma(_1993, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2035);
    bool _2057 = !_2033;
    int _2059 = _2057 ? 0 : (-1);
    float _2061 = fma(_1847, _2049, _1887);
    int _2063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2065 = _2063 != 0;
    float _2067 = trunc(_1999);
    int _2069 = int(_2067);
    int _2071 = _1670 + (-1);
    int _2073 = _2053 * _2045;
    int _2075 = ~_1971;
    int _2077 = _2075 + _2059;
    int _2079 = _2077 + 1;
    float _2081 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2055);
    bool _2083 = !_2065;
    int _2085 = _2083 ? 0 : 1;
    int _2087 = _1969 * _2071;
    int _2089 = _2087 + _2073;
    int _2091 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2093 = _2091 != 0;
    int _2095 = _1716 * _2079;
    int _2097 = _2095 + _1803;
    int _2099 = _2089 * _1684;
    bool _2101 = !_2093;
    int _2103 = _2101 ? 0 : 1;
    float _2105 = trunc(_2005);
    int _2107 = int(_2105);
    bool _2109 = _1716 == 0;
    float _2111 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2113 = abs(_687);
    float _2115 = -_2081;
    float _2117 = _2115 + 1.0;
    int _2119 = ~_2039;
    int _2121 = _2119 + 1;
    int _2123 = _2121 + 1;
    float _2125 = fma(_2007, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2111);
    bool _2127 = !_2109;
    int _2129 = _2127 ? _2097 : (-1);
    int _2131 = _2069 * _2113;
    int _2133 = _2131 + _2099;
    int _2135 = abs(_693);
    float _2137 = _1965 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2139 = _1716 + (-1);
    int _2141 = _2129 * _2123;
    float _2143 = trunc(_2025);
    int _2145 = int(_2143);
    int _2147 = abs(_2085);
    float _2149 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2125);
    int _2151 = _2039 * _2139;
    int _2153 = _2151 + _2141;
    bool _2155 = !_1662;
    int _2157 = _2155 ? 0 : 1;
    int _2159 = _2011 * _2147;
    int _2161 = _2159 + _1740;
    float _2163 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2165 = abs(_2103);
    int _2167 = _2161 * _2135;
    int _2169 = _2167 + _2133;
    int _2171 = abs(_2157);
    float _2173 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2175 = abs(_1155);
    float _2177 = -_2163;
    float _2179 = fma(_2137, 2.0, _2177);
    int _2181 = _2011 * _2171;
    int _2183 = _2181 + _2169;
    float _2185 = fma(_2027, -2.0, _2173);
    float _2187 = float(uint(_2161));
    float _2189 = -_2149;
    float _2191 = _2189 + 1.0;
    int _2193 = _2145 * _2165;
    int _2195 = _2193 + _1803;
    int _2197 = abs(_1171);
    int _2199 = _2153 * _2175;
    int _2201 = abs(_1159);
    float _2203 = as_type<float>(_1736) * _2187;
    float _2205 = float(uint(_2183));
    float _2207 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2185);
    int _2209 = abs(_1175);
    float _2211 = _397 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2213 = _2107 * _2201;
    int _2215 = _2213 + _2199;
    float _2217 = as_type<float>(_1736) * _2205;
    float _2219 = trunc(_2203);
    float _2221 = precise::max(_2219, 0.0);
    uint _2223 = uint(_2221);
    float _2225 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2211);
    int _2227 = _2195 * _2197;
    int _2229 = _2227 + _2215;
    int _2231 = ~_1670;
    int _2233 = _2231 + 1;
    float _2235 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2225);
    int _2237 = ~_1670;
    int _2239 = _2237 + 1;
    int _2241 = _2145 * _2209;
    int _2243 = _2241 + _2229;
    float _2245 = trunc(_2217);
    float _2247 = precise::max(_2245, 0.0);
    uint _2249 = uint(_2247);
    float _2251 = _2235 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2253 = float(uint(_2195));
    int _2255 = ~_1716;
    int _2257 = _2255 + 1;
    int _2259 = _2239 * int(_2223);
    int _2261 = _2259 + _2161;
    float _2263 = as_type<float>(_1807) * _2253;
    int _2265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2267 = _2265 != 0;
    float _2269 = 1.0 / _2251;
    int _2271 = ~_1716;
    int _2273 = _2271 + 1;
    float _2275 = float(uint(_2261));
    int _2277 = _2233 * int(_2249);
    int _2279 = _2277 + _2183;
    float _2281 = -_117;
    float _2283 = fma(_2281, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2179);
    float _2285 = float(uint(_2243));
    float _2287 = trunc(_2263);
    float _2289 = precise::max(_2287, 0.0);
    uint _2291 = uint(_2289);
    float _2293 = as_type<float>(_1736) * _2275;
    float _2295 = float(uint(_2279));
    float _2297 = -_211;
    int _2299 = _1871 ? as_type<int>(_2297) : as_type<int>(_211);
    int _2301 = ~_1670;
    int _2303 = _2301 + 1;
    float _2305 = as_type<float>(_1736) * _2295;
    float _2307 = as_type<float>(_1807) * _2285;
    float _2309 = _397 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2311 = -_231;
    int _2313 = _1696 ? as_type<int>(_2311) : as_type<int>(_231);
    float _2315 = trunc(_2293);
    float _2317 = precise::max(_2315, 0.0);
    uint _2319 = uint(_2317);
    bool _2321 = !_2267;
    float _2323 = _2321 ? _211 : as_type<float>(_2299);
    float _2325 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2309);
    int _2327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2329 = _2327 != 0;
    float _2331 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2333 = _2257 * int(_2291);
    int _2335 = _2333 + _2195;
    float _2337 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2325);
    bool _2339 = !_1903;
    float _2341 = _2339 ? _231 : as_type<float>(_2313);
    float _2343 = trunc(_2307);
    float _2345 = precise::max(_2343, 0.0);
    uint _2347 = uint(_2345);
    float _2349 = _2323 + 0.5;
    float _2351 = float(uint(_2335));
    float _2353 = _2337 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2355 = _2341 + (-0.5);
    float _2357 = fma(_2349, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2283);
    int _2359 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2361 = _2359 != 0;
    float _2363 = _2353 + _2251;
    float _2365 = trunc(_2305);
    float _2367 = precise::max(_2365, 0.0);
    uint _2369 = uint(_2367);
    float _2371 = -_2355;
    float _2373 = -_2207;
    float _2375 = fma(_2371, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2373);
    float _2377 = -_1937;
    float _2379 = _2377 + 1.0;
    float _2381 = as_type<float>(_1807) * _2351;
    float _2383 = _2363 * _2269;
    float _2385 = _2383 * 0.5;
    int _2387 = ~_1716;
    int _2389 = _2387 + 1;
    float _2391 = -_2379;
    float _2393 = fma(_1839, _2391, _1875);
    float _2395 = -_2117;
    float _2397 = fma(_2323, _2395, _2357);
    int _2399 = _2273 * int(_2347);
    int _2401 = _2399 + _2243;
    float _2403 = fma(_2341, _2191, _2375);
    float _2405 = _1049 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2407 = trunc(_2381);
    float _2409 = precise::max(_2407, 0.0);
    uint _2411 = uint(_2409);
    int _2413 = ~_1670;
    int _2415 = _2413 + 1;
    float _2417 = float(uint(_2401));
    out.m_76.x = _2393;
    out.m_76.y = _2061;
    out.m_76.z = _2397;
    out.m_76.w = _2403;
    float _2419 = as_type<float>(_1807) * _2417;
    int _2421 = int(_2249) + int(_2369);
    float _2423 = as_type<float>(_2249);
    float _2425 = _2049;
    if (!_1680)
    {
        _2423 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2427 = _2423;
    float _2429 = trunc(_2419);
    float _2431 = precise::max(_2429, 0.0);
    uint _2433 = uint(_2431);
    if (!_1680)
    {
        float _2435 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2437 = fma(_2385, _2427, _2435);
        _2425 = _2437;
    }
    float _2439 = _2425;
    int _2441 = _2303 * _2421;
    int _2443 = _2441 + _2183;
    int _2445 = int(_2223) + int(_2319);
    float _2447 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2449 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2451 = -_1029;
    float _2453 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2331);
    bool _2455 = uint(_2443) >= uint(_1670);
    float _2457 = _1049 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2459 = -_1029;
    float _2461 = fma(_2459, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2447);
    float _2463 = -_1029;
    float _2465 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2449);
    bool _2467 = !_2455;
    int _2469 = _2467 ? 0 : (-1);
    float _2471 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2457);
    int _2473 = int(_2347) + int(_2433);
    float _2475 = _1049 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2477 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2479 = ~_2421;
    int _2481 = _2479 + _2469;
    int _2483 = _2481 + 1;
    float _2485 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2405);
    float _2487 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2475);
    int _2489 = _2389 * _2473;
    int _2491 = _2489 + _2243;
    float _2493 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2461);
    int _2495 = _1670 * _2483;
    int _2497 = _2495 + _2183;
    float _2499 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2453);
    float _2501 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2465);
    bool _2503 = uint(_2491) >= uint(_1716);
    float _2505 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2477);
    bool _2507 = !_2029;
    int _2509 = _2507 ? _2497 : (-1);
    float _2511 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2513 = !_2503;
    int _2515 = _2513 ? 0 : (-1);
    float _2517 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2519 = _2509 & 3;
    bool _2521 = _2519 != 0;
    float _2523 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2511);
    int _2525 = ~_2473;
    int _2527 = _2525 + _2515;
    int _2529 = _2527 + 1;
    float _2531 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2517);
    int _2533 = _2509 >> 31;
    int _2535 = _2415 * _2445;
    int _2537 = _2535 + _2161;
    int _2539 = _2521 ? 0 : 1;
    int _2541 = _1716 * _2529;
    int _2543 = _2541 + _2243;
    int _2545 = _2533 & 3;
    float _2547 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2523);
    int _2549 = int(_2291) + int(_2411);
    float _2551 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2505);
    int _2553 = _2509 + _2545;
    float _2555 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2485);
    int _2557 = _2509 & 3;
    bool _2559 = _2557 != 0;
    float _2561 = _2439;
    if (!_1680)
    {
        float _2563 = 1.0 / _2439;
        _2561 = _2563;
    }
    float _2565 = _2561;
    bool _2567 = !_2109;
    int _2569 = _2567 ? _2543 : (-1);
    bool _2571 = !_2559;
    int _2573 = _2571 ? 0 : 1;
    bool _2575 = uint(_2557) >= 2u;
    int _2577 = _2569 >> 31;
    int _2579 = _2553 >> 2;
    int _2581 = _2575 ? 0 : 1;
    int _2583 = _2577 & 3;
    bool _2585 = _2557 != 3;
    int _2587 = _2579 << 4;
    int _2589 = _2587 + 368;
    int _2591 = ~_1716;
    int _2593 = _2591 + 1;
    bool _2595 = uint(_2557) > 1u;
    int _2597 = _2569 + _2583;
    int _2599 = _2593 * _2549;
    int _2601 = _2599 + _2195;
    int _2603 = ~_2581;
    int _2605 = _2603 + 1;
    int _2607 = _2605 + 1;
    uint _2609 = uint(int(uint(_2589) >> uint(2)));
    uint _2611 = uint(int(uint(int(_2609)) >> uint(2)));
    int _2613 = int(_2609) & 3;
    float _2615 = (*spvDescriptorSet0.vp_c9)._m0[int(_2611)][_2613];
    int _2617 = int(_2609) + 1;
    uint _2619 = uint(int(uint(_2617) >> uint(2)));
    int _2621 = _2617 & 3;
    float _2623 = (*spvDescriptorSet0.vp_c9)._m0[int(_2619)][_2621];
    int _2625 = _2597 >> 2;
    int _2627 = _2607;
    if (_2585)
    {
        int _2629 = ~_2581;
        int _2631 = _2629 + 1;
        _2627 = _2631;
    }
    int _2633 = _2627;
    float _2635 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2531);
    int _2637 = _2625 << 4;
    int _2639 = _2637 + 512;
    float _2641 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2471);
    bool _2643 = uint(_2601) >= uint(_1716);
    int _2645 = _2589 + 8;
    uint _2647 = uint(int(uint(_2645) >> uint(2)));
    uint _2649 = uint(int(uint(int(_2647)) >> uint(2)));
    int _2651 = int(_2647) & 3;
    float _2653 = (*spvDescriptorSet0.vp_c9)._m0[int(_2649)][_2651];
    int _2655 = int(_2647) + 1;
    uint _2657 = uint(int(uint(_2655) >> uint(2)));
    int _2659 = _2655 & 3;
    float _2661 = (*spvDescriptorSet0.vp_c9)._m0[int(_2657)][_2659];
    int _2663 = ~_2539;
    int _2665 = _2663 + 1;
    int _2667 = _2665 + 1;
    int _2669 = _2667;
    if (!_2595)
    {
        int _2671 = ~_2539;
        int _2673 = _2671 + 1;
        _2669 = _2673;
    }
    int _2675 = _2669;
    bool _2677 = uint(_2537) >= uint(_1670);
    bool _2679 = !_2643;
    int _2681 = _2679 ? 0 : (-1);
    uint _2683 = uint(int(uint(_2639) >> uint(2)));
    uint _2685 = uint(int(uint(int(_2683)) >> uint(2)));
    int _2687 = int(_2683) & 3;
    float _2689 = (*spvDescriptorSet0.vp_c9)._m0[int(_2685)][_2687];
    int _2691 = int(_2683) + 1;
    uint _2693 = uint(int(uint(_2691) >> uint(2)));
    int _2695 = _2691 & 3;
    float _2697 = (*spvDescriptorSet0.vp_c9)._m0[int(_2693)][_2695];
    bool _2699 = !_2677;
    int _2701 = _2699 ? 0 : (-1);
    int _2703 = _2569 & 3;
    bool _2705 = _2703 != 0;
    int _2707 = ~_2445;
    int _2709 = _2707 + _2701;
    int _2711 = _2709 + 1;
    float _2713 = _231 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2715 = !_2705;
    int _2717 = _2715 ? 0 : 1;
    int _2719 = _2639 + 8;
    uint _2721 = uint(int(uint(_2719) >> uint(2)));
    uint _2723 = uint(int(uint(int(_2721)) >> uint(2)));
    int _2725 = int(_2721) & 3;
    float _2727 = (*spvDescriptorSet0.vp_c9)._m0[int(_2723)][_2725];
    int _2729 = int(_2721) + 1;
    uint _2731 = uint(int(uint(_2729) >> uint(2)));
    int _2733 = _2729 & 3;
    float _2735 = (*spvDescriptorSet0.vp_c9)._m0[int(_2731)][_2733];
    int _2737 = _2569 & 3;
    bool _2739 = _2737 != 0;
    float _2741 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2487);
    bool _2743 = _2703 != 3;
    float _2745 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2747 = _2739 ? 0 : 1;
    float _2749 = _2713 * _2493;
    bool _2751 = uint(_2703) >= 2u;
    int _2753 = _1670 * _2711;
    int _2755 = _2753 + _2161;
    int _2757 = ~_2549;
    int _2759 = _2757 + _2681;
    int _2761 = _2759 + 1;
    float _2763 = _2713 * _2499;
    int _2765 = _2751 ? 0 : 1;
    float _2767 = fma(_2745, _2641, _2749);
    bool _2769 = uint(_2703) > 1u;
    out.m_78.x = _2641;
    out.m_78.y = _2555;
    out.m_78.z = _2741;
    int _2771 = abs(_2675);
    int _2773 = _1716 * _2761;
    int _2775 = _2773 + _2195;
    int _2777 = ~_2747;
    int _2779 = _2777 + 1;
    int _2781 = _2779 + 1;
    float _2783 = fma(_2745, _2555, _2763);
    int _2785 = ~_2765;
    int _2787 = _2785 + 1;
    int _2789 = _2787 + 1;
    int _2791 = _2789;
    int _2793 = _2781;
    float _2795 = _2767;
    if (_2743)
    {
        int _2797 = ~_2765;
        int _2799 = _2797 + 1;
        _2791 = _2799;
    }
    int _2801 = _2791;
    int _2803 = abs(_2717);
    int _2805 = abs(_2633);
    if (!_2769)
    {
        int _2807 = ~_2747;
        int _2809 = _2807 + 1;
        _2793 = _2809;
    }
    int _2811 = _2793;
    int _2813 = ~_2771;
    int _2815 = _2813 + 1;
    int _2817 = _2815 + 1;
    int _2819 = abs(_2811);
    int _2821 = abs(_2573);
    int _2823 = _2817 * as_type<int>(_2623);
    int _2825 = abs(_2801);
    int _2827 = ~_2819;
    int _2829 = _2827 + 1;
    int _2831 = _2829 + 1;
    int _2833 = ~_2821;
    int _2835 = _2833 + 1;
    int _2837 = _2835 + 1;
    int _2839 = _2831 * as_type<int>(_2697);
    int _2841 = ~_2803;
    int _2843 = _2841 + 1;
    int _2845 = _2843 + 1;
    int _2847 = _2837 * as_type<int>(_2615);
    int _2849 = _2847 + _2823;
    float _2851 = fma(_2713, _2713, 1.0);
    int _2853 = ~_2805;
    int _2855 = _2853 + 1;
    int _2857 = _2855 + 1;
    int _2859 = _2845 * as_type<int>(_2689);
    int _2861 = _2859 + _2839;
    bool _2863 = _2557 != 3;
    int _2865 = ~_2825;
    int _2867 = _2865 + 1;
    int _2869 = _2867 + 1;
    int _2871 = _2857 * as_type<int>(_2653);
    int _2873 = _2871 + _2849;
    bool _2875 = _2703 != 3;
    float _2877 = rsqrt(_2851);
    bool _2879 = !_2863;
    int _2881 = _2879 ? 0 : (-1);
    int _2883 = _2869 * as_type<int>(_2727);
    int _2885 = _2883 + _2861;
    bool _2887 = !_2875;
    int _2889 = _2887 ? 0 : (-1);
    float _2891 = _1605 + _1575;
    int _2893 = abs(_2881);
    bool _2895 = !_2361;
    int _2897 = _2895 ? 0 : 1;
    float _2899 = _2891 * 0.5;
    int _2901 = abs(_2889);
    bool _2903 = !_2329;
    int _2905 = _2903 ? 0 : 1;
    int _2907 = abs(_2897);
    float _2909 = _2713 * _2501;
    int _2911 = abs(_2905);
    int _2913 = ~_2893;
    int _2915 = _2913 + 1;
    int _2917 = _2915 + 1;
    float _2919 = fma(_2745, _2741, _2909);
    int _2921 = ~_2901;
    int _2923 = _2921 + 1;
    int _2925 = _2923 + 1;
    int _2927 = ~_2911;
    int _2929 = _2927 + 1;
    int _2931 = _2929 + 1;
    int _2933 = _2917 * as_type<int>(_2661);
    int _2935 = _2933 + _2873;
    int _2937 = ~_2907;
    int _2939 = _2937 + 1;
    int _2941 = _2939 + 1;
    int _2943 = _2925 * as_type<int>(_2735);
    int _2945 = _2943 + _2885;
    bool _2947 = !_2029;
    int _2949 = _2947 ? _2755 : (-1);
    int _2951 = _2935 * _2931;
    float _2953 = _2713 * _2877;
    int _2955 = _2945 * _2941;
    float _2957 = _1537 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2959 = _2949 * _2911;
    int _2961 = _2959 + _2951;
    bool _2963 = !_2109;
    int _2965 = _2963 ? _2775 : (-1);
    float _2967 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1664);
    float _2969 = exp2(_2957);
    float _2971 = -_2551;
    float _2973 = _2953 * _2971;
    float _2975 = -_2635;
    float _2977 = _2953 * _2975;
    float _2979 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2967);
    int _2981 = _2965 * _2907;
    int _2983 = _2981 + _2955;
    float _2985 = -_2547;
    float _2987 = _2953 * _2985;
    float _2989 = fma(_2877, _2499, _2973);
    float _2991 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2979);
    float _2993 = fma(_2877, _2501, _2977);
    float _2995 = _1575 * 0.5;
    float _2997 = fma(_2877, _2493, _2987);
    float _2999 = _2991 + _1575;
    out.gl_Position.x = _1605;
    out.gl_Position.y = _1607;
    out.gl_Position.z = _2991;
    out.gl_Position.w = _1575;
    float _3001 = fma(_1607, -0.5, _2995);
    float _3003 = float(_2961);
    float _3005 = _2999 * 0.5;
    float _3007 = -_2969;
    float _3009 = _3007 + 1.0;
    float _3011 = float(_2983);
    float _3013 = _2547 + _2767;
    float _3015 = _3009 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3017 = _2551 + _2783;
    float _3019 = _2635 + _2919;
    out.m_80.x = _3003;
    out.m_80.y = _3011;
    float _3021 = _3015 * _1631;
    float _3023 = _1631;
    float _3025 = _2989;
    float _3027 = _2997;
    if (!_1680)
    {
        _3023 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _3029 = _3023;
    float _3031 = -_3015;
    float _3033 = _3031 + 1.0;
    out.m_82.x = _2899;
    out.m_82.y = _3001;
    out.m_82.z = _3005;
    out.m_82.w = _1575;
    float _3035 = _1641 * _3021;
    float _3037 = _1652 * _3021;
    float _3039 = _3033;
    if (!_1680)
    {
        float _3041 = -_3029;
        float _3043 = _3041 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1720 = _3043;
    }
    float _3045 = _1720;
    out.m_84.x = _3013;
    out.m_84.y = _3017;
    out.m_84.z = _3019;
    bool _3047 = _1337 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3049 = isnan(_1337);
    bool _3051 = _3047 || _3049;
    bool _3053 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3055 = _3051 || _3053;
    float _3057 = fma(_1637, _3037, _1646);
    float _3059 = fma(_1639, _3037, _1648);
    float _3061 = _1652 * _3033;
    float _3063 = fma(_1652, _3035, _1650);
    float _3065 = _3045;
    if (!_1680)
    {
        float _3067 = 1.0 / _3045;
        _3065 = _3067;
    }
    float _3069 = _3065;
    if (!_1680)
    {
        float _3071 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3073 = -_3029;
        float _3075 = fma(_2565, _3071, _3073);
        _2795 = _3075;
    }
    float _3077 = _2795;
    out.m_86.x = _2997;
    out.m_86.y = _2989;
    out.m_86.z = _2993;
    out.m_88.x = _3057;
    out.m_88.y = _3059;
    out.m_88.z = _3063;
    out.m_88.w = _3061;
    float _3079 = _3077;
    if (!_3055)
    {
        _1722 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3081 = _1722;
    float _3083 = _3081;
    float _3085 = _3081;
    if (!_3055)
    {
        _3039 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3087 = _3039;
    float _3089 = _3087;
    float _3091 = _3087;
    if (!_3055)
    {
        _1724 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3093 = _1724;
    float _3095 = _3093;
    float _3097 = _3093;
    if (_1680)
    {
        _3025 = 1.0;
    }
    float _3099 = _3025;
    float _3101 = _3099;
    float _3103 = _3069;
    if (!_1680)
    {
        float _3105 = _3077 * _3069;
        float _3107 = precise::clamp(_3105, 0.0, 1.0);
        _3101 = _3107;
    }
    float _3109 = _3101;
    if (!_3055)
    {
        _3027 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3111 = _3027;
    float _3113 = _3111;
    float _3115 = _3111;
    if (!_3055)
    {
        _3103 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3117 = _3103;
    float _3119 = _3109 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3121 = _3117;
    float _3123 = _3117;
    if (!_3055)
    {
        _3079 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3125 = _3079;
    bool _3127 = !_3055;
    float _3129 = _3125;
    float _3131 = _3125;
    if (!_3127)
    {
        bool _3133 = _1337 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3135 = isnan(_1337);
        bool _3137 = _3133 || _3135;
        bool _3139 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3141 = _3137 || _3139;
        if (!_3141)
        {
            float _3143 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3145 = _1337 + _3143;
            float _3147 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3149 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3147;
            float _3151 = 1.0 / _3149;
            float _3153 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3155 = _3153 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3157 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3159 = _3157 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3161 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3163 = _3161 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3165 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3167 = _3165 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3169 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3171 = _3169 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3173 = _3145 * _3151;
            float _3175 = precise::clamp(_3173, 0.0, 1.0);
            float _3177 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3179 = _3177 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3181 = fma(_3175, _3155, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3183 = fma(_3175, _3179, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3185 = fma(_3175, _3159, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3187 = fma(_3175, _3163, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3189 = fma(_3175, _3167, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3191 = fma(_3175, _3171, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3085 = _3183;
            _3123 = _3189;
            _3115 = _3181;
            _3097 = _3187;
            _3091 = _3185;
            _3131 = _3191;
            _3193 = true;
        }
        else
        {
            bool _3195 = _1337 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3197 = isnan(_1337);
            bool _3199 = _3195 || _3197;
            bool _3201 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3203 = _3199 || _3201;
            if (!_3203)
            {
                _3113 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3205 = _3113;
            _3115 = _3205;
            if (!_3203)
            {
                _3083 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3207 = _3083;
            _3085 = _3207;
            if (!_3203)
            {
                _3089 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3209 = _3089;
            _3091 = _3209;
            if (!_3203)
            {
                _3095 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3211 = _3095;
            _3097 = _3211;
            if (!_3203)
            {
                _3121 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3213 = _3121;
            _3123 = _3213;
            if (!_3203)
            {
                _3129 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3215 = _3129;
            bool _3217 = !_3203;
            _3131 = _3215;
            if (!_3217)
            {
                bool _3219 = _1337 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3221 = isnan(_1337);
                bool _3223 = _3219 || _3221;
                bool _3225 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3227 = _3223 || _3225;
                if (!_3227)
                {
                    float _3229 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3231 = _1337 + _3229;
                    float _3233 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3235 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3233;
                    float _3237 = 1.0 / _3235;
                    float _3239 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3241 = _3239 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3243 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3245 = _3243 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3247 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3249 = _3247 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3251 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3253 = _3251 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3255 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3257 = _3255 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3259 = _3231 * _3237;
                    float _3261 = precise::clamp(_3259, 0.0, 1.0);
                    float _3263 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3265 = _3263 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3267 = fma(_3261, _3241, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3269 = fma(_3261, _3265, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3271 = fma(_3261, _3245, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3273 = fma(_3261, _3249, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3275 = fma(_3261, _3253, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3277 = fma(_3261, _3257, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3085 = _3269;
                    _3123 = _3275;
                    _3115 = _3267;
                    _3097 = _3273;
                    _3091 = _3271;
                    _3131 = _3277;
                    _3193 = true;
                }
                else
                {
                    _3085 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3123 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3115 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3097 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3091 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3131 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3193 = false;
    float _3279 = _3085;
    float _3281 = _3123;
    float _3283 = _3115;
    float _3285 = _3097;
    float _3287 = _3091;
    float _3289 = _3131;
    float _3291 = _3119 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3293 = fma(_3017, -0.5, 0.5);
    float _3295 = precise::clamp(_3293, 0.0, 1.0);
    float _3297 = -_3279;
    float _3299 = _3297 + _3281;
    float _3301 = -_3283;
    float _3303 = _3301 + _3285;
    out.m_51.x = _3291;
    float _3305 = fma(_3295, _3299, _3279);
    float _3307 = -_3287;
    float _3309 = _3307 + _3289;
    float _3311 = fma(_3295, _3303, _3283);
    float _3313 = _3305 * 0.586610972881317138671875;
    bool _3315 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3317 = fma(_3295, _3309, _3287);
    out.m_90.x = 0.0;
    float _3319 = fma(_3311, 0.298911988735198974609375, _3313);
    bool _3321 = _3109 > 0.0;
    bool _3323 = isnan(_3109);
    bool _3325 = _3321 || _3323;
    bool _3327 = isnan(0.0);
    bool _3329 = _3325 || _3327;
    float _3331 = fma(_3317, 0.114477999508380889892578125, _3319);
    float _3333 = -_3331;
    float _3335 = _3311 + _3333;
    float _3337 = -_3331;
    float _3339 = _3305 + _3337;
    float _3341 = -_3331;
    float _3343 = _3317 + _3341;
    float _3345 = fma(_3335, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3331);
    float _3347 = fma(_3339, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3331);
    float _3349 = fma(_3343, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3331);
    bool _3351 = !_3315;
    if (!_3351)
    {
        float _3353 = -_1309;
        float _3355 = _3353 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3357 = -_1311;
        float _3359 = _3357 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3361 = -_1313;
        float _3363 = _3361 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3365 = _3355 * _3355;
        float _3367 = fma(_3359, _3359, _3365);
        float _3369 = fma(_3363, _3363, _3367);
        float _3371 = sqrt(_3369);
        float _3373 = rsqrt(_3369);
        float _3375 = -_3371;
        float _3377 = _3375 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3379 = _3377 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3381 = precise::clamp(_3379, 0.0, 1.0);
        float _3383 = _3359 * _3373;
        float _3385 = _3355 * _3373;
        float _3387 = abs(_3381);
        float _3389 = log2(_3387);
        float _3391 = _3363 * _3373;
        float _3393 = _3383 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3395 = _3017 * _3385;
        float _3397 = -_3385;
        float _3399 = -_3393;
        float _3401 = fma(_3397, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3399);
        float _3403 = fma(_3013, _3383, _3395);
        float _3405 = -_3391;
        float _3407 = fma(_3405, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3401);
        float _3409 = fma(_3019, _3391, _3403);
        float _3411 = precise::clamp(_3409, 0.0, 1.0);
        float _3413 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3415 = _3407 + _3413;
        float _3417 = _3389 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3419 = _3415 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3421 = precise::clamp(_3419, 0.0, 1.0);
        float _3423 = exp2(_3417);
        float _3425 = _3423 * _3421;
        float _3427 = _3411 * _3425;
        float _3429 = _3427 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3431 = _3427 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3433 = _3427 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _3429;
        out.m_90.y = _3431;
        out.m_90.z = _3433;
    }
    out.m_92.x = _3345;
    out.m_92.y = _3347;
    out.m_92.z = _3349;
    if (_3329)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _3435 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3435;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3193 = false;
    bool _253 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_44.w;
    float _108 = in.m_46.w;
    float _110 = trunc(_106);
    int _113 = int(_110);
    float _115 = -_108;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = as_type<float>(_113);
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _123;
    if (!_121)
    {
        out.m_51.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3503 = as_type<float>(_133);
        out.gl_Position.z = _3503;
    }
    if (!_121)
    {
        return out;
    }
    bool _137 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_108);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = in.m_53.x;
    float _149 = float(_113);
    float _151 = in.m_53.y;
    bool _153 = _117 >= _149;
    bool _155 = !_145;
    bool _157 = _153 || _155;
    float _159 = in.m_53.z;
    if (_157)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _125;
    if (_157)
    {
        out.m_51.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _135 = as_type<int>(_163);
    }
    int _165 = _135;
    out.m_55.x = _147;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3566 = as_type<float>(_165);
        out.gl_Position.z = _3566;
    }
    out.m_55.y = _151;
    out.m_55.z = _159;
    float _167 = _159;
    if (_157)
    {
        return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = 1.0 / _149;
    float _173 = in.m_60.x;
    float _175 = in.m_60.y;
    float _177 = in.m_60.z;
    float _179 = in.m_62.x;
    float _181 = in.m_62.y;
    float _183 = in.m_62.z;
    float _185 = in.m_64.x;
    float _187 = in.m_64.y;
    float _189 = in.m_64.z;
    float _191 = in.m_66.x;
    float _193 = in.m_66.y;
    float _195 = in.m_66.z;
    float _197 = _117 * _171;
    int _199 = as_type<int>(_169) & 1;
    bool _201 = _199 != 0;
    int _203 = as_type<int>(_169) & 2;
    bool _205 = _203 != 0;
    bool _207 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _209 = !_201;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = _175 * _181;
    float _215 = _175 * _187;
    float _217 = fma(_173, _179, _213);
    float _219 = _175 * _193;
    float _221 = fma(_173, _185, _215);
    float _223 = fma(_177, _183, _217);
    float _225 = fma(_173, _191, _219);
    float _227 = fma(_177, _189, _221);
    bool _229 = !_205;
    float _231 = _229 ? (-0.5) : 0.5;
    float _233 = fma(_177, _195, _225);
    bool _235 = !_207;
    float _251;
    if (!_235)
    {
        float _237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _239 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _243 = _241 * _237;
        float _245 = floor(_243);
        float _247 = -_245;
        float _249 = _243 + _247;
        _251 = _249;
        _253 = true;
    }
    else
    {
        _251 = _197;
    }
    _253 = false;
    float _255 = _251;
    float _257 = in.m_44.x;
    float _259 = in.m_44.y;
    float _261 = in.m_44.z;
    float _263 = _151 * 2.0;
    float _265 = _159 * 2.0;
    float _267 = _147 * 2.0;
    float _269 = floor(_263);
    float _271 = _117 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _273 = _271 * _147;
    float _275 = floor(_265);
    float _277 = _273 * 0.15915493667125701904296875;
    float _279 = floor(_267);
    bool _281 = _269 > 0.0;
    float _283 = _181 * _259;
    float _285 = _187 * _259;
    float _287 = _193 * _259;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _289;
    float _293 = fma(_179, _257, _283);
    float _295 = _151 + _159;
    float _297 = fma(_185, _257, _285);
    float _299 = fma(_191, _257, _287);
    float _301 = _295 + (-1.0);
    float _303 = _147 + _159;
    float _305 = 1.0 / _291;
    float _307 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _309 = _303 + (-1.0);
    float _311 = _147 + _151;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _317 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _327 = _311 + (-1.0);
    float _329 = 1.0 / _315;
    bool _331 = _275 > 0.0;
    float _333 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _335 = _275 >= 0.0;
    bool _337 = isnan(_275);
    bool _339 = _335 || _337;
    bool _341 = isnan(0.0);
    bool _343 = _339 || _341;
    float _345 = 1.0 / _325;
    float _347 = (*spvDescriptorSet0.vp_c10)._m0[9].z * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _349;
    float _353 = fma(_183, _261, _293);
    float _355 = fma(_189, _261, _297);
    float _357 = fma((*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].z, _347);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _361 = _255 + _359;
    float _363 = fma(_195, _261, _299);
    float _365 = 1.0 / _321;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _369 = _255 + _367;
    float _371 = _361 * _305;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _375 = _255 + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _385 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _387 = isnan(_255);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = _355 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _399 = 1.0 / _351;
    float _401 = _375 * _345;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _405 = _255 + _403;
    bool _407 = _279 > 0.0;
    float _409 = fma(_379, _371, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _411 = _279 >= 0.0;
    bool _413 = isnan(_279);
    bool _415 = _411 || _413;
    bool _417 = isnan(0.0);
    bool _419 = _415 || _417;
    float _421 = _405 * _329;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _423;
    float _427 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _429 = log2(_427);
    float _431 = _369 * _365;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _439 = _255 + _437;
    float _441 = fma(_383, _421, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _443 = fma(_435, _421, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _445 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _447 = isnan(_255);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = _439 * _399;
    float _459 = fma((*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].z, _357);
    float _461 = -_395;
    float _463 = _461 + 1.0;
    float _465 = -_455;
    float _467 = _465 + 1.0;
    float _469 = _455 * _463;
    float _471 = _117 * _429;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _477;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _485 = exp2(_471);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _493 = 1.0 + _491;
    float _495 = fma(_483, _401, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    bool _497 = _269 >= 0.0;
    bool _499 = isnan(_269);
    bool _501 = _497 || _499;
    bool _503 = isnan(0.0);
    bool _505 = _501 || _503;
    float _507 = fma(_489, _401, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _509 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _511 = isnan(_255);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = fma(_425, _371, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _523 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _525 = isnan(_255);
    bool _527 = _523 || _525;
    bool _529 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _531 = _527 || _529;
    float _533 = float(_531);
    float _535 = fma(_475, _431, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _537 = fma(_479, _431, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _539 = _343 ? 0 : 1;
    float _541 = 1.0 / _493;
    bool _543 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _545 = isnan(_255);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _555;
    bool _559 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _561 = isnan(_255);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _567 = _563 || _565;
    float _569 = float(_567);
    float _571 = _519 * _467;
    float _573 = -_519;
    float _575 = _573 + 1.0;
    float _577 = -_533;
    float _579 = _577 + 1.0;
    int _581 = ~_539;
    int _583 = _581 + 1;
    int _585 = _583 + 1;
    float _587 = _277 * 6.283185482025146484375;
    float _589 = cos(_587);
    int _591 = _585;
    if (!_331)
    {
        int _593 = ~_539;
        int _595 = _593 + 1;
        _591 = _595;
    }
    int _597 = _591;
    float _599 = _569 * _575;
    float _601 = -_485;
    float _603 = _601 + 1.0;
    float _605 = -_569;
    float _607 = _605 + 1.0;
    float _609 = _553 * _579;
    bool _611 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _613 = isnan(0.0);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _619 = _615 || _617;
    float _621 = -_553;
    float _623 = _621 + 1.0;
    float _625 = rsqrt(_459);
    float _627 = _533 * _607;
    float _629 = _521 * _609;
    float _631 = _619 ? _603 : 0.0;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _633;
    float _637 = _409 * _609;
    int _639 = _505 ? 0 : 1;
    float _641 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[143].x, _629);
    float _643 = _277 * 6.283185482025146484375;
    float _645 = sin(_643);
    int _647 = _419 ? 0 : 1;
    float _649 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[143].y, _637);
    int _651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _653 = _651 != 0;
    int _655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _657 = _655 != 0;
    int _659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _661 = _659 != 0;
    float _663 = _631 * _541;
    float _665 = -_589;
    float _667 = _665 + 1.0;
    float _669 = fma(_443, _627, _641);
    float _671 = fma(_441, _627, _649);
    float _673 = _625 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _675 = _625 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _677 = _625 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    bool _679 = !_657;
    int _681 = _679 ? 0 : 1;
    float _683 = _673 * _667;
    bool _685 = !_653;
    int _687 = _685 ? 0 : 1;
    float _689 = fma(_635, _457, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    bool _691 = !_661;
    int _693 = _691 ? 0 : 1;
    float _695 = _675 * _645;
    int _697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _699 = _697 != 0;
    int _701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _703 = _701 != 0;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _707 = _705 != 0;
    float _709 = _677 * _645;
    int _711 = ~_639;
    int _713 = _711 + 1;
    int _715 = _713 + 1;
    float _717 = _673 * _645;
    float _719 = _677 * _667;
    int _721 = _715;
    if (!_281)
    {
        int _723 = ~_639;
        int _725 = _723 + 1;
        _721 = _725;
    }
    int _727 = _721;
    float _729 = fma(_677, _683, _695);
    bool _731 = !_699;
    int _733 = _731 ? 0 : 1;
    float _735 = fma(_557, _457, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _737 = fma(_673, _683, _589);
    float _739 = -_695;
    float _741 = fma(_677, _683, _739);
    float _743 = -_709;
    float _745 = fma(_675, _683, _743);
    float _747 = fma(_675, _683, _709);
    float _749 = fma(_675, _719, _717);
    float _751 = -_717;
    float _753 = fma(_675, _719, _751);
    int _755 = ~_647;
    int _757 = _755 + 1;
    int _759 = _757 + 1;
    float _761 = _675 * _675;
    int _763 = _759;
    if (!_407)
    {
        int _765 = ~_647;
        int _767 = _765 + 1;
        _763 = _767;
    }
    int _769 = _763;
    float _771 = _353 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _773 = abs(_733);
    float _775 = in.m_68.x;
    float _777 = in.m_68.y;
    float _779 = in.m_68.z;
    float _781 = fma(_677, _719, _589);
    float _783 = fma(_667, _761, _589);
    float _785 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _787 = _397 + _785;
    float _789 = float(_597);
    float _791 = _363 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _793 = float(_773);
    float _795 = _787 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _797 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _799 = _771 + _797;
    float _801 = _787 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _803 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _805 = isnan(1.0);
    bool _807 = _803 || _805;
    bool _809 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _811 = _807 || _809;
    float _813 = _793 * _789;
    float _815 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[8].x, _795);
    float _817 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[8].y, _801);
    float _819 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _821 = _791 + _819;
    float _823 = fma(_535, _599, _669);
    float _825 = _813 * (-2.0);
    float _827 = fma(_537, _599, _671);
    float _829 = fma(_821, (*spvDescriptorSet0.vp_c10)._m0[10].y, _817);
    float _831 = fma(_821, (*spvDescriptorSet0.vp_c10)._m0[10].x, _815);
    float _833 = fma(_333, _825, _333);
    bool _835 = !_707;
    int _837 = _835 ? 0 : 1;
    float _839 = _829 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _841 = _829 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _843 = _829 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _845 = fma(_825, _775, _775);
    float _847 = fma(_831, (*spvDescriptorSet0.vp_c10)._m0[9].x, _839);
    float _849 = fma(_831, (*spvDescriptorSet0.vp_c10)._m0[8].x, _841);
    bool _851 = !_703;
    int _853 = _851 ? 0 : 1;
    float _855 = fma(_831, (*spvDescriptorSet0.vp_c10)._m0[10].x, _843);
    int _857 = abs(_837);
    float _859 = _847 * _847;
    int _861 = abs(_853);
    float _863 = _147 + (-0.5);
    float _865 = fma(_507, _571, _827);
    float _867 = float(_727);
    float _869 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[196].x, _845);
    float _871 = fma(_735, _469, _865);
    float _873 = float(_769);
    float _875 = float(_857);
    float _877 = fma(_849, _849, _859);
    float _879 = float(_861);
    bool _881 = !_811;
    float _883 = _881 ? _117 : _663;
    float _885 = fma(_855, _855, _877);
    float _887 = _875 * _867;
    float _889 = _879 * _873;
    float _891 = fma(_495, _571, _823);
    float _893 = fma(_883, _833, _869);
    float _895 = _151 + (-0.5);
    float _897 = rsqrt(_885);
    float _899 = _889 * (-2.0);
    float _901 = in.m_70.x;
    float _903 = in.m_70.y;
    float _905 = fma(_689, _469, _891);
    float _907 = _893 * 0.15915493667125701904296875;
    float _909 = fma(_899, _777, _777);
    float _911 = fma(_307, _899, _307);
    float _913 = _887 * (-2.0);
    float _915 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[148].x, _905);
    float _917 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[196].y, _909);
    float _919 = _159 + (-0.5);
    float _921 = fma(_913, _779, _779);
    float _923 = fma(_317, _913, _317);
    float _925 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[148].y, _871);
    float _927 = fma(_883, _911, _917);
    float _929 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[196].z, _921);
    float _931 = _897 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _933 = _907 * 6.283185482025146484375;
    float _935 = sin(_933);
    float _937 = _927 * 0.15915493667125701904296875;
    float _939 = fma(_883, _923, _929);
    float _941 = _847 * _931;
    float _943 = _849 * _931;
    float _945 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _231);
    float _947 = _939 * 0.15915493667125701904296875;
    float _949 = _941 * _781;
    float _951 = _941 * _741;
    float _953 = _925 * _903;
    float _955 = _855 * _931;
    float _957 = fma(_943, _729, _949);
    float _959 = _941 * _749;
    float _961 = fma(_943, _737, _951);
    float _963 = _915 * _901;
    float _965 = fma(_955, _753, _957);
    float _967 = fma(_943, _745, _959);
    float _969 = fma(_955, _747, _961);
    float _971 = _907 * 6.283185482025146484375;
    float _973 = cos(_971);
    float _975 = _397 + _965;
    float _977 = fma(_955, _783, _967);
    float _979 = _771 + _969;
    float _981 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _211);
    float _983 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _985 = _975 + _983;
    float _987 = _963 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _989 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _991 = _979 + _989;
    float _993 = _937 * 6.283185482025146484375;
    float _995 = sin(_993);
    float _997 = _985 * _985;
    float _999 = _791 + _977;
    float _1001 = _953 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1003 = fma(_991, _991, _997);
    float _1005 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1007 = _999 + _1005;
    float _1009 = _987 * _981;
    float _1011 = _937 * 6.283185482025146484375;
    float _1013 = cos(_1011);
    float _1015 = _1001 * _945;
    float _1017 = fma(_1007, _1007, _1003);
    float _1019 = _947 * 6.283185482025146484375;
    float _1021 = cos(_1019);
    float _1023 = _935 * _995;
    float _1025 = _973 * _995;
    float _1027 = _947 * 6.283185482025146484375;
    float _1029 = sin(_1027);
    float _1031 = _973 * _1013;
    float _1033 = _935 * _1013;
    float _1035 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
    float _1037 = _973 * _1021;
    float _1039 = _935 * _1021;
    float _1041 = _1013 * _1021;
    float _1043 = _995 * _1021;
    float _1045 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1047 = sqrt(_1017);
    float _1049 = fma(_1029, _1031, _1023);
    float _1051 = fma(_1029, _1023, _1031);
    float _1053 = _1037 * _1015;
    float _1055 = -_1025;
    float _1057 = fma(_1029, _1033, _1055);
    float _1059 = -_1033;
    float _1061 = fma(_1029, _1025, _1059);
    float _1063 = -_1015;
    float _1065 = _1029 * _1063;
    float _1067 = fma(_1049, _1009, _1053);
    float _1069 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
    float _1071 = _1039 * _1015;
    float _1073 = fma(_1041, _1009, _1065);
    float _1075 = fma(_1061, _1045, _1067);
    float _1077 = fma(_1057, _1009, _1071);
    float _1079 = fma(_1043, _1045, _1073);
    float _1081 = _1069 * _1047;
    float _1083 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1085 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1087 = fma(_1051, _1045, _1077);
    float _1089 = fma(_1081, 0.00449999980628490447998046875, 0.100000001490116119384765625);
    float _1091 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1083);
    float _1093 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1085);
    float _1095 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1097 = precise::max(_1089, 0.100000001490116119384765625);
    float _1099 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1091);
    float _1101 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1093);
    float _1103 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1095);
    float _1105 = precise::min(_1097, 1.0);
    float _1107 = _1099 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1109 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1111 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1103);
    float _1113 = fma(_1107, _1105, _999);
    float _1115 = fma(_1109, _1105, _979);
    float _1117 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1119 = _1113 + _1117;
    float _1121 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1123 = _1115 + _1121;
    float _1125 = _1119 * _1119;
    float _1127 = fma(_1123, _1123, _1125);
    float _1129 = _1111 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1131 = sqrt(_1127);
    float _1133 = fma(_1129, _1105, _975);
    bool _1135 = _1131 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1139 = _1137 != 0;
    int _1141 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1143 = _1141 != 0;
    int _1145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1147 = _1145 != 0;
    int _1149 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1151 = _1149 != 0;
    bool _1153 = !_1143;
    int _1155 = _1153 ? 0 : 1;
    bool _1157 = !_1139;
    int _1159 = _1157 ? 0 : 1;
    float _1161 = _975;
    float _1163 = _1115;
    float _1165 = _1129;
    if (!_1135)
    {
        _1161 = _1115;
    }
    float _1167 = _1161;
    bool _1169 = !_1147;
    int _1171 = _1169 ? 0 : 1;
    bool _1173 = !_1151;
    int _1175 = _1173 ? 0 : 1;
    float _1177 = _1167;
    if (!_1135)
    {
        _1163 = _1113;
    }
    float _1179 = _1163;
    float _1181 = _1179;
    if (!_1135)
    {
        _1165 = _1133;
    }
    float _1183 = _1165;
    bool _1185 = !_1135;
    float _1187 = _1183;
    if (!_1185)
    {
        float _1189 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1191 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1193 = _1131 + _1191;
        float _1195 = _1133 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1197 = rsqrt(_1127);
        float _1199 = _1193 * _1189;
        float _1201 = _1199 * 0.15915493667125701904296875;
        float _1203 = _1201 * 6.283185482025146484375;
        float _1205 = cos(_1203);
        float _1207 = _1201 * 6.283185482025146484375;
        float _1209 = sin(_1207);
        float _1211 = _1205 + (-1.0);
        float _1213 = _1211 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1215 = fma(_1209, _1195, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1217 = fma(_1133, _1205, _1213);
        float _1219 = _1197 * _1215;
        float _1221 = fma(_1123, _1219, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1223 = fma(_1119, _1219, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1187 = _1217;
        _1177 = _1221;
        _1181 = _1223;
    }
    float _1225 = _1187;
    float _1227 = _1177;
    float _1229 = _1181;
    float _1231 = -_397;
    float _1233 = _1231 + _1225;
    float _1235 = -_771;
    float _1237 = _1235 + _1227;
    float _1239 = -_791;
    float _1241 = _1239 + _1229;
    float _1243 = _1233 * _1233;
    float _1245 = fma(_1237, _1237, _1243);
    float _1247 = fma(_1241, _1241, _1245);
    float _1249 = sqrt(_1247);
    bool _1251 = _1249 > 0.0;
    bool _1253 = !_1251;
    float _1255 = _1225;
    float _1257 = _1227;
    float _1259 = _1229;
    float _1261 = _1237;
    if (!_1253)
    {
        float _1263 = _227 * _227;
        float _1265 = fma(_223, _223, _1263);
        float _1267 = fma(_233, _233, _1265);
        float _1269 = rsqrt(_1247);
        float _1271 = sqrt(_1267);
        float _1273 = _1237 * _1269;
        float _1275 = _1233 * _1269;
        float _1277 = _1241 * _1269;
        bool _1279 = _1271 > 0.0;
        bool _1281 = !_1279;
        if (!_1281)
        {
            float _1283 = rsqrt(_1267);
            float _1285 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1287 = _227 * _1283;
            float _1289 = _223 * _1283;
            float _1291 = _233 * _1283;
            float _1293 = _1275 * _1287;
            float _1295 = fma(_1273, _1289, _1293);
            float _1297 = _1285 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1299 = fma(_1277, _1291, _1295);
            float _1301 = _1299 * _1297;
            float _1303 = fma(_223, _1301, _1227);
            float _1305 = fma(_227, _1301, _1225);
            float _1307 = fma(_233, _1301, _1229);
            _1255 = _1305;
            _1257 = _1303;
            _1259 = _1307;
            _1261 = _1295;
        }
    }
    float _1309 = _1255;
    float _1311 = _1257;
    float _1313 = _1259;
    float _1315 = _1261;
    float _1317 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1319 = _1309 + _1317;
    float _1321 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1323 = _1311 + _1321;
    float _1325 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1327 = _1313 + _1325;
    float _1329 = _1319 * _1319;
    float _1331 = fma(_1323, _1323, _1329);
    float _1333 = fma(_1327, _1327, _1331);
    float _1335 = rsqrt(_1333);
    float _1337 = sqrt(_1333);
    float _1339 = _1335 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1341 = _1323 * _1339;
    float _1343 = _1327 * _1339;
    float _1345 = _1341 * _1341;
    float _1347 = _1343 * _1343;
    float _1349 = _1345 + _1347;
    float _1351 = sqrt(_1349);
    bool _1353 = _1351 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1355 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1357 = _1351 + _1355;
    float _1359 = _1327;
    float _1361 = _1329;
    float _1363 = _1357;
    float _1365 = _1315;
    float _1367 = _1339;
    if (_1353)
    {
        float _1369 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1359 = _1369;
    }
    float _1371 = _1359;
    if (_1353)
    {
        float _1373 = rsqrt(_1349);
        _1361 = _1373;
    }
    float _1375 = _1361;
    float _1377 = _1375;
    if (_1353)
    {
        float _1379 = _1357 * _1371;
        _1363 = _1379;
    }
    float _1381 = _1363;
    if (_1353)
    {
        float _1383 = _1381 * 0.15915493667125701904296875;
        _1365 = _1383;
    }
    float _1385 = _1365;
    float _1387 = _1371;
    if (_1353)
    {
        float _1389 = _1385 * 6.283185482025146484375;
        float _1391 = sin(_1389);
        _1387 = _1391;
    }
    float _1393 = _1387;
    float _1395 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1397 = precise::max(0.0, _1395);
    float _1399 = _1335;
    float _1401 = _1397;
    if (_1353)
    {
        float _1403 = _1385 * 6.283185482025146484375;
        float _1405 = cos(_1403);
        _1399 = _1405;
    }
    float _1407 = _1399;
    float _1409 = -_1339;
    float _1411 = -_1397;
    float _1413 = fma(_1319, _1409, _1411);
    float _1415 = _1413;
    if (_1353)
    {
        float _1417 = _1413 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1401 = _1417;
    }
    float _1419 = _1401;
    float _1421 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1423 = _1393;
    float _1425 = _1419;
    if (_1353)
    {
        float _1427 = fma(_1393, _1419, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1367 = _1427;
    }
    float _1429 = _1367;
    float _1431 = _1429;
    if (!_1353)
    {
        _1423 = _1341;
    }
    float _1433 = _1423;
    float _1435 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1421);
    float _1437 = _1433;
    float _1439 = _1407;
    if (_1353)
    {
        float _1441 = _1407 + (-1.0);
        _1425 = _1441;
    }
    float _1443 = _1425;
    float _1445 = _1443;
    if (_1353)
    {
        float _1447 = _1375 * _1429;
        _1431 = _1447;
    }
    float _1449 = _1431;
    float _1451 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1435);
    if (_1353)
    {
        float _1453 = _1443 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1377 = _1453;
    }
    float _1455 = _1377;
    float _1457 = _1455;
    if (_1353)
    {
        float _1459 = _1341 * _1449;
        _1437 = _1459;
    }
    float _1461 = _1437;
    if (!_1353)
    {
        _1445 = _1343;
    }
    float _1463 = _1445;
    float _1465 = _1463;
    if (_1353)
    {
        float _1467 = _1343 * _1449;
        _1465 = _1467;
    }
    float _1469 = _1465;
    if (_1353)
    {
        float _1471 = fma(_1413, _1407, _1455);
        _1415 = _1471;
    }
    float _1473 = _1415;
    if (!_1353)
    {
        _1439 = _1345;
    }
    float _1475 = _1439;
    float _1477 = _1475;
    if (_1353)
    {
        float _1479 = _1461 * _1461;
        _1477 = _1479;
    }
    float _1481 = _1477;
    if (!_1353)
    {
        _1457 = _1347;
    }
    float _1483 = _1457;
    float _1485 = _1483;
    if (_1353)
    {
        float _1487 = _1469 * _1469;
        _1485 = _1487;
    }
    float _1489 = _1485;
    float _1491 = _1451 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1493 = fma(_1473, _1473, _1481);
    float _1495 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1497 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1499 = _1493 + _1489;
    float _1501 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1503 = _1491 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1505 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1495);
    float _1507 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1497);
    float _1509 = rsqrt(_1499);
    float _1511 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1513 = fma(_1337, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1511);
    float _1515 = precise::clamp(_1513, 0.0, 1.0);
    float _1517 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1507);
    float _1519 = -_1515;
    float _1521 = _1519 + 1.0;
    float _1523 = -_1503;
    float _1525 = fma(_1523, _1501, 1.0);
    float _1527 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1529 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1505);
    float _1531 = _1517 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1533 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1527);
    float _1535 = abs(_1521);
    float _1537 = log2(_1535);
    float _1539 = _1529 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1541 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1533);
    float _1543 = _1509 * _1461;
    float _1545 = _1509 * _1473;
    float _1547 = _1509 * _1469;
    float _1549 = _1541 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1551 = _1543 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1553 = _1539 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1555 = log2(_1525);
    float _1557 = -_1551;
    float _1559 = fma(_1545, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1557);
    float _1561 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1553);
    float _1563 = -_1547;
    float _1565 = fma(_1563, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1559);
    float _1567 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1561);
    float _1569 = _1537 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1571 = _1539 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1573 = fma(_1565, -0.5, 0.5);
    float _1575 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1567);
    float _1577 = fma(_1565, 0.5, 0.5);
    float _1579 = exp2(_1569);
    float _1581 = _1539 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1583 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1571);
    float _1585 = fma(_1577, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1587 = _1545 + 1.0;
    float _1589 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1581);
    float _1591 = _1555 * 0.693147182464599609375;
    float _1593 = fma(_1577, _1585, -0.212114393711090087890625);
    float _1595 = sqrt(_1573);
    float _1597 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1583);
    float _1599 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1589);
    float _1601 = fma(_1577, _1593, 1.570728778839111328125);
    float _1603 = _1591 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1605 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1597);
    float _1607 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1599);
    float _1609 = 1.0 / _1575;
    float _1611 = -_1545;
    float _1613 = fma(_1579, _1587, _1611);
    float _1615 = fma(_1613, 0.5, 0.5);
    float _1617 = _1595 * 0.636619746685028076171875;
    float _1619 = -_1601;
    float _1621 = fma(_1617, _1619, 1.0);
    float _1623 = _1605 * _1609;
    float _1625 = _1607 * _1609;
    float _1627 = fma(_1623, 0.5, 0.5);
    float _1629 = fma(_1625, -0.5, 0.5);
    float3 _5866 = float3(_1627, _1629, _1603);
    float _1631 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5866, float3(0.0), isnan(_5866)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5866, float3(0.0), isnan(_5866)), level(0.0)).x;
    float2 _5877 = float2(_1621, _1615);
    float3 _1635 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5877, float2(0.0), isnan(_5877)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5877, float2(0.0), isnan(_5877)), level(0.0)).xyz;
    float _1637 = _1635.x;
    float _1639 = _1635.y;
    float _1641 = _1635.z;
    float3 _5894 = float3(_1627, _1629, _1603);
    float4 _1644 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5894, float3(0.0), isnan(_5894)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5894, float3(0.0), isnan(_5894)), level(0.0)).xyzw;
    float _1646 = _1644.x;
    float _1648 = _1644.y;
    float _1650 = _1644.z;
    float _1652 = _1644.w;
    float _1654 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1656 = int(_1654);
    float _1658 = in.m_53.w;
    int _1660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1662 = _1660 != 0;
    float _1664 = _1539 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_72.x = _771;
    out.m_72.y = _397;
    out.m_72.z = _791;
    bool _1666 = _147 > 0.5;
    float _1668 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1670 = int(_1668);
    bool _1672 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1674 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1676 = _1672 || _1674;
    bool _1678 = isnan(0.5);
    bool _1680 = _1676 || _1678;
    out.m_74.x = _1311;
    out.m_74.y = _1309;
    out.m_74.z = _1313;
    bool _1682 = _151 > 0.5;
    int _1684 = abs(_681);
    float _1686 = float(_1656);
    float _1688 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1690 = int(_1688);
    float _1692 = float(uint(_1670));
    float _1694 = 1.0 / _1686;
    bool _1696 = _1658 > 0.5;
    int _1698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1700 = _1698 != 0;
    float _1702 = 1.0 / _1692;
    float _1704 = float(_1690);
    float _1706 = _147 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1708 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1710 = _1708 != 0;
    float _1712 = _117 * _1694;
    float _1714 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1716 = int(_1714);
    float _1718 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1720 = _1605;
    float _1722 = _1575;
    float _1724 = _1607;
    if (_1700)
    {
        _1718 = _147;
    }
    float _1726 = _1718;
    float _1728 = _1726;
    if (!_1700)
    {
        _1728 = _151;
    }
    float _1730 = _1728;
    float _1732 = 0.0;
    if (_1700)
    {
        _1732 = 1.0;
    }
    float _1734 = _1732;
    int _1736 = as_type<int>(_1702) + (-2);
    float _1738 = trunc(_1712);
    int _1740 = int(_1738);
    float _1742 = _1734;
    if (!_1700)
    {
        _1742 = 7.345489978790283203125;
    }
    float _1744 = _1742;
    float _1746 = _1744 * _147;
    float _1748 = 1.0 / _1704;
    float _1750 = float(uint(_1716));
    int _1752 = ~_1716;
    int _1754 = _1752 + 1;
    int _1756 = ~_1716;
    int _1758 = _1756 + 1;
    float _1760 = float(uint(_1740));
    float _1762 = 1.0 / _1750;
    float _1764 = as_type<float>(_1736) * _1760;
    float _1766 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1768 = ~_1670;
    int _1770 = _1768 + 1;
    float _1772 = _117 * _1748;
    float _1774 = _1748;
    if (_1700)
    {
        _1774 = 1.0;
    }
    float _1776 = _1774;
    float _1778 = -_1766;
    float _1780 = fma(_1706, 2.0, _1778);
    float _1782 = trunc(_1764);
    float _1784 = precise::max(_1782, 0.0);
    uint _1787 = uint(_1784);
    float _1789 = _1776;
    if (!_1700)
    {
        _1789 = 1.2345600128173828125;
    }
    float _1791 = _1789;
    float _1793 = -_117;
    float _1795 = fma(_1793, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1780);
    float _1797 = _1791 * _1730;
    float _1799 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1801 = trunc(_1772);
    int _1803 = int(_1801);
    float _1805 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1807 = as_type<int>(_1762) + (-2);
    float _1809 = fma(_1799, -2.0, _1805);
    int _1811 = _1770 * int(_1787);
    int _1813 = _1811 + _1740;
    float _1815 = floor(_1746);
    float _1817 = -_211;
    int _1819 = _1666 ? as_type<int>(_1817) : as_type<int>(_211);
    float _1821 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1809);
    int _1823 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1825 = _1823 != 0;
    float _1827 = float(uint(_1813));
    float _1829 = float(uint(_1803));
    float _1831 = floor(_1797);
    float _1833 = -_231;
    int _1835 = _1682 ? as_type<int>(_1833) : as_type<int>(_231);
    bool _1837 = !_1710;
    float _1839 = _1837 ? _211 : as_type<float>(_1819);
    float _1841 = as_type<float>(_1807) * _1829;
    float _1843 = as_type<float>(_1736) * _1827;
    bool _1845 = !_1825;
    float _1847 = _1845 ? _231 : as_type<float>(_1835);
    int _1849 = as_type<int>(_1827);
    if (_1700)
    {
        _1849 = 0;
    }
    int _1851 = _1849;
    float _1853 = -_1815;
    float _1855 = _1746 + _1853;
    float _1857 = trunc(_1841);
    float _1859 = precise::max(_1857, 0.0);
    uint _1861 = uint(_1859);
    int _1863 = _1851;
    if (!_1700)
    {
        _1863 = 1;
    }
    int _1865 = _1863;
    float _1867 = _1839 + 0.5;
    float _1869 = _1847 + (-0.5);
    bool _1871 = _159 > 0.5;
    bool _1873 = _1865 != 1;
    float _1875 = fma(_1867, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1795);
    float _1877 = trunc(_1843);
    float _1879 = precise::max(_1877, 0.0);
    uint _1881 = uint(_1879);
    float _1883 = -_1869;
    float _1885 = -_1821;
    float _1887 = fma(_1883, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1885);
    float _1889 = -_1831;
    float _1891 = _1797 + _1889;
    int _1893 = ~_1670;
    int _1895 = _1893 + 1;
    int _1897 = _1754 * int(_1861);
    int _1899 = _1897 + _1803;
    int _1901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1903 = _1901 != 0;
    float _1905 = float(uint(_1899));
    int _1907 = int(_1787) + int(_1881);
    float _1909 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1911 = as_type<float>(_1807) * _1905;
    float _1913 = as_type<float>(_1881);
    float _1915 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    if (!_1873)
    {
        _1913 = _151;
    }
    float _1917 = _1913;
    int _1919 = _1895 * _1907;
    int _1921 = _1919 + _1740;
    float _1923 = trunc(_1911);
    float _1925 = precise::max(_1923, 0.0);
    uint _1927 = uint(_1925);
    float _1929 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1909);
    float _1931 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1933 = float(_1670);
    bool _1935 = uint(_1921) >= uint(_1670);
    float _1937 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1929);
    float _1939 = float(_1740);
    bool _1941 = !_1935;
    int _1943 = _1941 ? 0 : (-1);
    bool _1945 = _1939 >= _1933;
    bool _1947 = isnan(_1939);
    bool _1949 = _1945 || _1947;
    bool _1951 = isnan(_1933);
    bool _1953 = _1949 || _1951;
    float _1955 = float(_1953);
    float _1957 = _1917;
    float _1959 = _1931;
    if (!_1873)
    {
        _1915 = _151;
    }
    float _1961 = _1915;
    float _1963 = _1961;
    if (_1873)
    {
        _1957 = _147;
    }
    float _1965 = _1957;
    float _1967 = trunc(_1955);
    int _1969 = int(_1967);
    int _1971 = int(_1861) + int(_1927);
    int _1973 = ~_1907;
    int _1975 = _1973 + _1943;
    int _1977 = _1975 + 1;
    float _1979 = _1855 * _1933;
    float _1981 = float(_1716);
    int _1983 = _1758 * _1971;
    int _1985 = _1983 + _1803;
    float _1987 = float(_1803);
    int _1989 = _1670 * _1977;
    int _1991 = _1989 + _1740;
    if (_1873)
    {
        _1963 = _147;
    }
    float _1993 = _1963;
    float _1995 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1931);
    if (!_1873)
    {
        _1959 = _159;
    }
    float _1997 = _1959;
    float _1999 = _197 * _1933;
    float _2001 = _1997;
    if (_1873)
    {
        _167 = _151;
    }
    float _2003 = _167;
    float _2005 = _197 * _1981;
    if (_1873)
    {
        _2001 = _151;
    }
    float _2007 = _2001;
    float _2009 = trunc(_1979);
    int _2011 = int(_2009);
    bool _2013 = _1987 >= _1981;
    bool _2015 = isnan(_1987);
    bool _2017 = _2013 || _2015;
    bool _2019 = isnan(_1981);
    bool _2021 = _2017 || _2019;
    float _2023 = float(_2021);
    float _2025 = _1891 * _1981;
    float _2027 = _2003 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2029 = _1670 == 0;
    float _2031 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1995);
    bool _2033 = uint(_1985) >= uint(_1716);
    float _2035 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2037 = trunc(_2023);
    int _2039 = int(_2037);
    int _2041 = ~_1969;
    int _2043 = _2041 + 1;
    int _2045 = _2043 + 1;
    float _2047 = -_2031;
    float _2049 = _2047 + 1.0;
    bool _2051 = !_2029;
    int _2053 = _2051 ? _1991 : (-1);
    float _2055 = fma(_1993, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2035);
    bool _2057 = !_2033;
    int _2059 = _2057 ? 0 : (-1);
    float _2061 = fma(_1847, _2049, _1887);
    int _2063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2065 = _2063 != 0;
    float _2067 = trunc(_1999);
    int _2069 = int(_2067);
    int _2071 = _1670 + (-1);
    int _2073 = _2053 * _2045;
    int _2075 = ~_1971;
    int _2077 = _2075 + _2059;
    int _2079 = _2077 + 1;
    float _2081 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2055);
    bool _2083 = !_2065;
    int _2085 = _2083 ? 0 : 1;
    int _2087 = _1969 * _2071;
    int _2089 = _2087 + _2073;
    int _2091 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2093 = _2091 != 0;
    int _2095 = _1716 * _2079;
    int _2097 = _2095 + _1803;
    int _2099 = _2089 * _1684;
    bool _2101 = !_2093;
    int _2103 = _2101 ? 0 : 1;
    float _2105 = trunc(_2005);
    int _2107 = int(_2105);
    bool _2109 = _1716 == 0;
    float _2111 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2113 = abs(_687);
    float _2115 = -_2081;
    float _2117 = _2115 + 1.0;
    int _2119 = ~_2039;
    int _2121 = _2119 + 1;
    int _2123 = _2121 + 1;
    float _2125 = fma(_2007, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2111);
    bool _2127 = !_2109;
    int _2129 = _2127 ? _2097 : (-1);
    int _2131 = _2069 * _2113;
    int _2133 = _2131 + _2099;
    int _2135 = abs(_693);
    float _2137 = _1965 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2139 = _1716 + (-1);
    int _2141 = _2129 * _2123;
    float _2143 = trunc(_2025);
    int _2145 = int(_2143);
    int _2147 = abs(_2085);
    float _2149 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2125);
    int _2151 = _2039 * _2139;
    int _2153 = _2151 + _2141;
    bool _2155 = !_1662;
    int _2157 = _2155 ? 0 : 1;
    int _2159 = _2011 * _2147;
    int _2161 = _2159 + _1740;
    float _2163 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2165 = abs(_2103);
    int _2167 = _2161 * _2135;
    int _2169 = _2167 + _2133;
    int _2171 = abs(_2157);
    float _2173 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2175 = abs(_1155);
    float _2177 = -_2163;
    float _2179 = fma(_2137, 2.0, _2177);
    int _2181 = _2011 * _2171;
    int _2183 = _2181 + _2169;
    float _2185 = fma(_2027, -2.0, _2173);
    float _2187 = float(uint(_2161));
    float _2189 = -_2149;
    float _2191 = _2189 + 1.0;
    int _2193 = _2145 * _2165;
    int _2195 = _2193 + _1803;
    int _2197 = abs(_1171);
    int _2199 = _2153 * _2175;
    int _2201 = abs(_1159);
    float _2203 = as_type<float>(_1736) * _2187;
    float _2205 = float(uint(_2183));
    float _2207 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2185);
    int _2209 = abs(_1175);
    float _2211 = _397 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2213 = _2107 * _2201;
    int _2215 = _2213 + _2199;
    float _2217 = as_type<float>(_1736) * _2205;
    float _2219 = trunc(_2203);
    float _2221 = precise::max(_2219, 0.0);
    uint _2223 = uint(_2221);
    float _2225 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2211);
    int _2227 = _2195 * _2197;
    int _2229 = _2227 + _2215;
    int _2231 = ~_1670;
    int _2233 = _2231 + 1;
    float _2235 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2225);
    int _2237 = ~_1670;
    int _2239 = _2237 + 1;
    int _2241 = _2145 * _2209;
    int _2243 = _2241 + _2229;
    float _2245 = trunc(_2217);
    float _2247 = precise::max(_2245, 0.0);
    uint _2249 = uint(_2247);
    float _2251 = _2235 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2253 = float(uint(_2195));
    int _2255 = ~_1716;
    int _2257 = _2255 + 1;
    int _2259 = _2239 * int(_2223);
    int _2261 = _2259 + _2161;
    float _2263 = as_type<float>(_1807) * _2253;
    int _2265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2267 = _2265 != 0;
    float _2269 = 1.0 / _2251;
    int _2271 = ~_1716;
    int _2273 = _2271 + 1;
    float _2275 = float(uint(_2261));
    int _2277 = _2233 * int(_2249);
    int _2279 = _2277 + _2183;
    float _2281 = -_117;
    float _2283 = fma(_2281, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2179);
    float _2285 = float(uint(_2243));
    float _2287 = trunc(_2263);
    float _2289 = precise::max(_2287, 0.0);
    uint _2291 = uint(_2289);
    float _2293 = as_type<float>(_1736) * _2275;
    float _2295 = float(uint(_2279));
    float _2297 = -_211;
    int _2299 = _1871 ? as_type<int>(_2297) : as_type<int>(_211);
    int _2301 = ~_1670;
    int _2303 = _2301 + 1;
    float _2305 = as_type<float>(_1736) * _2295;
    float _2307 = as_type<float>(_1807) * _2285;
    float _2309 = _397 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2311 = -_231;
    int _2313 = _1696 ? as_type<int>(_2311) : as_type<int>(_231);
    float _2315 = trunc(_2293);
    float _2317 = precise::max(_2315, 0.0);
    uint _2319 = uint(_2317);
    bool _2321 = !_2267;
    float _2323 = _2321 ? _211 : as_type<float>(_2299);
    float _2325 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2309);
    int _2327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2329 = _2327 != 0;
    float _2331 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2333 = _2257 * int(_2291);
    int _2335 = _2333 + _2195;
    float _2337 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2325);
    bool _2339 = !_1903;
    float _2341 = _2339 ? _231 : as_type<float>(_2313);
    float _2343 = trunc(_2307);
    float _2345 = precise::max(_2343, 0.0);
    uint _2347 = uint(_2345);
    float _2349 = _2323 + 0.5;
    float _2351 = float(uint(_2335));
    float _2353 = _2337 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2355 = _2341 + (-0.5);
    float _2357 = fma(_2349, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2283);
    int _2359 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2361 = _2359 != 0;
    float _2363 = _2353 + _2251;
    float _2365 = trunc(_2305);
    float _2367 = precise::max(_2365, 0.0);
    uint _2369 = uint(_2367);
    float _2371 = -_2355;
    float _2373 = -_2207;
    float _2375 = fma(_2371, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2373);
    float _2377 = -_1937;
    float _2379 = _2377 + 1.0;
    float _2381 = as_type<float>(_1807) * _2351;
    float _2383 = _2363 * _2269;
    float _2385 = _2383 * 0.5;
    int _2387 = ~_1716;
    int _2389 = _2387 + 1;
    float _2391 = -_2379;
    float _2393 = fma(_1839, _2391, _1875);
    float _2395 = -_2117;
    float _2397 = fma(_2323, _2395, _2357);
    int _2399 = _2273 * int(_2347);
    int _2401 = _2399 + _2243;
    float _2403 = fma(_2341, _2191, _2375);
    float _2405 = _1049 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2407 = trunc(_2381);
    float _2409 = precise::max(_2407, 0.0);
    uint _2411 = uint(_2409);
    int _2413 = ~_1670;
    int _2415 = _2413 + 1;
    float _2417 = float(uint(_2401));
    out.m_76.x = _2393;
    out.m_76.y = _2061;
    out.m_76.z = _2397;
    out.m_76.w = _2403;
    float _2419 = as_type<float>(_1807) * _2417;
    int _2421 = int(_2249) + int(_2369);
    float _2423 = as_type<float>(_2249);
    float _2425 = _2049;
    if (!_1680)
    {
        _2423 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2427 = _2423;
    float _2429 = trunc(_2419);
    float _2431 = precise::max(_2429, 0.0);
    uint _2433 = uint(_2431);
    if (!_1680)
    {
        float _2435 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2437 = fma(_2385, _2427, _2435);
        _2425 = _2437;
    }
    float _2439 = _2425;
    int _2441 = _2303 * _2421;
    int _2443 = _2441 + _2183;
    int _2445 = int(_2223) + int(_2319);
    float _2447 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2449 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2451 = -_1029;
    float _2453 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2331);
    bool _2455 = uint(_2443) >= uint(_1670);
    float _2457 = _1049 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2459 = -_1029;
    float _2461 = fma(_2459, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2447);
    float _2463 = -_1029;
    float _2465 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2449);
    bool _2467 = !_2455;
    int _2469 = _2467 ? 0 : (-1);
    float _2471 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2457);
    int _2473 = int(_2347) + int(_2433);
    float _2475 = _1049 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2477 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2479 = ~_2421;
    int _2481 = _2479 + _2469;
    int _2483 = _2481 + 1;
    float _2485 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2405);
    float _2487 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2475);
    int _2489 = _2389 * _2473;
    int _2491 = _2489 + _2243;
    float _2493 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2461);
    int _2495 = _1670 * _2483;
    int _2497 = _2495 + _2183;
    float _2499 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2453);
    float _2501 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2465);
    bool _2503 = uint(_2491) >= uint(_1716);
    float _2505 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2477);
    bool _2507 = !_2029;
    int _2509 = _2507 ? _2497 : (-1);
    float _2511 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2513 = !_2503;
    int _2515 = _2513 ? 0 : (-1);
    float _2517 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2519 = _2509 & 3;
    bool _2521 = _2519 != 0;
    float _2523 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2511);
    int _2525 = ~_2473;
    int _2527 = _2525 + _2515;
    int _2529 = _2527 + 1;
    float _2531 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2517);
    int _2533 = _2509 >> 31;
    int _2535 = _2415 * _2445;
    int _2537 = _2535 + _2161;
    int _2539 = _2521 ? 0 : 1;
    int _2541 = _1716 * _2529;
    int _2543 = _2541 + _2243;
    int _2545 = _2533 & 3;
    float _2547 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2523);
    int _2549 = int(_2291) + int(_2411);
    float _2551 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2505);
    int _2553 = _2509 + _2545;
    float _2555 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2485);
    int _2557 = _2509 & 3;
    bool _2559 = _2557 != 0;
    float _2561 = _2439;
    if (!_1680)
    {
        float _2563 = 1.0 / _2439;
        _2561 = _2563;
    }
    float _2565 = _2561;
    bool _2567 = !_2109;
    int _2569 = _2567 ? _2543 : (-1);
    bool _2571 = !_2559;
    int _2573 = _2571 ? 0 : 1;
    bool _2575 = uint(_2557) >= 2u;
    int _2577 = _2569 >> 31;
    int _2579 = _2553 >> 2;
    int _2581 = _2575 ? 0 : 1;
    int _2583 = _2577 & 3;
    bool _2585 = _2557 != 3;
    int _2587 = _2579 << 4;
    int _2589 = _2587 + 368;
    int _2591 = ~_1716;
    int _2593 = _2591 + 1;
    bool _2595 = uint(_2557) > 1u;
    int _2597 = _2569 + _2583;
    int _2599 = _2593 * _2549;
    int _2601 = _2599 + _2195;
    int _2603 = ~_2581;
    int _2605 = _2603 + 1;
    int _2607 = _2605 + 1;
    uint _2609 = uint(int(uint(_2589) >> uint(2)));
    uint _2611 = uint(int(uint(int(_2609)) >> uint(2)));
    int _2613 = int(_2609) & 3;
    float _2615 = (*spvDescriptorSet0.vp_c9)._m0[int(_2611)][_2613];
    int _2617 = int(_2609) + 1;
    uint _2619 = uint(int(uint(_2617) >> uint(2)));
    int _2621 = _2617 & 3;
    float _2623 = (*spvDescriptorSet0.vp_c9)._m0[int(_2619)][_2621];
    int _2625 = _2597 >> 2;
    int _2627 = _2607;
    if (_2585)
    {
        int _2629 = ~_2581;
        int _2631 = _2629 + 1;
        _2627 = _2631;
    }
    int _2633 = _2627;
    float _2635 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2531);
    int _2637 = _2625 << 4;
    int _2639 = _2637 + 512;
    float _2641 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2471);
    bool _2643 = uint(_2601) >= uint(_1716);
    int _2645 = _2589 + 8;
    uint _2647 = uint(int(uint(_2645) >> uint(2)));
    uint _2649 = uint(int(uint(int(_2647)) >> uint(2)));
    int _2651 = int(_2647) & 3;
    float _2653 = (*spvDescriptorSet0.vp_c9)._m0[int(_2649)][_2651];
    int _2655 = int(_2647) + 1;
    uint _2657 = uint(int(uint(_2655) >> uint(2)));
    int _2659 = _2655 & 3;
    float _2661 = (*spvDescriptorSet0.vp_c9)._m0[int(_2657)][_2659];
    int _2663 = ~_2539;
    int _2665 = _2663 + 1;
    int _2667 = _2665 + 1;
    int _2669 = _2667;
    if (!_2595)
    {
        int _2671 = ~_2539;
        int _2673 = _2671 + 1;
        _2669 = _2673;
    }
    int _2675 = _2669;
    bool _2677 = uint(_2537) >= uint(_1670);
    bool _2679 = !_2643;
    int _2681 = _2679 ? 0 : (-1);
    uint _2683 = uint(int(uint(_2639) >> uint(2)));
    uint _2685 = uint(int(uint(int(_2683)) >> uint(2)));
    int _2687 = int(_2683) & 3;
    float _2689 = (*spvDescriptorSet0.vp_c9)._m0[int(_2685)][_2687];
    int _2691 = int(_2683) + 1;
    uint _2693 = uint(int(uint(_2691) >> uint(2)));
    int _2695 = _2691 & 3;
    float _2697 = (*spvDescriptorSet0.vp_c9)._m0[int(_2693)][_2695];
    bool _2699 = !_2677;
    int _2701 = _2699 ? 0 : (-1);
    int _2703 = _2569 & 3;
    bool _2705 = _2703 != 0;
    int _2707 = ~_2445;
    int _2709 = _2707 + _2701;
    int _2711 = _2709 + 1;
    float _2713 = _231 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2715 = !_2705;
    int _2717 = _2715 ? 0 : 1;
    int _2719 = _2639 + 8;
    uint _2721 = uint(int(uint(_2719) >> uint(2)));
    uint _2723 = uint(int(uint(int(_2721)) >> uint(2)));
    int _2725 = int(_2721) & 3;
    float _2727 = (*spvDescriptorSet0.vp_c9)._m0[int(_2723)][_2725];
    int _2729 = int(_2721) + 1;
    uint _2731 = uint(int(uint(_2729) >> uint(2)));
    int _2733 = _2729 & 3;
    float _2735 = (*spvDescriptorSet0.vp_c9)._m0[int(_2731)][_2733];
    int _2737 = _2569 & 3;
    bool _2739 = _2737 != 0;
    float _2741 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2487);
    bool _2743 = _2703 != 3;
    float _2745 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2747 = _2739 ? 0 : 1;
    float _2749 = _2713 * _2493;
    bool _2751 = uint(_2703) >= 2u;
    int _2753 = _1670 * _2711;
    int _2755 = _2753 + _2161;
    int _2757 = ~_2549;
    int _2759 = _2757 + _2681;
    int _2761 = _2759 + 1;
    float _2763 = _2713 * _2499;
    int _2765 = _2751 ? 0 : 1;
    float _2767 = fma(_2745, _2641, _2749);
    bool _2769 = uint(_2703) > 1u;
    out.m_78.x = _2641;
    out.m_78.y = _2555;
    out.m_78.z = _2741;
    int _2771 = abs(_2675);
    int _2773 = _1716 * _2761;
    int _2775 = _2773 + _2195;
    int _2777 = ~_2747;
    int _2779 = _2777 + 1;
    int _2781 = _2779 + 1;
    float _2783 = fma(_2745, _2555, _2763);
    int _2785 = ~_2765;
    int _2787 = _2785 + 1;
    int _2789 = _2787 + 1;
    int _2791 = _2789;
    int _2793 = _2781;
    float _2795 = _2767;
    if (_2743)
    {
        int _2797 = ~_2765;
        int _2799 = _2797 + 1;
        _2791 = _2799;
    }
    int _2801 = _2791;
    int _2803 = abs(_2717);
    int _2805 = abs(_2633);
    if (!_2769)
    {
        int _2807 = ~_2747;
        int _2809 = _2807 + 1;
        _2793 = _2809;
    }
    int _2811 = _2793;
    int _2813 = ~_2771;
    int _2815 = _2813 + 1;
    int _2817 = _2815 + 1;
    int _2819 = abs(_2811);
    int _2821 = abs(_2573);
    int _2823 = _2817 * as_type<int>(_2623);
    int _2825 = abs(_2801);
    int _2827 = ~_2819;
    int _2829 = _2827 + 1;
    int _2831 = _2829 + 1;
    int _2833 = ~_2821;
    int _2835 = _2833 + 1;
    int _2837 = _2835 + 1;
    int _2839 = _2831 * as_type<int>(_2697);
    int _2841 = ~_2803;
    int _2843 = _2841 + 1;
    int _2845 = _2843 + 1;
    int _2847 = _2837 * as_type<int>(_2615);
    int _2849 = _2847 + _2823;
    float _2851 = fma(_2713, _2713, 1.0);
    int _2853 = ~_2805;
    int _2855 = _2853 + 1;
    int _2857 = _2855 + 1;
    int _2859 = _2845 * as_type<int>(_2689);
    int _2861 = _2859 + _2839;
    bool _2863 = _2557 != 3;
    int _2865 = ~_2825;
    int _2867 = _2865 + 1;
    int _2869 = _2867 + 1;
    int _2871 = _2857 * as_type<int>(_2653);
    int _2873 = _2871 + _2849;
    bool _2875 = _2703 != 3;
    float _2877 = rsqrt(_2851);
    bool _2879 = !_2863;
    int _2881 = _2879 ? 0 : (-1);
    int _2883 = _2869 * as_type<int>(_2727);
    int _2885 = _2883 + _2861;
    bool _2887 = !_2875;
    int _2889 = _2887 ? 0 : (-1);
    float _2891 = _1605 + _1575;
    int _2893 = abs(_2881);
    bool _2895 = !_2361;
    int _2897 = _2895 ? 0 : 1;
    float _2899 = _2891 * 0.5;
    int _2901 = abs(_2889);
    bool _2903 = !_2329;
    int _2905 = _2903 ? 0 : 1;
    int _2907 = abs(_2897);
    float _2909 = _2713 * _2501;
    int _2911 = abs(_2905);
    int _2913 = ~_2893;
    int _2915 = _2913 + 1;
    int _2917 = _2915 + 1;
    float _2919 = fma(_2745, _2741, _2909);
    int _2921 = ~_2901;
    int _2923 = _2921 + 1;
    int _2925 = _2923 + 1;
    int _2927 = ~_2911;
    int _2929 = _2927 + 1;
    int _2931 = _2929 + 1;
    int _2933 = _2917 * as_type<int>(_2661);
    int _2935 = _2933 + _2873;
    int _2937 = ~_2907;
    int _2939 = _2937 + 1;
    int _2941 = _2939 + 1;
    int _2943 = _2925 * as_type<int>(_2735);
    int _2945 = _2943 + _2885;
    bool _2947 = !_2029;
    int _2949 = _2947 ? _2755 : (-1);
    int _2951 = _2935 * _2931;
    float _2953 = _2713 * _2877;
    int _2955 = _2945 * _2941;
    float _2957 = _1537 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2959 = _2949 * _2911;
    int _2961 = _2959 + _2951;
    bool _2963 = !_2109;
    int _2965 = _2963 ? _2775 : (-1);
    float _2967 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1664);
    float _2969 = exp2(_2957);
    float _2971 = -_2551;
    float _2973 = _2953 * _2971;
    float _2975 = -_2635;
    float _2977 = _2953 * _2975;
    float _2979 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2967);
    int _2981 = _2965 * _2907;
    int _2983 = _2981 + _2955;
    float _2985 = -_2547;
    float _2987 = _2953 * _2985;
    float _2989 = fma(_2877, _2499, _2973);
    float _2991 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2979);
    float _2993 = fma(_2877, _2501, _2977);
    float _2995 = _1575 * 0.5;
    float _2997 = fma(_2877, _2493, _2987);
    float _2999 = _2991 + _1575;
    out.gl_Position.x = _1605;
    out.gl_Position.y = _1607;
    out.gl_Position.z = _2991;
    out.gl_Position.w = _1575;
    float _3001 = fma(_1607, -0.5, _2995);
    float _3003 = float(_2961);
    float _3005 = _2999 * 0.5;
    float _3007 = -_2969;
    float _3009 = _3007 + 1.0;
    float _3011 = float(_2983);
    float _3013 = _2547 + _2767;
    float _3015 = _3009 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3017 = _2551 + _2783;
    float _3019 = _2635 + _2919;
    out.m_80.x = _3003;
    out.m_80.y = _3011;
    float _3021 = _3015 * _1631;
    float _3023 = _1631;
    float _3025 = _2989;
    float _3027 = _2997;
    if (!_1680)
    {
        _3023 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _3029 = _3023;
    float _3031 = -_3015;
    float _3033 = _3031 + 1.0;
    out.m_82.x = _2899;
    out.m_82.y = _3001;
    out.m_82.z = _3005;
    out.m_82.w = _1575;
    float _3035 = _1641 * _3021;
    float _3037 = _1652 * _3021;
    float _3039 = _3033;
    if (!_1680)
    {
        float _3041 = -_3029;
        float _3043 = _3041 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1720 = _3043;
    }
    float _3045 = _1720;
    out.m_84.x = _3013;
    out.m_84.y = _3017;
    out.m_84.z = _3019;
    bool _3047 = _1337 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3049 = isnan(_1337);
    bool _3051 = _3047 || _3049;
    bool _3053 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3055 = _3051 || _3053;
    float _3057 = fma(_1637, _3037, _1646);
    float _3059 = fma(_1639, _3037, _1648);
    float _3061 = _1652 * _3033;
    float _3063 = fma(_1652, _3035, _1650);
    float _3065 = _3045;
    if (!_1680)
    {
        float _3067 = 1.0 / _3045;
        _3065 = _3067;
    }
    float _3069 = _3065;
    if (!_1680)
    {
        float _3071 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3073 = -_3029;
        float _3075 = fma(_2565, _3071, _3073);
        _2795 = _3075;
    }
    float _3077 = _2795;
    out.m_86.x = _2997;
    out.m_86.y = _2989;
    out.m_86.z = _2993;
    out.m_88.x = _3057;
    out.m_88.y = _3059;
    out.m_88.z = _3063;
    out.m_88.w = _3061;
    float _3079 = _3077;
    if (!_3055)
    {
        _1722 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3081 = _1722;
    float _3083 = _3081;
    float _3085 = _3081;
    if (!_3055)
    {
        _3039 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3087 = _3039;
    float _3089 = _3087;
    float _3091 = _3087;
    if (!_3055)
    {
        _1724 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3093 = _1724;
    float _3095 = _3093;
    float _3097 = _3093;
    if (_1680)
    {
        _3025 = 1.0;
    }
    float _3099 = _3025;
    float _3101 = _3099;
    float _3103 = _3069;
    if (!_1680)
    {
        float _3105 = _3077 * _3069;
        float _3107 = precise::clamp(_3105, 0.0, 1.0);
        _3101 = _3107;
    }
    float _3109 = _3101;
    if (!_3055)
    {
        _3027 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3111 = _3027;
    float _3113 = _3111;
    float _3115 = _3111;
    if (!_3055)
    {
        _3103 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3117 = _3103;
    float _3119 = _3109 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3121 = _3117;
    float _3123 = _3117;
    if (!_3055)
    {
        _3079 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3125 = _3079;
    bool _3127 = !_3055;
    float _3129 = _3125;
    float _3131 = _3125;
    if (!_3127)
    {
        bool _3133 = _1337 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3135 = isnan(_1337);
        bool _3137 = _3133 || _3135;
        bool _3139 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3141 = _3137 || _3139;
        if (!_3141)
        {
            float _3143 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3145 = _1337 + _3143;
            float _3147 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3149 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3147;
            float _3151 = 1.0 / _3149;
            float _3153 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3155 = _3153 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3157 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3159 = _3157 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3161 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3163 = _3161 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3165 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3167 = _3165 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3169 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3171 = _3169 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3173 = _3145 * _3151;
            float _3175 = precise::clamp(_3173, 0.0, 1.0);
            float _3177 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3179 = _3177 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3181 = fma(_3175, _3155, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3183 = fma(_3175, _3179, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3185 = fma(_3175, _3159, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3187 = fma(_3175, _3163, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3189 = fma(_3175, _3167, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3191 = fma(_3175, _3171, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3085 = _3183;
            _3123 = _3189;
            _3115 = _3181;
            _3097 = _3187;
            _3091 = _3185;
            _3131 = _3191;
            _3193 = true;
        }
        else
        {
            bool _3195 = _1337 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3197 = isnan(_1337);
            bool _3199 = _3195 || _3197;
            bool _3201 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3203 = _3199 || _3201;
            if (!_3203)
            {
                _3113 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3205 = _3113;
            _3115 = _3205;
            if (!_3203)
            {
                _3083 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3207 = _3083;
            _3085 = _3207;
            if (!_3203)
            {
                _3089 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3209 = _3089;
            _3091 = _3209;
            if (!_3203)
            {
                _3095 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3211 = _3095;
            _3097 = _3211;
            if (!_3203)
            {
                _3121 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3213 = _3121;
            _3123 = _3213;
            if (!_3203)
            {
                _3129 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3215 = _3129;
            bool _3217 = !_3203;
            _3131 = _3215;
            if (!_3217)
            {
                bool _3219 = _1337 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3221 = isnan(_1337);
                bool _3223 = _3219 || _3221;
                bool _3225 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3227 = _3223 || _3225;
                if (!_3227)
                {
                    float _3229 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3231 = _1337 + _3229;
                    float _3233 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3235 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3233;
                    float _3237 = 1.0 / _3235;
                    float _3239 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3241 = _3239 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3243 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3245 = _3243 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3247 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3249 = _3247 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3251 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3253 = _3251 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3255 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3257 = _3255 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3259 = _3231 * _3237;
                    float _3261 = precise::clamp(_3259, 0.0, 1.0);
                    float _3263 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3265 = _3263 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3267 = fma(_3261, _3241, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3269 = fma(_3261, _3265, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3271 = fma(_3261, _3245, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3273 = fma(_3261, _3249, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3275 = fma(_3261, _3253, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3277 = fma(_3261, _3257, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3085 = _3269;
                    _3123 = _3275;
                    _3115 = _3267;
                    _3097 = _3273;
                    _3091 = _3271;
                    _3131 = _3277;
                    _3193 = true;
                }
                else
                {
                    _3085 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3123 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3115 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3097 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3091 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3131 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3193 = false;
    float _3279 = _3085;
    float _3281 = _3123;
    float _3283 = _3115;
    float _3285 = _3097;
    float _3287 = _3091;
    float _3289 = _3131;
    float _3291 = _3119 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3293 = fma(_3017, -0.5, 0.5);
    float _3295 = precise::clamp(_3293, 0.0, 1.0);
    float _3297 = -_3279;
    float _3299 = _3297 + _3281;
    float _3301 = -_3283;
    float _3303 = _3301 + _3285;
    out.m_51.x = _3291;
    float _3305 = fma(_3295, _3299, _3279);
    float _3307 = -_3287;
    float _3309 = _3307 + _3289;
    float _3311 = fma(_3295, _3303, _3283);
    float _3313 = _3305 * 0.586610972881317138671875;
    bool _3315 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3317 = fma(_3295, _3309, _3287);
    out.m_90.x = 0.0;
    float _3319 = fma(_3311, 0.298911988735198974609375, _3313);
    bool _3321 = _3109 > 0.0;
    bool _3323 = isnan(_3109);
    bool _3325 = _3321 || _3323;
    bool _3327 = isnan(0.0);
    bool _3329 = _3325 || _3327;
    float _3331 = fma(_3317, 0.114477999508380889892578125, _3319);
    float _3333 = -_3331;
    float _3335 = _3311 + _3333;
    float _3337 = -_3331;
    float _3339 = _3305 + _3337;
    float _3341 = -_3331;
    float _3343 = _3317 + _3341;
    float _3345 = fma(_3335, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3331);
    float _3347 = fma(_3339, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3331);
    float _3349 = fma(_3343, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3331);
    bool _3351 = !_3315;
    if (!_3351)
    {
        float _3353 = -_1309;
        float _3355 = _3353 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3357 = -_1311;
        float _3359 = _3357 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3361 = -_1313;
        float _3363 = _3361 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3365 = _3355 * _3355;
        float _3367 = fma(_3359, _3359, _3365);
        float _3369 = fma(_3363, _3363, _3367);
        float _3371 = sqrt(_3369);
        float _3373 = rsqrt(_3369);
        float _3375 = -_3371;
        float _3377 = _3375 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3379 = _3377 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3381 = precise::clamp(_3379, 0.0, 1.0);
        float _3383 = _3359 * _3373;
        float _3385 = _3355 * _3373;
        float _3387 = abs(_3381);
        float _3389 = log2(_3387);
        float _3391 = _3363 * _3373;
        float _3393 = _3383 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3395 = _3017 * _3385;
        float _3397 = -_3385;
        float _3399 = -_3393;
        float _3401 = fma(_3397, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3399);
        float _3403 = fma(_3013, _3383, _3395);
        float _3405 = -_3391;
        float _3407 = fma(_3405, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3401);
        float _3409 = fma(_3019, _3391, _3403);
        float _3411 = precise::clamp(_3409, 0.0, 1.0);
        float _3413 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3415 = _3407 + _3413;
        float _3417 = _3389 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3419 = _3415 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3421 = precise::clamp(_3419, 0.0, 1.0);
        float _3423 = exp2(_3417);
        float _3425 = _3423 * _3421;
        float _3427 = _3411 * _3425;
        float _3429 = _3427 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3431 = _3427 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3433 = _3427 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _3429;
        out.m_90.y = _3431;
        out.m_90.z = _3433;
    }
    out.m_92.x = _3345;
    out.m_92.y = _3347;
    out.m_92.z = _3349;
    if (_3329)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _3435 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3435;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3193 = false;
    bool _253 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_44.w;
    float _108 = in.m_46.w;
    float _110 = trunc(_106);
    int _113 = int(_110);
    float _115 = -_108;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = as_type<float>(_113);
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _123;
    if (!_121)
    {
        out.m_51.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3503 = as_type<float>(_133);
        out.gl_Position.z = _3503;
    }
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _137 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_108);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = in.m_53.x;
    float _149 = float(_113);
    float _151 = in.m_53.y;
    bool _153 = _117 >= _149;
    bool _155 = !_145;
    bool _157 = _153 || _155;
    float _159 = in.m_53.z;
    if (_157)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _125;
    if (_157)
    {
        out.m_51.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _135 = as_type<int>(_163);
    }
    int _165 = _135;
    out.m_55.x = _147;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3566 = as_type<float>(_165);
        out.gl_Position.z = _3566;
    }
    out.m_55.y = _151;
    out.m_55.z = _159;
    float _167 = _159;
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = 1.0 / _149;
    float _173 = in.m_60.x;
    float _175 = in.m_60.y;
    float _177 = in.m_60.z;
    float _179 = in.m_62.x;
    float _181 = in.m_62.y;
    float _183 = in.m_62.z;
    float _185 = in.m_64.x;
    float _187 = in.m_64.y;
    float _189 = in.m_64.z;
    float _191 = in.m_66.x;
    float _193 = in.m_66.y;
    float _195 = in.m_66.z;
    float _197 = _117 * _171;
    int _199 = as_type<int>(_169) & 1;
    bool _201 = _199 != 0;
    int _203 = as_type<int>(_169) & 2;
    bool _205 = _203 != 0;
    bool _207 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _209 = !_201;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = _175 * _181;
    float _215 = _175 * _187;
    float _217 = fma(_173, _179, _213);
    float _219 = _175 * _193;
    float _221 = fma(_173, _185, _215);
    float _223 = fma(_177, _183, _217);
    float _225 = fma(_173, _191, _219);
    float _227 = fma(_177, _189, _221);
    bool _229 = !_205;
    float _231 = _229 ? (-0.5) : 0.5;
    float _233 = fma(_177, _195, _225);
    bool _235 = !_207;
    float _251;
    if (!_235)
    {
        float _237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _239 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _243 = _241 * _237;
        float _245 = floor(_243);
        float _247 = -_245;
        float _249 = _243 + _247;
        _251 = _249;
        _253 = true;
    }
    else
    {
        _251 = _197;
    }
    _253 = false;
    float _255 = _251;
    float _257 = in.m_44.x;
    float _259 = in.m_44.y;
    float _261 = in.m_44.z;
    float _263 = _151 * 2.0;
    float _265 = _159 * 2.0;
    float _267 = _147 * 2.0;
    float _269 = floor(_263);
    float _271 = _117 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _273 = _271 * _147;
    float _275 = floor(_265);
    float _277 = _273 * 0.15915493667125701904296875;
    float _279 = floor(_267);
    bool _281 = _269 > 0.0;
    float _283 = _181 * _259;
    float _285 = _187 * _259;
    float _287 = _193 * _259;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _289;
    float _293 = fma(_179, _257, _283);
    float _295 = _151 + _159;
    float _297 = fma(_185, _257, _285);
    float _299 = fma(_191, _257, _287);
    float _301 = _295 + (-1.0);
    float _303 = _147 + _159;
    float _305 = 1.0 / _291;
    float _307 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _309 = _303 + (-1.0);
    float _311 = _147 + _151;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _317 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _327 = _311 + (-1.0);
    float _329 = 1.0 / _315;
    bool _331 = _275 > 0.0;
    float _333 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _335 = _275 >= 0.0;
    bool _337 = isnan(_275);
    bool _339 = _335 || _337;
    bool _341 = isnan(0.0);
    bool _343 = _339 || _341;
    float _345 = 1.0 / _325;
    float _347 = (*spvDescriptorSet0.vp_c10)._m0[9].z * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _349;
    float _353 = fma(_183, _261, _293);
    float _355 = fma(_189, _261, _297);
    float _357 = fma((*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].z, _347);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _361 = _255 + _359;
    float _363 = fma(_195, _261, _299);
    float _365 = 1.0 / _321;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _369 = _255 + _367;
    float _371 = _361 * _305;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _375 = _255 + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _385 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _387 = isnan(_255);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = _355 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _399 = 1.0 / _351;
    float _401 = _375 * _345;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _405 = _255 + _403;
    bool _407 = _279 > 0.0;
    float _409 = fma(_379, _371, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _411 = _279 >= 0.0;
    bool _413 = isnan(_279);
    bool _415 = _411 || _413;
    bool _417 = isnan(0.0);
    bool _419 = _415 || _417;
    float _421 = _405 * _329;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _423;
    float _427 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _429 = log2(_427);
    float _431 = _369 * _365;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _439 = _255 + _437;
    float _441 = fma(_383, _421, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _443 = fma(_435, _421, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _445 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _447 = isnan(_255);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = _439 * _399;
    float _459 = fma((*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].z, _357);
    float _461 = -_395;
    float _463 = _461 + 1.0;
    float _465 = -_455;
    float _467 = _465 + 1.0;
    float _469 = _455 * _463;
    float _471 = _117 * _429;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _477;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _485 = exp2(_471);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _493 = 1.0 + _491;
    float _495 = fma(_483, _401, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    bool _497 = _269 >= 0.0;
    bool _499 = isnan(_269);
    bool _501 = _497 || _499;
    bool _503 = isnan(0.0);
    bool _505 = _501 || _503;
    float _507 = fma(_489, _401, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _509 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _511 = isnan(_255);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = fma(_425, _371, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _523 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _525 = isnan(_255);
    bool _527 = _523 || _525;
    bool _529 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _531 = _527 || _529;
    float _533 = float(_531);
    float _535 = fma(_475, _431, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _537 = fma(_479, _431, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _539 = _343 ? 0 : 1;
    float _541 = 1.0 / _493;
    bool _543 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _545 = isnan(_255);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _555;
    bool _559 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _561 = isnan(_255);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _567 = _563 || _565;
    float _569 = float(_567);
    float _571 = _519 * _467;
    float _573 = -_519;
    float _575 = _573 + 1.0;
    float _577 = -_533;
    float _579 = _577 + 1.0;
    int _581 = ~_539;
    int _583 = _581 + 1;
    int _585 = _583 + 1;
    float _587 = _277 * 6.283185482025146484375;
    float _589 = cos(_587);
    int _591 = _585;
    if (!_331)
    {
        int _593 = ~_539;
        int _595 = _593 + 1;
        _591 = _595;
    }
    int _597 = _591;
    float _599 = _569 * _575;
    float _601 = -_485;
    float _603 = _601 + 1.0;
    float _605 = -_569;
    float _607 = _605 + 1.0;
    float _609 = _553 * _579;
    bool _611 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _613 = isnan(0.0);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _619 = _615 || _617;
    float _621 = -_553;
    float _623 = _621 + 1.0;
    float _625 = rsqrt(_459);
    float _627 = _533 * _607;
    float _629 = _521 * _609;
    float _631 = _619 ? _603 : 0.0;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _633;
    float _637 = _409 * _609;
    int _639 = _505 ? 0 : 1;
    float _641 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[143].x, _629);
    float _643 = _277 * 6.283185482025146484375;
    float _645 = sin(_643);
    int _647 = _419 ? 0 : 1;
    float _649 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[143].y, _637);
    int _651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _653 = _651 != 0;
    int _655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _657 = _655 != 0;
    int _659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _661 = _659 != 0;
    float _663 = _631 * _541;
    float _665 = -_589;
    float _667 = _665 + 1.0;
    float _669 = fma(_443, _627, _641);
    float _671 = fma(_441, _627, _649);
    float _673 = _625 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _675 = _625 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _677 = _625 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    bool _679 = !_657;
    int _681 = _679 ? 0 : 1;
    float _683 = _673 * _667;
    bool _685 = !_653;
    int _687 = _685 ? 0 : 1;
    float _689 = fma(_635, _457, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    bool _691 = !_661;
    int _693 = _691 ? 0 : 1;
    float _695 = _675 * _645;
    int _697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _699 = _697 != 0;
    int _701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _703 = _701 != 0;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _707 = _705 != 0;
    float _709 = _677 * _645;
    int _711 = ~_639;
    int _713 = _711 + 1;
    int _715 = _713 + 1;
    float _717 = _673 * _645;
    float _719 = _677 * _667;
    int _721 = _715;
    if (!_281)
    {
        int _723 = ~_639;
        int _725 = _723 + 1;
        _721 = _725;
    }
    int _727 = _721;
    float _729 = fma(_677, _683, _695);
    bool _731 = !_699;
    int _733 = _731 ? 0 : 1;
    float _735 = fma(_557, _457, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _737 = fma(_673, _683, _589);
    float _739 = -_695;
    float _741 = fma(_677, _683, _739);
    float _743 = -_709;
    float _745 = fma(_675, _683, _743);
    float _747 = fma(_675, _683, _709);
    float _749 = fma(_675, _719, _717);
    float _751 = -_717;
    float _753 = fma(_675, _719, _751);
    int _755 = ~_647;
    int _757 = _755 + 1;
    int _759 = _757 + 1;
    float _761 = _675 * _675;
    int _763 = _759;
    if (!_407)
    {
        int _765 = ~_647;
        int _767 = _765 + 1;
        _763 = _767;
    }
    int _769 = _763;
    float _771 = _353 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _773 = abs(_733);
    float _775 = in.m_68.x;
    float _777 = in.m_68.y;
    float _779 = in.m_68.z;
    float _781 = fma(_677, _719, _589);
    float _783 = fma(_667, _761, _589);
    float _785 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _787 = _397 + _785;
    float _789 = float(_597);
    float _791 = _363 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _793 = float(_773);
    float _795 = _787 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _797 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _799 = _771 + _797;
    float _801 = _787 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _803 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _805 = isnan(1.0);
    bool _807 = _803 || _805;
    bool _809 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _811 = _807 || _809;
    float _813 = _793 * _789;
    float _815 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[8].x, _795);
    float _817 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[8].y, _801);
    float _819 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _821 = _791 + _819;
    float _823 = fma(_535, _599, _669);
    float _825 = _813 * (-2.0);
    float _827 = fma(_537, _599, _671);
    float _829 = fma(_821, (*spvDescriptorSet0.vp_c10)._m0[10].y, _817);
    float _831 = fma(_821, (*spvDescriptorSet0.vp_c10)._m0[10].x, _815);
    float _833 = fma(_333, _825, _333);
    bool _835 = !_707;
    int _837 = _835 ? 0 : 1;
    float _839 = _829 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _841 = _829 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _843 = _829 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _845 = fma(_825, _775, _775);
    float _847 = fma(_831, (*spvDescriptorSet0.vp_c10)._m0[9].x, _839);
    float _849 = fma(_831, (*spvDescriptorSet0.vp_c10)._m0[8].x, _841);
    bool _851 = !_703;
    int _853 = _851 ? 0 : 1;
    float _855 = fma(_831, (*spvDescriptorSet0.vp_c10)._m0[10].x, _843);
    int _857 = abs(_837);
    float _859 = _847 * _847;
    int _861 = abs(_853);
    float _863 = _147 + (-0.5);
    float _865 = fma(_507, _571, _827);
    float _867 = float(_727);
    float _869 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[196].x, _845);
    float _871 = fma(_735, _469, _865);
    float _873 = float(_769);
    float _875 = float(_857);
    float _877 = fma(_849, _849, _859);
    float _879 = float(_861);
    bool _881 = !_811;
    float _883 = _881 ? _117 : _663;
    float _885 = fma(_855, _855, _877);
    float _887 = _875 * _867;
    float _889 = _879 * _873;
    float _891 = fma(_495, _571, _823);
    float _893 = fma(_883, _833, _869);
    float _895 = _151 + (-0.5);
    float _897 = rsqrt(_885);
    float _899 = _889 * (-2.0);
    float _901 = in.m_70.x;
    float _903 = in.m_70.y;
    float _905 = fma(_689, _469, _891);
    float _907 = _893 * 0.15915493667125701904296875;
    float _909 = fma(_899, _777, _777);
    float _911 = fma(_307, _899, _307);
    float _913 = _887 * (-2.0);
    float _915 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[148].x, _905);
    float _917 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[196].y, _909);
    float _919 = _159 + (-0.5);
    float _921 = fma(_913, _779, _779);
    float _923 = fma(_317, _913, _317);
    float _925 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[148].y, _871);
    float _927 = fma(_883, _911, _917);
    float _929 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[196].z, _921);
    float _931 = _897 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _933 = _907 * 6.283185482025146484375;
    float _935 = sin(_933);
    float _937 = _927 * 0.15915493667125701904296875;
    float _939 = fma(_883, _923, _929);
    float _941 = _847 * _931;
    float _943 = _849 * _931;
    float _945 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _231);
    float _947 = _939 * 0.15915493667125701904296875;
    float _949 = _941 * _781;
    float _951 = _941 * _741;
    float _953 = _925 * _903;
    float _955 = _855 * _931;
    float _957 = fma(_943, _729, _949);
    float _959 = _941 * _749;
    float _961 = fma(_943, _737, _951);
    float _963 = _915 * _901;
    float _965 = fma(_955, _753, _957);
    float _967 = fma(_943, _745, _959);
    float _969 = fma(_955, _747, _961);
    float _971 = _907 * 6.283185482025146484375;
    float _973 = cos(_971);
    float _975 = _397 + _965;
    float _977 = fma(_955, _783, _967);
    float _979 = _771 + _969;
    float _981 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _211);
    float _983 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _985 = _975 + _983;
    float _987 = _963 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _989 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _991 = _979 + _989;
    float _993 = _937 * 6.283185482025146484375;
    float _995 = sin(_993);
    float _997 = _985 * _985;
    float _999 = _791 + _977;
    float _1001 = _953 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1003 = fma(_991, _991, _997);
    float _1005 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1007 = _999 + _1005;
    float _1009 = _987 * _981;
    float _1011 = _937 * 6.283185482025146484375;
    float _1013 = cos(_1011);
    float _1015 = _1001 * _945;
    float _1017 = fma(_1007, _1007, _1003);
    float _1019 = _947 * 6.283185482025146484375;
    float _1021 = cos(_1019);
    float _1023 = _935 * _995;
    float _1025 = _973 * _995;
    float _1027 = _947 * 6.283185482025146484375;
    float _1029 = sin(_1027);
    float _1031 = _973 * _1013;
    float _1033 = _935 * _1013;
    float _1035 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
    float _1037 = _973 * _1021;
    float _1039 = _935 * _1021;
    float _1041 = _1013 * _1021;
    float _1043 = _995 * _1021;
    float _1045 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1047 = sqrt(_1017);
    float _1049 = fma(_1029, _1031, _1023);
    float _1051 = fma(_1029, _1023, _1031);
    float _1053 = _1037 * _1015;
    float _1055 = -_1025;
    float _1057 = fma(_1029, _1033, _1055);
    float _1059 = -_1033;
    float _1061 = fma(_1029, _1025, _1059);
    float _1063 = -_1015;
    float _1065 = _1029 * _1063;
    float _1067 = fma(_1049, _1009, _1053);
    float _1069 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
    float _1071 = _1039 * _1015;
    float _1073 = fma(_1041, _1009, _1065);
    float _1075 = fma(_1061, _1045, _1067);
    float _1077 = fma(_1057, _1009, _1071);
    float _1079 = fma(_1043, _1045, _1073);
    float _1081 = _1069 * _1047;
    float _1083 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1085 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1087 = fma(_1051, _1045, _1077);
    float _1089 = fma(_1081, 0.00449999980628490447998046875, 0.100000001490116119384765625);
    float _1091 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1083);
    float _1093 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1085);
    float _1095 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1097 = precise::max(_1089, 0.100000001490116119384765625);
    float _1099 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1091);
    float _1101 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1093);
    float _1103 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1095);
    float _1105 = precise::min(_1097, 1.0);
    float _1107 = _1099 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1109 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1111 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1103);
    float _1113 = fma(_1107, _1105, _999);
    float _1115 = fma(_1109, _1105, _979);
    float _1117 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1119 = _1113 + _1117;
    float _1121 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1123 = _1115 + _1121;
    float _1125 = _1119 * _1119;
    float _1127 = fma(_1123, _1123, _1125);
    float _1129 = _1111 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1131 = sqrt(_1127);
    float _1133 = fma(_1129, _1105, _975);
    bool _1135 = _1131 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1139 = _1137 != 0;
    int _1141 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1143 = _1141 != 0;
    int _1145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1147 = _1145 != 0;
    int _1149 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1151 = _1149 != 0;
    bool _1153 = !_1143;
    int _1155 = _1153 ? 0 : 1;
    bool _1157 = !_1139;
    int _1159 = _1157 ? 0 : 1;
    float _1161 = _975;
    float _1163 = _1115;
    float _1165 = _1129;
    if (!_1135)
    {
        _1161 = _1115;
    }
    float _1167 = _1161;
    bool _1169 = !_1147;
    int _1171 = _1169 ? 0 : 1;
    bool _1173 = !_1151;
    int _1175 = _1173 ? 0 : 1;
    float _1177 = _1167;
    if (!_1135)
    {
        _1163 = _1113;
    }
    float _1179 = _1163;
    float _1181 = _1179;
    if (!_1135)
    {
        _1165 = _1133;
    }
    float _1183 = _1165;
    bool _1185 = !_1135;
    float _1187 = _1183;
    if (!_1185)
    {
        float _1189 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1191 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1193 = _1131 + _1191;
        float _1195 = _1133 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1197 = rsqrt(_1127);
        float _1199 = _1193 * _1189;
        float _1201 = _1199 * 0.15915493667125701904296875;
        float _1203 = _1201 * 6.283185482025146484375;
        float _1205 = cos(_1203);
        float _1207 = _1201 * 6.283185482025146484375;
        float _1209 = sin(_1207);
        float _1211 = _1205 + (-1.0);
        float _1213 = _1211 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1215 = fma(_1209, _1195, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1217 = fma(_1133, _1205, _1213);
        float _1219 = _1197 * _1215;
        float _1221 = fma(_1123, _1219, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1223 = fma(_1119, _1219, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1187 = _1217;
        _1177 = _1221;
        _1181 = _1223;
    }
    float _1225 = _1187;
    float _1227 = _1177;
    float _1229 = _1181;
    float _1231 = -_397;
    float _1233 = _1231 + _1225;
    float _1235 = -_771;
    float _1237 = _1235 + _1227;
    float _1239 = -_791;
    float _1241 = _1239 + _1229;
    float _1243 = _1233 * _1233;
    float _1245 = fma(_1237, _1237, _1243);
    float _1247 = fma(_1241, _1241, _1245);
    float _1249 = sqrt(_1247);
    bool _1251 = _1249 > 0.0;
    bool _1253 = !_1251;
    float _1255 = _1225;
    float _1257 = _1227;
    float _1259 = _1229;
    float _1261 = _1237;
    if (!_1253)
    {
        float _1263 = _227 * _227;
        float _1265 = fma(_223, _223, _1263);
        float _1267 = fma(_233, _233, _1265);
        float _1269 = rsqrt(_1247);
        float _1271 = sqrt(_1267);
        float _1273 = _1237 * _1269;
        float _1275 = _1233 * _1269;
        float _1277 = _1241 * _1269;
        bool _1279 = _1271 > 0.0;
        bool _1281 = !_1279;
        if (!_1281)
        {
            float _1283 = rsqrt(_1267);
            float _1285 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1287 = _227 * _1283;
            float _1289 = _223 * _1283;
            float _1291 = _233 * _1283;
            float _1293 = _1275 * _1287;
            float _1295 = fma(_1273, _1289, _1293);
            float _1297 = _1285 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1299 = fma(_1277, _1291, _1295);
            float _1301 = _1299 * _1297;
            float _1303 = fma(_223, _1301, _1227);
            float _1305 = fma(_227, _1301, _1225);
            float _1307 = fma(_233, _1301, _1229);
            _1255 = _1305;
            _1257 = _1303;
            _1259 = _1307;
            _1261 = _1295;
        }
    }
    float _1309 = _1255;
    float _1311 = _1257;
    float _1313 = _1259;
    float _1315 = _1261;
    float _1317 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1319 = _1309 + _1317;
    float _1321 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1323 = _1311 + _1321;
    float _1325 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1327 = _1313 + _1325;
    float _1329 = _1319 * _1319;
    float _1331 = fma(_1323, _1323, _1329);
    float _1333 = fma(_1327, _1327, _1331);
    float _1335 = rsqrt(_1333);
    float _1337 = sqrt(_1333);
    float _1339 = _1335 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1341 = _1323 * _1339;
    float _1343 = _1327 * _1339;
    float _1345 = _1341 * _1341;
    float _1347 = _1343 * _1343;
    float _1349 = _1345 + _1347;
    float _1351 = sqrt(_1349);
    bool _1353 = _1351 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1355 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1357 = _1351 + _1355;
    float _1359 = _1327;
    float _1361 = _1329;
    float _1363 = _1357;
    float _1365 = _1315;
    float _1367 = _1339;
    if (_1353)
    {
        float _1369 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1359 = _1369;
    }
    float _1371 = _1359;
    if (_1353)
    {
        float _1373 = rsqrt(_1349);
        _1361 = _1373;
    }
    float _1375 = _1361;
    float _1377 = _1375;
    if (_1353)
    {
        float _1379 = _1357 * _1371;
        _1363 = _1379;
    }
    float _1381 = _1363;
    if (_1353)
    {
        float _1383 = _1381 * 0.15915493667125701904296875;
        _1365 = _1383;
    }
    float _1385 = _1365;
    float _1387 = _1371;
    if (_1353)
    {
        float _1389 = _1385 * 6.283185482025146484375;
        float _1391 = sin(_1389);
        _1387 = _1391;
    }
    float _1393 = _1387;
    float _1395 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1397 = precise::max(0.0, _1395);
    float _1399 = _1335;
    float _1401 = _1397;
    if (_1353)
    {
        float _1403 = _1385 * 6.283185482025146484375;
        float _1405 = cos(_1403);
        _1399 = _1405;
    }
    float _1407 = _1399;
    float _1409 = -_1339;
    float _1411 = -_1397;
    float _1413 = fma(_1319, _1409, _1411);
    float _1415 = _1413;
    if (_1353)
    {
        float _1417 = _1413 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1401 = _1417;
    }
    float _1419 = _1401;
    float _1421 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1423 = _1393;
    float _1425 = _1419;
    if (_1353)
    {
        float _1427 = fma(_1393, _1419, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1367 = _1427;
    }
    float _1429 = _1367;
    float _1431 = _1429;
    if (!_1353)
    {
        _1423 = _1341;
    }
    float _1433 = _1423;
    float _1435 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1421);
    float _1437 = _1433;
    float _1439 = _1407;
    if (_1353)
    {
        float _1441 = _1407 + (-1.0);
        _1425 = _1441;
    }
    float _1443 = _1425;
    float _1445 = _1443;
    if (_1353)
    {
        float _1447 = _1375 * _1429;
        _1431 = _1447;
    }
    float _1449 = _1431;
    float _1451 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1435);
    if (_1353)
    {
        float _1453 = _1443 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1377 = _1453;
    }
    float _1455 = _1377;
    float _1457 = _1455;
    if (_1353)
    {
        float _1459 = _1341 * _1449;
        _1437 = _1459;
    }
    float _1461 = _1437;
    if (!_1353)
    {
        _1445 = _1343;
    }
    float _1463 = _1445;
    float _1465 = _1463;
    if (_1353)
    {
        float _1467 = _1343 * _1449;
        _1465 = _1467;
    }
    float _1469 = _1465;
    if (_1353)
    {
        float _1471 = fma(_1413, _1407, _1455);
        _1415 = _1471;
    }
    float _1473 = _1415;
    if (!_1353)
    {
        _1439 = _1345;
    }
    float _1475 = _1439;
    float _1477 = _1475;
    if (_1353)
    {
        float _1479 = _1461 * _1461;
        _1477 = _1479;
    }
    float _1481 = _1477;
    if (!_1353)
    {
        _1457 = _1347;
    }
    float _1483 = _1457;
    float _1485 = _1483;
    if (_1353)
    {
        float _1487 = _1469 * _1469;
        _1485 = _1487;
    }
    float _1489 = _1485;
    float _1491 = _1451 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1493 = fma(_1473, _1473, _1481);
    float _1495 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1497 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1499 = _1493 + _1489;
    float _1501 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1503 = _1491 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1505 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1495);
    float _1507 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1497);
    float _1509 = rsqrt(_1499);
    float _1511 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1513 = fma(_1337, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1511);
    float _1515 = precise::clamp(_1513, 0.0, 1.0);
    float _1517 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1507);
    float _1519 = -_1515;
    float _1521 = _1519 + 1.0;
    float _1523 = -_1503;
    float _1525 = fma(_1523, _1501, 1.0);
    float _1527 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1529 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1505);
    float _1531 = _1517 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1533 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1527);
    float _1535 = abs(_1521);
    float _1537 = log2(_1535);
    float _1539 = _1529 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1541 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1533);
    float _1543 = _1509 * _1461;
    float _1545 = _1509 * _1473;
    float _1547 = _1509 * _1469;
    float _1549 = _1541 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1551 = _1543 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1553 = _1539 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1555 = log2(_1525);
    float _1557 = -_1551;
    float _1559 = fma(_1545, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1557);
    float _1561 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1553);
    float _1563 = -_1547;
    float _1565 = fma(_1563, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1559);
    float _1567 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1561);
    float _1569 = _1537 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1571 = _1539 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1573 = fma(_1565, -0.5, 0.5);
    float _1575 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1567);
    float _1577 = fma(_1565, 0.5, 0.5);
    float _1579 = exp2(_1569);
    float _1581 = _1539 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1583 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1571);
    float _1585 = fma(_1577, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1587 = _1545 + 1.0;
    float _1589 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1581);
    float _1591 = _1555 * 0.693147182464599609375;
    float _1593 = fma(_1577, _1585, -0.212114393711090087890625);
    float _1595 = sqrt(_1573);
    float _1597 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1583);
    float _1599 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1589);
    float _1601 = fma(_1577, _1593, 1.570728778839111328125);
    float _1603 = _1591 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1605 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1597);
    float _1607 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1599);
    float _1609 = 1.0 / _1575;
    float _1611 = -_1545;
    float _1613 = fma(_1579, _1587, _1611);
    float _1615 = fma(_1613, 0.5, 0.5);
    float _1617 = _1595 * 0.636619746685028076171875;
    float _1619 = -_1601;
    float _1621 = fma(_1617, _1619, 1.0);
    float _1623 = _1605 * _1609;
    float _1625 = _1607 * _1609;
    float _1627 = fma(_1623, 0.5, 0.5);
    float _1629 = fma(_1625, -0.5, 0.5);
    float3 _5866 = float3(_1627, _1629, _1603);
    float _1631 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5866, float3(0.0), isnan(_5866)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5866, float3(0.0), isnan(_5866)), level(0.0)).x;
    float2 _5877 = float2(_1621, _1615);
    float3 _1635 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5877, float2(0.0), isnan(_5877)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5877, float2(0.0), isnan(_5877)), level(0.0)).xyz;
    float _1637 = _1635.x;
    float _1639 = _1635.y;
    float _1641 = _1635.z;
    float3 _5894 = float3(_1627, _1629, _1603);
    float4 _1644 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5894, float3(0.0), isnan(_5894)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5894, float3(0.0), isnan(_5894)), level(0.0)).xyzw;
    float _1646 = _1644.x;
    float _1648 = _1644.y;
    float _1650 = _1644.z;
    float _1652 = _1644.w;
    float _1654 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1656 = int(_1654);
    float _1658 = in.m_53.w;
    int _1660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1662 = _1660 != 0;
    float _1664 = _1539 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_72.x = _771;
    out.m_72.y = _397;
    out.m_72.z = _791;
    bool _1666 = _147 > 0.5;
    float _1668 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1670 = int(_1668);
    bool _1672 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1674 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1676 = _1672 || _1674;
    bool _1678 = isnan(0.5);
    bool _1680 = _1676 || _1678;
    out.m_74.x = _1311;
    out.m_74.y = _1309;
    out.m_74.z = _1313;
    bool _1682 = _151 > 0.5;
    int _1684 = abs(_681);
    float _1686 = float(_1656);
    float _1688 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1690 = int(_1688);
    float _1692 = float(uint(_1670));
    float _1694 = 1.0 / _1686;
    bool _1696 = _1658 > 0.5;
    int _1698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1700 = _1698 != 0;
    float _1702 = 1.0 / _1692;
    float _1704 = float(_1690);
    float _1706 = _147 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1708 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1710 = _1708 != 0;
    float _1712 = _117 * _1694;
    float _1714 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1716 = int(_1714);
    float _1718 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1720 = _1605;
    float _1722 = _1575;
    float _1724 = _1607;
    if (_1700)
    {
        _1718 = _147;
    }
    float _1726 = _1718;
    float _1728 = _1726;
    if (!_1700)
    {
        _1728 = _151;
    }
    float _1730 = _1728;
    float _1732 = 0.0;
    if (_1700)
    {
        _1732 = 1.0;
    }
    float _1734 = _1732;
    int _1736 = as_type<int>(_1702) + (-2);
    float _1738 = trunc(_1712);
    int _1740 = int(_1738);
    float _1742 = _1734;
    if (!_1700)
    {
        _1742 = 7.345489978790283203125;
    }
    float _1744 = _1742;
    float _1746 = _1744 * _147;
    float _1748 = 1.0 / _1704;
    float _1750 = float(uint(_1716));
    int _1752 = ~_1716;
    int _1754 = _1752 + 1;
    int _1756 = ~_1716;
    int _1758 = _1756 + 1;
    float _1760 = float(uint(_1740));
    float _1762 = 1.0 / _1750;
    float _1764 = as_type<float>(_1736) * _1760;
    float _1766 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1768 = ~_1670;
    int _1770 = _1768 + 1;
    float _1772 = _117 * _1748;
    float _1774 = _1748;
    if (_1700)
    {
        _1774 = 1.0;
    }
    float _1776 = _1774;
    float _1778 = -_1766;
    float _1780 = fma(_1706, 2.0, _1778);
    float _1782 = trunc(_1764);
    float _1784 = precise::max(_1782, 0.0);
    uint _1787 = uint(_1784);
    float _1789 = _1776;
    if (!_1700)
    {
        _1789 = 1.2345600128173828125;
    }
    float _1791 = _1789;
    float _1793 = -_117;
    float _1795 = fma(_1793, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1780);
    float _1797 = _1791 * _1730;
    float _1799 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1801 = trunc(_1772);
    int _1803 = int(_1801);
    float _1805 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1807 = as_type<int>(_1762) + (-2);
    float _1809 = fma(_1799, -2.0, _1805);
    int _1811 = _1770 * int(_1787);
    int _1813 = _1811 + _1740;
    float _1815 = floor(_1746);
    float _1817 = -_211;
    int _1819 = _1666 ? as_type<int>(_1817) : as_type<int>(_211);
    float _1821 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1809);
    int _1823 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1825 = _1823 != 0;
    float _1827 = float(uint(_1813));
    float _1829 = float(uint(_1803));
    float _1831 = floor(_1797);
    float _1833 = -_231;
    int _1835 = _1682 ? as_type<int>(_1833) : as_type<int>(_231);
    bool _1837 = !_1710;
    float _1839 = _1837 ? _211 : as_type<float>(_1819);
    float _1841 = as_type<float>(_1807) * _1829;
    float _1843 = as_type<float>(_1736) * _1827;
    bool _1845 = !_1825;
    float _1847 = _1845 ? _231 : as_type<float>(_1835);
    int _1849 = as_type<int>(_1827);
    if (_1700)
    {
        _1849 = 0;
    }
    int _1851 = _1849;
    float _1853 = -_1815;
    float _1855 = _1746 + _1853;
    float _1857 = trunc(_1841);
    float _1859 = precise::max(_1857, 0.0);
    uint _1861 = uint(_1859);
    int _1863 = _1851;
    if (!_1700)
    {
        _1863 = 1;
    }
    int _1865 = _1863;
    float _1867 = _1839 + 0.5;
    float _1869 = _1847 + (-0.5);
    bool _1871 = _159 > 0.5;
    bool _1873 = _1865 != 1;
    float _1875 = fma(_1867, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1795);
    float _1877 = trunc(_1843);
    float _1879 = precise::max(_1877, 0.0);
    uint _1881 = uint(_1879);
    float _1883 = -_1869;
    float _1885 = -_1821;
    float _1887 = fma(_1883, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1885);
    float _1889 = -_1831;
    float _1891 = _1797 + _1889;
    int _1893 = ~_1670;
    int _1895 = _1893 + 1;
    int _1897 = _1754 * int(_1861);
    int _1899 = _1897 + _1803;
    int _1901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1903 = _1901 != 0;
    float _1905 = float(uint(_1899));
    int _1907 = int(_1787) + int(_1881);
    float _1909 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1911 = as_type<float>(_1807) * _1905;
    float _1913 = as_type<float>(_1881);
    float _1915 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    if (!_1873)
    {
        _1913 = _151;
    }
    float _1917 = _1913;
    int _1919 = _1895 * _1907;
    int _1921 = _1919 + _1740;
    float _1923 = trunc(_1911);
    float _1925 = precise::max(_1923, 0.0);
    uint _1927 = uint(_1925);
    float _1929 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1909);
    float _1931 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1933 = float(_1670);
    bool _1935 = uint(_1921) >= uint(_1670);
    float _1937 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1929);
    float _1939 = float(_1740);
    bool _1941 = !_1935;
    int _1943 = _1941 ? 0 : (-1);
    bool _1945 = _1939 >= _1933;
    bool _1947 = isnan(_1939);
    bool _1949 = _1945 || _1947;
    bool _1951 = isnan(_1933);
    bool _1953 = _1949 || _1951;
    float _1955 = float(_1953);
    float _1957 = _1917;
    float _1959 = _1931;
    if (!_1873)
    {
        _1915 = _151;
    }
    float _1961 = _1915;
    float _1963 = _1961;
    if (_1873)
    {
        _1957 = _147;
    }
    float _1965 = _1957;
    float _1967 = trunc(_1955);
    int _1969 = int(_1967);
    int _1971 = int(_1861) + int(_1927);
    int _1973 = ~_1907;
    int _1975 = _1973 + _1943;
    int _1977 = _1975 + 1;
    float _1979 = _1855 * _1933;
    float _1981 = float(_1716);
    int _1983 = _1758 * _1971;
    int _1985 = _1983 + _1803;
    float _1987 = float(_1803);
    int _1989 = _1670 * _1977;
    int _1991 = _1989 + _1740;
    if (_1873)
    {
        _1963 = _147;
    }
    float _1993 = _1963;
    float _1995 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1931);
    if (!_1873)
    {
        _1959 = _159;
    }
    float _1997 = _1959;
    float _1999 = _197 * _1933;
    float _2001 = _1997;
    if (_1873)
    {
        _167 = _151;
    }
    float _2003 = _167;
    float _2005 = _197 * _1981;
    if (_1873)
    {
        _2001 = _151;
    }
    float _2007 = _2001;
    float _2009 = trunc(_1979);
    int _2011 = int(_2009);
    bool _2013 = _1987 >= _1981;
    bool _2015 = isnan(_1987);
    bool _2017 = _2013 || _2015;
    bool _2019 = isnan(_1981);
    bool _2021 = _2017 || _2019;
    float _2023 = float(_2021);
    float _2025 = _1891 * _1981;
    float _2027 = _2003 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2029 = _1670 == 0;
    float _2031 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1995);
    bool _2033 = uint(_1985) >= uint(_1716);
    float _2035 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2037 = trunc(_2023);
    int _2039 = int(_2037);
    int _2041 = ~_1969;
    int _2043 = _2041 + 1;
    int _2045 = _2043 + 1;
    float _2047 = -_2031;
    float _2049 = _2047 + 1.0;
    bool _2051 = !_2029;
    int _2053 = _2051 ? _1991 : (-1);
    float _2055 = fma(_1993, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2035);
    bool _2057 = !_2033;
    int _2059 = _2057 ? 0 : (-1);
    float _2061 = fma(_1847, _2049, _1887);
    int _2063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2065 = _2063 != 0;
    float _2067 = trunc(_1999);
    int _2069 = int(_2067);
    int _2071 = _1670 + (-1);
    int _2073 = _2053 * _2045;
    int _2075 = ~_1971;
    int _2077 = _2075 + _2059;
    int _2079 = _2077 + 1;
    float _2081 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2055);
    bool _2083 = !_2065;
    int _2085 = _2083 ? 0 : 1;
    int _2087 = _1969 * _2071;
    int _2089 = _2087 + _2073;
    int _2091 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2093 = _2091 != 0;
    int _2095 = _1716 * _2079;
    int _2097 = _2095 + _1803;
    int _2099 = _2089 * _1684;
    bool _2101 = !_2093;
    int _2103 = _2101 ? 0 : 1;
    float _2105 = trunc(_2005);
    int _2107 = int(_2105);
    bool _2109 = _1716 == 0;
    float _2111 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2113 = abs(_687);
    float _2115 = -_2081;
    float _2117 = _2115 + 1.0;
    int _2119 = ~_2039;
    int _2121 = _2119 + 1;
    int _2123 = _2121 + 1;
    float _2125 = fma(_2007, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2111);
    bool _2127 = !_2109;
    int _2129 = _2127 ? _2097 : (-1);
    int _2131 = _2069 * _2113;
    int _2133 = _2131 + _2099;
    int _2135 = abs(_693);
    float _2137 = _1965 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2139 = _1716 + (-1);
    int _2141 = _2129 * _2123;
    float _2143 = trunc(_2025);
    int _2145 = int(_2143);
    int _2147 = abs(_2085);
    float _2149 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2125);
    int _2151 = _2039 * _2139;
    int _2153 = _2151 + _2141;
    bool _2155 = !_1662;
    int _2157 = _2155 ? 0 : 1;
    int _2159 = _2011 * _2147;
    int _2161 = _2159 + _1740;
    float _2163 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2165 = abs(_2103);
    int _2167 = _2161 * _2135;
    int _2169 = _2167 + _2133;
    int _2171 = abs(_2157);
    float _2173 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2175 = abs(_1155);
    float _2177 = -_2163;
    float _2179 = fma(_2137, 2.0, _2177);
    int _2181 = _2011 * _2171;
    int _2183 = _2181 + _2169;
    float _2185 = fma(_2027, -2.0, _2173);
    float _2187 = float(uint(_2161));
    float _2189 = -_2149;
    float _2191 = _2189 + 1.0;
    int _2193 = _2145 * _2165;
    int _2195 = _2193 + _1803;
    int _2197 = abs(_1171);
    int _2199 = _2153 * _2175;
    int _2201 = abs(_1159);
    float _2203 = as_type<float>(_1736) * _2187;
    float _2205 = float(uint(_2183));
    float _2207 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2185);
    int _2209 = abs(_1175);
    float _2211 = _397 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2213 = _2107 * _2201;
    int _2215 = _2213 + _2199;
    float _2217 = as_type<float>(_1736) * _2205;
    float _2219 = trunc(_2203);
    float _2221 = precise::max(_2219, 0.0);
    uint _2223 = uint(_2221);
    float _2225 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2211);
    int _2227 = _2195 * _2197;
    int _2229 = _2227 + _2215;
    int _2231 = ~_1670;
    int _2233 = _2231 + 1;
    float _2235 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2225);
    int _2237 = ~_1670;
    int _2239 = _2237 + 1;
    int _2241 = _2145 * _2209;
    int _2243 = _2241 + _2229;
    float _2245 = trunc(_2217);
    float _2247 = precise::max(_2245, 0.0);
    uint _2249 = uint(_2247);
    float _2251 = _2235 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2253 = float(uint(_2195));
    int _2255 = ~_1716;
    int _2257 = _2255 + 1;
    int _2259 = _2239 * int(_2223);
    int _2261 = _2259 + _2161;
    float _2263 = as_type<float>(_1807) * _2253;
    int _2265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2267 = _2265 != 0;
    float _2269 = 1.0 / _2251;
    int _2271 = ~_1716;
    int _2273 = _2271 + 1;
    float _2275 = float(uint(_2261));
    int _2277 = _2233 * int(_2249);
    int _2279 = _2277 + _2183;
    float _2281 = -_117;
    float _2283 = fma(_2281, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2179);
    float _2285 = float(uint(_2243));
    float _2287 = trunc(_2263);
    float _2289 = precise::max(_2287, 0.0);
    uint _2291 = uint(_2289);
    float _2293 = as_type<float>(_1736) * _2275;
    float _2295 = float(uint(_2279));
    float _2297 = -_211;
    int _2299 = _1871 ? as_type<int>(_2297) : as_type<int>(_211);
    int _2301 = ~_1670;
    int _2303 = _2301 + 1;
    float _2305 = as_type<float>(_1736) * _2295;
    float _2307 = as_type<float>(_1807) * _2285;
    float _2309 = _397 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2311 = -_231;
    int _2313 = _1696 ? as_type<int>(_2311) : as_type<int>(_231);
    float _2315 = trunc(_2293);
    float _2317 = precise::max(_2315, 0.0);
    uint _2319 = uint(_2317);
    bool _2321 = !_2267;
    float _2323 = _2321 ? _211 : as_type<float>(_2299);
    float _2325 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2309);
    int _2327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2329 = _2327 != 0;
    float _2331 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2333 = _2257 * int(_2291);
    int _2335 = _2333 + _2195;
    float _2337 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2325);
    bool _2339 = !_1903;
    float _2341 = _2339 ? _231 : as_type<float>(_2313);
    float _2343 = trunc(_2307);
    float _2345 = precise::max(_2343, 0.0);
    uint _2347 = uint(_2345);
    float _2349 = _2323 + 0.5;
    float _2351 = float(uint(_2335));
    float _2353 = _2337 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2355 = _2341 + (-0.5);
    float _2357 = fma(_2349, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2283);
    int _2359 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2361 = _2359 != 0;
    float _2363 = _2353 + _2251;
    float _2365 = trunc(_2305);
    float _2367 = precise::max(_2365, 0.0);
    uint _2369 = uint(_2367);
    float _2371 = -_2355;
    float _2373 = -_2207;
    float _2375 = fma(_2371, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2373);
    float _2377 = -_1937;
    float _2379 = _2377 + 1.0;
    float _2381 = as_type<float>(_1807) * _2351;
    float _2383 = _2363 * _2269;
    float _2385 = _2383 * 0.5;
    int _2387 = ~_1716;
    int _2389 = _2387 + 1;
    float _2391 = -_2379;
    float _2393 = fma(_1839, _2391, _1875);
    float _2395 = -_2117;
    float _2397 = fma(_2323, _2395, _2357);
    int _2399 = _2273 * int(_2347);
    int _2401 = _2399 + _2243;
    float _2403 = fma(_2341, _2191, _2375);
    float _2405 = _1049 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2407 = trunc(_2381);
    float _2409 = precise::max(_2407, 0.0);
    uint _2411 = uint(_2409);
    int _2413 = ~_1670;
    int _2415 = _2413 + 1;
    float _2417 = float(uint(_2401));
    out.m_76.x = _2393;
    out.m_76.y = _2061;
    out.m_76.z = _2397;
    out.m_76.w = _2403;
    float _2419 = as_type<float>(_1807) * _2417;
    int _2421 = int(_2249) + int(_2369);
    float _2423 = as_type<float>(_2249);
    float _2425 = _2049;
    if (!_1680)
    {
        _2423 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2427 = _2423;
    float _2429 = trunc(_2419);
    float _2431 = precise::max(_2429, 0.0);
    uint _2433 = uint(_2431);
    if (!_1680)
    {
        float _2435 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2437 = fma(_2385, _2427, _2435);
        _2425 = _2437;
    }
    float _2439 = _2425;
    int _2441 = _2303 * _2421;
    int _2443 = _2441 + _2183;
    int _2445 = int(_2223) + int(_2319);
    float _2447 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2449 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2451 = -_1029;
    float _2453 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2331);
    bool _2455 = uint(_2443) >= uint(_1670);
    float _2457 = _1049 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2459 = -_1029;
    float _2461 = fma(_2459, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2447);
    float _2463 = -_1029;
    float _2465 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2449);
    bool _2467 = !_2455;
    int _2469 = _2467 ? 0 : (-1);
    float _2471 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2457);
    int _2473 = int(_2347) + int(_2433);
    float _2475 = _1049 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2477 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2479 = ~_2421;
    int _2481 = _2479 + _2469;
    int _2483 = _2481 + 1;
    float _2485 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2405);
    float _2487 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2475);
    int _2489 = _2389 * _2473;
    int _2491 = _2489 + _2243;
    float _2493 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2461);
    int _2495 = _1670 * _2483;
    int _2497 = _2495 + _2183;
    float _2499 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2453);
    float _2501 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2465);
    bool _2503 = uint(_2491) >= uint(_1716);
    float _2505 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2477);
    bool _2507 = !_2029;
    int _2509 = _2507 ? _2497 : (-1);
    float _2511 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2513 = !_2503;
    int _2515 = _2513 ? 0 : (-1);
    float _2517 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2519 = _2509 & 3;
    bool _2521 = _2519 != 0;
    float _2523 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2511);
    int _2525 = ~_2473;
    int _2527 = _2525 + _2515;
    int _2529 = _2527 + 1;
    float _2531 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2517);
    int _2533 = _2509 >> 31;
    int _2535 = _2415 * _2445;
    int _2537 = _2535 + _2161;
    int _2539 = _2521 ? 0 : 1;
    int _2541 = _1716 * _2529;
    int _2543 = _2541 + _2243;
    int _2545 = _2533 & 3;
    float _2547 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2523);
    int _2549 = int(_2291) + int(_2411);
    float _2551 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2505);
    int _2553 = _2509 + _2545;
    float _2555 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2485);
    int _2557 = _2509 & 3;
    bool _2559 = _2557 != 0;
    float _2561 = _2439;
    if (!_1680)
    {
        float _2563 = 1.0 / _2439;
        _2561 = _2563;
    }
    float _2565 = _2561;
    bool _2567 = !_2109;
    int _2569 = _2567 ? _2543 : (-1);
    bool _2571 = !_2559;
    int _2573 = _2571 ? 0 : 1;
    bool _2575 = uint(_2557) >= 2u;
    int _2577 = _2569 >> 31;
    int _2579 = _2553 >> 2;
    int _2581 = _2575 ? 0 : 1;
    int _2583 = _2577 & 3;
    bool _2585 = _2557 != 3;
    int _2587 = _2579 << 4;
    int _2589 = _2587 + 368;
    int _2591 = ~_1716;
    int _2593 = _2591 + 1;
    bool _2595 = uint(_2557) > 1u;
    int _2597 = _2569 + _2583;
    int _2599 = _2593 * _2549;
    int _2601 = _2599 + _2195;
    int _2603 = ~_2581;
    int _2605 = _2603 + 1;
    int _2607 = _2605 + 1;
    uint _2609 = uint(int(uint(_2589) >> uint(2)));
    uint _2611 = uint(int(uint(int(_2609)) >> uint(2)));
    int _2613 = int(_2609) & 3;
    float _2615 = (*spvDescriptorSet0.vp_c9)._m0[int(_2611)][_2613];
    int _2617 = int(_2609) + 1;
    uint _2619 = uint(int(uint(_2617) >> uint(2)));
    int _2621 = _2617 & 3;
    float _2623 = (*spvDescriptorSet0.vp_c9)._m0[int(_2619)][_2621];
    int _2625 = _2597 >> 2;
    int _2627 = _2607;
    if (_2585)
    {
        int _2629 = ~_2581;
        int _2631 = _2629 + 1;
        _2627 = _2631;
    }
    int _2633 = _2627;
    float _2635 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2531);
    int _2637 = _2625 << 4;
    int _2639 = _2637 + 512;
    float _2641 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2471);
    bool _2643 = uint(_2601) >= uint(_1716);
    int _2645 = _2589 + 8;
    uint _2647 = uint(int(uint(_2645) >> uint(2)));
    uint _2649 = uint(int(uint(int(_2647)) >> uint(2)));
    int _2651 = int(_2647) & 3;
    float _2653 = (*spvDescriptorSet0.vp_c9)._m0[int(_2649)][_2651];
    int _2655 = int(_2647) + 1;
    uint _2657 = uint(int(uint(_2655) >> uint(2)));
    int _2659 = _2655 & 3;
    float _2661 = (*spvDescriptorSet0.vp_c9)._m0[int(_2657)][_2659];
    int _2663 = ~_2539;
    int _2665 = _2663 + 1;
    int _2667 = _2665 + 1;
    int _2669 = _2667;
    if (!_2595)
    {
        int _2671 = ~_2539;
        int _2673 = _2671 + 1;
        _2669 = _2673;
    }
    int _2675 = _2669;
    bool _2677 = uint(_2537) >= uint(_1670);
    bool _2679 = !_2643;
    int _2681 = _2679 ? 0 : (-1);
    uint _2683 = uint(int(uint(_2639) >> uint(2)));
    uint _2685 = uint(int(uint(int(_2683)) >> uint(2)));
    int _2687 = int(_2683) & 3;
    float _2689 = (*spvDescriptorSet0.vp_c9)._m0[int(_2685)][_2687];
    int _2691 = int(_2683) + 1;
    uint _2693 = uint(int(uint(_2691) >> uint(2)));
    int _2695 = _2691 & 3;
    float _2697 = (*spvDescriptorSet0.vp_c9)._m0[int(_2693)][_2695];
    bool _2699 = !_2677;
    int _2701 = _2699 ? 0 : (-1);
    int _2703 = _2569 & 3;
    bool _2705 = _2703 != 0;
    int _2707 = ~_2445;
    int _2709 = _2707 + _2701;
    int _2711 = _2709 + 1;
    float _2713 = _231 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2715 = !_2705;
    int _2717 = _2715 ? 0 : 1;
    int _2719 = _2639 + 8;
    uint _2721 = uint(int(uint(_2719) >> uint(2)));
    uint _2723 = uint(int(uint(int(_2721)) >> uint(2)));
    int _2725 = int(_2721) & 3;
    float _2727 = (*spvDescriptorSet0.vp_c9)._m0[int(_2723)][_2725];
    int _2729 = int(_2721) + 1;
    uint _2731 = uint(int(uint(_2729) >> uint(2)));
    int _2733 = _2729 & 3;
    float _2735 = (*spvDescriptorSet0.vp_c9)._m0[int(_2731)][_2733];
    int _2737 = _2569 & 3;
    bool _2739 = _2737 != 0;
    float _2741 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2487);
    bool _2743 = _2703 != 3;
    float _2745 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2747 = _2739 ? 0 : 1;
    float _2749 = _2713 * _2493;
    bool _2751 = uint(_2703) >= 2u;
    int _2753 = _1670 * _2711;
    int _2755 = _2753 + _2161;
    int _2757 = ~_2549;
    int _2759 = _2757 + _2681;
    int _2761 = _2759 + 1;
    float _2763 = _2713 * _2499;
    int _2765 = _2751 ? 0 : 1;
    float _2767 = fma(_2745, _2641, _2749);
    bool _2769 = uint(_2703) > 1u;
    out.m_78.x = _2641;
    out.m_78.y = _2555;
    out.m_78.z = _2741;
    int _2771 = abs(_2675);
    int _2773 = _1716 * _2761;
    int _2775 = _2773 + _2195;
    int _2777 = ~_2747;
    int _2779 = _2777 + 1;
    int _2781 = _2779 + 1;
    float _2783 = fma(_2745, _2555, _2763);
    int _2785 = ~_2765;
    int _2787 = _2785 + 1;
    int _2789 = _2787 + 1;
    int _2791 = _2789;
    int _2793 = _2781;
    float _2795 = _2767;
    if (_2743)
    {
        int _2797 = ~_2765;
        int _2799 = _2797 + 1;
        _2791 = _2799;
    }
    int _2801 = _2791;
    int _2803 = abs(_2717);
    int _2805 = abs(_2633);
    if (!_2769)
    {
        int _2807 = ~_2747;
        int _2809 = _2807 + 1;
        _2793 = _2809;
    }
    int _2811 = _2793;
    int _2813 = ~_2771;
    int _2815 = _2813 + 1;
    int _2817 = _2815 + 1;
    int _2819 = abs(_2811);
    int _2821 = abs(_2573);
    int _2823 = _2817 * as_type<int>(_2623);
    int _2825 = abs(_2801);
    int _2827 = ~_2819;
    int _2829 = _2827 + 1;
    int _2831 = _2829 + 1;
    int _2833 = ~_2821;
    int _2835 = _2833 + 1;
    int _2837 = _2835 + 1;
    int _2839 = _2831 * as_type<int>(_2697);
    int _2841 = ~_2803;
    int _2843 = _2841 + 1;
    int _2845 = _2843 + 1;
    int _2847 = _2837 * as_type<int>(_2615);
    int _2849 = _2847 + _2823;
    float _2851 = fma(_2713, _2713, 1.0);
    int _2853 = ~_2805;
    int _2855 = _2853 + 1;
    int _2857 = _2855 + 1;
    int _2859 = _2845 * as_type<int>(_2689);
    int _2861 = _2859 + _2839;
    bool _2863 = _2557 != 3;
    int _2865 = ~_2825;
    int _2867 = _2865 + 1;
    int _2869 = _2867 + 1;
    int _2871 = _2857 * as_type<int>(_2653);
    int _2873 = _2871 + _2849;
    bool _2875 = _2703 != 3;
    float _2877 = rsqrt(_2851);
    bool _2879 = !_2863;
    int _2881 = _2879 ? 0 : (-1);
    int _2883 = _2869 * as_type<int>(_2727);
    int _2885 = _2883 + _2861;
    bool _2887 = !_2875;
    int _2889 = _2887 ? 0 : (-1);
    float _2891 = _1605 + _1575;
    int _2893 = abs(_2881);
    bool _2895 = !_2361;
    int _2897 = _2895 ? 0 : 1;
    float _2899 = _2891 * 0.5;
    int _2901 = abs(_2889);
    bool _2903 = !_2329;
    int _2905 = _2903 ? 0 : 1;
    int _2907 = abs(_2897);
    float _2909 = _2713 * _2501;
    int _2911 = abs(_2905);
    int _2913 = ~_2893;
    int _2915 = _2913 + 1;
    int _2917 = _2915 + 1;
    float _2919 = fma(_2745, _2741, _2909);
    int _2921 = ~_2901;
    int _2923 = _2921 + 1;
    int _2925 = _2923 + 1;
    int _2927 = ~_2911;
    int _2929 = _2927 + 1;
    int _2931 = _2929 + 1;
    int _2933 = _2917 * as_type<int>(_2661);
    int _2935 = _2933 + _2873;
    int _2937 = ~_2907;
    int _2939 = _2937 + 1;
    int _2941 = _2939 + 1;
    int _2943 = _2925 * as_type<int>(_2735);
    int _2945 = _2943 + _2885;
    bool _2947 = !_2029;
    int _2949 = _2947 ? _2755 : (-1);
    int _2951 = _2935 * _2931;
    float _2953 = _2713 * _2877;
    int _2955 = _2945 * _2941;
    float _2957 = _1537 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2959 = _2949 * _2911;
    int _2961 = _2959 + _2951;
    bool _2963 = !_2109;
    int _2965 = _2963 ? _2775 : (-1);
    float _2967 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1664);
    float _2969 = exp2(_2957);
    float _2971 = -_2551;
    float _2973 = _2953 * _2971;
    float _2975 = -_2635;
    float _2977 = _2953 * _2975;
    float _2979 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2967);
    int _2981 = _2965 * _2907;
    int _2983 = _2981 + _2955;
    float _2985 = -_2547;
    float _2987 = _2953 * _2985;
    float _2989 = fma(_2877, _2499, _2973);
    float _2991 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2979);
    float _2993 = fma(_2877, _2501, _2977);
    float _2995 = _1575 * 0.5;
    float _2997 = fma(_2877, _2493, _2987);
    float _2999 = _2991 + _1575;
    out.gl_Position.x = _1605;
    out.gl_Position.y = _1607;
    out.gl_Position.z = _2991;
    out.gl_Position.w = _1575;
    float _3001 = fma(_1607, -0.5, _2995);
    float _3003 = float(_2961);
    float _3005 = _2999 * 0.5;
    float _3007 = -_2969;
    float _3009 = _3007 + 1.0;
    float _3011 = float(_2983);
    float _3013 = _2547 + _2767;
    float _3015 = _3009 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3017 = _2551 + _2783;
    float _3019 = _2635 + _2919;
    out.m_80.x = _3003;
    out.m_80.y = _3011;
    float _3021 = _3015 * _1631;
    float _3023 = _1631;
    float _3025 = _2989;
    float _3027 = _2997;
    if (!_1680)
    {
        _3023 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _3029 = _3023;
    float _3031 = -_3015;
    float _3033 = _3031 + 1.0;
    out.m_82.x = _2899;
    out.m_82.y = _3001;
    out.m_82.z = _3005;
    out.m_82.w = _1575;
    float _3035 = _1641 * _3021;
    float _3037 = _1652 * _3021;
    float _3039 = _3033;
    if (!_1680)
    {
        float _3041 = -_3029;
        float _3043 = _3041 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1720 = _3043;
    }
    float _3045 = _1720;
    out.m_84.x = _3013;
    out.m_84.y = _3017;
    out.m_84.z = _3019;
    bool _3047 = _1337 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3049 = isnan(_1337);
    bool _3051 = _3047 || _3049;
    bool _3053 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3055 = _3051 || _3053;
    float _3057 = fma(_1637, _3037, _1646);
    float _3059 = fma(_1639, _3037, _1648);
    float _3061 = _1652 * _3033;
    float _3063 = fma(_1652, _3035, _1650);
    float _3065 = _3045;
    if (!_1680)
    {
        float _3067 = 1.0 / _3045;
        _3065 = _3067;
    }
    float _3069 = _3065;
    if (!_1680)
    {
        float _3071 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3073 = -_3029;
        float _3075 = fma(_2565, _3071, _3073);
        _2795 = _3075;
    }
    float _3077 = _2795;
    out.m_86.x = _2997;
    out.m_86.y = _2989;
    out.m_86.z = _2993;
    out.m_88.x = _3057;
    out.m_88.y = _3059;
    out.m_88.z = _3063;
    out.m_88.w = _3061;
    float _3079 = _3077;
    if (!_3055)
    {
        _1722 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3081 = _1722;
    float _3083 = _3081;
    float _3085 = _3081;
    if (!_3055)
    {
        _3039 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3087 = _3039;
    float _3089 = _3087;
    float _3091 = _3087;
    if (!_3055)
    {
        _1724 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3093 = _1724;
    float _3095 = _3093;
    float _3097 = _3093;
    if (_1680)
    {
        _3025 = 1.0;
    }
    float _3099 = _3025;
    float _3101 = _3099;
    float _3103 = _3069;
    if (!_1680)
    {
        float _3105 = _3077 * _3069;
        float _3107 = precise::clamp(_3105, 0.0, 1.0);
        _3101 = _3107;
    }
    float _3109 = _3101;
    if (!_3055)
    {
        _3027 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3111 = _3027;
    float _3113 = _3111;
    float _3115 = _3111;
    if (!_3055)
    {
        _3103 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3117 = _3103;
    float _3119 = _3109 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3121 = _3117;
    float _3123 = _3117;
    if (!_3055)
    {
        _3079 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3125 = _3079;
    bool _3127 = !_3055;
    float _3129 = _3125;
    float _3131 = _3125;
    if (!_3127)
    {
        bool _3133 = _1337 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3135 = isnan(_1337);
        bool _3137 = _3133 || _3135;
        bool _3139 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3141 = _3137 || _3139;
        if (!_3141)
        {
            float _3143 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3145 = _1337 + _3143;
            float _3147 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3149 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3147;
            float _3151 = 1.0 / _3149;
            float _3153 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3155 = _3153 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3157 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3159 = _3157 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3161 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3163 = _3161 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3165 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3167 = _3165 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3169 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3171 = _3169 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3173 = _3145 * _3151;
            float _3175 = precise::clamp(_3173, 0.0, 1.0);
            float _3177 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3179 = _3177 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3181 = fma(_3175, _3155, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3183 = fma(_3175, _3179, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3185 = fma(_3175, _3159, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3187 = fma(_3175, _3163, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3189 = fma(_3175, _3167, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3191 = fma(_3175, _3171, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3085 = _3183;
            _3123 = _3189;
            _3115 = _3181;
            _3097 = _3187;
            _3091 = _3185;
            _3131 = _3191;
            _3193 = true;
        }
        else
        {
            bool _3195 = _1337 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3197 = isnan(_1337);
            bool _3199 = _3195 || _3197;
            bool _3201 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3203 = _3199 || _3201;
            if (!_3203)
            {
                _3113 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3205 = _3113;
            _3115 = _3205;
            if (!_3203)
            {
                _3083 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3207 = _3083;
            _3085 = _3207;
            if (!_3203)
            {
                _3089 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3209 = _3089;
            _3091 = _3209;
            if (!_3203)
            {
                _3095 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3211 = _3095;
            _3097 = _3211;
            if (!_3203)
            {
                _3121 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3213 = _3121;
            _3123 = _3213;
            if (!_3203)
            {
                _3129 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3215 = _3129;
            bool _3217 = !_3203;
            _3131 = _3215;
            if (!_3217)
            {
                bool _3219 = _1337 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3221 = isnan(_1337);
                bool _3223 = _3219 || _3221;
                bool _3225 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3227 = _3223 || _3225;
                if (!_3227)
                {
                    float _3229 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3231 = _1337 + _3229;
                    float _3233 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3235 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3233;
                    float _3237 = 1.0 / _3235;
                    float _3239 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3241 = _3239 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3243 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3245 = _3243 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3247 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3249 = _3247 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3251 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3253 = _3251 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3255 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3257 = _3255 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3259 = _3231 * _3237;
                    float _3261 = precise::clamp(_3259, 0.0, 1.0);
                    float _3263 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3265 = _3263 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3267 = fma(_3261, _3241, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3269 = fma(_3261, _3265, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3271 = fma(_3261, _3245, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3273 = fma(_3261, _3249, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3275 = fma(_3261, _3253, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3277 = fma(_3261, _3257, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3085 = _3269;
                    _3123 = _3275;
                    _3115 = _3267;
                    _3097 = _3273;
                    _3091 = _3271;
                    _3131 = _3277;
                    _3193 = true;
                }
                else
                {
                    _3085 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3123 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3115 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3097 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3091 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3131 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3193 = false;
    float _3279 = _3085;
    float _3281 = _3123;
    float _3283 = _3115;
    float _3285 = _3097;
    float _3287 = _3091;
    float _3289 = _3131;
    float _3291 = _3119 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3293 = fma(_3017, -0.5, 0.5);
    float _3295 = precise::clamp(_3293, 0.0, 1.0);
    float _3297 = -_3279;
    float _3299 = _3297 + _3281;
    float _3301 = -_3283;
    float _3303 = _3301 + _3285;
    out.m_51.x = _3291;
    float _3305 = fma(_3295, _3299, _3279);
    float _3307 = -_3287;
    float _3309 = _3307 + _3289;
    float _3311 = fma(_3295, _3303, _3283);
    float _3313 = _3305 * 0.586610972881317138671875;
    bool _3315 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3317 = fma(_3295, _3309, _3287);
    out.m_90.x = 0.0;
    float _3319 = fma(_3311, 0.298911988735198974609375, _3313);
    bool _3321 = _3109 > 0.0;
    bool _3323 = isnan(_3109);
    bool _3325 = _3321 || _3323;
    bool _3327 = isnan(0.0);
    bool _3329 = _3325 || _3327;
    float _3331 = fma(_3317, 0.114477999508380889892578125, _3319);
    float _3333 = -_3331;
    float _3335 = _3311 + _3333;
    float _3337 = -_3331;
    float _3339 = _3305 + _3337;
    float _3341 = -_3331;
    float _3343 = _3317 + _3341;
    float _3345 = fma(_3335, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3331);
    float _3347 = fma(_3339, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3331);
    float _3349 = fma(_3343, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3331);
    bool _3351 = !_3315;
    if (!_3351)
    {
        float _3353 = -_1309;
        float _3355 = _3353 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3357 = -_1311;
        float _3359 = _3357 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3361 = -_1313;
        float _3363 = _3361 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3365 = _3355 * _3355;
        float _3367 = fma(_3359, _3359, _3365);
        float _3369 = fma(_3363, _3363, _3367);
        float _3371 = sqrt(_3369);
        float _3373 = rsqrt(_3369);
        float _3375 = -_3371;
        float _3377 = _3375 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3379 = _3377 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3381 = precise::clamp(_3379, 0.0, 1.0);
        float _3383 = _3359 * _3373;
        float _3385 = _3355 * _3373;
        float _3387 = abs(_3381);
        float _3389 = log2(_3387);
        float _3391 = _3363 * _3373;
        float _3393 = _3383 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3395 = _3017 * _3385;
        float _3397 = -_3385;
        float _3399 = -_3393;
        float _3401 = fma(_3397, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3399);
        float _3403 = fma(_3013, _3383, _3395);
        float _3405 = -_3391;
        float _3407 = fma(_3405, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3401);
        float _3409 = fma(_3019, _3391, _3403);
        float _3411 = precise::clamp(_3409, 0.0, 1.0);
        float _3413 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3415 = _3407 + _3413;
        float _3417 = _3389 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3419 = _3415 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3421 = precise::clamp(_3419, 0.0, 1.0);
        float _3423 = exp2(_3417);
        float _3425 = _3423 * _3421;
        float _3427 = _3411 * _3425;
        float _3429 = _3427 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3431 = _3427 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3433 = _3427 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _3429;
        out.m_90.y = _3431;
        out.m_90.z = _3433;
    }
    out.m_92.x = _3345;
    out.m_92.y = _3347;
    out.m_92.z = _3349;
    if (_3329)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _3435 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3435;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

