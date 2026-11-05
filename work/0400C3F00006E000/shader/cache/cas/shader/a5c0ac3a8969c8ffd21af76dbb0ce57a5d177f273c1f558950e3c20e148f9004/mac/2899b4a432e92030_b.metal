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
    float4 m_60 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _901 = false;
    bool _475 = false;
    bool _281 = false;
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
        float _1719 = as_type<float>(_101);
        out.gl_Position.z = _1719;
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
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1788 = as_type<float>(_137);
        out.gl_Position.z = _1788;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_51.w;
    float _141 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _143 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _145 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _147 = _143 || _145;
    bool _149 = isnan(1.0);
    bool _151 = _147 || _149;
    float _153 = in.m_49.x;
    float _155 = in.m_49.y;
    float _157 = in.m_49.z;
    float _159 = in.m_44.x;
    float _161 = in.m_44.y;
    float _163 = in.m_44.z;
    float _165 = 0.0;
    float _167 = _141;
    if (!_151)
    {
        float _169 = _141 * _141;
        float _171 = _169 * 0.5;
        _165 = _171;
    }
    float _173 = _165;
    float _175 = _173;
    if (!_151)
    {
        float _177 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _177;
    }
    float _179 = _175;
    bool _181 = !_151;
    float _183 = _179;
    if (!_181)
    {
        float _185 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _187 = log2(_185);
        float _189 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _191 = _189 + 1.0;
        float _193 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = _141 * _187;
        float _197 = 1.0 / _191;
        float _199 = _193 * 0.693147182464599609375;
        float _201 = exp2(_195);
        float _203 = 1.0 / _199;
        float _205 = _201 + (-1.0);
        float _207 = -_205;
        float _209 = fma(_207, _203, _141);
        float _211 = _209 * _197;
        float _213 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _213;
    }
    float _215 = _183;
    bool _217 = !_151;
    if (!_217)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = 1.0 / _225;
        float _229 = _141 * _221;
        float _231 = exp2(_229);
        float _233 = -_231;
        float _235 = _233 + 1.0;
        float _237 = _235 * _227;
        _167 = _237;
    }
    float _239 = _167;
    bool _241 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _243 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _245 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _247 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _249 = fma(_239, _153, _243);
    float _251 = fma(_239, _155, _245);
    float _253 = fma(_239, _157, _247);
    float _255 = fma(_249, _139, _159);
    float _257 = fma(_251, _139, _161);
    float _259 = fma(_253, _139, _163);
    bool _261 = !_241;
    float _279;
    if (!_261)
    {
        float _263 = in.m_53.x;
        float _265 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _267 = _263 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _271 = _269 * _265;
        float _273 = floor(_271);
        float _275 = -_273;
        float _277 = _271 + _275;
        _279 = _277;
        _281 = true;
    }
    else
    {
        float _283 = float(_85);
        float _285 = 1.0 / _283;
        float _287 = _119 * _285;
        _279 = _287;
    }
    _281 = false;
    float _289 = _279;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _293 = _289 + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = _289 + _295;
    bool _299 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _301 = isnan(_289);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _325 = _289 + _323;
    float _327 = 1.0 / _313;
    bool _329 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _331 = 1.0 / _321;
    float _333 = 1.0 / _317;
    float _335 = _293 * _327;
    bool _337 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _339 = isnan(_289);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -_309;
    float _351 = _349 + 1.0;
    float _353 = _347 * _351;
    float _355 = _297 * _331;
    bool _357 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _359 = isnan(_289);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -_347;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _377 = _325 * _333;
    bool _379 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _381 = isnan(_289);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _391;
    float _395 = _367 * _371;
    float _397 = -_367;
    float _399 = _397 + 1.0;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _401;
    float _405 = fma(_393, _335, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _407 = _389 * _399;
    float _409 = fma(_403, _335, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _411 = -_389;
    float _413 = _411 + 1.0;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _419 = _405 * _407;
    float _421 = _409 * _407;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _423;
    float _427 = fma(_375, _377, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _429 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[143].x, _419);
    float _431 = fma(_417, _377, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _433;
    float _437 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[143].y, _421);
    float _439 = fma(_425, _355, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _441 = fma(_427, _395, _429);
    float _443 = fma(_435, _355, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _445 = fma(_431, _395, _437);
    float _447 = fma(_439, _353, _441);
    float _449 = fma(_443, _353, _445);
    float _451 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[146].x, _447);
    float _453 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[146].y, _449);
    bool _455 = !_329;
    float _473;
    if (!_455)
    {
        float _457 = in.m_53.x;
        float _459 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _461 = _457 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _463 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _465 = _463 * _459;
        float _467 = floor(_465);
        float _469 = -_467;
        float _471 = _465 + _469;
        _473 = _471;
        _475 = true;
    }
    else
    {
        float _477 = float(_85);
        float _479 = 1.0 / _477;
        float _481 = _119 * _479;
        _473 = _481;
    }
    _475 = false;
    float _483 = _473;
    float _485 = as_type<float>(int(gl_VertexIndex));
    float _487 = in.m_51.x;
    float _489 = in.m_51.y;
    float _491 = in.m_53.x;
    float _493 = in.m_53.y;
    int _495 = as_type<int>(_485) & 1;
    bool _497 = _495 != 0;
    int _499 = as_type<int>(_485) & 2;
    bool _501 = _499 != 0;
    float _503 = _451 * _487;
    float _505 = _453 * _489;
    bool _507 = !_497;
    float _509 = _507 ? (-0.5) : 0.5;
    float _511 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _513 = !_501;
    float _515 = _513 ? (-0.5) : 0.5;
    float _517 = _503 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _519 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _521 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _509);
    bool _523 = _491 > 0.5;
    float _525 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _515);
    bool _527 = _493 > 0.5;
    float _529 = _517 * _521;
    float _531 = _519 * _525;
    float _533 = _257 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _535 = _257 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _537 = _257 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _543 = _531 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _545 = _531 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _547 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[4].x, _533);
    float _549 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[6].x, _537);
    float _551 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[24].x, _543);
    float _553 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[26].x, _545);
    float _555 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].z, _547);
    float _557 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].z, _549);
    float _559 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[24].z, _551);
    float _561 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[26].z, _553);
    float _563 = _555 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _565 = _557 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _567 = _559 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _569 = _561 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _571 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[5].x, _535);
    float _573 = _563 + _567;
    float _575 = _565 + _569;
    float _577 = 1.0 / _541;
    float _579 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _581 = _573 + _579;
    float _583 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _585 = _575 + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _591 = _581 * _581;
    float _593 = _585 * _585;
    float _595 = 1.0 / _589;
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _599 = _597 != 0;
    float _601 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].z, _571);
    float _603 = _591 + _593;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _607 = _605 != 0;
    float _609 = _531 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _611 = _483 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _613 = isnan(_483);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _623;
    float _627 = sqrt(_603);
    bool _629 = _483 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _631 = isnan(_483);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[25].x, _609);
    float _643 = -_621;
    float _645 = _643 + 1.0;
    float _647 = _625 * _577;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _651 = _483 + _649;
    bool _653 = _483 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _655 = isnan(_483);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = _639 * _645;
    float _667 = -_639;
    float _669 = _667 + 1.0;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _675 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[25].z, _641);
    float _677 = fma(_647, _651, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _679 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _681 = _663 * _669;
    float _683 = _673 * _595;
    float _685 = _601 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _687 = _627 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _689 = _675 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _691 = _677 * _681;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _695 = _483 + _693;
    float _697 = -_663;
    float _699 = _697 + 1.0;
    float _701 = -_509;
    float _703 = _523 ? _701 : _509;
    float _705 = _685 + _689;
    float _707 = fma(_683, _695, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _709 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[115].x, _691);
    bool _711 = !_599;
    float _713 = _711 ? _509 : _703;
    float _715 = _699;
    float _717 = _683;
    float _719 = _509;
    float _721 = _695;
    float _723 = _703;
    float _725 = _621;
    float _727 = _563;
    float _729 = _689;
    if (!_687)
    {
        _715 = _593;
    }
    float _731 = _715;
    float _733 = _731;
    if (!_687)
    {
        _717 = _591;
    }
    float _735 = _717;
    float _737 = _735;
    if (!_687)
    {
        _719 = _573;
    }
    float _739 = _719;
    float _741 = _739;
    if (!_687)
    {
        _721 = _575;
    }
    float _743 = _721;
    float _745 = _743;
    if (!_687)
    {
        _723 = _705;
    }
    float _747 = _723;
    bool _749 = !_687;
    float _751 = _747;
    if (!_749)
    {
        float _753 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _755 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _757 = _627 + _755;
        float _759 = rsqrt(_603);
        float _761 = _757 * _753;
        float _763 = _705 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _765 = _761 * 0.15915493667125701904296875;
        float _767 = _765 * 6.283185482025146484375;
        float _769 = sin(_767);
        float _771 = _765 * 6.283185482025146484375;
        float _773 = cos(_771);
        float _775 = fma(_769, _763, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _777 = _759 * _775;
        float _779 = _773 + (-1.0);
        float _781 = fma(_581, _777, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _783 = fma(_585, _777, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _785 = _779 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _787 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _789 = _781 + _787;
        float _791 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _793 = _783 + _791;
        float _795 = fma(_705, _773, _785);
        float _797 = _789 * _789;
        float _799 = _793 * _793;
        _751 = _795;
        _737 = _797;
        _733 = _799;
        _741 = _781;
        _745 = _783;
    }
    float _801 = _751;
    float _803 = _737;
    float _805 = _733;
    float _807 = _741;
    float _809 = _745;
    float _811 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _813 = _801 + _811;
    float _815 = -_515;
    int _817 = _527 ? as_type<int>(_815) : as_type<int>(_515);
    float _819 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _821 = fma(_707, _665, _709);
    float _823 = fma(_813, _813, _803);
    bool _825 = !_607;
    float _827 = _825 ? _515 : as_type<float>(_817);
    float _829 = _713 + 0.5;
    float _831 = _823 + _805;
    float _833 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[117].x, _821);
    float _835 = -_827;
    float _837 = _835 + 0.5;
    float _839 = _829 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _843 = _833 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _845 = sqrt(_831);
    float _847 = _837 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _849 = _839 * _679;
    out.m_58.w = _841;
    float _851 = _847 * _819;
    out.m_60.w = _843;
    out.m_62.x = _849;
    out.m_62.y = _851;
    bool _853 = _845 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _855 = isnan(_845);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _861 = _857 || _859;
    float _863 = _801;
    float _865 = _809;
    if (!_861)
    {
        _725 = 1.0;
    }
    float _867 = _725;
    bool _869 = !_861;
    float _871 = _867;
    if (!_869)
    {
        bool _873 = _845 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _875 = isnan(_845);
        bool _877 = _873 || _875;
        bool _879 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _881 = _877 || _879;
        if (!_881)
        {
            float _883 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _885 = _845 + _883;
            float _887 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _889 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _887;
            float _891 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _893 = _891 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _895 = 1.0 / _889;
            float _897 = _885 * _895;
            float _899 = fma(_897, _893, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _871 = _899;
            _901 = true;
        }
        else
        {
            bool _903 = _845 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _905 = isnan(_845);
            bool _907 = _903 || _905;
            bool _909 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _911 = _907 || _909;
            if (!_911)
            {
                float _913 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _915 = _845 + _913;
                float _917 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _919 = _917 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _921 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _923 = _921 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _925 = 1.0 / _919;
                float _927 = _915 * _925;
                float _929 = fma(_927, _923, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _871 = _929;
                _901 = true;
            }
            else
            {
                _871 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _901 = false;
    float _931 = _871;
    float _933 = _685 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _935 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _937 = _807 + _935;
    float _939 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[11].x, _933);
    bool _941 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _943 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _945 = _941 || _943;
    bool _947 = isnan(0.5);
    bool _949 = _945 || _947;
    float _951 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[11].z, _939);
    float _953 = _685 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _955 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _957 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _959 = _955 || _957;
    bool _961 = isnan(0.5);
    bool _963 = _959 || _961;
    float _965 = fma(_937, _931, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _967 = _951 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _969 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[10].x, _953);
    float _971 = 1.0 / _967;
    float _973 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[10].z, _969);
    float _975 = _973 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _977 = _975 + _967;
    float _979 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _981 = _801 + _979;
    float _983 = _981;
    float _985 = _931;
    float _987 = _965;
    if (_963)
    {
        _863 = 1.0;
    }
    float _989 = _863;
    float _991 = _977 * _971;
    float _993 = _991 * 0.5;
    float _995 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _997 = _809 + _995;
    float _999 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1001 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[30].w, _999);
    float _1003 = fma(_981, _931, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1005 = fma(_997, _931, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1007 = _989;
    if (_949)
    {
        _983 = _965;
    }
    float _1009 = _983;
    float _1011 = 1.0 / _1001;
    float _1013 = _1009;
    if (_949)
    {
        _865 = _1003;
    }
    float _1015 = _865;
    float _1017 = _1015;
    if (_949)
    {
        _985 = _1005;
    }
    float _1019 = _985;
    float _1021 = _1019;
    if (!_949)
    {
        float _1023 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1025 = _685 + _1023;
        float _1027 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1029 = _563 + _1027;
        float _1031 = -_563;
        float _1033 = _1031 + _965;
        float _1035 = -_685;
        float _1037 = _1035 + _1003;
        float _1039 = _1025 * _1025;
        float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1043 = _565 + _1041;
        float _1045 = -_565;
        float _1047 = _1045 + _1005;
        float _1049 = fma(_1029, _1029, _1039);
        float _1051 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1053 = fma(_1043, _1043, _1049);
        float _1055 = sqrt(_1053);
        float _1057 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        bool _1059 = _1055 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1061 = isnan(_1055);
        bool _1063 = _1059 || _1061;
        bool _1065 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1067 = _1063 || _1065;
        float _1069 = precise::min(_1055, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1071 = _1069 * _1051;
        float _1073 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1075 = _1073 * _1071;
        float _1077 = _1001;
        float _1079 = _1051;
        float _1081 = _1055;
        float _1083 = _1073;
        _987 = _1033;
        if (_1067)
        {
            float _1085 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1077 = _1085;
        }
        float _1087 = _1077;
        if (_1067)
        {
            float _1089 = precise::max(_1055, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1079 = _1089;
        }
        float _1091 = _1079;
        float _1093 = fma(_1033, _1075, _563);
        float _1095 = _1087;
        float _1097 = _1093;
        if (_1067)
        {
            float _1099 = _1091 * _1087;
            _1081 = _1099;
        }
        float _1101 = _1081;
        float _1103 = fma(_1037, _1075, _685);
        float _1105 = fma(_1047, _1075, _565);
        float _1107 = _1101;
        if (_1067)
        {
            float _1109 = _1073 * _1101;
            _1095 = _1109;
        }
        float _1111 = _1095;
        if (!_1067)
        {
            _1083 = _1093;
        }
        float _1113 = _1083;
        float _1115 = _1113;
        if (!_1067)
        {
            _1097 = _1103;
        }
        float _1117 = _1097;
        float _1119 = _1117;
        if (_1067)
        {
            float _1121 = fma(_1033, _1111, _563);
            _1115 = _1121;
        }
        float _1123 = _1115;
        _1013 = _1123;
        if (!_1067)
        {
            _1107 = _1105;
        }
        float _1125 = _1107;
        _1021 = _1125;
        if (_1067)
        {
            float _1127 = fma(_1037, _1111, _685);
            _1119 = _1127;
        }
        float _1129 = _1119;
        _1017 = _1129;
        if (_1067)
        {
            float _1131 = fma(_1047, _1111, _565);
            _1021 = _1131;
        }
    }
    float _1133 = _987;
    float _1135 = _1017;
    float _1137 = _1013;
    float _1139 = _1021;
    float _1141 = _1133;
    if (_963)
    {
        _727 = 1.0;
    }
    float _1143 = _727;
    float _1145 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1147 = _1011 * _1145;
    float _1149 = _1143;
    if (!_963)
    {
        float _1151 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1153 = _1151 * 0.15915493667125701904296875;
        float _1155 = _1153 * 6.283185482025146484375;
        float _1157 = cos(_1155);
        float _1159 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1161 = _1159 * 0.15915493667125701904296875;
        float _1163 = _1153 * 6.283185482025146484375;
        float _1165 = sin(_1163);
        float _1167 = 1.0 / _1157;
        float _1169 = _1161 * 6.283185482025146484375;
        float _1171 = cos(_1169);
        float _1173 = _1165 * _1167;
        float _1175 = _1161 * 6.283185482025146484375;
        float _1177 = sin(_1175);
        float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1181 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1179;
        float _1183 = _1171 * _1173;
        float _1185 = 1.0 / _1181;
        float _1187 = 1.0 / _1183;
        float _1189 = _1177 * _1187;
        float _1191 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1193 = fma(_1147, _1189, _1191);
        float _1195 = _1193 * _1185;
        float _1197 = precise::clamp(_1195, 0.0, 1.0);
        _1007 = _1197;
    }
    float _1199 = _1007;
    if (!_963)
    {
        float _1201 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1203 = _1201 * 0.15915493667125701904296875;
        float _1205 = _1203 * 6.283185482025146484375;
        float _1207 = cos(_1205);
        float _1209 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1211 = _1209 * 0.15915493667125701904296875;
        float _1213 = _1203 * 6.283185482025146484375;
        float _1215 = sin(_1213);
        float _1217 = 1.0 / _1207;
        float _1219 = _1211 * 6.283185482025146484375;
        float _1221 = cos(_1219);
        float _1223 = _1215 * _1217;
        float _1225 = _1211 * 6.283185482025146484375;
        float _1227 = sin(_1225);
        float _1229 = _1221 * _1223;
        float _1231 = 1.0 / _1229;
        float _1233 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1235 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1233;
        float _1237 = 1.0 / _1235;
        float _1239 = _1227 * _1231;
        float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1243 = fma(_1147, _1239, _1241);
        float _1245 = _1243 * _1237;
        float _1247 = precise::clamp(_1245, 0.0, 1.0);
        float _1249 = -_1247;
        float _1251 = _1249 + 1.0;
        _1141 = _1239;
        _1149 = _1251;
    }
    float _1253 = _1141;
    float _1255 = _1149;
    float _1257 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1259 = _1135 + _1257;
    float _1261 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1263 = _1137 + _1261;
    float _1265 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1267 = _1139 + _1265;
    float _1269 = _1259 * _1259;
    float _1271 = fma(_1263, _1263, _1269);
    float _1273 = fma(_1267, _1267, _1271);
    float _1275 = rsqrt(_1273);
    float _1277 = _1275 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1279 = _1263 * _1277;
    float _1281 = _1267 * _1277;
    float _1283 = _1279 * _1279;
    float _1285 = _1281 * _1281;
    float _1287 = _1283 + _1285;
    float _1289 = sqrt(_1287);
    bool _1291 = _1289 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1293 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1295 = _1289 + _1293;
    float _1297 = _1267;
    float _1299 = _1271;
    float _1301 = _1295;
    float _1303 = _1253;
    float _1305 = _1259;
    float _1307 = _1279;
    if (_1291)
    {
        float _1309 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1297 = _1309;
    }
    float _1311 = _1297;
    if (_1291)
    {
        float _1313 = rsqrt(_1287);
        _1299 = _1313;
    }
    float _1315 = _1299;
    float _1317 = _1315;
    if (_1291)
    {
        float _1319 = _1295 * _1311;
        _1301 = _1319;
    }
    float _1321 = _1301;
    if (_1291)
    {
        float _1323 = _1321 * 0.15915493667125701904296875;
        _1303 = _1323;
    }
    float _1325 = _1303;
    float _1327 = _1311;
    if (_1291)
    {
        float _1329 = _1325 * 6.283185482025146484375;
        float _1331 = sin(_1329);
        _1327 = _1331;
    }
    float _1333 = _1327;
    float _1335 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1337 = precise::max(0.0, _1335);
    float _1339 = _1275;
    float _1341 = _1337;
    if (_1291)
    {
        float _1343 = _1325 * 6.283185482025146484375;
        float _1345 = cos(_1343);
        _1339 = _1345;
    }
    float _1347 = _1339;
    float _1349 = -_1277;
    float _1351 = -_1337;
    float _1353 = fma(_1259, _1349, _1351);
    if (!_1291)
    {
        _1305 = _1283;
    }
    float _1355 = _1305;
    float _1357 = _1355;
    if (_1291)
    {
        float _1359 = _1353 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1341 = _1359;
    }
    float _1361 = _1341;
    float _1363 = sqrt(_1273);
    float _1365 = _1333;
    float _1367 = _1361;
    if (_1291)
    {
        float _1369 = fma(_1333, _1361, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1365 = _1369;
    }
    float _1371 = _1365;
    float _1373 = _1371;
    if (_1291)
    {
        float _1375 = _1347 + (-1.0);
        _1367 = _1375;
    }
    float _1377 = _1367;
    float _1379 = _1377;
    if (_1291)
    {
        float _1381 = _1315 * _1371;
        _729 = _1381;
    }
    float _1383 = _729;
    if (!_1291)
    {
        _1317 = _1353;
    }
    float _1385 = _1317;
    float _1387 = _1385;
    if (_1291)
    {
        float _1389 = _1377 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1379 = _1389;
    }
    float _1391 = _1379;
    float _1393 = _1391;
    if (_1291)
    {
        float _1395 = _1279 * _1383;
        _1307 = _1395;
    }
    float _1397 = _1307;
    if (!_1291)
    {
        _1373 = _1281;
    }
    float _1399 = _1373;
    float _1401 = _1399;
    if (_1291)
    {
        float _1403 = _1281 * _1383;
        _1401 = _1403;
    }
    float _1405 = _1401;
    if (_1291)
    {
        float _1407 = fma(_1353, _1347, _1391);
        _1387 = _1407;
    }
    float _1409 = _1387;
    if (_1291)
    {
        float _1411 = _1397 * _1397;
        _1357 = _1411;
    }
    float _1413 = _1357;
    if (!_1291)
    {
        _1393 = _1285;
    }
    float _1415 = _1393;
    float _1417 = _1415;
    if (_1291)
    {
        float _1419 = _1405 * _1405;
        _1417 = _1419;
    }
    float _1421 = _1417;
    float _1423 = fma(_1409, _1409, _1413);
    float _1425 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1427 = _1423 + _1421;
    float _1429 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1431 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1433 = fma(_1363, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1431);
    float _1435 = precise::clamp(_1433, 0.0, 1.0);
    float _1437 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1439 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1429);
    float _1441 = rsqrt(_1427);
    float _1443 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1445 = -_1435;
    float _1447 = _1445 + 1.0;
    float _1449 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1439);
    float _1451 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1453 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1443);
    float _1455 = _1449 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1457 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1451);
    float _1459 = abs(_1447);
    float _1461 = log2(_1459);
    float _1463 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1453);
    float _1465 = _1455 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1467 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1457);
    float _1469 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1425);
    float _1471 = _1463 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1473 = -_1465;
    float _1475 = fma(_1473, _1437, 1.0);
    float _1477 = _1441 * _1397;
    float _1479 = _1467 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1481 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1483 = _1441 * _1409;
    float _1485 = _1477 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1487 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1469);
    float _1489 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1481);
    float _1491 = _1441 * _1405;
    float _1493 = -_1485;
    float _1495 = fma(_1483, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1493);
    float _1497 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1499 = _1487 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1501 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1489);
    float _1503 = -_1491;
    float _1505 = fma(_1503, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1495);
    float _1507 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1509 = log2(_1475);
    float _1511 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1501);
    float _1513 = fma(_1505, -0.5, 0.5);
    float _1515 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1517 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1507);
    float _1519 = fma(_1505, 0.5, 0.5);
    float _1521 = _1483 + 1.0;
    float _1523 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1515);
    float _1525 = exp2(_1497);
    float _1527 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1517);
    float _1529 = fma(_1519, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1531 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1523);
    float _1533 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1527);
    float _1535 = 1.0 / _1511;
    float _1537 = _1509 * 0.693147182464599609375;
    float _1539 = _1537 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1541 = sqrt(_1513);
    float _1543 = -_1483;
    float _1545 = fma(_1525, _1521, _1543);
    float _1547 = fma(_1519, _1529, -0.212114393711090087890625);
    float _1549 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1531);
    float _1551 = fma(_1519, _1547, 1.570728778839111328125);
    float _1553 = _1533 * _1535;
    float _1555 = _1549 * _1535;
    float _1557 = fma(_1553, 0.5, 0.5);
    float _1559 = fma(_1555, -0.5, 0.5);
    float _1561 = _1541 * 0.636619746685028076171875;
    float _1563 = fma(_1545, 0.5, 0.5);
    float3 _4060 = float3(_1557, _1559, _1539);
    float _1565 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4060, float3(0.0), isnan(_4060)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4060, float3(0.0), isnan(_4060)), level(0.0)).x;
    float _1567 = -_1551;
    float _1569 = fma(_1561, _1567, 1.0);
    float3 _4076 = float3(_1557, _1559, _1539);
    float4 _1572 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4076, float3(0.0), isnan(_4076)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4076, float3(0.0), isnan(_4076)), level(0.0)).xyzw;
    float _1574 = _1572.x;
    float _1576 = _1572.y;
    float _1578 = _1572.z;
    float _1580 = _1572.w;
    float2 _4093 = float2(_1569, _1563);
    float3 _1584 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4093, float2(0.0), isnan(_4093)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4093, float2(0.0), isnan(_4093)), level(0.0)).xyz;
    float _1586 = _1584.x;
    float _1588 = _1584.y;
    float _1590 = _1584.z;
    float _1592 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1594 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1596 = _1199 > 0.0;
    bool _1598 = isnan(_1199);
    bool _1600 = _1596 || _1598;
    bool _1602 = isnan(0.0);
    bool _1604 = _1600 || _1602;
    float _1606 = _1511 * 0.5;
    float _1608 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1594);
    float _1610 = exp2(_1592);
    bool _1612 = _1255 <= 0.0;
    bool _1614 = !_1604;
    bool _1616 = _1612 || _1614;
    float _1618 = _1533 + _1511;
    float _1620 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1608);
    float _1622 = _1199 * _1255;
    float _1624 = fma(_1549, -0.5, _1606);
    float _1626 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1620);
    float _1628 = _1622 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1630 = _1618 * 0.5;
    float _1632 = _1626 + _1511;
    float _1634 = _1628 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1533;
    out.gl_Position.y = _1549;
    out.gl_Position.z = _1626;
    out.gl_Position.w = _1511;
    float _1636 = _1632 * 0.5;
    float _1638 = -_1610;
    float _1640 = _1638 + 1.0;
    out.m_47.x = _1634;
    float _1642 = _1640 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.x = _1630;
    out.m_64.y = _1624;
    out.m_64.z = _1636;
    out.m_64.w = _1511;
    float _1644 = _1642 * _1565;
    float _1646 = -_1642;
    float _1648 = _1646 + 1.0;
    float _1650 = _1580 * _1644;
    float _1652 = _1590 * _1644;
    float _1654 = fma(_1586, _1650, _1574);
    float _1656 = fma(_1588, _1650, _1576);
    float _1658 = _1580 * _1648;
    float _1660 = fma(_1580, _1652, _1578);
    out.m_66.x = _1654;
    out.m_66.y = _1656;
    out.m_66.z = _1660;
    out.m_66.w = _1658;
    if (!_1616)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1662 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1662;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _901 = false;
    bool _475 = false;
    bool _281 = false;
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
        float _1719 = as_type<float>(_101);
        out.gl_Position.z = _1719;
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
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1788 = as_type<float>(_137);
        out.gl_Position.z = _1788;
    }
    if (_129)
    {
        return out;
    }
    float _139 = in.m_51.w;
    float _141 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _143 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _145 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _147 = _143 || _145;
    bool _149 = isnan(1.0);
    bool _151 = _147 || _149;
    float _153 = in.m_49.x;
    float _155 = in.m_49.y;
    float _157 = in.m_49.z;
    float _159 = in.m_44.x;
    float _161 = in.m_44.y;
    float _163 = in.m_44.z;
    float _165 = 0.0;
    float _167 = _141;
    if (!_151)
    {
        float _169 = _141 * _141;
        float _171 = _169 * 0.5;
        _165 = _171;
    }
    float _173 = _165;
    float _175 = _173;
    if (!_151)
    {
        float _177 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _177;
    }
    float _179 = _175;
    bool _181 = !_151;
    float _183 = _179;
    if (!_181)
    {
        float _185 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _187 = log2(_185);
        float _189 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _191 = _189 + 1.0;
        float _193 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = _141 * _187;
        float _197 = 1.0 / _191;
        float _199 = _193 * 0.693147182464599609375;
        float _201 = exp2(_195);
        float _203 = 1.0 / _199;
        float _205 = _201 + (-1.0);
        float _207 = -_205;
        float _209 = fma(_207, _203, _141);
        float _211 = _209 * _197;
        float _213 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _213;
    }
    float _215 = _183;
    bool _217 = !_151;
    if (!_217)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = 1.0 / _225;
        float _229 = _141 * _221;
        float _231 = exp2(_229);
        float _233 = -_231;
        float _235 = _233 + 1.0;
        float _237 = _235 * _227;
        _167 = _237;
    }
    float _239 = _167;
    bool _241 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _243 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _245 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _247 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _249 = fma(_239, _153, _243);
    float _251 = fma(_239, _155, _245);
    float _253 = fma(_239, _157, _247);
    float _255 = fma(_249, _139, _159);
    float _257 = fma(_251, _139, _161);
    float _259 = fma(_253, _139, _163);
    bool _261 = !_241;
    float _279;
    if (!_261)
    {
        float _263 = in.m_53.x;
        float _265 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _267 = _263 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _271 = _269 * _265;
        float _273 = floor(_271);
        float _275 = -_273;
        float _277 = _271 + _275;
        _279 = _277;
        _281 = true;
    }
    else
    {
        float _283 = float(_85);
        float _285 = 1.0 / _283;
        float _287 = _119 * _285;
        _279 = _287;
    }
    _281 = false;
    float _289 = _279;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _293 = _289 + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = _289 + _295;
    bool _299 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _301 = isnan(_289);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _325 = _289 + _323;
    float _327 = 1.0 / _313;
    bool _329 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _331 = 1.0 / _321;
    float _333 = 1.0 / _317;
    float _335 = _293 * _327;
    bool _337 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _339 = isnan(_289);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -_309;
    float _351 = _349 + 1.0;
    float _353 = _347 * _351;
    float _355 = _297 * _331;
    bool _357 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _359 = isnan(_289);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -_347;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _377 = _325 * _333;
    bool _379 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _381 = isnan(_289);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _391;
    float _395 = _367 * _371;
    float _397 = -_367;
    float _399 = _397 + 1.0;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _401;
    float _405 = fma(_393, _335, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _407 = _389 * _399;
    float _409 = fma(_403, _335, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _411 = -_389;
    float _413 = _411 + 1.0;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _419 = _405 * _407;
    float _421 = _409 * _407;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _423;
    float _427 = fma(_375, _377, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _429 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[143].x, _419);
    float _431 = fma(_417, _377, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _433;
    float _437 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[143].y, _421);
    float _439 = fma(_425, _355, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _441 = fma(_427, _395, _429);
    float _443 = fma(_435, _355, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _445 = fma(_431, _395, _437);
    float _447 = fma(_439, _353, _441);
    float _449 = fma(_443, _353, _445);
    float _451 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[146].x, _447);
    float _453 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[146].y, _449);
    bool _455 = !_329;
    float _473;
    if (!_455)
    {
        float _457 = in.m_53.x;
        float _459 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _461 = _457 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _463 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _465 = _463 * _459;
        float _467 = floor(_465);
        float _469 = -_467;
        float _471 = _465 + _469;
        _473 = _471;
        _475 = true;
    }
    else
    {
        float _477 = float(_85);
        float _479 = 1.0 / _477;
        float _481 = _119 * _479;
        _473 = _481;
    }
    _475 = false;
    float _483 = _473;
    float _485 = as_type<float>(int(gl_VertexIndex));
    float _487 = in.m_51.x;
    float _489 = in.m_51.y;
    float _491 = in.m_53.x;
    float _493 = in.m_53.y;
    int _495 = as_type<int>(_485) & 1;
    bool _497 = _495 != 0;
    int _499 = as_type<int>(_485) & 2;
    bool _501 = _499 != 0;
    float _503 = _451 * _487;
    float _505 = _453 * _489;
    bool _507 = !_497;
    float _509 = _507 ? (-0.5) : 0.5;
    float _511 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _513 = !_501;
    float _515 = _513 ? (-0.5) : 0.5;
    float _517 = _503 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _519 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _521 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _509);
    bool _523 = _491 > 0.5;
    float _525 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _515);
    bool _527 = _493 > 0.5;
    float _529 = _517 * _521;
    float _531 = _519 * _525;
    float _533 = _257 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _535 = _257 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _537 = _257 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _543 = _531 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _545 = _531 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _547 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[4].x, _533);
    float _549 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[6].x, _537);
    float _551 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[24].x, _543);
    float _553 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[26].x, _545);
    float _555 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].z, _547);
    float _557 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].z, _549);
    float _559 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[24].z, _551);
    float _561 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[26].z, _553);
    float _563 = _555 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _565 = _557 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _567 = _559 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _569 = _561 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _571 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[5].x, _535);
    float _573 = _563 + _567;
    float _575 = _565 + _569;
    float _577 = 1.0 / _541;
    float _579 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _581 = _573 + _579;
    float _583 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _585 = _575 + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _591 = _581 * _581;
    float _593 = _585 * _585;
    float _595 = 1.0 / _589;
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _599 = _597 != 0;
    float _601 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].z, _571);
    float _603 = _591 + _593;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _607 = _605 != 0;
    float _609 = _531 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _611 = _483 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _613 = isnan(_483);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _623;
    float _627 = sqrt(_603);
    bool _629 = _483 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _631 = isnan(_483);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[25].x, _609);
    float _643 = -_621;
    float _645 = _643 + 1.0;
    float _647 = _625 * _577;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _651 = _483 + _649;
    bool _653 = _483 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _655 = isnan(_483);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = _639 * _645;
    float _667 = -_639;
    float _669 = _667 + 1.0;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _675 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[25].z, _641);
    float _677 = fma(_647, _651, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _679 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _681 = _663 * _669;
    float _683 = _673 * _595;
    float _685 = _601 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _687 = _627 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _689 = _675 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _691 = _677 * _681;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _695 = _483 + _693;
    float _697 = -_663;
    float _699 = _697 + 1.0;
    float _701 = -_509;
    float _703 = _523 ? _701 : _509;
    float _705 = _685 + _689;
    float _707 = fma(_683, _695, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _709 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[115].x, _691);
    bool _711 = !_599;
    float _713 = _711 ? _509 : _703;
    float _715 = _699;
    float _717 = _683;
    float _719 = _509;
    float _721 = _695;
    float _723 = _703;
    float _725 = _621;
    float _727 = _563;
    float _729 = _689;
    if (!_687)
    {
        _715 = _593;
    }
    float _731 = _715;
    float _733 = _731;
    if (!_687)
    {
        _717 = _591;
    }
    float _735 = _717;
    float _737 = _735;
    if (!_687)
    {
        _719 = _573;
    }
    float _739 = _719;
    float _741 = _739;
    if (!_687)
    {
        _721 = _575;
    }
    float _743 = _721;
    float _745 = _743;
    if (!_687)
    {
        _723 = _705;
    }
    float _747 = _723;
    bool _749 = !_687;
    float _751 = _747;
    if (!_749)
    {
        float _753 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _755 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _757 = _627 + _755;
        float _759 = rsqrt(_603);
        float _761 = _757 * _753;
        float _763 = _705 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _765 = _761 * 0.15915493667125701904296875;
        float _767 = _765 * 6.283185482025146484375;
        float _769 = sin(_767);
        float _771 = _765 * 6.283185482025146484375;
        float _773 = cos(_771);
        float _775 = fma(_769, _763, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _777 = _759 * _775;
        float _779 = _773 + (-1.0);
        float _781 = fma(_581, _777, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _783 = fma(_585, _777, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _785 = _779 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _787 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _789 = _781 + _787;
        float _791 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _793 = _783 + _791;
        float _795 = fma(_705, _773, _785);
        float _797 = _789 * _789;
        float _799 = _793 * _793;
        _751 = _795;
        _737 = _797;
        _733 = _799;
        _741 = _781;
        _745 = _783;
    }
    float _801 = _751;
    float _803 = _737;
    float _805 = _733;
    float _807 = _741;
    float _809 = _745;
    float _811 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _813 = _801 + _811;
    float _815 = -_515;
    int _817 = _527 ? as_type<int>(_815) : as_type<int>(_515);
    float _819 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _821 = fma(_707, _665, _709);
    float _823 = fma(_813, _813, _803);
    bool _825 = !_607;
    float _827 = _825 ? _515 : as_type<float>(_817);
    float _829 = _713 + 0.5;
    float _831 = _823 + _805;
    float _833 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[117].x, _821);
    float _835 = -_827;
    float _837 = _835 + 0.5;
    float _839 = _829 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _843 = _833 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _845 = sqrt(_831);
    float _847 = _837 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _849 = _839 * _679;
    out.m_58.w = _841;
    float _851 = _847 * _819;
    out.m_60.w = _843;
    out.m_62.x = _849;
    out.m_62.y = _851;
    bool _853 = _845 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _855 = isnan(_845);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _861 = _857 || _859;
    float _863 = _801;
    float _865 = _809;
    if (!_861)
    {
        _725 = 1.0;
    }
    float _867 = _725;
    bool _869 = !_861;
    float _871 = _867;
    if (!_869)
    {
        bool _873 = _845 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _875 = isnan(_845);
        bool _877 = _873 || _875;
        bool _879 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _881 = _877 || _879;
        if (!_881)
        {
            float _883 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _885 = _845 + _883;
            float _887 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _889 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _887;
            float _891 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _893 = _891 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _895 = 1.0 / _889;
            float _897 = _885 * _895;
            float _899 = fma(_897, _893, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _871 = _899;
            _901 = true;
        }
        else
        {
            bool _903 = _845 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _905 = isnan(_845);
            bool _907 = _903 || _905;
            bool _909 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _911 = _907 || _909;
            if (!_911)
            {
                float _913 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _915 = _845 + _913;
                float _917 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _919 = _917 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _921 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _923 = _921 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _925 = 1.0 / _919;
                float _927 = _915 * _925;
                float _929 = fma(_927, _923, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _871 = _929;
                _901 = true;
            }
            else
            {
                _871 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _901 = false;
    float _931 = _871;
    float _933 = _685 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _935 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _937 = _807 + _935;
    float _939 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[11].x, _933);
    bool _941 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _943 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _945 = _941 || _943;
    bool _947 = isnan(0.5);
    bool _949 = _945 || _947;
    float _951 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[11].z, _939);
    float _953 = _685 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _955 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _957 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _959 = _955 || _957;
    bool _961 = isnan(0.5);
    bool _963 = _959 || _961;
    float _965 = fma(_937, _931, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _967 = _951 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _969 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[10].x, _953);
    float _971 = 1.0 / _967;
    float _973 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[10].z, _969);
    float _975 = _973 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _977 = _975 + _967;
    float _979 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _981 = _801 + _979;
    float _983 = _981;
    float _985 = _931;
    float _987 = _965;
    if (_963)
    {
        _863 = 1.0;
    }
    float _989 = _863;
    float _991 = _977 * _971;
    float _993 = _991 * 0.5;
    float _995 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _997 = _809 + _995;
    float _999 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1001 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[30].w, _999);
    float _1003 = fma(_981, _931, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1005 = fma(_997, _931, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1007 = _989;
    if (_949)
    {
        _983 = _965;
    }
    float _1009 = _983;
    float _1011 = 1.0 / _1001;
    float _1013 = _1009;
    if (_949)
    {
        _865 = _1003;
    }
    float _1015 = _865;
    float _1017 = _1015;
    if (_949)
    {
        _985 = _1005;
    }
    float _1019 = _985;
    float _1021 = _1019;
    if (!_949)
    {
        float _1023 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1025 = _685 + _1023;
        float _1027 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1029 = _563 + _1027;
        float _1031 = -_563;
        float _1033 = _1031 + _965;
        float _1035 = -_685;
        float _1037 = _1035 + _1003;
        float _1039 = _1025 * _1025;
        float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1043 = _565 + _1041;
        float _1045 = -_565;
        float _1047 = _1045 + _1005;
        float _1049 = fma(_1029, _1029, _1039);
        float _1051 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1053 = fma(_1043, _1043, _1049);
        float _1055 = sqrt(_1053);
        float _1057 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        bool _1059 = _1055 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1061 = isnan(_1055);
        bool _1063 = _1059 || _1061;
        bool _1065 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1067 = _1063 || _1065;
        float _1069 = precise::min(_1055, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1071 = _1069 * _1051;
        float _1073 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1075 = _1073 * _1071;
        float _1077 = _1001;
        float _1079 = _1051;
        float _1081 = _1055;
        float _1083 = _1073;
        _987 = _1033;
        if (_1067)
        {
            float _1085 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1077 = _1085;
        }
        float _1087 = _1077;
        if (_1067)
        {
            float _1089 = precise::max(_1055, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1079 = _1089;
        }
        float _1091 = _1079;
        float _1093 = fma(_1033, _1075, _563);
        float _1095 = _1087;
        float _1097 = _1093;
        if (_1067)
        {
            float _1099 = _1091 * _1087;
            _1081 = _1099;
        }
        float _1101 = _1081;
        float _1103 = fma(_1037, _1075, _685);
        float _1105 = fma(_1047, _1075, _565);
        float _1107 = _1101;
        if (_1067)
        {
            float _1109 = _1073 * _1101;
            _1095 = _1109;
        }
        float _1111 = _1095;
        if (!_1067)
        {
            _1083 = _1093;
        }
        float _1113 = _1083;
        float _1115 = _1113;
        if (!_1067)
        {
            _1097 = _1103;
        }
        float _1117 = _1097;
        float _1119 = _1117;
        if (_1067)
        {
            float _1121 = fma(_1033, _1111, _563);
            _1115 = _1121;
        }
        float _1123 = _1115;
        _1013 = _1123;
        if (!_1067)
        {
            _1107 = _1105;
        }
        float _1125 = _1107;
        _1021 = _1125;
        if (_1067)
        {
            float _1127 = fma(_1037, _1111, _685);
            _1119 = _1127;
        }
        float _1129 = _1119;
        _1017 = _1129;
        if (_1067)
        {
            float _1131 = fma(_1047, _1111, _565);
            _1021 = _1131;
        }
    }
    float _1133 = _987;
    float _1135 = _1017;
    float _1137 = _1013;
    float _1139 = _1021;
    float _1141 = _1133;
    if (_963)
    {
        _727 = 1.0;
    }
    float _1143 = _727;
    float _1145 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1147 = _1011 * _1145;
    float _1149 = _1143;
    if (!_963)
    {
        float _1151 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1153 = _1151 * 0.15915493667125701904296875;
        float _1155 = _1153 * 6.283185482025146484375;
        float _1157 = cos(_1155);
        float _1159 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1161 = _1159 * 0.15915493667125701904296875;
        float _1163 = _1153 * 6.283185482025146484375;
        float _1165 = sin(_1163);
        float _1167 = 1.0 / _1157;
        float _1169 = _1161 * 6.283185482025146484375;
        float _1171 = cos(_1169);
        float _1173 = _1165 * _1167;
        float _1175 = _1161 * 6.283185482025146484375;
        float _1177 = sin(_1175);
        float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1181 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1179;
        float _1183 = _1171 * _1173;
        float _1185 = 1.0 / _1181;
        float _1187 = 1.0 / _1183;
        float _1189 = _1177 * _1187;
        float _1191 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1193 = fma(_1147, _1189, _1191);
        float _1195 = _1193 * _1185;
        float _1197 = precise::clamp(_1195, 0.0, 1.0);
        _1007 = _1197;
    }
    float _1199 = _1007;
    if (!_963)
    {
        float _1201 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1203 = _1201 * 0.15915493667125701904296875;
        float _1205 = _1203 * 6.283185482025146484375;
        float _1207 = cos(_1205);
        float _1209 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1211 = _1209 * 0.15915493667125701904296875;
        float _1213 = _1203 * 6.283185482025146484375;
        float _1215 = sin(_1213);
        float _1217 = 1.0 / _1207;
        float _1219 = _1211 * 6.283185482025146484375;
        float _1221 = cos(_1219);
        float _1223 = _1215 * _1217;
        float _1225 = _1211 * 6.283185482025146484375;
        float _1227 = sin(_1225);
        float _1229 = _1221 * _1223;
        float _1231 = 1.0 / _1229;
        float _1233 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1235 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1233;
        float _1237 = 1.0 / _1235;
        float _1239 = _1227 * _1231;
        float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1243 = fma(_1147, _1239, _1241);
        float _1245 = _1243 * _1237;
        float _1247 = precise::clamp(_1245, 0.0, 1.0);
        float _1249 = -_1247;
        float _1251 = _1249 + 1.0;
        _1141 = _1239;
        _1149 = _1251;
    }
    float _1253 = _1141;
    float _1255 = _1149;
    float _1257 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1259 = _1135 + _1257;
    float _1261 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1263 = _1137 + _1261;
    float _1265 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1267 = _1139 + _1265;
    float _1269 = _1259 * _1259;
    float _1271 = fma(_1263, _1263, _1269);
    float _1273 = fma(_1267, _1267, _1271);
    float _1275 = rsqrt(_1273);
    float _1277 = _1275 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1279 = _1263 * _1277;
    float _1281 = _1267 * _1277;
    float _1283 = _1279 * _1279;
    float _1285 = _1281 * _1281;
    float _1287 = _1283 + _1285;
    float _1289 = sqrt(_1287);
    bool _1291 = _1289 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1293 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1295 = _1289 + _1293;
    float _1297 = _1267;
    float _1299 = _1271;
    float _1301 = _1295;
    float _1303 = _1253;
    float _1305 = _1259;
    float _1307 = _1279;
    if (_1291)
    {
        float _1309 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1297 = _1309;
    }
    float _1311 = _1297;
    if (_1291)
    {
        float _1313 = rsqrt(_1287);
        _1299 = _1313;
    }
    float _1315 = _1299;
    float _1317 = _1315;
    if (_1291)
    {
        float _1319 = _1295 * _1311;
        _1301 = _1319;
    }
    float _1321 = _1301;
    if (_1291)
    {
        float _1323 = _1321 * 0.15915493667125701904296875;
        _1303 = _1323;
    }
    float _1325 = _1303;
    float _1327 = _1311;
    if (_1291)
    {
        float _1329 = _1325 * 6.283185482025146484375;
        float _1331 = sin(_1329);
        _1327 = _1331;
    }
    float _1333 = _1327;
    float _1335 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1337 = precise::max(0.0, _1335);
    float _1339 = _1275;
    float _1341 = _1337;
    if (_1291)
    {
        float _1343 = _1325 * 6.283185482025146484375;
        float _1345 = cos(_1343);
        _1339 = _1345;
    }
    float _1347 = _1339;
    float _1349 = -_1277;
    float _1351 = -_1337;
    float _1353 = fma(_1259, _1349, _1351);
    if (!_1291)
    {
        _1305 = _1283;
    }
    float _1355 = _1305;
    float _1357 = _1355;
    if (_1291)
    {
        float _1359 = _1353 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1341 = _1359;
    }
    float _1361 = _1341;
    float _1363 = sqrt(_1273);
    float _1365 = _1333;
    float _1367 = _1361;
    if (_1291)
    {
        float _1369 = fma(_1333, _1361, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1365 = _1369;
    }
    float _1371 = _1365;
    float _1373 = _1371;
    if (_1291)
    {
        float _1375 = _1347 + (-1.0);
        _1367 = _1375;
    }
    float _1377 = _1367;
    float _1379 = _1377;
    if (_1291)
    {
        float _1381 = _1315 * _1371;
        _729 = _1381;
    }
    float _1383 = _729;
    if (!_1291)
    {
        _1317 = _1353;
    }
    float _1385 = _1317;
    float _1387 = _1385;
    if (_1291)
    {
        float _1389 = _1377 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1379 = _1389;
    }
    float _1391 = _1379;
    float _1393 = _1391;
    if (_1291)
    {
        float _1395 = _1279 * _1383;
        _1307 = _1395;
    }
    float _1397 = _1307;
    if (!_1291)
    {
        _1373 = _1281;
    }
    float _1399 = _1373;
    float _1401 = _1399;
    if (_1291)
    {
        float _1403 = _1281 * _1383;
        _1401 = _1403;
    }
    float _1405 = _1401;
    if (_1291)
    {
        float _1407 = fma(_1353, _1347, _1391);
        _1387 = _1407;
    }
    float _1409 = _1387;
    if (_1291)
    {
        float _1411 = _1397 * _1397;
        _1357 = _1411;
    }
    float _1413 = _1357;
    if (!_1291)
    {
        _1393 = _1285;
    }
    float _1415 = _1393;
    float _1417 = _1415;
    if (_1291)
    {
        float _1419 = _1405 * _1405;
        _1417 = _1419;
    }
    float _1421 = _1417;
    float _1423 = fma(_1409, _1409, _1413);
    float _1425 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1427 = _1423 + _1421;
    float _1429 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1431 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1433 = fma(_1363, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1431);
    float _1435 = precise::clamp(_1433, 0.0, 1.0);
    float _1437 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1439 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1429);
    float _1441 = rsqrt(_1427);
    float _1443 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1445 = -_1435;
    float _1447 = _1445 + 1.0;
    float _1449 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1439);
    float _1451 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1453 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1443);
    float _1455 = _1449 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1457 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1451);
    float _1459 = abs(_1447);
    float _1461 = log2(_1459);
    float _1463 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1453);
    float _1465 = _1455 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1467 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1457);
    float _1469 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1425);
    float _1471 = _1463 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1473 = -_1465;
    float _1475 = fma(_1473, _1437, 1.0);
    float _1477 = _1441 * _1397;
    float _1479 = _1467 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1481 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1483 = _1441 * _1409;
    float _1485 = _1477 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1487 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1469);
    float _1489 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1481);
    float _1491 = _1441 * _1405;
    float _1493 = -_1485;
    float _1495 = fma(_1483, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1493);
    float _1497 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1499 = _1487 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1501 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1489);
    float _1503 = -_1491;
    float _1505 = fma(_1503, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1495);
    float _1507 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1509 = log2(_1475);
    float _1511 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1501);
    float _1513 = fma(_1505, -0.5, 0.5);
    float _1515 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1517 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1507);
    float _1519 = fma(_1505, 0.5, 0.5);
    float _1521 = _1483 + 1.0;
    float _1523 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1515);
    float _1525 = exp2(_1497);
    float _1527 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1517);
    float _1529 = fma(_1519, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1531 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1523);
    float _1533 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1527);
    float _1535 = 1.0 / _1511;
    float _1537 = _1509 * 0.693147182464599609375;
    float _1539 = _1537 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1541 = sqrt(_1513);
    float _1543 = -_1483;
    float _1545 = fma(_1525, _1521, _1543);
    float _1547 = fma(_1519, _1529, -0.212114393711090087890625);
    float _1549 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1531);
    float _1551 = fma(_1519, _1547, 1.570728778839111328125);
    float _1553 = _1533 * _1535;
    float _1555 = _1549 * _1535;
    float _1557 = fma(_1553, 0.5, 0.5);
    float _1559 = fma(_1555, -0.5, 0.5);
    float _1561 = _1541 * 0.636619746685028076171875;
    float _1563 = fma(_1545, 0.5, 0.5);
    float3 _4060 = float3(_1557, _1559, _1539);
    float _1565 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4060, float3(0.0), isnan(_4060)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4060, float3(0.0), isnan(_4060)), level(0.0)).x;
    float _1567 = -_1551;
    float _1569 = fma(_1561, _1567, 1.0);
    float3 _4076 = float3(_1557, _1559, _1539);
    float4 _1572 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4076, float3(0.0), isnan(_4076)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4076, float3(0.0), isnan(_4076)), level(0.0)).xyzw;
    float _1574 = _1572.x;
    float _1576 = _1572.y;
    float _1578 = _1572.z;
    float _1580 = _1572.w;
    float2 _4093 = float2(_1569, _1563);
    float3 _1584 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4093, float2(0.0), isnan(_4093)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4093, float2(0.0), isnan(_4093)), level(0.0)).xyz;
    float _1586 = _1584.x;
    float _1588 = _1584.y;
    float _1590 = _1584.z;
    float _1592 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1594 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1596 = _1199 > 0.0;
    bool _1598 = isnan(_1199);
    bool _1600 = _1596 || _1598;
    bool _1602 = isnan(0.0);
    bool _1604 = _1600 || _1602;
    float _1606 = _1511 * 0.5;
    float _1608 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1594);
    float _1610 = exp2(_1592);
    bool _1612 = _1255 <= 0.0;
    bool _1614 = !_1604;
    bool _1616 = _1612 || _1614;
    float _1618 = _1533 + _1511;
    float _1620 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1608);
    float _1622 = _1199 * _1255;
    float _1624 = fma(_1549, -0.5, _1606);
    float _1626 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1620);
    float _1628 = _1622 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1630 = _1618 * 0.5;
    float _1632 = _1626 + _1511;
    float _1634 = _1628 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1533;
    out.gl_Position.y = _1549;
    out.gl_Position.z = _1626;
    out.gl_Position.w = _1511;
    float _1636 = _1632 * 0.5;
    float _1638 = -_1610;
    float _1640 = _1638 + 1.0;
    out.m_47.x = _1634;
    float _1642 = _1640 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.x = _1630;
    out.m_64.y = _1624;
    out.m_64.z = _1636;
    out.m_64.w = _1511;
    float _1644 = _1642 * _1565;
    float _1646 = -_1642;
    float _1648 = _1646 + 1.0;
    float _1650 = _1580 * _1644;
    float _1652 = _1590 * _1644;
    float _1654 = fma(_1586, _1650, _1574);
    float _1656 = fma(_1588, _1650, _1576);
    float _1658 = _1580 * _1648;
    float _1660 = fma(_1580, _1652, _1578);
    out.m_66.x = _1654;
    out.m_66.y = _1656;
    out.m_66.z = _1660;
    out.m_66.w = _1658;
    if (!_1616)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1662 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1662;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _901 = false;
    bool _475 = false;
    bool _281 = false;
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
        float _1719 = as_type<float>(_101);
        out.gl_Position.z = _1719;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1788 = as_type<float>(_137);
        out.gl_Position.z = _1788;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_51.w;
    float _141 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _143 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _145 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _147 = _143 || _145;
    bool _149 = isnan(1.0);
    bool _151 = _147 || _149;
    float _153 = in.m_49.x;
    float _155 = in.m_49.y;
    float _157 = in.m_49.z;
    float _159 = in.m_44.x;
    float _161 = in.m_44.y;
    float _163 = in.m_44.z;
    float _165 = 0.0;
    float _167 = _141;
    if (!_151)
    {
        float _169 = _141 * _141;
        float _171 = _169 * 0.5;
        _165 = _171;
    }
    float _173 = _165;
    float _175 = _173;
    if (!_151)
    {
        float _177 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _177;
    }
    float _179 = _175;
    bool _181 = !_151;
    float _183 = _179;
    if (!_181)
    {
        float _185 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _187 = log2(_185);
        float _189 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _191 = _189 + 1.0;
        float _193 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = _141 * _187;
        float _197 = 1.0 / _191;
        float _199 = _193 * 0.693147182464599609375;
        float _201 = exp2(_195);
        float _203 = 1.0 / _199;
        float _205 = _201 + (-1.0);
        float _207 = -_205;
        float _209 = fma(_207, _203, _141);
        float _211 = _209 * _197;
        float _213 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _213;
    }
    float _215 = _183;
    bool _217 = !_151;
    if (!_217)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = 1.0 / _225;
        float _229 = _141 * _221;
        float _231 = exp2(_229);
        float _233 = -_231;
        float _235 = _233 + 1.0;
        float _237 = _235 * _227;
        _167 = _237;
    }
    float _239 = _167;
    bool _241 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _243 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _245 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _247 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _249 = fma(_239, _153, _243);
    float _251 = fma(_239, _155, _245);
    float _253 = fma(_239, _157, _247);
    float _255 = fma(_249, _139, _159);
    float _257 = fma(_251, _139, _161);
    float _259 = fma(_253, _139, _163);
    bool _261 = !_241;
    float _279;
    if (!_261)
    {
        float _263 = in.m_53.x;
        float _265 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _267 = _263 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _271 = _269 * _265;
        float _273 = floor(_271);
        float _275 = -_273;
        float _277 = _271 + _275;
        _279 = _277;
        _281 = true;
    }
    else
    {
        float _283 = float(_85);
        float _285 = 1.0 / _283;
        float _287 = _119 * _285;
        _279 = _287;
    }
    _281 = false;
    float _289 = _279;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _293 = _289 + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = _289 + _295;
    bool _299 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _301 = isnan(_289);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _325 = _289 + _323;
    float _327 = 1.0 / _313;
    bool _329 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _331 = 1.0 / _321;
    float _333 = 1.0 / _317;
    float _335 = _293 * _327;
    bool _337 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _339 = isnan(_289);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -_309;
    float _351 = _349 + 1.0;
    float _353 = _347 * _351;
    float _355 = _297 * _331;
    bool _357 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _359 = isnan(_289);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -_347;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _377 = _325 * _333;
    bool _379 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _381 = isnan(_289);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _391;
    float _395 = _367 * _371;
    float _397 = -_367;
    float _399 = _397 + 1.0;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _401;
    float _405 = fma(_393, _335, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _407 = _389 * _399;
    float _409 = fma(_403, _335, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _411 = -_389;
    float _413 = _411 + 1.0;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _419 = _405 * _407;
    float _421 = _409 * _407;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _423;
    float _427 = fma(_375, _377, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _429 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[143].x, _419);
    float _431 = fma(_417, _377, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _433;
    float _437 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[143].y, _421);
    float _439 = fma(_425, _355, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _441 = fma(_427, _395, _429);
    float _443 = fma(_435, _355, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _445 = fma(_431, _395, _437);
    float _447 = fma(_439, _353, _441);
    float _449 = fma(_443, _353, _445);
    float _451 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[146].x, _447);
    float _453 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[146].y, _449);
    bool _455 = !_329;
    float _473;
    if (!_455)
    {
        float _457 = in.m_53.x;
        float _459 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _461 = _457 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _463 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _465 = _463 * _459;
        float _467 = floor(_465);
        float _469 = -_467;
        float _471 = _465 + _469;
        _473 = _471;
        _475 = true;
    }
    else
    {
        float _477 = float(_85);
        float _479 = 1.0 / _477;
        float _481 = _119 * _479;
        _473 = _481;
    }
    _475 = false;
    float _483 = _473;
    float _485 = as_type<float>(int(gl_VertexIndex));
    float _487 = in.m_51.x;
    float _489 = in.m_51.y;
    float _491 = in.m_53.x;
    float _493 = in.m_53.y;
    int _495 = as_type<int>(_485) & 1;
    bool _497 = _495 != 0;
    int _499 = as_type<int>(_485) & 2;
    bool _501 = _499 != 0;
    float _503 = _451 * _487;
    float _505 = _453 * _489;
    bool _507 = !_497;
    float _509 = _507 ? (-0.5) : 0.5;
    float _511 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _513 = !_501;
    float _515 = _513 ? (-0.5) : 0.5;
    float _517 = _503 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _519 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _521 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _509);
    bool _523 = _491 > 0.5;
    float _525 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _515);
    bool _527 = _493 > 0.5;
    float _529 = _517 * _521;
    float _531 = _519 * _525;
    float _533 = _257 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _535 = _257 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _537 = _257 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _543 = _531 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _545 = _531 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _547 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[4].x, _533);
    float _549 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[6].x, _537);
    float _551 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[24].x, _543);
    float _553 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[26].x, _545);
    float _555 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].z, _547);
    float _557 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].z, _549);
    float _559 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[24].z, _551);
    float _561 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[26].z, _553);
    float _563 = _555 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _565 = _557 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _567 = _559 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _569 = _561 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _571 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[5].x, _535);
    float _573 = _563 + _567;
    float _575 = _565 + _569;
    float _577 = 1.0 / _541;
    float _579 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _581 = _573 + _579;
    float _583 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _585 = _575 + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _591 = _581 * _581;
    float _593 = _585 * _585;
    float _595 = 1.0 / _589;
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _599 = _597 != 0;
    float _601 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].z, _571);
    float _603 = _591 + _593;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _607 = _605 != 0;
    float _609 = _531 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _611 = _483 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _613 = isnan(_483);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _623;
    float _627 = sqrt(_603);
    bool _629 = _483 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _631 = isnan(_483);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[25].x, _609);
    float _643 = -_621;
    float _645 = _643 + 1.0;
    float _647 = _625 * _577;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _651 = _483 + _649;
    bool _653 = _483 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _655 = isnan(_483);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = _639 * _645;
    float _667 = -_639;
    float _669 = _667 + 1.0;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _675 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[25].z, _641);
    float _677 = fma(_647, _651, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _679 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _681 = _663 * _669;
    float _683 = _673 * _595;
    float _685 = _601 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _687 = _627 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _689 = _675 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _691 = _677 * _681;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _695 = _483 + _693;
    float _697 = -_663;
    float _699 = _697 + 1.0;
    float _701 = -_509;
    float _703 = _523 ? _701 : _509;
    float _705 = _685 + _689;
    float _707 = fma(_683, _695, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _709 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[115].x, _691);
    bool _711 = !_599;
    float _713 = _711 ? _509 : _703;
    float _715 = _699;
    float _717 = _683;
    float _719 = _509;
    float _721 = _695;
    float _723 = _703;
    float _725 = _621;
    float _727 = _563;
    float _729 = _689;
    if (!_687)
    {
        _715 = _593;
    }
    float _731 = _715;
    float _733 = _731;
    if (!_687)
    {
        _717 = _591;
    }
    float _735 = _717;
    float _737 = _735;
    if (!_687)
    {
        _719 = _573;
    }
    float _739 = _719;
    float _741 = _739;
    if (!_687)
    {
        _721 = _575;
    }
    float _743 = _721;
    float _745 = _743;
    if (!_687)
    {
        _723 = _705;
    }
    float _747 = _723;
    bool _749 = !_687;
    float _751 = _747;
    if (!_749)
    {
        float _753 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _755 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _757 = _627 + _755;
        float _759 = rsqrt(_603);
        float _761 = _757 * _753;
        float _763 = _705 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _765 = _761 * 0.15915493667125701904296875;
        float _767 = _765 * 6.283185482025146484375;
        float _769 = sin(_767);
        float _771 = _765 * 6.283185482025146484375;
        float _773 = cos(_771);
        float _775 = fma(_769, _763, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _777 = _759 * _775;
        float _779 = _773 + (-1.0);
        float _781 = fma(_581, _777, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _783 = fma(_585, _777, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _785 = _779 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _787 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _789 = _781 + _787;
        float _791 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _793 = _783 + _791;
        float _795 = fma(_705, _773, _785);
        float _797 = _789 * _789;
        float _799 = _793 * _793;
        _751 = _795;
        _737 = _797;
        _733 = _799;
        _741 = _781;
        _745 = _783;
    }
    float _801 = _751;
    float _803 = _737;
    float _805 = _733;
    float _807 = _741;
    float _809 = _745;
    float _811 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _813 = _801 + _811;
    float _815 = -_515;
    int _817 = _527 ? as_type<int>(_815) : as_type<int>(_515);
    float _819 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _821 = fma(_707, _665, _709);
    float _823 = fma(_813, _813, _803);
    bool _825 = !_607;
    float _827 = _825 ? _515 : as_type<float>(_817);
    float _829 = _713 + 0.5;
    float _831 = _823 + _805;
    float _833 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[117].x, _821);
    float _835 = -_827;
    float _837 = _835 + 0.5;
    float _839 = _829 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _843 = _833 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _845 = sqrt(_831);
    float _847 = _837 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _849 = _839 * _679;
    out.m_58.w = _841;
    float _851 = _847 * _819;
    out.m_60.w = _843;
    out.m_62.x = _849;
    out.m_62.y = _851;
    bool _853 = _845 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _855 = isnan(_845);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _861 = _857 || _859;
    float _863 = _801;
    float _865 = _809;
    if (!_861)
    {
        _725 = 1.0;
    }
    float _867 = _725;
    bool _869 = !_861;
    float _871 = _867;
    if (!_869)
    {
        bool _873 = _845 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _875 = isnan(_845);
        bool _877 = _873 || _875;
        bool _879 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _881 = _877 || _879;
        if (!_881)
        {
            float _883 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _885 = _845 + _883;
            float _887 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _889 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _887;
            float _891 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _893 = _891 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _895 = 1.0 / _889;
            float _897 = _885 * _895;
            float _899 = fma(_897, _893, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _871 = _899;
            _901 = true;
        }
        else
        {
            bool _903 = _845 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _905 = isnan(_845);
            bool _907 = _903 || _905;
            bool _909 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _911 = _907 || _909;
            if (!_911)
            {
                float _913 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _915 = _845 + _913;
                float _917 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _919 = _917 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _921 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _923 = _921 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _925 = 1.0 / _919;
                float _927 = _915 * _925;
                float _929 = fma(_927, _923, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _871 = _929;
                _901 = true;
            }
            else
            {
                _871 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _901 = false;
    float _931 = _871;
    float _933 = _685 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _935 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _937 = _807 + _935;
    float _939 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[11].x, _933);
    bool _941 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _943 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _945 = _941 || _943;
    bool _947 = isnan(0.5);
    bool _949 = _945 || _947;
    float _951 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[11].z, _939);
    float _953 = _685 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _955 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _957 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _959 = _955 || _957;
    bool _961 = isnan(0.5);
    bool _963 = _959 || _961;
    float _965 = fma(_937, _931, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _967 = _951 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _969 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[10].x, _953);
    float _971 = 1.0 / _967;
    float _973 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[10].z, _969);
    float _975 = _973 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _977 = _975 + _967;
    float _979 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _981 = _801 + _979;
    float _983 = _981;
    float _985 = _931;
    float _987 = _965;
    if (_963)
    {
        _863 = 1.0;
    }
    float _989 = _863;
    float _991 = _977 * _971;
    float _993 = _991 * 0.5;
    float _995 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _997 = _809 + _995;
    float _999 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1001 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[30].w, _999);
    float _1003 = fma(_981, _931, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1005 = fma(_997, _931, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1007 = _989;
    if (_949)
    {
        _983 = _965;
    }
    float _1009 = _983;
    float _1011 = 1.0 / _1001;
    float _1013 = _1009;
    if (_949)
    {
        _865 = _1003;
    }
    float _1015 = _865;
    float _1017 = _1015;
    if (_949)
    {
        _985 = _1005;
    }
    float _1019 = _985;
    float _1021 = _1019;
    if (!_949)
    {
        float _1023 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1025 = _685 + _1023;
        float _1027 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1029 = _563 + _1027;
        float _1031 = -_563;
        float _1033 = _1031 + _965;
        float _1035 = -_685;
        float _1037 = _1035 + _1003;
        float _1039 = _1025 * _1025;
        float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1043 = _565 + _1041;
        float _1045 = -_565;
        float _1047 = _1045 + _1005;
        float _1049 = fma(_1029, _1029, _1039);
        float _1051 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1053 = fma(_1043, _1043, _1049);
        float _1055 = sqrt(_1053);
        float _1057 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        bool _1059 = _1055 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1061 = isnan(_1055);
        bool _1063 = _1059 || _1061;
        bool _1065 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1067 = _1063 || _1065;
        float _1069 = precise::min(_1055, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1071 = _1069 * _1051;
        float _1073 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1075 = _1073 * _1071;
        float _1077 = _1001;
        float _1079 = _1051;
        float _1081 = _1055;
        float _1083 = _1073;
        _987 = _1033;
        if (_1067)
        {
            float _1085 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1077 = _1085;
        }
        float _1087 = _1077;
        if (_1067)
        {
            float _1089 = precise::max(_1055, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1079 = _1089;
        }
        float _1091 = _1079;
        float _1093 = fma(_1033, _1075, _563);
        float _1095 = _1087;
        float _1097 = _1093;
        if (_1067)
        {
            float _1099 = _1091 * _1087;
            _1081 = _1099;
        }
        float _1101 = _1081;
        float _1103 = fma(_1037, _1075, _685);
        float _1105 = fma(_1047, _1075, _565);
        float _1107 = _1101;
        if (_1067)
        {
            float _1109 = _1073 * _1101;
            _1095 = _1109;
        }
        float _1111 = _1095;
        if (!_1067)
        {
            _1083 = _1093;
        }
        float _1113 = _1083;
        float _1115 = _1113;
        if (!_1067)
        {
            _1097 = _1103;
        }
        float _1117 = _1097;
        float _1119 = _1117;
        if (_1067)
        {
            float _1121 = fma(_1033, _1111, _563);
            _1115 = _1121;
        }
        float _1123 = _1115;
        _1013 = _1123;
        if (!_1067)
        {
            _1107 = _1105;
        }
        float _1125 = _1107;
        _1021 = _1125;
        if (_1067)
        {
            float _1127 = fma(_1037, _1111, _685);
            _1119 = _1127;
        }
        float _1129 = _1119;
        _1017 = _1129;
        if (_1067)
        {
            float _1131 = fma(_1047, _1111, _565);
            _1021 = _1131;
        }
    }
    float _1133 = _987;
    float _1135 = _1017;
    float _1137 = _1013;
    float _1139 = _1021;
    float _1141 = _1133;
    if (_963)
    {
        _727 = 1.0;
    }
    float _1143 = _727;
    float _1145 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1147 = _1011 * _1145;
    float _1149 = _1143;
    if (!_963)
    {
        float _1151 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1153 = _1151 * 0.15915493667125701904296875;
        float _1155 = _1153 * 6.283185482025146484375;
        float _1157 = cos(_1155);
        float _1159 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1161 = _1159 * 0.15915493667125701904296875;
        float _1163 = _1153 * 6.283185482025146484375;
        float _1165 = sin(_1163);
        float _1167 = 1.0 / _1157;
        float _1169 = _1161 * 6.283185482025146484375;
        float _1171 = cos(_1169);
        float _1173 = _1165 * _1167;
        float _1175 = _1161 * 6.283185482025146484375;
        float _1177 = sin(_1175);
        float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1181 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1179;
        float _1183 = _1171 * _1173;
        float _1185 = 1.0 / _1181;
        float _1187 = 1.0 / _1183;
        float _1189 = _1177 * _1187;
        float _1191 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1193 = fma(_1147, _1189, _1191);
        float _1195 = _1193 * _1185;
        float _1197 = precise::clamp(_1195, 0.0, 1.0);
        _1007 = _1197;
    }
    float _1199 = _1007;
    if (!_963)
    {
        float _1201 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1203 = _1201 * 0.15915493667125701904296875;
        float _1205 = _1203 * 6.283185482025146484375;
        float _1207 = cos(_1205);
        float _1209 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1211 = _1209 * 0.15915493667125701904296875;
        float _1213 = _1203 * 6.283185482025146484375;
        float _1215 = sin(_1213);
        float _1217 = 1.0 / _1207;
        float _1219 = _1211 * 6.283185482025146484375;
        float _1221 = cos(_1219);
        float _1223 = _1215 * _1217;
        float _1225 = _1211 * 6.283185482025146484375;
        float _1227 = sin(_1225);
        float _1229 = _1221 * _1223;
        float _1231 = 1.0 / _1229;
        float _1233 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1235 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1233;
        float _1237 = 1.0 / _1235;
        float _1239 = _1227 * _1231;
        float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1243 = fma(_1147, _1239, _1241);
        float _1245 = _1243 * _1237;
        float _1247 = precise::clamp(_1245, 0.0, 1.0);
        float _1249 = -_1247;
        float _1251 = _1249 + 1.0;
        _1141 = _1239;
        _1149 = _1251;
    }
    float _1253 = _1141;
    float _1255 = _1149;
    float _1257 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1259 = _1135 + _1257;
    float _1261 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1263 = _1137 + _1261;
    float _1265 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1267 = _1139 + _1265;
    float _1269 = _1259 * _1259;
    float _1271 = fma(_1263, _1263, _1269);
    float _1273 = fma(_1267, _1267, _1271);
    float _1275 = rsqrt(_1273);
    float _1277 = _1275 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1279 = _1263 * _1277;
    float _1281 = _1267 * _1277;
    float _1283 = _1279 * _1279;
    float _1285 = _1281 * _1281;
    float _1287 = _1283 + _1285;
    float _1289 = sqrt(_1287);
    bool _1291 = _1289 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1293 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1295 = _1289 + _1293;
    float _1297 = _1267;
    float _1299 = _1271;
    float _1301 = _1295;
    float _1303 = _1253;
    float _1305 = _1259;
    float _1307 = _1279;
    if (_1291)
    {
        float _1309 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1297 = _1309;
    }
    float _1311 = _1297;
    if (_1291)
    {
        float _1313 = rsqrt(_1287);
        _1299 = _1313;
    }
    float _1315 = _1299;
    float _1317 = _1315;
    if (_1291)
    {
        float _1319 = _1295 * _1311;
        _1301 = _1319;
    }
    float _1321 = _1301;
    if (_1291)
    {
        float _1323 = _1321 * 0.15915493667125701904296875;
        _1303 = _1323;
    }
    float _1325 = _1303;
    float _1327 = _1311;
    if (_1291)
    {
        float _1329 = _1325 * 6.283185482025146484375;
        float _1331 = sin(_1329);
        _1327 = _1331;
    }
    float _1333 = _1327;
    float _1335 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1337 = precise::max(0.0, _1335);
    float _1339 = _1275;
    float _1341 = _1337;
    if (_1291)
    {
        float _1343 = _1325 * 6.283185482025146484375;
        float _1345 = cos(_1343);
        _1339 = _1345;
    }
    float _1347 = _1339;
    float _1349 = -_1277;
    float _1351 = -_1337;
    float _1353 = fma(_1259, _1349, _1351);
    if (!_1291)
    {
        _1305 = _1283;
    }
    float _1355 = _1305;
    float _1357 = _1355;
    if (_1291)
    {
        float _1359 = _1353 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1341 = _1359;
    }
    float _1361 = _1341;
    float _1363 = sqrt(_1273);
    float _1365 = _1333;
    float _1367 = _1361;
    if (_1291)
    {
        float _1369 = fma(_1333, _1361, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1365 = _1369;
    }
    float _1371 = _1365;
    float _1373 = _1371;
    if (_1291)
    {
        float _1375 = _1347 + (-1.0);
        _1367 = _1375;
    }
    float _1377 = _1367;
    float _1379 = _1377;
    if (_1291)
    {
        float _1381 = _1315 * _1371;
        _729 = _1381;
    }
    float _1383 = _729;
    if (!_1291)
    {
        _1317 = _1353;
    }
    float _1385 = _1317;
    float _1387 = _1385;
    if (_1291)
    {
        float _1389 = _1377 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1379 = _1389;
    }
    float _1391 = _1379;
    float _1393 = _1391;
    if (_1291)
    {
        float _1395 = _1279 * _1383;
        _1307 = _1395;
    }
    float _1397 = _1307;
    if (!_1291)
    {
        _1373 = _1281;
    }
    float _1399 = _1373;
    float _1401 = _1399;
    if (_1291)
    {
        float _1403 = _1281 * _1383;
        _1401 = _1403;
    }
    float _1405 = _1401;
    if (_1291)
    {
        float _1407 = fma(_1353, _1347, _1391);
        _1387 = _1407;
    }
    float _1409 = _1387;
    if (_1291)
    {
        float _1411 = _1397 * _1397;
        _1357 = _1411;
    }
    float _1413 = _1357;
    if (!_1291)
    {
        _1393 = _1285;
    }
    float _1415 = _1393;
    float _1417 = _1415;
    if (_1291)
    {
        float _1419 = _1405 * _1405;
        _1417 = _1419;
    }
    float _1421 = _1417;
    float _1423 = fma(_1409, _1409, _1413);
    float _1425 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1427 = _1423 + _1421;
    float _1429 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1431 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1433 = fma(_1363, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1431);
    float _1435 = precise::clamp(_1433, 0.0, 1.0);
    float _1437 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1439 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1429);
    float _1441 = rsqrt(_1427);
    float _1443 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1445 = -_1435;
    float _1447 = _1445 + 1.0;
    float _1449 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1439);
    float _1451 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1453 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1443);
    float _1455 = _1449 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1457 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1451);
    float _1459 = abs(_1447);
    float _1461 = log2(_1459);
    float _1463 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1453);
    float _1465 = _1455 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1467 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1457);
    float _1469 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1425);
    float _1471 = _1463 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1473 = -_1465;
    float _1475 = fma(_1473, _1437, 1.0);
    float _1477 = _1441 * _1397;
    float _1479 = _1467 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1481 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1483 = _1441 * _1409;
    float _1485 = _1477 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1487 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1469);
    float _1489 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1481);
    float _1491 = _1441 * _1405;
    float _1493 = -_1485;
    float _1495 = fma(_1483, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1493);
    float _1497 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1499 = _1487 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1501 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1489);
    float _1503 = -_1491;
    float _1505 = fma(_1503, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1495);
    float _1507 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1509 = log2(_1475);
    float _1511 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1501);
    float _1513 = fma(_1505, -0.5, 0.5);
    float _1515 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1517 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1507);
    float _1519 = fma(_1505, 0.5, 0.5);
    float _1521 = _1483 + 1.0;
    float _1523 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1515);
    float _1525 = exp2(_1497);
    float _1527 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1517);
    float _1529 = fma(_1519, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1531 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1523);
    float _1533 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1527);
    float _1535 = 1.0 / _1511;
    float _1537 = _1509 * 0.693147182464599609375;
    float _1539 = _1537 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1541 = sqrt(_1513);
    float _1543 = -_1483;
    float _1545 = fma(_1525, _1521, _1543);
    float _1547 = fma(_1519, _1529, -0.212114393711090087890625);
    float _1549 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1531);
    float _1551 = fma(_1519, _1547, 1.570728778839111328125);
    float _1553 = _1533 * _1535;
    float _1555 = _1549 * _1535;
    float _1557 = fma(_1553, 0.5, 0.5);
    float _1559 = fma(_1555, -0.5, 0.5);
    float _1561 = _1541 * 0.636619746685028076171875;
    float _1563 = fma(_1545, 0.5, 0.5);
    float3 _4060 = float3(_1557, _1559, _1539);
    float _1565 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4060, float3(0.0), isnan(_4060)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4060, float3(0.0), isnan(_4060)), level(0.0)).x;
    float _1567 = -_1551;
    float _1569 = fma(_1561, _1567, 1.0);
    float3 _4076 = float3(_1557, _1559, _1539);
    float4 _1572 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4076, float3(0.0), isnan(_4076)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4076, float3(0.0), isnan(_4076)), level(0.0)).xyzw;
    float _1574 = _1572.x;
    float _1576 = _1572.y;
    float _1578 = _1572.z;
    float _1580 = _1572.w;
    float2 _4093 = float2(_1569, _1563);
    float3 _1584 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4093, float2(0.0), isnan(_4093)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4093, float2(0.0), isnan(_4093)), level(0.0)).xyz;
    float _1586 = _1584.x;
    float _1588 = _1584.y;
    float _1590 = _1584.z;
    float _1592 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1594 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1596 = _1199 > 0.0;
    bool _1598 = isnan(_1199);
    bool _1600 = _1596 || _1598;
    bool _1602 = isnan(0.0);
    bool _1604 = _1600 || _1602;
    float _1606 = _1511 * 0.5;
    float _1608 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1594);
    float _1610 = exp2(_1592);
    bool _1612 = _1255 <= 0.0;
    bool _1614 = !_1604;
    bool _1616 = _1612 || _1614;
    float _1618 = _1533 + _1511;
    float _1620 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1608);
    float _1622 = _1199 * _1255;
    float _1624 = fma(_1549, -0.5, _1606);
    float _1626 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1620);
    float _1628 = _1622 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1630 = _1618 * 0.5;
    float _1632 = _1626 + _1511;
    float _1634 = _1628 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1533;
    out.gl_Position.y = _1549;
    out.gl_Position.z = _1626;
    out.gl_Position.w = _1511;
    float _1636 = _1632 * 0.5;
    float _1638 = -_1610;
    float _1640 = _1638 + 1.0;
    out.m_47.x = _1634;
    float _1642 = _1640 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.x = _1630;
    out.m_64.y = _1624;
    out.m_64.z = _1636;
    out.m_64.w = _1511;
    float _1644 = _1642 * _1565;
    float _1646 = -_1642;
    float _1648 = _1646 + 1.0;
    float _1650 = _1580 * _1644;
    float _1652 = _1590 * _1644;
    float _1654 = fma(_1586, _1650, _1574);
    float _1656 = fma(_1588, _1650, _1576);
    float _1658 = _1580 * _1648;
    float _1660 = fma(_1580, _1652, _1578);
    out.m_66.x = _1654;
    out.m_66.y = _1656;
    out.m_66.z = _1660;
    out.m_66.w = _1658;
    if (!_1616)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1662 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1662;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

