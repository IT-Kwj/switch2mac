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
    float4 m_66 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_74 [[user(locn2)]];
    float4 m_88 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_72 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_78 [[user(locn10)]];
    float4 m_86 [[user(locn11)]];
    float4 m_76 [[user(locn12)]];
    float4 m_90 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_62 [[attribute(3)]];
    float4 m_70 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_64 [[attribute(7)]];
    float4 m_56 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4046 = false;
    bool _969 = false;
    bool _755 = false;
    bool _619 = false;
    bool _515 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_44.w;
    float _106 = in.m_46.w;
    float _108 = trunc(_104);
    int _111 = int(_108);
    float _113 = -_106;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _115;
    bool _119 = _111 >= 1;
    float _121 = 0.0;
    float _123 = as_type<float>(_111);
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _121;
    if (!_119)
    {
        out.m_51.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _125 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4933 = as_type<float>(_131);
        out.gl_Position.z = _4933;
    }
    if (!_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _135 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_106);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = float(_111);
    bool _147 = _115 >= _145;
    bool _149 = !_143;
    bool _151 = _147 || _149;
    if (_151)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _123;
    if (_151)
    {
        out.m_51.x = 0.0;
    }
    if (_151)
    {
        float _155 = _153 * 5.0;
        _133 = as_type<int>(_155);
    }
    int _157 = _133;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4988 = as_type<float>(_157);
        out.gl_Position.z = _4988;
    }
    if (_151)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _163 = in.m_56.w;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = in.m_46.x;
    float _177 = in.m_46.y;
    float _179 = in.m_46.z;
    int _181 = int(_151);
    int _183 = false ? 2 : 0;
    int _185 = _181 | _183;
    int _187 = _173 ? 4 : 0;
    int _189 = _185 | _187;
    int _191 = false ? 8 : 0;
    int _193 = _189 | _191;
    int _195 = false ? 16 : 0;
    int _197 = _193 | _195;
    int _199 = false ? 32 : 0;
    int _201 = _197 | _199;
    int _203 = false ? 64 : 0;
    int _205 = _201 | _203;
    int _207 = _205 & 4;
    float _209 = in.m_44.x;
    float _211 = in.m_44.y;
    float _213 = in.m_44.z;
    float _215 = in.m_58.x;
    float _217 = in.m_58.y;
    float _219 = in.m_58.z;
    float _221 = as_type<float>(_207);
    float _223 = _161;
    if (!_173)
    {
        float _225 = _161 * _161;
        float _227 = _225 * 0.5;
        _221 = _227;
    }
    float _229 = _221;
    float _231 = in.m_60.x;
    float _233 = in.m_60.y;
    float _235 = in.m_60.z;
    float _237 = _229;
    if (!_173)
    {
        float _239 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _237 = _239;
    }
    float _241 = _237;
    float _243 = in.m_62.x;
    float _245 = in.m_62.y;
    float _247 = in.m_62.z;
    int _249 = as_type<int>(_159) & 1;
    bool _251 = _249 != 0;
    int _253 = as_type<int>(_159) & 2;
    bool _255 = _253 != 0;
    bool _257 = !_251;
    float _259 = _257 ? (-0.5) : 0.5;
    bool _261 = !_255;
    float _263 = _261 ? (-0.5) : 0.5;
    bool _265 = !_173;
    float _267 = _241;
    float _269 = 0.0;
    float _271 = 0.0;
    float _273 = _217;
    float _275 = _243;
    float _277 = _219;
    if (!_265)
    {
        float _279 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _281 = log2(_279);
        float _283 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _285 = _283 + 1.0;
        float _287 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _289 = _161 * _281;
        float _291 = 1.0 / _285;
        float _293 = _287 * 0.693147182464599609375;
        float _295 = exp2(_289);
        float _297 = 1.0 / _293;
        float _299 = _295 + (-1.0);
        float _301 = -_299;
        float _303 = fma(_301, _297, _161);
        float _305 = _303 * _291;
        float _307 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _267 = _307;
        _269 = _291;
        _271 = _297;
    }
    float _309 = _267;
    float _311 = _269;
    float _313 = _271;
    bool _315 = !_173;
    float _317 = _313;
    float _319 = _311;
    float _321 = _309;
    if (!_315)
    {
        float _323 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _325 = log2(_323);
        float _327 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _329 = _327 + 1.0;
        float _331 = 1.0 / _329;
        float _333 = _161 * _325;
        float _335 = exp2(_333);
        float _337 = -_335;
        float _339 = _337 + 1.0;
        float _341 = _339 * _331;
        _223 = _341;
        _317 = _329;
    }
    float _343 = _223;
    float _345 = _317;
    float _347 = _345;
    if (!_173)
    {
        float _349 = _115 * _115;
        float _351 = _349 * 0.5;
        _319 = _351;
    }
    float _353 = _319;
    float _355 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _357 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _359 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_173)
    {
        _347 = _115;
    }
    float _361 = _347;
    float _363 = fma(_343, _175, _355);
    float _365 = fma(_343, _177, _357);
    float _367 = _361;
    if (!_173)
    {
        float _369 = _353 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _321 = _369;
    }
    float _371 = _321;
    bool _373 = !_173;
    float _375 = _371;
    if (!_373)
    {
        float _377 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _379 = log2(_377);
        float _381 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _383 = _381 + 1.0;
        float _385 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _387 = _115 * _379;
        float _389 = 1.0 / _383;
        float _391 = _385 * 0.693147182464599609375;
        float _393 = exp2(_387);
        float _395 = 1.0 / _391;
        float _397 = _393 + (-1.0);
        float _399 = -_397;
        float _401 = fma(_399, _395, _115);
        float _403 = _401 * _389;
        float _405 = _403 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _375 = _405;
    }
    float _407 = _375;
    bool _409 = !_173;
    if (!_409)
    {
        float _411 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _413 = log2(_411);
        float _415 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _417 = _415 + 1.0;
        float _419 = 1.0 / _417;
        float _421 = _115 * _413;
        float _423 = exp2(_421);
        float _425 = -_423;
        float _427 = _425 + 1.0;
        float _429 = _427 * _419;
        _367 = _429;
    }
    float _431 = _367;
    float _433 = _407 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _435 = _407 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _437 = _407 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _439 = fma(_343, _179, _359);
    float _441 = fma(_431, _175, _433);
    float _443 = fma(_431, _177, _435);
    float _445 = 1.0 / _145;
    bool _447 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _449 = fma(_365, _163, _211);
    float _451 = -_443;
    float _453 = _365 + _451;
    float _455 = fma(_431, _179, _437);
    float _457 = fma(_363, _163, _209);
    float _459 = -_441;
    float _461 = _363 + _459;
    float _463 = _453 * _217;
    float _465 = _453 * _233;
    float _467 = _453 * _245;
    float _469 = -_455;
    float _471 = _439 + _469;
    float _473 = fma(_461, _215, _463);
    float _475 = fma(_461, _231, _465);
    float _477 = fma(_461, _243, _467);
    float _479 = fma(_439, _163, _213);
    float _481 = fma(_471, _219, _473);
    float _483 = fma(_471, _235, _475);
    float _485 = fma(_471, _247, _477);
    float _487 = _115 * _445;
    bool _489 = !_447;
    float _491 = _483;
    float _493 = _481;
    float _495 = _485;
    float _513;
    if (!_489)
    {
        float _497 = in.m_64.x;
        float _499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _501 = _497 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _503 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _505 = _503 * _499;
        float _507 = floor(_505);
        float _509 = -_507;
        float _511 = _505 + _509;
        _513 = _511;
        _515 = true;
    }
    else
    {
        _513 = _487;
    }
    _515 = false;
    float _517 = _513;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _521 = _517 + _519;
    float _523 = in.m_56.x;
    float _525 = in.m_56.y;
    bool _527 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _529 = isnan(_517);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _539;
    bool _543 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _545 = isnan(_517);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = -_537;
    float _557 = _555 + 1.0;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _559;
    float _563 = 1.0 / _541;
    bool _565 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _567 = _553 * _557;
    float _569 = -_553;
    float _571 = _569 + 1.0;
    float _573 = _521 * _563;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _575;
    float _579 = fma(_561, _573, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _581 = fma(_577, _573, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _583 = _579 * _567;
    float _585 = _581 * _567;
    float _587 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[143].x, _583);
    float _589 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[143].y, _585);
    float _591 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[144].x, _587);
    float _593 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[144].y, _589);
    float _595 = _591 * _523;
    float _597 = _593 * _525;
    bool _599 = !_565;
    float _617;
    if (!_599)
    {
        float _601 = in.m_64.x;
        float _603 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _605 = _601 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _607 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[11].y, _115);
        float _609 = _607 * _603;
        float _611 = floor(_609);
        float _613 = -_611;
        float _615 = _609 + _613;
        _617 = _615;
        _619 = true;
    }
    else
    {
        _617 = _487;
    }
    _619 = false;
    float _621 = _617;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _625 = _621 + _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _631 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _633 = isnan(_621);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _645 = _643 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _647 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _649 = isnan(_621);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _659;
    bool _663 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _665 = isnan(_621);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = 1.0 / _629;
    float _677 = -_641;
    float _679 = _677 + 1.0;
    bool _681 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _683 = _657 * _679;
    float _685 = -_657;
    float _687 = _685 + 1.0;
    float _689 = 1.0 / _645;
    float _691 = _661 * _675;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _697 = fma(_691, _625, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _699 = -_673;
    float _701 = _699 + 1.0;
    float _703 = _697 * _683;
    float _705 = _695 * _689;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _709 = _621 + _707;
    float _711 = _641 * _701;
    float _713 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[115].x, _703);
    float _715 = fma(_705, _709, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _717 = fma(_715, _711, _713);
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _725 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[117].x, _717);
    float _727 = _719 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _729 = _721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _731 = _723 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _733 = _725 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _727;
    out.m_66.y = _729;
    out.m_66.z = _731;
    out.m_66.w = _733;
    bool _735 = !_681;
    float _753;
    if (!_735)
    {
        float _737 = in.m_64.x;
        float _739 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _741 = _737 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _743 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[11].w, _115);
        float _745 = _743 * _739;
        float _747 = floor(_745);
        float _749 = -_747;
        float _751 = _745 + _749;
        _753 = _751;
        _755 = true;
    }
    else
    {
        _753 = _487;
    }
    _755 = false;
    float _757 = _753;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _761 = _757 + _759;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _771;
    bool _775 = _757 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _777 = isnan(_757);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = 1.0 / _765;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _797 = _757 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _799 = isnan(_757);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    bool _809 = _757 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _811 = isnan(_757);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _817 = _813 || _815;
    float _819 = float(_817);
    float _821 = 1.0 / _769;
    bool _823 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _825 = _773 * _787;
    bool _827 = _757 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _829 = isnan(_757);
    bool _831 = _827 || _829;
    bool _833 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _835 = _831 || _833;
    float _837 = float(_835);
    float _839 = 1.0 / _791;
    float _841 = -_785;
    float _843 = _841 + 1.0;
    float _845 = fma(_825, _761, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _847 = -_837;
    float _849 = _847 + 1.0;
    float _851 = _837 * _843;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _855 = _853 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _857;
    float _861 = 1.0 / _795;
    float _863 = -_807;
    float _865 = _863 + 1.0;
    float _867 = _819 * _849;
    float _869 = _855 * _821;
    float _871 = -_819;
    float _873 = _871 + 1.0;
    float _875 = _785 * _865;
    float _877 = _845 * _867;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _881 = _757 + _879;
    float _883 = _859 * _839;
    bool _885 = _757 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _887 = isnan(_757);
    bool _889 = _885 || _887;
    bool _891 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _893 = _889 || _891;
    float _895 = float(_893);
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _899 = _897 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _903 = _757 + _901;
    float _905 = fma(_869, _881, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _907 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[131].x, _877);
    float _909 = -_895;
    float _911 = _909 + 1.0;
    float _913 = fma(_883, _903, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _915 = _899 * _861;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _919 = _757 + _917;
    float _921 = fma(_905, _851, _907);
    float _923 = _807 * _911;
    float _925 = fma(_915, _919, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _927 = fma(_913, _875, _921);
    float _929 = fma(_925, _923, _927);
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _937 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[135].x, _929);
    float _939 = _931 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _941 = _933 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _943 = _935 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _945 = _937 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_68.x = _939;
    out.m_68.y = _941;
    out.m_68.z = _943;
    out.m_68.w = _945;
    bool _947 = !_823;
    float _949 = _807;
    float _967;
    if (!_947)
    {
        float _951 = in.m_64.x;
        float _953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _955 = _951 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _957 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[14].x, _115);
        float _959 = _957 * _953;
        float _961 = floor(_959);
        float _963 = -_961;
        float _965 = _959 + _963;
        _967 = _965;
        _969 = true;
    }
    else
    {
        _967 = _487;
    }
    _969 = false;
    float _971 = _967;
    float _973 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _975 = int(_973);
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _979 = _977 != 0;
    float _981 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _983 = int(_981);
    float _985 = 0.0;
    int _987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_979)
    {
        _985 = 1.0;
    }
    float _989 = _985;
    float _991 = float(_975);
    float _993 = 0.0;
    float _995 = _989;
    if (_979)
    {
        _993 = 1.0;
    }
    float _997 = _993;
    float _999 = 0.0;
    float _1001 = _997;
    if (_979)
    {
        _999 = 1.0;
    }
    float _1003 = _999;
    int _1005 = 0;
    float _1007 = _1003;
    if (_979)
    {
        _1005 = 0;
    }
    int _1009 = _1005;
    float _1011 = 1.0 / _991;
    float _1013 = _875;
    int _1015 = _1009;
    if (_979)
    {
        float _1017 = in.m_64.x;
        _1013 = _1017;
    }
    float _1019 = _1013;
    float _1021 = float(uint(_983));
    if (_979)
    {
        _987 = 0;
    }
    int _1023 = _987;
    float _1025 = 1.0 / _1021;
    float _1027 = _115 * _1011;
    int _1029 = ~_983;
    int _1031 = _1029 + 1;
    float _1033 = trunc(_1027);
    int _1035 = int(_1033);
    int _1037 = as_type<int>(_1025) + (-2);
    float _1039 = _1019;
    int _1041 = _1023;
    if (_979)
    {
        _949 = _1019;
    }
    float _1043 = _949;
    float _1045 = float(uint(_1035));
    float _1047 = as_type<float>(_1037) * _1045;
    float _1049 = trunc(_1047);
    float _1051 = precise::max(_1049, 0.0);
    uint _1054 = uint(_1051);
    int _1056 = ~_983;
    int _1058 = _1056 + 1;
    int _1060 = _1031 * int(_1054);
    int _1062 = _1060 + _1035;
    float _1064 = float(uint(_1062));
    float _1066 = as_type<float>(_1037) * _1064;
    float _1068 = in.m_64.x;
    float _1070 = in.m_64.y;
    float _1072 = in.m_64.z;
    float _1074 = in.m_64.w;
    float _1076 = trunc(_1066);
    float _1078 = precise::max(_1076, 0.0);
    uint _1080 = uint(_1078);
    int _1082 = int(_1054) + int(_1080);
    float _1084 = _1043;
    if (!_979)
    {
        float _1086 = in.m_64.y;
        float _1088 = in.m_64.z;
        _995 = 7.345489978790283203125;
        _1084 = _1088;
        _1007 = 5.839270114898681640625;
        _1015 = 1;
        _1039 = _1086;
        _1001 = 1.2345600128173828125;
        _1041 = 2;
    }
    float _1090 = _995;
    float _1092 = _1084;
    float _1094 = _1007;
    int _1096 = _1015;
    float _1098 = _1039;
    float _1100 = _1001;
    int _1102 = _1041;
    float _1104 = float(_983);
    float _1106 = _1068 * _1090;
    float _1108 = float(_1035);
    int _1110 = _1058 * _1082;
    int _1112 = _1110 + _1035;
    float _1114 = floor(_1106);
    bool _1116 = _1108 >= _1104;
    bool _1118 = isnan(_1108);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan(_1104);
    bool _1124 = _1120 || _1122;
    float _1126 = float(_1124);
    float _1128 = _1092 * _1094;
    bool _1130 = uint(_1112) >= uint(_983);
    bool _1132 = _1096 != 1;
    bool _1134 = _1070 > 0.5;
    float _1136 = _1072 * 2.0;
    bool _1138 = _1072 > 0.5;
    float _1140 = trunc(_1126);
    int _1142 = int(_1140);
    int _1144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1146 = _1144 != 0;
    float _1148 = _597 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1150 = !_1130;
    int _1152 = _1150 ? 0 : (-1);
    float _1154 = _595 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1158 = _1156 != 0;
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1162 = _1160 != 0;
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1166 = _1164 != 0;
    float _1168 = _1068 + _1070;
    float _1170 = -_259;
    int _1172 = _1134 ? as_type<int>(_1170) : as_type<int>(_259);
    float _1174 = -_1114;
    float _1176 = _1106 + _1174;
    float _1178 = -_263;
    int _1180 = _1138 ? as_type<int>(_1178) : as_type<int>(_263);
    float _1182 = floor(_1136);
    int _1184 = ~_1082;
    int _1186 = _1184 + _1152;
    int _1188 = _1186 + 1;
    float _1190 = _1176 * _1104;
    float _1192 = _487 * _1104;
    bool _1194 = !_1162;
    float _1196 = _1194 ? _259 : as_type<float>(_1172);
    float _1198 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1200 = int(_1146);
    int _1202 = _1130 ? 2 : 0;
    int _1204 = _1200 | _1202;
    int _1206 = _1138 ? 4 : 0;
    int _1208 = _1204 | _1206;
    int _1210 = _1158 ? 8 : 0;
    int _1212 = _1208 | _1210;
    int _1214 = _1162 ? 16 : 0;
    int _1216 = _1212 | _1214;
    int _1218 = _1166 ? 32 : 0;
    int _1220 = _1216 | _1218;
    int _1222 = _1134 ? 64 : 0;
    int _1224 = _1220 | _1222;
    int _1226 = _1224 & 64;
    float _1228 = trunc(_1190);
    int _1230 = int(_1228);
    bool _1232 = !_1166;
    float _1234 = _1232 ? _263 : as_type<float>(_1180);
    int _1236 = _983 * _1188;
    int _1238 = _1236 + _1035;
    int _1240 = int(_1146);
    int _1242 = _1130 ? 2 : 0;
    int _1244 = _1240 | _1242;
    int _1246 = _1138 ? 4 : 0;
    int _1248 = _1244 | _1246;
    int _1250 = _1158 ? 8 : 0;
    int _1252 = _1248 | _1250;
    int _1254 = _1162 ? 16 : 0;
    int _1256 = _1252 | _1254;
    int _1258 = _1166 ? 32 : 0;
    int _1260 = _1256 | _1258;
    int _1262 = _1134 ? 64 : 0;
    int _1264 = _1260 | _1262;
    int _1266 = _1264 & 4;
    float _1268 = _1070 + _1072;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1272 = _1270 != 0;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1276 = _1274 != 0;
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1280 = _1278 != 0;
    float _1282 = _1068 + _1072;
    bool _1284 = _983 == 0;
    float _1286 = trunc(_1192);
    int _1288 = int(_1286);
    int _1290 = ~_1142;
    int _1292 = _1290 + 1;
    int _1294 = _1292 + 1;
    float _1296 = _1168 + (-1.0);
    bool _1298 = !_1284;
    int _1300 = _1298 ? _1238 : (-1);
    float _1302 = _1268 + (-1.0);
    float _1304 = _1282 + (-1.0);
    int _1306 = _983 + (-1);
    int _1308 = _1300 * _1294;
    bool _1310 = !_1276;
    int _1312 = _1310 ? 0 : 1;
    bool _1314 = !_1146;
    int _1316 = _1314 ? 0 : 1;
    int _1318 = _1142 * _1306;
    int _1320 = _1318 + _1308;
    bool _1322 = !_1272;
    int _1324 = _1322 ? 0 : 1;
    int _1326 = abs(_1312);
    int _1328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1330 = _1328 != 0;
    int _1332 = abs(_1316);
    int _1334 = _1320 * _1326;
    bool _1336 = !_1280;
    int _1338 = _1336 ? 0 : 1;
    int _1340 = abs(_1324);
    int _1342 = _1230 * _1332;
    int _1344 = _1342 + _1035;
    bool _1346 = !_1330;
    int _1348 = _1346 ? 0 : 1;
    int _1350 = abs(_1338);
    int _1352 = abs(_1348);
    int _1354 = _1288 * _1340;
    int _1356 = _1354 + _1334;
    int _1358 = ~_983;
    int _1360 = _1358 + 1;
    int _1362 = _1344 * _1350;
    int _1364 = _1362 + _1356;
    bool _1366 = _1074 > 0.5;
    float _1368 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1370 = int(_1368);
    int _1372 = ~_983;
    int _1374 = _1372 + 1;
    int _1376 = _1230 * _1352;
    int _1378 = _1376 + _1364;
    int _1380 = ~_983;
    int _1382 = _1380 + 1;
    float _1384 = -_263;
    int _1386 = _1366 ? as_type<int>(_1384) : as_type<int>(_263);
    float _1388 = float(uint(_1378));
    bool _1390 = !_1158;
    float _1392 = _1390 ? _263 : as_type<float>(_1386);
    float _1394 = as_type<float>(_1037) * _1388;
    float _1396 = trunc(_1394);
    float _1398 = precise::max(_1396, 0.0);
    uint _1400 = uint(_1398);
    float _1402 = float(_1370);
    float _1404 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1406 = 1.0 + _1404;
    float _1408 = 1.0 / _1406;
    float _1410 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1412 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1414 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1412;
    int _1416 = _1382 * int(_1400);
    int _1418 = _1416 + _1378;
    float _1420 = _449 * _245;
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1424 = _1422 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1426 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1428 = fma(_457, _243, _1420);
    float _1430 = float(uint(_1418));
    float _1432 = fma(_1302, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1434 = as_type<float>(_1037) * _1430;
    float _1436 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1438 = trunc(_1434);
    float _1440 = precise::max(_1438, 0.0);
    uint _1442 = uint(_1440);
    int _1444 = int(_1400) + int(_1442);
    float _1446 = 1.0 / _1402;
    int _1448 = _1360 * _1444;
    int _1450 = _1448 + _1378;
    bool _1452 = uint(_1450) >= uint(_983);
    bool _1454 = !_1452;
    int _1456 = _1454 ? 0 : (-1);
    int _1458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1460 = _1458 != 0;
    int _1462 = ~_1444;
    int _1464 = _1462 + _1456;
    int _1466 = _1464 + 1;
    float _1468 = _115 * _1446;
    bool _1470 = !_1460;
    int _1472 = _1470 ? 0 : 1;
    int _1474 = _983 * _1466;
    int _1476 = _1474 + _1378;
    float _1478 = trunc(_1468);
    int _1480 = int(_1478);
    int _1482 = abs(_1472);
    bool _1484 = !_1284;
    int _1486 = _1484 ? _1476 : (-1);
    int _1488 = _1486 & 3;
    bool _1490 = _1488 != 0;
    int _1492 = _1490 ? 0 : 1;
    int _1494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1496 = _1494 != 0;
    int _1498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1500 = _1498 != 0;
    int _1502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1504 = _1502 != 0;
    int _1506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1508 = _1506 != 0;
    int _1510 = _1486 & 3;
    bool _1512 = _1510 != 0;
    int _1514 = ~_1492;
    int _1516 = _1514 + 1;
    int _1518 = _1516 + 1;
    bool _1520 = !_1500;
    int _1522 = _1520 ? 0 : 1;
    bool _1524 = uint(_1510) > 1u;
    float _1526 = float(uint(_1480));
    int _1528 = int(_1496);
    int _1530 = _1524 ? 2 : 0;
    int _1532 = _1528 | _1530;
    int _1534 = _1504 ? 4 : 0;
    int _1536 = _1532 | _1534;
    int _1538 = _1508 ? 8 : 0;
    int _1540 = _1536 | _1538;
    int _1542 = _1512 ? 16 : 0;
    int _1544 = _1540 | _1542;
    int _1546 = _1276 ? 32 : 0;
    int _1548 = _1544 | _1546;
    int _1550 = _1280 ? 64 : 0;
    int _1552 = _1548 | _1550;
    int _1554 = _1552 & 16;
    int _1556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1558 = _1556 != 0;
    int _1560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1562 = _1560 != 0;
    int _1564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1566 = _1564 != 0;
    bool _1568 = !_1496;
    int _1570 = _1568 ? 0 : 1;
    float _1572 = float(_1480);
    bool _1574 = !_1562;
    int _1576 = _1574 ? 0 : 1;
    int _1578 = _1518;
    float _1580 = _1234;
    if (!_1524)
    {
        int _1582 = ~_1492;
        int _1584 = _1582 + 1;
        _1578 = _1584;
    }
    int _1586 = _1578;
    float _1588 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1590 = int(_1588);
    bool _1592 = _1266 != 0;
    bool _1594 = !_1504;
    int _1596 = _1594 ? 0 : 1;
    int _1598 = abs(_1522);
    int _1600 = abs(_1596);
    bool _1602 = !_1508;
    int _1604 = _1602 ? 0 : 1;
    int _1606 = abs(_1576);
    int _1608 = abs(_1604);
    float _1610 = float(uint(_1590));
    int _1612 = ~_1590;
    int _1614 = _1612 + 1;
    float _1616 = 1.0 / _1610;
    int _1618 = ~_1590;
    int _1620 = _1618 + 1;
    float _1622 = float(_1590);
    bool _1624 = _1590 == 0;
    bool _1626 = _1572 >= _1622;
    bool _1628 = isnan(_1572);
    bool _1630 = _1626 || _1628;
    bool _1632 = isnan(_1622);
    bool _1634 = _1630 || _1632;
    float _1636 = float(_1634);
    float _1638 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1640 = int(_1638);
    int _1642 = as_type<int>(_1616) + (-2);
    float _1644 = trunc(_1636);
    int _1646 = int(_1644);
    float _1648 = as_type<float>(_1642) * _1526;
    int _1650 = ~_1640;
    int _1652 = _1650 + 1;
    float _1654 = trunc(_1648);
    float _1656 = precise::max(_1654, 0.0);
    uint _1658 = uint(_1656);
    int _1660 = _1614 * int(_1658);
    int _1662 = _1660 + _1480;
    float _1664 = float(uint(_1662));
    float _1666 = as_type<float>(_1642) * _1664;
    float _1668 = trunc(_1666);
    float _1670 = precise::max(_1668, 0.0);
    uint _1672 = uint(_1670);
    int _1674 = int(_1658) + int(_1672);
    float _1676 = float(uint(_1640));
    int _1678 = _1620 * _1674;
    int _1680 = _1678 + _1480;
    float _1682 = 1.0 / _1676;
    bool _1684 = uint(_1680) >= uint(_1590);
    bool _1686 = !_1684;
    int _1688 = _1686 ? 0 : (-1);
    float _1690 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1692 = int(_1690);
    int _1694 = ~_1674;
    int _1696 = _1694 + _1688;
    int _1698 = _1696 + 1;
    int _1700 = as_type<int>(_1682) + (-2);
    int _1702 = ~_1640;
    int _1704 = _1702 + 1;
    float _1706 = float(_1692);
    float _1708 = 1.0 / _1706;
    float _1710 = _115 * _1708;
    float _1712 = trunc(_1710);
    int _1714 = int(_1712);
    float _1716 = float(uint(_1714));
    float _1718 = as_type<float>(_1700) * _1716;
    float _1720 = trunc(_1718);
    float _1722 = precise::max(_1720, 0.0);
    uint _1724 = uint(_1722);
    int _1726 = _1652 * int(_1724);
    int _1728 = _1726 + _1714;
    float _1730 = float(uint(_1728));
    float _1732 = as_type<float>(_1700) * _1730;
    float _1734 = trunc(_1732);
    float _1736 = precise::max(_1734, 0.0);
    uint _1738 = uint(_1736);
    int _1740 = int(_1724) + int(_1738);
    float _1742 = _1098 * _1100;
    bool _1744 = !_1558;
    int _1746 = _1744 ? 0 : 1;
    bool _1748 = _1226 != 0;
    float _1750 = floor(_1742);
    int _1752 = ~_1646;
    int _1754 = _1752 + 1;
    int _1756 = _1754 + 1;
    int _1758 = _1704 * _1740;
    int _1760 = _1758 + _1714;
    int _1762 = abs(_1746);
    bool _1764 = uint(_1760) >= uint(_1640);
    bool _1766 = !_1764;
    int _1768 = _1766 ? 0 : (-1);
    int _1770 = ~_1740;
    int _1772 = _1770 + _1768;
    int _1774 = _1772 + 1;
    float _1776 = -_1750;
    float _1778 = _1742 + _1776;
    int _1780 = _1590 + (-1);
    float _1782 = _1778 * _1622;
    int _1784 = _1590 * _1698;
    int _1786 = _1784 + _1480;
    float _1788 = _487 * _1622;
    bool _1790 = !_1624;
    int _1792 = _1790 ? _1786 : (-1);
    float _1794 = trunc(_1782);
    int _1796 = int(_1794);
    int _1798 = _1792 * _1756;
    float _1800 = _1070 * 2.0;
    float _1802 = trunc(_1788);
    int _1804 = int(_1802);
    int _1806 = _1646 * _1780;
    int _1808 = _1806 + _1798;
    int _1810 = abs(_1570);
    int _1812 = _1808 * _1598;
    float _1814 = floor(_1800);
    int _1816 = _1796 * _1482;
    int _1818 = _1816 + _1480;
    int _1820 = ~_1590;
    int _1822 = _1820 + 1;
    int _1824 = _1804 * _1810;
    int _1826 = _1824 + _1812;
    bool _1828 = !_1566;
    int _1830 = _1828 ? 0 : 1;
    int _1832 = _1818 * _1600;
    int _1834 = _1832 + _1826;
    int _1836 = ~_1590;
    int _1838 = _1836 + 1;
    int _1840 = abs(_1830);
    int _1842 = _1796 * _1608;
    int _1844 = _1842 + _1834;
    float _1846 = float(uint(_1844));
    float _1848 = as_type<float>(_1642) * _1846;
    float _1850 = trunc(_1848);
    float _1852 = precise::max(_1850, 0.0);
    uint _1854 = uint(_1852);
    float _1856 = floor(_1128);
    int _1858 = _1838 * int(_1854);
    int _1860 = _1858 + _1844;
    float _1862 = float(uint(_1860));
    float _1864 = as_type<float>(_1642) * _1862;
    float _1866 = trunc(_1864);
    float _1868 = precise::max(_1866, 0.0);
    uint _1870 = uint(_1868);
    int _1872 = int(_1854) + int(_1870);
    float _1874 = _1068 * 2.0;
    int _1876 = _1822 * _1872;
    int _1878 = _1876 + _1844;
    float _1880 = floor(_1874);
    bool _1882 = uint(_1878) >= uint(_1590);
    float _1884 = float(_1714);
    bool _1886 = !_1882;
    int _1888 = _1886 ? 0 : (-1);
    int _1890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1892 = _1890 != 0;
    int _1894 = ~_1872;
    int _1896 = _1894 + _1888;
    int _1898 = _1896 + 1;
    bool _1900 = !_1892;
    int _1902 = _1900 ? 0 : 1;
    int _1904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1906 = _1904 != 0;
    int _1908 = abs(_1902);
    bool _1910 = !_1906;
    int _1912 = _1910 ? 0 : 1;
    bool _1914 = _1880 >= 0.0;
    bool _1916 = isnan(_1880);
    bool _1918 = _1914 || _1916;
    bool _1920 = isnan(0.0);
    bool _1922 = _1918 || _1920;
    int _1924 = abs(_1912);
    int _1926 = _1922 ? 0 : 1;
    bool _1928 = _1880 > 0.0;
    float _1930 = -_1856;
    float _1932 = _1128 + _1930;
    int _1934 = ~_1926;
    int _1936 = _1934 + 1;
    int _1938 = _1936 + 1;
    int _1940 = _1640 * _1774;
    int _1942 = _1940 + _1714;
    int _1944 = _1938;
    float _1946 = as_type<float>(_1872);
    if (!_1928)
    {
        int _1948 = ~_1926;
        int _1950 = _1948 + 1;
        _1944 = _1950;
    }
    int _1952 = _1944;
    float _1954 = float(_1640);
    bool _1956 = _1814 >= 0.0;
    bool _1958 = isnan(_1814);
    bool _1960 = _1956 || _1958;
    bool _1962 = isnan(0.0);
    bool _1964 = _1960 || _1962;
    bool _1966 = _1884 >= _1954;
    bool _1968 = isnan(_1884);
    bool _1970 = _1966 || _1968;
    bool _1972 = isnan(_1954);
    bool _1974 = _1970 || _1972;
    float _1976 = float(_1974);
    float _1978 = _1932 * _1954;
    float _1980 = _1964 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1982 = _487 * _1954;
    bool _1984 = _1814 > 0.0;
    float _1986 = trunc(_1978);
    int _1988 = int(_1986);
    int _1990 = ~as_type<int>(_1980);
    int _1992 = _1990 + 1;
    int _1994 = _1992 + 1;
    float _1996 = trunc(_1976);
    int _1998 = int(_1996);
    int _2000 = _1994;
    float _2002 = _1980;
    if (!_1984)
    {
        int _2004 = ~as_type<int>(_1980);
        int _2006 = _2004 + 1;
        _2000 = _2006;
    }
    int _2008 = _2000;
    bool _2010 = _1640 == 0;
    float _2012 = trunc(_1982);
    int _2014 = int(_2012);
    bool _2016 = !_2010;
    int _2018 = _2016 ? _1942 : (-1);
    int _2020 = _1640 + (-1);
    int _2022 = ~_1998;
    int _2024 = _2022 + 1;
    int _2026 = _2024 + 1;
    int _2028 = _2018 * _2026;
    int _2030 = ~_1640;
    int _2032 = _2030 + 1;
    int _2034 = _1998 * _2020;
    int _2036 = _2034 + _2028;
    int _2038 = _2036 * _1606;
    int _2040 = _1988 * _1908;
    int _2042 = _2040 + _1714;
    int _2044 = _2014 * _1762;
    int _2046 = _2044 + _2038;
    int _2048 = _2042 * _1840;
    int _2050 = _2048 + _2046;
    float _2052 = -_259;
    int _2054 = _1592 ? as_type<int>(_2052) : as_type<int>(_259);
    int _2056 = _1988 * _1924;
    int _2058 = _2056 + _2050;
    int _2060 = ~_1640;
    int _2062 = _2060 + 1;
    float _2064 = float(uint(_2058));
    float _2066 = as_type<float>(_1700) * _2064;
    float _2068 = trunc(_2066);
    float _2070 = precise::max(_2068, 0.0);
    uint _2072 = uint(_2070);
    int _2074 = _2062 * int(_2072);
    int _2076 = _2074 + _2058;
    float _2078 = float(uint(_2076));
    float _2080 = as_type<float>(_1700) * _2078;
    int _2082 = _1590 * _1898;
    int _2084 = _2082 + _1844;
    float _2086 = trunc(_2080);
    float _2088 = precise::max(_2086, 0.0);
    uint _2090 = uint(_2088);
    bool _2092 = !_1624;
    int _2094 = _2092 ? _2084 : (-1);
    int _2096 = int(_2072) + int(_2090);
    int _2098 = _2032 * _2096;
    int _2100 = _2098 + _2058;
    bool _2102 = uint(_2100) >= uint(_1640);
    bool _2104 = !_2102;
    int _2106 = _2104 ? 0 : (-1);
    int _2108 = _2094 & 3;
    bool _2110 = _2108 != 0;
    int _2112 = ~_2096;
    int _2114 = _2112 + _2106;
    int _2116 = _2114 + 1;
    int _2118 = _2110 ? 0 : 1;
    int _2120 = _1640 * _2116;
    int _2122 = _2120 + _2058;
    int _2124 = ~_2118;
    int _2126 = _2124 + 1;
    int _2128 = _2126 + 1;
    bool _2130 = !_2010;
    int _2132 = _2130 ? _2122 : (-1);
    int _2134 = _2132 & 3;
    bool _2136 = _2134 != 0;
    int _2138 = _2136 ? 0 : 1;
    int _2140 = _2094 & 3;
    bool _2142 = _2140 != 0;
    int _2144 = ~_2138;
    int _2146 = _2144 + 1;
    int _2148 = _2146 + 1;
    bool _2150 = uint(_2140) > 1u;
    int _2152 = _2128;
    int _2154 = _2148;
    if (!_2150)
    {
        int _2156 = ~_2118;
        int _2158 = _2156 + 1;
        _2152 = _2158;
    }
    int _2160 = _2152;
    int _2162 = _2132 & 3;
    bool _2164 = _2162 != 0;
    bool _2166 = uint(_2162) > 1u;
    if (!_2166)
    {
        int _2168 = ~_2138;
        int _2170 = _2168 + 1;
        _2154 = _2170;
    }
    int _2172 = _2154;
    bool _2174 = uint(_1510) >= 2u;
    int _2176 = abs(_2172);
    int _2178 = _2174 ? 0 : 1;
    bool _2180 = uint(_2162) >= 2u;
    int _2182 = ~_2178;
    int _2184 = _2182 + 1;
    int _2186 = _2184 + 1;
    int _2188 = _2180 ? 0 : 1;
    bool _2190 = _1510 != 3;
    int _2192 = ~_2188;
    int _2194 = _2192 + 1;
    int _2196 = _2194 + 1;
    int _2198 = ~_2176;
    int _2200 = _2198 + 1;
    int _2202 = _2200 + 1;
    int _2204 = _2186;
    int _2206 = _2196;
    if (_2190)
    {
        int _2208 = ~_2178;
        int _2210 = _2208 + 1;
        _2204 = _2210;
    }
    int _2212 = _2204;
    bool _2214 = _2162 != 3;
    if (_2214)
    {
        int _2216 = ~_2188;
        int _2218 = _2216 + 1;
        _2206 = _2218;
    }
    int _2220 = _2206;
    int _2222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2224 = _2222 != 0;
    float _2226 = -_263;
    int _2228 = _1748 ? as_type<int>(_2226) : as_type<int>(_263);
    bool _2230 = !_2224;
    int _2232 = _2230 ? 0 : 1;
    bool _2234 = _1068 > 0.5;
    float _2236 = -_259;
    int _2238 = _2234 ? as_type<int>(_2236) : as_type<int>(_259);
    int _2240 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2242 = _2240 != 0;
    bool _2244 = !_2242;
    float _2246 = _2244 ? _263 : as_type<float>(_2228);
    int _2248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2250 = _2248 != 0;
    bool _2252 = !_2250;
    float _2254 = _2252 ? _259 : as_type<float>(_2054);
    int _2256 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2258 = _2256 != 0;
    float _2260 = float(uint(_1344));
    bool _2262 = !_2258;
    float _2264 = _2262 ? _259 : as_type<float>(_2238);
    float _2266 = as_type<float>(_1037) * _2260;
    bool _2268 = _1102 != 2;
    float _2270 = trunc(_2266);
    float _2272 = precise::max(_2270, 0.0);
    uint _2274 = uint(_2272);
    float _2276 = 0.0;
    if (!_1132)
    {
        _2276 = _1070;
    }
    float _2278 = _2276;
    float _2280 = _2278;
    if (!_1132)
    {
        _2002 = _1072;
    }
    float _2282 = _2002;
    float _2284 = 0.0;
    float _2286 = _2282;
    if (!_1132)
    {
        _2284 = _2278;
    }
    float _2288 = _2284;
    float _2290 = 0.0;
    float _2292 = _2288;
    if (!_1132)
    {
        _2290 = _1072;
    }
    float _2294 = _2290;
    float _2296 = _2294;
    if (_1132)
    {
        _2292 = _1068;
    }
    float _2298 = _2292;
    if (_1132)
    {
        _2280 = _1068;
    }
    float _2300 = _2280;
    if (_1132)
    {
        _2286 = _1070;
    }
    float _2302 = _2286;
    if (_1132)
    {
        _2296 = _1070;
    }
    float _2304 = _2296;
    int _2306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2308 = _2306 != 0;
    int _2310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2312 = _2310 != 0;
    int _2314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2316 = _2314 != 0;
    int _2318 = ~_983;
    int _2320 = _2318 + 1;
    bool _2322 = !_2312;
    int _2324 = _2322 ? 0 : 1;
    int _2326 = _2320 * int(_2274);
    int _2328 = _2326 + _1344;
    bool _2330 = _1554 != 0;
    float _2332 = 0.0;
    if (_2268)
    {
        _2332 = _1068;
    }
    float _2334 = _2332;
    float _2336 = float(uint(_2328));
    int _2338 = ~_1590;
    int _2340 = _2338 + 1;
    float _2342 = _2334;
    if (_2268)
    {
        _1946 = _1070;
    }
    float _2344 = _1946;
    float _2346 = as_type<float>(_1037) * _2336;
    float _2348 = float(uint(_1818));
    float _2350 = _2344;
    if (!_2268)
    {
        _2342 = _1072;
    }
    float _2352 = _2342;
    if (!_2268)
    {
        _2350 = _1068;
    }
    float _2354 = _2350;
    float _2356 = as_type<float>(_1642) * _2348;
    float _2358 = trunc(_2346);
    float _2360 = precise::max(_2358, 0.0);
    uint _2362 = uint(_2360);
    float _2364 = _2352 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2366 = abs(_2324);
    float _2368 = trunc(_2356);
    float _2370 = precise::max(_2368, 0.0);
    uint _2372 = uint(_2370);
    int _2374 = int(_2274) + int(_2362);
    float _2376 = float(uint(_2042));
    int _2378 = _1374 * _2374;
    int _2380 = _2378 + _1344;
    float _2382 = as_type<float>(_1700) * _2376;
    int _2384 = _2340 * int(_2372);
    int _2386 = _2384 + _1818;
    bool _2388 = uint(_2380) >= uint(_983);
    bool _2390 = !_2316;
    int _2392 = _2390 ? 0 : 1;
    float _2394 = trunc(_2382);
    float _2396 = precise::max(_2394, 0.0);
    uint _2398 = uint(_2396);
    float _2400 = float(uint(_2386));
    bool _2402 = !_2388;
    int _2404 = _2402 ? 0 : (-1);
    float _2406 = as_type<float>(_1642) * _2400;
    int _2408 = ~_1590;
    int _2410 = _2408 + 1;
    int _2412 = ~_2374;
    int _2414 = _2412 + _2404;
    int _2416 = _2414 + 1;
    float _2418 = trunc(_2406);
    float _2420 = precise::max(_2418, 0.0);
    uint _2422 = uint(_2420);
    int _2424 = _983 * _2416;
    int _2426 = _2424 + _1344;
    int _2428 = int(_2372) + int(_2422);
    int _2430 = ~_1640;
    int _2432 = _2430 + 1;
    int _2434 = _2410 * _2428;
    int _2436 = _2434 + _1818;
    int _2438 = _2432 * int(_2398);
    int _2440 = _2438 + _2042;
    bool _2442 = uint(_2436) >= uint(_1590);
    float _2444 = float(uint(_2440));
    bool _2446 = !_2442;
    int _2448 = _2446 ? 0 : (-1);
    float _2450 = as_type<float>(_1700) * _2444;
    int _2452 = ~_1640;
    int _2454 = _2452 + 1;
    int _2456 = ~_2428;
    int _2458 = _2456 + _2448;
    int _2460 = _2458 + 1;
    float _2462 = trunc(_2450);
    float _2464 = precise::max(_2462, 0.0);
    uint _2466 = uint(_2464);
    int _2468 = _1590 * _2460;
    int _2470 = _2468 + _1818;
    int _2472 = int(_2398) + int(_2466);
    float _2474 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2476 = log2(_2474);
    bool _2478 = !_2330;
    int _2480 = _2478 ? 0 : 1;
    int _2482 = _2454 * _2472;
    int _2484 = _2482 + _2042;
    bool _2486 = uint(_2484) >= uint(_1640);
    bool _2488 = !_2164;
    int _2490 = _2488 ? 0 : 1;
    bool _2492 = _2162 != 3;
    bool _2494 = !_2486;
    int _2496 = _2494 ? 0 : (-1);
    float _2498 = _115 * _2476;
    bool _2500 = !_2492;
    int _2502 = _2500 ? 0 : (-1);
    bool _2504 = _1182 >= 0.0;
    bool _2506 = isnan(_1182);
    bool _2508 = _2504 || _2506;
    bool _2510 = isnan(0.0);
    bool _2512 = _2508 || _2510;
    bool _2514 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2516 = isnan(1.0);
    bool _2518 = _2514 || _2516;
    bool _2520 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2522 = _2518 || _2520;
    float _2524 = exp2(_2498);
    int _2526 = _2512 ? 0 : 1;
    float _2528 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _259);
    bool _2530 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2532 = isnan(0.0);
    bool _2534 = _2530 || _2532;
    bool _2536 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2538 = _2534 || _2536;
    int _2540 = ~_2472;
    int _2542 = _2540 + _2496;
    int _2544 = _2542 + 1;
    int _2546 = abs(_2490);
    int _2548 = abs(_2502);
    int _2550 = _1640 * _2544;
    int _2552 = _2550 + _2042;
    bool _2554 = !_2010;
    int _2556 = _2554 ? _2552 : (-1);
    float _2558 = -_2524;
    float _2560 = _2558 + 1.0;
    bool _2562 = uint(_2140) >= 2u;
    float _2564 = _2538 ? _2560 : 0.0;
    bool _2566 = _1182 > 0.0;
    int _2568 = ~_2526;
    int _2570 = _2568 + 1;
    int _2572 = _2570 + 1;
    float _2574 = _2564 * _1408;
    bool _2576 = !_2308;
    int _2578 = _2576 ? 0 : 1;
    bool _2580 = !_2522;
    float _2582 = _2580 ? _115 : _2574;
    float _2584 = _449 * _217;
    int _2586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2588 = _2586 != 0;
    int _2590 = _2572;
    if (!_2566)
    {
        int _2592 = ~_2526;
        int _2594 = _2592 + 1;
        _2590 = _2594;
    }
    int _2596 = _2590;
    float _2598 = fma(_457, _215, _2584);
    int _2600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2602 = _2600 != 0;
    float _2604 = _449 * _233;
    float _2606 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _263);
    float _2608 = _1154 * _2528;
    float _2610 = fma(_457, _231, _2604);
    float _2612 = _1148 * _2606;
    float _2614 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1436);
    float _2616 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2618 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2620 = _1068 + (-0.5);
    float _2622 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2624 = _2622 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2626 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2618);
    float _2628 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2630 = _2628 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2632 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2634 = 1.0 / _2624;
    float _2636 = _1070 + (-0.5);
    float _2638 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2640 = _2638 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2642 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2632);
    float _2644 = _1072 + (-0.5);
    float _2646 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2648 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2626);
    float _2650 = 1.0 / _2640;
    float _2652 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1410);
    float _2654 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2656 = -_2646;
    float _2658 = fma(_2616, 2.0, _2656);
    float _2660 = fma(_479, _219, _2598);
    float _2662 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2664 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2662;
    float _2666 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2668 = _2666 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2670 = 1.0 / _2630;
    float _2672 = fma(_1198, -2.0, _2654);
    float _2674 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2676 = _2674 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _2678 = _971 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2680 = isnan(_971);
    bool _2682 = _2678 || _2680;
    bool _2684 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2686 = _2682 || _2684;
    float _2688 = float(_2686);
    float _2690 = _1414 * _2634;
    float _2692 = -_115;
    float _2694 = fma(_2692, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2658);
    float _2696 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2698 = _2696 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2700 = 1.0 / _2668;
    float _2702 = fma(_479, _235, _2610);
    float _2704 = _1424 * _2650;
    float _2706 = -_2688;
    float _2708 = _2706 + 1.0;
    float _2710 = fma(_479, _247, _1428);
    float _2712 = _2664 * _2670;
    float _2714 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2716 = _2714 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2718 = 1.0 / _2698;
    bool _2720 = _971 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2722 = isnan(_971);
    bool _2724 = _2720 || _2722;
    bool _2726 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2728 = _2724 || _2726;
    float _2730 = float(_2728);
    float _2732 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2734 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2732;
    float _2736 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2738 = _2736 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2740 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2672);
    float _2742 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2642);
    float _2744 = _2676 * _2700;
    bool _2746 = _971 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2748 = isnan(_971);
    bool _2750 = _2746 || _2748;
    bool _2752 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2754 = _2750 || _2752;
    float _2756 = float(_2754);
    float _2758 = 1.0 / _2716;
    float _2760 = _2660 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2762 = _2710 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2764 = _2702 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2766 = -_2756;
    float _2768 = _2766 + 1.0;
    float _2770 = _2688 * _2768;
    float _2772 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2774 = _2772 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2776 = _971 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2778 = isnan(_971);
    bool _2780 = _2776 || _2778;
    bool _2782 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2784 = _2780 || _2782;
    float _2786 = float(_2784);
    float _2788 = _2730 * _2708;
    float _2790 = -_2730;
    float _2792 = _2790 + 1.0;
    float _2794 = 1.0 / _2738;
    float _2796 = _2734 * _2718;
    float _2798 = -_2786;
    float _2800 = _2798 + 1.0;
    float _2802 = _2774 * _2758;
    bool _2804 = _971 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2806 = isnan(_971);
    bool _2808 = _2804 || _2806;
    bool _2810 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2812 = _2808 || _2810;
    float _2814 = float(_2812);
    float _2816 = _2786 * _2792;
    float _2818 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2820 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2818;
    float _2822 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2824 = _971 + _2822;
    bool _2826 = _971 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2828 = isnan(_971);
    bool _2830 = _2826 || _2828;
    bool _2832 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2834 = _2830 || _2832;
    float _2836 = float(_2834);
    float _2838 = _2814 * _2800;
    float _2840 = -_2814;
    float _2842 = _2840 + 1.0;
    bool _2844 = _971 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2846 = isnan(_971);
    bool _2848 = _2844 || _2846;
    bool _2850 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2852 = _2848 || _2850;
    float _2854 = float(_2852);
    float _2856 = fma(_2690, _2824, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2858 = -_2836;
    float _2860 = _2858 + 1.0;
    float _2862 = _2836 * _2842;
    bool _2864 = _971 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2866 = isnan(_971);
    bool _2868 = _2864 || _2866;
    bool _2870 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2872 = _2868 || _2870;
    float _2874 = float(_2872);
    float _2876 = -_2854;
    float _2878 = _2876 + 1.0;
    float _2880 = _2854 * _2860;
    float _2882 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2884 = _971 + _2882;
    float _2886 = _2820 * _2794;
    float _2888 = _2874 * _2878;
    float _2890 = -_2874;
    float _2892 = _2890 + 1.0;
    float _2894 = fma(_2704, _2884, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2896 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2898 = _971 + _2896;
    float _2900 = _2856 * _2888;
    float _2902 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2904 = _971 + _2902;
    float _2906 = fma(_2712, _2898, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2908 = fma(_2892, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2900);
    float _2910 = fma(_2744, _2904, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2912 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2914 = _971 + _2912;
    float _2916 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2918 = _971 + _2916;
    float _2920 = fma(_2894, _2880, _2908);
    float _2922 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2924 = _971 + _2922;
    float _2926 = fma(_2796, _2914, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2928 = fma(_2802, _2918, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2930 = fma(_2906, _2862, _2920);
    float _2932 = fma(_2886, _2924, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2934 = _2264 + 0.5;
    float _2936 = _2246 + (-0.5);
    float _2938 = fma(_2910, _2838, _2930);
    float _2940 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2942 = fma(_2934, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2694);
    int _2944 = abs(_2578);
    float _2946 = fma(_2926, _2816, _2938);
    float _2948 = -_2936;
    float _2950 = -_2740;
    float _2952 = fma(_2948, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2950);
    float _2954 = fma(_2928, _2788, _2946);
    float _2956 = in.m_70.x;
    float _2958 = in.m_70.y;
    float _2960 = in.m_70.z;
    float _2962 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2964 = fma(_2932, _2770, _2954);
    float _2966 = float(_2596);
    float _2968 = -_2962;
    float _2970 = fma(_2364, 2.0, _2968);
    float _2972 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2974 = fma(_2756, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2964);
    float _2976 = float(_2944);
    float _2978 = fma(_2300, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2972);
    float _2980 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    out.m_72.x = _2974;
    float _2982 = _2976 * _2966;
    float _2984 = _2298 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2986 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2988 = fma(_2304, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2980);
    float _2990 = _2982 * (-2.0);
    int _2992 = abs(_2392);
    float _2994 = -_2986;
    float _2996 = fma(_2984, 2.0, _2994);
    float _2998 = fma(_1426, _2990, _1426);
    float _3000 = fma(_2990, _2956, _2956);
    float _3002 = -_115;
    float _3004 = fma(_3002, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2996);
    float _3006 = float(_1952);
    float _3008 = fma(_2620, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3000);
    float _3010 = float(_2366);
    float _3012 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3014 = float(_2008);
    float _3016 = _2302 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3018 = float(_2992);
    float _3020 = _3010 * _3006;
    float _3022 = fma(_2582, _2998, _3008);
    float _3024 = fma(_3016, -2.0, _3012);
    float _3026 = _3020 * (-2.0);
    float _3028 = _3018 * _3014;
    float _3030 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3032 = _2354 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3034 = fma(_3026, _2958, _2958);
    float _3036 = _3028 * (-2.0);
    float _3038 = fma(_1432, _3026, _1432);
    float _3040 = fma(_3032, -2.0, _3030);
    float _3042 = fma(_2636, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3034);
    float _3044 = fma(_3036, _2960, _2960);
    float _3046 = fma(_2940, _3036, _2940);
    float _3048 = _1392 + (-0.5);
    float _3050 = fma(_2582, _3038, _3042);
    float _3052 = fma(_2644, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3044);
    float _3054 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3024);
    float _3056 = _2254 + 0.5;
    float _3058 = _3050 * 0.15915493667125701904296875;
    float _3060 = fma(_2582, _3046, _3052);
    float _3062 = -_3048;
    float _3064 = -_3054;
    float _3066 = fma(_3062, (*spvDescriptorSet0.vp_c9)._m0[85].y, _3064);
    float _3068 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2978);
    float _3070 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2988);
    float _3072 = _3060 * 0.15915493667125701904296875;
    int _3074 = _2132 >> 31;
    float _3076 = fma(_3056, (*spvDescriptorSet0.vp_c9)._m0[85].x, _3004);
    float _3078 = -_2648;
    float _3080 = _3078 + 1.0;
    float _3082 = -_2742;
    float _3084 = _3082 + 1.0;
    int _3086 = _3074 & 3;
    float _3088 = -_3068;
    float _3090 = _3088 + 1.0;
    float _3092 = -_3070;
    float _3094 = _3092 + 1.0;
    float _3096 = -_3080;
    float _3098 = fma(_2264, _3096, _2942);
    int _3100 = _2132 + _3086;
    float _3102 = fma(_2246, _3084, _2952);
    float _3104 = -_3090;
    float _3106 = fma(_2254, _3104, _3076);
    float _3108 = fma(_1392, _3094, _3066);
    int _3110 = _3100 >> 2;
    float _3112 = _3022 * 0.15915493667125701904296875;
    float _3114 = _3058 * 6.283185482025146484375;
    float _3116 = sin(_3114);
    int _3118 = _3110 << 4;
    int _3120 = _3118 + 656;
    out.m_74.x = _3098;
    out.m_74.y = _3102;
    out.m_74.z = _3106;
    out.m_74.w = _3108;
    uint _3122 = uint(int(uint(_3120) >> uint(2)));
    uint _3124 = uint(int(uint(int(_3122)) >> uint(2)));
    int _3126 = int(_3122) & 3;
    float _3128 = (*spvDescriptorSet0.vp_c9)._m0[int(_3124)][_3126];
    int _3130 = int(_3122) + 1;
    uint _3132 = uint(int(uint(_3130) >> uint(2)));
    int _3134 = _3130 & 3;
    float _3136 = (*spvDescriptorSet0.vp_c9)._m0[int(_3132)][_3134];
    float _3138 = _3112 * 6.283185482025146484375;
    float _3140 = sin(_3138);
    float _3142 = _3112 * 6.283185482025146484375;
    float _3144 = cos(_3142);
    int _3146 = _3120 + 8;
    uint _3148 = uint(int(uint(_3146) >> uint(2)));
    uint _3150 = uint(int(uint(int(_3148)) >> uint(2)));
    int _3152 = int(_3148) & 3;
    float _3154 = (*spvDescriptorSet0.vp_c9)._m0[int(_3150)][_3152];
    int _3156 = int(_3148) + 1;
    uint _3158 = uint(int(uint(_3156) >> uint(2)));
    int _3160 = _3156 & 3;
    float _3162 = (*spvDescriptorSet0.vp_c9)._m0[int(_3158)][_3160];
    float _3164 = _3058 * 6.283185482025146484375;
    float _3166 = cos(_3164);
    float _3168 = _3140 * _3116;
    int _3170 = abs(_2220);
    int _3172 = ~_2546;
    int _3174 = _3172 + 1;
    int _3176 = _3174 + 1;
    float _3178 = _3072 * 6.283185482025146484375;
    float _3180 = cos(_3178);
    float _3182 = _3144 * _3116;
    float _3184 = _3072 * 6.283185482025146484375;
    float _3186 = sin(_3184);
    float _3188 = _3144 * _3166;
    float _3190 = _3140 * _3166;
    float _3192 = _3140 * _3180;
    float _3194 = _3166 * _3180;
    float _3196 = _3144 * _3180;
    float _3198 = _3116 * _3180;
    float _3200 = _3196 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3202 = _3196 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3204 = fma(_3186, _3188, _3168);
    float _3206 = fma(_3186, _3168, _3188);
    float _3208 = -_3182;
    float _3210 = fma(_3186, _3190, _3208);
    float _3212 = -_3190;
    float _3214 = fma(_3186, _3182, _3212);
    float _3216 = _3196 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3218 = _3196 * _2612;
    float _3220 = -_2612;
    float _3222 = _3186 * _3220;
    float _3224 = -_3186;
    float _3226 = fma(_3224, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3200);
    float _3228 = -_3186;
    float _3230 = fma(_3228, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3216);
    float _3232 = -_3186;
    float _3234 = fma(_3232, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3202);
    float _3236 = fma(_3204, _2608, _3218);
    float _3238 = fma(_3194, _2608, _3222);
    float _3240 = _3204 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3242 = _3204 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3244 = _3204 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3246 = _3192 * _2612;
    float _3248 = fma(_3194, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3240);
    float _3250 = fma(_3194, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3242);
    float _3252 = fma(_3194, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3244);
    float _3254 = fma(_3210, _2608, _3246);
    float _3256 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3258 = _3214 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3260 = _2202 * as_type<int>(_3136);
    float _3262 = fma(_3192, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3230);
    float _3264 = fma(_3192, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3226);
    float _3266 = fma(_3192, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3234);
    float _3268 = fma(_3198, _3256, _3238);
    float _3270 = fma(_3214, _3256, _3236);
    float _3272 = fma(_3206, _3256, _3254);
    float _3274 = _3214 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3276 = _3214 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3278 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3258);
    int _3280 = ~_3170;
    int _3282 = _3280 + 1;
    int _3284 = _3282 + 1;
    int _3286 = _3176 * as_type<int>(_3128);
    int _3288 = _3286 + _3260;
    float _3290 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3274);
    float _3292 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3276);
    float _3294 = fma(_3206, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3278);
    int _3296 = _3284 * as_type<int>(_3154);
    int _3298 = _3296 + _3288;
    int _3300 = abs(_2232);
    float _3302 = _3270 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3304 = _1486 >> 31;
    float _3306 = _3270 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3308 = _3270 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3310 = fma(_3206, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3290);
    float _3312 = fma(_3206, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3292);
    int _3314 = _3304 & 3;
    float _3316 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3318 = int(_3316);
    int _3320 = ~_2548;
    int _3322 = _3320 + 1;
    int _3324 = _3322 + 1;
    float _3326 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3302);
    float _3328 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3308);
    int _3330 = _1486 + _3314;
    float _3332 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3306);
    float _3334 = fma(_3272, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3326);
    float _3336 = fma(_3272, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3328);
    int _3338 = _3324 * as_type<int>(_3162);
    int _3340 = _3338 + _3298;
    int _3342 = ~_3300;
    int _3344 = _3342 + 1;
    int _3346 = _3344 + 1;
    float _3348 = _3334 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3350 = _3336 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _3352 = _2094 >> 31;
    float _3354 = fma(_3210, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3252);
    int _3356 = _3340 * _3346;
    float _3358 = _2760 + _3348;
    float _3360 = _2762 + _3350;
    int _3362 = _3330 >> 2;
    int _3364 = _2556 * _3300;
    int _3366 = _3364 + _3356;
    int _3368 = _3352 & 3;
    float _3370 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3372 = _3358 + _3370;
    int _3374 = abs(_3318);
    float _3376 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3378 = _3360 + _3376;
    int _3380 = _3362 << 4;
    int _3382 = _3380 + 368;
    float _3384 = fma(_3210, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3248);
    float _3386 = fma(_3210, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3250);
    int _3388 = _2094 + _3368;
    float _3390 = _3372 * _3372;
    float _3392 = float(uint(_3374));
    float _3394 = _3378 * _3378;
    float _3396 = float(uint(_3318));
    float _3398 = _263 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3400 = _259 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3402 = _3390 + _3394;
    float _3404 = 1.0 / _3396;
    float _3406 = _3398 * _3264;
    int _3408 = _3388 >> 2;
    float _3410 = _3398 * _3262;
    float _3412 = _3398 * _3266;
    float _3414 = fma(_3400, _3386, _3406);
    int _3416 = abs(_3366);
    uint _3418 = uint(int(uint(_3382) >> uint(2)));
    uint _3420 = uint(int(uint(int(_3418)) >> uint(2)));
    int _3422 = int(_3418) & 3;
    float _3424 = (*spvDescriptorSet0.vp_c9)._m0[int(_3420)][_3422];
    int _3426 = int(_3418) + 1;
    uint _3428 = uint(int(uint(_3426) >> uint(2)));
    int _3430 = _3426 & 3;
    float _3432 = (*spvDescriptorSet0.vp_c9)._m0[int(_3428)][_3430];
    float _3434 = 1.0 / _3392;
    int _3436 = _3408 << 4;
    int _3438 = _3436 + 512;
    float _3440 = fma(_3400, _3384, _3410);
    float _3442 = fma(_3400, _3354, _3412);
    float _3444 = fma(_3272, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3332);
    int _3446 = _2562 ? 0 : 1;
    int _3448 = _3382 + 8;
    uint _3450 = uint(int(uint(_3448) >> uint(2)));
    uint _3452 = uint(int(uint(int(_3450)) >> uint(2)));
    int _3454 = int(_3450) & 3;
    float _3456 = (*spvDescriptorSet0.vp_c9)._m0[int(_3452)][_3454];
    int _3458 = int(_3450) + 1;
    uint _3460 = uint(int(uint(_3458) >> uint(2)));
    int _3462 = _3458 & 3;
    float _3464 = (*spvDescriptorSet0.vp_c9)._m0[int(_3460)][_3462];
    float _3466 = sqrt(_3402);
    int _3468 = as_type<int>(_3404) + (-2);
    float _3470 = _3444 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _3472 = !_2142;
    int _3474 = _3472 ? 0 : 1;
    bool _3476 = _1510 != 3;
    float _3478 = _2764 + _3470;
    uint _3480 = uint(int(uint(_3438) >> uint(2)));
    uint _3482 = uint(int(uint(int(_3480)) >> uint(2)));
    int _3484 = int(_3480) & 3;
    float _3486 = (*spvDescriptorSet0.vp_c9)._m0[int(_3482)][_3484];
    int _3488 = int(_3480) + 1;
    uint _3490 = uint(int(uint(_3488) >> uint(2)));
    int _3492 = _3488 & 3;
    float _3494 = (*spvDescriptorSet0.vp_c9)._m0[int(_3490)][_3492];
    int _3496 = as_type<int>(_3434) + (-2);
    bool _3498 = _2140 != 3;
    int _3500 = _3438 + 8;
    uint _3502 = uint(int(uint(_3500) >> uint(2)));
    uint _3504 = uint(int(uint(int(_3502)) >> uint(2)));
    int _3506 = int(_3502) & 3;
    float _3508 = (*spvDescriptorSet0.vp_c9)._m0[int(_3504)][_3506];
    int _3510 = int(_3502) + 1;
    uint _3512 = uint(int(uint(_3510) >> uint(2)));
    int _3514 = _3510 & 3;
    float _3516 = (*spvDescriptorSet0.vp_c9)._m0[int(_3512)][_3514];
    bool _3518 = _3466 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3520 = float(uint(_3416));
    float _3522 = as_type<float>(_3496) * _3520;
    float _3524 = _3470;
    float _3526 = as_type<float>(_3416);
    float _3528 = _3434;
    float _3530 = _3272;
    float _3532 = _3394;
    float _3534 = _3266;
    float _3536 = _3386;
    if (!_3518)
    {
        _3524 = _3390;
    }
    float _3538 = _3524;
    float _3540 = float(uint(_3366));
    float _3542 = _3538;
    if (!_3518)
    {
        _3526 = _3358;
    }
    float _3544 = _3526;
    float _3546 = trunc(_3522);
    float _3548 = precise::max(_3546, 0.0);
    uint _3550 = uint(_3548);
    float _3552 = _3544;
    if (!_3518)
    {
        _3528 = _3360;
    }
    float _3554 = _3528;
    float _3556 = as_type<float>(_3468) * _3540;
    float _3558 = _3554;
    if (!_3518)
    {
        _3530 = _3478;
    }
    float _3560 = _3530;
    int _3562 = ~_3446;
    int _3564 = _3562 + 1;
    int _3566 = _3564 + 1;
    bool _3568 = !_3518;
    float _3570 = _3560;
    int _3572 = _3566;
    if (!_3568)
    {
        float _3574 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3576 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3578 = _3466 + _3576;
        float _3580 = rsqrt(_3402);
        float _3582 = _3578 * _3574;
        float _3584 = _3478 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3586 = _3582 * 0.15915493667125701904296875;
        float _3588 = _3586 * 6.283185482025146484375;
        float _3590 = sin(_3588);
        float _3592 = _3586 * 6.283185482025146484375;
        float _3594 = cos(_3592);
        float _3596 = fma(_3590, _3584, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3598 = _3580 * _3596;
        float _3600 = _3594 + (-1.0);
        float _3602 = fma(_3372, _3598, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3604 = fma(_3378, _3598, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3606 = _3600 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3608 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3610 = _3602 + _3608;
        float _3612 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3614 = _3604 + _3612;
        float _3616 = fma(_3478, _3594, _3606);
        float _3618 = _3610 * _3610;
        float _3620 = _3614 * _3614;
        _3570 = _3616;
        _3542 = _3618;
        _3532 = _3620;
        _3552 = _3602;
        _3558 = _3604;
    }
    float _3622 = _3570;
    float _3624 = _3542;
    float _3626 = _3532;
    float _3628 = _3552;
    float _3630 = _3558;
    float _3632 = trunc(_3556);
    float _3634 = precise::max(_3632, 0.0);
    uint _3636 = uint(_3634);
    float _3638 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3640 = _3622 + _3638;
    if (_3498)
    {
        int _3642 = ~_3446;
        int _3644 = _3642 + 1;
        _3572 = _3644;
    }
    int _3646 = _3572;
    float _3648 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3040);
    int _3650 = abs(_2160);
    float _3652 = fma(_3640, _3640, _3624);
    int _3654 = ~_3318;
    int _3656 = _3654 + 1;
    float _3658 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2614);
    int _3660 = ~_3374;
    int _3662 = _3660 + 1;
    float _3664 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2652);
    float _3666 = -_3658;
    float _3668 = _3666 + 1.0;
    int _3670 = abs(_1586);
    float _3672 = -_3664;
    float _3674 = _3672 + 1.0;
    int _3676 = abs(_2480);
    int _3678 = _3662 * int(_3550);
    int _3680 = _3678 + _3416;
    int _3682 = ~_3670;
    int _3684 = _3682 + 1;
    int _3686 = _3684 + 1;
    int _3688 = _3656 * int(_3636);
    int _3690 = _3688 + _3366;
    int _3692 = abs(_3474);
    float _3694 = _3294 + _3440;
    int _3696 = ~_3676;
    int _3698 = _3696 + 1;
    int _3700 = _3698 + 1;
    int _3702 = _3686 * as_type<int>(_3432);
    float _3704 = float(uint(_3690));
    float _3706 = _3310 + _3414;
    float _3708 = float(uint(_3680));
    int _3710 = _3700 * as_type<int>(_3424);
    int _3712 = _3710 + _3702;
    int _3714 = ~_3650;
    int _3716 = _3714 + 1;
    int _3718 = _3716 + 1;
    float _3720 = as_type<float>(_3468) * _3704;
    float _3722 = as_type<float>(_3496) * _3708;
    int _3724 = abs(_3646);
    int _3726 = _3718 * as_type<int>(_3494);
    int _3728 = ~_3692;
    int _3730 = _3728 + 1;
    int _3732 = _3730 + 1;
    float _3734 = trunc(_3722);
    float _3736 = precise::max(_3734, 0.0);
    uint _3738 = uint(_3736);
    bool _3740 = !_3476;
    int _3742 = _3740 ? 0 : (-1);
    out.m_76.x = _3384;
    out.m_76.y = _3386;
    out.m_76.z = _3354;
    int _3744 = abs(_2212);
    int _3746 = _3732 * as_type<int>(_3486);
    int _3748 = _3746 + _3726;
    int _3750 = ~_3724;
    int _3752 = _3750 + 1;
    int _3754 = _3752 + 1;
    float _3756 = _3652 + _3626;
    int _3758 = abs(_3742);
    float _3760 = trunc(_3720);
    float _3762 = precise::max(_3760, 0.0);
    uint _3764 = uint(_3762);
    bool _3766 = _2140 != 3;
    int _3768 = _3754 * as_type<int>(_3508);
    int _3770 = _3768 + _3748;
    int _3772 = ~_3744;
    int _3774 = _3772 + 1;
    int _3776 = _3774 + 1;
    bool _3778 = !_3766;
    int _3780 = _3778 ? 0 : (-1);
    int _3782 = _3776 * as_type<int>(_3456);
    int _3784 = _3782 + _3712;
    int _3786 = ~_3758;
    int _3788 = _3786 + 1;
    int _3790 = _3788 + 1;
    float _3792 = sqrt(_3756);
    int _3794 = abs(_3780);
    int _3796 = ~_3318;
    int _3798 = _3796 + 1;
    int _3800 = _3790 * as_type<int>(_3464);
    int _3802 = _3800 + _3784;
    int _3804 = ~_3374;
    int _3806 = _3804 + 1;
    int _3808 = int(_3550) + int(_3738);
    int _3810 = int(_3636) + int(_3764);
    int _3812 = _3806 * _3808;
    int _3814 = _3812 + _3416;
    int _3816 = ~_3794;
    int _3818 = _3816 + 1;
    int _3820 = _3818 + 1;
    float _3822 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3824 = !_2602;
    int _3826 = _3824 ? 0 : 1;
    int _3828 = _3798 * _3810;
    int _3830 = _3828 + _3366;
    bool _3832 = uint(_3814) >= uint(_3374);
    int _3834 = _3820 * as_type<int>(_3516);
    int _3836 = _3834 + _3770;
    int _3838 = abs(_3826);
    int _3840 = _3366 ^ _3318;
    float _3842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3844 = ~_3838;
    int _3846 = _3844 + 1;
    int _3848 = _3846 + 1;
    bool _3850 = uint(_3830) >= uint(_3318);
    uint _3852 = uint(int(uint(_3840) >> uint(31)));
    int _3854 = _3802 * _3848;
    bool _3856 = !_3832;
    int _3858 = _3856 ? 0 : (-1);
    bool _3860 = !_3850;
    int _3862 = _3860 ? 0 : (-1);
    int _3864 = ~int(_3852);
    int _3866 = _3864 + 1;
    float _3868 = fma(_3398, _3398, 1.0);
    int _3870 = ~_3858;
    int _3872 = _3808 + _3870;
    int _3874 = _3872 + 1;
    bool _3876 = !_2588;
    int _3878 = _3876 ? 0 : 1;
    int _3880 = ~_3810;
    int _3882 = _3880 + _3862;
    int _3884 = _3882 + 1;
    float _3886 = rsqrt(_3868);
    int _3888 = _3874 ^ _3866;
    int _3890 = abs(_3878);
    int _3892 = _3318 * _3884;
    int _3894 = _3892 + _3366;
    bool _3896 = _3318 == 0;
    bool _3898 = _3318 == 0;
    float _3900 = _3312 + _3442;
    int _3902 = ~_3866;
    int _3904 = _3902 + _3888;
    int _3906 = _3904 + 1;
    float _3908 = _3822 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3910 = ~_3890;
    int _3912 = _3910 + 1;
    int _3914 = _3912 + 1;
    bool _3916 = _983 == 0;
    out.m_78.x = _3694;
    out.m_78.y = _3706;
    out.m_78.z = _3900;
    bool _3918 = _1590 == 0;
    int _3920 = _3836 * _3914;
    bool _3922 = !_3896;
    int _3924 = _3922 ? _3894 : (-1);
    float _3926 = _3842 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3928 = !_3898;
    int _3930 = _3928 ? _3906 : (-1);
    float _3932 = -_115;
    float _3934 = fma(_3932, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2970);
    bool _3936 = !_3916;
    int _3938 = _3936 ? _2426 : (-1);
    float _3940 = float(_3924);
    float _3942 = float(_3930);
    int _3944 = _3938 * _3838;
    int _3946 = _3944 + _3854;
    float _3948 = _1196 + 0.5;
    float _3950 = fma(_3908, _3940, _3934);
    bool _3952 = !_3918;
    int _3954 = _3952 ? _2470 : (-1);
    float _3956 = -_3648;
    float _3958 = fma(_3926, _3942, _3956);
    float _3960 = _1234 + (-0.5);
    float _3962 = _3398 * _3886;
    float _3964 = fma(_3908, _3948, _3950);
    int _3966 = _3954 * _3890;
    int _3968 = _3966 + _3920;
    float _3970 = -_3926;
    float _3972 = fma(_3970, _3960, _3958);
    float _3974 = -_3294;
    float _3976 = _3962 * _3974;
    float _3978 = -_3310;
    float _3980 = _3962 * _3978;
    float _3982 = -_3312;
    float _3984 = _3962 * _3982;
    float _3986 = -_3668;
    float _3988 = fma(_1196, _3986, _3964);
    float _3990 = fma(_3886, _3262, _3976);
    float _3992 = fma(_3886, _3264, _3980);
    float _3994 = fma(_3886, _3266, _3984);
    float _3996 = float(_3946);
    float _3998 = fma(_1234, _3674, _3972);
    float _4000 = float(_3968);
    out.m_80.x = _3990;
    out.m_80.y = _3992;
    out.m_80.z = _3994;
    bool _4002 = _3792 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4004 = isnan(_3792);
    bool _4006 = _4002 || _4004;
    bool _4008 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4010 = _4006 || _4008;
    out.m_82.x = _3996;
    out.m_82.y = _4000;
    out.m_84.x = _3988;
    out.m_84.y = _3998;
    if (!_4010)
    {
        _3534 = 1.0;
    }
    float _4012 = _3534;
    bool _4014 = !_4010;
    float _4016 = _4012;
    if (!_4014)
    {
        bool _4018 = _3792 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4020 = isnan(_3792);
        bool _4022 = _4018 || _4020;
        bool _4024 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4026 = _4022 || _4024;
        if (!_4026)
        {
            float _4028 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4030 = _3792 + _4028;
            float _4032 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4034 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4032;
            float _4036 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4038 = _4036 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4040 = 1.0 / _4034;
            float _4042 = _4030 * _4040;
            float _4044 = fma(_4042, _4038, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4016 = _4044;
            _3536 = _4040;
            _4046 = true;
        }
        else
        {
            bool _4048 = _3792 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4050 = isnan(_3792);
            bool _4052 = _4048 || _4050;
            bool _4054 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4056 = _4052 || _4054;
            if (!_4056)
            {
                float _4058 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4060 = _3792 + _4058;
                float _4062 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4064 = _4062 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4066 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4068 = _4066 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4070 = 1.0 / _4064;
                float _4072 = _4060 * _4070;
                float _4074 = fma(_4072, _4068, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4016 = _4074;
                _3536 = _4070;
                _4046 = true;
            }
            else
            {
                _4016 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4046 = false;
    float _4076 = _4016;
    float _4078 = _3536;
    float _4080 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4082 = _3622 + _4080;
    float _4084 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4086 = _3628 + _4084;
    float _4088 = fma(_4082, _4076, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4090 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4092 = _3630 + _4090;
    float _4094 = fma(_4086, _4076, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4096 = -_2764;
    float _4098 = _4096 + _4088;
    float _4100 = fma(_4092, _4076, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4102 = -_2760;
    float _4104 = _4102 + _4094;
    float _4106 = _4098 * _4098;
    float _4108 = -_2762;
    float _4110 = _4108 + _4100;
    float _4112 = fma(_4104, _4104, _4106);
    float _4114 = fma(_4110, _4110, _4112);
    float _4116 = sqrt(_4114);
    bool _4118 = _4116 > 0.0;
    float _4120 = _4116;
    float _4122 = _4078;
    float _4124 = _4086;
    float _4126 = _4100;
    if (!_4118)
    {
        _4120 = _4094;
    }
    float _4128 = _4120;
    float _4130 = _4128;
    float _4132 = _4128;
    float _4134 = _4128;
    if (!_4118)
    {
        _4122 = _4088;
    }
    float _4136 = _4122;
    bool _4138 = !_4118;
    float _4140 = _4136;
    float _4142 = _4136;
    if (!_4138)
    {
        bool _4144 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _4146 = _4076;
        if (_4144)
        {
            float _4148 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _4146 = _4148;
        }
        float _4150 = _4146;
        float _4152 = _4150;
        if (_4144)
        {
            float _4154 = _481 * _4150;
            _4124 = _4154;
        }
        float _4156 = _4124;
        float _4158 = _4156;
        if (_4144)
        {
            float _4160 = _483 * _4150;
            _1580 = _4160;
        }
        float _4162 = _1580;
        float _4164 = _4162;
        if (_4144)
        {
            float _4166 = _485 * _4150;
            _4152 = _4166;
        }
        float _4168 = _4152;
        float _4170 = _4168;
        if (!_4144)
        {
            bool _4172 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _4174 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _4176 = _4172 || _4174;
            bool _4178 = isnan(1.0);
            bool _4180 = _4176 || _4178;
            float _4182 = _115 + 1.0;
            float _4184 = _4182;
            if (!_4180)
            {
                float _4186 = _4182 * _4182;
                float _4188 = _4186 * 0.5;
                _4130 = _4188;
            }
            float _4190 = _4130;
            float _4192 = _4190;
            if (!_4180)
            {
                float _4194 = _4190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4192 = _4194;
            }
            float _4196 = _4192;
            bool _4198 = !_4180;
            float _4200 = _4196;
            if (!_4198)
            {
                float _4202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4204 = log2(_4202);
                float _4206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4208 = _4204 * _4182;
                float _4210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4212 = _4210 + 1.0;
                float _4214 = 1.0 / _4212;
                float _4216 = _4206 * 0.693147182464599609375;
                float _4218 = exp2(_4208);
                float _4220 = 1.0 / _4216;
                float _4222 = _4218 + (-1.0);
                float _4224 = -_4222;
                float _4226 = fma(_4224, _4220, _4182);
                float _4228 = _4226 * _4214;
                float _4230 = _4228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4200 = _4230;
            }
            float _4232 = _4200;
            float _4234 = _4232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _4236 = _4232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _4238 = !_4180;
            _4140 = _4234;
            _4132 = _4232;
            if (!_4238)
            {
                float _4240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4242 = log2(_4240);
                float _4244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4246 = _4244 + 1.0;
                float _4248 = 1.0 / _4246;
                float _4250 = _4242 * _4182;
                float _4252 = exp2(_4250);
                float _4254 = -_4252;
                float _4256 = _4254 + 1.0;
                float _4258 = _4256 * _4248;
                _4184 = _4258;
            }
            float _4260 = _4184;
            float _4262 = fma(_4260, _177, _4236);
            float _4264 = fma(_4260, _175, _4234);
            float _4266 = _4232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _4268 = -_443;
            float _4270 = _4268 + _4262;
            float _4272 = -_441;
            float _4274 = _4272 + _4264;
            float _4276 = fma(_4260, _179, _4266);
            float _4278 = _4270 * _217;
            float _4280 = _4270 * _233;
            float _4282 = _4270 * _245;
            float _4284 = -_455;
            float _4286 = _4284 + _4276;
            float _4288 = fma(_4274, _215, _4278);
            float _4290 = fma(_4274, _231, _4280);
            float _4292 = fma(_4274, _243, _4282);
            float _4294 = fma(_4286, _219, _4288);
            float _4296 = fma(_4286, _235, _4290);
            float _4298 = fma(_4286, _247, _4292);
            _491 = _4296;
            _493 = _4294;
            _495 = _4298;
            _4158 = _4294;
            _4164 = _4296;
            _4170 = _4298;
        }
        float _4300 = _491;
        float _4302 = _493;
        float _4304 = _495;
        float _4306 = _4158;
        float _4308 = _4164;
        float _4310 = _4170;
        float _4312 = _4140;
        float _4314 = _4132;
        float _4316 = _4300 * _4300;
        float _4318 = rsqrt(_4114);
        float _4320 = fma(_4302, _4302, _4316);
        float _4322 = fma(_4304, _4304, _4320);
        float _4324 = sqrt(_4322);
        float _4326 = _4104 * _4318;
        float _4328 = _4098 * _4318;
        float _4330 = _4110 * _4318;
        bool _4332 = _4324 > 0.0;
        float _4334 = _4314;
        float _4336 = _4312;
        _273 = _4322;
        if (!_4332)
        {
            _4334 = _4094;
        }
        float _4338 = _4334;
        _4134 = _4338;
        if (!_4332)
        {
            _4336 = _4088;
        }
        float _4340 = _4336;
        bool _4342 = !_4332;
        _4142 = _4340;
        if (!_4342)
        {
            float _4344 = rsqrt(_4322);
            float _4346 = _4344 * _4300;
            float _4348 = _4344 * _4302;
            float _4350 = _4344 * _4304;
            float _4352 = _4328 * _4346;
            float _4354 = fma(_4326, _4348, _4352);
            float _4356 = fma(_4330, _4350, _4354);
            float _4358 = _4356 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4360 = fma(_4306, _4358, _4094);
            float _4362 = fma(_4308, _4358, _4088);
            float _4364 = fma(_4310, _4358, _4100);
            _4142 = _4362;
            _4134 = _4360;
            _4126 = _4364;
        }
    }
    float _4366 = _4142;
    float _4368 = _4134;
    float _4370 = _4126;
    float _4372 = _273;
    float _4374 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4376 = _4366 + _4374;
    float _4378 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4380 = _4368 + _4378;
    float _4382 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4384 = _4370 + _4382;
    float _4386 = _4376 * _4376;
    float _4388 = fma(_4380, _4380, _4386);
    float _4390 = fma(_4384, _4384, _4388);
    float _4392 = rsqrt(_4390);
    float _4394 = sqrt(_4390);
    float _4396 = _4392 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4398 = _4380 * _4396;
    float _4400 = _4384 * _4396;
    float _4402 = _4398 * _4398;
    float _4404 = _4400 * _4400;
    float _4406 = _4402 + _4404;
    float _4408 = sqrt(_4406);
    bool _4410 = _4408 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4412 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4414 = _4408 + _4412;
    float _4416 = _4392;
    float _4418 = _4406;
    float _4420 = _4414;
    float _4422 = _4372;
    float _4424 = _4376;
    if (_4410)
    {
        float _4426 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4416 = _4426;
    }
    float _4428 = _4416;
    if (_4410)
    {
        float _4430 = rsqrt(_4406);
        _4418 = _4430;
    }
    float _4432 = _4418;
    float _4434 = _4432;
    if (_4410)
    {
        float _4436 = _4414 * _4428;
        _4420 = _4436;
    }
    float _4438 = _4420;
    if (_4410)
    {
        float _4440 = _4438 * 0.15915493667125701904296875;
        _4422 = _4440;
    }
    float _4442 = _4422;
    float _4444 = _4384;
    if (_4410)
    {
        float _4446 = _4442 * 6.283185482025146484375;
        float _4448 = sin(_4446);
        _4444 = _4448;
    }
    float _4450 = _4444;
    float _4452 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4454 = precise::max(0.0, _4452);
    float _4456 = _4428;
    float _4458 = _4454;
    if (_4410)
    {
        float _4460 = _4442 * 6.283185482025146484375;
        float _4462 = cos(_4460);
        _4456 = _4462;
    }
    float _4464 = _4456;
    float _4466 = -_4396;
    float _4468 = -_4454;
    float _4470 = fma(_4376, _4466, _4468);
    if (_4410)
    {
        float _4472 = _4470 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4424 = _4472;
    }
    float _4474 = _4424;
    float _4476 = _4366 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4478 = _4474;
    float _4480 = _4450;
    if (_4410)
    {
        float _4482 = fma(_4450, _4474, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4478 = _4482;
    }
    float _4484 = _4478;
    float _4486 = _4484;
    if (!_4410)
    {
        _4480 = _4398;
    }
    float _4488 = _4480;
    float _4490 = _4488;
    float _4492 = _4464;
    if (_4410)
    {
        float _4494 = _4464 + (-1.0);
        _4458 = _4494;
    }
    float _4496 = _4458;
    float _4498 = _4496;
    if (_4410)
    {
        float _4500 = _4432 * _4484;
        _275 = _4500;
    }
    float _4502 = _275;
    if (!_4410)
    {
        _4486 = _4470;
    }
    float _4504 = _4486;
    float _4506 = _4504;
    if (_4410)
    {
        float _4508 = _4496 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _277 = _4508;
    }
    float _4510 = _277;
    if (_4410)
    {
        float _4512 = _4398 * _4502;
        _4490 = _4512;
    }
    float _4514 = _4490;
    if (!_4410)
    {
        _4498 = _4400;
    }
    float _4516 = _4498;
    float _4518 = _4516;
    if (_4410)
    {
        float _4520 = _4400 * _4502;
        _4518 = _4520;
    }
    float _4522 = _4518;
    if (!_4410)
    {
        _4434 = _4402;
    }
    float _4524 = _4434;
    float _4526 = _4524;
    if (_4410)
    {
        float _4528 = fma(_4470, _4464, _4510);
        _4506 = _4528;
    }
    float _4530 = _4506;
    if (_4410)
    {
        float _4532 = _4514 * _4514;
        _4526 = _4532;
    }
    float _4534 = _4526;
    if (!_4410)
    {
        _4492 = _4404;
    }
    float _4536 = _4492;
    float _4538 = _4536;
    if (_4410)
    {
        float _4540 = _4522 * _4522;
        _4538 = _4540;
    }
    float _4542 = _4538;
    float _4544 = fma(_4530, _4530, _4534);
    float _4546 = _4366 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4548 = _4544 + _4542;
    float _4550 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4552 = fma(_4394, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4550);
    float _4554 = precise::clamp(_4552, 0.0, 1.0);
    float _4556 = fma(_4368, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4476);
    float _4558 = _4366 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4560 = rsqrt(_4548);
    float _4562 = _4366 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4564 = -_4554;
    float _4566 = _4564 + 1.0;
    float _4568 = fma(_4368, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4558);
    float _4570 = fma(_4370, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4556);
    float _4572 = fma(_4368, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4562);
    float _4574 = fma(_4368, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4546);
    float _4576 = fma(_4370, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4568);
    float _4578 = abs(_4566);
    float _4580 = log2(_4578);
    float _4582 = fma(_4370, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4572);
    float _4584 = _4570 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4586 = _4576 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4588 = fma(_4370, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4574);
    float _4590 = _4582 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4592 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4594 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4596 = _4560 * _4514;
    float _4598 = _4560 * _4530;
    float _4600 = _4560 * _4522;
    float _4602 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4594);
    float _4604 = _4596 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4606 = _4584 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4608 = _4588 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4610 = fma(_4584, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4602);
    float _4612 = -_4604;
    float _4614 = fma(_4598, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4612);
    float _4616 = -_4606;
    float _4618 = fma(_4616, _4592, 1.0);
    float _4620 = _4580 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4622 = fma(_4608, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4610);
    float _4624 = -_4600;
    float _4626 = fma(_4624, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4614);
    float _4628 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4630 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4632 = log2(_4618);
    float _4634 = fma(_4626, -0.5, 0.5);
    float _4636 = fma(_4626, 0.5, 0.5);
    float _4638 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4628);
    float _4640 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4630);
    float _4642 = _4598 + 1.0;
    float _4644 = fma(_4636, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4646 = fma(_4584, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4638);
    float _4648 = exp2(_4620);
    float _4650 = fma(_4584, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4640);
    float _4652 = fma(_4636, _4644, -0.212114393711090087890625);
    float _4654 = fma(_4608, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4646);
    float _4656 = fma(_4608, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4650);
    float _4658 = fma(_4636, _4652, 1.570728778839111328125);
    float _4660 = 1.0 / _4622;
    float _4662 = _4632 * 0.693147182464599609375;
    float _4664 = sqrt(_4634);
    float _4666 = -_4598;
    float _4668 = fma(_4648, _4642, _4666);
    float _4670 = fma(_4668, 0.5, 0.5);
    float _4672 = _4654 * _4660;
    float _4674 = _4656 * _4660;
    float _4676 = _4662 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4678 = fma(_4672, 0.5, 0.5);
    float _4680 = fma(_4674, -0.5, 0.5);
    float _4682 = _4664 * 0.636619746685028076171875;
    float _4684 = -_4658;
    float _4686 = fma(_4682, _4684, 1.0);
    float3 _11645 = float3(_4678, _4680, _4676);
    float _4688 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11645, float3(0.0), isnan(_11645)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11645, float3(0.0), isnan(_11645)), level(0.0)).x;
    float3 _11656 = float3(_4678, _4680, _4676);
    float4 _4691 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11656, float3(0.0), isnan(_11656)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11656, float3(0.0), isnan(_11656)), level(0.0)).xyzw;
    float _4693 = _4691.x;
    float _4695 = _4691.y;
    float _4697 = _4691.z;
    float _4699 = _4691.w;
    float2 _11673 = float2(_4686, _4670);
    float3 _4703 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11673, float2(0.0), isnan(_11673)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11673, float2(0.0), isnan(_11673)), level(0.0)).xyz;
    float _4705 = _4703.x;
    float _4707 = _4703.y;
    float _4709 = _4703.z;
    float _4711 = _2764 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4713 = _4580 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4715 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4717 = fma(_2760, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4711);
    float _4719 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4715);
    float _4721 = exp2(_4713);
    float _4723 = fma(_2762, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4717);
    float _4725 = _2764 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4727 = _4723 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4729 = fma(_2760, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4725);
    float _4731 = 1.0 / _4727;
    bool _4733 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4735 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4737 = _4733 || _4735;
    bool _4739 = isnan(0.5);
    bool _4741 = _4737 || _4739;
    float _4743 = fma(_2762, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4729);
    float _4745 = fma(_4584, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4719);
    float _4747 = _4743 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4749 = fma(_4608, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4745);
    float _4751 = _4747 + _4727;
    float _4753 = _4590;
    if (_4741)
    {
        _4753 = 1.0;
    }
    float _4755 = _4753;
    float _4757 = _4751 * _4731;
    float _4759 = _4757 * 0.5;
    float _4761 = _4755;
    if (!_4741)
    {
        float _4763 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4765 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _4767 = fma(_4759, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4765);
        float _4769 = _4763 * 0.15915493667125701904296875;
        float _4771 = _4769 * 6.283185482025146484375;
        float _4773 = cos(_4771);
        float _4775 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4777 = _4775 * 0.15915493667125701904296875;
        float _4779 = _4769 * 6.283185482025146484375;
        float _4781 = sin(_4779);
        float _4783 = 1.0 / _4773;
        float _4785 = _4777 * 6.283185482025146484375;
        float _4787 = cos(_4785);
        float _4789 = _4781 * _4783;
        float _4791 = 1.0 / _4767;
        float _4793 = _4787 * _4789;
        float _4795 = _4777 * 6.283185482025146484375;
        float _4797 = sin(_4795);
        float _4799 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4801 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4799;
        float _4803 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _4805 = _4791 * _4803;
        float _4807 = 1.0 / _4793;
        float _4809 = 1.0 / _4801;
        float _4811 = _4797 * _4807;
        float _4813 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4815 = fma(_4811, _4805, _4813);
        float _4817 = _4815 * _4809;
        float _4819 = precise::clamp(_4817, 0.0, 1.0);
        _4761 = _4819;
    }
    float _4821 = _4761;
    float _4823 = -_4721;
    float _4825 = _4823 + 1.0;
    float _4827 = _4749 + _4622;
    bool _4829 = _4821 > 0.0;
    bool _4831 = isnan(_4821);
    bool _4833 = _4829 || _4831;
    bool _4835 = isnan(0.0);
    bool _4837 = _4833 || _4835;
    float _4839 = _4821 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4841 = _4825 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4843 = _4827 * 0.5;
    float _4845 = _4841 * _4688;
    float _4847 = -_4841;
    float _4849 = _4847 + 1.0;
    out.gl_Position.x = _4654;
    out.gl_Position.y = _4656;
    out.gl_Position.z = _4749;
    out.gl_Position.w = _4622;
    float _4851 = _4839 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4853 = _4699 * _4845;
    float _4855 = _4709 * _4845;
    out.m_86.x = _4368;
    out.m_86.y = _4366;
    out.m_86.z = _4370;
    float _4857 = fma(_4705, _4853, _4693);
    float _4859 = fma(_4707, _4853, _4695);
    float _4861 = _4699 * _4849;
    float _4863 = fma(_4699, _4855, _4697);
    out.m_88.z = _4843;
    out.m_88.w = _4622;
    out.m_51.x = _4851;
    out.m_90.x = _4857;
    out.m_90.y = _4859;
    out.m_90.z = _4863;
    out.m_90.w = _4861;
    if (_4837)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _4865 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4865;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4046 = false;
    bool _969 = false;
    bool _755 = false;
    bool _619 = false;
    bool _515 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_44.w;
    float _106 = in.m_46.w;
    float _108 = trunc(_104);
    int _111 = int(_108);
    float _113 = -_106;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _115;
    bool _119 = _111 >= 1;
    float _121 = 0.0;
    float _123 = as_type<float>(_111);
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _121;
    if (!_119)
    {
        out.m_51.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _125 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4933 = as_type<float>(_131);
        out.gl_Position.z = _4933;
    }
    if (!_119)
    {
        return out;
    }
    bool _135 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_106);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = float(_111);
    bool _147 = _115 >= _145;
    bool _149 = !_143;
    bool _151 = _147 || _149;
    if (_151)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _123;
    if (_151)
    {
        out.m_51.x = 0.0;
    }
    if (_151)
    {
        float _155 = _153 * 5.0;
        _133 = as_type<int>(_155);
    }
    int _157 = _133;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4988 = as_type<float>(_157);
        out.gl_Position.z = _4988;
    }
    if (_151)
    {
        return out;
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _163 = in.m_56.w;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = in.m_46.x;
    float _177 = in.m_46.y;
    float _179 = in.m_46.z;
    int _181 = int(_151);
    int _183 = false ? 2 : 0;
    int _185 = _181 | _183;
    int _187 = _173 ? 4 : 0;
    int _189 = _185 | _187;
    int _191 = false ? 8 : 0;
    int _193 = _189 | _191;
    int _195 = false ? 16 : 0;
    int _197 = _193 | _195;
    int _199 = false ? 32 : 0;
    int _201 = _197 | _199;
    int _203 = false ? 64 : 0;
    int _205 = _201 | _203;
    int _207 = _205 & 4;
    float _209 = in.m_44.x;
    float _211 = in.m_44.y;
    float _213 = in.m_44.z;
    float _215 = in.m_58.x;
    float _217 = in.m_58.y;
    float _219 = in.m_58.z;
    float _221 = as_type<float>(_207);
    float _223 = _161;
    if (!_173)
    {
        float _225 = _161 * _161;
        float _227 = _225 * 0.5;
        _221 = _227;
    }
    float _229 = _221;
    float _231 = in.m_60.x;
    float _233 = in.m_60.y;
    float _235 = in.m_60.z;
    float _237 = _229;
    if (!_173)
    {
        float _239 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _237 = _239;
    }
    float _241 = _237;
    float _243 = in.m_62.x;
    float _245 = in.m_62.y;
    float _247 = in.m_62.z;
    int _249 = as_type<int>(_159) & 1;
    bool _251 = _249 != 0;
    int _253 = as_type<int>(_159) & 2;
    bool _255 = _253 != 0;
    bool _257 = !_251;
    float _259 = _257 ? (-0.5) : 0.5;
    bool _261 = !_255;
    float _263 = _261 ? (-0.5) : 0.5;
    bool _265 = !_173;
    float _267 = _241;
    float _269 = 0.0;
    float _271 = 0.0;
    float _273 = _217;
    float _275 = _243;
    float _277 = _219;
    if (!_265)
    {
        float _279 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _281 = log2(_279);
        float _283 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _285 = _283 + 1.0;
        float _287 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _289 = _161 * _281;
        float _291 = 1.0 / _285;
        float _293 = _287 * 0.693147182464599609375;
        float _295 = exp2(_289);
        float _297 = 1.0 / _293;
        float _299 = _295 + (-1.0);
        float _301 = -_299;
        float _303 = fma(_301, _297, _161);
        float _305 = _303 * _291;
        float _307 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _267 = _307;
        _269 = _291;
        _271 = _297;
    }
    float _309 = _267;
    float _311 = _269;
    float _313 = _271;
    bool _315 = !_173;
    float _317 = _313;
    float _319 = _311;
    float _321 = _309;
    if (!_315)
    {
        float _323 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _325 = log2(_323);
        float _327 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _329 = _327 + 1.0;
        float _331 = 1.0 / _329;
        float _333 = _161 * _325;
        float _335 = exp2(_333);
        float _337 = -_335;
        float _339 = _337 + 1.0;
        float _341 = _339 * _331;
        _223 = _341;
        _317 = _329;
    }
    float _343 = _223;
    float _345 = _317;
    float _347 = _345;
    if (!_173)
    {
        float _349 = _115 * _115;
        float _351 = _349 * 0.5;
        _319 = _351;
    }
    float _353 = _319;
    float _355 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _357 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _359 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_173)
    {
        _347 = _115;
    }
    float _361 = _347;
    float _363 = fma(_343, _175, _355);
    float _365 = fma(_343, _177, _357);
    float _367 = _361;
    if (!_173)
    {
        float _369 = _353 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _321 = _369;
    }
    float _371 = _321;
    bool _373 = !_173;
    float _375 = _371;
    if (!_373)
    {
        float _377 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _379 = log2(_377);
        float _381 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _383 = _381 + 1.0;
        float _385 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _387 = _115 * _379;
        float _389 = 1.0 / _383;
        float _391 = _385 * 0.693147182464599609375;
        float _393 = exp2(_387);
        float _395 = 1.0 / _391;
        float _397 = _393 + (-1.0);
        float _399 = -_397;
        float _401 = fma(_399, _395, _115);
        float _403 = _401 * _389;
        float _405 = _403 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _375 = _405;
    }
    float _407 = _375;
    bool _409 = !_173;
    if (!_409)
    {
        float _411 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _413 = log2(_411);
        float _415 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _417 = _415 + 1.0;
        float _419 = 1.0 / _417;
        float _421 = _115 * _413;
        float _423 = exp2(_421);
        float _425 = -_423;
        float _427 = _425 + 1.0;
        float _429 = _427 * _419;
        _367 = _429;
    }
    float _431 = _367;
    float _433 = _407 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _435 = _407 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _437 = _407 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _439 = fma(_343, _179, _359);
    float _441 = fma(_431, _175, _433);
    float _443 = fma(_431, _177, _435);
    float _445 = 1.0 / _145;
    bool _447 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _449 = fma(_365, _163, _211);
    float _451 = -_443;
    float _453 = _365 + _451;
    float _455 = fma(_431, _179, _437);
    float _457 = fma(_363, _163, _209);
    float _459 = -_441;
    float _461 = _363 + _459;
    float _463 = _453 * _217;
    float _465 = _453 * _233;
    float _467 = _453 * _245;
    float _469 = -_455;
    float _471 = _439 + _469;
    float _473 = fma(_461, _215, _463);
    float _475 = fma(_461, _231, _465);
    float _477 = fma(_461, _243, _467);
    float _479 = fma(_439, _163, _213);
    float _481 = fma(_471, _219, _473);
    float _483 = fma(_471, _235, _475);
    float _485 = fma(_471, _247, _477);
    float _487 = _115 * _445;
    bool _489 = !_447;
    float _491 = _483;
    float _493 = _481;
    float _495 = _485;
    float _513;
    if (!_489)
    {
        float _497 = in.m_64.x;
        float _499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _501 = _497 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _503 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _505 = _503 * _499;
        float _507 = floor(_505);
        float _509 = -_507;
        float _511 = _505 + _509;
        _513 = _511;
        _515 = true;
    }
    else
    {
        _513 = _487;
    }
    _515 = false;
    float _517 = _513;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _521 = _517 + _519;
    float _523 = in.m_56.x;
    float _525 = in.m_56.y;
    bool _527 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _529 = isnan(_517);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _539;
    bool _543 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _545 = isnan(_517);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = -_537;
    float _557 = _555 + 1.0;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _559;
    float _563 = 1.0 / _541;
    bool _565 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _567 = _553 * _557;
    float _569 = -_553;
    float _571 = _569 + 1.0;
    float _573 = _521 * _563;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _575;
    float _579 = fma(_561, _573, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _581 = fma(_577, _573, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _583 = _579 * _567;
    float _585 = _581 * _567;
    float _587 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[143].x, _583);
    float _589 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[143].y, _585);
    float _591 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[144].x, _587);
    float _593 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[144].y, _589);
    float _595 = _591 * _523;
    float _597 = _593 * _525;
    bool _599 = !_565;
    float _617;
    if (!_599)
    {
        float _601 = in.m_64.x;
        float _603 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _605 = _601 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _607 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[11].y, _115);
        float _609 = _607 * _603;
        float _611 = floor(_609);
        float _613 = -_611;
        float _615 = _609 + _613;
        _617 = _615;
        _619 = true;
    }
    else
    {
        _617 = _487;
    }
    _619 = false;
    float _621 = _617;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _625 = _621 + _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _631 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _633 = isnan(_621);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _645 = _643 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _647 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _649 = isnan(_621);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _659;
    bool _663 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _665 = isnan(_621);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = 1.0 / _629;
    float _677 = -_641;
    float _679 = _677 + 1.0;
    bool _681 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _683 = _657 * _679;
    float _685 = -_657;
    float _687 = _685 + 1.0;
    float _689 = 1.0 / _645;
    float _691 = _661 * _675;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _697 = fma(_691, _625, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _699 = -_673;
    float _701 = _699 + 1.0;
    float _703 = _697 * _683;
    float _705 = _695 * _689;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _709 = _621 + _707;
    float _711 = _641 * _701;
    float _713 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[115].x, _703);
    float _715 = fma(_705, _709, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _717 = fma(_715, _711, _713);
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _725 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[117].x, _717);
    float _727 = _719 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _729 = _721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _731 = _723 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _733 = _725 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _727;
    out.m_66.y = _729;
    out.m_66.z = _731;
    out.m_66.w = _733;
    bool _735 = !_681;
    float _753;
    if (!_735)
    {
        float _737 = in.m_64.x;
        float _739 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _741 = _737 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _743 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[11].w, _115);
        float _745 = _743 * _739;
        float _747 = floor(_745);
        float _749 = -_747;
        float _751 = _745 + _749;
        _753 = _751;
        _755 = true;
    }
    else
    {
        _753 = _487;
    }
    _755 = false;
    float _757 = _753;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _761 = _757 + _759;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _771;
    bool _775 = _757 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _777 = isnan(_757);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = 1.0 / _765;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _797 = _757 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _799 = isnan(_757);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    bool _809 = _757 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _811 = isnan(_757);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _817 = _813 || _815;
    float _819 = float(_817);
    float _821 = 1.0 / _769;
    bool _823 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _825 = _773 * _787;
    bool _827 = _757 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _829 = isnan(_757);
    bool _831 = _827 || _829;
    bool _833 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _835 = _831 || _833;
    float _837 = float(_835);
    float _839 = 1.0 / _791;
    float _841 = -_785;
    float _843 = _841 + 1.0;
    float _845 = fma(_825, _761, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _847 = -_837;
    float _849 = _847 + 1.0;
    float _851 = _837 * _843;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _855 = _853 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _857;
    float _861 = 1.0 / _795;
    float _863 = -_807;
    float _865 = _863 + 1.0;
    float _867 = _819 * _849;
    float _869 = _855 * _821;
    float _871 = -_819;
    float _873 = _871 + 1.0;
    float _875 = _785 * _865;
    float _877 = _845 * _867;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _881 = _757 + _879;
    float _883 = _859 * _839;
    bool _885 = _757 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _887 = isnan(_757);
    bool _889 = _885 || _887;
    bool _891 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _893 = _889 || _891;
    float _895 = float(_893);
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _899 = _897 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _903 = _757 + _901;
    float _905 = fma(_869, _881, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _907 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[131].x, _877);
    float _909 = -_895;
    float _911 = _909 + 1.0;
    float _913 = fma(_883, _903, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _915 = _899 * _861;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _919 = _757 + _917;
    float _921 = fma(_905, _851, _907);
    float _923 = _807 * _911;
    float _925 = fma(_915, _919, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _927 = fma(_913, _875, _921);
    float _929 = fma(_925, _923, _927);
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _937 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[135].x, _929);
    float _939 = _931 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _941 = _933 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _943 = _935 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _945 = _937 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_68.x = _939;
    out.m_68.y = _941;
    out.m_68.z = _943;
    out.m_68.w = _945;
    bool _947 = !_823;
    float _949 = _807;
    float _967;
    if (!_947)
    {
        float _951 = in.m_64.x;
        float _953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _955 = _951 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _957 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[14].x, _115);
        float _959 = _957 * _953;
        float _961 = floor(_959);
        float _963 = -_961;
        float _965 = _959 + _963;
        _967 = _965;
        _969 = true;
    }
    else
    {
        _967 = _487;
    }
    _969 = false;
    float _971 = _967;
    float _973 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _975 = int(_973);
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _979 = _977 != 0;
    float _981 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _983 = int(_981);
    float _985 = 0.0;
    int _987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_979)
    {
        _985 = 1.0;
    }
    float _989 = _985;
    float _991 = float(_975);
    float _993 = 0.0;
    float _995 = _989;
    if (_979)
    {
        _993 = 1.0;
    }
    float _997 = _993;
    float _999 = 0.0;
    float _1001 = _997;
    if (_979)
    {
        _999 = 1.0;
    }
    float _1003 = _999;
    int _1005 = 0;
    float _1007 = _1003;
    if (_979)
    {
        _1005 = 0;
    }
    int _1009 = _1005;
    float _1011 = 1.0 / _991;
    float _1013 = _875;
    int _1015 = _1009;
    if (_979)
    {
        float _1017 = in.m_64.x;
        _1013 = _1017;
    }
    float _1019 = _1013;
    float _1021 = float(uint(_983));
    if (_979)
    {
        _987 = 0;
    }
    int _1023 = _987;
    float _1025 = 1.0 / _1021;
    float _1027 = _115 * _1011;
    int _1029 = ~_983;
    int _1031 = _1029 + 1;
    float _1033 = trunc(_1027);
    int _1035 = int(_1033);
    int _1037 = as_type<int>(_1025) + (-2);
    float _1039 = _1019;
    int _1041 = _1023;
    if (_979)
    {
        _949 = _1019;
    }
    float _1043 = _949;
    float _1045 = float(uint(_1035));
    float _1047 = as_type<float>(_1037) * _1045;
    float _1049 = trunc(_1047);
    float _1051 = precise::max(_1049, 0.0);
    uint _1054 = uint(_1051);
    int _1056 = ~_983;
    int _1058 = _1056 + 1;
    int _1060 = _1031 * int(_1054);
    int _1062 = _1060 + _1035;
    float _1064 = float(uint(_1062));
    float _1066 = as_type<float>(_1037) * _1064;
    float _1068 = in.m_64.x;
    float _1070 = in.m_64.y;
    float _1072 = in.m_64.z;
    float _1074 = in.m_64.w;
    float _1076 = trunc(_1066);
    float _1078 = precise::max(_1076, 0.0);
    uint _1080 = uint(_1078);
    int _1082 = int(_1054) + int(_1080);
    float _1084 = _1043;
    if (!_979)
    {
        float _1086 = in.m_64.y;
        float _1088 = in.m_64.z;
        _995 = 7.345489978790283203125;
        _1084 = _1088;
        _1007 = 5.839270114898681640625;
        _1015 = 1;
        _1039 = _1086;
        _1001 = 1.2345600128173828125;
        _1041 = 2;
    }
    float _1090 = _995;
    float _1092 = _1084;
    float _1094 = _1007;
    int _1096 = _1015;
    float _1098 = _1039;
    float _1100 = _1001;
    int _1102 = _1041;
    float _1104 = float(_983);
    float _1106 = _1068 * _1090;
    float _1108 = float(_1035);
    int _1110 = _1058 * _1082;
    int _1112 = _1110 + _1035;
    float _1114 = floor(_1106);
    bool _1116 = _1108 >= _1104;
    bool _1118 = isnan(_1108);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan(_1104);
    bool _1124 = _1120 || _1122;
    float _1126 = float(_1124);
    float _1128 = _1092 * _1094;
    bool _1130 = uint(_1112) >= uint(_983);
    bool _1132 = _1096 != 1;
    bool _1134 = _1070 > 0.5;
    float _1136 = _1072 * 2.0;
    bool _1138 = _1072 > 0.5;
    float _1140 = trunc(_1126);
    int _1142 = int(_1140);
    int _1144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1146 = _1144 != 0;
    float _1148 = _597 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1150 = !_1130;
    int _1152 = _1150 ? 0 : (-1);
    float _1154 = _595 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1158 = _1156 != 0;
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1162 = _1160 != 0;
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1166 = _1164 != 0;
    float _1168 = _1068 + _1070;
    float _1170 = -_259;
    int _1172 = _1134 ? as_type<int>(_1170) : as_type<int>(_259);
    float _1174 = -_1114;
    float _1176 = _1106 + _1174;
    float _1178 = -_263;
    int _1180 = _1138 ? as_type<int>(_1178) : as_type<int>(_263);
    float _1182 = floor(_1136);
    int _1184 = ~_1082;
    int _1186 = _1184 + _1152;
    int _1188 = _1186 + 1;
    float _1190 = _1176 * _1104;
    float _1192 = _487 * _1104;
    bool _1194 = !_1162;
    float _1196 = _1194 ? _259 : as_type<float>(_1172);
    float _1198 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1200 = int(_1146);
    int _1202 = _1130 ? 2 : 0;
    int _1204 = _1200 | _1202;
    int _1206 = _1138 ? 4 : 0;
    int _1208 = _1204 | _1206;
    int _1210 = _1158 ? 8 : 0;
    int _1212 = _1208 | _1210;
    int _1214 = _1162 ? 16 : 0;
    int _1216 = _1212 | _1214;
    int _1218 = _1166 ? 32 : 0;
    int _1220 = _1216 | _1218;
    int _1222 = _1134 ? 64 : 0;
    int _1224 = _1220 | _1222;
    int _1226 = _1224 & 64;
    float _1228 = trunc(_1190);
    int _1230 = int(_1228);
    bool _1232 = !_1166;
    float _1234 = _1232 ? _263 : as_type<float>(_1180);
    int _1236 = _983 * _1188;
    int _1238 = _1236 + _1035;
    int _1240 = int(_1146);
    int _1242 = _1130 ? 2 : 0;
    int _1244 = _1240 | _1242;
    int _1246 = _1138 ? 4 : 0;
    int _1248 = _1244 | _1246;
    int _1250 = _1158 ? 8 : 0;
    int _1252 = _1248 | _1250;
    int _1254 = _1162 ? 16 : 0;
    int _1256 = _1252 | _1254;
    int _1258 = _1166 ? 32 : 0;
    int _1260 = _1256 | _1258;
    int _1262 = _1134 ? 64 : 0;
    int _1264 = _1260 | _1262;
    int _1266 = _1264 & 4;
    float _1268 = _1070 + _1072;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1272 = _1270 != 0;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1276 = _1274 != 0;
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1280 = _1278 != 0;
    float _1282 = _1068 + _1072;
    bool _1284 = _983 == 0;
    float _1286 = trunc(_1192);
    int _1288 = int(_1286);
    int _1290 = ~_1142;
    int _1292 = _1290 + 1;
    int _1294 = _1292 + 1;
    float _1296 = _1168 + (-1.0);
    bool _1298 = !_1284;
    int _1300 = _1298 ? _1238 : (-1);
    float _1302 = _1268 + (-1.0);
    float _1304 = _1282 + (-1.0);
    int _1306 = _983 + (-1);
    int _1308 = _1300 * _1294;
    bool _1310 = !_1276;
    int _1312 = _1310 ? 0 : 1;
    bool _1314 = !_1146;
    int _1316 = _1314 ? 0 : 1;
    int _1318 = _1142 * _1306;
    int _1320 = _1318 + _1308;
    bool _1322 = !_1272;
    int _1324 = _1322 ? 0 : 1;
    int _1326 = abs(_1312);
    int _1328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1330 = _1328 != 0;
    int _1332 = abs(_1316);
    int _1334 = _1320 * _1326;
    bool _1336 = !_1280;
    int _1338 = _1336 ? 0 : 1;
    int _1340 = abs(_1324);
    int _1342 = _1230 * _1332;
    int _1344 = _1342 + _1035;
    bool _1346 = !_1330;
    int _1348 = _1346 ? 0 : 1;
    int _1350 = abs(_1338);
    int _1352 = abs(_1348);
    int _1354 = _1288 * _1340;
    int _1356 = _1354 + _1334;
    int _1358 = ~_983;
    int _1360 = _1358 + 1;
    int _1362 = _1344 * _1350;
    int _1364 = _1362 + _1356;
    bool _1366 = _1074 > 0.5;
    float _1368 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1370 = int(_1368);
    int _1372 = ~_983;
    int _1374 = _1372 + 1;
    int _1376 = _1230 * _1352;
    int _1378 = _1376 + _1364;
    int _1380 = ~_983;
    int _1382 = _1380 + 1;
    float _1384 = -_263;
    int _1386 = _1366 ? as_type<int>(_1384) : as_type<int>(_263);
    float _1388 = float(uint(_1378));
    bool _1390 = !_1158;
    float _1392 = _1390 ? _263 : as_type<float>(_1386);
    float _1394 = as_type<float>(_1037) * _1388;
    float _1396 = trunc(_1394);
    float _1398 = precise::max(_1396, 0.0);
    uint _1400 = uint(_1398);
    float _1402 = float(_1370);
    float _1404 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1406 = 1.0 + _1404;
    float _1408 = 1.0 / _1406;
    float _1410 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1412 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1414 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1412;
    int _1416 = _1382 * int(_1400);
    int _1418 = _1416 + _1378;
    float _1420 = _449 * _245;
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1424 = _1422 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1426 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1428 = fma(_457, _243, _1420);
    float _1430 = float(uint(_1418));
    float _1432 = fma(_1302, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1434 = as_type<float>(_1037) * _1430;
    float _1436 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1438 = trunc(_1434);
    float _1440 = precise::max(_1438, 0.0);
    uint _1442 = uint(_1440);
    int _1444 = int(_1400) + int(_1442);
    float _1446 = 1.0 / _1402;
    int _1448 = _1360 * _1444;
    int _1450 = _1448 + _1378;
    bool _1452 = uint(_1450) >= uint(_983);
    bool _1454 = !_1452;
    int _1456 = _1454 ? 0 : (-1);
    int _1458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1460 = _1458 != 0;
    int _1462 = ~_1444;
    int _1464 = _1462 + _1456;
    int _1466 = _1464 + 1;
    float _1468 = _115 * _1446;
    bool _1470 = !_1460;
    int _1472 = _1470 ? 0 : 1;
    int _1474 = _983 * _1466;
    int _1476 = _1474 + _1378;
    float _1478 = trunc(_1468);
    int _1480 = int(_1478);
    int _1482 = abs(_1472);
    bool _1484 = !_1284;
    int _1486 = _1484 ? _1476 : (-1);
    int _1488 = _1486 & 3;
    bool _1490 = _1488 != 0;
    int _1492 = _1490 ? 0 : 1;
    int _1494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1496 = _1494 != 0;
    int _1498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1500 = _1498 != 0;
    int _1502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1504 = _1502 != 0;
    int _1506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1508 = _1506 != 0;
    int _1510 = _1486 & 3;
    bool _1512 = _1510 != 0;
    int _1514 = ~_1492;
    int _1516 = _1514 + 1;
    int _1518 = _1516 + 1;
    bool _1520 = !_1500;
    int _1522 = _1520 ? 0 : 1;
    bool _1524 = uint(_1510) > 1u;
    float _1526 = float(uint(_1480));
    int _1528 = int(_1496);
    int _1530 = _1524 ? 2 : 0;
    int _1532 = _1528 | _1530;
    int _1534 = _1504 ? 4 : 0;
    int _1536 = _1532 | _1534;
    int _1538 = _1508 ? 8 : 0;
    int _1540 = _1536 | _1538;
    int _1542 = _1512 ? 16 : 0;
    int _1544 = _1540 | _1542;
    int _1546 = _1276 ? 32 : 0;
    int _1548 = _1544 | _1546;
    int _1550 = _1280 ? 64 : 0;
    int _1552 = _1548 | _1550;
    int _1554 = _1552 & 16;
    int _1556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1558 = _1556 != 0;
    int _1560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1562 = _1560 != 0;
    int _1564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1566 = _1564 != 0;
    bool _1568 = !_1496;
    int _1570 = _1568 ? 0 : 1;
    float _1572 = float(_1480);
    bool _1574 = !_1562;
    int _1576 = _1574 ? 0 : 1;
    int _1578 = _1518;
    float _1580 = _1234;
    if (!_1524)
    {
        int _1582 = ~_1492;
        int _1584 = _1582 + 1;
        _1578 = _1584;
    }
    int _1586 = _1578;
    float _1588 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1590 = int(_1588);
    bool _1592 = _1266 != 0;
    bool _1594 = !_1504;
    int _1596 = _1594 ? 0 : 1;
    int _1598 = abs(_1522);
    int _1600 = abs(_1596);
    bool _1602 = !_1508;
    int _1604 = _1602 ? 0 : 1;
    int _1606 = abs(_1576);
    int _1608 = abs(_1604);
    float _1610 = float(uint(_1590));
    int _1612 = ~_1590;
    int _1614 = _1612 + 1;
    float _1616 = 1.0 / _1610;
    int _1618 = ~_1590;
    int _1620 = _1618 + 1;
    float _1622 = float(_1590);
    bool _1624 = _1590 == 0;
    bool _1626 = _1572 >= _1622;
    bool _1628 = isnan(_1572);
    bool _1630 = _1626 || _1628;
    bool _1632 = isnan(_1622);
    bool _1634 = _1630 || _1632;
    float _1636 = float(_1634);
    float _1638 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1640 = int(_1638);
    int _1642 = as_type<int>(_1616) + (-2);
    float _1644 = trunc(_1636);
    int _1646 = int(_1644);
    float _1648 = as_type<float>(_1642) * _1526;
    int _1650 = ~_1640;
    int _1652 = _1650 + 1;
    float _1654 = trunc(_1648);
    float _1656 = precise::max(_1654, 0.0);
    uint _1658 = uint(_1656);
    int _1660 = _1614 * int(_1658);
    int _1662 = _1660 + _1480;
    float _1664 = float(uint(_1662));
    float _1666 = as_type<float>(_1642) * _1664;
    float _1668 = trunc(_1666);
    float _1670 = precise::max(_1668, 0.0);
    uint _1672 = uint(_1670);
    int _1674 = int(_1658) + int(_1672);
    float _1676 = float(uint(_1640));
    int _1678 = _1620 * _1674;
    int _1680 = _1678 + _1480;
    float _1682 = 1.0 / _1676;
    bool _1684 = uint(_1680) >= uint(_1590);
    bool _1686 = !_1684;
    int _1688 = _1686 ? 0 : (-1);
    float _1690 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1692 = int(_1690);
    int _1694 = ~_1674;
    int _1696 = _1694 + _1688;
    int _1698 = _1696 + 1;
    int _1700 = as_type<int>(_1682) + (-2);
    int _1702 = ~_1640;
    int _1704 = _1702 + 1;
    float _1706 = float(_1692);
    float _1708 = 1.0 / _1706;
    float _1710 = _115 * _1708;
    float _1712 = trunc(_1710);
    int _1714 = int(_1712);
    float _1716 = float(uint(_1714));
    float _1718 = as_type<float>(_1700) * _1716;
    float _1720 = trunc(_1718);
    float _1722 = precise::max(_1720, 0.0);
    uint _1724 = uint(_1722);
    int _1726 = _1652 * int(_1724);
    int _1728 = _1726 + _1714;
    float _1730 = float(uint(_1728));
    float _1732 = as_type<float>(_1700) * _1730;
    float _1734 = trunc(_1732);
    float _1736 = precise::max(_1734, 0.0);
    uint _1738 = uint(_1736);
    int _1740 = int(_1724) + int(_1738);
    float _1742 = _1098 * _1100;
    bool _1744 = !_1558;
    int _1746 = _1744 ? 0 : 1;
    bool _1748 = _1226 != 0;
    float _1750 = floor(_1742);
    int _1752 = ~_1646;
    int _1754 = _1752 + 1;
    int _1756 = _1754 + 1;
    int _1758 = _1704 * _1740;
    int _1760 = _1758 + _1714;
    int _1762 = abs(_1746);
    bool _1764 = uint(_1760) >= uint(_1640);
    bool _1766 = !_1764;
    int _1768 = _1766 ? 0 : (-1);
    int _1770 = ~_1740;
    int _1772 = _1770 + _1768;
    int _1774 = _1772 + 1;
    float _1776 = -_1750;
    float _1778 = _1742 + _1776;
    int _1780 = _1590 + (-1);
    float _1782 = _1778 * _1622;
    int _1784 = _1590 * _1698;
    int _1786 = _1784 + _1480;
    float _1788 = _487 * _1622;
    bool _1790 = !_1624;
    int _1792 = _1790 ? _1786 : (-1);
    float _1794 = trunc(_1782);
    int _1796 = int(_1794);
    int _1798 = _1792 * _1756;
    float _1800 = _1070 * 2.0;
    float _1802 = trunc(_1788);
    int _1804 = int(_1802);
    int _1806 = _1646 * _1780;
    int _1808 = _1806 + _1798;
    int _1810 = abs(_1570);
    int _1812 = _1808 * _1598;
    float _1814 = floor(_1800);
    int _1816 = _1796 * _1482;
    int _1818 = _1816 + _1480;
    int _1820 = ~_1590;
    int _1822 = _1820 + 1;
    int _1824 = _1804 * _1810;
    int _1826 = _1824 + _1812;
    bool _1828 = !_1566;
    int _1830 = _1828 ? 0 : 1;
    int _1832 = _1818 * _1600;
    int _1834 = _1832 + _1826;
    int _1836 = ~_1590;
    int _1838 = _1836 + 1;
    int _1840 = abs(_1830);
    int _1842 = _1796 * _1608;
    int _1844 = _1842 + _1834;
    float _1846 = float(uint(_1844));
    float _1848 = as_type<float>(_1642) * _1846;
    float _1850 = trunc(_1848);
    float _1852 = precise::max(_1850, 0.0);
    uint _1854 = uint(_1852);
    float _1856 = floor(_1128);
    int _1858 = _1838 * int(_1854);
    int _1860 = _1858 + _1844;
    float _1862 = float(uint(_1860));
    float _1864 = as_type<float>(_1642) * _1862;
    float _1866 = trunc(_1864);
    float _1868 = precise::max(_1866, 0.0);
    uint _1870 = uint(_1868);
    int _1872 = int(_1854) + int(_1870);
    float _1874 = _1068 * 2.0;
    int _1876 = _1822 * _1872;
    int _1878 = _1876 + _1844;
    float _1880 = floor(_1874);
    bool _1882 = uint(_1878) >= uint(_1590);
    float _1884 = float(_1714);
    bool _1886 = !_1882;
    int _1888 = _1886 ? 0 : (-1);
    int _1890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1892 = _1890 != 0;
    int _1894 = ~_1872;
    int _1896 = _1894 + _1888;
    int _1898 = _1896 + 1;
    bool _1900 = !_1892;
    int _1902 = _1900 ? 0 : 1;
    int _1904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1906 = _1904 != 0;
    int _1908 = abs(_1902);
    bool _1910 = !_1906;
    int _1912 = _1910 ? 0 : 1;
    bool _1914 = _1880 >= 0.0;
    bool _1916 = isnan(_1880);
    bool _1918 = _1914 || _1916;
    bool _1920 = isnan(0.0);
    bool _1922 = _1918 || _1920;
    int _1924 = abs(_1912);
    int _1926 = _1922 ? 0 : 1;
    bool _1928 = _1880 > 0.0;
    float _1930 = -_1856;
    float _1932 = _1128 + _1930;
    int _1934 = ~_1926;
    int _1936 = _1934 + 1;
    int _1938 = _1936 + 1;
    int _1940 = _1640 * _1774;
    int _1942 = _1940 + _1714;
    int _1944 = _1938;
    float _1946 = as_type<float>(_1872);
    if (!_1928)
    {
        int _1948 = ~_1926;
        int _1950 = _1948 + 1;
        _1944 = _1950;
    }
    int _1952 = _1944;
    float _1954 = float(_1640);
    bool _1956 = _1814 >= 0.0;
    bool _1958 = isnan(_1814);
    bool _1960 = _1956 || _1958;
    bool _1962 = isnan(0.0);
    bool _1964 = _1960 || _1962;
    bool _1966 = _1884 >= _1954;
    bool _1968 = isnan(_1884);
    bool _1970 = _1966 || _1968;
    bool _1972 = isnan(_1954);
    bool _1974 = _1970 || _1972;
    float _1976 = float(_1974);
    float _1978 = _1932 * _1954;
    float _1980 = _1964 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1982 = _487 * _1954;
    bool _1984 = _1814 > 0.0;
    float _1986 = trunc(_1978);
    int _1988 = int(_1986);
    int _1990 = ~as_type<int>(_1980);
    int _1992 = _1990 + 1;
    int _1994 = _1992 + 1;
    float _1996 = trunc(_1976);
    int _1998 = int(_1996);
    int _2000 = _1994;
    float _2002 = _1980;
    if (!_1984)
    {
        int _2004 = ~as_type<int>(_1980);
        int _2006 = _2004 + 1;
        _2000 = _2006;
    }
    int _2008 = _2000;
    bool _2010 = _1640 == 0;
    float _2012 = trunc(_1982);
    int _2014 = int(_2012);
    bool _2016 = !_2010;
    int _2018 = _2016 ? _1942 : (-1);
    int _2020 = _1640 + (-1);
    int _2022 = ~_1998;
    int _2024 = _2022 + 1;
    int _2026 = _2024 + 1;
    int _2028 = _2018 * _2026;
    int _2030 = ~_1640;
    int _2032 = _2030 + 1;
    int _2034 = _1998 * _2020;
    int _2036 = _2034 + _2028;
    int _2038 = _2036 * _1606;
    int _2040 = _1988 * _1908;
    int _2042 = _2040 + _1714;
    int _2044 = _2014 * _1762;
    int _2046 = _2044 + _2038;
    int _2048 = _2042 * _1840;
    int _2050 = _2048 + _2046;
    float _2052 = -_259;
    int _2054 = _1592 ? as_type<int>(_2052) : as_type<int>(_259);
    int _2056 = _1988 * _1924;
    int _2058 = _2056 + _2050;
    int _2060 = ~_1640;
    int _2062 = _2060 + 1;
    float _2064 = float(uint(_2058));
    float _2066 = as_type<float>(_1700) * _2064;
    float _2068 = trunc(_2066);
    float _2070 = precise::max(_2068, 0.0);
    uint _2072 = uint(_2070);
    int _2074 = _2062 * int(_2072);
    int _2076 = _2074 + _2058;
    float _2078 = float(uint(_2076));
    float _2080 = as_type<float>(_1700) * _2078;
    int _2082 = _1590 * _1898;
    int _2084 = _2082 + _1844;
    float _2086 = trunc(_2080);
    float _2088 = precise::max(_2086, 0.0);
    uint _2090 = uint(_2088);
    bool _2092 = !_1624;
    int _2094 = _2092 ? _2084 : (-1);
    int _2096 = int(_2072) + int(_2090);
    int _2098 = _2032 * _2096;
    int _2100 = _2098 + _2058;
    bool _2102 = uint(_2100) >= uint(_1640);
    bool _2104 = !_2102;
    int _2106 = _2104 ? 0 : (-1);
    int _2108 = _2094 & 3;
    bool _2110 = _2108 != 0;
    int _2112 = ~_2096;
    int _2114 = _2112 + _2106;
    int _2116 = _2114 + 1;
    int _2118 = _2110 ? 0 : 1;
    int _2120 = _1640 * _2116;
    int _2122 = _2120 + _2058;
    int _2124 = ~_2118;
    int _2126 = _2124 + 1;
    int _2128 = _2126 + 1;
    bool _2130 = !_2010;
    int _2132 = _2130 ? _2122 : (-1);
    int _2134 = _2132 & 3;
    bool _2136 = _2134 != 0;
    int _2138 = _2136 ? 0 : 1;
    int _2140 = _2094 & 3;
    bool _2142 = _2140 != 0;
    int _2144 = ~_2138;
    int _2146 = _2144 + 1;
    int _2148 = _2146 + 1;
    bool _2150 = uint(_2140) > 1u;
    int _2152 = _2128;
    int _2154 = _2148;
    if (!_2150)
    {
        int _2156 = ~_2118;
        int _2158 = _2156 + 1;
        _2152 = _2158;
    }
    int _2160 = _2152;
    int _2162 = _2132 & 3;
    bool _2164 = _2162 != 0;
    bool _2166 = uint(_2162) > 1u;
    if (!_2166)
    {
        int _2168 = ~_2138;
        int _2170 = _2168 + 1;
        _2154 = _2170;
    }
    int _2172 = _2154;
    bool _2174 = uint(_1510) >= 2u;
    int _2176 = abs(_2172);
    int _2178 = _2174 ? 0 : 1;
    bool _2180 = uint(_2162) >= 2u;
    int _2182 = ~_2178;
    int _2184 = _2182 + 1;
    int _2186 = _2184 + 1;
    int _2188 = _2180 ? 0 : 1;
    bool _2190 = _1510 != 3;
    int _2192 = ~_2188;
    int _2194 = _2192 + 1;
    int _2196 = _2194 + 1;
    int _2198 = ~_2176;
    int _2200 = _2198 + 1;
    int _2202 = _2200 + 1;
    int _2204 = _2186;
    int _2206 = _2196;
    if (_2190)
    {
        int _2208 = ~_2178;
        int _2210 = _2208 + 1;
        _2204 = _2210;
    }
    int _2212 = _2204;
    bool _2214 = _2162 != 3;
    if (_2214)
    {
        int _2216 = ~_2188;
        int _2218 = _2216 + 1;
        _2206 = _2218;
    }
    int _2220 = _2206;
    int _2222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2224 = _2222 != 0;
    float _2226 = -_263;
    int _2228 = _1748 ? as_type<int>(_2226) : as_type<int>(_263);
    bool _2230 = !_2224;
    int _2232 = _2230 ? 0 : 1;
    bool _2234 = _1068 > 0.5;
    float _2236 = -_259;
    int _2238 = _2234 ? as_type<int>(_2236) : as_type<int>(_259);
    int _2240 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2242 = _2240 != 0;
    bool _2244 = !_2242;
    float _2246 = _2244 ? _263 : as_type<float>(_2228);
    int _2248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2250 = _2248 != 0;
    bool _2252 = !_2250;
    float _2254 = _2252 ? _259 : as_type<float>(_2054);
    int _2256 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2258 = _2256 != 0;
    float _2260 = float(uint(_1344));
    bool _2262 = !_2258;
    float _2264 = _2262 ? _259 : as_type<float>(_2238);
    float _2266 = as_type<float>(_1037) * _2260;
    bool _2268 = _1102 != 2;
    float _2270 = trunc(_2266);
    float _2272 = precise::max(_2270, 0.0);
    uint _2274 = uint(_2272);
    float _2276 = 0.0;
    if (!_1132)
    {
        _2276 = _1070;
    }
    float _2278 = _2276;
    float _2280 = _2278;
    if (!_1132)
    {
        _2002 = _1072;
    }
    float _2282 = _2002;
    float _2284 = 0.0;
    float _2286 = _2282;
    if (!_1132)
    {
        _2284 = _2278;
    }
    float _2288 = _2284;
    float _2290 = 0.0;
    float _2292 = _2288;
    if (!_1132)
    {
        _2290 = _1072;
    }
    float _2294 = _2290;
    float _2296 = _2294;
    if (_1132)
    {
        _2292 = _1068;
    }
    float _2298 = _2292;
    if (_1132)
    {
        _2280 = _1068;
    }
    float _2300 = _2280;
    if (_1132)
    {
        _2286 = _1070;
    }
    float _2302 = _2286;
    if (_1132)
    {
        _2296 = _1070;
    }
    float _2304 = _2296;
    int _2306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2308 = _2306 != 0;
    int _2310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2312 = _2310 != 0;
    int _2314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2316 = _2314 != 0;
    int _2318 = ~_983;
    int _2320 = _2318 + 1;
    bool _2322 = !_2312;
    int _2324 = _2322 ? 0 : 1;
    int _2326 = _2320 * int(_2274);
    int _2328 = _2326 + _1344;
    bool _2330 = _1554 != 0;
    float _2332 = 0.0;
    if (_2268)
    {
        _2332 = _1068;
    }
    float _2334 = _2332;
    float _2336 = float(uint(_2328));
    int _2338 = ~_1590;
    int _2340 = _2338 + 1;
    float _2342 = _2334;
    if (_2268)
    {
        _1946 = _1070;
    }
    float _2344 = _1946;
    float _2346 = as_type<float>(_1037) * _2336;
    float _2348 = float(uint(_1818));
    float _2350 = _2344;
    if (!_2268)
    {
        _2342 = _1072;
    }
    float _2352 = _2342;
    if (!_2268)
    {
        _2350 = _1068;
    }
    float _2354 = _2350;
    float _2356 = as_type<float>(_1642) * _2348;
    float _2358 = trunc(_2346);
    float _2360 = precise::max(_2358, 0.0);
    uint _2362 = uint(_2360);
    float _2364 = _2352 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2366 = abs(_2324);
    float _2368 = trunc(_2356);
    float _2370 = precise::max(_2368, 0.0);
    uint _2372 = uint(_2370);
    int _2374 = int(_2274) + int(_2362);
    float _2376 = float(uint(_2042));
    int _2378 = _1374 * _2374;
    int _2380 = _2378 + _1344;
    float _2382 = as_type<float>(_1700) * _2376;
    int _2384 = _2340 * int(_2372);
    int _2386 = _2384 + _1818;
    bool _2388 = uint(_2380) >= uint(_983);
    bool _2390 = !_2316;
    int _2392 = _2390 ? 0 : 1;
    float _2394 = trunc(_2382);
    float _2396 = precise::max(_2394, 0.0);
    uint _2398 = uint(_2396);
    float _2400 = float(uint(_2386));
    bool _2402 = !_2388;
    int _2404 = _2402 ? 0 : (-1);
    float _2406 = as_type<float>(_1642) * _2400;
    int _2408 = ~_1590;
    int _2410 = _2408 + 1;
    int _2412 = ~_2374;
    int _2414 = _2412 + _2404;
    int _2416 = _2414 + 1;
    float _2418 = trunc(_2406);
    float _2420 = precise::max(_2418, 0.0);
    uint _2422 = uint(_2420);
    int _2424 = _983 * _2416;
    int _2426 = _2424 + _1344;
    int _2428 = int(_2372) + int(_2422);
    int _2430 = ~_1640;
    int _2432 = _2430 + 1;
    int _2434 = _2410 * _2428;
    int _2436 = _2434 + _1818;
    int _2438 = _2432 * int(_2398);
    int _2440 = _2438 + _2042;
    bool _2442 = uint(_2436) >= uint(_1590);
    float _2444 = float(uint(_2440));
    bool _2446 = !_2442;
    int _2448 = _2446 ? 0 : (-1);
    float _2450 = as_type<float>(_1700) * _2444;
    int _2452 = ~_1640;
    int _2454 = _2452 + 1;
    int _2456 = ~_2428;
    int _2458 = _2456 + _2448;
    int _2460 = _2458 + 1;
    float _2462 = trunc(_2450);
    float _2464 = precise::max(_2462, 0.0);
    uint _2466 = uint(_2464);
    int _2468 = _1590 * _2460;
    int _2470 = _2468 + _1818;
    int _2472 = int(_2398) + int(_2466);
    float _2474 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2476 = log2(_2474);
    bool _2478 = !_2330;
    int _2480 = _2478 ? 0 : 1;
    int _2482 = _2454 * _2472;
    int _2484 = _2482 + _2042;
    bool _2486 = uint(_2484) >= uint(_1640);
    bool _2488 = !_2164;
    int _2490 = _2488 ? 0 : 1;
    bool _2492 = _2162 != 3;
    bool _2494 = !_2486;
    int _2496 = _2494 ? 0 : (-1);
    float _2498 = _115 * _2476;
    bool _2500 = !_2492;
    int _2502 = _2500 ? 0 : (-1);
    bool _2504 = _1182 >= 0.0;
    bool _2506 = isnan(_1182);
    bool _2508 = _2504 || _2506;
    bool _2510 = isnan(0.0);
    bool _2512 = _2508 || _2510;
    bool _2514 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2516 = isnan(1.0);
    bool _2518 = _2514 || _2516;
    bool _2520 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2522 = _2518 || _2520;
    float _2524 = exp2(_2498);
    int _2526 = _2512 ? 0 : 1;
    float _2528 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _259);
    bool _2530 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2532 = isnan(0.0);
    bool _2534 = _2530 || _2532;
    bool _2536 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2538 = _2534 || _2536;
    int _2540 = ~_2472;
    int _2542 = _2540 + _2496;
    int _2544 = _2542 + 1;
    int _2546 = abs(_2490);
    int _2548 = abs(_2502);
    int _2550 = _1640 * _2544;
    int _2552 = _2550 + _2042;
    bool _2554 = !_2010;
    int _2556 = _2554 ? _2552 : (-1);
    float _2558 = -_2524;
    float _2560 = _2558 + 1.0;
    bool _2562 = uint(_2140) >= 2u;
    float _2564 = _2538 ? _2560 : 0.0;
    bool _2566 = _1182 > 0.0;
    int _2568 = ~_2526;
    int _2570 = _2568 + 1;
    int _2572 = _2570 + 1;
    float _2574 = _2564 * _1408;
    bool _2576 = !_2308;
    int _2578 = _2576 ? 0 : 1;
    bool _2580 = !_2522;
    float _2582 = _2580 ? _115 : _2574;
    float _2584 = _449 * _217;
    int _2586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2588 = _2586 != 0;
    int _2590 = _2572;
    if (!_2566)
    {
        int _2592 = ~_2526;
        int _2594 = _2592 + 1;
        _2590 = _2594;
    }
    int _2596 = _2590;
    float _2598 = fma(_457, _215, _2584);
    int _2600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2602 = _2600 != 0;
    float _2604 = _449 * _233;
    float _2606 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _263);
    float _2608 = _1154 * _2528;
    float _2610 = fma(_457, _231, _2604);
    float _2612 = _1148 * _2606;
    float _2614 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1436);
    float _2616 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2618 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2620 = _1068 + (-0.5);
    float _2622 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2624 = _2622 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2626 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2618);
    float _2628 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2630 = _2628 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2632 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2634 = 1.0 / _2624;
    float _2636 = _1070 + (-0.5);
    float _2638 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2640 = _2638 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2642 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2632);
    float _2644 = _1072 + (-0.5);
    float _2646 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2648 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2626);
    float _2650 = 1.0 / _2640;
    float _2652 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1410);
    float _2654 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2656 = -_2646;
    float _2658 = fma(_2616, 2.0, _2656);
    float _2660 = fma(_479, _219, _2598);
    float _2662 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2664 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2662;
    float _2666 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2668 = _2666 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2670 = 1.0 / _2630;
    float _2672 = fma(_1198, -2.0, _2654);
    float _2674 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2676 = _2674 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _2678 = _971 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2680 = isnan(_971);
    bool _2682 = _2678 || _2680;
    bool _2684 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2686 = _2682 || _2684;
    float _2688 = float(_2686);
    float _2690 = _1414 * _2634;
    float _2692 = -_115;
    float _2694 = fma(_2692, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2658);
    float _2696 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2698 = _2696 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2700 = 1.0 / _2668;
    float _2702 = fma(_479, _235, _2610);
    float _2704 = _1424 * _2650;
    float _2706 = -_2688;
    float _2708 = _2706 + 1.0;
    float _2710 = fma(_479, _247, _1428);
    float _2712 = _2664 * _2670;
    float _2714 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2716 = _2714 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2718 = 1.0 / _2698;
    bool _2720 = _971 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2722 = isnan(_971);
    bool _2724 = _2720 || _2722;
    bool _2726 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2728 = _2724 || _2726;
    float _2730 = float(_2728);
    float _2732 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2734 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2732;
    float _2736 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2738 = _2736 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2740 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2672);
    float _2742 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2642);
    float _2744 = _2676 * _2700;
    bool _2746 = _971 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2748 = isnan(_971);
    bool _2750 = _2746 || _2748;
    bool _2752 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2754 = _2750 || _2752;
    float _2756 = float(_2754);
    float _2758 = 1.0 / _2716;
    float _2760 = _2660 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2762 = _2710 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2764 = _2702 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2766 = -_2756;
    float _2768 = _2766 + 1.0;
    float _2770 = _2688 * _2768;
    float _2772 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2774 = _2772 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2776 = _971 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2778 = isnan(_971);
    bool _2780 = _2776 || _2778;
    bool _2782 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2784 = _2780 || _2782;
    float _2786 = float(_2784);
    float _2788 = _2730 * _2708;
    float _2790 = -_2730;
    float _2792 = _2790 + 1.0;
    float _2794 = 1.0 / _2738;
    float _2796 = _2734 * _2718;
    float _2798 = -_2786;
    float _2800 = _2798 + 1.0;
    float _2802 = _2774 * _2758;
    bool _2804 = _971 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2806 = isnan(_971);
    bool _2808 = _2804 || _2806;
    bool _2810 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2812 = _2808 || _2810;
    float _2814 = float(_2812);
    float _2816 = _2786 * _2792;
    float _2818 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2820 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2818;
    float _2822 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2824 = _971 + _2822;
    bool _2826 = _971 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2828 = isnan(_971);
    bool _2830 = _2826 || _2828;
    bool _2832 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2834 = _2830 || _2832;
    float _2836 = float(_2834);
    float _2838 = _2814 * _2800;
    float _2840 = -_2814;
    float _2842 = _2840 + 1.0;
    bool _2844 = _971 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2846 = isnan(_971);
    bool _2848 = _2844 || _2846;
    bool _2850 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2852 = _2848 || _2850;
    float _2854 = float(_2852);
    float _2856 = fma(_2690, _2824, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2858 = -_2836;
    float _2860 = _2858 + 1.0;
    float _2862 = _2836 * _2842;
    bool _2864 = _971 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2866 = isnan(_971);
    bool _2868 = _2864 || _2866;
    bool _2870 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2872 = _2868 || _2870;
    float _2874 = float(_2872);
    float _2876 = -_2854;
    float _2878 = _2876 + 1.0;
    float _2880 = _2854 * _2860;
    float _2882 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2884 = _971 + _2882;
    float _2886 = _2820 * _2794;
    float _2888 = _2874 * _2878;
    float _2890 = -_2874;
    float _2892 = _2890 + 1.0;
    float _2894 = fma(_2704, _2884, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2896 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2898 = _971 + _2896;
    float _2900 = _2856 * _2888;
    float _2902 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2904 = _971 + _2902;
    float _2906 = fma(_2712, _2898, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2908 = fma(_2892, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2900);
    float _2910 = fma(_2744, _2904, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2912 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2914 = _971 + _2912;
    float _2916 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2918 = _971 + _2916;
    float _2920 = fma(_2894, _2880, _2908);
    float _2922 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2924 = _971 + _2922;
    float _2926 = fma(_2796, _2914, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2928 = fma(_2802, _2918, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2930 = fma(_2906, _2862, _2920);
    float _2932 = fma(_2886, _2924, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2934 = _2264 + 0.5;
    float _2936 = _2246 + (-0.5);
    float _2938 = fma(_2910, _2838, _2930);
    float _2940 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2942 = fma(_2934, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2694);
    int _2944 = abs(_2578);
    float _2946 = fma(_2926, _2816, _2938);
    float _2948 = -_2936;
    float _2950 = -_2740;
    float _2952 = fma(_2948, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2950);
    float _2954 = fma(_2928, _2788, _2946);
    float _2956 = in.m_70.x;
    float _2958 = in.m_70.y;
    float _2960 = in.m_70.z;
    float _2962 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2964 = fma(_2932, _2770, _2954);
    float _2966 = float(_2596);
    float _2968 = -_2962;
    float _2970 = fma(_2364, 2.0, _2968);
    float _2972 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2974 = fma(_2756, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2964);
    float _2976 = float(_2944);
    float _2978 = fma(_2300, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2972);
    float _2980 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    out.m_72.x = _2974;
    float _2982 = _2976 * _2966;
    float _2984 = _2298 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2986 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2988 = fma(_2304, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2980);
    float _2990 = _2982 * (-2.0);
    int _2992 = abs(_2392);
    float _2994 = -_2986;
    float _2996 = fma(_2984, 2.0, _2994);
    float _2998 = fma(_1426, _2990, _1426);
    float _3000 = fma(_2990, _2956, _2956);
    float _3002 = -_115;
    float _3004 = fma(_3002, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2996);
    float _3006 = float(_1952);
    float _3008 = fma(_2620, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3000);
    float _3010 = float(_2366);
    float _3012 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3014 = float(_2008);
    float _3016 = _2302 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3018 = float(_2992);
    float _3020 = _3010 * _3006;
    float _3022 = fma(_2582, _2998, _3008);
    float _3024 = fma(_3016, -2.0, _3012);
    float _3026 = _3020 * (-2.0);
    float _3028 = _3018 * _3014;
    float _3030 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3032 = _2354 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3034 = fma(_3026, _2958, _2958);
    float _3036 = _3028 * (-2.0);
    float _3038 = fma(_1432, _3026, _1432);
    float _3040 = fma(_3032, -2.0, _3030);
    float _3042 = fma(_2636, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3034);
    float _3044 = fma(_3036, _2960, _2960);
    float _3046 = fma(_2940, _3036, _2940);
    float _3048 = _1392 + (-0.5);
    float _3050 = fma(_2582, _3038, _3042);
    float _3052 = fma(_2644, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3044);
    float _3054 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3024);
    float _3056 = _2254 + 0.5;
    float _3058 = _3050 * 0.15915493667125701904296875;
    float _3060 = fma(_2582, _3046, _3052);
    float _3062 = -_3048;
    float _3064 = -_3054;
    float _3066 = fma(_3062, (*spvDescriptorSet0.vp_c9)._m0[85].y, _3064);
    float _3068 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2978);
    float _3070 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2988);
    float _3072 = _3060 * 0.15915493667125701904296875;
    int _3074 = _2132 >> 31;
    float _3076 = fma(_3056, (*spvDescriptorSet0.vp_c9)._m0[85].x, _3004);
    float _3078 = -_2648;
    float _3080 = _3078 + 1.0;
    float _3082 = -_2742;
    float _3084 = _3082 + 1.0;
    int _3086 = _3074 & 3;
    float _3088 = -_3068;
    float _3090 = _3088 + 1.0;
    float _3092 = -_3070;
    float _3094 = _3092 + 1.0;
    float _3096 = -_3080;
    float _3098 = fma(_2264, _3096, _2942);
    int _3100 = _2132 + _3086;
    float _3102 = fma(_2246, _3084, _2952);
    float _3104 = -_3090;
    float _3106 = fma(_2254, _3104, _3076);
    float _3108 = fma(_1392, _3094, _3066);
    int _3110 = _3100 >> 2;
    float _3112 = _3022 * 0.15915493667125701904296875;
    float _3114 = _3058 * 6.283185482025146484375;
    float _3116 = sin(_3114);
    int _3118 = _3110 << 4;
    int _3120 = _3118 + 656;
    out.m_74.x = _3098;
    out.m_74.y = _3102;
    out.m_74.z = _3106;
    out.m_74.w = _3108;
    uint _3122 = uint(int(uint(_3120) >> uint(2)));
    uint _3124 = uint(int(uint(int(_3122)) >> uint(2)));
    int _3126 = int(_3122) & 3;
    float _3128 = (*spvDescriptorSet0.vp_c9)._m0[int(_3124)][_3126];
    int _3130 = int(_3122) + 1;
    uint _3132 = uint(int(uint(_3130) >> uint(2)));
    int _3134 = _3130 & 3;
    float _3136 = (*spvDescriptorSet0.vp_c9)._m0[int(_3132)][_3134];
    float _3138 = _3112 * 6.283185482025146484375;
    float _3140 = sin(_3138);
    float _3142 = _3112 * 6.283185482025146484375;
    float _3144 = cos(_3142);
    int _3146 = _3120 + 8;
    uint _3148 = uint(int(uint(_3146) >> uint(2)));
    uint _3150 = uint(int(uint(int(_3148)) >> uint(2)));
    int _3152 = int(_3148) & 3;
    float _3154 = (*spvDescriptorSet0.vp_c9)._m0[int(_3150)][_3152];
    int _3156 = int(_3148) + 1;
    uint _3158 = uint(int(uint(_3156) >> uint(2)));
    int _3160 = _3156 & 3;
    float _3162 = (*spvDescriptorSet0.vp_c9)._m0[int(_3158)][_3160];
    float _3164 = _3058 * 6.283185482025146484375;
    float _3166 = cos(_3164);
    float _3168 = _3140 * _3116;
    int _3170 = abs(_2220);
    int _3172 = ~_2546;
    int _3174 = _3172 + 1;
    int _3176 = _3174 + 1;
    float _3178 = _3072 * 6.283185482025146484375;
    float _3180 = cos(_3178);
    float _3182 = _3144 * _3116;
    float _3184 = _3072 * 6.283185482025146484375;
    float _3186 = sin(_3184);
    float _3188 = _3144 * _3166;
    float _3190 = _3140 * _3166;
    float _3192 = _3140 * _3180;
    float _3194 = _3166 * _3180;
    float _3196 = _3144 * _3180;
    float _3198 = _3116 * _3180;
    float _3200 = _3196 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3202 = _3196 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3204 = fma(_3186, _3188, _3168);
    float _3206 = fma(_3186, _3168, _3188);
    float _3208 = -_3182;
    float _3210 = fma(_3186, _3190, _3208);
    float _3212 = -_3190;
    float _3214 = fma(_3186, _3182, _3212);
    float _3216 = _3196 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3218 = _3196 * _2612;
    float _3220 = -_2612;
    float _3222 = _3186 * _3220;
    float _3224 = -_3186;
    float _3226 = fma(_3224, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3200);
    float _3228 = -_3186;
    float _3230 = fma(_3228, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3216);
    float _3232 = -_3186;
    float _3234 = fma(_3232, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3202);
    float _3236 = fma(_3204, _2608, _3218);
    float _3238 = fma(_3194, _2608, _3222);
    float _3240 = _3204 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3242 = _3204 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3244 = _3204 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3246 = _3192 * _2612;
    float _3248 = fma(_3194, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3240);
    float _3250 = fma(_3194, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3242);
    float _3252 = fma(_3194, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3244);
    float _3254 = fma(_3210, _2608, _3246);
    float _3256 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3258 = _3214 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3260 = _2202 * as_type<int>(_3136);
    float _3262 = fma(_3192, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3230);
    float _3264 = fma(_3192, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3226);
    float _3266 = fma(_3192, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3234);
    float _3268 = fma(_3198, _3256, _3238);
    float _3270 = fma(_3214, _3256, _3236);
    float _3272 = fma(_3206, _3256, _3254);
    float _3274 = _3214 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3276 = _3214 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3278 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3258);
    int _3280 = ~_3170;
    int _3282 = _3280 + 1;
    int _3284 = _3282 + 1;
    int _3286 = _3176 * as_type<int>(_3128);
    int _3288 = _3286 + _3260;
    float _3290 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3274);
    float _3292 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3276);
    float _3294 = fma(_3206, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3278);
    int _3296 = _3284 * as_type<int>(_3154);
    int _3298 = _3296 + _3288;
    int _3300 = abs(_2232);
    float _3302 = _3270 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3304 = _1486 >> 31;
    float _3306 = _3270 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3308 = _3270 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3310 = fma(_3206, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3290);
    float _3312 = fma(_3206, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3292);
    int _3314 = _3304 & 3;
    float _3316 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3318 = int(_3316);
    int _3320 = ~_2548;
    int _3322 = _3320 + 1;
    int _3324 = _3322 + 1;
    float _3326 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3302);
    float _3328 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3308);
    int _3330 = _1486 + _3314;
    float _3332 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3306);
    float _3334 = fma(_3272, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3326);
    float _3336 = fma(_3272, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3328);
    int _3338 = _3324 * as_type<int>(_3162);
    int _3340 = _3338 + _3298;
    int _3342 = ~_3300;
    int _3344 = _3342 + 1;
    int _3346 = _3344 + 1;
    float _3348 = _3334 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3350 = _3336 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _3352 = _2094 >> 31;
    float _3354 = fma(_3210, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3252);
    int _3356 = _3340 * _3346;
    float _3358 = _2760 + _3348;
    float _3360 = _2762 + _3350;
    int _3362 = _3330 >> 2;
    int _3364 = _2556 * _3300;
    int _3366 = _3364 + _3356;
    int _3368 = _3352 & 3;
    float _3370 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3372 = _3358 + _3370;
    int _3374 = abs(_3318);
    float _3376 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3378 = _3360 + _3376;
    int _3380 = _3362 << 4;
    int _3382 = _3380 + 368;
    float _3384 = fma(_3210, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3248);
    float _3386 = fma(_3210, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3250);
    int _3388 = _2094 + _3368;
    float _3390 = _3372 * _3372;
    float _3392 = float(uint(_3374));
    float _3394 = _3378 * _3378;
    float _3396 = float(uint(_3318));
    float _3398 = _263 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3400 = _259 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3402 = _3390 + _3394;
    float _3404 = 1.0 / _3396;
    float _3406 = _3398 * _3264;
    int _3408 = _3388 >> 2;
    float _3410 = _3398 * _3262;
    float _3412 = _3398 * _3266;
    float _3414 = fma(_3400, _3386, _3406);
    int _3416 = abs(_3366);
    uint _3418 = uint(int(uint(_3382) >> uint(2)));
    uint _3420 = uint(int(uint(int(_3418)) >> uint(2)));
    int _3422 = int(_3418) & 3;
    float _3424 = (*spvDescriptorSet0.vp_c9)._m0[int(_3420)][_3422];
    int _3426 = int(_3418) + 1;
    uint _3428 = uint(int(uint(_3426) >> uint(2)));
    int _3430 = _3426 & 3;
    float _3432 = (*spvDescriptorSet0.vp_c9)._m0[int(_3428)][_3430];
    float _3434 = 1.0 / _3392;
    int _3436 = _3408 << 4;
    int _3438 = _3436 + 512;
    float _3440 = fma(_3400, _3384, _3410);
    float _3442 = fma(_3400, _3354, _3412);
    float _3444 = fma(_3272, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3332);
    int _3446 = _2562 ? 0 : 1;
    int _3448 = _3382 + 8;
    uint _3450 = uint(int(uint(_3448) >> uint(2)));
    uint _3452 = uint(int(uint(int(_3450)) >> uint(2)));
    int _3454 = int(_3450) & 3;
    float _3456 = (*spvDescriptorSet0.vp_c9)._m0[int(_3452)][_3454];
    int _3458 = int(_3450) + 1;
    uint _3460 = uint(int(uint(_3458) >> uint(2)));
    int _3462 = _3458 & 3;
    float _3464 = (*spvDescriptorSet0.vp_c9)._m0[int(_3460)][_3462];
    float _3466 = sqrt(_3402);
    int _3468 = as_type<int>(_3404) + (-2);
    float _3470 = _3444 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _3472 = !_2142;
    int _3474 = _3472 ? 0 : 1;
    bool _3476 = _1510 != 3;
    float _3478 = _2764 + _3470;
    uint _3480 = uint(int(uint(_3438) >> uint(2)));
    uint _3482 = uint(int(uint(int(_3480)) >> uint(2)));
    int _3484 = int(_3480) & 3;
    float _3486 = (*spvDescriptorSet0.vp_c9)._m0[int(_3482)][_3484];
    int _3488 = int(_3480) + 1;
    uint _3490 = uint(int(uint(_3488) >> uint(2)));
    int _3492 = _3488 & 3;
    float _3494 = (*spvDescriptorSet0.vp_c9)._m0[int(_3490)][_3492];
    int _3496 = as_type<int>(_3434) + (-2);
    bool _3498 = _2140 != 3;
    int _3500 = _3438 + 8;
    uint _3502 = uint(int(uint(_3500) >> uint(2)));
    uint _3504 = uint(int(uint(int(_3502)) >> uint(2)));
    int _3506 = int(_3502) & 3;
    float _3508 = (*spvDescriptorSet0.vp_c9)._m0[int(_3504)][_3506];
    int _3510 = int(_3502) + 1;
    uint _3512 = uint(int(uint(_3510) >> uint(2)));
    int _3514 = _3510 & 3;
    float _3516 = (*spvDescriptorSet0.vp_c9)._m0[int(_3512)][_3514];
    bool _3518 = _3466 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3520 = float(uint(_3416));
    float _3522 = as_type<float>(_3496) * _3520;
    float _3524 = _3470;
    float _3526 = as_type<float>(_3416);
    float _3528 = _3434;
    float _3530 = _3272;
    float _3532 = _3394;
    float _3534 = _3266;
    float _3536 = _3386;
    if (!_3518)
    {
        _3524 = _3390;
    }
    float _3538 = _3524;
    float _3540 = float(uint(_3366));
    float _3542 = _3538;
    if (!_3518)
    {
        _3526 = _3358;
    }
    float _3544 = _3526;
    float _3546 = trunc(_3522);
    float _3548 = precise::max(_3546, 0.0);
    uint _3550 = uint(_3548);
    float _3552 = _3544;
    if (!_3518)
    {
        _3528 = _3360;
    }
    float _3554 = _3528;
    float _3556 = as_type<float>(_3468) * _3540;
    float _3558 = _3554;
    if (!_3518)
    {
        _3530 = _3478;
    }
    float _3560 = _3530;
    int _3562 = ~_3446;
    int _3564 = _3562 + 1;
    int _3566 = _3564 + 1;
    bool _3568 = !_3518;
    float _3570 = _3560;
    int _3572 = _3566;
    if (!_3568)
    {
        float _3574 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3576 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3578 = _3466 + _3576;
        float _3580 = rsqrt(_3402);
        float _3582 = _3578 * _3574;
        float _3584 = _3478 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3586 = _3582 * 0.15915493667125701904296875;
        float _3588 = _3586 * 6.283185482025146484375;
        float _3590 = sin(_3588);
        float _3592 = _3586 * 6.283185482025146484375;
        float _3594 = cos(_3592);
        float _3596 = fma(_3590, _3584, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3598 = _3580 * _3596;
        float _3600 = _3594 + (-1.0);
        float _3602 = fma(_3372, _3598, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3604 = fma(_3378, _3598, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3606 = _3600 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3608 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3610 = _3602 + _3608;
        float _3612 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3614 = _3604 + _3612;
        float _3616 = fma(_3478, _3594, _3606);
        float _3618 = _3610 * _3610;
        float _3620 = _3614 * _3614;
        _3570 = _3616;
        _3542 = _3618;
        _3532 = _3620;
        _3552 = _3602;
        _3558 = _3604;
    }
    float _3622 = _3570;
    float _3624 = _3542;
    float _3626 = _3532;
    float _3628 = _3552;
    float _3630 = _3558;
    float _3632 = trunc(_3556);
    float _3634 = precise::max(_3632, 0.0);
    uint _3636 = uint(_3634);
    float _3638 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3640 = _3622 + _3638;
    if (_3498)
    {
        int _3642 = ~_3446;
        int _3644 = _3642 + 1;
        _3572 = _3644;
    }
    int _3646 = _3572;
    float _3648 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3040);
    int _3650 = abs(_2160);
    float _3652 = fma(_3640, _3640, _3624);
    int _3654 = ~_3318;
    int _3656 = _3654 + 1;
    float _3658 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2614);
    int _3660 = ~_3374;
    int _3662 = _3660 + 1;
    float _3664 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2652);
    float _3666 = -_3658;
    float _3668 = _3666 + 1.0;
    int _3670 = abs(_1586);
    float _3672 = -_3664;
    float _3674 = _3672 + 1.0;
    int _3676 = abs(_2480);
    int _3678 = _3662 * int(_3550);
    int _3680 = _3678 + _3416;
    int _3682 = ~_3670;
    int _3684 = _3682 + 1;
    int _3686 = _3684 + 1;
    int _3688 = _3656 * int(_3636);
    int _3690 = _3688 + _3366;
    int _3692 = abs(_3474);
    float _3694 = _3294 + _3440;
    int _3696 = ~_3676;
    int _3698 = _3696 + 1;
    int _3700 = _3698 + 1;
    int _3702 = _3686 * as_type<int>(_3432);
    float _3704 = float(uint(_3690));
    float _3706 = _3310 + _3414;
    float _3708 = float(uint(_3680));
    int _3710 = _3700 * as_type<int>(_3424);
    int _3712 = _3710 + _3702;
    int _3714 = ~_3650;
    int _3716 = _3714 + 1;
    int _3718 = _3716 + 1;
    float _3720 = as_type<float>(_3468) * _3704;
    float _3722 = as_type<float>(_3496) * _3708;
    int _3724 = abs(_3646);
    int _3726 = _3718 * as_type<int>(_3494);
    int _3728 = ~_3692;
    int _3730 = _3728 + 1;
    int _3732 = _3730 + 1;
    float _3734 = trunc(_3722);
    float _3736 = precise::max(_3734, 0.0);
    uint _3738 = uint(_3736);
    bool _3740 = !_3476;
    int _3742 = _3740 ? 0 : (-1);
    out.m_76.x = _3384;
    out.m_76.y = _3386;
    out.m_76.z = _3354;
    int _3744 = abs(_2212);
    int _3746 = _3732 * as_type<int>(_3486);
    int _3748 = _3746 + _3726;
    int _3750 = ~_3724;
    int _3752 = _3750 + 1;
    int _3754 = _3752 + 1;
    float _3756 = _3652 + _3626;
    int _3758 = abs(_3742);
    float _3760 = trunc(_3720);
    float _3762 = precise::max(_3760, 0.0);
    uint _3764 = uint(_3762);
    bool _3766 = _2140 != 3;
    int _3768 = _3754 * as_type<int>(_3508);
    int _3770 = _3768 + _3748;
    int _3772 = ~_3744;
    int _3774 = _3772 + 1;
    int _3776 = _3774 + 1;
    bool _3778 = !_3766;
    int _3780 = _3778 ? 0 : (-1);
    int _3782 = _3776 * as_type<int>(_3456);
    int _3784 = _3782 + _3712;
    int _3786 = ~_3758;
    int _3788 = _3786 + 1;
    int _3790 = _3788 + 1;
    float _3792 = sqrt(_3756);
    int _3794 = abs(_3780);
    int _3796 = ~_3318;
    int _3798 = _3796 + 1;
    int _3800 = _3790 * as_type<int>(_3464);
    int _3802 = _3800 + _3784;
    int _3804 = ~_3374;
    int _3806 = _3804 + 1;
    int _3808 = int(_3550) + int(_3738);
    int _3810 = int(_3636) + int(_3764);
    int _3812 = _3806 * _3808;
    int _3814 = _3812 + _3416;
    int _3816 = ~_3794;
    int _3818 = _3816 + 1;
    int _3820 = _3818 + 1;
    float _3822 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3824 = !_2602;
    int _3826 = _3824 ? 0 : 1;
    int _3828 = _3798 * _3810;
    int _3830 = _3828 + _3366;
    bool _3832 = uint(_3814) >= uint(_3374);
    int _3834 = _3820 * as_type<int>(_3516);
    int _3836 = _3834 + _3770;
    int _3838 = abs(_3826);
    int _3840 = _3366 ^ _3318;
    float _3842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3844 = ~_3838;
    int _3846 = _3844 + 1;
    int _3848 = _3846 + 1;
    bool _3850 = uint(_3830) >= uint(_3318);
    uint _3852 = uint(int(uint(_3840) >> uint(31)));
    int _3854 = _3802 * _3848;
    bool _3856 = !_3832;
    int _3858 = _3856 ? 0 : (-1);
    bool _3860 = !_3850;
    int _3862 = _3860 ? 0 : (-1);
    int _3864 = ~int(_3852);
    int _3866 = _3864 + 1;
    float _3868 = fma(_3398, _3398, 1.0);
    int _3870 = ~_3858;
    int _3872 = _3808 + _3870;
    int _3874 = _3872 + 1;
    bool _3876 = !_2588;
    int _3878 = _3876 ? 0 : 1;
    int _3880 = ~_3810;
    int _3882 = _3880 + _3862;
    int _3884 = _3882 + 1;
    float _3886 = rsqrt(_3868);
    int _3888 = _3874 ^ _3866;
    int _3890 = abs(_3878);
    int _3892 = _3318 * _3884;
    int _3894 = _3892 + _3366;
    bool _3896 = _3318 == 0;
    bool _3898 = _3318 == 0;
    float _3900 = _3312 + _3442;
    int _3902 = ~_3866;
    int _3904 = _3902 + _3888;
    int _3906 = _3904 + 1;
    float _3908 = _3822 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3910 = ~_3890;
    int _3912 = _3910 + 1;
    int _3914 = _3912 + 1;
    bool _3916 = _983 == 0;
    out.m_78.x = _3694;
    out.m_78.y = _3706;
    out.m_78.z = _3900;
    bool _3918 = _1590 == 0;
    int _3920 = _3836 * _3914;
    bool _3922 = !_3896;
    int _3924 = _3922 ? _3894 : (-1);
    float _3926 = _3842 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3928 = !_3898;
    int _3930 = _3928 ? _3906 : (-1);
    float _3932 = -_115;
    float _3934 = fma(_3932, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2970);
    bool _3936 = !_3916;
    int _3938 = _3936 ? _2426 : (-1);
    float _3940 = float(_3924);
    float _3942 = float(_3930);
    int _3944 = _3938 * _3838;
    int _3946 = _3944 + _3854;
    float _3948 = _1196 + 0.5;
    float _3950 = fma(_3908, _3940, _3934);
    bool _3952 = !_3918;
    int _3954 = _3952 ? _2470 : (-1);
    float _3956 = -_3648;
    float _3958 = fma(_3926, _3942, _3956);
    float _3960 = _1234 + (-0.5);
    float _3962 = _3398 * _3886;
    float _3964 = fma(_3908, _3948, _3950);
    int _3966 = _3954 * _3890;
    int _3968 = _3966 + _3920;
    float _3970 = -_3926;
    float _3972 = fma(_3970, _3960, _3958);
    float _3974 = -_3294;
    float _3976 = _3962 * _3974;
    float _3978 = -_3310;
    float _3980 = _3962 * _3978;
    float _3982 = -_3312;
    float _3984 = _3962 * _3982;
    float _3986 = -_3668;
    float _3988 = fma(_1196, _3986, _3964);
    float _3990 = fma(_3886, _3262, _3976);
    float _3992 = fma(_3886, _3264, _3980);
    float _3994 = fma(_3886, _3266, _3984);
    float _3996 = float(_3946);
    float _3998 = fma(_1234, _3674, _3972);
    float _4000 = float(_3968);
    out.m_80.x = _3990;
    out.m_80.y = _3992;
    out.m_80.z = _3994;
    bool _4002 = _3792 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4004 = isnan(_3792);
    bool _4006 = _4002 || _4004;
    bool _4008 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4010 = _4006 || _4008;
    out.m_82.x = _3996;
    out.m_82.y = _4000;
    out.m_84.x = _3988;
    out.m_84.y = _3998;
    if (!_4010)
    {
        _3534 = 1.0;
    }
    float _4012 = _3534;
    bool _4014 = !_4010;
    float _4016 = _4012;
    if (!_4014)
    {
        bool _4018 = _3792 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4020 = isnan(_3792);
        bool _4022 = _4018 || _4020;
        bool _4024 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4026 = _4022 || _4024;
        if (!_4026)
        {
            float _4028 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4030 = _3792 + _4028;
            float _4032 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4034 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4032;
            float _4036 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4038 = _4036 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4040 = 1.0 / _4034;
            float _4042 = _4030 * _4040;
            float _4044 = fma(_4042, _4038, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4016 = _4044;
            _3536 = _4040;
            _4046 = true;
        }
        else
        {
            bool _4048 = _3792 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4050 = isnan(_3792);
            bool _4052 = _4048 || _4050;
            bool _4054 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4056 = _4052 || _4054;
            if (!_4056)
            {
                float _4058 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4060 = _3792 + _4058;
                float _4062 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4064 = _4062 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4066 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4068 = _4066 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4070 = 1.0 / _4064;
                float _4072 = _4060 * _4070;
                float _4074 = fma(_4072, _4068, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4016 = _4074;
                _3536 = _4070;
                _4046 = true;
            }
            else
            {
                _4016 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4046 = false;
    float _4076 = _4016;
    float _4078 = _3536;
    float _4080 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4082 = _3622 + _4080;
    float _4084 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4086 = _3628 + _4084;
    float _4088 = fma(_4082, _4076, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4090 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4092 = _3630 + _4090;
    float _4094 = fma(_4086, _4076, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4096 = -_2764;
    float _4098 = _4096 + _4088;
    float _4100 = fma(_4092, _4076, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4102 = -_2760;
    float _4104 = _4102 + _4094;
    float _4106 = _4098 * _4098;
    float _4108 = -_2762;
    float _4110 = _4108 + _4100;
    float _4112 = fma(_4104, _4104, _4106);
    float _4114 = fma(_4110, _4110, _4112);
    float _4116 = sqrt(_4114);
    bool _4118 = _4116 > 0.0;
    float _4120 = _4116;
    float _4122 = _4078;
    float _4124 = _4086;
    float _4126 = _4100;
    if (!_4118)
    {
        _4120 = _4094;
    }
    float _4128 = _4120;
    float _4130 = _4128;
    float _4132 = _4128;
    float _4134 = _4128;
    if (!_4118)
    {
        _4122 = _4088;
    }
    float _4136 = _4122;
    bool _4138 = !_4118;
    float _4140 = _4136;
    float _4142 = _4136;
    if (!_4138)
    {
        bool _4144 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _4146 = _4076;
        if (_4144)
        {
            float _4148 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _4146 = _4148;
        }
        float _4150 = _4146;
        float _4152 = _4150;
        if (_4144)
        {
            float _4154 = _481 * _4150;
            _4124 = _4154;
        }
        float _4156 = _4124;
        float _4158 = _4156;
        if (_4144)
        {
            float _4160 = _483 * _4150;
            _1580 = _4160;
        }
        float _4162 = _1580;
        float _4164 = _4162;
        if (_4144)
        {
            float _4166 = _485 * _4150;
            _4152 = _4166;
        }
        float _4168 = _4152;
        float _4170 = _4168;
        if (!_4144)
        {
            bool _4172 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _4174 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _4176 = _4172 || _4174;
            bool _4178 = isnan(1.0);
            bool _4180 = _4176 || _4178;
            float _4182 = _115 + 1.0;
            float _4184 = _4182;
            if (!_4180)
            {
                float _4186 = _4182 * _4182;
                float _4188 = _4186 * 0.5;
                _4130 = _4188;
            }
            float _4190 = _4130;
            float _4192 = _4190;
            if (!_4180)
            {
                float _4194 = _4190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4192 = _4194;
            }
            float _4196 = _4192;
            bool _4198 = !_4180;
            float _4200 = _4196;
            if (!_4198)
            {
                float _4202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4204 = log2(_4202);
                float _4206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4208 = _4204 * _4182;
                float _4210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4212 = _4210 + 1.0;
                float _4214 = 1.0 / _4212;
                float _4216 = _4206 * 0.693147182464599609375;
                float _4218 = exp2(_4208);
                float _4220 = 1.0 / _4216;
                float _4222 = _4218 + (-1.0);
                float _4224 = -_4222;
                float _4226 = fma(_4224, _4220, _4182);
                float _4228 = _4226 * _4214;
                float _4230 = _4228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4200 = _4230;
            }
            float _4232 = _4200;
            float _4234 = _4232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _4236 = _4232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _4238 = !_4180;
            _4140 = _4234;
            _4132 = _4232;
            if (!_4238)
            {
                float _4240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4242 = log2(_4240);
                float _4244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4246 = _4244 + 1.0;
                float _4248 = 1.0 / _4246;
                float _4250 = _4242 * _4182;
                float _4252 = exp2(_4250);
                float _4254 = -_4252;
                float _4256 = _4254 + 1.0;
                float _4258 = _4256 * _4248;
                _4184 = _4258;
            }
            float _4260 = _4184;
            float _4262 = fma(_4260, _177, _4236);
            float _4264 = fma(_4260, _175, _4234);
            float _4266 = _4232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _4268 = -_443;
            float _4270 = _4268 + _4262;
            float _4272 = -_441;
            float _4274 = _4272 + _4264;
            float _4276 = fma(_4260, _179, _4266);
            float _4278 = _4270 * _217;
            float _4280 = _4270 * _233;
            float _4282 = _4270 * _245;
            float _4284 = -_455;
            float _4286 = _4284 + _4276;
            float _4288 = fma(_4274, _215, _4278);
            float _4290 = fma(_4274, _231, _4280);
            float _4292 = fma(_4274, _243, _4282);
            float _4294 = fma(_4286, _219, _4288);
            float _4296 = fma(_4286, _235, _4290);
            float _4298 = fma(_4286, _247, _4292);
            _491 = _4296;
            _493 = _4294;
            _495 = _4298;
            _4158 = _4294;
            _4164 = _4296;
            _4170 = _4298;
        }
        float _4300 = _491;
        float _4302 = _493;
        float _4304 = _495;
        float _4306 = _4158;
        float _4308 = _4164;
        float _4310 = _4170;
        float _4312 = _4140;
        float _4314 = _4132;
        float _4316 = _4300 * _4300;
        float _4318 = rsqrt(_4114);
        float _4320 = fma(_4302, _4302, _4316);
        float _4322 = fma(_4304, _4304, _4320);
        float _4324 = sqrt(_4322);
        float _4326 = _4104 * _4318;
        float _4328 = _4098 * _4318;
        float _4330 = _4110 * _4318;
        bool _4332 = _4324 > 0.0;
        float _4334 = _4314;
        float _4336 = _4312;
        _273 = _4322;
        if (!_4332)
        {
            _4334 = _4094;
        }
        float _4338 = _4334;
        _4134 = _4338;
        if (!_4332)
        {
            _4336 = _4088;
        }
        float _4340 = _4336;
        bool _4342 = !_4332;
        _4142 = _4340;
        if (!_4342)
        {
            float _4344 = rsqrt(_4322);
            float _4346 = _4344 * _4300;
            float _4348 = _4344 * _4302;
            float _4350 = _4344 * _4304;
            float _4352 = _4328 * _4346;
            float _4354 = fma(_4326, _4348, _4352);
            float _4356 = fma(_4330, _4350, _4354);
            float _4358 = _4356 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4360 = fma(_4306, _4358, _4094);
            float _4362 = fma(_4308, _4358, _4088);
            float _4364 = fma(_4310, _4358, _4100);
            _4142 = _4362;
            _4134 = _4360;
            _4126 = _4364;
        }
    }
    float _4366 = _4142;
    float _4368 = _4134;
    float _4370 = _4126;
    float _4372 = _273;
    float _4374 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4376 = _4366 + _4374;
    float _4378 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4380 = _4368 + _4378;
    float _4382 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4384 = _4370 + _4382;
    float _4386 = _4376 * _4376;
    float _4388 = fma(_4380, _4380, _4386);
    float _4390 = fma(_4384, _4384, _4388);
    float _4392 = rsqrt(_4390);
    float _4394 = sqrt(_4390);
    float _4396 = _4392 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4398 = _4380 * _4396;
    float _4400 = _4384 * _4396;
    float _4402 = _4398 * _4398;
    float _4404 = _4400 * _4400;
    float _4406 = _4402 + _4404;
    float _4408 = sqrt(_4406);
    bool _4410 = _4408 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4412 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4414 = _4408 + _4412;
    float _4416 = _4392;
    float _4418 = _4406;
    float _4420 = _4414;
    float _4422 = _4372;
    float _4424 = _4376;
    if (_4410)
    {
        float _4426 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4416 = _4426;
    }
    float _4428 = _4416;
    if (_4410)
    {
        float _4430 = rsqrt(_4406);
        _4418 = _4430;
    }
    float _4432 = _4418;
    float _4434 = _4432;
    if (_4410)
    {
        float _4436 = _4414 * _4428;
        _4420 = _4436;
    }
    float _4438 = _4420;
    if (_4410)
    {
        float _4440 = _4438 * 0.15915493667125701904296875;
        _4422 = _4440;
    }
    float _4442 = _4422;
    float _4444 = _4384;
    if (_4410)
    {
        float _4446 = _4442 * 6.283185482025146484375;
        float _4448 = sin(_4446);
        _4444 = _4448;
    }
    float _4450 = _4444;
    float _4452 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4454 = precise::max(0.0, _4452);
    float _4456 = _4428;
    float _4458 = _4454;
    if (_4410)
    {
        float _4460 = _4442 * 6.283185482025146484375;
        float _4462 = cos(_4460);
        _4456 = _4462;
    }
    float _4464 = _4456;
    float _4466 = -_4396;
    float _4468 = -_4454;
    float _4470 = fma(_4376, _4466, _4468);
    if (_4410)
    {
        float _4472 = _4470 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4424 = _4472;
    }
    float _4474 = _4424;
    float _4476 = _4366 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4478 = _4474;
    float _4480 = _4450;
    if (_4410)
    {
        float _4482 = fma(_4450, _4474, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4478 = _4482;
    }
    float _4484 = _4478;
    float _4486 = _4484;
    if (!_4410)
    {
        _4480 = _4398;
    }
    float _4488 = _4480;
    float _4490 = _4488;
    float _4492 = _4464;
    if (_4410)
    {
        float _4494 = _4464 + (-1.0);
        _4458 = _4494;
    }
    float _4496 = _4458;
    float _4498 = _4496;
    if (_4410)
    {
        float _4500 = _4432 * _4484;
        _275 = _4500;
    }
    float _4502 = _275;
    if (!_4410)
    {
        _4486 = _4470;
    }
    float _4504 = _4486;
    float _4506 = _4504;
    if (_4410)
    {
        float _4508 = _4496 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _277 = _4508;
    }
    float _4510 = _277;
    if (_4410)
    {
        float _4512 = _4398 * _4502;
        _4490 = _4512;
    }
    float _4514 = _4490;
    if (!_4410)
    {
        _4498 = _4400;
    }
    float _4516 = _4498;
    float _4518 = _4516;
    if (_4410)
    {
        float _4520 = _4400 * _4502;
        _4518 = _4520;
    }
    float _4522 = _4518;
    if (!_4410)
    {
        _4434 = _4402;
    }
    float _4524 = _4434;
    float _4526 = _4524;
    if (_4410)
    {
        float _4528 = fma(_4470, _4464, _4510);
        _4506 = _4528;
    }
    float _4530 = _4506;
    if (_4410)
    {
        float _4532 = _4514 * _4514;
        _4526 = _4532;
    }
    float _4534 = _4526;
    if (!_4410)
    {
        _4492 = _4404;
    }
    float _4536 = _4492;
    float _4538 = _4536;
    if (_4410)
    {
        float _4540 = _4522 * _4522;
        _4538 = _4540;
    }
    float _4542 = _4538;
    float _4544 = fma(_4530, _4530, _4534);
    float _4546 = _4366 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4548 = _4544 + _4542;
    float _4550 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4552 = fma(_4394, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4550);
    float _4554 = precise::clamp(_4552, 0.0, 1.0);
    float _4556 = fma(_4368, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4476);
    float _4558 = _4366 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4560 = rsqrt(_4548);
    float _4562 = _4366 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4564 = -_4554;
    float _4566 = _4564 + 1.0;
    float _4568 = fma(_4368, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4558);
    float _4570 = fma(_4370, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4556);
    float _4572 = fma(_4368, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4562);
    float _4574 = fma(_4368, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4546);
    float _4576 = fma(_4370, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4568);
    float _4578 = abs(_4566);
    float _4580 = log2(_4578);
    float _4582 = fma(_4370, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4572);
    float _4584 = _4570 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4586 = _4576 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4588 = fma(_4370, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4574);
    float _4590 = _4582 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4592 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4594 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4596 = _4560 * _4514;
    float _4598 = _4560 * _4530;
    float _4600 = _4560 * _4522;
    float _4602 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4594);
    float _4604 = _4596 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4606 = _4584 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4608 = _4588 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4610 = fma(_4584, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4602);
    float _4612 = -_4604;
    float _4614 = fma(_4598, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4612);
    float _4616 = -_4606;
    float _4618 = fma(_4616, _4592, 1.0);
    float _4620 = _4580 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4622 = fma(_4608, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4610);
    float _4624 = -_4600;
    float _4626 = fma(_4624, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4614);
    float _4628 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4630 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4632 = log2(_4618);
    float _4634 = fma(_4626, -0.5, 0.5);
    float _4636 = fma(_4626, 0.5, 0.5);
    float _4638 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4628);
    float _4640 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4630);
    float _4642 = _4598 + 1.0;
    float _4644 = fma(_4636, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4646 = fma(_4584, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4638);
    float _4648 = exp2(_4620);
    float _4650 = fma(_4584, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4640);
    float _4652 = fma(_4636, _4644, -0.212114393711090087890625);
    float _4654 = fma(_4608, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4646);
    float _4656 = fma(_4608, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4650);
    float _4658 = fma(_4636, _4652, 1.570728778839111328125);
    float _4660 = 1.0 / _4622;
    float _4662 = _4632 * 0.693147182464599609375;
    float _4664 = sqrt(_4634);
    float _4666 = -_4598;
    float _4668 = fma(_4648, _4642, _4666);
    float _4670 = fma(_4668, 0.5, 0.5);
    float _4672 = _4654 * _4660;
    float _4674 = _4656 * _4660;
    float _4676 = _4662 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4678 = fma(_4672, 0.5, 0.5);
    float _4680 = fma(_4674, -0.5, 0.5);
    float _4682 = _4664 * 0.636619746685028076171875;
    float _4684 = -_4658;
    float _4686 = fma(_4682, _4684, 1.0);
    float3 _11645 = float3(_4678, _4680, _4676);
    float _4688 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11645, float3(0.0), isnan(_11645)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11645, float3(0.0), isnan(_11645)), level(0.0)).x;
    float3 _11656 = float3(_4678, _4680, _4676);
    float4 _4691 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11656, float3(0.0), isnan(_11656)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11656, float3(0.0), isnan(_11656)), level(0.0)).xyzw;
    float _4693 = _4691.x;
    float _4695 = _4691.y;
    float _4697 = _4691.z;
    float _4699 = _4691.w;
    float2 _11673 = float2(_4686, _4670);
    float3 _4703 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11673, float2(0.0), isnan(_11673)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11673, float2(0.0), isnan(_11673)), level(0.0)).xyz;
    float _4705 = _4703.x;
    float _4707 = _4703.y;
    float _4709 = _4703.z;
    float _4711 = _2764 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4713 = _4580 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4715 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4717 = fma(_2760, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4711);
    float _4719 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4715);
    float _4721 = exp2(_4713);
    float _4723 = fma(_2762, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4717);
    float _4725 = _2764 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4727 = _4723 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4729 = fma(_2760, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4725);
    float _4731 = 1.0 / _4727;
    bool _4733 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4735 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4737 = _4733 || _4735;
    bool _4739 = isnan(0.5);
    bool _4741 = _4737 || _4739;
    float _4743 = fma(_2762, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4729);
    float _4745 = fma(_4584, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4719);
    float _4747 = _4743 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4749 = fma(_4608, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4745);
    float _4751 = _4747 + _4727;
    float _4753 = _4590;
    if (_4741)
    {
        _4753 = 1.0;
    }
    float _4755 = _4753;
    float _4757 = _4751 * _4731;
    float _4759 = _4757 * 0.5;
    float _4761 = _4755;
    if (!_4741)
    {
        float _4763 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4765 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _4767 = fma(_4759, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4765);
        float _4769 = _4763 * 0.15915493667125701904296875;
        float _4771 = _4769 * 6.283185482025146484375;
        float _4773 = cos(_4771);
        float _4775 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4777 = _4775 * 0.15915493667125701904296875;
        float _4779 = _4769 * 6.283185482025146484375;
        float _4781 = sin(_4779);
        float _4783 = 1.0 / _4773;
        float _4785 = _4777 * 6.283185482025146484375;
        float _4787 = cos(_4785);
        float _4789 = _4781 * _4783;
        float _4791 = 1.0 / _4767;
        float _4793 = _4787 * _4789;
        float _4795 = _4777 * 6.283185482025146484375;
        float _4797 = sin(_4795);
        float _4799 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4801 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4799;
        float _4803 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _4805 = _4791 * _4803;
        float _4807 = 1.0 / _4793;
        float _4809 = 1.0 / _4801;
        float _4811 = _4797 * _4807;
        float _4813 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4815 = fma(_4811, _4805, _4813);
        float _4817 = _4815 * _4809;
        float _4819 = precise::clamp(_4817, 0.0, 1.0);
        _4761 = _4819;
    }
    float _4821 = _4761;
    float _4823 = -_4721;
    float _4825 = _4823 + 1.0;
    float _4827 = _4749 + _4622;
    bool _4829 = _4821 > 0.0;
    bool _4831 = isnan(_4821);
    bool _4833 = _4829 || _4831;
    bool _4835 = isnan(0.0);
    bool _4837 = _4833 || _4835;
    float _4839 = _4821 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4841 = _4825 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4843 = _4827 * 0.5;
    float _4845 = _4841 * _4688;
    float _4847 = -_4841;
    float _4849 = _4847 + 1.0;
    out.gl_Position.x = _4654;
    out.gl_Position.y = _4656;
    out.gl_Position.z = _4749;
    out.gl_Position.w = _4622;
    float _4851 = _4839 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4853 = _4699 * _4845;
    float _4855 = _4709 * _4845;
    out.m_86.x = _4368;
    out.m_86.y = _4366;
    out.m_86.z = _4370;
    float _4857 = fma(_4705, _4853, _4693);
    float _4859 = fma(_4707, _4853, _4695);
    float _4861 = _4699 * _4849;
    float _4863 = fma(_4699, _4855, _4697);
    out.m_88.z = _4843;
    out.m_88.w = _4622;
    out.m_51.x = _4851;
    out.m_90.x = _4857;
    out.m_90.y = _4859;
    out.m_90.z = _4863;
    out.m_90.w = _4861;
    if (_4837)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _4865 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4865;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4046 = false;
    bool _969 = false;
    bool _755 = false;
    bool _619 = false;
    bool _515 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_44.w;
    float _106 = in.m_46.w;
    float _108 = trunc(_104);
    int _111 = int(_108);
    float _113 = -_106;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _115;
    bool _119 = _111 >= 1;
    float _121 = 0.0;
    float _123 = as_type<float>(_111);
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _121;
    if (!_119)
    {
        out.m_51.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _125 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4933 = as_type<float>(_131);
        out.gl_Position.z = _4933;
    }
    if (!_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _135 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_106);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = float(_111);
    bool _147 = _115 >= _145;
    bool _149 = !_143;
    bool _151 = _147 || _149;
    if (_151)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _123;
    if (_151)
    {
        out.m_51.x = 0.0;
    }
    if (_151)
    {
        float _155 = _153 * 5.0;
        _133 = as_type<int>(_155);
    }
    int _157 = _133;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4988 = as_type<float>(_157);
        out.gl_Position.z = _4988;
    }
    if (_151)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _163 = in.m_56.w;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = in.m_46.x;
    float _177 = in.m_46.y;
    float _179 = in.m_46.z;
    int _181 = int(_151);
    int _183 = false ? 2 : 0;
    int _185 = _181 | _183;
    int _187 = _173 ? 4 : 0;
    int _189 = _185 | _187;
    int _191 = false ? 8 : 0;
    int _193 = _189 | _191;
    int _195 = false ? 16 : 0;
    int _197 = _193 | _195;
    int _199 = false ? 32 : 0;
    int _201 = _197 | _199;
    int _203 = false ? 64 : 0;
    int _205 = _201 | _203;
    int _207 = _205 & 4;
    float _209 = in.m_44.x;
    float _211 = in.m_44.y;
    float _213 = in.m_44.z;
    float _215 = in.m_58.x;
    float _217 = in.m_58.y;
    float _219 = in.m_58.z;
    float _221 = as_type<float>(_207);
    float _223 = _161;
    if (!_173)
    {
        float _225 = _161 * _161;
        float _227 = _225 * 0.5;
        _221 = _227;
    }
    float _229 = _221;
    float _231 = in.m_60.x;
    float _233 = in.m_60.y;
    float _235 = in.m_60.z;
    float _237 = _229;
    if (!_173)
    {
        float _239 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _237 = _239;
    }
    float _241 = _237;
    float _243 = in.m_62.x;
    float _245 = in.m_62.y;
    float _247 = in.m_62.z;
    int _249 = as_type<int>(_159) & 1;
    bool _251 = _249 != 0;
    int _253 = as_type<int>(_159) & 2;
    bool _255 = _253 != 0;
    bool _257 = !_251;
    float _259 = _257 ? (-0.5) : 0.5;
    bool _261 = !_255;
    float _263 = _261 ? (-0.5) : 0.5;
    bool _265 = !_173;
    float _267 = _241;
    float _269 = 0.0;
    float _271 = 0.0;
    float _273 = _217;
    float _275 = _243;
    float _277 = _219;
    if (!_265)
    {
        float _279 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _281 = log2(_279);
        float _283 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _285 = _283 + 1.0;
        float _287 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _289 = _161 * _281;
        float _291 = 1.0 / _285;
        float _293 = _287 * 0.693147182464599609375;
        float _295 = exp2(_289);
        float _297 = 1.0 / _293;
        float _299 = _295 + (-1.0);
        float _301 = -_299;
        float _303 = fma(_301, _297, _161);
        float _305 = _303 * _291;
        float _307 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _267 = _307;
        _269 = _291;
        _271 = _297;
    }
    float _309 = _267;
    float _311 = _269;
    float _313 = _271;
    bool _315 = !_173;
    float _317 = _313;
    float _319 = _311;
    float _321 = _309;
    if (!_315)
    {
        float _323 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _325 = log2(_323);
        float _327 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _329 = _327 + 1.0;
        float _331 = 1.0 / _329;
        float _333 = _161 * _325;
        float _335 = exp2(_333);
        float _337 = -_335;
        float _339 = _337 + 1.0;
        float _341 = _339 * _331;
        _223 = _341;
        _317 = _329;
    }
    float _343 = _223;
    float _345 = _317;
    float _347 = _345;
    if (!_173)
    {
        float _349 = _115 * _115;
        float _351 = _349 * 0.5;
        _319 = _351;
    }
    float _353 = _319;
    float _355 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _357 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _359 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_173)
    {
        _347 = _115;
    }
    float _361 = _347;
    float _363 = fma(_343, _175, _355);
    float _365 = fma(_343, _177, _357);
    float _367 = _361;
    if (!_173)
    {
        float _369 = _353 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _321 = _369;
    }
    float _371 = _321;
    bool _373 = !_173;
    float _375 = _371;
    if (!_373)
    {
        float _377 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _379 = log2(_377);
        float _381 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _383 = _381 + 1.0;
        float _385 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _387 = _115 * _379;
        float _389 = 1.0 / _383;
        float _391 = _385 * 0.693147182464599609375;
        float _393 = exp2(_387);
        float _395 = 1.0 / _391;
        float _397 = _393 + (-1.0);
        float _399 = -_397;
        float _401 = fma(_399, _395, _115);
        float _403 = _401 * _389;
        float _405 = _403 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _375 = _405;
    }
    float _407 = _375;
    bool _409 = !_173;
    if (!_409)
    {
        float _411 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _413 = log2(_411);
        float _415 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _417 = _415 + 1.0;
        float _419 = 1.0 / _417;
        float _421 = _115 * _413;
        float _423 = exp2(_421);
        float _425 = -_423;
        float _427 = _425 + 1.0;
        float _429 = _427 * _419;
        _367 = _429;
    }
    float _431 = _367;
    float _433 = _407 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _435 = _407 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _437 = _407 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _439 = fma(_343, _179, _359);
    float _441 = fma(_431, _175, _433);
    float _443 = fma(_431, _177, _435);
    float _445 = 1.0 / _145;
    bool _447 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _449 = fma(_365, _163, _211);
    float _451 = -_443;
    float _453 = _365 + _451;
    float _455 = fma(_431, _179, _437);
    float _457 = fma(_363, _163, _209);
    float _459 = -_441;
    float _461 = _363 + _459;
    float _463 = _453 * _217;
    float _465 = _453 * _233;
    float _467 = _453 * _245;
    float _469 = -_455;
    float _471 = _439 + _469;
    float _473 = fma(_461, _215, _463);
    float _475 = fma(_461, _231, _465);
    float _477 = fma(_461, _243, _467);
    float _479 = fma(_439, _163, _213);
    float _481 = fma(_471, _219, _473);
    float _483 = fma(_471, _235, _475);
    float _485 = fma(_471, _247, _477);
    float _487 = _115 * _445;
    bool _489 = !_447;
    float _491 = _483;
    float _493 = _481;
    float _495 = _485;
    float _513;
    if (!_489)
    {
        float _497 = in.m_64.x;
        float _499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _501 = _497 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _503 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _505 = _503 * _499;
        float _507 = floor(_505);
        float _509 = -_507;
        float _511 = _505 + _509;
        _513 = _511;
        _515 = true;
    }
    else
    {
        _513 = _487;
    }
    _515 = false;
    float _517 = _513;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _521 = _517 + _519;
    float _523 = in.m_56.x;
    float _525 = in.m_56.y;
    bool _527 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _529 = isnan(_517);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _539;
    bool _543 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _545 = isnan(_517);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = -_537;
    float _557 = _555 + 1.0;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _559;
    float _563 = 1.0 / _541;
    bool _565 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _567 = _553 * _557;
    float _569 = -_553;
    float _571 = _569 + 1.0;
    float _573 = _521 * _563;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _575;
    float _579 = fma(_561, _573, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _581 = fma(_577, _573, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _583 = _579 * _567;
    float _585 = _581 * _567;
    float _587 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[143].x, _583);
    float _589 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[143].y, _585);
    float _591 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[144].x, _587);
    float _593 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[144].y, _589);
    float _595 = _591 * _523;
    float _597 = _593 * _525;
    bool _599 = !_565;
    float _617;
    if (!_599)
    {
        float _601 = in.m_64.x;
        float _603 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _605 = _601 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _607 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[11].y, _115);
        float _609 = _607 * _603;
        float _611 = floor(_609);
        float _613 = -_611;
        float _615 = _609 + _613;
        _617 = _615;
        _619 = true;
    }
    else
    {
        _617 = _487;
    }
    _619 = false;
    float _621 = _617;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _625 = _621 + _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _631 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _633 = isnan(_621);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _645 = _643 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _647 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _649 = isnan(_621);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _659;
    bool _663 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _665 = isnan(_621);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = 1.0 / _629;
    float _677 = -_641;
    float _679 = _677 + 1.0;
    bool _681 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _683 = _657 * _679;
    float _685 = -_657;
    float _687 = _685 + 1.0;
    float _689 = 1.0 / _645;
    float _691 = _661 * _675;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _697 = fma(_691, _625, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _699 = -_673;
    float _701 = _699 + 1.0;
    float _703 = _697 * _683;
    float _705 = _695 * _689;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _709 = _621 + _707;
    float _711 = _641 * _701;
    float _713 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[115].x, _703);
    float _715 = fma(_705, _709, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _717 = fma(_715, _711, _713);
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _725 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[117].x, _717);
    float _727 = _719 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _729 = _721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _731 = _723 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _733 = _725 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _727;
    out.m_66.y = _729;
    out.m_66.z = _731;
    out.m_66.w = _733;
    bool _735 = !_681;
    float _753;
    if (!_735)
    {
        float _737 = in.m_64.x;
        float _739 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _741 = _737 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _743 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[11].w, _115);
        float _745 = _743 * _739;
        float _747 = floor(_745);
        float _749 = -_747;
        float _751 = _745 + _749;
        _753 = _751;
        _755 = true;
    }
    else
    {
        _753 = _487;
    }
    _755 = false;
    float _757 = _753;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _761 = _757 + _759;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _771;
    bool _775 = _757 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _777 = isnan(_757);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = 1.0 / _765;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _797 = _757 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _799 = isnan(_757);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    bool _809 = _757 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _811 = isnan(_757);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _817 = _813 || _815;
    float _819 = float(_817);
    float _821 = 1.0 / _769;
    bool _823 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _825 = _773 * _787;
    bool _827 = _757 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _829 = isnan(_757);
    bool _831 = _827 || _829;
    bool _833 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _835 = _831 || _833;
    float _837 = float(_835);
    float _839 = 1.0 / _791;
    float _841 = -_785;
    float _843 = _841 + 1.0;
    float _845 = fma(_825, _761, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _847 = -_837;
    float _849 = _847 + 1.0;
    float _851 = _837 * _843;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _855 = _853 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _857;
    float _861 = 1.0 / _795;
    float _863 = -_807;
    float _865 = _863 + 1.0;
    float _867 = _819 * _849;
    float _869 = _855 * _821;
    float _871 = -_819;
    float _873 = _871 + 1.0;
    float _875 = _785 * _865;
    float _877 = _845 * _867;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _881 = _757 + _879;
    float _883 = _859 * _839;
    bool _885 = _757 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _887 = isnan(_757);
    bool _889 = _885 || _887;
    bool _891 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _893 = _889 || _891;
    float _895 = float(_893);
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _899 = _897 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _903 = _757 + _901;
    float _905 = fma(_869, _881, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _907 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[131].x, _877);
    float _909 = -_895;
    float _911 = _909 + 1.0;
    float _913 = fma(_883, _903, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _915 = _899 * _861;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _919 = _757 + _917;
    float _921 = fma(_905, _851, _907);
    float _923 = _807 * _911;
    float _925 = fma(_915, _919, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _927 = fma(_913, _875, _921);
    float _929 = fma(_925, _923, _927);
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _937 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[135].x, _929);
    float _939 = _931 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _941 = _933 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _943 = _935 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _945 = _937 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_68.x = _939;
    out.m_68.y = _941;
    out.m_68.z = _943;
    out.m_68.w = _945;
    bool _947 = !_823;
    float _949 = _807;
    float _967;
    if (!_947)
    {
        float _951 = in.m_64.x;
        float _953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _955 = _951 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _957 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[14].x, _115);
        float _959 = _957 * _953;
        float _961 = floor(_959);
        float _963 = -_961;
        float _965 = _959 + _963;
        _967 = _965;
        _969 = true;
    }
    else
    {
        _967 = _487;
    }
    _969 = false;
    float _971 = _967;
    float _973 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _975 = int(_973);
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _979 = _977 != 0;
    float _981 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _983 = int(_981);
    float _985 = 0.0;
    int _987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_979)
    {
        _985 = 1.0;
    }
    float _989 = _985;
    float _991 = float(_975);
    float _993 = 0.0;
    float _995 = _989;
    if (_979)
    {
        _993 = 1.0;
    }
    float _997 = _993;
    float _999 = 0.0;
    float _1001 = _997;
    if (_979)
    {
        _999 = 1.0;
    }
    float _1003 = _999;
    int _1005 = 0;
    float _1007 = _1003;
    if (_979)
    {
        _1005 = 0;
    }
    int _1009 = _1005;
    float _1011 = 1.0 / _991;
    float _1013 = _875;
    int _1015 = _1009;
    if (_979)
    {
        float _1017 = in.m_64.x;
        _1013 = _1017;
    }
    float _1019 = _1013;
    float _1021 = float(uint(_983));
    if (_979)
    {
        _987 = 0;
    }
    int _1023 = _987;
    float _1025 = 1.0 / _1021;
    float _1027 = _115 * _1011;
    int _1029 = ~_983;
    int _1031 = _1029 + 1;
    float _1033 = trunc(_1027);
    int _1035 = int(_1033);
    int _1037 = as_type<int>(_1025) + (-2);
    float _1039 = _1019;
    int _1041 = _1023;
    if (_979)
    {
        _949 = _1019;
    }
    float _1043 = _949;
    float _1045 = float(uint(_1035));
    float _1047 = as_type<float>(_1037) * _1045;
    float _1049 = trunc(_1047);
    float _1051 = precise::max(_1049, 0.0);
    uint _1054 = uint(_1051);
    int _1056 = ~_983;
    int _1058 = _1056 + 1;
    int _1060 = _1031 * int(_1054);
    int _1062 = _1060 + _1035;
    float _1064 = float(uint(_1062));
    float _1066 = as_type<float>(_1037) * _1064;
    float _1068 = in.m_64.x;
    float _1070 = in.m_64.y;
    float _1072 = in.m_64.z;
    float _1074 = in.m_64.w;
    float _1076 = trunc(_1066);
    float _1078 = precise::max(_1076, 0.0);
    uint _1080 = uint(_1078);
    int _1082 = int(_1054) + int(_1080);
    float _1084 = _1043;
    if (!_979)
    {
        float _1086 = in.m_64.y;
        float _1088 = in.m_64.z;
        _995 = 7.345489978790283203125;
        _1084 = _1088;
        _1007 = 5.839270114898681640625;
        _1015 = 1;
        _1039 = _1086;
        _1001 = 1.2345600128173828125;
        _1041 = 2;
    }
    float _1090 = _995;
    float _1092 = _1084;
    float _1094 = _1007;
    int _1096 = _1015;
    float _1098 = _1039;
    float _1100 = _1001;
    int _1102 = _1041;
    float _1104 = float(_983);
    float _1106 = _1068 * _1090;
    float _1108 = float(_1035);
    int _1110 = _1058 * _1082;
    int _1112 = _1110 + _1035;
    float _1114 = floor(_1106);
    bool _1116 = _1108 >= _1104;
    bool _1118 = isnan(_1108);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan(_1104);
    bool _1124 = _1120 || _1122;
    float _1126 = float(_1124);
    float _1128 = _1092 * _1094;
    bool _1130 = uint(_1112) >= uint(_983);
    bool _1132 = _1096 != 1;
    bool _1134 = _1070 > 0.5;
    float _1136 = _1072 * 2.0;
    bool _1138 = _1072 > 0.5;
    float _1140 = trunc(_1126);
    int _1142 = int(_1140);
    int _1144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1146 = _1144 != 0;
    float _1148 = _597 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1150 = !_1130;
    int _1152 = _1150 ? 0 : (-1);
    float _1154 = _595 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1158 = _1156 != 0;
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1162 = _1160 != 0;
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1166 = _1164 != 0;
    float _1168 = _1068 + _1070;
    float _1170 = -_259;
    int _1172 = _1134 ? as_type<int>(_1170) : as_type<int>(_259);
    float _1174 = -_1114;
    float _1176 = _1106 + _1174;
    float _1178 = -_263;
    int _1180 = _1138 ? as_type<int>(_1178) : as_type<int>(_263);
    float _1182 = floor(_1136);
    int _1184 = ~_1082;
    int _1186 = _1184 + _1152;
    int _1188 = _1186 + 1;
    float _1190 = _1176 * _1104;
    float _1192 = _487 * _1104;
    bool _1194 = !_1162;
    float _1196 = _1194 ? _259 : as_type<float>(_1172);
    float _1198 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1200 = int(_1146);
    int _1202 = _1130 ? 2 : 0;
    int _1204 = _1200 | _1202;
    int _1206 = _1138 ? 4 : 0;
    int _1208 = _1204 | _1206;
    int _1210 = _1158 ? 8 : 0;
    int _1212 = _1208 | _1210;
    int _1214 = _1162 ? 16 : 0;
    int _1216 = _1212 | _1214;
    int _1218 = _1166 ? 32 : 0;
    int _1220 = _1216 | _1218;
    int _1222 = _1134 ? 64 : 0;
    int _1224 = _1220 | _1222;
    int _1226 = _1224 & 64;
    float _1228 = trunc(_1190);
    int _1230 = int(_1228);
    bool _1232 = !_1166;
    float _1234 = _1232 ? _263 : as_type<float>(_1180);
    int _1236 = _983 * _1188;
    int _1238 = _1236 + _1035;
    int _1240 = int(_1146);
    int _1242 = _1130 ? 2 : 0;
    int _1244 = _1240 | _1242;
    int _1246 = _1138 ? 4 : 0;
    int _1248 = _1244 | _1246;
    int _1250 = _1158 ? 8 : 0;
    int _1252 = _1248 | _1250;
    int _1254 = _1162 ? 16 : 0;
    int _1256 = _1252 | _1254;
    int _1258 = _1166 ? 32 : 0;
    int _1260 = _1256 | _1258;
    int _1262 = _1134 ? 64 : 0;
    int _1264 = _1260 | _1262;
    int _1266 = _1264 & 4;
    float _1268 = _1070 + _1072;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1272 = _1270 != 0;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1276 = _1274 != 0;
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1280 = _1278 != 0;
    float _1282 = _1068 + _1072;
    bool _1284 = _983 == 0;
    float _1286 = trunc(_1192);
    int _1288 = int(_1286);
    int _1290 = ~_1142;
    int _1292 = _1290 + 1;
    int _1294 = _1292 + 1;
    float _1296 = _1168 + (-1.0);
    bool _1298 = !_1284;
    int _1300 = _1298 ? _1238 : (-1);
    float _1302 = _1268 + (-1.0);
    float _1304 = _1282 + (-1.0);
    int _1306 = _983 + (-1);
    int _1308 = _1300 * _1294;
    bool _1310 = !_1276;
    int _1312 = _1310 ? 0 : 1;
    bool _1314 = !_1146;
    int _1316 = _1314 ? 0 : 1;
    int _1318 = _1142 * _1306;
    int _1320 = _1318 + _1308;
    bool _1322 = !_1272;
    int _1324 = _1322 ? 0 : 1;
    int _1326 = abs(_1312);
    int _1328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1330 = _1328 != 0;
    int _1332 = abs(_1316);
    int _1334 = _1320 * _1326;
    bool _1336 = !_1280;
    int _1338 = _1336 ? 0 : 1;
    int _1340 = abs(_1324);
    int _1342 = _1230 * _1332;
    int _1344 = _1342 + _1035;
    bool _1346 = !_1330;
    int _1348 = _1346 ? 0 : 1;
    int _1350 = abs(_1338);
    int _1352 = abs(_1348);
    int _1354 = _1288 * _1340;
    int _1356 = _1354 + _1334;
    int _1358 = ~_983;
    int _1360 = _1358 + 1;
    int _1362 = _1344 * _1350;
    int _1364 = _1362 + _1356;
    bool _1366 = _1074 > 0.5;
    float _1368 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1370 = int(_1368);
    int _1372 = ~_983;
    int _1374 = _1372 + 1;
    int _1376 = _1230 * _1352;
    int _1378 = _1376 + _1364;
    int _1380 = ~_983;
    int _1382 = _1380 + 1;
    float _1384 = -_263;
    int _1386 = _1366 ? as_type<int>(_1384) : as_type<int>(_263);
    float _1388 = float(uint(_1378));
    bool _1390 = !_1158;
    float _1392 = _1390 ? _263 : as_type<float>(_1386);
    float _1394 = as_type<float>(_1037) * _1388;
    float _1396 = trunc(_1394);
    float _1398 = precise::max(_1396, 0.0);
    uint _1400 = uint(_1398);
    float _1402 = float(_1370);
    float _1404 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1406 = 1.0 + _1404;
    float _1408 = 1.0 / _1406;
    float _1410 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1412 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1414 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1412;
    int _1416 = _1382 * int(_1400);
    int _1418 = _1416 + _1378;
    float _1420 = _449 * _245;
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1424 = _1422 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1426 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1428 = fma(_457, _243, _1420);
    float _1430 = float(uint(_1418));
    float _1432 = fma(_1302, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1434 = as_type<float>(_1037) * _1430;
    float _1436 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1438 = trunc(_1434);
    float _1440 = precise::max(_1438, 0.0);
    uint _1442 = uint(_1440);
    int _1444 = int(_1400) + int(_1442);
    float _1446 = 1.0 / _1402;
    int _1448 = _1360 * _1444;
    int _1450 = _1448 + _1378;
    bool _1452 = uint(_1450) >= uint(_983);
    bool _1454 = !_1452;
    int _1456 = _1454 ? 0 : (-1);
    int _1458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1460 = _1458 != 0;
    int _1462 = ~_1444;
    int _1464 = _1462 + _1456;
    int _1466 = _1464 + 1;
    float _1468 = _115 * _1446;
    bool _1470 = !_1460;
    int _1472 = _1470 ? 0 : 1;
    int _1474 = _983 * _1466;
    int _1476 = _1474 + _1378;
    float _1478 = trunc(_1468);
    int _1480 = int(_1478);
    int _1482 = abs(_1472);
    bool _1484 = !_1284;
    int _1486 = _1484 ? _1476 : (-1);
    int _1488 = _1486 & 3;
    bool _1490 = _1488 != 0;
    int _1492 = _1490 ? 0 : 1;
    int _1494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1496 = _1494 != 0;
    int _1498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1500 = _1498 != 0;
    int _1502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1504 = _1502 != 0;
    int _1506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1508 = _1506 != 0;
    int _1510 = _1486 & 3;
    bool _1512 = _1510 != 0;
    int _1514 = ~_1492;
    int _1516 = _1514 + 1;
    int _1518 = _1516 + 1;
    bool _1520 = !_1500;
    int _1522 = _1520 ? 0 : 1;
    bool _1524 = uint(_1510) > 1u;
    float _1526 = float(uint(_1480));
    int _1528 = int(_1496);
    int _1530 = _1524 ? 2 : 0;
    int _1532 = _1528 | _1530;
    int _1534 = _1504 ? 4 : 0;
    int _1536 = _1532 | _1534;
    int _1538 = _1508 ? 8 : 0;
    int _1540 = _1536 | _1538;
    int _1542 = _1512 ? 16 : 0;
    int _1544 = _1540 | _1542;
    int _1546 = _1276 ? 32 : 0;
    int _1548 = _1544 | _1546;
    int _1550 = _1280 ? 64 : 0;
    int _1552 = _1548 | _1550;
    int _1554 = _1552 & 16;
    int _1556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1558 = _1556 != 0;
    int _1560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1562 = _1560 != 0;
    int _1564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1566 = _1564 != 0;
    bool _1568 = !_1496;
    int _1570 = _1568 ? 0 : 1;
    float _1572 = float(_1480);
    bool _1574 = !_1562;
    int _1576 = _1574 ? 0 : 1;
    int _1578 = _1518;
    float _1580 = _1234;
    if (!_1524)
    {
        int _1582 = ~_1492;
        int _1584 = _1582 + 1;
        _1578 = _1584;
    }
    int _1586 = _1578;
    float _1588 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1590 = int(_1588);
    bool _1592 = _1266 != 0;
    bool _1594 = !_1504;
    int _1596 = _1594 ? 0 : 1;
    int _1598 = abs(_1522);
    int _1600 = abs(_1596);
    bool _1602 = !_1508;
    int _1604 = _1602 ? 0 : 1;
    int _1606 = abs(_1576);
    int _1608 = abs(_1604);
    float _1610 = float(uint(_1590));
    int _1612 = ~_1590;
    int _1614 = _1612 + 1;
    float _1616 = 1.0 / _1610;
    int _1618 = ~_1590;
    int _1620 = _1618 + 1;
    float _1622 = float(_1590);
    bool _1624 = _1590 == 0;
    bool _1626 = _1572 >= _1622;
    bool _1628 = isnan(_1572);
    bool _1630 = _1626 || _1628;
    bool _1632 = isnan(_1622);
    bool _1634 = _1630 || _1632;
    float _1636 = float(_1634);
    float _1638 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1640 = int(_1638);
    int _1642 = as_type<int>(_1616) + (-2);
    float _1644 = trunc(_1636);
    int _1646 = int(_1644);
    float _1648 = as_type<float>(_1642) * _1526;
    int _1650 = ~_1640;
    int _1652 = _1650 + 1;
    float _1654 = trunc(_1648);
    float _1656 = precise::max(_1654, 0.0);
    uint _1658 = uint(_1656);
    int _1660 = _1614 * int(_1658);
    int _1662 = _1660 + _1480;
    float _1664 = float(uint(_1662));
    float _1666 = as_type<float>(_1642) * _1664;
    float _1668 = trunc(_1666);
    float _1670 = precise::max(_1668, 0.0);
    uint _1672 = uint(_1670);
    int _1674 = int(_1658) + int(_1672);
    float _1676 = float(uint(_1640));
    int _1678 = _1620 * _1674;
    int _1680 = _1678 + _1480;
    float _1682 = 1.0 / _1676;
    bool _1684 = uint(_1680) >= uint(_1590);
    bool _1686 = !_1684;
    int _1688 = _1686 ? 0 : (-1);
    float _1690 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1692 = int(_1690);
    int _1694 = ~_1674;
    int _1696 = _1694 + _1688;
    int _1698 = _1696 + 1;
    int _1700 = as_type<int>(_1682) + (-2);
    int _1702 = ~_1640;
    int _1704 = _1702 + 1;
    float _1706 = float(_1692);
    float _1708 = 1.0 / _1706;
    float _1710 = _115 * _1708;
    float _1712 = trunc(_1710);
    int _1714 = int(_1712);
    float _1716 = float(uint(_1714));
    float _1718 = as_type<float>(_1700) * _1716;
    float _1720 = trunc(_1718);
    float _1722 = precise::max(_1720, 0.0);
    uint _1724 = uint(_1722);
    int _1726 = _1652 * int(_1724);
    int _1728 = _1726 + _1714;
    float _1730 = float(uint(_1728));
    float _1732 = as_type<float>(_1700) * _1730;
    float _1734 = trunc(_1732);
    float _1736 = precise::max(_1734, 0.0);
    uint _1738 = uint(_1736);
    int _1740 = int(_1724) + int(_1738);
    float _1742 = _1098 * _1100;
    bool _1744 = !_1558;
    int _1746 = _1744 ? 0 : 1;
    bool _1748 = _1226 != 0;
    float _1750 = floor(_1742);
    int _1752 = ~_1646;
    int _1754 = _1752 + 1;
    int _1756 = _1754 + 1;
    int _1758 = _1704 * _1740;
    int _1760 = _1758 + _1714;
    int _1762 = abs(_1746);
    bool _1764 = uint(_1760) >= uint(_1640);
    bool _1766 = !_1764;
    int _1768 = _1766 ? 0 : (-1);
    int _1770 = ~_1740;
    int _1772 = _1770 + _1768;
    int _1774 = _1772 + 1;
    float _1776 = -_1750;
    float _1778 = _1742 + _1776;
    int _1780 = _1590 + (-1);
    float _1782 = _1778 * _1622;
    int _1784 = _1590 * _1698;
    int _1786 = _1784 + _1480;
    float _1788 = _487 * _1622;
    bool _1790 = !_1624;
    int _1792 = _1790 ? _1786 : (-1);
    float _1794 = trunc(_1782);
    int _1796 = int(_1794);
    int _1798 = _1792 * _1756;
    float _1800 = _1070 * 2.0;
    float _1802 = trunc(_1788);
    int _1804 = int(_1802);
    int _1806 = _1646 * _1780;
    int _1808 = _1806 + _1798;
    int _1810 = abs(_1570);
    int _1812 = _1808 * _1598;
    float _1814 = floor(_1800);
    int _1816 = _1796 * _1482;
    int _1818 = _1816 + _1480;
    int _1820 = ~_1590;
    int _1822 = _1820 + 1;
    int _1824 = _1804 * _1810;
    int _1826 = _1824 + _1812;
    bool _1828 = !_1566;
    int _1830 = _1828 ? 0 : 1;
    int _1832 = _1818 * _1600;
    int _1834 = _1832 + _1826;
    int _1836 = ~_1590;
    int _1838 = _1836 + 1;
    int _1840 = abs(_1830);
    int _1842 = _1796 * _1608;
    int _1844 = _1842 + _1834;
    float _1846 = float(uint(_1844));
    float _1848 = as_type<float>(_1642) * _1846;
    float _1850 = trunc(_1848);
    float _1852 = precise::max(_1850, 0.0);
    uint _1854 = uint(_1852);
    float _1856 = floor(_1128);
    int _1858 = _1838 * int(_1854);
    int _1860 = _1858 + _1844;
    float _1862 = float(uint(_1860));
    float _1864 = as_type<float>(_1642) * _1862;
    float _1866 = trunc(_1864);
    float _1868 = precise::max(_1866, 0.0);
    uint _1870 = uint(_1868);
    int _1872 = int(_1854) + int(_1870);
    float _1874 = _1068 * 2.0;
    int _1876 = _1822 * _1872;
    int _1878 = _1876 + _1844;
    float _1880 = floor(_1874);
    bool _1882 = uint(_1878) >= uint(_1590);
    float _1884 = float(_1714);
    bool _1886 = !_1882;
    int _1888 = _1886 ? 0 : (-1);
    int _1890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1892 = _1890 != 0;
    int _1894 = ~_1872;
    int _1896 = _1894 + _1888;
    int _1898 = _1896 + 1;
    bool _1900 = !_1892;
    int _1902 = _1900 ? 0 : 1;
    int _1904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1906 = _1904 != 0;
    int _1908 = abs(_1902);
    bool _1910 = !_1906;
    int _1912 = _1910 ? 0 : 1;
    bool _1914 = _1880 >= 0.0;
    bool _1916 = isnan(_1880);
    bool _1918 = _1914 || _1916;
    bool _1920 = isnan(0.0);
    bool _1922 = _1918 || _1920;
    int _1924 = abs(_1912);
    int _1926 = _1922 ? 0 : 1;
    bool _1928 = _1880 > 0.0;
    float _1930 = -_1856;
    float _1932 = _1128 + _1930;
    int _1934 = ~_1926;
    int _1936 = _1934 + 1;
    int _1938 = _1936 + 1;
    int _1940 = _1640 * _1774;
    int _1942 = _1940 + _1714;
    int _1944 = _1938;
    float _1946 = as_type<float>(_1872);
    if (!_1928)
    {
        int _1948 = ~_1926;
        int _1950 = _1948 + 1;
        _1944 = _1950;
    }
    int _1952 = _1944;
    float _1954 = float(_1640);
    bool _1956 = _1814 >= 0.0;
    bool _1958 = isnan(_1814);
    bool _1960 = _1956 || _1958;
    bool _1962 = isnan(0.0);
    bool _1964 = _1960 || _1962;
    bool _1966 = _1884 >= _1954;
    bool _1968 = isnan(_1884);
    bool _1970 = _1966 || _1968;
    bool _1972 = isnan(_1954);
    bool _1974 = _1970 || _1972;
    float _1976 = float(_1974);
    float _1978 = _1932 * _1954;
    float _1980 = _1964 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1982 = _487 * _1954;
    bool _1984 = _1814 > 0.0;
    float _1986 = trunc(_1978);
    int _1988 = int(_1986);
    int _1990 = ~as_type<int>(_1980);
    int _1992 = _1990 + 1;
    int _1994 = _1992 + 1;
    float _1996 = trunc(_1976);
    int _1998 = int(_1996);
    int _2000 = _1994;
    float _2002 = _1980;
    if (!_1984)
    {
        int _2004 = ~as_type<int>(_1980);
        int _2006 = _2004 + 1;
        _2000 = _2006;
    }
    int _2008 = _2000;
    bool _2010 = _1640 == 0;
    float _2012 = trunc(_1982);
    int _2014 = int(_2012);
    bool _2016 = !_2010;
    int _2018 = _2016 ? _1942 : (-1);
    int _2020 = _1640 + (-1);
    int _2022 = ~_1998;
    int _2024 = _2022 + 1;
    int _2026 = _2024 + 1;
    int _2028 = _2018 * _2026;
    int _2030 = ~_1640;
    int _2032 = _2030 + 1;
    int _2034 = _1998 * _2020;
    int _2036 = _2034 + _2028;
    int _2038 = _2036 * _1606;
    int _2040 = _1988 * _1908;
    int _2042 = _2040 + _1714;
    int _2044 = _2014 * _1762;
    int _2046 = _2044 + _2038;
    int _2048 = _2042 * _1840;
    int _2050 = _2048 + _2046;
    float _2052 = -_259;
    int _2054 = _1592 ? as_type<int>(_2052) : as_type<int>(_259);
    int _2056 = _1988 * _1924;
    int _2058 = _2056 + _2050;
    int _2060 = ~_1640;
    int _2062 = _2060 + 1;
    float _2064 = float(uint(_2058));
    float _2066 = as_type<float>(_1700) * _2064;
    float _2068 = trunc(_2066);
    float _2070 = precise::max(_2068, 0.0);
    uint _2072 = uint(_2070);
    int _2074 = _2062 * int(_2072);
    int _2076 = _2074 + _2058;
    float _2078 = float(uint(_2076));
    float _2080 = as_type<float>(_1700) * _2078;
    int _2082 = _1590 * _1898;
    int _2084 = _2082 + _1844;
    float _2086 = trunc(_2080);
    float _2088 = precise::max(_2086, 0.0);
    uint _2090 = uint(_2088);
    bool _2092 = !_1624;
    int _2094 = _2092 ? _2084 : (-1);
    int _2096 = int(_2072) + int(_2090);
    int _2098 = _2032 * _2096;
    int _2100 = _2098 + _2058;
    bool _2102 = uint(_2100) >= uint(_1640);
    bool _2104 = !_2102;
    int _2106 = _2104 ? 0 : (-1);
    int _2108 = _2094 & 3;
    bool _2110 = _2108 != 0;
    int _2112 = ~_2096;
    int _2114 = _2112 + _2106;
    int _2116 = _2114 + 1;
    int _2118 = _2110 ? 0 : 1;
    int _2120 = _1640 * _2116;
    int _2122 = _2120 + _2058;
    int _2124 = ~_2118;
    int _2126 = _2124 + 1;
    int _2128 = _2126 + 1;
    bool _2130 = !_2010;
    int _2132 = _2130 ? _2122 : (-1);
    int _2134 = _2132 & 3;
    bool _2136 = _2134 != 0;
    int _2138 = _2136 ? 0 : 1;
    int _2140 = _2094 & 3;
    bool _2142 = _2140 != 0;
    int _2144 = ~_2138;
    int _2146 = _2144 + 1;
    int _2148 = _2146 + 1;
    bool _2150 = uint(_2140) > 1u;
    int _2152 = _2128;
    int _2154 = _2148;
    if (!_2150)
    {
        int _2156 = ~_2118;
        int _2158 = _2156 + 1;
        _2152 = _2158;
    }
    int _2160 = _2152;
    int _2162 = _2132 & 3;
    bool _2164 = _2162 != 0;
    bool _2166 = uint(_2162) > 1u;
    if (!_2166)
    {
        int _2168 = ~_2138;
        int _2170 = _2168 + 1;
        _2154 = _2170;
    }
    int _2172 = _2154;
    bool _2174 = uint(_1510) >= 2u;
    int _2176 = abs(_2172);
    int _2178 = _2174 ? 0 : 1;
    bool _2180 = uint(_2162) >= 2u;
    int _2182 = ~_2178;
    int _2184 = _2182 + 1;
    int _2186 = _2184 + 1;
    int _2188 = _2180 ? 0 : 1;
    bool _2190 = _1510 != 3;
    int _2192 = ~_2188;
    int _2194 = _2192 + 1;
    int _2196 = _2194 + 1;
    int _2198 = ~_2176;
    int _2200 = _2198 + 1;
    int _2202 = _2200 + 1;
    int _2204 = _2186;
    int _2206 = _2196;
    if (_2190)
    {
        int _2208 = ~_2178;
        int _2210 = _2208 + 1;
        _2204 = _2210;
    }
    int _2212 = _2204;
    bool _2214 = _2162 != 3;
    if (_2214)
    {
        int _2216 = ~_2188;
        int _2218 = _2216 + 1;
        _2206 = _2218;
    }
    int _2220 = _2206;
    int _2222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2224 = _2222 != 0;
    float _2226 = -_263;
    int _2228 = _1748 ? as_type<int>(_2226) : as_type<int>(_263);
    bool _2230 = !_2224;
    int _2232 = _2230 ? 0 : 1;
    bool _2234 = _1068 > 0.5;
    float _2236 = -_259;
    int _2238 = _2234 ? as_type<int>(_2236) : as_type<int>(_259);
    int _2240 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2242 = _2240 != 0;
    bool _2244 = !_2242;
    float _2246 = _2244 ? _263 : as_type<float>(_2228);
    int _2248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2250 = _2248 != 0;
    bool _2252 = !_2250;
    float _2254 = _2252 ? _259 : as_type<float>(_2054);
    int _2256 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2258 = _2256 != 0;
    float _2260 = float(uint(_1344));
    bool _2262 = !_2258;
    float _2264 = _2262 ? _259 : as_type<float>(_2238);
    float _2266 = as_type<float>(_1037) * _2260;
    bool _2268 = _1102 != 2;
    float _2270 = trunc(_2266);
    float _2272 = precise::max(_2270, 0.0);
    uint _2274 = uint(_2272);
    float _2276 = 0.0;
    if (!_1132)
    {
        _2276 = _1070;
    }
    float _2278 = _2276;
    float _2280 = _2278;
    if (!_1132)
    {
        _2002 = _1072;
    }
    float _2282 = _2002;
    float _2284 = 0.0;
    float _2286 = _2282;
    if (!_1132)
    {
        _2284 = _2278;
    }
    float _2288 = _2284;
    float _2290 = 0.0;
    float _2292 = _2288;
    if (!_1132)
    {
        _2290 = _1072;
    }
    float _2294 = _2290;
    float _2296 = _2294;
    if (_1132)
    {
        _2292 = _1068;
    }
    float _2298 = _2292;
    if (_1132)
    {
        _2280 = _1068;
    }
    float _2300 = _2280;
    if (_1132)
    {
        _2286 = _1070;
    }
    float _2302 = _2286;
    if (_1132)
    {
        _2296 = _1070;
    }
    float _2304 = _2296;
    int _2306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2308 = _2306 != 0;
    int _2310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2312 = _2310 != 0;
    int _2314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2316 = _2314 != 0;
    int _2318 = ~_983;
    int _2320 = _2318 + 1;
    bool _2322 = !_2312;
    int _2324 = _2322 ? 0 : 1;
    int _2326 = _2320 * int(_2274);
    int _2328 = _2326 + _1344;
    bool _2330 = _1554 != 0;
    float _2332 = 0.0;
    if (_2268)
    {
        _2332 = _1068;
    }
    float _2334 = _2332;
    float _2336 = float(uint(_2328));
    int _2338 = ~_1590;
    int _2340 = _2338 + 1;
    float _2342 = _2334;
    if (_2268)
    {
        _1946 = _1070;
    }
    float _2344 = _1946;
    float _2346 = as_type<float>(_1037) * _2336;
    float _2348 = float(uint(_1818));
    float _2350 = _2344;
    if (!_2268)
    {
        _2342 = _1072;
    }
    float _2352 = _2342;
    if (!_2268)
    {
        _2350 = _1068;
    }
    float _2354 = _2350;
    float _2356 = as_type<float>(_1642) * _2348;
    float _2358 = trunc(_2346);
    float _2360 = precise::max(_2358, 0.0);
    uint _2362 = uint(_2360);
    float _2364 = _2352 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2366 = abs(_2324);
    float _2368 = trunc(_2356);
    float _2370 = precise::max(_2368, 0.0);
    uint _2372 = uint(_2370);
    int _2374 = int(_2274) + int(_2362);
    float _2376 = float(uint(_2042));
    int _2378 = _1374 * _2374;
    int _2380 = _2378 + _1344;
    float _2382 = as_type<float>(_1700) * _2376;
    int _2384 = _2340 * int(_2372);
    int _2386 = _2384 + _1818;
    bool _2388 = uint(_2380) >= uint(_983);
    bool _2390 = !_2316;
    int _2392 = _2390 ? 0 : 1;
    float _2394 = trunc(_2382);
    float _2396 = precise::max(_2394, 0.0);
    uint _2398 = uint(_2396);
    float _2400 = float(uint(_2386));
    bool _2402 = !_2388;
    int _2404 = _2402 ? 0 : (-1);
    float _2406 = as_type<float>(_1642) * _2400;
    int _2408 = ~_1590;
    int _2410 = _2408 + 1;
    int _2412 = ~_2374;
    int _2414 = _2412 + _2404;
    int _2416 = _2414 + 1;
    float _2418 = trunc(_2406);
    float _2420 = precise::max(_2418, 0.0);
    uint _2422 = uint(_2420);
    int _2424 = _983 * _2416;
    int _2426 = _2424 + _1344;
    int _2428 = int(_2372) + int(_2422);
    int _2430 = ~_1640;
    int _2432 = _2430 + 1;
    int _2434 = _2410 * _2428;
    int _2436 = _2434 + _1818;
    int _2438 = _2432 * int(_2398);
    int _2440 = _2438 + _2042;
    bool _2442 = uint(_2436) >= uint(_1590);
    float _2444 = float(uint(_2440));
    bool _2446 = !_2442;
    int _2448 = _2446 ? 0 : (-1);
    float _2450 = as_type<float>(_1700) * _2444;
    int _2452 = ~_1640;
    int _2454 = _2452 + 1;
    int _2456 = ~_2428;
    int _2458 = _2456 + _2448;
    int _2460 = _2458 + 1;
    float _2462 = trunc(_2450);
    float _2464 = precise::max(_2462, 0.0);
    uint _2466 = uint(_2464);
    int _2468 = _1590 * _2460;
    int _2470 = _2468 + _1818;
    int _2472 = int(_2398) + int(_2466);
    float _2474 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2476 = log2(_2474);
    bool _2478 = !_2330;
    int _2480 = _2478 ? 0 : 1;
    int _2482 = _2454 * _2472;
    int _2484 = _2482 + _2042;
    bool _2486 = uint(_2484) >= uint(_1640);
    bool _2488 = !_2164;
    int _2490 = _2488 ? 0 : 1;
    bool _2492 = _2162 != 3;
    bool _2494 = !_2486;
    int _2496 = _2494 ? 0 : (-1);
    float _2498 = _115 * _2476;
    bool _2500 = !_2492;
    int _2502 = _2500 ? 0 : (-1);
    bool _2504 = _1182 >= 0.0;
    bool _2506 = isnan(_1182);
    bool _2508 = _2504 || _2506;
    bool _2510 = isnan(0.0);
    bool _2512 = _2508 || _2510;
    bool _2514 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2516 = isnan(1.0);
    bool _2518 = _2514 || _2516;
    bool _2520 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2522 = _2518 || _2520;
    float _2524 = exp2(_2498);
    int _2526 = _2512 ? 0 : 1;
    float _2528 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _259);
    bool _2530 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2532 = isnan(0.0);
    bool _2534 = _2530 || _2532;
    bool _2536 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2538 = _2534 || _2536;
    int _2540 = ~_2472;
    int _2542 = _2540 + _2496;
    int _2544 = _2542 + 1;
    int _2546 = abs(_2490);
    int _2548 = abs(_2502);
    int _2550 = _1640 * _2544;
    int _2552 = _2550 + _2042;
    bool _2554 = !_2010;
    int _2556 = _2554 ? _2552 : (-1);
    float _2558 = -_2524;
    float _2560 = _2558 + 1.0;
    bool _2562 = uint(_2140) >= 2u;
    float _2564 = _2538 ? _2560 : 0.0;
    bool _2566 = _1182 > 0.0;
    int _2568 = ~_2526;
    int _2570 = _2568 + 1;
    int _2572 = _2570 + 1;
    float _2574 = _2564 * _1408;
    bool _2576 = !_2308;
    int _2578 = _2576 ? 0 : 1;
    bool _2580 = !_2522;
    float _2582 = _2580 ? _115 : _2574;
    float _2584 = _449 * _217;
    int _2586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2588 = _2586 != 0;
    int _2590 = _2572;
    if (!_2566)
    {
        int _2592 = ~_2526;
        int _2594 = _2592 + 1;
        _2590 = _2594;
    }
    int _2596 = _2590;
    float _2598 = fma(_457, _215, _2584);
    int _2600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2602 = _2600 != 0;
    float _2604 = _449 * _233;
    float _2606 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _263);
    float _2608 = _1154 * _2528;
    float _2610 = fma(_457, _231, _2604);
    float _2612 = _1148 * _2606;
    float _2614 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1436);
    float _2616 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2618 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2620 = _1068 + (-0.5);
    float _2622 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2624 = _2622 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2626 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2618);
    float _2628 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2630 = _2628 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2632 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2634 = 1.0 / _2624;
    float _2636 = _1070 + (-0.5);
    float _2638 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2640 = _2638 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2642 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2632);
    float _2644 = _1072 + (-0.5);
    float _2646 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2648 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2626);
    float _2650 = 1.0 / _2640;
    float _2652 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1410);
    float _2654 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2656 = -_2646;
    float _2658 = fma(_2616, 2.0, _2656);
    float _2660 = fma(_479, _219, _2598);
    float _2662 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2664 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2662;
    float _2666 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2668 = _2666 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2670 = 1.0 / _2630;
    float _2672 = fma(_1198, -2.0, _2654);
    float _2674 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2676 = _2674 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _2678 = _971 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2680 = isnan(_971);
    bool _2682 = _2678 || _2680;
    bool _2684 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2686 = _2682 || _2684;
    float _2688 = float(_2686);
    float _2690 = _1414 * _2634;
    float _2692 = -_115;
    float _2694 = fma(_2692, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2658);
    float _2696 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2698 = _2696 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2700 = 1.0 / _2668;
    float _2702 = fma(_479, _235, _2610);
    float _2704 = _1424 * _2650;
    float _2706 = -_2688;
    float _2708 = _2706 + 1.0;
    float _2710 = fma(_479, _247, _1428);
    float _2712 = _2664 * _2670;
    float _2714 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2716 = _2714 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2718 = 1.0 / _2698;
    bool _2720 = _971 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2722 = isnan(_971);
    bool _2724 = _2720 || _2722;
    bool _2726 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2728 = _2724 || _2726;
    float _2730 = float(_2728);
    float _2732 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2734 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2732;
    float _2736 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2738 = _2736 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2740 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2672);
    float _2742 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2642);
    float _2744 = _2676 * _2700;
    bool _2746 = _971 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2748 = isnan(_971);
    bool _2750 = _2746 || _2748;
    bool _2752 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2754 = _2750 || _2752;
    float _2756 = float(_2754);
    float _2758 = 1.0 / _2716;
    float _2760 = _2660 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2762 = _2710 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2764 = _2702 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2766 = -_2756;
    float _2768 = _2766 + 1.0;
    float _2770 = _2688 * _2768;
    float _2772 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2774 = _2772 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2776 = _971 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2778 = isnan(_971);
    bool _2780 = _2776 || _2778;
    bool _2782 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2784 = _2780 || _2782;
    float _2786 = float(_2784);
    float _2788 = _2730 * _2708;
    float _2790 = -_2730;
    float _2792 = _2790 + 1.0;
    float _2794 = 1.0 / _2738;
    float _2796 = _2734 * _2718;
    float _2798 = -_2786;
    float _2800 = _2798 + 1.0;
    float _2802 = _2774 * _2758;
    bool _2804 = _971 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2806 = isnan(_971);
    bool _2808 = _2804 || _2806;
    bool _2810 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2812 = _2808 || _2810;
    float _2814 = float(_2812);
    float _2816 = _2786 * _2792;
    float _2818 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2820 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2818;
    float _2822 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2824 = _971 + _2822;
    bool _2826 = _971 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2828 = isnan(_971);
    bool _2830 = _2826 || _2828;
    bool _2832 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2834 = _2830 || _2832;
    float _2836 = float(_2834);
    float _2838 = _2814 * _2800;
    float _2840 = -_2814;
    float _2842 = _2840 + 1.0;
    bool _2844 = _971 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2846 = isnan(_971);
    bool _2848 = _2844 || _2846;
    bool _2850 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2852 = _2848 || _2850;
    float _2854 = float(_2852);
    float _2856 = fma(_2690, _2824, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2858 = -_2836;
    float _2860 = _2858 + 1.0;
    float _2862 = _2836 * _2842;
    bool _2864 = _971 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2866 = isnan(_971);
    bool _2868 = _2864 || _2866;
    bool _2870 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2872 = _2868 || _2870;
    float _2874 = float(_2872);
    float _2876 = -_2854;
    float _2878 = _2876 + 1.0;
    float _2880 = _2854 * _2860;
    float _2882 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2884 = _971 + _2882;
    float _2886 = _2820 * _2794;
    float _2888 = _2874 * _2878;
    float _2890 = -_2874;
    float _2892 = _2890 + 1.0;
    float _2894 = fma(_2704, _2884, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2896 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2898 = _971 + _2896;
    float _2900 = _2856 * _2888;
    float _2902 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2904 = _971 + _2902;
    float _2906 = fma(_2712, _2898, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2908 = fma(_2892, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2900);
    float _2910 = fma(_2744, _2904, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2912 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2914 = _971 + _2912;
    float _2916 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2918 = _971 + _2916;
    float _2920 = fma(_2894, _2880, _2908);
    float _2922 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2924 = _971 + _2922;
    float _2926 = fma(_2796, _2914, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2928 = fma(_2802, _2918, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2930 = fma(_2906, _2862, _2920);
    float _2932 = fma(_2886, _2924, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2934 = _2264 + 0.5;
    float _2936 = _2246 + (-0.5);
    float _2938 = fma(_2910, _2838, _2930);
    float _2940 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2942 = fma(_2934, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2694);
    int _2944 = abs(_2578);
    float _2946 = fma(_2926, _2816, _2938);
    float _2948 = -_2936;
    float _2950 = -_2740;
    float _2952 = fma(_2948, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2950);
    float _2954 = fma(_2928, _2788, _2946);
    float _2956 = in.m_70.x;
    float _2958 = in.m_70.y;
    float _2960 = in.m_70.z;
    float _2962 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2964 = fma(_2932, _2770, _2954);
    float _2966 = float(_2596);
    float _2968 = -_2962;
    float _2970 = fma(_2364, 2.0, _2968);
    float _2972 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2974 = fma(_2756, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2964);
    float _2976 = float(_2944);
    float _2978 = fma(_2300, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2972);
    float _2980 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    out.m_72.x = _2974;
    float _2982 = _2976 * _2966;
    float _2984 = _2298 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2986 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2988 = fma(_2304, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2980);
    float _2990 = _2982 * (-2.0);
    int _2992 = abs(_2392);
    float _2994 = -_2986;
    float _2996 = fma(_2984, 2.0, _2994);
    float _2998 = fma(_1426, _2990, _1426);
    float _3000 = fma(_2990, _2956, _2956);
    float _3002 = -_115;
    float _3004 = fma(_3002, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2996);
    float _3006 = float(_1952);
    float _3008 = fma(_2620, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3000);
    float _3010 = float(_2366);
    float _3012 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3014 = float(_2008);
    float _3016 = _2302 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3018 = float(_2992);
    float _3020 = _3010 * _3006;
    float _3022 = fma(_2582, _2998, _3008);
    float _3024 = fma(_3016, -2.0, _3012);
    float _3026 = _3020 * (-2.0);
    float _3028 = _3018 * _3014;
    float _3030 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3032 = _2354 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3034 = fma(_3026, _2958, _2958);
    float _3036 = _3028 * (-2.0);
    float _3038 = fma(_1432, _3026, _1432);
    float _3040 = fma(_3032, -2.0, _3030);
    float _3042 = fma(_2636, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3034);
    float _3044 = fma(_3036, _2960, _2960);
    float _3046 = fma(_2940, _3036, _2940);
    float _3048 = _1392 + (-0.5);
    float _3050 = fma(_2582, _3038, _3042);
    float _3052 = fma(_2644, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3044);
    float _3054 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3024);
    float _3056 = _2254 + 0.5;
    float _3058 = _3050 * 0.15915493667125701904296875;
    float _3060 = fma(_2582, _3046, _3052);
    float _3062 = -_3048;
    float _3064 = -_3054;
    float _3066 = fma(_3062, (*spvDescriptorSet0.vp_c9)._m0[85].y, _3064);
    float _3068 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2978);
    float _3070 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2988);
    float _3072 = _3060 * 0.15915493667125701904296875;
    int _3074 = _2132 >> 31;
    float _3076 = fma(_3056, (*spvDescriptorSet0.vp_c9)._m0[85].x, _3004);
    float _3078 = -_2648;
    float _3080 = _3078 + 1.0;
    float _3082 = -_2742;
    float _3084 = _3082 + 1.0;
    int _3086 = _3074 & 3;
    float _3088 = -_3068;
    float _3090 = _3088 + 1.0;
    float _3092 = -_3070;
    float _3094 = _3092 + 1.0;
    float _3096 = -_3080;
    float _3098 = fma(_2264, _3096, _2942);
    int _3100 = _2132 + _3086;
    float _3102 = fma(_2246, _3084, _2952);
    float _3104 = -_3090;
    float _3106 = fma(_2254, _3104, _3076);
    float _3108 = fma(_1392, _3094, _3066);
    int _3110 = _3100 >> 2;
    float _3112 = _3022 * 0.15915493667125701904296875;
    float _3114 = _3058 * 6.283185482025146484375;
    float _3116 = sin(_3114);
    int _3118 = _3110 << 4;
    int _3120 = _3118 + 656;
    out.m_74.x = _3098;
    out.m_74.y = _3102;
    out.m_74.z = _3106;
    out.m_74.w = _3108;
    uint _3122 = uint(int(uint(_3120) >> uint(2)));
    uint _3124 = uint(int(uint(int(_3122)) >> uint(2)));
    int _3126 = int(_3122) & 3;
    float _3128 = (*spvDescriptorSet0.vp_c9)._m0[int(_3124)][_3126];
    int _3130 = int(_3122) + 1;
    uint _3132 = uint(int(uint(_3130) >> uint(2)));
    int _3134 = _3130 & 3;
    float _3136 = (*spvDescriptorSet0.vp_c9)._m0[int(_3132)][_3134];
    float _3138 = _3112 * 6.283185482025146484375;
    float _3140 = sin(_3138);
    float _3142 = _3112 * 6.283185482025146484375;
    float _3144 = cos(_3142);
    int _3146 = _3120 + 8;
    uint _3148 = uint(int(uint(_3146) >> uint(2)));
    uint _3150 = uint(int(uint(int(_3148)) >> uint(2)));
    int _3152 = int(_3148) & 3;
    float _3154 = (*spvDescriptorSet0.vp_c9)._m0[int(_3150)][_3152];
    int _3156 = int(_3148) + 1;
    uint _3158 = uint(int(uint(_3156) >> uint(2)));
    int _3160 = _3156 & 3;
    float _3162 = (*spvDescriptorSet0.vp_c9)._m0[int(_3158)][_3160];
    float _3164 = _3058 * 6.283185482025146484375;
    float _3166 = cos(_3164);
    float _3168 = _3140 * _3116;
    int _3170 = abs(_2220);
    int _3172 = ~_2546;
    int _3174 = _3172 + 1;
    int _3176 = _3174 + 1;
    float _3178 = _3072 * 6.283185482025146484375;
    float _3180 = cos(_3178);
    float _3182 = _3144 * _3116;
    float _3184 = _3072 * 6.283185482025146484375;
    float _3186 = sin(_3184);
    float _3188 = _3144 * _3166;
    float _3190 = _3140 * _3166;
    float _3192 = _3140 * _3180;
    float _3194 = _3166 * _3180;
    float _3196 = _3144 * _3180;
    float _3198 = _3116 * _3180;
    float _3200 = _3196 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3202 = _3196 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3204 = fma(_3186, _3188, _3168);
    float _3206 = fma(_3186, _3168, _3188);
    float _3208 = -_3182;
    float _3210 = fma(_3186, _3190, _3208);
    float _3212 = -_3190;
    float _3214 = fma(_3186, _3182, _3212);
    float _3216 = _3196 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3218 = _3196 * _2612;
    float _3220 = -_2612;
    float _3222 = _3186 * _3220;
    float _3224 = -_3186;
    float _3226 = fma(_3224, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3200);
    float _3228 = -_3186;
    float _3230 = fma(_3228, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3216);
    float _3232 = -_3186;
    float _3234 = fma(_3232, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3202);
    float _3236 = fma(_3204, _2608, _3218);
    float _3238 = fma(_3194, _2608, _3222);
    float _3240 = _3204 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3242 = _3204 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3244 = _3204 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3246 = _3192 * _2612;
    float _3248 = fma(_3194, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3240);
    float _3250 = fma(_3194, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3242);
    float _3252 = fma(_3194, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3244);
    float _3254 = fma(_3210, _2608, _3246);
    float _3256 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3258 = _3214 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3260 = _2202 * as_type<int>(_3136);
    float _3262 = fma(_3192, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3230);
    float _3264 = fma(_3192, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3226);
    float _3266 = fma(_3192, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3234);
    float _3268 = fma(_3198, _3256, _3238);
    float _3270 = fma(_3214, _3256, _3236);
    float _3272 = fma(_3206, _3256, _3254);
    float _3274 = _3214 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3276 = _3214 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3278 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3258);
    int _3280 = ~_3170;
    int _3282 = _3280 + 1;
    int _3284 = _3282 + 1;
    int _3286 = _3176 * as_type<int>(_3128);
    int _3288 = _3286 + _3260;
    float _3290 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3274);
    float _3292 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3276);
    float _3294 = fma(_3206, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3278);
    int _3296 = _3284 * as_type<int>(_3154);
    int _3298 = _3296 + _3288;
    int _3300 = abs(_2232);
    float _3302 = _3270 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3304 = _1486 >> 31;
    float _3306 = _3270 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3308 = _3270 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3310 = fma(_3206, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3290);
    float _3312 = fma(_3206, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3292);
    int _3314 = _3304 & 3;
    float _3316 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3318 = int(_3316);
    int _3320 = ~_2548;
    int _3322 = _3320 + 1;
    int _3324 = _3322 + 1;
    float _3326 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3302);
    float _3328 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3308);
    int _3330 = _1486 + _3314;
    float _3332 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3306);
    float _3334 = fma(_3272, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3326);
    float _3336 = fma(_3272, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3328);
    int _3338 = _3324 * as_type<int>(_3162);
    int _3340 = _3338 + _3298;
    int _3342 = ~_3300;
    int _3344 = _3342 + 1;
    int _3346 = _3344 + 1;
    float _3348 = _3334 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3350 = _3336 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _3352 = _2094 >> 31;
    float _3354 = fma(_3210, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3252);
    int _3356 = _3340 * _3346;
    float _3358 = _2760 + _3348;
    float _3360 = _2762 + _3350;
    int _3362 = _3330 >> 2;
    int _3364 = _2556 * _3300;
    int _3366 = _3364 + _3356;
    int _3368 = _3352 & 3;
    float _3370 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3372 = _3358 + _3370;
    int _3374 = abs(_3318);
    float _3376 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3378 = _3360 + _3376;
    int _3380 = _3362 << 4;
    int _3382 = _3380 + 368;
    float _3384 = fma(_3210, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3248);
    float _3386 = fma(_3210, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3250);
    int _3388 = _2094 + _3368;
    float _3390 = _3372 * _3372;
    float _3392 = float(uint(_3374));
    float _3394 = _3378 * _3378;
    float _3396 = float(uint(_3318));
    float _3398 = _263 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3400 = _259 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3402 = _3390 + _3394;
    float _3404 = 1.0 / _3396;
    float _3406 = _3398 * _3264;
    int _3408 = _3388 >> 2;
    float _3410 = _3398 * _3262;
    float _3412 = _3398 * _3266;
    float _3414 = fma(_3400, _3386, _3406);
    int _3416 = abs(_3366);
    uint _3418 = uint(int(uint(_3382) >> uint(2)));
    uint _3420 = uint(int(uint(int(_3418)) >> uint(2)));
    int _3422 = int(_3418) & 3;
    float _3424 = (*spvDescriptorSet0.vp_c9)._m0[int(_3420)][_3422];
    int _3426 = int(_3418) + 1;
    uint _3428 = uint(int(uint(_3426) >> uint(2)));
    int _3430 = _3426 & 3;
    float _3432 = (*spvDescriptorSet0.vp_c9)._m0[int(_3428)][_3430];
    float _3434 = 1.0 / _3392;
    int _3436 = _3408 << 4;
    int _3438 = _3436 + 512;
    float _3440 = fma(_3400, _3384, _3410);
    float _3442 = fma(_3400, _3354, _3412);
    float _3444 = fma(_3272, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3332);
    int _3446 = _2562 ? 0 : 1;
    int _3448 = _3382 + 8;
    uint _3450 = uint(int(uint(_3448) >> uint(2)));
    uint _3452 = uint(int(uint(int(_3450)) >> uint(2)));
    int _3454 = int(_3450) & 3;
    float _3456 = (*spvDescriptorSet0.vp_c9)._m0[int(_3452)][_3454];
    int _3458 = int(_3450) + 1;
    uint _3460 = uint(int(uint(_3458) >> uint(2)));
    int _3462 = _3458 & 3;
    float _3464 = (*spvDescriptorSet0.vp_c9)._m0[int(_3460)][_3462];
    float _3466 = sqrt(_3402);
    int _3468 = as_type<int>(_3404) + (-2);
    float _3470 = _3444 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _3472 = !_2142;
    int _3474 = _3472 ? 0 : 1;
    bool _3476 = _1510 != 3;
    float _3478 = _2764 + _3470;
    uint _3480 = uint(int(uint(_3438) >> uint(2)));
    uint _3482 = uint(int(uint(int(_3480)) >> uint(2)));
    int _3484 = int(_3480) & 3;
    float _3486 = (*spvDescriptorSet0.vp_c9)._m0[int(_3482)][_3484];
    int _3488 = int(_3480) + 1;
    uint _3490 = uint(int(uint(_3488) >> uint(2)));
    int _3492 = _3488 & 3;
    float _3494 = (*spvDescriptorSet0.vp_c9)._m0[int(_3490)][_3492];
    int _3496 = as_type<int>(_3434) + (-2);
    bool _3498 = _2140 != 3;
    int _3500 = _3438 + 8;
    uint _3502 = uint(int(uint(_3500) >> uint(2)));
    uint _3504 = uint(int(uint(int(_3502)) >> uint(2)));
    int _3506 = int(_3502) & 3;
    float _3508 = (*spvDescriptorSet0.vp_c9)._m0[int(_3504)][_3506];
    int _3510 = int(_3502) + 1;
    uint _3512 = uint(int(uint(_3510) >> uint(2)));
    int _3514 = _3510 & 3;
    float _3516 = (*spvDescriptorSet0.vp_c9)._m0[int(_3512)][_3514];
    bool _3518 = _3466 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3520 = float(uint(_3416));
    float _3522 = as_type<float>(_3496) * _3520;
    float _3524 = _3470;
    float _3526 = as_type<float>(_3416);
    float _3528 = _3434;
    float _3530 = _3272;
    float _3532 = _3394;
    float _3534 = _3266;
    float _3536 = _3386;
    if (!_3518)
    {
        _3524 = _3390;
    }
    float _3538 = _3524;
    float _3540 = float(uint(_3366));
    float _3542 = _3538;
    if (!_3518)
    {
        _3526 = _3358;
    }
    float _3544 = _3526;
    float _3546 = trunc(_3522);
    float _3548 = precise::max(_3546, 0.0);
    uint _3550 = uint(_3548);
    float _3552 = _3544;
    if (!_3518)
    {
        _3528 = _3360;
    }
    float _3554 = _3528;
    float _3556 = as_type<float>(_3468) * _3540;
    float _3558 = _3554;
    if (!_3518)
    {
        _3530 = _3478;
    }
    float _3560 = _3530;
    int _3562 = ~_3446;
    int _3564 = _3562 + 1;
    int _3566 = _3564 + 1;
    bool _3568 = !_3518;
    float _3570 = _3560;
    int _3572 = _3566;
    if (!_3568)
    {
        float _3574 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3576 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3578 = _3466 + _3576;
        float _3580 = rsqrt(_3402);
        float _3582 = _3578 * _3574;
        float _3584 = _3478 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3586 = _3582 * 0.15915493667125701904296875;
        float _3588 = _3586 * 6.283185482025146484375;
        float _3590 = sin(_3588);
        float _3592 = _3586 * 6.283185482025146484375;
        float _3594 = cos(_3592);
        float _3596 = fma(_3590, _3584, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3598 = _3580 * _3596;
        float _3600 = _3594 + (-1.0);
        float _3602 = fma(_3372, _3598, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3604 = fma(_3378, _3598, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3606 = _3600 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3608 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3610 = _3602 + _3608;
        float _3612 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3614 = _3604 + _3612;
        float _3616 = fma(_3478, _3594, _3606);
        float _3618 = _3610 * _3610;
        float _3620 = _3614 * _3614;
        _3570 = _3616;
        _3542 = _3618;
        _3532 = _3620;
        _3552 = _3602;
        _3558 = _3604;
    }
    float _3622 = _3570;
    float _3624 = _3542;
    float _3626 = _3532;
    float _3628 = _3552;
    float _3630 = _3558;
    float _3632 = trunc(_3556);
    float _3634 = precise::max(_3632, 0.0);
    uint _3636 = uint(_3634);
    float _3638 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3640 = _3622 + _3638;
    if (_3498)
    {
        int _3642 = ~_3446;
        int _3644 = _3642 + 1;
        _3572 = _3644;
    }
    int _3646 = _3572;
    float _3648 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3040);
    int _3650 = abs(_2160);
    float _3652 = fma(_3640, _3640, _3624);
    int _3654 = ~_3318;
    int _3656 = _3654 + 1;
    float _3658 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2614);
    int _3660 = ~_3374;
    int _3662 = _3660 + 1;
    float _3664 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2652);
    float _3666 = -_3658;
    float _3668 = _3666 + 1.0;
    int _3670 = abs(_1586);
    float _3672 = -_3664;
    float _3674 = _3672 + 1.0;
    int _3676 = abs(_2480);
    int _3678 = _3662 * int(_3550);
    int _3680 = _3678 + _3416;
    int _3682 = ~_3670;
    int _3684 = _3682 + 1;
    int _3686 = _3684 + 1;
    int _3688 = _3656 * int(_3636);
    int _3690 = _3688 + _3366;
    int _3692 = abs(_3474);
    float _3694 = _3294 + _3440;
    int _3696 = ~_3676;
    int _3698 = _3696 + 1;
    int _3700 = _3698 + 1;
    int _3702 = _3686 * as_type<int>(_3432);
    float _3704 = float(uint(_3690));
    float _3706 = _3310 + _3414;
    float _3708 = float(uint(_3680));
    int _3710 = _3700 * as_type<int>(_3424);
    int _3712 = _3710 + _3702;
    int _3714 = ~_3650;
    int _3716 = _3714 + 1;
    int _3718 = _3716 + 1;
    float _3720 = as_type<float>(_3468) * _3704;
    float _3722 = as_type<float>(_3496) * _3708;
    int _3724 = abs(_3646);
    int _3726 = _3718 * as_type<int>(_3494);
    int _3728 = ~_3692;
    int _3730 = _3728 + 1;
    int _3732 = _3730 + 1;
    float _3734 = trunc(_3722);
    float _3736 = precise::max(_3734, 0.0);
    uint _3738 = uint(_3736);
    bool _3740 = !_3476;
    int _3742 = _3740 ? 0 : (-1);
    out.m_76.x = _3384;
    out.m_76.y = _3386;
    out.m_76.z = _3354;
    int _3744 = abs(_2212);
    int _3746 = _3732 * as_type<int>(_3486);
    int _3748 = _3746 + _3726;
    int _3750 = ~_3724;
    int _3752 = _3750 + 1;
    int _3754 = _3752 + 1;
    float _3756 = _3652 + _3626;
    int _3758 = abs(_3742);
    float _3760 = trunc(_3720);
    float _3762 = precise::max(_3760, 0.0);
    uint _3764 = uint(_3762);
    bool _3766 = _2140 != 3;
    int _3768 = _3754 * as_type<int>(_3508);
    int _3770 = _3768 + _3748;
    int _3772 = ~_3744;
    int _3774 = _3772 + 1;
    int _3776 = _3774 + 1;
    bool _3778 = !_3766;
    int _3780 = _3778 ? 0 : (-1);
    int _3782 = _3776 * as_type<int>(_3456);
    int _3784 = _3782 + _3712;
    int _3786 = ~_3758;
    int _3788 = _3786 + 1;
    int _3790 = _3788 + 1;
    float _3792 = sqrt(_3756);
    int _3794 = abs(_3780);
    int _3796 = ~_3318;
    int _3798 = _3796 + 1;
    int _3800 = _3790 * as_type<int>(_3464);
    int _3802 = _3800 + _3784;
    int _3804 = ~_3374;
    int _3806 = _3804 + 1;
    int _3808 = int(_3550) + int(_3738);
    int _3810 = int(_3636) + int(_3764);
    int _3812 = _3806 * _3808;
    int _3814 = _3812 + _3416;
    int _3816 = ~_3794;
    int _3818 = _3816 + 1;
    int _3820 = _3818 + 1;
    float _3822 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3824 = !_2602;
    int _3826 = _3824 ? 0 : 1;
    int _3828 = _3798 * _3810;
    int _3830 = _3828 + _3366;
    bool _3832 = uint(_3814) >= uint(_3374);
    int _3834 = _3820 * as_type<int>(_3516);
    int _3836 = _3834 + _3770;
    int _3838 = abs(_3826);
    int _3840 = _3366 ^ _3318;
    float _3842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3844 = ~_3838;
    int _3846 = _3844 + 1;
    int _3848 = _3846 + 1;
    bool _3850 = uint(_3830) >= uint(_3318);
    uint _3852 = uint(int(uint(_3840) >> uint(31)));
    int _3854 = _3802 * _3848;
    bool _3856 = !_3832;
    int _3858 = _3856 ? 0 : (-1);
    bool _3860 = !_3850;
    int _3862 = _3860 ? 0 : (-1);
    int _3864 = ~int(_3852);
    int _3866 = _3864 + 1;
    float _3868 = fma(_3398, _3398, 1.0);
    int _3870 = ~_3858;
    int _3872 = _3808 + _3870;
    int _3874 = _3872 + 1;
    bool _3876 = !_2588;
    int _3878 = _3876 ? 0 : 1;
    int _3880 = ~_3810;
    int _3882 = _3880 + _3862;
    int _3884 = _3882 + 1;
    float _3886 = rsqrt(_3868);
    int _3888 = _3874 ^ _3866;
    int _3890 = abs(_3878);
    int _3892 = _3318 * _3884;
    int _3894 = _3892 + _3366;
    bool _3896 = _3318 == 0;
    bool _3898 = _3318 == 0;
    float _3900 = _3312 + _3442;
    int _3902 = ~_3866;
    int _3904 = _3902 + _3888;
    int _3906 = _3904 + 1;
    float _3908 = _3822 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3910 = ~_3890;
    int _3912 = _3910 + 1;
    int _3914 = _3912 + 1;
    bool _3916 = _983 == 0;
    out.m_78.x = _3694;
    out.m_78.y = _3706;
    out.m_78.z = _3900;
    bool _3918 = _1590 == 0;
    int _3920 = _3836 * _3914;
    bool _3922 = !_3896;
    int _3924 = _3922 ? _3894 : (-1);
    float _3926 = _3842 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3928 = !_3898;
    int _3930 = _3928 ? _3906 : (-1);
    float _3932 = -_115;
    float _3934 = fma(_3932, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2970);
    bool _3936 = !_3916;
    int _3938 = _3936 ? _2426 : (-1);
    float _3940 = float(_3924);
    float _3942 = float(_3930);
    int _3944 = _3938 * _3838;
    int _3946 = _3944 + _3854;
    float _3948 = _1196 + 0.5;
    float _3950 = fma(_3908, _3940, _3934);
    bool _3952 = !_3918;
    int _3954 = _3952 ? _2470 : (-1);
    float _3956 = -_3648;
    float _3958 = fma(_3926, _3942, _3956);
    float _3960 = _1234 + (-0.5);
    float _3962 = _3398 * _3886;
    float _3964 = fma(_3908, _3948, _3950);
    int _3966 = _3954 * _3890;
    int _3968 = _3966 + _3920;
    float _3970 = -_3926;
    float _3972 = fma(_3970, _3960, _3958);
    float _3974 = -_3294;
    float _3976 = _3962 * _3974;
    float _3978 = -_3310;
    float _3980 = _3962 * _3978;
    float _3982 = -_3312;
    float _3984 = _3962 * _3982;
    float _3986 = -_3668;
    float _3988 = fma(_1196, _3986, _3964);
    float _3990 = fma(_3886, _3262, _3976);
    float _3992 = fma(_3886, _3264, _3980);
    float _3994 = fma(_3886, _3266, _3984);
    float _3996 = float(_3946);
    float _3998 = fma(_1234, _3674, _3972);
    float _4000 = float(_3968);
    out.m_80.x = _3990;
    out.m_80.y = _3992;
    out.m_80.z = _3994;
    bool _4002 = _3792 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4004 = isnan(_3792);
    bool _4006 = _4002 || _4004;
    bool _4008 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4010 = _4006 || _4008;
    out.m_82.x = _3996;
    out.m_82.y = _4000;
    out.m_84.x = _3988;
    out.m_84.y = _3998;
    if (!_4010)
    {
        _3534 = 1.0;
    }
    float _4012 = _3534;
    bool _4014 = !_4010;
    float _4016 = _4012;
    if (!_4014)
    {
        bool _4018 = _3792 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4020 = isnan(_3792);
        bool _4022 = _4018 || _4020;
        bool _4024 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4026 = _4022 || _4024;
        if (!_4026)
        {
            float _4028 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4030 = _3792 + _4028;
            float _4032 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4034 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4032;
            float _4036 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4038 = _4036 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4040 = 1.0 / _4034;
            float _4042 = _4030 * _4040;
            float _4044 = fma(_4042, _4038, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4016 = _4044;
            _3536 = _4040;
            _4046 = true;
        }
        else
        {
            bool _4048 = _3792 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4050 = isnan(_3792);
            bool _4052 = _4048 || _4050;
            bool _4054 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4056 = _4052 || _4054;
            if (!_4056)
            {
                float _4058 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4060 = _3792 + _4058;
                float _4062 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4064 = _4062 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4066 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4068 = _4066 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4070 = 1.0 / _4064;
                float _4072 = _4060 * _4070;
                float _4074 = fma(_4072, _4068, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4016 = _4074;
                _3536 = _4070;
                _4046 = true;
            }
            else
            {
                _4016 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4046 = false;
    float _4076 = _4016;
    float _4078 = _3536;
    float _4080 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4082 = _3622 + _4080;
    float _4084 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4086 = _3628 + _4084;
    float _4088 = fma(_4082, _4076, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4090 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4092 = _3630 + _4090;
    float _4094 = fma(_4086, _4076, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4096 = -_2764;
    float _4098 = _4096 + _4088;
    float _4100 = fma(_4092, _4076, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4102 = -_2760;
    float _4104 = _4102 + _4094;
    float _4106 = _4098 * _4098;
    float _4108 = -_2762;
    float _4110 = _4108 + _4100;
    float _4112 = fma(_4104, _4104, _4106);
    float _4114 = fma(_4110, _4110, _4112);
    float _4116 = sqrt(_4114);
    bool _4118 = _4116 > 0.0;
    float _4120 = _4116;
    float _4122 = _4078;
    float _4124 = _4086;
    float _4126 = _4100;
    if (!_4118)
    {
        _4120 = _4094;
    }
    float _4128 = _4120;
    float _4130 = _4128;
    float _4132 = _4128;
    float _4134 = _4128;
    if (!_4118)
    {
        _4122 = _4088;
    }
    float _4136 = _4122;
    bool _4138 = !_4118;
    float _4140 = _4136;
    float _4142 = _4136;
    if (!_4138)
    {
        bool _4144 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _4146 = _4076;
        if (_4144)
        {
            float _4148 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _4146 = _4148;
        }
        float _4150 = _4146;
        float _4152 = _4150;
        if (_4144)
        {
            float _4154 = _481 * _4150;
            _4124 = _4154;
        }
        float _4156 = _4124;
        float _4158 = _4156;
        if (_4144)
        {
            float _4160 = _483 * _4150;
            _1580 = _4160;
        }
        float _4162 = _1580;
        float _4164 = _4162;
        if (_4144)
        {
            float _4166 = _485 * _4150;
            _4152 = _4166;
        }
        float _4168 = _4152;
        float _4170 = _4168;
        if (!_4144)
        {
            bool _4172 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _4174 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _4176 = _4172 || _4174;
            bool _4178 = isnan(1.0);
            bool _4180 = _4176 || _4178;
            float _4182 = _115 + 1.0;
            float _4184 = _4182;
            if (!_4180)
            {
                float _4186 = _4182 * _4182;
                float _4188 = _4186 * 0.5;
                _4130 = _4188;
            }
            float _4190 = _4130;
            float _4192 = _4190;
            if (!_4180)
            {
                float _4194 = _4190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4192 = _4194;
            }
            float _4196 = _4192;
            bool _4198 = !_4180;
            float _4200 = _4196;
            if (!_4198)
            {
                float _4202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4204 = log2(_4202);
                float _4206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4208 = _4204 * _4182;
                float _4210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4212 = _4210 + 1.0;
                float _4214 = 1.0 / _4212;
                float _4216 = _4206 * 0.693147182464599609375;
                float _4218 = exp2(_4208);
                float _4220 = 1.0 / _4216;
                float _4222 = _4218 + (-1.0);
                float _4224 = -_4222;
                float _4226 = fma(_4224, _4220, _4182);
                float _4228 = _4226 * _4214;
                float _4230 = _4228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4200 = _4230;
            }
            float _4232 = _4200;
            float _4234 = _4232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _4236 = _4232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _4238 = !_4180;
            _4140 = _4234;
            _4132 = _4232;
            if (!_4238)
            {
                float _4240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4242 = log2(_4240);
                float _4244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4246 = _4244 + 1.0;
                float _4248 = 1.0 / _4246;
                float _4250 = _4242 * _4182;
                float _4252 = exp2(_4250);
                float _4254 = -_4252;
                float _4256 = _4254 + 1.0;
                float _4258 = _4256 * _4248;
                _4184 = _4258;
            }
            float _4260 = _4184;
            float _4262 = fma(_4260, _177, _4236);
            float _4264 = fma(_4260, _175, _4234);
            float _4266 = _4232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _4268 = -_443;
            float _4270 = _4268 + _4262;
            float _4272 = -_441;
            float _4274 = _4272 + _4264;
            float _4276 = fma(_4260, _179, _4266);
            float _4278 = _4270 * _217;
            float _4280 = _4270 * _233;
            float _4282 = _4270 * _245;
            float _4284 = -_455;
            float _4286 = _4284 + _4276;
            float _4288 = fma(_4274, _215, _4278);
            float _4290 = fma(_4274, _231, _4280);
            float _4292 = fma(_4274, _243, _4282);
            float _4294 = fma(_4286, _219, _4288);
            float _4296 = fma(_4286, _235, _4290);
            float _4298 = fma(_4286, _247, _4292);
            _491 = _4296;
            _493 = _4294;
            _495 = _4298;
            _4158 = _4294;
            _4164 = _4296;
            _4170 = _4298;
        }
        float _4300 = _491;
        float _4302 = _493;
        float _4304 = _495;
        float _4306 = _4158;
        float _4308 = _4164;
        float _4310 = _4170;
        float _4312 = _4140;
        float _4314 = _4132;
        float _4316 = _4300 * _4300;
        float _4318 = rsqrt(_4114);
        float _4320 = fma(_4302, _4302, _4316);
        float _4322 = fma(_4304, _4304, _4320);
        float _4324 = sqrt(_4322);
        float _4326 = _4104 * _4318;
        float _4328 = _4098 * _4318;
        float _4330 = _4110 * _4318;
        bool _4332 = _4324 > 0.0;
        float _4334 = _4314;
        float _4336 = _4312;
        _273 = _4322;
        if (!_4332)
        {
            _4334 = _4094;
        }
        float _4338 = _4334;
        _4134 = _4338;
        if (!_4332)
        {
            _4336 = _4088;
        }
        float _4340 = _4336;
        bool _4342 = !_4332;
        _4142 = _4340;
        if (!_4342)
        {
            float _4344 = rsqrt(_4322);
            float _4346 = _4344 * _4300;
            float _4348 = _4344 * _4302;
            float _4350 = _4344 * _4304;
            float _4352 = _4328 * _4346;
            float _4354 = fma(_4326, _4348, _4352);
            float _4356 = fma(_4330, _4350, _4354);
            float _4358 = _4356 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4360 = fma(_4306, _4358, _4094);
            float _4362 = fma(_4308, _4358, _4088);
            float _4364 = fma(_4310, _4358, _4100);
            _4142 = _4362;
            _4134 = _4360;
            _4126 = _4364;
        }
    }
    float _4366 = _4142;
    float _4368 = _4134;
    float _4370 = _4126;
    float _4372 = _273;
    float _4374 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4376 = _4366 + _4374;
    float _4378 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4380 = _4368 + _4378;
    float _4382 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4384 = _4370 + _4382;
    float _4386 = _4376 * _4376;
    float _4388 = fma(_4380, _4380, _4386);
    float _4390 = fma(_4384, _4384, _4388);
    float _4392 = rsqrt(_4390);
    float _4394 = sqrt(_4390);
    float _4396 = _4392 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4398 = _4380 * _4396;
    float _4400 = _4384 * _4396;
    float _4402 = _4398 * _4398;
    float _4404 = _4400 * _4400;
    float _4406 = _4402 + _4404;
    float _4408 = sqrt(_4406);
    bool _4410 = _4408 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4412 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4414 = _4408 + _4412;
    float _4416 = _4392;
    float _4418 = _4406;
    float _4420 = _4414;
    float _4422 = _4372;
    float _4424 = _4376;
    if (_4410)
    {
        float _4426 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4416 = _4426;
    }
    float _4428 = _4416;
    if (_4410)
    {
        float _4430 = rsqrt(_4406);
        _4418 = _4430;
    }
    float _4432 = _4418;
    float _4434 = _4432;
    if (_4410)
    {
        float _4436 = _4414 * _4428;
        _4420 = _4436;
    }
    float _4438 = _4420;
    if (_4410)
    {
        float _4440 = _4438 * 0.15915493667125701904296875;
        _4422 = _4440;
    }
    float _4442 = _4422;
    float _4444 = _4384;
    if (_4410)
    {
        float _4446 = _4442 * 6.283185482025146484375;
        float _4448 = sin(_4446);
        _4444 = _4448;
    }
    float _4450 = _4444;
    float _4452 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4454 = precise::max(0.0, _4452);
    float _4456 = _4428;
    float _4458 = _4454;
    if (_4410)
    {
        float _4460 = _4442 * 6.283185482025146484375;
        float _4462 = cos(_4460);
        _4456 = _4462;
    }
    float _4464 = _4456;
    float _4466 = -_4396;
    float _4468 = -_4454;
    float _4470 = fma(_4376, _4466, _4468);
    if (_4410)
    {
        float _4472 = _4470 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4424 = _4472;
    }
    float _4474 = _4424;
    float _4476 = _4366 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4478 = _4474;
    float _4480 = _4450;
    if (_4410)
    {
        float _4482 = fma(_4450, _4474, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4478 = _4482;
    }
    float _4484 = _4478;
    float _4486 = _4484;
    if (!_4410)
    {
        _4480 = _4398;
    }
    float _4488 = _4480;
    float _4490 = _4488;
    float _4492 = _4464;
    if (_4410)
    {
        float _4494 = _4464 + (-1.0);
        _4458 = _4494;
    }
    float _4496 = _4458;
    float _4498 = _4496;
    if (_4410)
    {
        float _4500 = _4432 * _4484;
        _275 = _4500;
    }
    float _4502 = _275;
    if (!_4410)
    {
        _4486 = _4470;
    }
    float _4504 = _4486;
    float _4506 = _4504;
    if (_4410)
    {
        float _4508 = _4496 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _277 = _4508;
    }
    float _4510 = _277;
    if (_4410)
    {
        float _4512 = _4398 * _4502;
        _4490 = _4512;
    }
    float _4514 = _4490;
    if (!_4410)
    {
        _4498 = _4400;
    }
    float _4516 = _4498;
    float _4518 = _4516;
    if (_4410)
    {
        float _4520 = _4400 * _4502;
        _4518 = _4520;
    }
    float _4522 = _4518;
    if (!_4410)
    {
        _4434 = _4402;
    }
    float _4524 = _4434;
    float _4526 = _4524;
    if (_4410)
    {
        float _4528 = fma(_4470, _4464, _4510);
        _4506 = _4528;
    }
    float _4530 = _4506;
    if (_4410)
    {
        float _4532 = _4514 * _4514;
        _4526 = _4532;
    }
    float _4534 = _4526;
    if (!_4410)
    {
        _4492 = _4404;
    }
    float _4536 = _4492;
    float _4538 = _4536;
    if (_4410)
    {
        float _4540 = _4522 * _4522;
        _4538 = _4540;
    }
    float _4542 = _4538;
    float _4544 = fma(_4530, _4530, _4534);
    float _4546 = _4366 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4548 = _4544 + _4542;
    float _4550 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4552 = fma(_4394, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4550);
    float _4554 = precise::clamp(_4552, 0.0, 1.0);
    float _4556 = fma(_4368, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4476);
    float _4558 = _4366 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4560 = rsqrt(_4548);
    float _4562 = _4366 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4564 = -_4554;
    float _4566 = _4564 + 1.0;
    float _4568 = fma(_4368, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4558);
    float _4570 = fma(_4370, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4556);
    float _4572 = fma(_4368, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4562);
    float _4574 = fma(_4368, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4546);
    float _4576 = fma(_4370, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4568);
    float _4578 = abs(_4566);
    float _4580 = log2(_4578);
    float _4582 = fma(_4370, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4572);
    float _4584 = _4570 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4586 = _4576 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4588 = fma(_4370, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4574);
    float _4590 = _4582 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4592 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4594 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4596 = _4560 * _4514;
    float _4598 = _4560 * _4530;
    float _4600 = _4560 * _4522;
    float _4602 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4594);
    float _4604 = _4596 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4606 = _4584 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4608 = _4588 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4610 = fma(_4584, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4602);
    float _4612 = -_4604;
    float _4614 = fma(_4598, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4612);
    float _4616 = -_4606;
    float _4618 = fma(_4616, _4592, 1.0);
    float _4620 = _4580 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4622 = fma(_4608, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4610);
    float _4624 = -_4600;
    float _4626 = fma(_4624, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4614);
    float _4628 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4630 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4632 = log2(_4618);
    float _4634 = fma(_4626, -0.5, 0.5);
    float _4636 = fma(_4626, 0.5, 0.5);
    float _4638 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4628);
    float _4640 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4630);
    float _4642 = _4598 + 1.0;
    float _4644 = fma(_4636, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4646 = fma(_4584, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4638);
    float _4648 = exp2(_4620);
    float _4650 = fma(_4584, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4640);
    float _4652 = fma(_4636, _4644, -0.212114393711090087890625);
    float _4654 = fma(_4608, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4646);
    float _4656 = fma(_4608, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4650);
    float _4658 = fma(_4636, _4652, 1.570728778839111328125);
    float _4660 = 1.0 / _4622;
    float _4662 = _4632 * 0.693147182464599609375;
    float _4664 = sqrt(_4634);
    float _4666 = -_4598;
    float _4668 = fma(_4648, _4642, _4666);
    float _4670 = fma(_4668, 0.5, 0.5);
    float _4672 = _4654 * _4660;
    float _4674 = _4656 * _4660;
    float _4676 = _4662 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4678 = fma(_4672, 0.5, 0.5);
    float _4680 = fma(_4674, -0.5, 0.5);
    float _4682 = _4664 * 0.636619746685028076171875;
    float _4684 = -_4658;
    float _4686 = fma(_4682, _4684, 1.0);
    float3 _11645 = float3(_4678, _4680, _4676);
    float _4688 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11645, float3(0.0), isnan(_11645)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11645, float3(0.0), isnan(_11645)), level(0.0)).x;
    float3 _11656 = float3(_4678, _4680, _4676);
    float4 _4691 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11656, float3(0.0), isnan(_11656)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11656, float3(0.0), isnan(_11656)), level(0.0)).xyzw;
    float _4693 = _4691.x;
    float _4695 = _4691.y;
    float _4697 = _4691.z;
    float _4699 = _4691.w;
    float2 _11673 = float2(_4686, _4670);
    float3 _4703 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11673, float2(0.0), isnan(_11673)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11673, float2(0.0), isnan(_11673)), level(0.0)).xyz;
    float _4705 = _4703.x;
    float _4707 = _4703.y;
    float _4709 = _4703.z;
    float _4711 = _2764 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4713 = _4580 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4715 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4717 = fma(_2760, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4711);
    float _4719 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4715);
    float _4721 = exp2(_4713);
    float _4723 = fma(_2762, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4717);
    float _4725 = _2764 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4727 = _4723 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4729 = fma(_2760, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4725);
    float _4731 = 1.0 / _4727;
    bool _4733 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4735 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4737 = _4733 || _4735;
    bool _4739 = isnan(0.5);
    bool _4741 = _4737 || _4739;
    float _4743 = fma(_2762, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4729);
    float _4745 = fma(_4584, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4719);
    float _4747 = _4743 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4749 = fma(_4608, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4745);
    float _4751 = _4747 + _4727;
    float _4753 = _4590;
    if (_4741)
    {
        _4753 = 1.0;
    }
    float _4755 = _4753;
    float _4757 = _4751 * _4731;
    float _4759 = _4757 * 0.5;
    float _4761 = _4755;
    if (!_4741)
    {
        float _4763 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4765 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _4767 = fma(_4759, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4765);
        float _4769 = _4763 * 0.15915493667125701904296875;
        float _4771 = _4769 * 6.283185482025146484375;
        float _4773 = cos(_4771);
        float _4775 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4777 = _4775 * 0.15915493667125701904296875;
        float _4779 = _4769 * 6.283185482025146484375;
        float _4781 = sin(_4779);
        float _4783 = 1.0 / _4773;
        float _4785 = _4777 * 6.283185482025146484375;
        float _4787 = cos(_4785);
        float _4789 = _4781 * _4783;
        float _4791 = 1.0 / _4767;
        float _4793 = _4787 * _4789;
        float _4795 = _4777 * 6.283185482025146484375;
        float _4797 = sin(_4795);
        float _4799 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4801 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4799;
        float _4803 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _4805 = _4791 * _4803;
        float _4807 = 1.0 / _4793;
        float _4809 = 1.0 / _4801;
        float _4811 = _4797 * _4807;
        float _4813 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4815 = fma(_4811, _4805, _4813);
        float _4817 = _4815 * _4809;
        float _4819 = precise::clamp(_4817, 0.0, 1.0);
        _4761 = _4819;
    }
    float _4821 = _4761;
    float _4823 = -_4721;
    float _4825 = _4823 + 1.0;
    float _4827 = _4749 + _4622;
    bool _4829 = _4821 > 0.0;
    bool _4831 = isnan(_4821);
    bool _4833 = _4829 || _4831;
    bool _4835 = isnan(0.0);
    bool _4837 = _4833 || _4835;
    float _4839 = _4821 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4841 = _4825 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4843 = _4827 * 0.5;
    float _4845 = _4841 * _4688;
    float _4847 = -_4841;
    float _4849 = _4847 + 1.0;
    out.gl_Position.x = _4654;
    out.gl_Position.y = _4656;
    out.gl_Position.z = _4749;
    out.gl_Position.w = _4622;
    float _4851 = _4839 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4853 = _4699 * _4845;
    float _4855 = _4709 * _4845;
    out.m_86.x = _4368;
    out.m_86.y = _4366;
    out.m_86.z = _4370;
    float _4857 = fma(_4705, _4853, _4693);
    float _4859 = fma(_4707, _4853, _4695);
    float _4861 = _4699 * _4849;
    float _4863 = fma(_4699, _4855, _4697);
    out.m_88.z = _4843;
    out.m_88.w = _4622;
    out.m_51.x = _4851;
    out.m_90.x = _4857;
    out.m_90.y = _4859;
    out.m_90.z = _4863;
    out.m_90.w = _4861;
    if (_4837)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _4865 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4865;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

