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
    float4 m_62 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
    float4 m_66 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_56 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1609 = false;
    bool _807 = false;
    bool _409 = false;
    bool _299 = false;
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
        float _2289 = as_type<float>(_101);
        out.gl_Position.z = _2289;
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
        float _2358 = as_type<float>(_137);
        out.gl_Position.z = _2358;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = as_type<float>(int(gl_VertexIndex));
    float _141 = in.m_54.w;
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
    int _165 = as_type<int>(_139) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_139) & 2;
    bool _171 = _169 != 0;
    float _173 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _175 = 0.0;
    float _177 = _173;
    if (!_151)
    {
        float _179 = _173 * _173;
        float _181 = _179 * 0.5;
        _175 = _181;
    }
    float _183 = _175;
    bool _185 = !_167;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_171;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = _183;
    if (!_151)
    {
        float _195 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _195;
    }
    float _197 = _193;
    bool _199 = !_151;
    float _201 = _197;
    if (!_199)
    {
        float _203 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = log2(_203);
        float _207 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _209 = _207 + 1.0;
        float _211 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = _173 * _205;
        float _215 = 1.0 / _209;
        float _217 = _211 * 0.693147182464599609375;
        float _219 = exp2(_213);
        float _221 = 1.0 / _217;
        float _223 = _219 + (-1.0);
        float _225 = -_223;
        float _227 = fma(_225, _221, _173);
        float _229 = _227 * _215;
        float _231 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _231;
    }
    float _233 = _201;
    bool _235 = !_151;
    if (!_235)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = 1.0 / _243;
        float _247 = _173 * _239;
        float _249 = exp2(_247);
        float _251 = -_249;
        float _253 = _251 + 1.0;
        float _255 = _253 * _245;
        _177 = _255;
    }
    float _257 = _177;
    bool _259 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _261 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _263 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _265 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _267 = fma(_257, _153, _261);
    float _269 = fma(_257, _155, _263);
    float _271 = fma(_257, _157, _265);
    float _273 = fma(_267, _141, _159);
    float _275 = fma(_269, _141, _161);
    float _277 = fma(_271, _141, _163);
    bool _279 = !_259;
    float _297;
    if (!_279)
    {
        float _281 = in.m_56.x;
        float _283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _285 = _281 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _289 = _287 * _283;
        float _291 = floor(_289);
        float _293 = -_291;
        float _295 = _289 + _293;
        _297 = _295;
        _299 = true;
    }
    else
    {
        float _301 = float(_85);
        float _303 = 1.0 / _301;
        float _305 = _119 * _303;
        _297 = _305;
    }
    _299 = false;
    float _307 = _297;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _311 = _307 + _309;
    float _313 = in.m_54.x;
    float _315 = in.m_54.y;
    bool _317 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _319 = isnan(_307);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _329;
    bool _333 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _335 = isnan(_307);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -_327;
    float _347 = _345 + 1.0;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _349;
    float _353 = 1.0 / _331;
    bool _355 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _357 = _343 * _347;
    float _359 = -_343;
    float _361 = _359 + 1.0;
    float _363 = _311 * _353;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = fma(_351, _363, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _371 = fma(_367, _363, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _373 = _369 * _357;
    float _375 = _371 * _357;
    float _377 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].x, _373);
    float _379 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].y, _375);
    float _381 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[144].x, _377);
    float _383 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[144].y, _379);
    float _385 = _381 * _313;
    float _387 = _383 * _315;
    bool _389 = !_355;
    float _407;
    if (!_389)
    {
        float _391 = in.m_56.x;
        float _393 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _395 = _391 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _397 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _399 = _397 * _393;
        float _401 = floor(_399);
        float _403 = -_401;
        float _405 = _399 + _403;
        _407 = _405;
        _409 = true;
    }
    else
    {
        float _411 = float(_85);
        float _413 = 1.0 / _411;
        float _415 = _119 * _413;
        _407 = _415;
    }
    _409 = false;
    float _417 = _407;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _421 = _417 + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _423;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _431;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _439 = 1.0 / _425;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _441;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _449 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _451 = isnan(_417);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = 1.0 / _433;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _465 = _417 + _463;
    bool _467 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _469 = isnan(_417);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    bool _479 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _481 = isnan(_417);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = -_477;
    float _493 = _491 + 1.0;
    float _495 = 1.0 / _429;
    float _497 = _465 * _439;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _501 = _417 + _499;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _503;
    bool _507 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _509 = isnan(_417);
    bool _511 = _507 || _509;
    bool _513 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _515 = _511 || _513;
    float _517 = float(_515);
    float _519 = fma(_505, _497, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _521 = 1.0 / _447;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _525 = _417 + _523;
    float _527 = _501 * _461;
    bool _529 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _531 = isnan(_417);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _537 = _533 || _535;
    float _539 = float(_537);
    float _541 = -_459;
    float _543 = _541 + 1.0;
    float _545 = 1.0 / _437;
    float _547 = _525 * _495;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _551 = _417 + _549;
    float _553 = -_539;
    float _555 = _553 + 1.0;
    bool _557 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _559 = _459 * _555;
    float _561 = 1.0 / _443;
    float _563 = _551 * _521;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _565;
    float _569 = fma(_567, _497, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _571 = _477 * _543;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _579 = _417 + _577;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _589 = fma(_575, _547, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _591 = _579 * _545;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _593;
    float _597 = -_489;
    float _599 = _597 + 1.0;
    float _601 = _421 * _561;
    float _603 = fma(_583, _547, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _605 = fma(_595, _497, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _607 = _489 * _493;
    bool _609 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _611 = isnan(_417);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = fma(_587, _547, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _623 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _625 = isnan(_417);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _635;
    float _639 = -_619;
    float _641 = _639 + 1.0;
    float _643 = _633 * _599;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _645;
    float _649 = _517 * _641;
    float _651 = -_633;
    float _653 = _651 + 1.0;
    float _655 = fma(_647, _601, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _657 = _569 * _649;
    float _659 = _605 * _649;
    float _661 = _519 * _649;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _667 = _619 * _653;
    float _669 = -_517;
    float _671 = _669 + 1.0;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _673;
    float _677 = fma(_665, _563, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _681 = _679 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _683 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[107].x, _657);
    float _685 = fma(_675, _601, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _691 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[107].y, _659);
    float _693 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[107].z, _661);
    float _695 = fma(_603, _667, _683);
    float _697 = fma(_681, _563, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _699 = fma(_689, _563, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _701 = fma(_637, _601, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _703 = fma(_589, _667, _691);
    float _705 = fma(_621, _667, _693);
    float _707 = fma(_685, _643, _695);
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _709;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _713;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _717;
    float _721 = fma(_655, _643, _703);
    float _723 = fma(_701, _643, _705);
    float _725 = fma(_711, _527, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _727 = fma(_715, _527, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _731 = _729 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _737 = fma(_719, _527, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _739 = fma(_677, _607, _707);
    float _741 = fma(_697, _607, _721);
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _745 = _743 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _747 = fma(_699, _607, _723);
    float _749 = fma(_731, _591, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _751 = fma(_735, _591, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _753 = fma(_745, _591, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _755 = fma(_725, _571, _739);
    float _757 = fma(_727, _571, _741);
    float _759 = fma(_737, _571, _747);
    float _761 = fma(_749, _559, _755);
    float _763 = fma(_751, _559, _757);
    float _765 = fma(_753, _559, _759);
    float _767 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[113].x, _761);
    float _769 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[113].y, _763);
    float _771 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[113].z, _765);
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _775 = _767 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _777 = _769 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _779 = _771 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _781 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _783 = _777 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _785 = _779 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _787 = !_557;
    float _805;
    if (!_787)
    {
        float _789 = in.m_56.x;
        float _791 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _793 = _789 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _795 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _797 = _795 * _791;
        float _799 = floor(_797);
        float _801 = -_799;
        float _803 = _797 + _801;
        _805 = _803;
        _807 = true;
    }
    else
    {
        float _809 = float(_85);
        float _811 = 1.0 / _809;
        float _813 = _119 * _811;
        _805 = _813;
    }
    _807 = false;
    float _815 = _805;
    float _817 = in.m_56.x;
    float _819 = in.m_56.y;
    float _821 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _823 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _825 = _387 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _827 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].z, _823);
    int _829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _831 = _829 != 0;
    int _833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _835 = _833 != 0;
    float _837 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _839 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    bool _841 = _817 > 0.5;
    float _843 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _845 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    bool _847 = _819 > 0.5;
    float _849 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].y, _821);
    float _851 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].x, _843);
    float _853 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].w, _845);
    float _855 = _385 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _857 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _859 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _861 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].x, _851);
    float _863 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].y, _849);
    float _865 = _825 * _857;
    float _867 = _855 * _859;
    float _869 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].z, _827);
    float _871 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].w, _853);
    float _873 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _837);
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _875;
    float _879 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _881;
    float _885 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _887 = 1.0 / _877;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _891 = _889 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _893 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _879);
    float _895 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _885);
    float _897 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _839);
    float _899 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _873);
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _903 = _901 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _905;
    float _909 = 1.0 / _883;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _913 = _911 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _915 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _917 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _919 = _861 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _921 = 1.0 / _907;
    float _923 = _871 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _925 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _915);
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _929 = _815 + _927;
    float _931 = 1.0 / _891;
    float _933 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _935 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _917);
    float _937 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _895);
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _941 = _815 + _939;
    float _943 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _933);
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _947 = _815 + _945;
    float _949 = 1.0 / _903;
    float _951 = _941 * _921;
    float _953 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _925);
    float _955 = _947 * _909;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _959 = _815 + _957;
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _963 = _815 + _961;
    float _965 = 1.0 / _913;
    float _967 = _929 * _931;
    float _969 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _943);
    float _971 = _963 * _887;
    float _973 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _935);
    float _975 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _893);
    float _977 = _865 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _979 = _865 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _981 = sqrt(_937);
    float _983 = _959 * _949;
    float _985 = _865 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _987 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[25].x, _979);
    float _989 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _897);
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _993 = _815 + _991;
    float _995 = sqrt(_899);
    float _997 = -_191;
    int _999 = _847 ? as_type<int>(_997) : as_type<int>(_191);
    float _1001 = _993 * _965;
    float _1003 = -_187;
    int _1005 = _841 ? as_type<int>(_1003) : as_type<int>(_187);
    float _1007 = sqrt(_953);
    bool _1009 = !_831;
    float _1011 = _1009 ? _187 : as_type<float>(_1005);
    bool _1013 = !_835;
    float _1015 = _1013 ? _191 : as_type<float>(_999);
    float _1017 = _863 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1019 = _869 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1021 = sqrt(_989);
    float _1023 = _981 * _1017;
    float _1025 = _995 * _919;
    float _1027 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[26].x, _985);
    float _1029 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1031 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1033 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1035 = sqrt(_969);
    float _1037 = fma(_1007, _1007, _973);
    float _1039 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[24].x, _977);
    float _1041 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1029);
    float _1043 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1031);
    float _1045 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1033);
    float _1047 = _1021 * _1019;
    float _1049 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1051 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1049;
    float _1053 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1041);
    float _1055 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1043);
    float _1057 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1045);
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1059;
    float _1063 = fma(_1035, _1035, _1037);
    float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1067 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1065;
    float _1069 = fma(_1051, _955, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1071 = fma(_1061, _955, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1073 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1053);
    float _1075 = fma(_1067, _955, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1077 = sqrt(_1063);
    float _1079 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1055);
    float _1081 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1057);
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1085 = _1083 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1089 = _1087 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1091 = _1079 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1095 = _1093 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1097 = _1073 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1099 = fma(_1085, _967, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1101 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1103 = fma(_1089, _967, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1105 = _1081 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1107 = fma(_1095, _967, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1109 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1101);
    float _1111 = -_1091;
    float _1113 = _1111 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1115 = -_1097;
    float _1117 = _1115 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1119 = _1077 * 1.730000019073486328125;
    float _1121 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1109);
    float _1123 = _1113 * _1113;
    float _1125 = 1.0 / _1119;
    float _1127 = -_1105;
    float _1129 = _1127 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1131 = fma(_1117, _1117, _1123);
    float _1133 = -_975;
    float _1135 = _1121 + _1133;
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1139 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1137;
    float _1141 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1143 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1141;
    float _1145 = fma(_1129, _1129, _1131);
    float _1147 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1149 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1147;
    float _1151 = fma(_1077, 0.8650000095367431640625, _1135);
    float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1153;
    float _1157 = rsqrt(_1145);
    float _1159 = fma(_1149, _971, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1161 = fma(_1139, _971, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1163 = fma(_1155, _971, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1165 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1169 = _1167 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1171 = _1151 * _1125;
    float _1173 = precise::clamp(_1171, 0.0, 1.0);
    float _1175 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1177 = _1175 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1181 = _1179 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1183 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1027);
    float _1185 = _1173 * _1173;
    float _1187 = fma(_1177, _983, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1189 = fma(_1181, _983, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1191 = fma(_1169, _983, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1193 = _1185 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1195 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1039);
    bool _1197 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1199 = isnan(_815);
    bool _1201 = _1197 || _1199;
    bool _1203 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1205 = _1201 || _1203;
    float _1207 = float(_1205);
    float _1209 = _1183 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1211 = -_1193;
    float _1213 = _1157 * _1211;
    float _1215 = _1195 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _1217 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1219 = isnan(_815);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1225 = _1221 || _1223;
    float _1227 = float(_1225);
    float _1229 = -_1207;
    float _1231 = _1229 + 1.0;
    bool _1233 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1235 = isnan(_815);
    bool _1237 = _1233 || _1235;
    bool _1239 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1241 = _1237 || _1239;
    float _1243 = float(_1241);
    float _1245 = _1097 + _1215;
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1249 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1247;
    float _1251 = _1227 * _1231;
    float _1253 = -_1227;
    float _1255 = _1253 + 1.0;
    float _1257 = fma(_1117, _1213, _1245);
    float _1259 = _1105 + _1209;
    bool _1261 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1263 = isnan(_815);
    bool _1265 = _1261 || _1263;
    bool _1267 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1269 = _1265 || _1267;
    float _1271 = float(_1269);
    float _1273 = -_1243;
    float _1275 = _1273 + 1.0;
    float _1277 = _1243 * _1255;
    bool _1279 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1281 = isnan(_815);
    bool _1283 = _1279 || _1281;
    bool _1285 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1287 = _1283 || _1285;
    float _1289 = float(_1287);
    float _1291 = fma(_1129, _1213, _1259);
    float _1293 = _1271 * _1275;
    float _1295 = -_1271;
    float _1297 = _1295 + 1.0;
    float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1299;
    float _1303 = -_1289;
    float _1305 = _1303 + 1.0;
    float _1307 = fma(_1143, _951, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1309 = _1289 * _1297;
    float _1311 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1313 = _1257 + _1311;
    float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1317 = _1291 + _1315;
    float _1319 = fma(_1249, _951, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1321 = fma(_1301, _951, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1323 = _1313 * _1313;
    float _1325 = _1317 * _1317;
    bool _1327 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1329 = isnan(_815);
    bool _1331 = _1327 || _1329;
    bool _1333 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1335 = _1331 || _1333;
    float _1337 = float(_1335);
    float _1339 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[25].z, _987);
    bool _1341 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1343 = isnan(_815);
    bool _1345 = _1341 || _1343;
    bool _1347 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1349 = _1345 || _1347;
    float _1351 = float(_1349);
    float _1353 = _1323 + _1325;
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1357 = _1355 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1359 = -_1337;
    float _1361 = _1359 + 1.0;
    float _1363 = _1337 * _1305;
    float _1365 = sqrt(_1353);
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1369 = _1367 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1371 = _1351 * _1361;
    float _1373 = -_1351;
    float _1375 = _1373 + 1.0;
    float _1377 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1379 = _1377 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1381 = fma(_1369, _1001, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1383 = _1071 * _1371;
    float _1385 = _1069 * _1371;
    float _1387 = _1075 * _1371;
    float _1389 = fma(_1357, _1001, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1391 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1383);
    float _1393 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1385);
    float _1395 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1387);
    float _1397 = _1339 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1399 = fma(_1099, _1363, _1391);
    float _1401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1403 = _1365 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1405 = _1091 + _1397;
    float _1407 = fma(_1103, _1363, _1393);
    float _1409 = fma(_1107, _1363, _1395);
    float _1411 = fma(_1159, _1309, _1399);
    float _1413 = fma(_1113, _1213, _1405);
    float _1415 = fma(_1161, _1309, _1407);
    float _1417 = fma(_1163, _1309, _1409);
    float _1419 = fma(_1187, _1293, _1411);
    float _1421 = fma(_1379, _1001, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1423 = fma(_1189, _1293, _1415);
    float _1425 = fma(_1191, _1293, _1417);
    float _1427 = fma(_1319, _1277, _1419);
    float _1429 = _1411;
    float _1431 = _1323;
    float _1433 = _1325;
    float _1435 = _1257;
    float _1437 = _1291;
    if (!_1403)
    {
        _1429 = _1413;
    }
    float _1439 = _1429;
    bool _1441 = !_1403;
    float _1443 = _1439;
    float _1445 = _1401;
    if (!_1441)
    {
        float _1447 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1449 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1451 = _1365 + _1449;
        float _1453 = _1413 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1455 = rsqrt(_1353);
        float _1457 = _1451 * _1447;
        float _1459 = _1457 * 0.15915493667125701904296875;
        float _1461 = _1459 * 6.283185482025146484375;
        float _1463 = sin(_1461);
        float _1465 = _1459 * 6.283185482025146484375;
        float _1467 = cos(_1465);
        float _1469 = fma(_1463, _1453, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1471 = _1455 * _1469;
        float _1473 = _1467 + (-1.0);
        float _1475 = fma(_1313, _1471, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1477 = fma(_1317, _1471, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1479 = _1473 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1481 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1483 = _1475 + _1481;
        float _1485 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1487 = _1477 + _1485;
        float _1489 = fma(_1413, _1467, _1479);
        float _1491 = _1483 * _1483;
        float _1493 = _1487 * _1487;
        _1443 = _1489;
        _1431 = _1491;
        _1433 = _1493;
        _1435 = _1475;
        _1437 = _1477;
    }
    float _1495 = _1443;
    float _1497 = _1431;
    float _1499 = _1433;
    float _1501 = _1435;
    float _1503 = _1437;
    float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1507 = _1495 + _1505;
    float _1509 = fma(_1307, _1277, _1423);
    float _1511 = fma(_1321, _1277, _1425);
    float _1513 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1515 = fma(_1507, _1507, _1497);
    float _1517 = fma(_1381, _1251, _1427);
    float _1519 = fma(_1389, _1251, _1509);
    float _1521 = fma(_1421, _1251, _1511);
    float _1523 = _1515 + _1499;
    float _1525 = _1011 + 0.5;
    float _1527 = -_1015;
    float _1529 = _1527 + 0.5;
    float _1531 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1517);
    float _1533 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1519);
    float _1535 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1521);
    float _1537 = sqrt(_1523);
    float _1539 = _1525 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1541 = _1529 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1543 = _1531 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1545 = _1533 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1547 = _1535 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1549 = _1539 * _1401;
    float _1551 = _1541 * _1513;
    float _1553 = _1543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1555 = _1545 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1557 = _1547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _781;
    out.m_58.y = _783;
    out.m_58.z = _785;
    out.m_58.w = _773;
    out.m_60.x = _1549;
    out.m_60.y = _1551;
    bool _1559 = _1537 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1561 = isnan(_1537);
    bool _1563 = _1559 || _1561;
    bool _1565 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1567 = _1563 || _1565;
    out.m_62.x = _1553;
    out.m_62.y = _1555;
    out.m_62.z = _1557;
    float _1569 = _1539;
    float _1571 = _1495;
    float _1573 = _1549;
    if (!_1567)
    {
        _1569 = 1.0;
    }
    float _1575 = _1569;
    bool _1577 = !_1567;
    float _1579 = _1575;
    if (!_1577)
    {
        bool _1581 = _1537 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1583 = isnan(_1537);
        bool _1585 = _1581 || _1583;
        bool _1587 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1589 = _1585 || _1587;
        if (!_1589)
        {
            float _1591 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1593 = _1537 + _1591;
            float _1595 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1597 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1595;
            float _1599 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1601 = _1599 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1603 = 1.0 / _1597;
            float _1605 = _1593 * _1603;
            float _1607 = fma(_1605, _1601, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1579 = _1607;
            _1609 = true;
        }
        else
        {
            bool _1611 = _1537 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1613 = isnan(_1537);
            bool _1615 = _1611 || _1613;
            bool _1617 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1619 = _1615 || _1617;
            if (!_1619)
            {
                float _1621 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1623 = _1537 + _1621;
                float _1625 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1627 = _1625 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1629 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1631 = _1629 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1633 = 1.0 / _1627;
                float _1635 = _1623 * _1633;
                float _1637 = fma(_1635, _1631, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1579 = _1637;
                _1609 = true;
            }
            else
            {
                _1579 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1609 = false;
    float _1639 = _1579;
    float _1641 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1643 = _1495 + _1641;
    float _1645 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1647 = _1501 + _1645;
    float _1649 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1651 = _1503 + _1649;
    float _1653 = fma(_1643, _1639, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1655 = fma(_1647, _1639, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1657 = fma(_1651, _1639, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1659 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1661 = _1653 + _1659;
    float _1663 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1665 = _1655 + _1663;
    float _1667 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1669 = _1657 + _1667;
    float _1671 = _1661 * _1661;
    float _1673 = fma(_1665, _1665, _1671);
    float _1675 = fma(_1669, _1669, _1673);
    float _1677 = rsqrt(_1675);
    float _1679 = _1677 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1681 = _1665 * _1679;
    float _1683 = _1669 * _1679;
    float _1685 = _1681 * _1681;
    float _1687 = _1683 * _1683;
    float _1689 = _1685 + _1687;
    float _1691 = sqrt(_1689);
    bool _1693 = _1691 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1697 = _1691 + _1695;
    float _1699 = _1677;
    float _1701 = _1697;
    float _1703 = _1681;
    if (_1693)
    {
        float _1705 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1699 = _1705;
    }
    float _1707 = _1699;
    if (_1693)
    {
        float _1709 = rsqrt(_1689);
        _1445 = _1709;
    }
    float _1711 = _1445;
    float _1713 = _1711;
    if (_1693)
    {
        float _1715 = _1697 * _1707;
        _1701 = _1715;
    }
    float _1717 = _1701;
    if (_1693)
    {
        float _1719 = _1717 * 0.15915493667125701904296875;
        _1571 = _1719;
    }
    float _1721 = _1571;
    float _1723 = _1669;
    if (_1693)
    {
        float _1725 = _1721 * 6.283185482025146484375;
        float _1727 = sin(_1725);
        _1723 = _1727;
    }
    float _1729 = _1723;
    float _1731 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1733 = precise::max(0.0, _1731);
    float _1735 = _1547;
    float _1737 = _1733;
    float _1739 = _1731;
    if (_1693)
    {
        float _1741 = _1721 * 6.283185482025146484375;
        float _1743 = cos(_1741);
        _1735 = _1743;
    }
    float _1745 = _1735;
    float _1747 = -_1679;
    float _1749 = -_1733;
    float _1751 = fma(_1661, _1747, _1749);
    float _1753 = _1751;
    if (_1693)
    {
        float _1755 = _1751 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1737 = _1755;
    }
    float _1757 = _1737;
    float _1759 = sqrt(_1675);
    float _1761 = _1729;
    float _1763 = _1757;
    if (_1693)
    {
        float _1765 = fma(_1729, _1757, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1761 = _1765;
    }
    float _1767 = _1761;
    float _1769 = _1767;
    if (!_1693)
    {
        _1763 = _1751;
    }
    float _1771 = _1763;
    float _1773 = _1771;
    if (_1693)
    {
        float _1775 = _1745 + (-1.0);
        _1739 = _1775;
    }
    float _1777 = _1739;
    float _1779 = _1777;
    if (_1693)
    {
        float _1781 = _1711 * _1767;
        _1573 = _1781;
    }
    float _1783 = _1573;
    if (!_1693)
    {
        _1769 = _1683;
    }
    float _1785 = _1769;
    float _1787 = _1653 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1789 = _1785;
    if (_1693)
    {
        float _1791 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1713 = _1791;
    }
    float _1793 = _1713;
    if (_1693)
    {
        float _1795 = _1681 * _1783;
        _1703 = _1795;
    }
    float _1797 = _1703;
    if (!_1693)
    {
        _1779 = _1685;
    }
    float _1799 = _1779;
    float _1801 = _1799;
    if (_1693)
    {
        float _1803 = _1683 * _1783;
        _1789 = _1803;
    }
    float _1805 = _1789;
    if (_1693)
    {
        float _1807 = fma(_1751, _1745, _1793);
        _1773 = _1807;
    }
    float _1809 = _1773;
    if (_1693)
    {
        float _1811 = _1797 * _1797;
        _1801 = _1811;
    }
    float _1813 = _1801;
    if (!_1693)
    {
        _1753 = _1687;
    }
    float _1815 = _1753;
    float _1817 = _1815;
    if (_1693)
    {
        float _1819 = _1805 * _1805;
        _1817 = _1819;
    }
    float _1821 = _1817;
    float _1823 = fma(_1809, _1809, _1813);
    float _1825 = _1653 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1827 = _1653 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1829 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1787);
    float _1831 = _1823 + _1821;
    float _1833 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1835 = fma(_1759, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1833);
    float _1837 = precise::clamp(_1835, 0.0, 1.0);
    float _1839 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1825);
    float _1841 = _1653 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1843 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1827);
    float _1845 = -_1837;
    float _1847 = _1845 + 1.0;
    float _1849 = rsqrt(_1831);
    float _1851 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1841);
    float _1853 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1843);
    float _1855 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1839);
    float _1857 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1829);
    float _1859 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1851);
    float _1861 = _1853 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1863 = abs(_1847);
    float _1865 = log2(_1863);
    float _1867 = _1859 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1869 = _1855 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1871 = _1857 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1873 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1875 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1877 = _1869 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1879 = _1849 * _1797;
    float _1881 = _1849 * _1809;
    float _1883 = _1849 * _1805;
    float _1885 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1875);
    float _1887 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1889 = -_1877;
    float _1891 = fma(_1889, _1873, 1.0);
    float _1893 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1885);
    float _1895 = -_1887;
    float _1897 = fma(_1881, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1895);
    float _1899 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1901 = log2(_1891);
    float _1903 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1893);
    float _1905 = -_1883;
    float _1907 = fma(_1905, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1897);
    float _1909 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1911 = fma(_1907, -0.5, 0.5);
    float _1913 = fma(_1907, 0.5, 0.5);
    float _1915 = exp2(_1899);
    float _1917 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1919 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1909);
    float _1921 = _1881 + 1.0;
    float _1923 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1917);
    float _1925 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1919);
    float _1927 = 1.0 / _1903;
    float _1929 = fma(_1913, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1931 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1923);
    float _1933 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1925);
    float _1935 = _1901 * 0.693147182464599609375;
    float _1937 = fma(_1913, _1929, -0.212114393711090087890625);
    float _1939 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1931);
    float _1941 = sqrt(_1911);
    float _1943 = -_1881;
    float _1945 = fma(_1915, _1921, _1943);
    float _1947 = fma(_1913, _1937, 1.570728778839111328125);
    float _1949 = _1935 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1951 = fma(_1945, 0.5, 0.5);
    float _1953 = _1933 * _1927;
    float _1955 = _1939 * _1927;
    float _1957 = fma(_1953, 0.5, 0.5);
    float _1959 = fma(_1955, -0.5, 0.5);
    float _1961 = _1941 * 0.636619746685028076171875;
    float _1963 = -_1947;
    float _1965 = fma(_1961, _1963, 1.0);
    float3 _5471 = float3(_1957, _1959, _1949);
    float _1967 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5471, float3(0.0), isnan(_5471)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5471, float3(0.0), isnan(_5471)), level(0.0)).x;
    float3 _5482 = float3(_1957, _1959, _1949);
    float4 _1970 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5482, float3(0.0), isnan(_5482)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5482, float3(0.0), isnan(_5482)), level(0.0)).xyzw;
    float _1972 = _1970.x;
    float _1974 = _1970.y;
    float _1976 = _1970.z;
    float _1978 = _1970.w;
    float2 _5499 = float2(_1965, _1951);
    float3 _1982 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5499, float2(0.0), isnan(_5499)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5499, float2(0.0), isnan(_5499)), level(0.0)).xyz;
    float _1984 = _1982.x;
    float _1986 = _1982.y;
    float _1988 = _1982.z;
    float _1990 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1992 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1994 = _1869 + (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1996 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1998 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1990);
    float _2000 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1992);
    float _2002 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1998);
    float _2004 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2000);
    float _2006 = _2002 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2008 = _2004 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2010 = 1.0 / _2006;
    float _2012 = _2008 + _2006;
    float _2014 = _2012 * 0.5;
    float _2016 = _2014 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _2018 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2020 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2018);
    float _2022 = -(*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _2024 = fma(_2016, _2010, _2022);
    float _2026 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1885);
    float _2028 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2020);
    float _2030 = _2014 + _2024;
    float _2032 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2026);
    float _2034 = exp2(_1996);
    float _2036 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2028);
    float _2038 = _2030 * _2010;
    float _2040 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2042 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2040);
    float _2044 = 1.0 / _2032;
    bool _2046 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2048 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2050 = _2046 || _2048;
    bool _2052 = isnan(0.5);
    bool _2054 = _2050 || _2052;
    float _2056 = 1.0 / _2042;
    float _2058 = _2036 * _2044;
    float _2060 = _2044;
    float _2062 = _2032;
    if (_2054)
    {
        _2060 = 1.0;
    }
    float _2064 = _2060;
    float _2066 = _2064;
    if (_2054)
    {
        _2062 = 1.0;
    }
    float _2068 = _2062;
    float _2070 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2072 = _2056 * _2070;
    float _2074 = _2068;
    if (!_2054)
    {
        float _2076 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2078 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2080 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2078;
        float _2082 = _2076 * 0.15915493667125701904296875;
        float _2084 = _2082 * 6.283185482025146484375;
        float _2086 = cos(_2084);
        float _2088 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2090 = _2088 * 0.15915493667125701904296875;
        float _2092 = _2082 * 6.283185482025146484375;
        float _2094 = sin(_2092);
        float _2096 = 1.0 / _2086;
        float _2098 = _2090 * 6.283185482025146484375;
        float _2100 = cos(_2098);
        float _2102 = _2094 * _2096;
        float _2104 = _2090 * 6.283185482025146484375;
        float _2106 = sin(_2104);
        float _2108 = _2100 * _2102;
        float _2110 = 1.0 / _2080;
        float _2112 = 1.0 / _2108;
        float _2114 = _2106 * _2112;
        float _2116 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2118 = fma(_2072, _2114, _2116);
        float _2120 = _2118 * _2110;
        float _2122 = precise::clamp(_2120, 0.0, 1.0);
        _2066 = _2122;
    }
    float _2124 = _2066;
    if (!_2054)
    {
        float _2126 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2128 = _2126 * 0.15915493667125701904296875;
        float _2130 = _2128 * 6.283185482025146484375;
        float _2132 = cos(_2130);
        float _2134 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2136 = _2134 * 0.15915493667125701904296875;
        float _2138 = _2128 * 6.283185482025146484375;
        float _2140 = sin(_2138);
        float _2142 = 1.0 / _2132;
        float _2144 = _2136 * 6.283185482025146484375;
        float _2146 = cos(_2144);
        float _2148 = _2140 * _2142;
        float _2150 = _2136 * 6.283185482025146484375;
        float _2152 = sin(_2150);
        float _2154 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2156 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2154;
        float _2158 = _2146 * _2148;
        float _2160 = 1.0 / _2156;
        float _2162 = 1.0 / _2158;
        float _2164 = _2152 * _2162;
        float _2166 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2168 = fma(_2072, _2164, _2166);
        float _2170 = _2168 * _2160;
        float _2172 = precise::clamp(_2170, 0.0, 1.0);
        float _2174 = -_2172;
        float _2176 = _2174 + 1.0;
        _2074 = _2176;
    }
    float _2178 = _2074;
    float _2180 = -_2034;
    float _2182 = _2180 + 1.0;
    float _2184 = _2124 * _2178;
    bool _2186 = _2124 > 0.0;
    bool _2188 = isnan(_2124);
    bool _2190 = _2186 || _2188;
    bool _2192 = isnan(0.0);
    bool _2194 = _2190 || _2192;
    float _2196 = _1903 * _2058;
    float _2198 = _2182 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2200 = _2184 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2202 = _2178 <= 0.0;
    bool _2204 = !_2194;
    bool _2206 = _2202 || _2204;
    float _2208 = _1903 + _2196;
    float _2210 = _2198 * _1967;
    float _2212 = -_2198;
    float _2214 = _2212 + 1.0;
    float _2216 = _1978 * _2210;
    float _2218 = _1988 * _2210;
    out.gl_Position.x = _1933;
    out.gl_Position.y = _1939;
    out.gl_Position.z = _2196;
    out.gl_Position.w = _1903;
    float _2220 = _2208 * 0.5;
    float _2222 = fma(_1984, _2216, _1972);
    float _2224 = _2200 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2226 = fma(_1986, _2216, _1974);
    float _2228 = _1978 * _2214;
    float _2230 = fma(_1978, _2218, _1976);
    out.m_64.z = _2220;
    out.m_64.w = _1903;
    out.m_47.x = _2224;
    out.m_66.x = _2222;
    out.m_66.y = _2226;
    out.m_66.z = _2230;
    out.m_66.w = _2228;
    if (!_2206)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2232 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2232;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1609 = false;
    bool _807 = false;
    bool _409 = false;
    bool _299 = false;
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
        float _2289 = as_type<float>(_101);
        out.gl_Position.z = _2289;
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
        float _2358 = as_type<float>(_137);
        out.gl_Position.z = _2358;
    }
    if (_129)
    {
        return out;
    }
    float _139 = as_type<float>(int(gl_VertexIndex));
    float _141 = in.m_54.w;
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
    int _165 = as_type<int>(_139) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_139) & 2;
    bool _171 = _169 != 0;
    float _173 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _175 = 0.0;
    float _177 = _173;
    if (!_151)
    {
        float _179 = _173 * _173;
        float _181 = _179 * 0.5;
        _175 = _181;
    }
    float _183 = _175;
    bool _185 = !_167;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_171;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = _183;
    if (!_151)
    {
        float _195 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _195;
    }
    float _197 = _193;
    bool _199 = !_151;
    float _201 = _197;
    if (!_199)
    {
        float _203 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = log2(_203);
        float _207 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _209 = _207 + 1.0;
        float _211 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = _173 * _205;
        float _215 = 1.0 / _209;
        float _217 = _211 * 0.693147182464599609375;
        float _219 = exp2(_213);
        float _221 = 1.0 / _217;
        float _223 = _219 + (-1.0);
        float _225 = -_223;
        float _227 = fma(_225, _221, _173);
        float _229 = _227 * _215;
        float _231 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _231;
    }
    float _233 = _201;
    bool _235 = !_151;
    if (!_235)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = 1.0 / _243;
        float _247 = _173 * _239;
        float _249 = exp2(_247);
        float _251 = -_249;
        float _253 = _251 + 1.0;
        float _255 = _253 * _245;
        _177 = _255;
    }
    float _257 = _177;
    bool _259 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _261 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _263 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _265 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _267 = fma(_257, _153, _261);
    float _269 = fma(_257, _155, _263);
    float _271 = fma(_257, _157, _265);
    float _273 = fma(_267, _141, _159);
    float _275 = fma(_269, _141, _161);
    float _277 = fma(_271, _141, _163);
    bool _279 = !_259;
    float _297;
    if (!_279)
    {
        float _281 = in.m_56.x;
        float _283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _285 = _281 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _289 = _287 * _283;
        float _291 = floor(_289);
        float _293 = -_291;
        float _295 = _289 + _293;
        _297 = _295;
        _299 = true;
    }
    else
    {
        float _301 = float(_85);
        float _303 = 1.0 / _301;
        float _305 = _119 * _303;
        _297 = _305;
    }
    _299 = false;
    float _307 = _297;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _311 = _307 + _309;
    float _313 = in.m_54.x;
    float _315 = in.m_54.y;
    bool _317 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _319 = isnan(_307);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _329;
    bool _333 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _335 = isnan(_307);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -_327;
    float _347 = _345 + 1.0;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _349;
    float _353 = 1.0 / _331;
    bool _355 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _357 = _343 * _347;
    float _359 = -_343;
    float _361 = _359 + 1.0;
    float _363 = _311 * _353;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = fma(_351, _363, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _371 = fma(_367, _363, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _373 = _369 * _357;
    float _375 = _371 * _357;
    float _377 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].x, _373);
    float _379 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].y, _375);
    float _381 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[144].x, _377);
    float _383 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[144].y, _379);
    float _385 = _381 * _313;
    float _387 = _383 * _315;
    bool _389 = !_355;
    float _407;
    if (!_389)
    {
        float _391 = in.m_56.x;
        float _393 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _395 = _391 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _397 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _399 = _397 * _393;
        float _401 = floor(_399);
        float _403 = -_401;
        float _405 = _399 + _403;
        _407 = _405;
        _409 = true;
    }
    else
    {
        float _411 = float(_85);
        float _413 = 1.0 / _411;
        float _415 = _119 * _413;
        _407 = _415;
    }
    _409 = false;
    float _417 = _407;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _421 = _417 + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _423;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _431;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _439 = 1.0 / _425;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _441;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _449 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _451 = isnan(_417);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = 1.0 / _433;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _465 = _417 + _463;
    bool _467 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _469 = isnan(_417);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    bool _479 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _481 = isnan(_417);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = -_477;
    float _493 = _491 + 1.0;
    float _495 = 1.0 / _429;
    float _497 = _465 * _439;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _501 = _417 + _499;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _503;
    bool _507 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _509 = isnan(_417);
    bool _511 = _507 || _509;
    bool _513 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _515 = _511 || _513;
    float _517 = float(_515);
    float _519 = fma(_505, _497, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _521 = 1.0 / _447;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _525 = _417 + _523;
    float _527 = _501 * _461;
    bool _529 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _531 = isnan(_417);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _537 = _533 || _535;
    float _539 = float(_537);
    float _541 = -_459;
    float _543 = _541 + 1.0;
    float _545 = 1.0 / _437;
    float _547 = _525 * _495;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _551 = _417 + _549;
    float _553 = -_539;
    float _555 = _553 + 1.0;
    bool _557 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _559 = _459 * _555;
    float _561 = 1.0 / _443;
    float _563 = _551 * _521;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _565;
    float _569 = fma(_567, _497, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _571 = _477 * _543;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _579 = _417 + _577;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _589 = fma(_575, _547, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _591 = _579 * _545;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _593;
    float _597 = -_489;
    float _599 = _597 + 1.0;
    float _601 = _421 * _561;
    float _603 = fma(_583, _547, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _605 = fma(_595, _497, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _607 = _489 * _493;
    bool _609 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _611 = isnan(_417);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = fma(_587, _547, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _623 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _625 = isnan(_417);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _635;
    float _639 = -_619;
    float _641 = _639 + 1.0;
    float _643 = _633 * _599;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _645;
    float _649 = _517 * _641;
    float _651 = -_633;
    float _653 = _651 + 1.0;
    float _655 = fma(_647, _601, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _657 = _569 * _649;
    float _659 = _605 * _649;
    float _661 = _519 * _649;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _667 = _619 * _653;
    float _669 = -_517;
    float _671 = _669 + 1.0;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _673;
    float _677 = fma(_665, _563, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _681 = _679 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _683 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[107].x, _657);
    float _685 = fma(_675, _601, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _691 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[107].y, _659);
    float _693 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[107].z, _661);
    float _695 = fma(_603, _667, _683);
    float _697 = fma(_681, _563, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _699 = fma(_689, _563, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _701 = fma(_637, _601, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _703 = fma(_589, _667, _691);
    float _705 = fma(_621, _667, _693);
    float _707 = fma(_685, _643, _695);
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _709;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _713;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _717;
    float _721 = fma(_655, _643, _703);
    float _723 = fma(_701, _643, _705);
    float _725 = fma(_711, _527, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _727 = fma(_715, _527, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _731 = _729 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _737 = fma(_719, _527, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _739 = fma(_677, _607, _707);
    float _741 = fma(_697, _607, _721);
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _745 = _743 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _747 = fma(_699, _607, _723);
    float _749 = fma(_731, _591, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _751 = fma(_735, _591, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _753 = fma(_745, _591, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _755 = fma(_725, _571, _739);
    float _757 = fma(_727, _571, _741);
    float _759 = fma(_737, _571, _747);
    float _761 = fma(_749, _559, _755);
    float _763 = fma(_751, _559, _757);
    float _765 = fma(_753, _559, _759);
    float _767 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[113].x, _761);
    float _769 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[113].y, _763);
    float _771 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[113].z, _765);
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _775 = _767 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _777 = _769 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _779 = _771 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _781 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _783 = _777 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _785 = _779 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _787 = !_557;
    float _805;
    if (!_787)
    {
        float _789 = in.m_56.x;
        float _791 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _793 = _789 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _795 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _797 = _795 * _791;
        float _799 = floor(_797);
        float _801 = -_799;
        float _803 = _797 + _801;
        _805 = _803;
        _807 = true;
    }
    else
    {
        float _809 = float(_85);
        float _811 = 1.0 / _809;
        float _813 = _119 * _811;
        _805 = _813;
    }
    _807 = false;
    float _815 = _805;
    float _817 = in.m_56.x;
    float _819 = in.m_56.y;
    float _821 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _823 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _825 = _387 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _827 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].z, _823);
    int _829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _831 = _829 != 0;
    int _833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _835 = _833 != 0;
    float _837 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _839 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    bool _841 = _817 > 0.5;
    float _843 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _845 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    bool _847 = _819 > 0.5;
    float _849 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].y, _821);
    float _851 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].x, _843);
    float _853 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].w, _845);
    float _855 = _385 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _857 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _859 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _861 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].x, _851);
    float _863 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].y, _849);
    float _865 = _825 * _857;
    float _867 = _855 * _859;
    float _869 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].z, _827);
    float _871 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].w, _853);
    float _873 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _837);
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _875;
    float _879 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _881;
    float _885 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _887 = 1.0 / _877;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _891 = _889 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _893 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _879);
    float _895 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _885);
    float _897 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _839);
    float _899 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _873);
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _903 = _901 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _905;
    float _909 = 1.0 / _883;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _913 = _911 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _915 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _917 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _919 = _861 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _921 = 1.0 / _907;
    float _923 = _871 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _925 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _915);
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _929 = _815 + _927;
    float _931 = 1.0 / _891;
    float _933 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _935 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _917);
    float _937 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _895);
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _941 = _815 + _939;
    float _943 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _933);
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _947 = _815 + _945;
    float _949 = 1.0 / _903;
    float _951 = _941 * _921;
    float _953 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _925);
    float _955 = _947 * _909;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _959 = _815 + _957;
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _963 = _815 + _961;
    float _965 = 1.0 / _913;
    float _967 = _929 * _931;
    float _969 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _943);
    float _971 = _963 * _887;
    float _973 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _935);
    float _975 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _893);
    float _977 = _865 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _979 = _865 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _981 = sqrt(_937);
    float _983 = _959 * _949;
    float _985 = _865 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _987 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[25].x, _979);
    float _989 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _897);
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _993 = _815 + _991;
    float _995 = sqrt(_899);
    float _997 = -_191;
    int _999 = _847 ? as_type<int>(_997) : as_type<int>(_191);
    float _1001 = _993 * _965;
    float _1003 = -_187;
    int _1005 = _841 ? as_type<int>(_1003) : as_type<int>(_187);
    float _1007 = sqrt(_953);
    bool _1009 = !_831;
    float _1011 = _1009 ? _187 : as_type<float>(_1005);
    bool _1013 = !_835;
    float _1015 = _1013 ? _191 : as_type<float>(_999);
    float _1017 = _863 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1019 = _869 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1021 = sqrt(_989);
    float _1023 = _981 * _1017;
    float _1025 = _995 * _919;
    float _1027 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[26].x, _985);
    float _1029 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1031 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1033 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1035 = sqrt(_969);
    float _1037 = fma(_1007, _1007, _973);
    float _1039 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[24].x, _977);
    float _1041 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1029);
    float _1043 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1031);
    float _1045 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1033);
    float _1047 = _1021 * _1019;
    float _1049 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1051 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1049;
    float _1053 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1041);
    float _1055 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1043);
    float _1057 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1045);
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1059;
    float _1063 = fma(_1035, _1035, _1037);
    float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1067 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1065;
    float _1069 = fma(_1051, _955, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1071 = fma(_1061, _955, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1073 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1053);
    float _1075 = fma(_1067, _955, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1077 = sqrt(_1063);
    float _1079 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1055);
    float _1081 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1057);
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1085 = _1083 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1089 = _1087 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1091 = _1079 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1095 = _1093 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1097 = _1073 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1099 = fma(_1085, _967, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1101 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1103 = fma(_1089, _967, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1105 = _1081 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1107 = fma(_1095, _967, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1109 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1101);
    float _1111 = -_1091;
    float _1113 = _1111 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1115 = -_1097;
    float _1117 = _1115 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1119 = _1077 * 1.730000019073486328125;
    float _1121 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1109);
    float _1123 = _1113 * _1113;
    float _1125 = 1.0 / _1119;
    float _1127 = -_1105;
    float _1129 = _1127 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1131 = fma(_1117, _1117, _1123);
    float _1133 = -_975;
    float _1135 = _1121 + _1133;
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1139 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1137;
    float _1141 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1143 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1141;
    float _1145 = fma(_1129, _1129, _1131);
    float _1147 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1149 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1147;
    float _1151 = fma(_1077, 0.8650000095367431640625, _1135);
    float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1153;
    float _1157 = rsqrt(_1145);
    float _1159 = fma(_1149, _971, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1161 = fma(_1139, _971, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1163 = fma(_1155, _971, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1165 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1169 = _1167 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1171 = _1151 * _1125;
    float _1173 = precise::clamp(_1171, 0.0, 1.0);
    float _1175 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1177 = _1175 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1181 = _1179 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1183 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1027);
    float _1185 = _1173 * _1173;
    float _1187 = fma(_1177, _983, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1189 = fma(_1181, _983, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1191 = fma(_1169, _983, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1193 = _1185 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1195 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1039);
    bool _1197 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1199 = isnan(_815);
    bool _1201 = _1197 || _1199;
    bool _1203 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1205 = _1201 || _1203;
    float _1207 = float(_1205);
    float _1209 = _1183 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1211 = -_1193;
    float _1213 = _1157 * _1211;
    float _1215 = _1195 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _1217 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1219 = isnan(_815);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1225 = _1221 || _1223;
    float _1227 = float(_1225);
    float _1229 = -_1207;
    float _1231 = _1229 + 1.0;
    bool _1233 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1235 = isnan(_815);
    bool _1237 = _1233 || _1235;
    bool _1239 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1241 = _1237 || _1239;
    float _1243 = float(_1241);
    float _1245 = _1097 + _1215;
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1249 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1247;
    float _1251 = _1227 * _1231;
    float _1253 = -_1227;
    float _1255 = _1253 + 1.0;
    float _1257 = fma(_1117, _1213, _1245);
    float _1259 = _1105 + _1209;
    bool _1261 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1263 = isnan(_815);
    bool _1265 = _1261 || _1263;
    bool _1267 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1269 = _1265 || _1267;
    float _1271 = float(_1269);
    float _1273 = -_1243;
    float _1275 = _1273 + 1.0;
    float _1277 = _1243 * _1255;
    bool _1279 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1281 = isnan(_815);
    bool _1283 = _1279 || _1281;
    bool _1285 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1287 = _1283 || _1285;
    float _1289 = float(_1287);
    float _1291 = fma(_1129, _1213, _1259);
    float _1293 = _1271 * _1275;
    float _1295 = -_1271;
    float _1297 = _1295 + 1.0;
    float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1299;
    float _1303 = -_1289;
    float _1305 = _1303 + 1.0;
    float _1307 = fma(_1143, _951, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1309 = _1289 * _1297;
    float _1311 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1313 = _1257 + _1311;
    float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1317 = _1291 + _1315;
    float _1319 = fma(_1249, _951, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1321 = fma(_1301, _951, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1323 = _1313 * _1313;
    float _1325 = _1317 * _1317;
    bool _1327 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1329 = isnan(_815);
    bool _1331 = _1327 || _1329;
    bool _1333 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1335 = _1331 || _1333;
    float _1337 = float(_1335);
    float _1339 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[25].z, _987);
    bool _1341 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1343 = isnan(_815);
    bool _1345 = _1341 || _1343;
    bool _1347 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1349 = _1345 || _1347;
    float _1351 = float(_1349);
    float _1353 = _1323 + _1325;
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1357 = _1355 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1359 = -_1337;
    float _1361 = _1359 + 1.0;
    float _1363 = _1337 * _1305;
    float _1365 = sqrt(_1353);
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1369 = _1367 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1371 = _1351 * _1361;
    float _1373 = -_1351;
    float _1375 = _1373 + 1.0;
    float _1377 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1379 = _1377 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1381 = fma(_1369, _1001, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1383 = _1071 * _1371;
    float _1385 = _1069 * _1371;
    float _1387 = _1075 * _1371;
    float _1389 = fma(_1357, _1001, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1391 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1383);
    float _1393 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1385);
    float _1395 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1387);
    float _1397 = _1339 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1399 = fma(_1099, _1363, _1391);
    float _1401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1403 = _1365 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1405 = _1091 + _1397;
    float _1407 = fma(_1103, _1363, _1393);
    float _1409 = fma(_1107, _1363, _1395);
    float _1411 = fma(_1159, _1309, _1399);
    float _1413 = fma(_1113, _1213, _1405);
    float _1415 = fma(_1161, _1309, _1407);
    float _1417 = fma(_1163, _1309, _1409);
    float _1419 = fma(_1187, _1293, _1411);
    float _1421 = fma(_1379, _1001, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1423 = fma(_1189, _1293, _1415);
    float _1425 = fma(_1191, _1293, _1417);
    float _1427 = fma(_1319, _1277, _1419);
    float _1429 = _1411;
    float _1431 = _1323;
    float _1433 = _1325;
    float _1435 = _1257;
    float _1437 = _1291;
    if (!_1403)
    {
        _1429 = _1413;
    }
    float _1439 = _1429;
    bool _1441 = !_1403;
    float _1443 = _1439;
    float _1445 = _1401;
    if (!_1441)
    {
        float _1447 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1449 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1451 = _1365 + _1449;
        float _1453 = _1413 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1455 = rsqrt(_1353);
        float _1457 = _1451 * _1447;
        float _1459 = _1457 * 0.15915493667125701904296875;
        float _1461 = _1459 * 6.283185482025146484375;
        float _1463 = sin(_1461);
        float _1465 = _1459 * 6.283185482025146484375;
        float _1467 = cos(_1465);
        float _1469 = fma(_1463, _1453, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1471 = _1455 * _1469;
        float _1473 = _1467 + (-1.0);
        float _1475 = fma(_1313, _1471, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1477 = fma(_1317, _1471, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1479 = _1473 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1481 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1483 = _1475 + _1481;
        float _1485 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1487 = _1477 + _1485;
        float _1489 = fma(_1413, _1467, _1479);
        float _1491 = _1483 * _1483;
        float _1493 = _1487 * _1487;
        _1443 = _1489;
        _1431 = _1491;
        _1433 = _1493;
        _1435 = _1475;
        _1437 = _1477;
    }
    float _1495 = _1443;
    float _1497 = _1431;
    float _1499 = _1433;
    float _1501 = _1435;
    float _1503 = _1437;
    float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1507 = _1495 + _1505;
    float _1509 = fma(_1307, _1277, _1423);
    float _1511 = fma(_1321, _1277, _1425);
    float _1513 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1515 = fma(_1507, _1507, _1497);
    float _1517 = fma(_1381, _1251, _1427);
    float _1519 = fma(_1389, _1251, _1509);
    float _1521 = fma(_1421, _1251, _1511);
    float _1523 = _1515 + _1499;
    float _1525 = _1011 + 0.5;
    float _1527 = -_1015;
    float _1529 = _1527 + 0.5;
    float _1531 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1517);
    float _1533 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1519);
    float _1535 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1521);
    float _1537 = sqrt(_1523);
    float _1539 = _1525 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1541 = _1529 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1543 = _1531 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1545 = _1533 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1547 = _1535 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1549 = _1539 * _1401;
    float _1551 = _1541 * _1513;
    float _1553 = _1543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1555 = _1545 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1557 = _1547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _781;
    out.m_58.y = _783;
    out.m_58.z = _785;
    out.m_58.w = _773;
    out.m_60.x = _1549;
    out.m_60.y = _1551;
    bool _1559 = _1537 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1561 = isnan(_1537);
    bool _1563 = _1559 || _1561;
    bool _1565 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1567 = _1563 || _1565;
    out.m_62.x = _1553;
    out.m_62.y = _1555;
    out.m_62.z = _1557;
    float _1569 = _1539;
    float _1571 = _1495;
    float _1573 = _1549;
    if (!_1567)
    {
        _1569 = 1.0;
    }
    float _1575 = _1569;
    bool _1577 = !_1567;
    float _1579 = _1575;
    if (!_1577)
    {
        bool _1581 = _1537 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1583 = isnan(_1537);
        bool _1585 = _1581 || _1583;
        bool _1587 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1589 = _1585 || _1587;
        if (!_1589)
        {
            float _1591 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1593 = _1537 + _1591;
            float _1595 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1597 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1595;
            float _1599 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1601 = _1599 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1603 = 1.0 / _1597;
            float _1605 = _1593 * _1603;
            float _1607 = fma(_1605, _1601, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1579 = _1607;
            _1609 = true;
        }
        else
        {
            bool _1611 = _1537 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1613 = isnan(_1537);
            bool _1615 = _1611 || _1613;
            bool _1617 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1619 = _1615 || _1617;
            if (!_1619)
            {
                float _1621 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1623 = _1537 + _1621;
                float _1625 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1627 = _1625 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1629 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1631 = _1629 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1633 = 1.0 / _1627;
                float _1635 = _1623 * _1633;
                float _1637 = fma(_1635, _1631, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1579 = _1637;
                _1609 = true;
            }
            else
            {
                _1579 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1609 = false;
    float _1639 = _1579;
    float _1641 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1643 = _1495 + _1641;
    float _1645 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1647 = _1501 + _1645;
    float _1649 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1651 = _1503 + _1649;
    float _1653 = fma(_1643, _1639, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1655 = fma(_1647, _1639, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1657 = fma(_1651, _1639, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1659 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1661 = _1653 + _1659;
    float _1663 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1665 = _1655 + _1663;
    float _1667 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1669 = _1657 + _1667;
    float _1671 = _1661 * _1661;
    float _1673 = fma(_1665, _1665, _1671);
    float _1675 = fma(_1669, _1669, _1673);
    float _1677 = rsqrt(_1675);
    float _1679 = _1677 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1681 = _1665 * _1679;
    float _1683 = _1669 * _1679;
    float _1685 = _1681 * _1681;
    float _1687 = _1683 * _1683;
    float _1689 = _1685 + _1687;
    float _1691 = sqrt(_1689);
    bool _1693 = _1691 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1697 = _1691 + _1695;
    float _1699 = _1677;
    float _1701 = _1697;
    float _1703 = _1681;
    if (_1693)
    {
        float _1705 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1699 = _1705;
    }
    float _1707 = _1699;
    if (_1693)
    {
        float _1709 = rsqrt(_1689);
        _1445 = _1709;
    }
    float _1711 = _1445;
    float _1713 = _1711;
    if (_1693)
    {
        float _1715 = _1697 * _1707;
        _1701 = _1715;
    }
    float _1717 = _1701;
    if (_1693)
    {
        float _1719 = _1717 * 0.15915493667125701904296875;
        _1571 = _1719;
    }
    float _1721 = _1571;
    float _1723 = _1669;
    if (_1693)
    {
        float _1725 = _1721 * 6.283185482025146484375;
        float _1727 = sin(_1725);
        _1723 = _1727;
    }
    float _1729 = _1723;
    float _1731 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1733 = precise::max(0.0, _1731);
    float _1735 = _1547;
    float _1737 = _1733;
    float _1739 = _1731;
    if (_1693)
    {
        float _1741 = _1721 * 6.283185482025146484375;
        float _1743 = cos(_1741);
        _1735 = _1743;
    }
    float _1745 = _1735;
    float _1747 = -_1679;
    float _1749 = -_1733;
    float _1751 = fma(_1661, _1747, _1749);
    float _1753 = _1751;
    if (_1693)
    {
        float _1755 = _1751 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1737 = _1755;
    }
    float _1757 = _1737;
    float _1759 = sqrt(_1675);
    float _1761 = _1729;
    float _1763 = _1757;
    if (_1693)
    {
        float _1765 = fma(_1729, _1757, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1761 = _1765;
    }
    float _1767 = _1761;
    float _1769 = _1767;
    if (!_1693)
    {
        _1763 = _1751;
    }
    float _1771 = _1763;
    float _1773 = _1771;
    if (_1693)
    {
        float _1775 = _1745 + (-1.0);
        _1739 = _1775;
    }
    float _1777 = _1739;
    float _1779 = _1777;
    if (_1693)
    {
        float _1781 = _1711 * _1767;
        _1573 = _1781;
    }
    float _1783 = _1573;
    if (!_1693)
    {
        _1769 = _1683;
    }
    float _1785 = _1769;
    float _1787 = _1653 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1789 = _1785;
    if (_1693)
    {
        float _1791 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1713 = _1791;
    }
    float _1793 = _1713;
    if (_1693)
    {
        float _1795 = _1681 * _1783;
        _1703 = _1795;
    }
    float _1797 = _1703;
    if (!_1693)
    {
        _1779 = _1685;
    }
    float _1799 = _1779;
    float _1801 = _1799;
    if (_1693)
    {
        float _1803 = _1683 * _1783;
        _1789 = _1803;
    }
    float _1805 = _1789;
    if (_1693)
    {
        float _1807 = fma(_1751, _1745, _1793);
        _1773 = _1807;
    }
    float _1809 = _1773;
    if (_1693)
    {
        float _1811 = _1797 * _1797;
        _1801 = _1811;
    }
    float _1813 = _1801;
    if (!_1693)
    {
        _1753 = _1687;
    }
    float _1815 = _1753;
    float _1817 = _1815;
    if (_1693)
    {
        float _1819 = _1805 * _1805;
        _1817 = _1819;
    }
    float _1821 = _1817;
    float _1823 = fma(_1809, _1809, _1813);
    float _1825 = _1653 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1827 = _1653 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1829 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1787);
    float _1831 = _1823 + _1821;
    float _1833 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1835 = fma(_1759, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1833);
    float _1837 = precise::clamp(_1835, 0.0, 1.0);
    float _1839 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1825);
    float _1841 = _1653 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1843 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1827);
    float _1845 = -_1837;
    float _1847 = _1845 + 1.0;
    float _1849 = rsqrt(_1831);
    float _1851 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1841);
    float _1853 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1843);
    float _1855 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1839);
    float _1857 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1829);
    float _1859 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1851);
    float _1861 = _1853 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1863 = abs(_1847);
    float _1865 = log2(_1863);
    float _1867 = _1859 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1869 = _1855 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1871 = _1857 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1873 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1875 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1877 = _1869 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1879 = _1849 * _1797;
    float _1881 = _1849 * _1809;
    float _1883 = _1849 * _1805;
    float _1885 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1875);
    float _1887 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1889 = -_1877;
    float _1891 = fma(_1889, _1873, 1.0);
    float _1893 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1885);
    float _1895 = -_1887;
    float _1897 = fma(_1881, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1895);
    float _1899 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1901 = log2(_1891);
    float _1903 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1893);
    float _1905 = -_1883;
    float _1907 = fma(_1905, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1897);
    float _1909 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1911 = fma(_1907, -0.5, 0.5);
    float _1913 = fma(_1907, 0.5, 0.5);
    float _1915 = exp2(_1899);
    float _1917 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1919 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1909);
    float _1921 = _1881 + 1.0;
    float _1923 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1917);
    float _1925 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1919);
    float _1927 = 1.0 / _1903;
    float _1929 = fma(_1913, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1931 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1923);
    float _1933 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1925);
    float _1935 = _1901 * 0.693147182464599609375;
    float _1937 = fma(_1913, _1929, -0.212114393711090087890625);
    float _1939 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1931);
    float _1941 = sqrt(_1911);
    float _1943 = -_1881;
    float _1945 = fma(_1915, _1921, _1943);
    float _1947 = fma(_1913, _1937, 1.570728778839111328125);
    float _1949 = _1935 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1951 = fma(_1945, 0.5, 0.5);
    float _1953 = _1933 * _1927;
    float _1955 = _1939 * _1927;
    float _1957 = fma(_1953, 0.5, 0.5);
    float _1959 = fma(_1955, -0.5, 0.5);
    float _1961 = _1941 * 0.636619746685028076171875;
    float _1963 = -_1947;
    float _1965 = fma(_1961, _1963, 1.0);
    float3 _5471 = float3(_1957, _1959, _1949);
    float _1967 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5471, float3(0.0), isnan(_5471)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5471, float3(0.0), isnan(_5471)), level(0.0)).x;
    float3 _5482 = float3(_1957, _1959, _1949);
    float4 _1970 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5482, float3(0.0), isnan(_5482)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5482, float3(0.0), isnan(_5482)), level(0.0)).xyzw;
    float _1972 = _1970.x;
    float _1974 = _1970.y;
    float _1976 = _1970.z;
    float _1978 = _1970.w;
    float2 _5499 = float2(_1965, _1951);
    float3 _1982 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5499, float2(0.0), isnan(_5499)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5499, float2(0.0), isnan(_5499)), level(0.0)).xyz;
    float _1984 = _1982.x;
    float _1986 = _1982.y;
    float _1988 = _1982.z;
    float _1990 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1992 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1994 = _1869 + (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1996 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1998 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1990);
    float _2000 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1992);
    float _2002 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1998);
    float _2004 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2000);
    float _2006 = _2002 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2008 = _2004 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2010 = 1.0 / _2006;
    float _2012 = _2008 + _2006;
    float _2014 = _2012 * 0.5;
    float _2016 = _2014 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _2018 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2020 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2018);
    float _2022 = -(*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _2024 = fma(_2016, _2010, _2022);
    float _2026 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1885);
    float _2028 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2020);
    float _2030 = _2014 + _2024;
    float _2032 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2026);
    float _2034 = exp2(_1996);
    float _2036 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2028);
    float _2038 = _2030 * _2010;
    float _2040 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2042 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2040);
    float _2044 = 1.0 / _2032;
    bool _2046 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2048 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2050 = _2046 || _2048;
    bool _2052 = isnan(0.5);
    bool _2054 = _2050 || _2052;
    float _2056 = 1.0 / _2042;
    float _2058 = _2036 * _2044;
    float _2060 = _2044;
    float _2062 = _2032;
    if (_2054)
    {
        _2060 = 1.0;
    }
    float _2064 = _2060;
    float _2066 = _2064;
    if (_2054)
    {
        _2062 = 1.0;
    }
    float _2068 = _2062;
    float _2070 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2072 = _2056 * _2070;
    float _2074 = _2068;
    if (!_2054)
    {
        float _2076 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2078 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2080 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2078;
        float _2082 = _2076 * 0.15915493667125701904296875;
        float _2084 = _2082 * 6.283185482025146484375;
        float _2086 = cos(_2084);
        float _2088 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2090 = _2088 * 0.15915493667125701904296875;
        float _2092 = _2082 * 6.283185482025146484375;
        float _2094 = sin(_2092);
        float _2096 = 1.0 / _2086;
        float _2098 = _2090 * 6.283185482025146484375;
        float _2100 = cos(_2098);
        float _2102 = _2094 * _2096;
        float _2104 = _2090 * 6.283185482025146484375;
        float _2106 = sin(_2104);
        float _2108 = _2100 * _2102;
        float _2110 = 1.0 / _2080;
        float _2112 = 1.0 / _2108;
        float _2114 = _2106 * _2112;
        float _2116 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2118 = fma(_2072, _2114, _2116);
        float _2120 = _2118 * _2110;
        float _2122 = precise::clamp(_2120, 0.0, 1.0);
        _2066 = _2122;
    }
    float _2124 = _2066;
    if (!_2054)
    {
        float _2126 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2128 = _2126 * 0.15915493667125701904296875;
        float _2130 = _2128 * 6.283185482025146484375;
        float _2132 = cos(_2130);
        float _2134 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2136 = _2134 * 0.15915493667125701904296875;
        float _2138 = _2128 * 6.283185482025146484375;
        float _2140 = sin(_2138);
        float _2142 = 1.0 / _2132;
        float _2144 = _2136 * 6.283185482025146484375;
        float _2146 = cos(_2144);
        float _2148 = _2140 * _2142;
        float _2150 = _2136 * 6.283185482025146484375;
        float _2152 = sin(_2150);
        float _2154 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2156 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2154;
        float _2158 = _2146 * _2148;
        float _2160 = 1.0 / _2156;
        float _2162 = 1.0 / _2158;
        float _2164 = _2152 * _2162;
        float _2166 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2168 = fma(_2072, _2164, _2166);
        float _2170 = _2168 * _2160;
        float _2172 = precise::clamp(_2170, 0.0, 1.0);
        float _2174 = -_2172;
        float _2176 = _2174 + 1.0;
        _2074 = _2176;
    }
    float _2178 = _2074;
    float _2180 = -_2034;
    float _2182 = _2180 + 1.0;
    float _2184 = _2124 * _2178;
    bool _2186 = _2124 > 0.0;
    bool _2188 = isnan(_2124);
    bool _2190 = _2186 || _2188;
    bool _2192 = isnan(0.0);
    bool _2194 = _2190 || _2192;
    float _2196 = _1903 * _2058;
    float _2198 = _2182 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2200 = _2184 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2202 = _2178 <= 0.0;
    bool _2204 = !_2194;
    bool _2206 = _2202 || _2204;
    float _2208 = _1903 + _2196;
    float _2210 = _2198 * _1967;
    float _2212 = -_2198;
    float _2214 = _2212 + 1.0;
    float _2216 = _1978 * _2210;
    float _2218 = _1988 * _2210;
    out.gl_Position.x = _1933;
    out.gl_Position.y = _1939;
    out.gl_Position.z = _2196;
    out.gl_Position.w = _1903;
    float _2220 = _2208 * 0.5;
    float _2222 = fma(_1984, _2216, _1972);
    float _2224 = _2200 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2226 = fma(_1986, _2216, _1974);
    float _2228 = _1978 * _2214;
    float _2230 = fma(_1978, _2218, _1976);
    out.m_64.z = _2220;
    out.m_64.w = _1903;
    out.m_47.x = _2224;
    out.m_66.x = _2222;
    out.m_66.y = _2226;
    out.m_66.z = _2230;
    out.m_66.w = _2228;
    if (!_2206)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2232 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2232;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1609 = false;
    bool _807 = false;
    bool _409 = false;
    bool _299 = false;
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
        float _2289 = as_type<float>(_101);
        out.gl_Position.z = _2289;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2358 = as_type<float>(_137);
        out.gl_Position.z = _2358;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = as_type<float>(int(gl_VertexIndex));
    float _141 = in.m_54.w;
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
    int _165 = as_type<int>(_139) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_139) & 2;
    bool _171 = _169 != 0;
    float _173 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _175 = 0.0;
    float _177 = _173;
    if (!_151)
    {
        float _179 = _173 * _173;
        float _181 = _179 * 0.5;
        _175 = _181;
    }
    float _183 = _175;
    bool _185 = !_167;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_171;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = _183;
    if (!_151)
    {
        float _195 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _195;
    }
    float _197 = _193;
    bool _199 = !_151;
    float _201 = _197;
    if (!_199)
    {
        float _203 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = log2(_203);
        float _207 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _209 = _207 + 1.0;
        float _211 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = _173 * _205;
        float _215 = 1.0 / _209;
        float _217 = _211 * 0.693147182464599609375;
        float _219 = exp2(_213);
        float _221 = 1.0 / _217;
        float _223 = _219 + (-1.0);
        float _225 = -_223;
        float _227 = fma(_225, _221, _173);
        float _229 = _227 * _215;
        float _231 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _231;
    }
    float _233 = _201;
    bool _235 = !_151;
    if (!_235)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = 1.0 / _243;
        float _247 = _173 * _239;
        float _249 = exp2(_247);
        float _251 = -_249;
        float _253 = _251 + 1.0;
        float _255 = _253 * _245;
        _177 = _255;
    }
    float _257 = _177;
    bool _259 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _261 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _263 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _265 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _267 = fma(_257, _153, _261);
    float _269 = fma(_257, _155, _263);
    float _271 = fma(_257, _157, _265);
    float _273 = fma(_267, _141, _159);
    float _275 = fma(_269, _141, _161);
    float _277 = fma(_271, _141, _163);
    bool _279 = !_259;
    float _297;
    if (!_279)
    {
        float _281 = in.m_56.x;
        float _283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _285 = _281 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _289 = _287 * _283;
        float _291 = floor(_289);
        float _293 = -_291;
        float _295 = _289 + _293;
        _297 = _295;
        _299 = true;
    }
    else
    {
        float _301 = float(_85);
        float _303 = 1.0 / _301;
        float _305 = _119 * _303;
        _297 = _305;
    }
    _299 = false;
    float _307 = _297;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _311 = _307 + _309;
    float _313 = in.m_54.x;
    float _315 = in.m_54.y;
    bool _317 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _319 = isnan(_307);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _329;
    bool _333 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _335 = isnan(_307);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -_327;
    float _347 = _345 + 1.0;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _349;
    float _353 = 1.0 / _331;
    bool _355 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _357 = _343 * _347;
    float _359 = -_343;
    float _361 = _359 + 1.0;
    float _363 = _311 * _353;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = fma(_351, _363, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _371 = fma(_367, _363, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _373 = _369 * _357;
    float _375 = _371 * _357;
    float _377 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].x, _373);
    float _379 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].y, _375);
    float _381 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[144].x, _377);
    float _383 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[144].y, _379);
    float _385 = _381 * _313;
    float _387 = _383 * _315;
    bool _389 = !_355;
    float _407;
    if (!_389)
    {
        float _391 = in.m_56.x;
        float _393 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _395 = _391 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _397 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _399 = _397 * _393;
        float _401 = floor(_399);
        float _403 = -_401;
        float _405 = _399 + _403;
        _407 = _405;
        _409 = true;
    }
    else
    {
        float _411 = float(_85);
        float _413 = 1.0 / _411;
        float _415 = _119 * _413;
        _407 = _415;
    }
    _409 = false;
    float _417 = _407;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _421 = _417 + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _423;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _431;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _439 = 1.0 / _425;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _441;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _449 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _451 = isnan(_417);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = 1.0 / _433;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _465 = _417 + _463;
    bool _467 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _469 = isnan(_417);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    bool _479 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _481 = isnan(_417);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = -_477;
    float _493 = _491 + 1.0;
    float _495 = 1.0 / _429;
    float _497 = _465 * _439;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _501 = _417 + _499;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _503;
    bool _507 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _509 = isnan(_417);
    bool _511 = _507 || _509;
    bool _513 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _515 = _511 || _513;
    float _517 = float(_515);
    float _519 = fma(_505, _497, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _521 = 1.0 / _447;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _525 = _417 + _523;
    float _527 = _501 * _461;
    bool _529 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _531 = isnan(_417);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _537 = _533 || _535;
    float _539 = float(_537);
    float _541 = -_459;
    float _543 = _541 + 1.0;
    float _545 = 1.0 / _437;
    float _547 = _525 * _495;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _551 = _417 + _549;
    float _553 = -_539;
    float _555 = _553 + 1.0;
    bool _557 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _559 = _459 * _555;
    float _561 = 1.0 / _443;
    float _563 = _551 * _521;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _565;
    float _569 = fma(_567, _497, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _571 = _477 * _543;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _579 = _417 + _577;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _589 = fma(_575, _547, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _591 = _579 * _545;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _593;
    float _597 = -_489;
    float _599 = _597 + 1.0;
    float _601 = _421 * _561;
    float _603 = fma(_583, _547, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _605 = fma(_595, _497, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _607 = _489 * _493;
    bool _609 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _611 = isnan(_417);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = fma(_587, _547, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _623 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _625 = isnan(_417);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _635;
    float _639 = -_619;
    float _641 = _639 + 1.0;
    float _643 = _633 * _599;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _645;
    float _649 = _517 * _641;
    float _651 = -_633;
    float _653 = _651 + 1.0;
    float _655 = fma(_647, _601, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _657 = _569 * _649;
    float _659 = _605 * _649;
    float _661 = _519 * _649;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _667 = _619 * _653;
    float _669 = -_517;
    float _671 = _669 + 1.0;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _673;
    float _677 = fma(_665, _563, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _681 = _679 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _683 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[107].x, _657);
    float _685 = fma(_675, _601, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _691 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[107].y, _659);
    float _693 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[107].z, _661);
    float _695 = fma(_603, _667, _683);
    float _697 = fma(_681, _563, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _699 = fma(_689, _563, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _701 = fma(_637, _601, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _703 = fma(_589, _667, _691);
    float _705 = fma(_621, _667, _693);
    float _707 = fma(_685, _643, _695);
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _709;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _713;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _717;
    float _721 = fma(_655, _643, _703);
    float _723 = fma(_701, _643, _705);
    float _725 = fma(_711, _527, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _727 = fma(_715, _527, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _731 = _729 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _737 = fma(_719, _527, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _739 = fma(_677, _607, _707);
    float _741 = fma(_697, _607, _721);
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _745 = _743 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _747 = fma(_699, _607, _723);
    float _749 = fma(_731, _591, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _751 = fma(_735, _591, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _753 = fma(_745, _591, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _755 = fma(_725, _571, _739);
    float _757 = fma(_727, _571, _741);
    float _759 = fma(_737, _571, _747);
    float _761 = fma(_749, _559, _755);
    float _763 = fma(_751, _559, _757);
    float _765 = fma(_753, _559, _759);
    float _767 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[113].x, _761);
    float _769 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[113].y, _763);
    float _771 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[113].z, _765);
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _775 = _767 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _777 = _769 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _779 = _771 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _781 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _783 = _777 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _785 = _779 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _787 = !_557;
    float _805;
    if (!_787)
    {
        float _789 = in.m_56.x;
        float _791 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _793 = _789 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _795 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _797 = _795 * _791;
        float _799 = floor(_797);
        float _801 = -_799;
        float _803 = _797 + _801;
        _805 = _803;
        _807 = true;
    }
    else
    {
        float _809 = float(_85);
        float _811 = 1.0 / _809;
        float _813 = _119 * _811;
        _805 = _813;
    }
    _807 = false;
    float _815 = _805;
    float _817 = in.m_56.x;
    float _819 = in.m_56.y;
    float _821 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _823 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _825 = _387 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _827 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].z, _823);
    int _829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _831 = _829 != 0;
    int _833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _835 = _833 != 0;
    float _837 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _839 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    bool _841 = _817 > 0.5;
    float _843 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _845 = _275 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    bool _847 = _819 > 0.5;
    float _849 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].y, _821);
    float _851 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].x, _843);
    float _853 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[14].w, _845);
    float _855 = _385 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _857 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _859 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _861 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].x, _851);
    float _863 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].y, _849);
    float _865 = _825 * _857;
    float _867 = _855 * _859;
    float _869 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].z, _827);
    float _871 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[16].w, _853);
    float _873 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _837);
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _875;
    float _879 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _881;
    float _885 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _887 = 1.0 / _877;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _891 = _889 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _893 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _879);
    float _895 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _885);
    float _897 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _839);
    float _899 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _873);
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _903 = _901 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _905;
    float _909 = 1.0 / _883;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _913 = _911 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _915 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _917 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _919 = _861 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _921 = 1.0 / _907;
    float _923 = _871 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _925 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _915);
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _929 = _815 + _927;
    float _931 = 1.0 / _891;
    float _933 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _935 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _917);
    float _937 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _895);
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _941 = _815 + _939;
    float _943 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _933);
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _947 = _815 + _945;
    float _949 = 1.0 / _903;
    float _951 = _941 * _921;
    float _953 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _925);
    float _955 = _947 * _909;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _959 = _815 + _957;
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _963 = _815 + _961;
    float _965 = 1.0 / _913;
    float _967 = _929 * _931;
    float _969 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _943);
    float _971 = _963 * _887;
    float _973 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _935);
    float _975 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _893);
    float _977 = _865 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _979 = _865 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _981 = sqrt(_937);
    float _983 = _959 * _949;
    float _985 = _865 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _987 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[25].x, _979);
    float _989 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _897);
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _993 = _815 + _991;
    float _995 = sqrt(_899);
    float _997 = -_191;
    int _999 = _847 ? as_type<int>(_997) : as_type<int>(_191);
    float _1001 = _993 * _965;
    float _1003 = -_187;
    int _1005 = _841 ? as_type<int>(_1003) : as_type<int>(_187);
    float _1007 = sqrt(_953);
    bool _1009 = !_831;
    float _1011 = _1009 ? _187 : as_type<float>(_1005);
    bool _1013 = !_835;
    float _1015 = _1013 ? _191 : as_type<float>(_999);
    float _1017 = _863 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1019 = _869 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1021 = sqrt(_989);
    float _1023 = _981 * _1017;
    float _1025 = _995 * _919;
    float _1027 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[26].x, _985);
    float _1029 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1031 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1033 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1035 = sqrt(_969);
    float _1037 = fma(_1007, _1007, _973);
    float _1039 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[24].x, _977);
    float _1041 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1029);
    float _1043 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1031);
    float _1045 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1033);
    float _1047 = _1021 * _1019;
    float _1049 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1051 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1049;
    float _1053 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1041);
    float _1055 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1043);
    float _1057 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1045);
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1059;
    float _1063 = fma(_1035, _1035, _1037);
    float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1067 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1065;
    float _1069 = fma(_1051, _955, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1071 = fma(_1061, _955, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1073 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1053);
    float _1075 = fma(_1067, _955, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1077 = sqrt(_1063);
    float _1079 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1055);
    float _1081 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1057);
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1085 = _1083 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1089 = _1087 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1091 = _1079 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1095 = _1093 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1097 = _1073 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1099 = fma(_1085, _967, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1101 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1103 = fma(_1089, _967, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1105 = _1081 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1107 = fma(_1095, _967, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1109 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1101);
    float _1111 = -_1091;
    float _1113 = _1111 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1115 = -_1097;
    float _1117 = _1115 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1119 = _1077 * 1.730000019073486328125;
    float _1121 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1109);
    float _1123 = _1113 * _1113;
    float _1125 = 1.0 / _1119;
    float _1127 = -_1105;
    float _1129 = _1127 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1131 = fma(_1117, _1117, _1123);
    float _1133 = -_975;
    float _1135 = _1121 + _1133;
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1139 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1137;
    float _1141 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1143 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1141;
    float _1145 = fma(_1129, _1129, _1131);
    float _1147 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1149 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1147;
    float _1151 = fma(_1077, 0.8650000095367431640625, _1135);
    float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1153;
    float _1157 = rsqrt(_1145);
    float _1159 = fma(_1149, _971, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1161 = fma(_1139, _971, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1163 = fma(_1155, _971, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1165 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1169 = _1167 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1171 = _1151 * _1125;
    float _1173 = precise::clamp(_1171, 0.0, 1.0);
    float _1175 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1177 = _1175 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1181 = _1179 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1183 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1027);
    float _1185 = _1173 * _1173;
    float _1187 = fma(_1177, _983, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1189 = fma(_1181, _983, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1191 = fma(_1169, _983, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1193 = _1185 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1195 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1039);
    bool _1197 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1199 = isnan(_815);
    bool _1201 = _1197 || _1199;
    bool _1203 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1205 = _1201 || _1203;
    float _1207 = float(_1205);
    float _1209 = _1183 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1211 = -_1193;
    float _1213 = _1157 * _1211;
    float _1215 = _1195 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _1217 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1219 = isnan(_815);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1225 = _1221 || _1223;
    float _1227 = float(_1225);
    float _1229 = -_1207;
    float _1231 = _1229 + 1.0;
    bool _1233 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1235 = isnan(_815);
    bool _1237 = _1233 || _1235;
    bool _1239 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1241 = _1237 || _1239;
    float _1243 = float(_1241);
    float _1245 = _1097 + _1215;
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1249 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1247;
    float _1251 = _1227 * _1231;
    float _1253 = -_1227;
    float _1255 = _1253 + 1.0;
    float _1257 = fma(_1117, _1213, _1245);
    float _1259 = _1105 + _1209;
    bool _1261 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1263 = isnan(_815);
    bool _1265 = _1261 || _1263;
    bool _1267 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1269 = _1265 || _1267;
    float _1271 = float(_1269);
    float _1273 = -_1243;
    float _1275 = _1273 + 1.0;
    float _1277 = _1243 * _1255;
    bool _1279 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1281 = isnan(_815);
    bool _1283 = _1279 || _1281;
    bool _1285 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1287 = _1283 || _1285;
    float _1289 = float(_1287);
    float _1291 = fma(_1129, _1213, _1259);
    float _1293 = _1271 * _1275;
    float _1295 = -_1271;
    float _1297 = _1295 + 1.0;
    float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1299;
    float _1303 = -_1289;
    float _1305 = _1303 + 1.0;
    float _1307 = fma(_1143, _951, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1309 = _1289 * _1297;
    float _1311 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1313 = _1257 + _1311;
    float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1317 = _1291 + _1315;
    float _1319 = fma(_1249, _951, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1321 = fma(_1301, _951, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1323 = _1313 * _1313;
    float _1325 = _1317 * _1317;
    bool _1327 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1329 = isnan(_815);
    bool _1331 = _1327 || _1329;
    bool _1333 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1335 = _1331 || _1333;
    float _1337 = float(_1335);
    float _1339 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[25].z, _987);
    bool _1341 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1343 = isnan(_815);
    bool _1345 = _1341 || _1343;
    bool _1347 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1349 = _1345 || _1347;
    float _1351 = float(_1349);
    float _1353 = _1323 + _1325;
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1357 = _1355 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1359 = -_1337;
    float _1361 = _1359 + 1.0;
    float _1363 = _1337 * _1305;
    float _1365 = sqrt(_1353);
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1369 = _1367 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1371 = _1351 * _1361;
    float _1373 = -_1351;
    float _1375 = _1373 + 1.0;
    float _1377 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1379 = _1377 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1381 = fma(_1369, _1001, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1383 = _1071 * _1371;
    float _1385 = _1069 * _1371;
    float _1387 = _1075 * _1371;
    float _1389 = fma(_1357, _1001, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1391 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1383);
    float _1393 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1385);
    float _1395 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1387);
    float _1397 = _1339 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1399 = fma(_1099, _1363, _1391);
    float _1401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1403 = _1365 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1405 = _1091 + _1397;
    float _1407 = fma(_1103, _1363, _1393);
    float _1409 = fma(_1107, _1363, _1395);
    float _1411 = fma(_1159, _1309, _1399);
    float _1413 = fma(_1113, _1213, _1405);
    float _1415 = fma(_1161, _1309, _1407);
    float _1417 = fma(_1163, _1309, _1409);
    float _1419 = fma(_1187, _1293, _1411);
    float _1421 = fma(_1379, _1001, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1423 = fma(_1189, _1293, _1415);
    float _1425 = fma(_1191, _1293, _1417);
    float _1427 = fma(_1319, _1277, _1419);
    float _1429 = _1411;
    float _1431 = _1323;
    float _1433 = _1325;
    float _1435 = _1257;
    float _1437 = _1291;
    if (!_1403)
    {
        _1429 = _1413;
    }
    float _1439 = _1429;
    bool _1441 = !_1403;
    float _1443 = _1439;
    float _1445 = _1401;
    if (!_1441)
    {
        float _1447 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1449 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1451 = _1365 + _1449;
        float _1453 = _1413 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1455 = rsqrt(_1353);
        float _1457 = _1451 * _1447;
        float _1459 = _1457 * 0.15915493667125701904296875;
        float _1461 = _1459 * 6.283185482025146484375;
        float _1463 = sin(_1461);
        float _1465 = _1459 * 6.283185482025146484375;
        float _1467 = cos(_1465);
        float _1469 = fma(_1463, _1453, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1471 = _1455 * _1469;
        float _1473 = _1467 + (-1.0);
        float _1475 = fma(_1313, _1471, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1477 = fma(_1317, _1471, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1479 = _1473 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1481 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1483 = _1475 + _1481;
        float _1485 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1487 = _1477 + _1485;
        float _1489 = fma(_1413, _1467, _1479);
        float _1491 = _1483 * _1483;
        float _1493 = _1487 * _1487;
        _1443 = _1489;
        _1431 = _1491;
        _1433 = _1493;
        _1435 = _1475;
        _1437 = _1477;
    }
    float _1495 = _1443;
    float _1497 = _1431;
    float _1499 = _1433;
    float _1501 = _1435;
    float _1503 = _1437;
    float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1507 = _1495 + _1505;
    float _1509 = fma(_1307, _1277, _1423);
    float _1511 = fma(_1321, _1277, _1425);
    float _1513 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1515 = fma(_1507, _1507, _1497);
    float _1517 = fma(_1381, _1251, _1427);
    float _1519 = fma(_1389, _1251, _1509);
    float _1521 = fma(_1421, _1251, _1511);
    float _1523 = _1515 + _1499;
    float _1525 = _1011 + 0.5;
    float _1527 = -_1015;
    float _1529 = _1527 + 0.5;
    float _1531 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1517);
    float _1533 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1519);
    float _1535 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1521);
    float _1537 = sqrt(_1523);
    float _1539 = _1525 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1541 = _1529 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1543 = _1531 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1545 = _1533 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1547 = _1535 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1549 = _1539 * _1401;
    float _1551 = _1541 * _1513;
    float _1553 = _1543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1555 = _1545 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1557 = _1547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _781;
    out.m_58.y = _783;
    out.m_58.z = _785;
    out.m_58.w = _773;
    out.m_60.x = _1549;
    out.m_60.y = _1551;
    bool _1559 = _1537 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1561 = isnan(_1537);
    bool _1563 = _1559 || _1561;
    bool _1565 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1567 = _1563 || _1565;
    out.m_62.x = _1553;
    out.m_62.y = _1555;
    out.m_62.z = _1557;
    float _1569 = _1539;
    float _1571 = _1495;
    float _1573 = _1549;
    if (!_1567)
    {
        _1569 = 1.0;
    }
    float _1575 = _1569;
    bool _1577 = !_1567;
    float _1579 = _1575;
    if (!_1577)
    {
        bool _1581 = _1537 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1583 = isnan(_1537);
        bool _1585 = _1581 || _1583;
        bool _1587 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1589 = _1585 || _1587;
        if (!_1589)
        {
            float _1591 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1593 = _1537 + _1591;
            float _1595 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1597 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1595;
            float _1599 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1601 = _1599 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1603 = 1.0 / _1597;
            float _1605 = _1593 * _1603;
            float _1607 = fma(_1605, _1601, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1579 = _1607;
            _1609 = true;
        }
        else
        {
            bool _1611 = _1537 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1613 = isnan(_1537);
            bool _1615 = _1611 || _1613;
            bool _1617 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1619 = _1615 || _1617;
            if (!_1619)
            {
                float _1621 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1623 = _1537 + _1621;
                float _1625 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1627 = _1625 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1629 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1631 = _1629 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1633 = 1.0 / _1627;
                float _1635 = _1623 * _1633;
                float _1637 = fma(_1635, _1631, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1579 = _1637;
                _1609 = true;
            }
            else
            {
                _1579 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1609 = false;
    float _1639 = _1579;
    float _1641 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1643 = _1495 + _1641;
    float _1645 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1647 = _1501 + _1645;
    float _1649 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1651 = _1503 + _1649;
    float _1653 = fma(_1643, _1639, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1655 = fma(_1647, _1639, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1657 = fma(_1651, _1639, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1659 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1661 = _1653 + _1659;
    float _1663 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1665 = _1655 + _1663;
    float _1667 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1669 = _1657 + _1667;
    float _1671 = _1661 * _1661;
    float _1673 = fma(_1665, _1665, _1671);
    float _1675 = fma(_1669, _1669, _1673);
    float _1677 = rsqrt(_1675);
    float _1679 = _1677 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1681 = _1665 * _1679;
    float _1683 = _1669 * _1679;
    float _1685 = _1681 * _1681;
    float _1687 = _1683 * _1683;
    float _1689 = _1685 + _1687;
    float _1691 = sqrt(_1689);
    bool _1693 = _1691 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1697 = _1691 + _1695;
    float _1699 = _1677;
    float _1701 = _1697;
    float _1703 = _1681;
    if (_1693)
    {
        float _1705 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1699 = _1705;
    }
    float _1707 = _1699;
    if (_1693)
    {
        float _1709 = rsqrt(_1689);
        _1445 = _1709;
    }
    float _1711 = _1445;
    float _1713 = _1711;
    if (_1693)
    {
        float _1715 = _1697 * _1707;
        _1701 = _1715;
    }
    float _1717 = _1701;
    if (_1693)
    {
        float _1719 = _1717 * 0.15915493667125701904296875;
        _1571 = _1719;
    }
    float _1721 = _1571;
    float _1723 = _1669;
    if (_1693)
    {
        float _1725 = _1721 * 6.283185482025146484375;
        float _1727 = sin(_1725);
        _1723 = _1727;
    }
    float _1729 = _1723;
    float _1731 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1733 = precise::max(0.0, _1731);
    float _1735 = _1547;
    float _1737 = _1733;
    float _1739 = _1731;
    if (_1693)
    {
        float _1741 = _1721 * 6.283185482025146484375;
        float _1743 = cos(_1741);
        _1735 = _1743;
    }
    float _1745 = _1735;
    float _1747 = -_1679;
    float _1749 = -_1733;
    float _1751 = fma(_1661, _1747, _1749);
    float _1753 = _1751;
    if (_1693)
    {
        float _1755 = _1751 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1737 = _1755;
    }
    float _1757 = _1737;
    float _1759 = sqrt(_1675);
    float _1761 = _1729;
    float _1763 = _1757;
    if (_1693)
    {
        float _1765 = fma(_1729, _1757, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1761 = _1765;
    }
    float _1767 = _1761;
    float _1769 = _1767;
    if (!_1693)
    {
        _1763 = _1751;
    }
    float _1771 = _1763;
    float _1773 = _1771;
    if (_1693)
    {
        float _1775 = _1745 + (-1.0);
        _1739 = _1775;
    }
    float _1777 = _1739;
    float _1779 = _1777;
    if (_1693)
    {
        float _1781 = _1711 * _1767;
        _1573 = _1781;
    }
    float _1783 = _1573;
    if (!_1693)
    {
        _1769 = _1683;
    }
    float _1785 = _1769;
    float _1787 = _1653 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1789 = _1785;
    if (_1693)
    {
        float _1791 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1713 = _1791;
    }
    float _1793 = _1713;
    if (_1693)
    {
        float _1795 = _1681 * _1783;
        _1703 = _1795;
    }
    float _1797 = _1703;
    if (!_1693)
    {
        _1779 = _1685;
    }
    float _1799 = _1779;
    float _1801 = _1799;
    if (_1693)
    {
        float _1803 = _1683 * _1783;
        _1789 = _1803;
    }
    float _1805 = _1789;
    if (_1693)
    {
        float _1807 = fma(_1751, _1745, _1793);
        _1773 = _1807;
    }
    float _1809 = _1773;
    if (_1693)
    {
        float _1811 = _1797 * _1797;
        _1801 = _1811;
    }
    float _1813 = _1801;
    if (!_1693)
    {
        _1753 = _1687;
    }
    float _1815 = _1753;
    float _1817 = _1815;
    if (_1693)
    {
        float _1819 = _1805 * _1805;
        _1817 = _1819;
    }
    float _1821 = _1817;
    float _1823 = fma(_1809, _1809, _1813);
    float _1825 = _1653 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1827 = _1653 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1829 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1787);
    float _1831 = _1823 + _1821;
    float _1833 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1835 = fma(_1759, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1833);
    float _1837 = precise::clamp(_1835, 0.0, 1.0);
    float _1839 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1825);
    float _1841 = _1653 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1843 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1827);
    float _1845 = -_1837;
    float _1847 = _1845 + 1.0;
    float _1849 = rsqrt(_1831);
    float _1851 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1841);
    float _1853 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1843);
    float _1855 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1839);
    float _1857 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1829);
    float _1859 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1851);
    float _1861 = _1853 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1863 = abs(_1847);
    float _1865 = log2(_1863);
    float _1867 = _1859 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1869 = _1855 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1871 = _1857 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1873 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1875 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1877 = _1869 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1879 = _1849 * _1797;
    float _1881 = _1849 * _1809;
    float _1883 = _1849 * _1805;
    float _1885 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1875);
    float _1887 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1889 = -_1877;
    float _1891 = fma(_1889, _1873, 1.0);
    float _1893 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1885);
    float _1895 = -_1887;
    float _1897 = fma(_1881, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1895);
    float _1899 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1901 = log2(_1891);
    float _1903 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1893);
    float _1905 = -_1883;
    float _1907 = fma(_1905, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1897);
    float _1909 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1911 = fma(_1907, -0.5, 0.5);
    float _1913 = fma(_1907, 0.5, 0.5);
    float _1915 = exp2(_1899);
    float _1917 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1919 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1909);
    float _1921 = _1881 + 1.0;
    float _1923 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1917);
    float _1925 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1919);
    float _1927 = 1.0 / _1903;
    float _1929 = fma(_1913, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1931 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1923);
    float _1933 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1925);
    float _1935 = _1901 * 0.693147182464599609375;
    float _1937 = fma(_1913, _1929, -0.212114393711090087890625);
    float _1939 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1931);
    float _1941 = sqrt(_1911);
    float _1943 = -_1881;
    float _1945 = fma(_1915, _1921, _1943);
    float _1947 = fma(_1913, _1937, 1.570728778839111328125);
    float _1949 = _1935 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1951 = fma(_1945, 0.5, 0.5);
    float _1953 = _1933 * _1927;
    float _1955 = _1939 * _1927;
    float _1957 = fma(_1953, 0.5, 0.5);
    float _1959 = fma(_1955, -0.5, 0.5);
    float _1961 = _1941 * 0.636619746685028076171875;
    float _1963 = -_1947;
    float _1965 = fma(_1961, _1963, 1.0);
    float3 _5471 = float3(_1957, _1959, _1949);
    float _1967 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5471, float3(0.0), isnan(_5471)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5471, float3(0.0), isnan(_5471)), level(0.0)).x;
    float3 _5482 = float3(_1957, _1959, _1949);
    float4 _1970 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5482, float3(0.0), isnan(_5482)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5482, float3(0.0), isnan(_5482)), level(0.0)).xyzw;
    float _1972 = _1970.x;
    float _1974 = _1970.y;
    float _1976 = _1970.z;
    float _1978 = _1970.w;
    float2 _5499 = float2(_1965, _1951);
    float3 _1982 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5499, float2(0.0), isnan(_5499)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5499, float2(0.0), isnan(_5499)), level(0.0)).xyz;
    float _1984 = _1982.x;
    float _1986 = _1982.y;
    float _1988 = _1982.z;
    float _1990 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1992 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1994 = _1869 + (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1996 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1998 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1990);
    float _2000 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1992);
    float _2002 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1998);
    float _2004 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2000);
    float _2006 = _2002 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2008 = _2004 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2010 = 1.0 / _2006;
    float _2012 = _2008 + _2006;
    float _2014 = _2012 * 0.5;
    float _2016 = _2014 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _2018 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2020 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2018);
    float _2022 = -(*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _2024 = fma(_2016, _2010, _2022);
    float _2026 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1885);
    float _2028 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2020);
    float _2030 = _2014 + _2024;
    float _2032 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2026);
    float _2034 = exp2(_1996);
    float _2036 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2028);
    float _2038 = _2030 * _2010;
    float _2040 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2042 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2040);
    float _2044 = 1.0 / _2032;
    bool _2046 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2048 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2050 = _2046 || _2048;
    bool _2052 = isnan(0.5);
    bool _2054 = _2050 || _2052;
    float _2056 = 1.0 / _2042;
    float _2058 = _2036 * _2044;
    float _2060 = _2044;
    float _2062 = _2032;
    if (_2054)
    {
        _2060 = 1.0;
    }
    float _2064 = _2060;
    float _2066 = _2064;
    if (_2054)
    {
        _2062 = 1.0;
    }
    float _2068 = _2062;
    float _2070 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2072 = _2056 * _2070;
    float _2074 = _2068;
    if (!_2054)
    {
        float _2076 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2078 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2080 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2078;
        float _2082 = _2076 * 0.15915493667125701904296875;
        float _2084 = _2082 * 6.283185482025146484375;
        float _2086 = cos(_2084);
        float _2088 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2090 = _2088 * 0.15915493667125701904296875;
        float _2092 = _2082 * 6.283185482025146484375;
        float _2094 = sin(_2092);
        float _2096 = 1.0 / _2086;
        float _2098 = _2090 * 6.283185482025146484375;
        float _2100 = cos(_2098);
        float _2102 = _2094 * _2096;
        float _2104 = _2090 * 6.283185482025146484375;
        float _2106 = sin(_2104);
        float _2108 = _2100 * _2102;
        float _2110 = 1.0 / _2080;
        float _2112 = 1.0 / _2108;
        float _2114 = _2106 * _2112;
        float _2116 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2118 = fma(_2072, _2114, _2116);
        float _2120 = _2118 * _2110;
        float _2122 = precise::clamp(_2120, 0.0, 1.0);
        _2066 = _2122;
    }
    float _2124 = _2066;
    if (!_2054)
    {
        float _2126 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2128 = _2126 * 0.15915493667125701904296875;
        float _2130 = _2128 * 6.283185482025146484375;
        float _2132 = cos(_2130);
        float _2134 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2136 = _2134 * 0.15915493667125701904296875;
        float _2138 = _2128 * 6.283185482025146484375;
        float _2140 = sin(_2138);
        float _2142 = 1.0 / _2132;
        float _2144 = _2136 * 6.283185482025146484375;
        float _2146 = cos(_2144);
        float _2148 = _2140 * _2142;
        float _2150 = _2136 * 6.283185482025146484375;
        float _2152 = sin(_2150);
        float _2154 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2156 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2154;
        float _2158 = _2146 * _2148;
        float _2160 = 1.0 / _2156;
        float _2162 = 1.0 / _2158;
        float _2164 = _2152 * _2162;
        float _2166 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2168 = fma(_2072, _2164, _2166);
        float _2170 = _2168 * _2160;
        float _2172 = precise::clamp(_2170, 0.0, 1.0);
        float _2174 = -_2172;
        float _2176 = _2174 + 1.0;
        _2074 = _2176;
    }
    float _2178 = _2074;
    float _2180 = -_2034;
    float _2182 = _2180 + 1.0;
    float _2184 = _2124 * _2178;
    bool _2186 = _2124 > 0.0;
    bool _2188 = isnan(_2124);
    bool _2190 = _2186 || _2188;
    bool _2192 = isnan(0.0);
    bool _2194 = _2190 || _2192;
    float _2196 = _1903 * _2058;
    float _2198 = _2182 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2200 = _2184 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2202 = _2178 <= 0.0;
    bool _2204 = !_2194;
    bool _2206 = _2202 || _2204;
    float _2208 = _1903 + _2196;
    float _2210 = _2198 * _1967;
    float _2212 = -_2198;
    float _2214 = _2212 + 1.0;
    float _2216 = _1978 * _2210;
    float _2218 = _1988 * _2210;
    out.gl_Position.x = _1933;
    out.gl_Position.y = _1939;
    out.gl_Position.z = _2196;
    out.gl_Position.w = _1903;
    float _2220 = _2208 * 0.5;
    float _2222 = fma(_1984, _2216, _1972);
    float _2224 = _2200 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2226 = fma(_1986, _2216, _1974);
    float _2228 = _1978 * _2214;
    float _2230 = fma(_1978, _2218, _1976);
    out.m_64.z = _2220;
    out.m_64.w = _1903;
    out.m_47.x = _2224;
    out.m_66.x = _2222;
    out.m_66.y = _2226;
    out.m_66.z = _2230;
    out.m_66.w = _2228;
    if (!_2206)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2232 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2232;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

