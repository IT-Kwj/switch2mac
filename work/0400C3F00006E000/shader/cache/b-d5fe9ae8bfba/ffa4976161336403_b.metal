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
    float4 m_66 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_92 [[user(locn2)]];
    float4 m_70 [[user(locn3)]];
    float4 m_74 [[user(locn4)]];
    float4 m_76 [[user(locn5)]];
    float4 m_82 [[user(locn6)]];
    float4 m_86 [[user(locn7)]];
    float4 m_78 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_90 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 m_47 [[user(locn12)]];
    float4 m_88 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_56 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
    float4 m_44 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_62 [[attribute(8)]];
    float4 m_64 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2800 = false;
    bool _699 = false;
    bool _587 = false;
    bool _255 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_44.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_47.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3089 = as_type<float>(_127);
        out.gl_Position.z = _3089;
    }
    if (!_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = in.m_49.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = 0.0;
    float _149 = _145;
    if (_141)
    {
        float _151 = float(_111);
        _147 = _151;
    }
    float _153 = _147;
    bool _155 = _145 >= _153;
    bool _157 = !_141;
    bool _159 = _155 || _157;
    if (_159)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _121;
    if (_159)
    {
        out.m_47.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3158 = as_type<float>(_165);
        out.gl_Position.z = _3158;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = in.m_54.x;
    float _171 = in.m_54.y;
    float _173 = in.m_54.z;
    float _175 = in.m_56.x;
    float _177 = in.m_56.y;
    float _179 = in.m_56.z;
    float _181 = in.m_58.x;
    float _183 = in.m_58.y;
    float _185 = in.m_58.z;
    float _187 = in.m_60.x;
    float _189 = in.m_60.y;
    float _191 = in.m_60.z;
    int _193 = as_type<int>(_167) & 1;
    bool _195 = _193 != 0;
    int _197 = as_type<int>(_167) & 2;
    bool _199 = _197 != 0;
    bool _201 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _203 = !_199;
    float _205 = _203 ? (-0.5) : 0.5;
    float _207 = _171 * _177;
    float _209 = _171 * _183;
    float _211 = fma(_169, _175, _207);
    float _213 = _171 * _189;
    float _215 = fma(_169, _181, _209);
    float _217 = fma(_173, _179, _211);
    bool _219 = !_195;
    float _221 = _219 ? (-0.5) : 0.5;
    float _223 = fma(_169, _187, _213);
    float _225 = fma(_173, _185, _215);
    float _227 = fma(_173, _191, _223);
    bool _229 = !_201;
    float _231 = _191;
    float _233 = _187;
    float _235 = _217;
    float _253;
    if (!_229)
    {
        float _237 = in.m_62.x;
        float _239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _241 = _237 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _245 = _243 * _239;
        float _247 = floor(_245);
        float _249 = -_247;
        float _251 = _245 + _249;
        _253 = _251;
        _255 = true;
    }
    else
    {
        float _257 = float(_111);
        float _259 = 1.0 / _257;
        float _261 = _145 * _259;
        _253 = _261;
    }
    _255 = false;
    float _263 = _253;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = _263 + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _271 = _263 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _277 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _287 = _285 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _289 = 1.0 / _275;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _297 = _295 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _299 = 1.0 / _283;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = _263 + _301;
    bool _305 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _307 = 1.0 / _293;
    float _309 = _303 * _289;
    bool _311 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _313 = isnan(_263);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _323;
    float _327 = fma(_325, _309, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _329 = 1.0 / _279;
    float _331 = _267 * _299;
    bool _333 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _335 = isnan(_263);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _347 = _263 + _345;
    float _349 = 1.0 / _287;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _353 = _263 + _351;
    float _355 = 1.0 / _297;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _359 = _263 + _357;
    float _361 = _353 * _329;
    bool _363 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _365 = isnan(_263);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = _359 * _307;
    bool _377 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _379 = isnan(_263);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = _271 * _349;
    float _391 = -_321;
    float _393 = _391 + 1.0;
    bool _395 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _397 = isnan(_263);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = -_387;
    float _409 = _407 + 1.0;
    float _411 = _343 * _393;
    float _413 = -_343;
    float _415 = _413 + 1.0;
    float _417 = _347 * _355;
    float _419 = -_405;
    float _421 = _419 + 1.0;
    float _423 = _387 * _415;
    float _425 = _405 * _409;
    bool _427 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _429 = isnan(_263);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = _373 * _421;
    bool _441 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _443 = isnan(_263);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _453;
    float _457 = -_373;
    float _459 = _457 + 1.0;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _465 = -_437;
    float _467 = _465 + 1.0;
    float _469 = fma(_455, _309, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _471 = _437 * _459;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _477;
    float _481 = _451 * _467;
    float _483 = -_451;
    float _485 = _483 + 1.0;
    float _487 = fma(_475, _331, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _489 = fma(_479, _331, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _491 = _469 * _481;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _497 = _327 * _481;
    float _499 = fma(_463, _361, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _501 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[143].x, _491);
    float _503 = fma(_495, _361, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _505 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[143].y, _497);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _515 = fma(_499, _471, _501);
    float _517 = fma(_503, _471, _505);
    float _519 = fma(_509, _389, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _521 = fma(_513, _389, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _523;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _527;
    float _531 = fma(_487, _439, _515);
    float _533 = fma(_489, _439, _517);
    float _535 = fma(_525, _375, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _541 = fma(_529, _375, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _547 = fma(_519, _425, _531);
    float _549 = fma(_521, _425, _533);
    float _551 = fma(_539, _417, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _553 = fma(_545, _417, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _555 = fma(_535, _423, _547);
    float _557 = fma(_541, _423, _549);
    float _559 = fma(_551, _411, _555);
    float _561 = fma(_553, _411, _557);
    float _563 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[149].x, _559);
    float _565 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[149].y, _561);
    bool _567 = !_305;
    float _585;
    if (!_567)
    {
        float _569 = in.m_62.x;
        float _571 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _573 = _569 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _575 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _577 = _575 * _571;
        float _579 = floor(_577);
        float _581 = -_579;
        float _583 = _577 + _581;
        _585 = _583;
        _587 = true;
    }
    else
    {
        float _589 = float(_111);
        float _591 = 1.0 / _589;
        float _593 = _145 * _591;
        _585 = _593;
    }
    _587 = false;
    float _595 = _585;
    float _597 = in.m_64.x;
    float _599 = in.m_64.y;
    bool _601 = _595 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _603 = isnan(_595);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _609 = _605 || _607;
    int _611 = _609 ? 1065353216 : 0;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _617 = _595 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _619 = isnan(_595);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _629;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _635 = _595 + _633;
    float _637 = -as_type<float>(_611);
    float _639 = _637 + 1.0;
    bool _641 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _643 = 1.0 / _615;
    float _645 = _627 * _639;
    float _647 = -_627;
    float _649 = _647 + 1.0;
    float _651 = _565 * _599;
    float _653 = _563 * _597;
    float _655 = _631 * _643;
    float _657 = fma(_655, _635, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _659 = _657 * _645;
    float _661 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[115].x, _659);
    float _663 = fma(as_type<float>(_611), (*spvDescriptorSet0.vp_c9)._m0[116].x, _661);
    float _665 = _663 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.w = _665;
    bool _667 = !_641;
    float _669 = _659;
    int _671 = as_type<int>(_645);
    int _673 = _611;
    int _675 = as_type<int>(_665);
    int _677 = as_type<int>(_643);
    float _679 = _599;
    float _697;
    if (!_667)
    {
        float _681 = in.m_62.x;
        float _683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _685 = _681 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[11].w, _145);
        float _689 = _687 * _683;
        float _691 = floor(_689);
        float _693 = -_691;
        float _695 = _689 + _693;
        _669 = _691;
        _697 = _695;
        _699 = true;
    }
    else
    {
        float _701 = float(_111);
        float _703 = 1.0 / _701;
        float _705 = _145 * _703;
        _697 = _705;
    }
    _699 = false;
    float _707 = _669;
    float _709 = _697;
    int _711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _713 = _711 != 0;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _717 = _707;
    float _719 = _655;
    if (_713)
    {
        float _721 = in.m_62.x;
        float _723 = in.m_62.y;
        float _725 = in.m_62.z;
        _715 = _721;
        _717 = _723;
        _719 = _725;
    }
    float _727 = _715;
    float _729 = _717;
    float _731 = _719;
    if (_713)
    {
        _671 = 0;
    }
    int _733 = _671;
    float _735 = _731;
    float _737 = _729;
    int _739 = _733;
    float _741 = _727;
    if (_713)
    {
        _673 = as_type<int>(_727);
    }
    int _743 = _673;
    int _745 = _743;
    if (_713)
    {
        _675 = as_type<int>(_729);
    }
    int _747 = _675;
    int _749 = _747;
    if (_713)
    {
        _677 = as_type<int>(_731);
    }
    int _751 = _677;
    int _753 = _751;
    if (!_713)
    {
        float _755 = in.m_62.x;
        float _757 = in.m_62.y;
        float _759 = in.m_62.z;
        float _761 = _755 * 3.1415927410125732421875;
        float _763 = _761 * 0.15915493667125701904296875;
        float _765 = _757 * 3.1415927410125732421875;
        float _767 = _765 * 0.15915493667125701904296875;
        float _769 = _759 * 3.1415927410125732421875;
        float _771 = _763 * 6.283185482025146484375;
        float _773 = sin(_771);
        float _775 = _769 * 0.15915493667125701904296875;
        float _777 = _767 * 6.283185482025146484375;
        float _779 = sin(_777);
        float _781 = _775 * 6.283185482025146484375;
        float _783 = sin(_781);
        _735 = _759;
        _737 = _757;
        _739 = 1;
        _741 = _755;
        _753 = as_type<int>(_783);
        _749 = as_type<int>(_779);
        _745 = as_type<int>(_773);
    }
    float _785 = _735;
    float _787 = _737;
    int _789 = _739;
    float _791 = _741;
    int _793 = _753;
    int _795 = _749;
    int _797 = _745;
    float _799 = _785 * 2.0;
    float _801 = _787 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _803 = _789 != 1;
    float _805 = _787 + _785;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _809 = floor(_799);
    float _811 = _791 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _813 = fma(_801, -2.0, _807);
    bool _815 = !_803;
    float _817 = _815 ? as_type<float>(_793) : as_type<float>(_795);
    float _819 = _791 * 2.0;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _823 = _805 + (-1.0);
    float _825 = -_821;
    float _827 = fma(_811, 2.0, _825);
    float _829 = floor(_819);
    bool _831 = _787 > 0.5;
    float _833 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _835 = !_803;
    float _837 = _835 ? as_type<float>(_795) : as_type<float>(_797);
    float _839 = _787 * 2.0;
    float _841 = -_221;
    int _843 = _831 ? as_type<int>(_841) : as_type<int>(_221);
    float _845 = -_145;
    float _847 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[76].x, _827);
    bool _849 = _809 > 0.0;
    float _851 = floor(_839);
    bool _853 = _809 >= 0.0;
    bool _855 = isnan(_809);
    bool _857 = _853 || _855;
    bool _859 = isnan(0.0);
    bool _861 = _857 || _859;
    float _863 = _651 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _865 = _823;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    float _869 = as_type<float>(_795);
    float _871 = _809;
    if (!_803)
    {
        _679 = _791;
    }
    float _873 = _679;
    float _875 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _879 = _877 != 0;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _883 = _881 != 0;
    float _885 = _873;
    if (!_803)
    {
        _865 = _787;
    }
    float _887 = _865;
    float _889 = _887;
    if (!_803)
    {
        _867 = _787;
    }
    float _891 = _867;
    float _893 = _891;
    if (!_803)
    {
        _869 = _785;
    }
    float _895 = _869;
    float _897 = _895;
    if (!_803)
    {
        _871 = _785;
    }
    float _899 = _871;
    bool _901 = _829 > 0.0;
    float _903 = _899;
    if (_803)
    {
        _885 = _785;
    }
    float _905 = _885;
    if (_803)
    {
        _889 = _791;
    }
    float _907 = _889;
    if (_803)
    {
        _893 = _791;
    }
    float _909 = _893;
    if (_803)
    {
        _897 = _787;
    }
    float _911 = _897;
    if (_803)
    {
        _903 = _787;
    }
    float _913 = _903;
    bool _915 = _785 > 0.5;
    bool _917 = !_879;
    float _919 = _917 ? _221 : as_type<float>(_843);
    bool _921 = _829 >= 0.0;
    bool _923 = isnan(_829);
    bool _925 = _921 || _923;
    bool _927 = isnan(0.0);
    bool _929 = _925 || _927;
    float _931 = -_205;
    int _933 = _915 ? as_type<int>(_931) : as_type<int>(_205);
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _937 = _929 ? 0 : 1;
    bool _939 = !_883;
    float _941 = _939 ? _205 : as_type<float>(_933);
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    int _945 = _861 ? 0 : 1;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _949 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _951 = _949 != 0;
    int _953 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _955 = _953 != 0;
    int _957 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _959 = _957 != 0;
    float _961 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[98].w, _943);
    int _963 = ~_937;
    int _965 = _963 + 1;
    int _967 = _965 + 1;
    float _969 = _817 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _971 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[83].z, _947);
    int _973 = _967;
    bool _975 = _831;
    float _977 = _941;
    if (!_901)
    {
        int _979 = ~_937;
        int _981 = _979 + 1;
        _973 = _981;
    }
    int _983 = _973;
    float _985 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[83].w, _935);
    float _987 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _989 = log2(_987);
    bool _991 = !_955;
    int _993 = _991 ? 0 : 1;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    bool _999 = _851 > 0.0;
    float _1001 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[98].z, _995);
    int _1003 = abs(_993);
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _1007 = _837 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _1009 = fma(_969, -2.0, _997);
    float _1011 = _911 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1013 = _851 >= 0.0;
    bool _1015 = isnan(_851);
    bool _1017 = _1013 || _1015;
    bool _1019 = isnan(0.0);
    bool _1021 = _1017 || _1019;
    float _1023 = -_1005;
    float _1025 = fma(_1007, 2.0, _1023);
    float _1027 = _907 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1029 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    int _1031 = _1021 ? 0 : 1;
    float _1033 = _989 * _145;
    float _1035 = float(_983);
    float _1037 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1029);
    float _1039 = float(_1003);
    float _1041 = exp2(_1033);
    float _1043 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _813);
    int _1045 = ~_1031;
    int _1047 = _1045 + 1;
    int _1049 = _1047 + 1;
    float _1051 = _1039 * _1035;
    int _1053 = _1049;
    if (!_999)
    {
        int _1055 = ~_1031;
        int _1057 = _1055 + 1;
        _1053 = _1057;
    }
    int _1059 = _1053;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1063 = ~_945;
    int _1065 = _1063 + 1;
    int _1067 = _1065 + 1;
    float _1069 = in.m_68.x;
    float _1071 = in.m_68.y;
    float _1073 = in.m_68.z;
    int _1075 = _1067;
    if (!_849)
    {
        int _1077 = ~_945;
        int _1079 = _1077 + 1;
        _1075 = _1079;
    }
    int _1081 = _1075;
    float _1083 = fma(_1011, -2.0, _1061);
    float _1085 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[97].z, _1001);
    float _1087 = _1051 * (-2.0);
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1091 = 1.0 + _1089;
    bool _1093 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1095 = isnan(1.0);
    bool _1097 = _1093 || _1095;
    bool _1099 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1101 = _1097 || _1099;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1105 = -_1041;
    float _1107 = _1105 + 1.0;
    float _1109 = 1.0 / _1091;
    float _1111 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1113 = -_1103;
    float _1115 = fma(_1027, 2.0, _1113);
    float _1117 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[96].y, _1009);
    bool _1119 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1121 = isnan(0.0);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1127 = _1123 || _1125;
    float _1129 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1111);
    float _1131 = _787 + (-0.5);
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1135 = _1127 ? _1107 : 0.0;
    float _1137 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _971);
    float _1139 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _985);
    float _1141 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1133);
    float _1143 = fma(_1087, _1071, _1071);
    bool _1145 = !_951;
    int _1147 = _1145 ? 0 : 1;
    float _1149 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1129);
    float _1151 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1141);
    float _1153 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[97].w, _961);
    float _1155 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1037);
    float _1157 = -_145;
    float _1159 = fma(_1157, (*spvDescriptorSet0.vp_c9)._m0[96].x, _1025);
    float _1161 = -_145;
    float _1163 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1115);
    float _1165 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1083);
    if (_1101)
    {
        float _1167 = _1135 * _1109;
        _149 = _1167;
    }
    float _1169 = _149;
    float _1171 = fma(_833, _1087, _833);
    float _1173 = fma(_1131, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1143);
    bool _1175 = !_959;
    int _1177 = _1175 ? 0 : 1;
    float _1179 = _787 + _791;
    int _1181 = abs(_1147);
    float _1183 = _791 + _785;
    int _1185 = abs(_1177);
    float _1187 = _1179 + (-1.0);
    float _1189 = _1183 + (-1.0);
    float _1191 = float(_1081);
    float _1193 = _785 + (-0.5);
    float _1195 = float(_1181);
    float _1197 = fma(_1171, _1169, _1173);
    float _1199 = float(_1059);
    float _1201 = float(_1185);
    float _1203 = _1195 * _1191;
    float _1205 = _1197 * 0.15915493667125701904296875;
    float _1207 = _1201 * _1199;
    float _1209 = _1203 * (-2.0);
    float _1211 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1213 = _1205 * 6.283185482025146484375;
    float _1215 = sin(_1213);
    float _1217 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1219 = _1207 * (-2.0);
    float _1221 = fma(_1209, _1069, _1069);
    float _1223 = _791 + (-0.5);
    float _1225 = fma(_1217, _1209, _1217);
    float _1227 = fma(_1219, _1073, _1073);
    float _1229 = fma(_1211, _1219, _1211);
    float _1231 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1221);
    float _1233 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1227);
    float _1235 = in.m_44.x;
    float _1237 = in.m_44.y;
    float _1239 = in.m_44.z;
    float _1241 = fma(_1225, _1169, _1231);
    float _1243 = fma(_1229, _1169, _1233);
    float _1245 = _1205 * 6.283185482025146484375;
    float _1247 = cos(_1245);
    float _1249 = _1241 * 0.15915493667125701904296875;
    float _1251 = _653 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1253 = _1243 * 0.15915493667125701904296875;
    float _1255 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _1257 = _1249 * 6.283185482025146484375;
    float _1259 = sin(_1257);
    float _1261 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _1263 = _1251 * _1255;
    float _1265 = _863 * _1261;
    float _1267 = _1253 * 6.283185482025146484375;
    float _1269 = cos(_1267);
    float _1271 = _177 * _1237;
    float _1273 = _189 * _1237;
    float _1275 = _1249 * 6.283185482025146484375;
    float _1277 = cos(_1275);
    float _1279 = _1259 * _1215;
    float _1281 = _1259 * _1247;
    float _1283 = fma(_175, _1235, _1271);
    float _1285 = fma(_187, _1235, _1273);
    float _1287 = in.m_58.w;
    float _1289 = fma(_179, _1239, _1283);
    float _1291 = _1253 * 6.283185482025146484375;
    float _1293 = sin(_1291);
    float _1295 = _1259 * _1269;
    float _1297 = _1247 * _1269;
    float _1299 = in.m_56.w;
    float _1301 = _1277 * _1247;
    float _1303 = _1277 * _1215;
    float _1305 = _1277 * _1269;
    float _1307 = _1215 * _1269;
    float _1309 = _1305 * _1265;
    float _1311 = fma(_1293, _1301, _1279);
    float _1313 = -_1265;
    float _1315 = _1293 * _1313;
    float _1317 = -_1281;
    float _1319 = fma(_1293, _1303, _1317);
    float _1321 = -_1303;
    float _1323 = fma(_1293, _1281, _1321);
    float _1325 = fma(_1311, _1263, _1309);
    float _1327 = _1295 * _1265;
    float _1329 = fma(_1297, _1263, _1315);
    float _1331 = fma(_1293, _1279, _1301);
    float _1333 = fma(_1319, _875, _1325);
    float _1335 = fma(_1323, _1263, _1327);
    float _1337 = fma(_1307, _875, _1329);
    float _1339 = _183 * _1237;
    float _1341 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1343 = fma(_1331, _875, _1335);
    float _1345 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1347 = fma(_181, _1235, _1339);
    float _1349 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1341);
    float _1351 = _1289 + _1299;
    float _1353 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1345);
    float _1355 = fma(_185, _1239, _1347);
    float _1357 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1349);
    float _1359 = in.m_60.w;
    float _1361 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1353);
    float _1363 = _1355 + _1287;
    float _1365 = _1357 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1367 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1369 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1371 = _1351 + _1365;
    float _1373 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1367);
    float _1375 = _1363 + _1369;
    float _1377 = fma(_191, _1239, _1285);
    float _1379 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1381 = _1371 + _1379;
    float _1383 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1373);
    float _1385 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1387 = _1375 + _1385;
    float _1389 = _1381 * _1381;
    float _1391 = _1383 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1393 = fma(_1387, _1387, _1389);
    float _1395 = sqrt(_1393);
    float _1397 = _1377 + _1359;
    float _1399 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1401 = _1397 + _1391;
    float _1403 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1399);
    float _1405 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1403);
    bool _1407 = _1395 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1409 = _1235;
    float _1411 = _1395;
    float _1413 = _1359;
    if (!_1407)
    {
        _1409 = _1375;
    }
    float _1415 = _1409;
    float _1417 = _1415;
    if (!_1407)
    {
        _231 = _1371;
    }
    float _1419 = _231;
    float _1421 = _1419;
    if (!_1407)
    {
        _233 = _1401;
    }
    float _1423 = _233;
    bool _1425 = !_1407;
    float _1427 = _1423;
    if (!_1425)
    {
        float _1429 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1431 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1433 = _1395 + _1431;
        float _1435 = rsqrt(_1393);
        float _1437 = _1433 * _1429;
        float _1439 = _1401 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1441 = _1437 * 0.15915493667125701904296875;
        float _1443 = _1441 * 6.283185482025146484375;
        float _1445 = cos(_1443);
        float _1447 = _1441 * 6.283185482025146484375;
        float _1449 = sin(_1447);
        float _1451 = _1445 + (-1.0);
        float _1453 = fma(_1449, _1439, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1455 = _1451 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1457 = _1435 * _1453;
        float _1459 = fma(_1401, _1445, _1455);
        float _1461 = fma(_1387, _1457, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1463 = fma(_1381, _1457, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1427 = _1459;
        _1417 = _1461;
        _1421 = _1463;
    }
    float _1465 = _1427;
    float _1467 = _1417;
    float _1469 = _1421;
    float _1471 = -_1397;
    float _1473 = _1471 + _1465;
    float _1475 = _1405 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1477 = -_1363;
    float _1479 = _1477 + _1467;
    float _1481 = -_1351;
    float _1483 = _1481 + _1469;
    float _1485 = _1473 * _1473;
    float _1487 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1489 = 1.0 / _1475;
    float _1491 = fma(_1479, _1479, _1485);
    float _1493 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1487);
    bool _1495 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1497 = isnan(0.5);
    bool _1499 = _1495 || _1497;
    bool _1501 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1503 = _1499 || _1501;
    float _1505 = fma(_1483, _1483, _1491);
    float _1507 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1493);
    bool _1509 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1511 = isnan(0.5);
    bool _1513 = _1509 || _1511;
    bool _1515 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1517 = _1513 || _1515;
    float _1519 = sqrt(_1505);
    float _1521 = _1507 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1523 = _1521 + _1475;
    float _1525 = _1523 * _1489;
    float _1527 = _1525 * 0.5;
    bool _1529 = _1519 > 0.0;
    float _1531 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1533 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1531);
    float _1535 = 1.0 / _1533;
    bool _1537 = !_1529;
    float _1539 = _1467;
    float _1541 = _1465;
    float _1543 = _1469;
    float _1545 = _1479;
    float _1547 = _1473;
    float _1549 = _1505;
    bool _1551 = _1503;
    if (!_1537)
    {
        float _1553 = _227 * _227;
        float _1555 = rsqrt(_1505);
        float _1557 = fma(_225, _225, _1553);
        float _1559 = fma(_217, _217, _1557);
        float _1561 = sqrt(_1559);
        float _1563 = _1479 * _1555;
        float _1565 = _1483 * _1555;
        bool _1567 = _1561 > 0.0;
        float _1569 = _1473 * _1555;
        bool _1571 = !_1567;
        if (!_1571)
        {
            float _1573 = rsqrt(_1559);
            float _1575 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1577 = _227 * _1573;
            float _1579 = _225 * _1573;
            float _1581 = _1569 * _1577;
            float _1583 = _217 * _1573;
            float _1585 = fma(_1563, _1579, _1581);
            float _1587 = _1575 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1589 = fma(_1565, _1583, _1585);
            float _1591 = _1589 * _1587;
            float _1593 = fma(_225, _1591, _1467);
            float _1595 = fma(_227, _1591, _1465);
            float _1597 = fma(_217, _1591, _1469);
            _1539 = _1593;
            _1541 = _1595;
            _1543 = _1597;
            _1545 = _1591;
        }
    }
    float _1599 = _1539;
    float _1601 = _1541;
    float _1603 = _1543;
    float _1605 = _1545;
    float _1607 = _1605;
    if (_1517)
    {
        _235 = 1.0;
    }
    float _1609 = _235;
    float _1611 = _1609;
    if (_1503)
    {
        _1547 = _1599;
    }
    float _1613 = _1547;
    float _1615 = _1613;
    if (_1503)
    {
        _1549 = _1601;
    }
    float _1617 = _1549;
    float _1619 = _1617;
    if (_1503)
    {
        _1411 = _1603;
    }
    float _1621 = _1411;
    float _1623 = _1621;
    if (!_1503)
    {
        float _1625 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1627 = _1397 + _1625;
        float _1629 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1631 = _1363 + _1629;
        float _1633 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1635 = -_1397;
        float _1637 = _1635 + _1601;
        float _1639 = _1627 * _1627;
        float _1641 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1643 = _1351 + _1641;
        float _1645 = fma(_1631, _1631, _1639);
        float _1647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1649 = fma(_1643, _1643, _1645);
        float _1651 = sqrt(_1649);
        float _1653 = _1633 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1655 = precise::min(_1651, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1657 = _1655 * _1647;
        float _1659 = -_1363;
        float _1661 = _1659 + _1599;
        float _1663 = _1653 * _1657;
        float _1665 = -_1351;
        float _1667 = _1665 + _1603;
        float _1669 = fma(_1661, _1663, _1363);
        float _1671 = fma(_1637, _1663, _1397);
        float _1673 = fma(_1667, _1663, _1351);
        _1607 = _1633;
        _1619 = _1671;
        _1615 = _1669;
        _1623 = _1673;
    }
    float _1675 = _1607;
    float _1677 = _1619;
    float _1679 = _1615;
    float _1681 = _1623;
    float _1683 = _1675;
    if (_1517)
    {
        _1413 = 1.0;
    }
    float _1685 = _1413;
    float _1687 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1689 = _1535 * _1687;
    float _1691 = _1685;
    if (!_1517)
    {
        float _1693 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1695 = _1693 * 0.15915493667125701904296875;
        float _1697 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1699 = _1695 * 6.283185482025146484375;
        float _1701 = cos(_1699);
        float _1703 = _1697 * 0.15915493667125701904296875;
        float _1705 = _1695 * 6.283185482025146484375;
        float _1707 = sin(_1705);
        float _1709 = 1.0 / _1701;
        float _1711 = _1703 * 6.283185482025146484375;
        float _1713 = cos(_1711);
        float _1715 = _1707 * _1709;
        float _1717 = _1703 * 6.283185482025146484375;
        float _1719 = sin(_1717);
        float _1721 = _1713 * _1715;
        float _1723 = 1.0 / _1721;
        float _1725 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1727 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1725;
        float _1729 = 1.0 / _1727;
        float _1731 = _1719 * _1723;
        float _1733 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1735 = fma(_1689, _1731, _1733);
        float _1737 = _1735 * _1729;
        float _1739 = precise::clamp(_1737, 0.0, 1.0);
        _1683 = _1735;
        _1611 = _1739;
    }
    float _1741 = _1683;
    float _1743 = _1611;
    float _1745 = _1741;
    if (!_1517)
    {
        float _1747 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1749 = _1747 * 0.15915493667125701904296875;
        float _1751 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1753 = _1749 * 6.283185482025146484375;
        float _1755 = cos(_1753);
        float _1757 = _1751 * 0.15915493667125701904296875;
        float _1759 = _1749 * 6.283185482025146484375;
        float _1761 = sin(_1759);
        float _1763 = 1.0 / _1755;
        float _1765 = _1757 * 6.283185482025146484375;
        float _1767 = cos(_1765);
        float _1769 = _1761 * _1763;
        float _1771 = _1757 * 6.283185482025146484375;
        float _1773 = sin(_1771);
        float _1775 = _1767 * _1769;
        float _1777 = 1.0 / _1775;
        float _1779 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1781 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1779;
        float _1783 = 1.0 / _1781;
        float _1785 = _1773 * _1777;
        float _1787 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1789 = fma(_1689, _1785, _1787);
        float _1791 = _1789 * _1783;
        float _1793 = precise::clamp(_1791, 0.0, 1.0);
        float _1795 = -_1793;
        float _1797 = _1795 + 1.0;
        _1745 = _1763;
        _1691 = _1797;
    }
    float _1799 = _1745;
    float _1801 = _1691;
    float _1803 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1805 = _1677 + _1803;
    float _1807 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1809 = _1679 + _1807;
    float _1811 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1813 = _1681 + _1811;
    float _1815 = _1805 * _1805;
    float _1817 = fma(_1809, _1809, _1815);
    float _1819 = fma(_1813, _1813, _1817);
    float _1821 = rsqrt(_1819);
    float _1823 = sqrt(_1819);
    float _1825 = _1821 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1827 = _1809 * _1825;
    float _1829 = _1813 * _1825;
    float _1831 = _1827 * _1827;
    float _1833 = _1829 * _1829;
    float _1835 = _1831 + _1833;
    float _1837 = sqrt(_1835);
    bool _1839 = _1837 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1841 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1843 = _1837 + _1841;
    float _1845 = _1813;
    float _1847 = _1835;
    float _1849 = _1843;
    float _1851 = _1799;
    float _1853 = _1825;
    if (_1839)
    {
        float _1855 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1845 = _1855;
    }
    float _1857 = _1845;
    if (_1839)
    {
        float _1859 = rsqrt(_1835);
        _1847 = _1859;
    }
    float _1861 = _1847;
    if (_1839)
    {
        float _1863 = _1843 * _1857;
        _1849 = _1863;
    }
    float _1865 = _1849;
    if (_1839)
    {
        float _1867 = _1865 * 0.15915493667125701904296875;
        _1851 = _1867;
    }
    float _1869 = _1851;
    float _1871 = _1815;
    float _1873 = _1869;
    if (_1839)
    {
        float _1875 = _1869 * 6.283185482025146484375;
        float _1877 = sin(_1875);
        _1871 = _1877;
    }
    float _1879 = _1871;
    float _1881 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1883 = precise::max(0.0, _1881);
    float _1885 = _1821;
    float _1887 = _1883;
    float _1889 = _1881;
    if (_1839)
    {
        float _1891 = _1869 * 6.283185482025146484375;
        float _1893 = cos(_1891);
        _1885 = _1893;
    }
    float _1895 = _1885;
    float _1897 = -_1825;
    float _1899 = -_1883;
    float _1901 = fma(_1805, _1897, _1899);
    float _1903 = _1901;
    if (!_1839)
    {
        _1887 = _1827;
    }
    float _1905 = _1887;
    float _1907 = _1905;
    if (_1839)
    {
        float _1909 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1889 = _1909;
    }
    float _1911 = _1889;
    float _1913 = _1879;
    float _1915 = _1911;
    if (_1839)
    {
        float _1917 = fma(_1879, _1911, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1913 = _1917;
    }
    float _1919 = _1913;
    float _1921 = _1919;
    float _1923 = _1895;
    if (_1839)
    {
        float _1925 = _1895 + (-1.0);
        _1915 = _1925;
    }
    float _1927 = _1915;
    float _1929 = _1927;
    if (_1839)
    {
        float _1931 = _1861 * _1919;
        _1853 = _1931;
    }
    float _1933 = _1853;
    if (!_1839)
    {
        _1921 = _1831;
    }
    float _1935 = _1921;
    float _1937 = _1935;
    if (_1839)
    {
        float _1939 = _1927 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1873 = _1939;
    }
    float _1941 = _1873;
    if (_1839)
    {
        float _1943 = _1827 * _1933;
        _1907 = _1943;
    }
    float _1945 = _1907;
    if (!_1839)
    {
        _1929 = _1829;
    }
    float _1947 = _1929;
    float _1949 = _1947;
    if (_1839)
    {
        float _1951 = _1829 * _1933;
        _1949 = _1951;
    }
    float _1953 = _1949;
    if (_1839)
    {
        float _1955 = fma(_1901, _1895, _1941);
        _1903 = _1955;
    }
    float _1957 = _1903;
    if (_1839)
    {
        float _1959 = _1945 * _1945;
        _1937 = _1959;
    }
    float _1961 = _1937;
    if (!_1839)
    {
        _1923 = _1833;
    }
    float _1963 = _1923;
    float _1965 = _1963;
    if (_1839)
    {
        float _1967 = _1953 * _1953;
        _1965 = _1967;
    }
    float _1969 = _1965;
    float _1971 = fma(_1957, _1957, _1961);
    float _1973 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1975 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1977 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1979 = _1971 + _1969;
    float _1981 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1973);
    float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1985 = fma(_1823, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1983);
    float _1987 = precise::clamp(_1985, 0.0, 1.0);
    float _1989 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1991 = rsqrt(_1979);
    float _1993 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1977);
    float _1995 = -_1987;
    float _1997 = _1995 + 1.0;
    float _1999 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1989);
    float _2001 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1981);
    float _2003 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2005 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1993);
    float _2007 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1999);
    float _2009 = abs(_1997);
    float _2011 = log2(_2009);
    float _2013 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2003);
    float _2015 = _2005 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2017 = _2007 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2019 = _2001 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2021 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2013);
    float _2023 = _2017 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2025 = _1991 * _1945;
    float _2027 = _1991 * _1957;
    float _2029 = _1991 * _1953;
    float _2031 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2023);
    float _2033 = _2025 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2035 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2037 = _2021 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2039 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2031);
    float _2041 = -_2033;
    float _2043 = fma(_2027, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2041);
    float _2045 = _2011 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2047 = -_2035;
    float _2049 = fma(_2047, _1975, 1.0);
    float _2051 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2039);
    float _2053 = -_2029;
    float _2055 = fma(_2053, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2043);
    float _2057 = exp2(_2045);
    float _2059 = _2017 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2061 = _2017 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2063 = fma(_2055, -0.5, 0.5);
    float _2065 = _2027 + 1.0;
    float _2067 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2059);
    float _2069 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2061);
    float _2071 = log2(_2049);
    float _2073 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2067);
    float _2075 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2069);
    float _2077 = 1.0 / _2051;
    float _2079 = fma(_2055, 0.5, 0.5);
    float _2081 = -_2027;
    float _2083 = fma(_2057, _2065, _2081);
    float _2085 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2073);
    float _2087 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2075);
    float _2089 = fma(_2079, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2091 = fma(_2083, 0.5, 0.5);
    float _2093 = sqrt(_2063);
    float _2095 = _2071 * 0.693147182464599609375;
    float _2097 = fma(_2079, _2089, -0.212114393711090087890625);
    float _2099 = _2095 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2101 = fma(_2079, _2097, 1.570728778839111328125);
    float _2103 = _2085 * _2077;
    float _2105 = _2087 * _2077;
    float _2107 = fma(_2105, -0.5, 0.5);
    float _2109 = _2093 * 0.636619746685028076171875;
    float _2111 = fma(_2103, 0.5, 0.5);
    float _2113 = -_2101;
    float _2115 = fma(_2109, _2113, 1.0);
    float3 _6174 = float3(_2111, _2107, _2099);
    float _2117 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6174, float3(0.0), isnan(_6174)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6174, float3(0.0), isnan(_6174)), level(0.0)).x;
    float3 _6185 = float3(_2111, _2107, _2099);
    float4 _2120 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6185, float3(0.0), isnan(_6185)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6185, float3(0.0), isnan(_6185)), level(0.0)).xyzw;
    float _2122 = _2120.x;
    float _2124 = _2120.y;
    float _2126 = _2120.z;
    float _2128 = _2120.w;
    float2 _6202 = float2(_2115, _2091);
    float3 _2132 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6202, float2(0.0), isnan(_6202)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6202, float2(0.0), isnan(_6202)), level(0.0)).xyz;
    float _2134 = _2132.x;
    float _2136 = _2132.y;
    float _2138 = _2132.z;
    int _2140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2142 = _2140 != 0;
    float _2144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2148 = _2146 != 0;
    float _2150 = _919 + 0.5;
    out.m_70.x = _1363;
    out.m_70.y = _1397;
    out.m_70.z = _1351;
    float _2152 = -_1137;
    float _2154 = _2152 + 1.0;
    float _2156 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2158 = _2156 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2160 = in.m_62.w;
    float _2162 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2164 = _2162 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2166 = _709 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2168 = isnan(_709);
    bool _2170 = _2166 || _2168;
    bool _2172 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2174 = _2170 || _2172;
    float _2176 = float(_2174);
    float _2178 = 1.0 / _2158;
    float _2180 = 0.0;
    float _2182 = _2085;
    if (_2142)
    {
        float _2184 = in.m_62.z;
        _2180 = _2184;
    }
    float _2186 = _2180;
    float _2188 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2190 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2188;
    bool _2192 = _791 > 0.5;
    float _2194 = -_2176;
    float _2196 = _2194 + 1.0;
    float _2198 = 0.0;
    if (_2148)
    {
        float _2200 = in.m_62.w;
        _2198 = _2200;
    }
    float _2202 = _2198;
    float _2204 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2206 = _2204 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2208 = -_221;
    int _2210 = _2192 ? as_type<int>(_2208) : as_type<int>(_221);
    float _2212 = 1.0 / _2164;
    bool _2214 = _709 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2216 = isnan(_709);
    bool _2218 = _2214 || _2216;
    bool _2220 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2222 = _2218 || _2220;
    float _2224 = float(_2222);
    float _2226 = -_1153;
    float _2228 = _2226 + 1.0;
    int _2230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2232 = _2230 != 0;
    float _2234 = _2011 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2236 = _2224 * _2196;
    float _2238 = -_2224;
    float _2240 = _2238 + 1.0;
    float _2242 = _2190 * _2178;
    float _2244 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2246 = _709 + _2244;
    float _2248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    bool _2250 = !_2232;
    float _2252 = _2250 ? _221 : as_type<float>(_2210);
    float _2254 = fma(_2242, _2246, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2256 = _709 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2258 = isnan(_709);
    bool _2260 = _2256 || _2258;
    bool _2262 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2264 = _2260 || _2262;
    float _2266 = float(_2264);
    bool _2268 = _2160 > 0.5;
    float _2270 = _2186;
    float _2272 = _2160;
    if (_2142)
    {
        float _2274 = _2186 * 3.1415927410125732421875;
        _2270 = _2274;
    }
    float _2276 = _2270;
    float _2278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2280 = _2254 * _2236;
    float _2282 = _2276;
    if (!_2142)
    {
        _2272 = _221;
    }
    float _2284 = _2272;
    float _2286 = _2284;
    if (_2142)
    {
        float _2288 = _2276 * 0.15915493667125701904296875;
        _2282 = _2288;
    }
    float _2290 = _2282;
    float _2292 = _2202;
    if (_2148)
    {
        float _2294 = _2202 * 3.1415927410125732421875;
        _2292 = _2294;
    }
    float _2296 = _2292;
    float _2298 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2300 = _709 + _2298;
    float _2302 = fma(_2240, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2280);
    float _2304 = -_2266;
    float _2306 = _2304 + 1.0;
    float _2308 = _2296;
    if (_2148)
    {
        float _2310 = _2296 * 0.15915493667125701904296875;
        _2308 = _2310;
    }
    float _2312 = _2308;
    float _2314 = _2290;
    if (_2142)
    {
        float _2316 = _2290 * 6.283185482025146484375;
        float _2318 = sin(_2316);
        _2314 = _2318;
    }
    float _2320 = _2314;
    float _2322 = _2206 * _2212;
    int _2324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2326 = _2324 != 0;
    float _2328 = _2176 * _2306;
    float _2330 = _2248 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _2332 = fma(_2322, _2300, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2334 = _2144 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2336 = _2252 + 0.5;
    float _2338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2340 = _2150 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2342 = fma(_2332, _2328, _2302);
    float _2344 = _2278 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2346 = fma(_2334, _2336, _847);
    float _2348 = fma(_2266, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2342);
    if (_2142)
    {
        bool _2350 = _2320 > 0.5;
        _1551 = _2350;
    }
    bool _2352 = _1551;
    float _2354 = _2312;
    if (_2148)
    {
        float _2356 = _2312 * 6.283185482025146484375;
        float _2358 = sin(_2356);
        _2354 = _2358;
    }
    float _2360 = _2354;
    float _2362 = -_205;
    int _2364 = _831 ? as_type<int>(_2362) : as_type<int>(_205);
    float _2366 = _2348 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_2142)
    {
        float _2368 = -_221;
        float _2370 = _2352 ? _2368 : _221;
        _2286 = _2370;
    }
    float _2372 = _2286;
    int _2374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2376 = _2374 != 0;
    int _2378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2380 = _2378 != 0;
    float _2382 = _1155 * (-0.15915493667125701904296875);
    bool _2384 = !_2376;
    float _2386 = _2384 ? _205 : as_type<float>(_2364);
    float _2388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2390 = _2372 + 0.5;
    out.m_72.w = _2366;
    float _2392 = _2386 + (-0.5);
    float _2394 = fma(_2330, _2390, _1159);
    if (_2148)
    {
        bool _2396 = _2360 > 0.5;
        _975 = _2396;
    }
    bool _2398 = _975;
    float _2400 = -_941;
    float _2402 = _2400 + 0.5;
    float _2404 = _2382 * 6.283185482025146484375;
    float _2406 = sin(_2404);
    float _2408 = -_2344;
    float _2410 = -_1043;
    float _2412 = fma(_2408, _2392, _2410);
    float _2414 = -_205;
    int _2416 = _2268 ? as_type<int>(_2414) : as_type<int>(_205);
    float _2418 = _2340 * _2338;
    if (!_2148)
    {
        _977 = _205;
    }
    float _2420 = _977;
    float _2422 = _2402 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2424 = _2420;
    if (_2148)
    {
        float _2426 = -_205;
        float _2428 = _2398 ? _2426 : _205;
        _2424 = _2428;
    }
    float _2430 = _2424;
    float _2432 = _2382 * 6.283185482025146484375;
    float _2434 = cos(_2432);
    float _2436 = _2422 * _2388;
    float _2438 = _2430 + (-0.5);
    out.m_74.x = _2418;
    out.m_74.y = _2436;
    float _2440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    bool _2442 = !_2326;
    float _2444 = _2442 ? _205 : as_type<float>(_2416);
    float _2446 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2448 = -_221;
    int _2450 = _915 ? as_type<int>(_2448) : as_type<int>(_221);
    bool _2452 = _1823 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2454 = isnan(_1823);
    bool _2456 = _2452 || _2454;
    bool _2458 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2460 = _2456 || _2458;
    float _2462 = _2444 * _2406;
    bool _2464 = !_2380;
    float _2466 = _2464 ? _221 : as_type<float>(_2450);
    float _2468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2470 = _2444 * _2434;
    float _2472 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2474 = -_2462;
    float _2476 = fma(_2466, _2434, _2474);
    float _2478 = fma(_2466, _2406, _2470);
    float _2480 = -_1085;
    float _2482 = _2480 + 1.0;
    float _2484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2486 = _2440 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _2488 = -_2482;
    float _2490 = fma(_2488, _2372, _2394);
    float _2492 = -_1149;
    float _2494 = _2492 + 1.0;
    float _2496 = -_1139;
    float _2498 = _2496 + 1.0;
    float _2500 = -_2486;
    float _2502 = -_1117;
    float _2504 = fma(_2500, _2438, _2502);
    float _2506 = _2476 + 0.5;
    float _2508 = _2478 + (-0.5);
    float _2510 = _2468 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2512 = fma(_2386, _2494, _2412);
    float _2514 = fma(_2228, _2430, _2504);
    float _2516 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2518 = fma(_2510, _2506, _1163);
    float _2520 = -_1151;
    float _2522 = _2520 + 1.0;
    float _2524 = exp2(_2234);
    out.m_76.x = _2490;
    out.m_76.y = _2514;
    float _2526 = _2484 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2528 = -_2522;
    float _2530 = fma(_2252, _2528, _2346);
    float _2532 = -_2154;
    float _2534 = fma(_2476, _2532, _2518);
    float _2536 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2538 = -_2526;
    float _2540 = -_1165;
    float _2542 = fma(_2538, _2508, _2540);
    float _2544 = -_1293;
    float _2546 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2516);
    float _2548 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2550 = -_1293;
    float _2552 = fma(_2550, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2536);
    float _2554 = fma(_2478, _2498, _2542);
    float _2556 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2558 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2560 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2562 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_78.x = _2530;
    out.m_78.y = _2512;
    out.m_78.z = _2534;
    out.m_78.w = _2554;
    float _2564 = -_1293;
    float _2566 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2548);
    float _2568 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2556);
    float _2570 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2558);
    float _2572 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2560);
    float _2574 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2562);
    float _2576 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2552);
    float _2578 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2546);
    float _2580 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2566);
    float _2582 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2570);
    float _2584 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2568);
    float _2586 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2574);
    float _2588 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2572);
    float _2590 = _2446 * _2576;
    float _2592 = fma(_2446, _2446, 1.0);
    float _2594 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2596 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2598 = -_2524;
    float _2600 = _2598 + 1.0;
    float _2602 = rsqrt(_2592);
    float _2604 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2594);
    float _2606 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2596);
    float _2608 = _2017 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2610 = fma(_2472, _2584, _2590);
    float _2612 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2604);
    float _2614 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2606);
    float _2616 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2608);
    out.m_80.x = _2584;
    out.m_80.y = _2582;
    out.m_80.z = _2586;
    float _2618 = _2446 * _2578;
    float _2620 = _2085 + _2051;
    float _2622 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2616);
    float _2624 = fma(_2472, _2582, _2618);
    float _2626 = _2620 * 0.5;
    float _2628 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2622);
    float _2630 = _2446 * _2602;
    float _2632 = _2628 + _2051;
    float _2634 = -_2588;
    float _2636 = _2630 * _2634;
    float _2638 = -_2612;
    float _2640 = _2630 * _2638;
    float _2642 = -_2614;
    float _2644 = _2630 * _2642;
    float _2646 = _2632 * 0.5;
    float _2648 = fma(_2602, _2576, _2636);
    float _2650 = fma(_2602, _2578, _2640);
    float _2652 = _2446 * _2580;
    float _2654 = fma(_2602, _2580, _2644);
    float _2656 = _2051 * 0.5;
    float _2658 = _2612 + _2624;
    float _2660 = fma(_2472, _2586, _2652);
    float _2662 = _2600 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2664 = fma(_2087, -0.5, _2656);
    out.m_82.x = _2648;
    out.m_82.y = _2650;
    out.m_82.z = _2654;
    float _2666 = _2588 + _2610;
    float _2668 = _2614 + _2660;
    float _2670 = _2660;
    if (!_2460)
    {
        _2670 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2672 = _2670;
    out.m_84.x = _2626;
    out.m_84.y = _2664;
    out.m_84.z = _2646;
    out.m_84.w = _2051;
    out.m_86.x = _2666;
    out.m_86.y = _2658;
    out.m_86.z = _2668;
    out.gl_Position.x = _2085;
    out.gl_Position.y = _2087;
    out.gl_Position.z = _2628;
    out.gl_Position.w = _2051;
    float _2674 = _2672;
    float _2676 = _2672;
    if (!_2460)
    {
        _2182 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2678 = _2182;
    float _2680 = _2662 * _2117;
    float _2682 = -_2662;
    float _2684 = _2682 + 1.0;
    float _2686 = _2128 * _2680;
    float _2688 = _2138 * _2680;
    float _2690 = _2128 * _2684;
    float _2692 = _1743 * _1801;
    float _2694 = fma(_2134, _2686, _2122);
    float _2696 = fma(_2136, _2686, _2124);
    float _2698 = fma(_2128, _2688, _2126);
    float _2700 = _2692 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2702 = _2124;
    float _2704 = _2122;
    float _2706 = _2686;
    float _2708 = _2692;
    float _2710 = _2678;
    float _2712 = _2678;
    if (!_2460)
    {
        _2702 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2714 = _2702;
    float _2716 = _2714;
    float _2718 = _2714;
    if (!_2460)
    {
        _2704 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2720 = _2704;
    out.m_88.x = _2694;
    out.m_88.y = _2696;
    out.m_88.z = _2698;
    out.m_88.w = _2690;
    float _2722 = _2720;
    float _2724 = _2720;
    if (!_2460)
    {
        _2706 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2726 = _2706;
    float _2728 = _2726;
    float _2730 = _2726;
    if (!_2460)
    {
        _2708 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2732 = _2708;
    bool _2734 = !_2460;
    float _2736 = _2732;
    float _2738 = _2732;
    if (!_2734)
    {
        bool _2740 = _1823 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2742 = isnan(_1823);
        bool _2744 = _2740 || _2742;
        bool _2746 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2748 = _2744 || _2746;
        if (!_2748)
        {
            float _2750 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2752 = _1823 + _2750;
            float _2754 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2756 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2754;
            float _2758 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2760 = _2758 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2762 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2764 = _2762 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2766 = 1.0 / _2756;
            float _2768 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2770 = _2768 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2772 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2774 = _2772 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2776 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2778 = _2776 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2780 = _2752 * _2766;
            float _2782 = precise::clamp(_2780, 0.0, 1.0);
            float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2786 = _2784 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2788 = fma(_2782, _2760, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2790 = fma(_2782, _2764, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2792 = fma(_2782, _2786, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2794 = fma(_2782, _2770, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2796 = fma(_2782, _2774, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2798 = fma(_2782, _2778, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2730 = _2788;
            _2712 = _2796;
            _2724 = _2790;
            _2676 = _2794;
            _2738 = _2792;
            _2718 = _2798;
            _2800 = true;
        }
        else
        {
            bool _2802 = _1823 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2804 = isnan(_1823);
            bool _2806 = _2802 || _2804;
            bool _2808 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2810 = _2806 || _2808;
            if (!_2810)
            {
                _2674 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2812 = _2674;
            _2676 = _2812;
            if (!_2810)
            {
                _2710 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2814 = _2710;
            _2712 = _2814;
            if (!_2810)
            {
                _2716 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2816 = _2716;
            _2718 = _2816;
            if (!_2810)
            {
                _2722 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2818 = _2722;
            _2724 = _2818;
            if (!_2810)
            {
                _2728 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2820 = _2728;
            _2730 = _2820;
            if (!_2810)
            {
                _2736 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2822 = _2736;
            bool _2824 = !_2810;
            _2738 = _2822;
            if (!_2824)
            {
                bool _2826 = _1823 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2828 = isnan(_1823);
                bool _2830 = _2826 || _2828;
                bool _2832 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2834 = _2830 || _2832;
                if (!_2834)
                {
                    float _2836 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2838 = _1823 + _2836;
                    float _2840 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2842 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2840;
                    float _2844 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2846 = _2844 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2848 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2850 = _2848 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2852 = 1.0 / _2842;
                    float _2854 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2856 = _2854 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2858 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2860 = _2858 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2862 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2864 = _2862 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2866 = _2838 * _2852;
                    float _2868 = precise::clamp(_2866, 0.0, 1.0);
                    float _2870 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2872 = _2870 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2874 = fma(_2868, _2846, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2876 = fma(_2868, _2850, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2878 = fma(_2868, _2872, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2880 = fma(_2868, _2856, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2882 = fma(_2868, _2860, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2884 = fma(_2868, _2864, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2730 = _2874;
                    _2712 = _2882;
                    _2724 = _2876;
                    _2676 = _2880;
                    _2738 = _2878;
                    _2718 = _2884;
                    _2800 = true;
                }
                else
                {
                    _2730 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2712 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2724 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2676 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2738 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2718 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2800 = false;
    float _2886 = _2730;
    float _2888 = _2712;
    float _2890 = _2724;
    float _2892 = _2676;
    float _2894 = _2738;
    float _2896 = _2718;
    float _2898 = _2700 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2900 = fma(_2658, -0.5, 0.5);
    float _2902 = precise::clamp(_2900, 0.0, 1.0);
    float _2904 = -_2886;
    float _2906 = _2888 + _2904;
    float _2908 = -_2890;
    float _2910 = _2892 + _2908;
    out.m_47.x = _2898;
    float _2912 = -_2894;
    float _2914 = _2896 + _2912;
    float _2916 = fma(_2902, _2906, _2886);
    float _2918 = fma(_2902, _2910, _2890);
    bool _2920 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2922 = _2916 * 0.586610972881317138671875;
    float _2924 = fma(_2902, _2914, _2894);
    out.m_90.x = 0.0;
    bool _2926 = _1743 > 0.0;
    bool _2928 = isnan(_1743);
    bool _2930 = _2926 || _2928;
    bool _2932 = isnan(0.0);
    bool _2934 = _2930 || _2932;
    float _2936 = fma(_2918, 0.298911988735198974609375, _2922);
    bool _2938 = _1801 <= 0.0;
    bool _2940 = !_2934;
    bool _2942 = _2938 || _2940;
    float _2944 = fma(_2924, 0.114477999508380889892578125, _2936);
    float _2946 = -_2944;
    float _2948 = _2918 + _2946;
    float _2950 = fma(_2948, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2944);
    bool _2952 = !_2920;
    if (!_2952)
    {
        float _2954 = -_1677;
        float _2956 = _2954 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2958 = -_1679;
        float _2960 = _2958 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2962 = -_1681;
        float _2964 = _2962 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2966 = _2956 * _2956;
        float _2968 = fma(_2960, _2960, _2966);
        float _2970 = fma(_2964, _2964, _2968);
        float _2972 = sqrt(_2970);
        float _2974 = rsqrt(_2970);
        float _2976 = -_2972;
        float _2978 = _2976 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2980 = _2978 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2982 = precise::clamp(_2980, 0.0, 1.0);
        float _2984 = _2960 * _2974;
        float _2986 = _2956 * _2974;
        float _2988 = abs(_2982);
        float _2990 = log2(_2988);
        float _2992 = _2964 * _2974;
        float _2994 = _2984 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2996 = _2658 * _2986;
        float _2998 = -_2986;
        float _3000 = -_2994;
        float _3002 = fma(_2998, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3000);
        float _3004 = fma(_2666, _2984, _2996);
        float _3006 = -_2992;
        float _3008 = fma(_3006, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3002);
        float _3010 = fma(_2668, _2992, _3004);
        float _3012 = precise::clamp(_3010, 0.0, 1.0);
        float _3014 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3016 = _3008 + _3014;
        float _3018 = _2990 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3020 = _3016 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3022 = precise::clamp(_3020, 0.0, 1.0);
        float _3024 = exp2(_3018);
        float _3026 = _3024 * _3022;
        float _3028 = _3012 * _3026;
        float _3030 = _3028 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        out.m_90.x = _3030;
    }
    out.m_92.x = _2950;
    if (!_2942)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _3032 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3032;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2800 = false;
    bool _699 = false;
    bool _587 = false;
    bool _255 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_44.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_47.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3089 = as_type<float>(_127);
        out.gl_Position.z = _3089;
    }
    if (!_115)
    {
        return out;
    }
    float _131 = in.m_49.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = 0.0;
    float _149 = _145;
    if (_141)
    {
        float _151 = float(_111);
        _147 = _151;
    }
    float _153 = _147;
    bool _155 = _145 >= _153;
    bool _157 = !_141;
    bool _159 = _155 || _157;
    if (_159)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _121;
    if (_159)
    {
        out.m_47.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3158 = as_type<float>(_165);
        out.gl_Position.z = _3158;
    }
    if (_159)
    {
        return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = in.m_54.x;
    float _171 = in.m_54.y;
    float _173 = in.m_54.z;
    float _175 = in.m_56.x;
    float _177 = in.m_56.y;
    float _179 = in.m_56.z;
    float _181 = in.m_58.x;
    float _183 = in.m_58.y;
    float _185 = in.m_58.z;
    float _187 = in.m_60.x;
    float _189 = in.m_60.y;
    float _191 = in.m_60.z;
    int _193 = as_type<int>(_167) & 1;
    bool _195 = _193 != 0;
    int _197 = as_type<int>(_167) & 2;
    bool _199 = _197 != 0;
    bool _201 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _203 = !_199;
    float _205 = _203 ? (-0.5) : 0.5;
    float _207 = _171 * _177;
    float _209 = _171 * _183;
    float _211 = fma(_169, _175, _207);
    float _213 = _171 * _189;
    float _215 = fma(_169, _181, _209);
    float _217 = fma(_173, _179, _211);
    bool _219 = !_195;
    float _221 = _219 ? (-0.5) : 0.5;
    float _223 = fma(_169, _187, _213);
    float _225 = fma(_173, _185, _215);
    float _227 = fma(_173, _191, _223);
    bool _229 = !_201;
    float _231 = _191;
    float _233 = _187;
    float _235 = _217;
    float _253;
    if (!_229)
    {
        float _237 = in.m_62.x;
        float _239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _241 = _237 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _245 = _243 * _239;
        float _247 = floor(_245);
        float _249 = -_247;
        float _251 = _245 + _249;
        _253 = _251;
        _255 = true;
    }
    else
    {
        float _257 = float(_111);
        float _259 = 1.0 / _257;
        float _261 = _145 * _259;
        _253 = _261;
    }
    _255 = false;
    float _263 = _253;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = _263 + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _271 = _263 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _277 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _287 = _285 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _289 = 1.0 / _275;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _297 = _295 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _299 = 1.0 / _283;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = _263 + _301;
    bool _305 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _307 = 1.0 / _293;
    float _309 = _303 * _289;
    bool _311 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _313 = isnan(_263);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _323;
    float _327 = fma(_325, _309, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _329 = 1.0 / _279;
    float _331 = _267 * _299;
    bool _333 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _335 = isnan(_263);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _347 = _263 + _345;
    float _349 = 1.0 / _287;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _353 = _263 + _351;
    float _355 = 1.0 / _297;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _359 = _263 + _357;
    float _361 = _353 * _329;
    bool _363 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _365 = isnan(_263);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = _359 * _307;
    bool _377 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _379 = isnan(_263);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = _271 * _349;
    float _391 = -_321;
    float _393 = _391 + 1.0;
    bool _395 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _397 = isnan(_263);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = -_387;
    float _409 = _407 + 1.0;
    float _411 = _343 * _393;
    float _413 = -_343;
    float _415 = _413 + 1.0;
    float _417 = _347 * _355;
    float _419 = -_405;
    float _421 = _419 + 1.0;
    float _423 = _387 * _415;
    float _425 = _405 * _409;
    bool _427 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _429 = isnan(_263);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = _373 * _421;
    bool _441 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _443 = isnan(_263);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _453;
    float _457 = -_373;
    float _459 = _457 + 1.0;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _465 = -_437;
    float _467 = _465 + 1.0;
    float _469 = fma(_455, _309, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _471 = _437 * _459;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _477;
    float _481 = _451 * _467;
    float _483 = -_451;
    float _485 = _483 + 1.0;
    float _487 = fma(_475, _331, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _489 = fma(_479, _331, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _491 = _469 * _481;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _497 = _327 * _481;
    float _499 = fma(_463, _361, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _501 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[143].x, _491);
    float _503 = fma(_495, _361, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _505 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[143].y, _497);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _515 = fma(_499, _471, _501);
    float _517 = fma(_503, _471, _505);
    float _519 = fma(_509, _389, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _521 = fma(_513, _389, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _523;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _527;
    float _531 = fma(_487, _439, _515);
    float _533 = fma(_489, _439, _517);
    float _535 = fma(_525, _375, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _541 = fma(_529, _375, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _547 = fma(_519, _425, _531);
    float _549 = fma(_521, _425, _533);
    float _551 = fma(_539, _417, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _553 = fma(_545, _417, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _555 = fma(_535, _423, _547);
    float _557 = fma(_541, _423, _549);
    float _559 = fma(_551, _411, _555);
    float _561 = fma(_553, _411, _557);
    float _563 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[149].x, _559);
    float _565 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[149].y, _561);
    bool _567 = !_305;
    float _585;
    if (!_567)
    {
        float _569 = in.m_62.x;
        float _571 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _573 = _569 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _575 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _577 = _575 * _571;
        float _579 = floor(_577);
        float _581 = -_579;
        float _583 = _577 + _581;
        _585 = _583;
        _587 = true;
    }
    else
    {
        float _589 = float(_111);
        float _591 = 1.0 / _589;
        float _593 = _145 * _591;
        _585 = _593;
    }
    _587 = false;
    float _595 = _585;
    float _597 = in.m_64.x;
    float _599 = in.m_64.y;
    bool _601 = _595 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _603 = isnan(_595);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _609 = _605 || _607;
    int _611 = _609 ? 1065353216 : 0;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _617 = _595 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _619 = isnan(_595);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _629;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _635 = _595 + _633;
    float _637 = -as_type<float>(_611);
    float _639 = _637 + 1.0;
    bool _641 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _643 = 1.0 / _615;
    float _645 = _627 * _639;
    float _647 = -_627;
    float _649 = _647 + 1.0;
    float _651 = _565 * _599;
    float _653 = _563 * _597;
    float _655 = _631 * _643;
    float _657 = fma(_655, _635, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _659 = _657 * _645;
    float _661 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[115].x, _659);
    float _663 = fma(as_type<float>(_611), (*spvDescriptorSet0.vp_c9)._m0[116].x, _661);
    float _665 = _663 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.w = _665;
    bool _667 = !_641;
    float _669 = _659;
    int _671 = as_type<int>(_645);
    int _673 = _611;
    int _675 = as_type<int>(_665);
    int _677 = as_type<int>(_643);
    float _679 = _599;
    float _697;
    if (!_667)
    {
        float _681 = in.m_62.x;
        float _683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _685 = _681 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[11].w, _145);
        float _689 = _687 * _683;
        float _691 = floor(_689);
        float _693 = -_691;
        float _695 = _689 + _693;
        _669 = _691;
        _697 = _695;
        _699 = true;
    }
    else
    {
        float _701 = float(_111);
        float _703 = 1.0 / _701;
        float _705 = _145 * _703;
        _697 = _705;
    }
    _699 = false;
    float _707 = _669;
    float _709 = _697;
    int _711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _713 = _711 != 0;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _717 = _707;
    float _719 = _655;
    if (_713)
    {
        float _721 = in.m_62.x;
        float _723 = in.m_62.y;
        float _725 = in.m_62.z;
        _715 = _721;
        _717 = _723;
        _719 = _725;
    }
    float _727 = _715;
    float _729 = _717;
    float _731 = _719;
    if (_713)
    {
        _671 = 0;
    }
    int _733 = _671;
    float _735 = _731;
    float _737 = _729;
    int _739 = _733;
    float _741 = _727;
    if (_713)
    {
        _673 = as_type<int>(_727);
    }
    int _743 = _673;
    int _745 = _743;
    if (_713)
    {
        _675 = as_type<int>(_729);
    }
    int _747 = _675;
    int _749 = _747;
    if (_713)
    {
        _677 = as_type<int>(_731);
    }
    int _751 = _677;
    int _753 = _751;
    if (!_713)
    {
        float _755 = in.m_62.x;
        float _757 = in.m_62.y;
        float _759 = in.m_62.z;
        float _761 = _755 * 3.1415927410125732421875;
        float _763 = _761 * 0.15915493667125701904296875;
        float _765 = _757 * 3.1415927410125732421875;
        float _767 = _765 * 0.15915493667125701904296875;
        float _769 = _759 * 3.1415927410125732421875;
        float _771 = _763 * 6.283185482025146484375;
        float _773 = sin(_771);
        float _775 = _769 * 0.15915493667125701904296875;
        float _777 = _767 * 6.283185482025146484375;
        float _779 = sin(_777);
        float _781 = _775 * 6.283185482025146484375;
        float _783 = sin(_781);
        _735 = _759;
        _737 = _757;
        _739 = 1;
        _741 = _755;
        _753 = as_type<int>(_783);
        _749 = as_type<int>(_779);
        _745 = as_type<int>(_773);
    }
    float _785 = _735;
    float _787 = _737;
    int _789 = _739;
    float _791 = _741;
    int _793 = _753;
    int _795 = _749;
    int _797 = _745;
    float _799 = _785 * 2.0;
    float _801 = _787 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _803 = _789 != 1;
    float _805 = _787 + _785;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _809 = floor(_799);
    float _811 = _791 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _813 = fma(_801, -2.0, _807);
    bool _815 = !_803;
    float _817 = _815 ? as_type<float>(_793) : as_type<float>(_795);
    float _819 = _791 * 2.0;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _823 = _805 + (-1.0);
    float _825 = -_821;
    float _827 = fma(_811, 2.0, _825);
    float _829 = floor(_819);
    bool _831 = _787 > 0.5;
    float _833 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _835 = !_803;
    float _837 = _835 ? as_type<float>(_795) : as_type<float>(_797);
    float _839 = _787 * 2.0;
    float _841 = -_221;
    int _843 = _831 ? as_type<int>(_841) : as_type<int>(_221);
    float _845 = -_145;
    float _847 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[76].x, _827);
    bool _849 = _809 > 0.0;
    float _851 = floor(_839);
    bool _853 = _809 >= 0.0;
    bool _855 = isnan(_809);
    bool _857 = _853 || _855;
    bool _859 = isnan(0.0);
    bool _861 = _857 || _859;
    float _863 = _651 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _865 = _823;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    float _869 = as_type<float>(_795);
    float _871 = _809;
    if (!_803)
    {
        _679 = _791;
    }
    float _873 = _679;
    float _875 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _879 = _877 != 0;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _883 = _881 != 0;
    float _885 = _873;
    if (!_803)
    {
        _865 = _787;
    }
    float _887 = _865;
    float _889 = _887;
    if (!_803)
    {
        _867 = _787;
    }
    float _891 = _867;
    float _893 = _891;
    if (!_803)
    {
        _869 = _785;
    }
    float _895 = _869;
    float _897 = _895;
    if (!_803)
    {
        _871 = _785;
    }
    float _899 = _871;
    bool _901 = _829 > 0.0;
    float _903 = _899;
    if (_803)
    {
        _885 = _785;
    }
    float _905 = _885;
    if (_803)
    {
        _889 = _791;
    }
    float _907 = _889;
    if (_803)
    {
        _893 = _791;
    }
    float _909 = _893;
    if (_803)
    {
        _897 = _787;
    }
    float _911 = _897;
    if (_803)
    {
        _903 = _787;
    }
    float _913 = _903;
    bool _915 = _785 > 0.5;
    bool _917 = !_879;
    float _919 = _917 ? _221 : as_type<float>(_843);
    bool _921 = _829 >= 0.0;
    bool _923 = isnan(_829);
    bool _925 = _921 || _923;
    bool _927 = isnan(0.0);
    bool _929 = _925 || _927;
    float _931 = -_205;
    int _933 = _915 ? as_type<int>(_931) : as_type<int>(_205);
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _937 = _929 ? 0 : 1;
    bool _939 = !_883;
    float _941 = _939 ? _205 : as_type<float>(_933);
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    int _945 = _861 ? 0 : 1;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _949 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _951 = _949 != 0;
    int _953 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _955 = _953 != 0;
    int _957 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _959 = _957 != 0;
    float _961 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[98].w, _943);
    int _963 = ~_937;
    int _965 = _963 + 1;
    int _967 = _965 + 1;
    float _969 = _817 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _971 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[83].z, _947);
    int _973 = _967;
    bool _975 = _831;
    float _977 = _941;
    if (!_901)
    {
        int _979 = ~_937;
        int _981 = _979 + 1;
        _973 = _981;
    }
    int _983 = _973;
    float _985 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[83].w, _935);
    float _987 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _989 = log2(_987);
    bool _991 = !_955;
    int _993 = _991 ? 0 : 1;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    bool _999 = _851 > 0.0;
    float _1001 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[98].z, _995);
    int _1003 = abs(_993);
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _1007 = _837 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _1009 = fma(_969, -2.0, _997);
    float _1011 = _911 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1013 = _851 >= 0.0;
    bool _1015 = isnan(_851);
    bool _1017 = _1013 || _1015;
    bool _1019 = isnan(0.0);
    bool _1021 = _1017 || _1019;
    float _1023 = -_1005;
    float _1025 = fma(_1007, 2.0, _1023);
    float _1027 = _907 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1029 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    int _1031 = _1021 ? 0 : 1;
    float _1033 = _989 * _145;
    float _1035 = float(_983);
    float _1037 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1029);
    float _1039 = float(_1003);
    float _1041 = exp2(_1033);
    float _1043 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _813);
    int _1045 = ~_1031;
    int _1047 = _1045 + 1;
    int _1049 = _1047 + 1;
    float _1051 = _1039 * _1035;
    int _1053 = _1049;
    if (!_999)
    {
        int _1055 = ~_1031;
        int _1057 = _1055 + 1;
        _1053 = _1057;
    }
    int _1059 = _1053;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1063 = ~_945;
    int _1065 = _1063 + 1;
    int _1067 = _1065 + 1;
    float _1069 = in.m_68.x;
    float _1071 = in.m_68.y;
    float _1073 = in.m_68.z;
    int _1075 = _1067;
    if (!_849)
    {
        int _1077 = ~_945;
        int _1079 = _1077 + 1;
        _1075 = _1079;
    }
    int _1081 = _1075;
    float _1083 = fma(_1011, -2.0, _1061);
    float _1085 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[97].z, _1001);
    float _1087 = _1051 * (-2.0);
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1091 = 1.0 + _1089;
    bool _1093 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1095 = isnan(1.0);
    bool _1097 = _1093 || _1095;
    bool _1099 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1101 = _1097 || _1099;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1105 = -_1041;
    float _1107 = _1105 + 1.0;
    float _1109 = 1.0 / _1091;
    float _1111 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1113 = -_1103;
    float _1115 = fma(_1027, 2.0, _1113);
    float _1117 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[96].y, _1009);
    bool _1119 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1121 = isnan(0.0);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1127 = _1123 || _1125;
    float _1129 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1111);
    float _1131 = _787 + (-0.5);
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1135 = _1127 ? _1107 : 0.0;
    float _1137 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _971);
    float _1139 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _985);
    float _1141 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1133);
    float _1143 = fma(_1087, _1071, _1071);
    bool _1145 = !_951;
    int _1147 = _1145 ? 0 : 1;
    float _1149 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1129);
    float _1151 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1141);
    float _1153 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[97].w, _961);
    float _1155 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1037);
    float _1157 = -_145;
    float _1159 = fma(_1157, (*spvDescriptorSet0.vp_c9)._m0[96].x, _1025);
    float _1161 = -_145;
    float _1163 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1115);
    float _1165 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1083);
    if (_1101)
    {
        float _1167 = _1135 * _1109;
        _149 = _1167;
    }
    float _1169 = _149;
    float _1171 = fma(_833, _1087, _833);
    float _1173 = fma(_1131, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1143);
    bool _1175 = !_959;
    int _1177 = _1175 ? 0 : 1;
    float _1179 = _787 + _791;
    int _1181 = abs(_1147);
    float _1183 = _791 + _785;
    int _1185 = abs(_1177);
    float _1187 = _1179 + (-1.0);
    float _1189 = _1183 + (-1.0);
    float _1191 = float(_1081);
    float _1193 = _785 + (-0.5);
    float _1195 = float(_1181);
    float _1197 = fma(_1171, _1169, _1173);
    float _1199 = float(_1059);
    float _1201 = float(_1185);
    float _1203 = _1195 * _1191;
    float _1205 = _1197 * 0.15915493667125701904296875;
    float _1207 = _1201 * _1199;
    float _1209 = _1203 * (-2.0);
    float _1211 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1213 = _1205 * 6.283185482025146484375;
    float _1215 = sin(_1213);
    float _1217 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1219 = _1207 * (-2.0);
    float _1221 = fma(_1209, _1069, _1069);
    float _1223 = _791 + (-0.5);
    float _1225 = fma(_1217, _1209, _1217);
    float _1227 = fma(_1219, _1073, _1073);
    float _1229 = fma(_1211, _1219, _1211);
    float _1231 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1221);
    float _1233 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1227);
    float _1235 = in.m_44.x;
    float _1237 = in.m_44.y;
    float _1239 = in.m_44.z;
    float _1241 = fma(_1225, _1169, _1231);
    float _1243 = fma(_1229, _1169, _1233);
    float _1245 = _1205 * 6.283185482025146484375;
    float _1247 = cos(_1245);
    float _1249 = _1241 * 0.15915493667125701904296875;
    float _1251 = _653 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1253 = _1243 * 0.15915493667125701904296875;
    float _1255 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _1257 = _1249 * 6.283185482025146484375;
    float _1259 = sin(_1257);
    float _1261 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _1263 = _1251 * _1255;
    float _1265 = _863 * _1261;
    float _1267 = _1253 * 6.283185482025146484375;
    float _1269 = cos(_1267);
    float _1271 = _177 * _1237;
    float _1273 = _189 * _1237;
    float _1275 = _1249 * 6.283185482025146484375;
    float _1277 = cos(_1275);
    float _1279 = _1259 * _1215;
    float _1281 = _1259 * _1247;
    float _1283 = fma(_175, _1235, _1271);
    float _1285 = fma(_187, _1235, _1273);
    float _1287 = in.m_58.w;
    float _1289 = fma(_179, _1239, _1283);
    float _1291 = _1253 * 6.283185482025146484375;
    float _1293 = sin(_1291);
    float _1295 = _1259 * _1269;
    float _1297 = _1247 * _1269;
    float _1299 = in.m_56.w;
    float _1301 = _1277 * _1247;
    float _1303 = _1277 * _1215;
    float _1305 = _1277 * _1269;
    float _1307 = _1215 * _1269;
    float _1309 = _1305 * _1265;
    float _1311 = fma(_1293, _1301, _1279);
    float _1313 = -_1265;
    float _1315 = _1293 * _1313;
    float _1317 = -_1281;
    float _1319 = fma(_1293, _1303, _1317);
    float _1321 = -_1303;
    float _1323 = fma(_1293, _1281, _1321);
    float _1325 = fma(_1311, _1263, _1309);
    float _1327 = _1295 * _1265;
    float _1329 = fma(_1297, _1263, _1315);
    float _1331 = fma(_1293, _1279, _1301);
    float _1333 = fma(_1319, _875, _1325);
    float _1335 = fma(_1323, _1263, _1327);
    float _1337 = fma(_1307, _875, _1329);
    float _1339 = _183 * _1237;
    float _1341 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1343 = fma(_1331, _875, _1335);
    float _1345 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1347 = fma(_181, _1235, _1339);
    float _1349 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1341);
    float _1351 = _1289 + _1299;
    float _1353 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1345);
    float _1355 = fma(_185, _1239, _1347);
    float _1357 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1349);
    float _1359 = in.m_60.w;
    float _1361 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1353);
    float _1363 = _1355 + _1287;
    float _1365 = _1357 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1367 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1369 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1371 = _1351 + _1365;
    float _1373 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1367);
    float _1375 = _1363 + _1369;
    float _1377 = fma(_191, _1239, _1285);
    float _1379 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1381 = _1371 + _1379;
    float _1383 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1373);
    float _1385 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1387 = _1375 + _1385;
    float _1389 = _1381 * _1381;
    float _1391 = _1383 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1393 = fma(_1387, _1387, _1389);
    float _1395 = sqrt(_1393);
    float _1397 = _1377 + _1359;
    float _1399 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1401 = _1397 + _1391;
    float _1403 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1399);
    float _1405 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1403);
    bool _1407 = _1395 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1409 = _1235;
    float _1411 = _1395;
    float _1413 = _1359;
    if (!_1407)
    {
        _1409 = _1375;
    }
    float _1415 = _1409;
    float _1417 = _1415;
    if (!_1407)
    {
        _231 = _1371;
    }
    float _1419 = _231;
    float _1421 = _1419;
    if (!_1407)
    {
        _233 = _1401;
    }
    float _1423 = _233;
    bool _1425 = !_1407;
    float _1427 = _1423;
    if (!_1425)
    {
        float _1429 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1431 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1433 = _1395 + _1431;
        float _1435 = rsqrt(_1393);
        float _1437 = _1433 * _1429;
        float _1439 = _1401 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1441 = _1437 * 0.15915493667125701904296875;
        float _1443 = _1441 * 6.283185482025146484375;
        float _1445 = cos(_1443);
        float _1447 = _1441 * 6.283185482025146484375;
        float _1449 = sin(_1447);
        float _1451 = _1445 + (-1.0);
        float _1453 = fma(_1449, _1439, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1455 = _1451 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1457 = _1435 * _1453;
        float _1459 = fma(_1401, _1445, _1455);
        float _1461 = fma(_1387, _1457, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1463 = fma(_1381, _1457, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1427 = _1459;
        _1417 = _1461;
        _1421 = _1463;
    }
    float _1465 = _1427;
    float _1467 = _1417;
    float _1469 = _1421;
    float _1471 = -_1397;
    float _1473 = _1471 + _1465;
    float _1475 = _1405 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1477 = -_1363;
    float _1479 = _1477 + _1467;
    float _1481 = -_1351;
    float _1483 = _1481 + _1469;
    float _1485 = _1473 * _1473;
    float _1487 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1489 = 1.0 / _1475;
    float _1491 = fma(_1479, _1479, _1485);
    float _1493 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1487);
    bool _1495 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1497 = isnan(0.5);
    bool _1499 = _1495 || _1497;
    bool _1501 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1503 = _1499 || _1501;
    float _1505 = fma(_1483, _1483, _1491);
    float _1507 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1493);
    bool _1509 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1511 = isnan(0.5);
    bool _1513 = _1509 || _1511;
    bool _1515 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1517 = _1513 || _1515;
    float _1519 = sqrt(_1505);
    float _1521 = _1507 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1523 = _1521 + _1475;
    float _1525 = _1523 * _1489;
    float _1527 = _1525 * 0.5;
    bool _1529 = _1519 > 0.0;
    float _1531 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1533 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1531);
    float _1535 = 1.0 / _1533;
    bool _1537 = !_1529;
    float _1539 = _1467;
    float _1541 = _1465;
    float _1543 = _1469;
    float _1545 = _1479;
    float _1547 = _1473;
    float _1549 = _1505;
    bool _1551 = _1503;
    if (!_1537)
    {
        float _1553 = _227 * _227;
        float _1555 = rsqrt(_1505);
        float _1557 = fma(_225, _225, _1553);
        float _1559 = fma(_217, _217, _1557);
        float _1561 = sqrt(_1559);
        float _1563 = _1479 * _1555;
        float _1565 = _1483 * _1555;
        bool _1567 = _1561 > 0.0;
        float _1569 = _1473 * _1555;
        bool _1571 = !_1567;
        if (!_1571)
        {
            float _1573 = rsqrt(_1559);
            float _1575 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1577 = _227 * _1573;
            float _1579 = _225 * _1573;
            float _1581 = _1569 * _1577;
            float _1583 = _217 * _1573;
            float _1585 = fma(_1563, _1579, _1581);
            float _1587 = _1575 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1589 = fma(_1565, _1583, _1585);
            float _1591 = _1589 * _1587;
            float _1593 = fma(_225, _1591, _1467);
            float _1595 = fma(_227, _1591, _1465);
            float _1597 = fma(_217, _1591, _1469);
            _1539 = _1593;
            _1541 = _1595;
            _1543 = _1597;
            _1545 = _1591;
        }
    }
    float _1599 = _1539;
    float _1601 = _1541;
    float _1603 = _1543;
    float _1605 = _1545;
    float _1607 = _1605;
    if (_1517)
    {
        _235 = 1.0;
    }
    float _1609 = _235;
    float _1611 = _1609;
    if (_1503)
    {
        _1547 = _1599;
    }
    float _1613 = _1547;
    float _1615 = _1613;
    if (_1503)
    {
        _1549 = _1601;
    }
    float _1617 = _1549;
    float _1619 = _1617;
    if (_1503)
    {
        _1411 = _1603;
    }
    float _1621 = _1411;
    float _1623 = _1621;
    if (!_1503)
    {
        float _1625 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1627 = _1397 + _1625;
        float _1629 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1631 = _1363 + _1629;
        float _1633 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1635 = -_1397;
        float _1637 = _1635 + _1601;
        float _1639 = _1627 * _1627;
        float _1641 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1643 = _1351 + _1641;
        float _1645 = fma(_1631, _1631, _1639);
        float _1647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1649 = fma(_1643, _1643, _1645);
        float _1651 = sqrt(_1649);
        float _1653 = _1633 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1655 = precise::min(_1651, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1657 = _1655 * _1647;
        float _1659 = -_1363;
        float _1661 = _1659 + _1599;
        float _1663 = _1653 * _1657;
        float _1665 = -_1351;
        float _1667 = _1665 + _1603;
        float _1669 = fma(_1661, _1663, _1363);
        float _1671 = fma(_1637, _1663, _1397);
        float _1673 = fma(_1667, _1663, _1351);
        _1607 = _1633;
        _1619 = _1671;
        _1615 = _1669;
        _1623 = _1673;
    }
    float _1675 = _1607;
    float _1677 = _1619;
    float _1679 = _1615;
    float _1681 = _1623;
    float _1683 = _1675;
    if (_1517)
    {
        _1413 = 1.0;
    }
    float _1685 = _1413;
    float _1687 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1689 = _1535 * _1687;
    float _1691 = _1685;
    if (!_1517)
    {
        float _1693 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1695 = _1693 * 0.15915493667125701904296875;
        float _1697 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1699 = _1695 * 6.283185482025146484375;
        float _1701 = cos(_1699);
        float _1703 = _1697 * 0.15915493667125701904296875;
        float _1705 = _1695 * 6.283185482025146484375;
        float _1707 = sin(_1705);
        float _1709 = 1.0 / _1701;
        float _1711 = _1703 * 6.283185482025146484375;
        float _1713 = cos(_1711);
        float _1715 = _1707 * _1709;
        float _1717 = _1703 * 6.283185482025146484375;
        float _1719 = sin(_1717);
        float _1721 = _1713 * _1715;
        float _1723 = 1.0 / _1721;
        float _1725 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1727 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1725;
        float _1729 = 1.0 / _1727;
        float _1731 = _1719 * _1723;
        float _1733 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1735 = fma(_1689, _1731, _1733);
        float _1737 = _1735 * _1729;
        float _1739 = precise::clamp(_1737, 0.0, 1.0);
        _1683 = _1735;
        _1611 = _1739;
    }
    float _1741 = _1683;
    float _1743 = _1611;
    float _1745 = _1741;
    if (!_1517)
    {
        float _1747 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1749 = _1747 * 0.15915493667125701904296875;
        float _1751 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1753 = _1749 * 6.283185482025146484375;
        float _1755 = cos(_1753);
        float _1757 = _1751 * 0.15915493667125701904296875;
        float _1759 = _1749 * 6.283185482025146484375;
        float _1761 = sin(_1759);
        float _1763 = 1.0 / _1755;
        float _1765 = _1757 * 6.283185482025146484375;
        float _1767 = cos(_1765);
        float _1769 = _1761 * _1763;
        float _1771 = _1757 * 6.283185482025146484375;
        float _1773 = sin(_1771);
        float _1775 = _1767 * _1769;
        float _1777 = 1.0 / _1775;
        float _1779 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1781 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1779;
        float _1783 = 1.0 / _1781;
        float _1785 = _1773 * _1777;
        float _1787 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1789 = fma(_1689, _1785, _1787);
        float _1791 = _1789 * _1783;
        float _1793 = precise::clamp(_1791, 0.0, 1.0);
        float _1795 = -_1793;
        float _1797 = _1795 + 1.0;
        _1745 = _1763;
        _1691 = _1797;
    }
    float _1799 = _1745;
    float _1801 = _1691;
    float _1803 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1805 = _1677 + _1803;
    float _1807 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1809 = _1679 + _1807;
    float _1811 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1813 = _1681 + _1811;
    float _1815 = _1805 * _1805;
    float _1817 = fma(_1809, _1809, _1815);
    float _1819 = fma(_1813, _1813, _1817);
    float _1821 = rsqrt(_1819);
    float _1823 = sqrt(_1819);
    float _1825 = _1821 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1827 = _1809 * _1825;
    float _1829 = _1813 * _1825;
    float _1831 = _1827 * _1827;
    float _1833 = _1829 * _1829;
    float _1835 = _1831 + _1833;
    float _1837 = sqrt(_1835);
    bool _1839 = _1837 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1841 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1843 = _1837 + _1841;
    float _1845 = _1813;
    float _1847 = _1835;
    float _1849 = _1843;
    float _1851 = _1799;
    float _1853 = _1825;
    if (_1839)
    {
        float _1855 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1845 = _1855;
    }
    float _1857 = _1845;
    if (_1839)
    {
        float _1859 = rsqrt(_1835);
        _1847 = _1859;
    }
    float _1861 = _1847;
    if (_1839)
    {
        float _1863 = _1843 * _1857;
        _1849 = _1863;
    }
    float _1865 = _1849;
    if (_1839)
    {
        float _1867 = _1865 * 0.15915493667125701904296875;
        _1851 = _1867;
    }
    float _1869 = _1851;
    float _1871 = _1815;
    float _1873 = _1869;
    if (_1839)
    {
        float _1875 = _1869 * 6.283185482025146484375;
        float _1877 = sin(_1875);
        _1871 = _1877;
    }
    float _1879 = _1871;
    float _1881 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1883 = precise::max(0.0, _1881);
    float _1885 = _1821;
    float _1887 = _1883;
    float _1889 = _1881;
    if (_1839)
    {
        float _1891 = _1869 * 6.283185482025146484375;
        float _1893 = cos(_1891);
        _1885 = _1893;
    }
    float _1895 = _1885;
    float _1897 = -_1825;
    float _1899 = -_1883;
    float _1901 = fma(_1805, _1897, _1899);
    float _1903 = _1901;
    if (!_1839)
    {
        _1887 = _1827;
    }
    float _1905 = _1887;
    float _1907 = _1905;
    if (_1839)
    {
        float _1909 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1889 = _1909;
    }
    float _1911 = _1889;
    float _1913 = _1879;
    float _1915 = _1911;
    if (_1839)
    {
        float _1917 = fma(_1879, _1911, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1913 = _1917;
    }
    float _1919 = _1913;
    float _1921 = _1919;
    float _1923 = _1895;
    if (_1839)
    {
        float _1925 = _1895 + (-1.0);
        _1915 = _1925;
    }
    float _1927 = _1915;
    float _1929 = _1927;
    if (_1839)
    {
        float _1931 = _1861 * _1919;
        _1853 = _1931;
    }
    float _1933 = _1853;
    if (!_1839)
    {
        _1921 = _1831;
    }
    float _1935 = _1921;
    float _1937 = _1935;
    if (_1839)
    {
        float _1939 = _1927 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1873 = _1939;
    }
    float _1941 = _1873;
    if (_1839)
    {
        float _1943 = _1827 * _1933;
        _1907 = _1943;
    }
    float _1945 = _1907;
    if (!_1839)
    {
        _1929 = _1829;
    }
    float _1947 = _1929;
    float _1949 = _1947;
    if (_1839)
    {
        float _1951 = _1829 * _1933;
        _1949 = _1951;
    }
    float _1953 = _1949;
    if (_1839)
    {
        float _1955 = fma(_1901, _1895, _1941);
        _1903 = _1955;
    }
    float _1957 = _1903;
    if (_1839)
    {
        float _1959 = _1945 * _1945;
        _1937 = _1959;
    }
    float _1961 = _1937;
    if (!_1839)
    {
        _1923 = _1833;
    }
    float _1963 = _1923;
    float _1965 = _1963;
    if (_1839)
    {
        float _1967 = _1953 * _1953;
        _1965 = _1967;
    }
    float _1969 = _1965;
    float _1971 = fma(_1957, _1957, _1961);
    float _1973 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1975 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1977 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1979 = _1971 + _1969;
    float _1981 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1973);
    float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1985 = fma(_1823, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1983);
    float _1987 = precise::clamp(_1985, 0.0, 1.0);
    float _1989 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1991 = rsqrt(_1979);
    float _1993 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1977);
    float _1995 = -_1987;
    float _1997 = _1995 + 1.0;
    float _1999 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1989);
    float _2001 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1981);
    float _2003 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2005 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1993);
    float _2007 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1999);
    float _2009 = abs(_1997);
    float _2011 = log2(_2009);
    float _2013 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2003);
    float _2015 = _2005 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2017 = _2007 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2019 = _2001 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2021 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2013);
    float _2023 = _2017 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2025 = _1991 * _1945;
    float _2027 = _1991 * _1957;
    float _2029 = _1991 * _1953;
    float _2031 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2023);
    float _2033 = _2025 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2035 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2037 = _2021 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2039 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2031);
    float _2041 = -_2033;
    float _2043 = fma(_2027, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2041);
    float _2045 = _2011 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2047 = -_2035;
    float _2049 = fma(_2047, _1975, 1.0);
    float _2051 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2039);
    float _2053 = -_2029;
    float _2055 = fma(_2053, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2043);
    float _2057 = exp2(_2045);
    float _2059 = _2017 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2061 = _2017 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2063 = fma(_2055, -0.5, 0.5);
    float _2065 = _2027 + 1.0;
    float _2067 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2059);
    float _2069 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2061);
    float _2071 = log2(_2049);
    float _2073 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2067);
    float _2075 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2069);
    float _2077 = 1.0 / _2051;
    float _2079 = fma(_2055, 0.5, 0.5);
    float _2081 = -_2027;
    float _2083 = fma(_2057, _2065, _2081);
    float _2085 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2073);
    float _2087 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2075);
    float _2089 = fma(_2079, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2091 = fma(_2083, 0.5, 0.5);
    float _2093 = sqrt(_2063);
    float _2095 = _2071 * 0.693147182464599609375;
    float _2097 = fma(_2079, _2089, -0.212114393711090087890625);
    float _2099 = _2095 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2101 = fma(_2079, _2097, 1.570728778839111328125);
    float _2103 = _2085 * _2077;
    float _2105 = _2087 * _2077;
    float _2107 = fma(_2105, -0.5, 0.5);
    float _2109 = _2093 * 0.636619746685028076171875;
    float _2111 = fma(_2103, 0.5, 0.5);
    float _2113 = -_2101;
    float _2115 = fma(_2109, _2113, 1.0);
    float3 _6174 = float3(_2111, _2107, _2099);
    float _2117 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6174, float3(0.0), isnan(_6174)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6174, float3(0.0), isnan(_6174)), level(0.0)).x;
    float3 _6185 = float3(_2111, _2107, _2099);
    float4 _2120 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6185, float3(0.0), isnan(_6185)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6185, float3(0.0), isnan(_6185)), level(0.0)).xyzw;
    float _2122 = _2120.x;
    float _2124 = _2120.y;
    float _2126 = _2120.z;
    float _2128 = _2120.w;
    float2 _6202 = float2(_2115, _2091);
    float3 _2132 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6202, float2(0.0), isnan(_6202)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6202, float2(0.0), isnan(_6202)), level(0.0)).xyz;
    float _2134 = _2132.x;
    float _2136 = _2132.y;
    float _2138 = _2132.z;
    int _2140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2142 = _2140 != 0;
    float _2144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2148 = _2146 != 0;
    float _2150 = _919 + 0.5;
    out.m_70.x = _1363;
    out.m_70.y = _1397;
    out.m_70.z = _1351;
    float _2152 = -_1137;
    float _2154 = _2152 + 1.0;
    float _2156 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2158 = _2156 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2160 = in.m_62.w;
    float _2162 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2164 = _2162 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2166 = _709 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2168 = isnan(_709);
    bool _2170 = _2166 || _2168;
    bool _2172 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2174 = _2170 || _2172;
    float _2176 = float(_2174);
    float _2178 = 1.0 / _2158;
    float _2180 = 0.0;
    float _2182 = _2085;
    if (_2142)
    {
        float _2184 = in.m_62.z;
        _2180 = _2184;
    }
    float _2186 = _2180;
    float _2188 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2190 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2188;
    bool _2192 = _791 > 0.5;
    float _2194 = -_2176;
    float _2196 = _2194 + 1.0;
    float _2198 = 0.0;
    if (_2148)
    {
        float _2200 = in.m_62.w;
        _2198 = _2200;
    }
    float _2202 = _2198;
    float _2204 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2206 = _2204 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2208 = -_221;
    int _2210 = _2192 ? as_type<int>(_2208) : as_type<int>(_221);
    float _2212 = 1.0 / _2164;
    bool _2214 = _709 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2216 = isnan(_709);
    bool _2218 = _2214 || _2216;
    bool _2220 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2222 = _2218 || _2220;
    float _2224 = float(_2222);
    float _2226 = -_1153;
    float _2228 = _2226 + 1.0;
    int _2230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2232 = _2230 != 0;
    float _2234 = _2011 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2236 = _2224 * _2196;
    float _2238 = -_2224;
    float _2240 = _2238 + 1.0;
    float _2242 = _2190 * _2178;
    float _2244 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2246 = _709 + _2244;
    float _2248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    bool _2250 = !_2232;
    float _2252 = _2250 ? _221 : as_type<float>(_2210);
    float _2254 = fma(_2242, _2246, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2256 = _709 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2258 = isnan(_709);
    bool _2260 = _2256 || _2258;
    bool _2262 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2264 = _2260 || _2262;
    float _2266 = float(_2264);
    bool _2268 = _2160 > 0.5;
    float _2270 = _2186;
    float _2272 = _2160;
    if (_2142)
    {
        float _2274 = _2186 * 3.1415927410125732421875;
        _2270 = _2274;
    }
    float _2276 = _2270;
    float _2278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2280 = _2254 * _2236;
    float _2282 = _2276;
    if (!_2142)
    {
        _2272 = _221;
    }
    float _2284 = _2272;
    float _2286 = _2284;
    if (_2142)
    {
        float _2288 = _2276 * 0.15915493667125701904296875;
        _2282 = _2288;
    }
    float _2290 = _2282;
    float _2292 = _2202;
    if (_2148)
    {
        float _2294 = _2202 * 3.1415927410125732421875;
        _2292 = _2294;
    }
    float _2296 = _2292;
    float _2298 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2300 = _709 + _2298;
    float _2302 = fma(_2240, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2280);
    float _2304 = -_2266;
    float _2306 = _2304 + 1.0;
    float _2308 = _2296;
    if (_2148)
    {
        float _2310 = _2296 * 0.15915493667125701904296875;
        _2308 = _2310;
    }
    float _2312 = _2308;
    float _2314 = _2290;
    if (_2142)
    {
        float _2316 = _2290 * 6.283185482025146484375;
        float _2318 = sin(_2316);
        _2314 = _2318;
    }
    float _2320 = _2314;
    float _2322 = _2206 * _2212;
    int _2324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2326 = _2324 != 0;
    float _2328 = _2176 * _2306;
    float _2330 = _2248 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _2332 = fma(_2322, _2300, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2334 = _2144 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2336 = _2252 + 0.5;
    float _2338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2340 = _2150 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2342 = fma(_2332, _2328, _2302);
    float _2344 = _2278 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2346 = fma(_2334, _2336, _847);
    float _2348 = fma(_2266, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2342);
    if (_2142)
    {
        bool _2350 = _2320 > 0.5;
        _1551 = _2350;
    }
    bool _2352 = _1551;
    float _2354 = _2312;
    if (_2148)
    {
        float _2356 = _2312 * 6.283185482025146484375;
        float _2358 = sin(_2356);
        _2354 = _2358;
    }
    float _2360 = _2354;
    float _2362 = -_205;
    int _2364 = _831 ? as_type<int>(_2362) : as_type<int>(_205);
    float _2366 = _2348 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_2142)
    {
        float _2368 = -_221;
        float _2370 = _2352 ? _2368 : _221;
        _2286 = _2370;
    }
    float _2372 = _2286;
    int _2374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2376 = _2374 != 0;
    int _2378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2380 = _2378 != 0;
    float _2382 = _1155 * (-0.15915493667125701904296875);
    bool _2384 = !_2376;
    float _2386 = _2384 ? _205 : as_type<float>(_2364);
    float _2388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2390 = _2372 + 0.5;
    out.m_72.w = _2366;
    float _2392 = _2386 + (-0.5);
    float _2394 = fma(_2330, _2390, _1159);
    if (_2148)
    {
        bool _2396 = _2360 > 0.5;
        _975 = _2396;
    }
    bool _2398 = _975;
    float _2400 = -_941;
    float _2402 = _2400 + 0.5;
    float _2404 = _2382 * 6.283185482025146484375;
    float _2406 = sin(_2404);
    float _2408 = -_2344;
    float _2410 = -_1043;
    float _2412 = fma(_2408, _2392, _2410);
    float _2414 = -_205;
    int _2416 = _2268 ? as_type<int>(_2414) : as_type<int>(_205);
    float _2418 = _2340 * _2338;
    if (!_2148)
    {
        _977 = _205;
    }
    float _2420 = _977;
    float _2422 = _2402 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2424 = _2420;
    if (_2148)
    {
        float _2426 = -_205;
        float _2428 = _2398 ? _2426 : _205;
        _2424 = _2428;
    }
    float _2430 = _2424;
    float _2432 = _2382 * 6.283185482025146484375;
    float _2434 = cos(_2432);
    float _2436 = _2422 * _2388;
    float _2438 = _2430 + (-0.5);
    out.m_74.x = _2418;
    out.m_74.y = _2436;
    float _2440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    bool _2442 = !_2326;
    float _2444 = _2442 ? _205 : as_type<float>(_2416);
    float _2446 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2448 = -_221;
    int _2450 = _915 ? as_type<int>(_2448) : as_type<int>(_221);
    bool _2452 = _1823 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2454 = isnan(_1823);
    bool _2456 = _2452 || _2454;
    bool _2458 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2460 = _2456 || _2458;
    float _2462 = _2444 * _2406;
    bool _2464 = !_2380;
    float _2466 = _2464 ? _221 : as_type<float>(_2450);
    float _2468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2470 = _2444 * _2434;
    float _2472 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2474 = -_2462;
    float _2476 = fma(_2466, _2434, _2474);
    float _2478 = fma(_2466, _2406, _2470);
    float _2480 = -_1085;
    float _2482 = _2480 + 1.0;
    float _2484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2486 = _2440 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _2488 = -_2482;
    float _2490 = fma(_2488, _2372, _2394);
    float _2492 = -_1149;
    float _2494 = _2492 + 1.0;
    float _2496 = -_1139;
    float _2498 = _2496 + 1.0;
    float _2500 = -_2486;
    float _2502 = -_1117;
    float _2504 = fma(_2500, _2438, _2502);
    float _2506 = _2476 + 0.5;
    float _2508 = _2478 + (-0.5);
    float _2510 = _2468 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2512 = fma(_2386, _2494, _2412);
    float _2514 = fma(_2228, _2430, _2504);
    float _2516 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2518 = fma(_2510, _2506, _1163);
    float _2520 = -_1151;
    float _2522 = _2520 + 1.0;
    float _2524 = exp2(_2234);
    out.m_76.x = _2490;
    out.m_76.y = _2514;
    float _2526 = _2484 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2528 = -_2522;
    float _2530 = fma(_2252, _2528, _2346);
    float _2532 = -_2154;
    float _2534 = fma(_2476, _2532, _2518);
    float _2536 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2538 = -_2526;
    float _2540 = -_1165;
    float _2542 = fma(_2538, _2508, _2540);
    float _2544 = -_1293;
    float _2546 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2516);
    float _2548 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2550 = -_1293;
    float _2552 = fma(_2550, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2536);
    float _2554 = fma(_2478, _2498, _2542);
    float _2556 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2558 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2560 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2562 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_78.x = _2530;
    out.m_78.y = _2512;
    out.m_78.z = _2534;
    out.m_78.w = _2554;
    float _2564 = -_1293;
    float _2566 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2548);
    float _2568 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2556);
    float _2570 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2558);
    float _2572 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2560);
    float _2574 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2562);
    float _2576 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2552);
    float _2578 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2546);
    float _2580 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2566);
    float _2582 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2570);
    float _2584 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2568);
    float _2586 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2574);
    float _2588 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2572);
    float _2590 = _2446 * _2576;
    float _2592 = fma(_2446, _2446, 1.0);
    float _2594 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2596 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2598 = -_2524;
    float _2600 = _2598 + 1.0;
    float _2602 = rsqrt(_2592);
    float _2604 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2594);
    float _2606 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2596);
    float _2608 = _2017 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2610 = fma(_2472, _2584, _2590);
    float _2612 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2604);
    float _2614 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2606);
    float _2616 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2608);
    out.m_80.x = _2584;
    out.m_80.y = _2582;
    out.m_80.z = _2586;
    float _2618 = _2446 * _2578;
    float _2620 = _2085 + _2051;
    float _2622 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2616);
    float _2624 = fma(_2472, _2582, _2618);
    float _2626 = _2620 * 0.5;
    float _2628 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2622);
    float _2630 = _2446 * _2602;
    float _2632 = _2628 + _2051;
    float _2634 = -_2588;
    float _2636 = _2630 * _2634;
    float _2638 = -_2612;
    float _2640 = _2630 * _2638;
    float _2642 = -_2614;
    float _2644 = _2630 * _2642;
    float _2646 = _2632 * 0.5;
    float _2648 = fma(_2602, _2576, _2636);
    float _2650 = fma(_2602, _2578, _2640);
    float _2652 = _2446 * _2580;
    float _2654 = fma(_2602, _2580, _2644);
    float _2656 = _2051 * 0.5;
    float _2658 = _2612 + _2624;
    float _2660 = fma(_2472, _2586, _2652);
    float _2662 = _2600 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2664 = fma(_2087, -0.5, _2656);
    out.m_82.x = _2648;
    out.m_82.y = _2650;
    out.m_82.z = _2654;
    float _2666 = _2588 + _2610;
    float _2668 = _2614 + _2660;
    float _2670 = _2660;
    if (!_2460)
    {
        _2670 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2672 = _2670;
    out.m_84.x = _2626;
    out.m_84.y = _2664;
    out.m_84.z = _2646;
    out.m_84.w = _2051;
    out.m_86.x = _2666;
    out.m_86.y = _2658;
    out.m_86.z = _2668;
    out.gl_Position.x = _2085;
    out.gl_Position.y = _2087;
    out.gl_Position.z = _2628;
    out.gl_Position.w = _2051;
    float _2674 = _2672;
    float _2676 = _2672;
    if (!_2460)
    {
        _2182 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2678 = _2182;
    float _2680 = _2662 * _2117;
    float _2682 = -_2662;
    float _2684 = _2682 + 1.0;
    float _2686 = _2128 * _2680;
    float _2688 = _2138 * _2680;
    float _2690 = _2128 * _2684;
    float _2692 = _1743 * _1801;
    float _2694 = fma(_2134, _2686, _2122);
    float _2696 = fma(_2136, _2686, _2124);
    float _2698 = fma(_2128, _2688, _2126);
    float _2700 = _2692 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2702 = _2124;
    float _2704 = _2122;
    float _2706 = _2686;
    float _2708 = _2692;
    float _2710 = _2678;
    float _2712 = _2678;
    if (!_2460)
    {
        _2702 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2714 = _2702;
    float _2716 = _2714;
    float _2718 = _2714;
    if (!_2460)
    {
        _2704 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2720 = _2704;
    out.m_88.x = _2694;
    out.m_88.y = _2696;
    out.m_88.z = _2698;
    out.m_88.w = _2690;
    float _2722 = _2720;
    float _2724 = _2720;
    if (!_2460)
    {
        _2706 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2726 = _2706;
    float _2728 = _2726;
    float _2730 = _2726;
    if (!_2460)
    {
        _2708 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2732 = _2708;
    bool _2734 = !_2460;
    float _2736 = _2732;
    float _2738 = _2732;
    if (!_2734)
    {
        bool _2740 = _1823 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2742 = isnan(_1823);
        bool _2744 = _2740 || _2742;
        bool _2746 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2748 = _2744 || _2746;
        if (!_2748)
        {
            float _2750 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2752 = _1823 + _2750;
            float _2754 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2756 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2754;
            float _2758 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2760 = _2758 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2762 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2764 = _2762 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2766 = 1.0 / _2756;
            float _2768 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2770 = _2768 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2772 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2774 = _2772 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2776 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2778 = _2776 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2780 = _2752 * _2766;
            float _2782 = precise::clamp(_2780, 0.0, 1.0);
            float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2786 = _2784 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2788 = fma(_2782, _2760, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2790 = fma(_2782, _2764, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2792 = fma(_2782, _2786, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2794 = fma(_2782, _2770, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2796 = fma(_2782, _2774, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2798 = fma(_2782, _2778, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2730 = _2788;
            _2712 = _2796;
            _2724 = _2790;
            _2676 = _2794;
            _2738 = _2792;
            _2718 = _2798;
            _2800 = true;
        }
        else
        {
            bool _2802 = _1823 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2804 = isnan(_1823);
            bool _2806 = _2802 || _2804;
            bool _2808 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2810 = _2806 || _2808;
            if (!_2810)
            {
                _2674 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2812 = _2674;
            _2676 = _2812;
            if (!_2810)
            {
                _2710 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2814 = _2710;
            _2712 = _2814;
            if (!_2810)
            {
                _2716 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2816 = _2716;
            _2718 = _2816;
            if (!_2810)
            {
                _2722 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2818 = _2722;
            _2724 = _2818;
            if (!_2810)
            {
                _2728 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2820 = _2728;
            _2730 = _2820;
            if (!_2810)
            {
                _2736 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2822 = _2736;
            bool _2824 = !_2810;
            _2738 = _2822;
            if (!_2824)
            {
                bool _2826 = _1823 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2828 = isnan(_1823);
                bool _2830 = _2826 || _2828;
                bool _2832 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2834 = _2830 || _2832;
                if (!_2834)
                {
                    float _2836 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2838 = _1823 + _2836;
                    float _2840 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2842 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2840;
                    float _2844 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2846 = _2844 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2848 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2850 = _2848 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2852 = 1.0 / _2842;
                    float _2854 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2856 = _2854 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2858 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2860 = _2858 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2862 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2864 = _2862 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2866 = _2838 * _2852;
                    float _2868 = precise::clamp(_2866, 0.0, 1.0);
                    float _2870 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2872 = _2870 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2874 = fma(_2868, _2846, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2876 = fma(_2868, _2850, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2878 = fma(_2868, _2872, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2880 = fma(_2868, _2856, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2882 = fma(_2868, _2860, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2884 = fma(_2868, _2864, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2730 = _2874;
                    _2712 = _2882;
                    _2724 = _2876;
                    _2676 = _2880;
                    _2738 = _2878;
                    _2718 = _2884;
                    _2800 = true;
                }
                else
                {
                    _2730 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2712 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2724 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2676 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2738 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2718 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2800 = false;
    float _2886 = _2730;
    float _2888 = _2712;
    float _2890 = _2724;
    float _2892 = _2676;
    float _2894 = _2738;
    float _2896 = _2718;
    float _2898 = _2700 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2900 = fma(_2658, -0.5, 0.5);
    float _2902 = precise::clamp(_2900, 0.0, 1.0);
    float _2904 = -_2886;
    float _2906 = _2888 + _2904;
    float _2908 = -_2890;
    float _2910 = _2892 + _2908;
    out.m_47.x = _2898;
    float _2912 = -_2894;
    float _2914 = _2896 + _2912;
    float _2916 = fma(_2902, _2906, _2886);
    float _2918 = fma(_2902, _2910, _2890);
    bool _2920 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2922 = _2916 * 0.586610972881317138671875;
    float _2924 = fma(_2902, _2914, _2894);
    out.m_90.x = 0.0;
    bool _2926 = _1743 > 0.0;
    bool _2928 = isnan(_1743);
    bool _2930 = _2926 || _2928;
    bool _2932 = isnan(0.0);
    bool _2934 = _2930 || _2932;
    float _2936 = fma(_2918, 0.298911988735198974609375, _2922);
    bool _2938 = _1801 <= 0.0;
    bool _2940 = !_2934;
    bool _2942 = _2938 || _2940;
    float _2944 = fma(_2924, 0.114477999508380889892578125, _2936);
    float _2946 = -_2944;
    float _2948 = _2918 + _2946;
    float _2950 = fma(_2948, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2944);
    bool _2952 = !_2920;
    if (!_2952)
    {
        float _2954 = -_1677;
        float _2956 = _2954 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2958 = -_1679;
        float _2960 = _2958 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2962 = -_1681;
        float _2964 = _2962 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2966 = _2956 * _2956;
        float _2968 = fma(_2960, _2960, _2966);
        float _2970 = fma(_2964, _2964, _2968);
        float _2972 = sqrt(_2970);
        float _2974 = rsqrt(_2970);
        float _2976 = -_2972;
        float _2978 = _2976 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2980 = _2978 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2982 = precise::clamp(_2980, 0.0, 1.0);
        float _2984 = _2960 * _2974;
        float _2986 = _2956 * _2974;
        float _2988 = abs(_2982);
        float _2990 = log2(_2988);
        float _2992 = _2964 * _2974;
        float _2994 = _2984 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2996 = _2658 * _2986;
        float _2998 = -_2986;
        float _3000 = -_2994;
        float _3002 = fma(_2998, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3000);
        float _3004 = fma(_2666, _2984, _2996);
        float _3006 = -_2992;
        float _3008 = fma(_3006, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3002);
        float _3010 = fma(_2668, _2992, _3004);
        float _3012 = precise::clamp(_3010, 0.0, 1.0);
        float _3014 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3016 = _3008 + _3014;
        float _3018 = _2990 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3020 = _3016 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3022 = precise::clamp(_3020, 0.0, 1.0);
        float _3024 = exp2(_3018);
        float _3026 = _3024 * _3022;
        float _3028 = _3012 * _3026;
        float _3030 = _3028 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        out.m_90.x = _3030;
    }
    out.m_92.x = _2950;
    if (!_2942)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _3032 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3032;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2800 = false;
    bool _699 = false;
    bool _587 = false;
    bool _255 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_44.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_47.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3089 = as_type<float>(_127);
        out.gl_Position.z = _3089;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = in.m_49.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = 0.0;
    float _149 = _145;
    if (_141)
    {
        float _151 = float(_111);
        _147 = _151;
    }
    float _153 = _147;
    bool _155 = _145 >= _153;
    bool _157 = !_141;
    bool _159 = _155 || _157;
    if (_159)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _121;
    if (_159)
    {
        out.m_47.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3158 = as_type<float>(_165);
        out.gl_Position.z = _3158;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = in.m_54.x;
    float _171 = in.m_54.y;
    float _173 = in.m_54.z;
    float _175 = in.m_56.x;
    float _177 = in.m_56.y;
    float _179 = in.m_56.z;
    float _181 = in.m_58.x;
    float _183 = in.m_58.y;
    float _185 = in.m_58.z;
    float _187 = in.m_60.x;
    float _189 = in.m_60.y;
    float _191 = in.m_60.z;
    int _193 = as_type<int>(_167) & 1;
    bool _195 = _193 != 0;
    int _197 = as_type<int>(_167) & 2;
    bool _199 = _197 != 0;
    bool _201 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _203 = !_199;
    float _205 = _203 ? (-0.5) : 0.5;
    float _207 = _171 * _177;
    float _209 = _171 * _183;
    float _211 = fma(_169, _175, _207);
    float _213 = _171 * _189;
    float _215 = fma(_169, _181, _209);
    float _217 = fma(_173, _179, _211);
    bool _219 = !_195;
    float _221 = _219 ? (-0.5) : 0.5;
    float _223 = fma(_169, _187, _213);
    float _225 = fma(_173, _185, _215);
    float _227 = fma(_173, _191, _223);
    bool _229 = !_201;
    float _231 = _191;
    float _233 = _187;
    float _235 = _217;
    float _253;
    if (!_229)
    {
        float _237 = in.m_62.x;
        float _239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _241 = _237 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _245 = _243 * _239;
        float _247 = floor(_245);
        float _249 = -_247;
        float _251 = _245 + _249;
        _253 = _251;
        _255 = true;
    }
    else
    {
        float _257 = float(_111);
        float _259 = 1.0 / _257;
        float _261 = _145 * _259;
        _253 = _261;
    }
    _255 = false;
    float _263 = _253;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = _263 + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _271 = _263 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _277 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _287 = _285 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _289 = 1.0 / _275;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _297 = _295 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _299 = 1.0 / _283;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = _263 + _301;
    bool _305 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _307 = 1.0 / _293;
    float _309 = _303 * _289;
    bool _311 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _313 = isnan(_263);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _323;
    float _327 = fma(_325, _309, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _329 = 1.0 / _279;
    float _331 = _267 * _299;
    bool _333 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _335 = isnan(_263);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _347 = _263 + _345;
    float _349 = 1.0 / _287;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _353 = _263 + _351;
    float _355 = 1.0 / _297;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _359 = _263 + _357;
    float _361 = _353 * _329;
    bool _363 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _365 = isnan(_263);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = _359 * _307;
    bool _377 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _379 = isnan(_263);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = _271 * _349;
    float _391 = -_321;
    float _393 = _391 + 1.0;
    bool _395 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _397 = isnan(_263);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = -_387;
    float _409 = _407 + 1.0;
    float _411 = _343 * _393;
    float _413 = -_343;
    float _415 = _413 + 1.0;
    float _417 = _347 * _355;
    float _419 = -_405;
    float _421 = _419 + 1.0;
    float _423 = _387 * _415;
    float _425 = _405 * _409;
    bool _427 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _429 = isnan(_263);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = _373 * _421;
    bool _441 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _443 = isnan(_263);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _453;
    float _457 = -_373;
    float _459 = _457 + 1.0;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _465 = -_437;
    float _467 = _465 + 1.0;
    float _469 = fma(_455, _309, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _471 = _437 * _459;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _477;
    float _481 = _451 * _467;
    float _483 = -_451;
    float _485 = _483 + 1.0;
    float _487 = fma(_475, _331, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _489 = fma(_479, _331, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _491 = _469 * _481;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _497 = _327 * _481;
    float _499 = fma(_463, _361, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _501 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[143].x, _491);
    float _503 = fma(_495, _361, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _505 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[143].y, _497);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _515 = fma(_499, _471, _501);
    float _517 = fma(_503, _471, _505);
    float _519 = fma(_509, _389, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _521 = fma(_513, _389, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _523;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _527;
    float _531 = fma(_487, _439, _515);
    float _533 = fma(_489, _439, _517);
    float _535 = fma(_525, _375, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _541 = fma(_529, _375, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _547 = fma(_519, _425, _531);
    float _549 = fma(_521, _425, _533);
    float _551 = fma(_539, _417, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _553 = fma(_545, _417, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _555 = fma(_535, _423, _547);
    float _557 = fma(_541, _423, _549);
    float _559 = fma(_551, _411, _555);
    float _561 = fma(_553, _411, _557);
    float _563 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[149].x, _559);
    float _565 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[149].y, _561);
    bool _567 = !_305;
    float _585;
    if (!_567)
    {
        float _569 = in.m_62.x;
        float _571 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _573 = _569 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _575 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _577 = _575 * _571;
        float _579 = floor(_577);
        float _581 = -_579;
        float _583 = _577 + _581;
        _585 = _583;
        _587 = true;
    }
    else
    {
        float _589 = float(_111);
        float _591 = 1.0 / _589;
        float _593 = _145 * _591;
        _585 = _593;
    }
    _587 = false;
    float _595 = _585;
    float _597 = in.m_64.x;
    float _599 = in.m_64.y;
    bool _601 = _595 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _603 = isnan(_595);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _609 = _605 || _607;
    int _611 = _609 ? 1065353216 : 0;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _617 = _595 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _619 = isnan(_595);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _629;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _635 = _595 + _633;
    float _637 = -as_type<float>(_611);
    float _639 = _637 + 1.0;
    bool _641 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _643 = 1.0 / _615;
    float _645 = _627 * _639;
    float _647 = -_627;
    float _649 = _647 + 1.0;
    float _651 = _565 * _599;
    float _653 = _563 * _597;
    float _655 = _631 * _643;
    float _657 = fma(_655, _635, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _659 = _657 * _645;
    float _661 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[115].x, _659);
    float _663 = fma(as_type<float>(_611), (*spvDescriptorSet0.vp_c9)._m0[116].x, _661);
    float _665 = _663 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.w = _665;
    bool _667 = !_641;
    float _669 = _659;
    int _671 = as_type<int>(_645);
    int _673 = _611;
    int _675 = as_type<int>(_665);
    int _677 = as_type<int>(_643);
    float _679 = _599;
    float _697;
    if (!_667)
    {
        float _681 = in.m_62.x;
        float _683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _685 = _681 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[11].w, _145);
        float _689 = _687 * _683;
        float _691 = floor(_689);
        float _693 = -_691;
        float _695 = _689 + _693;
        _669 = _691;
        _697 = _695;
        _699 = true;
    }
    else
    {
        float _701 = float(_111);
        float _703 = 1.0 / _701;
        float _705 = _145 * _703;
        _697 = _705;
    }
    _699 = false;
    float _707 = _669;
    float _709 = _697;
    int _711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _713 = _711 != 0;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _717 = _707;
    float _719 = _655;
    if (_713)
    {
        float _721 = in.m_62.x;
        float _723 = in.m_62.y;
        float _725 = in.m_62.z;
        _715 = _721;
        _717 = _723;
        _719 = _725;
    }
    float _727 = _715;
    float _729 = _717;
    float _731 = _719;
    if (_713)
    {
        _671 = 0;
    }
    int _733 = _671;
    float _735 = _731;
    float _737 = _729;
    int _739 = _733;
    float _741 = _727;
    if (_713)
    {
        _673 = as_type<int>(_727);
    }
    int _743 = _673;
    int _745 = _743;
    if (_713)
    {
        _675 = as_type<int>(_729);
    }
    int _747 = _675;
    int _749 = _747;
    if (_713)
    {
        _677 = as_type<int>(_731);
    }
    int _751 = _677;
    int _753 = _751;
    if (!_713)
    {
        float _755 = in.m_62.x;
        float _757 = in.m_62.y;
        float _759 = in.m_62.z;
        float _761 = _755 * 3.1415927410125732421875;
        float _763 = _761 * 0.15915493667125701904296875;
        float _765 = _757 * 3.1415927410125732421875;
        float _767 = _765 * 0.15915493667125701904296875;
        float _769 = _759 * 3.1415927410125732421875;
        float _771 = _763 * 6.283185482025146484375;
        float _773 = sin(_771);
        float _775 = _769 * 0.15915493667125701904296875;
        float _777 = _767 * 6.283185482025146484375;
        float _779 = sin(_777);
        float _781 = _775 * 6.283185482025146484375;
        float _783 = sin(_781);
        _735 = _759;
        _737 = _757;
        _739 = 1;
        _741 = _755;
        _753 = as_type<int>(_783);
        _749 = as_type<int>(_779);
        _745 = as_type<int>(_773);
    }
    float _785 = _735;
    float _787 = _737;
    int _789 = _739;
    float _791 = _741;
    int _793 = _753;
    int _795 = _749;
    int _797 = _745;
    float _799 = _785 * 2.0;
    float _801 = _787 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _803 = _789 != 1;
    float _805 = _787 + _785;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _809 = floor(_799);
    float _811 = _791 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _813 = fma(_801, -2.0, _807);
    bool _815 = !_803;
    float _817 = _815 ? as_type<float>(_793) : as_type<float>(_795);
    float _819 = _791 * 2.0;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _823 = _805 + (-1.0);
    float _825 = -_821;
    float _827 = fma(_811, 2.0, _825);
    float _829 = floor(_819);
    bool _831 = _787 > 0.5;
    float _833 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _835 = !_803;
    float _837 = _835 ? as_type<float>(_795) : as_type<float>(_797);
    float _839 = _787 * 2.0;
    float _841 = -_221;
    int _843 = _831 ? as_type<int>(_841) : as_type<int>(_221);
    float _845 = -_145;
    float _847 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[76].x, _827);
    bool _849 = _809 > 0.0;
    float _851 = floor(_839);
    bool _853 = _809 >= 0.0;
    bool _855 = isnan(_809);
    bool _857 = _853 || _855;
    bool _859 = isnan(0.0);
    bool _861 = _857 || _859;
    float _863 = _651 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _865 = _823;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    float _869 = as_type<float>(_795);
    float _871 = _809;
    if (!_803)
    {
        _679 = _791;
    }
    float _873 = _679;
    float _875 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _879 = _877 != 0;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _883 = _881 != 0;
    float _885 = _873;
    if (!_803)
    {
        _865 = _787;
    }
    float _887 = _865;
    float _889 = _887;
    if (!_803)
    {
        _867 = _787;
    }
    float _891 = _867;
    float _893 = _891;
    if (!_803)
    {
        _869 = _785;
    }
    float _895 = _869;
    float _897 = _895;
    if (!_803)
    {
        _871 = _785;
    }
    float _899 = _871;
    bool _901 = _829 > 0.0;
    float _903 = _899;
    if (_803)
    {
        _885 = _785;
    }
    float _905 = _885;
    if (_803)
    {
        _889 = _791;
    }
    float _907 = _889;
    if (_803)
    {
        _893 = _791;
    }
    float _909 = _893;
    if (_803)
    {
        _897 = _787;
    }
    float _911 = _897;
    if (_803)
    {
        _903 = _787;
    }
    float _913 = _903;
    bool _915 = _785 > 0.5;
    bool _917 = !_879;
    float _919 = _917 ? _221 : as_type<float>(_843);
    bool _921 = _829 >= 0.0;
    bool _923 = isnan(_829);
    bool _925 = _921 || _923;
    bool _927 = isnan(0.0);
    bool _929 = _925 || _927;
    float _931 = -_205;
    int _933 = _915 ? as_type<int>(_931) : as_type<int>(_205);
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _937 = _929 ? 0 : 1;
    bool _939 = !_883;
    float _941 = _939 ? _205 : as_type<float>(_933);
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    int _945 = _861 ? 0 : 1;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _949 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _951 = _949 != 0;
    int _953 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _955 = _953 != 0;
    int _957 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _959 = _957 != 0;
    float _961 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[98].w, _943);
    int _963 = ~_937;
    int _965 = _963 + 1;
    int _967 = _965 + 1;
    float _969 = _817 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _971 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[83].z, _947);
    int _973 = _967;
    bool _975 = _831;
    float _977 = _941;
    if (!_901)
    {
        int _979 = ~_937;
        int _981 = _979 + 1;
        _973 = _981;
    }
    int _983 = _973;
    float _985 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[83].w, _935);
    float _987 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _989 = log2(_987);
    bool _991 = !_955;
    int _993 = _991 ? 0 : 1;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    bool _999 = _851 > 0.0;
    float _1001 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[98].z, _995);
    int _1003 = abs(_993);
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _1007 = _837 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _1009 = fma(_969, -2.0, _997);
    float _1011 = _911 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1013 = _851 >= 0.0;
    bool _1015 = isnan(_851);
    bool _1017 = _1013 || _1015;
    bool _1019 = isnan(0.0);
    bool _1021 = _1017 || _1019;
    float _1023 = -_1005;
    float _1025 = fma(_1007, 2.0, _1023);
    float _1027 = _907 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1029 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    int _1031 = _1021 ? 0 : 1;
    float _1033 = _989 * _145;
    float _1035 = float(_983);
    float _1037 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1029);
    float _1039 = float(_1003);
    float _1041 = exp2(_1033);
    float _1043 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _813);
    int _1045 = ~_1031;
    int _1047 = _1045 + 1;
    int _1049 = _1047 + 1;
    float _1051 = _1039 * _1035;
    int _1053 = _1049;
    if (!_999)
    {
        int _1055 = ~_1031;
        int _1057 = _1055 + 1;
        _1053 = _1057;
    }
    int _1059 = _1053;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1063 = ~_945;
    int _1065 = _1063 + 1;
    int _1067 = _1065 + 1;
    float _1069 = in.m_68.x;
    float _1071 = in.m_68.y;
    float _1073 = in.m_68.z;
    int _1075 = _1067;
    if (!_849)
    {
        int _1077 = ~_945;
        int _1079 = _1077 + 1;
        _1075 = _1079;
    }
    int _1081 = _1075;
    float _1083 = fma(_1011, -2.0, _1061);
    float _1085 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[97].z, _1001);
    float _1087 = _1051 * (-2.0);
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1091 = 1.0 + _1089;
    bool _1093 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1095 = isnan(1.0);
    bool _1097 = _1093 || _1095;
    bool _1099 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1101 = _1097 || _1099;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1105 = -_1041;
    float _1107 = _1105 + 1.0;
    float _1109 = 1.0 / _1091;
    float _1111 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1113 = -_1103;
    float _1115 = fma(_1027, 2.0, _1113);
    float _1117 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[96].y, _1009);
    bool _1119 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1121 = isnan(0.0);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1127 = _1123 || _1125;
    float _1129 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1111);
    float _1131 = _787 + (-0.5);
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1135 = _1127 ? _1107 : 0.0;
    float _1137 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _971);
    float _1139 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _985);
    float _1141 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1133);
    float _1143 = fma(_1087, _1071, _1071);
    bool _1145 = !_951;
    int _1147 = _1145 ? 0 : 1;
    float _1149 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1129);
    float _1151 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1141);
    float _1153 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[97].w, _961);
    float _1155 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1037);
    float _1157 = -_145;
    float _1159 = fma(_1157, (*spvDescriptorSet0.vp_c9)._m0[96].x, _1025);
    float _1161 = -_145;
    float _1163 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1115);
    float _1165 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1083);
    if (_1101)
    {
        float _1167 = _1135 * _1109;
        _149 = _1167;
    }
    float _1169 = _149;
    float _1171 = fma(_833, _1087, _833);
    float _1173 = fma(_1131, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1143);
    bool _1175 = !_959;
    int _1177 = _1175 ? 0 : 1;
    float _1179 = _787 + _791;
    int _1181 = abs(_1147);
    float _1183 = _791 + _785;
    int _1185 = abs(_1177);
    float _1187 = _1179 + (-1.0);
    float _1189 = _1183 + (-1.0);
    float _1191 = float(_1081);
    float _1193 = _785 + (-0.5);
    float _1195 = float(_1181);
    float _1197 = fma(_1171, _1169, _1173);
    float _1199 = float(_1059);
    float _1201 = float(_1185);
    float _1203 = _1195 * _1191;
    float _1205 = _1197 * 0.15915493667125701904296875;
    float _1207 = _1201 * _1199;
    float _1209 = _1203 * (-2.0);
    float _1211 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1213 = _1205 * 6.283185482025146484375;
    float _1215 = sin(_1213);
    float _1217 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1219 = _1207 * (-2.0);
    float _1221 = fma(_1209, _1069, _1069);
    float _1223 = _791 + (-0.5);
    float _1225 = fma(_1217, _1209, _1217);
    float _1227 = fma(_1219, _1073, _1073);
    float _1229 = fma(_1211, _1219, _1211);
    float _1231 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1221);
    float _1233 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1227);
    float _1235 = in.m_44.x;
    float _1237 = in.m_44.y;
    float _1239 = in.m_44.z;
    float _1241 = fma(_1225, _1169, _1231);
    float _1243 = fma(_1229, _1169, _1233);
    float _1245 = _1205 * 6.283185482025146484375;
    float _1247 = cos(_1245);
    float _1249 = _1241 * 0.15915493667125701904296875;
    float _1251 = _653 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1253 = _1243 * 0.15915493667125701904296875;
    float _1255 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _1257 = _1249 * 6.283185482025146484375;
    float _1259 = sin(_1257);
    float _1261 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _1263 = _1251 * _1255;
    float _1265 = _863 * _1261;
    float _1267 = _1253 * 6.283185482025146484375;
    float _1269 = cos(_1267);
    float _1271 = _177 * _1237;
    float _1273 = _189 * _1237;
    float _1275 = _1249 * 6.283185482025146484375;
    float _1277 = cos(_1275);
    float _1279 = _1259 * _1215;
    float _1281 = _1259 * _1247;
    float _1283 = fma(_175, _1235, _1271);
    float _1285 = fma(_187, _1235, _1273);
    float _1287 = in.m_58.w;
    float _1289 = fma(_179, _1239, _1283);
    float _1291 = _1253 * 6.283185482025146484375;
    float _1293 = sin(_1291);
    float _1295 = _1259 * _1269;
    float _1297 = _1247 * _1269;
    float _1299 = in.m_56.w;
    float _1301 = _1277 * _1247;
    float _1303 = _1277 * _1215;
    float _1305 = _1277 * _1269;
    float _1307 = _1215 * _1269;
    float _1309 = _1305 * _1265;
    float _1311 = fma(_1293, _1301, _1279);
    float _1313 = -_1265;
    float _1315 = _1293 * _1313;
    float _1317 = -_1281;
    float _1319 = fma(_1293, _1303, _1317);
    float _1321 = -_1303;
    float _1323 = fma(_1293, _1281, _1321);
    float _1325 = fma(_1311, _1263, _1309);
    float _1327 = _1295 * _1265;
    float _1329 = fma(_1297, _1263, _1315);
    float _1331 = fma(_1293, _1279, _1301);
    float _1333 = fma(_1319, _875, _1325);
    float _1335 = fma(_1323, _1263, _1327);
    float _1337 = fma(_1307, _875, _1329);
    float _1339 = _183 * _1237;
    float _1341 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1343 = fma(_1331, _875, _1335);
    float _1345 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1347 = fma(_181, _1235, _1339);
    float _1349 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1341);
    float _1351 = _1289 + _1299;
    float _1353 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1345);
    float _1355 = fma(_185, _1239, _1347);
    float _1357 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1349);
    float _1359 = in.m_60.w;
    float _1361 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1353);
    float _1363 = _1355 + _1287;
    float _1365 = _1357 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1367 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1369 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1371 = _1351 + _1365;
    float _1373 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1367);
    float _1375 = _1363 + _1369;
    float _1377 = fma(_191, _1239, _1285);
    float _1379 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1381 = _1371 + _1379;
    float _1383 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1373);
    float _1385 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1387 = _1375 + _1385;
    float _1389 = _1381 * _1381;
    float _1391 = _1383 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1393 = fma(_1387, _1387, _1389);
    float _1395 = sqrt(_1393);
    float _1397 = _1377 + _1359;
    float _1399 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1401 = _1397 + _1391;
    float _1403 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1399);
    float _1405 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1403);
    bool _1407 = _1395 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1409 = _1235;
    float _1411 = _1395;
    float _1413 = _1359;
    if (!_1407)
    {
        _1409 = _1375;
    }
    float _1415 = _1409;
    float _1417 = _1415;
    if (!_1407)
    {
        _231 = _1371;
    }
    float _1419 = _231;
    float _1421 = _1419;
    if (!_1407)
    {
        _233 = _1401;
    }
    float _1423 = _233;
    bool _1425 = !_1407;
    float _1427 = _1423;
    if (!_1425)
    {
        float _1429 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1431 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1433 = _1395 + _1431;
        float _1435 = rsqrt(_1393);
        float _1437 = _1433 * _1429;
        float _1439 = _1401 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1441 = _1437 * 0.15915493667125701904296875;
        float _1443 = _1441 * 6.283185482025146484375;
        float _1445 = cos(_1443);
        float _1447 = _1441 * 6.283185482025146484375;
        float _1449 = sin(_1447);
        float _1451 = _1445 + (-1.0);
        float _1453 = fma(_1449, _1439, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1455 = _1451 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1457 = _1435 * _1453;
        float _1459 = fma(_1401, _1445, _1455);
        float _1461 = fma(_1387, _1457, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1463 = fma(_1381, _1457, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1427 = _1459;
        _1417 = _1461;
        _1421 = _1463;
    }
    float _1465 = _1427;
    float _1467 = _1417;
    float _1469 = _1421;
    float _1471 = -_1397;
    float _1473 = _1471 + _1465;
    float _1475 = _1405 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1477 = -_1363;
    float _1479 = _1477 + _1467;
    float _1481 = -_1351;
    float _1483 = _1481 + _1469;
    float _1485 = _1473 * _1473;
    float _1487 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1489 = 1.0 / _1475;
    float _1491 = fma(_1479, _1479, _1485);
    float _1493 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1487);
    bool _1495 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1497 = isnan(0.5);
    bool _1499 = _1495 || _1497;
    bool _1501 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1503 = _1499 || _1501;
    float _1505 = fma(_1483, _1483, _1491);
    float _1507 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1493);
    bool _1509 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1511 = isnan(0.5);
    bool _1513 = _1509 || _1511;
    bool _1515 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1517 = _1513 || _1515;
    float _1519 = sqrt(_1505);
    float _1521 = _1507 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1523 = _1521 + _1475;
    float _1525 = _1523 * _1489;
    float _1527 = _1525 * 0.5;
    bool _1529 = _1519 > 0.0;
    float _1531 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1533 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1531);
    float _1535 = 1.0 / _1533;
    bool _1537 = !_1529;
    float _1539 = _1467;
    float _1541 = _1465;
    float _1543 = _1469;
    float _1545 = _1479;
    float _1547 = _1473;
    float _1549 = _1505;
    bool _1551 = _1503;
    if (!_1537)
    {
        float _1553 = _227 * _227;
        float _1555 = rsqrt(_1505);
        float _1557 = fma(_225, _225, _1553);
        float _1559 = fma(_217, _217, _1557);
        float _1561 = sqrt(_1559);
        float _1563 = _1479 * _1555;
        float _1565 = _1483 * _1555;
        bool _1567 = _1561 > 0.0;
        float _1569 = _1473 * _1555;
        bool _1571 = !_1567;
        if (!_1571)
        {
            float _1573 = rsqrt(_1559);
            float _1575 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1577 = _227 * _1573;
            float _1579 = _225 * _1573;
            float _1581 = _1569 * _1577;
            float _1583 = _217 * _1573;
            float _1585 = fma(_1563, _1579, _1581);
            float _1587 = _1575 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1589 = fma(_1565, _1583, _1585);
            float _1591 = _1589 * _1587;
            float _1593 = fma(_225, _1591, _1467);
            float _1595 = fma(_227, _1591, _1465);
            float _1597 = fma(_217, _1591, _1469);
            _1539 = _1593;
            _1541 = _1595;
            _1543 = _1597;
            _1545 = _1591;
        }
    }
    float _1599 = _1539;
    float _1601 = _1541;
    float _1603 = _1543;
    float _1605 = _1545;
    float _1607 = _1605;
    if (_1517)
    {
        _235 = 1.0;
    }
    float _1609 = _235;
    float _1611 = _1609;
    if (_1503)
    {
        _1547 = _1599;
    }
    float _1613 = _1547;
    float _1615 = _1613;
    if (_1503)
    {
        _1549 = _1601;
    }
    float _1617 = _1549;
    float _1619 = _1617;
    if (_1503)
    {
        _1411 = _1603;
    }
    float _1621 = _1411;
    float _1623 = _1621;
    if (!_1503)
    {
        float _1625 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1627 = _1397 + _1625;
        float _1629 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1631 = _1363 + _1629;
        float _1633 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1635 = -_1397;
        float _1637 = _1635 + _1601;
        float _1639 = _1627 * _1627;
        float _1641 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1643 = _1351 + _1641;
        float _1645 = fma(_1631, _1631, _1639);
        float _1647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1649 = fma(_1643, _1643, _1645);
        float _1651 = sqrt(_1649);
        float _1653 = _1633 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1655 = precise::min(_1651, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1657 = _1655 * _1647;
        float _1659 = -_1363;
        float _1661 = _1659 + _1599;
        float _1663 = _1653 * _1657;
        float _1665 = -_1351;
        float _1667 = _1665 + _1603;
        float _1669 = fma(_1661, _1663, _1363);
        float _1671 = fma(_1637, _1663, _1397);
        float _1673 = fma(_1667, _1663, _1351);
        _1607 = _1633;
        _1619 = _1671;
        _1615 = _1669;
        _1623 = _1673;
    }
    float _1675 = _1607;
    float _1677 = _1619;
    float _1679 = _1615;
    float _1681 = _1623;
    float _1683 = _1675;
    if (_1517)
    {
        _1413 = 1.0;
    }
    float _1685 = _1413;
    float _1687 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1689 = _1535 * _1687;
    float _1691 = _1685;
    if (!_1517)
    {
        float _1693 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1695 = _1693 * 0.15915493667125701904296875;
        float _1697 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1699 = _1695 * 6.283185482025146484375;
        float _1701 = cos(_1699);
        float _1703 = _1697 * 0.15915493667125701904296875;
        float _1705 = _1695 * 6.283185482025146484375;
        float _1707 = sin(_1705);
        float _1709 = 1.0 / _1701;
        float _1711 = _1703 * 6.283185482025146484375;
        float _1713 = cos(_1711);
        float _1715 = _1707 * _1709;
        float _1717 = _1703 * 6.283185482025146484375;
        float _1719 = sin(_1717);
        float _1721 = _1713 * _1715;
        float _1723 = 1.0 / _1721;
        float _1725 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1727 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1725;
        float _1729 = 1.0 / _1727;
        float _1731 = _1719 * _1723;
        float _1733 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1735 = fma(_1689, _1731, _1733);
        float _1737 = _1735 * _1729;
        float _1739 = precise::clamp(_1737, 0.0, 1.0);
        _1683 = _1735;
        _1611 = _1739;
    }
    float _1741 = _1683;
    float _1743 = _1611;
    float _1745 = _1741;
    if (!_1517)
    {
        float _1747 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1749 = _1747 * 0.15915493667125701904296875;
        float _1751 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1753 = _1749 * 6.283185482025146484375;
        float _1755 = cos(_1753);
        float _1757 = _1751 * 0.15915493667125701904296875;
        float _1759 = _1749 * 6.283185482025146484375;
        float _1761 = sin(_1759);
        float _1763 = 1.0 / _1755;
        float _1765 = _1757 * 6.283185482025146484375;
        float _1767 = cos(_1765);
        float _1769 = _1761 * _1763;
        float _1771 = _1757 * 6.283185482025146484375;
        float _1773 = sin(_1771);
        float _1775 = _1767 * _1769;
        float _1777 = 1.0 / _1775;
        float _1779 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1781 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1779;
        float _1783 = 1.0 / _1781;
        float _1785 = _1773 * _1777;
        float _1787 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1789 = fma(_1689, _1785, _1787);
        float _1791 = _1789 * _1783;
        float _1793 = precise::clamp(_1791, 0.0, 1.0);
        float _1795 = -_1793;
        float _1797 = _1795 + 1.0;
        _1745 = _1763;
        _1691 = _1797;
    }
    float _1799 = _1745;
    float _1801 = _1691;
    float _1803 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1805 = _1677 + _1803;
    float _1807 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1809 = _1679 + _1807;
    float _1811 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1813 = _1681 + _1811;
    float _1815 = _1805 * _1805;
    float _1817 = fma(_1809, _1809, _1815);
    float _1819 = fma(_1813, _1813, _1817);
    float _1821 = rsqrt(_1819);
    float _1823 = sqrt(_1819);
    float _1825 = _1821 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1827 = _1809 * _1825;
    float _1829 = _1813 * _1825;
    float _1831 = _1827 * _1827;
    float _1833 = _1829 * _1829;
    float _1835 = _1831 + _1833;
    float _1837 = sqrt(_1835);
    bool _1839 = _1837 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1841 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1843 = _1837 + _1841;
    float _1845 = _1813;
    float _1847 = _1835;
    float _1849 = _1843;
    float _1851 = _1799;
    float _1853 = _1825;
    if (_1839)
    {
        float _1855 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1845 = _1855;
    }
    float _1857 = _1845;
    if (_1839)
    {
        float _1859 = rsqrt(_1835);
        _1847 = _1859;
    }
    float _1861 = _1847;
    if (_1839)
    {
        float _1863 = _1843 * _1857;
        _1849 = _1863;
    }
    float _1865 = _1849;
    if (_1839)
    {
        float _1867 = _1865 * 0.15915493667125701904296875;
        _1851 = _1867;
    }
    float _1869 = _1851;
    float _1871 = _1815;
    float _1873 = _1869;
    if (_1839)
    {
        float _1875 = _1869 * 6.283185482025146484375;
        float _1877 = sin(_1875);
        _1871 = _1877;
    }
    float _1879 = _1871;
    float _1881 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1883 = precise::max(0.0, _1881);
    float _1885 = _1821;
    float _1887 = _1883;
    float _1889 = _1881;
    if (_1839)
    {
        float _1891 = _1869 * 6.283185482025146484375;
        float _1893 = cos(_1891);
        _1885 = _1893;
    }
    float _1895 = _1885;
    float _1897 = -_1825;
    float _1899 = -_1883;
    float _1901 = fma(_1805, _1897, _1899);
    float _1903 = _1901;
    if (!_1839)
    {
        _1887 = _1827;
    }
    float _1905 = _1887;
    float _1907 = _1905;
    if (_1839)
    {
        float _1909 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1889 = _1909;
    }
    float _1911 = _1889;
    float _1913 = _1879;
    float _1915 = _1911;
    if (_1839)
    {
        float _1917 = fma(_1879, _1911, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1913 = _1917;
    }
    float _1919 = _1913;
    float _1921 = _1919;
    float _1923 = _1895;
    if (_1839)
    {
        float _1925 = _1895 + (-1.0);
        _1915 = _1925;
    }
    float _1927 = _1915;
    float _1929 = _1927;
    if (_1839)
    {
        float _1931 = _1861 * _1919;
        _1853 = _1931;
    }
    float _1933 = _1853;
    if (!_1839)
    {
        _1921 = _1831;
    }
    float _1935 = _1921;
    float _1937 = _1935;
    if (_1839)
    {
        float _1939 = _1927 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1873 = _1939;
    }
    float _1941 = _1873;
    if (_1839)
    {
        float _1943 = _1827 * _1933;
        _1907 = _1943;
    }
    float _1945 = _1907;
    if (!_1839)
    {
        _1929 = _1829;
    }
    float _1947 = _1929;
    float _1949 = _1947;
    if (_1839)
    {
        float _1951 = _1829 * _1933;
        _1949 = _1951;
    }
    float _1953 = _1949;
    if (_1839)
    {
        float _1955 = fma(_1901, _1895, _1941);
        _1903 = _1955;
    }
    float _1957 = _1903;
    if (_1839)
    {
        float _1959 = _1945 * _1945;
        _1937 = _1959;
    }
    float _1961 = _1937;
    if (!_1839)
    {
        _1923 = _1833;
    }
    float _1963 = _1923;
    float _1965 = _1963;
    if (_1839)
    {
        float _1967 = _1953 * _1953;
        _1965 = _1967;
    }
    float _1969 = _1965;
    float _1971 = fma(_1957, _1957, _1961);
    float _1973 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1975 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1977 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1979 = _1971 + _1969;
    float _1981 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1973);
    float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1985 = fma(_1823, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1983);
    float _1987 = precise::clamp(_1985, 0.0, 1.0);
    float _1989 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1991 = rsqrt(_1979);
    float _1993 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1977);
    float _1995 = -_1987;
    float _1997 = _1995 + 1.0;
    float _1999 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1989);
    float _2001 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1981);
    float _2003 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2005 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1993);
    float _2007 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1999);
    float _2009 = abs(_1997);
    float _2011 = log2(_2009);
    float _2013 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2003);
    float _2015 = _2005 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2017 = _2007 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2019 = _2001 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2021 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2013);
    float _2023 = _2017 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2025 = _1991 * _1945;
    float _2027 = _1991 * _1957;
    float _2029 = _1991 * _1953;
    float _2031 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2023);
    float _2033 = _2025 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2035 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2037 = _2021 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2039 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2031);
    float _2041 = -_2033;
    float _2043 = fma(_2027, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2041);
    float _2045 = _2011 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2047 = -_2035;
    float _2049 = fma(_2047, _1975, 1.0);
    float _2051 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2039);
    float _2053 = -_2029;
    float _2055 = fma(_2053, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2043);
    float _2057 = exp2(_2045);
    float _2059 = _2017 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2061 = _2017 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2063 = fma(_2055, -0.5, 0.5);
    float _2065 = _2027 + 1.0;
    float _2067 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2059);
    float _2069 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2061);
    float _2071 = log2(_2049);
    float _2073 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2067);
    float _2075 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2069);
    float _2077 = 1.0 / _2051;
    float _2079 = fma(_2055, 0.5, 0.5);
    float _2081 = -_2027;
    float _2083 = fma(_2057, _2065, _2081);
    float _2085 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2073);
    float _2087 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2075);
    float _2089 = fma(_2079, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2091 = fma(_2083, 0.5, 0.5);
    float _2093 = sqrt(_2063);
    float _2095 = _2071 * 0.693147182464599609375;
    float _2097 = fma(_2079, _2089, -0.212114393711090087890625);
    float _2099 = _2095 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2101 = fma(_2079, _2097, 1.570728778839111328125);
    float _2103 = _2085 * _2077;
    float _2105 = _2087 * _2077;
    float _2107 = fma(_2105, -0.5, 0.5);
    float _2109 = _2093 * 0.636619746685028076171875;
    float _2111 = fma(_2103, 0.5, 0.5);
    float _2113 = -_2101;
    float _2115 = fma(_2109, _2113, 1.0);
    float3 _6174 = float3(_2111, _2107, _2099);
    float _2117 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6174, float3(0.0), isnan(_6174)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6174, float3(0.0), isnan(_6174)), level(0.0)).x;
    float3 _6185 = float3(_2111, _2107, _2099);
    float4 _2120 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6185, float3(0.0), isnan(_6185)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6185, float3(0.0), isnan(_6185)), level(0.0)).xyzw;
    float _2122 = _2120.x;
    float _2124 = _2120.y;
    float _2126 = _2120.z;
    float _2128 = _2120.w;
    float2 _6202 = float2(_2115, _2091);
    float3 _2132 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6202, float2(0.0), isnan(_6202)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6202, float2(0.0), isnan(_6202)), level(0.0)).xyz;
    float _2134 = _2132.x;
    float _2136 = _2132.y;
    float _2138 = _2132.z;
    int _2140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2142 = _2140 != 0;
    float _2144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2148 = _2146 != 0;
    float _2150 = _919 + 0.5;
    out.m_70.x = _1363;
    out.m_70.y = _1397;
    out.m_70.z = _1351;
    float _2152 = -_1137;
    float _2154 = _2152 + 1.0;
    float _2156 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2158 = _2156 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2160 = in.m_62.w;
    float _2162 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2164 = _2162 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2166 = _709 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2168 = isnan(_709);
    bool _2170 = _2166 || _2168;
    bool _2172 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2174 = _2170 || _2172;
    float _2176 = float(_2174);
    float _2178 = 1.0 / _2158;
    float _2180 = 0.0;
    float _2182 = _2085;
    if (_2142)
    {
        float _2184 = in.m_62.z;
        _2180 = _2184;
    }
    float _2186 = _2180;
    float _2188 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2190 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2188;
    bool _2192 = _791 > 0.5;
    float _2194 = -_2176;
    float _2196 = _2194 + 1.0;
    float _2198 = 0.0;
    if (_2148)
    {
        float _2200 = in.m_62.w;
        _2198 = _2200;
    }
    float _2202 = _2198;
    float _2204 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2206 = _2204 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2208 = -_221;
    int _2210 = _2192 ? as_type<int>(_2208) : as_type<int>(_221);
    float _2212 = 1.0 / _2164;
    bool _2214 = _709 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2216 = isnan(_709);
    bool _2218 = _2214 || _2216;
    bool _2220 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2222 = _2218 || _2220;
    float _2224 = float(_2222);
    float _2226 = -_1153;
    float _2228 = _2226 + 1.0;
    int _2230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2232 = _2230 != 0;
    float _2234 = _2011 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2236 = _2224 * _2196;
    float _2238 = -_2224;
    float _2240 = _2238 + 1.0;
    float _2242 = _2190 * _2178;
    float _2244 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2246 = _709 + _2244;
    float _2248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    bool _2250 = !_2232;
    float _2252 = _2250 ? _221 : as_type<float>(_2210);
    float _2254 = fma(_2242, _2246, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2256 = _709 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2258 = isnan(_709);
    bool _2260 = _2256 || _2258;
    bool _2262 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2264 = _2260 || _2262;
    float _2266 = float(_2264);
    bool _2268 = _2160 > 0.5;
    float _2270 = _2186;
    float _2272 = _2160;
    if (_2142)
    {
        float _2274 = _2186 * 3.1415927410125732421875;
        _2270 = _2274;
    }
    float _2276 = _2270;
    float _2278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2280 = _2254 * _2236;
    float _2282 = _2276;
    if (!_2142)
    {
        _2272 = _221;
    }
    float _2284 = _2272;
    float _2286 = _2284;
    if (_2142)
    {
        float _2288 = _2276 * 0.15915493667125701904296875;
        _2282 = _2288;
    }
    float _2290 = _2282;
    float _2292 = _2202;
    if (_2148)
    {
        float _2294 = _2202 * 3.1415927410125732421875;
        _2292 = _2294;
    }
    float _2296 = _2292;
    float _2298 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2300 = _709 + _2298;
    float _2302 = fma(_2240, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2280);
    float _2304 = -_2266;
    float _2306 = _2304 + 1.0;
    float _2308 = _2296;
    if (_2148)
    {
        float _2310 = _2296 * 0.15915493667125701904296875;
        _2308 = _2310;
    }
    float _2312 = _2308;
    float _2314 = _2290;
    if (_2142)
    {
        float _2316 = _2290 * 6.283185482025146484375;
        float _2318 = sin(_2316);
        _2314 = _2318;
    }
    float _2320 = _2314;
    float _2322 = _2206 * _2212;
    int _2324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2326 = _2324 != 0;
    float _2328 = _2176 * _2306;
    float _2330 = _2248 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _2332 = fma(_2322, _2300, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2334 = _2144 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2336 = _2252 + 0.5;
    float _2338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2340 = _2150 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2342 = fma(_2332, _2328, _2302);
    float _2344 = _2278 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2346 = fma(_2334, _2336, _847);
    float _2348 = fma(_2266, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2342);
    if (_2142)
    {
        bool _2350 = _2320 > 0.5;
        _1551 = _2350;
    }
    bool _2352 = _1551;
    float _2354 = _2312;
    if (_2148)
    {
        float _2356 = _2312 * 6.283185482025146484375;
        float _2358 = sin(_2356);
        _2354 = _2358;
    }
    float _2360 = _2354;
    float _2362 = -_205;
    int _2364 = _831 ? as_type<int>(_2362) : as_type<int>(_205);
    float _2366 = _2348 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_2142)
    {
        float _2368 = -_221;
        float _2370 = _2352 ? _2368 : _221;
        _2286 = _2370;
    }
    float _2372 = _2286;
    int _2374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2376 = _2374 != 0;
    int _2378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2380 = _2378 != 0;
    float _2382 = _1155 * (-0.15915493667125701904296875);
    bool _2384 = !_2376;
    float _2386 = _2384 ? _205 : as_type<float>(_2364);
    float _2388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2390 = _2372 + 0.5;
    out.m_72.w = _2366;
    float _2392 = _2386 + (-0.5);
    float _2394 = fma(_2330, _2390, _1159);
    if (_2148)
    {
        bool _2396 = _2360 > 0.5;
        _975 = _2396;
    }
    bool _2398 = _975;
    float _2400 = -_941;
    float _2402 = _2400 + 0.5;
    float _2404 = _2382 * 6.283185482025146484375;
    float _2406 = sin(_2404);
    float _2408 = -_2344;
    float _2410 = -_1043;
    float _2412 = fma(_2408, _2392, _2410);
    float _2414 = -_205;
    int _2416 = _2268 ? as_type<int>(_2414) : as_type<int>(_205);
    float _2418 = _2340 * _2338;
    if (!_2148)
    {
        _977 = _205;
    }
    float _2420 = _977;
    float _2422 = _2402 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2424 = _2420;
    if (_2148)
    {
        float _2426 = -_205;
        float _2428 = _2398 ? _2426 : _205;
        _2424 = _2428;
    }
    float _2430 = _2424;
    float _2432 = _2382 * 6.283185482025146484375;
    float _2434 = cos(_2432);
    float _2436 = _2422 * _2388;
    float _2438 = _2430 + (-0.5);
    out.m_74.x = _2418;
    out.m_74.y = _2436;
    float _2440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    bool _2442 = !_2326;
    float _2444 = _2442 ? _205 : as_type<float>(_2416);
    float _2446 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2448 = -_221;
    int _2450 = _915 ? as_type<int>(_2448) : as_type<int>(_221);
    bool _2452 = _1823 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2454 = isnan(_1823);
    bool _2456 = _2452 || _2454;
    bool _2458 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2460 = _2456 || _2458;
    float _2462 = _2444 * _2406;
    bool _2464 = !_2380;
    float _2466 = _2464 ? _221 : as_type<float>(_2450);
    float _2468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2470 = _2444 * _2434;
    float _2472 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2474 = -_2462;
    float _2476 = fma(_2466, _2434, _2474);
    float _2478 = fma(_2466, _2406, _2470);
    float _2480 = -_1085;
    float _2482 = _2480 + 1.0;
    float _2484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2486 = _2440 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _2488 = -_2482;
    float _2490 = fma(_2488, _2372, _2394);
    float _2492 = -_1149;
    float _2494 = _2492 + 1.0;
    float _2496 = -_1139;
    float _2498 = _2496 + 1.0;
    float _2500 = -_2486;
    float _2502 = -_1117;
    float _2504 = fma(_2500, _2438, _2502);
    float _2506 = _2476 + 0.5;
    float _2508 = _2478 + (-0.5);
    float _2510 = _2468 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2512 = fma(_2386, _2494, _2412);
    float _2514 = fma(_2228, _2430, _2504);
    float _2516 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2518 = fma(_2510, _2506, _1163);
    float _2520 = -_1151;
    float _2522 = _2520 + 1.0;
    float _2524 = exp2(_2234);
    out.m_76.x = _2490;
    out.m_76.y = _2514;
    float _2526 = _2484 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2528 = -_2522;
    float _2530 = fma(_2252, _2528, _2346);
    float _2532 = -_2154;
    float _2534 = fma(_2476, _2532, _2518);
    float _2536 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2538 = -_2526;
    float _2540 = -_1165;
    float _2542 = fma(_2538, _2508, _2540);
    float _2544 = -_1293;
    float _2546 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2516);
    float _2548 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2550 = -_1293;
    float _2552 = fma(_2550, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2536);
    float _2554 = fma(_2478, _2498, _2542);
    float _2556 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2558 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2560 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2562 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_78.x = _2530;
    out.m_78.y = _2512;
    out.m_78.z = _2534;
    out.m_78.w = _2554;
    float _2564 = -_1293;
    float _2566 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2548);
    float _2568 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2556);
    float _2570 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2558);
    float _2572 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2560);
    float _2574 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2562);
    float _2576 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2552);
    float _2578 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2546);
    float _2580 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2566);
    float _2582 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2570);
    float _2584 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2568);
    float _2586 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2574);
    float _2588 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2572);
    float _2590 = _2446 * _2576;
    float _2592 = fma(_2446, _2446, 1.0);
    float _2594 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2596 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2598 = -_2524;
    float _2600 = _2598 + 1.0;
    float _2602 = rsqrt(_2592);
    float _2604 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2594);
    float _2606 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2596);
    float _2608 = _2017 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2610 = fma(_2472, _2584, _2590);
    float _2612 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2604);
    float _2614 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2606);
    float _2616 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2608);
    out.m_80.x = _2584;
    out.m_80.y = _2582;
    out.m_80.z = _2586;
    float _2618 = _2446 * _2578;
    float _2620 = _2085 + _2051;
    float _2622 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2616);
    float _2624 = fma(_2472, _2582, _2618);
    float _2626 = _2620 * 0.5;
    float _2628 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2622);
    float _2630 = _2446 * _2602;
    float _2632 = _2628 + _2051;
    float _2634 = -_2588;
    float _2636 = _2630 * _2634;
    float _2638 = -_2612;
    float _2640 = _2630 * _2638;
    float _2642 = -_2614;
    float _2644 = _2630 * _2642;
    float _2646 = _2632 * 0.5;
    float _2648 = fma(_2602, _2576, _2636);
    float _2650 = fma(_2602, _2578, _2640);
    float _2652 = _2446 * _2580;
    float _2654 = fma(_2602, _2580, _2644);
    float _2656 = _2051 * 0.5;
    float _2658 = _2612 + _2624;
    float _2660 = fma(_2472, _2586, _2652);
    float _2662 = _2600 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2664 = fma(_2087, -0.5, _2656);
    out.m_82.x = _2648;
    out.m_82.y = _2650;
    out.m_82.z = _2654;
    float _2666 = _2588 + _2610;
    float _2668 = _2614 + _2660;
    float _2670 = _2660;
    if (!_2460)
    {
        _2670 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2672 = _2670;
    out.m_84.x = _2626;
    out.m_84.y = _2664;
    out.m_84.z = _2646;
    out.m_84.w = _2051;
    out.m_86.x = _2666;
    out.m_86.y = _2658;
    out.m_86.z = _2668;
    out.gl_Position.x = _2085;
    out.gl_Position.y = _2087;
    out.gl_Position.z = _2628;
    out.gl_Position.w = _2051;
    float _2674 = _2672;
    float _2676 = _2672;
    if (!_2460)
    {
        _2182 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2678 = _2182;
    float _2680 = _2662 * _2117;
    float _2682 = -_2662;
    float _2684 = _2682 + 1.0;
    float _2686 = _2128 * _2680;
    float _2688 = _2138 * _2680;
    float _2690 = _2128 * _2684;
    float _2692 = _1743 * _1801;
    float _2694 = fma(_2134, _2686, _2122);
    float _2696 = fma(_2136, _2686, _2124);
    float _2698 = fma(_2128, _2688, _2126);
    float _2700 = _2692 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2702 = _2124;
    float _2704 = _2122;
    float _2706 = _2686;
    float _2708 = _2692;
    float _2710 = _2678;
    float _2712 = _2678;
    if (!_2460)
    {
        _2702 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2714 = _2702;
    float _2716 = _2714;
    float _2718 = _2714;
    if (!_2460)
    {
        _2704 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2720 = _2704;
    out.m_88.x = _2694;
    out.m_88.y = _2696;
    out.m_88.z = _2698;
    out.m_88.w = _2690;
    float _2722 = _2720;
    float _2724 = _2720;
    if (!_2460)
    {
        _2706 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2726 = _2706;
    float _2728 = _2726;
    float _2730 = _2726;
    if (!_2460)
    {
        _2708 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2732 = _2708;
    bool _2734 = !_2460;
    float _2736 = _2732;
    float _2738 = _2732;
    if (!_2734)
    {
        bool _2740 = _1823 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2742 = isnan(_1823);
        bool _2744 = _2740 || _2742;
        bool _2746 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2748 = _2744 || _2746;
        if (!_2748)
        {
            float _2750 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2752 = _1823 + _2750;
            float _2754 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2756 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2754;
            float _2758 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2760 = _2758 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2762 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2764 = _2762 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2766 = 1.0 / _2756;
            float _2768 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2770 = _2768 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2772 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2774 = _2772 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2776 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2778 = _2776 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2780 = _2752 * _2766;
            float _2782 = precise::clamp(_2780, 0.0, 1.0);
            float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2786 = _2784 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2788 = fma(_2782, _2760, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2790 = fma(_2782, _2764, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2792 = fma(_2782, _2786, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2794 = fma(_2782, _2770, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2796 = fma(_2782, _2774, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2798 = fma(_2782, _2778, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2730 = _2788;
            _2712 = _2796;
            _2724 = _2790;
            _2676 = _2794;
            _2738 = _2792;
            _2718 = _2798;
            _2800 = true;
        }
        else
        {
            bool _2802 = _1823 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2804 = isnan(_1823);
            bool _2806 = _2802 || _2804;
            bool _2808 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2810 = _2806 || _2808;
            if (!_2810)
            {
                _2674 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2812 = _2674;
            _2676 = _2812;
            if (!_2810)
            {
                _2710 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2814 = _2710;
            _2712 = _2814;
            if (!_2810)
            {
                _2716 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2816 = _2716;
            _2718 = _2816;
            if (!_2810)
            {
                _2722 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2818 = _2722;
            _2724 = _2818;
            if (!_2810)
            {
                _2728 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2820 = _2728;
            _2730 = _2820;
            if (!_2810)
            {
                _2736 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2822 = _2736;
            bool _2824 = !_2810;
            _2738 = _2822;
            if (!_2824)
            {
                bool _2826 = _1823 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2828 = isnan(_1823);
                bool _2830 = _2826 || _2828;
                bool _2832 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2834 = _2830 || _2832;
                if (!_2834)
                {
                    float _2836 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2838 = _1823 + _2836;
                    float _2840 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2842 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2840;
                    float _2844 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2846 = _2844 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2848 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2850 = _2848 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2852 = 1.0 / _2842;
                    float _2854 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2856 = _2854 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2858 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2860 = _2858 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2862 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2864 = _2862 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2866 = _2838 * _2852;
                    float _2868 = precise::clamp(_2866, 0.0, 1.0);
                    float _2870 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2872 = _2870 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2874 = fma(_2868, _2846, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2876 = fma(_2868, _2850, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2878 = fma(_2868, _2872, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2880 = fma(_2868, _2856, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2882 = fma(_2868, _2860, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2884 = fma(_2868, _2864, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2730 = _2874;
                    _2712 = _2882;
                    _2724 = _2876;
                    _2676 = _2880;
                    _2738 = _2878;
                    _2718 = _2884;
                    _2800 = true;
                }
                else
                {
                    _2730 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2712 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2724 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2676 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2738 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2718 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2800 = false;
    float _2886 = _2730;
    float _2888 = _2712;
    float _2890 = _2724;
    float _2892 = _2676;
    float _2894 = _2738;
    float _2896 = _2718;
    float _2898 = _2700 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2900 = fma(_2658, -0.5, 0.5);
    float _2902 = precise::clamp(_2900, 0.0, 1.0);
    float _2904 = -_2886;
    float _2906 = _2888 + _2904;
    float _2908 = -_2890;
    float _2910 = _2892 + _2908;
    out.m_47.x = _2898;
    float _2912 = -_2894;
    float _2914 = _2896 + _2912;
    float _2916 = fma(_2902, _2906, _2886);
    float _2918 = fma(_2902, _2910, _2890);
    bool _2920 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2922 = _2916 * 0.586610972881317138671875;
    float _2924 = fma(_2902, _2914, _2894);
    out.m_90.x = 0.0;
    bool _2926 = _1743 > 0.0;
    bool _2928 = isnan(_1743);
    bool _2930 = _2926 || _2928;
    bool _2932 = isnan(0.0);
    bool _2934 = _2930 || _2932;
    float _2936 = fma(_2918, 0.298911988735198974609375, _2922);
    bool _2938 = _1801 <= 0.0;
    bool _2940 = !_2934;
    bool _2942 = _2938 || _2940;
    float _2944 = fma(_2924, 0.114477999508380889892578125, _2936);
    float _2946 = -_2944;
    float _2948 = _2918 + _2946;
    float _2950 = fma(_2948, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2944);
    bool _2952 = !_2920;
    if (!_2952)
    {
        float _2954 = -_1677;
        float _2956 = _2954 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2958 = -_1679;
        float _2960 = _2958 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2962 = -_1681;
        float _2964 = _2962 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2966 = _2956 * _2956;
        float _2968 = fma(_2960, _2960, _2966);
        float _2970 = fma(_2964, _2964, _2968);
        float _2972 = sqrt(_2970);
        float _2974 = rsqrt(_2970);
        float _2976 = -_2972;
        float _2978 = _2976 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2980 = _2978 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2982 = precise::clamp(_2980, 0.0, 1.0);
        float _2984 = _2960 * _2974;
        float _2986 = _2956 * _2974;
        float _2988 = abs(_2982);
        float _2990 = log2(_2988);
        float _2992 = _2964 * _2974;
        float _2994 = _2984 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2996 = _2658 * _2986;
        float _2998 = -_2986;
        float _3000 = -_2994;
        float _3002 = fma(_2998, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3000);
        float _3004 = fma(_2666, _2984, _2996);
        float _3006 = -_2992;
        float _3008 = fma(_3006, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3002);
        float _3010 = fma(_2668, _2992, _3004);
        float _3012 = precise::clamp(_3010, 0.0, 1.0);
        float _3014 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3016 = _3008 + _3014;
        float _3018 = _2990 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3020 = _3016 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3022 = precise::clamp(_3020, 0.0, 1.0);
        float _3024 = exp2(_3018);
        float _3026 = _3024 * _3022;
        float _3028 = _3012 * _3026;
        float _3030 = _3028 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        out.m_90.x = _3030;
    }
    out.m_92.x = _2950;
    if (!_2942)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _3032 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3032;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

