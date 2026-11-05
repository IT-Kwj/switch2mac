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
    float4 m_58 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_62 [[user(locn4)]];
    float4 m_66 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1849 = false;
    bool _625 = false;
    bool _285 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2425 = as_type<float>(_101);
        out.gl_Position.z = _2425;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = _119;
    if (_115)
    {
        float _123 = float(_85);
        _95 = _123;
    }
    float _125 = _95;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    float _133 = _125;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _137 = _135 * 5.0;
        _103 = as_type<int>(_137);
    }
    int _139 = _103;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2495 = as_type<float>(_139);
        out.gl_Position.z = _2495;
    }
    if (_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _141 = in.m_51.w;
    float _143 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = in.m_49.x;
    float _157 = in.m_49.y;
    float _159 = in.m_49.z;
    float _161 = in.m_44.x;
    float _163 = in.m_44.y;
    float _165 = in.m_44.z;
    float _167 = 0.0;
    float _169 = _143;
    if (!_153)
    {
        float _171 = _143 * _143;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = _175;
    if (!_153)
    {
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _179;
    }
    float _181 = _177;
    bool _183 = !_153;
    float _185 = _181;
    if (!_183)
    {
        float _187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = log2(_187);
        float _191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _193 = _191 + 1.0;
        float _195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = _143 * _189;
        float _199 = 1.0 / _193;
        float _201 = _195 * 0.693147182464599609375;
        float _203 = exp2(_197);
        float _205 = 1.0 / _201;
        float _207 = _203 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _205, _143);
        float _213 = _211 * _199;
        float _215 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _215;
    }
    float _217 = _185;
    bool _219 = !_153;
    if (!_219)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = 1.0 / _227;
        float _231 = _143 * _223;
        float _233 = exp2(_231);
        float _235 = -_233;
        float _237 = _235 + 1.0;
        float _239 = _237 * _229;
        _169 = _239;
    }
    float _241 = _169;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _247 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _251 = fma(_241, _155, _245);
    float _253 = fma(_241, _157, _247);
    float _255 = fma(_241, _159, _249);
    float _257 = fma(_251, _141, _161);
    float _259 = fma(_253, _141, _163);
    float _261 = fma(_255, _141, _165);
    bool _263 = !_243;
    float _265 = _261;
    float _283;
    if (!_263)
    {
        float _267 = in.m_53.x;
        float _269 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _271 = _267 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _275 = _273 * _269;
        float _277 = floor(_275);
        float _279 = -_277;
        float _281 = _275 + _279;
        _283 = _281;
        _285 = true;
    }
    else
    {
        float _287 = float(_85);
        float _289 = 1.0 / _287;
        float _291 = _119 * _289;
        _283 = _291;
    }
    _285 = false;
    float _293 = _283;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _297 = _293 + _295;
    float _299 = as_type<float>(int(gl_VertexIndex));
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _317;
    float _321 = 1.0 / _303;
    float _323 = 1.0 / _307;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _327 = _293 + _325;
    float _329 = 1.0 / _315;
    float _331 = _327 * _321;
    bool _333 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _335 = isnan(_293);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    bool _345 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _347 = isnan(_293);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    int _357 = as_type<int>(_299) & 1;
    bool _359 = _357 != 0;
    int _361 = as_type<int>(_299) & 2;
    bool _363 = _361 != 0;
    float _365 = 1.0 / _319;
    float _367 = _297 * _323;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _371 = _293 + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _375 = _293 + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _377;
    bool _381 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _383 = 1.0 / _311;
    float _385 = _371 * _329;
    bool _387 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _389 = isnan(_293);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = fma(_379, _331, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _401 = -_397;
    float _403 = _401 + 1.0;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _407 = _293 + _405;
    float _409 = _355 * _403;
    float _411 = _407 * _365;
    bool _413 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _415 = isnan(_293);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _425;
    float _429 = _375 * _383;
    float _431 = -_343;
    float _433 = _431 + 1.0;
    bool _435 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _437 = isnan(_293);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = fma(_427, _331, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _449 = -_355;
    float _451 = _449 + 1.0;
    float _453 = _423 * _433;
    float _455 = -_423;
    float _457 = _455 + 1.0;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _463 = _445 * _451;
    float _465 = -_445;
    float _467 = _465 + 1.0;
    float _469 = _397 * _457;
    bool _471 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _473 = isnan(_293);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _487 = fma(_461, _367, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _489 = _481 * _467;
    float _491 = -_481;
    float _493 = _491 + 1.0;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _499;
    float _503 = _399 * _489;
    float _505 = _447 * _489;
    float _507 = fma(_485, _367, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _511 = _509 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _513 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[143].x, _503);
    float _515 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[143].y, _505);
    float _517 = fma(_497, _429, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _519 = in.m_51.x;
    float _521 = in.m_51.y;
    float _523 = fma(_501, _429, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _529 = fma(_507, _463, _513);
    float _531 = fma(_487, _463, _515);
    float _533 = fma(_527, _385, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _535;
    float _539 = fma(_517, _409, _529);
    float _541 = fma(_511, _385, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _543;
    float _547 = fma(_523, _409, _531);
    float _549 = fma(_537, _411, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _551 = fma(_533, _469, _539);
    float _553 = fma(_545, _411, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _555 = fma(_541, _469, _547);
    float _557 = fma(_549, _453, _551);
    float _559 = fma(_553, _453, _555);
    float _561 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[148].x, _557);
    float _563 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[148].y, _559);
    float _565 = _561 * _519;
    float _567 = _563 * _521;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _583 = !_359;
    float _585 = _583 ? (-0.5) : 0.5;
    float _587 = _569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _589 = !_363;
    float _591 = _589 ? (-0.5) : 0.5;
    float _593 = _571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _595 = _573 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _597 = _575 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _599 = _577 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _601 = _579 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _603 = !_381;
    float _605 = _593;
    float _623;
    if (!_603)
    {
        float _607 = in.m_53.x;
        float _609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _611 = _607 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _613 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[14].x, _119);
        float _615 = _613 * _609;
        float _617 = floor(_615);
        float _619 = -_617;
        float _621 = _615 + _619;
        _623 = _621;
        _625 = true;
    }
    else
    {
        float _627 = float(_85);
        float _629 = 1.0 / _627;
        float _631 = _119 * _629;
        _623 = _631;
    }
    _625 = false;
    float _633 = _623;
    float _635 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _637 = log2(_635);
    float _639 = in.m_53.z;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _649 = 1.0 / _643;
    float _651 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _661 = _565 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _663 = 1.0 / _647;
    float _665 = _637 * _119;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _671;
    int _675 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _677 = _675 != 0;
    int _679 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _681 = _679 != 0;
    int _683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _685 = _683 != 0;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _691 = 1.0 / _655;
    float _693 = _673 * _649;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _699 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _651);
    float _701 = in.m_53.x;
    float _703 = in.m_53.y;
    float _705 = exp2(_665);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _711 = _697 * _663;
    bool _713 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _715 = isnan(1.0);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _721 = _717 || _719;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _725 = 1.0 + _723;
    float _727 = _709 * _691;
    float _729 = 1.0 / _659;
    float _731 = _639 * 2.0;
    bool _733 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _735 = isnan(0.0);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _741 = _737 || _739;
    float _743 = _567 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _745 = 1.0 / _669;
    float _747 = _703 + _639;
    float _749 = _703 * 2.0;
    float _751 = 1.0 / _689;
    float _753 = (*spvDescriptorSet0.vp_c10)._m0[9].y * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _755 = (*spvDescriptorSet0.vp_c10)._m0[9].y * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _757 = _747 + (-1.0);
    float _759 = fma((*spvDescriptorSet0.vp_c10)._m0[8].y, (*spvDescriptorSet0.vp_c8)._m0[0].x, _753);
    float _761 = fma((*spvDescriptorSet0.vp_c10)._m0[8].y, (*spvDescriptorSet0.vp_c8)._m0[1].x, _755);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _763;
    float _767 = 1.0 / _725;
    float _769 = _701 * 2.0;
    float _771 = _765 * _745;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _773;
    float _777 = floor(_731);
    float _779 = _775 * _751;
    float _781 = _703 + _701;
    float _783 = floor(_769);
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _789 = _787 * _729;
    float _791 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _797 = floor(_749);
    float _799 = -_705;
    float _801 = _799 + 1.0;
    float _803 = _781 + (-1.0);
    bool _805 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _807 = isnan(_633);
    bool _809 = _805 || _807;
    bool _811 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _813 = _809 || _811;
    float _815 = float(_813);
    bool _817 = _777 >= 0.0;
    bool _819 = isnan(_777);
    bool _821 = _817 || _819;
    bool _823 = isnan(0.0);
    bool _825 = _821 || _823;
    float _827 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _829 = _741 ? _801 : 0.0;
    float _831 = 1.0 / _795;
    bool _833 = _783 > 0.0;
    float _835 = _701;
    float _837 = _703;
    if (_721)
    {
        float _839 = _829 * _767;
        _121 = _839;
    }
    float _841 = _121;
    bool _843 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _845 = isnan(_633);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _855;
    bool _859 = _783 >= 0.0;
    bool _861 = isnan(_783);
    bool _863 = _859 || _861;
    bool _865 = isnan(0.0);
    bool _867 = _863 || _865;
    bool _869 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _871 = isnan(_633);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = -_853;
    float _883 = _881 + 1.0;
    bool _885 = _777 > 0.0;
    float _887 = _815 * _883;
    int _889 = _825 ? 0 : 1;
    float _891 = -_815;
    float _893 = _891 + 1.0;
    int _895 = _867 ? 0 : 1;
    float _897 = -_879;
    float _899 = _897 + 1.0;
    bool _901 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _903 = isnan(_633);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _909 = _905 || _907;
    float _911 = float(_909);
    float _913 = _857 * _831;
    bool _915 = _797 > 0.0;
    float _917 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _699);
    bool _919 = _797 >= 0.0;
    bool _921 = isnan(_797);
    bool _923 = _919 || _921;
    bool _925 = isnan(0.0);
    bool _927 = _923 || _925;
    float _929 = _879 * _893;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _933 = _633 + _931;
    bool _935 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _937 = isnan(_633);
    bool _939 = _935 || _937;
    bool _941 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _943 = _939 || _941;
    float _945 = float(_943);
    float _947 = _911 * _899;
    float _949 = -_911;
    float _951 = _949 + 1.0;
    bool _953 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _955 = isnan(_633);
    bool _957 = _953 || _955;
    bool _959 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _961 = _957 || _959;
    float _963 = float(_961);
    float _965 = fma((*spvDescriptorSet0.vp_c10)._m0[10].y, (*spvDescriptorSet0.vp_c8)._m0[0].z, _759);
    float _967 = fma((*spvDescriptorSet0.vp_c10)._m0[10].y, (*spvDescriptorSet0.vp_c8)._m0[1].z, _761);
    float _969 = fma(_693, _933, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _973 = _633 + _971;
    float _975 = _945 * _951;
    float _977 = -_945;
    float _979 = _977 + 1.0;
    bool _981 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _983 = isnan(_633);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _989 = _985 || _987;
    float _991 = float(_989);
    float _993 = -_963;
    float _995 = _993 + 1.0;
    float _997 = fma(_711, _973, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _999 = _963 * _979;
    bool _1001 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1003 = isnan(_633);
    bool _1005 = _1001 || _1003;
    bool _1007 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1009 = _1005 || _1007;
    float _1011 = float(_1009);
    float _1013 = _991 * _995;
    float _1015 = -_991;
    float _1017 = _1015 + 1.0;
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1021 = _633 + _1019;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1025 = _633 + _1023;
    float _1027 = rsqrt(_917);
    float _1029 = _1011 * _1017;
    float _1031 = fma(_771, _1021, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1033 = fma(_727, _1025, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1037 = _633 + _1035;
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1041 = _633 + _1039;
    float _1043 = _969 * _1029;
    float _1045 = -_1011;
    float _1047 = _1045 + 1.0;
    float _1049 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1051 = _633 + _1049;
    int _1053 = _927 ? 0 : 1;
    float _1055 = fma(_779, _1037, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1057 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1043);
    float _1059 = fma(_913, _1051, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _1061 = !_677;
    int _1063 = _1061 ? 0 : 1;
    float _1065 = fma(_789, _1041, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _1067 = ~_895;
    int _1069 = _1067 + 1;
    int _1071 = _1069 + 1;
    float _1073 = fma(_997, _1013, _1057);
    int _1075 = ~_1053;
    int _1077 = _1075 + 1;
    int _1079 = _1077 + 1;
    int _1081 = _1071;
    int _1083 = _1079;
    float _1085 = _965;
    bool _1087 = _927;
    if (!_833)
    {
        int _1089 = ~_895;
        int _1091 = _1089 + 1;
        _1081 = _1091;
    }
    int _1093 = _1081;
    float _1095 = fma(_1031, _999, _1073);
    if (!_915)
    {
        int _1097 = ~_1053;
        int _1099 = _1097 + 1;
        _1083 = _1099;
    }
    int _1101 = _1083;
    bool _1103 = !_685;
    int _1105 = _1103 ? 0 : 1;
    float _1107 = fma(_1033, _975, _1095);
    int _1109 = ~_889;
    int _1111 = _1109 + 1;
    int _1113 = _1111 + 1;
    float _1115 = _701 + (-0.5);
    int _1117 = abs(_1063);
    float _1119 = fma(_1055, _947, _1107);
    float _1121 = abs(_967);
    bool _1123 = _1121 > 0.001000000047497451305389404296875;
    float _1125 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    int _1127 = _1113;
    if (!_885)
    {
        int _1129 = ~_889;
        int _1131 = _1129 + 1;
        _1127 = _1131;
    }
    int _1133 = _1127;
    float _1135 = fma(_1065, _929, _1119);
    bool _1137 = !_681;
    int _1139 = _1137 ? 0 : 1;
    int _1141 = abs(_1105);
    float _1143 = fma(_1059, _887, _1135);
    float _1145 = _1123 ? 0.0 : 9.9999997473787516355514526367188e-05;
    float _1147 = _703 + (-0.5);
    float _1149 = float(_1117);
    float _1151 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1143);
    float _1153 = float(_1133);
    float _1155 = _1147 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    int _1157 = abs(_1139);
    float _1159 = _967 + _1145;
    float _1161 = float(_1093);
    float _1163 = _1149 * _1153;
    float _1165 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1167 = _1163 * (-2.0);
    float _1169 = float(_1157);
    float _1171 = float(_1101);
    float _1173 = fma(_827, _1167, _827);
    float _1175 = abs(_965);
    float _1177 = abs(_1159);
    float _1179 = precise::max(_1175, _1177);
    float _1181 = _1169 * _1161;
    float _1183 = float(_1141);
    float _1185 = fma(_1173, _841, _1125);
    bool _1187 = _1179 >= 16.0;
    float _1189 = _1181 * (-2.0);
    float _1191 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1193 = _1183 * _1171;
    float _1195 = _1185 * 0.15915493667125701904296875;
    float _1197 = fma(_791, _1189, _791);
    float _1199 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1201 = _1191 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1203 = _639 + _701;
    float _1205 = _1193 * (-2.0);
    float _1207 = fma(_1199, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1201);
    float _1209 = _1203 + (-1.0);
    float _1211 = _1159;
    if (_1187)
    {
        float _1213 = _965 * 0.0625;
        _1085 = _1213;
    }
    float _1215 = _1085;
    if (_1187)
    {
        float _1217 = _1159 * 0.0625;
        _1211 = _1217;
    }
    float _1219 = _1211;
    float _1221 = fma(_1165, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1207);
    float _1223 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1225 = fma(_1197, _841, _1155);
    float _1227 = abs(_1215);
    bool _1229 = _1227 != 0.0;
    bool _1231 = isnan(_1227);
    bool _1233 = _1229 || _1231;
    bool _1235 = isnan(0.0);
    bool _1237 = _1233 || _1235;
    float _1239 = _1151 * _1221;
    float _1241 = _639 + (-0.5);
    float _1243 = fma(_1223, _1205, _1223);
    float _1245 = abs(_1219);
    bool _1247 = _1245 == 0.0;
    bool _1249 = !_1237;
    bool _1251 = _1247 && _1249;
    float _1253 = fma(_1239, _1205, _1239);
    float _1255 = _1225 * 0.15915493667125701904296875;
    float _1257 = _1195 * 6.283185482025146484375;
    float _1259 = sin(_1257);
    float _1261 = abs(_1219);
    bool _1263 = _1261 == 0.0;
    float _1265 = fma(_1241, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1253);
    float _1267 = _1191 * _1191;
    float _1269 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _591);
    float _1271 = fma(_1243, _841, _1265);
    float _1273 = fma(_1199, _1199, _1267);
    float _1275 = _1195 * 6.283185482025146484375;
    float _1277 = cos(_1275);
    float _1279 = _743 * _1269;
    int _1281 = as_type<int>(_1255);
    if (_1251)
    {
        bool _1283 = as_type<int>(_1219) >= 0;
        _1087 = _1283;
    }
    bool _1285 = _1087;
    float _1287 = fma(_1165, _1165, _1273);
    float _1289 = _1255 * 6.283185482025146484375;
    float _1291 = sin(_1289);
    float _1293 = _1271 * 0.15915493667125701904296875;
    float _1295 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _585);
    float _1297 = _661 * _1295;
    float _1299 = _1255 * 6.283185482025146484375;
    float _1301 = cos(_1299);
    float _1303 = _1293 * 6.283185482025146484375;
    float _1305 = sin(_1303);
    float _1307 = _1295;
    int _1309 = _1285 ? (-1) : 0;
    if (_1251)
    {
        int _1311 = _1285 ? 0 : 1078530011;
        _1281 = _1311;
    }
    int _1313 = _1281;
    float _1315 = _1277 * _1291;
    int _1317 = _1313;
    if (_1251)
    {
        int _1319 = int(0x80000000) & as_type<int>(_1215);
        int _1321 = _1313 | _1319;
        _1307 = as_type<float>(_1321);
    }
    float _1323 = _1307;
    float _1325 = _1293 * 6.283185482025146484375;
    float _1327 = cos(_1325);
    float _1329 = _1259 * _1301;
    bool _1331 = !_1237;
    bool _1333 = _1331 && _1263;
    float _1335 = _1323;
    float _1337 = _1323;
    if (!_1333)
    {
        float _1339 = abs(_1215);
        bool _1341 = _1339 != as_type<float>(0x7f800000u /* inf */);
        bool _1343 = isnan(_1339);
        bool _1345 = _1341 || _1343;
        bool _1347 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1349 = _1345 || _1347;
        float _1351 = abs(_1219);
        bool _1353 = _1351 == as_type<float>(0x7f800000u /* inf */);
        float _1355 = abs(_1219);
        bool _1357 = _1355 == as_type<float>(0x7f800000u /* inf */);
        bool _1359 = !_1349;
        bool _1361 = _1357 && _1359;
        if (_1361)
        {
            bool _1363 = as_type<int>(_1219) >= 0;
            _1309 = _1363 ? (-1) : 0;
        }
        int _1365 = _1309;
        if (_1361)
        {
            _1317 = 1075235812;
        }
        int _1367 = _1317;
        int _1369 = _1367;
        if (_1361)
        {
            int _1371 = ~_1365;
            int _1373 = (_1371 != 0) ? _1367 : 1061752795;
            _1369 = _1373;
        }
        int _1375 = _1369;
        if (_1361)
        {
            int _1377 = int(0x80000000) & as_type<int>(_1215);
            int _1379 = _1375 | _1377;
            _1335 = as_type<float>(_1379);
        }
        float _1381 = _1335;
        bool _1383 = !_1349;
        bool _1385 = _1383 && _1353;
        _1337 = _1381;
        if (!_1385)
        {
            float _1387 = abs(_1215);
            float _1389 = abs(_1219);
            float _1391 = precise::max(_1387, _1389);
            float _1393 = abs(_1215);
            float _1395 = abs(_1219);
            float _1397 = precise::min(_1393, _1395);
            float _1399 = 1.0 / _1391;
            float _1401 = abs(_1215);
            float _1403 = abs(_1219);
            bool _1405 = _1401 > _1403;
            bool _1407 = as_type<int>(_1219) >= 0;
            float _1409 = _1397 * _1399;
            float _1411 = _1409 * _1409;
            float _1413 = _1411 + 11.33538818359375;
            float _1415 = fma(_1411, _1413, 28.84246826171875);
            float _1417 = fma(_1411, _1415, 19.6966705322265625);
            float _1419 = fma(_1411, -0.82336294651031494140625, -5.674867153167724609375);
            float _1421 = fma(_1411, _1419, -6.565555095672607421875);
            float _1423 = 1.0 / _1417;
            float _1425 = _1411 * _1421;
            float _1427 = abs(_1215);
            float _1429 = abs(_1219);
            float _1431 = _1427 + _1429;
            int _1433 = as_type<int>(_1215) & int(0x80000000);
            float _1435 = _1409 * _1425;
            bool _1437 = _1431 > as_type<float>(0x7f800000u /* inf */);
            bool _1439 = isnan(_1431);
            bool _1441 = _1437 || _1439;
            bool _1443 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1445 = _1441 || _1443;
            float _1447 = fma(_1435, _1423, _1409);
            float _1449 = _1447;
            _1337 = _1431;
            if (_1405)
            {
                float _1451 = -_1447;
                float _1453 = _1451 + 1.57079637050628662109375;
                _1449 = _1453;
            }
            float _1455 = _1449;
            int _1457 = as_type<int>(_1455);
            if (!_1407)
            {
                float _1459 = -_1455;
                float _1461 = _1459 + 3.1415927410125732421875;
                _1457 = as_type<int>(_1461);
            }
            int _1463 = _1457;
            if (!_1445)
            {
                int _1465 = _1433 | _1463;
                _1337 = as_type<float>(_1465);
            }
        }
    }
    float _1467 = _1337;
    float _1469 = _1259 * _1291;
    float _1471 = _1277 * _1301;
    float _1473 = _1467 * (-0.15915493667125701904296875);
    float _1475 = _1327 * _1279;
    float _1477 = -_1315;
    float _1479 = fma(_1305, _1329, _1477);
    float _1481 = -_1329;
    float _1483 = fma(_1305, _1315, _1481);
    float _1485 = _1291 * _1327;
    float _1487 = _1301 * _1327;
    float _1489 = rsqrt(_1287);
    float _1491 = fma(_1305, _1471, _1469);
    float _1493 = _1277 * _1475;
    float _1495 = fma(_1305, _1469, _1471);
    float _1497 = -_1279;
    float _1499 = _1305 * _1497;
    float _1501 = _1259 * _1475;
    float _1503 = fma(_1491, _1297, _1493);
    float _1505 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1507 = _1473 * 6.283185482025146484375;
    float _1509 = cos(_1507);
    float _1511 = fma(_1487, _1297, _1499);
    float _1513 = fma(_1479, _1297, _1501);
    float _1515 = fma(_1483, _1505, _1503);
    float _1517 = fma(_1485, _1505, _1511);
    float _1519 = fma(_1495, _1505, _1513);
    float _1521 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1523 = _1473 * 6.283185482025146484375;
    float _1525 = sin(_1523);
    float _1527 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1529 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1531 = _1199 * _1489;
    float _1533 = _1165 * _1489;
    float _1535 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1521);
    float _1537 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1527);
    float _1539 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1529);
    float _1541 = -_1509;
    float _1543 = _1541 + 1.0;
    float _1545 = _1191 * _1489;
    float _1547 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1535);
    float _1549 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1537);
    float _1551 = _1531 * _1543;
    float _1553 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1539);
    float _1555 = _1547 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1557 = _1533 * _1533;
    float _1559 = _1533 * _1525;
    float _1561 = fma(_1531, _1551, _1509);
    float _1563 = _1549 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1565 = fma(_1543, _1557, _1509);
    float _1567 = -_1559;
    float _1569 = fma(_1545, _1551, _1567);
    float _1571 = _1531 * _1525;
    float _1573 = _1545 * _1543;
    float _1575 = _1553 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1577 = _1555 * _1569;
    float _1579 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1581 = fma(_1533, _1573, _1571);
    float _1583 = fma(_1545, _1573, _1509);
    float _1585 = fma(_1563, _1561, _1577);
    float _1587 = _1545 * _1525;
    float _1589 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1591 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1579);
    float _1593 = _1555 * _1581;
    float _1595 = -_1587;
    float _1597 = fma(_1533, _1551, _1595);
    float _1599 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1589);
    float _1601 = fma(_1533, _1551, _1587);
    float _1603 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1591);
    float _1605 = fma(_1563, _1597, _1593);
    float _1607 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1599);
    float _1609 = fma(_1575, _1601, _1585);
    float _1611 = _1603 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1613 = fma(_1575, _1565, _1605);
    float _1615 = _1607 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1617 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1619 = _1611 + _1609;
    float _1621 = fma(_1545, _1551, _1559);
    float _1623 = _1615 + _1613;
    float _1625 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1617);
    float _1627 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1629 = _1619 + _1627;
    float _1631 = _1555 * _1583;
    float _1633 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1635 = _1623 + _1633;
    float _1637 = -_1571;
    float _1639 = fma(_1533, _1573, _1637);
    float _1641 = _1629 * _1629;
    float _1643 = fma(_1563, _1621, _1631);
    float _1645 = _1635 * _1635;
    float _1647 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1625);
    float _1649 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1651 = fma(_1575, _1639, _1643);
    float _1653 = _1641 + _1645;
    float _1655 = _1647 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1657 = _701 > 0.5;
    float _1659 = _1655 + _1651;
    float _1661 = sqrt(_1653);
    int _1663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1665 = _1663 != 0;
    int _1667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1669 = _1667 != 0;
    bool _1671 = _703 > 0.5;
    bool _1673 = _1661 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1675 = _1625;
    float _1677 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1679 = _1611;
    if (!_1673)
    {
        _265 = _1645;
    }
    float _1681 = _265;
    float _1683 = _1681;
    if (!_1673)
    {
        _835 = _1641;
    }
    float _1685 = _835;
    float _1687 = _1685;
    if (!_1673)
    {
        _1675 = _1619;
    }
    float _1689 = _1675;
    float _1691 = _1689;
    if (!_1673)
    {
        _837 = _1623;
    }
    float _1693 = _837;
    float _1695 = _1693;
    if (!_1673)
    {
        _1677 = _1659;
    }
    float _1697 = _1677;
    bool _1699 = !_1673;
    float _1701 = _1697;
    if (!_1699)
    {
        float _1703 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1705 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1707 = _1661 + _1705;
        float _1709 = _1659 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1711 = rsqrt(_1653);
        float _1713 = _1707 * _1703;
        float _1715 = _1713 * 0.15915493667125701904296875;
        float _1717 = _1715 * 6.283185482025146484375;
        float _1719 = sin(_1717);
        float _1721 = _1715 * 6.283185482025146484375;
        float _1723 = cos(_1721);
        float _1725 = fma(_1719, _1709, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1727 = _1711 * _1725;
        float _1729 = _1723 + (-1.0);
        float _1731 = fma(_1629, _1727, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1733 = fma(_1635, _1727, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1735 = _1729 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1737 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1739 = _1731 + _1737;
        float _1741 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1743 = _1733 + _1741;
        float _1745 = fma(_1659, _1723, _1735);
        float _1747 = _1739 * _1739;
        float _1749 = _1743 * _1743;
        _1701 = _1745;
        _1687 = _1747;
        _1683 = _1749;
        _1691 = _1731;
        _1695 = _1733;
    }
    float _1751 = _1701;
    float _1753 = _1687;
    float _1755 = _1683;
    float _1757 = _1691;
    float _1759 = _1695;
    float _1761 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1763 = _1751 + _1761;
    float _1765 = -_585;
    int _1767 = _1657 ? as_type<int>(_1765) : as_type<int>(_585);
    float _1769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1771 = -_591;
    int _1773 = _1671 ? as_type<int>(_1771) : as_type<int>(_591);
    float _1775 = fma(_1763, _1763, _1753);
    bool _1777 = !_1665;
    float _1779 = _1777 ? _585 : as_type<float>(_1767);
    out.m_58.x = _587;
    out.m_58.y = _593;
    out.m_58.z = _595;
    out.m_58.w = _581;
    bool _1781 = !_1669;
    float _1783 = _1781 ? _591 : as_type<float>(_1773);
    float _1785 = _1775 + _1755;
    float _1787 = _1779 + 0.5;
    out.m_60.x = _597;
    out.m_60.y = _599;
    out.m_60.z = _601;
    float _1789 = -_1783;
    float _1791 = _1789 + 0.5;
    float _1793 = sqrt(_1785);
    float _1795 = _1787 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1797 = _1791 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1799 = _1795 * _1649;
    float _1801 = _1797 * _1769;
    out.m_62.x = _1799;
    out.m_62.y = _1801;
    bool _1803 = _1793 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1805 = isnan(_1793);
    bool _1807 = _1803 || _1805;
    bool _1809 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1811 = _1807 || _1809;
    float _1813 = _1753;
    if (!_1811)
    {
        _1813 = 1.0;
    }
    float _1815 = _1813;
    bool _1817 = !_1811;
    float _1819 = _1815;
    if (!_1817)
    {
        bool _1821 = _1793 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1823 = isnan(_1793);
        bool _1825 = _1821 || _1823;
        bool _1827 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1829 = _1825 || _1827;
        if (!_1829)
        {
            float _1831 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1833 = _1793 + _1831;
            float _1835 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1837 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1835;
            float _1839 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1841 = _1839 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1843 = 1.0 / _1837;
            float _1845 = _1833 * _1843;
            float _1847 = fma(_1845, _1841, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1819 = _1847;
            _605 = _1841;
            _1849 = true;
        }
        else
        {
            bool _1851 = _1793 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1853 = isnan(_1793);
            bool _1855 = _1851 || _1853;
            bool _1857 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1859 = _1855 || _1857;
            if (!_1859)
            {
                float _1861 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1863 = _1793 + _1861;
                float _1865 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1867 = _1865 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1869 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1871 = _1869 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1873 = 1.0 / _1867;
                float _1875 = _1863 * _1873;
                float _1877 = fma(_1875, _1871, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1819 = _1877;
                _605 = _1871;
                _1849 = true;
            }
            else
            {
                _1819 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1849 = false;
    float _1879 = _1819;
    float _1881 = _605;
    float _1883 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1885 = _1757 + _1883;
    float _1887 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1889 = _1751 + _1887;
    float _1891 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1893 = _1759 + _1891;
    bool _1895 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1897 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1899 = _1895 || _1897;
    bool _1901 = isnan(0.5);
    bool _1903 = _1899 || _1901;
    float _1905 = fma(_1885, _1879, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1907 = fma(_1889, _1879, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1909 = fma(_1893, _1879, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1911 = _1889;
    float _1913 = _1881;
    float _1915 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (_1903)
    {
        _1911 = _1905;
    }
    float _1917 = _1911;
    float _1919 = _1917;
    if (_1903)
    {
        _1913 = _1907;
    }
    float _1921 = _1913;
    float _1923 = _1921;
    if (_1903)
    {
        _1915 = _1909;
    }
    float _1925 = _1915;
    float _1927 = _1925;
    if (!_1903)
    {
        float _1929 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1931 = _1655 + _1929;
        float _1933 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1935 = _1611 + _1933;
        float _1937 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1939 = -_1615;
        float _1941 = _1939 + _1909;
        float _1943 = _1931 * _1931;
        float _1945 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1947 = _1615 + _1945;
        float _1949 = fma(_1935, _1935, _1943);
        float _1951 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1953 = fma(_1947, _1947, _1949);
        float _1955 = sqrt(_1953);
        float _1957 = _1937 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1959 = precise::min(_1955, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1961 = _1959 * _1951;
        float _1963 = -_1611;
        float _1965 = _1963 + _1905;
        float _1967 = _1957 * _1961;
        float _1969 = -_1655;
        float _1971 = _1969 + _1907;
        float _1973 = fma(_1965, _1967, _1611);
        float _1975 = fma(_1971, _1967, _1655);
        float _1977 = fma(_1941, _1967, _1615);
        _1923 = _1975;
        _1919 = _1973;
        _1927 = _1977;
    }
    float _1979 = _1923;
    float _1981 = _1919;
    float _1983 = _1927;
    float _1985 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1987 = _1979 + _1985;
    float _1989 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1991 = _1981 + _1989;
    float _1993 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1995 = _1983 + _1993;
    float _1997 = _1987 * _1987;
    float _1999 = fma(_1991, _1991, _1997);
    float _2001 = fma(_1995, _1995, _1999);
    float _2003 = rsqrt(_2001);
    float _2005 = _2003 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2007 = _1991 * _2005;
    float _2009 = _1995 * _2005;
    float _2011 = _2007 * _2007;
    float _2013 = _2009 * _2009;
    float _2015 = _2011 + _2013;
    float _2017 = sqrt(_2015);
    bool _2019 = _2017 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2021 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2023 = _2017 + _2021;
    float _2025 = _1909;
    float _2027 = _2015;
    float _2029 = _2023;
    float _2031 = _1987;
    float _2033 = _2005;
    float _2035 = _2007;
    if (_2019)
    {
        float _2037 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2025 = _2037;
    }
    float _2039 = _2025;
    if (_2019)
    {
        float _2041 = rsqrt(_2015);
        _2027 = _2041;
    }
    float _2043 = _2027;
    float _2045 = _2039;
    if (_2019)
    {
        float _2047 = _2023 * _2039;
        _2029 = _2047;
    }
    float _2049 = _2029;
    if (_2019)
    {
        float _2051 = _2049 * 0.15915493667125701904296875;
        _2045 = _2051;
    }
    float _2053 = _2045;
    float _2055 = _2003;
    float _2057 = _2053;
    if (_2019)
    {
        float _2059 = _2053 * 6.283185482025146484375;
        float _2061 = sin(_2059);
        _2055 = _2061;
    }
    float _2063 = _2055;
    float _2065 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2067 = precise::max(0.0, _2065);
    float _2069 = _1995;
    float _2071 = _2067;
    if (_2019)
    {
        float _2073 = _2053 * 6.283185482025146484375;
        float _2075 = cos(_2073);
        _2069 = _2075;
    }
    float _2077 = _2069;
    float _2079 = -_2005;
    float _2081 = -_2067;
    float _2083 = fma(_1987, _2079, _2081);
    if (_2019)
    {
        float _2085 = _2083 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2031 = _2085;
    }
    float _2087 = _2031;
    float _2089 = _2087;
    if (!_2019)
    {
        _2057 = _2011;
    }
    float _2091 = _2057;
    float _2093 = _2063;
    float _2095 = _2091;
    if (_2019)
    {
        float _2097 = fma(_2063, _2087, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2089 = _2097;
    }
    float _2099 = _2089;
    float _2101 = _2099;
    if (!_2019)
    {
        _2093 = _2083;
    }
    float _2103 = _2093;
    float _2105 = _2103;
    if (_2019)
    {
        float _2107 = _2077 + (-1.0);
        _2071 = _2107;
    }
    float _2109 = _2071;
    float _2111 = _2109;
    if (_2019)
    {
        float _2113 = _2043 * _2099;
        _1679 = _2113;
    }
    float _2115 = _1679;
    if (!_2019)
    {
        _2101 = _2009;
    }
    float _2117 = _2101;
    float _2119 = sqrt(_2001);
    float _2121 = _2117;
    if (_2019)
    {
        float _2123 = _2109 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2033 = _2123;
    }
    float _2125 = _2033;
    if (_2019)
    {
        float _2127 = _2007 * _2115;
        _2035 = _2127;
    }
    float _2129 = _2035;
    if (_2019)
    {
        float _2131 = _2009 * _2115;
        _2121 = _2131;
    }
    float _2133 = _2121;
    if (!_2019)
    {
        _2111 = _2013;
    }
    float _2135 = _2111;
    float _2137 = _2135;
    if (_2019)
    {
        float _2139 = fma(_2083, _2077, _2125);
        _2105 = _2139;
    }
    float _2141 = _2105;
    if (_2019)
    {
        float _2143 = _2129 * _2129;
        _2095 = _2143;
    }
    float _2145 = _2095;
    if (_2019)
    {
        float _2147 = _2133 * _2133;
        _2137 = _2147;
    }
    float _2149 = _2137;
    float _2151 = _1979 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2153 = fma(_2141, _2141, _2145);
    float _2155 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2157 = _2153 + _2149;
    float _2159 = _1979 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2161 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2163 = fma(_2119, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2161);
    float _2165 = precise::clamp(_2163, 0.0, 1.0);
    float _2167 = rsqrt(_2157);
    float _2169 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2159);
    float _2171 = _1979 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2173 = -_2165;
    float _2175 = _2173 + 1.0;
    float _2177 = _1979 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2179 = fma(_1983, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2169);
    float _2181 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2171);
    float _2183 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2177);
    float _2185 = _2179 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2187 = fma(_1983, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2181);
    float _2189 = abs(_2175);
    float _2191 = log2(_2189);
    float _2193 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2151);
    float _2195 = _2185 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2197 = fma(_1983, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2183);
    float _2199 = _2187 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2201 = _2167 * _2129;
    float _2203 = -_2195;
    float _2205 = fma(_2203, _2155, 1.0);
    float _2207 = fma(_1983, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2193);
    float _2209 = _2197 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2211 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2213 = _2167 * _2141;
    float _2215 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2217 = _2167 * _2133;
    float _2219 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2211);
    float _2221 = _2207 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2223 = -_2215;
    float _2225 = fma(_2213, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2223);
    float _2227 = _2191 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2229 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2219);
    float _2231 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2233 = -_2217;
    float _2235 = fma(_2233, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2225);
    float _2237 = log2(_2205);
    float _2239 = fma(_2221, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2229);
    float _2241 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2243 = fma(_2235, -0.5, 0.5);
    float _2245 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2231);
    float _2247 = _2213 + 1.0;
    float _2249 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2241);
    float _2251 = fma(_2235, 0.5, 0.5);
    float _2253 = exp2(_2227);
    float _2255 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2245);
    float _2257 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2249);
    float _2259 = fma(_2251, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2261 = fma(_2251, _2259, -0.212114393711090087890625);
    float _2263 = 1.0 / _2239;
    float _2265 = _2237 * 0.693147182464599609375;
    float _2267 = fma(_2251, _2261, 1.570728778839111328125);
    float _2269 = _2265 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2271 = sqrt(_2243);
    float _2273 = -_2213;
    float _2275 = fma(_2253, _2247, _2273);
    float _2277 = fma(_2221, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2255);
    float _2279 = fma(_2221, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2257);
    float _2281 = fma(_2275, 0.5, 0.5);
    float _2283 = _2277 * _2263;
    float _2285 = _2279 * _2263;
    float _2287 = fma(_2283, 0.5, 0.5);
    float _2289 = fma(_2285, -0.5, 0.5);
    float _2291 = _2271 * 0.636619746685028076171875;
    float3 _5901 = float3(_2287, _2289, _2269);
    float _2293 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5901, float3(0.0), isnan(_5901)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5901, float3(0.0), isnan(_5901)), level(0.0)).x;
    float3 _5912 = float3(_2287, _2289, _2269);
    float4 _2296 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5912, float3(0.0), isnan(_5912)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5912, float3(0.0), isnan(_5912)), level(0.0)).xyzw;
    float _2298 = _2296.x;
    float _2300 = _2296.y;
    float _2302 = _2296.z;
    float _2304 = _2296.w;
    float _2306 = -_2267;
    float _2308 = fma(_2291, _2306, 1.0);
    float2 _5934 = float2(_2308, _2281);
    float3 _2312 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5934, float2(0.0), isnan(_5934)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5934, float2(0.0), isnan(_5934)), level(0.0)).xyz;
    float _2314 = _2312.x;
    float _2316 = _2312.y;
    float _2318 = _2312.z;
    float _2320 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2322 = _2191 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2324 = _2277 + _2239;
    float _2326 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2320);
    float _2328 = _2324 * 0.5;
    float _2330 = exp2(_2322);
    float _2332 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2326);
    float _2334 = fma(_2221, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2332);
    float _2336 = _2239 * 0.5;
    float _2338 = _2334 + _2239;
    float _2340 = -_2330;
    float _2342 = _2340 + 1.0;
    float _2344 = fma(_2279, -0.5, _2336);
    float _2346 = _2338 * 0.5;
    float _2348 = _2342 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2277;
    out.gl_Position.y = _2279;
    out.gl_Position.z = _2334;
    out.gl_Position.w = _2239;
    float _2350 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_64.x = _2328;
    out.m_64.y = _2344;
    out.m_64.z = _2346;
    out.m_64.w = _2239;
    out.m_47.x = _2350;
    float _2352 = _2348 * _2293;
    float _2354 = -_2348;
    float _2356 = _2354 + 1.0;
    float _2358 = _2304 * _2352;
    float _2360 = _2318 * _2352;
    float _2362 = fma(_2314, _2358, _2298);
    float _2364 = fma(_2316, _2358, _2300);
    float _2366 = _2304 * _2356;
    float _2368 = fma(_2304, _2360, _2302);
    out.m_66.x = _2362;
    out.m_66.y = _2364;
    out.m_66.z = _2368;
    out.m_66.w = _2366;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1849 = false;
    bool _625 = false;
    bool _285 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2425 = as_type<float>(_101);
        out.gl_Position.z = _2425;
    }
    if (!_89)
    {
        return out;
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = _119;
    if (_115)
    {
        float _123 = float(_85);
        _95 = _123;
    }
    float _125 = _95;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    float _133 = _125;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _137 = _135 * 5.0;
        _103 = as_type<int>(_137);
    }
    int _139 = _103;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2495 = as_type<float>(_139);
        out.gl_Position.z = _2495;
    }
    if (_131)
    {
        return out;
    }
    float _141 = in.m_51.w;
    float _143 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = in.m_49.x;
    float _157 = in.m_49.y;
    float _159 = in.m_49.z;
    float _161 = in.m_44.x;
    float _163 = in.m_44.y;
    float _165 = in.m_44.z;
    float _167 = 0.0;
    float _169 = _143;
    if (!_153)
    {
        float _171 = _143 * _143;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = _175;
    if (!_153)
    {
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _179;
    }
    float _181 = _177;
    bool _183 = !_153;
    float _185 = _181;
    if (!_183)
    {
        float _187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = log2(_187);
        float _191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _193 = _191 + 1.0;
        float _195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = _143 * _189;
        float _199 = 1.0 / _193;
        float _201 = _195 * 0.693147182464599609375;
        float _203 = exp2(_197);
        float _205 = 1.0 / _201;
        float _207 = _203 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _205, _143);
        float _213 = _211 * _199;
        float _215 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _215;
    }
    float _217 = _185;
    bool _219 = !_153;
    if (!_219)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = 1.0 / _227;
        float _231 = _143 * _223;
        float _233 = exp2(_231);
        float _235 = -_233;
        float _237 = _235 + 1.0;
        float _239 = _237 * _229;
        _169 = _239;
    }
    float _241 = _169;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _247 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _251 = fma(_241, _155, _245);
    float _253 = fma(_241, _157, _247);
    float _255 = fma(_241, _159, _249);
    float _257 = fma(_251, _141, _161);
    float _259 = fma(_253, _141, _163);
    float _261 = fma(_255, _141, _165);
    bool _263 = !_243;
    float _265 = _261;
    float _283;
    if (!_263)
    {
        float _267 = in.m_53.x;
        float _269 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _271 = _267 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _275 = _273 * _269;
        float _277 = floor(_275);
        float _279 = -_277;
        float _281 = _275 + _279;
        _283 = _281;
        _285 = true;
    }
    else
    {
        float _287 = float(_85);
        float _289 = 1.0 / _287;
        float _291 = _119 * _289;
        _283 = _291;
    }
    _285 = false;
    float _293 = _283;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _297 = _293 + _295;
    float _299 = as_type<float>(int(gl_VertexIndex));
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _317;
    float _321 = 1.0 / _303;
    float _323 = 1.0 / _307;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _327 = _293 + _325;
    float _329 = 1.0 / _315;
    float _331 = _327 * _321;
    bool _333 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _335 = isnan(_293);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    bool _345 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _347 = isnan(_293);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    int _357 = as_type<int>(_299) & 1;
    bool _359 = _357 != 0;
    int _361 = as_type<int>(_299) & 2;
    bool _363 = _361 != 0;
    float _365 = 1.0 / _319;
    float _367 = _297 * _323;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _371 = _293 + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _375 = _293 + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _377;
    bool _381 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _383 = 1.0 / _311;
    float _385 = _371 * _329;
    bool _387 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _389 = isnan(_293);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = fma(_379, _331, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _401 = -_397;
    float _403 = _401 + 1.0;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _407 = _293 + _405;
    float _409 = _355 * _403;
    float _411 = _407 * _365;
    bool _413 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _415 = isnan(_293);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _425;
    float _429 = _375 * _383;
    float _431 = -_343;
    float _433 = _431 + 1.0;
    bool _435 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _437 = isnan(_293);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = fma(_427, _331, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _449 = -_355;
    float _451 = _449 + 1.0;
    float _453 = _423 * _433;
    float _455 = -_423;
    float _457 = _455 + 1.0;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _463 = _445 * _451;
    float _465 = -_445;
    float _467 = _465 + 1.0;
    float _469 = _397 * _457;
    bool _471 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _473 = isnan(_293);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _487 = fma(_461, _367, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _489 = _481 * _467;
    float _491 = -_481;
    float _493 = _491 + 1.0;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _499;
    float _503 = _399 * _489;
    float _505 = _447 * _489;
    float _507 = fma(_485, _367, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _511 = _509 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _513 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[143].x, _503);
    float _515 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[143].y, _505);
    float _517 = fma(_497, _429, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _519 = in.m_51.x;
    float _521 = in.m_51.y;
    float _523 = fma(_501, _429, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _529 = fma(_507, _463, _513);
    float _531 = fma(_487, _463, _515);
    float _533 = fma(_527, _385, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _535;
    float _539 = fma(_517, _409, _529);
    float _541 = fma(_511, _385, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _543;
    float _547 = fma(_523, _409, _531);
    float _549 = fma(_537, _411, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _551 = fma(_533, _469, _539);
    float _553 = fma(_545, _411, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _555 = fma(_541, _469, _547);
    float _557 = fma(_549, _453, _551);
    float _559 = fma(_553, _453, _555);
    float _561 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[148].x, _557);
    float _563 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[148].y, _559);
    float _565 = _561 * _519;
    float _567 = _563 * _521;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _583 = !_359;
    float _585 = _583 ? (-0.5) : 0.5;
    float _587 = _569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _589 = !_363;
    float _591 = _589 ? (-0.5) : 0.5;
    float _593 = _571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _595 = _573 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _597 = _575 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _599 = _577 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _601 = _579 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _603 = !_381;
    float _605 = _593;
    float _623;
    if (!_603)
    {
        float _607 = in.m_53.x;
        float _609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _611 = _607 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _613 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[14].x, _119);
        float _615 = _613 * _609;
        float _617 = floor(_615);
        float _619 = -_617;
        float _621 = _615 + _619;
        _623 = _621;
        _625 = true;
    }
    else
    {
        float _627 = float(_85);
        float _629 = 1.0 / _627;
        float _631 = _119 * _629;
        _623 = _631;
    }
    _625 = false;
    float _633 = _623;
    float _635 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _637 = log2(_635);
    float _639 = in.m_53.z;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _649 = 1.0 / _643;
    float _651 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _661 = _565 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _663 = 1.0 / _647;
    float _665 = _637 * _119;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _671;
    int _675 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _677 = _675 != 0;
    int _679 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _681 = _679 != 0;
    int _683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _685 = _683 != 0;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _691 = 1.0 / _655;
    float _693 = _673 * _649;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _699 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _651);
    float _701 = in.m_53.x;
    float _703 = in.m_53.y;
    float _705 = exp2(_665);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _711 = _697 * _663;
    bool _713 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _715 = isnan(1.0);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _721 = _717 || _719;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _725 = 1.0 + _723;
    float _727 = _709 * _691;
    float _729 = 1.0 / _659;
    float _731 = _639 * 2.0;
    bool _733 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _735 = isnan(0.0);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _741 = _737 || _739;
    float _743 = _567 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _745 = 1.0 / _669;
    float _747 = _703 + _639;
    float _749 = _703 * 2.0;
    float _751 = 1.0 / _689;
    float _753 = (*spvDescriptorSet0.vp_c10)._m0[9].y * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _755 = (*spvDescriptorSet0.vp_c10)._m0[9].y * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _757 = _747 + (-1.0);
    float _759 = fma((*spvDescriptorSet0.vp_c10)._m0[8].y, (*spvDescriptorSet0.vp_c8)._m0[0].x, _753);
    float _761 = fma((*spvDescriptorSet0.vp_c10)._m0[8].y, (*spvDescriptorSet0.vp_c8)._m0[1].x, _755);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _763;
    float _767 = 1.0 / _725;
    float _769 = _701 * 2.0;
    float _771 = _765 * _745;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _773;
    float _777 = floor(_731);
    float _779 = _775 * _751;
    float _781 = _703 + _701;
    float _783 = floor(_769);
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _789 = _787 * _729;
    float _791 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _797 = floor(_749);
    float _799 = -_705;
    float _801 = _799 + 1.0;
    float _803 = _781 + (-1.0);
    bool _805 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _807 = isnan(_633);
    bool _809 = _805 || _807;
    bool _811 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _813 = _809 || _811;
    float _815 = float(_813);
    bool _817 = _777 >= 0.0;
    bool _819 = isnan(_777);
    bool _821 = _817 || _819;
    bool _823 = isnan(0.0);
    bool _825 = _821 || _823;
    float _827 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _829 = _741 ? _801 : 0.0;
    float _831 = 1.0 / _795;
    bool _833 = _783 > 0.0;
    float _835 = _701;
    float _837 = _703;
    if (_721)
    {
        float _839 = _829 * _767;
        _121 = _839;
    }
    float _841 = _121;
    bool _843 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _845 = isnan(_633);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _855;
    bool _859 = _783 >= 0.0;
    bool _861 = isnan(_783);
    bool _863 = _859 || _861;
    bool _865 = isnan(0.0);
    bool _867 = _863 || _865;
    bool _869 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _871 = isnan(_633);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = -_853;
    float _883 = _881 + 1.0;
    bool _885 = _777 > 0.0;
    float _887 = _815 * _883;
    int _889 = _825 ? 0 : 1;
    float _891 = -_815;
    float _893 = _891 + 1.0;
    int _895 = _867 ? 0 : 1;
    float _897 = -_879;
    float _899 = _897 + 1.0;
    bool _901 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _903 = isnan(_633);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _909 = _905 || _907;
    float _911 = float(_909);
    float _913 = _857 * _831;
    bool _915 = _797 > 0.0;
    float _917 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _699);
    bool _919 = _797 >= 0.0;
    bool _921 = isnan(_797);
    bool _923 = _919 || _921;
    bool _925 = isnan(0.0);
    bool _927 = _923 || _925;
    float _929 = _879 * _893;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _933 = _633 + _931;
    bool _935 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _937 = isnan(_633);
    bool _939 = _935 || _937;
    bool _941 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _943 = _939 || _941;
    float _945 = float(_943);
    float _947 = _911 * _899;
    float _949 = -_911;
    float _951 = _949 + 1.0;
    bool _953 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _955 = isnan(_633);
    bool _957 = _953 || _955;
    bool _959 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _961 = _957 || _959;
    float _963 = float(_961);
    float _965 = fma((*spvDescriptorSet0.vp_c10)._m0[10].y, (*spvDescriptorSet0.vp_c8)._m0[0].z, _759);
    float _967 = fma((*spvDescriptorSet0.vp_c10)._m0[10].y, (*spvDescriptorSet0.vp_c8)._m0[1].z, _761);
    float _969 = fma(_693, _933, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _973 = _633 + _971;
    float _975 = _945 * _951;
    float _977 = -_945;
    float _979 = _977 + 1.0;
    bool _981 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _983 = isnan(_633);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _989 = _985 || _987;
    float _991 = float(_989);
    float _993 = -_963;
    float _995 = _993 + 1.0;
    float _997 = fma(_711, _973, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _999 = _963 * _979;
    bool _1001 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1003 = isnan(_633);
    bool _1005 = _1001 || _1003;
    bool _1007 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1009 = _1005 || _1007;
    float _1011 = float(_1009);
    float _1013 = _991 * _995;
    float _1015 = -_991;
    float _1017 = _1015 + 1.0;
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1021 = _633 + _1019;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1025 = _633 + _1023;
    float _1027 = rsqrt(_917);
    float _1029 = _1011 * _1017;
    float _1031 = fma(_771, _1021, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1033 = fma(_727, _1025, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1037 = _633 + _1035;
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1041 = _633 + _1039;
    float _1043 = _969 * _1029;
    float _1045 = -_1011;
    float _1047 = _1045 + 1.0;
    float _1049 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1051 = _633 + _1049;
    int _1053 = _927 ? 0 : 1;
    float _1055 = fma(_779, _1037, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1057 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1043);
    float _1059 = fma(_913, _1051, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _1061 = !_677;
    int _1063 = _1061 ? 0 : 1;
    float _1065 = fma(_789, _1041, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _1067 = ~_895;
    int _1069 = _1067 + 1;
    int _1071 = _1069 + 1;
    float _1073 = fma(_997, _1013, _1057);
    int _1075 = ~_1053;
    int _1077 = _1075 + 1;
    int _1079 = _1077 + 1;
    int _1081 = _1071;
    int _1083 = _1079;
    float _1085 = _965;
    bool _1087 = _927;
    if (!_833)
    {
        int _1089 = ~_895;
        int _1091 = _1089 + 1;
        _1081 = _1091;
    }
    int _1093 = _1081;
    float _1095 = fma(_1031, _999, _1073);
    if (!_915)
    {
        int _1097 = ~_1053;
        int _1099 = _1097 + 1;
        _1083 = _1099;
    }
    int _1101 = _1083;
    bool _1103 = !_685;
    int _1105 = _1103 ? 0 : 1;
    float _1107 = fma(_1033, _975, _1095);
    int _1109 = ~_889;
    int _1111 = _1109 + 1;
    int _1113 = _1111 + 1;
    float _1115 = _701 + (-0.5);
    int _1117 = abs(_1063);
    float _1119 = fma(_1055, _947, _1107);
    float _1121 = abs(_967);
    bool _1123 = _1121 > 0.001000000047497451305389404296875;
    float _1125 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    int _1127 = _1113;
    if (!_885)
    {
        int _1129 = ~_889;
        int _1131 = _1129 + 1;
        _1127 = _1131;
    }
    int _1133 = _1127;
    float _1135 = fma(_1065, _929, _1119);
    bool _1137 = !_681;
    int _1139 = _1137 ? 0 : 1;
    int _1141 = abs(_1105);
    float _1143 = fma(_1059, _887, _1135);
    float _1145 = _1123 ? 0.0 : 9.9999997473787516355514526367188e-05;
    float _1147 = _703 + (-0.5);
    float _1149 = float(_1117);
    float _1151 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1143);
    float _1153 = float(_1133);
    float _1155 = _1147 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    int _1157 = abs(_1139);
    float _1159 = _967 + _1145;
    float _1161 = float(_1093);
    float _1163 = _1149 * _1153;
    float _1165 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1167 = _1163 * (-2.0);
    float _1169 = float(_1157);
    float _1171 = float(_1101);
    float _1173 = fma(_827, _1167, _827);
    float _1175 = abs(_965);
    float _1177 = abs(_1159);
    float _1179 = precise::max(_1175, _1177);
    float _1181 = _1169 * _1161;
    float _1183 = float(_1141);
    float _1185 = fma(_1173, _841, _1125);
    bool _1187 = _1179 >= 16.0;
    float _1189 = _1181 * (-2.0);
    float _1191 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1193 = _1183 * _1171;
    float _1195 = _1185 * 0.15915493667125701904296875;
    float _1197 = fma(_791, _1189, _791);
    float _1199 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1201 = _1191 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1203 = _639 + _701;
    float _1205 = _1193 * (-2.0);
    float _1207 = fma(_1199, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1201);
    float _1209 = _1203 + (-1.0);
    float _1211 = _1159;
    if (_1187)
    {
        float _1213 = _965 * 0.0625;
        _1085 = _1213;
    }
    float _1215 = _1085;
    if (_1187)
    {
        float _1217 = _1159 * 0.0625;
        _1211 = _1217;
    }
    float _1219 = _1211;
    float _1221 = fma(_1165, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1207);
    float _1223 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1225 = fma(_1197, _841, _1155);
    float _1227 = abs(_1215);
    bool _1229 = _1227 != 0.0;
    bool _1231 = isnan(_1227);
    bool _1233 = _1229 || _1231;
    bool _1235 = isnan(0.0);
    bool _1237 = _1233 || _1235;
    float _1239 = _1151 * _1221;
    float _1241 = _639 + (-0.5);
    float _1243 = fma(_1223, _1205, _1223);
    float _1245 = abs(_1219);
    bool _1247 = _1245 == 0.0;
    bool _1249 = !_1237;
    bool _1251 = _1247 && _1249;
    float _1253 = fma(_1239, _1205, _1239);
    float _1255 = _1225 * 0.15915493667125701904296875;
    float _1257 = _1195 * 6.283185482025146484375;
    float _1259 = sin(_1257);
    float _1261 = abs(_1219);
    bool _1263 = _1261 == 0.0;
    float _1265 = fma(_1241, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1253);
    float _1267 = _1191 * _1191;
    float _1269 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _591);
    float _1271 = fma(_1243, _841, _1265);
    float _1273 = fma(_1199, _1199, _1267);
    float _1275 = _1195 * 6.283185482025146484375;
    float _1277 = cos(_1275);
    float _1279 = _743 * _1269;
    int _1281 = as_type<int>(_1255);
    if (_1251)
    {
        bool _1283 = as_type<int>(_1219) >= 0;
        _1087 = _1283;
    }
    bool _1285 = _1087;
    float _1287 = fma(_1165, _1165, _1273);
    float _1289 = _1255 * 6.283185482025146484375;
    float _1291 = sin(_1289);
    float _1293 = _1271 * 0.15915493667125701904296875;
    float _1295 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _585);
    float _1297 = _661 * _1295;
    float _1299 = _1255 * 6.283185482025146484375;
    float _1301 = cos(_1299);
    float _1303 = _1293 * 6.283185482025146484375;
    float _1305 = sin(_1303);
    float _1307 = _1295;
    int _1309 = _1285 ? (-1) : 0;
    if (_1251)
    {
        int _1311 = _1285 ? 0 : 1078530011;
        _1281 = _1311;
    }
    int _1313 = _1281;
    float _1315 = _1277 * _1291;
    int _1317 = _1313;
    if (_1251)
    {
        int _1319 = int(0x80000000) & as_type<int>(_1215);
        int _1321 = _1313 | _1319;
        _1307 = as_type<float>(_1321);
    }
    float _1323 = _1307;
    float _1325 = _1293 * 6.283185482025146484375;
    float _1327 = cos(_1325);
    float _1329 = _1259 * _1301;
    bool _1331 = !_1237;
    bool _1333 = _1331 && _1263;
    float _1335 = _1323;
    float _1337 = _1323;
    if (!_1333)
    {
        float _1339 = abs(_1215);
        bool _1341 = _1339 != as_type<float>(0x7f800000u /* inf */);
        bool _1343 = isnan(_1339);
        bool _1345 = _1341 || _1343;
        bool _1347 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1349 = _1345 || _1347;
        float _1351 = abs(_1219);
        bool _1353 = _1351 == as_type<float>(0x7f800000u /* inf */);
        float _1355 = abs(_1219);
        bool _1357 = _1355 == as_type<float>(0x7f800000u /* inf */);
        bool _1359 = !_1349;
        bool _1361 = _1357 && _1359;
        if (_1361)
        {
            bool _1363 = as_type<int>(_1219) >= 0;
            _1309 = _1363 ? (-1) : 0;
        }
        int _1365 = _1309;
        if (_1361)
        {
            _1317 = 1075235812;
        }
        int _1367 = _1317;
        int _1369 = _1367;
        if (_1361)
        {
            int _1371 = ~_1365;
            int _1373 = (_1371 != 0) ? _1367 : 1061752795;
            _1369 = _1373;
        }
        int _1375 = _1369;
        if (_1361)
        {
            int _1377 = int(0x80000000) & as_type<int>(_1215);
            int _1379 = _1375 | _1377;
            _1335 = as_type<float>(_1379);
        }
        float _1381 = _1335;
        bool _1383 = !_1349;
        bool _1385 = _1383 && _1353;
        _1337 = _1381;
        if (!_1385)
        {
            float _1387 = abs(_1215);
            float _1389 = abs(_1219);
            float _1391 = precise::max(_1387, _1389);
            float _1393 = abs(_1215);
            float _1395 = abs(_1219);
            float _1397 = precise::min(_1393, _1395);
            float _1399 = 1.0 / _1391;
            float _1401 = abs(_1215);
            float _1403 = abs(_1219);
            bool _1405 = _1401 > _1403;
            bool _1407 = as_type<int>(_1219) >= 0;
            float _1409 = _1397 * _1399;
            float _1411 = _1409 * _1409;
            float _1413 = _1411 + 11.33538818359375;
            float _1415 = fma(_1411, _1413, 28.84246826171875);
            float _1417 = fma(_1411, _1415, 19.6966705322265625);
            float _1419 = fma(_1411, -0.82336294651031494140625, -5.674867153167724609375);
            float _1421 = fma(_1411, _1419, -6.565555095672607421875);
            float _1423 = 1.0 / _1417;
            float _1425 = _1411 * _1421;
            float _1427 = abs(_1215);
            float _1429 = abs(_1219);
            float _1431 = _1427 + _1429;
            int _1433 = as_type<int>(_1215) & int(0x80000000);
            float _1435 = _1409 * _1425;
            bool _1437 = _1431 > as_type<float>(0x7f800000u /* inf */);
            bool _1439 = isnan(_1431);
            bool _1441 = _1437 || _1439;
            bool _1443 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1445 = _1441 || _1443;
            float _1447 = fma(_1435, _1423, _1409);
            float _1449 = _1447;
            _1337 = _1431;
            if (_1405)
            {
                float _1451 = -_1447;
                float _1453 = _1451 + 1.57079637050628662109375;
                _1449 = _1453;
            }
            float _1455 = _1449;
            int _1457 = as_type<int>(_1455);
            if (!_1407)
            {
                float _1459 = -_1455;
                float _1461 = _1459 + 3.1415927410125732421875;
                _1457 = as_type<int>(_1461);
            }
            int _1463 = _1457;
            if (!_1445)
            {
                int _1465 = _1433 | _1463;
                _1337 = as_type<float>(_1465);
            }
        }
    }
    float _1467 = _1337;
    float _1469 = _1259 * _1291;
    float _1471 = _1277 * _1301;
    float _1473 = _1467 * (-0.15915493667125701904296875);
    float _1475 = _1327 * _1279;
    float _1477 = -_1315;
    float _1479 = fma(_1305, _1329, _1477);
    float _1481 = -_1329;
    float _1483 = fma(_1305, _1315, _1481);
    float _1485 = _1291 * _1327;
    float _1487 = _1301 * _1327;
    float _1489 = rsqrt(_1287);
    float _1491 = fma(_1305, _1471, _1469);
    float _1493 = _1277 * _1475;
    float _1495 = fma(_1305, _1469, _1471);
    float _1497 = -_1279;
    float _1499 = _1305 * _1497;
    float _1501 = _1259 * _1475;
    float _1503 = fma(_1491, _1297, _1493);
    float _1505 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1507 = _1473 * 6.283185482025146484375;
    float _1509 = cos(_1507);
    float _1511 = fma(_1487, _1297, _1499);
    float _1513 = fma(_1479, _1297, _1501);
    float _1515 = fma(_1483, _1505, _1503);
    float _1517 = fma(_1485, _1505, _1511);
    float _1519 = fma(_1495, _1505, _1513);
    float _1521 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1523 = _1473 * 6.283185482025146484375;
    float _1525 = sin(_1523);
    float _1527 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1529 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1531 = _1199 * _1489;
    float _1533 = _1165 * _1489;
    float _1535 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1521);
    float _1537 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1527);
    float _1539 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1529);
    float _1541 = -_1509;
    float _1543 = _1541 + 1.0;
    float _1545 = _1191 * _1489;
    float _1547 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1535);
    float _1549 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1537);
    float _1551 = _1531 * _1543;
    float _1553 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1539);
    float _1555 = _1547 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1557 = _1533 * _1533;
    float _1559 = _1533 * _1525;
    float _1561 = fma(_1531, _1551, _1509);
    float _1563 = _1549 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1565 = fma(_1543, _1557, _1509);
    float _1567 = -_1559;
    float _1569 = fma(_1545, _1551, _1567);
    float _1571 = _1531 * _1525;
    float _1573 = _1545 * _1543;
    float _1575 = _1553 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1577 = _1555 * _1569;
    float _1579 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1581 = fma(_1533, _1573, _1571);
    float _1583 = fma(_1545, _1573, _1509);
    float _1585 = fma(_1563, _1561, _1577);
    float _1587 = _1545 * _1525;
    float _1589 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1591 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1579);
    float _1593 = _1555 * _1581;
    float _1595 = -_1587;
    float _1597 = fma(_1533, _1551, _1595);
    float _1599 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1589);
    float _1601 = fma(_1533, _1551, _1587);
    float _1603 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1591);
    float _1605 = fma(_1563, _1597, _1593);
    float _1607 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1599);
    float _1609 = fma(_1575, _1601, _1585);
    float _1611 = _1603 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1613 = fma(_1575, _1565, _1605);
    float _1615 = _1607 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1617 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1619 = _1611 + _1609;
    float _1621 = fma(_1545, _1551, _1559);
    float _1623 = _1615 + _1613;
    float _1625 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1617);
    float _1627 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1629 = _1619 + _1627;
    float _1631 = _1555 * _1583;
    float _1633 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1635 = _1623 + _1633;
    float _1637 = -_1571;
    float _1639 = fma(_1533, _1573, _1637);
    float _1641 = _1629 * _1629;
    float _1643 = fma(_1563, _1621, _1631);
    float _1645 = _1635 * _1635;
    float _1647 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1625);
    float _1649 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1651 = fma(_1575, _1639, _1643);
    float _1653 = _1641 + _1645;
    float _1655 = _1647 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1657 = _701 > 0.5;
    float _1659 = _1655 + _1651;
    float _1661 = sqrt(_1653);
    int _1663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1665 = _1663 != 0;
    int _1667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1669 = _1667 != 0;
    bool _1671 = _703 > 0.5;
    bool _1673 = _1661 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1675 = _1625;
    float _1677 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1679 = _1611;
    if (!_1673)
    {
        _265 = _1645;
    }
    float _1681 = _265;
    float _1683 = _1681;
    if (!_1673)
    {
        _835 = _1641;
    }
    float _1685 = _835;
    float _1687 = _1685;
    if (!_1673)
    {
        _1675 = _1619;
    }
    float _1689 = _1675;
    float _1691 = _1689;
    if (!_1673)
    {
        _837 = _1623;
    }
    float _1693 = _837;
    float _1695 = _1693;
    if (!_1673)
    {
        _1677 = _1659;
    }
    float _1697 = _1677;
    bool _1699 = !_1673;
    float _1701 = _1697;
    if (!_1699)
    {
        float _1703 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1705 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1707 = _1661 + _1705;
        float _1709 = _1659 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1711 = rsqrt(_1653);
        float _1713 = _1707 * _1703;
        float _1715 = _1713 * 0.15915493667125701904296875;
        float _1717 = _1715 * 6.283185482025146484375;
        float _1719 = sin(_1717);
        float _1721 = _1715 * 6.283185482025146484375;
        float _1723 = cos(_1721);
        float _1725 = fma(_1719, _1709, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1727 = _1711 * _1725;
        float _1729 = _1723 + (-1.0);
        float _1731 = fma(_1629, _1727, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1733 = fma(_1635, _1727, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1735 = _1729 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1737 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1739 = _1731 + _1737;
        float _1741 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1743 = _1733 + _1741;
        float _1745 = fma(_1659, _1723, _1735);
        float _1747 = _1739 * _1739;
        float _1749 = _1743 * _1743;
        _1701 = _1745;
        _1687 = _1747;
        _1683 = _1749;
        _1691 = _1731;
        _1695 = _1733;
    }
    float _1751 = _1701;
    float _1753 = _1687;
    float _1755 = _1683;
    float _1757 = _1691;
    float _1759 = _1695;
    float _1761 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1763 = _1751 + _1761;
    float _1765 = -_585;
    int _1767 = _1657 ? as_type<int>(_1765) : as_type<int>(_585);
    float _1769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1771 = -_591;
    int _1773 = _1671 ? as_type<int>(_1771) : as_type<int>(_591);
    float _1775 = fma(_1763, _1763, _1753);
    bool _1777 = !_1665;
    float _1779 = _1777 ? _585 : as_type<float>(_1767);
    out.m_58.x = _587;
    out.m_58.y = _593;
    out.m_58.z = _595;
    out.m_58.w = _581;
    bool _1781 = !_1669;
    float _1783 = _1781 ? _591 : as_type<float>(_1773);
    float _1785 = _1775 + _1755;
    float _1787 = _1779 + 0.5;
    out.m_60.x = _597;
    out.m_60.y = _599;
    out.m_60.z = _601;
    float _1789 = -_1783;
    float _1791 = _1789 + 0.5;
    float _1793 = sqrt(_1785);
    float _1795 = _1787 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1797 = _1791 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1799 = _1795 * _1649;
    float _1801 = _1797 * _1769;
    out.m_62.x = _1799;
    out.m_62.y = _1801;
    bool _1803 = _1793 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1805 = isnan(_1793);
    bool _1807 = _1803 || _1805;
    bool _1809 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1811 = _1807 || _1809;
    float _1813 = _1753;
    if (!_1811)
    {
        _1813 = 1.0;
    }
    float _1815 = _1813;
    bool _1817 = !_1811;
    float _1819 = _1815;
    if (!_1817)
    {
        bool _1821 = _1793 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1823 = isnan(_1793);
        bool _1825 = _1821 || _1823;
        bool _1827 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1829 = _1825 || _1827;
        if (!_1829)
        {
            float _1831 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1833 = _1793 + _1831;
            float _1835 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1837 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1835;
            float _1839 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1841 = _1839 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1843 = 1.0 / _1837;
            float _1845 = _1833 * _1843;
            float _1847 = fma(_1845, _1841, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1819 = _1847;
            _605 = _1841;
            _1849 = true;
        }
        else
        {
            bool _1851 = _1793 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1853 = isnan(_1793);
            bool _1855 = _1851 || _1853;
            bool _1857 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1859 = _1855 || _1857;
            if (!_1859)
            {
                float _1861 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1863 = _1793 + _1861;
                float _1865 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1867 = _1865 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1869 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1871 = _1869 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1873 = 1.0 / _1867;
                float _1875 = _1863 * _1873;
                float _1877 = fma(_1875, _1871, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1819 = _1877;
                _605 = _1871;
                _1849 = true;
            }
            else
            {
                _1819 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1849 = false;
    float _1879 = _1819;
    float _1881 = _605;
    float _1883 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1885 = _1757 + _1883;
    float _1887 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1889 = _1751 + _1887;
    float _1891 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1893 = _1759 + _1891;
    bool _1895 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1897 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1899 = _1895 || _1897;
    bool _1901 = isnan(0.5);
    bool _1903 = _1899 || _1901;
    float _1905 = fma(_1885, _1879, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1907 = fma(_1889, _1879, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1909 = fma(_1893, _1879, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1911 = _1889;
    float _1913 = _1881;
    float _1915 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (_1903)
    {
        _1911 = _1905;
    }
    float _1917 = _1911;
    float _1919 = _1917;
    if (_1903)
    {
        _1913 = _1907;
    }
    float _1921 = _1913;
    float _1923 = _1921;
    if (_1903)
    {
        _1915 = _1909;
    }
    float _1925 = _1915;
    float _1927 = _1925;
    if (!_1903)
    {
        float _1929 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1931 = _1655 + _1929;
        float _1933 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1935 = _1611 + _1933;
        float _1937 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1939 = -_1615;
        float _1941 = _1939 + _1909;
        float _1943 = _1931 * _1931;
        float _1945 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1947 = _1615 + _1945;
        float _1949 = fma(_1935, _1935, _1943);
        float _1951 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1953 = fma(_1947, _1947, _1949);
        float _1955 = sqrt(_1953);
        float _1957 = _1937 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1959 = precise::min(_1955, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1961 = _1959 * _1951;
        float _1963 = -_1611;
        float _1965 = _1963 + _1905;
        float _1967 = _1957 * _1961;
        float _1969 = -_1655;
        float _1971 = _1969 + _1907;
        float _1973 = fma(_1965, _1967, _1611);
        float _1975 = fma(_1971, _1967, _1655);
        float _1977 = fma(_1941, _1967, _1615);
        _1923 = _1975;
        _1919 = _1973;
        _1927 = _1977;
    }
    float _1979 = _1923;
    float _1981 = _1919;
    float _1983 = _1927;
    float _1985 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1987 = _1979 + _1985;
    float _1989 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1991 = _1981 + _1989;
    float _1993 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1995 = _1983 + _1993;
    float _1997 = _1987 * _1987;
    float _1999 = fma(_1991, _1991, _1997);
    float _2001 = fma(_1995, _1995, _1999);
    float _2003 = rsqrt(_2001);
    float _2005 = _2003 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2007 = _1991 * _2005;
    float _2009 = _1995 * _2005;
    float _2011 = _2007 * _2007;
    float _2013 = _2009 * _2009;
    float _2015 = _2011 + _2013;
    float _2017 = sqrt(_2015);
    bool _2019 = _2017 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2021 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2023 = _2017 + _2021;
    float _2025 = _1909;
    float _2027 = _2015;
    float _2029 = _2023;
    float _2031 = _1987;
    float _2033 = _2005;
    float _2035 = _2007;
    if (_2019)
    {
        float _2037 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2025 = _2037;
    }
    float _2039 = _2025;
    if (_2019)
    {
        float _2041 = rsqrt(_2015);
        _2027 = _2041;
    }
    float _2043 = _2027;
    float _2045 = _2039;
    if (_2019)
    {
        float _2047 = _2023 * _2039;
        _2029 = _2047;
    }
    float _2049 = _2029;
    if (_2019)
    {
        float _2051 = _2049 * 0.15915493667125701904296875;
        _2045 = _2051;
    }
    float _2053 = _2045;
    float _2055 = _2003;
    float _2057 = _2053;
    if (_2019)
    {
        float _2059 = _2053 * 6.283185482025146484375;
        float _2061 = sin(_2059);
        _2055 = _2061;
    }
    float _2063 = _2055;
    float _2065 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2067 = precise::max(0.0, _2065);
    float _2069 = _1995;
    float _2071 = _2067;
    if (_2019)
    {
        float _2073 = _2053 * 6.283185482025146484375;
        float _2075 = cos(_2073);
        _2069 = _2075;
    }
    float _2077 = _2069;
    float _2079 = -_2005;
    float _2081 = -_2067;
    float _2083 = fma(_1987, _2079, _2081);
    if (_2019)
    {
        float _2085 = _2083 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2031 = _2085;
    }
    float _2087 = _2031;
    float _2089 = _2087;
    if (!_2019)
    {
        _2057 = _2011;
    }
    float _2091 = _2057;
    float _2093 = _2063;
    float _2095 = _2091;
    if (_2019)
    {
        float _2097 = fma(_2063, _2087, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2089 = _2097;
    }
    float _2099 = _2089;
    float _2101 = _2099;
    if (!_2019)
    {
        _2093 = _2083;
    }
    float _2103 = _2093;
    float _2105 = _2103;
    if (_2019)
    {
        float _2107 = _2077 + (-1.0);
        _2071 = _2107;
    }
    float _2109 = _2071;
    float _2111 = _2109;
    if (_2019)
    {
        float _2113 = _2043 * _2099;
        _1679 = _2113;
    }
    float _2115 = _1679;
    if (!_2019)
    {
        _2101 = _2009;
    }
    float _2117 = _2101;
    float _2119 = sqrt(_2001);
    float _2121 = _2117;
    if (_2019)
    {
        float _2123 = _2109 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2033 = _2123;
    }
    float _2125 = _2033;
    if (_2019)
    {
        float _2127 = _2007 * _2115;
        _2035 = _2127;
    }
    float _2129 = _2035;
    if (_2019)
    {
        float _2131 = _2009 * _2115;
        _2121 = _2131;
    }
    float _2133 = _2121;
    if (!_2019)
    {
        _2111 = _2013;
    }
    float _2135 = _2111;
    float _2137 = _2135;
    if (_2019)
    {
        float _2139 = fma(_2083, _2077, _2125);
        _2105 = _2139;
    }
    float _2141 = _2105;
    if (_2019)
    {
        float _2143 = _2129 * _2129;
        _2095 = _2143;
    }
    float _2145 = _2095;
    if (_2019)
    {
        float _2147 = _2133 * _2133;
        _2137 = _2147;
    }
    float _2149 = _2137;
    float _2151 = _1979 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2153 = fma(_2141, _2141, _2145);
    float _2155 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2157 = _2153 + _2149;
    float _2159 = _1979 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2161 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2163 = fma(_2119, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2161);
    float _2165 = precise::clamp(_2163, 0.0, 1.0);
    float _2167 = rsqrt(_2157);
    float _2169 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2159);
    float _2171 = _1979 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2173 = -_2165;
    float _2175 = _2173 + 1.0;
    float _2177 = _1979 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2179 = fma(_1983, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2169);
    float _2181 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2171);
    float _2183 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2177);
    float _2185 = _2179 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2187 = fma(_1983, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2181);
    float _2189 = abs(_2175);
    float _2191 = log2(_2189);
    float _2193 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2151);
    float _2195 = _2185 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2197 = fma(_1983, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2183);
    float _2199 = _2187 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2201 = _2167 * _2129;
    float _2203 = -_2195;
    float _2205 = fma(_2203, _2155, 1.0);
    float _2207 = fma(_1983, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2193);
    float _2209 = _2197 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2211 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2213 = _2167 * _2141;
    float _2215 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2217 = _2167 * _2133;
    float _2219 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2211);
    float _2221 = _2207 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2223 = -_2215;
    float _2225 = fma(_2213, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2223);
    float _2227 = _2191 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2229 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2219);
    float _2231 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2233 = -_2217;
    float _2235 = fma(_2233, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2225);
    float _2237 = log2(_2205);
    float _2239 = fma(_2221, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2229);
    float _2241 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2243 = fma(_2235, -0.5, 0.5);
    float _2245 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2231);
    float _2247 = _2213 + 1.0;
    float _2249 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2241);
    float _2251 = fma(_2235, 0.5, 0.5);
    float _2253 = exp2(_2227);
    float _2255 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2245);
    float _2257 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2249);
    float _2259 = fma(_2251, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2261 = fma(_2251, _2259, -0.212114393711090087890625);
    float _2263 = 1.0 / _2239;
    float _2265 = _2237 * 0.693147182464599609375;
    float _2267 = fma(_2251, _2261, 1.570728778839111328125);
    float _2269 = _2265 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2271 = sqrt(_2243);
    float _2273 = -_2213;
    float _2275 = fma(_2253, _2247, _2273);
    float _2277 = fma(_2221, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2255);
    float _2279 = fma(_2221, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2257);
    float _2281 = fma(_2275, 0.5, 0.5);
    float _2283 = _2277 * _2263;
    float _2285 = _2279 * _2263;
    float _2287 = fma(_2283, 0.5, 0.5);
    float _2289 = fma(_2285, -0.5, 0.5);
    float _2291 = _2271 * 0.636619746685028076171875;
    float3 _5901 = float3(_2287, _2289, _2269);
    float _2293 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5901, float3(0.0), isnan(_5901)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5901, float3(0.0), isnan(_5901)), level(0.0)).x;
    float3 _5912 = float3(_2287, _2289, _2269);
    float4 _2296 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5912, float3(0.0), isnan(_5912)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5912, float3(0.0), isnan(_5912)), level(0.0)).xyzw;
    float _2298 = _2296.x;
    float _2300 = _2296.y;
    float _2302 = _2296.z;
    float _2304 = _2296.w;
    float _2306 = -_2267;
    float _2308 = fma(_2291, _2306, 1.0);
    float2 _5934 = float2(_2308, _2281);
    float3 _2312 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5934, float2(0.0), isnan(_5934)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5934, float2(0.0), isnan(_5934)), level(0.0)).xyz;
    float _2314 = _2312.x;
    float _2316 = _2312.y;
    float _2318 = _2312.z;
    float _2320 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2322 = _2191 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2324 = _2277 + _2239;
    float _2326 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2320);
    float _2328 = _2324 * 0.5;
    float _2330 = exp2(_2322);
    float _2332 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2326);
    float _2334 = fma(_2221, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2332);
    float _2336 = _2239 * 0.5;
    float _2338 = _2334 + _2239;
    float _2340 = -_2330;
    float _2342 = _2340 + 1.0;
    float _2344 = fma(_2279, -0.5, _2336);
    float _2346 = _2338 * 0.5;
    float _2348 = _2342 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2277;
    out.gl_Position.y = _2279;
    out.gl_Position.z = _2334;
    out.gl_Position.w = _2239;
    float _2350 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_64.x = _2328;
    out.m_64.y = _2344;
    out.m_64.z = _2346;
    out.m_64.w = _2239;
    out.m_47.x = _2350;
    float _2352 = _2348 * _2293;
    float _2354 = -_2348;
    float _2356 = _2354 + 1.0;
    float _2358 = _2304 * _2352;
    float _2360 = _2318 * _2352;
    float _2362 = fma(_2314, _2358, _2298);
    float _2364 = fma(_2316, _2358, _2300);
    float _2366 = _2304 * _2356;
    float _2368 = fma(_2304, _2360, _2302);
    out.m_66.x = _2362;
    out.m_66.y = _2364;
    out.m_66.z = _2368;
    out.m_66.w = _2366;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1849 = false;
    bool _625 = false;
    bool _285 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2425 = as_type<float>(_101);
        out.gl_Position.z = _2425;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = _119;
    if (_115)
    {
        float _123 = float(_85);
        _95 = _123;
    }
    float _125 = _95;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    float _133 = _125;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _137 = _135 * 5.0;
        _103 = as_type<int>(_137);
    }
    int _139 = _103;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2495 = as_type<float>(_139);
        out.gl_Position.z = _2495;
    }
    if (_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = in.m_51.w;
    float _143 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = in.m_49.x;
    float _157 = in.m_49.y;
    float _159 = in.m_49.z;
    float _161 = in.m_44.x;
    float _163 = in.m_44.y;
    float _165 = in.m_44.z;
    float _167 = 0.0;
    float _169 = _143;
    if (!_153)
    {
        float _171 = _143 * _143;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = _175;
    if (!_153)
    {
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _179;
    }
    float _181 = _177;
    bool _183 = !_153;
    float _185 = _181;
    if (!_183)
    {
        float _187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = log2(_187);
        float _191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _193 = _191 + 1.0;
        float _195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = _143 * _189;
        float _199 = 1.0 / _193;
        float _201 = _195 * 0.693147182464599609375;
        float _203 = exp2(_197);
        float _205 = 1.0 / _201;
        float _207 = _203 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _205, _143);
        float _213 = _211 * _199;
        float _215 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _215;
    }
    float _217 = _185;
    bool _219 = !_153;
    if (!_219)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = 1.0 / _227;
        float _231 = _143 * _223;
        float _233 = exp2(_231);
        float _235 = -_233;
        float _237 = _235 + 1.0;
        float _239 = _237 * _229;
        _169 = _239;
    }
    float _241 = _169;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _247 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _251 = fma(_241, _155, _245);
    float _253 = fma(_241, _157, _247);
    float _255 = fma(_241, _159, _249);
    float _257 = fma(_251, _141, _161);
    float _259 = fma(_253, _141, _163);
    float _261 = fma(_255, _141, _165);
    bool _263 = !_243;
    float _265 = _261;
    float _283;
    if (!_263)
    {
        float _267 = in.m_53.x;
        float _269 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _271 = _267 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _275 = _273 * _269;
        float _277 = floor(_275);
        float _279 = -_277;
        float _281 = _275 + _279;
        _283 = _281;
        _285 = true;
    }
    else
    {
        float _287 = float(_85);
        float _289 = 1.0 / _287;
        float _291 = _119 * _289;
        _283 = _291;
    }
    _285 = false;
    float _293 = _283;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _297 = _293 + _295;
    float _299 = as_type<float>(int(gl_VertexIndex));
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _317;
    float _321 = 1.0 / _303;
    float _323 = 1.0 / _307;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _327 = _293 + _325;
    float _329 = 1.0 / _315;
    float _331 = _327 * _321;
    bool _333 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _335 = isnan(_293);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    bool _345 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _347 = isnan(_293);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    int _357 = as_type<int>(_299) & 1;
    bool _359 = _357 != 0;
    int _361 = as_type<int>(_299) & 2;
    bool _363 = _361 != 0;
    float _365 = 1.0 / _319;
    float _367 = _297 * _323;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _371 = _293 + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _375 = _293 + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _377;
    bool _381 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _383 = 1.0 / _311;
    float _385 = _371 * _329;
    bool _387 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _389 = isnan(_293);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = fma(_379, _331, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _401 = -_397;
    float _403 = _401 + 1.0;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _407 = _293 + _405;
    float _409 = _355 * _403;
    float _411 = _407 * _365;
    bool _413 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _415 = isnan(_293);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _425;
    float _429 = _375 * _383;
    float _431 = -_343;
    float _433 = _431 + 1.0;
    bool _435 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _437 = isnan(_293);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = fma(_427, _331, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _449 = -_355;
    float _451 = _449 + 1.0;
    float _453 = _423 * _433;
    float _455 = -_423;
    float _457 = _455 + 1.0;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _463 = _445 * _451;
    float _465 = -_445;
    float _467 = _465 + 1.0;
    float _469 = _397 * _457;
    bool _471 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _473 = isnan(_293);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _487 = fma(_461, _367, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _489 = _481 * _467;
    float _491 = -_481;
    float _493 = _491 + 1.0;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _499;
    float _503 = _399 * _489;
    float _505 = _447 * _489;
    float _507 = fma(_485, _367, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _511 = _509 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _513 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[143].x, _503);
    float _515 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[143].y, _505);
    float _517 = fma(_497, _429, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _519 = in.m_51.x;
    float _521 = in.m_51.y;
    float _523 = fma(_501, _429, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _529 = fma(_507, _463, _513);
    float _531 = fma(_487, _463, _515);
    float _533 = fma(_527, _385, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _535;
    float _539 = fma(_517, _409, _529);
    float _541 = fma(_511, _385, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _543;
    float _547 = fma(_523, _409, _531);
    float _549 = fma(_537, _411, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _551 = fma(_533, _469, _539);
    float _553 = fma(_545, _411, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _555 = fma(_541, _469, _547);
    float _557 = fma(_549, _453, _551);
    float _559 = fma(_553, _453, _555);
    float _561 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[148].x, _557);
    float _563 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[148].y, _559);
    float _565 = _561 * _519;
    float _567 = _563 * _521;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _583 = !_359;
    float _585 = _583 ? (-0.5) : 0.5;
    float _587 = _569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _589 = !_363;
    float _591 = _589 ? (-0.5) : 0.5;
    float _593 = _571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _595 = _573 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _597 = _575 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _599 = _577 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _601 = _579 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _603 = !_381;
    float _605 = _593;
    float _623;
    if (!_603)
    {
        float _607 = in.m_53.x;
        float _609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _611 = _607 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _613 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[14].x, _119);
        float _615 = _613 * _609;
        float _617 = floor(_615);
        float _619 = -_617;
        float _621 = _615 + _619;
        _623 = _621;
        _625 = true;
    }
    else
    {
        float _627 = float(_85);
        float _629 = 1.0 / _627;
        float _631 = _119 * _629;
        _623 = _631;
    }
    _625 = false;
    float _633 = _623;
    float _635 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _637 = log2(_635);
    float _639 = in.m_53.z;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _649 = 1.0 / _643;
    float _651 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _661 = _565 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _663 = 1.0 / _647;
    float _665 = _637 * _119;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _671;
    int _675 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _677 = _675 != 0;
    int _679 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _681 = _679 != 0;
    int _683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _685 = _683 != 0;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _691 = 1.0 / _655;
    float _693 = _673 * _649;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _699 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _651);
    float _701 = in.m_53.x;
    float _703 = in.m_53.y;
    float _705 = exp2(_665);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _711 = _697 * _663;
    bool _713 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _715 = isnan(1.0);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _721 = _717 || _719;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _725 = 1.0 + _723;
    float _727 = _709 * _691;
    float _729 = 1.0 / _659;
    float _731 = _639 * 2.0;
    bool _733 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _735 = isnan(0.0);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _741 = _737 || _739;
    float _743 = _567 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _745 = 1.0 / _669;
    float _747 = _703 + _639;
    float _749 = _703 * 2.0;
    float _751 = 1.0 / _689;
    float _753 = (*spvDescriptorSet0.vp_c10)._m0[9].y * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _755 = (*spvDescriptorSet0.vp_c10)._m0[9].y * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _757 = _747 + (-1.0);
    float _759 = fma((*spvDescriptorSet0.vp_c10)._m0[8].y, (*spvDescriptorSet0.vp_c8)._m0[0].x, _753);
    float _761 = fma((*spvDescriptorSet0.vp_c10)._m0[8].y, (*spvDescriptorSet0.vp_c8)._m0[1].x, _755);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _763;
    float _767 = 1.0 / _725;
    float _769 = _701 * 2.0;
    float _771 = _765 * _745;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _773;
    float _777 = floor(_731);
    float _779 = _775 * _751;
    float _781 = _703 + _701;
    float _783 = floor(_769);
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _789 = _787 * _729;
    float _791 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _797 = floor(_749);
    float _799 = -_705;
    float _801 = _799 + 1.0;
    float _803 = _781 + (-1.0);
    bool _805 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _807 = isnan(_633);
    bool _809 = _805 || _807;
    bool _811 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _813 = _809 || _811;
    float _815 = float(_813);
    bool _817 = _777 >= 0.0;
    bool _819 = isnan(_777);
    bool _821 = _817 || _819;
    bool _823 = isnan(0.0);
    bool _825 = _821 || _823;
    float _827 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _829 = _741 ? _801 : 0.0;
    float _831 = 1.0 / _795;
    bool _833 = _783 > 0.0;
    float _835 = _701;
    float _837 = _703;
    if (_721)
    {
        float _839 = _829 * _767;
        _121 = _839;
    }
    float _841 = _121;
    bool _843 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _845 = isnan(_633);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _855;
    bool _859 = _783 >= 0.0;
    bool _861 = isnan(_783);
    bool _863 = _859 || _861;
    bool _865 = isnan(0.0);
    bool _867 = _863 || _865;
    bool _869 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _871 = isnan(_633);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = -_853;
    float _883 = _881 + 1.0;
    bool _885 = _777 > 0.0;
    float _887 = _815 * _883;
    int _889 = _825 ? 0 : 1;
    float _891 = -_815;
    float _893 = _891 + 1.0;
    int _895 = _867 ? 0 : 1;
    float _897 = -_879;
    float _899 = _897 + 1.0;
    bool _901 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _903 = isnan(_633);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _909 = _905 || _907;
    float _911 = float(_909);
    float _913 = _857 * _831;
    bool _915 = _797 > 0.0;
    float _917 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _699);
    bool _919 = _797 >= 0.0;
    bool _921 = isnan(_797);
    bool _923 = _919 || _921;
    bool _925 = isnan(0.0);
    bool _927 = _923 || _925;
    float _929 = _879 * _893;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _933 = _633 + _931;
    bool _935 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _937 = isnan(_633);
    bool _939 = _935 || _937;
    bool _941 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _943 = _939 || _941;
    float _945 = float(_943);
    float _947 = _911 * _899;
    float _949 = -_911;
    float _951 = _949 + 1.0;
    bool _953 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _955 = isnan(_633);
    bool _957 = _953 || _955;
    bool _959 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _961 = _957 || _959;
    float _963 = float(_961);
    float _965 = fma((*spvDescriptorSet0.vp_c10)._m0[10].y, (*spvDescriptorSet0.vp_c8)._m0[0].z, _759);
    float _967 = fma((*spvDescriptorSet0.vp_c10)._m0[10].y, (*spvDescriptorSet0.vp_c8)._m0[1].z, _761);
    float _969 = fma(_693, _933, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _973 = _633 + _971;
    float _975 = _945 * _951;
    float _977 = -_945;
    float _979 = _977 + 1.0;
    bool _981 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _983 = isnan(_633);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _989 = _985 || _987;
    float _991 = float(_989);
    float _993 = -_963;
    float _995 = _993 + 1.0;
    float _997 = fma(_711, _973, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _999 = _963 * _979;
    bool _1001 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1003 = isnan(_633);
    bool _1005 = _1001 || _1003;
    bool _1007 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1009 = _1005 || _1007;
    float _1011 = float(_1009);
    float _1013 = _991 * _995;
    float _1015 = -_991;
    float _1017 = _1015 + 1.0;
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1021 = _633 + _1019;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1025 = _633 + _1023;
    float _1027 = rsqrt(_917);
    float _1029 = _1011 * _1017;
    float _1031 = fma(_771, _1021, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1033 = fma(_727, _1025, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1037 = _633 + _1035;
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1041 = _633 + _1039;
    float _1043 = _969 * _1029;
    float _1045 = -_1011;
    float _1047 = _1045 + 1.0;
    float _1049 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1051 = _633 + _1049;
    int _1053 = _927 ? 0 : 1;
    float _1055 = fma(_779, _1037, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1057 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1043);
    float _1059 = fma(_913, _1051, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _1061 = !_677;
    int _1063 = _1061 ? 0 : 1;
    float _1065 = fma(_789, _1041, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _1067 = ~_895;
    int _1069 = _1067 + 1;
    int _1071 = _1069 + 1;
    float _1073 = fma(_997, _1013, _1057);
    int _1075 = ~_1053;
    int _1077 = _1075 + 1;
    int _1079 = _1077 + 1;
    int _1081 = _1071;
    int _1083 = _1079;
    float _1085 = _965;
    bool _1087 = _927;
    if (!_833)
    {
        int _1089 = ~_895;
        int _1091 = _1089 + 1;
        _1081 = _1091;
    }
    int _1093 = _1081;
    float _1095 = fma(_1031, _999, _1073);
    if (!_915)
    {
        int _1097 = ~_1053;
        int _1099 = _1097 + 1;
        _1083 = _1099;
    }
    int _1101 = _1083;
    bool _1103 = !_685;
    int _1105 = _1103 ? 0 : 1;
    float _1107 = fma(_1033, _975, _1095);
    int _1109 = ~_889;
    int _1111 = _1109 + 1;
    int _1113 = _1111 + 1;
    float _1115 = _701 + (-0.5);
    int _1117 = abs(_1063);
    float _1119 = fma(_1055, _947, _1107);
    float _1121 = abs(_967);
    bool _1123 = _1121 > 0.001000000047497451305389404296875;
    float _1125 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    int _1127 = _1113;
    if (!_885)
    {
        int _1129 = ~_889;
        int _1131 = _1129 + 1;
        _1127 = _1131;
    }
    int _1133 = _1127;
    float _1135 = fma(_1065, _929, _1119);
    bool _1137 = !_681;
    int _1139 = _1137 ? 0 : 1;
    int _1141 = abs(_1105);
    float _1143 = fma(_1059, _887, _1135);
    float _1145 = _1123 ? 0.0 : 9.9999997473787516355514526367188e-05;
    float _1147 = _703 + (-0.5);
    float _1149 = float(_1117);
    float _1151 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1143);
    float _1153 = float(_1133);
    float _1155 = _1147 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    int _1157 = abs(_1139);
    float _1159 = _967 + _1145;
    float _1161 = float(_1093);
    float _1163 = _1149 * _1153;
    float _1165 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1167 = _1163 * (-2.0);
    float _1169 = float(_1157);
    float _1171 = float(_1101);
    float _1173 = fma(_827, _1167, _827);
    float _1175 = abs(_965);
    float _1177 = abs(_1159);
    float _1179 = precise::max(_1175, _1177);
    float _1181 = _1169 * _1161;
    float _1183 = float(_1141);
    float _1185 = fma(_1173, _841, _1125);
    bool _1187 = _1179 >= 16.0;
    float _1189 = _1181 * (-2.0);
    float _1191 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1193 = _1183 * _1171;
    float _1195 = _1185 * 0.15915493667125701904296875;
    float _1197 = fma(_791, _1189, _791);
    float _1199 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1201 = _1191 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1203 = _639 + _701;
    float _1205 = _1193 * (-2.0);
    float _1207 = fma(_1199, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1201);
    float _1209 = _1203 + (-1.0);
    float _1211 = _1159;
    if (_1187)
    {
        float _1213 = _965 * 0.0625;
        _1085 = _1213;
    }
    float _1215 = _1085;
    if (_1187)
    {
        float _1217 = _1159 * 0.0625;
        _1211 = _1217;
    }
    float _1219 = _1211;
    float _1221 = fma(_1165, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1207);
    float _1223 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1225 = fma(_1197, _841, _1155);
    float _1227 = abs(_1215);
    bool _1229 = _1227 != 0.0;
    bool _1231 = isnan(_1227);
    bool _1233 = _1229 || _1231;
    bool _1235 = isnan(0.0);
    bool _1237 = _1233 || _1235;
    float _1239 = _1151 * _1221;
    float _1241 = _639 + (-0.5);
    float _1243 = fma(_1223, _1205, _1223);
    float _1245 = abs(_1219);
    bool _1247 = _1245 == 0.0;
    bool _1249 = !_1237;
    bool _1251 = _1247 && _1249;
    float _1253 = fma(_1239, _1205, _1239);
    float _1255 = _1225 * 0.15915493667125701904296875;
    float _1257 = _1195 * 6.283185482025146484375;
    float _1259 = sin(_1257);
    float _1261 = abs(_1219);
    bool _1263 = _1261 == 0.0;
    float _1265 = fma(_1241, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1253);
    float _1267 = _1191 * _1191;
    float _1269 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _591);
    float _1271 = fma(_1243, _841, _1265);
    float _1273 = fma(_1199, _1199, _1267);
    float _1275 = _1195 * 6.283185482025146484375;
    float _1277 = cos(_1275);
    float _1279 = _743 * _1269;
    int _1281 = as_type<int>(_1255);
    if (_1251)
    {
        bool _1283 = as_type<int>(_1219) >= 0;
        _1087 = _1283;
    }
    bool _1285 = _1087;
    float _1287 = fma(_1165, _1165, _1273);
    float _1289 = _1255 * 6.283185482025146484375;
    float _1291 = sin(_1289);
    float _1293 = _1271 * 0.15915493667125701904296875;
    float _1295 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _585);
    float _1297 = _661 * _1295;
    float _1299 = _1255 * 6.283185482025146484375;
    float _1301 = cos(_1299);
    float _1303 = _1293 * 6.283185482025146484375;
    float _1305 = sin(_1303);
    float _1307 = _1295;
    int _1309 = _1285 ? (-1) : 0;
    if (_1251)
    {
        int _1311 = _1285 ? 0 : 1078530011;
        _1281 = _1311;
    }
    int _1313 = _1281;
    float _1315 = _1277 * _1291;
    int _1317 = _1313;
    if (_1251)
    {
        int _1319 = int(0x80000000) & as_type<int>(_1215);
        int _1321 = _1313 | _1319;
        _1307 = as_type<float>(_1321);
    }
    float _1323 = _1307;
    float _1325 = _1293 * 6.283185482025146484375;
    float _1327 = cos(_1325);
    float _1329 = _1259 * _1301;
    bool _1331 = !_1237;
    bool _1333 = _1331 && _1263;
    float _1335 = _1323;
    float _1337 = _1323;
    if (!_1333)
    {
        float _1339 = abs(_1215);
        bool _1341 = _1339 != as_type<float>(0x7f800000u /* inf */);
        bool _1343 = isnan(_1339);
        bool _1345 = _1341 || _1343;
        bool _1347 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1349 = _1345 || _1347;
        float _1351 = abs(_1219);
        bool _1353 = _1351 == as_type<float>(0x7f800000u /* inf */);
        float _1355 = abs(_1219);
        bool _1357 = _1355 == as_type<float>(0x7f800000u /* inf */);
        bool _1359 = !_1349;
        bool _1361 = _1357 && _1359;
        if (_1361)
        {
            bool _1363 = as_type<int>(_1219) >= 0;
            _1309 = _1363 ? (-1) : 0;
        }
        int _1365 = _1309;
        if (_1361)
        {
            _1317 = 1075235812;
        }
        int _1367 = _1317;
        int _1369 = _1367;
        if (_1361)
        {
            int _1371 = ~_1365;
            int _1373 = (_1371 != 0) ? _1367 : 1061752795;
            _1369 = _1373;
        }
        int _1375 = _1369;
        if (_1361)
        {
            int _1377 = int(0x80000000) & as_type<int>(_1215);
            int _1379 = _1375 | _1377;
            _1335 = as_type<float>(_1379);
        }
        float _1381 = _1335;
        bool _1383 = !_1349;
        bool _1385 = _1383 && _1353;
        _1337 = _1381;
        if (!_1385)
        {
            float _1387 = abs(_1215);
            float _1389 = abs(_1219);
            float _1391 = precise::max(_1387, _1389);
            float _1393 = abs(_1215);
            float _1395 = abs(_1219);
            float _1397 = precise::min(_1393, _1395);
            float _1399 = 1.0 / _1391;
            float _1401 = abs(_1215);
            float _1403 = abs(_1219);
            bool _1405 = _1401 > _1403;
            bool _1407 = as_type<int>(_1219) >= 0;
            float _1409 = _1397 * _1399;
            float _1411 = _1409 * _1409;
            float _1413 = _1411 + 11.33538818359375;
            float _1415 = fma(_1411, _1413, 28.84246826171875);
            float _1417 = fma(_1411, _1415, 19.6966705322265625);
            float _1419 = fma(_1411, -0.82336294651031494140625, -5.674867153167724609375);
            float _1421 = fma(_1411, _1419, -6.565555095672607421875);
            float _1423 = 1.0 / _1417;
            float _1425 = _1411 * _1421;
            float _1427 = abs(_1215);
            float _1429 = abs(_1219);
            float _1431 = _1427 + _1429;
            int _1433 = as_type<int>(_1215) & int(0x80000000);
            float _1435 = _1409 * _1425;
            bool _1437 = _1431 > as_type<float>(0x7f800000u /* inf */);
            bool _1439 = isnan(_1431);
            bool _1441 = _1437 || _1439;
            bool _1443 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1445 = _1441 || _1443;
            float _1447 = fma(_1435, _1423, _1409);
            float _1449 = _1447;
            _1337 = _1431;
            if (_1405)
            {
                float _1451 = -_1447;
                float _1453 = _1451 + 1.57079637050628662109375;
                _1449 = _1453;
            }
            float _1455 = _1449;
            int _1457 = as_type<int>(_1455);
            if (!_1407)
            {
                float _1459 = -_1455;
                float _1461 = _1459 + 3.1415927410125732421875;
                _1457 = as_type<int>(_1461);
            }
            int _1463 = _1457;
            if (!_1445)
            {
                int _1465 = _1433 | _1463;
                _1337 = as_type<float>(_1465);
            }
        }
    }
    float _1467 = _1337;
    float _1469 = _1259 * _1291;
    float _1471 = _1277 * _1301;
    float _1473 = _1467 * (-0.15915493667125701904296875);
    float _1475 = _1327 * _1279;
    float _1477 = -_1315;
    float _1479 = fma(_1305, _1329, _1477);
    float _1481 = -_1329;
    float _1483 = fma(_1305, _1315, _1481);
    float _1485 = _1291 * _1327;
    float _1487 = _1301 * _1327;
    float _1489 = rsqrt(_1287);
    float _1491 = fma(_1305, _1471, _1469);
    float _1493 = _1277 * _1475;
    float _1495 = fma(_1305, _1469, _1471);
    float _1497 = -_1279;
    float _1499 = _1305 * _1497;
    float _1501 = _1259 * _1475;
    float _1503 = fma(_1491, _1297, _1493);
    float _1505 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1507 = _1473 * 6.283185482025146484375;
    float _1509 = cos(_1507);
    float _1511 = fma(_1487, _1297, _1499);
    float _1513 = fma(_1479, _1297, _1501);
    float _1515 = fma(_1483, _1505, _1503);
    float _1517 = fma(_1485, _1505, _1511);
    float _1519 = fma(_1495, _1505, _1513);
    float _1521 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1523 = _1473 * 6.283185482025146484375;
    float _1525 = sin(_1523);
    float _1527 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1529 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1531 = _1199 * _1489;
    float _1533 = _1165 * _1489;
    float _1535 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1521);
    float _1537 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1527);
    float _1539 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1529);
    float _1541 = -_1509;
    float _1543 = _1541 + 1.0;
    float _1545 = _1191 * _1489;
    float _1547 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1535);
    float _1549 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1537);
    float _1551 = _1531 * _1543;
    float _1553 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1539);
    float _1555 = _1547 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1557 = _1533 * _1533;
    float _1559 = _1533 * _1525;
    float _1561 = fma(_1531, _1551, _1509);
    float _1563 = _1549 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1565 = fma(_1543, _1557, _1509);
    float _1567 = -_1559;
    float _1569 = fma(_1545, _1551, _1567);
    float _1571 = _1531 * _1525;
    float _1573 = _1545 * _1543;
    float _1575 = _1553 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1577 = _1555 * _1569;
    float _1579 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1581 = fma(_1533, _1573, _1571);
    float _1583 = fma(_1545, _1573, _1509);
    float _1585 = fma(_1563, _1561, _1577);
    float _1587 = _1545 * _1525;
    float _1589 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1591 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1579);
    float _1593 = _1555 * _1581;
    float _1595 = -_1587;
    float _1597 = fma(_1533, _1551, _1595);
    float _1599 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1589);
    float _1601 = fma(_1533, _1551, _1587);
    float _1603 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1591);
    float _1605 = fma(_1563, _1597, _1593);
    float _1607 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1599);
    float _1609 = fma(_1575, _1601, _1585);
    float _1611 = _1603 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1613 = fma(_1575, _1565, _1605);
    float _1615 = _1607 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1617 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1619 = _1611 + _1609;
    float _1621 = fma(_1545, _1551, _1559);
    float _1623 = _1615 + _1613;
    float _1625 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1617);
    float _1627 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1629 = _1619 + _1627;
    float _1631 = _1555 * _1583;
    float _1633 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1635 = _1623 + _1633;
    float _1637 = -_1571;
    float _1639 = fma(_1533, _1573, _1637);
    float _1641 = _1629 * _1629;
    float _1643 = fma(_1563, _1621, _1631);
    float _1645 = _1635 * _1635;
    float _1647 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1625);
    float _1649 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1651 = fma(_1575, _1639, _1643);
    float _1653 = _1641 + _1645;
    float _1655 = _1647 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1657 = _701 > 0.5;
    float _1659 = _1655 + _1651;
    float _1661 = sqrt(_1653);
    int _1663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1665 = _1663 != 0;
    int _1667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1669 = _1667 != 0;
    bool _1671 = _703 > 0.5;
    bool _1673 = _1661 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1675 = _1625;
    float _1677 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1679 = _1611;
    if (!_1673)
    {
        _265 = _1645;
    }
    float _1681 = _265;
    float _1683 = _1681;
    if (!_1673)
    {
        _835 = _1641;
    }
    float _1685 = _835;
    float _1687 = _1685;
    if (!_1673)
    {
        _1675 = _1619;
    }
    float _1689 = _1675;
    float _1691 = _1689;
    if (!_1673)
    {
        _837 = _1623;
    }
    float _1693 = _837;
    float _1695 = _1693;
    if (!_1673)
    {
        _1677 = _1659;
    }
    float _1697 = _1677;
    bool _1699 = !_1673;
    float _1701 = _1697;
    if (!_1699)
    {
        float _1703 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1705 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1707 = _1661 + _1705;
        float _1709 = _1659 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1711 = rsqrt(_1653);
        float _1713 = _1707 * _1703;
        float _1715 = _1713 * 0.15915493667125701904296875;
        float _1717 = _1715 * 6.283185482025146484375;
        float _1719 = sin(_1717);
        float _1721 = _1715 * 6.283185482025146484375;
        float _1723 = cos(_1721);
        float _1725 = fma(_1719, _1709, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1727 = _1711 * _1725;
        float _1729 = _1723 + (-1.0);
        float _1731 = fma(_1629, _1727, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1733 = fma(_1635, _1727, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1735 = _1729 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1737 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1739 = _1731 + _1737;
        float _1741 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1743 = _1733 + _1741;
        float _1745 = fma(_1659, _1723, _1735);
        float _1747 = _1739 * _1739;
        float _1749 = _1743 * _1743;
        _1701 = _1745;
        _1687 = _1747;
        _1683 = _1749;
        _1691 = _1731;
        _1695 = _1733;
    }
    float _1751 = _1701;
    float _1753 = _1687;
    float _1755 = _1683;
    float _1757 = _1691;
    float _1759 = _1695;
    float _1761 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1763 = _1751 + _1761;
    float _1765 = -_585;
    int _1767 = _1657 ? as_type<int>(_1765) : as_type<int>(_585);
    float _1769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1771 = -_591;
    int _1773 = _1671 ? as_type<int>(_1771) : as_type<int>(_591);
    float _1775 = fma(_1763, _1763, _1753);
    bool _1777 = !_1665;
    float _1779 = _1777 ? _585 : as_type<float>(_1767);
    out.m_58.x = _587;
    out.m_58.y = _593;
    out.m_58.z = _595;
    out.m_58.w = _581;
    bool _1781 = !_1669;
    float _1783 = _1781 ? _591 : as_type<float>(_1773);
    float _1785 = _1775 + _1755;
    float _1787 = _1779 + 0.5;
    out.m_60.x = _597;
    out.m_60.y = _599;
    out.m_60.z = _601;
    float _1789 = -_1783;
    float _1791 = _1789 + 0.5;
    float _1793 = sqrt(_1785);
    float _1795 = _1787 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1797 = _1791 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1799 = _1795 * _1649;
    float _1801 = _1797 * _1769;
    out.m_62.x = _1799;
    out.m_62.y = _1801;
    bool _1803 = _1793 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1805 = isnan(_1793);
    bool _1807 = _1803 || _1805;
    bool _1809 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1811 = _1807 || _1809;
    float _1813 = _1753;
    if (!_1811)
    {
        _1813 = 1.0;
    }
    float _1815 = _1813;
    bool _1817 = !_1811;
    float _1819 = _1815;
    if (!_1817)
    {
        bool _1821 = _1793 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1823 = isnan(_1793);
        bool _1825 = _1821 || _1823;
        bool _1827 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1829 = _1825 || _1827;
        if (!_1829)
        {
            float _1831 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1833 = _1793 + _1831;
            float _1835 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1837 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1835;
            float _1839 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1841 = _1839 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1843 = 1.0 / _1837;
            float _1845 = _1833 * _1843;
            float _1847 = fma(_1845, _1841, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1819 = _1847;
            _605 = _1841;
            _1849 = true;
        }
        else
        {
            bool _1851 = _1793 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1853 = isnan(_1793);
            bool _1855 = _1851 || _1853;
            bool _1857 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1859 = _1855 || _1857;
            if (!_1859)
            {
                float _1861 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1863 = _1793 + _1861;
                float _1865 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1867 = _1865 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1869 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1871 = _1869 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1873 = 1.0 / _1867;
                float _1875 = _1863 * _1873;
                float _1877 = fma(_1875, _1871, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1819 = _1877;
                _605 = _1871;
                _1849 = true;
            }
            else
            {
                _1819 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1849 = false;
    float _1879 = _1819;
    float _1881 = _605;
    float _1883 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1885 = _1757 + _1883;
    float _1887 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1889 = _1751 + _1887;
    float _1891 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1893 = _1759 + _1891;
    bool _1895 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1897 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1899 = _1895 || _1897;
    bool _1901 = isnan(0.5);
    bool _1903 = _1899 || _1901;
    float _1905 = fma(_1885, _1879, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1907 = fma(_1889, _1879, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1909 = fma(_1893, _1879, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1911 = _1889;
    float _1913 = _1881;
    float _1915 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (_1903)
    {
        _1911 = _1905;
    }
    float _1917 = _1911;
    float _1919 = _1917;
    if (_1903)
    {
        _1913 = _1907;
    }
    float _1921 = _1913;
    float _1923 = _1921;
    if (_1903)
    {
        _1915 = _1909;
    }
    float _1925 = _1915;
    float _1927 = _1925;
    if (!_1903)
    {
        float _1929 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1931 = _1655 + _1929;
        float _1933 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1935 = _1611 + _1933;
        float _1937 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1939 = -_1615;
        float _1941 = _1939 + _1909;
        float _1943 = _1931 * _1931;
        float _1945 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1947 = _1615 + _1945;
        float _1949 = fma(_1935, _1935, _1943);
        float _1951 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1953 = fma(_1947, _1947, _1949);
        float _1955 = sqrt(_1953);
        float _1957 = _1937 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1959 = precise::min(_1955, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1961 = _1959 * _1951;
        float _1963 = -_1611;
        float _1965 = _1963 + _1905;
        float _1967 = _1957 * _1961;
        float _1969 = -_1655;
        float _1971 = _1969 + _1907;
        float _1973 = fma(_1965, _1967, _1611);
        float _1975 = fma(_1971, _1967, _1655);
        float _1977 = fma(_1941, _1967, _1615);
        _1923 = _1975;
        _1919 = _1973;
        _1927 = _1977;
    }
    float _1979 = _1923;
    float _1981 = _1919;
    float _1983 = _1927;
    float _1985 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1987 = _1979 + _1985;
    float _1989 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1991 = _1981 + _1989;
    float _1993 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1995 = _1983 + _1993;
    float _1997 = _1987 * _1987;
    float _1999 = fma(_1991, _1991, _1997);
    float _2001 = fma(_1995, _1995, _1999);
    float _2003 = rsqrt(_2001);
    float _2005 = _2003 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2007 = _1991 * _2005;
    float _2009 = _1995 * _2005;
    float _2011 = _2007 * _2007;
    float _2013 = _2009 * _2009;
    float _2015 = _2011 + _2013;
    float _2017 = sqrt(_2015);
    bool _2019 = _2017 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2021 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2023 = _2017 + _2021;
    float _2025 = _1909;
    float _2027 = _2015;
    float _2029 = _2023;
    float _2031 = _1987;
    float _2033 = _2005;
    float _2035 = _2007;
    if (_2019)
    {
        float _2037 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2025 = _2037;
    }
    float _2039 = _2025;
    if (_2019)
    {
        float _2041 = rsqrt(_2015);
        _2027 = _2041;
    }
    float _2043 = _2027;
    float _2045 = _2039;
    if (_2019)
    {
        float _2047 = _2023 * _2039;
        _2029 = _2047;
    }
    float _2049 = _2029;
    if (_2019)
    {
        float _2051 = _2049 * 0.15915493667125701904296875;
        _2045 = _2051;
    }
    float _2053 = _2045;
    float _2055 = _2003;
    float _2057 = _2053;
    if (_2019)
    {
        float _2059 = _2053 * 6.283185482025146484375;
        float _2061 = sin(_2059);
        _2055 = _2061;
    }
    float _2063 = _2055;
    float _2065 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2067 = precise::max(0.0, _2065);
    float _2069 = _1995;
    float _2071 = _2067;
    if (_2019)
    {
        float _2073 = _2053 * 6.283185482025146484375;
        float _2075 = cos(_2073);
        _2069 = _2075;
    }
    float _2077 = _2069;
    float _2079 = -_2005;
    float _2081 = -_2067;
    float _2083 = fma(_1987, _2079, _2081);
    if (_2019)
    {
        float _2085 = _2083 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2031 = _2085;
    }
    float _2087 = _2031;
    float _2089 = _2087;
    if (!_2019)
    {
        _2057 = _2011;
    }
    float _2091 = _2057;
    float _2093 = _2063;
    float _2095 = _2091;
    if (_2019)
    {
        float _2097 = fma(_2063, _2087, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2089 = _2097;
    }
    float _2099 = _2089;
    float _2101 = _2099;
    if (!_2019)
    {
        _2093 = _2083;
    }
    float _2103 = _2093;
    float _2105 = _2103;
    if (_2019)
    {
        float _2107 = _2077 + (-1.0);
        _2071 = _2107;
    }
    float _2109 = _2071;
    float _2111 = _2109;
    if (_2019)
    {
        float _2113 = _2043 * _2099;
        _1679 = _2113;
    }
    float _2115 = _1679;
    if (!_2019)
    {
        _2101 = _2009;
    }
    float _2117 = _2101;
    float _2119 = sqrt(_2001);
    float _2121 = _2117;
    if (_2019)
    {
        float _2123 = _2109 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2033 = _2123;
    }
    float _2125 = _2033;
    if (_2019)
    {
        float _2127 = _2007 * _2115;
        _2035 = _2127;
    }
    float _2129 = _2035;
    if (_2019)
    {
        float _2131 = _2009 * _2115;
        _2121 = _2131;
    }
    float _2133 = _2121;
    if (!_2019)
    {
        _2111 = _2013;
    }
    float _2135 = _2111;
    float _2137 = _2135;
    if (_2019)
    {
        float _2139 = fma(_2083, _2077, _2125);
        _2105 = _2139;
    }
    float _2141 = _2105;
    if (_2019)
    {
        float _2143 = _2129 * _2129;
        _2095 = _2143;
    }
    float _2145 = _2095;
    if (_2019)
    {
        float _2147 = _2133 * _2133;
        _2137 = _2147;
    }
    float _2149 = _2137;
    float _2151 = _1979 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2153 = fma(_2141, _2141, _2145);
    float _2155 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2157 = _2153 + _2149;
    float _2159 = _1979 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2161 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2163 = fma(_2119, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2161);
    float _2165 = precise::clamp(_2163, 0.0, 1.0);
    float _2167 = rsqrt(_2157);
    float _2169 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2159);
    float _2171 = _1979 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2173 = -_2165;
    float _2175 = _2173 + 1.0;
    float _2177 = _1979 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2179 = fma(_1983, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2169);
    float _2181 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2171);
    float _2183 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2177);
    float _2185 = _2179 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2187 = fma(_1983, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2181);
    float _2189 = abs(_2175);
    float _2191 = log2(_2189);
    float _2193 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2151);
    float _2195 = _2185 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2197 = fma(_1983, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2183);
    float _2199 = _2187 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2201 = _2167 * _2129;
    float _2203 = -_2195;
    float _2205 = fma(_2203, _2155, 1.0);
    float _2207 = fma(_1983, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2193);
    float _2209 = _2197 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2211 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2213 = _2167 * _2141;
    float _2215 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2217 = _2167 * _2133;
    float _2219 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2211);
    float _2221 = _2207 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2223 = -_2215;
    float _2225 = fma(_2213, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2223);
    float _2227 = _2191 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2229 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2219);
    float _2231 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2233 = -_2217;
    float _2235 = fma(_2233, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2225);
    float _2237 = log2(_2205);
    float _2239 = fma(_2221, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2229);
    float _2241 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2243 = fma(_2235, -0.5, 0.5);
    float _2245 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2231);
    float _2247 = _2213 + 1.0;
    float _2249 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2241);
    float _2251 = fma(_2235, 0.5, 0.5);
    float _2253 = exp2(_2227);
    float _2255 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2245);
    float _2257 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2249);
    float _2259 = fma(_2251, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2261 = fma(_2251, _2259, -0.212114393711090087890625);
    float _2263 = 1.0 / _2239;
    float _2265 = _2237 * 0.693147182464599609375;
    float _2267 = fma(_2251, _2261, 1.570728778839111328125);
    float _2269 = _2265 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2271 = sqrt(_2243);
    float _2273 = -_2213;
    float _2275 = fma(_2253, _2247, _2273);
    float _2277 = fma(_2221, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2255);
    float _2279 = fma(_2221, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2257);
    float _2281 = fma(_2275, 0.5, 0.5);
    float _2283 = _2277 * _2263;
    float _2285 = _2279 * _2263;
    float _2287 = fma(_2283, 0.5, 0.5);
    float _2289 = fma(_2285, -0.5, 0.5);
    float _2291 = _2271 * 0.636619746685028076171875;
    float3 _5901 = float3(_2287, _2289, _2269);
    float _2293 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5901, float3(0.0), isnan(_5901)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5901, float3(0.0), isnan(_5901)), level(0.0)).x;
    float3 _5912 = float3(_2287, _2289, _2269);
    float4 _2296 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5912, float3(0.0), isnan(_5912)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5912, float3(0.0), isnan(_5912)), level(0.0)).xyzw;
    float _2298 = _2296.x;
    float _2300 = _2296.y;
    float _2302 = _2296.z;
    float _2304 = _2296.w;
    float _2306 = -_2267;
    float _2308 = fma(_2291, _2306, 1.0);
    float2 _5934 = float2(_2308, _2281);
    float3 _2312 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5934, float2(0.0), isnan(_5934)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5934, float2(0.0), isnan(_5934)), level(0.0)).xyz;
    float _2314 = _2312.x;
    float _2316 = _2312.y;
    float _2318 = _2312.z;
    float _2320 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2322 = _2191 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2324 = _2277 + _2239;
    float _2326 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2320);
    float _2328 = _2324 * 0.5;
    float _2330 = exp2(_2322);
    float _2332 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2326);
    float _2334 = fma(_2221, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2332);
    float _2336 = _2239 * 0.5;
    float _2338 = _2334 + _2239;
    float _2340 = -_2330;
    float _2342 = _2340 + 1.0;
    float _2344 = fma(_2279, -0.5, _2336);
    float _2346 = _2338 * 0.5;
    float _2348 = _2342 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2277;
    out.gl_Position.y = _2279;
    out.gl_Position.z = _2334;
    out.gl_Position.w = _2239;
    float _2350 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_64.x = _2328;
    out.m_64.y = _2344;
    out.m_64.z = _2346;
    out.m_64.w = _2239;
    out.m_47.x = _2350;
    float _2352 = _2348 * _2293;
    float _2354 = -_2348;
    float _2356 = _2354 + 1.0;
    float _2358 = _2304 * _2352;
    float _2360 = _2318 * _2352;
    float _2362 = fma(_2314, _2358, _2298);
    float _2364 = fma(_2316, _2358, _2300);
    float _2366 = _2304 * _2356;
    float _2368 = fma(_2304, _2360, _2302);
    out.m_66.x = _2362;
    out.m_66.y = _2364;
    out.m_66.z = _2368;
    out.m_66.w = _2366;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

