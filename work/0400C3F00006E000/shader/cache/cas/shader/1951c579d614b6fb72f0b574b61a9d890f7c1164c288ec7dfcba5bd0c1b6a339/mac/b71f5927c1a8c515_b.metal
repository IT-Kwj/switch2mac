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
    float4 m_68 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_94 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_82 [[user(locn7)]];
    float4 m_88 [[user(locn8)]];
    float4 m_76 [[user(locn9)]];
    float4 m_78 [[user(locn10)]];
    float4 m_92 [[user(locn11)]];
    float4 m_90 [[user(locn12)]];
    float4 m_86 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_80 [[attribute(0)]];
    float4 m_58 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_62 [[attribute(3)]];
    float4 m_56 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_64 [[attribute(8)]];
    float4 m_66 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3553 = false;
    bool _1011 = false;
    bool _841 = false;
    bool _621 = false;
    bool _445 = false;
    bool _251 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_46.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_49.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3852 = as_type<float>(_129);
        out.gl_Position.z = _3852;
    }
    if (!_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = in.m_51.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_143)
    {
        float _149 = float(_113);
        _123 = _149;
    }
    float _151 = _123;
    bool _153 = _147 >= _151;
    bool _155 = !_143;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_49.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _131 = as_type<int>(_163);
    }
    int _165 = _131;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3921 = as_type<float>(_165);
        out.gl_Position.z = _3921;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = in.m_56.x;
    float _171 = in.m_56.y;
    float _173 = in.m_56.z;
    float _175 = in.m_58.x;
    float _177 = in.m_58.y;
    float _179 = in.m_58.z;
    float _181 = in.m_60.x;
    float _183 = in.m_60.y;
    float _185 = in.m_60.z;
    float _187 = in.m_62.x;
    float _189 = in.m_62.y;
    float _191 = in.m_62.z;
    int _193 = as_type<int>(_167) & 1;
    bool _195 = _193 != 0;
    int _197 = as_type<int>(_167) & 2;
    bool _199 = _197 != 0;
    bool _201 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _203 = !_195;
    float _205 = _203 ? (-0.5) : 0.5;
    bool _207 = !_199;
    float _209 = _207 ? (-0.5) : 0.5;
    float _211 = _171 * _177;
    float _213 = _171 * _183;
    float _215 = fma(_169, _175, _211);
    float _217 = _171 * _189;
    float _219 = fma(_169, _181, _213);
    float _221 = fma(_173, _179, _215);
    float _223 = fma(_169, _187, _217);
    float _225 = fma(_173, _185, _219);
    float _227 = fma(_173, _191, _223);
    bool _229 = !_201;
    float _231 = _221;
    float _249;
    if (!_229)
    {
        float _233 = in.m_64.x;
        float _235 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _237 = _233 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _241 = _239 * _235;
        float _243 = floor(_241);
        float _245 = -_243;
        float _247 = _241 + _245;
        _249 = _247;
        _251 = true;
    }
    else
    {
        float _253 = float(_113);
        float _255 = 1.0 / _253;
        float _257 = _147 * _255;
        _249 = _257;
    }
    _251 = false;
    float _259 = _249;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _263 = _259 + _261;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = _259 + _265;
    bool _269 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _271 = isnan(_259);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _285 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _259 + _293;
    float _297 = 1.0 / _283;
    bool _299 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _301 = 1.0 / _291;
    float _303 = 1.0 / _287;
    float _305 = _263 * _297;
    bool _307 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _309 = isnan(_259);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -_279;
    float _321 = _319 + 1.0;
    float _323 = _317 * _321;
    float _325 = _267 * _301;
    bool _327 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _329 = isnan(_259);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -_317;
    float _341 = _339 + 1.0;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _347 = _295 * _303;
    bool _349 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _351 = isnan(_259);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _361;
    float _365 = _337 * _341;
    float _367 = -_337;
    float _369 = _367 + 1.0;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _371;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _379 = fma(_363, _305, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _381 = _359 * _369;
    float _383 = fma(_373, _305, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _385 = fma(_345, _347, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _387 = fma(_377, _347, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _389 = -_359;
    float _391 = _389 + 1.0;
    float _393 = _379 * _381;
    float _395 = _383 * _381;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _401;
    float _405 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[143].x, _393);
    float _407 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[143].y, _395);
    float _409 = fma(_399, _325, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _411 = fma(_403, _325, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _413 = fma(_385, _365, _405);
    float _415 = fma(_387, _365, _407);
    float _417 = fma(_409, _323, _413);
    float _419 = fma(_411, _323, _415);
    float _421 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[146].x, _417);
    float _423 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[146].y, _419);
    bool _425 = !_299;
    float _443;
    if (!_425)
    {
        float _427 = in.m_64.x;
        float _429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _431 = _427 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _433 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[11].x, _147);
        float _435 = _433 * _429;
        float _437 = floor(_435);
        float _439 = -_437;
        float _441 = _435 + _439;
        _443 = _441;
        _445 = true;
    }
    else
    {
        float _447 = float(_113);
        float _449 = 1.0 / _447;
        float _451 = _147 * _449;
        _443 = _451;
    }
    _445 = false;
    float _453 = _443;
    float _455 = in.m_66.x;
    float _457 = in.m_66.y;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _461 = _453 + _459;
    bool _463 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _465 = isnan(_453);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _475;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _483 = 1.0 / _477;
    bool _485 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _487 = 1.0 / _481;
    float _489 = _423 * _457;
    bool _491 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _493 = isnan(_453);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = _461 * _483;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _507 = _453 + _505;
    bool _509 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _511 = isnan(_453);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = -_473;
    float _523 = _521 + 1.0;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _525;
    float _529 = _421 * _455;
    float _531 = _519 * _523;
    float _533 = -_519;
    float _535 = _533 + 1.0;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _537;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _541;
    float _545 = fma(_527, _503, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _547 = _501 * _535;
    float _549 = fma(_539, _503, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _551 = fma(_543, _503, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _553 = _507 * _487;
    float _555 = _545 * _547;
    float _557 = _549 * _547;
    float _559 = _551 * _547;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _565 = -_501;
    float _567 = _565 + 1.0;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _577 = fma(_563, _553, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _579 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[107].x, _559);
    float _581 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[107].y, _557);
    float _583 = fma(_571, _553, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _585 = fma(_575, _553, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _587 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[107].z, _555);
    float _589 = fma(_577, _531, _581);
    float _591 = fma(_583, _531, _579);
    float _593 = fma(_585, _531, _587);
    float _595 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[109].y, _589);
    float _597 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[109].x, _591);
    float _599 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[109].z, _593);
    bool _601 = !_485;
    float _619;
    if (!_601)
    {
        float _603 = in.m_64.x;
        float _605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _607 = _603 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _609 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[11].y, _147);
        float _611 = _609 * _605;
        float _613 = floor(_611);
        float _615 = -_613;
        float _617 = _611 + _615;
        _619 = _617;
        _621 = true;
    }
    else
    {
        float _623 = float(_113);
        float _625 = 1.0 / _623;
        float _627 = _147 * _625;
        _619 = _627;
    }
    _621 = false;
    float _629 = _619;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _633 = _629 + _631;
    float _635 = _597 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _641;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _649 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _651 = isnan(_629);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = 1.0 / _639;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _667 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _669 = isnan(_629);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    float _679 = _595 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _681 = _599 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _683 = _635 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _685 = _679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _687 = 1.0 / _647;
    float _689 = _681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _691 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _693 = _643 * _661;
    bool _695 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _697 = isnan(_629);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = 1.0 / _665;
    float _709 = -_659;
    float _711 = _709 + 1.0;
    float _713 = fma(_693, _633, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _719 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _721 = isnan(_629);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = -_705;
    float _733 = _731 + 1.0;
    float _735 = _705 * _711;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _739 = _737 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _741 = 1.0 / _717;
    float _743 = -_729;
    float _745 = _743 + 1.0;
    float _747 = _677 * _733;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _749;
    float _753 = _739 * _687;
    float _755 = _659 * _745;
    float _757 = _713 * _747;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _761 = _629 + _759;
    float _763 = -_677;
    float _765 = _763 + 1.0;
    bool _767 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _769 = isnan(_629);
    bool _771 = _767 || _769;
    bool _773 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _775 = _771 || _773;
    float _777 = float(_775);
    float _779 = _751 * _707;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _787 = _629 + _785;
    float _789 = fma(_753, _761, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _791 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[115].x, _757);
    float _793 = -_777;
    float _795 = _793 + 1.0;
    float _797 = _783 * _741;
    float _799 = fma(_779, _787, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _803 = _629 + _801;
    float _805 = fma(_789, _735, _791);
    float _807 = _729 * _795;
    float _809 = fma(_797, _803, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _811 = fma(_799, _755, _805);
    float _813 = fma(_809, _807, _811);
    float _815 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[119].x, _813);
    float _817 = _815 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_68.x = _683;
    out.m_68.y = _685;
    out.m_68.z = _689;
    out.m_68.w = _817;
    bool _819 = !_691;
    float _821 = _707;
    float _839;
    if (!_819)
    {
        float _823 = in.m_64.x;
        float _825 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _827 = _823 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _829 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[11].z, _147);
        float _831 = _829 * _825;
        float _833 = floor(_831);
        float _835 = -_833;
        float _837 = _831 + _835;
        _839 = _837;
        _841 = true;
    }
    else
    {
        float _843 = float(_113);
        float _845 = 1.0 / _843;
        float _847 = _147 * _845;
        _839 = _847;
    }
    _841 = false;
    float _849 = _839;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _853 = _849 + _851;
    bool _855 = _849 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _857 = isnan(_849);
    bool _859 = _855 || _857;
    bool _861 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _863 = _859 || _861;
    float _865 = float(_863);
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _869 = _849 + _867;
    bool _871 = _849 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _873 = isnan(_849);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _883;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _891 = _849 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _893 = isnan(_849);
    bool _895 = _891 || _893;
    bool _897 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _899 = _895 || _897;
    float _901 = float(_899);
    float _903 = -_865;
    float _905 = _903 + 1.0;
    float _907 = 1.0 / _889;
    float _909 = _901 * _905;
    float _911 = -_901;
    float _913 = _911 + 1.0;
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _915;
    bool _919 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _921 = 1.0 / _885;
    float _923 = _881 * _913;
    float _925 = -_881;
    float _927 = _925 + 1.0;
    float _929 = _869 * _907;
    float _931 = _853 * _921;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _933;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _937;
    float _941 = fma(_917, _931, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _943 = fma(_935, _931, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _945 = fma(_939, _931, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _947 = _941 * _923;
    float _949 = _943 * _923;
    float _951 = _945 * _923;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _959 = _957 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _963 = _961 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _965 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[123].x, _947);
    float _967 = fma(_955, _929, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _969 = fma(_959, _929, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _971 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[123].y, _949);
    float _973 = fma(_963, _929, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _975 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[123].z, _951);
    float _977 = fma(_967, _909, _965);
    float _979 = fma(_969, _909, _971);
    float _981 = fma(_973, _909, _975);
    float _983 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[125].x, _977);
    float _985 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[125].y, _979);
    float _987 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[125].z, _981);
    bool _989 = !_919;
    float _991 = _979;
    float _1009;
    if (!_989)
    {
        float _993 = in.m_64.x;
        float _995 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _997 = _993 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _999 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[11].w, _147);
        float _1001 = _999 * _995;
        float _1003 = floor(_1001);
        float _1005 = -_1003;
        float _1007 = _1001 + _1005;
        _1009 = _1007;
        _1011 = true;
    }
    else
    {
        float _1013 = float(_113);
        float _1015 = 1.0 / _1013;
        float _1017 = _147 * _1015;
        _1009 = _1017;
    }
    _1011 = false;
    float _1019 = _1009;
    float _1021 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1023 = int(_1021);
    float _1025 = float(_113);
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1029 = _1027 != 0;
    float _1031 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1033 = int(_1031);
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1037 = _1035 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1039 = float(_1023);
    float _1041 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1043 = int(_1041);
    if (_1029)
    {
        float _1045 = in.m_64.x;
        _991 = _1045;
    }
    float _1047 = _991;
    float _1049 = _1047;
    if (_1029)
    {
        _821 = 1.0;
    }
    float _1051 = _821;
    float _1053 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1055 = _1051;
    if (!_1029)
    {
        _1055 = 7.345489978790283203125;
    }
    float _1057 = _1055;
    float _1059 = _1057;
    if (!_1029)
    {
        float _1061 = in.m_64.y;
        _1049 = _1061;
    }
    float _1063 = _1049;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1067 = float(uint(_1033));
    float _1069 = 1.0 / _1039;
    int _1071 = ~_1033;
    int _1073 = _1071 + 1;
    bool _1075 = _1033 == 0;
    float _1077 = 1.0 / _1067;
    float _1079 = float(uint(_1043));
    int _1081 = ~_1043;
    int _1083 = _1081 + 1;
    float _1085 = _147 * _1069;
    float _1087 = 1.0 / _1079;
    int _1089 = as_type<int>(_1077) + (-2);
    float _1091 = trunc(_1085);
    int _1093 = int(_1091);
    int _1095 = ~_1033;
    int _1097 = _1095 + 1;
    float _1099 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1101 = int(_1099);
    float _1103 = float(uint(_1093));
    float _1105 = 1.0 / _1037;
    float _1107 = as_type<float>(_1089) * _1103;
    float _1109 = float(_1101);
    float _1111 = trunc(_1107);
    float _1113 = precise::max(_1111, 0.0);
    uint _1116 = uint(_1113);
    float _1118 = 1.0 / _1109;
    int _1120 = _1097 * int(_1116);
    int _1122 = _1120 + _1093;
    float _1124 = float(uint(_1122));
    float _1126 = in.m_64.x;
    float _1128 = in.m_64.y;
    float _1130 = in.m_64.z;
    float _1132 = in.m_64.w;
    float _1134 = _147 * _1118;
    float _1136 = as_type<float>(_1089) * _1124;
    float _1138 = trunc(_1134);
    int _1140 = int(_1138);
    float _1142 = trunc(_1136);
    float _1144 = precise::max(_1142, 0.0);
    uint _1146 = uint(_1144);
    float _1148 = float(uint(_1140));
    float _1150 = _1057 * _1126;
    float _1152 = _1130;
    if (_1029)
    {
        _1059 = 1.0;
    }
    float _1154 = _1059;
    float _1156 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1158 = _1154;
    if (!_1029)
    {
        _1158 = 1.2345600128173828125;
    }
    float _1160 = _1158;
    float _1162 = floor(_1150);
    int _1164 = int(_1116) + int(_1146);
    float _1166 = float(_1033);
    float _1168 = float(_1093);
    int _1170 = _1073 * _1164;
    int _1172 = _1170 + _1093;
    float _1174 = _1160 * _1063;
    bool _1176 = _1168 >= _1166;
    bool _1178 = isnan(_1168);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan(_1166);
    bool _1184 = _1180 || _1182;
    float _1186 = float(_1184);
    bool _1188 = uint(_1172) >= uint(_1033);
    float _1190 = floor(_1174);
    float _1192 = -_1162;
    float _1194 = _1150 + _1192;
    bool _1196 = !_1188;
    int _1198 = _1196 ? 0 : (-1);
    float _1200 = _1194 * _1166;
    int _1202 = ~_1164;
    int _1204 = _1202 + _1198;
    int _1206 = _1204 + 1;
    float _1208 = trunc(_1186);
    int _1210 = int(_1208);
    int _1212 = as_type<int>(_1087) + (-2);
    int _1214 = _1033 * _1206;
    int _1216 = _1214 + _1093;
    int _1218 = _1033 + (-1);
    float _1220 = as_type<float>(_1212) * _1148;
    float _1222 = 1.0 / _1025;
    bool _1224 = !_1075;
    int _1226 = _1224 ? _1216 : (-1);
    int _1228 = ~_1210;
    int _1230 = _1228 + 1;
    int _1232 = _1230 + 1;
    float _1234 = trunc(_1220);
    float _1236 = precise::max(_1234, 0.0);
    uint _1238 = uint(_1236);
    int _1240 = _1226 * _1232;
    float _1242 = -_1190;
    float _1244 = _1174 + _1242;
    int _1246 = ~_1043;
    int _1248 = _1246 + 1;
    float _1250 = _147 * _1222;
    int _1252 = _1210 * _1218;
    int _1254 = _1252 + _1240;
    float _1256 = trunc(_1200);
    int _1258 = int(_1256);
    float _1260 = _1250 * _1166;
    int _1262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1264 = _1262 != 0;
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1268 = _1266 != 0;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1272 = _1270 != 0;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1276 = _1274 != 0;
    int _1278 = _1248 * int(_1238);
    int _1280 = _1278 + _1140;
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1284 = _1282 != 0;
    float _1286 = trunc(_1260);
    int _1288 = int(_1286);
    bool _1290 = !_1268;
    int _1292 = _1290 ? 0 : 1;
    bool _1294 = !_1264;
    int _1296 = _1294 ? 0 : 1;
    float _1298 = float(uint(_1280));
    int _1300 = abs(_1292);
    int _1302 = abs(_1296);
    float _1304 = as_type<float>(_1212) * _1298;
    bool _1306 = !_1276;
    int _1308 = _1306 ? 0 : 1;
    int _1310 = _1254 * _1300;
    bool _1312 = !_1272;
    int _1314 = _1312 ? 0 : 1;
    bool _1316 = !_1284;
    int _1318 = _1316 ? 0 : 1;
    int _1320 = _1288 * _1302;
    int _1322 = _1320 + _1310;
    int _1324 = abs(_1308);
    int _1326 = abs(_1314);
    float _1328 = trunc(_1304);
    float _1330 = precise::max(_1328, 0.0);
    uint _1332 = uint(_1330);
    float _1334 = float(_1043);
    int _1336 = _1258 * _1324;
    int _1338 = _1336 + _1093;
    int _1340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1342 = _1340 != 0;
    int _1344 = abs(_1318);
    float _1346 = float(_1140);
    int _1348 = _1338 * _1326;
    int _1350 = _1348 + _1322;
    int _1352 = int(_1238) + int(_1332);
    float _1354 = _1244 * _1334;
    bool _1356 = _1346 >= _1334;
    bool _1358 = isnan(_1346);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan(_1334);
    bool _1364 = _1360 || _1362;
    float _1366 = float(_1364);
    int _1368 = _1258 * _1344;
    int _1370 = _1368 + _1350;
    bool _1372 = !_1342;
    int _1374 = _1372 ? 0 : 1;
    int _1376 = _1083 * _1352;
    int _1378 = _1376 + _1140;
    float _1380 = trunc(_1366);
    int _1382 = int(_1380);
    float _1384 = _1250 * _1334;
    float _1386 = float(uint(_1370));
    bool _1388 = uint(_1378) >= uint(_1043);
    int _1390 = _1043 + (-1);
    float _1392 = as_type<float>(_1089) * _1386;
    float _1394 = trunc(_1354);
    int _1396 = int(_1394);
    bool _1398 = !_1388;
    int _1400 = _1398 ? 0 : (-1);
    int _1402 = abs(_1374);
    int _1404 = ~_1352;
    int _1406 = _1404 + _1400;
    int _1408 = _1406 + 1;
    int _1410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1412 = _1410 != 0;
    int _1414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1416 = _1414 != 0;
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1420 = _1418 != 0;
    int _1422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1424 = _1422 != 0;
    float _1426 = trunc(_1392);
    float _1428 = precise::max(_1426, 0.0);
    uint _1430 = uint(_1428);
    int _1432 = ~_1033;
    int _1434 = _1432 + 1;
    int _1436 = _1043 * _1408;
    int _1438 = _1436 + _1140;
    bool _1440 = _1043 == 0;
    int _1442 = ~_1382;
    int _1444 = _1442 + 1;
    int _1446 = _1444 + 1;
    bool _1448 = !_1440;
    int _1450 = _1448 ? _1438 : (-1);
    int _1452 = _1396 * _1402;
    int _1454 = _1452 + _1140;
    float _1456 = trunc(_1384);
    int _1458 = int(_1456);
    bool _1460 = _1033 == 0;
    int _1462 = _1450 * _1446;
    bool _1464 = !_1416;
    int _1466 = _1464 ? 0 : 1;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1470 = _1468 != 0;
    int _1472 = _1434 * int(_1430);
    int _1474 = _1472 + _1370;
    int _1476 = abs(_1466);
    int _1478 = _1382 * _1390;
    int _1480 = _1478 + _1462;
    bool _1482 = !_1412;
    int _1484 = _1482 ? 0 : 1;
    float _1486 = float(uint(_1474));
    int _1488 = _1480 * _1476;
    bool _1490 = !_1420;
    int _1492 = _1490 ? 0 : 1;
    int _1494 = abs(_1484);
    float _1496 = as_type<float>(_1089) * _1486;
    int _1498 = abs(_1492);
    bool _1500 = !_1424;
    int _1502 = _1500 ? 0 : 1;
    int _1504 = _1458 * _1494;
    int _1506 = _1504 + _1488;
    float _1508 = float(uint(_1338));
    float _1510 = trunc(_1496);
    float _1512 = precise::max(_1510, 0.0);
    uint _1514 = uint(_1512);
    int _1516 = abs(_1502);
    float _1518 = as_type<float>(_1089) * _1508;
    int _1520 = ~_1033;
    int _1522 = _1520 + 1;
    int _1524 = _1454 * _1498;
    int _1526 = _1524 + _1506;
    float _1528 = float(uint(_1454));
    float _1530 = trunc(_1518);
    float _1532 = precise::max(_1530, 0.0);
    uint _1534 = uint(_1532);
    int _1536 = 0;
    if (_1470)
    {
        _1536 = 0;
    }
    int _1538 = _1536;
    int _1540 = _1396 * _1516;
    int _1542 = _1540 + _1526;
    float _1544 = as_type<float>(_1212) * _1528;
    int _1546 = _1538;
    if (!_1470)
    {
        _1546 = 1;
    }
    int _1548 = _1546;
    float _1550 = float(uint(_1542));
    float _1552 = trunc(_1544);
    float _1554 = precise::max(_1552, 0.0);
    uint _1556 = uint(_1554);
    int _1558 = int(_1430) + int(_1514);
    int _1560 = ~_1043;
    int _1562 = _1560 + 1;
    float _1564 = as_type<float>(_1212) * _1550;
    int _1566 = ~_1043;
    int _1568 = _1566 + 1;
    int _1570 = _1522 * _1558;
    int _1572 = _1570 + _1370;
    bool _1574 = _1126 > 0.5;
    int _1576 = _1522 * int(_1534);
    int _1578 = _1576 + _1338;
    int _1580 = ~_1043;
    int _1582 = _1580 + 1;
    float _1584 = trunc(_1564);
    float _1586 = precise::max(_1584, 0.0);
    uint _1588 = uint(_1586);
    bool _1590 = uint(_1572) >= uint(_1033);
    float _1592 = float(uint(_1578));
    bool _1594 = !_1590;
    int _1596 = _1594 ? 0 : (-1);
    float _1598 = as_type<float>(_1089) * _1592;
    int _1600 = ~_1558;
    int _1602 = _1600 + _1596;
    int _1604 = _1602 + 1;
    int _1606 = _1562 * int(_1556);
    int _1608 = _1606 + _1454;
    int _1610 = _1033 * _1604;
    int _1612 = _1610 + _1370;
    float _1614 = float(uint(_1608));
    int _1616 = _1582 * int(_1588);
    int _1618 = _1616 + _1542;
    float _1620 = trunc(_1598);
    float _1622 = precise::max(_1620, 0.0);
    uint _1624 = uint(_1622);
    bool _1626 = !_1460;
    int _1628 = _1626 ? _1612 : (-1);
    float _1630 = as_type<float>(_1212) * _1614;
    float _1632 = float(uint(_1618));
    int _1634 = _1628 & 3;
    bool _1636 = _1634 != 0;
    int _1638 = _1628 & 3;
    bool _1640 = _1638 != 0;
    float _1642 = as_type<float>(_1212) * _1632;
    bool _1644 = uint(_1634) > 1u;
    float _1646 = trunc(_1630);
    float _1648 = precise::max(_1646, 0.0);
    uint _1650 = uint(_1648);
    bool _1652 = _1634 != 3;
    int _1654 = _1640 ? 0 : 1;
    int _1656 = ~_1033;
    int _1658 = _1656 + 1;
    bool _1660 = uint(_1634) >= 2u;
    float _1662 = trunc(_1642);
    float _1664 = precise::max(_1662, 0.0);
    uint _1666 = uint(_1664);
    int _1668 = int(_1534) + int(_1624);
    int _1670 = ~_1654;
    int _1672 = _1670 + 1;
    int _1674 = _1672 + 1;
    int _1676 = _1674;
    if (!_1644)
    {
        int _1678 = ~_1654;
        int _1680 = _1678 + 1;
        _1676 = _1680;
    }
    int _1682 = _1676;
    int _1684 = _1658 * _1668;
    int _1686 = _1684 + _1338;
    int _1688 = _1660 ? 0 : 1;
    int _1690 = ~_1688;
    int _1692 = _1690 + 1;
    int _1694 = _1692 + 1;
    int _1696 = _1694;
    if (_1652)
    {
        int _1698 = ~_1688;
        int _1700 = _1698 + 1;
        _1696 = _1700;
    }
    int _1702 = _1696;
    bool _1704 = _1132 > 0.5;
    bool _1706 = uint(_1686) >= uint(_1033);
    int _1708 = ~_1043;
    int _1710 = _1708 + 1;
    float _1712 = in.m_46.x;
    float _1714 = in.m_46.y;
    float _1716 = in.m_46.z;
    int _1718 = int(_1556) + int(_1650);
    int _1720 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1722 = _1720 != 0;
    int _1724 = int(_1588) + int(_1666);
    int _1726 = _1710 * _1718;
    int _1728 = _1726 + _1454;
    bool _1730 = !_1706;
    int _1732 = _1730 ? 0 : (-1);
    int _1734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1736 = _1734 != 0;
    int _1738 = _1568 * _1724;
    int _1740 = _1738 + _1542;
    float _1742 = -_205;
    int _1744 = _1574 ? as_type<int>(_1742) : as_type<int>(_205);
    bool _1746 = !_1736;
    int _1748 = _1746 ? 0 : 1;
    bool _1750 = uint(_1728) >= uint(_1043);
    bool _1752 = _1128 > 0.5;
    bool _1754 = !_1750;
    int _1756 = _1754 ? 0 : (-1);
    bool _1758 = !_1722;
    float _1760 = _1758 ? _205 : as_type<float>(_1744);
    float _1762 = -_209;
    int _1764 = _1752 ? as_type<int>(_1762) : as_type<int>(_209);
    float _1766 = _177 * _1714;
    bool _1768 = uint(_1740) >= uint(_1043);
    float _1770 = _183 * _1714;
    int _1772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1774 = _1772 != 0;
    float _1776 = fma(_175, _1712, _1766);
    bool _1778 = _1130 > 0.5;
    float _1780 = _189 * _1714;
    bool _1782 = !_1768;
    int _1784 = _1782 ? 0 : (-1);
    float _1786 = fma(_181, _1712, _1770);
    bool _1788 = !_1774;
    float _1790 = _1788 ? _209 : as_type<float>(_1764);
    float _1792 = in.m_58.w;
    float _1794 = -_205;
    int _1796 = _1778 ? as_type<int>(_1794) : as_type<int>(_205);
    float _1798 = fma(_187, _1712, _1780);
    int _1800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1802 = _1800 != 0;
    float _1804 = _1126 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1808 = _1806 != 0;
    float _1810 = in.m_60.w;
    int _1812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1814 = _1812 != 0;
    float _1816 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1818 = _1816 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1820 = 1.0 / _1818;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1824 = ~_1724;
    int _1826 = _1824 + _1784;
    int _1828 = _1826 + 1;
    float _1830 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1832 = ~_1668;
    int _1834 = _1832 + _1732;
    int _1836 = _1834 + 1;
    float _1838 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1838;
    float _1842 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1844 = _1842 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1846 = -_1830;
    float _1848 = fma(_1804, 2.0, _1846);
    float _1850 = fma(_1156, -2.0, _1822);
    float _1852 = fma(_179, _1716, _1776);
    float _1854 = fma(_185, _1716, _1786);
    float _1856 = in.m_62.w;
    float _1858 = _1840 * _1105;
    float _1860 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1862 = _1019 + _1860;
    bool _1864 = _1019 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1866 = isnan(_1019);
    bool _1868 = _1864 || _1866;
    bool _1870 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1872 = _1868 || _1870;
    float _1874 = float(_1872);
    float _1876 = _1844 * _1820;
    bool _1878 = _1019 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1880 = isnan(_1019);
    bool _1882 = _1878 || _1880;
    bool _1884 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1886 = _1882 || _1884;
    float _1888 = float(_1886);
    float _1890 = fma(_1858, _1862, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1892 = _1019 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1894 = isnan(_1019);
    bool _1896 = _1892 || _1894;
    bool _1898 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1900 = _1896 || _1898;
    float _1902 = float(_1900);
    float _1904 = -_1874;
    float _1906 = _1904 + 1.0;
    bool _1908 = !_1814;
    float _1910 = _1908 ? _205 : as_type<float>(_1796);
    float _1912 = -_1888;
    float _1914 = _1912 + 1.0;
    bool _1916 = _1548 != 1;
    float _1918 = _1902 * _1906;
    float _1920 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1922 = _1019 + _1920;
    float _1924 = _1874 * _1914;
    float _1926 = fma(_191, _1716, _1798);
    float _1928 = _1852 + _1792;
    float _1930 = _1890 * _1918;
    float _1932 = -_1902;
    float _1934 = _1932 + 1.0;
    float _1936 = -_147;
    float _1938 = fma(_1936, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1848);
    float _1940 = _1760 + 0.5;
    float _1942 = fma(_1876, _1922, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1944 = _1926 + _1856;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1948 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1850);
    float _1950 = fma(_1934, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1930);
    float _1952 = fma(_1940, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1938);
    float _1954 = _1934;
    float _1956 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    float _1958 = _1946;
    float _1960 = _1910;
    float _1962 = _1928;
    if (!_1916)
    {
        _1954 = _1128;
    }
    float _1964 = _1954;
    float _1966 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1968 = _1964;
    if (!_1916)
    {
        _1956 = _1128;
    }
    float _1970 = _1956;
    float _1972 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1946);
    float _1974 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1966);
    float _1976 = _1970;
    if (_1916)
    {
        _1968 = _1126;
    }
    float _1978 = _1968;
    float _1980 = fma(_1942, _1924, _1950);
    if (_1916)
    {
        _1976 = _1126;
    }
    float _1982 = _1976;
    int _1984 = _1043 * _1828;
    int _1986 = _1984 + _1542;
    if (!_1916)
    {
        _1958 = _1130;
    }
    float _1988 = _1958;
    float _1990 = _1854 + _1810;
    float _1992 = _1988;
    if (_1916)
    {
        _1992 = _1128;
    }
    float _1994 = _1992;
    float _1996 = _1790 + (-0.5);
    if (_1916)
    {
        _1152 = _1128;
    }
    float _1998 = _1152;
    float _2000 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2002 = _1628 >> 31;
    float _2004 = -_1996;
    float _2006 = -_1948;
    float _2008 = fma(_2004, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2006);
    bool _2010 = !_1440;
    int _2012 = _2010 ? _1986 : (-1);
    float _2014 = fma(_1982, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2000);
    int _2016 = _2002 & 3;
    float _2018 = _1978 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2020 = _2012 >> 31;
    float _2022 = fma(_1888, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1980);
    int _2024 = _1628 + _2016;
    float _2026 = -_1053;
    float _2028 = fma(_2018, 2.0, _2026);
    int _2030 = _2020 & 3;
    float _2032 = _1994 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2034 = _2024 >> 2;
    int _2036 = _1033 * _1836;
    int _2038 = _2036 + _1338;
    int _2040 = _2012 + _2030;
    float _2042 = fma(_2032, -2.0, _1065);
    int _2044 = _2034 << 4;
    int _2046 = _2044 + 368;
    float _2048 = -_147;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2028);
    int _2052 = _2040 >> 2;
    float _2054 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2056 = _1990 + _2054;
    uint _2058 = uint(int(uint(_2046) >> uint(2)));
    uint _2060 = uint(int(uint(int(_2058)) >> uint(2)));
    int _2062 = int(_2058) & 3;
    float _2064 = (*spvDescriptorSet0.vp_c9)._m0[int(_2060)][_2062];
    int _2066 = int(_2058) + 1;
    uint _2068 = uint(int(uint(_2066) >> uint(2)));
    int _2070 = _2066 & 3;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[int(_2068)][_2070];
    bool _2074 = !_1636;
    int _2076 = _2074 ? 0 : 1;
    float _2078 = _1910 + 0.5;
    int _2080 = _2052 << 4;
    int _2082 = _2080 + 512;
    float _2084 = _2056 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2086 = _2012 & 3;
    bool _2088 = _2086 != 0;
    float _2090 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2014);
    int _2092 = _2012 & 3;
    bool _2094 = _2092 != 0;
    uint _2096 = uint(int(uint(_2082) >> uint(2)));
    uint _2098 = uint(int(uint(int(_2096)) >> uint(2)));
    int _2100 = int(_2096) & 3;
    float _2102 = (*spvDescriptorSet0.vp_c9)._m0[int(_2098)][_2100];
    int _2104 = int(_2096) + 1;
    uint _2106 = uint(int(uint(_2104) >> uint(2)));
    int _2108 = _2104 & 3;
    float _2110 = (*spvDescriptorSet0.vp_c9)._m0[int(_2106)][_2108];
    int _2112 = _2088 ? 0 : 1;
    float _2114 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1974);
    bool _2116 = uint(_2092) > 1u;
    int _2118 = ~_2112;
    int _2120 = _2118 + 1;
    int _2122 = _2120 + 1;
    int _2124 = _2046 + 8;
    uint _2126 = uint(int(uint(_2124) >> uint(2)));
    uint _2128 = uint(int(uint(int(_2126)) >> uint(2)));
    int _2130 = int(_2126) & 3;
    float _2132 = (*spvDescriptorSet0.vp_c9)._m0[int(_2128)][_2130];
    int _2134 = int(_2126) + 1;
    uint _2136 = uint(int(uint(_2134) >> uint(2)));
    int _2138 = _2134 & 3;
    float _2140 = (*spvDescriptorSet0.vp_c9)._m0[int(_2136)][_2138];
    int _2142 = abs(_1682);
    int _2144 = abs(_2076);
    float _2146 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2148 = ~_2142;
    int _2150 = _2148 + 1;
    int _2152 = _2150 + 1;
    int _2154 = ~_1718;
    int _2156 = _2154 + _1756;
    int _2158 = _2156 + 1;
    float _2160 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2146);
    int _2162 = _2122;
    if (!_2116)
    {
        int _2164 = ~_2112;
        int _2166 = _2164 + 1;
        _2162 = _2166;
    }
    int _2168 = _2162;
    float _2170 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1972);
    bool _2172 = !_2094;
    int _2174 = _2172 ? 0 : 1;
    int _2176 = _2082 + 8;
    uint _2178 = uint(int(uint(_2176) >> uint(2)));
    uint _2180 = uint(int(uint(int(_2178)) >> uint(2)));
    int _2182 = int(_2178) & 3;
    float _2184 = (*spvDescriptorSet0.vp_c9)._m0[int(_2180)][_2182];
    int _2186 = int(_2178) + 1;
    uint _2188 = uint(int(uint(_2186) >> uint(2)));
    int _2190 = _2186 & 3;
    float _2192 = (*spvDescriptorSet0.vp_c9)._m0[int(_2188)][_2190];
    bool _2194 = _1634 != 3;
    float _2196 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2198 = _1928 + _2196;
    bool _2200 = uint(_2092) >= 2u;
    float _2202 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2204 = _1944 + _2202;
    bool _2206 = !_2194;
    int _2208 = _2206 ? 0 : (-1);
    float _2210 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2084);
    bool _2212 = _2092 != 3;
    float _2214 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2042);
    int _2216 = abs(_2168);
    float _2218 = fma(_2204, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2210);
    int _2220 = _2200 ? 0 : 1;
    float _2222 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2160);
    int _2224 = ~_2216;
    int _2226 = _2224 + 1;
    int _2228 = _2226 + 1;
    float _2230 = fma(_2078, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2050);
    int _2232 = abs(_2174);
    float _2234 = -_2222;
    float _2236 = _2234 + 1.0;
    int _2238 = ~_2220;
    int _2240 = _2238 + 1;
    int _2242 = _2240 + 1;
    float _2244 = -_2170;
    float _2246 = _2244 + 1.0;
    int _2248 = abs(_2208);
    int _2250 = _2152 * as_type<int>(_2072);
    int _2252 = _2242;
    if (_2212)
    {
        int _2254 = ~_2220;
        int _2256 = _2254 + 1;
        _2252 = _2256;
    }
    int _2258 = _2252;
    int _2260 = ~_2144;
    int _2262 = _2260 + 1;
    int _2264 = _2262 + 1;
    bool _2266 = _2092 != 3;
    int _2268 = _2228 * as_type<int>(_2110);
    int _2270 = _2264 * as_type<int>(_2064);
    int _2272 = _2270 + _2250;
    int _2274 = abs(_1702);
    float _2276 = _987 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2278 = ~_2232;
    int _2280 = _2278 + 1;
    int _2282 = _2280 + 1;
    int _2284 = ~_2274;
    int _2286 = _2284 + 1;
    int _2288 = _2286 + 1;
    float _2290 = _2276 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2292 = _2282 * as_type<int>(_2102);
    int _2294 = _2292 + _2268;
    int _2296 = abs(_2258);
    int _2298 = _2288 * as_type<int>(_2132);
    int _2300 = _2298 + _2272;
    bool _2302 = !_2266;
    int _2304 = _2302 ? 0 : (-1);
    int _2306 = ~_2248;
    int _2308 = _2306 + 1;
    int _2310 = _2308 + 1;
    int _2312 = ~_2296;
    int _2314 = _2312 + 1;
    int _2316 = _2314 + 1;
    int _2318 = abs(_2304);
    int _2320 = _2310 * as_type<int>(_2140);
    int _2322 = _2320 + _2300;
    bool _2324 = !_1808;
    int _2326 = _2324 ? 0 : 1;
    int _2328 = _2316 * as_type<int>(_2184);
    int _2330 = _2328 + _2294;
    float _2332 = -_209;
    int _2334 = _1704 ? as_type<int>(_2332) : as_type<int>(_209);
    int _2336 = abs(_2326);
    int _2338 = ~_2318;
    int _2340 = _2338 + 1;
    int _2342 = _2340 + 1;
    bool _2344 = !_1802;
    float _2346 = _2344 ? _209 : as_type<float>(_2334);
    int _2348 = _1043 * _2158;
    int _2350 = _2348 + _1454;
    int _2352 = ~_2336;
    int _2354 = _2352 + 1;
    int _2356 = _2354 + 1;
    int _2358 = _2342 * as_type<int>(_2192);
    int _2360 = _2358 + _2330;
    int _2362 = abs(_1748);
    bool _2364 = !_1440;
    int _2366 = _2364 ? _2350 : (-1);
    int _2368 = _2360 * _2356;
    int _2370 = ~_2362;
    int _2372 = _2370 + 1;
    int _2374 = _2372 + 1;
    bool _2376 = !_1460;
    int _2378 = _2376 ? _2038 : (-1);
    int _2380 = _2366 * _2336;
    int _2382 = _2380 + _2368;
    float _2384 = _2056 * _2056;
    int _2386 = _2322 * _2374;
    bool _2388 = _2218 >= 0.0;
    float _2390 = _2346 + (-0.5);
    float _2392 = fma(_2198, _2198, _2384);
    int _2394 = _2378 * _2362;
    int _2396 = _2394 + _2386;
    float _2398 = _983 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2400 = -_2390;
    float _2402 = -_2214;
    float _2404 = fma(_2400, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2402);
    float _2406 = fma(_2204, _2204, _2392);
    float _2408 = -_2090;
    float _2410 = _2408 + 1.0;
    float _2412 = -_2114;
    float _2414 = _2412 + 1.0;
    float _2416 = _985 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2418 = fma(_2346, _2236, _2404);
    float _2420 = -_2410;
    float _2422 = fma(_1910, _2420, _2230);
    float _2424 = rsqrt(_2406);
    float _2426 = _2422;
    if (_2388)
    {
        _1960 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2428 = _1960;
    float _2430 = fma(_1790, _2414, _2008);
    float _2432 = -_2246;
    float _2434 = fma(_1760, _2432, _1952);
    float _2436 = _2398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2438 = _2416 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2440 = _2022 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2442 = as_type<int>(_2428);
    if (_2388)
    {
        float _2444 = _2428 * 5.0;
        _2442 = as_type<int>(_2444);
    }
    int _2446 = _2442;
    float _2448 = float(_2396);
    out.m_70.x = _2434;
    out.m_70.y = _2430;
    out.m_70.z = _2422;
    out.m_70.w = _2418;
    float _2450 = float(_2382);
    out.m_72.x = _2436;
    out.m_72.y = _2438;
    out.m_72.z = _2290;
    out.m_72.w = _2440;
    float _2452 = _2056 * _2424;
    float _2454 = _2198 * _2424;
    if (_2388)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7332 = as_type<float>(_2446);
        out.gl_Position.z = _7332;
    }
    out.m_74.x = _2448;
    out.m_74.y = _2450;
    if (_2388)
    {
        out.m_49.x = 0.0;
    }
    if (_2388)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2456 = -_2452;
    float _2458 = fma(_2456, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1990);
    float _2460 = _2204 * _2424;
    float _2462 = -_2454;
    float _2464 = fma(_2462, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1928);
    float _2466 = -_2452;
    float _2468 = fma(_2466, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2056);
    float _2470 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2472 = _2458 + _2470;
    float _2474 = -_2460;
    float _2476 = fma(_2474, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1944);
    float _2478 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2480 = _2464 + _2478;
    float _2482 = -_2454;
    float _2484 = fma(_2482, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2198);
    float _2486 = _2472 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2488 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2490 = _2476 + _2488;
    float _2492 = _2468 * _2468;
    float _2494 = -_2460;
    float _2496 = fma(_2494, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2204);
    float _2498 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2486);
    float _2500 = fma(_2484, _2484, _2492);
    float _2502 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2498);
    float _2504 = fma(_2496, _2496, _2500);
    bool _2506 = _2502 >= 0.0;
    float _2508 = sqrt(_2504);
    float _2510 = _2464;
    if (_2506)
    {
        _2426 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2512 = _2426;
    int _2514 = as_type<int>(_2512);
    if (_2506)
    {
        out.m_49.x = 0.0;
    }
    if (_2506)
    {
        float _2516 = _2512 * 5.0;
        _2514 = as_type<int>(_2516);
    }
    int _2518 = _2514;
    float _2520 = _2424 * _2508;
    float _2522 = _2520;
    if (_2506)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7469 = as_type<float>(_2518);
        out.gl_Position.z = _7469;
    }
    if (_2506)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2524 = _489 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2526 = _529 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2528 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _209);
    float _2530 = _2520 * _2524;
    float _2532 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _205);
    float _2534 = _2520 * _2526;
    float _2536 = _2520 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2538 = _2536 * 0.5;
    float _2540 = _2528 * _2530;
    float _2542 = _2532 * _2534;
    float _2544 = _2540 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2546 = _2540 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2548 = _2540 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2550 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2544);
    float _2552 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2546);
    float _2554 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2548);
    float _2556 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2550);
    float _2558 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2552);
    float _2560 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2554);
    float _2562 = _2556 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2564 = _2558 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2566 = _2560 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2568 = _1944 + _2562;
    float _2570 = _1928 + _2564;
    float _2572 = _2458 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2574 = _1990 + _2566;
    float _2576 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2578 = _2568 + _2576;
    float _2580 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2582 = _2570 + _2580;
    float _2584 = fma(_2464, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2572);
    float _2586 = _2578 * _2578;
    float _2588 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2584);
    float _2590 = fma(_2582, _2582, _2586);
    float _2592 = sqrt(_2590);
    bool _2594 = _2592 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2596 = _2584;
    float _2598 = _2538;
    float _2600 = _2566;
    if (!_2594)
    {
        _2596 = _2570;
    }
    float _2602 = _2596;
    float _2604 = _2602;
    if (!_2594)
    {
        _2598 = _2568;
    }
    float _2606 = _2598;
    float _2608 = _2606;
    if (!_2594)
    {
        _2600 = _2574;
    }
    float _2610 = _2600;
    bool _2612 = !_2594;
    float _2614 = _2610;
    if (!_2612)
    {
        float _2616 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2620 = _2592 + _2618;
        float _2622 = rsqrt(_2590);
        float _2624 = _2620 * _2616;
        float _2626 = _2574 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2628 = _2624 * 0.15915493667125701904296875;
        float _2630 = _2628 * 6.283185482025146484375;
        float _2632 = cos(_2630);
        float _2634 = _2628 * 6.283185482025146484375;
        float _2636 = sin(_2634);
        float _2638 = _2632 + (-1.0);
        float _2640 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2642 = fma(_2636, _2626, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2644 = fma(_2574, _2632, _2640);
        float _2646 = _2622 * _2642;
        float _2648 = fma(_2582, _2646, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2650 = fma(_2578, _2646, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2614 = _2644;
        _2604 = _2648;
        _2608 = _2650;
    }
    float _2652 = _2614;
    float _2654 = _2604;
    float _2656 = _2608;
    float _2658 = -_1990;
    float _2660 = _2658 + _2652;
    float _2662 = -_1928;
    float _2664 = _2662 + _2654;
    float _2666 = _2588 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2668 = _2458 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2670 = _2660 * _2660;
    float _2672 = -_1944;
    float _2674 = _2672 + _2656;
    float _2676 = 1.0 / _2666;
    float _2678 = fma(_2464, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2668);
    float _2680 = fma(_2664, _2664, _2670);
    float _2682 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2678);
    float _2684 = fma(_2674, _2674, _2680);
    bool _2686 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2688 = isnan(0.5);
    bool _2690 = _2686 || _2688;
    bool _2692 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2694 = _2690 || _2692;
    float _2696 = _2682 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2698 = sqrt(_2684);
    bool _2700 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2702 = isnan(0.5);
    bool _2704 = _2700 || _2702;
    bool _2706 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2708 = _2704 || _2706;
    float _2710 = _2696 + _2666;
    float _2712 = _2710 * _2676;
    float _2714 = _2712 * 0.5;
    float _2716 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2718 = fma(_2714, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2716);
    float _2720 = 1.0 / _2718;
    bool _2722 = _2698 > 0.0;
    float _2724 = _2666;
    float _2726 = _2714;
    float _2728 = _2698;
    float _2730 = _2718;
    if (!_2722)
    {
        _2724 = _2654;
    }
    float _2732 = _2724;
    float _2734 = _2732;
    float _2736 = _2732;
    if (!_2722)
    {
        _2726 = _2652;
    }
    float _2738 = _2726;
    float _2740 = _2738;
    if (!_2722)
    {
        _2728 = _2656;
    }
    float _2742 = _2728;
    bool _2744 = !_2722;
    float _2746 = _2742;
    if (!_2744)
    {
        float _2748 = _225 * _225;
        float _2750 = rsqrt(_2684);
        float _2752 = fma(_221, _221, _2748);
        float _2754 = fma(_227, _227, _2752);
        float _2756 = sqrt(_2754);
        float _2758 = _2664 * _2750;
        float _2760 = _2660 * _2750;
        float _2762 = _2674 * _2750;
        bool _2764 = _2756 > 0.0;
        float _2766 = _2756;
        float _2768 = _2750;
        _2730 = _2754;
        if (!_2764)
        {
            _2734 = _2654;
        }
        float _2770 = _2734;
        _2736 = _2770;
        if (!_2764)
        {
            _2766 = _2652;
        }
        float _2772 = _2766;
        _2740 = _2772;
        if (!_2764)
        {
            _2768 = _2656;
        }
        float _2774 = _2768;
        bool _2776 = !_2764;
        _2746 = _2774;
        if (!_2776)
        {
            float _2778 = rsqrt(_2754);
            float _2780 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2782 = _225 * _2778;
            float _2784 = _221 * _2778;
            float _2786 = _227 * _2778;
            float _2788 = _2760 * _2782;
            float _2790 = fma(_2758, _2784, _2788);
            float _2792 = _2780 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2794 = fma(_2762, _2786, _2790);
            float _2796 = _2794 * _2792;
            float _2798 = fma(_221, _2796, _2654);
            float _2800 = fma(_225, _2796, _2652);
            float _2802 = fma(_227, _2796, _2656);
            _2746 = _2802;
            _2736 = _2798;
            _2740 = _2800;
        }
    }
    float _2804 = _2746;
    float _2806 = _2736;
    float _2808 = _2740;
    float _2810 = _2730;
    float _2812 = -_2460;
    float _2814 = fma(_2812, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2804);
    float _2816 = -_2454;
    float _2818 = fma(_2816, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2806);
    float _2820 = -_2452;
    float _2822 = fma(_2820, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2808);
    float _2824 = _2810;
    float _2826 = _2822;
    float _2828 = _2818;
    float _2830 = _2814;
    if (_2708)
    {
        _2824 = 1.0;
    }
    float _2832 = _2824;
    float _2834 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2836 = _2720 * _2834;
    float _2838 = _2832;
    if (!_2694)
    {
        float _2840 = _2472 * _2472;
        float _2842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2844 = -_1990;
        float _2846 = _2844 + _2808;
        float _2848 = -_1928;
        float _2850 = _2848 + _2806;
        float _2852 = fma(_2480, _2480, _2840);
        float _2854 = -_1944;
        float _2856 = _2854 + _2804;
        float _2858 = fma(_2490, _2490, _2852);
        float _2860 = 1.0 / _2520;
        float _2862 = sqrt(_2858);
        float _2864 = precise::min(_2862, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2866 = _2864 * _2842;
        float _2868 = _2866 * _2860;
        float _2870 = fma(_2846, _2868, _2458);
        float _2872 = fma(_2850, _2868, _2464);
        float _2874 = fma(_2856, _2868, _2476);
        _2826 = _2870;
        _2828 = _2872;
        _2830 = _2874;
        _2522 = _2860;
    }
    float _2876 = _2826;
    float _2878 = _2828;
    float _2880 = _2830;
    float _2882 = _2522;
    float _2884 = _2882;
    if (!_2708)
    {
        float _2886 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2888 = _2886 * 0.15915493667125701904296875;
        float _2890 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2892 = _2888 * 6.283185482025146484375;
        float _2894 = cos(_2892);
        float _2896 = _2890 * 0.15915493667125701904296875;
        float _2898 = _2888 * 6.283185482025146484375;
        float _2900 = sin(_2898);
        float _2902 = 1.0 / _2894;
        float _2904 = _2896 * 6.283185482025146484375;
        float _2906 = cos(_2904);
        float _2908 = _2900 * _2902;
        float _2910 = _2896 * 6.283185482025146484375;
        float _2912 = sin(_2910);
        float _2914 = _2906 * _2908;
        float _2916 = 1.0 / _2914;
        float _2918 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2920 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2918;
        float _2922 = 1.0 / _2920;
        float _2924 = _2912 * _2916;
        float _2926 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2928 = fma(_2836, _2924, _2926);
        float _2930 = _2928 * _2922;
        float _2932 = precise::clamp(_2930, 0.0, 1.0);
        _2838 = _2932;
    }
    float _2934 = _2838;
    float _2936 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2938 = _2876 + _2936;
    float _2940 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2942 = _2878 + _2940;
    float _2944 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2946 = _2880 + _2944;
    float _2948 = _2938 * _2938;
    float _2950 = fma(_2942, _2942, _2948);
    float _2952 = fma(_2946, _2946, _2950);
    float _2954 = rsqrt(_2952);
    float _2956 = sqrt(_2952);
    float _2958 = _2954 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2960 = _2942 * _2958;
    float _2962 = _2946 * _2958;
    float _2964 = _2960 * _2960;
    float _2966 = _2962 * _2962;
    float _2968 = _2964 + _2966;
    float _2970 = sqrt(_2968);
    bool _2972 = _2970 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2974 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2976 = _2970 + _2974;
    float _2978 = _2946;
    float _2980 = _2968;
    float _2982 = _2976;
    float _2984 = _2938;
    if (_2972)
    {
        float _2986 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2978 = _2986;
    }
    float _2988 = _2978;
    if (_2972)
    {
        float _2990 = rsqrt(_2968);
        _2980 = _2990;
    }
    float _2992 = _2980;
    if (_2972)
    {
        float _2994 = _2976 * _2988;
        _2982 = _2994;
    }
    float _2996 = _2982;
    if (_2972)
    {
        float _2998 = _2996 * 0.15915493667125701904296875;
        _2884 = _2998;
    }
    float _3000 = _2884;
    float _3002 = _2954;
    float _3004 = _3000;
    if (_2972)
    {
        float _3006 = _3000 * 6.283185482025146484375;
        float _3008 = sin(_3006);
        _3002 = _3008;
    }
    float _3010 = _3002;
    float _3012 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3014 = precise::max(0.0, _3012);
    float _3016 = _2948;
    float _3018 = _3014;
    if (_2972)
    {
        float _3020 = _3000 * 6.283185482025146484375;
        float _3022 = cos(_3020);
        _3016 = _3022;
    }
    float _3024 = _3016;
    float _3026 = -_2958;
    float _3028 = -_3014;
    float _3030 = fma(_2938, _3026, _3028);
    if (!_2972)
    {
        _2984 = _2962;
    }
    float _3032 = _2984;
    float _3034 = fma(_2464, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3036 = _3032;
    if (_2972)
    {
        float _3038 = _3030 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3018 = _3038;
    }
    float _3040 = _3018;
    float _3042 = _3040;
    if (!_2972)
    {
        _3004 = _2964;
    }
    float _3044 = _3004;
    float _3046 = _3010;
    float _3048 = _3044;
    if (_2972)
    {
        float _3050 = fma(_3010, _3040, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3046 = _3050;
    }
    float _3052 = _3046;
    float _3054 = _3052;
    if (!_2972)
    {
        _3042 = _3030;
    }
    float _3056 = _3042;
    float _3058 = _3056;
    if (_2972)
    {
        float _3060 = _3024 + (-1.0);
        _2510 = _3060;
    }
    float _3062 = _2510;
    float _3064 = _3062;
    if (_2972)
    {
        float _3066 = _2992 * _3052;
        _231 = _3066;
    }
    float _3068 = _231;
    if (!_2972)
    {
        _3054 = _2960;
    }
    float _3070 = _3054;
    float _3072 = _3070;
    if (_2972)
    {
        float _3074 = _3062 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1962 = _3074;
    }
    float _3076 = _1962;
    if (_2972)
    {
        float _3078 = _2960 * _3068;
        _3072 = _3078;
    }
    float _3080 = _3072;
    if (_2972)
    {
        float _3082 = _2962 * _3068;
        _3036 = _3082;
    }
    float _3084 = _3036;
    if (!_2972)
    {
        _3064 = _2966;
    }
    float _3086 = _3064;
    float _3088 = _3086;
    if (_2972)
    {
        float _3090 = fma(_3030, _3024, _3076);
        _3058 = _3090;
    }
    float _3092 = _3058;
    if (_2972)
    {
        float _3094 = _3080 * _3080;
        _3048 = _3094;
    }
    float _3096 = _3048;
    if (_2972)
    {
        float _3098 = _3084 * _3084;
        _3088 = _3098;
    }
    float _3100 = _3088;
    float _3102 = floor(_3034);
    float _3104 = fma(_3092, _3092, _3096);
    float _3106 = _2876 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3108 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3110 = fma(_2956, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3108);
    float _3112 = precise::clamp(_3110, 0.0, 1.0);
    float _3114 = _3104 + _3100;
    float _3116 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3106);
    float _3118 = -_3112;
    float _3120 = _3118 + 1.0;
    float _3122 = rsqrt(_3114);
    float _3124 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3116);
    float _3126 = _3124 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3128 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3130 = abs(_3120);
    float _3132 = log2(_3130);
    float _3134 = _3126 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3136 = fma(_2476, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3138 = _2876 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3140 = _2876 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3142 = -_3134;
    float _3144 = fma(_3142, _3128, 1.0);
    float _3146 = _2876 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3148 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3138);
    float _3150 = _3122 * _3080;
    float _3152 = _3122 * _3092;
    float _3154 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3146);
    float _3156 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3148);
    float _3158 = _3122 * _3084;
    float _3160 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3140);
    float _3162 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3154);
    float _3164 = _3156 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3166 = _3150 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3168 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3160);
    float _3170 = _3162 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3172 = floor(_3136);
    float _3174 = -_3166;
    float _3176 = fma(_3152, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3174);
    float _3178 = _3168 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3180 = _3170 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3182 = -_3102;
    float _3184 = _3034 + _3182;
    float _3186 = -_3158;
    float _3188 = fma(_3186, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3176);
    float _3190 = _3170 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3192 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3180);
    float _3194 = log2(_3144);
    float _3196 = fma(_3188, -0.5, 0.5);
    float _3198 = fma(_3188, 0.5, 0.5);
    float _3200 = fma(_3126, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3192);
    float _3202 = _3170 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3204 = _3132 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3206 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3190);
    float _3208 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3200);
    float _3210 = sqrt(_3196);
    float _3212 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3202);
    float _3214 = -_3172;
    float _3216 = _3136 + _3214;
    float _3218 = _3152 + 1.0;
    float _3220 = fma(_3198, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3222 = fma(_3126, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3212);
    float _3224 = _3194 * 0.693147182464599609375;
    float _3226 = 1.0 / _3208;
    float _3228 = fma(_3198, _3220, -0.212114393711090087890625);
    float _3230 = fma(_3126, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3206);
    float _3232 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3222);
    float _3234 = _3224 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3236 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3230);
    float _3238 = exp2(_3204);
    float _3240 = _3210 * 0.636619746685028076171875;
    float _3242 = _3236 * _3226;
    float _3244 = fma(_3198, _3228, 1.570728778839111328125);
    float _3246 = _3232 * _3226;
    float _3248 = fma(_3242, 0.5, 0.5);
    float2 _8657 = float2(_3184, _3216);
    float _3250 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8657, float2(0.0), isnan(_8657)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8657, float2(0.0), isnan(_8657)), level(0.0)).x;
    float _3252 = fma(_3246, -0.5, 0.5);
    float _3254 = -_3244;
    float _3256 = fma(_3240, _3254, 1.0);
    float _3258 = -_3152;
    float _3260 = fma(_3238, _3218, _3258);
    float3 _8681 = float3(_3248, _3252, _3234);
    float _3262 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8681, float3(0.0), isnan(_8681)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8681, float3(0.0), isnan(_8681)), level(0.0)).x;
    float _3264 = fma(_3260, 0.5, 0.5);
    float3 _8694 = float3(_3248, _3252, _3234);
    float4 _3267 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8694, float3(0.0), isnan(_8694)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8694, float3(0.0), isnan(_8694)), level(0.0)).xyzw;
    float _3269 = _3267.x;
    float _3271 = _3267.y;
    float _3273 = _3267.z;
    float _3275 = _3267.w;
    float2 _8710 = float2(_3256, _3264);
    float3 _3279 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8710, float2(0.0), isnan(_8710)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8710, float2(0.0), isnan(_8710)), level(0.0)).xyz;
    float _3281 = _3279.x;
    float _3283 = _3279.y;
    float _3285 = _3279.z;
    float _3287 = abs(_2836);
    float _3289 = log2(_3287);
    float _3291 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3293 = _3132 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3295 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3297 = fma(_3291, _3291, 1.0);
    out.m_76.x = _2878;
    out.m_76.y = _2876;
    out.m_76.z = _2880;
    bool _3299 = _2956 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3301 = isnan(_2956);
    bool _3303 = _3299 || _3301;
    bool _3305 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3307 = _3303 || _3305;
    float _3309 = exp2(_3293);
    float _3311 = _3289 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3313 = rsqrt(_3297);
    float _3315 = -_3309;
    float _3317 = _3315 + 1.0;
    float _3319 = exp2(_3311);
    float _3321 = fma(_3319, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3323 = precise::clamp(_3321, 0.0, 1.0);
    float _3325 = fma(_3323, -2.0, 3.0);
    float _3327 = _3323 * _3323;
    float _3329 = _3327 * _3325;
    float _3331 = _3170 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3333 = _3291 * _3313;
    float _3335 = -_3329;
    float _3337 = _3335 + 1.0;
    out.m_78.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_78.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_78.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    float _3339 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3331);
    float _3341 = fma(_3337, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3329);
    float _3343 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _3345 = _3333 * _3343;
    float _3347 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _3349 = _3333 * _3347;
    float _3351 = fma(_3126, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3339);
    float _3353 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _3355 = _3333 * _3353;
    float _3357 = fma(_3313, (*spvDescriptorSet0.vp_c8)._m0[25].y, _3345);
    float _3359 = fma(_3313, (*spvDescriptorSet0.vp_c8)._m0[24].y, _3349);
    float _3361 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3351);
    float _3363 = _3291 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3365 = in.m_80.x;
    bool _3367 = _2836 <= 8000.0;
    bool _3369 = isnan(_2836);
    bool _3371 = _3367 || _3369;
    bool _3373 = isnan(8000.0);
    bool _3375 = _3371 || _3373;
    float _3377 = float(_3375);
    float _3379 = _3291 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3381 = _3317 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3383 = _3291 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3385 = _3377 * _3341;
    float _3387 = fma(_3295, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3363);
    out.gl_Position.x = _3236;
    out.gl_Position.y = _3232;
    out.gl_Position.z = _3361;
    out.gl_Position.w = _3208;
    float _3389 = fma(_3295, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3379);
    float _3391 = _3385 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3393 = _3361 + _3208;
    float _3395 = fma(_3295, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3383);
    float _3397 = fma(_3313, (*spvDescriptorSet0.vp_c8)._m0[26].y, _3355);
    float _3399 = _3393 * 0.5;
    float _3401 = _3393;
    float _3403 = _3389;
    float _3405 = _3208;
    float _3407 = _3359;
    if (!_3307)
    {
        _3401 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3409 = _3401;
    out.m_82.x = _3359;
    out.m_82.y = _3357;
    out.m_82.z = _3397;
    float _3411 = -_3381;
    float _3413 = _3411 + 1.0;
    float _3415 = _3389 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _3417 = _3395 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_84.z = _3399;
    out.m_84.w = _3208;
    float _3419 = _3409;
    float _3421 = _3409;
    if (!_3307)
    {
        _3403 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3423 = _3403;
    float _3425 = _3423;
    float _3427 = _3423;
    if (!_3307)
    {
        _3405 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3429 = _3405;
    float _3431 = _3429;
    float _3433 = _3429;
    if (!_3307)
    {
        _3407 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3435 = _3407;
    float _3437 = -_3250;
    float _3439 = _3437 + 1.0;
    float _3441 = _3439 * _3391;
    float _3443 = precise::clamp(_3441, 0.0, 1.0);
    float _3445 = _3381 * _3262;
    float _3447 = -_3443;
    float _3449 = fma(_3447, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3451 = _3275 * _3445;
    float _3453 = _3449 * _3365;
    float _3455 = _3285 * _3445;
    float _3457 = fma(_3281, _3451, _3269);
    float _3459 = fma(_3283, _3451, _3271);
    float _3461 = _3275 * _3413;
    float _3463 = fma(_3275, _3455, _3273);
    float _3465 = _3387 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _3467 = _3453 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3469 = _2934 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3471 = _3453;
    float _3473 = _3467;
    float _3475 = _3435;
    float _3477 = _3435;
    if (!_3307)
    {
        _3471 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3479 = _3471;
    out.m_86.x = _3457;
    out.m_86.y = _3459;
    out.m_86.z = _3463;
    out.m_86.w = _3461;
    out.m_88.x = _3465;
    out.m_88.y = _3415;
    out.m_88.z = _3417;
    out.m_90.x = _3467;
    float _3481 = _3479;
    float _3483 = _3479;
    if (!_3307)
    {
        _3473 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3485 = _3473;
    bool _3487 = !_3307;
    float _3489 = _3485;
    float _3491 = _3485;
    if (!_3487)
    {
        bool _3493 = _2956 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3495 = isnan(_2956);
        bool _3497 = _3493 || _3495;
        bool _3499 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3501 = _3497 || _3499;
        if (!_3501)
        {
            float _3503 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3505 = _2956 + _3503;
            float _3507 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3509 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3507;
            float _3511 = 1.0 / _3509;
            float _3513 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3515 = _3513 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3517 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3519 = _3517 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3521 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3523 = _3521 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3525 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3527 = _3525 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3529 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3531 = _3529 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3533 = _3505 * _3511;
            float _3535 = precise::clamp(_3533, 0.0, 1.0);
            float _3537 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3539 = _3537 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3541 = fma(_3535, _3515, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3543 = fma(_3535, _3539, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3545 = fma(_3535, _3519, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3547 = fma(_3535, _3523, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3549 = fma(_3535, _3527, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3551 = fma(_3535, _3531, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3477 = _3541;
            _3433 = _3549;
            _3427 = _3543;
            _3421 = _3547;
            _3483 = _3545;
            _3491 = _3551;
            _3553 = true;
        }
        else
        {
            bool _3555 = _2956 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3557 = isnan(_2956);
            bool _3559 = _3555 || _3557;
            bool _3561 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3563 = _3559 || _3561;
            if (!_3563)
            {
                _3425 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3565 = _3425;
            _3427 = _3565;
            if (!_3563)
            {
                _3475 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3567 = _3475;
            _3477 = _3567;
            if (!_3563)
            {
                _3481 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3569 = _3481;
            _3483 = _3569;
            if (!_3563)
            {
                _3419 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3571 = _3419;
            _3421 = _3571;
            if (!_3563)
            {
                _3431 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3573 = _3431;
            _3433 = _3573;
            if (!_3563)
            {
                _3489 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3575 = _3489;
            bool _3577 = !_3563;
            _3491 = _3575;
            if (!_3577)
            {
                bool _3579 = _2956 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3581 = isnan(_2956);
                bool _3583 = _3579 || _3581;
                bool _3585 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3587 = _3583 || _3585;
                if (!_3587)
                {
                    float _3589 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3591 = _2956 + _3589;
                    float _3593 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3595 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3593;
                    float _3597 = 1.0 / _3595;
                    float _3599 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3601 = _3599 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3603 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3605 = _3603 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3607 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3609 = _3607 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3611 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3613 = _3611 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3615 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3617 = _3615 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3619 = _3591 * _3597;
                    float _3621 = precise::clamp(_3619, 0.0, 1.0);
                    float _3623 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3625 = _3623 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3627 = fma(_3621, _3601, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3629 = fma(_3621, _3625, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3631 = fma(_3621, _3605, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3633 = fma(_3621, _3609, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3635 = fma(_3621, _3613, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3637 = fma(_3621, _3617, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3477 = _3627;
                    _3433 = _3635;
                    _3427 = _3629;
                    _3421 = _3633;
                    _3483 = _3631;
                    _3491 = _3637;
                    _3553 = true;
                }
                else
                {
                    _3477 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3433 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3427 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3421 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3483 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3491 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3553 = false;
    float _3639 = _3477;
    float _3641 = _3433;
    float _3643 = _3427;
    float _3645 = _3421;
    float _3647 = _3483;
    float _3649 = _3491;
    float _3651 = fma(_3415, -0.5, 0.5);
    float _3653 = precise::clamp(_3651, 0.0, 1.0);
    float _3655 = -_3639;
    float _3657 = _3655 + _3641;
    float _3659 = _3469 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3661 = -_3643;
    float _3663 = _3661 + _3645;
    out.m_92.x = 0.0;
    float _3665 = fma(_3653, _3657, _3639);
    float _3667 = fma(_3653, _3663, _3643);
    out.m_49.x = _3659;
    float _3669 = -_3647;
    float _3671 = _3669 + _3649;
    float _3673 = _3665 * 0.586610972881317138671875;
    bool _3675 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3677 = fma(_3653, _3671, _3647);
    float _3679 = fma(_3667, 0.298911988735198974609375, _3673);
    bool _3681 = _2934 > 0.0;
    bool _3683 = isnan(_2934);
    bool _3685 = _3681 || _3683;
    bool _3687 = isnan(0.0);
    bool _3689 = _3685 || _3687;
    float _3691 = fma(_3677, 0.114477999508380889892578125, _3679);
    float _3693 = -_3691;
    float _3695 = _3667 + _3693;
    float _3697 = -_3691;
    float _3699 = _3665 + _3697;
    float _3701 = -_3691;
    float _3703 = _3677 + _3701;
    float _3705 = fma(_3695, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3691);
    float _3707 = fma(_3699, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3691);
    float _3709 = fma(_3703, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3691);
    bool _3711 = !_3675;
    if (!_3711)
    {
        float _3713 = -_2876;
        float _3715 = _3713 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3717 = -_2878;
        float _3719 = _3717 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3721 = -_2880;
        float _3723 = _3721 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3725 = _3715 * _3715;
        float _3727 = fma(_3719, _3719, _3725);
        float _3729 = fma(_3723, _3723, _3727);
        float _3731 = sqrt(_3729);
        float _3733 = rsqrt(_3729);
        float _3735 = -_3731;
        float _3737 = _3735 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3739 = _3737 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3741 = precise::clamp(_3739, 0.0, 1.0);
        float _3743 = _3719 * _3733;
        float _3745 = _3715 * _3733;
        float _3747 = abs(_3741);
        float _3749 = log2(_3747);
        float _3751 = _3723 * _3733;
        float _3753 = _3743 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3755 = _3415 * _3745;
        float _3757 = -_3745;
        float _3759 = -_3753;
        float _3761 = fma(_3757, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3759);
        float _3763 = fma(_3465, _3743, _3755);
        float _3765 = -_3751;
        float _3767 = fma(_3765, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3761);
        float _3769 = fma(_3417, _3751, _3763);
        float _3771 = precise::clamp(_3769, 0.0, 1.0);
        float _3773 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3775 = _3767 + _3773;
        float _3777 = _3749 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3779 = _3775 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3781 = precise::clamp(_3779, 0.0, 1.0);
        float _3783 = exp2(_3777);
        float _3785 = _3783 * _3781;
        float _3787 = _3771 * _3785;
        float _3789 = _3787 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3791 = _3787 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3793 = _3787 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _3789;
        out.m_92.y = _3791;
        out.m_92.z = _3793;
    }
    out.m_94.x = _3705;
    out.m_94.y = _3707;
    out.m_94.z = _3709;
    if (_3689)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3795 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3795;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3553 = false;
    bool _1011 = false;
    bool _841 = false;
    bool _621 = false;
    bool _445 = false;
    bool _251 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_46.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_49.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3852 = as_type<float>(_129);
        out.gl_Position.z = _3852;
    }
    if (!_117)
    {
        return out;
    }
    float _133 = in.m_51.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_143)
    {
        float _149 = float(_113);
        _123 = _149;
    }
    float _151 = _123;
    bool _153 = _147 >= _151;
    bool _155 = !_143;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_49.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _131 = as_type<int>(_163);
    }
    int _165 = _131;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3921 = as_type<float>(_165);
        out.gl_Position.z = _3921;
    }
    if (_157)
    {
        return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = in.m_56.x;
    float _171 = in.m_56.y;
    float _173 = in.m_56.z;
    float _175 = in.m_58.x;
    float _177 = in.m_58.y;
    float _179 = in.m_58.z;
    float _181 = in.m_60.x;
    float _183 = in.m_60.y;
    float _185 = in.m_60.z;
    float _187 = in.m_62.x;
    float _189 = in.m_62.y;
    float _191 = in.m_62.z;
    int _193 = as_type<int>(_167) & 1;
    bool _195 = _193 != 0;
    int _197 = as_type<int>(_167) & 2;
    bool _199 = _197 != 0;
    bool _201 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _203 = !_195;
    float _205 = _203 ? (-0.5) : 0.5;
    bool _207 = !_199;
    float _209 = _207 ? (-0.5) : 0.5;
    float _211 = _171 * _177;
    float _213 = _171 * _183;
    float _215 = fma(_169, _175, _211);
    float _217 = _171 * _189;
    float _219 = fma(_169, _181, _213);
    float _221 = fma(_173, _179, _215);
    float _223 = fma(_169, _187, _217);
    float _225 = fma(_173, _185, _219);
    float _227 = fma(_173, _191, _223);
    bool _229 = !_201;
    float _231 = _221;
    float _249;
    if (!_229)
    {
        float _233 = in.m_64.x;
        float _235 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _237 = _233 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _241 = _239 * _235;
        float _243 = floor(_241);
        float _245 = -_243;
        float _247 = _241 + _245;
        _249 = _247;
        _251 = true;
    }
    else
    {
        float _253 = float(_113);
        float _255 = 1.0 / _253;
        float _257 = _147 * _255;
        _249 = _257;
    }
    _251 = false;
    float _259 = _249;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _263 = _259 + _261;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = _259 + _265;
    bool _269 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _271 = isnan(_259);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _285 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _259 + _293;
    float _297 = 1.0 / _283;
    bool _299 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _301 = 1.0 / _291;
    float _303 = 1.0 / _287;
    float _305 = _263 * _297;
    bool _307 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _309 = isnan(_259);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -_279;
    float _321 = _319 + 1.0;
    float _323 = _317 * _321;
    float _325 = _267 * _301;
    bool _327 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _329 = isnan(_259);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -_317;
    float _341 = _339 + 1.0;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _347 = _295 * _303;
    bool _349 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _351 = isnan(_259);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _361;
    float _365 = _337 * _341;
    float _367 = -_337;
    float _369 = _367 + 1.0;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _371;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _379 = fma(_363, _305, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _381 = _359 * _369;
    float _383 = fma(_373, _305, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _385 = fma(_345, _347, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _387 = fma(_377, _347, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _389 = -_359;
    float _391 = _389 + 1.0;
    float _393 = _379 * _381;
    float _395 = _383 * _381;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _401;
    float _405 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[143].x, _393);
    float _407 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[143].y, _395);
    float _409 = fma(_399, _325, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _411 = fma(_403, _325, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _413 = fma(_385, _365, _405);
    float _415 = fma(_387, _365, _407);
    float _417 = fma(_409, _323, _413);
    float _419 = fma(_411, _323, _415);
    float _421 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[146].x, _417);
    float _423 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[146].y, _419);
    bool _425 = !_299;
    float _443;
    if (!_425)
    {
        float _427 = in.m_64.x;
        float _429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _431 = _427 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _433 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[11].x, _147);
        float _435 = _433 * _429;
        float _437 = floor(_435);
        float _439 = -_437;
        float _441 = _435 + _439;
        _443 = _441;
        _445 = true;
    }
    else
    {
        float _447 = float(_113);
        float _449 = 1.0 / _447;
        float _451 = _147 * _449;
        _443 = _451;
    }
    _445 = false;
    float _453 = _443;
    float _455 = in.m_66.x;
    float _457 = in.m_66.y;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _461 = _453 + _459;
    bool _463 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _465 = isnan(_453);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _475;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _483 = 1.0 / _477;
    bool _485 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _487 = 1.0 / _481;
    float _489 = _423 * _457;
    bool _491 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _493 = isnan(_453);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = _461 * _483;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _507 = _453 + _505;
    bool _509 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _511 = isnan(_453);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = -_473;
    float _523 = _521 + 1.0;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _525;
    float _529 = _421 * _455;
    float _531 = _519 * _523;
    float _533 = -_519;
    float _535 = _533 + 1.0;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _537;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _541;
    float _545 = fma(_527, _503, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _547 = _501 * _535;
    float _549 = fma(_539, _503, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _551 = fma(_543, _503, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _553 = _507 * _487;
    float _555 = _545 * _547;
    float _557 = _549 * _547;
    float _559 = _551 * _547;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _565 = -_501;
    float _567 = _565 + 1.0;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _577 = fma(_563, _553, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _579 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[107].x, _559);
    float _581 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[107].y, _557);
    float _583 = fma(_571, _553, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _585 = fma(_575, _553, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _587 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[107].z, _555);
    float _589 = fma(_577, _531, _581);
    float _591 = fma(_583, _531, _579);
    float _593 = fma(_585, _531, _587);
    float _595 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[109].y, _589);
    float _597 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[109].x, _591);
    float _599 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[109].z, _593);
    bool _601 = !_485;
    float _619;
    if (!_601)
    {
        float _603 = in.m_64.x;
        float _605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _607 = _603 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _609 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[11].y, _147);
        float _611 = _609 * _605;
        float _613 = floor(_611);
        float _615 = -_613;
        float _617 = _611 + _615;
        _619 = _617;
        _621 = true;
    }
    else
    {
        float _623 = float(_113);
        float _625 = 1.0 / _623;
        float _627 = _147 * _625;
        _619 = _627;
    }
    _621 = false;
    float _629 = _619;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _633 = _629 + _631;
    float _635 = _597 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _641;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _649 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _651 = isnan(_629);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = 1.0 / _639;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _667 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _669 = isnan(_629);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    float _679 = _595 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _681 = _599 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _683 = _635 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _685 = _679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _687 = 1.0 / _647;
    float _689 = _681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _691 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _693 = _643 * _661;
    bool _695 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _697 = isnan(_629);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = 1.0 / _665;
    float _709 = -_659;
    float _711 = _709 + 1.0;
    float _713 = fma(_693, _633, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _719 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _721 = isnan(_629);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = -_705;
    float _733 = _731 + 1.0;
    float _735 = _705 * _711;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _739 = _737 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _741 = 1.0 / _717;
    float _743 = -_729;
    float _745 = _743 + 1.0;
    float _747 = _677 * _733;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _749;
    float _753 = _739 * _687;
    float _755 = _659 * _745;
    float _757 = _713 * _747;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _761 = _629 + _759;
    float _763 = -_677;
    float _765 = _763 + 1.0;
    bool _767 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _769 = isnan(_629);
    bool _771 = _767 || _769;
    bool _773 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _775 = _771 || _773;
    float _777 = float(_775);
    float _779 = _751 * _707;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _787 = _629 + _785;
    float _789 = fma(_753, _761, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _791 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[115].x, _757);
    float _793 = -_777;
    float _795 = _793 + 1.0;
    float _797 = _783 * _741;
    float _799 = fma(_779, _787, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _803 = _629 + _801;
    float _805 = fma(_789, _735, _791);
    float _807 = _729 * _795;
    float _809 = fma(_797, _803, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _811 = fma(_799, _755, _805);
    float _813 = fma(_809, _807, _811);
    float _815 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[119].x, _813);
    float _817 = _815 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_68.x = _683;
    out.m_68.y = _685;
    out.m_68.z = _689;
    out.m_68.w = _817;
    bool _819 = !_691;
    float _821 = _707;
    float _839;
    if (!_819)
    {
        float _823 = in.m_64.x;
        float _825 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _827 = _823 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _829 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[11].z, _147);
        float _831 = _829 * _825;
        float _833 = floor(_831);
        float _835 = -_833;
        float _837 = _831 + _835;
        _839 = _837;
        _841 = true;
    }
    else
    {
        float _843 = float(_113);
        float _845 = 1.0 / _843;
        float _847 = _147 * _845;
        _839 = _847;
    }
    _841 = false;
    float _849 = _839;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _853 = _849 + _851;
    bool _855 = _849 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _857 = isnan(_849);
    bool _859 = _855 || _857;
    bool _861 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _863 = _859 || _861;
    float _865 = float(_863);
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _869 = _849 + _867;
    bool _871 = _849 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _873 = isnan(_849);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _883;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _891 = _849 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _893 = isnan(_849);
    bool _895 = _891 || _893;
    bool _897 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _899 = _895 || _897;
    float _901 = float(_899);
    float _903 = -_865;
    float _905 = _903 + 1.0;
    float _907 = 1.0 / _889;
    float _909 = _901 * _905;
    float _911 = -_901;
    float _913 = _911 + 1.0;
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _915;
    bool _919 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _921 = 1.0 / _885;
    float _923 = _881 * _913;
    float _925 = -_881;
    float _927 = _925 + 1.0;
    float _929 = _869 * _907;
    float _931 = _853 * _921;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _933;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _937;
    float _941 = fma(_917, _931, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _943 = fma(_935, _931, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _945 = fma(_939, _931, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _947 = _941 * _923;
    float _949 = _943 * _923;
    float _951 = _945 * _923;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _959 = _957 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _963 = _961 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _965 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[123].x, _947);
    float _967 = fma(_955, _929, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _969 = fma(_959, _929, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _971 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[123].y, _949);
    float _973 = fma(_963, _929, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _975 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[123].z, _951);
    float _977 = fma(_967, _909, _965);
    float _979 = fma(_969, _909, _971);
    float _981 = fma(_973, _909, _975);
    float _983 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[125].x, _977);
    float _985 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[125].y, _979);
    float _987 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[125].z, _981);
    bool _989 = !_919;
    float _991 = _979;
    float _1009;
    if (!_989)
    {
        float _993 = in.m_64.x;
        float _995 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _997 = _993 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _999 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[11].w, _147);
        float _1001 = _999 * _995;
        float _1003 = floor(_1001);
        float _1005 = -_1003;
        float _1007 = _1001 + _1005;
        _1009 = _1007;
        _1011 = true;
    }
    else
    {
        float _1013 = float(_113);
        float _1015 = 1.0 / _1013;
        float _1017 = _147 * _1015;
        _1009 = _1017;
    }
    _1011 = false;
    float _1019 = _1009;
    float _1021 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1023 = int(_1021);
    float _1025 = float(_113);
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1029 = _1027 != 0;
    float _1031 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1033 = int(_1031);
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1037 = _1035 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1039 = float(_1023);
    float _1041 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1043 = int(_1041);
    if (_1029)
    {
        float _1045 = in.m_64.x;
        _991 = _1045;
    }
    float _1047 = _991;
    float _1049 = _1047;
    if (_1029)
    {
        _821 = 1.0;
    }
    float _1051 = _821;
    float _1053 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1055 = _1051;
    if (!_1029)
    {
        _1055 = 7.345489978790283203125;
    }
    float _1057 = _1055;
    float _1059 = _1057;
    if (!_1029)
    {
        float _1061 = in.m_64.y;
        _1049 = _1061;
    }
    float _1063 = _1049;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1067 = float(uint(_1033));
    float _1069 = 1.0 / _1039;
    int _1071 = ~_1033;
    int _1073 = _1071 + 1;
    bool _1075 = _1033 == 0;
    float _1077 = 1.0 / _1067;
    float _1079 = float(uint(_1043));
    int _1081 = ~_1043;
    int _1083 = _1081 + 1;
    float _1085 = _147 * _1069;
    float _1087 = 1.0 / _1079;
    int _1089 = as_type<int>(_1077) + (-2);
    float _1091 = trunc(_1085);
    int _1093 = int(_1091);
    int _1095 = ~_1033;
    int _1097 = _1095 + 1;
    float _1099 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1101 = int(_1099);
    float _1103 = float(uint(_1093));
    float _1105 = 1.0 / _1037;
    float _1107 = as_type<float>(_1089) * _1103;
    float _1109 = float(_1101);
    float _1111 = trunc(_1107);
    float _1113 = precise::max(_1111, 0.0);
    uint _1116 = uint(_1113);
    float _1118 = 1.0 / _1109;
    int _1120 = _1097 * int(_1116);
    int _1122 = _1120 + _1093;
    float _1124 = float(uint(_1122));
    float _1126 = in.m_64.x;
    float _1128 = in.m_64.y;
    float _1130 = in.m_64.z;
    float _1132 = in.m_64.w;
    float _1134 = _147 * _1118;
    float _1136 = as_type<float>(_1089) * _1124;
    float _1138 = trunc(_1134);
    int _1140 = int(_1138);
    float _1142 = trunc(_1136);
    float _1144 = precise::max(_1142, 0.0);
    uint _1146 = uint(_1144);
    float _1148 = float(uint(_1140));
    float _1150 = _1057 * _1126;
    float _1152 = _1130;
    if (_1029)
    {
        _1059 = 1.0;
    }
    float _1154 = _1059;
    float _1156 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1158 = _1154;
    if (!_1029)
    {
        _1158 = 1.2345600128173828125;
    }
    float _1160 = _1158;
    float _1162 = floor(_1150);
    int _1164 = int(_1116) + int(_1146);
    float _1166 = float(_1033);
    float _1168 = float(_1093);
    int _1170 = _1073 * _1164;
    int _1172 = _1170 + _1093;
    float _1174 = _1160 * _1063;
    bool _1176 = _1168 >= _1166;
    bool _1178 = isnan(_1168);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan(_1166);
    bool _1184 = _1180 || _1182;
    float _1186 = float(_1184);
    bool _1188 = uint(_1172) >= uint(_1033);
    float _1190 = floor(_1174);
    float _1192 = -_1162;
    float _1194 = _1150 + _1192;
    bool _1196 = !_1188;
    int _1198 = _1196 ? 0 : (-1);
    float _1200 = _1194 * _1166;
    int _1202 = ~_1164;
    int _1204 = _1202 + _1198;
    int _1206 = _1204 + 1;
    float _1208 = trunc(_1186);
    int _1210 = int(_1208);
    int _1212 = as_type<int>(_1087) + (-2);
    int _1214 = _1033 * _1206;
    int _1216 = _1214 + _1093;
    int _1218 = _1033 + (-1);
    float _1220 = as_type<float>(_1212) * _1148;
    float _1222 = 1.0 / _1025;
    bool _1224 = !_1075;
    int _1226 = _1224 ? _1216 : (-1);
    int _1228 = ~_1210;
    int _1230 = _1228 + 1;
    int _1232 = _1230 + 1;
    float _1234 = trunc(_1220);
    float _1236 = precise::max(_1234, 0.0);
    uint _1238 = uint(_1236);
    int _1240 = _1226 * _1232;
    float _1242 = -_1190;
    float _1244 = _1174 + _1242;
    int _1246 = ~_1043;
    int _1248 = _1246 + 1;
    float _1250 = _147 * _1222;
    int _1252 = _1210 * _1218;
    int _1254 = _1252 + _1240;
    float _1256 = trunc(_1200);
    int _1258 = int(_1256);
    float _1260 = _1250 * _1166;
    int _1262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1264 = _1262 != 0;
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1268 = _1266 != 0;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1272 = _1270 != 0;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1276 = _1274 != 0;
    int _1278 = _1248 * int(_1238);
    int _1280 = _1278 + _1140;
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1284 = _1282 != 0;
    float _1286 = trunc(_1260);
    int _1288 = int(_1286);
    bool _1290 = !_1268;
    int _1292 = _1290 ? 0 : 1;
    bool _1294 = !_1264;
    int _1296 = _1294 ? 0 : 1;
    float _1298 = float(uint(_1280));
    int _1300 = abs(_1292);
    int _1302 = abs(_1296);
    float _1304 = as_type<float>(_1212) * _1298;
    bool _1306 = !_1276;
    int _1308 = _1306 ? 0 : 1;
    int _1310 = _1254 * _1300;
    bool _1312 = !_1272;
    int _1314 = _1312 ? 0 : 1;
    bool _1316 = !_1284;
    int _1318 = _1316 ? 0 : 1;
    int _1320 = _1288 * _1302;
    int _1322 = _1320 + _1310;
    int _1324 = abs(_1308);
    int _1326 = abs(_1314);
    float _1328 = trunc(_1304);
    float _1330 = precise::max(_1328, 0.0);
    uint _1332 = uint(_1330);
    float _1334 = float(_1043);
    int _1336 = _1258 * _1324;
    int _1338 = _1336 + _1093;
    int _1340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1342 = _1340 != 0;
    int _1344 = abs(_1318);
    float _1346 = float(_1140);
    int _1348 = _1338 * _1326;
    int _1350 = _1348 + _1322;
    int _1352 = int(_1238) + int(_1332);
    float _1354 = _1244 * _1334;
    bool _1356 = _1346 >= _1334;
    bool _1358 = isnan(_1346);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan(_1334);
    bool _1364 = _1360 || _1362;
    float _1366 = float(_1364);
    int _1368 = _1258 * _1344;
    int _1370 = _1368 + _1350;
    bool _1372 = !_1342;
    int _1374 = _1372 ? 0 : 1;
    int _1376 = _1083 * _1352;
    int _1378 = _1376 + _1140;
    float _1380 = trunc(_1366);
    int _1382 = int(_1380);
    float _1384 = _1250 * _1334;
    float _1386 = float(uint(_1370));
    bool _1388 = uint(_1378) >= uint(_1043);
    int _1390 = _1043 + (-1);
    float _1392 = as_type<float>(_1089) * _1386;
    float _1394 = trunc(_1354);
    int _1396 = int(_1394);
    bool _1398 = !_1388;
    int _1400 = _1398 ? 0 : (-1);
    int _1402 = abs(_1374);
    int _1404 = ~_1352;
    int _1406 = _1404 + _1400;
    int _1408 = _1406 + 1;
    int _1410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1412 = _1410 != 0;
    int _1414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1416 = _1414 != 0;
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1420 = _1418 != 0;
    int _1422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1424 = _1422 != 0;
    float _1426 = trunc(_1392);
    float _1428 = precise::max(_1426, 0.0);
    uint _1430 = uint(_1428);
    int _1432 = ~_1033;
    int _1434 = _1432 + 1;
    int _1436 = _1043 * _1408;
    int _1438 = _1436 + _1140;
    bool _1440 = _1043 == 0;
    int _1442 = ~_1382;
    int _1444 = _1442 + 1;
    int _1446 = _1444 + 1;
    bool _1448 = !_1440;
    int _1450 = _1448 ? _1438 : (-1);
    int _1452 = _1396 * _1402;
    int _1454 = _1452 + _1140;
    float _1456 = trunc(_1384);
    int _1458 = int(_1456);
    bool _1460 = _1033 == 0;
    int _1462 = _1450 * _1446;
    bool _1464 = !_1416;
    int _1466 = _1464 ? 0 : 1;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1470 = _1468 != 0;
    int _1472 = _1434 * int(_1430);
    int _1474 = _1472 + _1370;
    int _1476 = abs(_1466);
    int _1478 = _1382 * _1390;
    int _1480 = _1478 + _1462;
    bool _1482 = !_1412;
    int _1484 = _1482 ? 0 : 1;
    float _1486 = float(uint(_1474));
    int _1488 = _1480 * _1476;
    bool _1490 = !_1420;
    int _1492 = _1490 ? 0 : 1;
    int _1494 = abs(_1484);
    float _1496 = as_type<float>(_1089) * _1486;
    int _1498 = abs(_1492);
    bool _1500 = !_1424;
    int _1502 = _1500 ? 0 : 1;
    int _1504 = _1458 * _1494;
    int _1506 = _1504 + _1488;
    float _1508 = float(uint(_1338));
    float _1510 = trunc(_1496);
    float _1512 = precise::max(_1510, 0.0);
    uint _1514 = uint(_1512);
    int _1516 = abs(_1502);
    float _1518 = as_type<float>(_1089) * _1508;
    int _1520 = ~_1033;
    int _1522 = _1520 + 1;
    int _1524 = _1454 * _1498;
    int _1526 = _1524 + _1506;
    float _1528 = float(uint(_1454));
    float _1530 = trunc(_1518);
    float _1532 = precise::max(_1530, 0.0);
    uint _1534 = uint(_1532);
    int _1536 = 0;
    if (_1470)
    {
        _1536 = 0;
    }
    int _1538 = _1536;
    int _1540 = _1396 * _1516;
    int _1542 = _1540 + _1526;
    float _1544 = as_type<float>(_1212) * _1528;
    int _1546 = _1538;
    if (!_1470)
    {
        _1546 = 1;
    }
    int _1548 = _1546;
    float _1550 = float(uint(_1542));
    float _1552 = trunc(_1544);
    float _1554 = precise::max(_1552, 0.0);
    uint _1556 = uint(_1554);
    int _1558 = int(_1430) + int(_1514);
    int _1560 = ~_1043;
    int _1562 = _1560 + 1;
    float _1564 = as_type<float>(_1212) * _1550;
    int _1566 = ~_1043;
    int _1568 = _1566 + 1;
    int _1570 = _1522 * _1558;
    int _1572 = _1570 + _1370;
    bool _1574 = _1126 > 0.5;
    int _1576 = _1522 * int(_1534);
    int _1578 = _1576 + _1338;
    int _1580 = ~_1043;
    int _1582 = _1580 + 1;
    float _1584 = trunc(_1564);
    float _1586 = precise::max(_1584, 0.0);
    uint _1588 = uint(_1586);
    bool _1590 = uint(_1572) >= uint(_1033);
    float _1592 = float(uint(_1578));
    bool _1594 = !_1590;
    int _1596 = _1594 ? 0 : (-1);
    float _1598 = as_type<float>(_1089) * _1592;
    int _1600 = ~_1558;
    int _1602 = _1600 + _1596;
    int _1604 = _1602 + 1;
    int _1606 = _1562 * int(_1556);
    int _1608 = _1606 + _1454;
    int _1610 = _1033 * _1604;
    int _1612 = _1610 + _1370;
    float _1614 = float(uint(_1608));
    int _1616 = _1582 * int(_1588);
    int _1618 = _1616 + _1542;
    float _1620 = trunc(_1598);
    float _1622 = precise::max(_1620, 0.0);
    uint _1624 = uint(_1622);
    bool _1626 = !_1460;
    int _1628 = _1626 ? _1612 : (-1);
    float _1630 = as_type<float>(_1212) * _1614;
    float _1632 = float(uint(_1618));
    int _1634 = _1628 & 3;
    bool _1636 = _1634 != 0;
    int _1638 = _1628 & 3;
    bool _1640 = _1638 != 0;
    float _1642 = as_type<float>(_1212) * _1632;
    bool _1644 = uint(_1634) > 1u;
    float _1646 = trunc(_1630);
    float _1648 = precise::max(_1646, 0.0);
    uint _1650 = uint(_1648);
    bool _1652 = _1634 != 3;
    int _1654 = _1640 ? 0 : 1;
    int _1656 = ~_1033;
    int _1658 = _1656 + 1;
    bool _1660 = uint(_1634) >= 2u;
    float _1662 = trunc(_1642);
    float _1664 = precise::max(_1662, 0.0);
    uint _1666 = uint(_1664);
    int _1668 = int(_1534) + int(_1624);
    int _1670 = ~_1654;
    int _1672 = _1670 + 1;
    int _1674 = _1672 + 1;
    int _1676 = _1674;
    if (!_1644)
    {
        int _1678 = ~_1654;
        int _1680 = _1678 + 1;
        _1676 = _1680;
    }
    int _1682 = _1676;
    int _1684 = _1658 * _1668;
    int _1686 = _1684 + _1338;
    int _1688 = _1660 ? 0 : 1;
    int _1690 = ~_1688;
    int _1692 = _1690 + 1;
    int _1694 = _1692 + 1;
    int _1696 = _1694;
    if (_1652)
    {
        int _1698 = ~_1688;
        int _1700 = _1698 + 1;
        _1696 = _1700;
    }
    int _1702 = _1696;
    bool _1704 = _1132 > 0.5;
    bool _1706 = uint(_1686) >= uint(_1033);
    int _1708 = ~_1043;
    int _1710 = _1708 + 1;
    float _1712 = in.m_46.x;
    float _1714 = in.m_46.y;
    float _1716 = in.m_46.z;
    int _1718 = int(_1556) + int(_1650);
    int _1720 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1722 = _1720 != 0;
    int _1724 = int(_1588) + int(_1666);
    int _1726 = _1710 * _1718;
    int _1728 = _1726 + _1454;
    bool _1730 = !_1706;
    int _1732 = _1730 ? 0 : (-1);
    int _1734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1736 = _1734 != 0;
    int _1738 = _1568 * _1724;
    int _1740 = _1738 + _1542;
    float _1742 = -_205;
    int _1744 = _1574 ? as_type<int>(_1742) : as_type<int>(_205);
    bool _1746 = !_1736;
    int _1748 = _1746 ? 0 : 1;
    bool _1750 = uint(_1728) >= uint(_1043);
    bool _1752 = _1128 > 0.5;
    bool _1754 = !_1750;
    int _1756 = _1754 ? 0 : (-1);
    bool _1758 = !_1722;
    float _1760 = _1758 ? _205 : as_type<float>(_1744);
    float _1762 = -_209;
    int _1764 = _1752 ? as_type<int>(_1762) : as_type<int>(_209);
    float _1766 = _177 * _1714;
    bool _1768 = uint(_1740) >= uint(_1043);
    float _1770 = _183 * _1714;
    int _1772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1774 = _1772 != 0;
    float _1776 = fma(_175, _1712, _1766);
    bool _1778 = _1130 > 0.5;
    float _1780 = _189 * _1714;
    bool _1782 = !_1768;
    int _1784 = _1782 ? 0 : (-1);
    float _1786 = fma(_181, _1712, _1770);
    bool _1788 = !_1774;
    float _1790 = _1788 ? _209 : as_type<float>(_1764);
    float _1792 = in.m_58.w;
    float _1794 = -_205;
    int _1796 = _1778 ? as_type<int>(_1794) : as_type<int>(_205);
    float _1798 = fma(_187, _1712, _1780);
    int _1800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1802 = _1800 != 0;
    float _1804 = _1126 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1808 = _1806 != 0;
    float _1810 = in.m_60.w;
    int _1812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1814 = _1812 != 0;
    float _1816 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1818 = _1816 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1820 = 1.0 / _1818;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1824 = ~_1724;
    int _1826 = _1824 + _1784;
    int _1828 = _1826 + 1;
    float _1830 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1832 = ~_1668;
    int _1834 = _1832 + _1732;
    int _1836 = _1834 + 1;
    float _1838 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1838;
    float _1842 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1844 = _1842 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1846 = -_1830;
    float _1848 = fma(_1804, 2.0, _1846);
    float _1850 = fma(_1156, -2.0, _1822);
    float _1852 = fma(_179, _1716, _1776);
    float _1854 = fma(_185, _1716, _1786);
    float _1856 = in.m_62.w;
    float _1858 = _1840 * _1105;
    float _1860 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1862 = _1019 + _1860;
    bool _1864 = _1019 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1866 = isnan(_1019);
    bool _1868 = _1864 || _1866;
    bool _1870 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1872 = _1868 || _1870;
    float _1874 = float(_1872);
    float _1876 = _1844 * _1820;
    bool _1878 = _1019 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1880 = isnan(_1019);
    bool _1882 = _1878 || _1880;
    bool _1884 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1886 = _1882 || _1884;
    float _1888 = float(_1886);
    float _1890 = fma(_1858, _1862, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1892 = _1019 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1894 = isnan(_1019);
    bool _1896 = _1892 || _1894;
    bool _1898 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1900 = _1896 || _1898;
    float _1902 = float(_1900);
    float _1904 = -_1874;
    float _1906 = _1904 + 1.0;
    bool _1908 = !_1814;
    float _1910 = _1908 ? _205 : as_type<float>(_1796);
    float _1912 = -_1888;
    float _1914 = _1912 + 1.0;
    bool _1916 = _1548 != 1;
    float _1918 = _1902 * _1906;
    float _1920 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1922 = _1019 + _1920;
    float _1924 = _1874 * _1914;
    float _1926 = fma(_191, _1716, _1798);
    float _1928 = _1852 + _1792;
    float _1930 = _1890 * _1918;
    float _1932 = -_1902;
    float _1934 = _1932 + 1.0;
    float _1936 = -_147;
    float _1938 = fma(_1936, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1848);
    float _1940 = _1760 + 0.5;
    float _1942 = fma(_1876, _1922, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1944 = _1926 + _1856;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1948 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1850);
    float _1950 = fma(_1934, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1930);
    float _1952 = fma(_1940, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1938);
    float _1954 = _1934;
    float _1956 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    float _1958 = _1946;
    float _1960 = _1910;
    float _1962 = _1928;
    if (!_1916)
    {
        _1954 = _1128;
    }
    float _1964 = _1954;
    float _1966 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1968 = _1964;
    if (!_1916)
    {
        _1956 = _1128;
    }
    float _1970 = _1956;
    float _1972 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1946);
    float _1974 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1966);
    float _1976 = _1970;
    if (_1916)
    {
        _1968 = _1126;
    }
    float _1978 = _1968;
    float _1980 = fma(_1942, _1924, _1950);
    if (_1916)
    {
        _1976 = _1126;
    }
    float _1982 = _1976;
    int _1984 = _1043 * _1828;
    int _1986 = _1984 + _1542;
    if (!_1916)
    {
        _1958 = _1130;
    }
    float _1988 = _1958;
    float _1990 = _1854 + _1810;
    float _1992 = _1988;
    if (_1916)
    {
        _1992 = _1128;
    }
    float _1994 = _1992;
    float _1996 = _1790 + (-0.5);
    if (_1916)
    {
        _1152 = _1128;
    }
    float _1998 = _1152;
    float _2000 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2002 = _1628 >> 31;
    float _2004 = -_1996;
    float _2006 = -_1948;
    float _2008 = fma(_2004, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2006);
    bool _2010 = !_1440;
    int _2012 = _2010 ? _1986 : (-1);
    float _2014 = fma(_1982, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2000);
    int _2016 = _2002 & 3;
    float _2018 = _1978 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2020 = _2012 >> 31;
    float _2022 = fma(_1888, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1980);
    int _2024 = _1628 + _2016;
    float _2026 = -_1053;
    float _2028 = fma(_2018, 2.0, _2026);
    int _2030 = _2020 & 3;
    float _2032 = _1994 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2034 = _2024 >> 2;
    int _2036 = _1033 * _1836;
    int _2038 = _2036 + _1338;
    int _2040 = _2012 + _2030;
    float _2042 = fma(_2032, -2.0, _1065);
    int _2044 = _2034 << 4;
    int _2046 = _2044 + 368;
    float _2048 = -_147;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2028);
    int _2052 = _2040 >> 2;
    float _2054 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2056 = _1990 + _2054;
    uint _2058 = uint(int(uint(_2046) >> uint(2)));
    uint _2060 = uint(int(uint(int(_2058)) >> uint(2)));
    int _2062 = int(_2058) & 3;
    float _2064 = (*spvDescriptorSet0.vp_c9)._m0[int(_2060)][_2062];
    int _2066 = int(_2058) + 1;
    uint _2068 = uint(int(uint(_2066) >> uint(2)));
    int _2070 = _2066 & 3;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[int(_2068)][_2070];
    bool _2074 = !_1636;
    int _2076 = _2074 ? 0 : 1;
    float _2078 = _1910 + 0.5;
    int _2080 = _2052 << 4;
    int _2082 = _2080 + 512;
    float _2084 = _2056 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2086 = _2012 & 3;
    bool _2088 = _2086 != 0;
    float _2090 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2014);
    int _2092 = _2012 & 3;
    bool _2094 = _2092 != 0;
    uint _2096 = uint(int(uint(_2082) >> uint(2)));
    uint _2098 = uint(int(uint(int(_2096)) >> uint(2)));
    int _2100 = int(_2096) & 3;
    float _2102 = (*spvDescriptorSet0.vp_c9)._m0[int(_2098)][_2100];
    int _2104 = int(_2096) + 1;
    uint _2106 = uint(int(uint(_2104) >> uint(2)));
    int _2108 = _2104 & 3;
    float _2110 = (*spvDescriptorSet0.vp_c9)._m0[int(_2106)][_2108];
    int _2112 = _2088 ? 0 : 1;
    float _2114 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1974);
    bool _2116 = uint(_2092) > 1u;
    int _2118 = ~_2112;
    int _2120 = _2118 + 1;
    int _2122 = _2120 + 1;
    int _2124 = _2046 + 8;
    uint _2126 = uint(int(uint(_2124) >> uint(2)));
    uint _2128 = uint(int(uint(int(_2126)) >> uint(2)));
    int _2130 = int(_2126) & 3;
    float _2132 = (*spvDescriptorSet0.vp_c9)._m0[int(_2128)][_2130];
    int _2134 = int(_2126) + 1;
    uint _2136 = uint(int(uint(_2134) >> uint(2)));
    int _2138 = _2134 & 3;
    float _2140 = (*spvDescriptorSet0.vp_c9)._m0[int(_2136)][_2138];
    int _2142 = abs(_1682);
    int _2144 = abs(_2076);
    float _2146 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2148 = ~_2142;
    int _2150 = _2148 + 1;
    int _2152 = _2150 + 1;
    int _2154 = ~_1718;
    int _2156 = _2154 + _1756;
    int _2158 = _2156 + 1;
    float _2160 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2146);
    int _2162 = _2122;
    if (!_2116)
    {
        int _2164 = ~_2112;
        int _2166 = _2164 + 1;
        _2162 = _2166;
    }
    int _2168 = _2162;
    float _2170 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1972);
    bool _2172 = !_2094;
    int _2174 = _2172 ? 0 : 1;
    int _2176 = _2082 + 8;
    uint _2178 = uint(int(uint(_2176) >> uint(2)));
    uint _2180 = uint(int(uint(int(_2178)) >> uint(2)));
    int _2182 = int(_2178) & 3;
    float _2184 = (*spvDescriptorSet0.vp_c9)._m0[int(_2180)][_2182];
    int _2186 = int(_2178) + 1;
    uint _2188 = uint(int(uint(_2186) >> uint(2)));
    int _2190 = _2186 & 3;
    float _2192 = (*spvDescriptorSet0.vp_c9)._m0[int(_2188)][_2190];
    bool _2194 = _1634 != 3;
    float _2196 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2198 = _1928 + _2196;
    bool _2200 = uint(_2092) >= 2u;
    float _2202 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2204 = _1944 + _2202;
    bool _2206 = !_2194;
    int _2208 = _2206 ? 0 : (-1);
    float _2210 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2084);
    bool _2212 = _2092 != 3;
    float _2214 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2042);
    int _2216 = abs(_2168);
    float _2218 = fma(_2204, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2210);
    int _2220 = _2200 ? 0 : 1;
    float _2222 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2160);
    int _2224 = ~_2216;
    int _2226 = _2224 + 1;
    int _2228 = _2226 + 1;
    float _2230 = fma(_2078, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2050);
    int _2232 = abs(_2174);
    float _2234 = -_2222;
    float _2236 = _2234 + 1.0;
    int _2238 = ~_2220;
    int _2240 = _2238 + 1;
    int _2242 = _2240 + 1;
    float _2244 = -_2170;
    float _2246 = _2244 + 1.0;
    int _2248 = abs(_2208);
    int _2250 = _2152 * as_type<int>(_2072);
    int _2252 = _2242;
    if (_2212)
    {
        int _2254 = ~_2220;
        int _2256 = _2254 + 1;
        _2252 = _2256;
    }
    int _2258 = _2252;
    int _2260 = ~_2144;
    int _2262 = _2260 + 1;
    int _2264 = _2262 + 1;
    bool _2266 = _2092 != 3;
    int _2268 = _2228 * as_type<int>(_2110);
    int _2270 = _2264 * as_type<int>(_2064);
    int _2272 = _2270 + _2250;
    int _2274 = abs(_1702);
    float _2276 = _987 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2278 = ~_2232;
    int _2280 = _2278 + 1;
    int _2282 = _2280 + 1;
    int _2284 = ~_2274;
    int _2286 = _2284 + 1;
    int _2288 = _2286 + 1;
    float _2290 = _2276 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2292 = _2282 * as_type<int>(_2102);
    int _2294 = _2292 + _2268;
    int _2296 = abs(_2258);
    int _2298 = _2288 * as_type<int>(_2132);
    int _2300 = _2298 + _2272;
    bool _2302 = !_2266;
    int _2304 = _2302 ? 0 : (-1);
    int _2306 = ~_2248;
    int _2308 = _2306 + 1;
    int _2310 = _2308 + 1;
    int _2312 = ~_2296;
    int _2314 = _2312 + 1;
    int _2316 = _2314 + 1;
    int _2318 = abs(_2304);
    int _2320 = _2310 * as_type<int>(_2140);
    int _2322 = _2320 + _2300;
    bool _2324 = !_1808;
    int _2326 = _2324 ? 0 : 1;
    int _2328 = _2316 * as_type<int>(_2184);
    int _2330 = _2328 + _2294;
    float _2332 = -_209;
    int _2334 = _1704 ? as_type<int>(_2332) : as_type<int>(_209);
    int _2336 = abs(_2326);
    int _2338 = ~_2318;
    int _2340 = _2338 + 1;
    int _2342 = _2340 + 1;
    bool _2344 = !_1802;
    float _2346 = _2344 ? _209 : as_type<float>(_2334);
    int _2348 = _1043 * _2158;
    int _2350 = _2348 + _1454;
    int _2352 = ~_2336;
    int _2354 = _2352 + 1;
    int _2356 = _2354 + 1;
    int _2358 = _2342 * as_type<int>(_2192);
    int _2360 = _2358 + _2330;
    int _2362 = abs(_1748);
    bool _2364 = !_1440;
    int _2366 = _2364 ? _2350 : (-1);
    int _2368 = _2360 * _2356;
    int _2370 = ~_2362;
    int _2372 = _2370 + 1;
    int _2374 = _2372 + 1;
    bool _2376 = !_1460;
    int _2378 = _2376 ? _2038 : (-1);
    int _2380 = _2366 * _2336;
    int _2382 = _2380 + _2368;
    float _2384 = _2056 * _2056;
    int _2386 = _2322 * _2374;
    bool _2388 = _2218 >= 0.0;
    float _2390 = _2346 + (-0.5);
    float _2392 = fma(_2198, _2198, _2384);
    int _2394 = _2378 * _2362;
    int _2396 = _2394 + _2386;
    float _2398 = _983 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2400 = -_2390;
    float _2402 = -_2214;
    float _2404 = fma(_2400, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2402);
    float _2406 = fma(_2204, _2204, _2392);
    float _2408 = -_2090;
    float _2410 = _2408 + 1.0;
    float _2412 = -_2114;
    float _2414 = _2412 + 1.0;
    float _2416 = _985 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2418 = fma(_2346, _2236, _2404);
    float _2420 = -_2410;
    float _2422 = fma(_1910, _2420, _2230);
    float _2424 = rsqrt(_2406);
    float _2426 = _2422;
    if (_2388)
    {
        _1960 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2428 = _1960;
    float _2430 = fma(_1790, _2414, _2008);
    float _2432 = -_2246;
    float _2434 = fma(_1760, _2432, _1952);
    float _2436 = _2398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2438 = _2416 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2440 = _2022 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2442 = as_type<int>(_2428);
    if (_2388)
    {
        float _2444 = _2428 * 5.0;
        _2442 = as_type<int>(_2444);
    }
    int _2446 = _2442;
    float _2448 = float(_2396);
    out.m_70.x = _2434;
    out.m_70.y = _2430;
    out.m_70.z = _2422;
    out.m_70.w = _2418;
    float _2450 = float(_2382);
    out.m_72.x = _2436;
    out.m_72.y = _2438;
    out.m_72.z = _2290;
    out.m_72.w = _2440;
    float _2452 = _2056 * _2424;
    float _2454 = _2198 * _2424;
    if (_2388)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7332 = as_type<float>(_2446);
        out.gl_Position.z = _7332;
    }
    out.m_74.x = _2448;
    out.m_74.y = _2450;
    if (_2388)
    {
        out.m_49.x = 0.0;
    }
    if (_2388)
    {
        return out;
    }
    float _2456 = -_2452;
    float _2458 = fma(_2456, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1990);
    float _2460 = _2204 * _2424;
    float _2462 = -_2454;
    float _2464 = fma(_2462, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1928);
    float _2466 = -_2452;
    float _2468 = fma(_2466, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2056);
    float _2470 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2472 = _2458 + _2470;
    float _2474 = -_2460;
    float _2476 = fma(_2474, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1944);
    float _2478 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2480 = _2464 + _2478;
    float _2482 = -_2454;
    float _2484 = fma(_2482, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2198);
    float _2486 = _2472 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2488 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2490 = _2476 + _2488;
    float _2492 = _2468 * _2468;
    float _2494 = -_2460;
    float _2496 = fma(_2494, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2204);
    float _2498 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2486);
    float _2500 = fma(_2484, _2484, _2492);
    float _2502 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2498);
    float _2504 = fma(_2496, _2496, _2500);
    bool _2506 = _2502 >= 0.0;
    float _2508 = sqrt(_2504);
    float _2510 = _2464;
    if (_2506)
    {
        _2426 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2512 = _2426;
    int _2514 = as_type<int>(_2512);
    if (_2506)
    {
        out.m_49.x = 0.0;
    }
    if (_2506)
    {
        float _2516 = _2512 * 5.0;
        _2514 = as_type<int>(_2516);
    }
    int _2518 = _2514;
    float _2520 = _2424 * _2508;
    float _2522 = _2520;
    if (_2506)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7469 = as_type<float>(_2518);
        out.gl_Position.z = _7469;
    }
    if (_2506)
    {
        return out;
    }
    float _2524 = _489 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2526 = _529 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2528 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _209);
    float _2530 = _2520 * _2524;
    float _2532 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _205);
    float _2534 = _2520 * _2526;
    float _2536 = _2520 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2538 = _2536 * 0.5;
    float _2540 = _2528 * _2530;
    float _2542 = _2532 * _2534;
    float _2544 = _2540 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2546 = _2540 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2548 = _2540 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2550 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2544);
    float _2552 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2546);
    float _2554 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2548);
    float _2556 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2550);
    float _2558 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2552);
    float _2560 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2554);
    float _2562 = _2556 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2564 = _2558 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2566 = _2560 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2568 = _1944 + _2562;
    float _2570 = _1928 + _2564;
    float _2572 = _2458 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2574 = _1990 + _2566;
    float _2576 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2578 = _2568 + _2576;
    float _2580 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2582 = _2570 + _2580;
    float _2584 = fma(_2464, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2572);
    float _2586 = _2578 * _2578;
    float _2588 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2584);
    float _2590 = fma(_2582, _2582, _2586);
    float _2592 = sqrt(_2590);
    bool _2594 = _2592 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2596 = _2584;
    float _2598 = _2538;
    float _2600 = _2566;
    if (!_2594)
    {
        _2596 = _2570;
    }
    float _2602 = _2596;
    float _2604 = _2602;
    if (!_2594)
    {
        _2598 = _2568;
    }
    float _2606 = _2598;
    float _2608 = _2606;
    if (!_2594)
    {
        _2600 = _2574;
    }
    float _2610 = _2600;
    bool _2612 = !_2594;
    float _2614 = _2610;
    if (!_2612)
    {
        float _2616 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2620 = _2592 + _2618;
        float _2622 = rsqrt(_2590);
        float _2624 = _2620 * _2616;
        float _2626 = _2574 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2628 = _2624 * 0.15915493667125701904296875;
        float _2630 = _2628 * 6.283185482025146484375;
        float _2632 = cos(_2630);
        float _2634 = _2628 * 6.283185482025146484375;
        float _2636 = sin(_2634);
        float _2638 = _2632 + (-1.0);
        float _2640 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2642 = fma(_2636, _2626, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2644 = fma(_2574, _2632, _2640);
        float _2646 = _2622 * _2642;
        float _2648 = fma(_2582, _2646, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2650 = fma(_2578, _2646, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2614 = _2644;
        _2604 = _2648;
        _2608 = _2650;
    }
    float _2652 = _2614;
    float _2654 = _2604;
    float _2656 = _2608;
    float _2658 = -_1990;
    float _2660 = _2658 + _2652;
    float _2662 = -_1928;
    float _2664 = _2662 + _2654;
    float _2666 = _2588 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2668 = _2458 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2670 = _2660 * _2660;
    float _2672 = -_1944;
    float _2674 = _2672 + _2656;
    float _2676 = 1.0 / _2666;
    float _2678 = fma(_2464, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2668);
    float _2680 = fma(_2664, _2664, _2670);
    float _2682 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2678);
    float _2684 = fma(_2674, _2674, _2680);
    bool _2686 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2688 = isnan(0.5);
    bool _2690 = _2686 || _2688;
    bool _2692 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2694 = _2690 || _2692;
    float _2696 = _2682 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2698 = sqrt(_2684);
    bool _2700 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2702 = isnan(0.5);
    bool _2704 = _2700 || _2702;
    bool _2706 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2708 = _2704 || _2706;
    float _2710 = _2696 + _2666;
    float _2712 = _2710 * _2676;
    float _2714 = _2712 * 0.5;
    float _2716 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2718 = fma(_2714, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2716);
    float _2720 = 1.0 / _2718;
    bool _2722 = _2698 > 0.0;
    float _2724 = _2666;
    float _2726 = _2714;
    float _2728 = _2698;
    float _2730 = _2718;
    if (!_2722)
    {
        _2724 = _2654;
    }
    float _2732 = _2724;
    float _2734 = _2732;
    float _2736 = _2732;
    if (!_2722)
    {
        _2726 = _2652;
    }
    float _2738 = _2726;
    float _2740 = _2738;
    if (!_2722)
    {
        _2728 = _2656;
    }
    float _2742 = _2728;
    bool _2744 = !_2722;
    float _2746 = _2742;
    if (!_2744)
    {
        float _2748 = _225 * _225;
        float _2750 = rsqrt(_2684);
        float _2752 = fma(_221, _221, _2748);
        float _2754 = fma(_227, _227, _2752);
        float _2756 = sqrt(_2754);
        float _2758 = _2664 * _2750;
        float _2760 = _2660 * _2750;
        float _2762 = _2674 * _2750;
        bool _2764 = _2756 > 0.0;
        float _2766 = _2756;
        float _2768 = _2750;
        _2730 = _2754;
        if (!_2764)
        {
            _2734 = _2654;
        }
        float _2770 = _2734;
        _2736 = _2770;
        if (!_2764)
        {
            _2766 = _2652;
        }
        float _2772 = _2766;
        _2740 = _2772;
        if (!_2764)
        {
            _2768 = _2656;
        }
        float _2774 = _2768;
        bool _2776 = !_2764;
        _2746 = _2774;
        if (!_2776)
        {
            float _2778 = rsqrt(_2754);
            float _2780 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2782 = _225 * _2778;
            float _2784 = _221 * _2778;
            float _2786 = _227 * _2778;
            float _2788 = _2760 * _2782;
            float _2790 = fma(_2758, _2784, _2788);
            float _2792 = _2780 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2794 = fma(_2762, _2786, _2790);
            float _2796 = _2794 * _2792;
            float _2798 = fma(_221, _2796, _2654);
            float _2800 = fma(_225, _2796, _2652);
            float _2802 = fma(_227, _2796, _2656);
            _2746 = _2802;
            _2736 = _2798;
            _2740 = _2800;
        }
    }
    float _2804 = _2746;
    float _2806 = _2736;
    float _2808 = _2740;
    float _2810 = _2730;
    float _2812 = -_2460;
    float _2814 = fma(_2812, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2804);
    float _2816 = -_2454;
    float _2818 = fma(_2816, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2806);
    float _2820 = -_2452;
    float _2822 = fma(_2820, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2808);
    float _2824 = _2810;
    float _2826 = _2822;
    float _2828 = _2818;
    float _2830 = _2814;
    if (_2708)
    {
        _2824 = 1.0;
    }
    float _2832 = _2824;
    float _2834 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2836 = _2720 * _2834;
    float _2838 = _2832;
    if (!_2694)
    {
        float _2840 = _2472 * _2472;
        float _2842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2844 = -_1990;
        float _2846 = _2844 + _2808;
        float _2848 = -_1928;
        float _2850 = _2848 + _2806;
        float _2852 = fma(_2480, _2480, _2840);
        float _2854 = -_1944;
        float _2856 = _2854 + _2804;
        float _2858 = fma(_2490, _2490, _2852);
        float _2860 = 1.0 / _2520;
        float _2862 = sqrt(_2858);
        float _2864 = precise::min(_2862, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2866 = _2864 * _2842;
        float _2868 = _2866 * _2860;
        float _2870 = fma(_2846, _2868, _2458);
        float _2872 = fma(_2850, _2868, _2464);
        float _2874 = fma(_2856, _2868, _2476);
        _2826 = _2870;
        _2828 = _2872;
        _2830 = _2874;
        _2522 = _2860;
    }
    float _2876 = _2826;
    float _2878 = _2828;
    float _2880 = _2830;
    float _2882 = _2522;
    float _2884 = _2882;
    if (!_2708)
    {
        float _2886 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2888 = _2886 * 0.15915493667125701904296875;
        float _2890 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2892 = _2888 * 6.283185482025146484375;
        float _2894 = cos(_2892);
        float _2896 = _2890 * 0.15915493667125701904296875;
        float _2898 = _2888 * 6.283185482025146484375;
        float _2900 = sin(_2898);
        float _2902 = 1.0 / _2894;
        float _2904 = _2896 * 6.283185482025146484375;
        float _2906 = cos(_2904);
        float _2908 = _2900 * _2902;
        float _2910 = _2896 * 6.283185482025146484375;
        float _2912 = sin(_2910);
        float _2914 = _2906 * _2908;
        float _2916 = 1.0 / _2914;
        float _2918 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2920 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2918;
        float _2922 = 1.0 / _2920;
        float _2924 = _2912 * _2916;
        float _2926 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2928 = fma(_2836, _2924, _2926);
        float _2930 = _2928 * _2922;
        float _2932 = precise::clamp(_2930, 0.0, 1.0);
        _2838 = _2932;
    }
    float _2934 = _2838;
    float _2936 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2938 = _2876 + _2936;
    float _2940 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2942 = _2878 + _2940;
    float _2944 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2946 = _2880 + _2944;
    float _2948 = _2938 * _2938;
    float _2950 = fma(_2942, _2942, _2948);
    float _2952 = fma(_2946, _2946, _2950);
    float _2954 = rsqrt(_2952);
    float _2956 = sqrt(_2952);
    float _2958 = _2954 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2960 = _2942 * _2958;
    float _2962 = _2946 * _2958;
    float _2964 = _2960 * _2960;
    float _2966 = _2962 * _2962;
    float _2968 = _2964 + _2966;
    float _2970 = sqrt(_2968);
    bool _2972 = _2970 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2974 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2976 = _2970 + _2974;
    float _2978 = _2946;
    float _2980 = _2968;
    float _2982 = _2976;
    float _2984 = _2938;
    if (_2972)
    {
        float _2986 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2978 = _2986;
    }
    float _2988 = _2978;
    if (_2972)
    {
        float _2990 = rsqrt(_2968);
        _2980 = _2990;
    }
    float _2992 = _2980;
    if (_2972)
    {
        float _2994 = _2976 * _2988;
        _2982 = _2994;
    }
    float _2996 = _2982;
    if (_2972)
    {
        float _2998 = _2996 * 0.15915493667125701904296875;
        _2884 = _2998;
    }
    float _3000 = _2884;
    float _3002 = _2954;
    float _3004 = _3000;
    if (_2972)
    {
        float _3006 = _3000 * 6.283185482025146484375;
        float _3008 = sin(_3006);
        _3002 = _3008;
    }
    float _3010 = _3002;
    float _3012 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3014 = precise::max(0.0, _3012);
    float _3016 = _2948;
    float _3018 = _3014;
    if (_2972)
    {
        float _3020 = _3000 * 6.283185482025146484375;
        float _3022 = cos(_3020);
        _3016 = _3022;
    }
    float _3024 = _3016;
    float _3026 = -_2958;
    float _3028 = -_3014;
    float _3030 = fma(_2938, _3026, _3028);
    if (!_2972)
    {
        _2984 = _2962;
    }
    float _3032 = _2984;
    float _3034 = fma(_2464, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3036 = _3032;
    if (_2972)
    {
        float _3038 = _3030 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3018 = _3038;
    }
    float _3040 = _3018;
    float _3042 = _3040;
    if (!_2972)
    {
        _3004 = _2964;
    }
    float _3044 = _3004;
    float _3046 = _3010;
    float _3048 = _3044;
    if (_2972)
    {
        float _3050 = fma(_3010, _3040, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3046 = _3050;
    }
    float _3052 = _3046;
    float _3054 = _3052;
    if (!_2972)
    {
        _3042 = _3030;
    }
    float _3056 = _3042;
    float _3058 = _3056;
    if (_2972)
    {
        float _3060 = _3024 + (-1.0);
        _2510 = _3060;
    }
    float _3062 = _2510;
    float _3064 = _3062;
    if (_2972)
    {
        float _3066 = _2992 * _3052;
        _231 = _3066;
    }
    float _3068 = _231;
    if (!_2972)
    {
        _3054 = _2960;
    }
    float _3070 = _3054;
    float _3072 = _3070;
    if (_2972)
    {
        float _3074 = _3062 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1962 = _3074;
    }
    float _3076 = _1962;
    if (_2972)
    {
        float _3078 = _2960 * _3068;
        _3072 = _3078;
    }
    float _3080 = _3072;
    if (_2972)
    {
        float _3082 = _2962 * _3068;
        _3036 = _3082;
    }
    float _3084 = _3036;
    if (!_2972)
    {
        _3064 = _2966;
    }
    float _3086 = _3064;
    float _3088 = _3086;
    if (_2972)
    {
        float _3090 = fma(_3030, _3024, _3076);
        _3058 = _3090;
    }
    float _3092 = _3058;
    if (_2972)
    {
        float _3094 = _3080 * _3080;
        _3048 = _3094;
    }
    float _3096 = _3048;
    if (_2972)
    {
        float _3098 = _3084 * _3084;
        _3088 = _3098;
    }
    float _3100 = _3088;
    float _3102 = floor(_3034);
    float _3104 = fma(_3092, _3092, _3096);
    float _3106 = _2876 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3108 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3110 = fma(_2956, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3108);
    float _3112 = precise::clamp(_3110, 0.0, 1.0);
    float _3114 = _3104 + _3100;
    float _3116 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3106);
    float _3118 = -_3112;
    float _3120 = _3118 + 1.0;
    float _3122 = rsqrt(_3114);
    float _3124 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3116);
    float _3126 = _3124 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3128 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3130 = abs(_3120);
    float _3132 = log2(_3130);
    float _3134 = _3126 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3136 = fma(_2476, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3138 = _2876 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3140 = _2876 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3142 = -_3134;
    float _3144 = fma(_3142, _3128, 1.0);
    float _3146 = _2876 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3148 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3138);
    float _3150 = _3122 * _3080;
    float _3152 = _3122 * _3092;
    float _3154 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3146);
    float _3156 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3148);
    float _3158 = _3122 * _3084;
    float _3160 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3140);
    float _3162 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3154);
    float _3164 = _3156 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3166 = _3150 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3168 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3160);
    float _3170 = _3162 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3172 = floor(_3136);
    float _3174 = -_3166;
    float _3176 = fma(_3152, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3174);
    float _3178 = _3168 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3180 = _3170 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3182 = -_3102;
    float _3184 = _3034 + _3182;
    float _3186 = -_3158;
    float _3188 = fma(_3186, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3176);
    float _3190 = _3170 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3192 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3180);
    float _3194 = log2(_3144);
    float _3196 = fma(_3188, -0.5, 0.5);
    float _3198 = fma(_3188, 0.5, 0.5);
    float _3200 = fma(_3126, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3192);
    float _3202 = _3170 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3204 = _3132 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3206 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3190);
    float _3208 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3200);
    float _3210 = sqrt(_3196);
    float _3212 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3202);
    float _3214 = -_3172;
    float _3216 = _3136 + _3214;
    float _3218 = _3152 + 1.0;
    float _3220 = fma(_3198, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3222 = fma(_3126, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3212);
    float _3224 = _3194 * 0.693147182464599609375;
    float _3226 = 1.0 / _3208;
    float _3228 = fma(_3198, _3220, -0.212114393711090087890625);
    float _3230 = fma(_3126, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3206);
    float _3232 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3222);
    float _3234 = _3224 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3236 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3230);
    float _3238 = exp2(_3204);
    float _3240 = _3210 * 0.636619746685028076171875;
    float _3242 = _3236 * _3226;
    float _3244 = fma(_3198, _3228, 1.570728778839111328125);
    float _3246 = _3232 * _3226;
    float _3248 = fma(_3242, 0.5, 0.5);
    float2 _8657 = float2(_3184, _3216);
    float _3250 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8657, float2(0.0), isnan(_8657)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8657, float2(0.0), isnan(_8657)), level(0.0)).x;
    float _3252 = fma(_3246, -0.5, 0.5);
    float _3254 = -_3244;
    float _3256 = fma(_3240, _3254, 1.0);
    float _3258 = -_3152;
    float _3260 = fma(_3238, _3218, _3258);
    float3 _8681 = float3(_3248, _3252, _3234);
    float _3262 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8681, float3(0.0), isnan(_8681)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8681, float3(0.0), isnan(_8681)), level(0.0)).x;
    float _3264 = fma(_3260, 0.5, 0.5);
    float3 _8694 = float3(_3248, _3252, _3234);
    float4 _3267 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8694, float3(0.0), isnan(_8694)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8694, float3(0.0), isnan(_8694)), level(0.0)).xyzw;
    float _3269 = _3267.x;
    float _3271 = _3267.y;
    float _3273 = _3267.z;
    float _3275 = _3267.w;
    float2 _8710 = float2(_3256, _3264);
    float3 _3279 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8710, float2(0.0), isnan(_8710)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8710, float2(0.0), isnan(_8710)), level(0.0)).xyz;
    float _3281 = _3279.x;
    float _3283 = _3279.y;
    float _3285 = _3279.z;
    float _3287 = abs(_2836);
    float _3289 = log2(_3287);
    float _3291 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3293 = _3132 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3295 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3297 = fma(_3291, _3291, 1.0);
    out.m_76.x = _2878;
    out.m_76.y = _2876;
    out.m_76.z = _2880;
    bool _3299 = _2956 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3301 = isnan(_2956);
    bool _3303 = _3299 || _3301;
    bool _3305 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3307 = _3303 || _3305;
    float _3309 = exp2(_3293);
    float _3311 = _3289 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3313 = rsqrt(_3297);
    float _3315 = -_3309;
    float _3317 = _3315 + 1.0;
    float _3319 = exp2(_3311);
    float _3321 = fma(_3319, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3323 = precise::clamp(_3321, 0.0, 1.0);
    float _3325 = fma(_3323, -2.0, 3.0);
    float _3327 = _3323 * _3323;
    float _3329 = _3327 * _3325;
    float _3331 = _3170 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3333 = _3291 * _3313;
    float _3335 = -_3329;
    float _3337 = _3335 + 1.0;
    out.m_78.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_78.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_78.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    float _3339 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3331);
    float _3341 = fma(_3337, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3329);
    float _3343 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _3345 = _3333 * _3343;
    float _3347 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _3349 = _3333 * _3347;
    float _3351 = fma(_3126, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3339);
    float _3353 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _3355 = _3333 * _3353;
    float _3357 = fma(_3313, (*spvDescriptorSet0.vp_c8)._m0[25].y, _3345);
    float _3359 = fma(_3313, (*spvDescriptorSet0.vp_c8)._m0[24].y, _3349);
    float _3361 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3351);
    float _3363 = _3291 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3365 = in.m_80.x;
    bool _3367 = _2836 <= 8000.0;
    bool _3369 = isnan(_2836);
    bool _3371 = _3367 || _3369;
    bool _3373 = isnan(8000.0);
    bool _3375 = _3371 || _3373;
    float _3377 = float(_3375);
    float _3379 = _3291 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3381 = _3317 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3383 = _3291 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3385 = _3377 * _3341;
    float _3387 = fma(_3295, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3363);
    out.gl_Position.x = _3236;
    out.gl_Position.y = _3232;
    out.gl_Position.z = _3361;
    out.gl_Position.w = _3208;
    float _3389 = fma(_3295, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3379);
    float _3391 = _3385 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3393 = _3361 + _3208;
    float _3395 = fma(_3295, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3383);
    float _3397 = fma(_3313, (*spvDescriptorSet0.vp_c8)._m0[26].y, _3355);
    float _3399 = _3393 * 0.5;
    float _3401 = _3393;
    float _3403 = _3389;
    float _3405 = _3208;
    float _3407 = _3359;
    if (!_3307)
    {
        _3401 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3409 = _3401;
    out.m_82.x = _3359;
    out.m_82.y = _3357;
    out.m_82.z = _3397;
    float _3411 = -_3381;
    float _3413 = _3411 + 1.0;
    float _3415 = _3389 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _3417 = _3395 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_84.z = _3399;
    out.m_84.w = _3208;
    float _3419 = _3409;
    float _3421 = _3409;
    if (!_3307)
    {
        _3403 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3423 = _3403;
    float _3425 = _3423;
    float _3427 = _3423;
    if (!_3307)
    {
        _3405 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3429 = _3405;
    float _3431 = _3429;
    float _3433 = _3429;
    if (!_3307)
    {
        _3407 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3435 = _3407;
    float _3437 = -_3250;
    float _3439 = _3437 + 1.0;
    float _3441 = _3439 * _3391;
    float _3443 = precise::clamp(_3441, 0.0, 1.0);
    float _3445 = _3381 * _3262;
    float _3447 = -_3443;
    float _3449 = fma(_3447, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3451 = _3275 * _3445;
    float _3453 = _3449 * _3365;
    float _3455 = _3285 * _3445;
    float _3457 = fma(_3281, _3451, _3269);
    float _3459 = fma(_3283, _3451, _3271);
    float _3461 = _3275 * _3413;
    float _3463 = fma(_3275, _3455, _3273);
    float _3465 = _3387 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _3467 = _3453 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3469 = _2934 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3471 = _3453;
    float _3473 = _3467;
    float _3475 = _3435;
    float _3477 = _3435;
    if (!_3307)
    {
        _3471 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3479 = _3471;
    out.m_86.x = _3457;
    out.m_86.y = _3459;
    out.m_86.z = _3463;
    out.m_86.w = _3461;
    out.m_88.x = _3465;
    out.m_88.y = _3415;
    out.m_88.z = _3417;
    out.m_90.x = _3467;
    float _3481 = _3479;
    float _3483 = _3479;
    if (!_3307)
    {
        _3473 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3485 = _3473;
    bool _3487 = !_3307;
    float _3489 = _3485;
    float _3491 = _3485;
    if (!_3487)
    {
        bool _3493 = _2956 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3495 = isnan(_2956);
        bool _3497 = _3493 || _3495;
        bool _3499 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3501 = _3497 || _3499;
        if (!_3501)
        {
            float _3503 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3505 = _2956 + _3503;
            float _3507 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3509 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3507;
            float _3511 = 1.0 / _3509;
            float _3513 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3515 = _3513 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3517 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3519 = _3517 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3521 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3523 = _3521 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3525 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3527 = _3525 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3529 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3531 = _3529 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3533 = _3505 * _3511;
            float _3535 = precise::clamp(_3533, 0.0, 1.0);
            float _3537 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3539 = _3537 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3541 = fma(_3535, _3515, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3543 = fma(_3535, _3539, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3545 = fma(_3535, _3519, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3547 = fma(_3535, _3523, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3549 = fma(_3535, _3527, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3551 = fma(_3535, _3531, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3477 = _3541;
            _3433 = _3549;
            _3427 = _3543;
            _3421 = _3547;
            _3483 = _3545;
            _3491 = _3551;
            _3553 = true;
        }
        else
        {
            bool _3555 = _2956 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3557 = isnan(_2956);
            bool _3559 = _3555 || _3557;
            bool _3561 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3563 = _3559 || _3561;
            if (!_3563)
            {
                _3425 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3565 = _3425;
            _3427 = _3565;
            if (!_3563)
            {
                _3475 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3567 = _3475;
            _3477 = _3567;
            if (!_3563)
            {
                _3481 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3569 = _3481;
            _3483 = _3569;
            if (!_3563)
            {
                _3419 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3571 = _3419;
            _3421 = _3571;
            if (!_3563)
            {
                _3431 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3573 = _3431;
            _3433 = _3573;
            if (!_3563)
            {
                _3489 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3575 = _3489;
            bool _3577 = !_3563;
            _3491 = _3575;
            if (!_3577)
            {
                bool _3579 = _2956 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3581 = isnan(_2956);
                bool _3583 = _3579 || _3581;
                bool _3585 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3587 = _3583 || _3585;
                if (!_3587)
                {
                    float _3589 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3591 = _2956 + _3589;
                    float _3593 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3595 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3593;
                    float _3597 = 1.0 / _3595;
                    float _3599 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3601 = _3599 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3603 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3605 = _3603 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3607 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3609 = _3607 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3611 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3613 = _3611 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3615 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3617 = _3615 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3619 = _3591 * _3597;
                    float _3621 = precise::clamp(_3619, 0.0, 1.0);
                    float _3623 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3625 = _3623 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3627 = fma(_3621, _3601, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3629 = fma(_3621, _3625, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3631 = fma(_3621, _3605, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3633 = fma(_3621, _3609, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3635 = fma(_3621, _3613, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3637 = fma(_3621, _3617, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3477 = _3627;
                    _3433 = _3635;
                    _3427 = _3629;
                    _3421 = _3633;
                    _3483 = _3631;
                    _3491 = _3637;
                    _3553 = true;
                }
                else
                {
                    _3477 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3433 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3427 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3421 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3483 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3491 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3553 = false;
    float _3639 = _3477;
    float _3641 = _3433;
    float _3643 = _3427;
    float _3645 = _3421;
    float _3647 = _3483;
    float _3649 = _3491;
    float _3651 = fma(_3415, -0.5, 0.5);
    float _3653 = precise::clamp(_3651, 0.0, 1.0);
    float _3655 = -_3639;
    float _3657 = _3655 + _3641;
    float _3659 = _3469 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3661 = -_3643;
    float _3663 = _3661 + _3645;
    out.m_92.x = 0.0;
    float _3665 = fma(_3653, _3657, _3639);
    float _3667 = fma(_3653, _3663, _3643);
    out.m_49.x = _3659;
    float _3669 = -_3647;
    float _3671 = _3669 + _3649;
    float _3673 = _3665 * 0.586610972881317138671875;
    bool _3675 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3677 = fma(_3653, _3671, _3647);
    float _3679 = fma(_3667, 0.298911988735198974609375, _3673);
    bool _3681 = _2934 > 0.0;
    bool _3683 = isnan(_2934);
    bool _3685 = _3681 || _3683;
    bool _3687 = isnan(0.0);
    bool _3689 = _3685 || _3687;
    float _3691 = fma(_3677, 0.114477999508380889892578125, _3679);
    float _3693 = -_3691;
    float _3695 = _3667 + _3693;
    float _3697 = -_3691;
    float _3699 = _3665 + _3697;
    float _3701 = -_3691;
    float _3703 = _3677 + _3701;
    float _3705 = fma(_3695, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3691);
    float _3707 = fma(_3699, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3691);
    float _3709 = fma(_3703, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3691);
    bool _3711 = !_3675;
    if (!_3711)
    {
        float _3713 = -_2876;
        float _3715 = _3713 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3717 = -_2878;
        float _3719 = _3717 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3721 = -_2880;
        float _3723 = _3721 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3725 = _3715 * _3715;
        float _3727 = fma(_3719, _3719, _3725);
        float _3729 = fma(_3723, _3723, _3727);
        float _3731 = sqrt(_3729);
        float _3733 = rsqrt(_3729);
        float _3735 = -_3731;
        float _3737 = _3735 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3739 = _3737 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3741 = precise::clamp(_3739, 0.0, 1.0);
        float _3743 = _3719 * _3733;
        float _3745 = _3715 * _3733;
        float _3747 = abs(_3741);
        float _3749 = log2(_3747);
        float _3751 = _3723 * _3733;
        float _3753 = _3743 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3755 = _3415 * _3745;
        float _3757 = -_3745;
        float _3759 = -_3753;
        float _3761 = fma(_3757, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3759);
        float _3763 = fma(_3465, _3743, _3755);
        float _3765 = -_3751;
        float _3767 = fma(_3765, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3761);
        float _3769 = fma(_3417, _3751, _3763);
        float _3771 = precise::clamp(_3769, 0.0, 1.0);
        float _3773 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3775 = _3767 + _3773;
        float _3777 = _3749 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3779 = _3775 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3781 = precise::clamp(_3779, 0.0, 1.0);
        float _3783 = exp2(_3777);
        float _3785 = _3783 * _3781;
        float _3787 = _3771 * _3785;
        float _3789 = _3787 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3791 = _3787 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3793 = _3787 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _3789;
        out.m_92.y = _3791;
        out.m_92.z = _3793;
    }
    out.m_94.x = _3705;
    out.m_94.y = _3707;
    out.m_94.z = _3709;
    if (_3689)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3795 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3795;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3553 = false;
    bool _1011 = false;
    bool _841 = false;
    bool _621 = false;
    bool _445 = false;
    bool _251 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_46.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_49.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3852 = as_type<float>(_129);
        out.gl_Position.z = _3852;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_51.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_143)
    {
        float _149 = float(_113);
        _123 = _149;
    }
    float _151 = _123;
    bool _153 = _147 >= _151;
    bool _155 = !_143;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_49.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _131 = as_type<int>(_163);
    }
    int _165 = _131;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3921 = as_type<float>(_165);
        out.gl_Position.z = _3921;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = in.m_56.x;
    float _171 = in.m_56.y;
    float _173 = in.m_56.z;
    float _175 = in.m_58.x;
    float _177 = in.m_58.y;
    float _179 = in.m_58.z;
    float _181 = in.m_60.x;
    float _183 = in.m_60.y;
    float _185 = in.m_60.z;
    float _187 = in.m_62.x;
    float _189 = in.m_62.y;
    float _191 = in.m_62.z;
    int _193 = as_type<int>(_167) & 1;
    bool _195 = _193 != 0;
    int _197 = as_type<int>(_167) & 2;
    bool _199 = _197 != 0;
    bool _201 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _203 = !_195;
    float _205 = _203 ? (-0.5) : 0.5;
    bool _207 = !_199;
    float _209 = _207 ? (-0.5) : 0.5;
    float _211 = _171 * _177;
    float _213 = _171 * _183;
    float _215 = fma(_169, _175, _211);
    float _217 = _171 * _189;
    float _219 = fma(_169, _181, _213);
    float _221 = fma(_173, _179, _215);
    float _223 = fma(_169, _187, _217);
    float _225 = fma(_173, _185, _219);
    float _227 = fma(_173, _191, _223);
    bool _229 = !_201;
    float _231 = _221;
    float _249;
    if (!_229)
    {
        float _233 = in.m_64.x;
        float _235 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _237 = _233 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _241 = _239 * _235;
        float _243 = floor(_241);
        float _245 = -_243;
        float _247 = _241 + _245;
        _249 = _247;
        _251 = true;
    }
    else
    {
        float _253 = float(_113);
        float _255 = 1.0 / _253;
        float _257 = _147 * _255;
        _249 = _257;
    }
    _251 = false;
    float _259 = _249;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _263 = _259 + _261;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = _259 + _265;
    bool _269 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _271 = isnan(_259);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _285 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _259 + _293;
    float _297 = 1.0 / _283;
    bool _299 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _301 = 1.0 / _291;
    float _303 = 1.0 / _287;
    float _305 = _263 * _297;
    bool _307 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _309 = isnan(_259);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -_279;
    float _321 = _319 + 1.0;
    float _323 = _317 * _321;
    float _325 = _267 * _301;
    bool _327 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _329 = isnan(_259);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -_317;
    float _341 = _339 + 1.0;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _347 = _295 * _303;
    bool _349 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _351 = isnan(_259);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _361;
    float _365 = _337 * _341;
    float _367 = -_337;
    float _369 = _367 + 1.0;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _371;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _379 = fma(_363, _305, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _381 = _359 * _369;
    float _383 = fma(_373, _305, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _385 = fma(_345, _347, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _387 = fma(_377, _347, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _389 = -_359;
    float _391 = _389 + 1.0;
    float _393 = _379 * _381;
    float _395 = _383 * _381;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _401;
    float _405 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[143].x, _393);
    float _407 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[143].y, _395);
    float _409 = fma(_399, _325, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _411 = fma(_403, _325, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _413 = fma(_385, _365, _405);
    float _415 = fma(_387, _365, _407);
    float _417 = fma(_409, _323, _413);
    float _419 = fma(_411, _323, _415);
    float _421 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[146].x, _417);
    float _423 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[146].y, _419);
    bool _425 = !_299;
    float _443;
    if (!_425)
    {
        float _427 = in.m_64.x;
        float _429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _431 = _427 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _433 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[11].x, _147);
        float _435 = _433 * _429;
        float _437 = floor(_435);
        float _439 = -_437;
        float _441 = _435 + _439;
        _443 = _441;
        _445 = true;
    }
    else
    {
        float _447 = float(_113);
        float _449 = 1.0 / _447;
        float _451 = _147 * _449;
        _443 = _451;
    }
    _445 = false;
    float _453 = _443;
    float _455 = in.m_66.x;
    float _457 = in.m_66.y;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _461 = _453 + _459;
    bool _463 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _465 = isnan(_453);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _475;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _483 = 1.0 / _477;
    bool _485 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _487 = 1.0 / _481;
    float _489 = _423 * _457;
    bool _491 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _493 = isnan(_453);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = _461 * _483;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _507 = _453 + _505;
    bool _509 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _511 = isnan(_453);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = -_473;
    float _523 = _521 + 1.0;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _525;
    float _529 = _421 * _455;
    float _531 = _519 * _523;
    float _533 = -_519;
    float _535 = _533 + 1.0;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _537;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _541;
    float _545 = fma(_527, _503, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _547 = _501 * _535;
    float _549 = fma(_539, _503, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _551 = fma(_543, _503, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _553 = _507 * _487;
    float _555 = _545 * _547;
    float _557 = _549 * _547;
    float _559 = _551 * _547;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _565 = -_501;
    float _567 = _565 + 1.0;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _577 = fma(_563, _553, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _579 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[107].x, _559);
    float _581 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[107].y, _557);
    float _583 = fma(_571, _553, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _585 = fma(_575, _553, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _587 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[107].z, _555);
    float _589 = fma(_577, _531, _581);
    float _591 = fma(_583, _531, _579);
    float _593 = fma(_585, _531, _587);
    float _595 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[109].y, _589);
    float _597 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[109].x, _591);
    float _599 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[109].z, _593);
    bool _601 = !_485;
    float _619;
    if (!_601)
    {
        float _603 = in.m_64.x;
        float _605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _607 = _603 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _609 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[11].y, _147);
        float _611 = _609 * _605;
        float _613 = floor(_611);
        float _615 = -_613;
        float _617 = _611 + _615;
        _619 = _617;
        _621 = true;
    }
    else
    {
        float _623 = float(_113);
        float _625 = 1.0 / _623;
        float _627 = _147 * _625;
        _619 = _627;
    }
    _621 = false;
    float _629 = _619;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _633 = _629 + _631;
    float _635 = _597 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _641;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _649 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _651 = isnan(_629);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = 1.0 / _639;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _667 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _669 = isnan(_629);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    float _679 = _595 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _681 = _599 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _683 = _635 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _685 = _679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _687 = 1.0 / _647;
    float _689 = _681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _691 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _693 = _643 * _661;
    bool _695 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _697 = isnan(_629);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = 1.0 / _665;
    float _709 = -_659;
    float _711 = _709 + 1.0;
    float _713 = fma(_693, _633, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _719 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _721 = isnan(_629);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = -_705;
    float _733 = _731 + 1.0;
    float _735 = _705 * _711;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _739 = _737 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _741 = 1.0 / _717;
    float _743 = -_729;
    float _745 = _743 + 1.0;
    float _747 = _677 * _733;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _749;
    float _753 = _739 * _687;
    float _755 = _659 * _745;
    float _757 = _713 * _747;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _761 = _629 + _759;
    float _763 = -_677;
    float _765 = _763 + 1.0;
    bool _767 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _769 = isnan(_629);
    bool _771 = _767 || _769;
    bool _773 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _775 = _771 || _773;
    float _777 = float(_775);
    float _779 = _751 * _707;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _787 = _629 + _785;
    float _789 = fma(_753, _761, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _791 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[115].x, _757);
    float _793 = -_777;
    float _795 = _793 + 1.0;
    float _797 = _783 * _741;
    float _799 = fma(_779, _787, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _803 = _629 + _801;
    float _805 = fma(_789, _735, _791);
    float _807 = _729 * _795;
    float _809 = fma(_797, _803, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _811 = fma(_799, _755, _805);
    float _813 = fma(_809, _807, _811);
    float _815 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[119].x, _813);
    float _817 = _815 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_68.x = _683;
    out.m_68.y = _685;
    out.m_68.z = _689;
    out.m_68.w = _817;
    bool _819 = !_691;
    float _821 = _707;
    float _839;
    if (!_819)
    {
        float _823 = in.m_64.x;
        float _825 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _827 = _823 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _829 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[11].z, _147);
        float _831 = _829 * _825;
        float _833 = floor(_831);
        float _835 = -_833;
        float _837 = _831 + _835;
        _839 = _837;
        _841 = true;
    }
    else
    {
        float _843 = float(_113);
        float _845 = 1.0 / _843;
        float _847 = _147 * _845;
        _839 = _847;
    }
    _841 = false;
    float _849 = _839;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _853 = _849 + _851;
    bool _855 = _849 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _857 = isnan(_849);
    bool _859 = _855 || _857;
    bool _861 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _863 = _859 || _861;
    float _865 = float(_863);
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _869 = _849 + _867;
    bool _871 = _849 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _873 = isnan(_849);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _883;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _891 = _849 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _893 = isnan(_849);
    bool _895 = _891 || _893;
    bool _897 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _899 = _895 || _897;
    float _901 = float(_899);
    float _903 = -_865;
    float _905 = _903 + 1.0;
    float _907 = 1.0 / _889;
    float _909 = _901 * _905;
    float _911 = -_901;
    float _913 = _911 + 1.0;
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _915;
    bool _919 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _921 = 1.0 / _885;
    float _923 = _881 * _913;
    float _925 = -_881;
    float _927 = _925 + 1.0;
    float _929 = _869 * _907;
    float _931 = _853 * _921;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _933;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _937;
    float _941 = fma(_917, _931, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _943 = fma(_935, _931, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _945 = fma(_939, _931, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _947 = _941 * _923;
    float _949 = _943 * _923;
    float _951 = _945 * _923;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _959 = _957 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _963 = _961 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _965 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[123].x, _947);
    float _967 = fma(_955, _929, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _969 = fma(_959, _929, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _971 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[123].y, _949);
    float _973 = fma(_963, _929, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _975 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[123].z, _951);
    float _977 = fma(_967, _909, _965);
    float _979 = fma(_969, _909, _971);
    float _981 = fma(_973, _909, _975);
    float _983 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[125].x, _977);
    float _985 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[125].y, _979);
    float _987 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[125].z, _981);
    bool _989 = !_919;
    float _991 = _979;
    float _1009;
    if (!_989)
    {
        float _993 = in.m_64.x;
        float _995 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _997 = _993 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _999 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[11].w, _147);
        float _1001 = _999 * _995;
        float _1003 = floor(_1001);
        float _1005 = -_1003;
        float _1007 = _1001 + _1005;
        _1009 = _1007;
        _1011 = true;
    }
    else
    {
        float _1013 = float(_113);
        float _1015 = 1.0 / _1013;
        float _1017 = _147 * _1015;
        _1009 = _1017;
    }
    _1011 = false;
    float _1019 = _1009;
    float _1021 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1023 = int(_1021);
    float _1025 = float(_113);
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1029 = _1027 != 0;
    float _1031 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1033 = int(_1031);
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1037 = _1035 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1039 = float(_1023);
    float _1041 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1043 = int(_1041);
    if (_1029)
    {
        float _1045 = in.m_64.x;
        _991 = _1045;
    }
    float _1047 = _991;
    float _1049 = _1047;
    if (_1029)
    {
        _821 = 1.0;
    }
    float _1051 = _821;
    float _1053 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1055 = _1051;
    if (!_1029)
    {
        _1055 = 7.345489978790283203125;
    }
    float _1057 = _1055;
    float _1059 = _1057;
    if (!_1029)
    {
        float _1061 = in.m_64.y;
        _1049 = _1061;
    }
    float _1063 = _1049;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1067 = float(uint(_1033));
    float _1069 = 1.0 / _1039;
    int _1071 = ~_1033;
    int _1073 = _1071 + 1;
    bool _1075 = _1033 == 0;
    float _1077 = 1.0 / _1067;
    float _1079 = float(uint(_1043));
    int _1081 = ~_1043;
    int _1083 = _1081 + 1;
    float _1085 = _147 * _1069;
    float _1087 = 1.0 / _1079;
    int _1089 = as_type<int>(_1077) + (-2);
    float _1091 = trunc(_1085);
    int _1093 = int(_1091);
    int _1095 = ~_1033;
    int _1097 = _1095 + 1;
    float _1099 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1101 = int(_1099);
    float _1103 = float(uint(_1093));
    float _1105 = 1.0 / _1037;
    float _1107 = as_type<float>(_1089) * _1103;
    float _1109 = float(_1101);
    float _1111 = trunc(_1107);
    float _1113 = precise::max(_1111, 0.0);
    uint _1116 = uint(_1113);
    float _1118 = 1.0 / _1109;
    int _1120 = _1097 * int(_1116);
    int _1122 = _1120 + _1093;
    float _1124 = float(uint(_1122));
    float _1126 = in.m_64.x;
    float _1128 = in.m_64.y;
    float _1130 = in.m_64.z;
    float _1132 = in.m_64.w;
    float _1134 = _147 * _1118;
    float _1136 = as_type<float>(_1089) * _1124;
    float _1138 = trunc(_1134);
    int _1140 = int(_1138);
    float _1142 = trunc(_1136);
    float _1144 = precise::max(_1142, 0.0);
    uint _1146 = uint(_1144);
    float _1148 = float(uint(_1140));
    float _1150 = _1057 * _1126;
    float _1152 = _1130;
    if (_1029)
    {
        _1059 = 1.0;
    }
    float _1154 = _1059;
    float _1156 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1158 = _1154;
    if (!_1029)
    {
        _1158 = 1.2345600128173828125;
    }
    float _1160 = _1158;
    float _1162 = floor(_1150);
    int _1164 = int(_1116) + int(_1146);
    float _1166 = float(_1033);
    float _1168 = float(_1093);
    int _1170 = _1073 * _1164;
    int _1172 = _1170 + _1093;
    float _1174 = _1160 * _1063;
    bool _1176 = _1168 >= _1166;
    bool _1178 = isnan(_1168);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan(_1166);
    bool _1184 = _1180 || _1182;
    float _1186 = float(_1184);
    bool _1188 = uint(_1172) >= uint(_1033);
    float _1190 = floor(_1174);
    float _1192 = -_1162;
    float _1194 = _1150 + _1192;
    bool _1196 = !_1188;
    int _1198 = _1196 ? 0 : (-1);
    float _1200 = _1194 * _1166;
    int _1202 = ~_1164;
    int _1204 = _1202 + _1198;
    int _1206 = _1204 + 1;
    float _1208 = trunc(_1186);
    int _1210 = int(_1208);
    int _1212 = as_type<int>(_1087) + (-2);
    int _1214 = _1033 * _1206;
    int _1216 = _1214 + _1093;
    int _1218 = _1033 + (-1);
    float _1220 = as_type<float>(_1212) * _1148;
    float _1222 = 1.0 / _1025;
    bool _1224 = !_1075;
    int _1226 = _1224 ? _1216 : (-1);
    int _1228 = ~_1210;
    int _1230 = _1228 + 1;
    int _1232 = _1230 + 1;
    float _1234 = trunc(_1220);
    float _1236 = precise::max(_1234, 0.0);
    uint _1238 = uint(_1236);
    int _1240 = _1226 * _1232;
    float _1242 = -_1190;
    float _1244 = _1174 + _1242;
    int _1246 = ~_1043;
    int _1248 = _1246 + 1;
    float _1250 = _147 * _1222;
    int _1252 = _1210 * _1218;
    int _1254 = _1252 + _1240;
    float _1256 = trunc(_1200);
    int _1258 = int(_1256);
    float _1260 = _1250 * _1166;
    int _1262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1264 = _1262 != 0;
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1268 = _1266 != 0;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1272 = _1270 != 0;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1276 = _1274 != 0;
    int _1278 = _1248 * int(_1238);
    int _1280 = _1278 + _1140;
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1284 = _1282 != 0;
    float _1286 = trunc(_1260);
    int _1288 = int(_1286);
    bool _1290 = !_1268;
    int _1292 = _1290 ? 0 : 1;
    bool _1294 = !_1264;
    int _1296 = _1294 ? 0 : 1;
    float _1298 = float(uint(_1280));
    int _1300 = abs(_1292);
    int _1302 = abs(_1296);
    float _1304 = as_type<float>(_1212) * _1298;
    bool _1306 = !_1276;
    int _1308 = _1306 ? 0 : 1;
    int _1310 = _1254 * _1300;
    bool _1312 = !_1272;
    int _1314 = _1312 ? 0 : 1;
    bool _1316 = !_1284;
    int _1318 = _1316 ? 0 : 1;
    int _1320 = _1288 * _1302;
    int _1322 = _1320 + _1310;
    int _1324 = abs(_1308);
    int _1326 = abs(_1314);
    float _1328 = trunc(_1304);
    float _1330 = precise::max(_1328, 0.0);
    uint _1332 = uint(_1330);
    float _1334 = float(_1043);
    int _1336 = _1258 * _1324;
    int _1338 = _1336 + _1093;
    int _1340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1342 = _1340 != 0;
    int _1344 = abs(_1318);
    float _1346 = float(_1140);
    int _1348 = _1338 * _1326;
    int _1350 = _1348 + _1322;
    int _1352 = int(_1238) + int(_1332);
    float _1354 = _1244 * _1334;
    bool _1356 = _1346 >= _1334;
    bool _1358 = isnan(_1346);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan(_1334);
    bool _1364 = _1360 || _1362;
    float _1366 = float(_1364);
    int _1368 = _1258 * _1344;
    int _1370 = _1368 + _1350;
    bool _1372 = !_1342;
    int _1374 = _1372 ? 0 : 1;
    int _1376 = _1083 * _1352;
    int _1378 = _1376 + _1140;
    float _1380 = trunc(_1366);
    int _1382 = int(_1380);
    float _1384 = _1250 * _1334;
    float _1386 = float(uint(_1370));
    bool _1388 = uint(_1378) >= uint(_1043);
    int _1390 = _1043 + (-1);
    float _1392 = as_type<float>(_1089) * _1386;
    float _1394 = trunc(_1354);
    int _1396 = int(_1394);
    bool _1398 = !_1388;
    int _1400 = _1398 ? 0 : (-1);
    int _1402 = abs(_1374);
    int _1404 = ~_1352;
    int _1406 = _1404 + _1400;
    int _1408 = _1406 + 1;
    int _1410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1412 = _1410 != 0;
    int _1414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1416 = _1414 != 0;
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1420 = _1418 != 0;
    int _1422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1424 = _1422 != 0;
    float _1426 = trunc(_1392);
    float _1428 = precise::max(_1426, 0.0);
    uint _1430 = uint(_1428);
    int _1432 = ~_1033;
    int _1434 = _1432 + 1;
    int _1436 = _1043 * _1408;
    int _1438 = _1436 + _1140;
    bool _1440 = _1043 == 0;
    int _1442 = ~_1382;
    int _1444 = _1442 + 1;
    int _1446 = _1444 + 1;
    bool _1448 = !_1440;
    int _1450 = _1448 ? _1438 : (-1);
    int _1452 = _1396 * _1402;
    int _1454 = _1452 + _1140;
    float _1456 = trunc(_1384);
    int _1458 = int(_1456);
    bool _1460 = _1033 == 0;
    int _1462 = _1450 * _1446;
    bool _1464 = !_1416;
    int _1466 = _1464 ? 0 : 1;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1470 = _1468 != 0;
    int _1472 = _1434 * int(_1430);
    int _1474 = _1472 + _1370;
    int _1476 = abs(_1466);
    int _1478 = _1382 * _1390;
    int _1480 = _1478 + _1462;
    bool _1482 = !_1412;
    int _1484 = _1482 ? 0 : 1;
    float _1486 = float(uint(_1474));
    int _1488 = _1480 * _1476;
    bool _1490 = !_1420;
    int _1492 = _1490 ? 0 : 1;
    int _1494 = abs(_1484);
    float _1496 = as_type<float>(_1089) * _1486;
    int _1498 = abs(_1492);
    bool _1500 = !_1424;
    int _1502 = _1500 ? 0 : 1;
    int _1504 = _1458 * _1494;
    int _1506 = _1504 + _1488;
    float _1508 = float(uint(_1338));
    float _1510 = trunc(_1496);
    float _1512 = precise::max(_1510, 0.0);
    uint _1514 = uint(_1512);
    int _1516 = abs(_1502);
    float _1518 = as_type<float>(_1089) * _1508;
    int _1520 = ~_1033;
    int _1522 = _1520 + 1;
    int _1524 = _1454 * _1498;
    int _1526 = _1524 + _1506;
    float _1528 = float(uint(_1454));
    float _1530 = trunc(_1518);
    float _1532 = precise::max(_1530, 0.0);
    uint _1534 = uint(_1532);
    int _1536 = 0;
    if (_1470)
    {
        _1536 = 0;
    }
    int _1538 = _1536;
    int _1540 = _1396 * _1516;
    int _1542 = _1540 + _1526;
    float _1544 = as_type<float>(_1212) * _1528;
    int _1546 = _1538;
    if (!_1470)
    {
        _1546 = 1;
    }
    int _1548 = _1546;
    float _1550 = float(uint(_1542));
    float _1552 = trunc(_1544);
    float _1554 = precise::max(_1552, 0.0);
    uint _1556 = uint(_1554);
    int _1558 = int(_1430) + int(_1514);
    int _1560 = ~_1043;
    int _1562 = _1560 + 1;
    float _1564 = as_type<float>(_1212) * _1550;
    int _1566 = ~_1043;
    int _1568 = _1566 + 1;
    int _1570 = _1522 * _1558;
    int _1572 = _1570 + _1370;
    bool _1574 = _1126 > 0.5;
    int _1576 = _1522 * int(_1534);
    int _1578 = _1576 + _1338;
    int _1580 = ~_1043;
    int _1582 = _1580 + 1;
    float _1584 = trunc(_1564);
    float _1586 = precise::max(_1584, 0.0);
    uint _1588 = uint(_1586);
    bool _1590 = uint(_1572) >= uint(_1033);
    float _1592 = float(uint(_1578));
    bool _1594 = !_1590;
    int _1596 = _1594 ? 0 : (-1);
    float _1598 = as_type<float>(_1089) * _1592;
    int _1600 = ~_1558;
    int _1602 = _1600 + _1596;
    int _1604 = _1602 + 1;
    int _1606 = _1562 * int(_1556);
    int _1608 = _1606 + _1454;
    int _1610 = _1033 * _1604;
    int _1612 = _1610 + _1370;
    float _1614 = float(uint(_1608));
    int _1616 = _1582 * int(_1588);
    int _1618 = _1616 + _1542;
    float _1620 = trunc(_1598);
    float _1622 = precise::max(_1620, 0.0);
    uint _1624 = uint(_1622);
    bool _1626 = !_1460;
    int _1628 = _1626 ? _1612 : (-1);
    float _1630 = as_type<float>(_1212) * _1614;
    float _1632 = float(uint(_1618));
    int _1634 = _1628 & 3;
    bool _1636 = _1634 != 0;
    int _1638 = _1628 & 3;
    bool _1640 = _1638 != 0;
    float _1642 = as_type<float>(_1212) * _1632;
    bool _1644 = uint(_1634) > 1u;
    float _1646 = trunc(_1630);
    float _1648 = precise::max(_1646, 0.0);
    uint _1650 = uint(_1648);
    bool _1652 = _1634 != 3;
    int _1654 = _1640 ? 0 : 1;
    int _1656 = ~_1033;
    int _1658 = _1656 + 1;
    bool _1660 = uint(_1634) >= 2u;
    float _1662 = trunc(_1642);
    float _1664 = precise::max(_1662, 0.0);
    uint _1666 = uint(_1664);
    int _1668 = int(_1534) + int(_1624);
    int _1670 = ~_1654;
    int _1672 = _1670 + 1;
    int _1674 = _1672 + 1;
    int _1676 = _1674;
    if (!_1644)
    {
        int _1678 = ~_1654;
        int _1680 = _1678 + 1;
        _1676 = _1680;
    }
    int _1682 = _1676;
    int _1684 = _1658 * _1668;
    int _1686 = _1684 + _1338;
    int _1688 = _1660 ? 0 : 1;
    int _1690 = ~_1688;
    int _1692 = _1690 + 1;
    int _1694 = _1692 + 1;
    int _1696 = _1694;
    if (_1652)
    {
        int _1698 = ~_1688;
        int _1700 = _1698 + 1;
        _1696 = _1700;
    }
    int _1702 = _1696;
    bool _1704 = _1132 > 0.5;
    bool _1706 = uint(_1686) >= uint(_1033);
    int _1708 = ~_1043;
    int _1710 = _1708 + 1;
    float _1712 = in.m_46.x;
    float _1714 = in.m_46.y;
    float _1716 = in.m_46.z;
    int _1718 = int(_1556) + int(_1650);
    int _1720 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1722 = _1720 != 0;
    int _1724 = int(_1588) + int(_1666);
    int _1726 = _1710 * _1718;
    int _1728 = _1726 + _1454;
    bool _1730 = !_1706;
    int _1732 = _1730 ? 0 : (-1);
    int _1734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1736 = _1734 != 0;
    int _1738 = _1568 * _1724;
    int _1740 = _1738 + _1542;
    float _1742 = -_205;
    int _1744 = _1574 ? as_type<int>(_1742) : as_type<int>(_205);
    bool _1746 = !_1736;
    int _1748 = _1746 ? 0 : 1;
    bool _1750 = uint(_1728) >= uint(_1043);
    bool _1752 = _1128 > 0.5;
    bool _1754 = !_1750;
    int _1756 = _1754 ? 0 : (-1);
    bool _1758 = !_1722;
    float _1760 = _1758 ? _205 : as_type<float>(_1744);
    float _1762 = -_209;
    int _1764 = _1752 ? as_type<int>(_1762) : as_type<int>(_209);
    float _1766 = _177 * _1714;
    bool _1768 = uint(_1740) >= uint(_1043);
    float _1770 = _183 * _1714;
    int _1772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1774 = _1772 != 0;
    float _1776 = fma(_175, _1712, _1766);
    bool _1778 = _1130 > 0.5;
    float _1780 = _189 * _1714;
    bool _1782 = !_1768;
    int _1784 = _1782 ? 0 : (-1);
    float _1786 = fma(_181, _1712, _1770);
    bool _1788 = !_1774;
    float _1790 = _1788 ? _209 : as_type<float>(_1764);
    float _1792 = in.m_58.w;
    float _1794 = -_205;
    int _1796 = _1778 ? as_type<int>(_1794) : as_type<int>(_205);
    float _1798 = fma(_187, _1712, _1780);
    int _1800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1802 = _1800 != 0;
    float _1804 = _1126 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1808 = _1806 != 0;
    float _1810 = in.m_60.w;
    int _1812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1814 = _1812 != 0;
    float _1816 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1818 = _1816 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1820 = 1.0 / _1818;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1824 = ~_1724;
    int _1826 = _1824 + _1784;
    int _1828 = _1826 + 1;
    float _1830 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1832 = ~_1668;
    int _1834 = _1832 + _1732;
    int _1836 = _1834 + 1;
    float _1838 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1838;
    float _1842 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1844 = _1842 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1846 = -_1830;
    float _1848 = fma(_1804, 2.0, _1846);
    float _1850 = fma(_1156, -2.0, _1822);
    float _1852 = fma(_179, _1716, _1776);
    float _1854 = fma(_185, _1716, _1786);
    float _1856 = in.m_62.w;
    float _1858 = _1840 * _1105;
    float _1860 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1862 = _1019 + _1860;
    bool _1864 = _1019 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1866 = isnan(_1019);
    bool _1868 = _1864 || _1866;
    bool _1870 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1872 = _1868 || _1870;
    float _1874 = float(_1872);
    float _1876 = _1844 * _1820;
    bool _1878 = _1019 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1880 = isnan(_1019);
    bool _1882 = _1878 || _1880;
    bool _1884 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1886 = _1882 || _1884;
    float _1888 = float(_1886);
    float _1890 = fma(_1858, _1862, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1892 = _1019 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1894 = isnan(_1019);
    bool _1896 = _1892 || _1894;
    bool _1898 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1900 = _1896 || _1898;
    float _1902 = float(_1900);
    float _1904 = -_1874;
    float _1906 = _1904 + 1.0;
    bool _1908 = !_1814;
    float _1910 = _1908 ? _205 : as_type<float>(_1796);
    float _1912 = -_1888;
    float _1914 = _1912 + 1.0;
    bool _1916 = _1548 != 1;
    float _1918 = _1902 * _1906;
    float _1920 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1922 = _1019 + _1920;
    float _1924 = _1874 * _1914;
    float _1926 = fma(_191, _1716, _1798);
    float _1928 = _1852 + _1792;
    float _1930 = _1890 * _1918;
    float _1932 = -_1902;
    float _1934 = _1932 + 1.0;
    float _1936 = -_147;
    float _1938 = fma(_1936, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1848);
    float _1940 = _1760 + 0.5;
    float _1942 = fma(_1876, _1922, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1944 = _1926 + _1856;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1948 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1850);
    float _1950 = fma(_1934, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1930);
    float _1952 = fma(_1940, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1938);
    float _1954 = _1934;
    float _1956 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    float _1958 = _1946;
    float _1960 = _1910;
    float _1962 = _1928;
    if (!_1916)
    {
        _1954 = _1128;
    }
    float _1964 = _1954;
    float _1966 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1968 = _1964;
    if (!_1916)
    {
        _1956 = _1128;
    }
    float _1970 = _1956;
    float _1972 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1946);
    float _1974 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1966);
    float _1976 = _1970;
    if (_1916)
    {
        _1968 = _1126;
    }
    float _1978 = _1968;
    float _1980 = fma(_1942, _1924, _1950);
    if (_1916)
    {
        _1976 = _1126;
    }
    float _1982 = _1976;
    int _1984 = _1043 * _1828;
    int _1986 = _1984 + _1542;
    if (!_1916)
    {
        _1958 = _1130;
    }
    float _1988 = _1958;
    float _1990 = _1854 + _1810;
    float _1992 = _1988;
    if (_1916)
    {
        _1992 = _1128;
    }
    float _1994 = _1992;
    float _1996 = _1790 + (-0.5);
    if (_1916)
    {
        _1152 = _1128;
    }
    float _1998 = _1152;
    float _2000 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2002 = _1628 >> 31;
    float _2004 = -_1996;
    float _2006 = -_1948;
    float _2008 = fma(_2004, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2006);
    bool _2010 = !_1440;
    int _2012 = _2010 ? _1986 : (-1);
    float _2014 = fma(_1982, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2000);
    int _2016 = _2002 & 3;
    float _2018 = _1978 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2020 = _2012 >> 31;
    float _2022 = fma(_1888, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1980);
    int _2024 = _1628 + _2016;
    float _2026 = -_1053;
    float _2028 = fma(_2018, 2.0, _2026);
    int _2030 = _2020 & 3;
    float _2032 = _1994 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2034 = _2024 >> 2;
    int _2036 = _1033 * _1836;
    int _2038 = _2036 + _1338;
    int _2040 = _2012 + _2030;
    float _2042 = fma(_2032, -2.0, _1065);
    int _2044 = _2034 << 4;
    int _2046 = _2044 + 368;
    float _2048 = -_147;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2028);
    int _2052 = _2040 >> 2;
    float _2054 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2056 = _1990 + _2054;
    uint _2058 = uint(int(uint(_2046) >> uint(2)));
    uint _2060 = uint(int(uint(int(_2058)) >> uint(2)));
    int _2062 = int(_2058) & 3;
    float _2064 = (*spvDescriptorSet0.vp_c9)._m0[int(_2060)][_2062];
    int _2066 = int(_2058) + 1;
    uint _2068 = uint(int(uint(_2066) >> uint(2)));
    int _2070 = _2066 & 3;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[int(_2068)][_2070];
    bool _2074 = !_1636;
    int _2076 = _2074 ? 0 : 1;
    float _2078 = _1910 + 0.5;
    int _2080 = _2052 << 4;
    int _2082 = _2080 + 512;
    float _2084 = _2056 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2086 = _2012 & 3;
    bool _2088 = _2086 != 0;
    float _2090 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2014);
    int _2092 = _2012 & 3;
    bool _2094 = _2092 != 0;
    uint _2096 = uint(int(uint(_2082) >> uint(2)));
    uint _2098 = uint(int(uint(int(_2096)) >> uint(2)));
    int _2100 = int(_2096) & 3;
    float _2102 = (*spvDescriptorSet0.vp_c9)._m0[int(_2098)][_2100];
    int _2104 = int(_2096) + 1;
    uint _2106 = uint(int(uint(_2104) >> uint(2)));
    int _2108 = _2104 & 3;
    float _2110 = (*spvDescriptorSet0.vp_c9)._m0[int(_2106)][_2108];
    int _2112 = _2088 ? 0 : 1;
    float _2114 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1974);
    bool _2116 = uint(_2092) > 1u;
    int _2118 = ~_2112;
    int _2120 = _2118 + 1;
    int _2122 = _2120 + 1;
    int _2124 = _2046 + 8;
    uint _2126 = uint(int(uint(_2124) >> uint(2)));
    uint _2128 = uint(int(uint(int(_2126)) >> uint(2)));
    int _2130 = int(_2126) & 3;
    float _2132 = (*spvDescriptorSet0.vp_c9)._m0[int(_2128)][_2130];
    int _2134 = int(_2126) + 1;
    uint _2136 = uint(int(uint(_2134) >> uint(2)));
    int _2138 = _2134 & 3;
    float _2140 = (*spvDescriptorSet0.vp_c9)._m0[int(_2136)][_2138];
    int _2142 = abs(_1682);
    int _2144 = abs(_2076);
    float _2146 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2148 = ~_2142;
    int _2150 = _2148 + 1;
    int _2152 = _2150 + 1;
    int _2154 = ~_1718;
    int _2156 = _2154 + _1756;
    int _2158 = _2156 + 1;
    float _2160 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2146);
    int _2162 = _2122;
    if (!_2116)
    {
        int _2164 = ~_2112;
        int _2166 = _2164 + 1;
        _2162 = _2166;
    }
    int _2168 = _2162;
    float _2170 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1972);
    bool _2172 = !_2094;
    int _2174 = _2172 ? 0 : 1;
    int _2176 = _2082 + 8;
    uint _2178 = uint(int(uint(_2176) >> uint(2)));
    uint _2180 = uint(int(uint(int(_2178)) >> uint(2)));
    int _2182 = int(_2178) & 3;
    float _2184 = (*spvDescriptorSet0.vp_c9)._m0[int(_2180)][_2182];
    int _2186 = int(_2178) + 1;
    uint _2188 = uint(int(uint(_2186) >> uint(2)));
    int _2190 = _2186 & 3;
    float _2192 = (*spvDescriptorSet0.vp_c9)._m0[int(_2188)][_2190];
    bool _2194 = _1634 != 3;
    float _2196 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2198 = _1928 + _2196;
    bool _2200 = uint(_2092) >= 2u;
    float _2202 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2204 = _1944 + _2202;
    bool _2206 = !_2194;
    int _2208 = _2206 ? 0 : (-1);
    float _2210 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2084);
    bool _2212 = _2092 != 3;
    float _2214 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2042);
    int _2216 = abs(_2168);
    float _2218 = fma(_2204, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2210);
    int _2220 = _2200 ? 0 : 1;
    float _2222 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2160);
    int _2224 = ~_2216;
    int _2226 = _2224 + 1;
    int _2228 = _2226 + 1;
    float _2230 = fma(_2078, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2050);
    int _2232 = abs(_2174);
    float _2234 = -_2222;
    float _2236 = _2234 + 1.0;
    int _2238 = ~_2220;
    int _2240 = _2238 + 1;
    int _2242 = _2240 + 1;
    float _2244 = -_2170;
    float _2246 = _2244 + 1.0;
    int _2248 = abs(_2208);
    int _2250 = _2152 * as_type<int>(_2072);
    int _2252 = _2242;
    if (_2212)
    {
        int _2254 = ~_2220;
        int _2256 = _2254 + 1;
        _2252 = _2256;
    }
    int _2258 = _2252;
    int _2260 = ~_2144;
    int _2262 = _2260 + 1;
    int _2264 = _2262 + 1;
    bool _2266 = _2092 != 3;
    int _2268 = _2228 * as_type<int>(_2110);
    int _2270 = _2264 * as_type<int>(_2064);
    int _2272 = _2270 + _2250;
    int _2274 = abs(_1702);
    float _2276 = _987 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2278 = ~_2232;
    int _2280 = _2278 + 1;
    int _2282 = _2280 + 1;
    int _2284 = ~_2274;
    int _2286 = _2284 + 1;
    int _2288 = _2286 + 1;
    float _2290 = _2276 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2292 = _2282 * as_type<int>(_2102);
    int _2294 = _2292 + _2268;
    int _2296 = abs(_2258);
    int _2298 = _2288 * as_type<int>(_2132);
    int _2300 = _2298 + _2272;
    bool _2302 = !_2266;
    int _2304 = _2302 ? 0 : (-1);
    int _2306 = ~_2248;
    int _2308 = _2306 + 1;
    int _2310 = _2308 + 1;
    int _2312 = ~_2296;
    int _2314 = _2312 + 1;
    int _2316 = _2314 + 1;
    int _2318 = abs(_2304);
    int _2320 = _2310 * as_type<int>(_2140);
    int _2322 = _2320 + _2300;
    bool _2324 = !_1808;
    int _2326 = _2324 ? 0 : 1;
    int _2328 = _2316 * as_type<int>(_2184);
    int _2330 = _2328 + _2294;
    float _2332 = -_209;
    int _2334 = _1704 ? as_type<int>(_2332) : as_type<int>(_209);
    int _2336 = abs(_2326);
    int _2338 = ~_2318;
    int _2340 = _2338 + 1;
    int _2342 = _2340 + 1;
    bool _2344 = !_1802;
    float _2346 = _2344 ? _209 : as_type<float>(_2334);
    int _2348 = _1043 * _2158;
    int _2350 = _2348 + _1454;
    int _2352 = ~_2336;
    int _2354 = _2352 + 1;
    int _2356 = _2354 + 1;
    int _2358 = _2342 * as_type<int>(_2192);
    int _2360 = _2358 + _2330;
    int _2362 = abs(_1748);
    bool _2364 = !_1440;
    int _2366 = _2364 ? _2350 : (-1);
    int _2368 = _2360 * _2356;
    int _2370 = ~_2362;
    int _2372 = _2370 + 1;
    int _2374 = _2372 + 1;
    bool _2376 = !_1460;
    int _2378 = _2376 ? _2038 : (-1);
    int _2380 = _2366 * _2336;
    int _2382 = _2380 + _2368;
    float _2384 = _2056 * _2056;
    int _2386 = _2322 * _2374;
    bool _2388 = _2218 >= 0.0;
    float _2390 = _2346 + (-0.5);
    float _2392 = fma(_2198, _2198, _2384);
    int _2394 = _2378 * _2362;
    int _2396 = _2394 + _2386;
    float _2398 = _983 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2400 = -_2390;
    float _2402 = -_2214;
    float _2404 = fma(_2400, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2402);
    float _2406 = fma(_2204, _2204, _2392);
    float _2408 = -_2090;
    float _2410 = _2408 + 1.0;
    float _2412 = -_2114;
    float _2414 = _2412 + 1.0;
    float _2416 = _985 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2418 = fma(_2346, _2236, _2404);
    float _2420 = -_2410;
    float _2422 = fma(_1910, _2420, _2230);
    float _2424 = rsqrt(_2406);
    float _2426 = _2422;
    if (_2388)
    {
        _1960 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2428 = _1960;
    float _2430 = fma(_1790, _2414, _2008);
    float _2432 = -_2246;
    float _2434 = fma(_1760, _2432, _1952);
    float _2436 = _2398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2438 = _2416 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2440 = _2022 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2442 = as_type<int>(_2428);
    if (_2388)
    {
        float _2444 = _2428 * 5.0;
        _2442 = as_type<int>(_2444);
    }
    int _2446 = _2442;
    float _2448 = float(_2396);
    out.m_70.x = _2434;
    out.m_70.y = _2430;
    out.m_70.z = _2422;
    out.m_70.w = _2418;
    float _2450 = float(_2382);
    out.m_72.x = _2436;
    out.m_72.y = _2438;
    out.m_72.z = _2290;
    out.m_72.w = _2440;
    float _2452 = _2056 * _2424;
    float _2454 = _2198 * _2424;
    if (_2388)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7332 = as_type<float>(_2446);
        out.gl_Position.z = _7332;
    }
    out.m_74.x = _2448;
    out.m_74.y = _2450;
    if (_2388)
    {
        out.m_49.x = 0.0;
    }
    if (_2388)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2456 = -_2452;
    float _2458 = fma(_2456, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1990);
    float _2460 = _2204 * _2424;
    float _2462 = -_2454;
    float _2464 = fma(_2462, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1928);
    float _2466 = -_2452;
    float _2468 = fma(_2466, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2056);
    float _2470 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2472 = _2458 + _2470;
    float _2474 = -_2460;
    float _2476 = fma(_2474, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1944);
    float _2478 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2480 = _2464 + _2478;
    float _2482 = -_2454;
    float _2484 = fma(_2482, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2198);
    float _2486 = _2472 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2488 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2490 = _2476 + _2488;
    float _2492 = _2468 * _2468;
    float _2494 = -_2460;
    float _2496 = fma(_2494, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2204);
    float _2498 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2486);
    float _2500 = fma(_2484, _2484, _2492);
    float _2502 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2498);
    float _2504 = fma(_2496, _2496, _2500);
    bool _2506 = _2502 >= 0.0;
    float _2508 = sqrt(_2504);
    float _2510 = _2464;
    if (_2506)
    {
        _2426 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2512 = _2426;
    int _2514 = as_type<int>(_2512);
    if (_2506)
    {
        out.m_49.x = 0.0;
    }
    if (_2506)
    {
        float _2516 = _2512 * 5.0;
        _2514 = as_type<int>(_2516);
    }
    int _2518 = _2514;
    float _2520 = _2424 * _2508;
    float _2522 = _2520;
    if (_2506)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7469 = as_type<float>(_2518);
        out.gl_Position.z = _7469;
    }
    if (_2506)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2524 = _489 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2526 = _529 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2528 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _209);
    float _2530 = _2520 * _2524;
    float _2532 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _205);
    float _2534 = _2520 * _2526;
    float _2536 = _2520 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2538 = _2536 * 0.5;
    float _2540 = _2528 * _2530;
    float _2542 = _2532 * _2534;
    float _2544 = _2540 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2546 = _2540 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2548 = _2540 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2550 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2544);
    float _2552 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2546);
    float _2554 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2548);
    float _2556 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2550);
    float _2558 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2552);
    float _2560 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2554);
    float _2562 = _2556 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2564 = _2558 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2566 = _2560 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2568 = _1944 + _2562;
    float _2570 = _1928 + _2564;
    float _2572 = _2458 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2574 = _1990 + _2566;
    float _2576 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2578 = _2568 + _2576;
    float _2580 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2582 = _2570 + _2580;
    float _2584 = fma(_2464, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2572);
    float _2586 = _2578 * _2578;
    float _2588 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2584);
    float _2590 = fma(_2582, _2582, _2586);
    float _2592 = sqrt(_2590);
    bool _2594 = _2592 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2596 = _2584;
    float _2598 = _2538;
    float _2600 = _2566;
    if (!_2594)
    {
        _2596 = _2570;
    }
    float _2602 = _2596;
    float _2604 = _2602;
    if (!_2594)
    {
        _2598 = _2568;
    }
    float _2606 = _2598;
    float _2608 = _2606;
    if (!_2594)
    {
        _2600 = _2574;
    }
    float _2610 = _2600;
    bool _2612 = !_2594;
    float _2614 = _2610;
    if (!_2612)
    {
        float _2616 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2620 = _2592 + _2618;
        float _2622 = rsqrt(_2590);
        float _2624 = _2620 * _2616;
        float _2626 = _2574 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2628 = _2624 * 0.15915493667125701904296875;
        float _2630 = _2628 * 6.283185482025146484375;
        float _2632 = cos(_2630);
        float _2634 = _2628 * 6.283185482025146484375;
        float _2636 = sin(_2634);
        float _2638 = _2632 + (-1.0);
        float _2640 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2642 = fma(_2636, _2626, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2644 = fma(_2574, _2632, _2640);
        float _2646 = _2622 * _2642;
        float _2648 = fma(_2582, _2646, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2650 = fma(_2578, _2646, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2614 = _2644;
        _2604 = _2648;
        _2608 = _2650;
    }
    float _2652 = _2614;
    float _2654 = _2604;
    float _2656 = _2608;
    float _2658 = -_1990;
    float _2660 = _2658 + _2652;
    float _2662 = -_1928;
    float _2664 = _2662 + _2654;
    float _2666 = _2588 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2668 = _2458 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2670 = _2660 * _2660;
    float _2672 = -_1944;
    float _2674 = _2672 + _2656;
    float _2676 = 1.0 / _2666;
    float _2678 = fma(_2464, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2668);
    float _2680 = fma(_2664, _2664, _2670);
    float _2682 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2678);
    float _2684 = fma(_2674, _2674, _2680);
    bool _2686 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2688 = isnan(0.5);
    bool _2690 = _2686 || _2688;
    bool _2692 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2694 = _2690 || _2692;
    float _2696 = _2682 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2698 = sqrt(_2684);
    bool _2700 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2702 = isnan(0.5);
    bool _2704 = _2700 || _2702;
    bool _2706 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2708 = _2704 || _2706;
    float _2710 = _2696 + _2666;
    float _2712 = _2710 * _2676;
    float _2714 = _2712 * 0.5;
    float _2716 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2718 = fma(_2714, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2716);
    float _2720 = 1.0 / _2718;
    bool _2722 = _2698 > 0.0;
    float _2724 = _2666;
    float _2726 = _2714;
    float _2728 = _2698;
    float _2730 = _2718;
    if (!_2722)
    {
        _2724 = _2654;
    }
    float _2732 = _2724;
    float _2734 = _2732;
    float _2736 = _2732;
    if (!_2722)
    {
        _2726 = _2652;
    }
    float _2738 = _2726;
    float _2740 = _2738;
    if (!_2722)
    {
        _2728 = _2656;
    }
    float _2742 = _2728;
    bool _2744 = !_2722;
    float _2746 = _2742;
    if (!_2744)
    {
        float _2748 = _225 * _225;
        float _2750 = rsqrt(_2684);
        float _2752 = fma(_221, _221, _2748);
        float _2754 = fma(_227, _227, _2752);
        float _2756 = sqrt(_2754);
        float _2758 = _2664 * _2750;
        float _2760 = _2660 * _2750;
        float _2762 = _2674 * _2750;
        bool _2764 = _2756 > 0.0;
        float _2766 = _2756;
        float _2768 = _2750;
        _2730 = _2754;
        if (!_2764)
        {
            _2734 = _2654;
        }
        float _2770 = _2734;
        _2736 = _2770;
        if (!_2764)
        {
            _2766 = _2652;
        }
        float _2772 = _2766;
        _2740 = _2772;
        if (!_2764)
        {
            _2768 = _2656;
        }
        float _2774 = _2768;
        bool _2776 = !_2764;
        _2746 = _2774;
        if (!_2776)
        {
            float _2778 = rsqrt(_2754);
            float _2780 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2782 = _225 * _2778;
            float _2784 = _221 * _2778;
            float _2786 = _227 * _2778;
            float _2788 = _2760 * _2782;
            float _2790 = fma(_2758, _2784, _2788);
            float _2792 = _2780 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2794 = fma(_2762, _2786, _2790);
            float _2796 = _2794 * _2792;
            float _2798 = fma(_221, _2796, _2654);
            float _2800 = fma(_225, _2796, _2652);
            float _2802 = fma(_227, _2796, _2656);
            _2746 = _2802;
            _2736 = _2798;
            _2740 = _2800;
        }
    }
    float _2804 = _2746;
    float _2806 = _2736;
    float _2808 = _2740;
    float _2810 = _2730;
    float _2812 = -_2460;
    float _2814 = fma(_2812, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2804);
    float _2816 = -_2454;
    float _2818 = fma(_2816, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2806);
    float _2820 = -_2452;
    float _2822 = fma(_2820, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2808);
    float _2824 = _2810;
    float _2826 = _2822;
    float _2828 = _2818;
    float _2830 = _2814;
    if (_2708)
    {
        _2824 = 1.0;
    }
    float _2832 = _2824;
    float _2834 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2836 = _2720 * _2834;
    float _2838 = _2832;
    if (!_2694)
    {
        float _2840 = _2472 * _2472;
        float _2842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2844 = -_1990;
        float _2846 = _2844 + _2808;
        float _2848 = -_1928;
        float _2850 = _2848 + _2806;
        float _2852 = fma(_2480, _2480, _2840);
        float _2854 = -_1944;
        float _2856 = _2854 + _2804;
        float _2858 = fma(_2490, _2490, _2852);
        float _2860 = 1.0 / _2520;
        float _2862 = sqrt(_2858);
        float _2864 = precise::min(_2862, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2866 = _2864 * _2842;
        float _2868 = _2866 * _2860;
        float _2870 = fma(_2846, _2868, _2458);
        float _2872 = fma(_2850, _2868, _2464);
        float _2874 = fma(_2856, _2868, _2476);
        _2826 = _2870;
        _2828 = _2872;
        _2830 = _2874;
        _2522 = _2860;
    }
    float _2876 = _2826;
    float _2878 = _2828;
    float _2880 = _2830;
    float _2882 = _2522;
    float _2884 = _2882;
    if (!_2708)
    {
        float _2886 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2888 = _2886 * 0.15915493667125701904296875;
        float _2890 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2892 = _2888 * 6.283185482025146484375;
        float _2894 = cos(_2892);
        float _2896 = _2890 * 0.15915493667125701904296875;
        float _2898 = _2888 * 6.283185482025146484375;
        float _2900 = sin(_2898);
        float _2902 = 1.0 / _2894;
        float _2904 = _2896 * 6.283185482025146484375;
        float _2906 = cos(_2904);
        float _2908 = _2900 * _2902;
        float _2910 = _2896 * 6.283185482025146484375;
        float _2912 = sin(_2910);
        float _2914 = _2906 * _2908;
        float _2916 = 1.0 / _2914;
        float _2918 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2920 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2918;
        float _2922 = 1.0 / _2920;
        float _2924 = _2912 * _2916;
        float _2926 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2928 = fma(_2836, _2924, _2926);
        float _2930 = _2928 * _2922;
        float _2932 = precise::clamp(_2930, 0.0, 1.0);
        _2838 = _2932;
    }
    float _2934 = _2838;
    float _2936 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2938 = _2876 + _2936;
    float _2940 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2942 = _2878 + _2940;
    float _2944 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2946 = _2880 + _2944;
    float _2948 = _2938 * _2938;
    float _2950 = fma(_2942, _2942, _2948);
    float _2952 = fma(_2946, _2946, _2950);
    float _2954 = rsqrt(_2952);
    float _2956 = sqrt(_2952);
    float _2958 = _2954 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2960 = _2942 * _2958;
    float _2962 = _2946 * _2958;
    float _2964 = _2960 * _2960;
    float _2966 = _2962 * _2962;
    float _2968 = _2964 + _2966;
    float _2970 = sqrt(_2968);
    bool _2972 = _2970 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2974 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2976 = _2970 + _2974;
    float _2978 = _2946;
    float _2980 = _2968;
    float _2982 = _2976;
    float _2984 = _2938;
    if (_2972)
    {
        float _2986 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2978 = _2986;
    }
    float _2988 = _2978;
    if (_2972)
    {
        float _2990 = rsqrt(_2968);
        _2980 = _2990;
    }
    float _2992 = _2980;
    if (_2972)
    {
        float _2994 = _2976 * _2988;
        _2982 = _2994;
    }
    float _2996 = _2982;
    if (_2972)
    {
        float _2998 = _2996 * 0.15915493667125701904296875;
        _2884 = _2998;
    }
    float _3000 = _2884;
    float _3002 = _2954;
    float _3004 = _3000;
    if (_2972)
    {
        float _3006 = _3000 * 6.283185482025146484375;
        float _3008 = sin(_3006);
        _3002 = _3008;
    }
    float _3010 = _3002;
    float _3012 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3014 = precise::max(0.0, _3012);
    float _3016 = _2948;
    float _3018 = _3014;
    if (_2972)
    {
        float _3020 = _3000 * 6.283185482025146484375;
        float _3022 = cos(_3020);
        _3016 = _3022;
    }
    float _3024 = _3016;
    float _3026 = -_2958;
    float _3028 = -_3014;
    float _3030 = fma(_2938, _3026, _3028);
    if (!_2972)
    {
        _2984 = _2962;
    }
    float _3032 = _2984;
    float _3034 = fma(_2464, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3036 = _3032;
    if (_2972)
    {
        float _3038 = _3030 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3018 = _3038;
    }
    float _3040 = _3018;
    float _3042 = _3040;
    if (!_2972)
    {
        _3004 = _2964;
    }
    float _3044 = _3004;
    float _3046 = _3010;
    float _3048 = _3044;
    if (_2972)
    {
        float _3050 = fma(_3010, _3040, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3046 = _3050;
    }
    float _3052 = _3046;
    float _3054 = _3052;
    if (!_2972)
    {
        _3042 = _3030;
    }
    float _3056 = _3042;
    float _3058 = _3056;
    if (_2972)
    {
        float _3060 = _3024 + (-1.0);
        _2510 = _3060;
    }
    float _3062 = _2510;
    float _3064 = _3062;
    if (_2972)
    {
        float _3066 = _2992 * _3052;
        _231 = _3066;
    }
    float _3068 = _231;
    if (!_2972)
    {
        _3054 = _2960;
    }
    float _3070 = _3054;
    float _3072 = _3070;
    if (_2972)
    {
        float _3074 = _3062 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1962 = _3074;
    }
    float _3076 = _1962;
    if (_2972)
    {
        float _3078 = _2960 * _3068;
        _3072 = _3078;
    }
    float _3080 = _3072;
    if (_2972)
    {
        float _3082 = _2962 * _3068;
        _3036 = _3082;
    }
    float _3084 = _3036;
    if (!_2972)
    {
        _3064 = _2966;
    }
    float _3086 = _3064;
    float _3088 = _3086;
    if (_2972)
    {
        float _3090 = fma(_3030, _3024, _3076);
        _3058 = _3090;
    }
    float _3092 = _3058;
    if (_2972)
    {
        float _3094 = _3080 * _3080;
        _3048 = _3094;
    }
    float _3096 = _3048;
    if (_2972)
    {
        float _3098 = _3084 * _3084;
        _3088 = _3098;
    }
    float _3100 = _3088;
    float _3102 = floor(_3034);
    float _3104 = fma(_3092, _3092, _3096);
    float _3106 = _2876 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3108 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3110 = fma(_2956, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3108);
    float _3112 = precise::clamp(_3110, 0.0, 1.0);
    float _3114 = _3104 + _3100;
    float _3116 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3106);
    float _3118 = -_3112;
    float _3120 = _3118 + 1.0;
    float _3122 = rsqrt(_3114);
    float _3124 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3116);
    float _3126 = _3124 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3128 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3130 = abs(_3120);
    float _3132 = log2(_3130);
    float _3134 = _3126 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3136 = fma(_2476, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3138 = _2876 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3140 = _2876 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3142 = -_3134;
    float _3144 = fma(_3142, _3128, 1.0);
    float _3146 = _2876 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3148 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3138);
    float _3150 = _3122 * _3080;
    float _3152 = _3122 * _3092;
    float _3154 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3146);
    float _3156 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3148);
    float _3158 = _3122 * _3084;
    float _3160 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3140);
    float _3162 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3154);
    float _3164 = _3156 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3166 = _3150 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3168 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3160);
    float _3170 = _3162 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3172 = floor(_3136);
    float _3174 = -_3166;
    float _3176 = fma(_3152, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3174);
    float _3178 = _3168 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3180 = _3170 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3182 = -_3102;
    float _3184 = _3034 + _3182;
    float _3186 = -_3158;
    float _3188 = fma(_3186, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3176);
    float _3190 = _3170 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3192 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3180);
    float _3194 = log2(_3144);
    float _3196 = fma(_3188, -0.5, 0.5);
    float _3198 = fma(_3188, 0.5, 0.5);
    float _3200 = fma(_3126, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3192);
    float _3202 = _3170 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3204 = _3132 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3206 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3190);
    float _3208 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3200);
    float _3210 = sqrt(_3196);
    float _3212 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3202);
    float _3214 = -_3172;
    float _3216 = _3136 + _3214;
    float _3218 = _3152 + 1.0;
    float _3220 = fma(_3198, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3222 = fma(_3126, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3212);
    float _3224 = _3194 * 0.693147182464599609375;
    float _3226 = 1.0 / _3208;
    float _3228 = fma(_3198, _3220, -0.212114393711090087890625);
    float _3230 = fma(_3126, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3206);
    float _3232 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3222);
    float _3234 = _3224 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3236 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3230);
    float _3238 = exp2(_3204);
    float _3240 = _3210 * 0.636619746685028076171875;
    float _3242 = _3236 * _3226;
    float _3244 = fma(_3198, _3228, 1.570728778839111328125);
    float _3246 = _3232 * _3226;
    float _3248 = fma(_3242, 0.5, 0.5);
    float2 _8657 = float2(_3184, _3216);
    float _3250 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8657, float2(0.0), isnan(_8657)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8657, float2(0.0), isnan(_8657)), level(0.0)).x;
    float _3252 = fma(_3246, -0.5, 0.5);
    float _3254 = -_3244;
    float _3256 = fma(_3240, _3254, 1.0);
    float _3258 = -_3152;
    float _3260 = fma(_3238, _3218, _3258);
    float3 _8681 = float3(_3248, _3252, _3234);
    float _3262 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8681, float3(0.0), isnan(_8681)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8681, float3(0.0), isnan(_8681)), level(0.0)).x;
    float _3264 = fma(_3260, 0.5, 0.5);
    float3 _8694 = float3(_3248, _3252, _3234);
    float4 _3267 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8694, float3(0.0), isnan(_8694)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8694, float3(0.0), isnan(_8694)), level(0.0)).xyzw;
    float _3269 = _3267.x;
    float _3271 = _3267.y;
    float _3273 = _3267.z;
    float _3275 = _3267.w;
    float2 _8710 = float2(_3256, _3264);
    float3 _3279 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8710, float2(0.0), isnan(_8710)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8710, float2(0.0), isnan(_8710)), level(0.0)).xyz;
    float _3281 = _3279.x;
    float _3283 = _3279.y;
    float _3285 = _3279.z;
    float _3287 = abs(_2836);
    float _3289 = log2(_3287);
    float _3291 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3293 = _3132 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3295 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3297 = fma(_3291, _3291, 1.0);
    out.m_76.x = _2878;
    out.m_76.y = _2876;
    out.m_76.z = _2880;
    bool _3299 = _2956 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3301 = isnan(_2956);
    bool _3303 = _3299 || _3301;
    bool _3305 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3307 = _3303 || _3305;
    float _3309 = exp2(_3293);
    float _3311 = _3289 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3313 = rsqrt(_3297);
    float _3315 = -_3309;
    float _3317 = _3315 + 1.0;
    float _3319 = exp2(_3311);
    float _3321 = fma(_3319, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3323 = precise::clamp(_3321, 0.0, 1.0);
    float _3325 = fma(_3323, -2.0, 3.0);
    float _3327 = _3323 * _3323;
    float _3329 = _3327 * _3325;
    float _3331 = _3170 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3333 = _3291 * _3313;
    float _3335 = -_3329;
    float _3337 = _3335 + 1.0;
    out.m_78.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_78.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_78.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    float _3339 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3331);
    float _3341 = fma(_3337, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3329);
    float _3343 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _3345 = _3333 * _3343;
    float _3347 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _3349 = _3333 * _3347;
    float _3351 = fma(_3126, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3339);
    float _3353 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _3355 = _3333 * _3353;
    float _3357 = fma(_3313, (*spvDescriptorSet0.vp_c8)._m0[25].y, _3345);
    float _3359 = fma(_3313, (*spvDescriptorSet0.vp_c8)._m0[24].y, _3349);
    float _3361 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3351);
    float _3363 = _3291 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3365 = in.m_80.x;
    bool _3367 = _2836 <= 8000.0;
    bool _3369 = isnan(_2836);
    bool _3371 = _3367 || _3369;
    bool _3373 = isnan(8000.0);
    bool _3375 = _3371 || _3373;
    float _3377 = float(_3375);
    float _3379 = _3291 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3381 = _3317 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3383 = _3291 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3385 = _3377 * _3341;
    float _3387 = fma(_3295, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3363);
    out.gl_Position.x = _3236;
    out.gl_Position.y = _3232;
    out.gl_Position.z = _3361;
    out.gl_Position.w = _3208;
    float _3389 = fma(_3295, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3379);
    float _3391 = _3385 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3393 = _3361 + _3208;
    float _3395 = fma(_3295, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3383);
    float _3397 = fma(_3313, (*spvDescriptorSet0.vp_c8)._m0[26].y, _3355);
    float _3399 = _3393 * 0.5;
    float _3401 = _3393;
    float _3403 = _3389;
    float _3405 = _3208;
    float _3407 = _3359;
    if (!_3307)
    {
        _3401 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3409 = _3401;
    out.m_82.x = _3359;
    out.m_82.y = _3357;
    out.m_82.z = _3397;
    float _3411 = -_3381;
    float _3413 = _3411 + 1.0;
    float _3415 = _3389 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _3417 = _3395 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_84.z = _3399;
    out.m_84.w = _3208;
    float _3419 = _3409;
    float _3421 = _3409;
    if (!_3307)
    {
        _3403 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3423 = _3403;
    float _3425 = _3423;
    float _3427 = _3423;
    if (!_3307)
    {
        _3405 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3429 = _3405;
    float _3431 = _3429;
    float _3433 = _3429;
    if (!_3307)
    {
        _3407 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3435 = _3407;
    float _3437 = -_3250;
    float _3439 = _3437 + 1.0;
    float _3441 = _3439 * _3391;
    float _3443 = precise::clamp(_3441, 0.0, 1.0);
    float _3445 = _3381 * _3262;
    float _3447 = -_3443;
    float _3449 = fma(_3447, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3451 = _3275 * _3445;
    float _3453 = _3449 * _3365;
    float _3455 = _3285 * _3445;
    float _3457 = fma(_3281, _3451, _3269);
    float _3459 = fma(_3283, _3451, _3271);
    float _3461 = _3275 * _3413;
    float _3463 = fma(_3275, _3455, _3273);
    float _3465 = _3387 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _3467 = _3453 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3469 = _2934 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3471 = _3453;
    float _3473 = _3467;
    float _3475 = _3435;
    float _3477 = _3435;
    if (!_3307)
    {
        _3471 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3479 = _3471;
    out.m_86.x = _3457;
    out.m_86.y = _3459;
    out.m_86.z = _3463;
    out.m_86.w = _3461;
    out.m_88.x = _3465;
    out.m_88.y = _3415;
    out.m_88.z = _3417;
    out.m_90.x = _3467;
    float _3481 = _3479;
    float _3483 = _3479;
    if (!_3307)
    {
        _3473 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3485 = _3473;
    bool _3487 = !_3307;
    float _3489 = _3485;
    float _3491 = _3485;
    if (!_3487)
    {
        bool _3493 = _2956 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3495 = isnan(_2956);
        bool _3497 = _3493 || _3495;
        bool _3499 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3501 = _3497 || _3499;
        if (!_3501)
        {
            float _3503 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3505 = _2956 + _3503;
            float _3507 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3509 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3507;
            float _3511 = 1.0 / _3509;
            float _3513 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3515 = _3513 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3517 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3519 = _3517 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3521 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3523 = _3521 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3525 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3527 = _3525 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3529 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3531 = _3529 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3533 = _3505 * _3511;
            float _3535 = precise::clamp(_3533, 0.0, 1.0);
            float _3537 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3539 = _3537 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3541 = fma(_3535, _3515, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3543 = fma(_3535, _3539, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3545 = fma(_3535, _3519, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3547 = fma(_3535, _3523, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3549 = fma(_3535, _3527, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3551 = fma(_3535, _3531, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3477 = _3541;
            _3433 = _3549;
            _3427 = _3543;
            _3421 = _3547;
            _3483 = _3545;
            _3491 = _3551;
            _3553 = true;
        }
        else
        {
            bool _3555 = _2956 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3557 = isnan(_2956);
            bool _3559 = _3555 || _3557;
            bool _3561 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3563 = _3559 || _3561;
            if (!_3563)
            {
                _3425 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3565 = _3425;
            _3427 = _3565;
            if (!_3563)
            {
                _3475 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3567 = _3475;
            _3477 = _3567;
            if (!_3563)
            {
                _3481 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3569 = _3481;
            _3483 = _3569;
            if (!_3563)
            {
                _3419 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3571 = _3419;
            _3421 = _3571;
            if (!_3563)
            {
                _3431 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3573 = _3431;
            _3433 = _3573;
            if (!_3563)
            {
                _3489 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3575 = _3489;
            bool _3577 = !_3563;
            _3491 = _3575;
            if (!_3577)
            {
                bool _3579 = _2956 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3581 = isnan(_2956);
                bool _3583 = _3579 || _3581;
                bool _3585 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3587 = _3583 || _3585;
                if (!_3587)
                {
                    float _3589 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3591 = _2956 + _3589;
                    float _3593 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3595 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3593;
                    float _3597 = 1.0 / _3595;
                    float _3599 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3601 = _3599 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3603 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3605 = _3603 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3607 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3609 = _3607 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3611 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3613 = _3611 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3615 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3617 = _3615 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3619 = _3591 * _3597;
                    float _3621 = precise::clamp(_3619, 0.0, 1.0);
                    float _3623 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3625 = _3623 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3627 = fma(_3621, _3601, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3629 = fma(_3621, _3625, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3631 = fma(_3621, _3605, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3633 = fma(_3621, _3609, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3635 = fma(_3621, _3613, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3637 = fma(_3621, _3617, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3477 = _3627;
                    _3433 = _3635;
                    _3427 = _3629;
                    _3421 = _3633;
                    _3483 = _3631;
                    _3491 = _3637;
                    _3553 = true;
                }
                else
                {
                    _3477 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3433 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3427 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3421 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3483 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3491 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3553 = false;
    float _3639 = _3477;
    float _3641 = _3433;
    float _3643 = _3427;
    float _3645 = _3421;
    float _3647 = _3483;
    float _3649 = _3491;
    float _3651 = fma(_3415, -0.5, 0.5);
    float _3653 = precise::clamp(_3651, 0.0, 1.0);
    float _3655 = -_3639;
    float _3657 = _3655 + _3641;
    float _3659 = _3469 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3661 = -_3643;
    float _3663 = _3661 + _3645;
    out.m_92.x = 0.0;
    float _3665 = fma(_3653, _3657, _3639);
    float _3667 = fma(_3653, _3663, _3643);
    out.m_49.x = _3659;
    float _3669 = -_3647;
    float _3671 = _3669 + _3649;
    float _3673 = _3665 * 0.586610972881317138671875;
    bool _3675 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3677 = fma(_3653, _3671, _3647);
    float _3679 = fma(_3667, 0.298911988735198974609375, _3673);
    bool _3681 = _2934 > 0.0;
    bool _3683 = isnan(_2934);
    bool _3685 = _3681 || _3683;
    bool _3687 = isnan(0.0);
    bool _3689 = _3685 || _3687;
    float _3691 = fma(_3677, 0.114477999508380889892578125, _3679);
    float _3693 = -_3691;
    float _3695 = _3667 + _3693;
    float _3697 = -_3691;
    float _3699 = _3665 + _3697;
    float _3701 = -_3691;
    float _3703 = _3677 + _3701;
    float _3705 = fma(_3695, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3691);
    float _3707 = fma(_3699, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3691);
    float _3709 = fma(_3703, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3691);
    bool _3711 = !_3675;
    if (!_3711)
    {
        float _3713 = -_2876;
        float _3715 = _3713 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3717 = -_2878;
        float _3719 = _3717 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3721 = -_2880;
        float _3723 = _3721 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3725 = _3715 * _3715;
        float _3727 = fma(_3719, _3719, _3725);
        float _3729 = fma(_3723, _3723, _3727);
        float _3731 = sqrt(_3729);
        float _3733 = rsqrt(_3729);
        float _3735 = -_3731;
        float _3737 = _3735 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3739 = _3737 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3741 = precise::clamp(_3739, 0.0, 1.0);
        float _3743 = _3719 * _3733;
        float _3745 = _3715 * _3733;
        float _3747 = abs(_3741);
        float _3749 = log2(_3747);
        float _3751 = _3723 * _3733;
        float _3753 = _3743 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3755 = _3415 * _3745;
        float _3757 = -_3745;
        float _3759 = -_3753;
        float _3761 = fma(_3757, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3759);
        float _3763 = fma(_3465, _3743, _3755);
        float _3765 = -_3751;
        float _3767 = fma(_3765, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3761);
        float _3769 = fma(_3417, _3751, _3763);
        float _3771 = precise::clamp(_3769, 0.0, 1.0);
        float _3773 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3775 = _3767 + _3773;
        float _3777 = _3749 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3779 = _3775 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3781 = precise::clamp(_3779, 0.0, 1.0);
        float _3783 = exp2(_3777);
        float _3785 = _3783 * _3781;
        float _3787 = _3771 * _3785;
        float _3789 = _3787 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3791 = _3787 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3793 = _3787 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _3789;
        out.m_92.y = _3791;
        out.m_92.z = _3793;
    }
    out.m_94.x = _3705;
    out.m_94.y = _3707;
    out.m_94.z = _3709;
    if (_3689)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3795 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3795;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

