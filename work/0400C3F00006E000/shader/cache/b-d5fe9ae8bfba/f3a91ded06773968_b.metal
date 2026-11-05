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
    float4 m_70 [[user(locn0)]];
    float4 m_76 [[user(locn1)]];
    float4 m_74 [[user(locn2)]];
    float4 m_88 [[user(locn3)]];
    float4 m_96 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_82 [[user(locn7)]];
    float4 m_84 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_94 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 m_92 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_86 [[attribute(0)]];
    float4 m_60 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_64 [[attribute(3)]];
    float4 m_72 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_66 [[attribute(8)]];
    float4 m_68 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4987 = false;
    bool _4062 = false;
    bool _751 = false;
    bool _639 = false;
    bool _255 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_48.w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    float _125 = _123;
    if (!_119)
    {
        out.m_51.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _123 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5286 = as_type<float>(_131);
        out.gl_Position.z = _5286;
    }
    if (!_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _135 = in.m_53.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = _149;
    if (_145)
    {
        float _153 = float(_115);
        _125 = _153;
    }
    float _155 = _125;
    bool _157 = _149 >= _155;
    bool _159 = !_145;
    bool _161 = _157 || _159;
    float _163 = _155;
    if (_161)
    {
        _163 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _163;
    if (_161)
    {
        out.m_51.x = 0.0;
    }
    if (_161)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5356 = as_type<float>(_169);
        out.gl_Position.z = _5356;
    }
    if (_161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = in.m_58.x;
    float _175 = in.m_58.y;
    float _177 = in.m_58.z;
    float _179 = in.m_60.x;
    float _181 = in.m_60.y;
    float _183 = in.m_60.z;
    float _185 = in.m_62.x;
    float _187 = in.m_62.y;
    float _189 = in.m_62.z;
    float _191 = in.m_64.x;
    float _193 = in.m_64.y;
    float _195 = in.m_64.z;
    int _197 = as_type<int>(_171) & 1;
    bool _199 = _197 != 0;
    int _201 = as_type<int>(_171) & 2;
    bool _203 = _201 != 0;
    bool _205 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _207 = !_199;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_203;
    float _213 = _211 ? (-0.5) : 0.5;
    float _215 = _175 * _181;
    float _217 = _175 * _187;
    float _219 = fma(_173, _179, _215);
    float _221 = _175 * _193;
    float _223 = fma(_173, _185, _217);
    float _225 = fma(_177, _183, _219);
    float _227 = fma(_173, _191, _221);
    float _229 = fma(_177, _189, _223);
    float _231 = fma(_177, _195, _227);
    bool _233 = !_205;
    float _235 = _229;
    float _253;
    if (!_233)
    {
        float _237 = in.m_66.x;
        float _239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _241 = _237 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _245 = _243 * _239;
        float _247 = floor(_245);
        float _249 = -_247;
        float _251 = _245 + _249;
        _253 = _251;
        _255 = true;
    }
    else
    {
        float _257 = float(_115);
        float _259 = 1.0 / _257;
        float _261 = _149 * _259;
        _253 = _261;
    }
    _255 = false;
    float _263 = _253;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _267 = _263 + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _275 = _273 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _277;
    float _281 = 1.0 / _271;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _289 = _287 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _293 = _291 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _295 = 1.0 / _275;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _299 = _263 + _297;
    bool _301 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _303 = isnan(_263);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = 1.0 / _279;
    float _315 = _299 * _281;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = _263 + _317;
    bool _321 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _323 = isnan(_263);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    bool _333 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _335 = isnan(_263);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = 1.0 / _285;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _347;
    float _351 = _267 * _295;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _355 = _263 + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _359 = _263 + _357;
    bool _361 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _363 = 1.0 / _349;
    float _365 = _319 * _313;
    float _367 = -_331;
    float _369 = _367 + 1.0;
    bool _371 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _373 = isnan(_263);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = _343 * _369;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _385;
    float _389 = 1.0 / _289;
    float _391 = _355 * _345;
    float _393 = -_343;
    float _395 = _393 + 1.0;
    bool _397 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _399 = isnan(_263);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = fma(_387, _315, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _411 = 1.0 / _293;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _415 = _263 + _413;
    float _417 = _415 * _363;
    float _419 = _381 * _395;
    float _421 = -_381;
    float _423 = _421 + 1.0;
    float _425 = _359 * _389;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _429 = _263 + _427;
    bool _431 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _433 = isnan(_263);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = _407 * _423;
    float _445 = -_407;
    float _447 = _445 + 1.0;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _449;
    float _453 = _429 * _411;
    float _455 = _441 * _447;
    float _457 = -_441;
    float _459 = _457 + 1.0;
    bool _461 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _463 = isnan(_263);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = fma(_451, _315, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _475 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _477 = isnan(_263);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = _311 * _459;
    float _489 = -_311;
    float _491 = _489 + 1.0;
    float _493 = -_471;
    float _495 = _493 + 1.0;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _501;
    float _505 = _471 * _491;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _507;
    float _511 = _485 * _495;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _515 = _513 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _517 = fma(_503, _365, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _519 = fma(_509, _365, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _521 = _409 * _511;
    float _523 = -_485;
    float _525 = _523 + 1.0;
    float _527 = _473 * _511;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _533 = fma(_499, _351, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _535 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[143].x, _521);
    float _537 = fma(_515, _351, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _543 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[143].y, _527);
    float _545 = fma(_531, _425, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _547 = fma(_541, _425, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _549 = fma(_533, _505, _535);
    float _551 = fma(_537, _505, _543);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _553;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _557;
    float _561 = fma(_519, _487, _549);
    float _563 = fma(_517, _487, _551);
    float _565 = fma(_555, _391, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _567 = fma(_559, _391, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _577 = fma(_545, _455, _561);
    float _579 = fma(_547, _455, _563);
    float _581 = fma(_571, _453, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _583 = fma(_575, _453, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _585;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _589;
    float _593 = fma(_565, _443, _577);
    float _595 = fma(_567, _443, _579);
    float _597 = fma(_587, _417, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _599 = fma(_591, _417, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _601 = fma(_581, _419, _593);
    float _603 = fma(_583, _419, _595);
    float _605 = fma(_597, _383, _601);
    float _607 = fma(_599, _383, _603);
    float _609 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[150].x, _605);
    float _611 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[150].y, _607);
    bool _613 = !_361;
    int _615 = as_type<int>(_521);
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _637;
    if (!_613)
    {
        float _621 = in.m_66.x;
        float _623 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _625 = _621 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _627 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _629 = _627 * _623;
        float _631 = floor(_629);
        float _633 = -_631;
        float _635 = _629 + _633;
        _637 = _635;
        _639 = true;
    }
    else
    {
        float _641 = float(_115);
        float _643 = 1.0 / _641;
        float _645 = _149 * _643;
        _637 = _645;
    }
    _639 = false;
    float _647 = _637;
    float _649 = in.m_68.x;
    float _651 = in.m_68.y;
    bool _653 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _655 = isnan(_647);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _669 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _671 = isnan(_647);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _681;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _687 = _647 + _685;
    float _689 = -_663;
    float _691 = _689 + 1.0;
    float _693 = 1.0 / _667;
    float _695 = _679 * _691;
    float _697 = -_679;
    float _699 = _697 + 1.0;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _705 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _709 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _707 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _715 = _611 * _651;
    float _717 = _609 * _649;
    float _719 = _683 * _693;
    float _721 = fma(_719, _687, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _723 = _721 * _695;
    float _725 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[115].x, _723);
    float _727 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[116].x, _725);
    float _729 = _727 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_70.x = _709;
    out.m_70.y = _713;
    out.m_70.z = _711;
    out.m_70.w = _729;
    bool _731 = !_705;
    float _749;
    if (!_731)
    {
        float _733 = in.m_66.x;
        float _735 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _737 = _733 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _739 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[11].w, _149);
        float _741 = _739 * _735;
        float _743 = floor(_741);
        float _745 = -_743;
        float _747 = _741 + _745;
        _749 = _747;
        _751 = true;
    }
    else
    {
        float _753 = float(_115);
        float _755 = 1.0 / _753;
        float _757 = _149 * _755;
        _749 = _757;
    }
    _751 = false;
    float _759 = _749;
    float _761 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _763 = int(_761);
    float _765 = float(_115);
    float _767 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _769 = int(_767);
    float _771 = float(_763);
    float _773 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _775 = int(_773);
    float _777 = float(uint(_769));
    float _779 = 1.0 / _771;
    float _781 = float(_769);
    int _783 = ~_769;
    int _785 = _783 + 1;
    float _787 = 1.0 / _777;
    float _789 = float(_775);
    float _791 = _779 * _149;
    float _793 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _795 = int(_793);
    int _797 = as_type<int>(_787) + (-2);
    float _799 = trunc(_791);
    int _801 = int(_799);
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _805 = _803 != 0;
    float _807 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _809 = int(_807);
    float _811 = float(_795);
    float _813 = float(uint(_801));
    float _815 = 1.0 / _765;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _819 = _815;
    if (_805)
    {
        float _821 = in.m_66.x;
        _817 = _821;
    }
    float _823 = _817;
    if (_805)
    {
        _615 = 0;
    }
    int _825 = _615;
    float _827 = as_type<float>(_797) * _813;
    int _829 = _825;
    if (_805)
    {
        _617 = 0;
    }
    int _831 = _617;
    float _833 = float(uint(_809));
    float _835 = trunc(_827);
    float _837 = precise::max(_835, 0.0);
    uint _840 = uint(_837);
    float _842 = 1.0 / _789;
    float _844 = 1.0 / _811;
    float _846 = _823;
    int _848 = _831;
    if (_805)
    {
        _619 = _823;
    }
    float _850 = _619;
    float _852 = 1.0 / _833;
    int _854 = ~_769;
    int _856 = _854 + 1;
    float _858 = _842 * _149;
    int _860 = _856 * int(_840);
    int _862 = _860 + _801;
    float _864 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _866 = int(_864);
    float _868 = _815 * _149;
    float _870 = _844 * _149;
    float _872 = float(uint(_862));
    float _874 = in.m_66.x;
    float _876 = in.m_66.y;
    float _878 = in.m_66.z;
    float _880 = in.m_66.w;
    float _882 = _781 * _868;
    float _884 = _872;
    float _886 = _850;
    if (_805)
    {
        _819 = 1.0;
    }
    float _888 = _819;
    float _890 = as_type<float>(_797) * _872;
    float _892 = trunc(_858);
    int _894 = int(_892);
    float _896 = _888;
    if (_805)
    {
        _884 = 1.0;
    }
    float _898 = _884;
    float _900 = float(uint(_866));
    float _902 = trunc(_882);
    int _904 = int(_902);
    float _906 = trunc(_870);
    int _908 = int(_906);
    float _910 = trunc(_890);
    float _912 = precise::max(_910, 0.0);
    uint _914 = uint(_912);
    float _916 = 1.0 / _900;
    float _918 = _900;
    float _920 = _898;
    if (_805)
    {
        _918 = 1.0;
    }
    float _922 = _918;
    float _924 = _922;
    if (!_805)
    {
        float _926 = in.m_66.y;
        float _928 = in.m_66.z;
        _920 = 7.345489978790283203125;
        _896 = 1.2345600128173828125;
        _846 = _926;
        _924 = 5.839270114898681640625;
        _886 = _928;
        _829 = 1;
        _848 = 2;
    }
    float _930 = _920;
    float _932 = _896;
    float _934 = _846;
    float _936 = _924;
    float _938 = _886;
    int _940 = _829;
    int _942 = _848;
    float _944 = _930 * _874;
    int _946 = int(_840) + int(_914);
    float _948 = _932 * _934;
    float _950 = _936 * _938;
    float _952 = float(_801);
    float _954 = floor(_944);
    int _956 = as_type<int>(_852) + (-2);
    int _958 = _785 * _946;
    int _960 = _958 + _801;
    bool _962 = _952 >= _781;
    bool _964 = isnan(_952);
    bool _966 = _962 || _964;
    bool _968 = isnan(_781);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    float _974 = _717 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _976 = float(uint(_894));
    int _978 = as_type<int>(_916) + (-2);
    float _980 = trunc(_972);
    int _982 = int(_980);
    float _984 = float(uint(_908));
    bool _986 = uint(_960) >= uint(_769);
    float _988 = as_type<float>(_956) * _976;
    bool _990 = _876 > 0.5;
    float _992 = as_type<float>(_978) * _984;
    bool _994 = !_986;
    int _996 = _994 ? 0 : (-1);
    float _998 = -_954;
    float _1000 = _944 + _998;
    float _1002 = trunc(_988);
    float _1004 = precise::max(_1002, 0.0);
    uint _1006 = uint(_1004);
    int _1008 = ~_946;
    int _1010 = _1008 + _996;
    int _1012 = _1010 + 1;
    float _1014 = _1000 * _781;
    bool _1016 = _769 == 0;
    bool _1018 = _878 > 0.5;
    int _1020 = _769 * _1012;
    int _1022 = _1020 + _801;
    int _1024 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1026 = _1024 != 0;
    float _1028 = trunc(_992);
    float _1030 = precise::max(_1028, 0.0);
    uint _1032 = uint(_1030);
    float _1034 = -_209;
    int _1036 = _990 ? as_type<int>(_1034) : as_type<int>(_209);
    int _1038 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1040 = _1038 != 0;
    int _1042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1044 = _1042 != 0;
    int _1046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1048 = _1046 != 0;
    float _1050 = -_213;
    int _1052 = _1018 ? as_type<int>(_1050) : as_type<int>(_213);
    float _1054 = floor(_948);
    bool _1056 = !_1048;
    float _1058 = _1056 ? _213 : as_type<float>(_1052);
    int _1060 = ~_982;
    int _1062 = _1060 + 1;
    int _1064 = _1062 + 1;
    bool _1066 = !_1016;
    int _1068 = _1066 ? _1022 : (-1);
    bool _1070 = !_1044;
    float _1072 = _1070 ? _209 : as_type<float>(_1036);
    float _1074 = floor(_950);
    int _1076 = ~_809;
    int _1078 = _1076 + 1;
    int _1080 = _1068 * _1064;
    int _1082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1084 = _1082 != 0;
    int _1086 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1088 = _1086 != 0;
    int _1090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1092 = _1090 != 0;
    int _1094 = _769 + (-1);
    int _1096 = _1078 * int(_1006);
    int _1098 = _1096 + _894;
    bool _1100 = !_1026;
    int _1102 = _1100 ? 0 : 1;
    float _1104 = trunc(_1014);
    int _1106 = int(_1104);
    bool _1108 = !_1088;
    int _1110 = _1108 ? 0 : 1;
    int _1112 = _982 * _1094;
    int _1114 = _1112 + _1080;
    bool _1116 = _880 > 0.5;
    float _1118 = -_1054;
    float _1120 = _948 + _1118;
    bool _1122 = !_1084;
    int _1124 = _1122 ? 0 : 1;
    int _1126 = abs(_1110);
    float _1128 = -_1074;
    float _1130 = _950 + _1128;
    float _1132 = float(uint(_1098));
    bool _1134 = !_1092;
    int _1136 = _1134 ? 0 : 1;
    int _1138 = _1114 * _1126;
    int _1140 = ~_866;
    int _1142 = _1140 + 1;
    float _1144 = as_type<float>(_956) * _1132;
    int _1146 = abs(_1124);
    int _1148 = abs(_1136);
    float _1150 = trunc(_1144);
    float _1152 = precise::max(_1150, 0.0);
    uint _1154 = uint(_1152);
    int _1156 = _1142 * int(_1032);
    int _1158 = _1156 + _908;
    int _1160 = abs(_1102);
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1164 = _1162 != 0;
    int _1166 = _904 * _1146;
    int _1168 = _1166 + _1138;
    float _1170 = float(uint(_1158));
    int _1172 = _1106 * _1160;
    int _1174 = _1172 + _801;
    int _1176 = ~_809;
    int _1178 = _1176 + 1;
    float _1180 = as_type<float>(_978) * _1170;
    bool _1182 = !_1164;
    int _1184 = _1182 ? 0 : 1;
    int _1186 = _1174 * _1148;
    int _1188 = _1186 + _1168;
    float _1190 = float(_809);
    float _1192 = trunc(_1180);
    float _1194 = precise::max(_1192, 0.0);
    uint _1196 = uint(_1194);
    int _1198 = int(_1006) + int(_1154);
    float _1200 = float(_894);
    float _1202 = _1120 * _1190;
    int _1204 = abs(_1184);
    int _1206 = _1178 * _1198;
    int _1208 = _1206 + _894;
    bool _1210 = _1200 >= _1190;
    bool _1212 = isnan(_1200);
    bool _1214 = _1210 || _1212;
    bool _1216 = isnan(_1190);
    bool _1218 = _1214 || _1216;
    float _1220 = float(_1218);
    float _1222 = _1190 * _868;
    float _1224 = float(_866);
    int _1226 = _1106 * _1204;
    int _1228 = _1226 + _1188;
    int _1230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1232 = _1230 != 0;
    float _1234 = trunc(_1202);
    int _1236 = int(_1234);
    float _1238 = float(_908);
    float _1240 = _1224 * _868;
    bool _1242 = uint(_1208) >= uint(_809);
    float _1244 = _1130 * _1224;
    int _1246 = int(_1032) + int(_1196);
    bool _1248 = !_1232;
    int _1250 = _1248 ? 0 : 1;
    float _1252 = trunc(_1220);
    int _1254 = int(_1252);
    bool _1256 = _1238 >= _1224;
    bool _1258 = isnan(_1238);
    bool _1260 = _1256 || _1258;
    bool _1262 = isnan(_1224);
    bool _1264 = _1260 || _1262;
    float _1266 = float(_1264);
    float _1268 = -_213;
    int _1270 = _1116 ? as_type<int>(_1268) : as_type<int>(_213);
    float _1272 = float(uint(_1228));
    bool _1274 = !_1242;
    int _1276 = _1274 ? 0 : (-1);
    float _1278 = trunc(_1222);
    int _1280 = int(_1278);
    int _1282 = abs(_1250);
    bool _1284 = !_1040;
    float _1286 = _1284 ? _213 : as_type<float>(_1270);
    float _1288 = as_type<float>(_797) * _1272;
    int _1290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1292 = _1290 != 0;
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1296 = _1294 != 0;
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1300 = _1298 != 0;
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1304 = _1302 != 0;
    int _1306 = ~_1198;
    int _1308 = _1306 + _1276;
    int _1310 = _1308 + 1;
    float _1312 = trunc(_1266);
    int _1314 = int(_1312);
    int _1316 = ~_866;
    int _1318 = _1316 + 1;
    bool _1320 = !_1296;
    int _1322 = _1320 ? 0 : 1;
    int _1324 = _809 * _1310;
    int _1326 = _1324 + _894;
    bool _1328 = _809 == 0;
    int _1330 = _1318 * _1246;
    int _1332 = _1330 + _908;
    float _1334 = trunc(_1288);
    float _1336 = precise::max(_1334, 0.0);
    uint _1338 = uint(_1336);
    int _1340 = ~_1254;
    int _1342 = _1340 + 1;
    int _1344 = _1342 + 1;
    bool _1346 = !_1328;
    int _1348 = _1346 ? _1326 : (-1);
    int _1350 = _1236 * _1282;
    int _1352 = _1350 + _894;
    int _1354 = ~_769;
    int _1356 = _1354 + 1;
    int _1358 = _809 + (-1);
    int _1360 = _1348 * _1344;
    bool _1362 = !_1292;
    int _1364 = _1362 ? 0 : 1;
    float _1366 = trunc(_1240);
    int _1368 = int(_1366);
    bool _1370 = uint(_1332) >= uint(_866);
    int _1372 = _1254 * _1358;
    int _1374 = _1372 + _1360;
    int _1376 = abs(_1322);
    bool _1378 = !_1370;
    int _1380 = _1378 ? 0 : (-1);
    int _1382 = _1356 * int(_1338);
    int _1384 = _1382 + _1228;
    int _1386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1388 = _1386 != 0;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1392 = _1390 != 0;
    int _1394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1396 = _1394 != 0;
    int _1398 = _1374 * _1376;
    int _1400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1402 = _1400 != 0;
    float _1404 = float(uint(_1384));
    int _1406 = abs(_1364);
    float _1408 = trunc(_1244);
    int _1410 = int(_1408);
    int _1412 = ~_1246;
    int _1414 = _1412 + _1380;
    int _1416 = _1414 + 1;
    float _1418 = as_type<float>(_797) * _1404;
    float _1420 = float(uint(_1174));
    int _1422 = _1280 * _1406;
    int _1424 = _1422 + _1398;
    bool _1426 = !_1402;
    int _1428 = _1426 ? 0 : 1;
    bool _1430 = !_1300;
    int _1432 = _1430 ? 0 : 1;
    float _1434 = as_type<float>(_797) * _1420;
    int _1436 = abs(_1428);
    float _1438 = trunc(_1418);
    float _1440 = precise::max(_1438, 0.0);
    uint _1442 = uint(_1440);
    bool _1444 = !_1304;
    int _1446 = _1444 ? 0 : 1;
    int _1448 = _866 * _1416;
    int _1450 = _1448 + _908;
    int _1452 = abs(_1432);
    int _1454 = abs(_1446);
    float _1456 = trunc(_1434);
    float _1458 = precise::max(_1456, 0.0);
    uint _1460 = uint(_1458);
    int _1462 = _1410 * _1436;
    int _1464 = _1462 + _908;
    bool _1466 = _866 == 0;
    int _1468 = ~_1314;
    int _1470 = _1468 + 1;
    int _1472 = _1470 + 1;
    int _1474 = _1352 * _1452;
    int _1476 = _1474 + _1424;
    bool _1478 = !_1466;
    int _1480 = _1478 ? _1450 : (-1);
    int _1482 = ~_769;
    int _1484 = _1482 + 1;
    int _1486 = _1236 * _1454;
    int _1488 = _1486 + _1476;
    int _1490 = ~_769;
    int _1492 = _1490 + 1;
    int _1494 = _1480 * _1472;
    bool _1496 = !_1392;
    int _1498 = _1496 ? 0 : 1;
    int _1500 = _866 + (-1);
    int _1502 = _1484 * int(_1460);
    int _1504 = _1502 + _1174;
    int _1506 = int(_1338) + int(_1442);
    int _1508 = _1314 * _1500;
    int _1510 = _1508 + _1494;
    int _1512 = abs(_1498);
    float _1514 = float(uint(_1488));
    float _1516 = float(uint(_1504));
    int _1518 = _1492 * _1506;
    int _1520 = _1518 + _1228;
    int _1522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1524 = _1522 != 0;
    float _1526 = as_type<float>(_956) * _1514;
    int _1528 = _1510 * _1512;
    float _1530 = as_type<float>(_797) * _1516;
    bool _1532 = !_1388;
    int _1534 = _1532 ? 0 : 1;
    float _1536 = float(uint(_1352));
    float _1538 = trunc(_1526);
    float _1540 = precise::max(_1538, 0.0);
    uint _1542 = uint(_1540);
    bool _1544 = uint(_1520) >= uint(_769);
    bool _1546 = !_1396;
    int _1548 = _1546 ? 0 : 1;
    float _1550 = as_type<float>(_956) * _1536;
    int _1552 = abs(_1534);
    int _1554 = abs(_1548);
    float _1556 = trunc(_1530);
    float _1558 = precise::max(_1556, 0.0);
    uint _1560 = uint(_1558);
    bool _1562 = !_1524;
    int _1564 = _1562 ? 0 : 1;
    int _1566 = ~_809;
    int _1568 = _1566 + 1;
    int _1570 = _1368 * _1552;
    int _1572 = _1570 + _1528;
    int _1574 = abs(_1564);
    float _1576 = trunc(_1550);
    float _1578 = precise::max(_1576, 0.0);
    uint _1580 = uint(_1578);
    bool _1582 = !_1544;
    int _1584 = _1582 ? 0 : (-1);
    int _1586 = _1464 * _1554;
    int _1588 = _1586 + _1572;
    int _1590 = _1568 * int(_1542);
    int _1592 = _1590 + _1488;
    int _1594 = ~_1506;
    int _1596 = _1594 + _1584;
    int _1598 = _1596 + 1;
    int _1600 = _1410 * _1574;
    int _1602 = _1600 + _1588;
    float _1604 = float(uint(_1592));
    int _1606 = _769 * _1598;
    int _1608 = _1606 + _1228;
    bool _1610 = _769 == 0;
    int _1612 = int(_1460) + int(_1560);
    float _1614 = as_type<float>(_956) * _1604;
    bool _1616 = !_1610;
    int _1618 = _1616 ? _1608 : (-1);
    int _1620 = _1568 * int(_1580);
    int _1622 = _1620 + _1352;
    float _1624 = float(uint(_1602));
    float _1626 = trunc(_1614);
    float _1628 = precise::max(_1626, 0.0);
    uint _1630 = uint(_1628);
    int _1632 = _1618 & 3;
    bool _1634 = _1632 != 0;
    float _1636 = float(uint(_1622));
    float _1638 = as_type<float>(_978) * _1624;
    int _1640 = _1618 & 3;
    bool _1642 = _1640 != 0;
    int _1644 = _1634 ? 0 : 1;
    float _1646 = as_type<float>(_956) * _1636;
    float _1648 = float(uint(_1464));
    float _1650 = trunc(_1638);
    float _1652 = precise::max(_1650, 0.0);
    uint _1654 = uint(_1652);
    bool _1656 = uint(_1640) > 1u;
    int _1658 = ~_866;
    int _1660 = _1658 + 1;
    float _1662 = as_type<float>(_978) * _1648;
    int _1664 = ~_1644;
    int _1666 = _1664 + 1;
    int _1668 = _1666 + 1;
    float _1670 = trunc(_1646);
    float _1672 = precise::max(_1670, 0.0);
    uint _1674 = uint(_1672);
    int _1676 = int(_1542) + int(_1630);
    int _1678 = ~_769;
    int _1680 = _1678 + 1;
    int _1682 = ~_809;
    int _1684 = _1682 + 1;
    int _1686 = _1668;
    if (!_1656)
    {
        int _1688 = ~_1644;
        int _1690 = _1688 + 1;
        _1686 = _1690;
    }
    int _1692 = _1686;
    int _1694 = _1660 * int(_1654);
    int _1696 = _1694 + _1602;
    bool _1698 = uint(_1640) >= 2u;
    int _1700 = _1680 * _1612;
    int _1702 = _1700 + _1174;
    float _1704 = trunc(_1662);
    float _1706 = precise::max(_1704, 0.0);
    uint _1708 = uint(_1706);
    int _1710 = ~_866;
    int _1712 = _1710 + 1;
    float _1714 = float(uint(_1696));
    int _1716 = _1698 ? 0 : 1;
    bool _1718 = uint(_1702) >= uint(_769);
    float _1720 = as_type<float>(_978) * _1714;
    int _1722 = _1684 * _1676;
    int _1724 = _1722 + _1488;
    int _1726 = ~_1716;
    int _1728 = _1726 + 1;
    int _1730 = _1728 + 1;
    bool _1732 = !_1718;
    int _1734 = _1732 ? 0 : (-1);
    bool _1736 = uint(_1724) >= uint(_809);
    float _1738 = trunc(_1720);
    float _1740 = precise::max(_1738, 0.0);
    uint _1742 = uint(_1740);
    int _1744 = ~_1612;
    int _1746 = _1744 + _1734;
    int _1748 = _1746 + 1;
    int _1750 = _1712 * int(_1708);
    int _1752 = _1750 + _1464;
    bool _1754 = !_1736;
    int _1756 = _1754 ? 0 : (-1);
    bool _1758 = _1640 != 3;
    int _1760 = _769 * _1748;
    int _1762 = _1760 + _1174;
    int _1764 = ~_1676;
    int _1766 = _1764 + _1756;
    int _1768 = _1766 + 1;
    float _1770 = float(uint(_1752));
    int _1772 = ~_866;
    int _1774 = _1772 + 1;
    int _1776 = _809 * _1768;
    int _1778 = _1776 + _1488;
    bool _1780 = !_1642;
    int _1782 = _1780 ? 0 : 1;
    float _1784 = as_type<float>(_978) * _1770;
    bool _1786 = !_1610;
    int _1788 = _1786 ? _1762 : (-1);
    bool _1790 = !_1328;
    int _1792 = _1790 ? _1778 : (-1);
    float _1794 = trunc(_1784);
    float _1796 = precise::max(_1794, 0.0);
    uint _1798 = uint(_1796);
    int _1800 = int(_1654) + int(_1742);
    int _1802 = _1730;
    if (_1758)
    {
        int _1804 = ~_1716;
        int _1806 = _1804 + 1;
        _1802 = _1806;
    }
    int _1808 = _1802;
    int _1810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1812 = _1810 != 0;
    int _1814 = _1774 * _1800;
    int _1816 = _1814 + _1602;
    int _1818 = _1792 & 3;
    bool _1820 = _1818 != 0;
    int _1822 = _1792 & 3;
    bool _1824 = _1822 != 0;
    bool _1826 = !_1812;
    int _1828 = _1826 ? 0 : 1;
    bool _1830 = uint(_1818) > 1u;
    int _1832 = _1824 ? 0 : 1;
    bool _1834 = uint(_1816) >= uint(_866);
    int _1836 = ~_1832;
    int _1838 = _1836 + 1;
    int _1840 = _1838 + 1;
    bool _1842 = !_1834;
    int _1844 = _1842 ? 0 : (-1);
    bool _1846 = _1640 != 3;
    int _1848 = ~_1800;
    int _1850 = _1848 + _1844;
    int _1852 = _1850 + 1;
    int _1854 = _1840;
    if (!_1830)
    {
        int _1856 = ~_1832;
        int _1858 = _1856 + 1;
        _1854 = _1858;
    }
    int _1860 = _1854;
    bool _1862 = uint(_1818) >= 2u;
    int _1864 = _866 * _1852;
    int _1866 = _1864 + _1602;
    int _1868 = int(_1580) + int(_1674);
    int _1870 = ~_809;
    int _1872 = _1870 + 1;
    int _1874 = _1792 >> 31;
    bool _1876 = !_1846;
    int _1878 = _1876 ? 0 : (-1);
    int _1880 = _1872 * _1868;
    int _1882 = _1880 + _1352;
    int _1884 = _1862 ? 0 : 1;
    bool _1886 = _1818 != 3;
    bool _1888 = _1818 != 3;
    int _1890 = _1874 & 3;
    bool _1892 = !_1466;
    int _1894 = _1892 ? _1866 : (-1);
    bool _1896 = !_1820;
    int _1898 = _1896 ? 0 : 1;
    int _1900 = _1792 + _1890;
    bool _1902 = uint(_1882) >= uint(_809);
    int _1904 = _1894 >> 31;
    int _1906 = _1618 >> 31;
    int _1908 = _1904 & 3;
    int _1910 = _1906 & 3;
    int _1912 = ~_1884;
    int _1914 = _1912 + 1;
    int _1916 = _1914 + 1;
    int _1918 = _1916;
    if (_1886)
    {
        int _1920 = ~_1884;
        int _1922 = _1920 + 1;
        _1918 = _1922;
    }
    int _1924 = _1918;
    bool _1926 = !_1888;
    int _1928 = _1926 ? 0 : (-1);
    int _1930 = _1618 + _1910;
    int _1932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1934 = _1932 != 0;
    int _1936 = _1894 & 3;
    bool _1938 = _1936 != 0;
    int _1940 = _1894 + _1908;
    int _1942 = _1894 & 3;
    bool _1944 = _1942 != 0;
    float _1946 = in.m_48.x;
    float _1948 = in.m_48.y;
    float _1950 = in.m_48.z;
    int _1952 = int(_1708) + int(_1798);
    bool _1954 = !_1934;
    int _1956 = _1954 ? 0 : 1;
    int _1958 = _1930 >> 2;
    bool _1960 = !_1902;
    int _1962 = _1960 ? 0 : (-1);
    bool _1964 = uint(_1942) > 1u;
    int _1966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1968 = _1966 != 0;
    int _1970 = _1958 << 4;
    int _1972 = _1970 + 368;
    int _1974 = _1900 >> 2;
    bool _1976 = !_1968;
    int _1978 = _1976 ? 0 : 1;
    uint _1980 = uint(int(uint(_1972) >> uint(2)));
    uint _1982 = uint(int(uint(int(_1980)) >> uint(2)));
    int _1984 = int(_1980) & 3;
    float _1986 = (*spvDescriptorSet0.vp_c9)._m0[int(_1982)][_1984];
    int _1988 = int(_1980) + 1;
    uint _1990 = uint(int(uint(_1988) >> uint(2)));
    int _1992 = _1988 & 3;
    float _1994 = (*spvDescriptorSet0.vp_c9)._m0[int(_1990)][_1992];
    int _1996 = ~_866;
    int _1998 = _1996 + 1;
    bool _2000 = _1942 != 3;
    int _2002 = _1938 ? 0 : 1;
    int _2004 = _1998 * _1952;
    int _2006 = _2004 + _1464;
    int _2008 = _1974 << 4;
    int _2010 = _2008 + 512;
    float _2012 = _193 * _1948;
    int _2014 = _1940 >> 2;
    float _2016 = _181 * _1948;
    bool _2018 = uint(_1942) >= 2u;
    uint _2020 = uint(int(uint(_2010) >> uint(2)));
    uint _2022 = uint(int(uint(int(_2020)) >> uint(2)));
    int _2024 = int(_2020) & 3;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[int(_2022)][_2024];
    int _2028 = int(_2020) + 1;
    uint _2030 = uint(int(uint(_2028) >> uint(2)));
    int _2032 = _2028 & 3;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[int(_2030)][_2032];
    int _2036 = ~_2002;
    int _2038 = _2036 + 1;
    int _2040 = _2038 + 1;
    float _2042 = fma(_179, _1946, _2016);
    int _2044 = _2040;
    if (!_1964)
    {
        int _2046 = ~_2002;
        int _2048 = _2046 + 1;
        _2044 = _2048;
    }
    int _2050 = _2044;
    float _2052 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2054 = int(_2052);
    int _2056 = _2014 << 4;
    int _2058 = _2056 + 656;
    bool _2060 = _1942 != 3;
    int _2062 = _2018 ? 0 : 1;
    uint _2064 = uint(int(uint(_2058) >> uint(2)));
    uint _2066 = uint(int(uint(int(_2064)) >> uint(2)));
    int _2068 = int(_2064) & 3;
    float _2070 = (*spvDescriptorSet0.vp_c9)._m0[int(_2066)][_2068];
    int _2072 = int(_2064) + 1;
    uint _2074 = uint(int(uint(_2072) >> uint(2)));
    int _2076 = _2072 & 3;
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[int(_2074)][_2076];
    bool _2080 = uint(_2006) >= uint(_866);
    bool _2082 = !_1944;
    int _2084 = _2082 ? 0 : 1;
    int _2086 = ~_2062;
    int _2088 = _2086 + 1;
    int _2090 = _2088 + 1;
    int _2092 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2094 = _2092 != 0;
    int _2096 = _2090;
    if (_2000)
    {
        int _2098 = ~_2062;
        int _2100 = _2098 + 1;
        _2096 = _2100;
    }
    int _2102 = _2096;
    bool _2104 = !_2060;
    int _2106 = _2104 ? 0 : (-1);
    bool _2108 = !_2080;
    int _2110 = _2108 ? 0 : (-1);
    int _2112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2114 = _2112 != 0;
    int _2116 = _1972 + 8;
    uint _2118 = uint(int(uint(_2116) >> uint(2)));
    uint _2120 = uint(int(uint(int(_2118)) >> uint(2)));
    int _2122 = int(_2118) & 3;
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[int(_2120)][_2122];
    int _2126 = int(_2118) + 1;
    uint _2128 = uint(int(uint(_2126) >> uint(2)));
    int _2130 = _2126 & 3;
    float _2132 = (*spvDescriptorSet0.vp_c9)._m0[int(_2128)][_2130];
    int _2134 = ~_1868;
    int _2136 = _2134 + _1962;
    int _2138 = _2136 + 1;
    int _2140 = ~_1952;
    int _2142 = _2140 + _2110;
    int _2144 = _2142 + 1;
    float _2146 = fma(_191, _1946, _2012);
    int _2148 = abs(_1692);
    int _2150 = _809 * _2138;
    int _2152 = _2150 + _1352;
    int _2154 = abs(_2050);
    int _2156 = _2010 + 8;
    uint _2158 = uint(int(uint(_2156) >> uint(2)));
    uint _2160 = uint(int(uint(int(_2158)) >> uint(2)));
    int _2162 = int(_2158) & 3;
    float _2164 = (*spvDescriptorSet0.vp_c9)._m0[int(_2160)][_2162];
    int _2166 = int(_2158) + 1;
    uint _2168 = uint(int(uint(_2166) >> uint(2)));
    int _2170 = _2166 & 3;
    float _2172 = (*spvDescriptorSet0.vp_c9)._m0[int(_2168)][_2170];
    int _2174 = _866 * _2144;
    int _2176 = _2174 + _1464;
    int _2178 = abs(_1860);
    int _2180 = abs(_1782);
    int _2182 = _2058 + 8;
    uint _2184 = uint(int(uint(_2182) >> uint(2)));
    uint _2186 = uint(int(uint(int(_2184)) >> uint(2)));
    int _2188 = int(_2184) & 3;
    float _2190 = (*spvDescriptorSet0.vp_c9)._m0[int(_2186)][_2188];
    int _2192 = int(_2184) + 1;
    uint _2194 = uint(int(uint(_2192) >> uint(2)));
    int _2196 = _2192 & 3;
    float _2198 = (*spvDescriptorSet0.vp_c9)._m0[int(_2194)][_2196];
    int _2200 = ~_2148;
    int _2202 = _2200 + 1;
    int _2204 = _2202 + 1;
    int _2206 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2208 = _2206 != 0;
    float _2210 = _187 * _1948;
    int _2212 = ~_2180;
    int _2214 = _2212 + 1;
    int _2216 = _2214 + 1;
    int _2218 = _2204 * as_type<int>(_1994);
    int _2220 = ~_2178;
    int _2222 = _2220 + 1;
    int _2224 = _2222 + 1;
    float _2226 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2228 = int(_2226);
    int _2230 = abs(_1898);
    int _2232 = _2216 * as_type<int>(_1986);
    int _2234 = _2232 + _2218;
    int _2236 = abs(_2084);
    int _2238 = _2224 * as_type<int>(_2034);
    int _2240 = ~_2230;
    int _2242 = _2240 + 1;
    int _2244 = _2242 + 1;
    float _2246 = fma(_185, _1946, _2210);
    int _2248 = abs(_1924);
    float _2250 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2252 = int(_2250);
    int _2254 = ~_2154;
    int _2256 = _2254 + 1;
    int _2258 = _2256 + 1;
    int _2260 = _2244 * as_type<int>(_2026);
    int _2262 = _2260 + _2238;
    int _2264 = abs(_1808);
    float _2266 = fma(_189, _1950, _2246);
    int _2268 = _2258 * as_type<int>(_2078);
    int _2270 = ~_2264;
    int _2272 = _2270 + 1;
    int _2274 = _2272 + 1;
    int _2276 = ~_2236;
    int _2278 = _2276 + 1;
    int _2280 = _2278 + 1;
    int _2282 = abs(_2102);
    int _2284 = ~_2248;
    int _2286 = _2284 + 1;
    int _2288 = _2286 + 1;
    int _2290 = _2280 * as_type<int>(_2070);
    int _2292 = _2290 + _2268;
    int _2294 = ~_2282;
    int _2296 = _2294 + 1;
    int _2298 = _2296 + 1;
    int _2300 = _2274 * as_type<int>(_2124);
    int _2302 = _2300 + _2234;
    int _2304 = abs(_2106);
    float _2306 = float(uint(_2228));
    int _2308 = abs(_1828);
    int _2310 = _2288 * as_type<int>(_2164);
    int _2312 = _2310 + _2262;
    int _2314 = abs(_1878);
    float _2316 = 1.0 / _2306;
    int _2318 = abs(_1928);
    int _2320 = ~_2314;
    int _2322 = _2320 + 1;
    int _2324 = _2322 + 1;
    int _2326 = _2298 * as_type<int>(_2190);
    int _2328 = _2326 + _2292;
    int _2330 = ~_2304;
    int _2332 = _2330 + 1;
    int _2334 = _2332 + 1;
    float _2336 = _874 * 2.0;
    float _2338 = float(uint(_2252));
    int _2340 = _2324 * as_type<int>(_2132);
    int _2342 = _2340 + _2302;
    int _2344 = ~_2318;
    int _2346 = _2344 + 1;
    int _2348 = _2346 + 1;
    int _2350 = _2334 * as_type<int>(_2198);
    int _2352 = _2350 + _2328;
    int _2354 = ~_2308;
    int _2356 = _2354 + 1;
    int _2358 = _2356 + 1;
    float _2360 = floor(_2336);
    int _2362 = abs(_1978);
    int _2364 = _2348 * as_type<int>(_2172);
    int _2366 = _2364 + _2312;
    float _2368 = float(uint(_2054));
    int _2370 = _2342 * _2358;
    int _2372 = abs(_1956);
    int _2374 = ~_2362;
    int _2376 = _2374 + 1;
    int _2378 = _2376 + 1;
    float _2380 = 1.0 / _2338;
    int _2382 = _1788 * _2308;
    int _2384 = _2382 + _2370;
    int _2386 = abs(_2228);
    int _2388 = _2352 * _2378;
    int _2390 = as_type<int>(_2316) + (-2);
    float _2392 = float(uint(_2386));
    float _2394 = 1.0 / _2368;
    int _2396 = abs(_2054);
    bool _2398 = !_1328;
    int _2400 = _2398 ? _2152 : (-1);
    float _2402 = float(uint(_2384));
    float _2404 = 1.0 / _2392;
    int _2406 = ~_2372;
    int _2408 = _2406 + 1;
    int _2410 = _2408 + 1;
    float _2412 = as_type<float>(_2390) * _2402;
    bool _2414 = !_1466;
    int _2416 = _2414 ? _2176 : (-1);
    float _2418 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2420 = float(uint(_2396));
    int _2422 = _2366 * _2410;
    float _2424 = _874 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2426 = _2416 * _2362;
    int _2428 = _2426 + _2388;
    int _2430 = abs(_2252);
    int _2432 = _2400 * _2372;
    int _2434 = _2432 + _2422;
    int _2436 = as_type<int>(_2380) + (-2);
    float _2438 = 1.0 / _2420;
    float _2440 = -_2418;
    float _2442 = fma(_2424, 2.0, _2440);
    float _2444 = float(uint(_2434));
    float _2446 = -_149;
    float _2448 = fma(_2446, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2442);
    int _2450 = as_type<int>(_2394) + (-2);
    float _2452 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2454 = trunc(_2412);
    float _2456 = precise::max(_2454, 0.0);
    uint _2458 = uint(_2456);
    float _2460 = float(uint(_2428));
    float _2462 = as_type<float>(_2436) * _2444;
    float _2464 = float(uint(_2430));
    float _2466 = _876 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2468 = abs(_2384);
    float _2470 = as_type<float>(_2450) * _2460;
    int _2472 = ~_2228;
    int _2474 = _2472 + 1;
    float _2476 = fma(_2466, -2.0, _2452);
    float _2478 = 1.0 / _2464;
    float _2480 = fma(_183, _1950, _2042);
    int _2482 = as_type<int>(_2404) + (-2);
    float _2484 = fma(_195, _1950, _2146);
    float _2486 = float(uint(_2468));
    float _2488 = trunc(_2462);
    float _2490 = precise::max(_2488, 0.0);
    uint _2492 = uint(_2490);
    int _2494 = as_type<int>(_2438) + (-2);
    float _2496 = as_type<float>(_2482) * _2486;
    int _2498 = _2474 * int(_2458);
    int _2500 = _2498 + _2384;
    int _2502 = abs(_2434);
    int _2504 = ~_2252;
    int _2506 = _2504 + 1;
    float _2508 = trunc(_2470);
    float _2510 = precise::max(_2508, 0.0);
    uint _2512 = uint(_2510);
    int _2514 = as_type<int>(_2478) + (-2);
    float _2516 = float(uint(_2502));
    float _2518 = trunc(_2496);
    float _2520 = precise::max(_2518, 0.0);
    uint _2522 = uint(_2520);
    int _2524 = abs(_2428);
    int _2526 = _2506 * int(_2492);
    int _2528 = _2526 + _2434;
    float _2530 = as_type<float>(_2514) * _2516;
    float _2532 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2534 = _2532 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2536 = float(uint(_2524));
    float _2538 = float(uint(_2528));
    float _2540 = trunc(_2530);
    float _2542 = precise::max(_2540, 0.0);
    uint _2544 = uint(_2542);
    float _2546 = as_type<float>(_2494) * _2536;
    float _2548 = float(uint(_2500));
    int _2550 = ~_2054;
    int _2552 = _2550 + 1;
    float _2554 = as_type<float>(_2390) * _2548;
    float _2556 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2558 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2556;
    int _2560 = ~_2386;
    int _2562 = _2560 + 1;
    float _2564 = 1.0 / _2534;
    float _2566 = as_type<float>(_2436) * _2538;
    int _2568 = _2552 * int(_2512);
    int _2570 = _2568 + _2428;
    bool _2572 = _2360 > 0.0;
    bool _2574 = _2360 >= 0.0;
    bool _2576 = isnan(_2360);
    bool _2578 = _2574 || _2576;
    bool _2580 = isnan(0.0);
    bool _2582 = _2578 || _2580;
    float _2584 = float(uint(_2570));
    int _2586 = _2562 * int(_2522);
    int _2588 = _2586 + _2468;
    float _2590 = trunc(_2554);
    float _2592 = precise::max(_2590, 0.0);
    uint _2594 = uint(_2592);
    int _2596 = ~_2396;
    int _2598 = _2596 + 1;
    float _2600 = as_type<float>(_2450) * _2584;
    float _2602 = float(uint(_2588));
    int _2604 = ~_2430;
    int _2606 = _2604 + 1;
    float _2608 = _2558 * _2564;
    float _2610 = trunc(_2546);
    float _2612 = precise::max(_2610, 0.0);
    uint _2614 = uint(_2612);
    float _2616 = as_type<float>(_2482) * _2602;
    float _2618 = _874 + _876;
    int _2620 = _2606 * int(_2544);
    int _2622 = _2620 + _2502;
    float _2624 = _2618 + (-1.0);
    bool _2626 = _876 > 0.5;
    float _2628 = trunc(_2616);
    float _2630 = precise::max(_2628, 0.0);
    uint _2632 = uint(_2630);
    float _2634 = float(uint(_2622));
    float _2636 = fma(_2624, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2638 = int(_2458) + int(_2594);
    float _2640 = _876 + _878;
    int _2642 = ~_2228;
    int _2644 = _2642 + 1;
    float _2646 = as_type<float>(_2514) * _2634;
    bool _2648 = _940 != 1;
    float _2650 = trunc(_2566);
    float _2652 = precise::max(_2650, 0.0);
    uint _2654 = uint(_2652);
    int _2656 = _2598 * int(_2614);
    int _2658 = _2656 + _2524;
    float _2660 = _2640 + (-1.0);
    int _2662 = _2644 * _2638;
    int _2664 = _2662 + _2384;
    int _2666 = ~_2386;
    int _2668 = _2666 + 1;
    float _2670 = in.m_64.w;
    float _2672 = fma(_2660, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2674 = -_213;
    int _2676 = _2626 ? as_type<int>(_2674) : as_type<int>(_213);
    float _2678 = trunc(_2646);
    float _2680 = precise::max(_2678, 0.0);
    uint _2682 = uint(_2680);
    int _2684 = int(_2522) + int(_2632);
    float _2686 = float(uint(_2658));
    bool _2688 = uint(_2664) >= uint(_2228);
    int _2690 = _2668 * _2684;
    int _2692 = _2690 + _2468;
    bool _2694 = !_2094;
    float _2696 = _2694 ? _213 : as_type<float>(_2676);
    float _2698 = trunc(_2600);
    float _2700 = precise::max(_2698, 0.0);
    uint _2702 = uint(_2700);
    int _2704 = int(_2492) + int(_2654);
    float _2706 = as_type<float>(_2494) * _2686;
    int _2708 = ~_2252;
    int _2710 = _2708 + 1;
    bool _2712 = _878 > 0.5;
    bool _2714 = !_2688;
    int _2716 = _2714 ? 0 : (-1);
    int _2718 = _2710 * _2704;
    int _2720 = _2718 + _2434;
    float _2722 = trunc(_2706);
    float _2724 = precise::max(_2722, 0.0);
    uint _2726 = uint(_2724);
    float _2728 = -_209;
    int _2730 = _2712 ? as_type<int>(_2728) : as_type<int>(_209);
    int _2732 = ~_2638;
    int _2734 = _2732 + _2716;
    int _2736 = _2734 + 1;
    float _2738 = _2484 + _2670;
    int _2740 = int(_2544) + int(_2682);
    bool _2742 = uint(_2692) >= uint(_2386);
    int _2744 = _2228 * _2736;
    int _2746 = _2744 + _2384;
    int _2748 = ~_2430;
    int _2750 = _2748 + 1;
    bool _2752 = uint(_2720) >= uint(_2252);
    bool _2754 = !_2742;
    float _2756 = _2754 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    int _2758 = _2750 * _2740;
    int _2760 = _2758 + _2502;
    int _2762 = int(_2512) + int(_2702);
    int _2764 = ~_2054;
    int _2766 = _2764 + 1;
    bool _2768 = _2228 == 0;
    bool _2770 = !_2752;
    int _2772 = _2770 ? 0 : (-1);
    int _2774 = _2766 * _2762;
    int _2776 = _2774 + _2428;
    bool _2778 = !_2114;
    float _2780 = _2778 ? _209 : as_type<float>(_2730);
    bool _2782 = _874 > 0.5;
    bool _2784 = !_2768;
    int _2786 = _2784 ? _2746 : (-1);
    int _2788 = ~_2704;
    int _2790 = _2788 + _2772;
    int _2792 = _2790 + 1;
    bool _2794 = uint(_2760) >= uint(_2430);
    float _2796 = in.m_60.w;
    float _2798 = -_209;
    int _2800 = _2782 ? as_type<int>(_2798) : as_type<int>(_209);
    int _2802 = _2252 * _2792;
    int _2804 = _2802 + _2434;
    bool _2806 = _942 != 2;
    int _2808 = int(_2614) + int(_2726);
    int _2810 = ~_2396;
    int _2812 = _2810 + 1;
    bool _2814 = !_2794;
    int _2816 = _2814 ? 0 : (-1);
    bool _2818 = uint(_2776) >= uint(_2054);
    int _2820 = _2812 * _2808;
    int _2822 = _2820 + _2524;
    bool _2824 = _2252 == 0;
    bool _2826 = !_2208;
    float _2828 = _2826 ? _209 : as_type<float>(_2800);
    bool _2830 = _2228 == 0;
    int _2832 = _2384 ^ _2228;
    bool _2834 = !_2818;
    float _2836 = _2834 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2838 = in.m_62.w;
    bool _2840 = !_2824;
    int _2842 = _2840 ? _2804 : (-1);
    bool _2844 = _2252 == 0;
    int _2846 = _2434 ^ _2252;
    float _2848 = _876 * 2.0;
    int _2850 = ~_2762;
    int _2852 = _2850 + as_type<int>(_2836);
    int _2854 = _2852 + 1;
    int _2856 = ~_2816;
    int _2858 = _2740 + _2856;
    int _2860 = _2858 + 1;
    float _2862 = floor(_2848);
    uint _2864 = uint(int(uint(_2832) >> uint(31)));
    bool _2866 = uint(_2822) >= uint(_2396);
    uint _2868 = uint(int(uint(_2846) >> uint(31)));
    int _2870 = ~as_type<int>(_2756);
    int _2872 = _2684 + _2870;
    int _2874 = _2872 + 1;
    float _2876 = _878 * 2.0;
    int _2878 = ~int(_2864);
    int _2880 = _2878 + 1;
    int _2882 = _2054 * _2854;
    int _2884 = _2882 + _2428;
    float _2886 = _2756;
    float _2888 = as_type<float>(_2804);
    float _2890 = as_type<float>(_2434);
    float _2892 = _2836;
    float _2894 = as_type<float>(_2684);
    if (!_2648)
    {
        _2886 = _876;
    }
    float _2896 = _2886;
    float _2898 = floor(_2876);
    int _2900 = ~int(_2868);
    int _2902 = _2900 + 1;
    float _2904 = _2266 + _2838;
    float _2906 = _2896;
    if (!_2648)
    {
        _2888 = _2896;
    }
    float _2908 = _2888;
    float _2910 = _2908;
    if (!_2648)
    {
        _2890 = _878;
    }
    float _2912 = _2890;
    float _2914 = _2912;
    if (!_2648)
    {
        _2892 = _878;
    }
    float _2916 = _2892;
    float _2918 = _2916;
    if (_2648)
    {
        _2910 = _874;
    }
    float _2920 = _2910;
    if (_2648)
    {
        _2906 = _874;
    }
    float _2922 = _2906;
    if (_2648)
    {
        _2914 = _876;
    }
    float _2924 = _2914;
    if (_2648)
    {
        _2918 = _876;
    }
    float _2926 = _2918;
    bool _2928 = _2054 == 0;
    float _2930 = _2924 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2932 = _2874 ^ _2880;
    float _2934 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2936 = _2860 ^ _2902;
    bool _2938 = !_2866;
    int _2940 = _2938 ? 0 : (-1);
    bool _2942 = !_2928;
    int _2944 = _2942 ? _2884 : (-1);
    int _2946 = ~_2880;
    int _2948 = _2946 + _2932;
    int _2950 = _2948 + 1;
    int _2952 = ~_2902;
    int _2954 = _2952 + _2936;
    int _2956 = _2954 + 1;
    float _2958 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2960 = _759 + _2958;
    bool _2962 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2964 = isnan(_759);
    bool _2966 = _2962 || _2964;
    bool _2968 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2970 = _2966 || _2968;
    float _2972 = float(_2970);
    bool _2974 = _2862 > 0.0;
    float _2976 = fma(_2608, _2960, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2978 = _2862 >= 0.0;
    bool _2980 = isnan(_2862);
    bool _2982 = _2978 || _2980;
    bool _2984 = isnan(0.0);
    bool _2986 = _2982 || _2984;
    float _2988 = -_2972;
    float _2990 = _2988 + 1.0;
    float _2992 = _2862;
    if (_2806)
    {
        _2894 = _874;
    }
    float _2994 = _2894;
    float _2996 = _2480 + _2796;
    float _2998 = _2994;
    float _3000 = _2996;
    if (_2806)
    {
        _2992 = _876;
    }
    float _3002 = _2992;
    float _3004 = _2934 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3006 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3008 = isnan(_759);
    bool _3010 = _3006 || _3008;
    bool _3012 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3014 = _3010 || _3012;
    float _3016 = float(_3014);
    float _3018 = _3002;
    if (!_2806)
    {
        _2998 = _878;
    }
    float _3020 = _2998;
    if (!_2806)
    {
        _3018 = _874;
    }
    float _3022 = _3018;
    float _3024 = -_3016;
    float _3026 = _3024 + 1.0;
    bool _3028 = !_2830;
    int _3030 = _3028 ? _2950 : (-1);
    bool _3032 = !_2844;
    int _3034 = _3032 ? _2956 : (-1);
    float _3036 = _3016 * _2990;
    int _3038 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3040 = _3038 != 0;
    int _3042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3044 = _3042 != 0;
    int _3046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3048 = _3046 != 0;
    float _3050 = _3022 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _3052 = _2582 ? 0 : 1;
    float _3054 = _2976 * _3036;
    bool _3056 = _2898 > 0.0;
    float _3058 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3060 = !_3044;
    int _3062 = _3060 ? 0 : 1;
    float _3064 = fma(_3026, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3054);
    bool _3066 = _2898 >= 0.0;
    bool _3068 = isnan(_2898);
    bool _3070 = _3066 || _3068;
    bool _3072 = isnan(0.0);
    bool _3074 = _3070 || _3072;
    int _3076 = _2428 ^ _2054;
    float _3078 = fma(_2972, (*spvDescriptorSet0.vp_c9)._m0[132].x, _3064);
    int _3080 = _3074 ? 0 : 1;
    float _3082 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _3084 = uint(int(uint(_3076) >> uint(31)));
    int _3086 = ~_3080;
    int _3088 = _3086 + 1;
    int _3090 = _3088 + 1;
    int _3092 = ~_2940;
    int _3094 = _2808 + _3092;
    int _3096 = _3094 + 1;
    float _3098 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3100 = _2904 + _3098;
    int _3102 = _3090;
    if (!_3056)
    {
        int _3104 = ~_3080;
        int _3106 = _3104 + 1;
        _3102 = _3106;
    }
    int _3108 = _3102;
    float _3110 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3112 = _2996 + _3110;
    int _3114 = ~int(_3084);
    int _3116 = _3114 + 1;
    float _3118 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _3120 = _2054 == 0;
    float _3122 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3124 = _2738 + _3122;
    int _3126 = _3096 ^ _3116;
    float _3128 = fma(_3112, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3118);
    float _3130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3132 = ~_3116;
    int _3134 = _3132 + _3126;
    int _3136 = _3134 + 1;
    float _3138 = fma(_3124, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3128);
    float _3140 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3142 = _3020 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _3144 = !_3120;
    int _3146 = _3144 ? _3136 : (-1);
    float _3148 = _3058 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3150 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3152 = -_3140;
    float _3154 = fma(_3142, 2.0, _3152);
    bool _3156 = _3138 >= 0.0;
    float _3158 = fma(_2922, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3150);
    float _3160 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3162 = _2920 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _3164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3166 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3168 = fma(_2926, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3160);
    float _3170 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3172 = -_3166;
    float _3174 = fma(_3162, 2.0, _3172);
    float _3176 = float(_2786);
    float _3178 = fma(_2930, -2.0, _3170);
    float _3180 = float(_2842);
    float _3182 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3184 = _3082 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3186 = -_149;
    float _3188 = fma(_3186, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3174);
    float _3190 = fma(_3148, _3176, _2448);
    float _3192 = fma(_3050, -2.0, _3182);
    float _3194 = float(_3030);
    float _3196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3198 = fma(_3184, _3180, _3188);
    float _3200 = _3130 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3202 = _2828 + 0.5;
    float _3204 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2476);
    float _3206 = float(_2944);
    float _3208 = _3164 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3210 = -_149;
    float _3212 = fma(_3210, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3154);
    float _3214 = fma(_3148, _3202, _3190);
    float _3216 = -_3204;
    float _3218 = fma(_3200, _3194, _3216);
    float _3220 = float(_3146);
    float _3222 = fma(_3208, _3206, _3212);
    float _3224 = _1072 + 0.5;
    float _3226 = float(_3034);
    float _3228 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3178);
    float _3230 = _2696 + (-0.5);
    float _3232 = _3196 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3234 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3192);
    float _3236 = fma(_3208, _3224, _3222);
    float _3238 = -_3228;
    float _3240 = fma(_3004, _3226, _3238);
    float _3242 = -_3200;
    float _3244 = fma(_3242, _3230, _3218);
    float _3246 = -_3234;
    float _3248 = fma(_3232, _3220, _3246);
    float _3250 = _1286 + (-0.5);
    float _3252 = _1058 + (-0.5);
    float _3254 = -_3004;
    float _3256 = fma(_3254, _3250, _3240);
    float _3258 = -_3232;
    float _3260 = fma(_3258, _3252, _3248);
    float _3262 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3264 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3266 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3268 = log2(_3266);
    float _3270 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3272 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3262);
    float _3274 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3264);
    float _3276 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3168);
    float _3278 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3270);
    float _3280 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3272);
    float _3282 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3274);
    float _3284 = _2780 + 0.5;
    float _3286 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3278);
    float _3288 = -_3280;
    float _3290 = _3288 + 1.0;
    float _3292 = -_3282;
    float _3294 = _3292 + 1.0;
    float _3296 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3158);
    float _3298 = _3248;
    if (_3156)
    {
        _3298 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3300 = _3298;
    float _3302 = fma(_2696, _3290, _3244);
    float _3304 = -_3294;
    float _3306 = fma(_2828, _3304, _3214);
    float _3308 = _3100 * _3100;
    float _3310 = -_3276;
    float _3312 = _3310 + 1.0;
    float _3314 = fma(_3184, _3284, _3198);
    float _3316 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3318 = fma(_3112, _3112, _3308);
    float _3320 = -_3286;
    float _3322 = _3320 + 1.0;
    float _3324 = -_3296;
    float _3326 = _3324 + 1.0;
    float _3328 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3316);
    float _3330 = fma(_3124, _3124, _3318);
    float _3332 = _3268 * _149;
    float _3334 = fma(_1286, _3312, _3256);
    float _3336 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3328);
    float _3338 = -_3322;
    float _3340 = fma(_1072, _3338, _3236);
    float _3342 = -_3326;
    float _3344 = fma(_2780, _3342, _3314);
    float _3346 = -_3336;
    float _3348 = _3346 + 1.0;
    int _3350 = as_type<int>(_3336);
    if (_3156)
    {
        float _3352 = _3300 * 5.0;
        _3350 = as_type<int>(_3352);
    }
    int _3354 = _3350;
    float _3356 = rsqrt(_3330);
    float _3358 = fma(_1058, _3348, _3260);
    float _3360 = _3078 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3362 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _3364 = !_3048;
    int _3366 = _3364 ? 0 : 1;
    float _3368 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _3370 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3372 = isnan(1.0);
    bool _3374 = _3370 || _3372;
    bool _3376 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3378 = _3374 || _3376;
    float _3380 = in.m_72.x;
    float _3382 = in.m_72.y;
    float _3384 = in.m_72.z;
    float _3386 = exp2(_3332);
    float _3388 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3390 = 1.0 + _3388;
    float _3392 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3394 = _3362 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3396 = _3368 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3398 = _974 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3400 = _3392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3402 = 1.0 / _3390;
    out.m_74.x = _3306;
    out.m_74.y = _3302;
    out.m_74.z = _3344;
    out.m_74.w = _3334;
    bool _3404 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3406 = isnan(0.0);
    bool _3408 = _3404 || _3406;
    bool _3410 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3412 = _3408 || _3410;
    float _3414 = float(_3108);
    out.m_76.x = _3394;
    out.m_76.y = _3396;
    out.m_76.z = _3400;
    out.m_76.w = _3360;
    float _3416 = -_3386;
    float _3418 = _3416 + 1.0;
    if (_3156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9996 = as_type<float>(_3354);
        out.gl_Position.z = _9996;
    }
    out.m_78.x = _3340;
    out.m_78.y = _3358;
    if (_3156)
    {
        out.m_51.x = 0.0;
    }
    float _3420 = _3398 * _3356;
    int _3422 = ~_3052;
    int _3424 = _3422 + 1;
    int _3426 = _3424 + 1;
    float _3428 = _3112 * _3420;
    float _3430 = _3100 * _3420;
    float _3432 = _3124 * _3420;
    bool _3434 = !_3040;
    int _3436 = _3434 ? 0 : 1;
    int _3438 = _3426;
    if (_3156)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3440 = -_3430;
    float _3442 = _2904 + _3440;
    float _3444 = -_3428;
    float _3446 = _2996 + _3444;
    int _3448 = abs(_3436);
    float _3450 = -_3430;
    float _3452 = _3100 + _3450;
    float _3454 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3456 = _3442 + _3454;
    float _3458 = -_3432;
    float _3460 = _2738 + _3458;
    float _3462 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3464 = _3446 + _3462;
    float _3466 = float(_3448);
    float _3468 = _3456 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3470 = -_3428;
    float _3472 = _3112 + _3470;
    float _3474 = _3452 * _3452;
    float _3476 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3478 = _3460 + _3476;
    float _3480 = fma(_3464, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3468);
    float _3482 = _3466 * _3414;
    float _3484 = fma(_3472, _3472, _3474);
    if (!_2572)
    {
        int _3486 = ~_3052;
        int _3488 = _3486 + 1;
        _3438 = _3488;
    }
    int _3490 = _3438;
    float _3492 = fma(_3478, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3480);
    float _3494 = _3482 * (-2.0);
    int _3496 = abs(_3062);
    float _3498 = _874 + (-0.5);
    float _3500 = _3412 ? _3418 : 0.0;
    float _3502 = fma(_3494, _3380, _3380);
    bool _3504 = _3492 >= 0.0;
    float _3506 = fma(_2636, _3494, _2636);
    float _3508 = float(_3490);
    float _3510 = _3508;
    if (_3378)
    {
        float _3512 = _3500 * _3402;
        _151 = _3512;
    }
    float _3514 = _151;
    float _3516 = float(_3496);
    float _3518 = fma(_3498, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3502);
    float _3520 = -_3432;
    float _3522 = _3124 + _3520;
    int _3524 = _2986 ? 0 : 1;
    float _3526 = _876 + (-0.5);
    float _3528 = _3516 * _3508;
    float _3530 = fma(_3506, _3514, _3518);
    float _3532 = fma(_3522, _3522, _3484);
    int _3534 = ~_3524;
    int _3536 = _3534 + 1;
    int _3538 = _3536 + 1;
    float _3540 = _3528 * (-2.0);
    float _3542 = _3530 * 0.15915493667125701904296875;
    int _3544 = _3538;
    if (!_2974)
    {
        int _3546 = ~_3524;
        int _3548 = _3546 + 1;
        _3544 = _3548;
    }
    int _3550 = _3544;
    if (_3504)
    {
        _3510 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3552 = _3510;
    float _3554 = fma(_2672, _3540, _2672);
    float _3556 = sqrt(_3532);
    int _3558 = as_type<int>(_3552);
    if (_3504)
    {
        out.m_51.x = 0.0;
    }
    float _3560 = fma(_3540, _3382, _3382);
    if (_3504)
    {
        float _3562 = _3552 * 5.0;
        _3558 = as_type<int>(_3562);
    }
    int _3564 = _3558;
    int _3566 = abs(_3366);
    float _3568 = _3542 * 6.283185482025146484375;
    float _3570 = sin(_3568);
    if (_3504)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10236 = as_type<float>(_3564);
        out.gl_Position.z = _10236;
    }
    if (_3504)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3572 = -_2904;
    float _3574 = _3572 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3576 = -_2996;
    float _3578 = _3576 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3580 = -_2738;
    float _3582 = _3580 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3584 = _3574 * _3574;
    float _3586 = float(_3550);
    float _3588 = fma(_3526, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3560);
    float _3590 = float(_3566);
    float _3592 = fma(_3578, _3578, _3584);
    float _3594 = _874 + _878;
    float _3596 = fma(_3554, _3514, _3588);
    float _3598 = fma(_3582, _3582, _3592);
    float _3600 = _3590 * _3586;
    float _3602 = _3594 + (-1.0);
    float _3604 = _878 + (-0.5);
    float _3606 = rsqrt(_3598);
    float _3608 = _3600 * (-2.0);
    float _3610 = fma(_3602, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3612 = _3596 * 0.15915493667125701904296875;
    float _3614 = _715 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3616 = fma(_3608, _3384, _3384);
    float _3618 = fma(_3610, _3608, _3610);
    float _3620 = _3612 * 6.283185482025146484375;
    float _3622 = sin(_3620);
    float _3624 = fma(_3604, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3616);
    float _3626 = fma(_3618, _3514, _3624);
    float _3628 = _3578 * _3606;
    float _3630 = _3582 * _3606;
    float _3632 = _3574 * _3606;
    float _3634 = _3612 * 6.283185482025146484375;
    float _3636 = cos(_3634);
    float _3638 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3640 = _3628 * _3638;
    float _3642 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3644 = _3630 * _3642;
    float _3646 = _3626 * 0.15915493667125701904296875;
    float _3648 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _213);
    float _3650 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3652 = -_3640;
    float _3654 = fma(_3630, _3650, _3652);
    float _3656 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3658 = _3632 * _3656;
    float _3660 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3662 = _3542 * 6.283185482025146484375;
    float _3664 = cos(_3662);
    float _3666 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3668 = -_3644;
    float _3670 = fma(_3632, _3666, _3668);
    float _3672 = _3654 * _3654;
    float _3674 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3676 = -_3658;
    float _3678 = fma(_3628, _3674, _3676);
    float _3680 = _3356 * _3556;
    float _3682 = fma(_3670, _3670, _3672);
    float _3684 = _3570 * _3622;
    float _3686 = _3646 * 6.283185482025146484375;
    float _3688 = cos(_3686);
    float _3690 = _974 * _3680;
    float _3692 = fma(_3678, _3678, _3682);
    float _3694 = _3680 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3696 = _3694 * 0.5;
    float _3698 = _3646 * 6.283185482025146484375;
    float _3700 = sin(_3698);
    float _3702 = _3664 * _3636;
    float _3704 = _3664 * _3622;
    float _3706 = rsqrt(_3692);
    float _3708 = _3570 * _3636;
    float _3710 = _3664 * _3688;
    float _3712 = _3636 * _3688;
    float _3714 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _3716 = _3570 * _3688;
    float _3718 = fma(_3700, _3702, _3684);
    float _3720 = _3680 * _3614;
    float _3722 = fma(_3700, _3684, _3702);
    float _3724 = _3622 * _3688;
    float _3726 = -_3704;
    float _3728 = fma(_3700, _3708, _3726);
    float _3730 = _3648 * _3720;
    float _3732 = -_3708;
    float _3734 = fma(_3700, _3704, _3732);
    float _3736 = _3714 * _3690;
    float _3738 = _3670 * _3706;
    float _3740 = _3654 * _3706;
    float _3742 = _3678 * _3706;
    float _3744 = _3710 * _3730;
    float _3746 = -_3730;
    float _3748 = _3700 * _3746;
    float _3750 = _3716 * _3730;
    float _3752 = _3630 * _3740;
    float _3754 = fma(_3718, _3736, _3744);
    float _3756 = _3632 * _3738;
    float _3758 = fma(_3712, _3736, _3748);
    float _3760 = -_3752;
    float _3762 = fma(_3632, _3742, _3760);
    float _3764 = fma(_3734, _3696, _3754);
    float _3766 = -_3756;
    float _3768 = fma(_3628, _3740, _3766);
    float _3770 = fma(_3728, _3736, _3750);
    float _3772 = fma(_3724, _3696, _3758);
    float _3774 = _3762 * _3764;
    float _3776 = _3768 * _3764;
    float _3778 = fma(_3722, _3696, _3770);
    float _3780 = _3628 * _3742;
    float _3782 = fma(_3738, _3772, _3774);
    float _3784 = fma(_3742, _3772, _3776);
    float _3786 = _3718 * _3762;
    float _3788 = -_3780;
    float _3790 = fma(_3630, _3738, _3788);
    float _3792 = fma(_3628, _3778, _3782);
    float _3794 = fma(_3630, _3778, _3784);
    float _3796 = _3718 * _3768;
    float _3798 = _3718 * _3790;
    float _3800 = _2996 + _3792;
    float _3802 = _2738 + _3794;
    float _3804 = _3710 * _3762;
    float _3806 = _3734 * _3762;
    float _3808 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3810 = _3800 + _3808;
    float _3812 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3814 = _3802 + _3812;
    float _3816 = _3734 * _3768;
    float _3818 = _3734 * _3790;
    float _3820 = _3810 * _3810;
    float _3822 = _3814 * _3814;
    float _3824 = _3710 * _3790;
    float _3826 = _3710 * _3768;
    float _3828 = _3790 * _3764;
    float _3830 = _3820 + _3822;
    float _3832 = fma(_3712, _3738, _3786);
    float _3834 = fma(_3712, _3740, _3798);
    float _3836 = fma(_3712, _3742, _3796);
    float _3838 = sqrt(_3830);
    float _3840 = fma(_3660, _3660, 1.0);
    float _3842 = fma(_3740, _3772, _3828);
    float _3844 = -_3700;
    float _3846 = fma(_3844, _3738, _3804);
    float _3848 = -_3700;
    float _3850 = fma(_3848, _3740, _3824);
    float _3852 = -_3700;
    float _3854 = fma(_3852, _3742, _3826);
    float _3856 = fma(_3632, _3778, _3842);
    float _3858 = fma(_3724, _3740, _3818);
    float _3860 = rsqrt(_3840);
    float _3862 = fma(_3724, _3738, _3806);
    float _3864 = _2904 + _3856;
    float _3866 = fma(_3724, _3742, _3816);
    bool _3868 = _3838 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3870 = _3740;
    float _3872 = _3820;
    float _3874 = _3822;
    float _3876 = _3800;
    float _3878 = _3802;
    if (!_3868)
    {
        _3870 = _3864;
    }
    float _3880 = _3870;
    bool _3882 = !_3868;
    float _3884 = _3880;
    if (!_3882)
    {
        float _3886 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3888 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3890 = _3838 + _3888;
        float _3892 = _3864 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3894 = rsqrt(_3830);
        float _3896 = _3890 * _3886;
        float _3898 = _3896 * 0.15915493667125701904296875;
        float _3900 = _3898 * 6.283185482025146484375;
        float _3902 = sin(_3900);
        float _3904 = _3898 * 6.283185482025146484375;
        float _3906 = cos(_3904);
        float _3908 = fma(_3902, _3892, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3910 = _3894 * _3908;
        float _3912 = _3906 + (-1.0);
        float _3914 = fma(_3810, _3910, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3916 = fma(_3814, _3910, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3918 = _3912 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3920 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3922 = _3914 + _3920;
        float _3924 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3926 = _3916 + _3924;
        float _3928 = fma(_3864, _3906, _3918);
        float _3930 = _3922 * _3922;
        float _3932 = _3926 * _3926;
        _3884 = _3928;
        _3872 = _3930;
        _3874 = _3932;
        _3876 = _3914;
        _3878 = _3916;
    }
    float _3934 = _3884;
    float _3936 = _3872;
    float _3938 = _3874;
    float _3940 = _3876;
    float _3942 = _3878;
    float _3944 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3946 = _3934 + _3944;
    float _3948 = fma(_3716, _3628, _3846);
    float _3950 = fma(_3716, _3632, _3850);
    float _3952 = fma(_3716, _3630, _3854);
    float _3954 = fma(_3946, _3946, _3936);
    float _3956 = fma(_3722, _3628, _3862);
    float _3958 = fma(_3722, _3632, _3858);
    float _3960 = fma(_3722, _3630, _3866);
    float _3962 = _3954 + _3938;
    float _3964 = _3660 * _3860;
    float _3966 = fma(_3728, _3628, _3832);
    float _3968 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3970 = _3660 * _3948;
    float _3972 = fma(_3728, _3632, _3834);
    float _3974 = _3660 * _3950;
    float _3976 = fma(_3728, _3630, _3836);
    float _3978 = _3660 * _3952;
    float _3980 = -_3956;
    float _3982 = _3964 * _3980;
    float _3984 = -_3958;
    float _3986 = _3964 * _3984;
    float _3988 = -_3960;
    float _3990 = _3964 * _3988;
    float _3992 = fma(_3968, _3966, _3970);
    float _3994 = sqrt(_3962);
    float _3996 = fma(_3968, _3972, _3974);
    float _3998 = fma(_3968, _3976, _3978);
    float _4000 = fma(_3860, _3948, _3982);
    float _4002 = fma(_3860, _3950, _3986);
    float _4004 = _3958 + _3996;
    float _4006 = fma(_3860, _3952, _3990);
    float _4008 = _3956 + _3992;
    float _4010 = _3960 + _3998;
    out.m_80.x = _3966;
    out.m_80.y = _3972;
    out.m_80.z = _3976;
    out.m_82.x = _4000;
    out.m_82.y = _4002;
    out.m_82.z = _4006;
    bool _4012 = _3994 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4014 = isnan(_3994);
    bool _4016 = _4012 || _4014;
    bool _4018 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4020 = _4016 || _4018;
    out.m_84.x = _4008;
    out.m_84.y = _4004;
    out.m_84.z = _4010;
    float _4022 = _3998;
    float _4024 = _4006;
    float _4026 = _4000;
    if (!_4020)
    {
        _4022 = 1.0;
    }
    float _4028 = _4022;
    bool _4030 = !_4020;
    float _4032 = _4028;
    if (!_4030)
    {
        bool _4034 = _3994 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4036 = isnan(_3994);
        bool _4038 = _4034 || _4036;
        bool _4040 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4042 = _4038 || _4040;
        if (!_4042)
        {
            float _4044 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4046 = _3994 + _4044;
            float _4048 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4050 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4048;
            float _4052 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4054 = _4052 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4056 = 1.0 / _4050;
            float _4058 = _4046 * _4056;
            float _4060 = fma(_4058, _4054, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4032 = _4060;
            _4062 = true;
        }
        else
        {
            bool _4064 = _3994 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4066 = isnan(_3994);
            bool _4068 = _4064 || _4066;
            bool _4070 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4072 = _4068 || _4070;
            if (!_4072)
            {
                float _4074 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4076 = _3994 + _4074;
                float _4078 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4080 = _4078 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4082 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4084 = _4082 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4086 = 1.0 / _4080;
                float _4088 = _4076 * _4086;
                float _4090 = fma(_4088, _4084, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4032 = _4090;
                _4062 = true;
            }
            else
            {
                _4032 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4062 = false;
    float _4092 = _4032;
    float _4094 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4096 = _3934 + _4094;
    float _4098 = _3442 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4100 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4102 = _3940 + _4100;
    float _4104 = fma(_4096, _4092, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4106 = fma(_3446, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4098);
    float _4108 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4110 = _3942 + _4108;
    float _4112 = fma(_4102, _4092, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4114 = -_2904;
    float _4116 = _4114 + _4104;
    float _4118 = fma(_3460, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4106);
    float _4120 = fma(_4110, _4092, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4122 = -_2996;
    float _4124 = _4122 + _4112;
    float _4126 = _4116 * _4116;
    float _4128 = _4118 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4130 = _3442 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4132 = -_2738;
    float _4134 = _4132 + _4120;
    float _4136 = fma(_4124, _4124, _4126);
    float _4138 = 1.0 / _4128;
    float _4140 = fma(_3446, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4130);
    float _4142 = fma(_4134, _4134, _4136);
    float _4144 = fma(_3460, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4140);
    float _4146 = sqrt(_4142);
    float _4148 = _4144 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4150 = _4148 + _4128;
    float _4152 = _4150 * _4138;
    float _4154 = _4152 * 0.5;
    float _4156 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4158 = fma(_4154, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4156);
    bool _4160 = _4146 > 0.0;
    float _4162 = 1.0 / _4158;
    bool _4164 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4166 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4168 = _4164 || _4166;
    bool _4170 = isnan(0.5);
    bool _4172 = _4168 || _4170;
    bool _4174 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4176 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4178 = _4174 || _4176;
    bool _4180 = isnan(0.5);
    bool _4182 = _4178 || _4180;
    float _4184 = _4128;
    float _4186 = _4138;
    float _4188 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (!_4160)
    {
        _4024 = _4112;
    }
    float _4190 = _4024;
    float _4192 = _4190;
    float _4194 = _4190;
    if (!_4160)
    {
        _4184 = _4104;
    }
    float _4196 = _4184;
    float _4198 = _4196;
    float _4200 = _4196;
    if (!_4160)
    {
        _4026 = _4120;
    }
    float _4202 = _4026;
    bool _4204 = !_4160;
    float _4206 = _4202;
    float _4208 = _4202;
    float _4210 = _4162;
    if (!_4204)
    {
        float _4212 = _229 * _229;
        float _4214 = fma(_225, _225, _4212);
        float _4216 = fma(_231, _231, _4214);
        float _4218 = rsqrt(_4142);
        float _4220 = sqrt(_4216);
        float _4222 = _4124 * _4218;
        float _4224 = _4116 * _4218;
        float _4226 = _4134 * _4218;
        bool _4228 = _4220 > 0.0;
        _4188 = _4218;
        if (!_4228)
        {
            _4192 = _4112;
        }
        float _4230 = _4192;
        _4194 = _4230;
        if (!_4228)
        {
            _4198 = _4104;
        }
        float _4232 = _4198;
        _4200 = _4232;
        if (!_4228)
        {
            _4206 = _4120;
        }
        float _4234 = _4206;
        bool _4236 = !_4228;
        _4208 = _4234;
        if (!_4236)
        {
            float _4238 = rsqrt(_4216);
            float _4240 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4242 = _229 * _4238;
            float _4244 = _225 * _4238;
            float _4246 = _231 * _4238;
            float _4248 = _4224 * _4242;
            float _4250 = fma(_4222, _4244, _4248);
            float _4252 = _4240 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4254 = fma(_4226, _4246, _4250);
            float _4256 = _4254 * _4252;
            float _4258 = fma(_225, _4256, _4112);
            float _4260 = fma(_229, _4256, _4104);
            float _4262 = fma(_231, _4256, _4120);
            _4208 = _4262;
            _4194 = _4258;
            _4200 = _4260;
            _4186 = _4252;
            _4188 = _4256;
        }
    }
    float _4264 = _4208;
    float _4266 = _4194;
    float _4268 = _4200;
    float _4270 = _4186;
    float _4272 = _4188;
    float _4274 = -_3432;
    float _4276 = _4274 + _4264;
    float _4278 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4280 = _4162 * _4278;
    float _4282 = -_3428;
    float _4284 = _4282 + _4266;
    float _4286 = -_3430;
    float _4288 = _4286 + _4268;
    float _4290 = _4272;
    float _4292 = _4288;
    float _4294 = _4284;
    float _4296 = _4270;
    if (_4172)
    {
        _4290 = 1.0;
    }
    float _4298 = _4290;
    float _4300 = _4298;
    if (_4182)
    {
        _4210 = _4276;
    }
    float _4302 = _4210;
    float _4304 = _4302;
    if (!_4182)
    {
        float _4306 = _3456 * _3456;
        float _4308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4310 = -_2738;
        float _4312 = _4310 + _4264;
        float _4314 = fma(_3464, _3464, _4306);
        float _4316 = fma(_3478, _3478, _4314);
        float _4318 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4320 = sqrt(_4316);
        float _4322 = 1.0 / _3680;
        float _4324 = _4318 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4326 = precise::min(_4320, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4328 = _4326 * _4308;
        float _4330 = _4328 * _4322;
        float _4332 = -_2904;
        float _4334 = _4332 + _4268;
        float _4336 = -_2996;
        float _4338 = _4336 + _4266;
        float _4340 = _4324 * _4330;
        float _4342 = _4312 * _4330;
        float _4344 = fma(_4334, _4340, _3442);
        float _4346 = fma(_4338, _4340, _3446);
        float _4348 = fma(_4324, _4342, _3460);
        _4292 = _4344;
        _4294 = _4346;
        _4304 = _4348;
        _235 = _4340;
    }
    float _4350 = _4292;
    float _4352 = _4294;
    float _4354 = _4304;
    float _4356 = _235;
    float _4358 = _4356;
    if (!_4172)
    {
        float _4360 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4362 = _4360 * 0.15915493667125701904296875;
        float _4364 = _4362 * 6.283185482025146484375;
        float _4366 = cos(_4364);
        float _4368 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4370 = _4368 * 0.15915493667125701904296875;
        float _4372 = _4362 * 6.283185482025146484375;
        float _4374 = sin(_4372);
        float _4376 = 1.0 / _4366;
        float _4378 = _4370 * 6.283185482025146484375;
        float _4380 = cos(_4378);
        float _4382 = _4374 * _4376;
        float _4384 = _4370 * 6.283185482025146484375;
        float _4386 = sin(_4384);
        float _4388 = _4380 * _4382;
        float _4390 = 1.0 / _4388;
        float _4392 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4394 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4392;
        float _4396 = 1.0 / _4394;
        float _4398 = _4386 * _4390;
        float _4400 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4402 = fma(_4280, _4398, _4400);
        float _4404 = _4402 * _4396;
        float _4406 = precise::clamp(_4404, 0.0, 1.0);
        _4358 = _4396;
        _4300 = _4406;
    }
    float _4408 = _4358;
    float _4410 = _4300;
    float _4412 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4414 = _4350 + _4412;
    float _4416 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4418 = _4352 + _4416;
    float _4420 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4422 = _4354 + _4420;
    float _4424 = _4414 * _4414;
    float _4426 = fma(_4418, _4418, _4424);
    float _4428 = fma(_4422, _4422, _4426);
    float _4430 = rsqrt(_4428);
    float _4432 = _4430 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4434 = _4418 * _4432;
    float _4436 = _4422 * _4432;
    float _4438 = _4434 * _4434;
    float _4440 = _4436 * _4436;
    float _4442 = _4438 + _4440;
    float _4444 = sqrt(_4442);
    bool _4446 = _4444 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4448 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4450 = _4444 + _4448;
    float _4452 = _4430;
    float _4454 = _4408;
    float _4456 = _4450;
    float _4458 = _4414;
    float _4460 = _4442;
    if (_4446)
    {
        float _4462 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4452 = _4462;
    }
    float _4464 = _4452;
    if (_4446)
    {
        float _4466 = rsqrt(_4442);
        _4454 = _4466;
    }
    float _4468 = _4454;
    float _4470 = _4468;
    if (_4446)
    {
        float _4472 = _4450 * _4464;
        _4456 = _4472;
    }
    float _4474 = _4456;
    if (_4446)
    {
        float _4476 = _4474 * 0.15915493667125701904296875;
        _4296 = _4476;
    }
    float _4478 = _4296;
    float _4480 = _4422;
    float _4482 = _4478;
    if (_4446)
    {
        float _4484 = _4478 * 6.283185482025146484375;
        float _4486 = sin(_4484);
        _4480 = _4486;
    }
    float _4488 = _4480;
    float _4490 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4492 = precise::max(0.0, _4490);
    float _4494 = _4464;
    if (_4446)
    {
        float _4496 = _4478 * 6.283185482025146484375;
        float _4498 = cos(_4496);
        _4494 = _4498;
    }
    float _4500 = _4494;
    float _4502 = -_4432;
    float _4504 = -_4492;
    float _4506 = fma(_4414, _4502, _4504);
    if (_4446)
    {
        float _4508 = _4506 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4458 = _4508;
    }
    float _4510 = _4458;
    float _4512 = _4510;
    if (!_4446)
    {
        _4482 = _4434;
    }
    float _4514 = _4482;
    float _4516 = fma(_3446, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4518 = _4488;
    float _4520 = _4514;
    if (_4446)
    {
        float _4522 = fma(_4488, _4510, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3000 = _4522;
    }
    float _4524 = _3000;
    float _4526 = sqrt(_4428);
    float _4528 = _4524;
    if (!_4446)
    {
        _4518 = _4436;
    }
    float _4530 = _4518;
    float _4532 = _4530;
    float _4534 = _4500;
    if (_4446)
    {
        float _4536 = _4500 + (-1.0);
        _4512 = _4536;
    }
    float _4538 = _4512;
    float _4540 = _4538;
    if (_4446)
    {
        float _4542 = _4468 * _4524;
        _4528 = _4542;
    }
    float _4544 = _4528;
    if (!_4446)
    {
        _4470 = _4506;
    }
    float _4546 = _4470;
    float _4548 = _4546;
    if (_4446)
    {
        float _4550 = _4538 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4460 = _4550;
    }
    float _4552 = _4460;
    if (_4446)
    {
        float _4554 = _4434 * _4544;
        _4520 = _4554;
    }
    float _4556 = _4520;
    if (!_4446)
    {
        _4540 = _4438;
    }
    float _4558 = _4540;
    float _4560 = _4558;
    if (_4446)
    {
        float _4562 = _4436 * _4544;
        _4532 = _4562;
    }
    float _4564 = _4532;
    if (_4446)
    {
        float _4566 = fma(_4506, _4500, _4552);
        _4548 = _4566;
    }
    float _4568 = _4548;
    if (_4446)
    {
        float _4570 = _4556 * _4556;
        _4560 = _4570;
    }
    float _4572 = _4560;
    float _4574 = _4350 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_4446)
    {
        _4534 = _4440;
    }
    float _4576 = _4534;
    float _4578 = _4576;
    if (_4446)
    {
        float _4580 = _4564 * _4564;
        _4578 = _4580;
    }
    float _4582 = _4578;
    float _4584 = fma(_4568, _4568, _4572);
    float _4586 = fma(_4352, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4574);
    float _4588 = _4350 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4590 = _4584 + _4582;
    float _4592 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4594 = fma(_4526, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4592);
    float _4596 = precise::clamp(_4594, 0.0, 1.0);
    float _4598 = fma(_4354, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4586);
    float _4600 = rsqrt(_4590);
    float _4602 = -_4596;
    float _4604 = _4602 + 1.0;
    float _4606 = _4598 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4608 = fma(_4352, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4588);
    float _4610 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4612 = fma(_3460, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4614 = _4606 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4616 = abs(_4604);
    float _4618 = log2(_4616);
    float _4620 = _4350 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4622 = -_4614;
    float _4624 = fma(_4622, _4610, 1.0);
    float _4626 = _4350 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4628 = fma(_4352, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4620);
    float _4630 = fma(_4352, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4626);
    float _4632 = _4600 * _4556;
    float _4634 = fma(_4354, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4628);
    float _4636 = _4600 * _4568;
    float _4638 = fma(_4354, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4630);
    float _4640 = _4600 * _4564;
    float _4642 = _4634 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4644 = _4632 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4646 = _4638 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4648 = floor(_4516);
    float _4650 = _4642 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4652 = -_4644;
    float _4654 = fma(_4636, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4652);
    float _4656 = fma(_4354, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4608);
    float _4658 = _4618 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4660 = fma(_4646, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4650);
    float _4662 = -_4640;
    float _4664 = fma(_4662, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4654);
    float _4666 = _4656 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4668 = floor(_4612);
    float _4670 = fma(_4664, -0.5, 0.5);
    float _4672 = fma(_4664, 0.5, 0.5);
    float _4674 = _4642 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4676 = log2(_4624);
    float _4678 = fma(_4646, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4674);
    float _4680 = -_4648;
    float _4682 = _4516 + _4680;
    float _4684 = exp2(_4658);
    float _4686 = fma(_4606, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4660);
    float _4688 = _4642 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4690 = -_4668;
    float _4692 = _4612 + _4690;
    float _4694 = fma(_4672, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4696 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4686);
    float _4698 = fma(_4646, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4688);
    float _4700 = fma(_4606, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4678);
    float _4702 = sqrt(_4670);
    float _4704 = fma(_4672, _4694, -0.212114393711090087890625);
    float _4706 = fma(_4606, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4698);
    float _4708 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4700);
    float _4710 = _4676 * 0.693147182464599609375;
    float _4712 = fma(_4672, _4704, 1.570728778839111328125);
    float _4714 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4706);
    float _4716 = 1.0 / _4696;
    float _4718 = _4636 + 1.0;
    float2 _12080 = float2(_4682, _4692);
    float _4720 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12080, float2(0.0), isnan(_12080)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12080, float2(0.0), isnan(_12080)), level(0.0)).x;
    float _4722 = -_4636;
    float _4724 = fma(_4684, _4718, _4722);
    float _4726 = _4702 * 0.636619746685028076171875;
    float _4728 = fma(_4724, 0.5, 0.5);
    float _4730 = -_4712;
    float _4732 = fma(_4726, _4730, 1.0);
    float _4734 = _4710 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4736 = _4714 * _4716;
    float _4738 = _4708 * _4716;
    float _4740 = fma(_4736, 0.5, 0.5);
    float _4742 = fma(_4738, -0.5, 0.5);
    float3 _12121 = float3(_4740, _4742, _4734);
    float _4744 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12121, float3(0.0), isnan(_12121)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12121, float3(0.0), isnan(_12121)), level(0.0)).x;
    float3 _12132 = float3(_4740, _4742, _4734);
    float4 _4747 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12132, float3(0.0), isnan(_12132)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12132, float3(0.0), isnan(_12132)), level(0.0)).xyzw;
    float _4749 = _4747.x;
    float _4751 = _4747.y;
    float _4753 = _4747.z;
    float _4755 = _4747.w;
    float2 _12148 = float2(_4732, _4728);
    float3 _4759 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12148, float2(0.0), isnan(_12148)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12148, float2(0.0), isnan(_12148)), level(0.0)).xyz;
    float _4761 = _4759.x;
    float _4763 = _4759.y;
    float _4765 = _4759.z;
    float _4767 = abs(_4280);
    float _4769 = log2(_4767);
    float _4771 = _4642 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _4773 = _4526 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4775 = isnan(_4526);
    bool _4777 = _4773 || _4775;
    bool _4779 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4781 = _4777 || _4779;
    float _4783 = fma(_4646, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4771);
    bool _4785 = _4280 <= 8000.0;
    bool _4787 = isnan(_4280);
    bool _4789 = _4785 || _4787;
    bool _4791 = isnan(8000.0);
    bool _4793 = _4789 || _4791;
    float _4795 = float(_4793);
    float _4797 = _4769 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4799 = exp2(_4797);
    float _4801 = fma(_4799, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4803 = precise::clamp(_4801, 0.0, 1.0);
    float _4805 = fma(_4803, -2.0, 3.0);
    float _4807 = _4803 * _4803;
    float _4809 = _4807 * _4805;
    float _4811 = _4618 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4813 = fma(_4606, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4783);
    float _4815 = in.m_86.x;
    float _4817 = -_4809;
    float _4819 = _4817 + 1.0;
    float _4821 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4813);
    float _4823 = exp2(_4811);
    float _4825 = fma(_4819, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4809);
    float _4827 = _4821 + _4696;
    out.gl_Position.x = _4714;
    out.gl_Position.y = _4708;
    out.gl_Position.z = _4821;
    out.gl_Position.w = _4696;
    float _4829 = _4795 * _4825;
    float _4831 = _4827 * 0.5;
    float _4833 = _4410 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4835 = _4829 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_88.z = _4831;
    out.m_88.w = _4696;
    float _4837 = -_4823;
    float _4839 = _4837 + 1.0;
    float _4841 = _4696;
    float _4843 = _4821;
    float _4845 = _4708;
    if (!_4781)
    {
        _4841 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4847 = _4841;
    float _4849 = _4839 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4851 = _4847;
    float _4853 = _4847;
    if (!_4781)
    {
        _4843 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4855 = _4843;
    float _4857 = _4855;
    float _4859 = _4855;
    if (!_4781)
    {
        _4845 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4861 = _4845;
    float _4863 = -_4849;
    float _4865 = _4863 + 1.0;
    float _4867 = -_4720;
    float _4869 = _4867 + 1.0;
    float _4871 = _4869 * _4835;
    float _4873 = precise::clamp(_4871, 0.0, 1.0);
    float _4875 = -_4873;
    float _4877 = fma(_4875, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4879 = _4877 * _4815;
    float _4881 = _4879 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_90.x = _4881;
    float _4883 = _4849 * _4744;
    float _4885 = _4755 * _4865;
    float _4887 = _4865;
    float _4889 = _4749;
    float _4891 = _4861;
    float _4893 = _4861;
    if (!_4781)
    {
        _4887 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4895 = _4887;
    float _4897 = _4755 * _4883;
    float _4899 = _4765 * _4883;
    float _4901 = fma(_4761, _4897, _4749);
    float _4903 = fma(_4763, _4897, _4751);
    float _4905 = fma(_4755, _4899, _4753);
    float _4907 = _4897;
    float _4909 = _4895;
    float _4911 = _4895;
    if (!_4781)
    {
        _4889 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4913 = _4889;
    float _4915 = _4913;
    float _4917 = _4913;
    if (!_4781)
    {
        _4907 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4919 = _4907;
    out.m_92.x = _4901;
    out.m_92.y = _4903;
    out.m_92.z = _4905;
    out.m_92.w = _4885;
    bool _4921 = !_4781;
    float _4923 = _4919;
    float _4925 = _4919;
    if (!_4921)
    {
        bool _4927 = _4526 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4929 = isnan(_4526);
        bool _4931 = _4927 || _4929;
        bool _4933 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4935 = _4931 || _4933;
        if (!_4935)
        {
            float _4937 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4939 = _4526 + _4937;
            float _4941 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4943 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4941;
            float _4945 = 1.0 / _4943;
            float _4947 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4949 = _4947 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4951 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4953 = _4951 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4955 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4957 = _4955 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4959 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4961 = _4959 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4963 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4965 = _4963 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4967 = _4939 * _4945;
            float _4969 = precise::clamp(_4967, 0.0, 1.0);
            float _4971 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4973 = _4971 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4975 = fma(_4969, _4949, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4977 = fma(_4969, _4973, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4979 = fma(_4969, _4953, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4981 = fma(_4969, _4957, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4983 = fma(_4969, _4961, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4985 = fma(_4969, _4965, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4853 = _4977;
            _4911 = _4983;
            _4917 = _4975;
            _4893 = _4981;
            _4859 = _4979;
            _4925 = _4985;
            _4987 = true;
        }
        else
        {
            bool _4989 = _4526 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4991 = isnan(_4526);
            bool _4993 = _4989 || _4991;
            bool _4995 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4997 = _4993 || _4995;
            if (!_4997)
            {
                _4915 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4999 = _4915;
            _4917 = _4999;
            if (!_4997)
            {
                _4851 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5001 = _4851;
            _4853 = _5001;
            if (!_4997)
            {
                _4857 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5003 = _4857;
            _4859 = _5003;
            if (!_4997)
            {
                _4891 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5005 = _4891;
            _4893 = _5005;
            if (!_4997)
            {
                _4909 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5007 = _4909;
            _4911 = _5007;
            if (!_4997)
            {
                _4923 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5009 = _4923;
            bool _5011 = !_4997;
            _4925 = _5009;
            if (!_5011)
            {
                bool _5013 = _4526 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5015 = isnan(_4526);
                bool _5017 = _5013 || _5015;
                bool _5019 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5021 = _5017 || _5019;
                if (!_5021)
                {
                    float _5023 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5025 = _4526 + _5023;
                    float _5027 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5029 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5027;
                    float _5031 = 1.0 / _5029;
                    float _5033 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5035 = _5033 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5037 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5039 = _5037 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5041 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5043 = _5041 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5045 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5047 = _5045 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5049 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5051 = _5049 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5053 = _5025 * _5031;
                    float _5055 = precise::clamp(_5053, 0.0, 1.0);
                    float _5057 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5059 = _5057 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5061 = fma(_5055, _5035, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5063 = fma(_5055, _5059, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5065 = fma(_5055, _5039, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5067 = fma(_5055, _5043, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5069 = fma(_5055, _5047, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5071 = fma(_5055, _5051, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4853 = _5063;
                    _4911 = _5069;
                    _4917 = _5061;
                    _4893 = _5067;
                    _4859 = _5065;
                    _4925 = _5071;
                    _4987 = true;
                }
                else
                {
                    _4853 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4911 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4917 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4893 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4859 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4925 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4987 = false;
    float _5073 = _4853;
    float _5075 = _4911;
    float _5077 = _4917;
    float _5079 = _4893;
    float _5081 = _4859;
    float _5083 = _4925;
    float _5085 = fma(_4004, -0.5, 0.5);
    float _5087 = precise::clamp(_5085, 0.0, 1.0);
    float _5089 = -_5073;
    float _5091 = _5089 + _5075;
    float _5093 = _4833 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5095 = -_5077;
    float _5097 = _5095 + _5079;
    out.m_94.x = 0.0;
    float _5099 = fma(_5087, _5091, _5073);
    float _5101 = fma(_5087, _5097, _5077);
    out.m_51.x = _5093;
    float _5103 = -_5081;
    float _5105 = _5103 + _5083;
    float _5107 = _5099 * 0.586610972881317138671875;
    bool _5109 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5111 = fma(_5087, _5105, _5081);
    float _5113 = fma(_5101, 0.298911988735198974609375, _5107);
    bool _5115 = _4410 > 0.0;
    bool _5117 = isnan(_4410);
    bool _5119 = _5115 || _5117;
    bool _5121 = isnan(0.0);
    bool _5123 = _5119 || _5121;
    float _5125 = fma(_5111, 0.114477999508380889892578125, _5113);
    float _5127 = -_5125;
    float _5129 = _5101 + _5127;
    float _5131 = -_5125;
    float _5133 = _5099 + _5131;
    float _5135 = -_5125;
    float _5137 = _5111 + _5135;
    float _5139 = fma(_5129, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5125);
    float _5141 = fma(_5133, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5125);
    float _5143 = fma(_5137, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5125);
    bool _5145 = !_5109;
    if (!_5145)
    {
        float _5147 = -_4350;
        float _5149 = _5147 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5151 = -_4352;
        float _5153 = _5151 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5155 = -_4354;
        float _5157 = _5155 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5159 = _5149 * _5149;
        float _5161 = fma(_5153, _5153, _5159);
        float _5163 = fma(_5157, _5157, _5161);
        float _5165 = sqrt(_5163);
        float _5167 = rsqrt(_5163);
        float _5169 = -_5165;
        float _5171 = _5169 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5173 = _5171 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5175 = precise::clamp(_5173, 0.0, 1.0);
        float _5177 = _5153 * _5167;
        float _5179 = _5149 * _5167;
        float _5181 = abs(_5175);
        float _5183 = log2(_5181);
        float _5185 = _5157 * _5167;
        float _5187 = _5177 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5189 = _4004 * _5179;
        float _5191 = -_5179;
        float _5193 = -_5187;
        float _5195 = fma(_5191, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5193);
        float _5197 = fma(_4008, _5177, _5189);
        float _5199 = -_5185;
        float _5201 = fma(_5199, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5195);
        float _5203 = fma(_4010, _5185, _5197);
        float _5205 = precise::clamp(_5203, 0.0, 1.0);
        float _5207 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5209 = _5201 + _5207;
        float _5211 = _5183 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5213 = _5209 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5215 = precise::clamp(_5213, 0.0, 1.0);
        float _5217 = exp2(_5211);
        float _5219 = _5217 * _5215;
        float _5221 = _5205 * _5219;
        float _5223 = _5221 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5225 = _5221 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5227 = _5221 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _5223;
        out.m_94.y = _5225;
        out.m_94.z = _5227;
    }
    out.m_96.x = _5139;
    out.m_96.y = _5141;
    out.m_96.z = _5143;
    if (_5123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _5229 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5229;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4987 = false;
    bool _4062 = false;
    bool _751 = false;
    bool _639 = false;
    bool _255 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_48.w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    float _125 = _123;
    if (!_119)
    {
        out.m_51.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _123 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5286 = as_type<float>(_131);
        out.gl_Position.z = _5286;
    }
    if (!_119)
    {
        return out;
    }
    float _135 = in.m_53.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = _149;
    if (_145)
    {
        float _153 = float(_115);
        _125 = _153;
    }
    float _155 = _125;
    bool _157 = _149 >= _155;
    bool _159 = !_145;
    bool _161 = _157 || _159;
    float _163 = _155;
    if (_161)
    {
        _163 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _163;
    if (_161)
    {
        out.m_51.x = 0.0;
    }
    if (_161)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5356 = as_type<float>(_169);
        out.gl_Position.z = _5356;
    }
    if (_161)
    {
        return out;
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = in.m_58.x;
    float _175 = in.m_58.y;
    float _177 = in.m_58.z;
    float _179 = in.m_60.x;
    float _181 = in.m_60.y;
    float _183 = in.m_60.z;
    float _185 = in.m_62.x;
    float _187 = in.m_62.y;
    float _189 = in.m_62.z;
    float _191 = in.m_64.x;
    float _193 = in.m_64.y;
    float _195 = in.m_64.z;
    int _197 = as_type<int>(_171) & 1;
    bool _199 = _197 != 0;
    int _201 = as_type<int>(_171) & 2;
    bool _203 = _201 != 0;
    bool _205 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _207 = !_199;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_203;
    float _213 = _211 ? (-0.5) : 0.5;
    float _215 = _175 * _181;
    float _217 = _175 * _187;
    float _219 = fma(_173, _179, _215);
    float _221 = _175 * _193;
    float _223 = fma(_173, _185, _217);
    float _225 = fma(_177, _183, _219);
    float _227 = fma(_173, _191, _221);
    float _229 = fma(_177, _189, _223);
    float _231 = fma(_177, _195, _227);
    bool _233 = !_205;
    float _235 = _229;
    float _253;
    if (!_233)
    {
        float _237 = in.m_66.x;
        float _239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _241 = _237 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _245 = _243 * _239;
        float _247 = floor(_245);
        float _249 = -_247;
        float _251 = _245 + _249;
        _253 = _251;
        _255 = true;
    }
    else
    {
        float _257 = float(_115);
        float _259 = 1.0 / _257;
        float _261 = _149 * _259;
        _253 = _261;
    }
    _255 = false;
    float _263 = _253;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _267 = _263 + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _275 = _273 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _277;
    float _281 = 1.0 / _271;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _289 = _287 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _293 = _291 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _295 = 1.0 / _275;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _299 = _263 + _297;
    bool _301 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _303 = isnan(_263);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = 1.0 / _279;
    float _315 = _299 * _281;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = _263 + _317;
    bool _321 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _323 = isnan(_263);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    bool _333 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _335 = isnan(_263);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = 1.0 / _285;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _347;
    float _351 = _267 * _295;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _355 = _263 + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _359 = _263 + _357;
    bool _361 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _363 = 1.0 / _349;
    float _365 = _319 * _313;
    float _367 = -_331;
    float _369 = _367 + 1.0;
    bool _371 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _373 = isnan(_263);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = _343 * _369;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _385;
    float _389 = 1.0 / _289;
    float _391 = _355 * _345;
    float _393 = -_343;
    float _395 = _393 + 1.0;
    bool _397 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _399 = isnan(_263);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = fma(_387, _315, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _411 = 1.0 / _293;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _415 = _263 + _413;
    float _417 = _415 * _363;
    float _419 = _381 * _395;
    float _421 = -_381;
    float _423 = _421 + 1.0;
    float _425 = _359 * _389;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _429 = _263 + _427;
    bool _431 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _433 = isnan(_263);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = _407 * _423;
    float _445 = -_407;
    float _447 = _445 + 1.0;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _449;
    float _453 = _429 * _411;
    float _455 = _441 * _447;
    float _457 = -_441;
    float _459 = _457 + 1.0;
    bool _461 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _463 = isnan(_263);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = fma(_451, _315, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _475 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _477 = isnan(_263);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = _311 * _459;
    float _489 = -_311;
    float _491 = _489 + 1.0;
    float _493 = -_471;
    float _495 = _493 + 1.0;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _501;
    float _505 = _471 * _491;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _507;
    float _511 = _485 * _495;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _515 = _513 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _517 = fma(_503, _365, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _519 = fma(_509, _365, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _521 = _409 * _511;
    float _523 = -_485;
    float _525 = _523 + 1.0;
    float _527 = _473 * _511;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _533 = fma(_499, _351, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _535 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[143].x, _521);
    float _537 = fma(_515, _351, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _543 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[143].y, _527);
    float _545 = fma(_531, _425, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _547 = fma(_541, _425, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _549 = fma(_533, _505, _535);
    float _551 = fma(_537, _505, _543);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _553;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _557;
    float _561 = fma(_519, _487, _549);
    float _563 = fma(_517, _487, _551);
    float _565 = fma(_555, _391, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _567 = fma(_559, _391, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _577 = fma(_545, _455, _561);
    float _579 = fma(_547, _455, _563);
    float _581 = fma(_571, _453, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _583 = fma(_575, _453, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _585;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _589;
    float _593 = fma(_565, _443, _577);
    float _595 = fma(_567, _443, _579);
    float _597 = fma(_587, _417, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _599 = fma(_591, _417, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _601 = fma(_581, _419, _593);
    float _603 = fma(_583, _419, _595);
    float _605 = fma(_597, _383, _601);
    float _607 = fma(_599, _383, _603);
    float _609 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[150].x, _605);
    float _611 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[150].y, _607);
    bool _613 = !_361;
    int _615 = as_type<int>(_521);
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _637;
    if (!_613)
    {
        float _621 = in.m_66.x;
        float _623 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _625 = _621 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _627 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _629 = _627 * _623;
        float _631 = floor(_629);
        float _633 = -_631;
        float _635 = _629 + _633;
        _637 = _635;
        _639 = true;
    }
    else
    {
        float _641 = float(_115);
        float _643 = 1.0 / _641;
        float _645 = _149 * _643;
        _637 = _645;
    }
    _639 = false;
    float _647 = _637;
    float _649 = in.m_68.x;
    float _651 = in.m_68.y;
    bool _653 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _655 = isnan(_647);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _669 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _671 = isnan(_647);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _681;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _687 = _647 + _685;
    float _689 = -_663;
    float _691 = _689 + 1.0;
    float _693 = 1.0 / _667;
    float _695 = _679 * _691;
    float _697 = -_679;
    float _699 = _697 + 1.0;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _705 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _709 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _707 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _715 = _611 * _651;
    float _717 = _609 * _649;
    float _719 = _683 * _693;
    float _721 = fma(_719, _687, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _723 = _721 * _695;
    float _725 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[115].x, _723);
    float _727 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[116].x, _725);
    float _729 = _727 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_70.x = _709;
    out.m_70.y = _713;
    out.m_70.z = _711;
    out.m_70.w = _729;
    bool _731 = !_705;
    float _749;
    if (!_731)
    {
        float _733 = in.m_66.x;
        float _735 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _737 = _733 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _739 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[11].w, _149);
        float _741 = _739 * _735;
        float _743 = floor(_741);
        float _745 = -_743;
        float _747 = _741 + _745;
        _749 = _747;
        _751 = true;
    }
    else
    {
        float _753 = float(_115);
        float _755 = 1.0 / _753;
        float _757 = _149 * _755;
        _749 = _757;
    }
    _751 = false;
    float _759 = _749;
    float _761 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _763 = int(_761);
    float _765 = float(_115);
    float _767 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _769 = int(_767);
    float _771 = float(_763);
    float _773 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _775 = int(_773);
    float _777 = float(uint(_769));
    float _779 = 1.0 / _771;
    float _781 = float(_769);
    int _783 = ~_769;
    int _785 = _783 + 1;
    float _787 = 1.0 / _777;
    float _789 = float(_775);
    float _791 = _779 * _149;
    float _793 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _795 = int(_793);
    int _797 = as_type<int>(_787) + (-2);
    float _799 = trunc(_791);
    int _801 = int(_799);
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _805 = _803 != 0;
    float _807 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _809 = int(_807);
    float _811 = float(_795);
    float _813 = float(uint(_801));
    float _815 = 1.0 / _765;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _819 = _815;
    if (_805)
    {
        float _821 = in.m_66.x;
        _817 = _821;
    }
    float _823 = _817;
    if (_805)
    {
        _615 = 0;
    }
    int _825 = _615;
    float _827 = as_type<float>(_797) * _813;
    int _829 = _825;
    if (_805)
    {
        _617 = 0;
    }
    int _831 = _617;
    float _833 = float(uint(_809));
    float _835 = trunc(_827);
    float _837 = precise::max(_835, 0.0);
    uint _840 = uint(_837);
    float _842 = 1.0 / _789;
    float _844 = 1.0 / _811;
    float _846 = _823;
    int _848 = _831;
    if (_805)
    {
        _619 = _823;
    }
    float _850 = _619;
    float _852 = 1.0 / _833;
    int _854 = ~_769;
    int _856 = _854 + 1;
    float _858 = _842 * _149;
    int _860 = _856 * int(_840);
    int _862 = _860 + _801;
    float _864 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _866 = int(_864);
    float _868 = _815 * _149;
    float _870 = _844 * _149;
    float _872 = float(uint(_862));
    float _874 = in.m_66.x;
    float _876 = in.m_66.y;
    float _878 = in.m_66.z;
    float _880 = in.m_66.w;
    float _882 = _781 * _868;
    float _884 = _872;
    float _886 = _850;
    if (_805)
    {
        _819 = 1.0;
    }
    float _888 = _819;
    float _890 = as_type<float>(_797) * _872;
    float _892 = trunc(_858);
    int _894 = int(_892);
    float _896 = _888;
    if (_805)
    {
        _884 = 1.0;
    }
    float _898 = _884;
    float _900 = float(uint(_866));
    float _902 = trunc(_882);
    int _904 = int(_902);
    float _906 = trunc(_870);
    int _908 = int(_906);
    float _910 = trunc(_890);
    float _912 = precise::max(_910, 0.0);
    uint _914 = uint(_912);
    float _916 = 1.0 / _900;
    float _918 = _900;
    float _920 = _898;
    if (_805)
    {
        _918 = 1.0;
    }
    float _922 = _918;
    float _924 = _922;
    if (!_805)
    {
        float _926 = in.m_66.y;
        float _928 = in.m_66.z;
        _920 = 7.345489978790283203125;
        _896 = 1.2345600128173828125;
        _846 = _926;
        _924 = 5.839270114898681640625;
        _886 = _928;
        _829 = 1;
        _848 = 2;
    }
    float _930 = _920;
    float _932 = _896;
    float _934 = _846;
    float _936 = _924;
    float _938 = _886;
    int _940 = _829;
    int _942 = _848;
    float _944 = _930 * _874;
    int _946 = int(_840) + int(_914);
    float _948 = _932 * _934;
    float _950 = _936 * _938;
    float _952 = float(_801);
    float _954 = floor(_944);
    int _956 = as_type<int>(_852) + (-2);
    int _958 = _785 * _946;
    int _960 = _958 + _801;
    bool _962 = _952 >= _781;
    bool _964 = isnan(_952);
    bool _966 = _962 || _964;
    bool _968 = isnan(_781);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    float _974 = _717 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _976 = float(uint(_894));
    int _978 = as_type<int>(_916) + (-2);
    float _980 = trunc(_972);
    int _982 = int(_980);
    float _984 = float(uint(_908));
    bool _986 = uint(_960) >= uint(_769);
    float _988 = as_type<float>(_956) * _976;
    bool _990 = _876 > 0.5;
    float _992 = as_type<float>(_978) * _984;
    bool _994 = !_986;
    int _996 = _994 ? 0 : (-1);
    float _998 = -_954;
    float _1000 = _944 + _998;
    float _1002 = trunc(_988);
    float _1004 = precise::max(_1002, 0.0);
    uint _1006 = uint(_1004);
    int _1008 = ~_946;
    int _1010 = _1008 + _996;
    int _1012 = _1010 + 1;
    float _1014 = _1000 * _781;
    bool _1016 = _769 == 0;
    bool _1018 = _878 > 0.5;
    int _1020 = _769 * _1012;
    int _1022 = _1020 + _801;
    int _1024 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1026 = _1024 != 0;
    float _1028 = trunc(_992);
    float _1030 = precise::max(_1028, 0.0);
    uint _1032 = uint(_1030);
    float _1034 = -_209;
    int _1036 = _990 ? as_type<int>(_1034) : as_type<int>(_209);
    int _1038 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1040 = _1038 != 0;
    int _1042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1044 = _1042 != 0;
    int _1046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1048 = _1046 != 0;
    float _1050 = -_213;
    int _1052 = _1018 ? as_type<int>(_1050) : as_type<int>(_213);
    float _1054 = floor(_948);
    bool _1056 = !_1048;
    float _1058 = _1056 ? _213 : as_type<float>(_1052);
    int _1060 = ~_982;
    int _1062 = _1060 + 1;
    int _1064 = _1062 + 1;
    bool _1066 = !_1016;
    int _1068 = _1066 ? _1022 : (-1);
    bool _1070 = !_1044;
    float _1072 = _1070 ? _209 : as_type<float>(_1036);
    float _1074 = floor(_950);
    int _1076 = ~_809;
    int _1078 = _1076 + 1;
    int _1080 = _1068 * _1064;
    int _1082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1084 = _1082 != 0;
    int _1086 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1088 = _1086 != 0;
    int _1090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1092 = _1090 != 0;
    int _1094 = _769 + (-1);
    int _1096 = _1078 * int(_1006);
    int _1098 = _1096 + _894;
    bool _1100 = !_1026;
    int _1102 = _1100 ? 0 : 1;
    float _1104 = trunc(_1014);
    int _1106 = int(_1104);
    bool _1108 = !_1088;
    int _1110 = _1108 ? 0 : 1;
    int _1112 = _982 * _1094;
    int _1114 = _1112 + _1080;
    bool _1116 = _880 > 0.5;
    float _1118 = -_1054;
    float _1120 = _948 + _1118;
    bool _1122 = !_1084;
    int _1124 = _1122 ? 0 : 1;
    int _1126 = abs(_1110);
    float _1128 = -_1074;
    float _1130 = _950 + _1128;
    float _1132 = float(uint(_1098));
    bool _1134 = !_1092;
    int _1136 = _1134 ? 0 : 1;
    int _1138 = _1114 * _1126;
    int _1140 = ~_866;
    int _1142 = _1140 + 1;
    float _1144 = as_type<float>(_956) * _1132;
    int _1146 = abs(_1124);
    int _1148 = abs(_1136);
    float _1150 = trunc(_1144);
    float _1152 = precise::max(_1150, 0.0);
    uint _1154 = uint(_1152);
    int _1156 = _1142 * int(_1032);
    int _1158 = _1156 + _908;
    int _1160 = abs(_1102);
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1164 = _1162 != 0;
    int _1166 = _904 * _1146;
    int _1168 = _1166 + _1138;
    float _1170 = float(uint(_1158));
    int _1172 = _1106 * _1160;
    int _1174 = _1172 + _801;
    int _1176 = ~_809;
    int _1178 = _1176 + 1;
    float _1180 = as_type<float>(_978) * _1170;
    bool _1182 = !_1164;
    int _1184 = _1182 ? 0 : 1;
    int _1186 = _1174 * _1148;
    int _1188 = _1186 + _1168;
    float _1190 = float(_809);
    float _1192 = trunc(_1180);
    float _1194 = precise::max(_1192, 0.0);
    uint _1196 = uint(_1194);
    int _1198 = int(_1006) + int(_1154);
    float _1200 = float(_894);
    float _1202 = _1120 * _1190;
    int _1204 = abs(_1184);
    int _1206 = _1178 * _1198;
    int _1208 = _1206 + _894;
    bool _1210 = _1200 >= _1190;
    bool _1212 = isnan(_1200);
    bool _1214 = _1210 || _1212;
    bool _1216 = isnan(_1190);
    bool _1218 = _1214 || _1216;
    float _1220 = float(_1218);
    float _1222 = _1190 * _868;
    float _1224 = float(_866);
    int _1226 = _1106 * _1204;
    int _1228 = _1226 + _1188;
    int _1230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1232 = _1230 != 0;
    float _1234 = trunc(_1202);
    int _1236 = int(_1234);
    float _1238 = float(_908);
    float _1240 = _1224 * _868;
    bool _1242 = uint(_1208) >= uint(_809);
    float _1244 = _1130 * _1224;
    int _1246 = int(_1032) + int(_1196);
    bool _1248 = !_1232;
    int _1250 = _1248 ? 0 : 1;
    float _1252 = trunc(_1220);
    int _1254 = int(_1252);
    bool _1256 = _1238 >= _1224;
    bool _1258 = isnan(_1238);
    bool _1260 = _1256 || _1258;
    bool _1262 = isnan(_1224);
    bool _1264 = _1260 || _1262;
    float _1266 = float(_1264);
    float _1268 = -_213;
    int _1270 = _1116 ? as_type<int>(_1268) : as_type<int>(_213);
    float _1272 = float(uint(_1228));
    bool _1274 = !_1242;
    int _1276 = _1274 ? 0 : (-1);
    float _1278 = trunc(_1222);
    int _1280 = int(_1278);
    int _1282 = abs(_1250);
    bool _1284 = !_1040;
    float _1286 = _1284 ? _213 : as_type<float>(_1270);
    float _1288 = as_type<float>(_797) * _1272;
    int _1290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1292 = _1290 != 0;
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1296 = _1294 != 0;
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1300 = _1298 != 0;
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1304 = _1302 != 0;
    int _1306 = ~_1198;
    int _1308 = _1306 + _1276;
    int _1310 = _1308 + 1;
    float _1312 = trunc(_1266);
    int _1314 = int(_1312);
    int _1316 = ~_866;
    int _1318 = _1316 + 1;
    bool _1320 = !_1296;
    int _1322 = _1320 ? 0 : 1;
    int _1324 = _809 * _1310;
    int _1326 = _1324 + _894;
    bool _1328 = _809 == 0;
    int _1330 = _1318 * _1246;
    int _1332 = _1330 + _908;
    float _1334 = trunc(_1288);
    float _1336 = precise::max(_1334, 0.0);
    uint _1338 = uint(_1336);
    int _1340 = ~_1254;
    int _1342 = _1340 + 1;
    int _1344 = _1342 + 1;
    bool _1346 = !_1328;
    int _1348 = _1346 ? _1326 : (-1);
    int _1350 = _1236 * _1282;
    int _1352 = _1350 + _894;
    int _1354 = ~_769;
    int _1356 = _1354 + 1;
    int _1358 = _809 + (-1);
    int _1360 = _1348 * _1344;
    bool _1362 = !_1292;
    int _1364 = _1362 ? 0 : 1;
    float _1366 = trunc(_1240);
    int _1368 = int(_1366);
    bool _1370 = uint(_1332) >= uint(_866);
    int _1372 = _1254 * _1358;
    int _1374 = _1372 + _1360;
    int _1376 = abs(_1322);
    bool _1378 = !_1370;
    int _1380 = _1378 ? 0 : (-1);
    int _1382 = _1356 * int(_1338);
    int _1384 = _1382 + _1228;
    int _1386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1388 = _1386 != 0;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1392 = _1390 != 0;
    int _1394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1396 = _1394 != 0;
    int _1398 = _1374 * _1376;
    int _1400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1402 = _1400 != 0;
    float _1404 = float(uint(_1384));
    int _1406 = abs(_1364);
    float _1408 = trunc(_1244);
    int _1410 = int(_1408);
    int _1412 = ~_1246;
    int _1414 = _1412 + _1380;
    int _1416 = _1414 + 1;
    float _1418 = as_type<float>(_797) * _1404;
    float _1420 = float(uint(_1174));
    int _1422 = _1280 * _1406;
    int _1424 = _1422 + _1398;
    bool _1426 = !_1402;
    int _1428 = _1426 ? 0 : 1;
    bool _1430 = !_1300;
    int _1432 = _1430 ? 0 : 1;
    float _1434 = as_type<float>(_797) * _1420;
    int _1436 = abs(_1428);
    float _1438 = trunc(_1418);
    float _1440 = precise::max(_1438, 0.0);
    uint _1442 = uint(_1440);
    bool _1444 = !_1304;
    int _1446 = _1444 ? 0 : 1;
    int _1448 = _866 * _1416;
    int _1450 = _1448 + _908;
    int _1452 = abs(_1432);
    int _1454 = abs(_1446);
    float _1456 = trunc(_1434);
    float _1458 = precise::max(_1456, 0.0);
    uint _1460 = uint(_1458);
    int _1462 = _1410 * _1436;
    int _1464 = _1462 + _908;
    bool _1466 = _866 == 0;
    int _1468 = ~_1314;
    int _1470 = _1468 + 1;
    int _1472 = _1470 + 1;
    int _1474 = _1352 * _1452;
    int _1476 = _1474 + _1424;
    bool _1478 = !_1466;
    int _1480 = _1478 ? _1450 : (-1);
    int _1482 = ~_769;
    int _1484 = _1482 + 1;
    int _1486 = _1236 * _1454;
    int _1488 = _1486 + _1476;
    int _1490 = ~_769;
    int _1492 = _1490 + 1;
    int _1494 = _1480 * _1472;
    bool _1496 = !_1392;
    int _1498 = _1496 ? 0 : 1;
    int _1500 = _866 + (-1);
    int _1502 = _1484 * int(_1460);
    int _1504 = _1502 + _1174;
    int _1506 = int(_1338) + int(_1442);
    int _1508 = _1314 * _1500;
    int _1510 = _1508 + _1494;
    int _1512 = abs(_1498);
    float _1514 = float(uint(_1488));
    float _1516 = float(uint(_1504));
    int _1518 = _1492 * _1506;
    int _1520 = _1518 + _1228;
    int _1522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1524 = _1522 != 0;
    float _1526 = as_type<float>(_956) * _1514;
    int _1528 = _1510 * _1512;
    float _1530 = as_type<float>(_797) * _1516;
    bool _1532 = !_1388;
    int _1534 = _1532 ? 0 : 1;
    float _1536 = float(uint(_1352));
    float _1538 = trunc(_1526);
    float _1540 = precise::max(_1538, 0.0);
    uint _1542 = uint(_1540);
    bool _1544 = uint(_1520) >= uint(_769);
    bool _1546 = !_1396;
    int _1548 = _1546 ? 0 : 1;
    float _1550 = as_type<float>(_956) * _1536;
    int _1552 = abs(_1534);
    int _1554 = abs(_1548);
    float _1556 = trunc(_1530);
    float _1558 = precise::max(_1556, 0.0);
    uint _1560 = uint(_1558);
    bool _1562 = !_1524;
    int _1564 = _1562 ? 0 : 1;
    int _1566 = ~_809;
    int _1568 = _1566 + 1;
    int _1570 = _1368 * _1552;
    int _1572 = _1570 + _1528;
    int _1574 = abs(_1564);
    float _1576 = trunc(_1550);
    float _1578 = precise::max(_1576, 0.0);
    uint _1580 = uint(_1578);
    bool _1582 = !_1544;
    int _1584 = _1582 ? 0 : (-1);
    int _1586 = _1464 * _1554;
    int _1588 = _1586 + _1572;
    int _1590 = _1568 * int(_1542);
    int _1592 = _1590 + _1488;
    int _1594 = ~_1506;
    int _1596 = _1594 + _1584;
    int _1598 = _1596 + 1;
    int _1600 = _1410 * _1574;
    int _1602 = _1600 + _1588;
    float _1604 = float(uint(_1592));
    int _1606 = _769 * _1598;
    int _1608 = _1606 + _1228;
    bool _1610 = _769 == 0;
    int _1612 = int(_1460) + int(_1560);
    float _1614 = as_type<float>(_956) * _1604;
    bool _1616 = !_1610;
    int _1618 = _1616 ? _1608 : (-1);
    int _1620 = _1568 * int(_1580);
    int _1622 = _1620 + _1352;
    float _1624 = float(uint(_1602));
    float _1626 = trunc(_1614);
    float _1628 = precise::max(_1626, 0.0);
    uint _1630 = uint(_1628);
    int _1632 = _1618 & 3;
    bool _1634 = _1632 != 0;
    float _1636 = float(uint(_1622));
    float _1638 = as_type<float>(_978) * _1624;
    int _1640 = _1618 & 3;
    bool _1642 = _1640 != 0;
    int _1644 = _1634 ? 0 : 1;
    float _1646 = as_type<float>(_956) * _1636;
    float _1648 = float(uint(_1464));
    float _1650 = trunc(_1638);
    float _1652 = precise::max(_1650, 0.0);
    uint _1654 = uint(_1652);
    bool _1656 = uint(_1640) > 1u;
    int _1658 = ~_866;
    int _1660 = _1658 + 1;
    float _1662 = as_type<float>(_978) * _1648;
    int _1664 = ~_1644;
    int _1666 = _1664 + 1;
    int _1668 = _1666 + 1;
    float _1670 = trunc(_1646);
    float _1672 = precise::max(_1670, 0.0);
    uint _1674 = uint(_1672);
    int _1676 = int(_1542) + int(_1630);
    int _1678 = ~_769;
    int _1680 = _1678 + 1;
    int _1682 = ~_809;
    int _1684 = _1682 + 1;
    int _1686 = _1668;
    if (!_1656)
    {
        int _1688 = ~_1644;
        int _1690 = _1688 + 1;
        _1686 = _1690;
    }
    int _1692 = _1686;
    int _1694 = _1660 * int(_1654);
    int _1696 = _1694 + _1602;
    bool _1698 = uint(_1640) >= 2u;
    int _1700 = _1680 * _1612;
    int _1702 = _1700 + _1174;
    float _1704 = trunc(_1662);
    float _1706 = precise::max(_1704, 0.0);
    uint _1708 = uint(_1706);
    int _1710 = ~_866;
    int _1712 = _1710 + 1;
    float _1714 = float(uint(_1696));
    int _1716 = _1698 ? 0 : 1;
    bool _1718 = uint(_1702) >= uint(_769);
    float _1720 = as_type<float>(_978) * _1714;
    int _1722 = _1684 * _1676;
    int _1724 = _1722 + _1488;
    int _1726 = ~_1716;
    int _1728 = _1726 + 1;
    int _1730 = _1728 + 1;
    bool _1732 = !_1718;
    int _1734 = _1732 ? 0 : (-1);
    bool _1736 = uint(_1724) >= uint(_809);
    float _1738 = trunc(_1720);
    float _1740 = precise::max(_1738, 0.0);
    uint _1742 = uint(_1740);
    int _1744 = ~_1612;
    int _1746 = _1744 + _1734;
    int _1748 = _1746 + 1;
    int _1750 = _1712 * int(_1708);
    int _1752 = _1750 + _1464;
    bool _1754 = !_1736;
    int _1756 = _1754 ? 0 : (-1);
    bool _1758 = _1640 != 3;
    int _1760 = _769 * _1748;
    int _1762 = _1760 + _1174;
    int _1764 = ~_1676;
    int _1766 = _1764 + _1756;
    int _1768 = _1766 + 1;
    float _1770 = float(uint(_1752));
    int _1772 = ~_866;
    int _1774 = _1772 + 1;
    int _1776 = _809 * _1768;
    int _1778 = _1776 + _1488;
    bool _1780 = !_1642;
    int _1782 = _1780 ? 0 : 1;
    float _1784 = as_type<float>(_978) * _1770;
    bool _1786 = !_1610;
    int _1788 = _1786 ? _1762 : (-1);
    bool _1790 = !_1328;
    int _1792 = _1790 ? _1778 : (-1);
    float _1794 = trunc(_1784);
    float _1796 = precise::max(_1794, 0.0);
    uint _1798 = uint(_1796);
    int _1800 = int(_1654) + int(_1742);
    int _1802 = _1730;
    if (_1758)
    {
        int _1804 = ~_1716;
        int _1806 = _1804 + 1;
        _1802 = _1806;
    }
    int _1808 = _1802;
    int _1810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1812 = _1810 != 0;
    int _1814 = _1774 * _1800;
    int _1816 = _1814 + _1602;
    int _1818 = _1792 & 3;
    bool _1820 = _1818 != 0;
    int _1822 = _1792 & 3;
    bool _1824 = _1822 != 0;
    bool _1826 = !_1812;
    int _1828 = _1826 ? 0 : 1;
    bool _1830 = uint(_1818) > 1u;
    int _1832 = _1824 ? 0 : 1;
    bool _1834 = uint(_1816) >= uint(_866);
    int _1836 = ~_1832;
    int _1838 = _1836 + 1;
    int _1840 = _1838 + 1;
    bool _1842 = !_1834;
    int _1844 = _1842 ? 0 : (-1);
    bool _1846 = _1640 != 3;
    int _1848 = ~_1800;
    int _1850 = _1848 + _1844;
    int _1852 = _1850 + 1;
    int _1854 = _1840;
    if (!_1830)
    {
        int _1856 = ~_1832;
        int _1858 = _1856 + 1;
        _1854 = _1858;
    }
    int _1860 = _1854;
    bool _1862 = uint(_1818) >= 2u;
    int _1864 = _866 * _1852;
    int _1866 = _1864 + _1602;
    int _1868 = int(_1580) + int(_1674);
    int _1870 = ~_809;
    int _1872 = _1870 + 1;
    int _1874 = _1792 >> 31;
    bool _1876 = !_1846;
    int _1878 = _1876 ? 0 : (-1);
    int _1880 = _1872 * _1868;
    int _1882 = _1880 + _1352;
    int _1884 = _1862 ? 0 : 1;
    bool _1886 = _1818 != 3;
    bool _1888 = _1818 != 3;
    int _1890 = _1874 & 3;
    bool _1892 = !_1466;
    int _1894 = _1892 ? _1866 : (-1);
    bool _1896 = !_1820;
    int _1898 = _1896 ? 0 : 1;
    int _1900 = _1792 + _1890;
    bool _1902 = uint(_1882) >= uint(_809);
    int _1904 = _1894 >> 31;
    int _1906 = _1618 >> 31;
    int _1908 = _1904 & 3;
    int _1910 = _1906 & 3;
    int _1912 = ~_1884;
    int _1914 = _1912 + 1;
    int _1916 = _1914 + 1;
    int _1918 = _1916;
    if (_1886)
    {
        int _1920 = ~_1884;
        int _1922 = _1920 + 1;
        _1918 = _1922;
    }
    int _1924 = _1918;
    bool _1926 = !_1888;
    int _1928 = _1926 ? 0 : (-1);
    int _1930 = _1618 + _1910;
    int _1932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1934 = _1932 != 0;
    int _1936 = _1894 & 3;
    bool _1938 = _1936 != 0;
    int _1940 = _1894 + _1908;
    int _1942 = _1894 & 3;
    bool _1944 = _1942 != 0;
    float _1946 = in.m_48.x;
    float _1948 = in.m_48.y;
    float _1950 = in.m_48.z;
    int _1952 = int(_1708) + int(_1798);
    bool _1954 = !_1934;
    int _1956 = _1954 ? 0 : 1;
    int _1958 = _1930 >> 2;
    bool _1960 = !_1902;
    int _1962 = _1960 ? 0 : (-1);
    bool _1964 = uint(_1942) > 1u;
    int _1966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1968 = _1966 != 0;
    int _1970 = _1958 << 4;
    int _1972 = _1970 + 368;
    int _1974 = _1900 >> 2;
    bool _1976 = !_1968;
    int _1978 = _1976 ? 0 : 1;
    uint _1980 = uint(int(uint(_1972) >> uint(2)));
    uint _1982 = uint(int(uint(int(_1980)) >> uint(2)));
    int _1984 = int(_1980) & 3;
    float _1986 = (*spvDescriptorSet0.vp_c9)._m0[int(_1982)][_1984];
    int _1988 = int(_1980) + 1;
    uint _1990 = uint(int(uint(_1988) >> uint(2)));
    int _1992 = _1988 & 3;
    float _1994 = (*spvDescriptorSet0.vp_c9)._m0[int(_1990)][_1992];
    int _1996 = ~_866;
    int _1998 = _1996 + 1;
    bool _2000 = _1942 != 3;
    int _2002 = _1938 ? 0 : 1;
    int _2004 = _1998 * _1952;
    int _2006 = _2004 + _1464;
    int _2008 = _1974 << 4;
    int _2010 = _2008 + 512;
    float _2012 = _193 * _1948;
    int _2014 = _1940 >> 2;
    float _2016 = _181 * _1948;
    bool _2018 = uint(_1942) >= 2u;
    uint _2020 = uint(int(uint(_2010) >> uint(2)));
    uint _2022 = uint(int(uint(int(_2020)) >> uint(2)));
    int _2024 = int(_2020) & 3;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[int(_2022)][_2024];
    int _2028 = int(_2020) + 1;
    uint _2030 = uint(int(uint(_2028) >> uint(2)));
    int _2032 = _2028 & 3;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[int(_2030)][_2032];
    int _2036 = ~_2002;
    int _2038 = _2036 + 1;
    int _2040 = _2038 + 1;
    float _2042 = fma(_179, _1946, _2016);
    int _2044 = _2040;
    if (!_1964)
    {
        int _2046 = ~_2002;
        int _2048 = _2046 + 1;
        _2044 = _2048;
    }
    int _2050 = _2044;
    float _2052 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2054 = int(_2052);
    int _2056 = _2014 << 4;
    int _2058 = _2056 + 656;
    bool _2060 = _1942 != 3;
    int _2062 = _2018 ? 0 : 1;
    uint _2064 = uint(int(uint(_2058) >> uint(2)));
    uint _2066 = uint(int(uint(int(_2064)) >> uint(2)));
    int _2068 = int(_2064) & 3;
    float _2070 = (*spvDescriptorSet0.vp_c9)._m0[int(_2066)][_2068];
    int _2072 = int(_2064) + 1;
    uint _2074 = uint(int(uint(_2072) >> uint(2)));
    int _2076 = _2072 & 3;
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[int(_2074)][_2076];
    bool _2080 = uint(_2006) >= uint(_866);
    bool _2082 = !_1944;
    int _2084 = _2082 ? 0 : 1;
    int _2086 = ~_2062;
    int _2088 = _2086 + 1;
    int _2090 = _2088 + 1;
    int _2092 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2094 = _2092 != 0;
    int _2096 = _2090;
    if (_2000)
    {
        int _2098 = ~_2062;
        int _2100 = _2098 + 1;
        _2096 = _2100;
    }
    int _2102 = _2096;
    bool _2104 = !_2060;
    int _2106 = _2104 ? 0 : (-1);
    bool _2108 = !_2080;
    int _2110 = _2108 ? 0 : (-1);
    int _2112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2114 = _2112 != 0;
    int _2116 = _1972 + 8;
    uint _2118 = uint(int(uint(_2116) >> uint(2)));
    uint _2120 = uint(int(uint(int(_2118)) >> uint(2)));
    int _2122 = int(_2118) & 3;
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[int(_2120)][_2122];
    int _2126 = int(_2118) + 1;
    uint _2128 = uint(int(uint(_2126) >> uint(2)));
    int _2130 = _2126 & 3;
    float _2132 = (*spvDescriptorSet0.vp_c9)._m0[int(_2128)][_2130];
    int _2134 = ~_1868;
    int _2136 = _2134 + _1962;
    int _2138 = _2136 + 1;
    int _2140 = ~_1952;
    int _2142 = _2140 + _2110;
    int _2144 = _2142 + 1;
    float _2146 = fma(_191, _1946, _2012);
    int _2148 = abs(_1692);
    int _2150 = _809 * _2138;
    int _2152 = _2150 + _1352;
    int _2154 = abs(_2050);
    int _2156 = _2010 + 8;
    uint _2158 = uint(int(uint(_2156) >> uint(2)));
    uint _2160 = uint(int(uint(int(_2158)) >> uint(2)));
    int _2162 = int(_2158) & 3;
    float _2164 = (*spvDescriptorSet0.vp_c9)._m0[int(_2160)][_2162];
    int _2166 = int(_2158) + 1;
    uint _2168 = uint(int(uint(_2166) >> uint(2)));
    int _2170 = _2166 & 3;
    float _2172 = (*spvDescriptorSet0.vp_c9)._m0[int(_2168)][_2170];
    int _2174 = _866 * _2144;
    int _2176 = _2174 + _1464;
    int _2178 = abs(_1860);
    int _2180 = abs(_1782);
    int _2182 = _2058 + 8;
    uint _2184 = uint(int(uint(_2182) >> uint(2)));
    uint _2186 = uint(int(uint(int(_2184)) >> uint(2)));
    int _2188 = int(_2184) & 3;
    float _2190 = (*spvDescriptorSet0.vp_c9)._m0[int(_2186)][_2188];
    int _2192 = int(_2184) + 1;
    uint _2194 = uint(int(uint(_2192) >> uint(2)));
    int _2196 = _2192 & 3;
    float _2198 = (*spvDescriptorSet0.vp_c9)._m0[int(_2194)][_2196];
    int _2200 = ~_2148;
    int _2202 = _2200 + 1;
    int _2204 = _2202 + 1;
    int _2206 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2208 = _2206 != 0;
    float _2210 = _187 * _1948;
    int _2212 = ~_2180;
    int _2214 = _2212 + 1;
    int _2216 = _2214 + 1;
    int _2218 = _2204 * as_type<int>(_1994);
    int _2220 = ~_2178;
    int _2222 = _2220 + 1;
    int _2224 = _2222 + 1;
    float _2226 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2228 = int(_2226);
    int _2230 = abs(_1898);
    int _2232 = _2216 * as_type<int>(_1986);
    int _2234 = _2232 + _2218;
    int _2236 = abs(_2084);
    int _2238 = _2224 * as_type<int>(_2034);
    int _2240 = ~_2230;
    int _2242 = _2240 + 1;
    int _2244 = _2242 + 1;
    float _2246 = fma(_185, _1946, _2210);
    int _2248 = abs(_1924);
    float _2250 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2252 = int(_2250);
    int _2254 = ~_2154;
    int _2256 = _2254 + 1;
    int _2258 = _2256 + 1;
    int _2260 = _2244 * as_type<int>(_2026);
    int _2262 = _2260 + _2238;
    int _2264 = abs(_1808);
    float _2266 = fma(_189, _1950, _2246);
    int _2268 = _2258 * as_type<int>(_2078);
    int _2270 = ~_2264;
    int _2272 = _2270 + 1;
    int _2274 = _2272 + 1;
    int _2276 = ~_2236;
    int _2278 = _2276 + 1;
    int _2280 = _2278 + 1;
    int _2282 = abs(_2102);
    int _2284 = ~_2248;
    int _2286 = _2284 + 1;
    int _2288 = _2286 + 1;
    int _2290 = _2280 * as_type<int>(_2070);
    int _2292 = _2290 + _2268;
    int _2294 = ~_2282;
    int _2296 = _2294 + 1;
    int _2298 = _2296 + 1;
    int _2300 = _2274 * as_type<int>(_2124);
    int _2302 = _2300 + _2234;
    int _2304 = abs(_2106);
    float _2306 = float(uint(_2228));
    int _2308 = abs(_1828);
    int _2310 = _2288 * as_type<int>(_2164);
    int _2312 = _2310 + _2262;
    int _2314 = abs(_1878);
    float _2316 = 1.0 / _2306;
    int _2318 = abs(_1928);
    int _2320 = ~_2314;
    int _2322 = _2320 + 1;
    int _2324 = _2322 + 1;
    int _2326 = _2298 * as_type<int>(_2190);
    int _2328 = _2326 + _2292;
    int _2330 = ~_2304;
    int _2332 = _2330 + 1;
    int _2334 = _2332 + 1;
    float _2336 = _874 * 2.0;
    float _2338 = float(uint(_2252));
    int _2340 = _2324 * as_type<int>(_2132);
    int _2342 = _2340 + _2302;
    int _2344 = ~_2318;
    int _2346 = _2344 + 1;
    int _2348 = _2346 + 1;
    int _2350 = _2334 * as_type<int>(_2198);
    int _2352 = _2350 + _2328;
    int _2354 = ~_2308;
    int _2356 = _2354 + 1;
    int _2358 = _2356 + 1;
    float _2360 = floor(_2336);
    int _2362 = abs(_1978);
    int _2364 = _2348 * as_type<int>(_2172);
    int _2366 = _2364 + _2312;
    float _2368 = float(uint(_2054));
    int _2370 = _2342 * _2358;
    int _2372 = abs(_1956);
    int _2374 = ~_2362;
    int _2376 = _2374 + 1;
    int _2378 = _2376 + 1;
    float _2380 = 1.0 / _2338;
    int _2382 = _1788 * _2308;
    int _2384 = _2382 + _2370;
    int _2386 = abs(_2228);
    int _2388 = _2352 * _2378;
    int _2390 = as_type<int>(_2316) + (-2);
    float _2392 = float(uint(_2386));
    float _2394 = 1.0 / _2368;
    int _2396 = abs(_2054);
    bool _2398 = !_1328;
    int _2400 = _2398 ? _2152 : (-1);
    float _2402 = float(uint(_2384));
    float _2404 = 1.0 / _2392;
    int _2406 = ~_2372;
    int _2408 = _2406 + 1;
    int _2410 = _2408 + 1;
    float _2412 = as_type<float>(_2390) * _2402;
    bool _2414 = !_1466;
    int _2416 = _2414 ? _2176 : (-1);
    float _2418 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2420 = float(uint(_2396));
    int _2422 = _2366 * _2410;
    float _2424 = _874 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2426 = _2416 * _2362;
    int _2428 = _2426 + _2388;
    int _2430 = abs(_2252);
    int _2432 = _2400 * _2372;
    int _2434 = _2432 + _2422;
    int _2436 = as_type<int>(_2380) + (-2);
    float _2438 = 1.0 / _2420;
    float _2440 = -_2418;
    float _2442 = fma(_2424, 2.0, _2440);
    float _2444 = float(uint(_2434));
    float _2446 = -_149;
    float _2448 = fma(_2446, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2442);
    int _2450 = as_type<int>(_2394) + (-2);
    float _2452 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2454 = trunc(_2412);
    float _2456 = precise::max(_2454, 0.0);
    uint _2458 = uint(_2456);
    float _2460 = float(uint(_2428));
    float _2462 = as_type<float>(_2436) * _2444;
    float _2464 = float(uint(_2430));
    float _2466 = _876 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2468 = abs(_2384);
    float _2470 = as_type<float>(_2450) * _2460;
    int _2472 = ~_2228;
    int _2474 = _2472 + 1;
    float _2476 = fma(_2466, -2.0, _2452);
    float _2478 = 1.0 / _2464;
    float _2480 = fma(_183, _1950, _2042);
    int _2482 = as_type<int>(_2404) + (-2);
    float _2484 = fma(_195, _1950, _2146);
    float _2486 = float(uint(_2468));
    float _2488 = trunc(_2462);
    float _2490 = precise::max(_2488, 0.0);
    uint _2492 = uint(_2490);
    int _2494 = as_type<int>(_2438) + (-2);
    float _2496 = as_type<float>(_2482) * _2486;
    int _2498 = _2474 * int(_2458);
    int _2500 = _2498 + _2384;
    int _2502 = abs(_2434);
    int _2504 = ~_2252;
    int _2506 = _2504 + 1;
    float _2508 = trunc(_2470);
    float _2510 = precise::max(_2508, 0.0);
    uint _2512 = uint(_2510);
    int _2514 = as_type<int>(_2478) + (-2);
    float _2516 = float(uint(_2502));
    float _2518 = trunc(_2496);
    float _2520 = precise::max(_2518, 0.0);
    uint _2522 = uint(_2520);
    int _2524 = abs(_2428);
    int _2526 = _2506 * int(_2492);
    int _2528 = _2526 + _2434;
    float _2530 = as_type<float>(_2514) * _2516;
    float _2532 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2534 = _2532 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2536 = float(uint(_2524));
    float _2538 = float(uint(_2528));
    float _2540 = trunc(_2530);
    float _2542 = precise::max(_2540, 0.0);
    uint _2544 = uint(_2542);
    float _2546 = as_type<float>(_2494) * _2536;
    float _2548 = float(uint(_2500));
    int _2550 = ~_2054;
    int _2552 = _2550 + 1;
    float _2554 = as_type<float>(_2390) * _2548;
    float _2556 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2558 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2556;
    int _2560 = ~_2386;
    int _2562 = _2560 + 1;
    float _2564 = 1.0 / _2534;
    float _2566 = as_type<float>(_2436) * _2538;
    int _2568 = _2552 * int(_2512);
    int _2570 = _2568 + _2428;
    bool _2572 = _2360 > 0.0;
    bool _2574 = _2360 >= 0.0;
    bool _2576 = isnan(_2360);
    bool _2578 = _2574 || _2576;
    bool _2580 = isnan(0.0);
    bool _2582 = _2578 || _2580;
    float _2584 = float(uint(_2570));
    int _2586 = _2562 * int(_2522);
    int _2588 = _2586 + _2468;
    float _2590 = trunc(_2554);
    float _2592 = precise::max(_2590, 0.0);
    uint _2594 = uint(_2592);
    int _2596 = ~_2396;
    int _2598 = _2596 + 1;
    float _2600 = as_type<float>(_2450) * _2584;
    float _2602 = float(uint(_2588));
    int _2604 = ~_2430;
    int _2606 = _2604 + 1;
    float _2608 = _2558 * _2564;
    float _2610 = trunc(_2546);
    float _2612 = precise::max(_2610, 0.0);
    uint _2614 = uint(_2612);
    float _2616 = as_type<float>(_2482) * _2602;
    float _2618 = _874 + _876;
    int _2620 = _2606 * int(_2544);
    int _2622 = _2620 + _2502;
    float _2624 = _2618 + (-1.0);
    bool _2626 = _876 > 0.5;
    float _2628 = trunc(_2616);
    float _2630 = precise::max(_2628, 0.0);
    uint _2632 = uint(_2630);
    float _2634 = float(uint(_2622));
    float _2636 = fma(_2624, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2638 = int(_2458) + int(_2594);
    float _2640 = _876 + _878;
    int _2642 = ~_2228;
    int _2644 = _2642 + 1;
    float _2646 = as_type<float>(_2514) * _2634;
    bool _2648 = _940 != 1;
    float _2650 = trunc(_2566);
    float _2652 = precise::max(_2650, 0.0);
    uint _2654 = uint(_2652);
    int _2656 = _2598 * int(_2614);
    int _2658 = _2656 + _2524;
    float _2660 = _2640 + (-1.0);
    int _2662 = _2644 * _2638;
    int _2664 = _2662 + _2384;
    int _2666 = ~_2386;
    int _2668 = _2666 + 1;
    float _2670 = in.m_64.w;
    float _2672 = fma(_2660, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2674 = -_213;
    int _2676 = _2626 ? as_type<int>(_2674) : as_type<int>(_213);
    float _2678 = trunc(_2646);
    float _2680 = precise::max(_2678, 0.0);
    uint _2682 = uint(_2680);
    int _2684 = int(_2522) + int(_2632);
    float _2686 = float(uint(_2658));
    bool _2688 = uint(_2664) >= uint(_2228);
    int _2690 = _2668 * _2684;
    int _2692 = _2690 + _2468;
    bool _2694 = !_2094;
    float _2696 = _2694 ? _213 : as_type<float>(_2676);
    float _2698 = trunc(_2600);
    float _2700 = precise::max(_2698, 0.0);
    uint _2702 = uint(_2700);
    int _2704 = int(_2492) + int(_2654);
    float _2706 = as_type<float>(_2494) * _2686;
    int _2708 = ~_2252;
    int _2710 = _2708 + 1;
    bool _2712 = _878 > 0.5;
    bool _2714 = !_2688;
    int _2716 = _2714 ? 0 : (-1);
    int _2718 = _2710 * _2704;
    int _2720 = _2718 + _2434;
    float _2722 = trunc(_2706);
    float _2724 = precise::max(_2722, 0.0);
    uint _2726 = uint(_2724);
    float _2728 = -_209;
    int _2730 = _2712 ? as_type<int>(_2728) : as_type<int>(_209);
    int _2732 = ~_2638;
    int _2734 = _2732 + _2716;
    int _2736 = _2734 + 1;
    float _2738 = _2484 + _2670;
    int _2740 = int(_2544) + int(_2682);
    bool _2742 = uint(_2692) >= uint(_2386);
    int _2744 = _2228 * _2736;
    int _2746 = _2744 + _2384;
    int _2748 = ~_2430;
    int _2750 = _2748 + 1;
    bool _2752 = uint(_2720) >= uint(_2252);
    bool _2754 = !_2742;
    float _2756 = _2754 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    int _2758 = _2750 * _2740;
    int _2760 = _2758 + _2502;
    int _2762 = int(_2512) + int(_2702);
    int _2764 = ~_2054;
    int _2766 = _2764 + 1;
    bool _2768 = _2228 == 0;
    bool _2770 = !_2752;
    int _2772 = _2770 ? 0 : (-1);
    int _2774 = _2766 * _2762;
    int _2776 = _2774 + _2428;
    bool _2778 = !_2114;
    float _2780 = _2778 ? _209 : as_type<float>(_2730);
    bool _2782 = _874 > 0.5;
    bool _2784 = !_2768;
    int _2786 = _2784 ? _2746 : (-1);
    int _2788 = ~_2704;
    int _2790 = _2788 + _2772;
    int _2792 = _2790 + 1;
    bool _2794 = uint(_2760) >= uint(_2430);
    float _2796 = in.m_60.w;
    float _2798 = -_209;
    int _2800 = _2782 ? as_type<int>(_2798) : as_type<int>(_209);
    int _2802 = _2252 * _2792;
    int _2804 = _2802 + _2434;
    bool _2806 = _942 != 2;
    int _2808 = int(_2614) + int(_2726);
    int _2810 = ~_2396;
    int _2812 = _2810 + 1;
    bool _2814 = !_2794;
    int _2816 = _2814 ? 0 : (-1);
    bool _2818 = uint(_2776) >= uint(_2054);
    int _2820 = _2812 * _2808;
    int _2822 = _2820 + _2524;
    bool _2824 = _2252 == 0;
    bool _2826 = !_2208;
    float _2828 = _2826 ? _209 : as_type<float>(_2800);
    bool _2830 = _2228 == 0;
    int _2832 = _2384 ^ _2228;
    bool _2834 = !_2818;
    float _2836 = _2834 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2838 = in.m_62.w;
    bool _2840 = !_2824;
    int _2842 = _2840 ? _2804 : (-1);
    bool _2844 = _2252 == 0;
    int _2846 = _2434 ^ _2252;
    float _2848 = _876 * 2.0;
    int _2850 = ~_2762;
    int _2852 = _2850 + as_type<int>(_2836);
    int _2854 = _2852 + 1;
    int _2856 = ~_2816;
    int _2858 = _2740 + _2856;
    int _2860 = _2858 + 1;
    float _2862 = floor(_2848);
    uint _2864 = uint(int(uint(_2832) >> uint(31)));
    bool _2866 = uint(_2822) >= uint(_2396);
    uint _2868 = uint(int(uint(_2846) >> uint(31)));
    int _2870 = ~as_type<int>(_2756);
    int _2872 = _2684 + _2870;
    int _2874 = _2872 + 1;
    float _2876 = _878 * 2.0;
    int _2878 = ~int(_2864);
    int _2880 = _2878 + 1;
    int _2882 = _2054 * _2854;
    int _2884 = _2882 + _2428;
    float _2886 = _2756;
    float _2888 = as_type<float>(_2804);
    float _2890 = as_type<float>(_2434);
    float _2892 = _2836;
    float _2894 = as_type<float>(_2684);
    if (!_2648)
    {
        _2886 = _876;
    }
    float _2896 = _2886;
    float _2898 = floor(_2876);
    int _2900 = ~int(_2868);
    int _2902 = _2900 + 1;
    float _2904 = _2266 + _2838;
    float _2906 = _2896;
    if (!_2648)
    {
        _2888 = _2896;
    }
    float _2908 = _2888;
    float _2910 = _2908;
    if (!_2648)
    {
        _2890 = _878;
    }
    float _2912 = _2890;
    float _2914 = _2912;
    if (!_2648)
    {
        _2892 = _878;
    }
    float _2916 = _2892;
    float _2918 = _2916;
    if (_2648)
    {
        _2910 = _874;
    }
    float _2920 = _2910;
    if (_2648)
    {
        _2906 = _874;
    }
    float _2922 = _2906;
    if (_2648)
    {
        _2914 = _876;
    }
    float _2924 = _2914;
    if (_2648)
    {
        _2918 = _876;
    }
    float _2926 = _2918;
    bool _2928 = _2054 == 0;
    float _2930 = _2924 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2932 = _2874 ^ _2880;
    float _2934 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2936 = _2860 ^ _2902;
    bool _2938 = !_2866;
    int _2940 = _2938 ? 0 : (-1);
    bool _2942 = !_2928;
    int _2944 = _2942 ? _2884 : (-1);
    int _2946 = ~_2880;
    int _2948 = _2946 + _2932;
    int _2950 = _2948 + 1;
    int _2952 = ~_2902;
    int _2954 = _2952 + _2936;
    int _2956 = _2954 + 1;
    float _2958 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2960 = _759 + _2958;
    bool _2962 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2964 = isnan(_759);
    bool _2966 = _2962 || _2964;
    bool _2968 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2970 = _2966 || _2968;
    float _2972 = float(_2970);
    bool _2974 = _2862 > 0.0;
    float _2976 = fma(_2608, _2960, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2978 = _2862 >= 0.0;
    bool _2980 = isnan(_2862);
    bool _2982 = _2978 || _2980;
    bool _2984 = isnan(0.0);
    bool _2986 = _2982 || _2984;
    float _2988 = -_2972;
    float _2990 = _2988 + 1.0;
    float _2992 = _2862;
    if (_2806)
    {
        _2894 = _874;
    }
    float _2994 = _2894;
    float _2996 = _2480 + _2796;
    float _2998 = _2994;
    float _3000 = _2996;
    if (_2806)
    {
        _2992 = _876;
    }
    float _3002 = _2992;
    float _3004 = _2934 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3006 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3008 = isnan(_759);
    bool _3010 = _3006 || _3008;
    bool _3012 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3014 = _3010 || _3012;
    float _3016 = float(_3014);
    float _3018 = _3002;
    if (!_2806)
    {
        _2998 = _878;
    }
    float _3020 = _2998;
    if (!_2806)
    {
        _3018 = _874;
    }
    float _3022 = _3018;
    float _3024 = -_3016;
    float _3026 = _3024 + 1.0;
    bool _3028 = !_2830;
    int _3030 = _3028 ? _2950 : (-1);
    bool _3032 = !_2844;
    int _3034 = _3032 ? _2956 : (-1);
    float _3036 = _3016 * _2990;
    int _3038 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3040 = _3038 != 0;
    int _3042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3044 = _3042 != 0;
    int _3046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3048 = _3046 != 0;
    float _3050 = _3022 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _3052 = _2582 ? 0 : 1;
    float _3054 = _2976 * _3036;
    bool _3056 = _2898 > 0.0;
    float _3058 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3060 = !_3044;
    int _3062 = _3060 ? 0 : 1;
    float _3064 = fma(_3026, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3054);
    bool _3066 = _2898 >= 0.0;
    bool _3068 = isnan(_2898);
    bool _3070 = _3066 || _3068;
    bool _3072 = isnan(0.0);
    bool _3074 = _3070 || _3072;
    int _3076 = _2428 ^ _2054;
    float _3078 = fma(_2972, (*spvDescriptorSet0.vp_c9)._m0[132].x, _3064);
    int _3080 = _3074 ? 0 : 1;
    float _3082 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _3084 = uint(int(uint(_3076) >> uint(31)));
    int _3086 = ~_3080;
    int _3088 = _3086 + 1;
    int _3090 = _3088 + 1;
    int _3092 = ~_2940;
    int _3094 = _2808 + _3092;
    int _3096 = _3094 + 1;
    float _3098 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3100 = _2904 + _3098;
    int _3102 = _3090;
    if (!_3056)
    {
        int _3104 = ~_3080;
        int _3106 = _3104 + 1;
        _3102 = _3106;
    }
    int _3108 = _3102;
    float _3110 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3112 = _2996 + _3110;
    int _3114 = ~int(_3084);
    int _3116 = _3114 + 1;
    float _3118 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _3120 = _2054 == 0;
    float _3122 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3124 = _2738 + _3122;
    int _3126 = _3096 ^ _3116;
    float _3128 = fma(_3112, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3118);
    float _3130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3132 = ~_3116;
    int _3134 = _3132 + _3126;
    int _3136 = _3134 + 1;
    float _3138 = fma(_3124, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3128);
    float _3140 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3142 = _3020 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _3144 = !_3120;
    int _3146 = _3144 ? _3136 : (-1);
    float _3148 = _3058 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3150 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3152 = -_3140;
    float _3154 = fma(_3142, 2.0, _3152);
    bool _3156 = _3138 >= 0.0;
    float _3158 = fma(_2922, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3150);
    float _3160 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3162 = _2920 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _3164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3166 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3168 = fma(_2926, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3160);
    float _3170 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3172 = -_3166;
    float _3174 = fma(_3162, 2.0, _3172);
    float _3176 = float(_2786);
    float _3178 = fma(_2930, -2.0, _3170);
    float _3180 = float(_2842);
    float _3182 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3184 = _3082 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3186 = -_149;
    float _3188 = fma(_3186, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3174);
    float _3190 = fma(_3148, _3176, _2448);
    float _3192 = fma(_3050, -2.0, _3182);
    float _3194 = float(_3030);
    float _3196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3198 = fma(_3184, _3180, _3188);
    float _3200 = _3130 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3202 = _2828 + 0.5;
    float _3204 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2476);
    float _3206 = float(_2944);
    float _3208 = _3164 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3210 = -_149;
    float _3212 = fma(_3210, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3154);
    float _3214 = fma(_3148, _3202, _3190);
    float _3216 = -_3204;
    float _3218 = fma(_3200, _3194, _3216);
    float _3220 = float(_3146);
    float _3222 = fma(_3208, _3206, _3212);
    float _3224 = _1072 + 0.5;
    float _3226 = float(_3034);
    float _3228 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3178);
    float _3230 = _2696 + (-0.5);
    float _3232 = _3196 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3234 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3192);
    float _3236 = fma(_3208, _3224, _3222);
    float _3238 = -_3228;
    float _3240 = fma(_3004, _3226, _3238);
    float _3242 = -_3200;
    float _3244 = fma(_3242, _3230, _3218);
    float _3246 = -_3234;
    float _3248 = fma(_3232, _3220, _3246);
    float _3250 = _1286 + (-0.5);
    float _3252 = _1058 + (-0.5);
    float _3254 = -_3004;
    float _3256 = fma(_3254, _3250, _3240);
    float _3258 = -_3232;
    float _3260 = fma(_3258, _3252, _3248);
    float _3262 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3264 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3266 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3268 = log2(_3266);
    float _3270 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3272 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3262);
    float _3274 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3264);
    float _3276 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3168);
    float _3278 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3270);
    float _3280 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3272);
    float _3282 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3274);
    float _3284 = _2780 + 0.5;
    float _3286 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3278);
    float _3288 = -_3280;
    float _3290 = _3288 + 1.0;
    float _3292 = -_3282;
    float _3294 = _3292 + 1.0;
    float _3296 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3158);
    float _3298 = _3248;
    if (_3156)
    {
        _3298 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3300 = _3298;
    float _3302 = fma(_2696, _3290, _3244);
    float _3304 = -_3294;
    float _3306 = fma(_2828, _3304, _3214);
    float _3308 = _3100 * _3100;
    float _3310 = -_3276;
    float _3312 = _3310 + 1.0;
    float _3314 = fma(_3184, _3284, _3198);
    float _3316 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3318 = fma(_3112, _3112, _3308);
    float _3320 = -_3286;
    float _3322 = _3320 + 1.0;
    float _3324 = -_3296;
    float _3326 = _3324 + 1.0;
    float _3328 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3316);
    float _3330 = fma(_3124, _3124, _3318);
    float _3332 = _3268 * _149;
    float _3334 = fma(_1286, _3312, _3256);
    float _3336 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3328);
    float _3338 = -_3322;
    float _3340 = fma(_1072, _3338, _3236);
    float _3342 = -_3326;
    float _3344 = fma(_2780, _3342, _3314);
    float _3346 = -_3336;
    float _3348 = _3346 + 1.0;
    int _3350 = as_type<int>(_3336);
    if (_3156)
    {
        float _3352 = _3300 * 5.0;
        _3350 = as_type<int>(_3352);
    }
    int _3354 = _3350;
    float _3356 = rsqrt(_3330);
    float _3358 = fma(_1058, _3348, _3260);
    float _3360 = _3078 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3362 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _3364 = !_3048;
    int _3366 = _3364 ? 0 : 1;
    float _3368 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _3370 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3372 = isnan(1.0);
    bool _3374 = _3370 || _3372;
    bool _3376 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3378 = _3374 || _3376;
    float _3380 = in.m_72.x;
    float _3382 = in.m_72.y;
    float _3384 = in.m_72.z;
    float _3386 = exp2(_3332);
    float _3388 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3390 = 1.0 + _3388;
    float _3392 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3394 = _3362 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3396 = _3368 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3398 = _974 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3400 = _3392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3402 = 1.0 / _3390;
    out.m_74.x = _3306;
    out.m_74.y = _3302;
    out.m_74.z = _3344;
    out.m_74.w = _3334;
    bool _3404 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3406 = isnan(0.0);
    bool _3408 = _3404 || _3406;
    bool _3410 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3412 = _3408 || _3410;
    float _3414 = float(_3108);
    out.m_76.x = _3394;
    out.m_76.y = _3396;
    out.m_76.z = _3400;
    out.m_76.w = _3360;
    float _3416 = -_3386;
    float _3418 = _3416 + 1.0;
    if (_3156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9996 = as_type<float>(_3354);
        out.gl_Position.z = _9996;
    }
    out.m_78.x = _3340;
    out.m_78.y = _3358;
    if (_3156)
    {
        out.m_51.x = 0.0;
    }
    float _3420 = _3398 * _3356;
    int _3422 = ~_3052;
    int _3424 = _3422 + 1;
    int _3426 = _3424 + 1;
    float _3428 = _3112 * _3420;
    float _3430 = _3100 * _3420;
    float _3432 = _3124 * _3420;
    bool _3434 = !_3040;
    int _3436 = _3434 ? 0 : 1;
    int _3438 = _3426;
    if (_3156)
    {
        return out;
    }
    float _3440 = -_3430;
    float _3442 = _2904 + _3440;
    float _3444 = -_3428;
    float _3446 = _2996 + _3444;
    int _3448 = abs(_3436);
    float _3450 = -_3430;
    float _3452 = _3100 + _3450;
    float _3454 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3456 = _3442 + _3454;
    float _3458 = -_3432;
    float _3460 = _2738 + _3458;
    float _3462 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3464 = _3446 + _3462;
    float _3466 = float(_3448);
    float _3468 = _3456 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3470 = -_3428;
    float _3472 = _3112 + _3470;
    float _3474 = _3452 * _3452;
    float _3476 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3478 = _3460 + _3476;
    float _3480 = fma(_3464, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3468);
    float _3482 = _3466 * _3414;
    float _3484 = fma(_3472, _3472, _3474);
    if (!_2572)
    {
        int _3486 = ~_3052;
        int _3488 = _3486 + 1;
        _3438 = _3488;
    }
    int _3490 = _3438;
    float _3492 = fma(_3478, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3480);
    float _3494 = _3482 * (-2.0);
    int _3496 = abs(_3062);
    float _3498 = _874 + (-0.5);
    float _3500 = _3412 ? _3418 : 0.0;
    float _3502 = fma(_3494, _3380, _3380);
    bool _3504 = _3492 >= 0.0;
    float _3506 = fma(_2636, _3494, _2636);
    float _3508 = float(_3490);
    float _3510 = _3508;
    if (_3378)
    {
        float _3512 = _3500 * _3402;
        _151 = _3512;
    }
    float _3514 = _151;
    float _3516 = float(_3496);
    float _3518 = fma(_3498, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3502);
    float _3520 = -_3432;
    float _3522 = _3124 + _3520;
    int _3524 = _2986 ? 0 : 1;
    float _3526 = _876 + (-0.5);
    float _3528 = _3516 * _3508;
    float _3530 = fma(_3506, _3514, _3518);
    float _3532 = fma(_3522, _3522, _3484);
    int _3534 = ~_3524;
    int _3536 = _3534 + 1;
    int _3538 = _3536 + 1;
    float _3540 = _3528 * (-2.0);
    float _3542 = _3530 * 0.15915493667125701904296875;
    int _3544 = _3538;
    if (!_2974)
    {
        int _3546 = ~_3524;
        int _3548 = _3546 + 1;
        _3544 = _3548;
    }
    int _3550 = _3544;
    if (_3504)
    {
        _3510 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3552 = _3510;
    float _3554 = fma(_2672, _3540, _2672);
    float _3556 = sqrt(_3532);
    int _3558 = as_type<int>(_3552);
    if (_3504)
    {
        out.m_51.x = 0.0;
    }
    float _3560 = fma(_3540, _3382, _3382);
    if (_3504)
    {
        float _3562 = _3552 * 5.0;
        _3558 = as_type<int>(_3562);
    }
    int _3564 = _3558;
    int _3566 = abs(_3366);
    float _3568 = _3542 * 6.283185482025146484375;
    float _3570 = sin(_3568);
    if (_3504)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10236 = as_type<float>(_3564);
        out.gl_Position.z = _10236;
    }
    if (_3504)
    {
        return out;
    }
    float _3572 = -_2904;
    float _3574 = _3572 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3576 = -_2996;
    float _3578 = _3576 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3580 = -_2738;
    float _3582 = _3580 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3584 = _3574 * _3574;
    float _3586 = float(_3550);
    float _3588 = fma(_3526, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3560);
    float _3590 = float(_3566);
    float _3592 = fma(_3578, _3578, _3584);
    float _3594 = _874 + _878;
    float _3596 = fma(_3554, _3514, _3588);
    float _3598 = fma(_3582, _3582, _3592);
    float _3600 = _3590 * _3586;
    float _3602 = _3594 + (-1.0);
    float _3604 = _878 + (-0.5);
    float _3606 = rsqrt(_3598);
    float _3608 = _3600 * (-2.0);
    float _3610 = fma(_3602, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3612 = _3596 * 0.15915493667125701904296875;
    float _3614 = _715 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3616 = fma(_3608, _3384, _3384);
    float _3618 = fma(_3610, _3608, _3610);
    float _3620 = _3612 * 6.283185482025146484375;
    float _3622 = sin(_3620);
    float _3624 = fma(_3604, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3616);
    float _3626 = fma(_3618, _3514, _3624);
    float _3628 = _3578 * _3606;
    float _3630 = _3582 * _3606;
    float _3632 = _3574 * _3606;
    float _3634 = _3612 * 6.283185482025146484375;
    float _3636 = cos(_3634);
    float _3638 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3640 = _3628 * _3638;
    float _3642 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3644 = _3630 * _3642;
    float _3646 = _3626 * 0.15915493667125701904296875;
    float _3648 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _213);
    float _3650 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3652 = -_3640;
    float _3654 = fma(_3630, _3650, _3652);
    float _3656 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3658 = _3632 * _3656;
    float _3660 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3662 = _3542 * 6.283185482025146484375;
    float _3664 = cos(_3662);
    float _3666 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3668 = -_3644;
    float _3670 = fma(_3632, _3666, _3668);
    float _3672 = _3654 * _3654;
    float _3674 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3676 = -_3658;
    float _3678 = fma(_3628, _3674, _3676);
    float _3680 = _3356 * _3556;
    float _3682 = fma(_3670, _3670, _3672);
    float _3684 = _3570 * _3622;
    float _3686 = _3646 * 6.283185482025146484375;
    float _3688 = cos(_3686);
    float _3690 = _974 * _3680;
    float _3692 = fma(_3678, _3678, _3682);
    float _3694 = _3680 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3696 = _3694 * 0.5;
    float _3698 = _3646 * 6.283185482025146484375;
    float _3700 = sin(_3698);
    float _3702 = _3664 * _3636;
    float _3704 = _3664 * _3622;
    float _3706 = rsqrt(_3692);
    float _3708 = _3570 * _3636;
    float _3710 = _3664 * _3688;
    float _3712 = _3636 * _3688;
    float _3714 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _3716 = _3570 * _3688;
    float _3718 = fma(_3700, _3702, _3684);
    float _3720 = _3680 * _3614;
    float _3722 = fma(_3700, _3684, _3702);
    float _3724 = _3622 * _3688;
    float _3726 = -_3704;
    float _3728 = fma(_3700, _3708, _3726);
    float _3730 = _3648 * _3720;
    float _3732 = -_3708;
    float _3734 = fma(_3700, _3704, _3732);
    float _3736 = _3714 * _3690;
    float _3738 = _3670 * _3706;
    float _3740 = _3654 * _3706;
    float _3742 = _3678 * _3706;
    float _3744 = _3710 * _3730;
    float _3746 = -_3730;
    float _3748 = _3700 * _3746;
    float _3750 = _3716 * _3730;
    float _3752 = _3630 * _3740;
    float _3754 = fma(_3718, _3736, _3744);
    float _3756 = _3632 * _3738;
    float _3758 = fma(_3712, _3736, _3748);
    float _3760 = -_3752;
    float _3762 = fma(_3632, _3742, _3760);
    float _3764 = fma(_3734, _3696, _3754);
    float _3766 = -_3756;
    float _3768 = fma(_3628, _3740, _3766);
    float _3770 = fma(_3728, _3736, _3750);
    float _3772 = fma(_3724, _3696, _3758);
    float _3774 = _3762 * _3764;
    float _3776 = _3768 * _3764;
    float _3778 = fma(_3722, _3696, _3770);
    float _3780 = _3628 * _3742;
    float _3782 = fma(_3738, _3772, _3774);
    float _3784 = fma(_3742, _3772, _3776);
    float _3786 = _3718 * _3762;
    float _3788 = -_3780;
    float _3790 = fma(_3630, _3738, _3788);
    float _3792 = fma(_3628, _3778, _3782);
    float _3794 = fma(_3630, _3778, _3784);
    float _3796 = _3718 * _3768;
    float _3798 = _3718 * _3790;
    float _3800 = _2996 + _3792;
    float _3802 = _2738 + _3794;
    float _3804 = _3710 * _3762;
    float _3806 = _3734 * _3762;
    float _3808 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3810 = _3800 + _3808;
    float _3812 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3814 = _3802 + _3812;
    float _3816 = _3734 * _3768;
    float _3818 = _3734 * _3790;
    float _3820 = _3810 * _3810;
    float _3822 = _3814 * _3814;
    float _3824 = _3710 * _3790;
    float _3826 = _3710 * _3768;
    float _3828 = _3790 * _3764;
    float _3830 = _3820 + _3822;
    float _3832 = fma(_3712, _3738, _3786);
    float _3834 = fma(_3712, _3740, _3798);
    float _3836 = fma(_3712, _3742, _3796);
    float _3838 = sqrt(_3830);
    float _3840 = fma(_3660, _3660, 1.0);
    float _3842 = fma(_3740, _3772, _3828);
    float _3844 = -_3700;
    float _3846 = fma(_3844, _3738, _3804);
    float _3848 = -_3700;
    float _3850 = fma(_3848, _3740, _3824);
    float _3852 = -_3700;
    float _3854 = fma(_3852, _3742, _3826);
    float _3856 = fma(_3632, _3778, _3842);
    float _3858 = fma(_3724, _3740, _3818);
    float _3860 = rsqrt(_3840);
    float _3862 = fma(_3724, _3738, _3806);
    float _3864 = _2904 + _3856;
    float _3866 = fma(_3724, _3742, _3816);
    bool _3868 = _3838 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3870 = _3740;
    float _3872 = _3820;
    float _3874 = _3822;
    float _3876 = _3800;
    float _3878 = _3802;
    if (!_3868)
    {
        _3870 = _3864;
    }
    float _3880 = _3870;
    bool _3882 = !_3868;
    float _3884 = _3880;
    if (!_3882)
    {
        float _3886 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3888 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3890 = _3838 + _3888;
        float _3892 = _3864 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3894 = rsqrt(_3830);
        float _3896 = _3890 * _3886;
        float _3898 = _3896 * 0.15915493667125701904296875;
        float _3900 = _3898 * 6.283185482025146484375;
        float _3902 = sin(_3900);
        float _3904 = _3898 * 6.283185482025146484375;
        float _3906 = cos(_3904);
        float _3908 = fma(_3902, _3892, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3910 = _3894 * _3908;
        float _3912 = _3906 + (-1.0);
        float _3914 = fma(_3810, _3910, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3916 = fma(_3814, _3910, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3918 = _3912 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3920 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3922 = _3914 + _3920;
        float _3924 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3926 = _3916 + _3924;
        float _3928 = fma(_3864, _3906, _3918);
        float _3930 = _3922 * _3922;
        float _3932 = _3926 * _3926;
        _3884 = _3928;
        _3872 = _3930;
        _3874 = _3932;
        _3876 = _3914;
        _3878 = _3916;
    }
    float _3934 = _3884;
    float _3936 = _3872;
    float _3938 = _3874;
    float _3940 = _3876;
    float _3942 = _3878;
    float _3944 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3946 = _3934 + _3944;
    float _3948 = fma(_3716, _3628, _3846);
    float _3950 = fma(_3716, _3632, _3850);
    float _3952 = fma(_3716, _3630, _3854);
    float _3954 = fma(_3946, _3946, _3936);
    float _3956 = fma(_3722, _3628, _3862);
    float _3958 = fma(_3722, _3632, _3858);
    float _3960 = fma(_3722, _3630, _3866);
    float _3962 = _3954 + _3938;
    float _3964 = _3660 * _3860;
    float _3966 = fma(_3728, _3628, _3832);
    float _3968 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3970 = _3660 * _3948;
    float _3972 = fma(_3728, _3632, _3834);
    float _3974 = _3660 * _3950;
    float _3976 = fma(_3728, _3630, _3836);
    float _3978 = _3660 * _3952;
    float _3980 = -_3956;
    float _3982 = _3964 * _3980;
    float _3984 = -_3958;
    float _3986 = _3964 * _3984;
    float _3988 = -_3960;
    float _3990 = _3964 * _3988;
    float _3992 = fma(_3968, _3966, _3970);
    float _3994 = sqrt(_3962);
    float _3996 = fma(_3968, _3972, _3974);
    float _3998 = fma(_3968, _3976, _3978);
    float _4000 = fma(_3860, _3948, _3982);
    float _4002 = fma(_3860, _3950, _3986);
    float _4004 = _3958 + _3996;
    float _4006 = fma(_3860, _3952, _3990);
    float _4008 = _3956 + _3992;
    float _4010 = _3960 + _3998;
    out.m_80.x = _3966;
    out.m_80.y = _3972;
    out.m_80.z = _3976;
    out.m_82.x = _4000;
    out.m_82.y = _4002;
    out.m_82.z = _4006;
    bool _4012 = _3994 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4014 = isnan(_3994);
    bool _4016 = _4012 || _4014;
    bool _4018 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4020 = _4016 || _4018;
    out.m_84.x = _4008;
    out.m_84.y = _4004;
    out.m_84.z = _4010;
    float _4022 = _3998;
    float _4024 = _4006;
    float _4026 = _4000;
    if (!_4020)
    {
        _4022 = 1.0;
    }
    float _4028 = _4022;
    bool _4030 = !_4020;
    float _4032 = _4028;
    if (!_4030)
    {
        bool _4034 = _3994 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4036 = isnan(_3994);
        bool _4038 = _4034 || _4036;
        bool _4040 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4042 = _4038 || _4040;
        if (!_4042)
        {
            float _4044 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4046 = _3994 + _4044;
            float _4048 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4050 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4048;
            float _4052 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4054 = _4052 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4056 = 1.0 / _4050;
            float _4058 = _4046 * _4056;
            float _4060 = fma(_4058, _4054, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4032 = _4060;
            _4062 = true;
        }
        else
        {
            bool _4064 = _3994 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4066 = isnan(_3994);
            bool _4068 = _4064 || _4066;
            bool _4070 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4072 = _4068 || _4070;
            if (!_4072)
            {
                float _4074 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4076 = _3994 + _4074;
                float _4078 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4080 = _4078 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4082 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4084 = _4082 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4086 = 1.0 / _4080;
                float _4088 = _4076 * _4086;
                float _4090 = fma(_4088, _4084, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4032 = _4090;
                _4062 = true;
            }
            else
            {
                _4032 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4062 = false;
    float _4092 = _4032;
    float _4094 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4096 = _3934 + _4094;
    float _4098 = _3442 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4100 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4102 = _3940 + _4100;
    float _4104 = fma(_4096, _4092, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4106 = fma(_3446, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4098);
    float _4108 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4110 = _3942 + _4108;
    float _4112 = fma(_4102, _4092, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4114 = -_2904;
    float _4116 = _4114 + _4104;
    float _4118 = fma(_3460, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4106);
    float _4120 = fma(_4110, _4092, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4122 = -_2996;
    float _4124 = _4122 + _4112;
    float _4126 = _4116 * _4116;
    float _4128 = _4118 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4130 = _3442 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4132 = -_2738;
    float _4134 = _4132 + _4120;
    float _4136 = fma(_4124, _4124, _4126);
    float _4138 = 1.0 / _4128;
    float _4140 = fma(_3446, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4130);
    float _4142 = fma(_4134, _4134, _4136);
    float _4144 = fma(_3460, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4140);
    float _4146 = sqrt(_4142);
    float _4148 = _4144 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4150 = _4148 + _4128;
    float _4152 = _4150 * _4138;
    float _4154 = _4152 * 0.5;
    float _4156 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4158 = fma(_4154, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4156);
    bool _4160 = _4146 > 0.0;
    float _4162 = 1.0 / _4158;
    bool _4164 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4166 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4168 = _4164 || _4166;
    bool _4170 = isnan(0.5);
    bool _4172 = _4168 || _4170;
    bool _4174 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4176 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4178 = _4174 || _4176;
    bool _4180 = isnan(0.5);
    bool _4182 = _4178 || _4180;
    float _4184 = _4128;
    float _4186 = _4138;
    float _4188 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (!_4160)
    {
        _4024 = _4112;
    }
    float _4190 = _4024;
    float _4192 = _4190;
    float _4194 = _4190;
    if (!_4160)
    {
        _4184 = _4104;
    }
    float _4196 = _4184;
    float _4198 = _4196;
    float _4200 = _4196;
    if (!_4160)
    {
        _4026 = _4120;
    }
    float _4202 = _4026;
    bool _4204 = !_4160;
    float _4206 = _4202;
    float _4208 = _4202;
    float _4210 = _4162;
    if (!_4204)
    {
        float _4212 = _229 * _229;
        float _4214 = fma(_225, _225, _4212);
        float _4216 = fma(_231, _231, _4214);
        float _4218 = rsqrt(_4142);
        float _4220 = sqrt(_4216);
        float _4222 = _4124 * _4218;
        float _4224 = _4116 * _4218;
        float _4226 = _4134 * _4218;
        bool _4228 = _4220 > 0.0;
        _4188 = _4218;
        if (!_4228)
        {
            _4192 = _4112;
        }
        float _4230 = _4192;
        _4194 = _4230;
        if (!_4228)
        {
            _4198 = _4104;
        }
        float _4232 = _4198;
        _4200 = _4232;
        if (!_4228)
        {
            _4206 = _4120;
        }
        float _4234 = _4206;
        bool _4236 = !_4228;
        _4208 = _4234;
        if (!_4236)
        {
            float _4238 = rsqrt(_4216);
            float _4240 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4242 = _229 * _4238;
            float _4244 = _225 * _4238;
            float _4246 = _231 * _4238;
            float _4248 = _4224 * _4242;
            float _4250 = fma(_4222, _4244, _4248);
            float _4252 = _4240 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4254 = fma(_4226, _4246, _4250);
            float _4256 = _4254 * _4252;
            float _4258 = fma(_225, _4256, _4112);
            float _4260 = fma(_229, _4256, _4104);
            float _4262 = fma(_231, _4256, _4120);
            _4208 = _4262;
            _4194 = _4258;
            _4200 = _4260;
            _4186 = _4252;
            _4188 = _4256;
        }
    }
    float _4264 = _4208;
    float _4266 = _4194;
    float _4268 = _4200;
    float _4270 = _4186;
    float _4272 = _4188;
    float _4274 = -_3432;
    float _4276 = _4274 + _4264;
    float _4278 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4280 = _4162 * _4278;
    float _4282 = -_3428;
    float _4284 = _4282 + _4266;
    float _4286 = -_3430;
    float _4288 = _4286 + _4268;
    float _4290 = _4272;
    float _4292 = _4288;
    float _4294 = _4284;
    float _4296 = _4270;
    if (_4172)
    {
        _4290 = 1.0;
    }
    float _4298 = _4290;
    float _4300 = _4298;
    if (_4182)
    {
        _4210 = _4276;
    }
    float _4302 = _4210;
    float _4304 = _4302;
    if (!_4182)
    {
        float _4306 = _3456 * _3456;
        float _4308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4310 = -_2738;
        float _4312 = _4310 + _4264;
        float _4314 = fma(_3464, _3464, _4306);
        float _4316 = fma(_3478, _3478, _4314);
        float _4318 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4320 = sqrt(_4316);
        float _4322 = 1.0 / _3680;
        float _4324 = _4318 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4326 = precise::min(_4320, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4328 = _4326 * _4308;
        float _4330 = _4328 * _4322;
        float _4332 = -_2904;
        float _4334 = _4332 + _4268;
        float _4336 = -_2996;
        float _4338 = _4336 + _4266;
        float _4340 = _4324 * _4330;
        float _4342 = _4312 * _4330;
        float _4344 = fma(_4334, _4340, _3442);
        float _4346 = fma(_4338, _4340, _3446);
        float _4348 = fma(_4324, _4342, _3460);
        _4292 = _4344;
        _4294 = _4346;
        _4304 = _4348;
        _235 = _4340;
    }
    float _4350 = _4292;
    float _4352 = _4294;
    float _4354 = _4304;
    float _4356 = _235;
    float _4358 = _4356;
    if (!_4172)
    {
        float _4360 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4362 = _4360 * 0.15915493667125701904296875;
        float _4364 = _4362 * 6.283185482025146484375;
        float _4366 = cos(_4364);
        float _4368 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4370 = _4368 * 0.15915493667125701904296875;
        float _4372 = _4362 * 6.283185482025146484375;
        float _4374 = sin(_4372);
        float _4376 = 1.0 / _4366;
        float _4378 = _4370 * 6.283185482025146484375;
        float _4380 = cos(_4378);
        float _4382 = _4374 * _4376;
        float _4384 = _4370 * 6.283185482025146484375;
        float _4386 = sin(_4384);
        float _4388 = _4380 * _4382;
        float _4390 = 1.0 / _4388;
        float _4392 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4394 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4392;
        float _4396 = 1.0 / _4394;
        float _4398 = _4386 * _4390;
        float _4400 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4402 = fma(_4280, _4398, _4400);
        float _4404 = _4402 * _4396;
        float _4406 = precise::clamp(_4404, 0.0, 1.0);
        _4358 = _4396;
        _4300 = _4406;
    }
    float _4408 = _4358;
    float _4410 = _4300;
    float _4412 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4414 = _4350 + _4412;
    float _4416 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4418 = _4352 + _4416;
    float _4420 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4422 = _4354 + _4420;
    float _4424 = _4414 * _4414;
    float _4426 = fma(_4418, _4418, _4424);
    float _4428 = fma(_4422, _4422, _4426);
    float _4430 = rsqrt(_4428);
    float _4432 = _4430 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4434 = _4418 * _4432;
    float _4436 = _4422 * _4432;
    float _4438 = _4434 * _4434;
    float _4440 = _4436 * _4436;
    float _4442 = _4438 + _4440;
    float _4444 = sqrt(_4442);
    bool _4446 = _4444 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4448 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4450 = _4444 + _4448;
    float _4452 = _4430;
    float _4454 = _4408;
    float _4456 = _4450;
    float _4458 = _4414;
    float _4460 = _4442;
    if (_4446)
    {
        float _4462 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4452 = _4462;
    }
    float _4464 = _4452;
    if (_4446)
    {
        float _4466 = rsqrt(_4442);
        _4454 = _4466;
    }
    float _4468 = _4454;
    float _4470 = _4468;
    if (_4446)
    {
        float _4472 = _4450 * _4464;
        _4456 = _4472;
    }
    float _4474 = _4456;
    if (_4446)
    {
        float _4476 = _4474 * 0.15915493667125701904296875;
        _4296 = _4476;
    }
    float _4478 = _4296;
    float _4480 = _4422;
    float _4482 = _4478;
    if (_4446)
    {
        float _4484 = _4478 * 6.283185482025146484375;
        float _4486 = sin(_4484);
        _4480 = _4486;
    }
    float _4488 = _4480;
    float _4490 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4492 = precise::max(0.0, _4490);
    float _4494 = _4464;
    if (_4446)
    {
        float _4496 = _4478 * 6.283185482025146484375;
        float _4498 = cos(_4496);
        _4494 = _4498;
    }
    float _4500 = _4494;
    float _4502 = -_4432;
    float _4504 = -_4492;
    float _4506 = fma(_4414, _4502, _4504);
    if (_4446)
    {
        float _4508 = _4506 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4458 = _4508;
    }
    float _4510 = _4458;
    float _4512 = _4510;
    if (!_4446)
    {
        _4482 = _4434;
    }
    float _4514 = _4482;
    float _4516 = fma(_3446, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4518 = _4488;
    float _4520 = _4514;
    if (_4446)
    {
        float _4522 = fma(_4488, _4510, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3000 = _4522;
    }
    float _4524 = _3000;
    float _4526 = sqrt(_4428);
    float _4528 = _4524;
    if (!_4446)
    {
        _4518 = _4436;
    }
    float _4530 = _4518;
    float _4532 = _4530;
    float _4534 = _4500;
    if (_4446)
    {
        float _4536 = _4500 + (-1.0);
        _4512 = _4536;
    }
    float _4538 = _4512;
    float _4540 = _4538;
    if (_4446)
    {
        float _4542 = _4468 * _4524;
        _4528 = _4542;
    }
    float _4544 = _4528;
    if (!_4446)
    {
        _4470 = _4506;
    }
    float _4546 = _4470;
    float _4548 = _4546;
    if (_4446)
    {
        float _4550 = _4538 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4460 = _4550;
    }
    float _4552 = _4460;
    if (_4446)
    {
        float _4554 = _4434 * _4544;
        _4520 = _4554;
    }
    float _4556 = _4520;
    if (!_4446)
    {
        _4540 = _4438;
    }
    float _4558 = _4540;
    float _4560 = _4558;
    if (_4446)
    {
        float _4562 = _4436 * _4544;
        _4532 = _4562;
    }
    float _4564 = _4532;
    if (_4446)
    {
        float _4566 = fma(_4506, _4500, _4552);
        _4548 = _4566;
    }
    float _4568 = _4548;
    if (_4446)
    {
        float _4570 = _4556 * _4556;
        _4560 = _4570;
    }
    float _4572 = _4560;
    float _4574 = _4350 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_4446)
    {
        _4534 = _4440;
    }
    float _4576 = _4534;
    float _4578 = _4576;
    if (_4446)
    {
        float _4580 = _4564 * _4564;
        _4578 = _4580;
    }
    float _4582 = _4578;
    float _4584 = fma(_4568, _4568, _4572);
    float _4586 = fma(_4352, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4574);
    float _4588 = _4350 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4590 = _4584 + _4582;
    float _4592 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4594 = fma(_4526, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4592);
    float _4596 = precise::clamp(_4594, 0.0, 1.0);
    float _4598 = fma(_4354, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4586);
    float _4600 = rsqrt(_4590);
    float _4602 = -_4596;
    float _4604 = _4602 + 1.0;
    float _4606 = _4598 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4608 = fma(_4352, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4588);
    float _4610 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4612 = fma(_3460, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4614 = _4606 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4616 = abs(_4604);
    float _4618 = log2(_4616);
    float _4620 = _4350 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4622 = -_4614;
    float _4624 = fma(_4622, _4610, 1.0);
    float _4626 = _4350 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4628 = fma(_4352, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4620);
    float _4630 = fma(_4352, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4626);
    float _4632 = _4600 * _4556;
    float _4634 = fma(_4354, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4628);
    float _4636 = _4600 * _4568;
    float _4638 = fma(_4354, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4630);
    float _4640 = _4600 * _4564;
    float _4642 = _4634 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4644 = _4632 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4646 = _4638 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4648 = floor(_4516);
    float _4650 = _4642 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4652 = -_4644;
    float _4654 = fma(_4636, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4652);
    float _4656 = fma(_4354, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4608);
    float _4658 = _4618 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4660 = fma(_4646, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4650);
    float _4662 = -_4640;
    float _4664 = fma(_4662, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4654);
    float _4666 = _4656 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4668 = floor(_4612);
    float _4670 = fma(_4664, -0.5, 0.5);
    float _4672 = fma(_4664, 0.5, 0.5);
    float _4674 = _4642 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4676 = log2(_4624);
    float _4678 = fma(_4646, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4674);
    float _4680 = -_4648;
    float _4682 = _4516 + _4680;
    float _4684 = exp2(_4658);
    float _4686 = fma(_4606, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4660);
    float _4688 = _4642 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4690 = -_4668;
    float _4692 = _4612 + _4690;
    float _4694 = fma(_4672, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4696 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4686);
    float _4698 = fma(_4646, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4688);
    float _4700 = fma(_4606, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4678);
    float _4702 = sqrt(_4670);
    float _4704 = fma(_4672, _4694, -0.212114393711090087890625);
    float _4706 = fma(_4606, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4698);
    float _4708 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4700);
    float _4710 = _4676 * 0.693147182464599609375;
    float _4712 = fma(_4672, _4704, 1.570728778839111328125);
    float _4714 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4706);
    float _4716 = 1.0 / _4696;
    float _4718 = _4636 + 1.0;
    float2 _12080 = float2(_4682, _4692);
    float _4720 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12080, float2(0.0), isnan(_12080)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12080, float2(0.0), isnan(_12080)), level(0.0)).x;
    float _4722 = -_4636;
    float _4724 = fma(_4684, _4718, _4722);
    float _4726 = _4702 * 0.636619746685028076171875;
    float _4728 = fma(_4724, 0.5, 0.5);
    float _4730 = -_4712;
    float _4732 = fma(_4726, _4730, 1.0);
    float _4734 = _4710 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4736 = _4714 * _4716;
    float _4738 = _4708 * _4716;
    float _4740 = fma(_4736, 0.5, 0.5);
    float _4742 = fma(_4738, -0.5, 0.5);
    float3 _12121 = float3(_4740, _4742, _4734);
    float _4744 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12121, float3(0.0), isnan(_12121)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12121, float3(0.0), isnan(_12121)), level(0.0)).x;
    float3 _12132 = float3(_4740, _4742, _4734);
    float4 _4747 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12132, float3(0.0), isnan(_12132)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12132, float3(0.0), isnan(_12132)), level(0.0)).xyzw;
    float _4749 = _4747.x;
    float _4751 = _4747.y;
    float _4753 = _4747.z;
    float _4755 = _4747.w;
    float2 _12148 = float2(_4732, _4728);
    float3 _4759 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12148, float2(0.0), isnan(_12148)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12148, float2(0.0), isnan(_12148)), level(0.0)).xyz;
    float _4761 = _4759.x;
    float _4763 = _4759.y;
    float _4765 = _4759.z;
    float _4767 = abs(_4280);
    float _4769 = log2(_4767);
    float _4771 = _4642 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _4773 = _4526 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4775 = isnan(_4526);
    bool _4777 = _4773 || _4775;
    bool _4779 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4781 = _4777 || _4779;
    float _4783 = fma(_4646, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4771);
    bool _4785 = _4280 <= 8000.0;
    bool _4787 = isnan(_4280);
    bool _4789 = _4785 || _4787;
    bool _4791 = isnan(8000.0);
    bool _4793 = _4789 || _4791;
    float _4795 = float(_4793);
    float _4797 = _4769 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4799 = exp2(_4797);
    float _4801 = fma(_4799, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4803 = precise::clamp(_4801, 0.0, 1.0);
    float _4805 = fma(_4803, -2.0, 3.0);
    float _4807 = _4803 * _4803;
    float _4809 = _4807 * _4805;
    float _4811 = _4618 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4813 = fma(_4606, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4783);
    float _4815 = in.m_86.x;
    float _4817 = -_4809;
    float _4819 = _4817 + 1.0;
    float _4821 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4813);
    float _4823 = exp2(_4811);
    float _4825 = fma(_4819, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4809);
    float _4827 = _4821 + _4696;
    out.gl_Position.x = _4714;
    out.gl_Position.y = _4708;
    out.gl_Position.z = _4821;
    out.gl_Position.w = _4696;
    float _4829 = _4795 * _4825;
    float _4831 = _4827 * 0.5;
    float _4833 = _4410 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4835 = _4829 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_88.z = _4831;
    out.m_88.w = _4696;
    float _4837 = -_4823;
    float _4839 = _4837 + 1.0;
    float _4841 = _4696;
    float _4843 = _4821;
    float _4845 = _4708;
    if (!_4781)
    {
        _4841 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4847 = _4841;
    float _4849 = _4839 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4851 = _4847;
    float _4853 = _4847;
    if (!_4781)
    {
        _4843 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4855 = _4843;
    float _4857 = _4855;
    float _4859 = _4855;
    if (!_4781)
    {
        _4845 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4861 = _4845;
    float _4863 = -_4849;
    float _4865 = _4863 + 1.0;
    float _4867 = -_4720;
    float _4869 = _4867 + 1.0;
    float _4871 = _4869 * _4835;
    float _4873 = precise::clamp(_4871, 0.0, 1.0);
    float _4875 = -_4873;
    float _4877 = fma(_4875, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4879 = _4877 * _4815;
    float _4881 = _4879 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_90.x = _4881;
    float _4883 = _4849 * _4744;
    float _4885 = _4755 * _4865;
    float _4887 = _4865;
    float _4889 = _4749;
    float _4891 = _4861;
    float _4893 = _4861;
    if (!_4781)
    {
        _4887 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4895 = _4887;
    float _4897 = _4755 * _4883;
    float _4899 = _4765 * _4883;
    float _4901 = fma(_4761, _4897, _4749);
    float _4903 = fma(_4763, _4897, _4751);
    float _4905 = fma(_4755, _4899, _4753);
    float _4907 = _4897;
    float _4909 = _4895;
    float _4911 = _4895;
    if (!_4781)
    {
        _4889 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4913 = _4889;
    float _4915 = _4913;
    float _4917 = _4913;
    if (!_4781)
    {
        _4907 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4919 = _4907;
    out.m_92.x = _4901;
    out.m_92.y = _4903;
    out.m_92.z = _4905;
    out.m_92.w = _4885;
    bool _4921 = !_4781;
    float _4923 = _4919;
    float _4925 = _4919;
    if (!_4921)
    {
        bool _4927 = _4526 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4929 = isnan(_4526);
        bool _4931 = _4927 || _4929;
        bool _4933 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4935 = _4931 || _4933;
        if (!_4935)
        {
            float _4937 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4939 = _4526 + _4937;
            float _4941 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4943 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4941;
            float _4945 = 1.0 / _4943;
            float _4947 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4949 = _4947 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4951 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4953 = _4951 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4955 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4957 = _4955 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4959 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4961 = _4959 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4963 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4965 = _4963 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4967 = _4939 * _4945;
            float _4969 = precise::clamp(_4967, 0.0, 1.0);
            float _4971 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4973 = _4971 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4975 = fma(_4969, _4949, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4977 = fma(_4969, _4973, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4979 = fma(_4969, _4953, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4981 = fma(_4969, _4957, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4983 = fma(_4969, _4961, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4985 = fma(_4969, _4965, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4853 = _4977;
            _4911 = _4983;
            _4917 = _4975;
            _4893 = _4981;
            _4859 = _4979;
            _4925 = _4985;
            _4987 = true;
        }
        else
        {
            bool _4989 = _4526 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4991 = isnan(_4526);
            bool _4993 = _4989 || _4991;
            bool _4995 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4997 = _4993 || _4995;
            if (!_4997)
            {
                _4915 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4999 = _4915;
            _4917 = _4999;
            if (!_4997)
            {
                _4851 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5001 = _4851;
            _4853 = _5001;
            if (!_4997)
            {
                _4857 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5003 = _4857;
            _4859 = _5003;
            if (!_4997)
            {
                _4891 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5005 = _4891;
            _4893 = _5005;
            if (!_4997)
            {
                _4909 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5007 = _4909;
            _4911 = _5007;
            if (!_4997)
            {
                _4923 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5009 = _4923;
            bool _5011 = !_4997;
            _4925 = _5009;
            if (!_5011)
            {
                bool _5013 = _4526 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5015 = isnan(_4526);
                bool _5017 = _5013 || _5015;
                bool _5019 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5021 = _5017 || _5019;
                if (!_5021)
                {
                    float _5023 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5025 = _4526 + _5023;
                    float _5027 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5029 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5027;
                    float _5031 = 1.0 / _5029;
                    float _5033 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5035 = _5033 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5037 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5039 = _5037 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5041 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5043 = _5041 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5045 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5047 = _5045 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5049 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5051 = _5049 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5053 = _5025 * _5031;
                    float _5055 = precise::clamp(_5053, 0.0, 1.0);
                    float _5057 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5059 = _5057 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5061 = fma(_5055, _5035, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5063 = fma(_5055, _5059, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5065 = fma(_5055, _5039, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5067 = fma(_5055, _5043, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5069 = fma(_5055, _5047, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5071 = fma(_5055, _5051, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4853 = _5063;
                    _4911 = _5069;
                    _4917 = _5061;
                    _4893 = _5067;
                    _4859 = _5065;
                    _4925 = _5071;
                    _4987 = true;
                }
                else
                {
                    _4853 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4911 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4917 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4893 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4859 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4925 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4987 = false;
    float _5073 = _4853;
    float _5075 = _4911;
    float _5077 = _4917;
    float _5079 = _4893;
    float _5081 = _4859;
    float _5083 = _4925;
    float _5085 = fma(_4004, -0.5, 0.5);
    float _5087 = precise::clamp(_5085, 0.0, 1.0);
    float _5089 = -_5073;
    float _5091 = _5089 + _5075;
    float _5093 = _4833 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5095 = -_5077;
    float _5097 = _5095 + _5079;
    out.m_94.x = 0.0;
    float _5099 = fma(_5087, _5091, _5073);
    float _5101 = fma(_5087, _5097, _5077);
    out.m_51.x = _5093;
    float _5103 = -_5081;
    float _5105 = _5103 + _5083;
    float _5107 = _5099 * 0.586610972881317138671875;
    bool _5109 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5111 = fma(_5087, _5105, _5081);
    float _5113 = fma(_5101, 0.298911988735198974609375, _5107);
    bool _5115 = _4410 > 0.0;
    bool _5117 = isnan(_4410);
    bool _5119 = _5115 || _5117;
    bool _5121 = isnan(0.0);
    bool _5123 = _5119 || _5121;
    float _5125 = fma(_5111, 0.114477999508380889892578125, _5113);
    float _5127 = -_5125;
    float _5129 = _5101 + _5127;
    float _5131 = -_5125;
    float _5133 = _5099 + _5131;
    float _5135 = -_5125;
    float _5137 = _5111 + _5135;
    float _5139 = fma(_5129, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5125);
    float _5141 = fma(_5133, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5125);
    float _5143 = fma(_5137, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5125);
    bool _5145 = !_5109;
    if (!_5145)
    {
        float _5147 = -_4350;
        float _5149 = _5147 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5151 = -_4352;
        float _5153 = _5151 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5155 = -_4354;
        float _5157 = _5155 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5159 = _5149 * _5149;
        float _5161 = fma(_5153, _5153, _5159);
        float _5163 = fma(_5157, _5157, _5161);
        float _5165 = sqrt(_5163);
        float _5167 = rsqrt(_5163);
        float _5169 = -_5165;
        float _5171 = _5169 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5173 = _5171 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5175 = precise::clamp(_5173, 0.0, 1.0);
        float _5177 = _5153 * _5167;
        float _5179 = _5149 * _5167;
        float _5181 = abs(_5175);
        float _5183 = log2(_5181);
        float _5185 = _5157 * _5167;
        float _5187 = _5177 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5189 = _4004 * _5179;
        float _5191 = -_5179;
        float _5193 = -_5187;
        float _5195 = fma(_5191, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5193);
        float _5197 = fma(_4008, _5177, _5189);
        float _5199 = -_5185;
        float _5201 = fma(_5199, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5195);
        float _5203 = fma(_4010, _5185, _5197);
        float _5205 = precise::clamp(_5203, 0.0, 1.0);
        float _5207 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5209 = _5201 + _5207;
        float _5211 = _5183 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5213 = _5209 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5215 = precise::clamp(_5213, 0.0, 1.0);
        float _5217 = exp2(_5211);
        float _5219 = _5217 * _5215;
        float _5221 = _5205 * _5219;
        float _5223 = _5221 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5225 = _5221 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5227 = _5221 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _5223;
        out.m_94.y = _5225;
        out.m_94.z = _5227;
    }
    out.m_96.x = _5139;
    out.m_96.y = _5141;
    out.m_96.z = _5143;
    if (_5123)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _5229 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5229;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4987 = false;
    bool _4062 = false;
    bool _751 = false;
    bool _639 = false;
    bool _255 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_48.w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    float _125 = _123;
    if (!_119)
    {
        out.m_51.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _123 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5286 = as_type<float>(_131);
        out.gl_Position.z = _5286;
    }
    if (!_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = in.m_53.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = _149;
    if (_145)
    {
        float _153 = float(_115);
        _125 = _153;
    }
    float _155 = _125;
    bool _157 = _149 >= _155;
    bool _159 = !_145;
    bool _161 = _157 || _159;
    float _163 = _155;
    if (_161)
    {
        _163 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _163;
    if (_161)
    {
        out.m_51.x = 0.0;
    }
    if (_161)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5356 = as_type<float>(_169);
        out.gl_Position.z = _5356;
    }
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = in.m_58.x;
    float _175 = in.m_58.y;
    float _177 = in.m_58.z;
    float _179 = in.m_60.x;
    float _181 = in.m_60.y;
    float _183 = in.m_60.z;
    float _185 = in.m_62.x;
    float _187 = in.m_62.y;
    float _189 = in.m_62.z;
    float _191 = in.m_64.x;
    float _193 = in.m_64.y;
    float _195 = in.m_64.z;
    int _197 = as_type<int>(_171) & 1;
    bool _199 = _197 != 0;
    int _201 = as_type<int>(_171) & 2;
    bool _203 = _201 != 0;
    bool _205 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _207 = !_199;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_203;
    float _213 = _211 ? (-0.5) : 0.5;
    float _215 = _175 * _181;
    float _217 = _175 * _187;
    float _219 = fma(_173, _179, _215);
    float _221 = _175 * _193;
    float _223 = fma(_173, _185, _217);
    float _225 = fma(_177, _183, _219);
    float _227 = fma(_173, _191, _221);
    float _229 = fma(_177, _189, _223);
    float _231 = fma(_177, _195, _227);
    bool _233 = !_205;
    float _235 = _229;
    float _253;
    if (!_233)
    {
        float _237 = in.m_66.x;
        float _239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _241 = _237 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _245 = _243 * _239;
        float _247 = floor(_245);
        float _249 = -_247;
        float _251 = _245 + _249;
        _253 = _251;
        _255 = true;
    }
    else
    {
        float _257 = float(_115);
        float _259 = 1.0 / _257;
        float _261 = _149 * _259;
        _253 = _261;
    }
    _255 = false;
    float _263 = _253;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _267 = _263 + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _275 = _273 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _277;
    float _281 = 1.0 / _271;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _289 = _287 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _293 = _291 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _295 = 1.0 / _275;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _299 = _263 + _297;
    bool _301 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _303 = isnan(_263);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = 1.0 / _279;
    float _315 = _299 * _281;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = _263 + _317;
    bool _321 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _323 = isnan(_263);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    bool _333 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _335 = isnan(_263);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = 1.0 / _285;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _347;
    float _351 = _267 * _295;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _355 = _263 + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _359 = _263 + _357;
    bool _361 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _363 = 1.0 / _349;
    float _365 = _319 * _313;
    float _367 = -_331;
    float _369 = _367 + 1.0;
    bool _371 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _373 = isnan(_263);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = _343 * _369;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _385;
    float _389 = 1.0 / _289;
    float _391 = _355 * _345;
    float _393 = -_343;
    float _395 = _393 + 1.0;
    bool _397 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _399 = isnan(_263);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = fma(_387, _315, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _411 = 1.0 / _293;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _415 = _263 + _413;
    float _417 = _415 * _363;
    float _419 = _381 * _395;
    float _421 = -_381;
    float _423 = _421 + 1.0;
    float _425 = _359 * _389;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _429 = _263 + _427;
    bool _431 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _433 = isnan(_263);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = _407 * _423;
    float _445 = -_407;
    float _447 = _445 + 1.0;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _449;
    float _453 = _429 * _411;
    float _455 = _441 * _447;
    float _457 = -_441;
    float _459 = _457 + 1.0;
    bool _461 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _463 = isnan(_263);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = fma(_451, _315, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _475 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _477 = isnan(_263);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = _311 * _459;
    float _489 = -_311;
    float _491 = _489 + 1.0;
    float _493 = -_471;
    float _495 = _493 + 1.0;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _501;
    float _505 = _471 * _491;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _507;
    float _511 = _485 * _495;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _515 = _513 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _517 = fma(_503, _365, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _519 = fma(_509, _365, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _521 = _409 * _511;
    float _523 = -_485;
    float _525 = _523 + 1.0;
    float _527 = _473 * _511;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _533 = fma(_499, _351, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _535 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[143].x, _521);
    float _537 = fma(_515, _351, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _543 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[143].y, _527);
    float _545 = fma(_531, _425, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _547 = fma(_541, _425, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _549 = fma(_533, _505, _535);
    float _551 = fma(_537, _505, _543);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _553;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _557;
    float _561 = fma(_519, _487, _549);
    float _563 = fma(_517, _487, _551);
    float _565 = fma(_555, _391, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _567 = fma(_559, _391, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _577 = fma(_545, _455, _561);
    float _579 = fma(_547, _455, _563);
    float _581 = fma(_571, _453, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _583 = fma(_575, _453, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _585;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _589;
    float _593 = fma(_565, _443, _577);
    float _595 = fma(_567, _443, _579);
    float _597 = fma(_587, _417, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _599 = fma(_591, _417, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _601 = fma(_581, _419, _593);
    float _603 = fma(_583, _419, _595);
    float _605 = fma(_597, _383, _601);
    float _607 = fma(_599, _383, _603);
    float _609 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[150].x, _605);
    float _611 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[150].y, _607);
    bool _613 = !_361;
    int _615 = as_type<int>(_521);
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _637;
    if (!_613)
    {
        float _621 = in.m_66.x;
        float _623 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _625 = _621 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _627 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _629 = _627 * _623;
        float _631 = floor(_629);
        float _633 = -_631;
        float _635 = _629 + _633;
        _637 = _635;
        _639 = true;
    }
    else
    {
        float _641 = float(_115);
        float _643 = 1.0 / _641;
        float _645 = _149 * _643;
        _637 = _645;
    }
    _639 = false;
    float _647 = _637;
    float _649 = in.m_68.x;
    float _651 = in.m_68.y;
    bool _653 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _655 = isnan(_647);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _669 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _671 = isnan(_647);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _681;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _687 = _647 + _685;
    float _689 = -_663;
    float _691 = _689 + 1.0;
    float _693 = 1.0 / _667;
    float _695 = _679 * _691;
    float _697 = -_679;
    float _699 = _697 + 1.0;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _705 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _709 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _707 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _715 = _611 * _651;
    float _717 = _609 * _649;
    float _719 = _683 * _693;
    float _721 = fma(_719, _687, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _723 = _721 * _695;
    float _725 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[115].x, _723);
    float _727 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[116].x, _725);
    float _729 = _727 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_70.x = _709;
    out.m_70.y = _713;
    out.m_70.z = _711;
    out.m_70.w = _729;
    bool _731 = !_705;
    float _749;
    if (!_731)
    {
        float _733 = in.m_66.x;
        float _735 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _737 = _733 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _739 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[11].w, _149);
        float _741 = _739 * _735;
        float _743 = floor(_741);
        float _745 = -_743;
        float _747 = _741 + _745;
        _749 = _747;
        _751 = true;
    }
    else
    {
        float _753 = float(_115);
        float _755 = 1.0 / _753;
        float _757 = _149 * _755;
        _749 = _757;
    }
    _751 = false;
    float _759 = _749;
    float _761 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _763 = int(_761);
    float _765 = float(_115);
    float _767 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _769 = int(_767);
    float _771 = float(_763);
    float _773 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _775 = int(_773);
    float _777 = float(uint(_769));
    float _779 = 1.0 / _771;
    float _781 = float(_769);
    int _783 = ~_769;
    int _785 = _783 + 1;
    float _787 = 1.0 / _777;
    float _789 = float(_775);
    float _791 = _779 * _149;
    float _793 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _795 = int(_793);
    int _797 = as_type<int>(_787) + (-2);
    float _799 = trunc(_791);
    int _801 = int(_799);
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _805 = _803 != 0;
    float _807 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _809 = int(_807);
    float _811 = float(_795);
    float _813 = float(uint(_801));
    float _815 = 1.0 / _765;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _819 = _815;
    if (_805)
    {
        float _821 = in.m_66.x;
        _817 = _821;
    }
    float _823 = _817;
    if (_805)
    {
        _615 = 0;
    }
    int _825 = _615;
    float _827 = as_type<float>(_797) * _813;
    int _829 = _825;
    if (_805)
    {
        _617 = 0;
    }
    int _831 = _617;
    float _833 = float(uint(_809));
    float _835 = trunc(_827);
    float _837 = precise::max(_835, 0.0);
    uint _840 = uint(_837);
    float _842 = 1.0 / _789;
    float _844 = 1.0 / _811;
    float _846 = _823;
    int _848 = _831;
    if (_805)
    {
        _619 = _823;
    }
    float _850 = _619;
    float _852 = 1.0 / _833;
    int _854 = ~_769;
    int _856 = _854 + 1;
    float _858 = _842 * _149;
    int _860 = _856 * int(_840);
    int _862 = _860 + _801;
    float _864 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _866 = int(_864);
    float _868 = _815 * _149;
    float _870 = _844 * _149;
    float _872 = float(uint(_862));
    float _874 = in.m_66.x;
    float _876 = in.m_66.y;
    float _878 = in.m_66.z;
    float _880 = in.m_66.w;
    float _882 = _781 * _868;
    float _884 = _872;
    float _886 = _850;
    if (_805)
    {
        _819 = 1.0;
    }
    float _888 = _819;
    float _890 = as_type<float>(_797) * _872;
    float _892 = trunc(_858);
    int _894 = int(_892);
    float _896 = _888;
    if (_805)
    {
        _884 = 1.0;
    }
    float _898 = _884;
    float _900 = float(uint(_866));
    float _902 = trunc(_882);
    int _904 = int(_902);
    float _906 = trunc(_870);
    int _908 = int(_906);
    float _910 = trunc(_890);
    float _912 = precise::max(_910, 0.0);
    uint _914 = uint(_912);
    float _916 = 1.0 / _900;
    float _918 = _900;
    float _920 = _898;
    if (_805)
    {
        _918 = 1.0;
    }
    float _922 = _918;
    float _924 = _922;
    if (!_805)
    {
        float _926 = in.m_66.y;
        float _928 = in.m_66.z;
        _920 = 7.345489978790283203125;
        _896 = 1.2345600128173828125;
        _846 = _926;
        _924 = 5.839270114898681640625;
        _886 = _928;
        _829 = 1;
        _848 = 2;
    }
    float _930 = _920;
    float _932 = _896;
    float _934 = _846;
    float _936 = _924;
    float _938 = _886;
    int _940 = _829;
    int _942 = _848;
    float _944 = _930 * _874;
    int _946 = int(_840) + int(_914);
    float _948 = _932 * _934;
    float _950 = _936 * _938;
    float _952 = float(_801);
    float _954 = floor(_944);
    int _956 = as_type<int>(_852) + (-2);
    int _958 = _785 * _946;
    int _960 = _958 + _801;
    bool _962 = _952 >= _781;
    bool _964 = isnan(_952);
    bool _966 = _962 || _964;
    bool _968 = isnan(_781);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    float _974 = _717 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _976 = float(uint(_894));
    int _978 = as_type<int>(_916) + (-2);
    float _980 = trunc(_972);
    int _982 = int(_980);
    float _984 = float(uint(_908));
    bool _986 = uint(_960) >= uint(_769);
    float _988 = as_type<float>(_956) * _976;
    bool _990 = _876 > 0.5;
    float _992 = as_type<float>(_978) * _984;
    bool _994 = !_986;
    int _996 = _994 ? 0 : (-1);
    float _998 = -_954;
    float _1000 = _944 + _998;
    float _1002 = trunc(_988);
    float _1004 = precise::max(_1002, 0.0);
    uint _1006 = uint(_1004);
    int _1008 = ~_946;
    int _1010 = _1008 + _996;
    int _1012 = _1010 + 1;
    float _1014 = _1000 * _781;
    bool _1016 = _769 == 0;
    bool _1018 = _878 > 0.5;
    int _1020 = _769 * _1012;
    int _1022 = _1020 + _801;
    int _1024 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1026 = _1024 != 0;
    float _1028 = trunc(_992);
    float _1030 = precise::max(_1028, 0.0);
    uint _1032 = uint(_1030);
    float _1034 = -_209;
    int _1036 = _990 ? as_type<int>(_1034) : as_type<int>(_209);
    int _1038 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1040 = _1038 != 0;
    int _1042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1044 = _1042 != 0;
    int _1046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1048 = _1046 != 0;
    float _1050 = -_213;
    int _1052 = _1018 ? as_type<int>(_1050) : as_type<int>(_213);
    float _1054 = floor(_948);
    bool _1056 = !_1048;
    float _1058 = _1056 ? _213 : as_type<float>(_1052);
    int _1060 = ~_982;
    int _1062 = _1060 + 1;
    int _1064 = _1062 + 1;
    bool _1066 = !_1016;
    int _1068 = _1066 ? _1022 : (-1);
    bool _1070 = !_1044;
    float _1072 = _1070 ? _209 : as_type<float>(_1036);
    float _1074 = floor(_950);
    int _1076 = ~_809;
    int _1078 = _1076 + 1;
    int _1080 = _1068 * _1064;
    int _1082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1084 = _1082 != 0;
    int _1086 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1088 = _1086 != 0;
    int _1090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1092 = _1090 != 0;
    int _1094 = _769 + (-1);
    int _1096 = _1078 * int(_1006);
    int _1098 = _1096 + _894;
    bool _1100 = !_1026;
    int _1102 = _1100 ? 0 : 1;
    float _1104 = trunc(_1014);
    int _1106 = int(_1104);
    bool _1108 = !_1088;
    int _1110 = _1108 ? 0 : 1;
    int _1112 = _982 * _1094;
    int _1114 = _1112 + _1080;
    bool _1116 = _880 > 0.5;
    float _1118 = -_1054;
    float _1120 = _948 + _1118;
    bool _1122 = !_1084;
    int _1124 = _1122 ? 0 : 1;
    int _1126 = abs(_1110);
    float _1128 = -_1074;
    float _1130 = _950 + _1128;
    float _1132 = float(uint(_1098));
    bool _1134 = !_1092;
    int _1136 = _1134 ? 0 : 1;
    int _1138 = _1114 * _1126;
    int _1140 = ~_866;
    int _1142 = _1140 + 1;
    float _1144 = as_type<float>(_956) * _1132;
    int _1146 = abs(_1124);
    int _1148 = abs(_1136);
    float _1150 = trunc(_1144);
    float _1152 = precise::max(_1150, 0.0);
    uint _1154 = uint(_1152);
    int _1156 = _1142 * int(_1032);
    int _1158 = _1156 + _908;
    int _1160 = abs(_1102);
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1164 = _1162 != 0;
    int _1166 = _904 * _1146;
    int _1168 = _1166 + _1138;
    float _1170 = float(uint(_1158));
    int _1172 = _1106 * _1160;
    int _1174 = _1172 + _801;
    int _1176 = ~_809;
    int _1178 = _1176 + 1;
    float _1180 = as_type<float>(_978) * _1170;
    bool _1182 = !_1164;
    int _1184 = _1182 ? 0 : 1;
    int _1186 = _1174 * _1148;
    int _1188 = _1186 + _1168;
    float _1190 = float(_809);
    float _1192 = trunc(_1180);
    float _1194 = precise::max(_1192, 0.0);
    uint _1196 = uint(_1194);
    int _1198 = int(_1006) + int(_1154);
    float _1200 = float(_894);
    float _1202 = _1120 * _1190;
    int _1204 = abs(_1184);
    int _1206 = _1178 * _1198;
    int _1208 = _1206 + _894;
    bool _1210 = _1200 >= _1190;
    bool _1212 = isnan(_1200);
    bool _1214 = _1210 || _1212;
    bool _1216 = isnan(_1190);
    bool _1218 = _1214 || _1216;
    float _1220 = float(_1218);
    float _1222 = _1190 * _868;
    float _1224 = float(_866);
    int _1226 = _1106 * _1204;
    int _1228 = _1226 + _1188;
    int _1230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1232 = _1230 != 0;
    float _1234 = trunc(_1202);
    int _1236 = int(_1234);
    float _1238 = float(_908);
    float _1240 = _1224 * _868;
    bool _1242 = uint(_1208) >= uint(_809);
    float _1244 = _1130 * _1224;
    int _1246 = int(_1032) + int(_1196);
    bool _1248 = !_1232;
    int _1250 = _1248 ? 0 : 1;
    float _1252 = trunc(_1220);
    int _1254 = int(_1252);
    bool _1256 = _1238 >= _1224;
    bool _1258 = isnan(_1238);
    bool _1260 = _1256 || _1258;
    bool _1262 = isnan(_1224);
    bool _1264 = _1260 || _1262;
    float _1266 = float(_1264);
    float _1268 = -_213;
    int _1270 = _1116 ? as_type<int>(_1268) : as_type<int>(_213);
    float _1272 = float(uint(_1228));
    bool _1274 = !_1242;
    int _1276 = _1274 ? 0 : (-1);
    float _1278 = trunc(_1222);
    int _1280 = int(_1278);
    int _1282 = abs(_1250);
    bool _1284 = !_1040;
    float _1286 = _1284 ? _213 : as_type<float>(_1270);
    float _1288 = as_type<float>(_797) * _1272;
    int _1290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1292 = _1290 != 0;
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1296 = _1294 != 0;
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1300 = _1298 != 0;
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1304 = _1302 != 0;
    int _1306 = ~_1198;
    int _1308 = _1306 + _1276;
    int _1310 = _1308 + 1;
    float _1312 = trunc(_1266);
    int _1314 = int(_1312);
    int _1316 = ~_866;
    int _1318 = _1316 + 1;
    bool _1320 = !_1296;
    int _1322 = _1320 ? 0 : 1;
    int _1324 = _809 * _1310;
    int _1326 = _1324 + _894;
    bool _1328 = _809 == 0;
    int _1330 = _1318 * _1246;
    int _1332 = _1330 + _908;
    float _1334 = trunc(_1288);
    float _1336 = precise::max(_1334, 0.0);
    uint _1338 = uint(_1336);
    int _1340 = ~_1254;
    int _1342 = _1340 + 1;
    int _1344 = _1342 + 1;
    bool _1346 = !_1328;
    int _1348 = _1346 ? _1326 : (-1);
    int _1350 = _1236 * _1282;
    int _1352 = _1350 + _894;
    int _1354 = ~_769;
    int _1356 = _1354 + 1;
    int _1358 = _809 + (-1);
    int _1360 = _1348 * _1344;
    bool _1362 = !_1292;
    int _1364 = _1362 ? 0 : 1;
    float _1366 = trunc(_1240);
    int _1368 = int(_1366);
    bool _1370 = uint(_1332) >= uint(_866);
    int _1372 = _1254 * _1358;
    int _1374 = _1372 + _1360;
    int _1376 = abs(_1322);
    bool _1378 = !_1370;
    int _1380 = _1378 ? 0 : (-1);
    int _1382 = _1356 * int(_1338);
    int _1384 = _1382 + _1228;
    int _1386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1388 = _1386 != 0;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1392 = _1390 != 0;
    int _1394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1396 = _1394 != 0;
    int _1398 = _1374 * _1376;
    int _1400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1402 = _1400 != 0;
    float _1404 = float(uint(_1384));
    int _1406 = abs(_1364);
    float _1408 = trunc(_1244);
    int _1410 = int(_1408);
    int _1412 = ~_1246;
    int _1414 = _1412 + _1380;
    int _1416 = _1414 + 1;
    float _1418 = as_type<float>(_797) * _1404;
    float _1420 = float(uint(_1174));
    int _1422 = _1280 * _1406;
    int _1424 = _1422 + _1398;
    bool _1426 = !_1402;
    int _1428 = _1426 ? 0 : 1;
    bool _1430 = !_1300;
    int _1432 = _1430 ? 0 : 1;
    float _1434 = as_type<float>(_797) * _1420;
    int _1436 = abs(_1428);
    float _1438 = trunc(_1418);
    float _1440 = precise::max(_1438, 0.0);
    uint _1442 = uint(_1440);
    bool _1444 = !_1304;
    int _1446 = _1444 ? 0 : 1;
    int _1448 = _866 * _1416;
    int _1450 = _1448 + _908;
    int _1452 = abs(_1432);
    int _1454 = abs(_1446);
    float _1456 = trunc(_1434);
    float _1458 = precise::max(_1456, 0.0);
    uint _1460 = uint(_1458);
    int _1462 = _1410 * _1436;
    int _1464 = _1462 + _908;
    bool _1466 = _866 == 0;
    int _1468 = ~_1314;
    int _1470 = _1468 + 1;
    int _1472 = _1470 + 1;
    int _1474 = _1352 * _1452;
    int _1476 = _1474 + _1424;
    bool _1478 = !_1466;
    int _1480 = _1478 ? _1450 : (-1);
    int _1482 = ~_769;
    int _1484 = _1482 + 1;
    int _1486 = _1236 * _1454;
    int _1488 = _1486 + _1476;
    int _1490 = ~_769;
    int _1492 = _1490 + 1;
    int _1494 = _1480 * _1472;
    bool _1496 = !_1392;
    int _1498 = _1496 ? 0 : 1;
    int _1500 = _866 + (-1);
    int _1502 = _1484 * int(_1460);
    int _1504 = _1502 + _1174;
    int _1506 = int(_1338) + int(_1442);
    int _1508 = _1314 * _1500;
    int _1510 = _1508 + _1494;
    int _1512 = abs(_1498);
    float _1514 = float(uint(_1488));
    float _1516 = float(uint(_1504));
    int _1518 = _1492 * _1506;
    int _1520 = _1518 + _1228;
    int _1522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1524 = _1522 != 0;
    float _1526 = as_type<float>(_956) * _1514;
    int _1528 = _1510 * _1512;
    float _1530 = as_type<float>(_797) * _1516;
    bool _1532 = !_1388;
    int _1534 = _1532 ? 0 : 1;
    float _1536 = float(uint(_1352));
    float _1538 = trunc(_1526);
    float _1540 = precise::max(_1538, 0.0);
    uint _1542 = uint(_1540);
    bool _1544 = uint(_1520) >= uint(_769);
    bool _1546 = !_1396;
    int _1548 = _1546 ? 0 : 1;
    float _1550 = as_type<float>(_956) * _1536;
    int _1552 = abs(_1534);
    int _1554 = abs(_1548);
    float _1556 = trunc(_1530);
    float _1558 = precise::max(_1556, 0.0);
    uint _1560 = uint(_1558);
    bool _1562 = !_1524;
    int _1564 = _1562 ? 0 : 1;
    int _1566 = ~_809;
    int _1568 = _1566 + 1;
    int _1570 = _1368 * _1552;
    int _1572 = _1570 + _1528;
    int _1574 = abs(_1564);
    float _1576 = trunc(_1550);
    float _1578 = precise::max(_1576, 0.0);
    uint _1580 = uint(_1578);
    bool _1582 = !_1544;
    int _1584 = _1582 ? 0 : (-1);
    int _1586 = _1464 * _1554;
    int _1588 = _1586 + _1572;
    int _1590 = _1568 * int(_1542);
    int _1592 = _1590 + _1488;
    int _1594 = ~_1506;
    int _1596 = _1594 + _1584;
    int _1598 = _1596 + 1;
    int _1600 = _1410 * _1574;
    int _1602 = _1600 + _1588;
    float _1604 = float(uint(_1592));
    int _1606 = _769 * _1598;
    int _1608 = _1606 + _1228;
    bool _1610 = _769 == 0;
    int _1612 = int(_1460) + int(_1560);
    float _1614 = as_type<float>(_956) * _1604;
    bool _1616 = !_1610;
    int _1618 = _1616 ? _1608 : (-1);
    int _1620 = _1568 * int(_1580);
    int _1622 = _1620 + _1352;
    float _1624 = float(uint(_1602));
    float _1626 = trunc(_1614);
    float _1628 = precise::max(_1626, 0.0);
    uint _1630 = uint(_1628);
    int _1632 = _1618 & 3;
    bool _1634 = _1632 != 0;
    float _1636 = float(uint(_1622));
    float _1638 = as_type<float>(_978) * _1624;
    int _1640 = _1618 & 3;
    bool _1642 = _1640 != 0;
    int _1644 = _1634 ? 0 : 1;
    float _1646 = as_type<float>(_956) * _1636;
    float _1648 = float(uint(_1464));
    float _1650 = trunc(_1638);
    float _1652 = precise::max(_1650, 0.0);
    uint _1654 = uint(_1652);
    bool _1656 = uint(_1640) > 1u;
    int _1658 = ~_866;
    int _1660 = _1658 + 1;
    float _1662 = as_type<float>(_978) * _1648;
    int _1664 = ~_1644;
    int _1666 = _1664 + 1;
    int _1668 = _1666 + 1;
    float _1670 = trunc(_1646);
    float _1672 = precise::max(_1670, 0.0);
    uint _1674 = uint(_1672);
    int _1676 = int(_1542) + int(_1630);
    int _1678 = ~_769;
    int _1680 = _1678 + 1;
    int _1682 = ~_809;
    int _1684 = _1682 + 1;
    int _1686 = _1668;
    if (!_1656)
    {
        int _1688 = ~_1644;
        int _1690 = _1688 + 1;
        _1686 = _1690;
    }
    int _1692 = _1686;
    int _1694 = _1660 * int(_1654);
    int _1696 = _1694 + _1602;
    bool _1698 = uint(_1640) >= 2u;
    int _1700 = _1680 * _1612;
    int _1702 = _1700 + _1174;
    float _1704 = trunc(_1662);
    float _1706 = precise::max(_1704, 0.0);
    uint _1708 = uint(_1706);
    int _1710 = ~_866;
    int _1712 = _1710 + 1;
    float _1714 = float(uint(_1696));
    int _1716 = _1698 ? 0 : 1;
    bool _1718 = uint(_1702) >= uint(_769);
    float _1720 = as_type<float>(_978) * _1714;
    int _1722 = _1684 * _1676;
    int _1724 = _1722 + _1488;
    int _1726 = ~_1716;
    int _1728 = _1726 + 1;
    int _1730 = _1728 + 1;
    bool _1732 = !_1718;
    int _1734 = _1732 ? 0 : (-1);
    bool _1736 = uint(_1724) >= uint(_809);
    float _1738 = trunc(_1720);
    float _1740 = precise::max(_1738, 0.0);
    uint _1742 = uint(_1740);
    int _1744 = ~_1612;
    int _1746 = _1744 + _1734;
    int _1748 = _1746 + 1;
    int _1750 = _1712 * int(_1708);
    int _1752 = _1750 + _1464;
    bool _1754 = !_1736;
    int _1756 = _1754 ? 0 : (-1);
    bool _1758 = _1640 != 3;
    int _1760 = _769 * _1748;
    int _1762 = _1760 + _1174;
    int _1764 = ~_1676;
    int _1766 = _1764 + _1756;
    int _1768 = _1766 + 1;
    float _1770 = float(uint(_1752));
    int _1772 = ~_866;
    int _1774 = _1772 + 1;
    int _1776 = _809 * _1768;
    int _1778 = _1776 + _1488;
    bool _1780 = !_1642;
    int _1782 = _1780 ? 0 : 1;
    float _1784 = as_type<float>(_978) * _1770;
    bool _1786 = !_1610;
    int _1788 = _1786 ? _1762 : (-1);
    bool _1790 = !_1328;
    int _1792 = _1790 ? _1778 : (-1);
    float _1794 = trunc(_1784);
    float _1796 = precise::max(_1794, 0.0);
    uint _1798 = uint(_1796);
    int _1800 = int(_1654) + int(_1742);
    int _1802 = _1730;
    if (_1758)
    {
        int _1804 = ~_1716;
        int _1806 = _1804 + 1;
        _1802 = _1806;
    }
    int _1808 = _1802;
    int _1810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1812 = _1810 != 0;
    int _1814 = _1774 * _1800;
    int _1816 = _1814 + _1602;
    int _1818 = _1792 & 3;
    bool _1820 = _1818 != 0;
    int _1822 = _1792 & 3;
    bool _1824 = _1822 != 0;
    bool _1826 = !_1812;
    int _1828 = _1826 ? 0 : 1;
    bool _1830 = uint(_1818) > 1u;
    int _1832 = _1824 ? 0 : 1;
    bool _1834 = uint(_1816) >= uint(_866);
    int _1836 = ~_1832;
    int _1838 = _1836 + 1;
    int _1840 = _1838 + 1;
    bool _1842 = !_1834;
    int _1844 = _1842 ? 0 : (-1);
    bool _1846 = _1640 != 3;
    int _1848 = ~_1800;
    int _1850 = _1848 + _1844;
    int _1852 = _1850 + 1;
    int _1854 = _1840;
    if (!_1830)
    {
        int _1856 = ~_1832;
        int _1858 = _1856 + 1;
        _1854 = _1858;
    }
    int _1860 = _1854;
    bool _1862 = uint(_1818) >= 2u;
    int _1864 = _866 * _1852;
    int _1866 = _1864 + _1602;
    int _1868 = int(_1580) + int(_1674);
    int _1870 = ~_809;
    int _1872 = _1870 + 1;
    int _1874 = _1792 >> 31;
    bool _1876 = !_1846;
    int _1878 = _1876 ? 0 : (-1);
    int _1880 = _1872 * _1868;
    int _1882 = _1880 + _1352;
    int _1884 = _1862 ? 0 : 1;
    bool _1886 = _1818 != 3;
    bool _1888 = _1818 != 3;
    int _1890 = _1874 & 3;
    bool _1892 = !_1466;
    int _1894 = _1892 ? _1866 : (-1);
    bool _1896 = !_1820;
    int _1898 = _1896 ? 0 : 1;
    int _1900 = _1792 + _1890;
    bool _1902 = uint(_1882) >= uint(_809);
    int _1904 = _1894 >> 31;
    int _1906 = _1618 >> 31;
    int _1908 = _1904 & 3;
    int _1910 = _1906 & 3;
    int _1912 = ~_1884;
    int _1914 = _1912 + 1;
    int _1916 = _1914 + 1;
    int _1918 = _1916;
    if (_1886)
    {
        int _1920 = ~_1884;
        int _1922 = _1920 + 1;
        _1918 = _1922;
    }
    int _1924 = _1918;
    bool _1926 = !_1888;
    int _1928 = _1926 ? 0 : (-1);
    int _1930 = _1618 + _1910;
    int _1932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1934 = _1932 != 0;
    int _1936 = _1894 & 3;
    bool _1938 = _1936 != 0;
    int _1940 = _1894 + _1908;
    int _1942 = _1894 & 3;
    bool _1944 = _1942 != 0;
    float _1946 = in.m_48.x;
    float _1948 = in.m_48.y;
    float _1950 = in.m_48.z;
    int _1952 = int(_1708) + int(_1798);
    bool _1954 = !_1934;
    int _1956 = _1954 ? 0 : 1;
    int _1958 = _1930 >> 2;
    bool _1960 = !_1902;
    int _1962 = _1960 ? 0 : (-1);
    bool _1964 = uint(_1942) > 1u;
    int _1966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1968 = _1966 != 0;
    int _1970 = _1958 << 4;
    int _1972 = _1970 + 368;
    int _1974 = _1900 >> 2;
    bool _1976 = !_1968;
    int _1978 = _1976 ? 0 : 1;
    uint _1980 = uint(int(uint(_1972) >> uint(2)));
    uint _1982 = uint(int(uint(int(_1980)) >> uint(2)));
    int _1984 = int(_1980) & 3;
    float _1986 = (*spvDescriptorSet0.vp_c9)._m0[int(_1982)][_1984];
    int _1988 = int(_1980) + 1;
    uint _1990 = uint(int(uint(_1988) >> uint(2)));
    int _1992 = _1988 & 3;
    float _1994 = (*spvDescriptorSet0.vp_c9)._m0[int(_1990)][_1992];
    int _1996 = ~_866;
    int _1998 = _1996 + 1;
    bool _2000 = _1942 != 3;
    int _2002 = _1938 ? 0 : 1;
    int _2004 = _1998 * _1952;
    int _2006 = _2004 + _1464;
    int _2008 = _1974 << 4;
    int _2010 = _2008 + 512;
    float _2012 = _193 * _1948;
    int _2014 = _1940 >> 2;
    float _2016 = _181 * _1948;
    bool _2018 = uint(_1942) >= 2u;
    uint _2020 = uint(int(uint(_2010) >> uint(2)));
    uint _2022 = uint(int(uint(int(_2020)) >> uint(2)));
    int _2024 = int(_2020) & 3;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[int(_2022)][_2024];
    int _2028 = int(_2020) + 1;
    uint _2030 = uint(int(uint(_2028) >> uint(2)));
    int _2032 = _2028 & 3;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[int(_2030)][_2032];
    int _2036 = ~_2002;
    int _2038 = _2036 + 1;
    int _2040 = _2038 + 1;
    float _2042 = fma(_179, _1946, _2016);
    int _2044 = _2040;
    if (!_1964)
    {
        int _2046 = ~_2002;
        int _2048 = _2046 + 1;
        _2044 = _2048;
    }
    int _2050 = _2044;
    float _2052 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2054 = int(_2052);
    int _2056 = _2014 << 4;
    int _2058 = _2056 + 656;
    bool _2060 = _1942 != 3;
    int _2062 = _2018 ? 0 : 1;
    uint _2064 = uint(int(uint(_2058) >> uint(2)));
    uint _2066 = uint(int(uint(int(_2064)) >> uint(2)));
    int _2068 = int(_2064) & 3;
    float _2070 = (*spvDescriptorSet0.vp_c9)._m0[int(_2066)][_2068];
    int _2072 = int(_2064) + 1;
    uint _2074 = uint(int(uint(_2072) >> uint(2)));
    int _2076 = _2072 & 3;
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[int(_2074)][_2076];
    bool _2080 = uint(_2006) >= uint(_866);
    bool _2082 = !_1944;
    int _2084 = _2082 ? 0 : 1;
    int _2086 = ~_2062;
    int _2088 = _2086 + 1;
    int _2090 = _2088 + 1;
    int _2092 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2094 = _2092 != 0;
    int _2096 = _2090;
    if (_2000)
    {
        int _2098 = ~_2062;
        int _2100 = _2098 + 1;
        _2096 = _2100;
    }
    int _2102 = _2096;
    bool _2104 = !_2060;
    int _2106 = _2104 ? 0 : (-1);
    bool _2108 = !_2080;
    int _2110 = _2108 ? 0 : (-1);
    int _2112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2114 = _2112 != 0;
    int _2116 = _1972 + 8;
    uint _2118 = uint(int(uint(_2116) >> uint(2)));
    uint _2120 = uint(int(uint(int(_2118)) >> uint(2)));
    int _2122 = int(_2118) & 3;
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[int(_2120)][_2122];
    int _2126 = int(_2118) + 1;
    uint _2128 = uint(int(uint(_2126) >> uint(2)));
    int _2130 = _2126 & 3;
    float _2132 = (*spvDescriptorSet0.vp_c9)._m0[int(_2128)][_2130];
    int _2134 = ~_1868;
    int _2136 = _2134 + _1962;
    int _2138 = _2136 + 1;
    int _2140 = ~_1952;
    int _2142 = _2140 + _2110;
    int _2144 = _2142 + 1;
    float _2146 = fma(_191, _1946, _2012);
    int _2148 = abs(_1692);
    int _2150 = _809 * _2138;
    int _2152 = _2150 + _1352;
    int _2154 = abs(_2050);
    int _2156 = _2010 + 8;
    uint _2158 = uint(int(uint(_2156) >> uint(2)));
    uint _2160 = uint(int(uint(int(_2158)) >> uint(2)));
    int _2162 = int(_2158) & 3;
    float _2164 = (*spvDescriptorSet0.vp_c9)._m0[int(_2160)][_2162];
    int _2166 = int(_2158) + 1;
    uint _2168 = uint(int(uint(_2166) >> uint(2)));
    int _2170 = _2166 & 3;
    float _2172 = (*spvDescriptorSet0.vp_c9)._m0[int(_2168)][_2170];
    int _2174 = _866 * _2144;
    int _2176 = _2174 + _1464;
    int _2178 = abs(_1860);
    int _2180 = abs(_1782);
    int _2182 = _2058 + 8;
    uint _2184 = uint(int(uint(_2182) >> uint(2)));
    uint _2186 = uint(int(uint(int(_2184)) >> uint(2)));
    int _2188 = int(_2184) & 3;
    float _2190 = (*spvDescriptorSet0.vp_c9)._m0[int(_2186)][_2188];
    int _2192 = int(_2184) + 1;
    uint _2194 = uint(int(uint(_2192) >> uint(2)));
    int _2196 = _2192 & 3;
    float _2198 = (*spvDescriptorSet0.vp_c9)._m0[int(_2194)][_2196];
    int _2200 = ~_2148;
    int _2202 = _2200 + 1;
    int _2204 = _2202 + 1;
    int _2206 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2208 = _2206 != 0;
    float _2210 = _187 * _1948;
    int _2212 = ~_2180;
    int _2214 = _2212 + 1;
    int _2216 = _2214 + 1;
    int _2218 = _2204 * as_type<int>(_1994);
    int _2220 = ~_2178;
    int _2222 = _2220 + 1;
    int _2224 = _2222 + 1;
    float _2226 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2228 = int(_2226);
    int _2230 = abs(_1898);
    int _2232 = _2216 * as_type<int>(_1986);
    int _2234 = _2232 + _2218;
    int _2236 = abs(_2084);
    int _2238 = _2224 * as_type<int>(_2034);
    int _2240 = ~_2230;
    int _2242 = _2240 + 1;
    int _2244 = _2242 + 1;
    float _2246 = fma(_185, _1946, _2210);
    int _2248 = abs(_1924);
    float _2250 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2252 = int(_2250);
    int _2254 = ~_2154;
    int _2256 = _2254 + 1;
    int _2258 = _2256 + 1;
    int _2260 = _2244 * as_type<int>(_2026);
    int _2262 = _2260 + _2238;
    int _2264 = abs(_1808);
    float _2266 = fma(_189, _1950, _2246);
    int _2268 = _2258 * as_type<int>(_2078);
    int _2270 = ~_2264;
    int _2272 = _2270 + 1;
    int _2274 = _2272 + 1;
    int _2276 = ~_2236;
    int _2278 = _2276 + 1;
    int _2280 = _2278 + 1;
    int _2282 = abs(_2102);
    int _2284 = ~_2248;
    int _2286 = _2284 + 1;
    int _2288 = _2286 + 1;
    int _2290 = _2280 * as_type<int>(_2070);
    int _2292 = _2290 + _2268;
    int _2294 = ~_2282;
    int _2296 = _2294 + 1;
    int _2298 = _2296 + 1;
    int _2300 = _2274 * as_type<int>(_2124);
    int _2302 = _2300 + _2234;
    int _2304 = abs(_2106);
    float _2306 = float(uint(_2228));
    int _2308 = abs(_1828);
    int _2310 = _2288 * as_type<int>(_2164);
    int _2312 = _2310 + _2262;
    int _2314 = abs(_1878);
    float _2316 = 1.0 / _2306;
    int _2318 = abs(_1928);
    int _2320 = ~_2314;
    int _2322 = _2320 + 1;
    int _2324 = _2322 + 1;
    int _2326 = _2298 * as_type<int>(_2190);
    int _2328 = _2326 + _2292;
    int _2330 = ~_2304;
    int _2332 = _2330 + 1;
    int _2334 = _2332 + 1;
    float _2336 = _874 * 2.0;
    float _2338 = float(uint(_2252));
    int _2340 = _2324 * as_type<int>(_2132);
    int _2342 = _2340 + _2302;
    int _2344 = ~_2318;
    int _2346 = _2344 + 1;
    int _2348 = _2346 + 1;
    int _2350 = _2334 * as_type<int>(_2198);
    int _2352 = _2350 + _2328;
    int _2354 = ~_2308;
    int _2356 = _2354 + 1;
    int _2358 = _2356 + 1;
    float _2360 = floor(_2336);
    int _2362 = abs(_1978);
    int _2364 = _2348 * as_type<int>(_2172);
    int _2366 = _2364 + _2312;
    float _2368 = float(uint(_2054));
    int _2370 = _2342 * _2358;
    int _2372 = abs(_1956);
    int _2374 = ~_2362;
    int _2376 = _2374 + 1;
    int _2378 = _2376 + 1;
    float _2380 = 1.0 / _2338;
    int _2382 = _1788 * _2308;
    int _2384 = _2382 + _2370;
    int _2386 = abs(_2228);
    int _2388 = _2352 * _2378;
    int _2390 = as_type<int>(_2316) + (-2);
    float _2392 = float(uint(_2386));
    float _2394 = 1.0 / _2368;
    int _2396 = abs(_2054);
    bool _2398 = !_1328;
    int _2400 = _2398 ? _2152 : (-1);
    float _2402 = float(uint(_2384));
    float _2404 = 1.0 / _2392;
    int _2406 = ~_2372;
    int _2408 = _2406 + 1;
    int _2410 = _2408 + 1;
    float _2412 = as_type<float>(_2390) * _2402;
    bool _2414 = !_1466;
    int _2416 = _2414 ? _2176 : (-1);
    float _2418 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2420 = float(uint(_2396));
    int _2422 = _2366 * _2410;
    float _2424 = _874 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2426 = _2416 * _2362;
    int _2428 = _2426 + _2388;
    int _2430 = abs(_2252);
    int _2432 = _2400 * _2372;
    int _2434 = _2432 + _2422;
    int _2436 = as_type<int>(_2380) + (-2);
    float _2438 = 1.0 / _2420;
    float _2440 = -_2418;
    float _2442 = fma(_2424, 2.0, _2440);
    float _2444 = float(uint(_2434));
    float _2446 = -_149;
    float _2448 = fma(_2446, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2442);
    int _2450 = as_type<int>(_2394) + (-2);
    float _2452 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2454 = trunc(_2412);
    float _2456 = precise::max(_2454, 0.0);
    uint _2458 = uint(_2456);
    float _2460 = float(uint(_2428));
    float _2462 = as_type<float>(_2436) * _2444;
    float _2464 = float(uint(_2430));
    float _2466 = _876 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2468 = abs(_2384);
    float _2470 = as_type<float>(_2450) * _2460;
    int _2472 = ~_2228;
    int _2474 = _2472 + 1;
    float _2476 = fma(_2466, -2.0, _2452);
    float _2478 = 1.0 / _2464;
    float _2480 = fma(_183, _1950, _2042);
    int _2482 = as_type<int>(_2404) + (-2);
    float _2484 = fma(_195, _1950, _2146);
    float _2486 = float(uint(_2468));
    float _2488 = trunc(_2462);
    float _2490 = precise::max(_2488, 0.0);
    uint _2492 = uint(_2490);
    int _2494 = as_type<int>(_2438) + (-2);
    float _2496 = as_type<float>(_2482) * _2486;
    int _2498 = _2474 * int(_2458);
    int _2500 = _2498 + _2384;
    int _2502 = abs(_2434);
    int _2504 = ~_2252;
    int _2506 = _2504 + 1;
    float _2508 = trunc(_2470);
    float _2510 = precise::max(_2508, 0.0);
    uint _2512 = uint(_2510);
    int _2514 = as_type<int>(_2478) + (-2);
    float _2516 = float(uint(_2502));
    float _2518 = trunc(_2496);
    float _2520 = precise::max(_2518, 0.0);
    uint _2522 = uint(_2520);
    int _2524 = abs(_2428);
    int _2526 = _2506 * int(_2492);
    int _2528 = _2526 + _2434;
    float _2530 = as_type<float>(_2514) * _2516;
    float _2532 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2534 = _2532 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2536 = float(uint(_2524));
    float _2538 = float(uint(_2528));
    float _2540 = trunc(_2530);
    float _2542 = precise::max(_2540, 0.0);
    uint _2544 = uint(_2542);
    float _2546 = as_type<float>(_2494) * _2536;
    float _2548 = float(uint(_2500));
    int _2550 = ~_2054;
    int _2552 = _2550 + 1;
    float _2554 = as_type<float>(_2390) * _2548;
    float _2556 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2558 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2556;
    int _2560 = ~_2386;
    int _2562 = _2560 + 1;
    float _2564 = 1.0 / _2534;
    float _2566 = as_type<float>(_2436) * _2538;
    int _2568 = _2552 * int(_2512);
    int _2570 = _2568 + _2428;
    bool _2572 = _2360 > 0.0;
    bool _2574 = _2360 >= 0.0;
    bool _2576 = isnan(_2360);
    bool _2578 = _2574 || _2576;
    bool _2580 = isnan(0.0);
    bool _2582 = _2578 || _2580;
    float _2584 = float(uint(_2570));
    int _2586 = _2562 * int(_2522);
    int _2588 = _2586 + _2468;
    float _2590 = trunc(_2554);
    float _2592 = precise::max(_2590, 0.0);
    uint _2594 = uint(_2592);
    int _2596 = ~_2396;
    int _2598 = _2596 + 1;
    float _2600 = as_type<float>(_2450) * _2584;
    float _2602 = float(uint(_2588));
    int _2604 = ~_2430;
    int _2606 = _2604 + 1;
    float _2608 = _2558 * _2564;
    float _2610 = trunc(_2546);
    float _2612 = precise::max(_2610, 0.0);
    uint _2614 = uint(_2612);
    float _2616 = as_type<float>(_2482) * _2602;
    float _2618 = _874 + _876;
    int _2620 = _2606 * int(_2544);
    int _2622 = _2620 + _2502;
    float _2624 = _2618 + (-1.0);
    bool _2626 = _876 > 0.5;
    float _2628 = trunc(_2616);
    float _2630 = precise::max(_2628, 0.0);
    uint _2632 = uint(_2630);
    float _2634 = float(uint(_2622));
    float _2636 = fma(_2624, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2638 = int(_2458) + int(_2594);
    float _2640 = _876 + _878;
    int _2642 = ~_2228;
    int _2644 = _2642 + 1;
    float _2646 = as_type<float>(_2514) * _2634;
    bool _2648 = _940 != 1;
    float _2650 = trunc(_2566);
    float _2652 = precise::max(_2650, 0.0);
    uint _2654 = uint(_2652);
    int _2656 = _2598 * int(_2614);
    int _2658 = _2656 + _2524;
    float _2660 = _2640 + (-1.0);
    int _2662 = _2644 * _2638;
    int _2664 = _2662 + _2384;
    int _2666 = ~_2386;
    int _2668 = _2666 + 1;
    float _2670 = in.m_64.w;
    float _2672 = fma(_2660, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2674 = -_213;
    int _2676 = _2626 ? as_type<int>(_2674) : as_type<int>(_213);
    float _2678 = trunc(_2646);
    float _2680 = precise::max(_2678, 0.0);
    uint _2682 = uint(_2680);
    int _2684 = int(_2522) + int(_2632);
    float _2686 = float(uint(_2658));
    bool _2688 = uint(_2664) >= uint(_2228);
    int _2690 = _2668 * _2684;
    int _2692 = _2690 + _2468;
    bool _2694 = !_2094;
    float _2696 = _2694 ? _213 : as_type<float>(_2676);
    float _2698 = trunc(_2600);
    float _2700 = precise::max(_2698, 0.0);
    uint _2702 = uint(_2700);
    int _2704 = int(_2492) + int(_2654);
    float _2706 = as_type<float>(_2494) * _2686;
    int _2708 = ~_2252;
    int _2710 = _2708 + 1;
    bool _2712 = _878 > 0.5;
    bool _2714 = !_2688;
    int _2716 = _2714 ? 0 : (-1);
    int _2718 = _2710 * _2704;
    int _2720 = _2718 + _2434;
    float _2722 = trunc(_2706);
    float _2724 = precise::max(_2722, 0.0);
    uint _2726 = uint(_2724);
    float _2728 = -_209;
    int _2730 = _2712 ? as_type<int>(_2728) : as_type<int>(_209);
    int _2732 = ~_2638;
    int _2734 = _2732 + _2716;
    int _2736 = _2734 + 1;
    float _2738 = _2484 + _2670;
    int _2740 = int(_2544) + int(_2682);
    bool _2742 = uint(_2692) >= uint(_2386);
    int _2744 = _2228 * _2736;
    int _2746 = _2744 + _2384;
    int _2748 = ~_2430;
    int _2750 = _2748 + 1;
    bool _2752 = uint(_2720) >= uint(_2252);
    bool _2754 = !_2742;
    float _2756 = _2754 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    int _2758 = _2750 * _2740;
    int _2760 = _2758 + _2502;
    int _2762 = int(_2512) + int(_2702);
    int _2764 = ~_2054;
    int _2766 = _2764 + 1;
    bool _2768 = _2228 == 0;
    bool _2770 = !_2752;
    int _2772 = _2770 ? 0 : (-1);
    int _2774 = _2766 * _2762;
    int _2776 = _2774 + _2428;
    bool _2778 = !_2114;
    float _2780 = _2778 ? _209 : as_type<float>(_2730);
    bool _2782 = _874 > 0.5;
    bool _2784 = !_2768;
    int _2786 = _2784 ? _2746 : (-1);
    int _2788 = ~_2704;
    int _2790 = _2788 + _2772;
    int _2792 = _2790 + 1;
    bool _2794 = uint(_2760) >= uint(_2430);
    float _2796 = in.m_60.w;
    float _2798 = -_209;
    int _2800 = _2782 ? as_type<int>(_2798) : as_type<int>(_209);
    int _2802 = _2252 * _2792;
    int _2804 = _2802 + _2434;
    bool _2806 = _942 != 2;
    int _2808 = int(_2614) + int(_2726);
    int _2810 = ~_2396;
    int _2812 = _2810 + 1;
    bool _2814 = !_2794;
    int _2816 = _2814 ? 0 : (-1);
    bool _2818 = uint(_2776) >= uint(_2054);
    int _2820 = _2812 * _2808;
    int _2822 = _2820 + _2524;
    bool _2824 = _2252 == 0;
    bool _2826 = !_2208;
    float _2828 = _2826 ? _209 : as_type<float>(_2800);
    bool _2830 = _2228 == 0;
    int _2832 = _2384 ^ _2228;
    bool _2834 = !_2818;
    float _2836 = _2834 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2838 = in.m_62.w;
    bool _2840 = !_2824;
    int _2842 = _2840 ? _2804 : (-1);
    bool _2844 = _2252 == 0;
    int _2846 = _2434 ^ _2252;
    float _2848 = _876 * 2.0;
    int _2850 = ~_2762;
    int _2852 = _2850 + as_type<int>(_2836);
    int _2854 = _2852 + 1;
    int _2856 = ~_2816;
    int _2858 = _2740 + _2856;
    int _2860 = _2858 + 1;
    float _2862 = floor(_2848);
    uint _2864 = uint(int(uint(_2832) >> uint(31)));
    bool _2866 = uint(_2822) >= uint(_2396);
    uint _2868 = uint(int(uint(_2846) >> uint(31)));
    int _2870 = ~as_type<int>(_2756);
    int _2872 = _2684 + _2870;
    int _2874 = _2872 + 1;
    float _2876 = _878 * 2.0;
    int _2878 = ~int(_2864);
    int _2880 = _2878 + 1;
    int _2882 = _2054 * _2854;
    int _2884 = _2882 + _2428;
    float _2886 = _2756;
    float _2888 = as_type<float>(_2804);
    float _2890 = as_type<float>(_2434);
    float _2892 = _2836;
    float _2894 = as_type<float>(_2684);
    if (!_2648)
    {
        _2886 = _876;
    }
    float _2896 = _2886;
    float _2898 = floor(_2876);
    int _2900 = ~int(_2868);
    int _2902 = _2900 + 1;
    float _2904 = _2266 + _2838;
    float _2906 = _2896;
    if (!_2648)
    {
        _2888 = _2896;
    }
    float _2908 = _2888;
    float _2910 = _2908;
    if (!_2648)
    {
        _2890 = _878;
    }
    float _2912 = _2890;
    float _2914 = _2912;
    if (!_2648)
    {
        _2892 = _878;
    }
    float _2916 = _2892;
    float _2918 = _2916;
    if (_2648)
    {
        _2910 = _874;
    }
    float _2920 = _2910;
    if (_2648)
    {
        _2906 = _874;
    }
    float _2922 = _2906;
    if (_2648)
    {
        _2914 = _876;
    }
    float _2924 = _2914;
    if (_2648)
    {
        _2918 = _876;
    }
    float _2926 = _2918;
    bool _2928 = _2054 == 0;
    float _2930 = _2924 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2932 = _2874 ^ _2880;
    float _2934 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2936 = _2860 ^ _2902;
    bool _2938 = !_2866;
    int _2940 = _2938 ? 0 : (-1);
    bool _2942 = !_2928;
    int _2944 = _2942 ? _2884 : (-1);
    int _2946 = ~_2880;
    int _2948 = _2946 + _2932;
    int _2950 = _2948 + 1;
    int _2952 = ~_2902;
    int _2954 = _2952 + _2936;
    int _2956 = _2954 + 1;
    float _2958 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2960 = _759 + _2958;
    bool _2962 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2964 = isnan(_759);
    bool _2966 = _2962 || _2964;
    bool _2968 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2970 = _2966 || _2968;
    float _2972 = float(_2970);
    bool _2974 = _2862 > 0.0;
    float _2976 = fma(_2608, _2960, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2978 = _2862 >= 0.0;
    bool _2980 = isnan(_2862);
    bool _2982 = _2978 || _2980;
    bool _2984 = isnan(0.0);
    bool _2986 = _2982 || _2984;
    float _2988 = -_2972;
    float _2990 = _2988 + 1.0;
    float _2992 = _2862;
    if (_2806)
    {
        _2894 = _874;
    }
    float _2994 = _2894;
    float _2996 = _2480 + _2796;
    float _2998 = _2994;
    float _3000 = _2996;
    if (_2806)
    {
        _2992 = _876;
    }
    float _3002 = _2992;
    float _3004 = _2934 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3006 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3008 = isnan(_759);
    bool _3010 = _3006 || _3008;
    bool _3012 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3014 = _3010 || _3012;
    float _3016 = float(_3014);
    float _3018 = _3002;
    if (!_2806)
    {
        _2998 = _878;
    }
    float _3020 = _2998;
    if (!_2806)
    {
        _3018 = _874;
    }
    float _3022 = _3018;
    float _3024 = -_3016;
    float _3026 = _3024 + 1.0;
    bool _3028 = !_2830;
    int _3030 = _3028 ? _2950 : (-1);
    bool _3032 = !_2844;
    int _3034 = _3032 ? _2956 : (-1);
    float _3036 = _3016 * _2990;
    int _3038 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3040 = _3038 != 0;
    int _3042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3044 = _3042 != 0;
    int _3046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3048 = _3046 != 0;
    float _3050 = _3022 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _3052 = _2582 ? 0 : 1;
    float _3054 = _2976 * _3036;
    bool _3056 = _2898 > 0.0;
    float _3058 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3060 = !_3044;
    int _3062 = _3060 ? 0 : 1;
    float _3064 = fma(_3026, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3054);
    bool _3066 = _2898 >= 0.0;
    bool _3068 = isnan(_2898);
    bool _3070 = _3066 || _3068;
    bool _3072 = isnan(0.0);
    bool _3074 = _3070 || _3072;
    int _3076 = _2428 ^ _2054;
    float _3078 = fma(_2972, (*spvDescriptorSet0.vp_c9)._m0[132].x, _3064);
    int _3080 = _3074 ? 0 : 1;
    float _3082 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _3084 = uint(int(uint(_3076) >> uint(31)));
    int _3086 = ~_3080;
    int _3088 = _3086 + 1;
    int _3090 = _3088 + 1;
    int _3092 = ~_2940;
    int _3094 = _2808 + _3092;
    int _3096 = _3094 + 1;
    float _3098 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3100 = _2904 + _3098;
    int _3102 = _3090;
    if (!_3056)
    {
        int _3104 = ~_3080;
        int _3106 = _3104 + 1;
        _3102 = _3106;
    }
    int _3108 = _3102;
    float _3110 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3112 = _2996 + _3110;
    int _3114 = ~int(_3084);
    int _3116 = _3114 + 1;
    float _3118 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _3120 = _2054 == 0;
    float _3122 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3124 = _2738 + _3122;
    int _3126 = _3096 ^ _3116;
    float _3128 = fma(_3112, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3118);
    float _3130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3132 = ~_3116;
    int _3134 = _3132 + _3126;
    int _3136 = _3134 + 1;
    float _3138 = fma(_3124, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3128);
    float _3140 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3142 = _3020 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _3144 = !_3120;
    int _3146 = _3144 ? _3136 : (-1);
    float _3148 = _3058 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3150 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3152 = -_3140;
    float _3154 = fma(_3142, 2.0, _3152);
    bool _3156 = _3138 >= 0.0;
    float _3158 = fma(_2922, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3150);
    float _3160 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3162 = _2920 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _3164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3166 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3168 = fma(_2926, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3160);
    float _3170 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3172 = -_3166;
    float _3174 = fma(_3162, 2.0, _3172);
    float _3176 = float(_2786);
    float _3178 = fma(_2930, -2.0, _3170);
    float _3180 = float(_2842);
    float _3182 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3184 = _3082 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3186 = -_149;
    float _3188 = fma(_3186, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3174);
    float _3190 = fma(_3148, _3176, _2448);
    float _3192 = fma(_3050, -2.0, _3182);
    float _3194 = float(_3030);
    float _3196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3198 = fma(_3184, _3180, _3188);
    float _3200 = _3130 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3202 = _2828 + 0.5;
    float _3204 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2476);
    float _3206 = float(_2944);
    float _3208 = _3164 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3210 = -_149;
    float _3212 = fma(_3210, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3154);
    float _3214 = fma(_3148, _3202, _3190);
    float _3216 = -_3204;
    float _3218 = fma(_3200, _3194, _3216);
    float _3220 = float(_3146);
    float _3222 = fma(_3208, _3206, _3212);
    float _3224 = _1072 + 0.5;
    float _3226 = float(_3034);
    float _3228 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3178);
    float _3230 = _2696 + (-0.5);
    float _3232 = _3196 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3234 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3192);
    float _3236 = fma(_3208, _3224, _3222);
    float _3238 = -_3228;
    float _3240 = fma(_3004, _3226, _3238);
    float _3242 = -_3200;
    float _3244 = fma(_3242, _3230, _3218);
    float _3246 = -_3234;
    float _3248 = fma(_3232, _3220, _3246);
    float _3250 = _1286 + (-0.5);
    float _3252 = _1058 + (-0.5);
    float _3254 = -_3004;
    float _3256 = fma(_3254, _3250, _3240);
    float _3258 = -_3232;
    float _3260 = fma(_3258, _3252, _3248);
    float _3262 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3264 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3266 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3268 = log2(_3266);
    float _3270 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3272 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3262);
    float _3274 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3264);
    float _3276 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3168);
    float _3278 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3270);
    float _3280 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3272);
    float _3282 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3274);
    float _3284 = _2780 + 0.5;
    float _3286 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3278);
    float _3288 = -_3280;
    float _3290 = _3288 + 1.0;
    float _3292 = -_3282;
    float _3294 = _3292 + 1.0;
    float _3296 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3158);
    float _3298 = _3248;
    if (_3156)
    {
        _3298 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3300 = _3298;
    float _3302 = fma(_2696, _3290, _3244);
    float _3304 = -_3294;
    float _3306 = fma(_2828, _3304, _3214);
    float _3308 = _3100 * _3100;
    float _3310 = -_3276;
    float _3312 = _3310 + 1.0;
    float _3314 = fma(_3184, _3284, _3198);
    float _3316 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3318 = fma(_3112, _3112, _3308);
    float _3320 = -_3286;
    float _3322 = _3320 + 1.0;
    float _3324 = -_3296;
    float _3326 = _3324 + 1.0;
    float _3328 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3316);
    float _3330 = fma(_3124, _3124, _3318);
    float _3332 = _3268 * _149;
    float _3334 = fma(_1286, _3312, _3256);
    float _3336 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3328);
    float _3338 = -_3322;
    float _3340 = fma(_1072, _3338, _3236);
    float _3342 = -_3326;
    float _3344 = fma(_2780, _3342, _3314);
    float _3346 = -_3336;
    float _3348 = _3346 + 1.0;
    int _3350 = as_type<int>(_3336);
    if (_3156)
    {
        float _3352 = _3300 * 5.0;
        _3350 = as_type<int>(_3352);
    }
    int _3354 = _3350;
    float _3356 = rsqrt(_3330);
    float _3358 = fma(_1058, _3348, _3260);
    float _3360 = _3078 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3362 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _3364 = !_3048;
    int _3366 = _3364 ? 0 : 1;
    float _3368 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _3370 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3372 = isnan(1.0);
    bool _3374 = _3370 || _3372;
    bool _3376 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3378 = _3374 || _3376;
    float _3380 = in.m_72.x;
    float _3382 = in.m_72.y;
    float _3384 = in.m_72.z;
    float _3386 = exp2(_3332);
    float _3388 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3390 = 1.0 + _3388;
    float _3392 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3394 = _3362 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3396 = _3368 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3398 = _974 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3400 = _3392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3402 = 1.0 / _3390;
    out.m_74.x = _3306;
    out.m_74.y = _3302;
    out.m_74.z = _3344;
    out.m_74.w = _3334;
    bool _3404 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3406 = isnan(0.0);
    bool _3408 = _3404 || _3406;
    bool _3410 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3412 = _3408 || _3410;
    float _3414 = float(_3108);
    out.m_76.x = _3394;
    out.m_76.y = _3396;
    out.m_76.z = _3400;
    out.m_76.w = _3360;
    float _3416 = -_3386;
    float _3418 = _3416 + 1.0;
    if (_3156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9996 = as_type<float>(_3354);
        out.gl_Position.z = _9996;
    }
    out.m_78.x = _3340;
    out.m_78.y = _3358;
    if (_3156)
    {
        out.m_51.x = 0.0;
    }
    float _3420 = _3398 * _3356;
    int _3422 = ~_3052;
    int _3424 = _3422 + 1;
    int _3426 = _3424 + 1;
    float _3428 = _3112 * _3420;
    float _3430 = _3100 * _3420;
    float _3432 = _3124 * _3420;
    bool _3434 = !_3040;
    int _3436 = _3434 ? 0 : 1;
    int _3438 = _3426;
    if (_3156)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3440 = -_3430;
    float _3442 = _2904 + _3440;
    float _3444 = -_3428;
    float _3446 = _2996 + _3444;
    int _3448 = abs(_3436);
    float _3450 = -_3430;
    float _3452 = _3100 + _3450;
    float _3454 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3456 = _3442 + _3454;
    float _3458 = -_3432;
    float _3460 = _2738 + _3458;
    float _3462 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3464 = _3446 + _3462;
    float _3466 = float(_3448);
    float _3468 = _3456 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3470 = -_3428;
    float _3472 = _3112 + _3470;
    float _3474 = _3452 * _3452;
    float _3476 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3478 = _3460 + _3476;
    float _3480 = fma(_3464, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3468);
    float _3482 = _3466 * _3414;
    float _3484 = fma(_3472, _3472, _3474);
    if (!_2572)
    {
        int _3486 = ~_3052;
        int _3488 = _3486 + 1;
        _3438 = _3488;
    }
    int _3490 = _3438;
    float _3492 = fma(_3478, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3480);
    float _3494 = _3482 * (-2.0);
    int _3496 = abs(_3062);
    float _3498 = _874 + (-0.5);
    float _3500 = _3412 ? _3418 : 0.0;
    float _3502 = fma(_3494, _3380, _3380);
    bool _3504 = _3492 >= 0.0;
    float _3506 = fma(_2636, _3494, _2636);
    float _3508 = float(_3490);
    float _3510 = _3508;
    if (_3378)
    {
        float _3512 = _3500 * _3402;
        _151 = _3512;
    }
    float _3514 = _151;
    float _3516 = float(_3496);
    float _3518 = fma(_3498, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3502);
    float _3520 = -_3432;
    float _3522 = _3124 + _3520;
    int _3524 = _2986 ? 0 : 1;
    float _3526 = _876 + (-0.5);
    float _3528 = _3516 * _3508;
    float _3530 = fma(_3506, _3514, _3518);
    float _3532 = fma(_3522, _3522, _3484);
    int _3534 = ~_3524;
    int _3536 = _3534 + 1;
    int _3538 = _3536 + 1;
    float _3540 = _3528 * (-2.0);
    float _3542 = _3530 * 0.15915493667125701904296875;
    int _3544 = _3538;
    if (!_2974)
    {
        int _3546 = ~_3524;
        int _3548 = _3546 + 1;
        _3544 = _3548;
    }
    int _3550 = _3544;
    if (_3504)
    {
        _3510 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3552 = _3510;
    float _3554 = fma(_2672, _3540, _2672);
    float _3556 = sqrt(_3532);
    int _3558 = as_type<int>(_3552);
    if (_3504)
    {
        out.m_51.x = 0.0;
    }
    float _3560 = fma(_3540, _3382, _3382);
    if (_3504)
    {
        float _3562 = _3552 * 5.0;
        _3558 = as_type<int>(_3562);
    }
    int _3564 = _3558;
    int _3566 = abs(_3366);
    float _3568 = _3542 * 6.283185482025146484375;
    float _3570 = sin(_3568);
    if (_3504)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10236 = as_type<float>(_3564);
        out.gl_Position.z = _10236;
    }
    if (_3504)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3572 = -_2904;
    float _3574 = _3572 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3576 = -_2996;
    float _3578 = _3576 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3580 = -_2738;
    float _3582 = _3580 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3584 = _3574 * _3574;
    float _3586 = float(_3550);
    float _3588 = fma(_3526, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3560);
    float _3590 = float(_3566);
    float _3592 = fma(_3578, _3578, _3584);
    float _3594 = _874 + _878;
    float _3596 = fma(_3554, _3514, _3588);
    float _3598 = fma(_3582, _3582, _3592);
    float _3600 = _3590 * _3586;
    float _3602 = _3594 + (-1.0);
    float _3604 = _878 + (-0.5);
    float _3606 = rsqrt(_3598);
    float _3608 = _3600 * (-2.0);
    float _3610 = fma(_3602, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3612 = _3596 * 0.15915493667125701904296875;
    float _3614 = _715 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3616 = fma(_3608, _3384, _3384);
    float _3618 = fma(_3610, _3608, _3610);
    float _3620 = _3612 * 6.283185482025146484375;
    float _3622 = sin(_3620);
    float _3624 = fma(_3604, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3616);
    float _3626 = fma(_3618, _3514, _3624);
    float _3628 = _3578 * _3606;
    float _3630 = _3582 * _3606;
    float _3632 = _3574 * _3606;
    float _3634 = _3612 * 6.283185482025146484375;
    float _3636 = cos(_3634);
    float _3638 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3640 = _3628 * _3638;
    float _3642 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3644 = _3630 * _3642;
    float _3646 = _3626 * 0.15915493667125701904296875;
    float _3648 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _213);
    float _3650 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3652 = -_3640;
    float _3654 = fma(_3630, _3650, _3652);
    float _3656 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3658 = _3632 * _3656;
    float _3660 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3662 = _3542 * 6.283185482025146484375;
    float _3664 = cos(_3662);
    float _3666 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3668 = -_3644;
    float _3670 = fma(_3632, _3666, _3668);
    float _3672 = _3654 * _3654;
    float _3674 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3676 = -_3658;
    float _3678 = fma(_3628, _3674, _3676);
    float _3680 = _3356 * _3556;
    float _3682 = fma(_3670, _3670, _3672);
    float _3684 = _3570 * _3622;
    float _3686 = _3646 * 6.283185482025146484375;
    float _3688 = cos(_3686);
    float _3690 = _974 * _3680;
    float _3692 = fma(_3678, _3678, _3682);
    float _3694 = _3680 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3696 = _3694 * 0.5;
    float _3698 = _3646 * 6.283185482025146484375;
    float _3700 = sin(_3698);
    float _3702 = _3664 * _3636;
    float _3704 = _3664 * _3622;
    float _3706 = rsqrt(_3692);
    float _3708 = _3570 * _3636;
    float _3710 = _3664 * _3688;
    float _3712 = _3636 * _3688;
    float _3714 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _3716 = _3570 * _3688;
    float _3718 = fma(_3700, _3702, _3684);
    float _3720 = _3680 * _3614;
    float _3722 = fma(_3700, _3684, _3702);
    float _3724 = _3622 * _3688;
    float _3726 = -_3704;
    float _3728 = fma(_3700, _3708, _3726);
    float _3730 = _3648 * _3720;
    float _3732 = -_3708;
    float _3734 = fma(_3700, _3704, _3732);
    float _3736 = _3714 * _3690;
    float _3738 = _3670 * _3706;
    float _3740 = _3654 * _3706;
    float _3742 = _3678 * _3706;
    float _3744 = _3710 * _3730;
    float _3746 = -_3730;
    float _3748 = _3700 * _3746;
    float _3750 = _3716 * _3730;
    float _3752 = _3630 * _3740;
    float _3754 = fma(_3718, _3736, _3744);
    float _3756 = _3632 * _3738;
    float _3758 = fma(_3712, _3736, _3748);
    float _3760 = -_3752;
    float _3762 = fma(_3632, _3742, _3760);
    float _3764 = fma(_3734, _3696, _3754);
    float _3766 = -_3756;
    float _3768 = fma(_3628, _3740, _3766);
    float _3770 = fma(_3728, _3736, _3750);
    float _3772 = fma(_3724, _3696, _3758);
    float _3774 = _3762 * _3764;
    float _3776 = _3768 * _3764;
    float _3778 = fma(_3722, _3696, _3770);
    float _3780 = _3628 * _3742;
    float _3782 = fma(_3738, _3772, _3774);
    float _3784 = fma(_3742, _3772, _3776);
    float _3786 = _3718 * _3762;
    float _3788 = -_3780;
    float _3790 = fma(_3630, _3738, _3788);
    float _3792 = fma(_3628, _3778, _3782);
    float _3794 = fma(_3630, _3778, _3784);
    float _3796 = _3718 * _3768;
    float _3798 = _3718 * _3790;
    float _3800 = _2996 + _3792;
    float _3802 = _2738 + _3794;
    float _3804 = _3710 * _3762;
    float _3806 = _3734 * _3762;
    float _3808 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3810 = _3800 + _3808;
    float _3812 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3814 = _3802 + _3812;
    float _3816 = _3734 * _3768;
    float _3818 = _3734 * _3790;
    float _3820 = _3810 * _3810;
    float _3822 = _3814 * _3814;
    float _3824 = _3710 * _3790;
    float _3826 = _3710 * _3768;
    float _3828 = _3790 * _3764;
    float _3830 = _3820 + _3822;
    float _3832 = fma(_3712, _3738, _3786);
    float _3834 = fma(_3712, _3740, _3798);
    float _3836 = fma(_3712, _3742, _3796);
    float _3838 = sqrt(_3830);
    float _3840 = fma(_3660, _3660, 1.0);
    float _3842 = fma(_3740, _3772, _3828);
    float _3844 = -_3700;
    float _3846 = fma(_3844, _3738, _3804);
    float _3848 = -_3700;
    float _3850 = fma(_3848, _3740, _3824);
    float _3852 = -_3700;
    float _3854 = fma(_3852, _3742, _3826);
    float _3856 = fma(_3632, _3778, _3842);
    float _3858 = fma(_3724, _3740, _3818);
    float _3860 = rsqrt(_3840);
    float _3862 = fma(_3724, _3738, _3806);
    float _3864 = _2904 + _3856;
    float _3866 = fma(_3724, _3742, _3816);
    bool _3868 = _3838 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3870 = _3740;
    float _3872 = _3820;
    float _3874 = _3822;
    float _3876 = _3800;
    float _3878 = _3802;
    if (!_3868)
    {
        _3870 = _3864;
    }
    float _3880 = _3870;
    bool _3882 = !_3868;
    float _3884 = _3880;
    if (!_3882)
    {
        float _3886 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3888 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3890 = _3838 + _3888;
        float _3892 = _3864 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3894 = rsqrt(_3830);
        float _3896 = _3890 * _3886;
        float _3898 = _3896 * 0.15915493667125701904296875;
        float _3900 = _3898 * 6.283185482025146484375;
        float _3902 = sin(_3900);
        float _3904 = _3898 * 6.283185482025146484375;
        float _3906 = cos(_3904);
        float _3908 = fma(_3902, _3892, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3910 = _3894 * _3908;
        float _3912 = _3906 + (-1.0);
        float _3914 = fma(_3810, _3910, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3916 = fma(_3814, _3910, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3918 = _3912 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3920 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3922 = _3914 + _3920;
        float _3924 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3926 = _3916 + _3924;
        float _3928 = fma(_3864, _3906, _3918);
        float _3930 = _3922 * _3922;
        float _3932 = _3926 * _3926;
        _3884 = _3928;
        _3872 = _3930;
        _3874 = _3932;
        _3876 = _3914;
        _3878 = _3916;
    }
    float _3934 = _3884;
    float _3936 = _3872;
    float _3938 = _3874;
    float _3940 = _3876;
    float _3942 = _3878;
    float _3944 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3946 = _3934 + _3944;
    float _3948 = fma(_3716, _3628, _3846);
    float _3950 = fma(_3716, _3632, _3850);
    float _3952 = fma(_3716, _3630, _3854);
    float _3954 = fma(_3946, _3946, _3936);
    float _3956 = fma(_3722, _3628, _3862);
    float _3958 = fma(_3722, _3632, _3858);
    float _3960 = fma(_3722, _3630, _3866);
    float _3962 = _3954 + _3938;
    float _3964 = _3660 * _3860;
    float _3966 = fma(_3728, _3628, _3832);
    float _3968 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3970 = _3660 * _3948;
    float _3972 = fma(_3728, _3632, _3834);
    float _3974 = _3660 * _3950;
    float _3976 = fma(_3728, _3630, _3836);
    float _3978 = _3660 * _3952;
    float _3980 = -_3956;
    float _3982 = _3964 * _3980;
    float _3984 = -_3958;
    float _3986 = _3964 * _3984;
    float _3988 = -_3960;
    float _3990 = _3964 * _3988;
    float _3992 = fma(_3968, _3966, _3970);
    float _3994 = sqrt(_3962);
    float _3996 = fma(_3968, _3972, _3974);
    float _3998 = fma(_3968, _3976, _3978);
    float _4000 = fma(_3860, _3948, _3982);
    float _4002 = fma(_3860, _3950, _3986);
    float _4004 = _3958 + _3996;
    float _4006 = fma(_3860, _3952, _3990);
    float _4008 = _3956 + _3992;
    float _4010 = _3960 + _3998;
    out.m_80.x = _3966;
    out.m_80.y = _3972;
    out.m_80.z = _3976;
    out.m_82.x = _4000;
    out.m_82.y = _4002;
    out.m_82.z = _4006;
    bool _4012 = _3994 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4014 = isnan(_3994);
    bool _4016 = _4012 || _4014;
    bool _4018 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4020 = _4016 || _4018;
    out.m_84.x = _4008;
    out.m_84.y = _4004;
    out.m_84.z = _4010;
    float _4022 = _3998;
    float _4024 = _4006;
    float _4026 = _4000;
    if (!_4020)
    {
        _4022 = 1.0;
    }
    float _4028 = _4022;
    bool _4030 = !_4020;
    float _4032 = _4028;
    if (!_4030)
    {
        bool _4034 = _3994 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4036 = isnan(_3994);
        bool _4038 = _4034 || _4036;
        bool _4040 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4042 = _4038 || _4040;
        if (!_4042)
        {
            float _4044 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4046 = _3994 + _4044;
            float _4048 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4050 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4048;
            float _4052 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4054 = _4052 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4056 = 1.0 / _4050;
            float _4058 = _4046 * _4056;
            float _4060 = fma(_4058, _4054, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4032 = _4060;
            _4062 = true;
        }
        else
        {
            bool _4064 = _3994 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4066 = isnan(_3994);
            bool _4068 = _4064 || _4066;
            bool _4070 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4072 = _4068 || _4070;
            if (!_4072)
            {
                float _4074 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4076 = _3994 + _4074;
                float _4078 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4080 = _4078 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4082 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4084 = _4082 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4086 = 1.0 / _4080;
                float _4088 = _4076 * _4086;
                float _4090 = fma(_4088, _4084, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4032 = _4090;
                _4062 = true;
            }
            else
            {
                _4032 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4062 = false;
    float _4092 = _4032;
    float _4094 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4096 = _3934 + _4094;
    float _4098 = _3442 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4100 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4102 = _3940 + _4100;
    float _4104 = fma(_4096, _4092, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4106 = fma(_3446, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4098);
    float _4108 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4110 = _3942 + _4108;
    float _4112 = fma(_4102, _4092, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4114 = -_2904;
    float _4116 = _4114 + _4104;
    float _4118 = fma(_3460, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4106);
    float _4120 = fma(_4110, _4092, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4122 = -_2996;
    float _4124 = _4122 + _4112;
    float _4126 = _4116 * _4116;
    float _4128 = _4118 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4130 = _3442 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4132 = -_2738;
    float _4134 = _4132 + _4120;
    float _4136 = fma(_4124, _4124, _4126);
    float _4138 = 1.0 / _4128;
    float _4140 = fma(_3446, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4130);
    float _4142 = fma(_4134, _4134, _4136);
    float _4144 = fma(_3460, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4140);
    float _4146 = sqrt(_4142);
    float _4148 = _4144 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4150 = _4148 + _4128;
    float _4152 = _4150 * _4138;
    float _4154 = _4152 * 0.5;
    float _4156 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4158 = fma(_4154, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4156);
    bool _4160 = _4146 > 0.0;
    float _4162 = 1.0 / _4158;
    bool _4164 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4166 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4168 = _4164 || _4166;
    bool _4170 = isnan(0.5);
    bool _4172 = _4168 || _4170;
    bool _4174 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4176 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4178 = _4174 || _4176;
    bool _4180 = isnan(0.5);
    bool _4182 = _4178 || _4180;
    float _4184 = _4128;
    float _4186 = _4138;
    float _4188 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (!_4160)
    {
        _4024 = _4112;
    }
    float _4190 = _4024;
    float _4192 = _4190;
    float _4194 = _4190;
    if (!_4160)
    {
        _4184 = _4104;
    }
    float _4196 = _4184;
    float _4198 = _4196;
    float _4200 = _4196;
    if (!_4160)
    {
        _4026 = _4120;
    }
    float _4202 = _4026;
    bool _4204 = !_4160;
    float _4206 = _4202;
    float _4208 = _4202;
    float _4210 = _4162;
    if (!_4204)
    {
        float _4212 = _229 * _229;
        float _4214 = fma(_225, _225, _4212);
        float _4216 = fma(_231, _231, _4214);
        float _4218 = rsqrt(_4142);
        float _4220 = sqrt(_4216);
        float _4222 = _4124 * _4218;
        float _4224 = _4116 * _4218;
        float _4226 = _4134 * _4218;
        bool _4228 = _4220 > 0.0;
        _4188 = _4218;
        if (!_4228)
        {
            _4192 = _4112;
        }
        float _4230 = _4192;
        _4194 = _4230;
        if (!_4228)
        {
            _4198 = _4104;
        }
        float _4232 = _4198;
        _4200 = _4232;
        if (!_4228)
        {
            _4206 = _4120;
        }
        float _4234 = _4206;
        bool _4236 = !_4228;
        _4208 = _4234;
        if (!_4236)
        {
            float _4238 = rsqrt(_4216);
            float _4240 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4242 = _229 * _4238;
            float _4244 = _225 * _4238;
            float _4246 = _231 * _4238;
            float _4248 = _4224 * _4242;
            float _4250 = fma(_4222, _4244, _4248);
            float _4252 = _4240 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4254 = fma(_4226, _4246, _4250);
            float _4256 = _4254 * _4252;
            float _4258 = fma(_225, _4256, _4112);
            float _4260 = fma(_229, _4256, _4104);
            float _4262 = fma(_231, _4256, _4120);
            _4208 = _4262;
            _4194 = _4258;
            _4200 = _4260;
            _4186 = _4252;
            _4188 = _4256;
        }
    }
    float _4264 = _4208;
    float _4266 = _4194;
    float _4268 = _4200;
    float _4270 = _4186;
    float _4272 = _4188;
    float _4274 = -_3432;
    float _4276 = _4274 + _4264;
    float _4278 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4280 = _4162 * _4278;
    float _4282 = -_3428;
    float _4284 = _4282 + _4266;
    float _4286 = -_3430;
    float _4288 = _4286 + _4268;
    float _4290 = _4272;
    float _4292 = _4288;
    float _4294 = _4284;
    float _4296 = _4270;
    if (_4172)
    {
        _4290 = 1.0;
    }
    float _4298 = _4290;
    float _4300 = _4298;
    if (_4182)
    {
        _4210 = _4276;
    }
    float _4302 = _4210;
    float _4304 = _4302;
    if (!_4182)
    {
        float _4306 = _3456 * _3456;
        float _4308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4310 = -_2738;
        float _4312 = _4310 + _4264;
        float _4314 = fma(_3464, _3464, _4306);
        float _4316 = fma(_3478, _3478, _4314);
        float _4318 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4320 = sqrt(_4316);
        float _4322 = 1.0 / _3680;
        float _4324 = _4318 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4326 = precise::min(_4320, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4328 = _4326 * _4308;
        float _4330 = _4328 * _4322;
        float _4332 = -_2904;
        float _4334 = _4332 + _4268;
        float _4336 = -_2996;
        float _4338 = _4336 + _4266;
        float _4340 = _4324 * _4330;
        float _4342 = _4312 * _4330;
        float _4344 = fma(_4334, _4340, _3442);
        float _4346 = fma(_4338, _4340, _3446);
        float _4348 = fma(_4324, _4342, _3460);
        _4292 = _4344;
        _4294 = _4346;
        _4304 = _4348;
        _235 = _4340;
    }
    float _4350 = _4292;
    float _4352 = _4294;
    float _4354 = _4304;
    float _4356 = _235;
    float _4358 = _4356;
    if (!_4172)
    {
        float _4360 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4362 = _4360 * 0.15915493667125701904296875;
        float _4364 = _4362 * 6.283185482025146484375;
        float _4366 = cos(_4364);
        float _4368 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4370 = _4368 * 0.15915493667125701904296875;
        float _4372 = _4362 * 6.283185482025146484375;
        float _4374 = sin(_4372);
        float _4376 = 1.0 / _4366;
        float _4378 = _4370 * 6.283185482025146484375;
        float _4380 = cos(_4378);
        float _4382 = _4374 * _4376;
        float _4384 = _4370 * 6.283185482025146484375;
        float _4386 = sin(_4384);
        float _4388 = _4380 * _4382;
        float _4390 = 1.0 / _4388;
        float _4392 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4394 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4392;
        float _4396 = 1.0 / _4394;
        float _4398 = _4386 * _4390;
        float _4400 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4402 = fma(_4280, _4398, _4400);
        float _4404 = _4402 * _4396;
        float _4406 = precise::clamp(_4404, 0.0, 1.0);
        _4358 = _4396;
        _4300 = _4406;
    }
    float _4408 = _4358;
    float _4410 = _4300;
    float _4412 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4414 = _4350 + _4412;
    float _4416 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4418 = _4352 + _4416;
    float _4420 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4422 = _4354 + _4420;
    float _4424 = _4414 * _4414;
    float _4426 = fma(_4418, _4418, _4424);
    float _4428 = fma(_4422, _4422, _4426);
    float _4430 = rsqrt(_4428);
    float _4432 = _4430 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4434 = _4418 * _4432;
    float _4436 = _4422 * _4432;
    float _4438 = _4434 * _4434;
    float _4440 = _4436 * _4436;
    float _4442 = _4438 + _4440;
    float _4444 = sqrt(_4442);
    bool _4446 = _4444 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4448 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4450 = _4444 + _4448;
    float _4452 = _4430;
    float _4454 = _4408;
    float _4456 = _4450;
    float _4458 = _4414;
    float _4460 = _4442;
    if (_4446)
    {
        float _4462 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4452 = _4462;
    }
    float _4464 = _4452;
    if (_4446)
    {
        float _4466 = rsqrt(_4442);
        _4454 = _4466;
    }
    float _4468 = _4454;
    float _4470 = _4468;
    if (_4446)
    {
        float _4472 = _4450 * _4464;
        _4456 = _4472;
    }
    float _4474 = _4456;
    if (_4446)
    {
        float _4476 = _4474 * 0.15915493667125701904296875;
        _4296 = _4476;
    }
    float _4478 = _4296;
    float _4480 = _4422;
    float _4482 = _4478;
    if (_4446)
    {
        float _4484 = _4478 * 6.283185482025146484375;
        float _4486 = sin(_4484);
        _4480 = _4486;
    }
    float _4488 = _4480;
    float _4490 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4492 = precise::max(0.0, _4490);
    float _4494 = _4464;
    if (_4446)
    {
        float _4496 = _4478 * 6.283185482025146484375;
        float _4498 = cos(_4496);
        _4494 = _4498;
    }
    float _4500 = _4494;
    float _4502 = -_4432;
    float _4504 = -_4492;
    float _4506 = fma(_4414, _4502, _4504);
    if (_4446)
    {
        float _4508 = _4506 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4458 = _4508;
    }
    float _4510 = _4458;
    float _4512 = _4510;
    if (!_4446)
    {
        _4482 = _4434;
    }
    float _4514 = _4482;
    float _4516 = fma(_3446, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4518 = _4488;
    float _4520 = _4514;
    if (_4446)
    {
        float _4522 = fma(_4488, _4510, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3000 = _4522;
    }
    float _4524 = _3000;
    float _4526 = sqrt(_4428);
    float _4528 = _4524;
    if (!_4446)
    {
        _4518 = _4436;
    }
    float _4530 = _4518;
    float _4532 = _4530;
    float _4534 = _4500;
    if (_4446)
    {
        float _4536 = _4500 + (-1.0);
        _4512 = _4536;
    }
    float _4538 = _4512;
    float _4540 = _4538;
    if (_4446)
    {
        float _4542 = _4468 * _4524;
        _4528 = _4542;
    }
    float _4544 = _4528;
    if (!_4446)
    {
        _4470 = _4506;
    }
    float _4546 = _4470;
    float _4548 = _4546;
    if (_4446)
    {
        float _4550 = _4538 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4460 = _4550;
    }
    float _4552 = _4460;
    if (_4446)
    {
        float _4554 = _4434 * _4544;
        _4520 = _4554;
    }
    float _4556 = _4520;
    if (!_4446)
    {
        _4540 = _4438;
    }
    float _4558 = _4540;
    float _4560 = _4558;
    if (_4446)
    {
        float _4562 = _4436 * _4544;
        _4532 = _4562;
    }
    float _4564 = _4532;
    if (_4446)
    {
        float _4566 = fma(_4506, _4500, _4552);
        _4548 = _4566;
    }
    float _4568 = _4548;
    if (_4446)
    {
        float _4570 = _4556 * _4556;
        _4560 = _4570;
    }
    float _4572 = _4560;
    float _4574 = _4350 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_4446)
    {
        _4534 = _4440;
    }
    float _4576 = _4534;
    float _4578 = _4576;
    if (_4446)
    {
        float _4580 = _4564 * _4564;
        _4578 = _4580;
    }
    float _4582 = _4578;
    float _4584 = fma(_4568, _4568, _4572);
    float _4586 = fma(_4352, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4574);
    float _4588 = _4350 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4590 = _4584 + _4582;
    float _4592 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4594 = fma(_4526, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4592);
    float _4596 = precise::clamp(_4594, 0.0, 1.0);
    float _4598 = fma(_4354, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4586);
    float _4600 = rsqrt(_4590);
    float _4602 = -_4596;
    float _4604 = _4602 + 1.0;
    float _4606 = _4598 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4608 = fma(_4352, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4588);
    float _4610 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4612 = fma(_3460, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4614 = _4606 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4616 = abs(_4604);
    float _4618 = log2(_4616);
    float _4620 = _4350 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4622 = -_4614;
    float _4624 = fma(_4622, _4610, 1.0);
    float _4626 = _4350 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4628 = fma(_4352, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4620);
    float _4630 = fma(_4352, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4626);
    float _4632 = _4600 * _4556;
    float _4634 = fma(_4354, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4628);
    float _4636 = _4600 * _4568;
    float _4638 = fma(_4354, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4630);
    float _4640 = _4600 * _4564;
    float _4642 = _4634 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4644 = _4632 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4646 = _4638 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4648 = floor(_4516);
    float _4650 = _4642 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4652 = -_4644;
    float _4654 = fma(_4636, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4652);
    float _4656 = fma(_4354, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4608);
    float _4658 = _4618 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4660 = fma(_4646, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4650);
    float _4662 = -_4640;
    float _4664 = fma(_4662, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4654);
    float _4666 = _4656 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4668 = floor(_4612);
    float _4670 = fma(_4664, -0.5, 0.5);
    float _4672 = fma(_4664, 0.5, 0.5);
    float _4674 = _4642 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4676 = log2(_4624);
    float _4678 = fma(_4646, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4674);
    float _4680 = -_4648;
    float _4682 = _4516 + _4680;
    float _4684 = exp2(_4658);
    float _4686 = fma(_4606, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4660);
    float _4688 = _4642 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4690 = -_4668;
    float _4692 = _4612 + _4690;
    float _4694 = fma(_4672, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4696 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4686);
    float _4698 = fma(_4646, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4688);
    float _4700 = fma(_4606, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4678);
    float _4702 = sqrt(_4670);
    float _4704 = fma(_4672, _4694, -0.212114393711090087890625);
    float _4706 = fma(_4606, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4698);
    float _4708 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4700);
    float _4710 = _4676 * 0.693147182464599609375;
    float _4712 = fma(_4672, _4704, 1.570728778839111328125);
    float _4714 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4706);
    float _4716 = 1.0 / _4696;
    float _4718 = _4636 + 1.0;
    float2 _12080 = float2(_4682, _4692);
    float _4720 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12080, float2(0.0), isnan(_12080)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12080, float2(0.0), isnan(_12080)), level(0.0)).x;
    float _4722 = -_4636;
    float _4724 = fma(_4684, _4718, _4722);
    float _4726 = _4702 * 0.636619746685028076171875;
    float _4728 = fma(_4724, 0.5, 0.5);
    float _4730 = -_4712;
    float _4732 = fma(_4726, _4730, 1.0);
    float _4734 = _4710 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4736 = _4714 * _4716;
    float _4738 = _4708 * _4716;
    float _4740 = fma(_4736, 0.5, 0.5);
    float _4742 = fma(_4738, -0.5, 0.5);
    float3 _12121 = float3(_4740, _4742, _4734);
    float _4744 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12121, float3(0.0), isnan(_12121)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12121, float3(0.0), isnan(_12121)), level(0.0)).x;
    float3 _12132 = float3(_4740, _4742, _4734);
    float4 _4747 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12132, float3(0.0), isnan(_12132)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12132, float3(0.0), isnan(_12132)), level(0.0)).xyzw;
    float _4749 = _4747.x;
    float _4751 = _4747.y;
    float _4753 = _4747.z;
    float _4755 = _4747.w;
    float2 _12148 = float2(_4732, _4728);
    float3 _4759 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12148, float2(0.0), isnan(_12148)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12148, float2(0.0), isnan(_12148)), level(0.0)).xyz;
    float _4761 = _4759.x;
    float _4763 = _4759.y;
    float _4765 = _4759.z;
    float _4767 = abs(_4280);
    float _4769 = log2(_4767);
    float _4771 = _4642 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _4773 = _4526 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4775 = isnan(_4526);
    bool _4777 = _4773 || _4775;
    bool _4779 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4781 = _4777 || _4779;
    float _4783 = fma(_4646, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4771);
    bool _4785 = _4280 <= 8000.0;
    bool _4787 = isnan(_4280);
    bool _4789 = _4785 || _4787;
    bool _4791 = isnan(8000.0);
    bool _4793 = _4789 || _4791;
    float _4795 = float(_4793);
    float _4797 = _4769 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4799 = exp2(_4797);
    float _4801 = fma(_4799, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4803 = precise::clamp(_4801, 0.0, 1.0);
    float _4805 = fma(_4803, -2.0, 3.0);
    float _4807 = _4803 * _4803;
    float _4809 = _4807 * _4805;
    float _4811 = _4618 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4813 = fma(_4606, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4783);
    float _4815 = in.m_86.x;
    float _4817 = -_4809;
    float _4819 = _4817 + 1.0;
    float _4821 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4813);
    float _4823 = exp2(_4811);
    float _4825 = fma(_4819, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4809);
    float _4827 = _4821 + _4696;
    out.gl_Position.x = _4714;
    out.gl_Position.y = _4708;
    out.gl_Position.z = _4821;
    out.gl_Position.w = _4696;
    float _4829 = _4795 * _4825;
    float _4831 = _4827 * 0.5;
    float _4833 = _4410 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4835 = _4829 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_88.z = _4831;
    out.m_88.w = _4696;
    float _4837 = -_4823;
    float _4839 = _4837 + 1.0;
    float _4841 = _4696;
    float _4843 = _4821;
    float _4845 = _4708;
    if (!_4781)
    {
        _4841 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4847 = _4841;
    float _4849 = _4839 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4851 = _4847;
    float _4853 = _4847;
    if (!_4781)
    {
        _4843 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4855 = _4843;
    float _4857 = _4855;
    float _4859 = _4855;
    if (!_4781)
    {
        _4845 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4861 = _4845;
    float _4863 = -_4849;
    float _4865 = _4863 + 1.0;
    float _4867 = -_4720;
    float _4869 = _4867 + 1.0;
    float _4871 = _4869 * _4835;
    float _4873 = precise::clamp(_4871, 0.0, 1.0);
    float _4875 = -_4873;
    float _4877 = fma(_4875, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4879 = _4877 * _4815;
    float _4881 = _4879 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_90.x = _4881;
    float _4883 = _4849 * _4744;
    float _4885 = _4755 * _4865;
    float _4887 = _4865;
    float _4889 = _4749;
    float _4891 = _4861;
    float _4893 = _4861;
    if (!_4781)
    {
        _4887 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4895 = _4887;
    float _4897 = _4755 * _4883;
    float _4899 = _4765 * _4883;
    float _4901 = fma(_4761, _4897, _4749);
    float _4903 = fma(_4763, _4897, _4751);
    float _4905 = fma(_4755, _4899, _4753);
    float _4907 = _4897;
    float _4909 = _4895;
    float _4911 = _4895;
    if (!_4781)
    {
        _4889 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4913 = _4889;
    float _4915 = _4913;
    float _4917 = _4913;
    if (!_4781)
    {
        _4907 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4919 = _4907;
    out.m_92.x = _4901;
    out.m_92.y = _4903;
    out.m_92.z = _4905;
    out.m_92.w = _4885;
    bool _4921 = !_4781;
    float _4923 = _4919;
    float _4925 = _4919;
    if (!_4921)
    {
        bool _4927 = _4526 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4929 = isnan(_4526);
        bool _4931 = _4927 || _4929;
        bool _4933 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4935 = _4931 || _4933;
        if (!_4935)
        {
            float _4937 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4939 = _4526 + _4937;
            float _4941 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4943 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4941;
            float _4945 = 1.0 / _4943;
            float _4947 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4949 = _4947 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4951 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4953 = _4951 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4955 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4957 = _4955 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4959 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4961 = _4959 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4963 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4965 = _4963 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4967 = _4939 * _4945;
            float _4969 = precise::clamp(_4967, 0.0, 1.0);
            float _4971 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4973 = _4971 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4975 = fma(_4969, _4949, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4977 = fma(_4969, _4973, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4979 = fma(_4969, _4953, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4981 = fma(_4969, _4957, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4983 = fma(_4969, _4961, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4985 = fma(_4969, _4965, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4853 = _4977;
            _4911 = _4983;
            _4917 = _4975;
            _4893 = _4981;
            _4859 = _4979;
            _4925 = _4985;
            _4987 = true;
        }
        else
        {
            bool _4989 = _4526 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4991 = isnan(_4526);
            bool _4993 = _4989 || _4991;
            bool _4995 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4997 = _4993 || _4995;
            if (!_4997)
            {
                _4915 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4999 = _4915;
            _4917 = _4999;
            if (!_4997)
            {
                _4851 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5001 = _4851;
            _4853 = _5001;
            if (!_4997)
            {
                _4857 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5003 = _4857;
            _4859 = _5003;
            if (!_4997)
            {
                _4891 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5005 = _4891;
            _4893 = _5005;
            if (!_4997)
            {
                _4909 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5007 = _4909;
            _4911 = _5007;
            if (!_4997)
            {
                _4923 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5009 = _4923;
            bool _5011 = !_4997;
            _4925 = _5009;
            if (!_5011)
            {
                bool _5013 = _4526 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5015 = isnan(_4526);
                bool _5017 = _5013 || _5015;
                bool _5019 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5021 = _5017 || _5019;
                if (!_5021)
                {
                    float _5023 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5025 = _4526 + _5023;
                    float _5027 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5029 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5027;
                    float _5031 = 1.0 / _5029;
                    float _5033 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5035 = _5033 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5037 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5039 = _5037 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5041 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5043 = _5041 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5045 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5047 = _5045 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5049 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5051 = _5049 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5053 = _5025 * _5031;
                    float _5055 = precise::clamp(_5053, 0.0, 1.0);
                    float _5057 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5059 = _5057 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5061 = fma(_5055, _5035, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5063 = fma(_5055, _5059, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5065 = fma(_5055, _5039, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5067 = fma(_5055, _5043, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5069 = fma(_5055, _5047, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5071 = fma(_5055, _5051, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4853 = _5063;
                    _4911 = _5069;
                    _4917 = _5061;
                    _4893 = _5067;
                    _4859 = _5065;
                    _4925 = _5071;
                    _4987 = true;
                }
                else
                {
                    _4853 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4911 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4917 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4893 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4859 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4925 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4987 = false;
    float _5073 = _4853;
    float _5075 = _4911;
    float _5077 = _4917;
    float _5079 = _4893;
    float _5081 = _4859;
    float _5083 = _4925;
    float _5085 = fma(_4004, -0.5, 0.5);
    float _5087 = precise::clamp(_5085, 0.0, 1.0);
    float _5089 = -_5073;
    float _5091 = _5089 + _5075;
    float _5093 = _4833 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5095 = -_5077;
    float _5097 = _5095 + _5079;
    out.m_94.x = 0.0;
    float _5099 = fma(_5087, _5091, _5073);
    float _5101 = fma(_5087, _5097, _5077);
    out.m_51.x = _5093;
    float _5103 = -_5081;
    float _5105 = _5103 + _5083;
    float _5107 = _5099 * 0.586610972881317138671875;
    bool _5109 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5111 = fma(_5087, _5105, _5081);
    float _5113 = fma(_5101, 0.298911988735198974609375, _5107);
    bool _5115 = _4410 > 0.0;
    bool _5117 = isnan(_4410);
    bool _5119 = _5115 || _5117;
    bool _5121 = isnan(0.0);
    bool _5123 = _5119 || _5121;
    float _5125 = fma(_5111, 0.114477999508380889892578125, _5113);
    float _5127 = -_5125;
    float _5129 = _5101 + _5127;
    float _5131 = -_5125;
    float _5133 = _5099 + _5131;
    float _5135 = -_5125;
    float _5137 = _5111 + _5135;
    float _5139 = fma(_5129, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5125);
    float _5141 = fma(_5133, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5125);
    float _5143 = fma(_5137, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5125);
    bool _5145 = !_5109;
    if (!_5145)
    {
        float _5147 = -_4350;
        float _5149 = _5147 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5151 = -_4352;
        float _5153 = _5151 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5155 = -_4354;
        float _5157 = _5155 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5159 = _5149 * _5149;
        float _5161 = fma(_5153, _5153, _5159);
        float _5163 = fma(_5157, _5157, _5161);
        float _5165 = sqrt(_5163);
        float _5167 = rsqrt(_5163);
        float _5169 = -_5165;
        float _5171 = _5169 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5173 = _5171 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5175 = precise::clamp(_5173, 0.0, 1.0);
        float _5177 = _5153 * _5167;
        float _5179 = _5149 * _5167;
        float _5181 = abs(_5175);
        float _5183 = log2(_5181);
        float _5185 = _5157 * _5167;
        float _5187 = _5177 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5189 = _4004 * _5179;
        float _5191 = -_5179;
        float _5193 = -_5187;
        float _5195 = fma(_5191, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5193);
        float _5197 = fma(_4008, _5177, _5189);
        float _5199 = -_5185;
        float _5201 = fma(_5199, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5195);
        float _5203 = fma(_4010, _5185, _5197);
        float _5205 = precise::clamp(_5203, 0.0, 1.0);
        float _5207 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5209 = _5201 + _5207;
        float _5211 = _5183 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5213 = _5209 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5215 = precise::clamp(_5213, 0.0, 1.0);
        float _5217 = exp2(_5211);
        float _5219 = _5217 * _5215;
        float _5221 = _5205 * _5219;
        float _5223 = _5221 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5225 = _5221 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5227 = _5221 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _5223;
        out.m_94.y = _5225;
        out.m_94.z = _5227;
    }
    out.m_96.x = _5139;
    out.m_96.y = _5141;
    out.m_96.z = _5143;
    if (_5123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _5229 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5229;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

