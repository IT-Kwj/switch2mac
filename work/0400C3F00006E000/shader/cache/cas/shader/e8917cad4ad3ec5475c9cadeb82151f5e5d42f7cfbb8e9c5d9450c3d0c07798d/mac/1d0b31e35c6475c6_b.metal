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
    bool _2838 = false;
    bool _737 = false;
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
        float _3127 = as_type<float>(_127);
        out.gl_Position.z = _3127;
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
        float _3196 = as_type<float>(_165);
        out.gl_Position.z = _3196;
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
    float _527 = fma(_487, _439, _515);
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _529;
    float _533 = fma(_489, _439, _517);
    float _535 = fma(_525, _375, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _541 = fma(_519, _425, _527);
    float _543 = fma(_531, _375, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _549 = fma(_521, _425, _533);
    float _551 = fma(_539, _417, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _553 = fma(_535, _423, _541);
    float _555 = fma(_547, _417, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _557 = fma(_543, _423, _549);
    float _559 = fma(_551, _411, _553);
    float _561 = fma(_555, _411, _557);
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
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _599 = _595 + _597;
    float _601 = in.m_64.x;
    float _603 = in.m_64.y;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _609 = _595 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _611 = isnan(_595);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _625 = _595 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _627 = isnan(_595);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _637;
    bool _641 = _595 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _643 = isnan(_595);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = 1.0 / _607;
    float _655 = -_619;
    float _657 = _655 + 1.0;
    bool _659 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _661 = _635 * _657;
    float _663 = -_635;
    float _665 = _663 + 1.0;
    float _667 = 1.0 / _623;
    float _669 = _639 * _653;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _675 = _565 * _603;
    float _677 = _563 * _601;
    float _679 = fma(_669, _599, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _681 = _673 * _667;
    float _683 = _679 * _661;
    float _685 = -_651;
    float _687 = _685 + 1.0;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _691 = _595 + _689;
    float _693 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[115].x, _683);
    float _695 = _619 * _687;
    float _697 = fma(_681, _691, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _699 = fma(_697, _695, _693);
    float _701 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[117].x, _699);
    float _703 = _701 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.w = _703;
    bool _705 = !_659;
    float _707 = _595;
    int _709 = as_type<int>(_665);
    int _711 = as_type<int>(_599);
    int _713 = as_type<int>(_695);
    int _715 = as_type<int>(_681);
    float _717 = _603;
    float _735;
    if (!_705)
    {
        float _719 = in.m_62.x;
        float _721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _723 = _719 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _725 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[11].w, _145);
        float _727 = _725 * _721;
        float _729 = floor(_727);
        float _731 = -_729;
        float _733 = _727 + _731;
        _707 = _729;
        _735 = _733;
        _737 = true;
    }
    else
    {
        float _739 = float(_111);
        float _741 = 1.0 / _739;
        float _743 = _145 * _741;
        _735 = _743;
    }
    _737 = false;
    float _745 = _707;
    float _747 = _735;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _751 = _749 != 0;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _755 = _745;
    float _757 = _697;
    if (_751)
    {
        float _759 = in.m_62.x;
        float _761 = in.m_62.y;
        float _763 = in.m_62.z;
        _753 = _759;
        _755 = _761;
        _757 = _763;
    }
    float _765 = _753;
    float _767 = _755;
    float _769 = _757;
    if (_751)
    {
        _709 = 0;
    }
    int _771 = _709;
    float _773 = _769;
    float _775 = _767;
    int _777 = _771;
    float _779 = _765;
    if (_751)
    {
        _711 = as_type<int>(_765);
    }
    int _781 = _711;
    int _783 = _781;
    if (_751)
    {
        _713 = as_type<int>(_767);
    }
    int _785 = _713;
    int _787 = _785;
    if (_751)
    {
        _715 = as_type<int>(_769);
    }
    int _789 = _715;
    int _791 = _789;
    if (!_751)
    {
        float _793 = in.m_62.x;
        float _795 = in.m_62.y;
        float _797 = in.m_62.z;
        float _799 = _793 * 3.1415927410125732421875;
        float _801 = _799 * 0.15915493667125701904296875;
        float _803 = _795 * 3.1415927410125732421875;
        float _805 = _803 * 0.15915493667125701904296875;
        float _807 = _797 * 3.1415927410125732421875;
        float _809 = _801 * 6.283185482025146484375;
        float _811 = sin(_809);
        float _813 = _807 * 0.15915493667125701904296875;
        float _815 = _805 * 6.283185482025146484375;
        float _817 = sin(_815);
        float _819 = _813 * 6.283185482025146484375;
        float _821 = sin(_819);
        _773 = _797;
        _775 = _795;
        _777 = 1;
        _779 = _793;
        _791 = as_type<int>(_821);
        _787 = as_type<int>(_817);
        _783 = as_type<int>(_811);
    }
    float _823 = _773;
    float _825 = _775;
    int _827 = _777;
    float _829 = _779;
    int _831 = _791;
    int _833 = _787;
    int _835 = _783;
    float _837 = _823 * 2.0;
    float _839 = _825 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _841 = _827 != 1;
    float _843 = _825 + _823;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _847 = floor(_837);
    float _849 = _829 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _851 = fma(_839, -2.0, _845);
    bool _853 = !_841;
    float _855 = _853 ? as_type<float>(_831) : as_type<float>(_833);
    float _857 = _829 * 2.0;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _861 = _843 + (-1.0);
    float _863 = -_859;
    float _865 = fma(_849, 2.0, _863);
    float _867 = floor(_857);
    bool _869 = _825 > 0.5;
    float _871 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _873 = !_841;
    float _875 = _873 ? as_type<float>(_833) : as_type<float>(_835);
    float _877 = _825 * 2.0;
    float _879 = -_221;
    int _881 = _869 ? as_type<int>(_879) : as_type<int>(_221);
    float _883 = -_145;
    float _885 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[76].x, _865);
    bool _887 = _847 > 0.0;
    float _889 = floor(_877);
    bool _891 = _847 >= 0.0;
    bool _893 = isnan(_847);
    bool _895 = _891 || _893;
    bool _897 = isnan(0.0);
    bool _899 = _895 || _897;
    float _901 = _675 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _903 = _861;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    float _907 = as_type<float>(_833);
    float _909 = _847;
    if (!_841)
    {
        _717 = _829;
    }
    float _911 = _717;
    float _913 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _917 = _915 != 0;
    int _919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _921 = _919 != 0;
    float _923 = _911;
    if (!_841)
    {
        _903 = _825;
    }
    float _925 = _903;
    float _927 = _925;
    if (!_841)
    {
        _905 = _825;
    }
    float _929 = _905;
    float _931 = _929;
    if (!_841)
    {
        _907 = _823;
    }
    float _933 = _907;
    float _935 = _933;
    if (!_841)
    {
        _909 = _823;
    }
    float _937 = _909;
    bool _939 = _867 > 0.0;
    float _941 = _937;
    if (_841)
    {
        _923 = _823;
    }
    float _943 = _923;
    if (_841)
    {
        _927 = _829;
    }
    float _945 = _927;
    if (_841)
    {
        _931 = _829;
    }
    float _947 = _931;
    if (_841)
    {
        _935 = _825;
    }
    float _949 = _935;
    if (_841)
    {
        _941 = _825;
    }
    float _951 = _941;
    bool _953 = _823 > 0.5;
    bool _955 = !_917;
    float _957 = _955 ? _221 : as_type<float>(_881);
    bool _959 = _867 >= 0.0;
    bool _961 = isnan(_867);
    bool _963 = _959 || _961;
    bool _965 = isnan(0.0);
    bool _967 = _963 || _965;
    float _969 = -_205;
    int _971 = _953 ? as_type<int>(_969) : as_type<int>(_205);
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _975 = _967 ? 0 : 1;
    bool _977 = !_921;
    float _979 = _977 ? _205 : as_type<float>(_971);
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    int _983 = _899 ? 0 : 1;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _989 = _987 != 0;
    int _991 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _993 = _991 != 0;
    int _995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _997 = _995 != 0;
    float _999 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[98].w, _981);
    int _1001 = ~_975;
    int _1003 = _1001 + 1;
    int _1005 = _1003 + 1;
    float _1007 = _855 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _1009 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[83].z, _985);
    int _1011 = _1005;
    bool _1013 = _869;
    float _1015 = _979;
    if (!_939)
    {
        int _1017 = ~_975;
        int _1019 = _1017 + 1;
        _1011 = _1019;
    }
    int _1021 = _1011;
    float _1023 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[83].w, _973);
    float _1025 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1027 = log2(_1025);
    bool _1029 = !_993;
    int _1031 = _1029 ? 0 : 1;
    float _1033 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    bool _1037 = _889 > 0.0;
    float _1039 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[98].z, _1033);
    int _1041 = abs(_1031);
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _1045 = _875 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _1047 = fma(_1007, -2.0, _1035);
    float _1049 = _949 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1051 = _889 >= 0.0;
    bool _1053 = isnan(_889);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan(0.0);
    bool _1059 = _1055 || _1057;
    float _1061 = -_1043;
    float _1063 = fma(_1045, 2.0, _1061);
    float _1065 = _945 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1067 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    int _1069 = _1059 ? 0 : 1;
    float _1071 = _1027 * _145;
    float _1073 = float(_1021);
    float _1075 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1067);
    float _1077 = float(_1041);
    float _1079 = exp2(_1071);
    float _1081 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _851);
    int _1083 = ~_1069;
    int _1085 = _1083 + 1;
    int _1087 = _1085 + 1;
    float _1089 = _1077 * _1073;
    int _1091 = _1087;
    if (!_1037)
    {
        int _1093 = ~_1069;
        int _1095 = _1093 + 1;
        _1091 = _1095;
    }
    int _1097 = _1091;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1101 = ~_983;
    int _1103 = _1101 + 1;
    int _1105 = _1103 + 1;
    float _1107 = in.m_68.x;
    float _1109 = in.m_68.y;
    float _1111 = in.m_68.z;
    int _1113 = _1105;
    if (!_887)
    {
        int _1115 = ~_983;
        int _1117 = _1115 + 1;
        _1113 = _1117;
    }
    int _1119 = _1113;
    float _1121 = fma(_1049, -2.0, _1099);
    float _1123 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[97].z, _1039);
    float _1125 = _1089 * (-2.0);
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1129 = 1.0 + _1127;
    bool _1131 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1133 = isnan(1.0);
    bool _1135 = _1131 || _1133;
    bool _1137 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1139 = _1135 || _1137;
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1143 = -_1079;
    float _1145 = _1143 + 1.0;
    float _1147 = 1.0 / _1129;
    float _1149 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1151 = -_1141;
    float _1153 = fma(_1065, 2.0, _1151);
    float _1155 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[96].y, _1047);
    bool _1157 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1159 = isnan(0.0);
    bool _1161 = _1157 || _1159;
    bool _1163 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1165 = _1161 || _1163;
    float _1167 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1149);
    float _1169 = _825 + (-0.5);
    float _1171 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1173 = _1165 ? _1145 : 0.0;
    float _1175 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1009);
    float _1177 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1023);
    float _1179 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1171);
    float _1181 = fma(_1125, _1109, _1109);
    bool _1183 = !_989;
    int _1185 = _1183 ? 0 : 1;
    float _1187 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1167);
    float _1189 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1179);
    float _1191 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[97].w, _999);
    float _1193 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1075);
    float _1195 = -_145;
    float _1197 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[96].x, _1063);
    float _1199 = -_145;
    float _1201 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1153);
    float _1203 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1121);
    if (_1139)
    {
        float _1205 = _1173 * _1147;
        _149 = _1205;
    }
    float _1207 = _149;
    float _1209 = fma(_871, _1125, _871);
    float _1211 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1181);
    bool _1213 = !_997;
    int _1215 = _1213 ? 0 : 1;
    float _1217 = _825 + _829;
    int _1219 = abs(_1185);
    float _1221 = _829 + _823;
    int _1223 = abs(_1215);
    float _1225 = _1217 + (-1.0);
    float _1227 = _1221 + (-1.0);
    float _1229 = float(_1119);
    float _1231 = _823 + (-0.5);
    float _1233 = float(_1219);
    float _1235 = fma(_1209, _1207, _1211);
    float _1237 = float(_1097);
    float _1239 = float(_1223);
    float _1241 = _1233 * _1229;
    float _1243 = _1235 * 0.15915493667125701904296875;
    float _1245 = _1239 * _1237;
    float _1247 = _1241 * (-2.0);
    float _1249 = fma(_1227, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1251 = _1243 * 6.283185482025146484375;
    float _1253 = sin(_1251);
    float _1255 = fma(_1225, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1257 = _1245 * (-2.0);
    float _1259 = fma(_1247, _1107, _1107);
    float _1261 = _829 + (-0.5);
    float _1263 = fma(_1255, _1247, _1255);
    float _1265 = fma(_1257, _1111, _1111);
    float _1267 = fma(_1249, _1257, _1249);
    float _1269 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1259);
    float _1271 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1265);
    float _1273 = in.m_44.x;
    float _1275 = in.m_44.y;
    float _1277 = in.m_44.z;
    float _1279 = fma(_1263, _1207, _1269);
    float _1281 = fma(_1267, _1207, _1271);
    float _1283 = _1243 * 6.283185482025146484375;
    float _1285 = cos(_1283);
    float _1287 = _1279 * 0.15915493667125701904296875;
    float _1289 = _677 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1291 = _1281 * 0.15915493667125701904296875;
    float _1293 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _1295 = _1287 * 6.283185482025146484375;
    float _1297 = sin(_1295);
    float _1299 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _1301 = _1289 * _1293;
    float _1303 = _901 * _1299;
    float _1305 = _1291 * 6.283185482025146484375;
    float _1307 = cos(_1305);
    float _1309 = _177 * _1275;
    float _1311 = _189 * _1275;
    float _1313 = _1287 * 6.283185482025146484375;
    float _1315 = cos(_1313);
    float _1317 = _1297 * _1253;
    float _1319 = _1297 * _1285;
    float _1321 = fma(_175, _1273, _1309);
    float _1323 = fma(_187, _1273, _1311);
    float _1325 = in.m_58.w;
    float _1327 = fma(_179, _1277, _1321);
    float _1329 = _1291 * 6.283185482025146484375;
    float _1331 = sin(_1329);
    float _1333 = _1297 * _1307;
    float _1335 = _1285 * _1307;
    float _1337 = in.m_56.w;
    float _1339 = _1315 * _1285;
    float _1341 = _1315 * _1253;
    float _1343 = _1315 * _1307;
    float _1345 = _1253 * _1307;
    float _1347 = _1343 * _1303;
    float _1349 = fma(_1331, _1339, _1317);
    float _1351 = -_1303;
    float _1353 = _1331 * _1351;
    float _1355 = -_1319;
    float _1357 = fma(_1331, _1341, _1355);
    float _1359 = -_1341;
    float _1361 = fma(_1331, _1319, _1359);
    float _1363 = fma(_1349, _1301, _1347);
    float _1365 = _1333 * _1303;
    float _1367 = fma(_1335, _1301, _1353);
    float _1369 = fma(_1331, _1317, _1339);
    float _1371 = fma(_1357, _913, _1363);
    float _1373 = fma(_1361, _1301, _1365);
    float _1375 = fma(_1345, _913, _1367);
    float _1377 = _183 * _1275;
    float _1379 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1381 = fma(_1369, _913, _1373);
    float _1383 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1385 = fma(_181, _1273, _1377);
    float _1387 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1379);
    float _1389 = _1327 + _1337;
    float _1391 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1383);
    float _1393 = fma(_185, _1277, _1385);
    float _1395 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1387);
    float _1397 = in.m_60.w;
    float _1399 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1391);
    float _1401 = _1393 + _1325;
    float _1403 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1405 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1407 = _1399 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1409 = _1389 + _1403;
    float _1411 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1405);
    float _1413 = _1401 + _1407;
    float _1415 = fma(_191, _1277, _1323);
    float _1417 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1419 = _1409 + _1417;
    float _1421 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1411);
    float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1425 = _1413 + _1423;
    float _1427 = _1419 * _1419;
    float _1429 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1431 = fma(_1425, _1425, _1427);
    float _1433 = sqrt(_1431);
    float _1435 = _1415 + _1397;
    float _1437 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1439 = _1435 + _1429;
    float _1441 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1437);
    float _1443 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1441);
    bool _1445 = _1433 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1447 = _1273;
    float _1449 = _1433;
    float _1451 = _1397;
    if (!_1445)
    {
        _1447 = _1413;
    }
    float _1453 = _1447;
    float _1455 = _1453;
    if (!_1445)
    {
        _231 = _1409;
    }
    float _1457 = _231;
    float _1459 = _1457;
    if (!_1445)
    {
        _233 = _1439;
    }
    float _1461 = _233;
    bool _1463 = !_1445;
    float _1465 = _1461;
    if (!_1463)
    {
        float _1467 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1469 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1471 = _1433 + _1469;
        float _1473 = rsqrt(_1431);
        float _1475 = _1471 * _1467;
        float _1477 = _1439 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1479 = _1475 * 0.15915493667125701904296875;
        float _1481 = _1479 * 6.283185482025146484375;
        float _1483 = cos(_1481);
        float _1485 = _1479 * 6.283185482025146484375;
        float _1487 = sin(_1485);
        float _1489 = _1483 + (-1.0);
        float _1491 = fma(_1487, _1477, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1493 = _1489 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1495 = _1473 * _1491;
        float _1497 = fma(_1439, _1483, _1493);
        float _1499 = fma(_1425, _1495, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1501 = fma(_1419, _1495, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1465 = _1497;
        _1455 = _1499;
        _1459 = _1501;
    }
    float _1503 = _1465;
    float _1505 = _1455;
    float _1507 = _1459;
    float _1509 = -_1435;
    float _1511 = _1509 + _1503;
    float _1513 = _1443 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1515 = -_1401;
    float _1517 = _1515 + _1505;
    float _1519 = -_1389;
    float _1521 = _1519 + _1507;
    float _1523 = _1511 * _1511;
    float _1525 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1527 = 1.0 / _1513;
    float _1529 = fma(_1517, _1517, _1523);
    float _1531 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1525);
    bool _1533 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1535 = isnan(0.5);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1541 = _1537 || _1539;
    float _1543 = fma(_1521, _1521, _1529);
    float _1545 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1531);
    bool _1547 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1549 = isnan(0.5);
    bool _1551 = _1547 || _1549;
    bool _1553 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1555 = _1551 || _1553;
    float _1557 = sqrt(_1543);
    float _1559 = _1545 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1561 = _1559 + _1513;
    float _1563 = _1561 * _1527;
    float _1565 = _1563 * 0.5;
    bool _1567 = _1557 > 0.0;
    float _1569 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1571 = fma(_1565, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1569);
    float _1573 = 1.0 / _1571;
    bool _1575 = !_1567;
    float _1577 = _1505;
    float _1579 = _1503;
    float _1581 = _1507;
    float _1583 = _1517;
    float _1585 = _1511;
    float _1587 = _1543;
    bool _1589 = _1541;
    if (!_1575)
    {
        float _1591 = _227 * _227;
        float _1593 = rsqrt(_1543);
        float _1595 = fma(_225, _225, _1591);
        float _1597 = fma(_217, _217, _1595);
        float _1599 = sqrt(_1597);
        float _1601 = _1517 * _1593;
        float _1603 = _1521 * _1593;
        bool _1605 = _1599 > 0.0;
        float _1607 = _1511 * _1593;
        bool _1609 = !_1605;
        if (!_1609)
        {
            float _1611 = rsqrt(_1597);
            float _1613 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1615 = _227 * _1611;
            float _1617 = _225 * _1611;
            float _1619 = _1607 * _1615;
            float _1621 = _217 * _1611;
            float _1623 = fma(_1601, _1617, _1619);
            float _1625 = _1613 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1627 = fma(_1603, _1621, _1623);
            float _1629 = _1627 * _1625;
            float _1631 = fma(_225, _1629, _1505);
            float _1633 = fma(_227, _1629, _1503);
            float _1635 = fma(_217, _1629, _1507);
            _1577 = _1631;
            _1579 = _1633;
            _1581 = _1635;
            _1583 = _1629;
        }
    }
    float _1637 = _1577;
    float _1639 = _1579;
    float _1641 = _1581;
    float _1643 = _1583;
    float _1645 = _1643;
    if (_1555)
    {
        _235 = 1.0;
    }
    float _1647 = _235;
    float _1649 = _1647;
    if (_1541)
    {
        _1585 = _1637;
    }
    float _1651 = _1585;
    float _1653 = _1651;
    if (_1541)
    {
        _1587 = _1639;
    }
    float _1655 = _1587;
    float _1657 = _1655;
    if (_1541)
    {
        _1449 = _1641;
    }
    float _1659 = _1449;
    float _1661 = _1659;
    if (!_1541)
    {
        float _1663 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1665 = _1435 + _1663;
        float _1667 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1669 = _1401 + _1667;
        float _1671 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1673 = -_1435;
        float _1675 = _1673 + _1639;
        float _1677 = _1665 * _1665;
        float _1679 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1681 = _1389 + _1679;
        float _1683 = fma(_1669, _1669, _1677);
        float _1685 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1687 = fma(_1681, _1681, _1683);
        float _1689 = sqrt(_1687);
        float _1691 = _1671 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1693 = precise::min(_1689, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1695 = _1693 * _1685;
        float _1697 = -_1401;
        float _1699 = _1697 + _1637;
        float _1701 = _1691 * _1695;
        float _1703 = -_1389;
        float _1705 = _1703 + _1641;
        float _1707 = fma(_1699, _1701, _1401);
        float _1709 = fma(_1675, _1701, _1435);
        float _1711 = fma(_1705, _1701, _1389);
        _1645 = _1671;
        _1657 = _1709;
        _1653 = _1707;
        _1661 = _1711;
    }
    float _1713 = _1645;
    float _1715 = _1657;
    float _1717 = _1653;
    float _1719 = _1661;
    float _1721 = _1713;
    if (_1555)
    {
        _1451 = 1.0;
    }
    float _1723 = _1451;
    float _1725 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1727 = _1573 * _1725;
    float _1729 = _1723;
    if (!_1555)
    {
        float _1731 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1733 = _1731 * 0.15915493667125701904296875;
        float _1735 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1737 = _1733 * 6.283185482025146484375;
        float _1739 = cos(_1737);
        float _1741 = _1735 * 0.15915493667125701904296875;
        float _1743 = _1733 * 6.283185482025146484375;
        float _1745 = sin(_1743);
        float _1747 = 1.0 / _1739;
        float _1749 = _1741 * 6.283185482025146484375;
        float _1751 = cos(_1749);
        float _1753 = _1745 * _1747;
        float _1755 = _1741 * 6.283185482025146484375;
        float _1757 = sin(_1755);
        float _1759 = _1751 * _1753;
        float _1761 = 1.0 / _1759;
        float _1763 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1765 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1763;
        float _1767 = 1.0 / _1765;
        float _1769 = _1757 * _1761;
        float _1771 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1773 = fma(_1727, _1769, _1771);
        float _1775 = _1773 * _1767;
        float _1777 = precise::clamp(_1775, 0.0, 1.0);
        _1721 = _1773;
        _1649 = _1777;
    }
    float _1779 = _1721;
    float _1781 = _1649;
    float _1783 = _1779;
    if (!_1555)
    {
        float _1785 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1787 = _1785 * 0.15915493667125701904296875;
        float _1789 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1791 = _1787 * 6.283185482025146484375;
        float _1793 = cos(_1791);
        float _1795 = _1789 * 0.15915493667125701904296875;
        float _1797 = _1787 * 6.283185482025146484375;
        float _1799 = sin(_1797);
        float _1801 = 1.0 / _1793;
        float _1803 = _1795 * 6.283185482025146484375;
        float _1805 = cos(_1803);
        float _1807 = _1799 * _1801;
        float _1809 = _1795 * 6.283185482025146484375;
        float _1811 = sin(_1809);
        float _1813 = _1805 * _1807;
        float _1815 = 1.0 / _1813;
        float _1817 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1819 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1817;
        float _1821 = 1.0 / _1819;
        float _1823 = _1811 * _1815;
        float _1825 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1827 = fma(_1727, _1823, _1825);
        float _1829 = _1827 * _1821;
        float _1831 = precise::clamp(_1829, 0.0, 1.0);
        float _1833 = -_1831;
        float _1835 = _1833 + 1.0;
        _1783 = _1801;
        _1729 = _1835;
    }
    float _1837 = _1783;
    float _1839 = _1729;
    float _1841 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1843 = _1715 + _1841;
    float _1845 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1847 = _1717 + _1845;
    float _1849 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1851 = _1719 + _1849;
    float _1853 = _1843 * _1843;
    float _1855 = fma(_1847, _1847, _1853);
    float _1857 = fma(_1851, _1851, _1855);
    float _1859 = rsqrt(_1857);
    float _1861 = sqrt(_1857);
    float _1863 = _1859 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1865 = _1847 * _1863;
    float _1867 = _1851 * _1863;
    float _1869 = _1865 * _1865;
    float _1871 = _1867 * _1867;
    float _1873 = _1869 + _1871;
    float _1875 = sqrt(_1873);
    bool _1877 = _1875 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1879 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1881 = _1875 + _1879;
    float _1883 = _1851;
    float _1885 = _1873;
    float _1887 = _1881;
    float _1889 = _1837;
    float _1891 = _1863;
    if (_1877)
    {
        float _1893 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1883 = _1893;
    }
    float _1895 = _1883;
    if (_1877)
    {
        float _1897 = rsqrt(_1873);
        _1885 = _1897;
    }
    float _1899 = _1885;
    if (_1877)
    {
        float _1901 = _1881 * _1895;
        _1887 = _1901;
    }
    float _1903 = _1887;
    if (_1877)
    {
        float _1905 = _1903 * 0.15915493667125701904296875;
        _1889 = _1905;
    }
    float _1907 = _1889;
    float _1909 = _1853;
    float _1911 = _1907;
    if (_1877)
    {
        float _1913 = _1907 * 6.283185482025146484375;
        float _1915 = sin(_1913);
        _1909 = _1915;
    }
    float _1917 = _1909;
    float _1919 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1921 = precise::max(0.0, _1919);
    float _1923 = _1859;
    float _1925 = _1921;
    float _1927 = _1919;
    if (_1877)
    {
        float _1929 = _1907 * 6.283185482025146484375;
        float _1931 = cos(_1929);
        _1923 = _1931;
    }
    float _1933 = _1923;
    float _1935 = -_1863;
    float _1937 = -_1921;
    float _1939 = fma(_1843, _1935, _1937);
    float _1941 = _1939;
    if (!_1877)
    {
        _1925 = _1865;
    }
    float _1943 = _1925;
    float _1945 = _1943;
    if (_1877)
    {
        float _1947 = _1939 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1927 = _1947;
    }
    float _1949 = _1927;
    float _1951 = _1917;
    float _1953 = _1949;
    if (_1877)
    {
        float _1955 = fma(_1917, _1949, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1951 = _1955;
    }
    float _1957 = _1951;
    float _1959 = _1957;
    float _1961 = _1933;
    if (_1877)
    {
        float _1963 = _1933 + (-1.0);
        _1953 = _1963;
    }
    float _1965 = _1953;
    float _1967 = _1965;
    if (_1877)
    {
        float _1969 = _1899 * _1957;
        _1891 = _1969;
    }
    float _1971 = _1891;
    if (!_1877)
    {
        _1959 = _1869;
    }
    float _1973 = _1959;
    float _1975 = _1973;
    if (_1877)
    {
        float _1977 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1911 = _1977;
    }
    float _1979 = _1911;
    if (_1877)
    {
        float _1981 = _1865 * _1971;
        _1945 = _1981;
    }
    float _1983 = _1945;
    if (!_1877)
    {
        _1967 = _1867;
    }
    float _1985 = _1967;
    float _1987 = _1985;
    if (_1877)
    {
        float _1989 = _1867 * _1971;
        _1987 = _1989;
    }
    float _1991 = _1987;
    if (_1877)
    {
        float _1993 = fma(_1939, _1933, _1979);
        _1941 = _1993;
    }
    float _1995 = _1941;
    if (_1877)
    {
        float _1997 = _1983 * _1983;
        _1975 = _1997;
    }
    float _1999 = _1975;
    if (!_1877)
    {
        _1961 = _1871;
    }
    float _2001 = _1961;
    float _2003 = _2001;
    if (_1877)
    {
        float _2005 = _1991 * _1991;
        _2003 = _2005;
    }
    float _2007 = _2003;
    float _2009 = fma(_1995, _1995, _1999);
    float _2011 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2013 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2015 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2017 = _2009 + _2007;
    float _2019 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2011);
    float _2021 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2023 = fma(_1861, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2021);
    float _2025 = precise::clamp(_2023, 0.0, 1.0);
    float _2027 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2029 = rsqrt(_2017);
    float _2031 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2015);
    float _2033 = -_2025;
    float _2035 = _2033 + 1.0;
    float _2037 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2027);
    float _2039 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2019);
    float _2041 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2043 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2031);
    float _2045 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2037);
    float _2047 = abs(_2035);
    float _2049 = log2(_2047);
    float _2051 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2041);
    float _2053 = _2043 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2055 = _2045 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2057 = _2039 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2059 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2051);
    float _2061 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2063 = _2029 * _1983;
    float _2065 = _2029 * _1995;
    float _2067 = _2029 * _1991;
    float _2069 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2061);
    float _2071 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2073 = _2057 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2075 = _2059 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2077 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2069);
    float _2079 = -_2071;
    float _2081 = fma(_2065, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2079);
    float _2083 = _2049 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2085 = -_2073;
    float _2087 = fma(_2085, _2013, 1.0);
    float _2089 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2077);
    float _2091 = -_2067;
    float _2093 = fma(_2091, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2081);
    float _2095 = exp2(_2083);
    float _2097 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2099 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2101 = fma(_2093, -0.5, 0.5);
    float _2103 = _2065 + 1.0;
    float _2105 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2097);
    float _2107 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2099);
    float _2109 = log2(_2087);
    float _2111 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2105);
    float _2113 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2107);
    float _2115 = 1.0 / _2089;
    float _2117 = fma(_2093, 0.5, 0.5);
    float _2119 = -_2065;
    float _2121 = fma(_2095, _2103, _2119);
    float _2123 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2111);
    float _2125 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2113);
    float _2127 = fma(_2117, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2129 = fma(_2121, 0.5, 0.5);
    float _2131 = sqrt(_2101);
    float _2133 = _2109 * 0.693147182464599609375;
    float _2135 = fma(_2117, _2127, -0.212114393711090087890625);
    float _2137 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2139 = fma(_2117, _2135, 1.570728778839111328125);
    float _2141 = _2123 * _2115;
    float _2143 = _2125 * _2115;
    float _2145 = fma(_2143, -0.5, 0.5);
    float _2147 = _2131 * 0.636619746685028076171875;
    float _2149 = fma(_2141, 0.5, 0.5);
    float _2151 = -_2139;
    float _2153 = fma(_2147, _2151, 1.0);
    float3 _6269 = float3(_2149, _2145, _2137);
    float _2155 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6269, float3(0.0), isnan(_6269)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6269, float3(0.0), isnan(_6269)), level(0.0)).x;
    float3 _6280 = float3(_2149, _2145, _2137);
    float4 _2158 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6280, float3(0.0), isnan(_6280)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6280, float3(0.0), isnan(_6280)), level(0.0)).xyzw;
    float _2160 = _2158.x;
    float _2162 = _2158.y;
    float _2164 = _2158.z;
    float _2166 = _2158.w;
    float2 _6297 = float2(_2153, _2129);
    float3 _2170 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6297, float2(0.0), isnan(_6297)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6297, float2(0.0), isnan(_6297)), level(0.0)).xyz;
    float _2172 = _2170.x;
    float _2174 = _2170.y;
    float _2176 = _2170.z;
    int _2178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2180 = _2178 != 0;
    float _2182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2186 = _2184 != 0;
    float _2188 = _957 + 0.5;
    out.m_70.x = _1401;
    out.m_70.y = _1435;
    out.m_70.z = _1389;
    float _2190 = -_1175;
    float _2192 = _2190 + 1.0;
    float _2194 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2196 = _2194 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2198 = in.m_62.w;
    float _2200 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2202 = _2200 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2204 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2206 = isnan(_747);
    bool _2208 = _2204 || _2206;
    bool _2210 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2212 = _2208 || _2210;
    float _2214 = float(_2212);
    float _2216 = 1.0 / _2196;
    float _2218 = 0.0;
    float _2220 = _2123;
    if (_2180)
    {
        float _2222 = in.m_62.z;
        _2218 = _2222;
    }
    float _2224 = _2218;
    float _2226 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2228 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2226;
    bool _2230 = _829 > 0.5;
    float _2232 = -_2214;
    float _2234 = _2232 + 1.0;
    float _2236 = 0.0;
    if (_2186)
    {
        float _2238 = in.m_62.w;
        _2236 = _2238;
    }
    float _2240 = _2236;
    float _2242 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2244 = _2242 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2246 = -_221;
    int _2248 = _2230 ? as_type<int>(_2246) : as_type<int>(_221);
    float _2250 = 1.0 / _2202;
    bool _2252 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2254 = isnan(_747);
    bool _2256 = _2252 || _2254;
    bool _2258 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2260 = _2256 || _2258;
    float _2262 = float(_2260);
    float _2264 = -_1191;
    float _2266 = _2264 + 1.0;
    int _2268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2270 = _2268 != 0;
    float _2272 = _2049 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2274 = _2262 * _2234;
    float _2276 = -_2262;
    float _2278 = _2276 + 1.0;
    float _2280 = _2228 * _2216;
    float _2282 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2284 = _747 + _2282;
    float _2286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    bool _2288 = !_2270;
    float _2290 = _2288 ? _221 : as_type<float>(_2248);
    float _2292 = fma(_2280, _2284, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2294 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2296 = isnan(_747);
    bool _2298 = _2294 || _2296;
    bool _2300 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2302 = _2298 || _2300;
    float _2304 = float(_2302);
    bool _2306 = _2198 > 0.5;
    float _2308 = _2224;
    float _2310 = _2198;
    if (_2180)
    {
        float _2312 = _2224 * 3.1415927410125732421875;
        _2308 = _2312;
    }
    float _2314 = _2308;
    float _2316 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2318 = _2292 * _2274;
    float _2320 = _2314;
    if (!_2180)
    {
        _2310 = _221;
    }
    float _2322 = _2310;
    float _2324 = _2322;
    if (_2180)
    {
        float _2326 = _2314 * 0.15915493667125701904296875;
        _2320 = _2326;
    }
    float _2328 = _2320;
    float _2330 = _2240;
    if (_2186)
    {
        float _2332 = _2240 * 3.1415927410125732421875;
        _2330 = _2332;
    }
    float _2334 = _2330;
    float _2336 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2338 = _747 + _2336;
    float _2340 = fma(_2278, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2318);
    float _2342 = -_2304;
    float _2344 = _2342 + 1.0;
    float _2346 = _2334;
    if (_2186)
    {
        float _2348 = _2334 * 0.15915493667125701904296875;
        _2346 = _2348;
    }
    float _2350 = _2346;
    float _2352 = _2328;
    if (_2180)
    {
        float _2354 = _2328 * 6.283185482025146484375;
        float _2356 = sin(_2354);
        _2352 = _2356;
    }
    float _2358 = _2352;
    float _2360 = _2244 * _2250;
    int _2362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2364 = _2362 != 0;
    float _2366 = _2214 * _2344;
    float _2368 = _2286 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _2370 = fma(_2360, _2338, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2372 = _2182 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2374 = _2290 + 0.5;
    float _2376 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2378 = _2188 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2380 = fma(_2370, _2366, _2340);
    float _2382 = _2316 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2384 = fma(_2372, _2374, _885);
    float _2386 = fma(_2304, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2380);
    if (_2180)
    {
        bool _2388 = _2358 > 0.5;
        _1589 = _2388;
    }
    bool _2390 = _1589;
    float _2392 = _2350;
    if (_2186)
    {
        float _2394 = _2350 * 6.283185482025146484375;
        float _2396 = sin(_2394);
        _2392 = _2396;
    }
    float _2398 = _2392;
    float _2400 = -_205;
    int _2402 = _869 ? as_type<int>(_2400) : as_type<int>(_205);
    float _2404 = _2386 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_2180)
    {
        float _2406 = -_221;
        float _2408 = _2390 ? _2406 : _221;
        _2324 = _2408;
    }
    float _2410 = _2324;
    int _2412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2414 = _2412 != 0;
    int _2416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2418 = _2416 != 0;
    float _2420 = _1193 * (-0.15915493667125701904296875);
    bool _2422 = !_2414;
    float _2424 = _2422 ? _205 : as_type<float>(_2402);
    float _2426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2428 = _2410 + 0.5;
    out.m_72.w = _2404;
    float _2430 = _2424 + (-0.5);
    float _2432 = fma(_2368, _2428, _1197);
    if (_2186)
    {
        bool _2434 = _2398 > 0.5;
        _1013 = _2434;
    }
    bool _2436 = _1013;
    float _2438 = -_979;
    float _2440 = _2438 + 0.5;
    float _2442 = _2420 * 6.283185482025146484375;
    float _2444 = sin(_2442);
    float _2446 = -_2382;
    float _2448 = -_1081;
    float _2450 = fma(_2446, _2430, _2448);
    float _2452 = -_205;
    int _2454 = _2306 ? as_type<int>(_2452) : as_type<int>(_205);
    float _2456 = _2378 * _2376;
    if (!_2186)
    {
        _1015 = _205;
    }
    float _2458 = _1015;
    float _2460 = _2440 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2462 = _2458;
    if (_2186)
    {
        float _2464 = -_205;
        float _2466 = _2436 ? _2464 : _205;
        _2462 = _2466;
    }
    float _2468 = _2462;
    float _2470 = _2420 * 6.283185482025146484375;
    float _2472 = cos(_2470);
    float _2474 = _2460 * _2426;
    float _2476 = _2468 + (-0.5);
    out.m_74.x = _2456;
    out.m_74.y = _2474;
    float _2478 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    bool _2480 = !_2364;
    float _2482 = _2480 ? _205 : as_type<float>(_2454);
    float _2484 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2486 = -_221;
    int _2488 = _953 ? as_type<int>(_2486) : as_type<int>(_221);
    bool _2490 = _1861 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2492 = isnan(_1861);
    bool _2494 = _2490 || _2492;
    bool _2496 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2498 = _2494 || _2496;
    float _2500 = _2482 * _2444;
    bool _2502 = !_2418;
    float _2504 = _2502 ? _221 : as_type<float>(_2488);
    float _2506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2508 = _2482 * _2472;
    float _2510 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2512 = -_2500;
    float _2514 = fma(_2504, _2472, _2512);
    float _2516 = fma(_2504, _2444, _2508);
    float _2518 = -_1123;
    float _2520 = _2518 + 1.0;
    float _2522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2524 = _2478 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _2526 = -_2520;
    float _2528 = fma(_2526, _2410, _2432);
    float _2530 = -_1187;
    float _2532 = _2530 + 1.0;
    float _2534 = -_1177;
    float _2536 = _2534 + 1.0;
    float _2538 = -_2524;
    float _2540 = -_1155;
    float _2542 = fma(_2538, _2476, _2540);
    float _2544 = _2514 + 0.5;
    float _2546 = _2516 + (-0.5);
    float _2548 = _2506 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2550 = fma(_2424, _2532, _2450);
    float _2552 = fma(_2266, _2468, _2542);
    float _2554 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2556 = fma(_2548, _2544, _1201);
    float _2558 = -_1189;
    float _2560 = _2558 + 1.0;
    float _2562 = exp2(_2272);
    out.m_76.x = _2528;
    out.m_76.y = _2552;
    float _2564 = _2522 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2566 = -_2560;
    float _2568 = fma(_2290, _2566, _2384);
    float _2570 = -_2192;
    float _2572 = fma(_2514, _2570, _2556);
    float _2574 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2576 = -_2564;
    float _2578 = -_1203;
    float _2580 = fma(_2576, _2546, _2578);
    float _2582 = -_1331;
    float _2584 = fma(_2582, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2554);
    float _2586 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2588 = -_1331;
    float _2590 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2574);
    float _2592 = fma(_2516, _2536, _2580);
    float _2594 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2596 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2598 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2600 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_78.x = _2568;
    out.m_78.y = _2550;
    out.m_78.z = _2572;
    out.m_78.w = _2592;
    float _2602 = -_1331;
    float _2604 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2586);
    float _2606 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2594);
    float _2608 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2596);
    float _2610 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2598);
    float _2612 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2600);
    float _2614 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2590);
    float _2616 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2584);
    float _2618 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2604);
    float _2620 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2608);
    float _2622 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2606);
    float _2624 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2612);
    float _2626 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2610);
    float _2628 = _2484 * _2614;
    float _2630 = fma(_2484, _2484, 1.0);
    float _2632 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2634 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2636 = -_2562;
    float _2638 = _2636 + 1.0;
    float _2640 = rsqrt(_2630);
    float _2642 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2632);
    float _2644 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2634);
    float _2646 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2648 = fma(_2510, _2622, _2628);
    float _2650 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2642);
    float _2652 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2644);
    float _2654 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2646);
    out.m_80.x = _2622;
    out.m_80.y = _2620;
    out.m_80.z = _2624;
    float _2656 = _2484 * _2616;
    float _2658 = _2123 + _2089;
    float _2660 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2654);
    float _2662 = fma(_2510, _2620, _2656);
    float _2664 = _2658 * 0.5;
    float _2666 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2660);
    float _2668 = _2484 * _2640;
    float _2670 = _2666 + _2089;
    float _2672 = -_2626;
    float _2674 = _2668 * _2672;
    float _2676 = -_2650;
    float _2678 = _2668 * _2676;
    float _2680 = -_2652;
    float _2682 = _2668 * _2680;
    float _2684 = _2670 * 0.5;
    float _2686 = fma(_2640, _2614, _2674);
    float _2688 = fma(_2640, _2616, _2678);
    float _2690 = _2484 * _2618;
    float _2692 = fma(_2640, _2618, _2682);
    float _2694 = _2089 * 0.5;
    float _2696 = _2650 + _2662;
    float _2698 = fma(_2510, _2624, _2690);
    float _2700 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2702 = fma(_2125, -0.5, _2694);
    out.m_82.x = _2686;
    out.m_82.y = _2688;
    out.m_82.z = _2692;
    float _2704 = _2626 + _2648;
    float _2706 = _2652 + _2698;
    float _2708 = _2698;
    if (!_2498)
    {
        _2708 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2710 = _2708;
    out.m_84.x = _2664;
    out.m_84.y = _2702;
    out.m_84.z = _2684;
    out.m_84.w = _2089;
    out.m_86.x = _2704;
    out.m_86.y = _2696;
    out.m_86.z = _2706;
    out.gl_Position.x = _2123;
    out.gl_Position.y = _2125;
    out.gl_Position.z = _2666;
    out.gl_Position.w = _2089;
    float _2712 = _2710;
    float _2714 = _2710;
    if (!_2498)
    {
        _2220 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2716 = _2220;
    float _2718 = _2700 * _2155;
    float _2720 = -_2700;
    float _2722 = _2720 + 1.0;
    float _2724 = _2166 * _2718;
    float _2726 = _2176 * _2718;
    float _2728 = _2166 * _2722;
    float _2730 = _1781 * _1839;
    float _2732 = fma(_2172, _2724, _2160);
    float _2734 = fma(_2174, _2724, _2162);
    float _2736 = fma(_2166, _2726, _2164);
    float _2738 = _2730 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2740 = _2162;
    float _2742 = _2160;
    float _2744 = _2724;
    float _2746 = _2730;
    float _2748 = _2716;
    float _2750 = _2716;
    if (!_2498)
    {
        _2740 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2752 = _2740;
    float _2754 = _2752;
    float _2756 = _2752;
    if (!_2498)
    {
        _2742 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2758 = _2742;
    out.m_88.x = _2732;
    out.m_88.y = _2734;
    out.m_88.z = _2736;
    out.m_88.w = _2728;
    float _2760 = _2758;
    float _2762 = _2758;
    if (!_2498)
    {
        _2744 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2764 = _2744;
    float _2766 = _2764;
    float _2768 = _2764;
    if (!_2498)
    {
        _2746 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2770 = _2746;
    bool _2772 = !_2498;
    float _2774 = _2770;
    float _2776 = _2770;
    if (!_2772)
    {
        bool _2778 = _1861 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2780 = isnan(_1861);
        bool _2782 = _2778 || _2780;
        bool _2784 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2786 = _2782 || _2784;
        if (!_2786)
        {
            float _2788 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2790 = _1861 + _2788;
            float _2792 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2794 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2792;
            float _2796 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2798 = _2796 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2800 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2802 = _2800 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2804 = 1.0 / _2794;
            float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2808 = _2806 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2812 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2818 = _2790 * _2804;
            float _2820 = precise::clamp(_2818, 0.0, 1.0);
            float _2822 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2824 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2826 = fma(_2820, _2798, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2828 = fma(_2820, _2802, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2830 = fma(_2820, _2824, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2832 = fma(_2820, _2808, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2834 = fma(_2820, _2812, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2836 = fma(_2820, _2816, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2768 = _2826;
            _2750 = _2834;
            _2762 = _2828;
            _2714 = _2832;
            _2776 = _2830;
            _2756 = _2836;
            _2838 = true;
        }
        else
        {
            bool _2840 = _1861 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2842 = isnan(_1861);
            bool _2844 = _2840 || _2842;
            bool _2846 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2848 = _2844 || _2846;
            if (!_2848)
            {
                _2712 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2850 = _2712;
            _2714 = _2850;
            if (!_2848)
            {
                _2748 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2852 = _2748;
            _2750 = _2852;
            if (!_2848)
            {
                _2754 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2854 = _2754;
            _2756 = _2854;
            if (!_2848)
            {
                _2760 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2856 = _2760;
            _2762 = _2856;
            if (!_2848)
            {
                _2766 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2858 = _2766;
            _2768 = _2858;
            if (!_2848)
            {
                _2774 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2860 = _2774;
            bool _2862 = !_2848;
            _2776 = _2860;
            if (!_2862)
            {
                bool _2864 = _1861 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2866 = isnan(_1861);
                bool _2868 = _2864 || _2866;
                bool _2870 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2872 = _2868 || _2870;
                if (!_2872)
                {
                    float _2874 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2876 = _1861 + _2874;
                    float _2878 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2880 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2878;
                    float _2882 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2884 = _2882 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2886 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2888 = _2886 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2890 = 1.0 / _2880;
                    float _2892 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2894 = _2892 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2896 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2898 = _2896 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2900 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2902 = _2900 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2904 = _2876 * _2890;
                    float _2906 = precise::clamp(_2904, 0.0, 1.0);
                    float _2908 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2910 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2912 = fma(_2906, _2884, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2914 = fma(_2906, _2888, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2916 = fma(_2906, _2910, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2918 = fma(_2906, _2894, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2920 = fma(_2906, _2898, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2922 = fma(_2906, _2902, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2768 = _2912;
                    _2750 = _2920;
                    _2762 = _2914;
                    _2714 = _2918;
                    _2776 = _2916;
                    _2756 = _2922;
                    _2838 = true;
                }
                else
                {
                    _2768 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2750 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2762 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2714 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2776 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2756 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2838 = false;
    float _2924 = _2768;
    float _2926 = _2750;
    float _2928 = _2762;
    float _2930 = _2714;
    float _2932 = _2776;
    float _2934 = _2756;
    float _2936 = _2738 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2938 = fma(_2696, -0.5, 0.5);
    float _2940 = precise::clamp(_2938, 0.0, 1.0);
    float _2942 = -_2924;
    float _2944 = _2926 + _2942;
    float _2946 = -_2928;
    float _2948 = _2930 + _2946;
    out.m_47.x = _2936;
    float _2950 = -_2932;
    float _2952 = _2934 + _2950;
    float _2954 = fma(_2940, _2944, _2924);
    float _2956 = fma(_2940, _2948, _2928);
    bool _2958 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2960 = _2954 * 0.586610972881317138671875;
    float _2962 = fma(_2940, _2952, _2932);
    out.m_90.x = 0.0;
    bool _2964 = _1781 > 0.0;
    bool _2966 = isnan(_1781);
    bool _2968 = _2964 || _2966;
    bool _2970 = isnan(0.0);
    bool _2972 = _2968 || _2970;
    float _2974 = fma(_2956, 0.298911988735198974609375, _2960);
    bool _2976 = _1839 <= 0.0;
    bool _2978 = !_2972;
    bool _2980 = _2976 || _2978;
    float _2982 = fma(_2962, 0.114477999508380889892578125, _2974);
    float _2984 = -_2982;
    float _2986 = _2956 + _2984;
    float _2988 = fma(_2986, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2982);
    bool _2990 = !_2958;
    if (!_2990)
    {
        float _2992 = -_1715;
        float _2994 = _2992 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2996 = -_1717;
        float _2998 = _2996 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3000 = -_1719;
        float _3002 = _3000 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3004 = _2994 * _2994;
        float _3006 = fma(_2998, _2998, _3004);
        float _3008 = fma(_3002, _3002, _3006);
        float _3010 = sqrt(_3008);
        float _3012 = rsqrt(_3008);
        float _3014 = -_3010;
        float _3016 = _3014 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3018 = _3016 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3020 = precise::clamp(_3018, 0.0, 1.0);
        float _3022 = _2998 * _3012;
        float _3024 = _2994 * _3012;
        float _3026 = abs(_3020);
        float _3028 = log2(_3026);
        float _3030 = _3002 * _3012;
        float _3032 = _3022 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3034 = _2696 * _3024;
        float _3036 = -_3024;
        float _3038 = -_3032;
        float _3040 = fma(_3036, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3038);
        float _3042 = fma(_2704, _3022, _3034);
        float _3044 = -_3030;
        float _3046 = fma(_3044, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3040);
        float _3048 = fma(_2706, _3030, _3042);
        float _3050 = precise::clamp(_3048, 0.0, 1.0);
        float _3052 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3054 = _3046 + _3052;
        float _3056 = _3028 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3058 = _3054 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3060 = precise::clamp(_3058, 0.0, 1.0);
        float _3062 = exp2(_3056);
        float _3064 = _3062 * _3060;
        float _3066 = _3050 * _3064;
        float _3068 = _3066 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        out.m_90.x = _3068;
    }
    out.m_92.x = _2988;
    if (!_2980)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _3070 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3070;
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
    bool _2838 = false;
    bool _737 = false;
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
        float _3127 = as_type<float>(_127);
        out.gl_Position.z = _3127;
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
        float _3196 = as_type<float>(_165);
        out.gl_Position.z = _3196;
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
    float _527 = fma(_487, _439, _515);
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _529;
    float _533 = fma(_489, _439, _517);
    float _535 = fma(_525, _375, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _541 = fma(_519, _425, _527);
    float _543 = fma(_531, _375, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _549 = fma(_521, _425, _533);
    float _551 = fma(_539, _417, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _553 = fma(_535, _423, _541);
    float _555 = fma(_547, _417, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _557 = fma(_543, _423, _549);
    float _559 = fma(_551, _411, _553);
    float _561 = fma(_555, _411, _557);
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
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _599 = _595 + _597;
    float _601 = in.m_64.x;
    float _603 = in.m_64.y;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _609 = _595 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _611 = isnan(_595);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _625 = _595 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _627 = isnan(_595);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _637;
    bool _641 = _595 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _643 = isnan(_595);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = 1.0 / _607;
    float _655 = -_619;
    float _657 = _655 + 1.0;
    bool _659 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _661 = _635 * _657;
    float _663 = -_635;
    float _665 = _663 + 1.0;
    float _667 = 1.0 / _623;
    float _669 = _639 * _653;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _675 = _565 * _603;
    float _677 = _563 * _601;
    float _679 = fma(_669, _599, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _681 = _673 * _667;
    float _683 = _679 * _661;
    float _685 = -_651;
    float _687 = _685 + 1.0;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _691 = _595 + _689;
    float _693 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[115].x, _683);
    float _695 = _619 * _687;
    float _697 = fma(_681, _691, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _699 = fma(_697, _695, _693);
    float _701 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[117].x, _699);
    float _703 = _701 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.w = _703;
    bool _705 = !_659;
    float _707 = _595;
    int _709 = as_type<int>(_665);
    int _711 = as_type<int>(_599);
    int _713 = as_type<int>(_695);
    int _715 = as_type<int>(_681);
    float _717 = _603;
    float _735;
    if (!_705)
    {
        float _719 = in.m_62.x;
        float _721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _723 = _719 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _725 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[11].w, _145);
        float _727 = _725 * _721;
        float _729 = floor(_727);
        float _731 = -_729;
        float _733 = _727 + _731;
        _707 = _729;
        _735 = _733;
        _737 = true;
    }
    else
    {
        float _739 = float(_111);
        float _741 = 1.0 / _739;
        float _743 = _145 * _741;
        _735 = _743;
    }
    _737 = false;
    float _745 = _707;
    float _747 = _735;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _751 = _749 != 0;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _755 = _745;
    float _757 = _697;
    if (_751)
    {
        float _759 = in.m_62.x;
        float _761 = in.m_62.y;
        float _763 = in.m_62.z;
        _753 = _759;
        _755 = _761;
        _757 = _763;
    }
    float _765 = _753;
    float _767 = _755;
    float _769 = _757;
    if (_751)
    {
        _709 = 0;
    }
    int _771 = _709;
    float _773 = _769;
    float _775 = _767;
    int _777 = _771;
    float _779 = _765;
    if (_751)
    {
        _711 = as_type<int>(_765);
    }
    int _781 = _711;
    int _783 = _781;
    if (_751)
    {
        _713 = as_type<int>(_767);
    }
    int _785 = _713;
    int _787 = _785;
    if (_751)
    {
        _715 = as_type<int>(_769);
    }
    int _789 = _715;
    int _791 = _789;
    if (!_751)
    {
        float _793 = in.m_62.x;
        float _795 = in.m_62.y;
        float _797 = in.m_62.z;
        float _799 = _793 * 3.1415927410125732421875;
        float _801 = _799 * 0.15915493667125701904296875;
        float _803 = _795 * 3.1415927410125732421875;
        float _805 = _803 * 0.15915493667125701904296875;
        float _807 = _797 * 3.1415927410125732421875;
        float _809 = _801 * 6.283185482025146484375;
        float _811 = sin(_809);
        float _813 = _807 * 0.15915493667125701904296875;
        float _815 = _805 * 6.283185482025146484375;
        float _817 = sin(_815);
        float _819 = _813 * 6.283185482025146484375;
        float _821 = sin(_819);
        _773 = _797;
        _775 = _795;
        _777 = 1;
        _779 = _793;
        _791 = as_type<int>(_821);
        _787 = as_type<int>(_817);
        _783 = as_type<int>(_811);
    }
    float _823 = _773;
    float _825 = _775;
    int _827 = _777;
    float _829 = _779;
    int _831 = _791;
    int _833 = _787;
    int _835 = _783;
    float _837 = _823 * 2.0;
    float _839 = _825 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _841 = _827 != 1;
    float _843 = _825 + _823;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _847 = floor(_837);
    float _849 = _829 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _851 = fma(_839, -2.0, _845);
    bool _853 = !_841;
    float _855 = _853 ? as_type<float>(_831) : as_type<float>(_833);
    float _857 = _829 * 2.0;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _861 = _843 + (-1.0);
    float _863 = -_859;
    float _865 = fma(_849, 2.0, _863);
    float _867 = floor(_857);
    bool _869 = _825 > 0.5;
    float _871 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _873 = !_841;
    float _875 = _873 ? as_type<float>(_833) : as_type<float>(_835);
    float _877 = _825 * 2.0;
    float _879 = -_221;
    int _881 = _869 ? as_type<int>(_879) : as_type<int>(_221);
    float _883 = -_145;
    float _885 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[76].x, _865);
    bool _887 = _847 > 0.0;
    float _889 = floor(_877);
    bool _891 = _847 >= 0.0;
    bool _893 = isnan(_847);
    bool _895 = _891 || _893;
    bool _897 = isnan(0.0);
    bool _899 = _895 || _897;
    float _901 = _675 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _903 = _861;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    float _907 = as_type<float>(_833);
    float _909 = _847;
    if (!_841)
    {
        _717 = _829;
    }
    float _911 = _717;
    float _913 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _917 = _915 != 0;
    int _919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _921 = _919 != 0;
    float _923 = _911;
    if (!_841)
    {
        _903 = _825;
    }
    float _925 = _903;
    float _927 = _925;
    if (!_841)
    {
        _905 = _825;
    }
    float _929 = _905;
    float _931 = _929;
    if (!_841)
    {
        _907 = _823;
    }
    float _933 = _907;
    float _935 = _933;
    if (!_841)
    {
        _909 = _823;
    }
    float _937 = _909;
    bool _939 = _867 > 0.0;
    float _941 = _937;
    if (_841)
    {
        _923 = _823;
    }
    float _943 = _923;
    if (_841)
    {
        _927 = _829;
    }
    float _945 = _927;
    if (_841)
    {
        _931 = _829;
    }
    float _947 = _931;
    if (_841)
    {
        _935 = _825;
    }
    float _949 = _935;
    if (_841)
    {
        _941 = _825;
    }
    float _951 = _941;
    bool _953 = _823 > 0.5;
    bool _955 = !_917;
    float _957 = _955 ? _221 : as_type<float>(_881);
    bool _959 = _867 >= 0.0;
    bool _961 = isnan(_867);
    bool _963 = _959 || _961;
    bool _965 = isnan(0.0);
    bool _967 = _963 || _965;
    float _969 = -_205;
    int _971 = _953 ? as_type<int>(_969) : as_type<int>(_205);
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _975 = _967 ? 0 : 1;
    bool _977 = !_921;
    float _979 = _977 ? _205 : as_type<float>(_971);
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    int _983 = _899 ? 0 : 1;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _989 = _987 != 0;
    int _991 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _993 = _991 != 0;
    int _995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _997 = _995 != 0;
    float _999 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[98].w, _981);
    int _1001 = ~_975;
    int _1003 = _1001 + 1;
    int _1005 = _1003 + 1;
    float _1007 = _855 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _1009 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[83].z, _985);
    int _1011 = _1005;
    bool _1013 = _869;
    float _1015 = _979;
    if (!_939)
    {
        int _1017 = ~_975;
        int _1019 = _1017 + 1;
        _1011 = _1019;
    }
    int _1021 = _1011;
    float _1023 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[83].w, _973);
    float _1025 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1027 = log2(_1025);
    bool _1029 = !_993;
    int _1031 = _1029 ? 0 : 1;
    float _1033 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    bool _1037 = _889 > 0.0;
    float _1039 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[98].z, _1033);
    int _1041 = abs(_1031);
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _1045 = _875 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _1047 = fma(_1007, -2.0, _1035);
    float _1049 = _949 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1051 = _889 >= 0.0;
    bool _1053 = isnan(_889);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan(0.0);
    bool _1059 = _1055 || _1057;
    float _1061 = -_1043;
    float _1063 = fma(_1045, 2.0, _1061);
    float _1065 = _945 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1067 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    int _1069 = _1059 ? 0 : 1;
    float _1071 = _1027 * _145;
    float _1073 = float(_1021);
    float _1075 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1067);
    float _1077 = float(_1041);
    float _1079 = exp2(_1071);
    float _1081 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _851);
    int _1083 = ~_1069;
    int _1085 = _1083 + 1;
    int _1087 = _1085 + 1;
    float _1089 = _1077 * _1073;
    int _1091 = _1087;
    if (!_1037)
    {
        int _1093 = ~_1069;
        int _1095 = _1093 + 1;
        _1091 = _1095;
    }
    int _1097 = _1091;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1101 = ~_983;
    int _1103 = _1101 + 1;
    int _1105 = _1103 + 1;
    float _1107 = in.m_68.x;
    float _1109 = in.m_68.y;
    float _1111 = in.m_68.z;
    int _1113 = _1105;
    if (!_887)
    {
        int _1115 = ~_983;
        int _1117 = _1115 + 1;
        _1113 = _1117;
    }
    int _1119 = _1113;
    float _1121 = fma(_1049, -2.0, _1099);
    float _1123 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[97].z, _1039);
    float _1125 = _1089 * (-2.0);
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1129 = 1.0 + _1127;
    bool _1131 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1133 = isnan(1.0);
    bool _1135 = _1131 || _1133;
    bool _1137 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1139 = _1135 || _1137;
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1143 = -_1079;
    float _1145 = _1143 + 1.0;
    float _1147 = 1.0 / _1129;
    float _1149 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1151 = -_1141;
    float _1153 = fma(_1065, 2.0, _1151);
    float _1155 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[96].y, _1047);
    bool _1157 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1159 = isnan(0.0);
    bool _1161 = _1157 || _1159;
    bool _1163 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1165 = _1161 || _1163;
    float _1167 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1149);
    float _1169 = _825 + (-0.5);
    float _1171 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1173 = _1165 ? _1145 : 0.0;
    float _1175 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1009);
    float _1177 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1023);
    float _1179 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1171);
    float _1181 = fma(_1125, _1109, _1109);
    bool _1183 = !_989;
    int _1185 = _1183 ? 0 : 1;
    float _1187 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1167);
    float _1189 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1179);
    float _1191 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[97].w, _999);
    float _1193 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1075);
    float _1195 = -_145;
    float _1197 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[96].x, _1063);
    float _1199 = -_145;
    float _1201 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1153);
    float _1203 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1121);
    if (_1139)
    {
        float _1205 = _1173 * _1147;
        _149 = _1205;
    }
    float _1207 = _149;
    float _1209 = fma(_871, _1125, _871);
    float _1211 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1181);
    bool _1213 = !_997;
    int _1215 = _1213 ? 0 : 1;
    float _1217 = _825 + _829;
    int _1219 = abs(_1185);
    float _1221 = _829 + _823;
    int _1223 = abs(_1215);
    float _1225 = _1217 + (-1.0);
    float _1227 = _1221 + (-1.0);
    float _1229 = float(_1119);
    float _1231 = _823 + (-0.5);
    float _1233 = float(_1219);
    float _1235 = fma(_1209, _1207, _1211);
    float _1237 = float(_1097);
    float _1239 = float(_1223);
    float _1241 = _1233 * _1229;
    float _1243 = _1235 * 0.15915493667125701904296875;
    float _1245 = _1239 * _1237;
    float _1247 = _1241 * (-2.0);
    float _1249 = fma(_1227, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1251 = _1243 * 6.283185482025146484375;
    float _1253 = sin(_1251);
    float _1255 = fma(_1225, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1257 = _1245 * (-2.0);
    float _1259 = fma(_1247, _1107, _1107);
    float _1261 = _829 + (-0.5);
    float _1263 = fma(_1255, _1247, _1255);
    float _1265 = fma(_1257, _1111, _1111);
    float _1267 = fma(_1249, _1257, _1249);
    float _1269 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1259);
    float _1271 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1265);
    float _1273 = in.m_44.x;
    float _1275 = in.m_44.y;
    float _1277 = in.m_44.z;
    float _1279 = fma(_1263, _1207, _1269);
    float _1281 = fma(_1267, _1207, _1271);
    float _1283 = _1243 * 6.283185482025146484375;
    float _1285 = cos(_1283);
    float _1287 = _1279 * 0.15915493667125701904296875;
    float _1289 = _677 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1291 = _1281 * 0.15915493667125701904296875;
    float _1293 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _1295 = _1287 * 6.283185482025146484375;
    float _1297 = sin(_1295);
    float _1299 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _1301 = _1289 * _1293;
    float _1303 = _901 * _1299;
    float _1305 = _1291 * 6.283185482025146484375;
    float _1307 = cos(_1305);
    float _1309 = _177 * _1275;
    float _1311 = _189 * _1275;
    float _1313 = _1287 * 6.283185482025146484375;
    float _1315 = cos(_1313);
    float _1317 = _1297 * _1253;
    float _1319 = _1297 * _1285;
    float _1321 = fma(_175, _1273, _1309);
    float _1323 = fma(_187, _1273, _1311);
    float _1325 = in.m_58.w;
    float _1327 = fma(_179, _1277, _1321);
    float _1329 = _1291 * 6.283185482025146484375;
    float _1331 = sin(_1329);
    float _1333 = _1297 * _1307;
    float _1335 = _1285 * _1307;
    float _1337 = in.m_56.w;
    float _1339 = _1315 * _1285;
    float _1341 = _1315 * _1253;
    float _1343 = _1315 * _1307;
    float _1345 = _1253 * _1307;
    float _1347 = _1343 * _1303;
    float _1349 = fma(_1331, _1339, _1317);
    float _1351 = -_1303;
    float _1353 = _1331 * _1351;
    float _1355 = -_1319;
    float _1357 = fma(_1331, _1341, _1355);
    float _1359 = -_1341;
    float _1361 = fma(_1331, _1319, _1359);
    float _1363 = fma(_1349, _1301, _1347);
    float _1365 = _1333 * _1303;
    float _1367 = fma(_1335, _1301, _1353);
    float _1369 = fma(_1331, _1317, _1339);
    float _1371 = fma(_1357, _913, _1363);
    float _1373 = fma(_1361, _1301, _1365);
    float _1375 = fma(_1345, _913, _1367);
    float _1377 = _183 * _1275;
    float _1379 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1381 = fma(_1369, _913, _1373);
    float _1383 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1385 = fma(_181, _1273, _1377);
    float _1387 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1379);
    float _1389 = _1327 + _1337;
    float _1391 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1383);
    float _1393 = fma(_185, _1277, _1385);
    float _1395 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1387);
    float _1397 = in.m_60.w;
    float _1399 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1391);
    float _1401 = _1393 + _1325;
    float _1403 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1405 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1407 = _1399 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1409 = _1389 + _1403;
    float _1411 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1405);
    float _1413 = _1401 + _1407;
    float _1415 = fma(_191, _1277, _1323);
    float _1417 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1419 = _1409 + _1417;
    float _1421 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1411);
    float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1425 = _1413 + _1423;
    float _1427 = _1419 * _1419;
    float _1429 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1431 = fma(_1425, _1425, _1427);
    float _1433 = sqrt(_1431);
    float _1435 = _1415 + _1397;
    float _1437 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1439 = _1435 + _1429;
    float _1441 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1437);
    float _1443 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1441);
    bool _1445 = _1433 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1447 = _1273;
    float _1449 = _1433;
    float _1451 = _1397;
    if (!_1445)
    {
        _1447 = _1413;
    }
    float _1453 = _1447;
    float _1455 = _1453;
    if (!_1445)
    {
        _231 = _1409;
    }
    float _1457 = _231;
    float _1459 = _1457;
    if (!_1445)
    {
        _233 = _1439;
    }
    float _1461 = _233;
    bool _1463 = !_1445;
    float _1465 = _1461;
    if (!_1463)
    {
        float _1467 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1469 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1471 = _1433 + _1469;
        float _1473 = rsqrt(_1431);
        float _1475 = _1471 * _1467;
        float _1477 = _1439 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1479 = _1475 * 0.15915493667125701904296875;
        float _1481 = _1479 * 6.283185482025146484375;
        float _1483 = cos(_1481);
        float _1485 = _1479 * 6.283185482025146484375;
        float _1487 = sin(_1485);
        float _1489 = _1483 + (-1.0);
        float _1491 = fma(_1487, _1477, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1493 = _1489 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1495 = _1473 * _1491;
        float _1497 = fma(_1439, _1483, _1493);
        float _1499 = fma(_1425, _1495, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1501 = fma(_1419, _1495, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1465 = _1497;
        _1455 = _1499;
        _1459 = _1501;
    }
    float _1503 = _1465;
    float _1505 = _1455;
    float _1507 = _1459;
    float _1509 = -_1435;
    float _1511 = _1509 + _1503;
    float _1513 = _1443 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1515 = -_1401;
    float _1517 = _1515 + _1505;
    float _1519 = -_1389;
    float _1521 = _1519 + _1507;
    float _1523 = _1511 * _1511;
    float _1525 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1527 = 1.0 / _1513;
    float _1529 = fma(_1517, _1517, _1523);
    float _1531 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1525);
    bool _1533 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1535 = isnan(0.5);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1541 = _1537 || _1539;
    float _1543 = fma(_1521, _1521, _1529);
    float _1545 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1531);
    bool _1547 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1549 = isnan(0.5);
    bool _1551 = _1547 || _1549;
    bool _1553 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1555 = _1551 || _1553;
    float _1557 = sqrt(_1543);
    float _1559 = _1545 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1561 = _1559 + _1513;
    float _1563 = _1561 * _1527;
    float _1565 = _1563 * 0.5;
    bool _1567 = _1557 > 0.0;
    float _1569 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1571 = fma(_1565, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1569);
    float _1573 = 1.0 / _1571;
    bool _1575 = !_1567;
    float _1577 = _1505;
    float _1579 = _1503;
    float _1581 = _1507;
    float _1583 = _1517;
    float _1585 = _1511;
    float _1587 = _1543;
    bool _1589 = _1541;
    if (!_1575)
    {
        float _1591 = _227 * _227;
        float _1593 = rsqrt(_1543);
        float _1595 = fma(_225, _225, _1591);
        float _1597 = fma(_217, _217, _1595);
        float _1599 = sqrt(_1597);
        float _1601 = _1517 * _1593;
        float _1603 = _1521 * _1593;
        bool _1605 = _1599 > 0.0;
        float _1607 = _1511 * _1593;
        bool _1609 = !_1605;
        if (!_1609)
        {
            float _1611 = rsqrt(_1597);
            float _1613 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1615 = _227 * _1611;
            float _1617 = _225 * _1611;
            float _1619 = _1607 * _1615;
            float _1621 = _217 * _1611;
            float _1623 = fma(_1601, _1617, _1619);
            float _1625 = _1613 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1627 = fma(_1603, _1621, _1623);
            float _1629 = _1627 * _1625;
            float _1631 = fma(_225, _1629, _1505);
            float _1633 = fma(_227, _1629, _1503);
            float _1635 = fma(_217, _1629, _1507);
            _1577 = _1631;
            _1579 = _1633;
            _1581 = _1635;
            _1583 = _1629;
        }
    }
    float _1637 = _1577;
    float _1639 = _1579;
    float _1641 = _1581;
    float _1643 = _1583;
    float _1645 = _1643;
    if (_1555)
    {
        _235 = 1.0;
    }
    float _1647 = _235;
    float _1649 = _1647;
    if (_1541)
    {
        _1585 = _1637;
    }
    float _1651 = _1585;
    float _1653 = _1651;
    if (_1541)
    {
        _1587 = _1639;
    }
    float _1655 = _1587;
    float _1657 = _1655;
    if (_1541)
    {
        _1449 = _1641;
    }
    float _1659 = _1449;
    float _1661 = _1659;
    if (!_1541)
    {
        float _1663 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1665 = _1435 + _1663;
        float _1667 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1669 = _1401 + _1667;
        float _1671 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1673 = -_1435;
        float _1675 = _1673 + _1639;
        float _1677 = _1665 * _1665;
        float _1679 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1681 = _1389 + _1679;
        float _1683 = fma(_1669, _1669, _1677);
        float _1685 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1687 = fma(_1681, _1681, _1683);
        float _1689 = sqrt(_1687);
        float _1691 = _1671 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1693 = precise::min(_1689, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1695 = _1693 * _1685;
        float _1697 = -_1401;
        float _1699 = _1697 + _1637;
        float _1701 = _1691 * _1695;
        float _1703 = -_1389;
        float _1705 = _1703 + _1641;
        float _1707 = fma(_1699, _1701, _1401);
        float _1709 = fma(_1675, _1701, _1435);
        float _1711 = fma(_1705, _1701, _1389);
        _1645 = _1671;
        _1657 = _1709;
        _1653 = _1707;
        _1661 = _1711;
    }
    float _1713 = _1645;
    float _1715 = _1657;
    float _1717 = _1653;
    float _1719 = _1661;
    float _1721 = _1713;
    if (_1555)
    {
        _1451 = 1.0;
    }
    float _1723 = _1451;
    float _1725 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1727 = _1573 * _1725;
    float _1729 = _1723;
    if (!_1555)
    {
        float _1731 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1733 = _1731 * 0.15915493667125701904296875;
        float _1735 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1737 = _1733 * 6.283185482025146484375;
        float _1739 = cos(_1737);
        float _1741 = _1735 * 0.15915493667125701904296875;
        float _1743 = _1733 * 6.283185482025146484375;
        float _1745 = sin(_1743);
        float _1747 = 1.0 / _1739;
        float _1749 = _1741 * 6.283185482025146484375;
        float _1751 = cos(_1749);
        float _1753 = _1745 * _1747;
        float _1755 = _1741 * 6.283185482025146484375;
        float _1757 = sin(_1755);
        float _1759 = _1751 * _1753;
        float _1761 = 1.0 / _1759;
        float _1763 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1765 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1763;
        float _1767 = 1.0 / _1765;
        float _1769 = _1757 * _1761;
        float _1771 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1773 = fma(_1727, _1769, _1771);
        float _1775 = _1773 * _1767;
        float _1777 = precise::clamp(_1775, 0.0, 1.0);
        _1721 = _1773;
        _1649 = _1777;
    }
    float _1779 = _1721;
    float _1781 = _1649;
    float _1783 = _1779;
    if (!_1555)
    {
        float _1785 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1787 = _1785 * 0.15915493667125701904296875;
        float _1789 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1791 = _1787 * 6.283185482025146484375;
        float _1793 = cos(_1791);
        float _1795 = _1789 * 0.15915493667125701904296875;
        float _1797 = _1787 * 6.283185482025146484375;
        float _1799 = sin(_1797);
        float _1801 = 1.0 / _1793;
        float _1803 = _1795 * 6.283185482025146484375;
        float _1805 = cos(_1803);
        float _1807 = _1799 * _1801;
        float _1809 = _1795 * 6.283185482025146484375;
        float _1811 = sin(_1809);
        float _1813 = _1805 * _1807;
        float _1815 = 1.0 / _1813;
        float _1817 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1819 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1817;
        float _1821 = 1.0 / _1819;
        float _1823 = _1811 * _1815;
        float _1825 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1827 = fma(_1727, _1823, _1825);
        float _1829 = _1827 * _1821;
        float _1831 = precise::clamp(_1829, 0.0, 1.0);
        float _1833 = -_1831;
        float _1835 = _1833 + 1.0;
        _1783 = _1801;
        _1729 = _1835;
    }
    float _1837 = _1783;
    float _1839 = _1729;
    float _1841 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1843 = _1715 + _1841;
    float _1845 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1847 = _1717 + _1845;
    float _1849 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1851 = _1719 + _1849;
    float _1853 = _1843 * _1843;
    float _1855 = fma(_1847, _1847, _1853);
    float _1857 = fma(_1851, _1851, _1855);
    float _1859 = rsqrt(_1857);
    float _1861 = sqrt(_1857);
    float _1863 = _1859 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1865 = _1847 * _1863;
    float _1867 = _1851 * _1863;
    float _1869 = _1865 * _1865;
    float _1871 = _1867 * _1867;
    float _1873 = _1869 + _1871;
    float _1875 = sqrt(_1873);
    bool _1877 = _1875 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1879 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1881 = _1875 + _1879;
    float _1883 = _1851;
    float _1885 = _1873;
    float _1887 = _1881;
    float _1889 = _1837;
    float _1891 = _1863;
    if (_1877)
    {
        float _1893 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1883 = _1893;
    }
    float _1895 = _1883;
    if (_1877)
    {
        float _1897 = rsqrt(_1873);
        _1885 = _1897;
    }
    float _1899 = _1885;
    if (_1877)
    {
        float _1901 = _1881 * _1895;
        _1887 = _1901;
    }
    float _1903 = _1887;
    if (_1877)
    {
        float _1905 = _1903 * 0.15915493667125701904296875;
        _1889 = _1905;
    }
    float _1907 = _1889;
    float _1909 = _1853;
    float _1911 = _1907;
    if (_1877)
    {
        float _1913 = _1907 * 6.283185482025146484375;
        float _1915 = sin(_1913);
        _1909 = _1915;
    }
    float _1917 = _1909;
    float _1919 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1921 = precise::max(0.0, _1919);
    float _1923 = _1859;
    float _1925 = _1921;
    float _1927 = _1919;
    if (_1877)
    {
        float _1929 = _1907 * 6.283185482025146484375;
        float _1931 = cos(_1929);
        _1923 = _1931;
    }
    float _1933 = _1923;
    float _1935 = -_1863;
    float _1937 = -_1921;
    float _1939 = fma(_1843, _1935, _1937);
    float _1941 = _1939;
    if (!_1877)
    {
        _1925 = _1865;
    }
    float _1943 = _1925;
    float _1945 = _1943;
    if (_1877)
    {
        float _1947 = _1939 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1927 = _1947;
    }
    float _1949 = _1927;
    float _1951 = _1917;
    float _1953 = _1949;
    if (_1877)
    {
        float _1955 = fma(_1917, _1949, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1951 = _1955;
    }
    float _1957 = _1951;
    float _1959 = _1957;
    float _1961 = _1933;
    if (_1877)
    {
        float _1963 = _1933 + (-1.0);
        _1953 = _1963;
    }
    float _1965 = _1953;
    float _1967 = _1965;
    if (_1877)
    {
        float _1969 = _1899 * _1957;
        _1891 = _1969;
    }
    float _1971 = _1891;
    if (!_1877)
    {
        _1959 = _1869;
    }
    float _1973 = _1959;
    float _1975 = _1973;
    if (_1877)
    {
        float _1977 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1911 = _1977;
    }
    float _1979 = _1911;
    if (_1877)
    {
        float _1981 = _1865 * _1971;
        _1945 = _1981;
    }
    float _1983 = _1945;
    if (!_1877)
    {
        _1967 = _1867;
    }
    float _1985 = _1967;
    float _1987 = _1985;
    if (_1877)
    {
        float _1989 = _1867 * _1971;
        _1987 = _1989;
    }
    float _1991 = _1987;
    if (_1877)
    {
        float _1993 = fma(_1939, _1933, _1979);
        _1941 = _1993;
    }
    float _1995 = _1941;
    if (_1877)
    {
        float _1997 = _1983 * _1983;
        _1975 = _1997;
    }
    float _1999 = _1975;
    if (!_1877)
    {
        _1961 = _1871;
    }
    float _2001 = _1961;
    float _2003 = _2001;
    if (_1877)
    {
        float _2005 = _1991 * _1991;
        _2003 = _2005;
    }
    float _2007 = _2003;
    float _2009 = fma(_1995, _1995, _1999);
    float _2011 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2013 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2015 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2017 = _2009 + _2007;
    float _2019 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2011);
    float _2021 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2023 = fma(_1861, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2021);
    float _2025 = precise::clamp(_2023, 0.0, 1.0);
    float _2027 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2029 = rsqrt(_2017);
    float _2031 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2015);
    float _2033 = -_2025;
    float _2035 = _2033 + 1.0;
    float _2037 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2027);
    float _2039 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2019);
    float _2041 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2043 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2031);
    float _2045 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2037);
    float _2047 = abs(_2035);
    float _2049 = log2(_2047);
    float _2051 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2041);
    float _2053 = _2043 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2055 = _2045 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2057 = _2039 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2059 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2051);
    float _2061 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2063 = _2029 * _1983;
    float _2065 = _2029 * _1995;
    float _2067 = _2029 * _1991;
    float _2069 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2061);
    float _2071 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2073 = _2057 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2075 = _2059 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2077 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2069);
    float _2079 = -_2071;
    float _2081 = fma(_2065, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2079);
    float _2083 = _2049 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2085 = -_2073;
    float _2087 = fma(_2085, _2013, 1.0);
    float _2089 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2077);
    float _2091 = -_2067;
    float _2093 = fma(_2091, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2081);
    float _2095 = exp2(_2083);
    float _2097 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2099 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2101 = fma(_2093, -0.5, 0.5);
    float _2103 = _2065 + 1.0;
    float _2105 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2097);
    float _2107 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2099);
    float _2109 = log2(_2087);
    float _2111 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2105);
    float _2113 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2107);
    float _2115 = 1.0 / _2089;
    float _2117 = fma(_2093, 0.5, 0.5);
    float _2119 = -_2065;
    float _2121 = fma(_2095, _2103, _2119);
    float _2123 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2111);
    float _2125 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2113);
    float _2127 = fma(_2117, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2129 = fma(_2121, 0.5, 0.5);
    float _2131 = sqrt(_2101);
    float _2133 = _2109 * 0.693147182464599609375;
    float _2135 = fma(_2117, _2127, -0.212114393711090087890625);
    float _2137 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2139 = fma(_2117, _2135, 1.570728778839111328125);
    float _2141 = _2123 * _2115;
    float _2143 = _2125 * _2115;
    float _2145 = fma(_2143, -0.5, 0.5);
    float _2147 = _2131 * 0.636619746685028076171875;
    float _2149 = fma(_2141, 0.5, 0.5);
    float _2151 = -_2139;
    float _2153 = fma(_2147, _2151, 1.0);
    float3 _6269 = float3(_2149, _2145, _2137);
    float _2155 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6269, float3(0.0), isnan(_6269)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6269, float3(0.0), isnan(_6269)), level(0.0)).x;
    float3 _6280 = float3(_2149, _2145, _2137);
    float4 _2158 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6280, float3(0.0), isnan(_6280)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6280, float3(0.0), isnan(_6280)), level(0.0)).xyzw;
    float _2160 = _2158.x;
    float _2162 = _2158.y;
    float _2164 = _2158.z;
    float _2166 = _2158.w;
    float2 _6297 = float2(_2153, _2129);
    float3 _2170 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6297, float2(0.0), isnan(_6297)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6297, float2(0.0), isnan(_6297)), level(0.0)).xyz;
    float _2172 = _2170.x;
    float _2174 = _2170.y;
    float _2176 = _2170.z;
    int _2178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2180 = _2178 != 0;
    float _2182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2186 = _2184 != 0;
    float _2188 = _957 + 0.5;
    out.m_70.x = _1401;
    out.m_70.y = _1435;
    out.m_70.z = _1389;
    float _2190 = -_1175;
    float _2192 = _2190 + 1.0;
    float _2194 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2196 = _2194 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2198 = in.m_62.w;
    float _2200 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2202 = _2200 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2204 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2206 = isnan(_747);
    bool _2208 = _2204 || _2206;
    bool _2210 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2212 = _2208 || _2210;
    float _2214 = float(_2212);
    float _2216 = 1.0 / _2196;
    float _2218 = 0.0;
    float _2220 = _2123;
    if (_2180)
    {
        float _2222 = in.m_62.z;
        _2218 = _2222;
    }
    float _2224 = _2218;
    float _2226 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2228 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2226;
    bool _2230 = _829 > 0.5;
    float _2232 = -_2214;
    float _2234 = _2232 + 1.0;
    float _2236 = 0.0;
    if (_2186)
    {
        float _2238 = in.m_62.w;
        _2236 = _2238;
    }
    float _2240 = _2236;
    float _2242 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2244 = _2242 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2246 = -_221;
    int _2248 = _2230 ? as_type<int>(_2246) : as_type<int>(_221);
    float _2250 = 1.0 / _2202;
    bool _2252 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2254 = isnan(_747);
    bool _2256 = _2252 || _2254;
    bool _2258 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2260 = _2256 || _2258;
    float _2262 = float(_2260);
    float _2264 = -_1191;
    float _2266 = _2264 + 1.0;
    int _2268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2270 = _2268 != 0;
    float _2272 = _2049 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2274 = _2262 * _2234;
    float _2276 = -_2262;
    float _2278 = _2276 + 1.0;
    float _2280 = _2228 * _2216;
    float _2282 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2284 = _747 + _2282;
    float _2286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    bool _2288 = !_2270;
    float _2290 = _2288 ? _221 : as_type<float>(_2248);
    float _2292 = fma(_2280, _2284, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2294 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2296 = isnan(_747);
    bool _2298 = _2294 || _2296;
    bool _2300 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2302 = _2298 || _2300;
    float _2304 = float(_2302);
    bool _2306 = _2198 > 0.5;
    float _2308 = _2224;
    float _2310 = _2198;
    if (_2180)
    {
        float _2312 = _2224 * 3.1415927410125732421875;
        _2308 = _2312;
    }
    float _2314 = _2308;
    float _2316 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2318 = _2292 * _2274;
    float _2320 = _2314;
    if (!_2180)
    {
        _2310 = _221;
    }
    float _2322 = _2310;
    float _2324 = _2322;
    if (_2180)
    {
        float _2326 = _2314 * 0.15915493667125701904296875;
        _2320 = _2326;
    }
    float _2328 = _2320;
    float _2330 = _2240;
    if (_2186)
    {
        float _2332 = _2240 * 3.1415927410125732421875;
        _2330 = _2332;
    }
    float _2334 = _2330;
    float _2336 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2338 = _747 + _2336;
    float _2340 = fma(_2278, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2318);
    float _2342 = -_2304;
    float _2344 = _2342 + 1.0;
    float _2346 = _2334;
    if (_2186)
    {
        float _2348 = _2334 * 0.15915493667125701904296875;
        _2346 = _2348;
    }
    float _2350 = _2346;
    float _2352 = _2328;
    if (_2180)
    {
        float _2354 = _2328 * 6.283185482025146484375;
        float _2356 = sin(_2354);
        _2352 = _2356;
    }
    float _2358 = _2352;
    float _2360 = _2244 * _2250;
    int _2362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2364 = _2362 != 0;
    float _2366 = _2214 * _2344;
    float _2368 = _2286 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _2370 = fma(_2360, _2338, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2372 = _2182 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2374 = _2290 + 0.5;
    float _2376 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2378 = _2188 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2380 = fma(_2370, _2366, _2340);
    float _2382 = _2316 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2384 = fma(_2372, _2374, _885);
    float _2386 = fma(_2304, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2380);
    if (_2180)
    {
        bool _2388 = _2358 > 0.5;
        _1589 = _2388;
    }
    bool _2390 = _1589;
    float _2392 = _2350;
    if (_2186)
    {
        float _2394 = _2350 * 6.283185482025146484375;
        float _2396 = sin(_2394);
        _2392 = _2396;
    }
    float _2398 = _2392;
    float _2400 = -_205;
    int _2402 = _869 ? as_type<int>(_2400) : as_type<int>(_205);
    float _2404 = _2386 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_2180)
    {
        float _2406 = -_221;
        float _2408 = _2390 ? _2406 : _221;
        _2324 = _2408;
    }
    float _2410 = _2324;
    int _2412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2414 = _2412 != 0;
    int _2416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2418 = _2416 != 0;
    float _2420 = _1193 * (-0.15915493667125701904296875);
    bool _2422 = !_2414;
    float _2424 = _2422 ? _205 : as_type<float>(_2402);
    float _2426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2428 = _2410 + 0.5;
    out.m_72.w = _2404;
    float _2430 = _2424 + (-0.5);
    float _2432 = fma(_2368, _2428, _1197);
    if (_2186)
    {
        bool _2434 = _2398 > 0.5;
        _1013 = _2434;
    }
    bool _2436 = _1013;
    float _2438 = -_979;
    float _2440 = _2438 + 0.5;
    float _2442 = _2420 * 6.283185482025146484375;
    float _2444 = sin(_2442);
    float _2446 = -_2382;
    float _2448 = -_1081;
    float _2450 = fma(_2446, _2430, _2448);
    float _2452 = -_205;
    int _2454 = _2306 ? as_type<int>(_2452) : as_type<int>(_205);
    float _2456 = _2378 * _2376;
    if (!_2186)
    {
        _1015 = _205;
    }
    float _2458 = _1015;
    float _2460 = _2440 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2462 = _2458;
    if (_2186)
    {
        float _2464 = -_205;
        float _2466 = _2436 ? _2464 : _205;
        _2462 = _2466;
    }
    float _2468 = _2462;
    float _2470 = _2420 * 6.283185482025146484375;
    float _2472 = cos(_2470);
    float _2474 = _2460 * _2426;
    float _2476 = _2468 + (-0.5);
    out.m_74.x = _2456;
    out.m_74.y = _2474;
    float _2478 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    bool _2480 = !_2364;
    float _2482 = _2480 ? _205 : as_type<float>(_2454);
    float _2484 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2486 = -_221;
    int _2488 = _953 ? as_type<int>(_2486) : as_type<int>(_221);
    bool _2490 = _1861 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2492 = isnan(_1861);
    bool _2494 = _2490 || _2492;
    bool _2496 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2498 = _2494 || _2496;
    float _2500 = _2482 * _2444;
    bool _2502 = !_2418;
    float _2504 = _2502 ? _221 : as_type<float>(_2488);
    float _2506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2508 = _2482 * _2472;
    float _2510 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2512 = -_2500;
    float _2514 = fma(_2504, _2472, _2512);
    float _2516 = fma(_2504, _2444, _2508);
    float _2518 = -_1123;
    float _2520 = _2518 + 1.0;
    float _2522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2524 = _2478 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _2526 = -_2520;
    float _2528 = fma(_2526, _2410, _2432);
    float _2530 = -_1187;
    float _2532 = _2530 + 1.0;
    float _2534 = -_1177;
    float _2536 = _2534 + 1.0;
    float _2538 = -_2524;
    float _2540 = -_1155;
    float _2542 = fma(_2538, _2476, _2540);
    float _2544 = _2514 + 0.5;
    float _2546 = _2516 + (-0.5);
    float _2548 = _2506 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2550 = fma(_2424, _2532, _2450);
    float _2552 = fma(_2266, _2468, _2542);
    float _2554 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2556 = fma(_2548, _2544, _1201);
    float _2558 = -_1189;
    float _2560 = _2558 + 1.0;
    float _2562 = exp2(_2272);
    out.m_76.x = _2528;
    out.m_76.y = _2552;
    float _2564 = _2522 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2566 = -_2560;
    float _2568 = fma(_2290, _2566, _2384);
    float _2570 = -_2192;
    float _2572 = fma(_2514, _2570, _2556);
    float _2574 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2576 = -_2564;
    float _2578 = -_1203;
    float _2580 = fma(_2576, _2546, _2578);
    float _2582 = -_1331;
    float _2584 = fma(_2582, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2554);
    float _2586 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2588 = -_1331;
    float _2590 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2574);
    float _2592 = fma(_2516, _2536, _2580);
    float _2594 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2596 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2598 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2600 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_78.x = _2568;
    out.m_78.y = _2550;
    out.m_78.z = _2572;
    out.m_78.w = _2592;
    float _2602 = -_1331;
    float _2604 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2586);
    float _2606 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2594);
    float _2608 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2596);
    float _2610 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2598);
    float _2612 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2600);
    float _2614 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2590);
    float _2616 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2584);
    float _2618 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2604);
    float _2620 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2608);
    float _2622 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2606);
    float _2624 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2612);
    float _2626 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2610);
    float _2628 = _2484 * _2614;
    float _2630 = fma(_2484, _2484, 1.0);
    float _2632 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2634 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2636 = -_2562;
    float _2638 = _2636 + 1.0;
    float _2640 = rsqrt(_2630);
    float _2642 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2632);
    float _2644 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2634);
    float _2646 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2648 = fma(_2510, _2622, _2628);
    float _2650 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2642);
    float _2652 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2644);
    float _2654 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2646);
    out.m_80.x = _2622;
    out.m_80.y = _2620;
    out.m_80.z = _2624;
    float _2656 = _2484 * _2616;
    float _2658 = _2123 + _2089;
    float _2660 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2654);
    float _2662 = fma(_2510, _2620, _2656);
    float _2664 = _2658 * 0.5;
    float _2666 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2660);
    float _2668 = _2484 * _2640;
    float _2670 = _2666 + _2089;
    float _2672 = -_2626;
    float _2674 = _2668 * _2672;
    float _2676 = -_2650;
    float _2678 = _2668 * _2676;
    float _2680 = -_2652;
    float _2682 = _2668 * _2680;
    float _2684 = _2670 * 0.5;
    float _2686 = fma(_2640, _2614, _2674);
    float _2688 = fma(_2640, _2616, _2678);
    float _2690 = _2484 * _2618;
    float _2692 = fma(_2640, _2618, _2682);
    float _2694 = _2089 * 0.5;
    float _2696 = _2650 + _2662;
    float _2698 = fma(_2510, _2624, _2690);
    float _2700 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2702 = fma(_2125, -0.5, _2694);
    out.m_82.x = _2686;
    out.m_82.y = _2688;
    out.m_82.z = _2692;
    float _2704 = _2626 + _2648;
    float _2706 = _2652 + _2698;
    float _2708 = _2698;
    if (!_2498)
    {
        _2708 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2710 = _2708;
    out.m_84.x = _2664;
    out.m_84.y = _2702;
    out.m_84.z = _2684;
    out.m_84.w = _2089;
    out.m_86.x = _2704;
    out.m_86.y = _2696;
    out.m_86.z = _2706;
    out.gl_Position.x = _2123;
    out.gl_Position.y = _2125;
    out.gl_Position.z = _2666;
    out.gl_Position.w = _2089;
    float _2712 = _2710;
    float _2714 = _2710;
    if (!_2498)
    {
        _2220 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2716 = _2220;
    float _2718 = _2700 * _2155;
    float _2720 = -_2700;
    float _2722 = _2720 + 1.0;
    float _2724 = _2166 * _2718;
    float _2726 = _2176 * _2718;
    float _2728 = _2166 * _2722;
    float _2730 = _1781 * _1839;
    float _2732 = fma(_2172, _2724, _2160);
    float _2734 = fma(_2174, _2724, _2162);
    float _2736 = fma(_2166, _2726, _2164);
    float _2738 = _2730 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2740 = _2162;
    float _2742 = _2160;
    float _2744 = _2724;
    float _2746 = _2730;
    float _2748 = _2716;
    float _2750 = _2716;
    if (!_2498)
    {
        _2740 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2752 = _2740;
    float _2754 = _2752;
    float _2756 = _2752;
    if (!_2498)
    {
        _2742 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2758 = _2742;
    out.m_88.x = _2732;
    out.m_88.y = _2734;
    out.m_88.z = _2736;
    out.m_88.w = _2728;
    float _2760 = _2758;
    float _2762 = _2758;
    if (!_2498)
    {
        _2744 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2764 = _2744;
    float _2766 = _2764;
    float _2768 = _2764;
    if (!_2498)
    {
        _2746 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2770 = _2746;
    bool _2772 = !_2498;
    float _2774 = _2770;
    float _2776 = _2770;
    if (!_2772)
    {
        bool _2778 = _1861 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2780 = isnan(_1861);
        bool _2782 = _2778 || _2780;
        bool _2784 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2786 = _2782 || _2784;
        if (!_2786)
        {
            float _2788 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2790 = _1861 + _2788;
            float _2792 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2794 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2792;
            float _2796 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2798 = _2796 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2800 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2802 = _2800 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2804 = 1.0 / _2794;
            float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2808 = _2806 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2812 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2818 = _2790 * _2804;
            float _2820 = precise::clamp(_2818, 0.0, 1.0);
            float _2822 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2824 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2826 = fma(_2820, _2798, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2828 = fma(_2820, _2802, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2830 = fma(_2820, _2824, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2832 = fma(_2820, _2808, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2834 = fma(_2820, _2812, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2836 = fma(_2820, _2816, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2768 = _2826;
            _2750 = _2834;
            _2762 = _2828;
            _2714 = _2832;
            _2776 = _2830;
            _2756 = _2836;
            _2838 = true;
        }
        else
        {
            bool _2840 = _1861 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2842 = isnan(_1861);
            bool _2844 = _2840 || _2842;
            bool _2846 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2848 = _2844 || _2846;
            if (!_2848)
            {
                _2712 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2850 = _2712;
            _2714 = _2850;
            if (!_2848)
            {
                _2748 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2852 = _2748;
            _2750 = _2852;
            if (!_2848)
            {
                _2754 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2854 = _2754;
            _2756 = _2854;
            if (!_2848)
            {
                _2760 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2856 = _2760;
            _2762 = _2856;
            if (!_2848)
            {
                _2766 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2858 = _2766;
            _2768 = _2858;
            if (!_2848)
            {
                _2774 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2860 = _2774;
            bool _2862 = !_2848;
            _2776 = _2860;
            if (!_2862)
            {
                bool _2864 = _1861 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2866 = isnan(_1861);
                bool _2868 = _2864 || _2866;
                bool _2870 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2872 = _2868 || _2870;
                if (!_2872)
                {
                    float _2874 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2876 = _1861 + _2874;
                    float _2878 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2880 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2878;
                    float _2882 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2884 = _2882 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2886 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2888 = _2886 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2890 = 1.0 / _2880;
                    float _2892 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2894 = _2892 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2896 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2898 = _2896 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2900 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2902 = _2900 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2904 = _2876 * _2890;
                    float _2906 = precise::clamp(_2904, 0.0, 1.0);
                    float _2908 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2910 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2912 = fma(_2906, _2884, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2914 = fma(_2906, _2888, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2916 = fma(_2906, _2910, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2918 = fma(_2906, _2894, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2920 = fma(_2906, _2898, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2922 = fma(_2906, _2902, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2768 = _2912;
                    _2750 = _2920;
                    _2762 = _2914;
                    _2714 = _2918;
                    _2776 = _2916;
                    _2756 = _2922;
                    _2838 = true;
                }
                else
                {
                    _2768 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2750 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2762 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2714 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2776 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2756 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2838 = false;
    float _2924 = _2768;
    float _2926 = _2750;
    float _2928 = _2762;
    float _2930 = _2714;
    float _2932 = _2776;
    float _2934 = _2756;
    float _2936 = _2738 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2938 = fma(_2696, -0.5, 0.5);
    float _2940 = precise::clamp(_2938, 0.0, 1.0);
    float _2942 = -_2924;
    float _2944 = _2926 + _2942;
    float _2946 = -_2928;
    float _2948 = _2930 + _2946;
    out.m_47.x = _2936;
    float _2950 = -_2932;
    float _2952 = _2934 + _2950;
    float _2954 = fma(_2940, _2944, _2924);
    float _2956 = fma(_2940, _2948, _2928);
    bool _2958 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2960 = _2954 * 0.586610972881317138671875;
    float _2962 = fma(_2940, _2952, _2932);
    out.m_90.x = 0.0;
    bool _2964 = _1781 > 0.0;
    bool _2966 = isnan(_1781);
    bool _2968 = _2964 || _2966;
    bool _2970 = isnan(0.0);
    bool _2972 = _2968 || _2970;
    float _2974 = fma(_2956, 0.298911988735198974609375, _2960);
    bool _2976 = _1839 <= 0.0;
    bool _2978 = !_2972;
    bool _2980 = _2976 || _2978;
    float _2982 = fma(_2962, 0.114477999508380889892578125, _2974);
    float _2984 = -_2982;
    float _2986 = _2956 + _2984;
    float _2988 = fma(_2986, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2982);
    bool _2990 = !_2958;
    if (!_2990)
    {
        float _2992 = -_1715;
        float _2994 = _2992 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2996 = -_1717;
        float _2998 = _2996 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3000 = -_1719;
        float _3002 = _3000 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3004 = _2994 * _2994;
        float _3006 = fma(_2998, _2998, _3004);
        float _3008 = fma(_3002, _3002, _3006);
        float _3010 = sqrt(_3008);
        float _3012 = rsqrt(_3008);
        float _3014 = -_3010;
        float _3016 = _3014 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3018 = _3016 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3020 = precise::clamp(_3018, 0.0, 1.0);
        float _3022 = _2998 * _3012;
        float _3024 = _2994 * _3012;
        float _3026 = abs(_3020);
        float _3028 = log2(_3026);
        float _3030 = _3002 * _3012;
        float _3032 = _3022 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3034 = _2696 * _3024;
        float _3036 = -_3024;
        float _3038 = -_3032;
        float _3040 = fma(_3036, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3038);
        float _3042 = fma(_2704, _3022, _3034);
        float _3044 = -_3030;
        float _3046 = fma(_3044, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3040);
        float _3048 = fma(_2706, _3030, _3042);
        float _3050 = precise::clamp(_3048, 0.0, 1.0);
        float _3052 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3054 = _3046 + _3052;
        float _3056 = _3028 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3058 = _3054 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3060 = precise::clamp(_3058, 0.0, 1.0);
        float _3062 = exp2(_3056);
        float _3064 = _3062 * _3060;
        float _3066 = _3050 * _3064;
        float _3068 = _3066 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        out.m_90.x = _3068;
    }
    out.m_92.x = _2988;
    if (!_2980)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _3070 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3070;
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
    bool _2838 = false;
    bool _737 = false;
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
        float _3127 = as_type<float>(_127);
        out.gl_Position.z = _3127;
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
        float _3196 = as_type<float>(_165);
        out.gl_Position.z = _3196;
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
    float _527 = fma(_487, _439, _515);
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _529;
    float _533 = fma(_489, _439, _517);
    float _535 = fma(_525, _375, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _541 = fma(_519, _425, _527);
    float _543 = fma(_531, _375, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _549 = fma(_521, _425, _533);
    float _551 = fma(_539, _417, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _553 = fma(_535, _423, _541);
    float _555 = fma(_547, _417, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _557 = fma(_543, _423, _549);
    float _559 = fma(_551, _411, _553);
    float _561 = fma(_555, _411, _557);
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
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _599 = _595 + _597;
    float _601 = in.m_64.x;
    float _603 = in.m_64.y;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _609 = _595 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _611 = isnan(_595);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _625 = _595 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _627 = isnan(_595);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _637;
    bool _641 = _595 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _643 = isnan(_595);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = 1.0 / _607;
    float _655 = -_619;
    float _657 = _655 + 1.0;
    bool _659 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _661 = _635 * _657;
    float _663 = -_635;
    float _665 = _663 + 1.0;
    float _667 = 1.0 / _623;
    float _669 = _639 * _653;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _675 = _565 * _603;
    float _677 = _563 * _601;
    float _679 = fma(_669, _599, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _681 = _673 * _667;
    float _683 = _679 * _661;
    float _685 = -_651;
    float _687 = _685 + 1.0;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _691 = _595 + _689;
    float _693 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[115].x, _683);
    float _695 = _619 * _687;
    float _697 = fma(_681, _691, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _699 = fma(_697, _695, _693);
    float _701 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[117].x, _699);
    float _703 = _701 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.w = _703;
    bool _705 = !_659;
    float _707 = _595;
    int _709 = as_type<int>(_665);
    int _711 = as_type<int>(_599);
    int _713 = as_type<int>(_695);
    int _715 = as_type<int>(_681);
    float _717 = _603;
    float _735;
    if (!_705)
    {
        float _719 = in.m_62.x;
        float _721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _723 = _719 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _725 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[11].w, _145);
        float _727 = _725 * _721;
        float _729 = floor(_727);
        float _731 = -_729;
        float _733 = _727 + _731;
        _707 = _729;
        _735 = _733;
        _737 = true;
    }
    else
    {
        float _739 = float(_111);
        float _741 = 1.0 / _739;
        float _743 = _145 * _741;
        _735 = _743;
    }
    _737 = false;
    float _745 = _707;
    float _747 = _735;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _751 = _749 != 0;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _755 = _745;
    float _757 = _697;
    if (_751)
    {
        float _759 = in.m_62.x;
        float _761 = in.m_62.y;
        float _763 = in.m_62.z;
        _753 = _759;
        _755 = _761;
        _757 = _763;
    }
    float _765 = _753;
    float _767 = _755;
    float _769 = _757;
    if (_751)
    {
        _709 = 0;
    }
    int _771 = _709;
    float _773 = _769;
    float _775 = _767;
    int _777 = _771;
    float _779 = _765;
    if (_751)
    {
        _711 = as_type<int>(_765);
    }
    int _781 = _711;
    int _783 = _781;
    if (_751)
    {
        _713 = as_type<int>(_767);
    }
    int _785 = _713;
    int _787 = _785;
    if (_751)
    {
        _715 = as_type<int>(_769);
    }
    int _789 = _715;
    int _791 = _789;
    if (!_751)
    {
        float _793 = in.m_62.x;
        float _795 = in.m_62.y;
        float _797 = in.m_62.z;
        float _799 = _793 * 3.1415927410125732421875;
        float _801 = _799 * 0.15915493667125701904296875;
        float _803 = _795 * 3.1415927410125732421875;
        float _805 = _803 * 0.15915493667125701904296875;
        float _807 = _797 * 3.1415927410125732421875;
        float _809 = _801 * 6.283185482025146484375;
        float _811 = sin(_809);
        float _813 = _807 * 0.15915493667125701904296875;
        float _815 = _805 * 6.283185482025146484375;
        float _817 = sin(_815);
        float _819 = _813 * 6.283185482025146484375;
        float _821 = sin(_819);
        _773 = _797;
        _775 = _795;
        _777 = 1;
        _779 = _793;
        _791 = as_type<int>(_821);
        _787 = as_type<int>(_817);
        _783 = as_type<int>(_811);
    }
    float _823 = _773;
    float _825 = _775;
    int _827 = _777;
    float _829 = _779;
    int _831 = _791;
    int _833 = _787;
    int _835 = _783;
    float _837 = _823 * 2.0;
    float _839 = _825 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _841 = _827 != 1;
    float _843 = _825 + _823;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _847 = floor(_837);
    float _849 = _829 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _851 = fma(_839, -2.0, _845);
    bool _853 = !_841;
    float _855 = _853 ? as_type<float>(_831) : as_type<float>(_833);
    float _857 = _829 * 2.0;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _861 = _843 + (-1.0);
    float _863 = -_859;
    float _865 = fma(_849, 2.0, _863);
    float _867 = floor(_857);
    bool _869 = _825 > 0.5;
    float _871 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _873 = !_841;
    float _875 = _873 ? as_type<float>(_833) : as_type<float>(_835);
    float _877 = _825 * 2.0;
    float _879 = -_221;
    int _881 = _869 ? as_type<int>(_879) : as_type<int>(_221);
    float _883 = -_145;
    float _885 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[76].x, _865);
    bool _887 = _847 > 0.0;
    float _889 = floor(_877);
    bool _891 = _847 >= 0.0;
    bool _893 = isnan(_847);
    bool _895 = _891 || _893;
    bool _897 = isnan(0.0);
    bool _899 = _895 || _897;
    float _901 = _675 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _903 = _861;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    float _907 = as_type<float>(_833);
    float _909 = _847;
    if (!_841)
    {
        _717 = _829;
    }
    float _911 = _717;
    float _913 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _917 = _915 != 0;
    int _919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _921 = _919 != 0;
    float _923 = _911;
    if (!_841)
    {
        _903 = _825;
    }
    float _925 = _903;
    float _927 = _925;
    if (!_841)
    {
        _905 = _825;
    }
    float _929 = _905;
    float _931 = _929;
    if (!_841)
    {
        _907 = _823;
    }
    float _933 = _907;
    float _935 = _933;
    if (!_841)
    {
        _909 = _823;
    }
    float _937 = _909;
    bool _939 = _867 > 0.0;
    float _941 = _937;
    if (_841)
    {
        _923 = _823;
    }
    float _943 = _923;
    if (_841)
    {
        _927 = _829;
    }
    float _945 = _927;
    if (_841)
    {
        _931 = _829;
    }
    float _947 = _931;
    if (_841)
    {
        _935 = _825;
    }
    float _949 = _935;
    if (_841)
    {
        _941 = _825;
    }
    float _951 = _941;
    bool _953 = _823 > 0.5;
    bool _955 = !_917;
    float _957 = _955 ? _221 : as_type<float>(_881);
    bool _959 = _867 >= 0.0;
    bool _961 = isnan(_867);
    bool _963 = _959 || _961;
    bool _965 = isnan(0.0);
    bool _967 = _963 || _965;
    float _969 = -_205;
    int _971 = _953 ? as_type<int>(_969) : as_type<int>(_205);
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _975 = _967 ? 0 : 1;
    bool _977 = !_921;
    float _979 = _977 ? _205 : as_type<float>(_971);
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    int _983 = _899 ? 0 : 1;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _989 = _987 != 0;
    int _991 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _993 = _991 != 0;
    int _995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _997 = _995 != 0;
    float _999 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[98].w, _981);
    int _1001 = ~_975;
    int _1003 = _1001 + 1;
    int _1005 = _1003 + 1;
    float _1007 = _855 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _1009 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[83].z, _985);
    int _1011 = _1005;
    bool _1013 = _869;
    float _1015 = _979;
    if (!_939)
    {
        int _1017 = ~_975;
        int _1019 = _1017 + 1;
        _1011 = _1019;
    }
    int _1021 = _1011;
    float _1023 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[83].w, _973);
    float _1025 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1027 = log2(_1025);
    bool _1029 = !_993;
    int _1031 = _1029 ? 0 : 1;
    float _1033 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    bool _1037 = _889 > 0.0;
    float _1039 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[98].z, _1033);
    int _1041 = abs(_1031);
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _1045 = _875 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _1047 = fma(_1007, -2.0, _1035);
    float _1049 = _949 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1051 = _889 >= 0.0;
    bool _1053 = isnan(_889);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan(0.0);
    bool _1059 = _1055 || _1057;
    float _1061 = -_1043;
    float _1063 = fma(_1045, 2.0, _1061);
    float _1065 = _945 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1067 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    int _1069 = _1059 ? 0 : 1;
    float _1071 = _1027 * _145;
    float _1073 = float(_1021);
    float _1075 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1067);
    float _1077 = float(_1041);
    float _1079 = exp2(_1071);
    float _1081 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _851);
    int _1083 = ~_1069;
    int _1085 = _1083 + 1;
    int _1087 = _1085 + 1;
    float _1089 = _1077 * _1073;
    int _1091 = _1087;
    if (!_1037)
    {
        int _1093 = ~_1069;
        int _1095 = _1093 + 1;
        _1091 = _1095;
    }
    int _1097 = _1091;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1101 = ~_983;
    int _1103 = _1101 + 1;
    int _1105 = _1103 + 1;
    float _1107 = in.m_68.x;
    float _1109 = in.m_68.y;
    float _1111 = in.m_68.z;
    int _1113 = _1105;
    if (!_887)
    {
        int _1115 = ~_983;
        int _1117 = _1115 + 1;
        _1113 = _1117;
    }
    int _1119 = _1113;
    float _1121 = fma(_1049, -2.0, _1099);
    float _1123 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[97].z, _1039);
    float _1125 = _1089 * (-2.0);
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1129 = 1.0 + _1127;
    bool _1131 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1133 = isnan(1.0);
    bool _1135 = _1131 || _1133;
    bool _1137 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1139 = _1135 || _1137;
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1143 = -_1079;
    float _1145 = _1143 + 1.0;
    float _1147 = 1.0 / _1129;
    float _1149 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1151 = -_1141;
    float _1153 = fma(_1065, 2.0, _1151);
    float _1155 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[96].y, _1047);
    bool _1157 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1159 = isnan(0.0);
    bool _1161 = _1157 || _1159;
    bool _1163 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1165 = _1161 || _1163;
    float _1167 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1149);
    float _1169 = _825 + (-0.5);
    float _1171 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1173 = _1165 ? _1145 : 0.0;
    float _1175 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1009);
    float _1177 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1023);
    float _1179 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1171);
    float _1181 = fma(_1125, _1109, _1109);
    bool _1183 = !_989;
    int _1185 = _1183 ? 0 : 1;
    float _1187 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1167);
    float _1189 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1179);
    float _1191 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[97].w, _999);
    float _1193 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1075);
    float _1195 = -_145;
    float _1197 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[96].x, _1063);
    float _1199 = -_145;
    float _1201 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1153);
    float _1203 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1121);
    if (_1139)
    {
        float _1205 = _1173 * _1147;
        _149 = _1205;
    }
    float _1207 = _149;
    float _1209 = fma(_871, _1125, _871);
    float _1211 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1181);
    bool _1213 = !_997;
    int _1215 = _1213 ? 0 : 1;
    float _1217 = _825 + _829;
    int _1219 = abs(_1185);
    float _1221 = _829 + _823;
    int _1223 = abs(_1215);
    float _1225 = _1217 + (-1.0);
    float _1227 = _1221 + (-1.0);
    float _1229 = float(_1119);
    float _1231 = _823 + (-0.5);
    float _1233 = float(_1219);
    float _1235 = fma(_1209, _1207, _1211);
    float _1237 = float(_1097);
    float _1239 = float(_1223);
    float _1241 = _1233 * _1229;
    float _1243 = _1235 * 0.15915493667125701904296875;
    float _1245 = _1239 * _1237;
    float _1247 = _1241 * (-2.0);
    float _1249 = fma(_1227, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1251 = _1243 * 6.283185482025146484375;
    float _1253 = sin(_1251);
    float _1255 = fma(_1225, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1257 = _1245 * (-2.0);
    float _1259 = fma(_1247, _1107, _1107);
    float _1261 = _829 + (-0.5);
    float _1263 = fma(_1255, _1247, _1255);
    float _1265 = fma(_1257, _1111, _1111);
    float _1267 = fma(_1249, _1257, _1249);
    float _1269 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1259);
    float _1271 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1265);
    float _1273 = in.m_44.x;
    float _1275 = in.m_44.y;
    float _1277 = in.m_44.z;
    float _1279 = fma(_1263, _1207, _1269);
    float _1281 = fma(_1267, _1207, _1271);
    float _1283 = _1243 * 6.283185482025146484375;
    float _1285 = cos(_1283);
    float _1287 = _1279 * 0.15915493667125701904296875;
    float _1289 = _677 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1291 = _1281 * 0.15915493667125701904296875;
    float _1293 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _1295 = _1287 * 6.283185482025146484375;
    float _1297 = sin(_1295);
    float _1299 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _1301 = _1289 * _1293;
    float _1303 = _901 * _1299;
    float _1305 = _1291 * 6.283185482025146484375;
    float _1307 = cos(_1305);
    float _1309 = _177 * _1275;
    float _1311 = _189 * _1275;
    float _1313 = _1287 * 6.283185482025146484375;
    float _1315 = cos(_1313);
    float _1317 = _1297 * _1253;
    float _1319 = _1297 * _1285;
    float _1321 = fma(_175, _1273, _1309);
    float _1323 = fma(_187, _1273, _1311);
    float _1325 = in.m_58.w;
    float _1327 = fma(_179, _1277, _1321);
    float _1329 = _1291 * 6.283185482025146484375;
    float _1331 = sin(_1329);
    float _1333 = _1297 * _1307;
    float _1335 = _1285 * _1307;
    float _1337 = in.m_56.w;
    float _1339 = _1315 * _1285;
    float _1341 = _1315 * _1253;
    float _1343 = _1315 * _1307;
    float _1345 = _1253 * _1307;
    float _1347 = _1343 * _1303;
    float _1349 = fma(_1331, _1339, _1317);
    float _1351 = -_1303;
    float _1353 = _1331 * _1351;
    float _1355 = -_1319;
    float _1357 = fma(_1331, _1341, _1355);
    float _1359 = -_1341;
    float _1361 = fma(_1331, _1319, _1359);
    float _1363 = fma(_1349, _1301, _1347);
    float _1365 = _1333 * _1303;
    float _1367 = fma(_1335, _1301, _1353);
    float _1369 = fma(_1331, _1317, _1339);
    float _1371 = fma(_1357, _913, _1363);
    float _1373 = fma(_1361, _1301, _1365);
    float _1375 = fma(_1345, _913, _1367);
    float _1377 = _183 * _1275;
    float _1379 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1381 = fma(_1369, _913, _1373);
    float _1383 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1385 = fma(_181, _1273, _1377);
    float _1387 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1379);
    float _1389 = _1327 + _1337;
    float _1391 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1383);
    float _1393 = fma(_185, _1277, _1385);
    float _1395 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1387);
    float _1397 = in.m_60.w;
    float _1399 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1391);
    float _1401 = _1393 + _1325;
    float _1403 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1405 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1407 = _1399 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1409 = _1389 + _1403;
    float _1411 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1405);
    float _1413 = _1401 + _1407;
    float _1415 = fma(_191, _1277, _1323);
    float _1417 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1419 = _1409 + _1417;
    float _1421 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1411);
    float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1425 = _1413 + _1423;
    float _1427 = _1419 * _1419;
    float _1429 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1431 = fma(_1425, _1425, _1427);
    float _1433 = sqrt(_1431);
    float _1435 = _1415 + _1397;
    float _1437 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1439 = _1435 + _1429;
    float _1441 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1437);
    float _1443 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1441);
    bool _1445 = _1433 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1447 = _1273;
    float _1449 = _1433;
    float _1451 = _1397;
    if (!_1445)
    {
        _1447 = _1413;
    }
    float _1453 = _1447;
    float _1455 = _1453;
    if (!_1445)
    {
        _231 = _1409;
    }
    float _1457 = _231;
    float _1459 = _1457;
    if (!_1445)
    {
        _233 = _1439;
    }
    float _1461 = _233;
    bool _1463 = !_1445;
    float _1465 = _1461;
    if (!_1463)
    {
        float _1467 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1469 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1471 = _1433 + _1469;
        float _1473 = rsqrt(_1431);
        float _1475 = _1471 * _1467;
        float _1477 = _1439 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1479 = _1475 * 0.15915493667125701904296875;
        float _1481 = _1479 * 6.283185482025146484375;
        float _1483 = cos(_1481);
        float _1485 = _1479 * 6.283185482025146484375;
        float _1487 = sin(_1485);
        float _1489 = _1483 + (-1.0);
        float _1491 = fma(_1487, _1477, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1493 = _1489 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1495 = _1473 * _1491;
        float _1497 = fma(_1439, _1483, _1493);
        float _1499 = fma(_1425, _1495, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1501 = fma(_1419, _1495, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1465 = _1497;
        _1455 = _1499;
        _1459 = _1501;
    }
    float _1503 = _1465;
    float _1505 = _1455;
    float _1507 = _1459;
    float _1509 = -_1435;
    float _1511 = _1509 + _1503;
    float _1513 = _1443 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1515 = -_1401;
    float _1517 = _1515 + _1505;
    float _1519 = -_1389;
    float _1521 = _1519 + _1507;
    float _1523 = _1511 * _1511;
    float _1525 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1527 = 1.0 / _1513;
    float _1529 = fma(_1517, _1517, _1523);
    float _1531 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1525);
    bool _1533 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1535 = isnan(0.5);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1541 = _1537 || _1539;
    float _1543 = fma(_1521, _1521, _1529);
    float _1545 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1531);
    bool _1547 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1549 = isnan(0.5);
    bool _1551 = _1547 || _1549;
    bool _1553 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1555 = _1551 || _1553;
    float _1557 = sqrt(_1543);
    float _1559 = _1545 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1561 = _1559 + _1513;
    float _1563 = _1561 * _1527;
    float _1565 = _1563 * 0.5;
    bool _1567 = _1557 > 0.0;
    float _1569 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1571 = fma(_1565, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1569);
    float _1573 = 1.0 / _1571;
    bool _1575 = !_1567;
    float _1577 = _1505;
    float _1579 = _1503;
    float _1581 = _1507;
    float _1583 = _1517;
    float _1585 = _1511;
    float _1587 = _1543;
    bool _1589 = _1541;
    if (!_1575)
    {
        float _1591 = _227 * _227;
        float _1593 = rsqrt(_1543);
        float _1595 = fma(_225, _225, _1591);
        float _1597 = fma(_217, _217, _1595);
        float _1599 = sqrt(_1597);
        float _1601 = _1517 * _1593;
        float _1603 = _1521 * _1593;
        bool _1605 = _1599 > 0.0;
        float _1607 = _1511 * _1593;
        bool _1609 = !_1605;
        if (!_1609)
        {
            float _1611 = rsqrt(_1597);
            float _1613 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1615 = _227 * _1611;
            float _1617 = _225 * _1611;
            float _1619 = _1607 * _1615;
            float _1621 = _217 * _1611;
            float _1623 = fma(_1601, _1617, _1619);
            float _1625 = _1613 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1627 = fma(_1603, _1621, _1623);
            float _1629 = _1627 * _1625;
            float _1631 = fma(_225, _1629, _1505);
            float _1633 = fma(_227, _1629, _1503);
            float _1635 = fma(_217, _1629, _1507);
            _1577 = _1631;
            _1579 = _1633;
            _1581 = _1635;
            _1583 = _1629;
        }
    }
    float _1637 = _1577;
    float _1639 = _1579;
    float _1641 = _1581;
    float _1643 = _1583;
    float _1645 = _1643;
    if (_1555)
    {
        _235 = 1.0;
    }
    float _1647 = _235;
    float _1649 = _1647;
    if (_1541)
    {
        _1585 = _1637;
    }
    float _1651 = _1585;
    float _1653 = _1651;
    if (_1541)
    {
        _1587 = _1639;
    }
    float _1655 = _1587;
    float _1657 = _1655;
    if (_1541)
    {
        _1449 = _1641;
    }
    float _1659 = _1449;
    float _1661 = _1659;
    if (!_1541)
    {
        float _1663 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1665 = _1435 + _1663;
        float _1667 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1669 = _1401 + _1667;
        float _1671 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1673 = -_1435;
        float _1675 = _1673 + _1639;
        float _1677 = _1665 * _1665;
        float _1679 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1681 = _1389 + _1679;
        float _1683 = fma(_1669, _1669, _1677);
        float _1685 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1687 = fma(_1681, _1681, _1683);
        float _1689 = sqrt(_1687);
        float _1691 = _1671 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1693 = precise::min(_1689, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1695 = _1693 * _1685;
        float _1697 = -_1401;
        float _1699 = _1697 + _1637;
        float _1701 = _1691 * _1695;
        float _1703 = -_1389;
        float _1705 = _1703 + _1641;
        float _1707 = fma(_1699, _1701, _1401);
        float _1709 = fma(_1675, _1701, _1435);
        float _1711 = fma(_1705, _1701, _1389);
        _1645 = _1671;
        _1657 = _1709;
        _1653 = _1707;
        _1661 = _1711;
    }
    float _1713 = _1645;
    float _1715 = _1657;
    float _1717 = _1653;
    float _1719 = _1661;
    float _1721 = _1713;
    if (_1555)
    {
        _1451 = 1.0;
    }
    float _1723 = _1451;
    float _1725 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1727 = _1573 * _1725;
    float _1729 = _1723;
    if (!_1555)
    {
        float _1731 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1733 = _1731 * 0.15915493667125701904296875;
        float _1735 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1737 = _1733 * 6.283185482025146484375;
        float _1739 = cos(_1737);
        float _1741 = _1735 * 0.15915493667125701904296875;
        float _1743 = _1733 * 6.283185482025146484375;
        float _1745 = sin(_1743);
        float _1747 = 1.0 / _1739;
        float _1749 = _1741 * 6.283185482025146484375;
        float _1751 = cos(_1749);
        float _1753 = _1745 * _1747;
        float _1755 = _1741 * 6.283185482025146484375;
        float _1757 = sin(_1755);
        float _1759 = _1751 * _1753;
        float _1761 = 1.0 / _1759;
        float _1763 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1765 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1763;
        float _1767 = 1.0 / _1765;
        float _1769 = _1757 * _1761;
        float _1771 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1773 = fma(_1727, _1769, _1771);
        float _1775 = _1773 * _1767;
        float _1777 = precise::clamp(_1775, 0.0, 1.0);
        _1721 = _1773;
        _1649 = _1777;
    }
    float _1779 = _1721;
    float _1781 = _1649;
    float _1783 = _1779;
    if (!_1555)
    {
        float _1785 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1787 = _1785 * 0.15915493667125701904296875;
        float _1789 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1791 = _1787 * 6.283185482025146484375;
        float _1793 = cos(_1791);
        float _1795 = _1789 * 0.15915493667125701904296875;
        float _1797 = _1787 * 6.283185482025146484375;
        float _1799 = sin(_1797);
        float _1801 = 1.0 / _1793;
        float _1803 = _1795 * 6.283185482025146484375;
        float _1805 = cos(_1803);
        float _1807 = _1799 * _1801;
        float _1809 = _1795 * 6.283185482025146484375;
        float _1811 = sin(_1809);
        float _1813 = _1805 * _1807;
        float _1815 = 1.0 / _1813;
        float _1817 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1819 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1817;
        float _1821 = 1.0 / _1819;
        float _1823 = _1811 * _1815;
        float _1825 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1827 = fma(_1727, _1823, _1825);
        float _1829 = _1827 * _1821;
        float _1831 = precise::clamp(_1829, 0.0, 1.0);
        float _1833 = -_1831;
        float _1835 = _1833 + 1.0;
        _1783 = _1801;
        _1729 = _1835;
    }
    float _1837 = _1783;
    float _1839 = _1729;
    float _1841 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1843 = _1715 + _1841;
    float _1845 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1847 = _1717 + _1845;
    float _1849 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1851 = _1719 + _1849;
    float _1853 = _1843 * _1843;
    float _1855 = fma(_1847, _1847, _1853);
    float _1857 = fma(_1851, _1851, _1855);
    float _1859 = rsqrt(_1857);
    float _1861 = sqrt(_1857);
    float _1863 = _1859 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1865 = _1847 * _1863;
    float _1867 = _1851 * _1863;
    float _1869 = _1865 * _1865;
    float _1871 = _1867 * _1867;
    float _1873 = _1869 + _1871;
    float _1875 = sqrt(_1873);
    bool _1877 = _1875 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1879 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1881 = _1875 + _1879;
    float _1883 = _1851;
    float _1885 = _1873;
    float _1887 = _1881;
    float _1889 = _1837;
    float _1891 = _1863;
    if (_1877)
    {
        float _1893 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1883 = _1893;
    }
    float _1895 = _1883;
    if (_1877)
    {
        float _1897 = rsqrt(_1873);
        _1885 = _1897;
    }
    float _1899 = _1885;
    if (_1877)
    {
        float _1901 = _1881 * _1895;
        _1887 = _1901;
    }
    float _1903 = _1887;
    if (_1877)
    {
        float _1905 = _1903 * 0.15915493667125701904296875;
        _1889 = _1905;
    }
    float _1907 = _1889;
    float _1909 = _1853;
    float _1911 = _1907;
    if (_1877)
    {
        float _1913 = _1907 * 6.283185482025146484375;
        float _1915 = sin(_1913);
        _1909 = _1915;
    }
    float _1917 = _1909;
    float _1919 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1921 = precise::max(0.0, _1919);
    float _1923 = _1859;
    float _1925 = _1921;
    float _1927 = _1919;
    if (_1877)
    {
        float _1929 = _1907 * 6.283185482025146484375;
        float _1931 = cos(_1929);
        _1923 = _1931;
    }
    float _1933 = _1923;
    float _1935 = -_1863;
    float _1937 = -_1921;
    float _1939 = fma(_1843, _1935, _1937);
    float _1941 = _1939;
    if (!_1877)
    {
        _1925 = _1865;
    }
    float _1943 = _1925;
    float _1945 = _1943;
    if (_1877)
    {
        float _1947 = _1939 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1927 = _1947;
    }
    float _1949 = _1927;
    float _1951 = _1917;
    float _1953 = _1949;
    if (_1877)
    {
        float _1955 = fma(_1917, _1949, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1951 = _1955;
    }
    float _1957 = _1951;
    float _1959 = _1957;
    float _1961 = _1933;
    if (_1877)
    {
        float _1963 = _1933 + (-1.0);
        _1953 = _1963;
    }
    float _1965 = _1953;
    float _1967 = _1965;
    if (_1877)
    {
        float _1969 = _1899 * _1957;
        _1891 = _1969;
    }
    float _1971 = _1891;
    if (!_1877)
    {
        _1959 = _1869;
    }
    float _1973 = _1959;
    float _1975 = _1973;
    if (_1877)
    {
        float _1977 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1911 = _1977;
    }
    float _1979 = _1911;
    if (_1877)
    {
        float _1981 = _1865 * _1971;
        _1945 = _1981;
    }
    float _1983 = _1945;
    if (!_1877)
    {
        _1967 = _1867;
    }
    float _1985 = _1967;
    float _1987 = _1985;
    if (_1877)
    {
        float _1989 = _1867 * _1971;
        _1987 = _1989;
    }
    float _1991 = _1987;
    if (_1877)
    {
        float _1993 = fma(_1939, _1933, _1979);
        _1941 = _1993;
    }
    float _1995 = _1941;
    if (_1877)
    {
        float _1997 = _1983 * _1983;
        _1975 = _1997;
    }
    float _1999 = _1975;
    if (!_1877)
    {
        _1961 = _1871;
    }
    float _2001 = _1961;
    float _2003 = _2001;
    if (_1877)
    {
        float _2005 = _1991 * _1991;
        _2003 = _2005;
    }
    float _2007 = _2003;
    float _2009 = fma(_1995, _1995, _1999);
    float _2011 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2013 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2015 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2017 = _2009 + _2007;
    float _2019 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2011);
    float _2021 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2023 = fma(_1861, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2021);
    float _2025 = precise::clamp(_2023, 0.0, 1.0);
    float _2027 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2029 = rsqrt(_2017);
    float _2031 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2015);
    float _2033 = -_2025;
    float _2035 = _2033 + 1.0;
    float _2037 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2027);
    float _2039 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2019);
    float _2041 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2043 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2031);
    float _2045 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2037);
    float _2047 = abs(_2035);
    float _2049 = log2(_2047);
    float _2051 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2041);
    float _2053 = _2043 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2055 = _2045 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2057 = _2039 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2059 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2051);
    float _2061 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2063 = _2029 * _1983;
    float _2065 = _2029 * _1995;
    float _2067 = _2029 * _1991;
    float _2069 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2061);
    float _2071 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2073 = _2057 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2075 = _2059 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2077 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2069);
    float _2079 = -_2071;
    float _2081 = fma(_2065, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2079);
    float _2083 = _2049 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2085 = -_2073;
    float _2087 = fma(_2085, _2013, 1.0);
    float _2089 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2077);
    float _2091 = -_2067;
    float _2093 = fma(_2091, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2081);
    float _2095 = exp2(_2083);
    float _2097 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2099 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2101 = fma(_2093, -0.5, 0.5);
    float _2103 = _2065 + 1.0;
    float _2105 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2097);
    float _2107 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2099);
    float _2109 = log2(_2087);
    float _2111 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2105);
    float _2113 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2107);
    float _2115 = 1.0 / _2089;
    float _2117 = fma(_2093, 0.5, 0.5);
    float _2119 = -_2065;
    float _2121 = fma(_2095, _2103, _2119);
    float _2123 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2111);
    float _2125 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2113);
    float _2127 = fma(_2117, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2129 = fma(_2121, 0.5, 0.5);
    float _2131 = sqrt(_2101);
    float _2133 = _2109 * 0.693147182464599609375;
    float _2135 = fma(_2117, _2127, -0.212114393711090087890625);
    float _2137 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2139 = fma(_2117, _2135, 1.570728778839111328125);
    float _2141 = _2123 * _2115;
    float _2143 = _2125 * _2115;
    float _2145 = fma(_2143, -0.5, 0.5);
    float _2147 = _2131 * 0.636619746685028076171875;
    float _2149 = fma(_2141, 0.5, 0.5);
    float _2151 = -_2139;
    float _2153 = fma(_2147, _2151, 1.0);
    float3 _6269 = float3(_2149, _2145, _2137);
    float _2155 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6269, float3(0.0), isnan(_6269)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6269, float3(0.0), isnan(_6269)), level(0.0)).x;
    float3 _6280 = float3(_2149, _2145, _2137);
    float4 _2158 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6280, float3(0.0), isnan(_6280)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6280, float3(0.0), isnan(_6280)), level(0.0)).xyzw;
    float _2160 = _2158.x;
    float _2162 = _2158.y;
    float _2164 = _2158.z;
    float _2166 = _2158.w;
    float2 _6297 = float2(_2153, _2129);
    float3 _2170 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6297, float2(0.0), isnan(_6297)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6297, float2(0.0), isnan(_6297)), level(0.0)).xyz;
    float _2172 = _2170.x;
    float _2174 = _2170.y;
    float _2176 = _2170.z;
    int _2178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2180 = _2178 != 0;
    float _2182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2186 = _2184 != 0;
    float _2188 = _957 + 0.5;
    out.m_70.x = _1401;
    out.m_70.y = _1435;
    out.m_70.z = _1389;
    float _2190 = -_1175;
    float _2192 = _2190 + 1.0;
    float _2194 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2196 = _2194 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2198 = in.m_62.w;
    float _2200 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2202 = _2200 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2204 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2206 = isnan(_747);
    bool _2208 = _2204 || _2206;
    bool _2210 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2212 = _2208 || _2210;
    float _2214 = float(_2212);
    float _2216 = 1.0 / _2196;
    float _2218 = 0.0;
    float _2220 = _2123;
    if (_2180)
    {
        float _2222 = in.m_62.z;
        _2218 = _2222;
    }
    float _2224 = _2218;
    float _2226 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2228 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2226;
    bool _2230 = _829 > 0.5;
    float _2232 = -_2214;
    float _2234 = _2232 + 1.0;
    float _2236 = 0.0;
    if (_2186)
    {
        float _2238 = in.m_62.w;
        _2236 = _2238;
    }
    float _2240 = _2236;
    float _2242 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2244 = _2242 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2246 = -_221;
    int _2248 = _2230 ? as_type<int>(_2246) : as_type<int>(_221);
    float _2250 = 1.0 / _2202;
    bool _2252 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2254 = isnan(_747);
    bool _2256 = _2252 || _2254;
    bool _2258 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2260 = _2256 || _2258;
    float _2262 = float(_2260);
    float _2264 = -_1191;
    float _2266 = _2264 + 1.0;
    int _2268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2270 = _2268 != 0;
    float _2272 = _2049 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2274 = _2262 * _2234;
    float _2276 = -_2262;
    float _2278 = _2276 + 1.0;
    float _2280 = _2228 * _2216;
    float _2282 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2284 = _747 + _2282;
    float _2286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    bool _2288 = !_2270;
    float _2290 = _2288 ? _221 : as_type<float>(_2248);
    float _2292 = fma(_2280, _2284, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2294 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2296 = isnan(_747);
    bool _2298 = _2294 || _2296;
    bool _2300 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2302 = _2298 || _2300;
    float _2304 = float(_2302);
    bool _2306 = _2198 > 0.5;
    float _2308 = _2224;
    float _2310 = _2198;
    if (_2180)
    {
        float _2312 = _2224 * 3.1415927410125732421875;
        _2308 = _2312;
    }
    float _2314 = _2308;
    float _2316 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2318 = _2292 * _2274;
    float _2320 = _2314;
    if (!_2180)
    {
        _2310 = _221;
    }
    float _2322 = _2310;
    float _2324 = _2322;
    if (_2180)
    {
        float _2326 = _2314 * 0.15915493667125701904296875;
        _2320 = _2326;
    }
    float _2328 = _2320;
    float _2330 = _2240;
    if (_2186)
    {
        float _2332 = _2240 * 3.1415927410125732421875;
        _2330 = _2332;
    }
    float _2334 = _2330;
    float _2336 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2338 = _747 + _2336;
    float _2340 = fma(_2278, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2318);
    float _2342 = -_2304;
    float _2344 = _2342 + 1.0;
    float _2346 = _2334;
    if (_2186)
    {
        float _2348 = _2334 * 0.15915493667125701904296875;
        _2346 = _2348;
    }
    float _2350 = _2346;
    float _2352 = _2328;
    if (_2180)
    {
        float _2354 = _2328 * 6.283185482025146484375;
        float _2356 = sin(_2354);
        _2352 = _2356;
    }
    float _2358 = _2352;
    float _2360 = _2244 * _2250;
    int _2362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2364 = _2362 != 0;
    float _2366 = _2214 * _2344;
    float _2368 = _2286 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _2370 = fma(_2360, _2338, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2372 = _2182 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2374 = _2290 + 0.5;
    float _2376 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2378 = _2188 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2380 = fma(_2370, _2366, _2340);
    float _2382 = _2316 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2384 = fma(_2372, _2374, _885);
    float _2386 = fma(_2304, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2380);
    if (_2180)
    {
        bool _2388 = _2358 > 0.5;
        _1589 = _2388;
    }
    bool _2390 = _1589;
    float _2392 = _2350;
    if (_2186)
    {
        float _2394 = _2350 * 6.283185482025146484375;
        float _2396 = sin(_2394);
        _2392 = _2396;
    }
    float _2398 = _2392;
    float _2400 = -_205;
    int _2402 = _869 ? as_type<int>(_2400) : as_type<int>(_205);
    float _2404 = _2386 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_2180)
    {
        float _2406 = -_221;
        float _2408 = _2390 ? _2406 : _221;
        _2324 = _2408;
    }
    float _2410 = _2324;
    int _2412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2414 = _2412 != 0;
    int _2416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2418 = _2416 != 0;
    float _2420 = _1193 * (-0.15915493667125701904296875);
    bool _2422 = !_2414;
    float _2424 = _2422 ? _205 : as_type<float>(_2402);
    float _2426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2428 = _2410 + 0.5;
    out.m_72.w = _2404;
    float _2430 = _2424 + (-0.5);
    float _2432 = fma(_2368, _2428, _1197);
    if (_2186)
    {
        bool _2434 = _2398 > 0.5;
        _1013 = _2434;
    }
    bool _2436 = _1013;
    float _2438 = -_979;
    float _2440 = _2438 + 0.5;
    float _2442 = _2420 * 6.283185482025146484375;
    float _2444 = sin(_2442);
    float _2446 = -_2382;
    float _2448 = -_1081;
    float _2450 = fma(_2446, _2430, _2448);
    float _2452 = -_205;
    int _2454 = _2306 ? as_type<int>(_2452) : as_type<int>(_205);
    float _2456 = _2378 * _2376;
    if (!_2186)
    {
        _1015 = _205;
    }
    float _2458 = _1015;
    float _2460 = _2440 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2462 = _2458;
    if (_2186)
    {
        float _2464 = -_205;
        float _2466 = _2436 ? _2464 : _205;
        _2462 = _2466;
    }
    float _2468 = _2462;
    float _2470 = _2420 * 6.283185482025146484375;
    float _2472 = cos(_2470);
    float _2474 = _2460 * _2426;
    float _2476 = _2468 + (-0.5);
    out.m_74.x = _2456;
    out.m_74.y = _2474;
    float _2478 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    bool _2480 = !_2364;
    float _2482 = _2480 ? _205 : as_type<float>(_2454);
    float _2484 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2486 = -_221;
    int _2488 = _953 ? as_type<int>(_2486) : as_type<int>(_221);
    bool _2490 = _1861 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2492 = isnan(_1861);
    bool _2494 = _2490 || _2492;
    bool _2496 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2498 = _2494 || _2496;
    float _2500 = _2482 * _2444;
    bool _2502 = !_2418;
    float _2504 = _2502 ? _221 : as_type<float>(_2488);
    float _2506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2508 = _2482 * _2472;
    float _2510 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2512 = -_2500;
    float _2514 = fma(_2504, _2472, _2512);
    float _2516 = fma(_2504, _2444, _2508);
    float _2518 = -_1123;
    float _2520 = _2518 + 1.0;
    float _2522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2524 = _2478 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _2526 = -_2520;
    float _2528 = fma(_2526, _2410, _2432);
    float _2530 = -_1187;
    float _2532 = _2530 + 1.0;
    float _2534 = -_1177;
    float _2536 = _2534 + 1.0;
    float _2538 = -_2524;
    float _2540 = -_1155;
    float _2542 = fma(_2538, _2476, _2540);
    float _2544 = _2514 + 0.5;
    float _2546 = _2516 + (-0.5);
    float _2548 = _2506 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2550 = fma(_2424, _2532, _2450);
    float _2552 = fma(_2266, _2468, _2542);
    float _2554 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2556 = fma(_2548, _2544, _1201);
    float _2558 = -_1189;
    float _2560 = _2558 + 1.0;
    float _2562 = exp2(_2272);
    out.m_76.x = _2528;
    out.m_76.y = _2552;
    float _2564 = _2522 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2566 = -_2560;
    float _2568 = fma(_2290, _2566, _2384);
    float _2570 = -_2192;
    float _2572 = fma(_2514, _2570, _2556);
    float _2574 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2576 = -_2564;
    float _2578 = -_1203;
    float _2580 = fma(_2576, _2546, _2578);
    float _2582 = -_1331;
    float _2584 = fma(_2582, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2554);
    float _2586 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2588 = -_1331;
    float _2590 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2574);
    float _2592 = fma(_2516, _2536, _2580);
    float _2594 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2596 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2598 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2600 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_78.x = _2568;
    out.m_78.y = _2550;
    out.m_78.z = _2572;
    out.m_78.w = _2592;
    float _2602 = -_1331;
    float _2604 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2586);
    float _2606 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2594);
    float _2608 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2596);
    float _2610 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2598);
    float _2612 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2600);
    float _2614 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2590);
    float _2616 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2584);
    float _2618 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2604);
    float _2620 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2608);
    float _2622 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2606);
    float _2624 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2612);
    float _2626 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2610);
    float _2628 = _2484 * _2614;
    float _2630 = fma(_2484, _2484, 1.0);
    float _2632 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2634 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2636 = -_2562;
    float _2638 = _2636 + 1.0;
    float _2640 = rsqrt(_2630);
    float _2642 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2632);
    float _2644 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2634);
    float _2646 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2648 = fma(_2510, _2622, _2628);
    float _2650 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2642);
    float _2652 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2644);
    float _2654 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2646);
    out.m_80.x = _2622;
    out.m_80.y = _2620;
    out.m_80.z = _2624;
    float _2656 = _2484 * _2616;
    float _2658 = _2123 + _2089;
    float _2660 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2654);
    float _2662 = fma(_2510, _2620, _2656);
    float _2664 = _2658 * 0.5;
    float _2666 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2660);
    float _2668 = _2484 * _2640;
    float _2670 = _2666 + _2089;
    float _2672 = -_2626;
    float _2674 = _2668 * _2672;
    float _2676 = -_2650;
    float _2678 = _2668 * _2676;
    float _2680 = -_2652;
    float _2682 = _2668 * _2680;
    float _2684 = _2670 * 0.5;
    float _2686 = fma(_2640, _2614, _2674);
    float _2688 = fma(_2640, _2616, _2678);
    float _2690 = _2484 * _2618;
    float _2692 = fma(_2640, _2618, _2682);
    float _2694 = _2089 * 0.5;
    float _2696 = _2650 + _2662;
    float _2698 = fma(_2510, _2624, _2690);
    float _2700 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2702 = fma(_2125, -0.5, _2694);
    out.m_82.x = _2686;
    out.m_82.y = _2688;
    out.m_82.z = _2692;
    float _2704 = _2626 + _2648;
    float _2706 = _2652 + _2698;
    float _2708 = _2698;
    if (!_2498)
    {
        _2708 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2710 = _2708;
    out.m_84.x = _2664;
    out.m_84.y = _2702;
    out.m_84.z = _2684;
    out.m_84.w = _2089;
    out.m_86.x = _2704;
    out.m_86.y = _2696;
    out.m_86.z = _2706;
    out.gl_Position.x = _2123;
    out.gl_Position.y = _2125;
    out.gl_Position.z = _2666;
    out.gl_Position.w = _2089;
    float _2712 = _2710;
    float _2714 = _2710;
    if (!_2498)
    {
        _2220 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2716 = _2220;
    float _2718 = _2700 * _2155;
    float _2720 = -_2700;
    float _2722 = _2720 + 1.0;
    float _2724 = _2166 * _2718;
    float _2726 = _2176 * _2718;
    float _2728 = _2166 * _2722;
    float _2730 = _1781 * _1839;
    float _2732 = fma(_2172, _2724, _2160);
    float _2734 = fma(_2174, _2724, _2162);
    float _2736 = fma(_2166, _2726, _2164);
    float _2738 = _2730 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2740 = _2162;
    float _2742 = _2160;
    float _2744 = _2724;
    float _2746 = _2730;
    float _2748 = _2716;
    float _2750 = _2716;
    if (!_2498)
    {
        _2740 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2752 = _2740;
    float _2754 = _2752;
    float _2756 = _2752;
    if (!_2498)
    {
        _2742 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2758 = _2742;
    out.m_88.x = _2732;
    out.m_88.y = _2734;
    out.m_88.z = _2736;
    out.m_88.w = _2728;
    float _2760 = _2758;
    float _2762 = _2758;
    if (!_2498)
    {
        _2744 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2764 = _2744;
    float _2766 = _2764;
    float _2768 = _2764;
    if (!_2498)
    {
        _2746 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2770 = _2746;
    bool _2772 = !_2498;
    float _2774 = _2770;
    float _2776 = _2770;
    if (!_2772)
    {
        bool _2778 = _1861 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2780 = isnan(_1861);
        bool _2782 = _2778 || _2780;
        bool _2784 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2786 = _2782 || _2784;
        if (!_2786)
        {
            float _2788 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2790 = _1861 + _2788;
            float _2792 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2794 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2792;
            float _2796 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2798 = _2796 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2800 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2802 = _2800 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2804 = 1.0 / _2794;
            float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2808 = _2806 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2812 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2818 = _2790 * _2804;
            float _2820 = precise::clamp(_2818, 0.0, 1.0);
            float _2822 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2824 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2826 = fma(_2820, _2798, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2828 = fma(_2820, _2802, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2830 = fma(_2820, _2824, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2832 = fma(_2820, _2808, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2834 = fma(_2820, _2812, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2836 = fma(_2820, _2816, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2768 = _2826;
            _2750 = _2834;
            _2762 = _2828;
            _2714 = _2832;
            _2776 = _2830;
            _2756 = _2836;
            _2838 = true;
        }
        else
        {
            bool _2840 = _1861 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2842 = isnan(_1861);
            bool _2844 = _2840 || _2842;
            bool _2846 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2848 = _2844 || _2846;
            if (!_2848)
            {
                _2712 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2850 = _2712;
            _2714 = _2850;
            if (!_2848)
            {
                _2748 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2852 = _2748;
            _2750 = _2852;
            if (!_2848)
            {
                _2754 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2854 = _2754;
            _2756 = _2854;
            if (!_2848)
            {
                _2760 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2856 = _2760;
            _2762 = _2856;
            if (!_2848)
            {
                _2766 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2858 = _2766;
            _2768 = _2858;
            if (!_2848)
            {
                _2774 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2860 = _2774;
            bool _2862 = !_2848;
            _2776 = _2860;
            if (!_2862)
            {
                bool _2864 = _1861 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2866 = isnan(_1861);
                bool _2868 = _2864 || _2866;
                bool _2870 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2872 = _2868 || _2870;
                if (!_2872)
                {
                    float _2874 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2876 = _1861 + _2874;
                    float _2878 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2880 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2878;
                    float _2882 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2884 = _2882 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2886 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2888 = _2886 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2890 = 1.0 / _2880;
                    float _2892 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2894 = _2892 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2896 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2898 = _2896 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2900 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2902 = _2900 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2904 = _2876 * _2890;
                    float _2906 = precise::clamp(_2904, 0.0, 1.0);
                    float _2908 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2910 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2912 = fma(_2906, _2884, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2914 = fma(_2906, _2888, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2916 = fma(_2906, _2910, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2918 = fma(_2906, _2894, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2920 = fma(_2906, _2898, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2922 = fma(_2906, _2902, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2768 = _2912;
                    _2750 = _2920;
                    _2762 = _2914;
                    _2714 = _2918;
                    _2776 = _2916;
                    _2756 = _2922;
                    _2838 = true;
                }
                else
                {
                    _2768 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2750 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2762 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2714 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2776 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2756 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2838 = false;
    float _2924 = _2768;
    float _2926 = _2750;
    float _2928 = _2762;
    float _2930 = _2714;
    float _2932 = _2776;
    float _2934 = _2756;
    float _2936 = _2738 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2938 = fma(_2696, -0.5, 0.5);
    float _2940 = precise::clamp(_2938, 0.0, 1.0);
    float _2942 = -_2924;
    float _2944 = _2926 + _2942;
    float _2946 = -_2928;
    float _2948 = _2930 + _2946;
    out.m_47.x = _2936;
    float _2950 = -_2932;
    float _2952 = _2934 + _2950;
    float _2954 = fma(_2940, _2944, _2924);
    float _2956 = fma(_2940, _2948, _2928);
    bool _2958 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2960 = _2954 * 0.586610972881317138671875;
    float _2962 = fma(_2940, _2952, _2932);
    out.m_90.x = 0.0;
    bool _2964 = _1781 > 0.0;
    bool _2966 = isnan(_1781);
    bool _2968 = _2964 || _2966;
    bool _2970 = isnan(0.0);
    bool _2972 = _2968 || _2970;
    float _2974 = fma(_2956, 0.298911988735198974609375, _2960);
    bool _2976 = _1839 <= 0.0;
    bool _2978 = !_2972;
    bool _2980 = _2976 || _2978;
    float _2982 = fma(_2962, 0.114477999508380889892578125, _2974);
    float _2984 = -_2982;
    float _2986 = _2956 + _2984;
    float _2988 = fma(_2986, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2982);
    bool _2990 = !_2958;
    if (!_2990)
    {
        float _2992 = -_1715;
        float _2994 = _2992 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2996 = -_1717;
        float _2998 = _2996 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3000 = -_1719;
        float _3002 = _3000 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3004 = _2994 * _2994;
        float _3006 = fma(_2998, _2998, _3004);
        float _3008 = fma(_3002, _3002, _3006);
        float _3010 = sqrt(_3008);
        float _3012 = rsqrt(_3008);
        float _3014 = -_3010;
        float _3016 = _3014 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3018 = _3016 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3020 = precise::clamp(_3018, 0.0, 1.0);
        float _3022 = _2998 * _3012;
        float _3024 = _2994 * _3012;
        float _3026 = abs(_3020);
        float _3028 = log2(_3026);
        float _3030 = _3002 * _3012;
        float _3032 = _3022 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3034 = _2696 * _3024;
        float _3036 = -_3024;
        float _3038 = -_3032;
        float _3040 = fma(_3036, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3038);
        float _3042 = fma(_2704, _3022, _3034);
        float _3044 = -_3030;
        float _3046 = fma(_3044, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3040);
        float _3048 = fma(_2706, _3030, _3042);
        float _3050 = precise::clamp(_3048, 0.0, 1.0);
        float _3052 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3054 = _3046 + _3052;
        float _3056 = _3028 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3058 = _3054 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3060 = precise::clamp(_3058, 0.0, 1.0);
        float _3062 = exp2(_3056);
        float _3064 = _3062 * _3060;
        float _3066 = _3050 * _3064;
        float _3068 = _3066 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        out.m_90.x = _3068;
    }
    out.m_92.x = _2988;
    if (!_2980)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _3070 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3070;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

