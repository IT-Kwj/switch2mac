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
    float4 m_55 [[user(locn0)]];
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
    float4 m_53 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1199 = false;
    bool _789 = false;
    bool _383 = false;
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
        float _1891 = as_type<float>(_101);
        out.gl_Position.z = _1891;
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
        float _1960 = as_type<float>(_137);
        out.gl_Position.z = _1960;
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
    bool _295 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _297 = isnan(_289);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _307;
    float _311 = -_305;
    float _313 = _311 + 1.0;
    bool _315 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _317 = isnan(_289);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _327;
    bool _331 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _333 = 1.0 / _309;
    float _335 = _325 * _313;
    float _337 = -_325;
    float _339 = _337 + 1.0;
    float _341 = _293 * _333;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _343;
    float _347 = fma(_329, _341, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _349 = fma(_345, _341, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _351 = _347 * _335;
    float _353 = _349 * _335;
    float _355 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[143].x, _351);
    float _357 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[143].y, _353);
    float _359 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[144].x, _355);
    float _361 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[144].y, _357);
    bool _363 = !_331;
    float _381;
    if (!_363)
    {
        float _365 = in.m_53.x;
        float _367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _369 = _365 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _371 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _373 = _371 * _367;
        float _375 = floor(_373);
        float _377 = -_375;
        float _379 = _373 + _377;
        _381 = _379;
        _383 = true;
    }
    else
    {
        float _385 = float(_85);
        float _387 = 1.0 / _385;
        float _389 = _119 * _387;
        _381 = _389;
    }
    _383 = false;
    float _391 = _381;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _409 = 1.0 / _395;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _411;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _419 = 1.0 / _403;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _423 = _391 + _421;
    bool _425 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _427 = isnan(_391);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    bool _437 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _439 = isnan(_391);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    bool _449 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _451 = isnan(_391);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = -_435;
    float _463 = _461 + 1.0;
    float _465 = 1.0 / _399;
    float _467 = _423 * _409;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _471 = _391 + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _475 = _391 + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _479 = _391 + _477;
    float _481 = 1.0 / _407;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _485 = _391 + _483;
    float _487 = _471 * _419;
    bool _489 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _491 = isnan(_391);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    bool _501 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _503 = 1.0 / _417;
    float _505 = _485 * _465;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _509 = _391 + _507;
    float _511 = -_499;
    float _513 = _511 + 1.0;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _515;
    float _519 = 1.0 / _413;
    float _521 = _475 * _481;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _523;
    float _527 = fma(_517, _467, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _529 = _479 * _503;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _531;
    float _535 = _509 * _519;
    float _537 = _435 * _513;
    float _539 = fma(_525, _467, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _541 = fma(_533, _467, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _543 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _545 = isnan(_391);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = -_447;
    float _557 = _555 + 1.0;
    float _559 = _447 * _463;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _569 = _553 * _557;
    float _571 = -_553;
    float _573 = _571 + 1.0;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    bool _579 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _581 = isnan(_391);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = fma(_567, _505, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _593 = fma(_563, _505, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _595 = fma(_577, _505, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _597 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _599 = isnan(_391);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = -_589;
    float _611 = _609 + 1.0;
    float _613 = _459 * _573;
    float _615 = -_459;
    float _617 = _615 + 1.0;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _619;
    float _623 = _607 * _611;
    float _625 = _589 * _617;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _627;
    float _631 = _539 * _623;
    float _633 = _541 * _623;
    float _635 = _527 * _623;
    float _637 = -_607;
    float _639 = _637 + 1.0;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _645 = fma(_629, _487, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _647;
    float _651 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[107].x, _631);
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _657 = fma(_643, _521, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _659 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[107].y, _633);
    float _661 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[107].z, _635);
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _667 = fma(_591, _625, _651);
    float _669 = fma(_649, _487, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _671 = fma(_655, _521, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _673 = fma(_593, _625, _659);
    float _675 = fma(_621, _487, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _677 = fma(_595, _625, _661);
    float _679 = fma(_665, _521, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _681 = fma(_669, _613, _667);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _683;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _691;
    float _695 = fma(_645, _613, _673);
    float _697 = fma(_675, _613, _677);
    float _699 = fma(_685, _535, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _701 = fma(_689, _535, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _705 = _703 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _711 = fma(_693, _535, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _713 = fma(_657, _569, _681);
    float _715 = fma(_671, _569, _695);
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _719 = _717 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _721 = fma(_679, _569, _697);
    float _723 = fma(_705, _529, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _725 = fma(_709, _529, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _727 = fma(_719, _529, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _729 = fma(_699, _559, _713);
    float _731 = fma(_701, _559, _715);
    float _733 = fma(_711, _559, _721);
    float _735 = fma(_723, _537, _729);
    float _737 = fma(_725, _537, _731);
    float _739 = fma(_727, _537, _733);
    float _741 = in.m_51.x;
    float _743 = in.m_51.y;
    float _745 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[113].x, _735);
    float _747 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[113].y, _737);
    float _749 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[113].z, _739);
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _753 = _745 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _755 = _747 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _757 = _749 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _759 = _753 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = _755 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _763 = _757 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _759;
    out.m_55.y = _761;
    out.m_55.z = _763;
    out.m_55.w = _751;
    float _765 = _361 * _743;
    float _767 = _359 * _741;
    bool _769 = !_501;
    float _787;
    if (!_769)
    {
        float _771 = in.m_53.x;
        float _773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _775 = _771 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _777 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _779 = _777 * _773;
        float _781 = floor(_779);
        float _783 = -_781;
        float _785 = _779 + _783;
        _787 = _785;
        _789 = true;
    }
    else
    {
        float _791 = float(_85);
        float _793 = 1.0 / _791;
        float _795 = _119 * _793;
        _787 = _795;
    }
    _789 = false;
    float _797 = _787;
    float _799 = as_type<float>(int(gl_VertexIndex));
    float _801 = _767 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _803 = _765 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _805 = in.m_53.x;
    float _807 = in.m_53.y;
    int _809 = as_type<int>(_799) & 1;
    bool _811 = _809 != 0;
    int _813 = as_type<int>(_799) & 2;
    bool _815 = _813 != 0;
    bool _817 = !_815;
    float _819 = _817 ? (-0.5) : 0.5;
    float _821 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _823 = !_811;
    float _825 = _823 ? (-0.5) : 0.5;
    bool _827 = _805 > 0.5;
    float _829 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _819);
    bool _831 = _807 > 0.5;
    float _833 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _825);
    float _835 = _803 * _829;
    float _837 = _257 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _839 = _801 * _833;
    float _841 = _257 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _843 = _835 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _845 = _835 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _847 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[6].x, _837);
    float _849 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[4].x, _841);
    float _851 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[24].x, _843);
    float _853 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[26].x, _845);
    float _855 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].z, _847);
    float _857 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].z, _849);
    float _859 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[24].z, _851);
    float _861 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[26].z, _853);
    float _863 = _855 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _865 = _857 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _867 = _859 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _869 = _861 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _871 = _257 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _873 = _865 + _867;
    float _875 = _863 + _869;
    float _877 = _835 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _879;
    float _883 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _885 = _873 + _883;
    float _887 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _889 = _875 + _887;
    float _891 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[5].x, _871);
    float _893 = 1.0 / _881;
    float _895 = _885 * _885;
    float _897 = _889 * _889;
    float _899 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].z, _891);
    float _901 = _895 + _897;
    int _903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _905 = _903 != 0;
    float _907 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[25].x, _877);
    int _909 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _911 = _909 != 0;
    float _913 = sqrt(_901);
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _917 = _797 + _915;
    float _919 = _917 * _893;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _921;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _925;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _929;
    bool _933 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _935 = isnan(_797);
    bool _937 = _933 || _935;
    bool _939 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _941 = _937 || _939;
    float _943 = float(_941);
    float _945 = fma(_923, _919, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _947 = fma(_927, _919, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _949 = fma(_931, _919, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _951 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[25].z, _907);
    bool _953 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _955 = isnan(_797);
    bool _957 = _953 || _955;
    bool _959 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _961 = _957 || _959;
    float _963 = float(_961);
    float _965 = _899 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _967 = _913 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _969 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _971 = _951 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _973 = -_943;
    float _975 = _973 + 1.0;
    float _977 = -_825;
    int _979 = _827 ? as_type<int>(_977) : as_type<int>(_825);
    float _981 = -_819;
    int _983 = _831 ? as_type<int>(_981) : as_type<int>(_819);
    float _985 = _965 + _971;
    bool _987 = !_905;
    float _989 = _987 ? _825 : as_type<float>(_979);
    float _991 = _963 * _975;
    bool _993 = !_911;
    float _995 = _993 ? _819 : as_type<float>(_983);
    float _997 = _899;
    float _999 = _825;
    float _1001 = _951;
    float _1003 = _975;
    float _1005 = _819;
    float _1007 = _965;
    float _1009 = _991;
    if (!_967)
    {
        _997 = _897;
    }
    float _1011 = _997;
    float _1013 = _1011;
    if (!_967)
    {
        _999 = _895;
    }
    float _1015 = _999;
    float _1017 = _1015;
    if (!_967)
    {
        _1001 = _873;
    }
    float _1019 = _1001;
    float _1021 = _1019;
    if (!_967)
    {
        _1003 = _875;
    }
    float _1023 = _1003;
    float _1025 = _1023;
    if (!_967)
    {
        _1005 = _985;
    }
    float _1027 = _1005;
    bool _1029 = !_967;
    float _1031 = _1027;
    if (!_1029)
    {
        float _1033 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1035 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1037 = _913 + _1035;
        float _1039 = _985 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1041 = rsqrt(_901);
        float _1043 = _1037 * _1033;
        float _1045 = _1043 * 0.15915493667125701904296875;
        float _1047 = _1045 * 6.283185482025146484375;
        float _1049 = sin(_1047);
        float _1051 = _1045 * 6.283185482025146484375;
        float _1053 = cos(_1051);
        float _1055 = fma(_1049, _1039, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1057 = _1041 * _1055;
        float _1059 = _1053 + (-1.0);
        float _1061 = fma(_885, _1057, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1063 = fma(_889, _1057, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1065 = _1059 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1067 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1069 = _1061 + _1067;
        float _1071 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1073 = _1063 + _1071;
        float _1075 = fma(_985, _1053, _1065);
        float _1077 = _1069 * _1069;
        float _1079 = _1073 * _1073;
        _1031 = _1075;
        _1017 = _1077;
        _1013 = _1079;
        _1021 = _1061;
        _1025 = _1063;
    }
    float _1081 = _1031;
    float _1083 = _1017;
    float _1085 = _1013;
    float _1087 = _1021;
    float _1089 = _1025;
    float _1091 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1093 = _1081 + _1091;
    float _1095 = _947 * _991;
    float _1097 = _945 * _991;
    float _1099 = _949 * _991;
    float _1101 = -_963;
    float _1103 = _1101 + 1.0;
    float _1105 = fma(_1093, _1093, _1083);
    float _1107 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1109 = _989 + 0.5;
    float _1111 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1097);
    float _1113 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1095);
    float _1115 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1099);
    float _1117 = _1105 + _1085;
    float _1119 = -_995;
    float _1121 = _1119 + 0.5;
    float _1123 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1111);
    float _1125 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1113);
    float _1127 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1115);
    float _1129 = _1109 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1131 = sqrt(_1117);
    float _1133 = _1121 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1135 = _1123 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1137 = _1125 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1139 = _1127 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1141 = _1129 * _969;
    float _1143 = _1133 * _1107;
    float _1145 = _1135 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1147 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1149 = _1139 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _1141;
    out.m_60.y = _1143;
    out.m_62.x = _1145;
    out.m_62.y = _1147;
    out.m_62.z = _1149;
    bool _1151 = _1131 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1153 = isnan(_1131);
    bool _1155 = _1151 || _1153;
    bool _1157 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1159 = _1155 || _1157;
    float _1161 = _1137;
    float _1163 = _1089;
    if (!_1159)
    {
        _1161 = 1.0;
    }
    float _1165 = _1161;
    bool _1167 = !_1159;
    float _1169 = _1165;
    if (!_1167)
    {
        bool _1171 = _1131 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1173 = isnan(_1131);
        bool _1175 = _1171 || _1173;
        bool _1177 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1179 = _1175 || _1177;
        if (!_1179)
        {
            float _1181 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1183 = _1131 + _1181;
            float _1185 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1187 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1185;
            float _1189 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1191 = _1189 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1193 = 1.0 / _1187;
            float _1195 = _1183 * _1193;
            float _1197 = fma(_1195, _1191, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1169 = _1197;
            _1199 = true;
        }
        else
        {
            bool _1201 = _1131 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1203 = isnan(_1131);
            bool _1205 = _1201 || _1203;
            bool _1207 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1209 = _1205 || _1207;
            if (!_1209)
            {
                float _1211 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1213 = _1131 + _1211;
                float _1215 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1217 = _1215 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1219 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1221 = _1219 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1223 = 1.0 / _1217;
                float _1225 = _1213 * _1223;
                float _1227 = fma(_1225, _1221, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1169 = _1227;
                _1199 = true;
            }
            else
            {
                _1169 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1199 = false;
    float _1229 = _1169;
    float _1231 = _965 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1233 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1235 = _1087 + _1233;
    float _1237 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1231);
    float _1239 = _965 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1241 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1243 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan(0.5);
    bool _1249 = _1245 || _1247;
    float _1251 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1253 = _1081 + _1251;
    float _1255 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1237);
    float _1257 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1239);
    bool _1259 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1261 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan(0.5);
    bool _1267 = _1263 || _1265;
    float _1269 = fma(_1235, _1229, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1271 = _1255 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1273 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1257);
    float _1275 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1277 = _1089 + _1275;
    float _1279 = fma(_1253, _1229, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1281 = 1.0 / _1271;
    float _1283 = _1273 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1285 = fma(_1277, _1229, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1287 = _1235;
    float _1289 = _1229;
    float _1291 = _1271;
    if (_1249)
    {
        _1287 = _1269;
    }
    float _1293 = _1287;
    float _1295 = _1283 + _1271;
    float _1297 = _1293;
    if (_1249)
    {
        _1289 = _1279;
    }
    float _1299 = _1289;
    float _1301 = _1299;
    if (_1249)
    {
        _1163 = _1285;
    }
    float _1303 = _1163;
    float _1305 = _1303;
    if (!_1249)
    {
        float _1307 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1309 = _965 + _1307;
        float _1311 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1313 = _865 + _1311;
        float _1315 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1317 = _1309 * _1309;
        float _1319 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1321 = _863 + _1319;
        float _1323 = fma(_1313, _1313, _1317);
        float _1325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1327 = fma(_1321, _1321, _1323);
        float _1329 = sqrt(_1327);
        float _1331 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1333 = -_865;
        float _1335 = _1333 + _1269;
        float _1337 = precise::min(_1329, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1339 = _1337 * _1325;
        float _1341 = -_863;
        float _1343 = _1341 + _1285;
        float _1345 = _1331 * _1339;
        float _1347 = -_965;
        float _1349 = _1347 + _1279;
        float _1351 = fma(_1335, _1345, _865);
        float _1353 = fma(_1349, _1345, _965);
        float _1355 = fma(_1343, _1345, _863);
        _1301 = _1353;
        _1297 = _1351;
        _1305 = _1355;
        _1291 = _1345;
    }
    float _1357 = _1301;
    float _1359 = _1297;
    float _1361 = _1305;
    float _1363 = _1291;
    float _1365 = _1363;
    if (_1267)
    {
        _1007 = 1.0;
    }
    float _1367 = _1007;
    float _1369 = _1295 * _1281;
    float _1371 = _1369 * 0.5;
    float _1373 = _1367;
    if (!_1267)
    {
        float _1375 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1377 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1379 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1377);
        float _1381 = _1375 * 0.15915493667125701904296875;
        float _1383 = _1381 * 6.283185482025146484375;
        float _1385 = cos(_1383);
        float _1387 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1389 = _1387 * 0.15915493667125701904296875;
        float _1391 = _1381 * 6.283185482025146484375;
        float _1393 = sin(_1391);
        float _1395 = 1.0 / _1385;
        float _1397 = _1389 * 6.283185482025146484375;
        float _1399 = cos(_1397);
        float _1401 = _1393 * _1395;
        float _1403 = 1.0 / _1379;
        float _1405 = _1399 * _1401;
        float _1407 = _1389 * 6.283185482025146484375;
        float _1409 = sin(_1407);
        float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1413 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1411;
        float _1415 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1417 = _1403 * _1415;
        float _1419 = 1.0 / _1405;
        float _1421 = 1.0 / _1413;
        float _1423 = _1409 * _1419;
        float _1425 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1427 = fma(_1423, _1417, _1425);
        float _1429 = _1427 * _1421;
        float _1431 = precise::clamp(_1429, 0.0, 1.0);
        _1365 = _1389;
        _1373 = _1431;
    }
    float _1433 = _1365;
    float _1435 = _1373;
    float _1437 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1439 = _1357 + _1437;
    float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1443 = _1359 + _1441;
    float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1447 = _1361 + _1445;
    float _1449 = _1439 * _1439;
    float _1451 = fma(_1443, _1443, _1449);
    float _1453 = fma(_1447, _1447, _1451);
    float _1455 = rsqrt(_1453);
    float _1457 = _1455 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1459 = _1443 * _1457;
    float _1461 = _1447 * _1457;
    float _1463 = _1459 * _1459;
    float _1465 = _1461 * _1461;
    float _1467 = _1463 + _1465;
    float _1469 = sqrt(_1467);
    bool _1471 = _1469 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1473 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1475 = _1469 + _1473;
    float _1477 = _1451;
    float _1479 = _1475;
    float _1481 = _1433;
    float _1483 = _1439;
    float _1485 = _1459;
    if (_1471)
    {
        float _1487 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1477 = _1487;
    }
    float _1489 = _1477;
    float _1491 = _1489;
    if (_1471)
    {
        float _1493 = _1475 * _1489;
        _1479 = _1493;
    }
    float _1495 = _1479;
    if (_1471)
    {
        float _1497 = rsqrt(_1467);
        _1491 = _1497;
    }
    float _1499 = _1491;
    float _1501 = _1499;
    if (_1471)
    {
        float _1503 = _1495 * 0.15915493667125701904296875;
        _1481 = _1503;
    }
    float _1505 = _1481;
    float _1507 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1509 = _1447;
    if (_1471)
    {
        float _1511 = _1505 * 6.283185482025146484375;
        float _1513 = sin(_1511);
        _1509 = _1513;
    }
    float _1515 = _1509;
    float _1517 = precise::max(0.0, _1507);
    float _1519 = _1455;
    float _1521 = _1517;
    if (_1471)
    {
        float _1523 = _1505 * 6.283185482025146484375;
        float _1525 = cos(_1523);
        _1519 = _1525;
    }
    float _1527 = _1519;
    float _1529 = -_1457;
    float _1531 = -_1517;
    float _1533 = fma(_1439, _1529, _1531);
    if (_1471)
    {
        float _1535 = _1533 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1483 = _1535;
    }
    float _1537 = _1483;
    float _1539 = sqrt(_1453);
    float _1541 = _1515;
    float _1543 = _1537;
    if (_1471)
    {
        float _1545 = fma(_1515, _1537, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1541 = _1545;
    }
    float _1547 = _1541;
    float _1549 = _1547;
    if (!_1471)
    {
        _1543 = _1533;
    }
    float _1551 = _1543;
    float _1553 = _1551;
    if (_1471)
    {
        float _1555 = _1499 * _1547;
        _1009 = _1555;
    }
    float _1557 = _1009;
    if (!_1471)
    {
        _1549 = _1463;
    }
    float _1559 = _1549;
    float _1561 = _1559;
    float _1563 = _1527;
    if (_1471)
    {
        float _1565 = _1527 + (-1.0);
        _1521 = _1565;
    }
    float _1567 = _1521;
    float _1569 = _1567;
    if (_1471)
    {
        float _1571 = _1459 * _1557;
        _1485 = _1571;
    }
    float _1573 = _1485;
    if (_1471)
    {
        float _1575 = _1567 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1501 = _1575;
    }
    float _1577 = _1501;
    if (!_1471)
    {
        _1569 = _1461;
    }
    float _1579 = _1569;
    float _1581 = _1579;
    if (_1471)
    {
        float _1583 = _1461 * _1557;
        _1581 = _1583;
    }
    float _1585 = _1581;
    if (_1471)
    {
        float _1587 = _1573 * _1573;
        _1561 = _1587;
    }
    float _1589 = _1561;
    if (_1471)
    {
        float _1591 = fma(_1533, _1527, _1577);
        _1553 = _1591;
    }
    float _1593 = _1553;
    if (!_1471)
    {
        _1563 = _1465;
    }
    float _1595 = _1563;
    float _1597 = _1595;
    if (_1471)
    {
        float _1599 = _1585 * _1585;
        _1597 = _1599;
    }
    float _1601 = _1597;
    float _1603 = fma(_1593, _1593, _1589);
    float _1605 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1607 = _1603 + _1601;
    float _1609 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1611 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1613 = fma(_1539, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1611);
    float _1615 = precise::clamp(_1613, 0.0, 1.0);
    float _1617 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1619 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1609);
    float _1621 = rsqrt(_1607);
    float _1623 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1625 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1617);
    float _1627 = -_1615;
    float _1629 = _1627 + 1.0;
    float _1631 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1633 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1623);
    float _1635 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1625);
    float _1637 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1619);
    float _1639 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1631);
    float _1641 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1633);
    float _1643 = _1635 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1645 = _1637 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1647 = abs(_1629);
    float _1649 = log2(_1647);
    float _1651 = _1641 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1653 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1655 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1639);
    float _1657 = _1621 * _1573;
    float _1659 = _1621 * _1593;
    float _1661 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1653);
    float _1663 = _1645 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1665 = _1657 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1667 = _1621 * _1585;
    float _1669 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1671 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1661);
    float _1673 = -_1665;
    float _1675 = fma(_1659, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1673);
    float _1677 = -_1663;
    float _1679 = fma(_1677, _1605, 1.0);
    float _1681 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1683 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1671);
    float _1685 = -_1667;
    float _1687 = fma(_1685, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1675);
    float _1689 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1691 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1693 = log2(_1679);
    float _1695 = fma(_1687, -0.5, 0.5);
    float _1697 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1689);
    float _1699 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1681);
    float _1701 = _1659 + 1.0;
    float _1703 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1699);
    float _1705 = 1.0 / _1683;
    float _1707 = sqrt(_1695);
    float _1709 = _1693 * 0.693147182464599609375;
    float _1711 = _1709 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1713 = exp2(_1691);
    float _1715 = _1707 * 0.636619746685028076171875;
    float _1717 = fma(_1687, 0.5, 0.5);
    float _1719 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1697);
    float _1721 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1703);
    float _1723 = fma(_1717, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1725 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1719);
    float _1727 = _1721 * _1705;
    float _1729 = -_1659;
    float _1731 = fma(_1713, _1701, _1729);
    float _1733 = fma(_1717, _1723, -0.212114393711090087890625);
    float _1735 = _1725 * _1705;
    float _1737 = fma(_1727, -0.5, 0.5);
    float _1739 = fma(_1731, 0.5, 0.5);
    float _1741 = fma(_1717, _1733, 1.570728778839111328125);
    float _1743 = fma(_1735, 0.5, 0.5);
    float _1745 = -_1741;
    float _1747 = fma(_1715, _1745, 1.0);
    float3 _4598 = float3(_1743, _1737, _1711);
    float _1749 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4598, float3(0.0), isnan(_4598)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4598, float3(0.0), isnan(_4598)), level(0.0)).x;
    float3 _4609 = float3(_1743, _1737, _1711);
    float4 _1752 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4609, float3(0.0), isnan(_4609)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4609, float3(0.0), isnan(_4609)), level(0.0)).xyzw;
    float _1754 = _1752.x;
    float _1756 = _1752.y;
    float _1758 = _1752.z;
    float _1760 = _1752.w;
    float2 _4626 = float2(_1747, _1739);
    float3 _1764 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4626, float2(0.0), isnan(_4626)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4626, float2(0.0), isnan(_4626)), level(0.0)).xyz;
    float _1766 = _1764.x;
    float _1768 = _1764.y;
    float _1770 = _1764.z;
    float _1772 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1774 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1776 = _1435 > 0.0;
    bool _1778 = isnan(_1435);
    bool _1780 = _1776 || _1778;
    bool _1782 = isnan(0.0);
    bool _1784 = _1780 || _1782;
    float _1786 = _1683 * 0.5;
    float _1788 = _1435 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1790 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1774);
    float _1792 = exp2(_1772);
    float _1794 = _1725 + _1683;
    float _1796 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1790);
    float _1798 = fma(_1721, -0.5, _1786);
    float _1800 = _1788 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1802 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1796);
    float _1804 = _1794 * 0.5;
    out.m_47.x = _1800;
    float _1806 = _1802 + _1683;
    out.gl_Position.x = _1725;
    out.gl_Position.y = _1721;
    out.gl_Position.z = _1802;
    out.gl_Position.w = _1683;
    float _1808 = _1806 * 0.5;
    float _1810 = -_1792;
    float _1812 = _1810 + 1.0;
    float _1814 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.x = _1804;
    out.m_64.y = _1798;
    out.m_64.z = _1808;
    out.m_64.w = _1683;
    float _1816 = -_1814;
    float _1818 = _1816 + 1.0;
    float _1820 = _1814 * _1749;
    float _1822 = _1760 * _1818;
    float _1824 = _1760 * _1820;
    float _1826 = _1770 * _1820;
    float _1828 = fma(_1766, _1824, _1754);
    float _1830 = fma(_1768, _1824, _1756);
    float _1832 = fma(_1760, _1826, _1758);
    out.m_66.x = _1828;
    out.m_66.y = _1830;
    out.m_66.z = _1832;
    out.m_66.w = _1822;
    if (_1784)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1834 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1834;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1199 = false;
    bool _789 = false;
    bool _383 = false;
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
        float _1891 = as_type<float>(_101);
        out.gl_Position.z = _1891;
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
        float _1960 = as_type<float>(_137);
        out.gl_Position.z = _1960;
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
    bool _295 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _297 = isnan(_289);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _307;
    float _311 = -_305;
    float _313 = _311 + 1.0;
    bool _315 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _317 = isnan(_289);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _327;
    bool _331 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _333 = 1.0 / _309;
    float _335 = _325 * _313;
    float _337 = -_325;
    float _339 = _337 + 1.0;
    float _341 = _293 * _333;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _343;
    float _347 = fma(_329, _341, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _349 = fma(_345, _341, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _351 = _347 * _335;
    float _353 = _349 * _335;
    float _355 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[143].x, _351);
    float _357 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[143].y, _353);
    float _359 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[144].x, _355);
    float _361 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[144].y, _357);
    bool _363 = !_331;
    float _381;
    if (!_363)
    {
        float _365 = in.m_53.x;
        float _367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _369 = _365 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _371 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _373 = _371 * _367;
        float _375 = floor(_373);
        float _377 = -_375;
        float _379 = _373 + _377;
        _381 = _379;
        _383 = true;
    }
    else
    {
        float _385 = float(_85);
        float _387 = 1.0 / _385;
        float _389 = _119 * _387;
        _381 = _389;
    }
    _383 = false;
    float _391 = _381;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _409 = 1.0 / _395;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _411;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _419 = 1.0 / _403;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _423 = _391 + _421;
    bool _425 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _427 = isnan(_391);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    bool _437 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _439 = isnan(_391);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    bool _449 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _451 = isnan(_391);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = -_435;
    float _463 = _461 + 1.0;
    float _465 = 1.0 / _399;
    float _467 = _423 * _409;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _471 = _391 + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _475 = _391 + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _479 = _391 + _477;
    float _481 = 1.0 / _407;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _485 = _391 + _483;
    float _487 = _471 * _419;
    bool _489 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _491 = isnan(_391);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    bool _501 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _503 = 1.0 / _417;
    float _505 = _485 * _465;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _509 = _391 + _507;
    float _511 = -_499;
    float _513 = _511 + 1.0;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _515;
    float _519 = 1.0 / _413;
    float _521 = _475 * _481;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _523;
    float _527 = fma(_517, _467, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _529 = _479 * _503;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _531;
    float _535 = _509 * _519;
    float _537 = _435 * _513;
    float _539 = fma(_525, _467, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _541 = fma(_533, _467, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _543 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _545 = isnan(_391);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = -_447;
    float _557 = _555 + 1.0;
    float _559 = _447 * _463;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _569 = _553 * _557;
    float _571 = -_553;
    float _573 = _571 + 1.0;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    bool _579 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _581 = isnan(_391);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = fma(_567, _505, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _593 = fma(_563, _505, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _595 = fma(_577, _505, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _597 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _599 = isnan(_391);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = -_589;
    float _611 = _609 + 1.0;
    float _613 = _459 * _573;
    float _615 = -_459;
    float _617 = _615 + 1.0;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _619;
    float _623 = _607 * _611;
    float _625 = _589 * _617;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _627;
    float _631 = _539 * _623;
    float _633 = _541 * _623;
    float _635 = _527 * _623;
    float _637 = -_607;
    float _639 = _637 + 1.0;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _645 = fma(_629, _487, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _647;
    float _651 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[107].x, _631);
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _657 = fma(_643, _521, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _659 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[107].y, _633);
    float _661 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[107].z, _635);
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _667 = fma(_591, _625, _651);
    float _669 = fma(_649, _487, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _671 = fma(_655, _521, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _673 = fma(_593, _625, _659);
    float _675 = fma(_621, _487, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _677 = fma(_595, _625, _661);
    float _679 = fma(_665, _521, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _681 = fma(_669, _613, _667);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _683;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _691;
    float _695 = fma(_645, _613, _673);
    float _697 = fma(_675, _613, _677);
    float _699 = fma(_685, _535, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _701 = fma(_689, _535, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _705 = _703 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _711 = fma(_693, _535, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _713 = fma(_657, _569, _681);
    float _715 = fma(_671, _569, _695);
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _719 = _717 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _721 = fma(_679, _569, _697);
    float _723 = fma(_705, _529, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _725 = fma(_709, _529, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _727 = fma(_719, _529, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _729 = fma(_699, _559, _713);
    float _731 = fma(_701, _559, _715);
    float _733 = fma(_711, _559, _721);
    float _735 = fma(_723, _537, _729);
    float _737 = fma(_725, _537, _731);
    float _739 = fma(_727, _537, _733);
    float _741 = in.m_51.x;
    float _743 = in.m_51.y;
    float _745 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[113].x, _735);
    float _747 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[113].y, _737);
    float _749 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[113].z, _739);
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _753 = _745 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _755 = _747 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _757 = _749 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _759 = _753 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = _755 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _763 = _757 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _759;
    out.m_55.y = _761;
    out.m_55.z = _763;
    out.m_55.w = _751;
    float _765 = _361 * _743;
    float _767 = _359 * _741;
    bool _769 = !_501;
    float _787;
    if (!_769)
    {
        float _771 = in.m_53.x;
        float _773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _775 = _771 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _777 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _779 = _777 * _773;
        float _781 = floor(_779);
        float _783 = -_781;
        float _785 = _779 + _783;
        _787 = _785;
        _789 = true;
    }
    else
    {
        float _791 = float(_85);
        float _793 = 1.0 / _791;
        float _795 = _119 * _793;
        _787 = _795;
    }
    _789 = false;
    float _797 = _787;
    float _799 = as_type<float>(int(gl_VertexIndex));
    float _801 = _767 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _803 = _765 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _805 = in.m_53.x;
    float _807 = in.m_53.y;
    int _809 = as_type<int>(_799) & 1;
    bool _811 = _809 != 0;
    int _813 = as_type<int>(_799) & 2;
    bool _815 = _813 != 0;
    bool _817 = !_815;
    float _819 = _817 ? (-0.5) : 0.5;
    float _821 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _823 = !_811;
    float _825 = _823 ? (-0.5) : 0.5;
    bool _827 = _805 > 0.5;
    float _829 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _819);
    bool _831 = _807 > 0.5;
    float _833 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _825);
    float _835 = _803 * _829;
    float _837 = _257 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _839 = _801 * _833;
    float _841 = _257 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _843 = _835 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _845 = _835 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _847 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[6].x, _837);
    float _849 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[4].x, _841);
    float _851 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[24].x, _843);
    float _853 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[26].x, _845);
    float _855 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].z, _847);
    float _857 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].z, _849);
    float _859 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[24].z, _851);
    float _861 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[26].z, _853);
    float _863 = _855 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _865 = _857 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _867 = _859 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _869 = _861 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _871 = _257 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _873 = _865 + _867;
    float _875 = _863 + _869;
    float _877 = _835 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _879;
    float _883 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _885 = _873 + _883;
    float _887 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _889 = _875 + _887;
    float _891 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[5].x, _871);
    float _893 = 1.0 / _881;
    float _895 = _885 * _885;
    float _897 = _889 * _889;
    float _899 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].z, _891);
    float _901 = _895 + _897;
    int _903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _905 = _903 != 0;
    float _907 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[25].x, _877);
    int _909 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _911 = _909 != 0;
    float _913 = sqrt(_901);
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _917 = _797 + _915;
    float _919 = _917 * _893;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _921;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _925;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _929;
    bool _933 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _935 = isnan(_797);
    bool _937 = _933 || _935;
    bool _939 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _941 = _937 || _939;
    float _943 = float(_941);
    float _945 = fma(_923, _919, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _947 = fma(_927, _919, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _949 = fma(_931, _919, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _951 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[25].z, _907);
    bool _953 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _955 = isnan(_797);
    bool _957 = _953 || _955;
    bool _959 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _961 = _957 || _959;
    float _963 = float(_961);
    float _965 = _899 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _967 = _913 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _969 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _971 = _951 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _973 = -_943;
    float _975 = _973 + 1.0;
    float _977 = -_825;
    int _979 = _827 ? as_type<int>(_977) : as_type<int>(_825);
    float _981 = -_819;
    int _983 = _831 ? as_type<int>(_981) : as_type<int>(_819);
    float _985 = _965 + _971;
    bool _987 = !_905;
    float _989 = _987 ? _825 : as_type<float>(_979);
    float _991 = _963 * _975;
    bool _993 = !_911;
    float _995 = _993 ? _819 : as_type<float>(_983);
    float _997 = _899;
    float _999 = _825;
    float _1001 = _951;
    float _1003 = _975;
    float _1005 = _819;
    float _1007 = _965;
    float _1009 = _991;
    if (!_967)
    {
        _997 = _897;
    }
    float _1011 = _997;
    float _1013 = _1011;
    if (!_967)
    {
        _999 = _895;
    }
    float _1015 = _999;
    float _1017 = _1015;
    if (!_967)
    {
        _1001 = _873;
    }
    float _1019 = _1001;
    float _1021 = _1019;
    if (!_967)
    {
        _1003 = _875;
    }
    float _1023 = _1003;
    float _1025 = _1023;
    if (!_967)
    {
        _1005 = _985;
    }
    float _1027 = _1005;
    bool _1029 = !_967;
    float _1031 = _1027;
    if (!_1029)
    {
        float _1033 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1035 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1037 = _913 + _1035;
        float _1039 = _985 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1041 = rsqrt(_901);
        float _1043 = _1037 * _1033;
        float _1045 = _1043 * 0.15915493667125701904296875;
        float _1047 = _1045 * 6.283185482025146484375;
        float _1049 = sin(_1047);
        float _1051 = _1045 * 6.283185482025146484375;
        float _1053 = cos(_1051);
        float _1055 = fma(_1049, _1039, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1057 = _1041 * _1055;
        float _1059 = _1053 + (-1.0);
        float _1061 = fma(_885, _1057, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1063 = fma(_889, _1057, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1065 = _1059 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1067 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1069 = _1061 + _1067;
        float _1071 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1073 = _1063 + _1071;
        float _1075 = fma(_985, _1053, _1065);
        float _1077 = _1069 * _1069;
        float _1079 = _1073 * _1073;
        _1031 = _1075;
        _1017 = _1077;
        _1013 = _1079;
        _1021 = _1061;
        _1025 = _1063;
    }
    float _1081 = _1031;
    float _1083 = _1017;
    float _1085 = _1013;
    float _1087 = _1021;
    float _1089 = _1025;
    float _1091 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1093 = _1081 + _1091;
    float _1095 = _947 * _991;
    float _1097 = _945 * _991;
    float _1099 = _949 * _991;
    float _1101 = -_963;
    float _1103 = _1101 + 1.0;
    float _1105 = fma(_1093, _1093, _1083);
    float _1107 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1109 = _989 + 0.5;
    float _1111 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1097);
    float _1113 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1095);
    float _1115 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1099);
    float _1117 = _1105 + _1085;
    float _1119 = -_995;
    float _1121 = _1119 + 0.5;
    float _1123 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1111);
    float _1125 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1113);
    float _1127 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1115);
    float _1129 = _1109 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1131 = sqrt(_1117);
    float _1133 = _1121 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1135 = _1123 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1137 = _1125 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1139 = _1127 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1141 = _1129 * _969;
    float _1143 = _1133 * _1107;
    float _1145 = _1135 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1147 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1149 = _1139 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _1141;
    out.m_60.y = _1143;
    out.m_62.x = _1145;
    out.m_62.y = _1147;
    out.m_62.z = _1149;
    bool _1151 = _1131 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1153 = isnan(_1131);
    bool _1155 = _1151 || _1153;
    bool _1157 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1159 = _1155 || _1157;
    float _1161 = _1137;
    float _1163 = _1089;
    if (!_1159)
    {
        _1161 = 1.0;
    }
    float _1165 = _1161;
    bool _1167 = !_1159;
    float _1169 = _1165;
    if (!_1167)
    {
        bool _1171 = _1131 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1173 = isnan(_1131);
        bool _1175 = _1171 || _1173;
        bool _1177 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1179 = _1175 || _1177;
        if (!_1179)
        {
            float _1181 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1183 = _1131 + _1181;
            float _1185 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1187 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1185;
            float _1189 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1191 = _1189 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1193 = 1.0 / _1187;
            float _1195 = _1183 * _1193;
            float _1197 = fma(_1195, _1191, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1169 = _1197;
            _1199 = true;
        }
        else
        {
            bool _1201 = _1131 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1203 = isnan(_1131);
            bool _1205 = _1201 || _1203;
            bool _1207 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1209 = _1205 || _1207;
            if (!_1209)
            {
                float _1211 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1213 = _1131 + _1211;
                float _1215 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1217 = _1215 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1219 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1221 = _1219 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1223 = 1.0 / _1217;
                float _1225 = _1213 * _1223;
                float _1227 = fma(_1225, _1221, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1169 = _1227;
                _1199 = true;
            }
            else
            {
                _1169 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1199 = false;
    float _1229 = _1169;
    float _1231 = _965 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1233 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1235 = _1087 + _1233;
    float _1237 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1231);
    float _1239 = _965 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1241 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1243 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan(0.5);
    bool _1249 = _1245 || _1247;
    float _1251 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1253 = _1081 + _1251;
    float _1255 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1237);
    float _1257 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1239);
    bool _1259 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1261 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan(0.5);
    bool _1267 = _1263 || _1265;
    float _1269 = fma(_1235, _1229, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1271 = _1255 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1273 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1257);
    float _1275 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1277 = _1089 + _1275;
    float _1279 = fma(_1253, _1229, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1281 = 1.0 / _1271;
    float _1283 = _1273 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1285 = fma(_1277, _1229, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1287 = _1235;
    float _1289 = _1229;
    float _1291 = _1271;
    if (_1249)
    {
        _1287 = _1269;
    }
    float _1293 = _1287;
    float _1295 = _1283 + _1271;
    float _1297 = _1293;
    if (_1249)
    {
        _1289 = _1279;
    }
    float _1299 = _1289;
    float _1301 = _1299;
    if (_1249)
    {
        _1163 = _1285;
    }
    float _1303 = _1163;
    float _1305 = _1303;
    if (!_1249)
    {
        float _1307 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1309 = _965 + _1307;
        float _1311 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1313 = _865 + _1311;
        float _1315 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1317 = _1309 * _1309;
        float _1319 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1321 = _863 + _1319;
        float _1323 = fma(_1313, _1313, _1317);
        float _1325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1327 = fma(_1321, _1321, _1323);
        float _1329 = sqrt(_1327);
        float _1331 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1333 = -_865;
        float _1335 = _1333 + _1269;
        float _1337 = precise::min(_1329, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1339 = _1337 * _1325;
        float _1341 = -_863;
        float _1343 = _1341 + _1285;
        float _1345 = _1331 * _1339;
        float _1347 = -_965;
        float _1349 = _1347 + _1279;
        float _1351 = fma(_1335, _1345, _865);
        float _1353 = fma(_1349, _1345, _965);
        float _1355 = fma(_1343, _1345, _863);
        _1301 = _1353;
        _1297 = _1351;
        _1305 = _1355;
        _1291 = _1345;
    }
    float _1357 = _1301;
    float _1359 = _1297;
    float _1361 = _1305;
    float _1363 = _1291;
    float _1365 = _1363;
    if (_1267)
    {
        _1007 = 1.0;
    }
    float _1367 = _1007;
    float _1369 = _1295 * _1281;
    float _1371 = _1369 * 0.5;
    float _1373 = _1367;
    if (!_1267)
    {
        float _1375 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1377 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1379 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1377);
        float _1381 = _1375 * 0.15915493667125701904296875;
        float _1383 = _1381 * 6.283185482025146484375;
        float _1385 = cos(_1383);
        float _1387 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1389 = _1387 * 0.15915493667125701904296875;
        float _1391 = _1381 * 6.283185482025146484375;
        float _1393 = sin(_1391);
        float _1395 = 1.0 / _1385;
        float _1397 = _1389 * 6.283185482025146484375;
        float _1399 = cos(_1397);
        float _1401 = _1393 * _1395;
        float _1403 = 1.0 / _1379;
        float _1405 = _1399 * _1401;
        float _1407 = _1389 * 6.283185482025146484375;
        float _1409 = sin(_1407);
        float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1413 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1411;
        float _1415 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1417 = _1403 * _1415;
        float _1419 = 1.0 / _1405;
        float _1421 = 1.0 / _1413;
        float _1423 = _1409 * _1419;
        float _1425 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1427 = fma(_1423, _1417, _1425);
        float _1429 = _1427 * _1421;
        float _1431 = precise::clamp(_1429, 0.0, 1.0);
        _1365 = _1389;
        _1373 = _1431;
    }
    float _1433 = _1365;
    float _1435 = _1373;
    float _1437 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1439 = _1357 + _1437;
    float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1443 = _1359 + _1441;
    float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1447 = _1361 + _1445;
    float _1449 = _1439 * _1439;
    float _1451 = fma(_1443, _1443, _1449);
    float _1453 = fma(_1447, _1447, _1451);
    float _1455 = rsqrt(_1453);
    float _1457 = _1455 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1459 = _1443 * _1457;
    float _1461 = _1447 * _1457;
    float _1463 = _1459 * _1459;
    float _1465 = _1461 * _1461;
    float _1467 = _1463 + _1465;
    float _1469 = sqrt(_1467);
    bool _1471 = _1469 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1473 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1475 = _1469 + _1473;
    float _1477 = _1451;
    float _1479 = _1475;
    float _1481 = _1433;
    float _1483 = _1439;
    float _1485 = _1459;
    if (_1471)
    {
        float _1487 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1477 = _1487;
    }
    float _1489 = _1477;
    float _1491 = _1489;
    if (_1471)
    {
        float _1493 = _1475 * _1489;
        _1479 = _1493;
    }
    float _1495 = _1479;
    if (_1471)
    {
        float _1497 = rsqrt(_1467);
        _1491 = _1497;
    }
    float _1499 = _1491;
    float _1501 = _1499;
    if (_1471)
    {
        float _1503 = _1495 * 0.15915493667125701904296875;
        _1481 = _1503;
    }
    float _1505 = _1481;
    float _1507 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1509 = _1447;
    if (_1471)
    {
        float _1511 = _1505 * 6.283185482025146484375;
        float _1513 = sin(_1511);
        _1509 = _1513;
    }
    float _1515 = _1509;
    float _1517 = precise::max(0.0, _1507);
    float _1519 = _1455;
    float _1521 = _1517;
    if (_1471)
    {
        float _1523 = _1505 * 6.283185482025146484375;
        float _1525 = cos(_1523);
        _1519 = _1525;
    }
    float _1527 = _1519;
    float _1529 = -_1457;
    float _1531 = -_1517;
    float _1533 = fma(_1439, _1529, _1531);
    if (_1471)
    {
        float _1535 = _1533 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1483 = _1535;
    }
    float _1537 = _1483;
    float _1539 = sqrt(_1453);
    float _1541 = _1515;
    float _1543 = _1537;
    if (_1471)
    {
        float _1545 = fma(_1515, _1537, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1541 = _1545;
    }
    float _1547 = _1541;
    float _1549 = _1547;
    if (!_1471)
    {
        _1543 = _1533;
    }
    float _1551 = _1543;
    float _1553 = _1551;
    if (_1471)
    {
        float _1555 = _1499 * _1547;
        _1009 = _1555;
    }
    float _1557 = _1009;
    if (!_1471)
    {
        _1549 = _1463;
    }
    float _1559 = _1549;
    float _1561 = _1559;
    float _1563 = _1527;
    if (_1471)
    {
        float _1565 = _1527 + (-1.0);
        _1521 = _1565;
    }
    float _1567 = _1521;
    float _1569 = _1567;
    if (_1471)
    {
        float _1571 = _1459 * _1557;
        _1485 = _1571;
    }
    float _1573 = _1485;
    if (_1471)
    {
        float _1575 = _1567 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1501 = _1575;
    }
    float _1577 = _1501;
    if (!_1471)
    {
        _1569 = _1461;
    }
    float _1579 = _1569;
    float _1581 = _1579;
    if (_1471)
    {
        float _1583 = _1461 * _1557;
        _1581 = _1583;
    }
    float _1585 = _1581;
    if (_1471)
    {
        float _1587 = _1573 * _1573;
        _1561 = _1587;
    }
    float _1589 = _1561;
    if (_1471)
    {
        float _1591 = fma(_1533, _1527, _1577);
        _1553 = _1591;
    }
    float _1593 = _1553;
    if (!_1471)
    {
        _1563 = _1465;
    }
    float _1595 = _1563;
    float _1597 = _1595;
    if (_1471)
    {
        float _1599 = _1585 * _1585;
        _1597 = _1599;
    }
    float _1601 = _1597;
    float _1603 = fma(_1593, _1593, _1589);
    float _1605 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1607 = _1603 + _1601;
    float _1609 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1611 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1613 = fma(_1539, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1611);
    float _1615 = precise::clamp(_1613, 0.0, 1.0);
    float _1617 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1619 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1609);
    float _1621 = rsqrt(_1607);
    float _1623 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1625 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1617);
    float _1627 = -_1615;
    float _1629 = _1627 + 1.0;
    float _1631 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1633 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1623);
    float _1635 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1625);
    float _1637 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1619);
    float _1639 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1631);
    float _1641 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1633);
    float _1643 = _1635 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1645 = _1637 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1647 = abs(_1629);
    float _1649 = log2(_1647);
    float _1651 = _1641 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1653 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1655 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1639);
    float _1657 = _1621 * _1573;
    float _1659 = _1621 * _1593;
    float _1661 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1653);
    float _1663 = _1645 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1665 = _1657 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1667 = _1621 * _1585;
    float _1669 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1671 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1661);
    float _1673 = -_1665;
    float _1675 = fma(_1659, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1673);
    float _1677 = -_1663;
    float _1679 = fma(_1677, _1605, 1.0);
    float _1681 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1683 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1671);
    float _1685 = -_1667;
    float _1687 = fma(_1685, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1675);
    float _1689 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1691 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1693 = log2(_1679);
    float _1695 = fma(_1687, -0.5, 0.5);
    float _1697 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1689);
    float _1699 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1681);
    float _1701 = _1659 + 1.0;
    float _1703 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1699);
    float _1705 = 1.0 / _1683;
    float _1707 = sqrt(_1695);
    float _1709 = _1693 * 0.693147182464599609375;
    float _1711 = _1709 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1713 = exp2(_1691);
    float _1715 = _1707 * 0.636619746685028076171875;
    float _1717 = fma(_1687, 0.5, 0.5);
    float _1719 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1697);
    float _1721 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1703);
    float _1723 = fma(_1717, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1725 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1719);
    float _1727 = _1721 * _1705;
    float _1729 = -_1659;
    float _1731 = fma(_1713, _1701, _1729);
    float _1733 = fma(_1717, _1723, -0.212114393711090087890625);
    float _1735 = _1725 * _1705;
    float _1737 = fma(_1727, -0.5, 0.5);
    float _1739 = fma(_1731, 0.5, 0.5);
    float _1741 = fma(_1717, _1733, 1.570728778839111328125);
    float _1743 = fma(_1735, 0.5, 0.5);
    float _1745 = -_1741;
    float _1747 = fma(_1715, _1745, 1.0);
    float3 _4598 = float3(_1743, _1737, _1711);
    float _1749 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4598, float3(0.0), isnan(_4598)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4598, float3(0.0), isnan(_4598)), level(0.0)).x;
    float3 _4609 = float3(_1743, _1737, _1711);
    float4 _1752 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4609, float3(0.0), isnan(_4609)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4609, float3(0.0), isnan(_4609)), level(0.0)).xyzw;
    float _1754 = _1752.x;
    float _1756 = _1752.y;
    float _1758 = _1752.z;
    float _1760 = _1752.w;
    float2 _4626 = float2(_1747, _1739);
    float3 _1764 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4626, float2(0.0), isnan(_4626)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4626, float2(0.0), isnan(_4626)), level(0.0)).xyz;
    float _1766 = _1764.x;
    float _1768 = _1764.y;
    float _1770 = _1764.z;
    float _1772 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1774 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1776 = _1435 > 0.0;
    bool _1778 = isnan(_1435);
    bool _1780 = _1776 || _1778;
    bool _1782 = isnan(0.0);
    bool _1784 = _1780 || _1782;
    float _1786 = _1683 * 0.5;
    float _1788 = _1435 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1790 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1774);
    float _1792 = exp2(_1772);
    float _1794 = _1725 + _1683;
    float _1796 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1790);
    float _1798 = fma(_1721, -0.5, _1786);
    float _1800 = _1788 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1802 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1796);
    float _1804 = _1794 * 0.5;
    out.m_47.x = _1800;
    float _1806 = _1802 + _1683;
    out.gl_Position.x = _1725;
    out.gl_Position.y = _1721;
    out.gl_Position.z = _1802;
    out.gl_Position.w = _1683;
    float _1808 = _1806 * 0.5;
    float _1810 = -_1792;
    float _1812 = _1810 + 1.0;
    float _1814 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.x = _1804;
    out.m_64.y = _1798;
    out.m_64.z = _1808;
    out.m_64.w = _1683;
    float _1816 = -_1814;
    float _1818 = _1816 + 1.0;
    float _1820 = _1814 * _1749;
    float _1822 = _1760 * _1818;
    float _1824 = _1760 * _1820;
    float _1826 = _1770 * _1820;
    float _1828 = fma(_1766, _1824, _1754);
    float _1830 = fma(_1768, _1824, _1756);
    float _1832 = fma(_1760, _1826, _1758);
    out.m_66.x = _1828;
    out.m_66.y = _1830;
    out.m_66.z = _1832;
    out.m_66.w = _1822;
    if (_1784)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1834 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1834;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1199 = false;
    bool _789 = false;
    bool _383 = false;
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
        float _1891 = as_type<float>(_101);
        out.gl_Position.z = _1891;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1960 = as_type<float>(_137);
        out.gl_Position.z = _1960;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    bool _295 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _297 = isnan(_289);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _307;
    float _311 = -_305;
    float _313 = _311 + 1.0;
    bool _315 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _317 = isnan(_289);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _327;
    bool _331 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _333 = 1.0 / _309;
    float _335 = _325 * _313;
    float _337 = -_325;
    float _339 = _337 + 1.0;
    float _341 = _293 * _333;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _343;
    float _347 = fma(_329, _341, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _349 = fma(_345, _341, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _351 = _347 * _335;
    float _353 = _349 * _335;
    float _355 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[143].x, _351);
    float _357 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[143].y, _353);
    float _359 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[144].x, _355);
    float _361 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[144].y, _357);
    bool _363 = !_331;
    float _381;
    if (!_363)
    {
        float _365 = in.m_53.x;
        float _367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _369 = _365 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _371 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _373 = _371 * _367;
        float _375 = floor(_373);
        float _377 = -_375;
        float _379 = _373 + _377;
        _381 = _379;
        _383 = true;
    }
    else
    {
        float _385 = float(_85);
        float _387 = 1.0 / _385;
        float _389 = _119 * _387;
        _381 = _389;
    }
    _383 = false;
    float _391 = _381;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _409 = 1.0 / _395;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _411;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _419 = 1.0 / _403;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _423 = _391 + _421;
    bool _425 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _427 = isnan(_391);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    bool _437 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _439 = isnan(_391);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    bool _449 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _451 = isnan(_391);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = -_435;
    float _463 = _461 + 1.0;
    float _465 = 1.0 / _399;
    float _467 = _423 * _409;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _471 = _391 + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _475 = _391 + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _479 = _391 + _477;
    float _481 = 1.0 / _407;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _485 = _391 + _483;
    float _487 = _471 * _419;
    bool _489 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _491 = isnan(_391);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    bool _501 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _503 = 1.0 / _417;
    float _505 = _485 * _465;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _509 = _391 + _507;
    float _511 = -_499;
    float _513 = _511 + 1.0;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _515;
    float _519 = 1.0 / _413;
    float _521 = _475 * _481;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _523;
    float _527 = fma(_517, _467, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _529 = _479 * _503;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _531;
    float _535 = _509 * _519;
    float _537 = _435 * _513;
    float _539 = fma(_525, _467, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _541 = fma(_533, _467, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _543 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _545 = isnan(_391);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = -_447;
    float _557 = _555 + 1.0;
    float _559 = _447 * _463;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _569 = _553 * _557;
    float _571 = -_553;
    float _573 = _571 + 1.0;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    bool _579 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _581 = isnan(_391);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = fma(_567, _505, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _593 = fma(_563, _505, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _595 = fma(_577, _505, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _597 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _599 = isnan(_391);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = -_589;
    float _611 = _609 + 1.0;
    float _613 = _459 * _573;
    float _615 = -_459;
    float _617 = _615 + 1.0;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _619;
    float _623 = _607 * _611;
    float _625 = _589 * _617;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _627;
    float _631 = _539 * _623;
    float _633 = _541 * _623;
    float _635 = _527 * _623;
    float _637 = -_607;
    float _639 = _637 + 1.0;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _645 = fma(_629, _487, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _647;
    float _651 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[107].x, _631);
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _657 = fma(_643, _521, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _659 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[107].y, _633);
    float _661 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[107].z, _635);
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _667 = fma(_591, _625, _651);
    float _669 = fma(_649, _487, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _671 = fma(_655, _521, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _673 = fma(_593, _625, _659);
    float _675 = fma(_621, _487, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _677 = fma(_595, _625, _661);
    float _679 = fma(_665, _521, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _681 = fma(_669, _613, _667);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _683;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _691;
    float _695 = fma(_645, _613, _673);
    float _697 = fma(_675, _613, _677);
    float _699 = fma(_685, _535, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _701 = fma(_689, _535, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _705 = _703 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _711 = fma(_693, _535, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _713 = fma(_657, _569, _681);
    float _715 = fma(_671, _569, _695);
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _719 = _717 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _721 = fma(_679, _569, _697);
    float _723 = fma(_705, _529, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _725 = fma(_709, _529, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _727 = fma(_719, _529, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _729 = fma(_699, _559, _713);
    float _731 = fma(_701, _559, _715);
    float _733 = fma(_711, _559, _721);
    float _735 = fma(_723, _537, _729);
    float _737 = fma(_725, _537, _731);
    float _739 = fma(_727, _537, _733);
    float _741 = in.m_51.x;
    float _743 = in.m_51.y;
    float _745 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[113].x, _735);
    float _747 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[113].y, _737);
    float _749 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[113].z, _739);
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _753 = _745 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _755 = _747 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _757 = _749 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _759 = _753 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = _755 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _763 = _757 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _759;
    out.m_55.y = _761;
    out.m_55.z = _763;
    out.m_55.w = _751;
    float _765 = _361 * _743;
    float _767 = _359 * _741;
    bool _769 = !_501;
    float _787;
    if (!_769)
    {
        float _771 = in.m_53.x;
        float _773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _775 = _771 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _777 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _779 = _777 * _773;
        float _781 = floor(_779);
        float _783 = -_781;
        float _785 = _779 + _783;
        _787 = _785;
        _789 = true;
    }
    else
    {
        float _791 = float(_85);
        float _793 = 1.0 / _791;
        float _795 = _119 * _793;
        _787 = _795;
    }
    _789 = false;
    float _797 = _787;
    float _799 = as_type<float>(int(gl_VertexIndex));
    float _801 = _767 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _803 = _765 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _805 = in.m_53.x;
    float _807 = in.m_53.y;
    int _809 = as_type<int>(_799) & 1;
    bool _811 = _809 != 0;
    int _813 = as_type<int>(_799) & 2;
    bool _815 = _813 != 0;
    bool _817 = !_815;
    float _819 = _817 ? (-0.5) : 0.5;
    float _821 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _823 = !_811;
    float _825 = _823 ? (-0.5) : 0.5;
    bool _827 = _805 > 0.5;
    float _829 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _819);
    bool _831 = _807 > 0.5;
    float _833 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _825);
    float _835 = _803 * _829;
    float _837 = _257 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _839 = _801 * _833;
    float _841 = _257 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _843 = _835 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _845 = _835 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _847 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[6].x, _837);
    float _849 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[4].x, _841);
    float _851 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[24].x, _843);
    float _853 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[26].x, _845);
    float _855 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].z, _847);
    float _857 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].z, _849);
    float _859 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[24].z, _851);
    float _861 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[26].z, _853);
    float _863 = _855 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _865 = _857 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _867 = _859 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _869 = _861 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _871 = _257 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _873 = _865 + _867;
    float _875 = _863 + _869;
    float _877 = _835 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _879;
    float _883 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _885 = _873 + _883;
    float _887 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _889 = _875 + _887;
    float _891 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[5].x, _871);
    float _893 = 1.0 / _881;
    float _895 = _885 * _885;
    float _897 = _889 * _889;
    float _899 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].z, _891);
    float _901 = _895 + _897;
    int _903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _905 = _903 != 0;
    float _907 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[25].x, _877);
    int _909 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _911 = _909 != 0;
    float _913 = sqrt(_901);
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _917 = _797 + _915;
    float _919 = _917 * _893;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _921;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _925;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _929;
    bool _933 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _935 = isnan(_797);
    bool _937 = _933 || _935;
    bool _939 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _941 = _937 || _939;
    float _943 = float(_941);
    float _945 = fma(_923, _919, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _947 = fma(_927, _919, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _949 = fma(_931, _919, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _951 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[25].z, _907);
    bool _953 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _955 = isnan(_797);
    bool _957 = _953 || _955;
    bool _959 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _961 = _957 || _959;
    float _963 = float(_961);
    float _965 = _899 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _967 = _913 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _969 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _971 = _951 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _973 = -_943;
    float _975 = _973 + 1.0;
    float _977 = -_825;
    int _979 = _827 ? as_type<int>(_977) : as_type<int>(_825);
    float _981 = -_819;
    int _983 = _831 ? as_type<int>(_981) : as_type<int>(_819);
    float _985 = _965 + _971;
    bool _987 = !_905;
    float _989 = _987 ? _825 : as_type<float>(_979);
    float _991 = _963 * _975;
    bool _993 = !_911;
    float _995 = _993 ? _819 : as_type<float>(_983);
    float _997 = _899;
    float _999 = _825;
    float _1001 = _951;
    float _1003 = _975;
    float _1005 = _819;
    float _1007 = _965;
    float _1009 = _991;
    if (!_967)
    {
        _997 = _897;
    }
    float _1011 = _997;
    float _1013 = _1011;
    if (!_967)
    {
        _999 = _895;
    }
    float _1015 = _999;
    float _1017 = _1015;
    if (!_967)
    {
        _1001 = _873;
    }
    float _1019 = _1001;
    float _1021 = _1019;
    if (!_967)
    {
        _1003 = _875;
    }
    float _1023 = _1003;
    float _1025 = _1023;
    if (!_967)
    {
        _1005 = _985;
    }
    float _1027 = _1005;
    bool _1029 = !_967;
    float _1031 = _1027;
    if (!_1029)
    {
        float _1033 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1035 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1037 = _913 + _1035;
        float _1039 = _985 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1041 = rsqrt(_901);
        float _1043 = _1037 * _1033;
        float _1045 = _1043 * 0.15915493667125701904296875;
        float _1047 = _1045 * 6.283185482025146484375;
        float _1049 = sin(_1047);
        float _1051 = _1045 * 6.283185482025146484375;
        float _1053 = cos(_1051);
        float _1055 = fma(_1049, _1039, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1057 = _1041 * _1055;
        float _1059 = _1053 + (-1.0);
        float _1061 = fma(_885, _1057, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1063 = fma(_889, _1057, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1065 = _1059 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1067 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1069 = _1061 + _1067;
        float _1071 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1073 = _1063 + _1071;
        float _1075 = fma(_985, _1053, _1065);
        float _1077 = _1069 * _1069;
        float _1079 = _1073 * _1073;
        _1031 = _1075;
        _1017 = _1077;
        _1013 = _1079;
        _1021 = _1061;
        _1025 = _1063;
    }
    float _1081 = _1031;
    float _1083 = _1017;
    float _1085 = _1013;
    float _1087 = _1021;
    float _1089 = _1025;
    float _1091 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1093 = _1081 + _1091;
    float _1095 = _947 * _991;
    float _1097 = _945 * _991;
    float _1099 = _949 * _991;
    float _1101 = -_963;
    float _1103 = _1101 + 1.0;
    float _1105 = fma(_1093, _1093, _1083);
    float _1107 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1109 = _989 + 0.5;
    float _1111 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1097);
    float _1113 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1095);
    float _1115 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1099);
    float _1117 = _1105 + _1085;
    float _1119 = -_995;
    float _1121 = _1119 + 0.5;
    float _1123 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1111);
    float _1125 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1113);
    float _1127 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1115);
    float _1129 = _1109 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1131 = sqrt(_1117);
    float _1133 = _1121 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1135 = _1123 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1137 = _1125 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1139 = _1127 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1141 = _1129 * _969;
    float _1143 = _1133 * _1107;
    float _1145 = _1135 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1147 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1149 = _1139 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _1141;
    out.m_60.y = _1143;
    out.m_62.x = _1145;
    out.m_62.y = _1147;
    out.m_62.z = _1149;
    bool _1151 = _1131 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1153 = isnan(_1131);
    bool _1155 = _1151 || _1153;
    bool _1157 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1159 = _1155 || _1157;
    float _1161 = _1137;
    float _1163 = _1089;
    if (!_1159)
    {
        _1161 = 1.0;
    }
    float _1165 = _1161;
    bool _1167 = !_1159;
    float _1169 = _1165;
    if (!_1167)
    {
        bool _1171 = _1131 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1173 = isnan(_1131);
        bool _1175 = _1171 || _1173;
        bool _1177 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1179 = _1175 || _1177;
        if (!_1179)
        {
            float _1181 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1183 = _1131 + _1181;
            float _1185 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1187 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1185;
            float _1189 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1191 = _1189 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1193 = 1.0 / _1187;
            float _1195 = _1183 * _1193;
            float _1197 = fma(_1195, _1191, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1169 = _1197;
            _1199 = true;
        }
        else
        {
            bool _1201 = _1131 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1203 = isnan(_1131);
            bool _1205 = _1201 || _1203;
            bool _1207 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1209 = _1205 || _1207;
            if (!_1209)
            {
                float _1211 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1213 = _1131 + _1211;
                float _1215 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1217 = _1215 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1219 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1221 = _1219 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1223 = 1.0 / _1217;
                float _1225 = _1213 * _1223;
                float _1227 = fma(_1225, _1221, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1169 = _1227;
                _1199 = true;
            }
            else
            {
                _1169 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1199 = false;
    float _1229 = _1169;
    float _1231 = _965 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1233 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1235 = _1087 + _1233;
    float _1237 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1231);
    float _1239 = _965 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1241 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1243 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan(0.5);
    bool _1249 = _1245 || _1247;
    float _1251 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1253 = _1081 + _1251;
    float _1255 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1237);
    float _1257 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1239);
    bool _1259 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1261 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan(0.5);
    bool _1267 = _1263 || _1265;
    float _1269 = fma(_1235, _1229, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1271 = _1255 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1273 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1257);
    float _1275 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1277 = _1089 + _1275;
    float _1279 = fma(_1253, _1229, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1281 = 1.0 / _1271;
    float _1283 = _1273 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1285 = fma(_1277, _1229, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1287 = _1235;
    float _1289 = _1229;
    float _1291 = _1271;
    if (_1249)
    {
        _1287 = _1269;
    }
    float _1293 = _1287;
    float _1295 = _1283 + _1271;
    float _1297 = _1293;
    if (_1249)
    {
        _1289 = _1279;
    }
    float _1299 = _1289;
    float _1301 = _1299;
    if (_1249)
    {
        _1163 = _1285;
    }
    float _1303 = _1163;
    float _1305 = _1303;
    if (!_1249)
    {
        float _1307 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1309 = _965 + _1307;
        float _1311 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1313 = _865 + _1311;
        float _1315 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1317 = _1309 * _1309;
        float _1319 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1321 = _863 + _1319;
        float _1323 = fma(_1313, _1313, _1317);
        float _1325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1327 = fma(_1321, _1321, _1323);
        float _1329 = sqrt(_1327);
        float _1331 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1333 = -_865;
        float _1335 = _1333 + _1269;
        float _1337 = precise::min(_1329, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1339 = _1337 * _1325;
        float _1341 = -_863;
        float _1343 = _1341 + _1285;
        float _1345 = _1331 * _1339;
        float _1347 = -_965;
        float _1349 = _1347 + _1279;
        float _1351 = fma(_1335, _1345, _865);
        float _1353 = fma(_1349, _1345, _965);
        float _1355 = fma(_1343, _1345, _863);
        _1301 = _1353;
        _1297 = _1351;
        _1305 = _1355;
        _1291 = _1345;
    }
    float _1357 = _1301;
    float _1359 = _1297;
    float _1361 = _1305;
    float _1363 = _1291;
    float _1365 = _1363;
    if (_1267)
    {
        _1007 = 1.0;
    }
    float _1367 = _1007;
    float _1369 = _1295 * _1281;
    float _1371 = _1369 * 0.5;
    float _1373 = _1367;
    if (!_1267)
    {
        float _1375 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1377 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1379 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1377);
        float _1381 = _1375 * 0.15915493667125701904296875;
        float _1383 = _1381 * 6.283185482025146484375;
        float _1385 = cos(_1383);
        float _1387 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1389 = _1387 * 0.15915493667125701904296875;
        float _1391 = _1381 * 6.283185482025146484375;
        float _1393 = sin(_1391);
        float _1395 = 1.0 / _1385;
        float _1397 = _1389 * 6.283185482025146484375;
        float _1399 = cos(_1397);
        float _1401 = _1393 * _1395;
        float _1403 = 1.0 / _1379;
        float _1405 = _1399 * _1401;
        float _1407 = _1389 * 6.283185482025146484375;
        float _1409 = sin(_1407);
        float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1413 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1411;
        float _1415 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1417 = _1403 * _1415;
        float _1419 = 1.0 / _1405;
        float _1421 = 1.0 / _1413;
        float _1423 = _1409 * _1419;
        float _1425 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1427 = fma(_1423, _1417, _1425);
        float _1429 = _1427 * _1421;
        float _1431 = precise::clamp(_1429, 0.0, 1.0);
        _1365 = _1389;
        _1373 = _1431;
    }
    float _1433 = _1365;
    float _1435 = _1373;
    float _1437 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1439 = _1357 + _1437;
    float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1443 = _1359 + _1441;
    float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1447 = _1361 + _1445;
    float _1449 = _1439 * _1439;
    float _1451 = fma(_1443, _1443, _1449);
    float _1453 = fma(_1447, _1447, _1451);
    float _1455 = rsqrt(_1453);
    float _1457 = _1455 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1459 = _1443 * _1457;
    float _1461 = _1447 * _1457;
    float _1463 = _1459 * _1459;
    float _1465 = _1461 * _1461;
    float _1467 = _1463 + _1465;
    float _1469 = sqrt(_1467);
    bool _1471 = _1469 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1473 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1475 = _1469 + _1473;
    float _1477 = _1451;
    float _1479 = _1475;
    float _1481 = _1433;
    float _1483 = _1439;
    float _1485 = _1459;
    if (_1471)
    {
        float _1487 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1477 = _1487;
    }
    float _1489 = _1477;
    float _1491 = _1489;
    if (_1471)
    {
        float _1493 = _1475 * _1489;
        _1479 = _1493;
    }
    float _1495 = _1479;
    if (_1471)
    {
        float _1497 = rsqrt(_1467);
        _1491 = _1497;
    }
    float _1499 = _1491;
    float _1501 = _1499;
    if (_1471)
    {
        float _1503 = _1495 * 0.15915493667125701904296875;
        _1481 = _1503;
    }
    float _1505 = _1481;
    float _1507 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1509 = _1447;
    if (_1471)
    {
        float _1511 = _1505 * 6.283185482025146484375;
        float _1513 = sin(_1511);
        _1509 = _1513;
    }
    float _1515 = _1509;
    float _1517 = precise::max(0.0, _1507);
    float _1519 = _1455;
    float _1521 = _1517;
    if (_1471)
    {
        float _1523 = _1505 * 6.283185482025146484375;
        float _1525 = cos(_1523);
        _1519 = _1525;
    }
    float _1527 = _1519;
    float _1529 = -_1457;
    float _1531 = -_1517;
    float _1533 = fma(_1439, _1529, _1531);
    if (_1471)
    {
        float _1535 = _1533 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1483 = _1535;
    }
    float _1537 = _1483;
    float _1539 = sqrt(_1453);
    float _1541 = _1515;
    float _1543 = _1537;
    if (_1471)
    {
        float _1545 = fma(_1515, _1537, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1541 = _1545;
    }
    float _1547 = _1541;
    float _1549 = _1547;
    if (!_1471)
    {
        _1543 = _1533;
    }
    float _1551 = _1543;
    float _1553 = _1551;
    if (_1471)
    {
        float _1555 = _1499 * _1547;
        _1009 = _1555;
    }
    float _1557 = _1009;
    if (!_1471)
    {
        _1549 = _1463;
    }
    float _1559 = _1549;
    float _1561 = _1559;
    float _1563 = _1527;
    if (_1471)
    {
        float _1565 = _1527 + (-1.0);
        _1521 = _1565;
    }
    float _1567 = _1521;
    float _1569 = _1567;
    if (_1471)
    {
        float _1571 = _1459 * _1557;
        _1485 = _1571;
    }
    float _1573 = _1485;
    if (_1471)
    {
        float _1575 = _1567 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1501 = _1575;
    }
    float _1577 = _1501;
    if (!_1471)
    {
        _1569 = _1461;
    }
    float _1579 = _1569;
    float _1581 = _1579;
    if (_1471)
    {
        float _1583 = _1461 * _1557;
        _1581 = _1583;
    }
    float _1585 = _1581;
    if (_1471)
    {
        float _1587 = _1573 * _1573;
        _1561 = _1587;
    }
    float _1589 = _1561;
    if (_1471)
    {
        float _1591 = fma(_1533, _1527, _1577);
        _1553 = _1591;
    }
    float _1593 = _1553;
    if (!_1471)
    {
        _1563 = _1465;
    }
    float _1595 = _1563;
    float _1597 = _1595;
    if (_1471)
    {
        float _1599 = _1585 * _1585;
        _1597 = _1599;
    }
    float _1601 = _1597;
    float _1603 = fma(_1593, _1593, _1589);
    float _1605 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1607 = _1603 + _1601;
    float _1609 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1611 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1613 = fma(_1539, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1611);
    float _1615 = precise::clamp(_1613, 0.0, 1.0);
    float _1617 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1619 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1609);
    float _1621 = rsqrt(_1607);
    float _1623 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1625 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1617);
    float _1627 = -_1615;
    float _1629 = _1627 + 1.0;
    float _1631 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1633 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1623);
    float _1635 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1625);
    float _1637 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1619);
    float _1639 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1631);
    float _1641 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1633);
    float _1643 = _1635 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1645 = _1637 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1647 = abs(_1629);
    float _1649 = log2(_1647);
    float _1651 = _1641 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1653 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1655 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1639);
    float _1657 = _1621 * _1573;
    float _1659 = _1621 * _1593;
    float _1661 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1653);
    float _1663 = _1645 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1665 = _1657 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1667 = _1621 * _1585;
    float _1669 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1671 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1661);
    float _1673 = -_1665;
    float _1675 = fma(_1659, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1673);
    float _1677 = -_1663;
    float _1679 = fma(_1677, _1605, 1.0);
    float _1681 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1683 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1671);
    float _1685 = -_1667;
    float _1687 = fma(_1685, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1675);
    float _1689 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1691 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1693 = log2(_1679);
    float _1695 = fma(_1687, -0.5, 0.5);
    float _1697 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1689);
    float _1699 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1681);
    float _1701 = _1659 + 1.0;
    float _1703 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1699);
    float _1705 = 1.0 / _1683;
    float _1707 = sqrt(_1695);
    float _1709 = _1693 * 0.693147182464599609375;
    float _1711 = _1709 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1713 = exp2(_1691);
    float _1715 = _1707 * 0.636619746685028076171875;
    float _1717 = fma(_1687, 0.5, 0.5);
    float _1719 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1697);
    float _1721 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1703);
    float _1723 = fma(_1717, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1725 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1719);
    float _1727 = _1721 * _1705;
    float _1729 = -_1659;
    float _1731 = fma(_1713, _1701, _1729);
    float _1733 = fma(_1717, _1723, -0.212114393711090087890625);
    float _1735 = _1725 * _1705;
    float _1737 = fma(_1727, -0.5, 0.5);
    float _1739 = fma(_1731, 0.5, 0.5);
    float _1741 = fma(_1717, _1733, 1.570728778839111328125);
    float _1743 = fma(_1735, 0.5, 0.5);
    float _1745 = -_1741;
    float _1747 = fma(_1715, _1745, 1.0);
    float3 _4598 = float3(_1743, _1737, _1711);
    float _1749 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4598, float3(0.0), isnan(_4598)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4598, float3(0.0), isnan(_4598)), level(0.0)).x;
    float3 _4609 = float3(_1743, _1737, _1711);
    float4 _1752 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4609, float3(0.0), isnan(_4609)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4609, float3(0.0), isnan(_4609)), level(0.0)).xyzw;
    float _1754 = _1752.x;
    float _1756 = _1752.y;
    float _1758 = _1752.z;
    float _1760 = _1752.w;
    float2 _4626 = float2(_1747, _1739);
    float3 _1764 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4626, float2(0.0), isnan(_4626)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4626, float2(0.0), isnan(_4626)), level(0.0)).xyz;
    float _1766 = _1764.x;
    float _1768 = _1764.y;
    float _1770 = _1764.z;
    float _1772 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1774 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1776 = _1435 > 0.0;
    bool _1778 = isnan(_1435);
    bool _1780 = _1776 || _1778;
    bool _1782 = isnan(0.0);
    bool _1784 = _1780 || _1782;
    float _1786 = _1683 * 0.5;
    float _1788 = _1435 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1790 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1774);
    float _1792 = exp2(_1772);
    float _1794 = _1725 + _1683;
    float _1796 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1790);
    float _1798 = fma(_1721, -0.5, _1786);
    float _1800 = _1788 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1802 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1796);
    float _1804 = _1794 * 0.5;
    out.m_47.x = _1800;
    float _1806 = _1802 + _1683;
    out.gl_Position.x = _1725;
    out.gl_Position.y = _1721;
    out.gl_Position.z = _1802;
    out.gl_Position.w = _1683;
    float _1808 = _1806 * 0.5;
    float _1810 = -_1792;
    float _1812 = _1810 + 1.0;
    float _1814 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.x = _1804;
    out.m_64.y = _1798;
    out.m_64.z = _1808;
    out.m_64.w = _1683;
    float _1816 = -_1814;
    float _1818 = _1816 + 1.0;
    float _1820 = _1814 * _1749;
    float _1822 = _1760 * _1818;
    float _1824 = _1760 * _1820;
    float _1826 = _1770 * _1820;
    float _1828 = fma(_1766, _1824, _1754);
    float _1830 = fma(_1768, _1824, _1756);
    float _1832 = fma(_1760, _1826, _1758);
    out.m_66.x = _1828;
    out.m_66.y = _1830;
    out.m_66.z = _1832;
    out.m_66.w = _1822;
    if (_1784)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1834 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1834;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

