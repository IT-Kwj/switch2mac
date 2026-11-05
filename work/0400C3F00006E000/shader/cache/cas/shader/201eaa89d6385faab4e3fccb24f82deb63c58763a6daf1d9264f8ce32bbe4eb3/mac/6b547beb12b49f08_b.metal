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
    float4 m_64 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_68 [[user(locn4)]];
    float4 m_72 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_62 [[attribute(3)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_56 [[attribute(7)]];
    float4 m_54 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _881 = false;
    bool _305 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_44.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_47.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1375 = as_type<float>(_107);
        out.gl_Position.z = _1375;
    }
    if (!_95)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _111 = in.m_49.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_121)
    {
        float _127 = float(_91);
        _101 = _127;
    }
    float _129 = _101;
    bool _131 = _125 >= _129;
    bool _133 = !_121;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1444 = as_type<float>(_143);
        out.gl_Position.z = _1444;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_54.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_49.x;
    float _163 = in.m_49.y;
    float _165 = in.m_49.z;
    float _167 = in.m_44.x;
    float _169 = in.m_44.y;
    float _171 = in.m_44.z;
    float _173 = 0.0;
    float _175 = _147;
    if (!_159)
    {
        float _177 = _147 * _147;
        float _179 = _177 * 0.5;
        _173 = _179;
    }
    float _181 = _173;
    float _183 = _181;
    if (!_159)
    {
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _185;
    }
    float _187 = _183;
    int _189 = as_type<int>(_145) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_145) & 2;
    bool _195 = _193 != 0;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_195;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_159;
    float _207 = _187;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _147 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _147);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _237;
    }
    float _239 = _207;
    bool _241 = !_159;
    if (!_241)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = 1.0 / _249;
        float _253 = _147 * _245;
        float _255 = exp2(_253);
        float _257 = -_255;
        float _259 = _257 + 1.0;
        float _261 = _259 * _251;
        _175 = _261;
    }
    float _263 = _175;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _267 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _273 = fma(_263, _161, _267);
    float _275 = fma(_263, _163, _269);
    float _277 = fma(_263, _165, _271);
    float _279 = fma(_273, _149, _167);
    float _281 = fma(_275, _149, _169);
    float _283 = fma(_277, _149, _171);
    bool _285 = !_265;
    float _303;
    if (!_285)
    {
        float _287 = in.m_56.x;
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _291 = _287 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _295 = _293 * _289;
        float _297 = floor(_295);
        float _299 = -_297;
        float _301 = _295 + _299;
        _303 = _301;
        _305 = true;
    }
    else
    {
        float _307 = float(_91);
        float _309 = 1.0 / _307;
        float _311 = _125 * _309;
        _303 = _311;
    }
    _305 = false;
    float _313 = _303;
    float _315 = in.m_58.x;
    float _317 = in.m_58.y;
    float _319 = in.m_58.z;
    float _321 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _323 = in.m_60.x;
    float _325 = in.m_60.y;
    float _327 = in.m_60.z;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _329;
    float _333 = in.m_62.x;
    float _335 = in.m_62.y;
    float _337 = in.m_62.z;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _343 = _341 != 0;
    float _345 = in.m_56.x;
    float _347 = in.m_56.y;
    int _349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _351 = _349 != 0;
    float _353 = _281 * _317;
    float _355 = _281 * _325;
    float _357 = fma(_279, _315, _353);
    float _359 = _281 * _335;
    float _361 = fma(_279, _323, _355);
    float _363 = fma(_283, _319, _357);
    float _365 = fma(_279, _333, _359);
    float _367 = fma(_283, _327, _361);
    float _369 = _363 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _371 = fma(_283, _337, _365);
    float _373 = _367 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _375 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _377 = _369 + _375;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _383 = _371 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _387 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _389 = _373 + _387;
    float _391 = _377 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _393 = 1.0 / _331;
    float _395 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _397 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _399 = _385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _401 = fma(_389, (*spvDescriptorSet0.vp_c8)._m0[28].x, _391);
    bool _403 = _345 > 0.5;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _411 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _413 = _383 + _411;
    out.m_64.x = _395;
    out.m_64.y = _397;
    out.m_64.z = _399;
    out.m_64.w = _339;
    bool _415 = _347 > 0.5;
    float _417 = _405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _419 = fma(_413, (*spvDescriptorSet0.vp_c8)._m0[28].z, _401);
    float _421 = _407 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _423 = _409 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _425 = -_199;
    int _427 = _403 ? as_type<int>(_425) : as_type<int>(_199);
    float _429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _431 = _419 >= 0.0;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _435 = _313 + _433;
    float _437 = -_203;
    int _439 = _415 ? as_type<int>(_437) : as_type<int>(_203);
    out.m_66.x = _417;
    out.m_66.y = _421;
    out.m_66.z = _423;
    bool _441 = !_343;
    float _443 = _441 ? _199 : as_type<float>(_427);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _449 = _377 * _377;
    bool _451 = !_351;
    float _453 = _451 ? _203 : as_type<float>(_439);
    float _455 = _435 * _393;
    float _457 = _443 + 0.5;
    float _459 = fma(_389, _389, _449);
    float _461 = 1.0 / _447;
    float _463 = -_453;
    float _465 = _463 + 0.5;
    float _467 = _457 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _469 = _399;
    float _471 = _369;
    if (_431)
    {
        _469 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _473 = _469;
    float _475 = fma(_413, _413, _459);
    float _477 = _465 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _479 = _467 * _429;
    float _481 = rsqrt(_475);
    float _483 = _477 * _321;
    int _485 = as_type<int>(_473);
    if (_431)
    {
        float _487 = _473 * 5.0;
        _485 = as_type<int>(_487);
    }
    int _489 = _485;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _493 = _313 + _491;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _499;
    out.m_68.x = _479;
    out.m_68.y = _483;
    float _503 = _493 * _461;
    float _505 = fma(_497, _455, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _507 = fma(_501, _455, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    if (_431)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2053 = as_type<float>(_489);
        out.gl_Position.z = _2053;
    }
    bool _509 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _511 = isnan(_313);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    if (_431)
    {
        out.m_47.x = 0.0;
    }
    float _521 = _377 * _481;
    float _523 = _389 * _481;
    if (_431)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _525 = -_521;
    float _527 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[18].w, _369);
    float _529 = -_523;
    float _531 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[18].w, _373);
    float _533 = _413 * _481;
    bool _535 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _537 = isnan(_313);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _543 = _539 || _541;
    float _545 = float(_543);
    float _547 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _549 = _527 + _547;
    bool _551 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _553 = isnan(_313);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = -_519;
    float _565 = _563 + 1.0;
    float _567 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _569 = _531 + _567;
    float _571 = _549 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _573 = -_533;
    float _575 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[18].w, _383);
    float _577 = _561 * _565;
    float _579 = -_561;
    float _581 = _579 + 1.0;
    float _583 = fma(_569, (*spvDescriptorSet0.vp_c8)._m0[28].x, _571);
    float _585 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _587 = _575 + _585;
    float _589 = -_521;
    float _591 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[18].w, _377);
    float _593 = _545 * _581;
    float _595 = -_523;
    float _597 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[18].w, _389);
    float _599 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[28].z, _583);
    float _601 = _591 * _591;
    float _603 = _505 * _593;
    float _605 = -_533;
    float _607 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[18].w, _413);
    float _609 = _507 * _593;
    float _611 = fma(_597, _597, _601);
    bool _613 = _599 >= 0.0;
    float _615 = in.m_54.x;
    float _617 = in.m_54.y;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _623 = -_545;
    float _625 = _623 + 1.0;
    float _627 = fma(_607, _607, _611);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _633 = fma(_621, _503, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _635 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[143].x, _603);
    float _637 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[143].y, _609);
    float _639 = fma(_631, _503, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _641 = sqrt(_627);
    float _643 = fma(_633, _577, _635);
    float _645 = fma(_639, _577, _637);
    float _647 = _607;
    int _649 = as_type<int>(_645);
    if (_613)
    {
        _647 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _651 = _647;
    float _653 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[145].x, _643);
    if (_613)
    {
        out.m_47.x = 0.0;
    }
    float _655 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[145].y, _645);
    if (_613)
    {
        float _657 = _651 * 5.0;
        _649 = as_type<int>(_657);
    }
    int _659 = _649;
    if (_613)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2319 = as_type<float>(_659);
        out.gl_Position.z = _2319;
    }
    float _661 = _653 * _615;
    float _663 = _655 * _617;
    float _665 = _481 * _641;
    if (_613)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _667 = _663 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _669 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _671 = _661 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _673 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _675 = _665 * _667;
    float _677 = _665 * _671;
    float _679 = _669 * _675;
    float _681 = _673 * _677;
    float _683 = _665 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _685 = _683 * 0.5;
    float _687 = _679 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _689 = _679 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _691 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[24].x, _687);
    float _693 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[26].x, _689);
    float _695 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[24].z, _691);
    float _697 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[26].z, _693);
    float _699 = _695 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _701 = _697 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _703 = _373 + _699;
    float _705 = _383 + _701;
    float _707 = _679 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _709 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _711 = _703 + _709;
    float _713 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _715 = _705 + _713;
    float _717 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[25].x, _707);
    float _719 = _711 * _711;
    float _721 = _715 * _715;
    float _723 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[25].z, _717);
    float _725 = _719 + _721;
    float _727 = _723 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _729 = sqrt(_725);
    float _731 = _369 + _727;
    bool _733 = _729 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _735 = _727;
    float _737 = _685;
    float _739 = _679;
    float _741 = _721;
    float _743 = _725;
    if (!_733)
    {
        _735 = _719;
    }
    float _745 = _735;
    float _747 = _745;
    if (!_733)
    {
        _737 = _703;
    }
    float _749 = _737;
    float _751 = _749;
    if (!_733)
    {
        _471 = _705;
    }
    float _753 = _471;
    float _755 = _753;
    if (!_733)
    {
        _739 = _731;
    }
    float _757 = _739;
    bool _759 = !_733;
    float _761 = _757;
    if (!_759)
    {
        float _763 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _765 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _767 = _729 + _765;
        float _769 = rsqrt(_725);
        float _771 = _767 * _763;
        float _773 = _731 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _775 = _771 * 0.15915493667125701904296875;
        float _777 = _775 * 6.283185482025146484375;
        float _779 = sin(_777);
        float _781 = _775 * 6.283185482025146484375;
        float _783 = cos(_781);
        float _785 = fma(_779, _773, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _787 = _769 * _785;
        float _789 = _783 + (-1.0);
        float _791 = fma(_711, _787, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _793 = fma(_715, _787, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _795 = _789 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _797 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _799 = _791 + _797;
        float _801 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _803 = _793 + _801;
        float _805 = fma(_731, _783, _795);
        float _807 = _799 * _799;
        float _809 = _803 * _803;
        _761 = _805;
        _747 = _807;
        _741 = _809;
        _751 = _791;
        _755 = _793;
    }
    float _811 = _761;
    float _813 = _747;
    float _815 = _741;
    float _817 = _751;
    float _819 = _755;
    float _821 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _823 = _811 + _821;
    float _825 = fma(_823, _823, _813);
    float _827 = _825 + _815;
    float _829 = sqrt(_827);
    bool _831 = _829 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _833 = isnan(_829);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _839 = _835 || _837;
    float _841 = _813;
    float _843 = _827;
    float _845 = _829;
    if (!_839)
    {
        _841 = 1.0;
    }
    float _847 = _841;
    bool _849 = !_839;
    float _851 = _847;
    if (!_849)
    {
        bool _853 = _829 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _855 = isnan(_829);
        bool _857 = _853 || _855;
        bool _859 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _861 = _857 || _859;
        if (!_861)
        {
            float _863 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _865 = _829 + _863;
            float _867 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _869 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _867;
            float _871 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _873 = _871 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _875 = 1.0 / _869;
            float _877 = _865 * _875;
            float _879 = fma(_877, _873, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _851 = _879;
            _843 = _869;
            _881 = true;
        }
        else
        {
            bool _883 = _829 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _885 = isnan(_829);
            bool _887 = _883 || _885;
            bool _889 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _891 = _887 || _889;
            if (!_891)
            {
                float _893 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _895 = _829 + _893;
                float _897 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _899 = _897 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _901 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _903 = _901 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _905 = 1.0 / _899;
                float _907 = _895 * _905;
                float _909 = fma(_907, _903, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _851 = _909;
                _843 = _899;
                _881 = true;
            }
            else
            {
                _851 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _881 = false;
    float _911 = _851;
    float _913 = _843;
    float _915 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _917 = _811 + _915;
    float _919 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _921 = _817 + _919;
    float _923 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _925 = _819 + _923;
    float _927 = fma(_917, _911, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _929 = fma(_921, _911, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _931 = fma(_925, _911, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _933 = -_521;
    float _935 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[18].w, _927);
    float _937 = -_523;
    float _939 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[18].w, _929);
    float _941 = -_533;
    float _943 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[18].w, _931);
    float _945 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _947 = _935 + _945;
    float _949 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _951 = _939 + _949;
    float _953 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _955 = _943 + _953;
    float _957 = _947 * _947;
    float _959 = fma(_951, _951, _957);
    float _961 = fma(_955, _955, _959);
    float _963 = rsqrt(_961);
    float _965 = _963 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _967 = _951 * _965;
    float _969 = _955 * _965;
    float _971 = _967 * _967;
    float _973 = _969 * _969;
    float _975 = _971 + _973;
    float _977 = sqrt(_975);
    bool _979 = _977 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _981 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _983 = _977 + _981;
    float _985 = _963;
    float _987 = _913;
    float _989 = _983;
    float _991 = _947;
    float _993 = _967;
    if (_979)
    {
        float _995 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _985 = _995;
    }
    float _997 = _985;
    if (_979)
    {
        float _999 = rsqrt(_975);
        _987 = _999;
    }
    float _1001 = _987;
    float _1003 = _1001;
    if (_979)
    {
        float _1005 = _983 * _997;
        _989 = _1005;
    }
    float _1007 = _989;
    if (_979)
    {
        float _1009 = _1007 * 0.15915493667125701904296875;
        _845 = _1009;
    }
    float _1011 = _845;
    float _1013 = _955;
    if (_979)
    {
        float _1015 = _1011 * 6.283185482025146484375;
        float _1017 = sin(_1015);
        _1013 = _1017;
    }
    float _1019 = _1013;
    float _1021 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1023 = precise::max(0.0, _1021);
    float _1025 = _997;
    float _1027 = _1023;
    if (_979)
    {
        float _1029 = _1011 * 6.283185482025146484375;
        float _1031 = cos(_1029);
        _1025 = _1031;
    }
    float _1033 = _1025;
    float _1035 = -_965;
    float _1037 = -_1023;
    float _1039 = fma(_947, _1035, _1037);
    if (_979)
    {
        float _1041 = _1039 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _991 = _1041;
    }
    float _1043 = _991;
    float _1045 = sqrt(_961);
    float _1047 = _1043;
    float _1049 = _1019;
    if (_979)
    {
        float _1051 = fma(_1019, _1043, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1047 = _1051;
    }
    float _1053 = _1047;
    float _1055 = _1053;
    if (!_979)
    {
        _1049 = _1039;
    }
    float _1057 = _1049;
    float _1059 = _1057;
    float _1061 = _1033;
    if (_979)
    {
        float _1063 = _1033 + (-1.0);
        _1027 = _1063;
    }
    float _1065 = _1027;
    float _1067 = _1065;
    if (_979)
    {
        float _1069 = _1001 * _1053;
        _743 = _1069;
    }
    float _1071 = _743;
    if (!_979)
    {
        _1055 = _971;
    }
    float _1073 = _1055;
    float _1075 = _935 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1077 = _1073;
    if (_979)
    {
        float _1079 = _1065 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1003 = _1079;
    }
    float _1081 = _1003;
    if (_979)
    {
        float _1083 = _967 * _1071;
        _993 = _1083;
    }
    float _1085 = _993;
    if (!_979)
    {
        _1067 = _969;
    }
    float _1087 = _1067;
    float _1089 = _1087;
    if (_979)
    {
        float _1091 = _969 * _1071;
        _1089 = _1091;
    }
    float _1093 = _1089;
    if (_979)
    {
        float _1095 = fma(_1039, _1033, _1081);
        _1059 = _1095;
    }
    float _1097 = _1059;
    if (_979)
    {
        float _1099 = _1085 * _1085;
        _1077 = _1099;
    }
    float _1101 = _1077;
    if (!_979)
    {
        _1061 = _973;
    }
    float _1103 = _1061;
    float _1105 = _1103;
    if (_979)
    {
        float _1107 = _1093 * _1093;
        _1105 = _1107;
    }
    float _1109 = _1105;
    float _1111 = fma(_1097, _1097, _1101);
    float _1113 = _935 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1115 = _1111 + _1109;
    float _1117 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1119 = fma(_1045, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1117);
    float _1121 = precise::clamp(_1119, 0.0, 1.0);
    float _1123 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1113);
    float _1125 = _935 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1127 = _935 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1129 = -_1121;
    float _1131 = _1129 + 1.0;
    float _1133 = rsqrt(_1115);
    float _1135 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1123);
    float _1137 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1125);
    float _1139 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1141 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1143 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1127);
    float _1145 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1137);
    float _1147 = abs(_1131);
    float _1149 = log2(_1147);
    float _1151 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1075);
    float _1153 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1143);
    float _1155 = _1145 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1157 = _1141 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1159 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1151);
    float _1161 = _1153 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1163 = _1155 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1165 = _1133 * _1085;
    float _1167 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1169 = _1133 * _1097;
    float _1171 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1163);
    float _1173 = _1165 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1175 = _1133 * _1093;
    float _1177 = -_1157;
    float _1179 = fma(_1177, _1139, 1.0);
    float _1181 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1171);
    float _1183 = _1149 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1185 = -_1173;
    float _1187 = fma(_1169, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1185);
    float _1189 = log2(_1179);
    float _1191 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1181);
    float _1193 = _1155 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1195 = -_1175;
    float _1197 = fma(_1195, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1187);
    float _1199 = _1155 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1201 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1193);
    float _1203 = fma(_1197, -0.5, 0.5);
    float _1205 = exp2(_1183);
    float _1207 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1199);
    float _1209 = fma(_1197, 0.5, 0.5);
    float _1211 = _1169 + 1.0;
    float _1213 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1201);
    float _1215 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1207);
    float _1217 = fma(_1209, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1219 = 1.0 / _1191;
    float _1221 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1213);
    float _1223 = fma(_1209, _1217, -0.212114393711090087890625);
    float _1225 = fma(_1209, _1223, 1.570728778839111328125);
    float _1227 = sqrt(_1203);
    float _1229 = -_1169;
    float _1231 = fma(_1205, _1211, _1229);
    float _1233 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1215);
    float _1235 = _1189 * 0.693147182464599609375;
    float _1237 = fma(_1231, 0.5, 0.5);
    float _1239 = _1235 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1241 = _1233 * _1219;
    float _1243 = _1221 * _1219;
    float _1245 = fma(_1241, 0.5, 0.5);
    float _1247 = fma(_1243, -0.5, 0.5);
    float _1249 = _1227 * 0.636619746685028076171875;
    float _1251 = -_1225;
    float _1253 = fma(_1249, _1251, 1.0);
    float3 _3309 = float3(_1245, _1247, _1239);
    float _1255 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3309, float3(0.0), isnan(_3309)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3309, float3(0.0), isnan(_3309)), level(0.0)).x;
    float3 _3320 = float3(_1245, _1247, _1239);
    float4 _1258 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3320, float3(0.0), isnan(_3320)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3320, float3(0.0), isnan(_3320)), level(0.0)).xyzw;
    float _1260 = _1258.x;
    float _1262 = _1258.y;
    float _1264 = _1258.z;
    float _1266 = _1258.w;
    float2 _3337 = float2(_1253, _1237);
    float3 _1270 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3337, float2(0.0), isnan(_3337)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3337, float2(0.0), isnan(_3337)), level(0.0)).xyz;
    float _1272 = _1270.x;
    float _1274 = _1270.y;
    float _1276 = _1270.z;
    float _1278 = _1149 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1280 = _1155 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1282 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1280);
    float _1284 = exp2(_1278);
    float _1286 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1282);
    float _1288 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1286);
    float _1290 = _1288 + _1191;
    out.gl_Position.x = _1233;
    out.gl_Position.y = _1221;
    out.gl_Position.z = _1288;
    out.gl_Position.w = _1191;
    float _1292 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1294 = _1290 * 0.5;
    float _1296 = -_1284;
    float _1298 = _1296 + 1.0;
    out.m_47.x = _1292;
    float _1300 = _1298 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.z = _1294;
    out.m_70.w = _1191;
    float _1302 = _1300 * _1255;
    float _1304 = -_1300;
    float _1306 = _1304 + 1.0;
    float _1308 = _1266 * _1302;
    float _1310 = _1276 * _1302;
    float _1312 = _1266 * _1306;
    float _1314 = fma(_1272, _1308, _1260);
    float _1316 = fma(_1274, _1308, _1262);
    float _1318 = fma(_1266, _1310, _1264);
    out.m_72.x = _1314;
    out.m_72.y = _1316;
    out.m_72.z = _1318;
    out.m_72.w = _1312;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _881 = false;
    bool _305 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_44.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_47.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1375 = as_type<float>(_107);
        out.gl_Position.z = _1375;
    }
    if (!_95)
    {
        return out;
    }
    float _111 = in.m_49.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_121)
    {
        float _127 = float(_91);
        _101 = _127;
    }
    float _129 = _101;
    bool _131 = _125 >= _129;
    bool _133 = !_121;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1444 = as_type<float>(_143);
        out.gl_Position.z = _1444;
    }
    if (_135)
    {
        return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_54.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_49.x;
    float _163 = in.m_49.y;
    float _165 = in.m_49.z;
    float _167 = in.m_44.x;
    float _169 = in.m_44.y;
    float _171 = in.m_44.z;
    float _173 = 0.0;
    float _175 = _147;
    if (!_159)
    {
        float _177 = _147 * _147;
        float _179 = _177 * 0.5;
        _173 = _179;
    }
    float _181 = _173;
    float _183 = _181;
    if (!_159)
    {
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _185;
    }
    float _187 = _183;
    int _189 = as_type<int>(_145) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_145) & 2;
    bool _195 = _193 != 0;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_195;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_159;
    float _207 = _187;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _147 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _147);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _237;
    }
    float _239 = _207;
    bool _241 = !_159;
    if (!_241)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = 1.0 / _249;
        float _253 = _147 * _245;
        float _255 = exp2(_253);
        float _257 = -_255;
        float _259 = _257 + 1.0;
        float _261 = _259 * _251;
        _175 = _261;
    }
    float _263 = _175;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _267 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _273 = fma(_263, _161, _267);
    float _275 = fma(_263, _163, _269);
    float _277 = fma(_263, _165, _271);
    float _279 = fma(_273, _149, _167);
    float _281 = fma(_275, _149, _169);
    float _283 = fma(_277, _149, _171);
    bool _285 = !_265;
    float _303;
    if (!_285)
    {
        float _287 = in.m_56.x;
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _291 = _287 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _295 = _293 * _289;
        float _297 = floor(_295);
        float _299 = -_297;
        float _301 = _295 + _299;
        _303 = _301;
        _305 = true;
    }
    else
    {
        float _307 = float(_91);
        float _309 = 1.0 / _307;
        float _311 = _125 * _309;
        _303 = _311;
    }
    _305 = false;
    float _313 = _303;
    float _315 = in.m_58.x;
    float _317 = in.m_58.y;
    float _319 = in.m_58.z;
    float _321 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _323 = in.m_60.x;
    float _325 = in.m_60.y;
    float _327 = in.m_60.z;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _329;
    float _333 = in.m_62.x;
    float _335 = in.m_62.y;
    float _337 = in.m_62.z;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _343 = _341 != 0;
    float _345 = in.m_56.x;
    float _347 = in.m_56.y;
    int _349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _351 = _349 != 0;
    float _353 = _281 * _317;
    float _355 = _281 * _325;
    float _357 = fma(_279, _315, _353);
    float _359 = _281 * _335;
    float _361 = fma(_279, _323, _355);
    float _363 = fma(_283, _319, _357);
    float _365 = fma(_279, _333, _359);
    float _367 = fma(_283, _327, _361);
    float _369 = _363 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _371 = fma(_283, _337, _365);
    float _373 = _367 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _375 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _377 = _369 + _375;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _383 = _371 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _387 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _389 = _373 + _387;
    float _391 = _377 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _393 = 1.0 / _331;
    float _395 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _397 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _399 = _385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _401 = fma(_389, (*spvDescriptorSet0.vp_c8)._m0[28].x, _391);
    bool _403 = _345 > 0.5;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _411 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _413 = _383 + _411;
    out.m_64.x = _395;
    out.m_64.y = _397;
    out.m_64.z = _399;
    out.m_64.w = _339;
    bool _415 = _347 > 0.5;
    float _417 = _405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _419 = fma(_413, (*spvDescriptorSet0.vp_c8)._m0[28].z, _401);
    float _421 = _407 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _423 = _409 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _425 = -_199;
    int _427 = _403 ? as_type<int>(_425) : as_type<int>(_199);
    float _429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _431 = _419 >= 0.0;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _435 = _313 + _433;
    float _437 = -_203;
    int _439 = _415 ? as_type<int>(_437) : as_type<int>(_203);
    out.m_66.x = _417;
    out.m_66.y = _421;
    out.m_66.z = _423;
    bool _441 = !_343;
    float _443 = _441 ? _199 : as_type<float>(_427);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _449 = _377 * _377;
    bool _451 = !_351;
    float _453 = _451 ? _203 : as_type<float>(_439);
    float _455 = _435 * _393;
    float _457 = _443 + 0.5;
    float _459 = fma(_389, _389, _449);
    float _461 = 1.0 / _447;
    float _463 = -_453;
    float _465 = _463 + 0.5;
    float _467 = _457 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _469 = _399;
    float _471 = _369;
    if (_431)
    {
        _469 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _473 = _469;
    float _475 = fma(_413, _413, _459);
    float _477 = _465 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _479 = _467 * _429;
    float _481 = rsqrt(_475);
    float _483 = _477 * _321;
    int _485 = as_type<int>(_473);
    if (_431)
    {
        float _487 = _473 * 5.0;
        _485 = as_type<int>(_487);
    }
    int _489 = _485;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _493 = _313 + _491;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _499;
    out.m_68.x = _479;
    out.m_68.y = _483;
    float _503 = _493 * _461;
    float _505 = fma(_497, _455, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _507 = fma(_501, _455, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    if (_431)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2053 = as_type<float>(_489);
        out.gl_Position.z = _2053;
    }
    bool _509 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _511 = isnan(_313);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    if (_431)
    {
        out.m_47.x = 0.0;
    }
    float _521 = _377 * _481;
    float _523 = _389 * _481;
    if (_431)
    {
        return out;
    }
    float _525 = -_521;
    float _527 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[18].w, _369);
    float _529 = -_523;
    float _531 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[18].w, _373);
    float _533 = _413 * _481;
    bool _535 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _537 = isnan(_313);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _543 = _539 || _541;
    float _545 = float(_543);
    float _547 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _549 = _527 + _547;
    bool _551 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _553 = isnan(_313);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = -_519;
    float _565 = _563 + 1.0;
    float _567 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _569 = _531 + _567;
    float _571 = _549 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _573 = -_533;
    float _575 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[18].w, _383);
    float _577 = _561 * _565;
    float _579 = -_561;
    float _581 = _579 + 1.0;
    float _583 = fma(_569, (*spvDescriptorSet0.vp_c8)._m0[28].x, _571);
    float _585 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _587 = _575 + _585;
    float _589 = -_521;
    float _591 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[18].w, _377);
    float _593 = _545 * _581;
    float _595 = -_523;
    float _597 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[18].w, _389);
    float _599 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[28].z, _583);
    float _601 = _591 * _591;
    float _603 = _505 * _593;
    float _605 = -_533;
    float _607 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[18].w, _413);
    float _609 = _507 * _593;
    float _611 = fma(_597, _597, _601);
    bool _613 = _599 >= 0.0;
    float _615 = in.m_54.x;
    float _617 = in.m_54.y;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _623 = -_545;
    float _625 = _623 + 1.0;
    float _627 = fma(_607, _607, _611);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _633 = fma(_621, _503, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _635 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[143].x, _603);
    float _637 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[143].y, _609);
    float _639 = fma(_631, _503, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _641 = sqrt(_627);
    float _643 = fma(_633, _577, _635);
    float _645 = fma(_639, _577, _637);
    float _647 = _607;
    int _649 = as_type<int>(_645);
    if (_613)
    {
        _647 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _651 = _647;
    float _653 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[145].x, _643);
    if (_613)
    {
        out.m_47.x = 0.0;
    }
    float _655 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[145].y, _645);
    if (_613)
    {
        float _657 = _651 * 5.0;
        _649 = as_type<int>(_657);
    }
    int _659 = _649;
    if (_613)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2319 = as_type<float>(_659);
        out.gl_Position.z = _2319;
    }
    float _661 = _653 * _615;
    float _663 = _655 * _617;
    float _665 = _481 * _641;
    if (_613)
    {
        return out;
    }
    float _667 = _663 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _669 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _671 = _661 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _673 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _675 = _665 * _667;
    float _677 = _665 * _671;
    float _679 = _669 * _675;
    float _681 = _673 * _677;
    float _683 = _665 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _685 = _683 * 0.5;
    float _687 = _679 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _689 = _679 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _691 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[24].x, _687);
    float _693 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[26].x, _689);
    float _695 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[24].z, _691);
    float _697 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[26].z, _693);
    float _699 = _695 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _701 = _697 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _703 = _373 + _699;
    float _705 = _383 + _701;
    float _707 = _679 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _709 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _711 = _703 + _709;
    float _713 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _715 = _705 + _713;
    float _717 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[25].x, _707);
    float _719 = _711 * _711;
    float _721 = _715 * _715;
    float _723 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[25].z, _717);
    float _725 = _719 + _721;
    float _727 = _723 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _729 = sqrt(_725);
    float _731 = _369 + _727;
    bool _733 = _729 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _735 = _727;
    float _737 = _685;
    float _739 = _679;
    float _741 = _721;
    float _743 = _725;
    if (!_733)
    {
        _735 = _719;
    }
    float _745 = _735;
    float _747 = _745;
    if (!_733)
    {
        _737 = _703;
    }
    float _749 = _737;
    float _751 = _749;
    if (!_733)
    {
        _471 = _705;
    }
    float _753 = _471;
    float _755 = _753;
    if (!_733)
    {
        _739 = _731;
    }
    float _757 = _739;
    bool _759 = !_733;
    float _761 = _757;
    if (!_759)
    {
        float _763 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _765 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _767 = _729 + _765;
        float _769 = rsqrt(_725);
        float _771 = _767 * _763;
        float _773 = _731 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _775 = _771 * 0.15915493667125701904296875;
        float _777 = _775 * 6.283185482025146484375;
        float _779 = sin(_777);
        float _781 = _775 * 6.283185482025146484375;
        float _783 = cos(_781);
        float _785 = fma(_779, _773, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _787 = _769 * _785;
        float _789 = _783 + (-1.0);
        float _791 = fma(_711, _787, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _793 = fma(_715, _787, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _795 = _789 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _797 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _799 = _791 + _797;
        float _801 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _803 = _793 + _801;
        float _805 = fma(_731, _783, _795);
        float _807 = _799 * _799;
        float _809 = _803 * _803;
        _761 = _805;
        _747 = _807;
        _741 = _809;
        _751 = _791;
        _755 = _793;
    }
    float _811 = _761;
    float _813 = _747;
    float _815 = _741;
    float _817 = _751;
    float _819 = _755;
    float _821 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _823 = _811 + _821;
    float _825 = fma(_823, _823, _813);
    float _827 = _825 + _815;
    float _829 = sqrt(_827);
    bool _831 = _829 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _833 = isnan(_829);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _839 = _835 || _837;
    float _841 = _813;
    float _843 = _827;
    float _845 = _829;
    if (!_839)
    {
        _841 = 1.0;
    }
    float _847 = _841;
    bool _849 = !_839;
    float _851 = _847;
    if (!_849)
    {
        bool _853 = _829 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _855 = isnan(_829);
        bool _857 = _853 || _855;
        bool _859 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _861 = _857 || _859;
        if (!_861)
        {
            float _863 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _865 = _829 + _863;
            float _867 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _869 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _867;
            float _871 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _873 = _871 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _875 = 1.0 / _869;
            float _877 = _865 * _875;
            float _879 = fma(_877, _873, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _851 = _879;
            _843 = _869;
            _881 = true;
        }
        else
        {
            bool _883 = _829 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _885 = isnan(_829);
            bool _887 = _883 || _885;
            bool _889 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _891 = _887 || _889;
            if (!_891)
            {
                float _893 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _895 = _829 + _893;
                float _897 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _899 = _897 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _901 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _903 = _901 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _905 = 1.0 / _899;
                float _907 = _895 * _905;
                float _909 = fma(_907, _903, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _851 = _909;
                _843 = _899;
                _881 = true;
            }
            else
            {
                _851 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _881 = false;
    float _911 = _851;
    float _913 = _843;
    float _915 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _917 = _811 + _915;
    float _919 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _921 = _817 + _919;
    float _923 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _925 = _819 + _923;
    float _927 = fma(_917, _911, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _929 = fma(_921, _911, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _931 = fma(_925, _911, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _933 = -_521;
    float _935 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[18].w, _927);
    float _937 = -_523;
    float _939 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[18].w, _929);
    float _941 = -_533;
    float _943 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[18].w, _931);
    float _945 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _947 = _935 + _945;
    float _949 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _951 = _939 + _949;
    float _953 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _955 = _943 + _953;
    float _957 = _947 * _947;
    float _959 = fma(_951, _951, _957);
    float _961 = fma(_955, _955, _959);
    float _963 = rsqrt(_961);
    float _965 = _963 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _967 = _951 * _965;
    float _969 = _955 * _965;
    float _971 = _967 * _967;
    float _973 = _969 * _969;
    float _975 = _971 + _973;
    float _977 = sqrt(_975);
    bool _979 = _977 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _981 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _983 = _977 + _981;
    float _985 = _963;
    float _987 = _913;
    float _989 = _983;
    float _991 = _947;
    float _993 = _967;
    if (_979)
    {
        float _995 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _985 = _995;
    }
    float _997 = _985;
    if (_979)
    {
        float _999 = rsqrt(_975);
        _987 = _999;
    }
    float _1001 = _987;
    float _1003 = _1001;
    if (_979)
    {
        float _1005 = _983 * _997;
        _989 = _1005;
    }
    float _1007 = _989;
    if (_979)
    {
        float _1009 = _1007 * 0.15915493667125701904296875;
        _845 = _1009;
    }
    float _1011 = _845;
    float _1013 = _955;
    if (_979)
    {
        float _1015 = _1011 * 6.283185482025146484375;
        float _1017 = sin(_1015);
        _1013 = _1017;
    }
    float _1019 = _1013;
    float _1021 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1023 = precise::max(0.0, _1021);
    float _1025 = _997;
    float _1027 = _1023;
    if (_979)
    {
        float _1029 = _1011 * 6.283185482025146484375;
        float _1031 = cos(_1029);
        _1025 = _1031;
    }
    float _1033 = _1025;
    float _1035 = -_965;
    float _1037 = -_1023;
    float _1039 = fma(_947, _1035, _1037);
    if (_979)
    {
        float _1041 = _1039 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _991 = _1041;
    }
    float _1043 = _991;
    float _1045 = sqrt(_961);
    float _1047 = _1043;
    float _1049 = _1019;
    if (_979)
    {
        float _1051 = fma(_1019, _1043, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1047 = _1051;
    }
    float _1053 = _1047;
    float _1055 = _1053;
    if (!_979)
    {
        _1049 = _1039;
    }
    float _1057 = _1049;
    float _1059 = _1057;
    float _1061 = _1033;
    if (_979)
    {
        float _1063 = _1033 + (-1.0);
        _1027 = _1063;
    }
    float _1065 = _1027;
    float _1067 = _1065;
    if (_979)
    {
        float _1069 = _1001 * _1053;
        _743 = _1069;
    }
    float _1071 = _743;
    if (!_979)
    {
        _1055 = _971;
    }
    float _1073 = _1055;
    float _1075 = _935 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1077 = _1073;
    if (_979)
    {
        float _1079 = _1065 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1003 = _1079;
    }
    float _1081 = _1003;
    if (_979)
    {
        float _1083 = _967 * _1071;
        _993 = _1083;
    }
    float _1085 = _993;
    if (!_979)
    {
        _1067 = _969;
    }
    float _1087 = _1067;
    float _1089 = _1087;
    if (_979)
    {
        float _1091 = _969 * _1071;
        _1089 = _1091;
    }
    float _1093 = _1089;
    if (_979)
    {
        float _1095 = fma(_1039, _1033, _1081);
        _1059 = _1095;
    }
    float _1097 = _1059;
    if (_979)
    {
        float _1099 = _1085 * _1085;
        _1077 = _1099;
    }
    float _1101 = _1077;
    if (!_979)
    {
        _1061 = _973;
    }
    float _1103 = _1061;
    float _1105 = _1103;
    if (_979)
    {
        float _1107 = _1093 * _1093;
        _1105 = _1107;
    }
    float _1109 = _1105;
    float _1111 = fma(_1097, _1097, _1101);
    float _1113 = _935 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1115 = _1111 + _1109;
    float _1117 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1119 = fma(_1045, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1117);
    float _1121 = precise::clamp(_1119, 0.0, 1.0);
    float _1123 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1113);
    float _1125 = _935 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1127 = _935 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1129 = -_1121;
    float _1131 = _1129 + 1.0;
    float _1133 = rsqrt(_1115);
    float _1135 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1123);
    float _1137 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1125);
    float _1139 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1141 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1143 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1127);
    float _1145 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1137);
    float _1147 = abs(_1131);
    float _1149 = log2(_1147);
    float _1151 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1075);
    float _1153 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1143);
    float _1155 = _1145 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1157 = _1141 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1159 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1151);
    float _1161 = _1153 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1163 = _1155 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1165 = _1133 * _1085;
    float _1167 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1169 = _1133 * _1097;
    float _1171 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1163);
    float _1173 = _1165 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1175 = _1133 * _1093;
    float _1177 = -_1157;
    float _1179 = fma(_1177, _1139, 1.0);
    float _1181 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1171);
    float _1183 = _1149 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1185 = -_1173;
    float _1187 = fma(_1169, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1185);
    float _1189 = log2(_1179);
    float _1191 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1181);
    float _1193 = _1155 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1195 = -_1175;
    float _1197 = fma(_1195, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1187);
    float _1199 = _1155 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1201 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1193);
    float _1203 = fma(_1197, -0.5, 0.5);
    float _1205 = exp2(_1183);
    float _1207 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1199);
    float _1209 = fma(_1197, 0.5, 0.5);
    float _1211 = _1169 + 1.0;
    float _1213 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1201);
    float _1215 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1207);
    float _1217 = fma(_1209, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1219 = 1.0 / _1191;
    float _1221 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1213);
    float _1223 = fma(_1209, _1217, -0.212114393711090087890625);
    float _1225 = fma(_1209, _1223, 1.570728778839111328125);
    float _1227 = sqrt(_1203);
    float _1229 = -_1169;
    float _1231 = fma(_1205, _1211, _1229);
    float _1233 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1215);
    float _1235 = _1189 * 0.693147182464599609375;
    float _1237 = fma(_1231, 0.5, 0.5);
    float _1239 = _1235 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1241 = _1233 * _1219;
    float _1243 = _1221 * _1219;
    float _1245 = fma(_1241, 0.5, 0.5);
    float _1247 = fma(_1243, -0.5, 0.5);
    float _1249 = _1227 * 0.636619746685028076171875;
    float _1251 = -_1225;
    float _1253 = fma(_1249, _1251, 1.0);
    float3 _3309 = float3(_1245, _1247, _1239);
    float _1255 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3309, float3(0.0), isnan(_3309)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3309, float3(0.0), isnan(_3309)), level(0.0)).x;
    float3 _3320 = float3(_1245, _1247, _1239);
    float4 _1258 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3320, float3(0.0), isnan(_3320)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3320, float3(0.0), isnan(_3320)), level(0.0)).xyzw;
    float _1260 = _1258.x;
    float _1262 = _1258.y;
    float _1264 = _1258.z;
    float _1266 = _1258.w;
    float2 _3337 = float2(_1253, _1237);
    float3 _1270 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3337, float2(0.0), isnan(_3337)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3337, float2(0.0), isnan(_3337)), level(0.0)).xyz;
    float _1272 = _1270.x;
    float _1274 = _1270.y;
    float _1276 = _1270.z;
    float _1278 = _1149 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1280 = _1155 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1282 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1280);
    float _1284 = exp2(_1278);
    float _1286 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1282);
    float _1288 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1286);
    float _1290 = _1288 + _1191;
    out.gl_Position.x = _1233;
    out.gl_Position.y = _1221;
    out.gl_Position.z = _1288;
    out.gl_Position.w = _1191;
    float _1292 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1294 = _1290 * 0.5;
    float _1296 = -_1284;
    float _1298 = _1296 + 1.0;
    out.m_47.x = _1292;
    float _1300 = _1298 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.z = _1294;
    out.m_70.w = _1191;
    float _1302 = _1300 * _1255;
    float _1304 = -_1300;
    float _1306 = _1304 + 1.0;
    float _1308 = _1266 * _1302;
    float _1310 = _1276 * _1302;
    float _1312 = _1266 * _1306;
    float _1314 = fma(_1272, _1308, _1260);
    float _1316 = fma(_1274, _1308, _1262);
    float _1318 = fma(_1266, _1310, _1264);
    out.m_72.x = _1314;
    out.m_72.y = _1316;
    out.m_72.z = _1318;
    out.m_72.w = _1312;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _881 = false;
    bool _305 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_44.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_47.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1375 = as_type<float>(_107);
        out.gl_Position.z = _1375;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _111 = in.m_49.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_121)
    {
        float _127 = float(_91);
        _101 = _127;
    }
    float _129 = _101;
    bool _131 = _125 >= _129;
    bool _133 = !_121;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1444 = as_type<float>(_143);
        out.gl_Position.z = _1444;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_54.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_49.x;
    float _163 = in.m_49.y;
    float _165 = in.m_49.z;
    float _167 = in.m_44.x;
    float _169 = in.m_44.y;
    float _171 = in.m_44.z;
    float _173 = 0.0;
    float _175 = _147;
    if (!_159)
    {
        float _177 = _147 * _147;
        float _179 = _177 * 0.5;
        _173 = _179;
    }
    float _181 = _173;
    float _183 = _181;
    if (!_159)
    {
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _185;
    }
    float _187 = _183;
    int _189 = as_type<int>(_145) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_145) & 2;
    bool _195 = _193 != 0;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_195;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_159;
    float _207 = _187;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _147 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _147);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _237;
    }
    float _239 = _207;
    bool _241 = !_159;
    if (!_241)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = 1.0 / _249;
        float _253 = _147 * _245;
        float _255 = exp2(_253);
        float _257 = -_255;
        float _259 = _257 + 1.0;
        float _261 = _259 * _251;
        _175 = _261;
    }
    float _263 = _175;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _267 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _273 = fma(_263, _161, _267);
    float _275 = fma(_263, _163, _269);
    float _277 = fma(_263, _165, _271);
    float _279 = fma(_273, _149, _167);
    float _281 = fma(_275, _149, _169);
    float _283 = fma(_277, _149, _171);
    bool _285 = !_265;
    float _303;
    if (!_285)
    {
        float _287 = in.m_56.x;
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _291 = _287 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _295 = _293 * _289;
        float _297 = floor(_295);
        float _299 = -_297;
        float _301 = _295 + _299;
        _303 = _301;
        _305 = true;
    }
    else
    {
        float _307 = float(_91);
        float _309 = 1.0 / _307;
        float _311 = _125 * _309;
        _303 = _311;
    }
    _305 = false;
    float _313 = _303;
    float _315 = in.m_58.x;
    float _317 = in.m_58.y;
    float _319 = in.m_58.z;
    float _321 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _323 = in.m_60.x;
    float _325 = in.m_60.y;
    float _327 = in.m_60.z;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _329;
    float _333 = in.m_62.x;
    float _335 = in.m_62.y;
    float _337 = in.m_62.z;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _343 = _341 != 0;
    float _345 = in.m_56.x;
    float _347 = in.m_56.y;
    int _349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _351 = _349 != 0;
    float _353 = _281 * _317;
    float _355 = _281 * _325;
    float _357 = fma(_279, _315, _353);
    float _359 = _281 * _335;
    float _361 = fma(_279, _323, _355);
    float _363 = fma(_283, _319, _357);
    float _365 = fma(_279, _333, _359);
    float _367 = fma(_283, _327, _361);
    float _369 = _363 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _371 = fma(_283, _337, _365);
    float _373 = _367 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _375 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _377 = _369 + _375;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _383 = _371 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _387 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _389 = _373 + _387;
    float _391 = _377 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _393 = 1.0 / _331;
    float _395 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _397 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _399 = _385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _401 = fma(_389, (*spvDescriptorSet0.vp_c8)._m0[28].x, _391);
    bool _403 = _345 > 0.5;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _411 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _413 = _383 + _411;
    out.m_64.x = _395;
    out.m_64.y = _397;
    out.m_64.z = _399;
    out.m_64.w = _339;
    bool _415 = _347 > 0.5;
    float _417 = _405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _419 = fma(_413, (*spvDescriptorSet0.vp_c8)._m0[28].z, _401);
    float _421 = _407 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _423 = _409 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _425 = -_199;
    int _427 = _403 ? as_type<int>(_425) : as_type<int>(_199);
    float _429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _431 = _419 >= 0.0;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _435 = _313 + _433;
    float _437 = -_203;
    int _439 = _415 ? as_type<int>(_437) : as_type<int>(_203);
    out.m_66.x = _417;
    out.m_66.y = _421;
    out.m_66.z = _423;
    bool _441 = !_343;
    float _443 = _441 ? _199 : as_type<float>(_427);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _449 = _377 * _377;
    bool _451 = !_351;
    float _453 = _451 ? _203 : as_type<float>(_439);
    float _455 = _435 * _393;
    float _457 = _443 + 0.5;
    float _459 = fma(_389, _389, _449);
    float _461 = 1.0 / _447;
    float _463 = -_453;
    float _465 = _463 + 0.5;
    float _467 = _457 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _469 = _399;
    float _471 = _369;
    if (_431)
    {
        _469 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _473 = _469;
    float _475 = fma(_413, _413, _459);
    float _477 = _465 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _479 = _467 * _429;
    float _481 = rsqrt(_475);
    float _483 = _477 * _321;
    int _485 = as_type<int>(_473);
    if (_431)
    {
        float _487 = _473 * 5.0;
        _485 = as_type<int>(_487);
    }
    int _489 = _485;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _493 = _313 + _491;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _499;
    out.m_68.x = _479;
    out.m_68.y = _483;
    float _503 = _493 * _461;
    float _505 = fma(_497, _455, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _507 = fma(_501, _455, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    if (_431)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2053 = as_type<float>(_489);
        out.gl_Position.z = _2053;
    }
    bool _509 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _511 = isnan(_313);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    if (_431)
    {
        out.m_47.x = 0.0;
    }
    float _521 = _377 * _481;
    float _523 = _389 * _481;
    if (_431)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _525 = -_521;
    float _527 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[18].w, _369);
    float _529 = -_523;
    float _531 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[18].w, _373);
    float _533 = _413 * _481;
    bool _535 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _537 = isnan(_313);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _543 = _539 || _541;
    float _545 = float(_543);
    float _547 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _549 = _527 + _547;
    bool _551 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _553 = isnan(_313);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = -_519;
    float _565 = _563 + 1.0;
    float _567 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _569 = _531 + _567;
    float _571 = _549 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _573 = -_533;
    float _575 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[18].w, _383);
    float _577 = _561 * _565;
    float _579 = -_561;
    float _581 = _579 + 1.0;
    float _583 = fma(_569, (*spvDescriptorSet0.vp_c8)._m0[28].x, _571);
    float _585 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _587 = _575 + _585;
    float _589 = -_521;
    float _591 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[18].w, _377);
    float _593 = _545 * _581;
    float _595 = -_523;
    float _597 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[18].w, _389);
    float _599 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[28].z, _583);
    float _601 = _591 * _591;
    float _603 = _505 * _593;
    float _605 = -_533;
    float _607 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[18].w, _413);
    float _609 = _507 * _593;
    float _611 = fma(_597, _597, _601);
    bool _613 = _599 >= 0.0;
    float _615 = in.m_54.x;
    float _617 = in.m_54.y;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _623 = -_545;
    float _625 = _623 + 1.0;
    float _627 = fma(_607, _607, _611);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _633 = fma(_621, _503, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _635 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[143].x, _603);
    float _637 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[143].y, _609);
    float _639 = fma(_631, _503, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _641 = sqrt(_627);
    float _643 = fma(_633, _577, _635);
    float _645 = fma(_639, _577, _637);
    float _647 = _607;
    int _649 = as_type<int>(_645);
    if (_613)
    {
        _647 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _651 = _647;
    float _653 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[145].x, _643);
    if (_613)
    {
        out.m_47.x = 0.0;
    }
    float _655 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[145].y, _645);
    if (_613)
    {
        float _657 = _651 * 5.0;
        _649 = as_type<int>(_657);
    }
    int _659 = _649;
    if (_613)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2319 = as_type<float>(_659);
        out.gl_Position.z = _2319;
    }
    float _661 = _653 * _615;
    float _663 = _655 * _617;
    float _665 = _481 * _641;
    if (_613)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _667 = _663 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _669 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _671 = _661 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _673 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _675 = _665 * _667;
    float _677 = _665 * _671;
    float _679 = _669 * _675;
    float _681 = _673 * _677;
    float _683 = _665 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _685 = _683 * 0.5;
    float _687 = _679 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _689 = _679 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _691 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[24].x, _687);
    float _693 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[26].x, _689);
    float _695 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[24].z, _691);
    float _697 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[26].z, _693);
    float _699 = _695 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _701 = _697 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _703 = _373 + _699;
    float _705 = _383 + _701;
    float _707 = _679 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _709 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _711 = _703 + _709;
    float _713 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _715 = _705 + _713;
    float _717 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[25].x, _707);
    float _719 = _711 * _711;
    float _721 = _715 * _715;
    float _723 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[25].z, _717);
    float _725 = _719 + _721;
    float _727 = _723 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _729 = sqrt(_725);
    float _731 = _369 + _727;
    bool _733 = _729 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _735 = _727;
    float _737 = _685;
    float _739 = _679;
    float _741 = _721;
    float _743 = _725;
    if (!_733)
    {
        _735 = _719;
    }
    float _745 = _735;
    float _747 = _745;
    if (!_733)
    {
        _737 = _703;
    }
    float _749 = _737;
    float _751 = _749;
    if (!_733)
    {
        _471 = _705;
    }
    float _753 = _471;
    float _755 = _753;
    if (!_733)
    {
        _739 = _731;
    }
    float _757 = _739;
    bool _759 = !_733;
    float _761 = _757;
    if (!_759)
    {
        float _763 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _765 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _767 = _729 + _765;
        float _769 = rsqrt(_725);
        float _771 = _767 * _763;
        float _773 = _731 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _775 = _771 * 0.15915493667125701904296875;
        float _777 = _775 * 6.283185482025146484375;
        float _779 = sin(_777);
        float _781 = _775 * 6.283185482025146484375;
        float _783 = cos(_781);
        float _785 = fma(_779, _773, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _787 = _769 * _785;
        float _789 = _783 + (-1.0);
        float _791 = fma(_711, _787, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _793 = fma(_715, _787, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _795 = _789 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _797 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _799 = _791 + _797;
        float _801 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _803 = _793 + _801;
        float _805 = fma(_731, _783, _795);
        float _807 = _799 * _799;
        float _809 = _803 * _803;
        _761 = _805;
        _747 = _807;
        _741 = _809;
        _751 = _791;
        _755 = _793;
    }
    float _811 = _761;
    float _813 = _747;
    float _815 = _741;
    float _817 = _751;
    float _819 = _755;
    float _821 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _823 = _811 + _821;
    float _825 = fma(_823, _823, _813);
    float _827 = _825 + _815;
    float _829 = sqrt(_827);
    bool _831 = _829 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _833 = isnan(_829);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _839 = _835 || _837;
    float _841 = _813;
    float _843 = _827;
    float _845 = _829;
    if (!_839)
    {
        _841 = 1.0;
    }
    float _847 = _841;
    bool _849 = !_839;
    float _851 = _847;
    if (!_849)
    {
        bool _853 = _829 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _855 = isnan(_829);
        bool _857 = _853 || _855;
        bool _859 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _861 = _857 || _859;
        if (!_861)
        {
            float _863 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _865 = _829 + _863;
            float _867 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _869 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _867;
            float _871 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _873 = _871 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _875 = 1.0 / _869;
            float _877 = _865 * _875;
            float _879 = fma(_877, _873, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _851 = _879;
            _843 = _869;
            _881 = true;
        }
        else
        {
            bool _883 = _829 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _885 = isnan(_829);
            bool _887 = _883 || _885;
            bool _889 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _891 = _887 || _889;
            if (!_891)
            {
                float _893 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _895 = _829 + _893;
                float _897 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _899 = _897 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _901 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _903 = _901 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _905 = 1.0 / _899;
                float _907 = _895 * _905;
                float _909 = fma(_907, _903, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _851 = _909;
                _843 = _899;
                _881 = true;
            }
            else
            {
                _851 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _881 = false;
    float _911 = _851;
    float _913 = _843;
    float _915 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _917 = _811 + _915;
    float _919 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _921 = _817 + _919;
    float _923 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _925 = _819 + _923;
    float _927 = fma(_917, _911, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _929 = fma(_921, _911, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _931 = fma(_925, _911, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _933 = -_521;
    float _935 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[18].w, _927);
    float _937 = -_523;
    float _939 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[18].w, _929);
    float _941 = -_533;
    float _943 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[18].w, _931);
    float _945 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _947 = _935 + _945;
    float _949 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _951 = _939 + _949;
    float _953 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _955 = _943 + _953;
    float _957 = _947 * _947;
    float _959 = fma(_951, _951, _957);
    float _961 = fma(_955, _955, _959);
    float _963 = rsqrt(_961);
    float _965 = _963 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _967 = _951 * _965;
    float _969 = _955 * _965;
    float _971 = _967 * _967;
    float _973 = _969 * _969;
    float _975 = _971 + _973;
    float _977 = sqrt(_975);
    bool _979 = _977 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _981 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _983 = _977 + _981;
    float _985 = _963;
    float _987 = _913;
    float _989 = _983;
    float _991 = _947;
    float _993 = _967;
    if (_979)
    {
        float _995 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _985 = _995;
    }
    float _997 = _985;
    if (_979)
    {
        float _999 = rsqrt(_975);
        _987 = _999;
    }
    float _1001 = _987;
    float _1003 = _1001;
    if (_979)
    {
        float _1005 = _983 * _997;
        _989 = _1005;
    }
    float _1007 = _989;
    if (_979)
    {
        float _1009 = _1007 * 0.15915493667125701904296875;
        _845 = _1009;
    }
    float _1011 = _845;
    float _1013 = _955;
    if (_979)
    {
        float _1015 = _1011 * 6.283185482025146484375;
        float _1017 = sin(_1015);
        _1013 = _1017;
    }
    float _1019 = _1013;
    float _1021 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1023 = precise::max(0.0, _1021);
    float _1025 = _997;
    float _1027 = _1023;
    if (_979)
    {
        float _1029 = _1011 * 6.283185482025146484375;
        float _1031 = cos(_1029);
        _1025 = _1031;
    }
    float _1033 = _1025;
    float _1035 = -_965;
    float _1037 = -_1023;
    float _1039 = fma(_947, _1035, _1037);
    if (_979)
    {
        float _1041 = _1039 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _991 = _1041;
    }
    float _1043 = _991;
    float _1045 = sqrt(_961);
    float _1047 = _1043;
    float _1049 = _1019;
    if (_979)
    {
        float _1051 = fma(_1019, _1043, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1047 = _1051;
    }
    float _1053 = _1047;
    float _1055 = _1053;
    if (!_979)
    {
        _1049 = _1039;
    }
    float _1057 = _1049;
    float _1059 = _1057;
    float _1061 = _1033;
    if (_979)
    {
        float _1063 = _1033 + (-1.0);
        _1027 = _1063;
    }
    float _1065 = _1027;
    float _1067 = _1065;
    if (_979)
    {
        float _1069 = _1001 * _1053;
        _743 = _1069;
    }
    float _1071 = _743;
    if (!_979)
    {
        _1055 = _971;
    }
    float _1073 = _1055;
    float _1075 = _935 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1077 = _1073;
    if (_979)
    {
        float _1079 = _1065 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1003 = _1079;
    }
    float _1081 = _1003;
    if (_979)
    {
        float _1083 = _967 * _1071;
        _993 = _1083;
    }
    float _1085 = _993;
    if (!_979)
    {
        _1067 = _969;
    }
    float _1087 = _1067;
    float _1089 = _1087;
    if (_979)
    {
        float _1091 = _969 * _1071;
        _1089 = _1091;
    }
    float _1093 = _1089;
    if (_979)
    {
        float _1095 = fma(_1039, _1033, _1081);
        _1059 = _1095;
    }
    float _1097 = _1059;
    if (_979)
    {
        float _1099 = _1085 * _1085;
        _1077 = _1099;
    }
    float _1101 = _1077;
    if (!_979)
    {
        _1061 = _973;
    }
    float _1103 = _1061;
    float _1105 = _1103;
    if (_979)
    {
        float _1107 = _1093 * _1093;
        _1105 = _1107;
    }
    float _1109 = _1105;
    float _1111 = fma(_1097, _1097, _1101);
    float _1113 = _935 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1115 = _1111 + _1109;
    float _1117 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1119 = fma(_1045, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1117);
    float _1121 = precise::clamp(_1119, 0.0, 1.0);
    float _1123 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1113);
    float _1125 = _935 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1127 = _935 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1129 = -_1121;
    float _1131 = _1129 + 1.0;
    float _1133 = rsqrt(_1115);
    float _1135 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1123);
    float _1137 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1125);
    float _1139 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1141 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1143 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1127);
    float _1145 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1137);
    float _1147 = abs(_1131);
    float _1149 = log2(_1147);
    float _1151 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1075);
    float _1153 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1143);
    float _1155 = _1145 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1157 = _1141 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1159 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1151);
    float _1161 = _1153 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1163 = _1155 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1165 = _1133 * _1085;
    float _1167 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1169 = _1133 * _1097;
    float _1171 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1163);
    float _1173 = _1165 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1175 = _1133 * _1093;
    float _1177 = -_1157;
    float _1179 = fma(_1177, _1139, 1.0);
    float _1181 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1171);
    float _1183 = _1149 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1185 = -_1173;
    float _1187 = fma(_1169, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1185);
    float _1189 = log2(_1179);
    float _1191 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1181);
    float _1193 = _1155 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1195 = -_1175;
    float _1197 = fma(_1195, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1187);
    float _1199 = _1155 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1201 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1193);
    float _1203 = fma(_1197, -0.5, 0.5);
    float _1205 = exp2(_1183);
    float _1207 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1199);
    float _1209 = fma(_1197, 0.5, 0.5);
    float _1211 = _1169 + 1.0;
    float _1213 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1201);
    float _1215 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1207);
    float _1217 = fma(_1209, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1219 = 1.0 / _1191;
    float _1221 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1213);
    float _1223 = fma(_1209, _1217, -0.212114393711090087890625);
    float _1225 = fma(_1209, _1223, 1.570728778839111328125);
    float _1227 = sqrt(_1203);
    float _1229 = -_1169;
    float _1231 = fma(_1205, _1211, _1229);
    float _1233 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1215);
    float _1235 = _1189 * 0.693147182464599609375;
    float _1237 = fma(_1231, 0.5, 0.5);
    float _1239 = _1235 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1241 = _1233 * _1219;
    float _1243 = _1221 * _1219;
    float _1245 = fma(_1241, 0.5, 0.5);
    float _1247 = fma(_1243, -0.5, 0.5);
    float _1249 = _1227 * 0.636619746685028076171875;
    float _1251 = -_1225;
    float _1253 = fma(_1249, _1251, 1.0);
    float3 _3309 = float3(_1245, _1247, _1239);
    float _1255 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3309, float3(0.0), isnan(_3309)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3309, float3(0.0), isnan(_3309)), level(0.0)).x;
    float3 _3320 = float3(_1245, _1247, _1239);
    float4 _1258 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3320, float3(0.0), isnan(_3320)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3320, float3(0.0), isnan(_3320)), level(0.0)).xyzw;
    float _1260 = _1258.x;
    float _1262 = _1258.y;
    float _1264 = _1258.z;
    float _1266 = _1258.w;
    float2 _3337 = float2(_1253, _1237);
    float3 _1270 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3337, float2(0.0), isnan(_3337)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3337, float2(0.0), isnan(_3337)), level(0.0)).xyz;
    float _1272 = _1270.x;
    float _1274 = _1270.y;
    float _1276 = _1270.z;
    float _1278 = _1149 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1280 = _1155 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1282 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1280);
    float _1284 = exp2(_1278);
    float _1286 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1282);
    float _1288 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1286);
    float _1290 = _1288 + _1191;
    out.gl_Position.x = _1233;
    out.gl_Position.y = _1221;
    out.gl_Position.z = _1288;
    out.gl_Position.w = _1191;
    float _1292 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1294 = _1290 * 0.5;
    float _1296 = -_1284;
    float _1298 = _1296 + 1.0;
    out.m_47.x = _1292;
    float _1300 = _1298 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.z = _1294;
    out.m_70.w = _1191;
    float _1302 = _1300 * _1255;
    float _1304 = -_1300;
    float _1306 = _1304 + 1.0;
    float _1308 = _1266 * _1302;
    float _1310 = _1276 * _1302;
    float _1312 = _1266 * _1306;
    float _1314 = fma(_1272, _1308, _1260);
    float _1316 = fma(_1274, _1308, _1262);
    float _1318 = fma(_1266, _1310, _1264);
    out.m_72.x = _1314;
    out.m_72.y = _1316;
    out.m_72.z = _1318;
    out.m_72.w = _1312;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

