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
    float4 m_57 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_62 [[user(locn4)]];
    float4 m_70 [[user(locn5)]];
    float4 m_66 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_51 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1475 = false;
    bool _759 = false;
    bool _579 = false;
    bool _295 = false;
    bool _193 = false;
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
    if (!_95)
    {
        out.m_47.x = 0.0;
    }
    int _101 = 0;
    if (!_95)
    {
        float _103 = _99 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2344 = as_type<float>(_105);
        out.gl_Position.z = _2344;
    }
    if (!_95)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    if (_119)
    {
        float _127 = float(_91);
        _125 = _127;
    }
    float _129 = _125;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
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
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2413 = as_type<float>(_143);
        out.gl_Position.z = _2413;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = in.m_51.x;
    float _147 = in.m_51.y;
    float _149 = in.m_51.z;
    bool _151 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _153 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _155 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _157 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _159 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _153);
    float _161 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _155);
    float _163 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _157);
    float _165 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _159);
    float _167 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _161);
    float _169 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _163);
    bool _171 = !_151;
    float _173 = _169;
    float _191;
    if (!_171)
    {
        float _175 = in.m_53.x;
        float _177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _181 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _183 = _181 * _177;
        float _185 = floor(_183);
        float _187 = -_185;
        float _189 = _183 + _187;
        _191 = _189;
        _193 = true;
    }
    else
    {
        float _195 = float(_91);
        float _197 = 1.0 / _195;
        float _199 = _123 * _197;
        _191 = _199;
    }
    _193 = false;
    float _201 = _191;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = _201 + _203;
    bool _207 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _209 = isnan(_201);
    bool _211 = _207 || _209;
    bool _213 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _215 = _211 || _213;
    float _217 = float(_215);
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _219;
    float _223 = -_217;
    float _225 = _223 + 1.0;
    bool _227 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _229 = isnan(_201);
    bool _231 = _227 || _229;
    bool _233 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _235 = _231 || _233;
    float _237 = float(_235);
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _239;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _245 = 1.0 / _221;
    float _247 = _237 * _225;
    float _249 = -_237;
    float _251 = _249 + 1.0;
    float _253 = _205 * _245;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _255;
    float _259 = fma(_241, _253, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _261 = fma(_257, _253, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _263 = _259 * _247;
    float _265 = _261 * _247;
    float _267 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[143].x, _263);
    float _269 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[143].y, _265);
    float _271 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[144].x, _267);
    float _273 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[144].y, _269);
    bool _275 = !_243;
    float _293;
    if (!_275)
    {
        float _277 = in.m_53.x;
        float _279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _281 = _277 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _285 = _283 * _279;
        float _287 = floor(_285);
        float _289 = -_287;
        float _291 = _285 + _289;
        _293 = _291;
        _295 = true;
    }
    else
    {
        float _297 = float(_91);
        float _299 = 1.0 / _297;
        float _301 = _123 * _299;
        _293 = _301;
    }
    _295 = false;
    float _303 = _293;
    float _305 = in.m_55.x;
    float _307 = in.m_55.y;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _311 = _303 + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _315 = _303 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _333 = 1.0 / _319;
    bool _335 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _337 = isnan(_303);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = 1.0 / _323;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _351 = _303 + _349;
    bool _353 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _355 = isnan(_303);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = 1.0 / _331;
    float _367 = _273 * _307;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _371 = _303 + _369;
    bool _373 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _375 = _271 * _305;
    float _377 = _371 * _333;
    float _379 = 1.0 / _327;
    float _381 = _351 * _347;
    bool _383 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _385 = isnan(_303);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = -_393;
    float _397 = _395 + 1.0;
    float _399 = _311 * _365;
    bool _401 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _403 = isnan(_303);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _413;
    float _417 = _345 * _397;
    float _419 = -_345;
    float _421 = _419 + 1.0;
    bool _423 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _425 = isnan(_303);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -_411;
    float _437 = _435 + 1.0;
    float _439 = fma(_415, _377, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _441 = _315 * _379;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _447;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _455 = fma(_445, _377, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _457 = fma(_449, _377, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _459 = _411 * _421;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _465 = _363 * _437;
    float _467 = -_363;
    float _469 = _467 + 1.0;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _475 = fma(_453, _381, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _477 = fma(_463, _381, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _479 = _433 * _469;
    float _481 = fma(_473, _381, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _483 = -_433;
    float _485 = _483 + 1.0;
    float _487 = _455 * _479;
    float _489 = _457 * _479;
    float _491 = _439 * _479;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _493;
    float _497 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[107].x, _487);
    float _499 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[107].y, _489);
    float _501 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[107].z, _491);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _503;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _507;
    float _511 = fma(_475, _465, _497);
    float _513 = fma(_477, _465, _499);
    float _515 = fma(_481, _465, _501);
    float _517 = fma(_505, _441, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _519 = fma(_495, _441, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _521 = fma(_509, _441, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _535 = fma(_517, _459, _511);
    float _537 = fma(_525, _399, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _539 = fma(_529, _399, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _541 = fma(_533, _399, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _543 = fma(_519, _459, _513);
    float _545 = fma(_521, _459, _515);
    float _547 = fma(_537, _417, _535);
    float _549 = fma(_539, _417, _543);
    float _551 = fma(_541, _417, _545);
    float _553 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[111].x, _547);
    float _555 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[111].y, _549);
    float _557 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[111].z, _551);
    bool _559 = !_373;
    float _577;
    if (!_559)
    {
        float _561 = in.m_53.x;
        float _563 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _565 = _561 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _567 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _569 = _567 * _563;
        float _571 = floor(_569);
        float _573 = -_571;
        float _575 = _569 + _573;
        _577 = _575;
        _579 = true;
    }
    else
    {
        float _581 = float(_91);
        float _583 = 1.0 / _581;
        float _585 = _123 * _583;
        _577 = _585;
    }
    _579 = false;
    float _587 = _577;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _591 = _587 + _589;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _601 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _603 = isnan(_587);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _617 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _619 = isnan(_587);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = 1.0 / _595;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _631;
    float _635 = -_611;
    float _637 = _635 + 1.0;
    bool _639 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _641 = isnan(_587);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    bool _651 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _653 = 1.0 / _599;
    float _655 = 1.0 / _615;
    float _657 = _633 * _629;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _663 = _627 * _637;
    float _665 = -_627;
    float _667 = _665 + 1.0;
    float _669 = fma(_657, _591, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _671;
    float _675 = _649 * _667;
    float _677 = _661 * _653;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _681 = _587 + _679;
    bool _683 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _685 = isnan(_587);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _691 = _687 || _689;
    float _693 = float(_691);
    float _695 = _669 * _675;
    float _697 = -_649;
    float _699 = _697 + 1.0;
    float _701 = fma(_677, _681, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _705 = _587 + _703;
    float _707 = _673 * _655;
    float _709 = -_693;
    float _711 = _709 + 1.0;
    float _713 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[115].x, _695);
    float _715 = fma(_707, _705, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _717 = _611 * _711;
    float _719 = fma(_701, _663, _713);
    float _721 = _555 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _723 = fma(_715, _717, _719);
    float _725 = _553 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _727 = _557 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _729 = _721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _731 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[118].x, _723);
    float _733 = _725 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _735 = _727 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _737 = _731 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _733;
    out.m_57.y = _729;
    out.m_57.z = _735;
    out.m_57.w = _737;
    bool _739 = !_651;
    float _757;
    if (!_739)
    {
        float _741 = in.m_53.x;
        float _743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _745 = _741 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _747 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _749 = _747 * _743;
        float _751 = floor(_749);
        float _753 = -_751;
        float _755 = _749 + _753;
        _757 = _755;
        _759 = true;
    }
    else
    {
        float _761 = float(_91);
        float _763 = 1.0 / _761;
        float _765 = _123 * _763;
        _757 = _765;
    }
    _759 = false;
    float _767 = _757;
    float _769 = in.m_44.x;
    float _771 = in.m_44.y;
    float _773 = in.m_44.z;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _777 = _767 + _775;
    float _779 = as_type<float>(int(gl_VertexIndex));
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _783 = _767 + _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _785;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _793;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _799 = _767 + _797;
    float _801 = 1.0 / _787;
    float _803 = _375 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _805 = _367 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _807;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _815 = 1.0 / _791;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _817;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _823 = _821 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _825 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _827 = isnan(_767);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    bool _837 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _839 = isnan(_767);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = _771 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _851 = _771 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _853 = _771 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _855 = _167 * _167;
    float _857 = fma(_769, (*spvDescriptorSet0.vp_c10)._m0[4].x, _849);
    float _859 = fma(_769, (*spvDescriptorSet0.vp_c10)._m0[5].x, _851);
    float _861 = fma(_769, (*spvDescriptorSet0.vp_c10)._m0[6].x, _853);
    float _863 = 1.0 / _795;
    float _865 = fma(_773, (*spvDescriptorSet0.vp_c10)._m0[4].z, _857);
    float _867 = fma(_773, (*spvDescriptorSet0.vp_c10)._m0[5].z, _859);
    float _869 = fma(_773, (*spvDescriptorSet0.vp_c10)._m0[6].z, _861);
    float _871 = fma(_165, _165, _855);
    float _873 = in.m_53.x;
    float _875 = in.m_53.y;
    float _877 = _867 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _883 = fma(_169, _169, _871);
    float _885 = _865 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _887 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _889 = _877 + _887;
    float _891 = _869 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _893 = rsqrt(_883);
    float _895 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _897 = _885 + _895;
    float _899 = _889 * _889;
    float _901 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _903 = _891 + _901;
    float _905 = _777 * _863;
    float _907 = _799 * _815;
    float _909 = fma(_897, _897, _899);
    float _911 = -_847;
    float _913 = _911 + 1.0;
    float _915 = 1.0 / _881;
    float _917 = fma(_813, _907, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _919 = fma(_903, _903, _909);
    float _921 = rsqrt(_919);
    bool _923 = _873 > 0.5;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _927 = _767 + _925;
    float _929 = _169 * _893;
    bool _931 = _875 > 0.5;
    float _933 = _165 * _893;
    float _935 = _927 * _801;
    float _937 = _167 * _893;
    float _939 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _941 = _929 * _939;
    float _943 = _783 * _915;
    float _945 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _947 = _937 * _945;
    float _949 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _951 = -_941;
    float _953 = fma(_933, _949, _951);
    int _955 = as_type<int>(_779) & 1;
    bool _957 = _955 != 0;
    int _959 = as_type<int>(_779) & 2;
    bool _961 = _959 != 0;
    float _963 = fma(_809, _935, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    int _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _967 = _965 != 0;
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _971 = -_947;
    float _973 = fma(_929, _969, _971);
    int _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _977 = _975 != 0;
    float _979 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _981 = _933 * _979;
    float _983 = _953 * _953;
    float _985 = _889 * _921;
    float _987 = _897 * _921;
    float _989 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _991 = -_981;
    float _993 = fma(_937, _989, _991);
    float _995 = fma(_973, _973, _983);
    float _997 = -_985;
    float _999 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[18].w, _889);
    float _1001 = -_987;
    float _1003 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[18].w, _897);
    float _1005 = fma(_993, _993, _995);
    float _1007 = _999 * _999;
    float _1009 = _903 * _921;
    float _1011 = fma(_819, _935, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1013 = rsqrt(_1005);
    float _1015 = fma(_1003, _1003, _1007);
    float _1017 = -_1009;
    float _1019 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[18].w, _903);
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1021;
    float _1025 = fma(_1019, _1019, _1015);
    float _1027 = fma(_1023, _935, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1031 = _1029 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1033 = sqrt(_1025);
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1035;
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1041 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1039;
    float _1043 = fma(_1031, _907, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1045;
    float _1049 = fma(_823, _907, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1051 = fma(_1037, _905, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1053 = fma(_1041, _905, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1055 = _973 * _1013;
    float _1057 = _993 * _1013;
    bool _1059 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1061 = isnan(_767);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1067 = _1063 || _1065;
    float _1069 = float(_1067);
    float _1071 = fma(_1047, _905, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _1073 = !_961;
    float _1075 = _1073 ? (-0.5) : 0.5;
    float _1077 = _953 * _1013;
    float _1079 = _921 * _1033;
    float _1081 = -_835;
    float _1083 = _1081 + 1.0;
    bool _1085 = !_957;
    float _1087 = _1085 ? (-0.5) : 0.5;
    float _1089 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1075);
    bool _1091 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1093 = isnan(_767);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1099 = _1095 || _1097;
    float _1101 = float(_1099);
    float _1103 = _1069 * _1083;
    float _1105 = _805 * _1079;
    float _1107 = -_1069;
    float _1109 = _1107 + 1.0;
    float _1111 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1087);
    float _1113 = _803 * _1079;
    float _1115 = -_1101;
    float _1117 = _1115 + 1.0;
    float _1119 = _1105 * _1089;
    float _1121 = _1101 * _1109;
    float _1123 = _1113 * _1111;
    bool _1125 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1127 = isnan(_767);
    bool _1129 = _1125 || _1127;
    bool _1131 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1133 = _1129 || _1131;
    float _1135 = float(_1133);
    float _1137 = _847 * _1117;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1141 = _1139 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1143 = _933 * _1077;
    float _1145 = _937 * _1057;
    float _1147 = _1119 * _933;
    float _1149 = _1119 * _929;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1155 = -_1143;
    float _1157 = fma(_937, _1055, _1155);
    float _1159 = -_1145;
    float _1161 = fma(_929, _1077, _1159);
    float _1163 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1165 = _1163 * 0.5;
    float _1167 = fma(_1123, _1055, _1147);
    float _1169 = fma(_1123, _1057, _1149);
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1173 = _1171 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1175 = fma(_1141, _943, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1177 = fma(_1165, _1161, _1167);
    float _1179 = fma(_1165, _1157, _1169);
    float _1181 = fma(_1173, _943, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1183 = _1135 * _913;
    float _1185 = _885 + _1177;
    float _1187 = _891 + _1179;
    float _1189 = fma(_1153, _943, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1191 = _1027 * _1183;
    float _1193 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1195 = _1185 + _1193;
    float _1197 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1199 = _1187 + _1197;
    float _1201 = -_1135;
    float _1203 = _1201 + 1.0;
    float _1205 = _1011 * _1183;
    float _1207 = _1195 * _1195;
    float _1209 = _1199 * _1199;
    float _1211 = _963 * _1183;
    float _1213 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1191);
    float _1215 = _1119 * _937;
    float _1217 = _1207 + _1209;
    float _1219 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1211);
    float _1221 = fma(_1043, _1137, _1213);
    float _1223 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1205);
    float _1225 = sqrt(_1217);
    float _1227 = fma(_917, _1137, _1219);
    float _1229 = _929 * _1055;
    float _1231 = fma(_1049, _1137, _1223);
    float _1233 = fma(_1051, _1121, _1221);
    float _1235 = fma(_1053, _1121, _1227);
    float _1237 = -_1229;
    float _1239 = fma(_933, _1057, _1237);
    float _1241 = fma(_1071, _1121, _1231);
    float _1243 = fma(_1189, _1103, _1233);
    float _1245 = fma(_1175, _1103, _1235);
    float _1247 = fma(_1123, _1077, _1215);
    float _1249 = -_1075;
    int _1251 = _931 ? as_type<int>(_1249) : as_type<int>(_1075);
    float _1253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1255 = fma(_1181, _1103, _1241);
    float _1257 = fma(_1165, _1239, _1247);
    bool _1259 = !_977;
    float _1261 = _1259 ? _1075 : as_type<float>(_1251);
    float _1263 = _1075 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1265 = _1225 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1267 = _1087 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1269 = -_1087;
    int _1271 = _923 ? as_type<int>(_1269) : as_type<int>(_1087);
    float _1273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1275 = _933 * _1263;
    float _1277 = _937 * _1263;
    bool _1279 = !_967;
    float _1281 = _1279 ? _1087 : as_type<float>(_1271);
    float _1283 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1243);
    float _1285 = _877 + _1257;
    float _1287 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1245);
    float _1289 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1255);
    float _1291 = fma(_1055, _1267, _1275);
    float _1293 = fma(_1077, _1267, _1277);
    float _1295 = _1077;
    float _1297 = _1207;
    float _1299 = _1275;
    float _1301 = _1209;
    float _1303 = _1185;
    float _1305 = _883;
    float _1307 = _891;
    if (!_1265)
    {
        _1295 = _1207;
    }
    float _1309 = _1295;
    float _1311 = _1309;
    if (!_1265)
    {
        _1297 = _1187;
    }
    float _1313 = _1297;
    float _1315 = _1313;
    if (!_1265)
    {
        _1299 = _1285;
    }
    float _1317 = _1299;
    bool _1319 = !_1265;
    float _1321 = _1317;
    if (!_1319)
    {
        float _1323 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1325 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1327 = _1225 + _1325;
        float _1329 = _1285 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1331 = rsqrt(_1217);
        float _1333 = _1327 * _1323;
        float _1335 = _1333 * 0.15915493667125701904296875;
        float _1337 = _1335 * 6.283185482025146484375;
        float _1339 = sin(_1337);
        float _1341 = _1335 * 6.283185482025146484375;
        float _1343 = cos(_1341);
        float _1345 = fma(_1339, _1329, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1347 = _1331 * _1345;
        float _1349 = _1343 + (-1.0);
        float _1351 = fma(_1195, _1347, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1353 = fma(_1199, _1347, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1355 = _1349 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1357 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1359 = _1351 + _1357;
        float _1361 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1363 = _1353 + _1361;
        float _1365 = fma(_1285, _1343, _1355);
        float _1367 = _1359 * _1359;
        float _1369 = _1363 * _1363;
        _1321 = _1365;
        _1311 = _1367;
        _1301 = _1369;
        _1303 = _1351;
        _1315 = _1353;
    }
    float _1371 = _1321;
    float _1373 = _1311;
    float _1375 = _1301;
    float _1377 = _1303;
    float _1379 = _1315;
    float _1381 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1383 = _1371 + _1381;
    float _1385 = _929 * _1263;
    float _1387 = _1281 + 0.5;
    float _1389 = -_1261;
    float _1391 = _1389 + 0.5;
    float _1393 = fma(_1383, _1383, _1373);
    float _1395 = fma(_1057, _1267, _1385);
    float _1397 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1399 = _1391 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1401 = _1393 + _1375;
    float _1403 = _1283 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1405 = _1287 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1407 = _1289 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1409 = sqrt(_1401);
    float _1411 = _1161 + _1291;
    float _1413 = _1239 + _1293;
    float _1415 = _1397 * _1253;
    float _1417 = _1399 * _1273;
    float _1419 = _1403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1421 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1423 = _1407 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1425 = _1157 + _1395;
    out.m_62.x = _1415;
    out.m_62.y = _1417;
    out.m_64.x = _1419;
    out.m_64.y = _1421;
    out.m_64.z = _1423;
    bool _1427 = _1409 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1429 = isnan(_1409);
    bool _1431 = _1427 || _1429;
    bool _1433 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1435 = _1431 || _1433;
    out.m_66.x = _1411;
    out.m_66.y = _1413;
    out.m_66.z = _1425;
    float _1437 = _1401;
    float _1439 = _1377;
    if (!_1435)
    {
        _1437 = 1.0;
    }
    float _1441 = _1437;
    bool _1443 = !_1435;
    float _1445 = _1441;
    if (!_1443)
    {
        bool _1447 = _1409 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1449 = isnan(_1409);
        bool _1451 = _1447 || _1449;
        bool _1453 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1455 = _1451 || _1453;
        if (!_1455)
        {
            float _1457 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1459 = _1409 + _1457;
            float _1461 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1463 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1461;
            float _1465 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1467 = _1465 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1469 = 1.0 / _1463;
            float _1471 = _1459 * _1469;
            float _1473 = fma(_1471, _1467, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1445 = _1473;
            _1475 = true;
        }
        else
        {
            bool _1477 = _1409 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1479 = isnan(_1409);
            bool _1481 = _1477 || _1479;
            bool _1483 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1485 = _1481 || _1483;
            if (!_1485)
            {
                float _1487 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1489 = _1409 + _1487;
                float _1491 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1493 = _1491 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1495 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1497 = _1495 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1499 = 1.0 / _1493;
                float _1501 = _1489 * _1499;
                float _1503 = fma(_1501, _1497, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1445 = _1503;
                _1475 = true;
            }
            else
            {
                _1445 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1475 = false;
    float _1505 = _1445;
    float _1507 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1509 = _1371 + _1507;
    float _1511 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1513 = _1377 + _1511;
    float _1515 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1517 = _1379 + _1515;
    float _1519 = fma(_1509, _1505, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1521 = fma(_1513, _1505, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1523 = fma(_1517, _1505, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1525 = -_987;
    float _1527 = fma(_1525, (*spvDescriptorSet0.vp_c9)._m0[18].w, _885);
    float _1529 = -_877;
    float _1531 = _1529 + _1519;
    float _1533 = -_885;
    float _1535 = _1533 + _1521;
    float _1537 = -_891;
    float _1539 = _1537 + _1523;
    float _1541 = _1531 * _1531;
    float _1543 = fma(_1535, _1535, _1541);
    float _1545 = fma(_1539, _1539, _1543);
    float _1547 = sqrt(_1545);
    bool _1549 = _1547 > 0.0;
    bool _1551 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1553 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1555 = _1551 || _1553;
    bool _1557 = isnan(0.5);
    bool _1559 = _1555 || _1557;
    float _1561 = _1513;
    float _1563 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1565 = _1521;
    if (!_1549)
    {
        _1561 = _1519;
    }
    float _1567 = _1561;
    float _1569 = _1567;
    float _1571 = _1567;
    if (!_1549)
    {
        _1563 = _1523;
    }
    float _1573 = _1563;
    bool _1575 = !_1549;
    float _1577 = _1573;
    if (!_1575)
    {
        float _1579 = sqrt(_883);
        float _1581 = rsqrt(_1545);
        bool _1583 = _1579 > 0.0;
        float _1585 = _1535 * _1581;
        float _1587 = _1531 * _1581;
        float _1589 = _1539 * _1581;
        float _1591 = _1581;
        _1305 = _1579;
        if (!_1583)
        {
            _1569 = _1519;
        }
        float _1593 = _1569;
        _1571 = _1593;
        if (!_1583)
        {
            _1591 = _1523;
        }
        float _1595 = _1591;
        bool _1597 = !_1583;
        _1577 = _1595;
        if (!_1597)
        {
            float _1599 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1601 = _937 * _1587;
            float _1603 = fma(_933, _1585, _1601);
            float _1605 = fma(_929, _1589, _1603);
            float _1607 = _1599 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1609 = _1605 * _1607;
            float _1611 = fma(_165, _1609, _1521);
            float _1613 = fma(_167, _1609, _1519);
            float _1615 = fma(_169, _1609, _1523);
            _1571 = _1613;
            _1577 = _1615;
            _1565 = _1611;
        }
    }
    float _1617 = _1571;
    float _1619 = _1577;
    float _1621 = _1565;
    float _1623 = _1305;
    float _1625 = -_985;
    float _1627 = fma(_1625, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1617);
    float _1629 = -_1009;
    float _1631 = fma(_1629, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1619);
    float _1633 = -_987;
    float _1635 = fma(_1633, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1621);
    float _1637 = -_985;
    float _1639 = fma(_1637, (*spvDescriptorSet0.vp_c9)._m0[18].w, _877);
    float _1641 = -_1009;
    float _1643 = fma(_1641, (*spvDescriptorSet0.vp_c9)._m0[18].w, _891);
    float _1645 = _1627;
    float _1647 = _1635;
    float _1649 = _1631;
    float _1651 = _1623;
    if (!_1559)
    {
        float _1653 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1655 = _1639 + _1653;
        float _1657 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1659 = _1527 + _1657;
        float _1661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1663 = -_885;
        float _1665 = _1663 + _1621;
        float _1667 = _1655 * _1655;
        float _1669 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1671 = _1643 + _1669;
        float _1673 = -_877;
        float _1675 = _1673 + _1617;
        float _1677 = -_891;
        float _1679 = _1677 + _1619;
        float _1681 = fma(_1659, _1659, _1667);
        float _1683 = 1.0 / _1079;
        float _1685 = fma(_1671, _1671, _1681);
        float _1687 = sqrt(_1685);
        float _1689 = _1665 * _1683;
        float _1691 = _1675 * _1683;
        float _1693 = _1679 * _1683;
        bool _1695 = _1687 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1697 = isnan(_1687);
        bool _1699 = _1695 || _1697;
        bool _1701 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1703 = _1699 || _1701;
        float _1705 = precise::min(_1687, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1707 = _1705 * _1661;
        float _1709 = fma(_1689, _1707, _1527);
        float _1711 = fma(_1691, _1707, _1639);
        float _1713 = _1667;
        float _1715 = _1687;
        float _1717 = _1707;
        float _1719 = _1711;
        if (_1703)
        {
            float _1721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1713 = _1721;
        }
        float _1723 = _1713;
        if (_1703)
        {
            float _1725 = precise::max(_1687, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1715 = _1725;
        }
        float _1727 = _1715;
        float _1729 = fma(_1693, _1707, _1643);
        float _1731 = _1727;
        _1649 = _1729;
        if (!_1703)
        {
            _1717 = _1709;
        }
        float _1733 = _1717;
        float _1735 = _1733;
        _173 = _1723;
        if (_1703)
        {
            float _1737 = _1727 * _1723;
            _1731 = _1737;
        }
        float _1739 = _1731;
        if (_1703)
        {
            float _1741 = fma(_1689, _1739, _1527);
            _1735 = _1741;
        }
        float _1743 = _1735;
        _1647 = _1743;
        if (_1703)
        {
            float _1745 = fma(_1691, _1739, _1639);
            _1719 = _1745;
        }
        float _1747 = _1719;
        _1645 = _1747;
        if (_1703)
        {
            float _1749 = fma(_1693, _1739, _1643);
            _1649 = _1749;
        }
    }
    float _1751 = _1645;
    float _1753 = _1647;
    float _1755 = _1649;
    float _1757 = _173;
    float _1759 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1761 = _1751 + _1759;
    float _1763 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1765 = _1753 + _1763;
    float _1767 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1769 = _1755 + _1767;
    float _1771 = _1761 * _1761;
    float _1773 = fma(_1765, _1765, _1771);
    float _1775 = fma(_1769, _1769, _1773);
    float _1777 = rsqrt(_1775);
    float _1779 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1781 = _1765 * _1779;
    float _1783 = _1769 * _1779;
    float _1785 = _1781 * _1781;
    float _1787 = _1783 * _1783;
    float _1789 = _1785 + _1787;
    float _1791 = sqrt(_1789);
    bool _1793 = _1791 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1795 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1797 = _1791 + _1795;
    float _1799 = _1757;
    float _1801 = _1797;
    float _1803 = _1781;
    if (_1793)
    {
        float _1805 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1799 = _1805;
    }
    float _1807 = _1799;
    if (_1793)
    {
        float _1809 = rsqrt(_1789);
        _1651 = _1809;
    }
    float _1811 = _1651;
    float _1813 = _1811;
    if (_1793)
    {
        float _1815 = _1797 * _1807;
        _1801 = _1815;
    }
    float _1817 = _1801;
    if (_1793)
    {
        float _1819 = _1817 * 0.15915493667125701904296875;
        _1307 = _1819;
    }
    float _1821 = _1307;
    float _1823 = _1079;
    if (_1793)
    {
        float _1825 = _1821 * 6.283185482025146484375;
        float _1827 = sin(_1825);
        _1823 = _1827;
    }
    float _1829 = _1823;
    float _1831 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1833 = precise::max(0.0, _1831);
    float _1835 = _885;
    float _1837 = _1833;
    float _1839 = _1831;
    if (_1793)
    {
        float _1841 = _1821 * 6.283185482025146484375;
        float _1843 = cos(_1841);
        _1835 = _1843;
    }
    float _1845 = _1835;
    float _1847 = -_1779;
    float _1849 = -_1833;
    float _1851 = fma(_1761, _1847, _1849);
    if (!_1793)
    {
        _1837 = _1783;
    }
    float _1853 = _1837;
    float _1855 = _1853;
    if (_1793)
    {
        float _1857 = _1851 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1839 = _1857;
    }
    float _1859 = _1839;
    float _1861 = sqrt(_1775);
    float _1863 = _1829;
    float _1865 = _1859;
    if (_1793)
    {
        float _1867 = fma(_1829, _1859, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1863 = _1867;
    }
    float _1869 = _1863;
    float _1871 = _1869;
    float _1873 = _1845;
    if (_1793)
    {
        float _1875 = _1845 + (-1.0);
        _1865 = _1875;
    }
    float _1877 = _1865;
    float _1879 = _1877;
    if (_1793)
    {
        float _1881 = _1811 * _1869;
        _1439 = _1881;
    }
    float _1883 = _1439;
    if (!_1793)
    {
        _1871 = _1851;
    }
    float _1885 = _1871;
    float _1887 = _1751 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1889 = _1885;
    if (_1793)
    {
        float _1891 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1813 = _1891;
    }
    float _1893 = _1813;
    if (_1793)
    {
        float _1895 = _1781 * _1883;
        _1803 = _1895;
    }
    float _1897 = _1803;
    if (!_1793)
    {
        _1879 = _1785;
    }
    float _1899 = _1879;
    float _1901 = _1899;
    if (_1793)
    {
        float _1903 = _1783 * _1883;
        _1855 = _1903;
    }
    float _1905 = _1855;
    if (_1793)
    {
        float _1907 = fma(_1851, _1845, _1893);
        _1889 = _1907;
    }
    float _1909 = _1889;
    if (_1793)
    {
        float _1911 = _1897 * _1897;
        _1901 = _1911;
    }
    float _1913 = _1901;
    if (!_1793)
    {
        _1873 = _1787;
    }
    float _1915 = _1873;
    float _1917 = _1915;
    if (_1793)
    {
        float _1919 = _1905 * _1905;
        _1917 = _1919;
    }
    float _1921 = _1917;
    float _1923 = fma(_1909, _1909, _1913);
    float _1925 = _1923 + _1921;
    float _1927 = _1751 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1929 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1931 = fma(_1861, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1929);
    float _1933 = precise::clamp(_1931, 0.0, 1.0);
    float _1935 = _1751 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1937 = rsqrt(_1925);
    float _1939 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1927);
    float _1941 = -_1933;
    float _1943 = _1941 + 1.0;
    float _1945 = _1751 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1947 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1935);
    float _1949 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1939);
    float _1951 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1953 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1945);
    float _1955 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1947);
    float _1957 = _1949 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1959 = abs(_1943);
    float _1961 = log2(_1959);
    float _1963 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1887);
    float _1965 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1953);
    float _1967 = _1957 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1969 = _1955 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1971 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1963);
    float _1973 = _1937 * _1897;
    float _1975 = -_1967;
    float _1977 = fma(_1975, _1951, 1.0);
    float _1979 = _1965 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1981 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1983 = _1937 * _1909;
    float _1985 = _1973 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1987 = _1937 * _1905;
    float _1989 = fma(_1979, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1981);
    float _1991 = _1971 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1993 = -_1985;
    float _1995 = fma(_1983, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1993);
    float _1997 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1999 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1989);
    float _2001 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2003 = -_1987;
    float _2005 = fma(_2003, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1995);
    float _2007 = exp2(_1997);
    float _2009 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1999);
    float _2011 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2013 = fma(_2005, -0.5, 0.5);
    float _2015 = fma(_1979, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2001);
    float _2017 = fma(_2005, 0.5, 0.5);
    float _2019 = fma(_1979, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2011);
    float _2021 = _1983 + 1.0;
    float _2023 = log2(_1977);
    float _2025 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2015);
    float _2027 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2019);
    float _2029 = fma(_2017, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2031 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2025);
    float _2033 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2027);
    float _2035 = fma(_2017, _2029, -0.212114393711090087890625);
    float _2037 = 1.0 / _2009;
    float _2039 = -_1983;
    float _2041 = fma(_2007, _2021, _2039);
    float _2043 = fma(_2017, _2035, 1.570728778839111328125);
    float _2045 = sqrt(_2013);
    float _2047 = _2023 * 0.693147182464599609375;
    float _2049 = _2047 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2051 = fma(_2041, 0.5, 0.5);
    float _2053 = _2031 * _2037;
    float _2055 = _2033 * _2037;
    float _2057 = fma(_2053, 0.5, 0.5);
    float _2059 = fma(_2055, -0.5, 0.5);
    float _2061 = _2045 * 0.636619746685028076171875;
    float3 _5563 = float3(_2057, _2059, _2049);
    float _2063 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5563, float3(0.0), isnan(_5563)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5563, float3(0.0), isnan(_5563)), level(0.0)).x;
    float3 _5574 = float3(_2057, _2059, _2049);
    float4 _2066 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5574, float3(0.0), isnan(_5574)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5574, float3(0.0), isnan(_5574)), level(0.0)).xyzw;
    float _2068 = _2066.x;
    float _2070 = _2066.y;
    float _2072 = _2066.z;
    float _2074 = _2066.w;
    float _2076 = -_2043;
    float _2078 = fma(_2061, _2076, 1.0);
    float2 _5596 = float2(_2078, _2051);
    float3 _2082 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5596, float2(0.0), isnan(_5596)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5596, float2(0.0), isnan(_5596)), level(0.0)).xyz;
    float _2084 = _2082.x;
    float _2086 = _2082.y;
    float _2088 = _2082.z;
    float _2090 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_68.x = _1765;
    out.m_68.y = _1761;
    out.m_68.z = _1769;
    float _2092 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2090);
    float _2094 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2096 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2098 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2100 = _2096 || _2098;
    bool _2102 = isnan(0.5);
    bool _2104 = _2100 || _2102;
    float _2106 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2092);
    float _2108 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2094);
    float _2110 = _2106 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2112 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2108);
    float _2114 = 1.0 / _2110;
    float _2116 = _2112 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2118 = _2059;
    float _2120 = _2106;
    float _2122 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2124 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _2126 = _2110;
    float _2128 = _2057;
    if (!_2104)
    {
        _2118 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2130 = _2118;
    float _2132 = _2116 + _2110;
    if (_2104)
    {
        _2120 = 1.0;
    }
    float _2134 = _2120;
    float _2136 = _2134;
    if (!_2104)
    {
        float _2138 = -_2130;
        float _2140 = _2138 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2122 = _2140;
    }
    float _2142 = _2122;
    float _2144 = _2142;
    if (!_2104)
    {
        float _2146 = 1.0 / _2142;
        _2144 = _2146;
    }
    float _2148 = _2144;
    float _2150 = _2132 * _2114;
    float _2152 = _2150 * 0.5;
    float _2154 = _2114;
    float _2156 = _2152;
    if (!_2104)
    {
        _2154 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2158 = _2154;
    float _2160 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2162 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2160);
    float _2164 = _2158;
    if (_2104)
    {
        _2124 = 1.0;
    }
    float _2166 = _2124;
    float _2168 = _2166;
    if (!_2104)
    {
        float _2170 = -_2158;
        float _2172 = _2170 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2126 = _2172;
    }
    float _2174 = _2126;
    float _2176 = 1.0 / _2162;
    float _2178 = _2049;
    if (!_2104)
    {
        float _2180 = 1.0 / _2174;
        _2178 = _2180;
    }
    float _2182 = _2178;
    if (!_2104)
    {
        float _2184 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2186 = -_2130;
        float _2188 = fma(_2176, _2184, _2186);
        _2156 = _2188;
    }
    float _2190 = _2156;
    if (!_2104)
    {
        float _2192 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2194 = -_2158;
        float _2196 = fma(_2176, _2192, _2194);
        _2164 = _2196;
    }
    float _2198 = _2164;
    if (!_2104)
    {
        float _2200 = _2190 * _2148;
        float _2202 = precise::clamp(_2200, 0.0, 1.0);
        _2128 = _2202;
    }
    float _2204 = _2128;
    float _2206 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2208 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_2104)
    {
        float _2210 = _2198 * _2182;
        float _2212 = precise::clamp(_2210, 0.0, 1.0);
        _2136 = _2212;
    }
    float _2214 = _2136;
    if (!_2104)
    {
        float _2216 = -_2204;
        float _2218 = _2216 + 1.0;
        _2168 = _2218;
    }
    float _2220 = _2168;
    float _2222 = fma(_1979, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2206);
    float _2224 = exp2(_2208);
    float _2226 = _2214 * _2220;
    float _2228 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2222);
    bool _2230 = _2214 > 0.0;
    bool _2232 = isnan(_2214);
    bool _2234 = _2230 || _2232;
    bool _2236 = isnan(0.0);
    bool _2238 = _2234 || _2236;
    float _2240 = _2226 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2242 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2228);
    bool _2244 = _2220 <= 0.0;
    bool _2246 = !_2238;
    bool _2248 = _2244 || _2246;
    float _2250 = _2031 + _2009;
    float _2252 = _2240 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2254 = _2009 * 0.5;
    float _2256 = _2242 + _2009;
    float _2258 = _2250 * 0.5;
    out.gl_Position.x = _2031;
    out.gl_Position.y = _2033;
    out.gl_Position.z = _2242;
    out.gl_Position.w = _2009;
    float _2260 = fma(_2033, -0.5, _2254);
    float _2262 = _2256 * 0.5;
    float _2264 = -_2224;
    float _2266 = _2264 + 1.0;
    out.m_47.x = _2252;
    float _2268 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.x = _2258;
    out.m_70.y = _2260;
    out.m_70.z = _2262;
    out.m_70.w = _2009;
    float _2270 = -_2268;
    float _2272 = _2270 + 1.0;
    float _2274 = _2268 * _2063;
    float _2276 = _2074 * _2272;
    float _2278 = _2074 * _2274;
    float _2280 = _2088 * _2274;
    float _2282 = fma(_2084, _2278, _2068);
    float _2284 = fma(_2086, _2278, _2070);
    float _2286 = fma(_2074, _2280, _2072);
    out.m_72.x = _2282;
    out.m_72.y = _2284;
    out.m_72.z = _2286;
    out.m_72.w = _2276;
    if (!_2248)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2288 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2288;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1475 = false;
    bool _759 = false;
    bool _579 = false;
    bool _295 = false;
    bool _193 = false;
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
    if (!_95)
    {
        out.m_47.x = 0.0;
    }
    int _101 = 0;
    if (!_95)
    {
        float _103 = _99 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2344 = as_type<float>(_105);
        out.gl_Position.z = _2344;
    }
    if (!_95)
    {
        return out;
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    if (_119)
    {
        float _127 = float(_91);
        _125 = _127;
    }
    float _129 = _125;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
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
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2413 = as_type<float>(_143);
        out.gl_Position.z = _2413;
    }
    if (_135)
    {
        return out;
    }
    float _145 = in.m_51.x;
    float _147 = in.m_51.y;
    float _149 = in.m_51.z;
    bool _151 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _153 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _155 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _157 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _159 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _153);
    float _161 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _155);
    float _163 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _157);
    float _165 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _159);
    float _167 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _161);
    float _169 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _163);
    bool _171 = !_151;
    float _173 = _169;
    float _191;
    if (!_171)
    {
        float _175 = in.m_53.x;
        float _177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _181 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _183 = _181 * _177;
        float _185 = floor(_183);
        float _187 = -_185;
        float _189 = _183 + _187;
        _191 = _189;
        _193 = true;
    }
    else
    {
        float _195 = float(_91);
        float _197 = 1.0 / _195;
        float _199 = _123 * _197;
        _191 = _199;
    }
    _193 = false;
    float _201 = _191;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = _201 + _203;
    bool _207 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _209 = isnan(_201);
    bool _211 = _207 || _209;
    bool _213 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _215 = _211 || _213;
    float _217 = float(_215);
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _219;
    float _223 = -_217;
    float _225 = _223 + 1.0;
    bool _227 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _229 = isnan(_201);
    bool _231 = _227 || _229;
    bool _233 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _235 = _231 || _233;
    float _237 = float(_235);
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _239;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _245 = 1.0 / _221;
    float _247 = _237 * _225;
    float _249 = -_237;
    float _251 = _249 + 1.0;
    float _253 = _205 * _245;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _255;
    float _259 = fma(_241, _253, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _261 = fma(_257, _253, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _263 = _259 * _247;
    float _265 = _261 * _247;
    float _267 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[143].x, _263);
    float _269 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[143].y, _265);
    float _271 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[144].x, _267);
    float _273 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[144].y, _269);
    bool _275 = !_243;
    float _293;
    if (!_275)
    {
        float _277 = in.m_53.x;
        float _279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _281 = _277 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _285 = _283 * _279;
        float _287 = floor(_285);
        float _289 = -_287;
        float _291 = _285 + _289;
        _293 = _291;
        _295 = true;
    }
    else
    {
        float _297 = float(_91);
        float _299 = 1.0 / _297;
        float _301 = _123 * _299;
        _293 = _301;
    }
    _295 = false;
    float _303 = _293;
    float _305 = in.m_55.x;
    float _307 = in.m_55.y;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _311 = _303 + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _315 = _303 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _333 = 1.0 / _319;
    bool _335 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _337 = isnan(_303);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = 1.0 / _323;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _351 = _303 + _349;
    bool _353 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _355 = isnan(_303);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = 1.0 / _331;
    float _367 = _273 * _307;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _371 = _303 + _369;
    bool _373 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _375 = _271 * _305;
    float _377 = _371 * _333;
    float _379 = 1.0 / _327;
    float _381 = _351 * _347;
    bool _383 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _385 = isnan(_303);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = -_393;
    float _397 = _395 + 1.0;
    float _399 = _311 * _365;
    bool _401 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _403 = isnan(_303);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _413;
    float _417 = _345 * _397;
    float _419 = -_345;
    float _421 = _419 + 1.0;
    bool _423 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _425 = isnan(_303);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -_411;
    float _437 = _435 + 1.0;
    float _439 = fma(_415, _377, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _441 = _315 * _379;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _447;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _455 = fma(_445, _377, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _457 = fma(_449, _377, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _459 = _411 * _421;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _465 = _363 * _437;
    float _467 = -_363;
    float _469 = _467 + 1.0;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _475 = fma(_453, _381, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _477 = fma(_463, _381, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _479 = _433 * _469;
    float _481 = fma(_473, _381, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _483 = -_433;
    float _485 = _483 + 1.0;
    float _487 = _455 * _479;
    float _489 = _457 * _479;
    float _491 = _439 * _479;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _493;
    float _497 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[107].x, _487);
    float _499 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[107].y, _489);
    float _501 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[107].z, _491);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _503;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _507;
    float _511 = fma(_475, _465, _497);
    float _513 = fma(_477, _465, _499);
    float _515 = fma(_481, _465, _501);
    float _517 = fma(_505, _441, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _519 = fma(_495, _441, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _521 = fma(_509, _441, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _535 = fma(_517, _459, _511);
    float _537 = fma(_525, _399, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _539 = fma(_529, _399, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _541 = fma(_533, _399, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _543 = fma(_519, _459, _513);
    float _545 = fma(_521, _459, _515);
    float _547 = fma(_537, _417, _535);
    float _549 = fma(_539, _417, _543);
    float _551 = fma(_541, _417, _545);
    float _553 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[111].x, _547);
    float _555 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[111].y, _549);
    float _557 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[111].z, _551);
    bool _559 = !_373;
    float _577;
    if (!_559)
    {
        float _561 = in.m_53.x;
        float _563 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _565 = _561 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _567 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _569 = _567 * _563;
        float _571 = floor(_569);
        float _573 = -_571;
        float _575 = _569 + _573;
        _577 = _575;
        _579 = true;
    }
    else
    {
        float _581 = float(_91);
        float _583 = 1.0 / _581;
        float _585 = _123 * _583;
        _577 = _585;
    }
    _579 = false;
    float _587 = _577;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _591 = _587 + _589;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _601 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _603 = isnan(_587);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _617 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _619 = isnan(_587);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = 1.0 / _595;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _631;
    float _635 = -_611;
    float _637 = _635 + 1.0;
    bool _639 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _641 = isnan(_587);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    bool _651 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _653 = 1.0 / _599;
    float _655 = 1.0 / _615;
    float _657 = _633 * _629;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _663 = _627 * _637;
    float _665 = -_627;
    float _667 = _665 + 1.0;
    float _669 = fma(_657, _591, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _671;
    float _675 = _649 * _667;
    float _677 = _661 * _653;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _681 = _587 + _679;
    bool _683 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _685 = isnan(_587);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _691 = _687 || _689;
    float _693 = float(_691);
    float _695 = _669 * _675;
    float _697 = -_649;
    float _699 = _697 + 1.0;
    float _701 = fma(_677, _681, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _705 = _587 + _703;
    float _707 = _673 * _655;
    float _709 = -_693;
    float _711 = _709 + 1.0;
    float _713 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[115].x, _695);
    float _715 = fma(_707, _705, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _717 = _611 * _711;
    float _719 = fma(_701, _663, _713);
    float _721 = _555 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _723 = fma(_715, _717, _719);
    float _725 = _553 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _727 = _557 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _729 = _721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _731 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[118].x, _723);
    float _733 = _725 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _735 = _727 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _737 = _731 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _733;
    out.m_57.y = _729;
    out.m_57.z = _735;
    out.m_57.w = _737;
    bool _739 = !_651;
    float _757;
    if (!_739)
    {
        float _741 = in.m_53.x;
        float _743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _745 = _741 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _747 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _749 = _747 * _743;
        float _751 = floor(_749);
        float _753 = -_751;
        float _755 = _749 + _753;
        _757 = _755;
        _759 = true;
    }
    else
    {
        float _761 = float(_91);
        float _763 = 1.0 / _761;
        float _765 = _123 * _763;
        _757 = _765;
    }
    _759 = false;
    float _767 = _757;
    float _769 = in.m_44.x;
    float _771 = in.m_44.y;
    float _773 = in.m_44.z;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _777 = _767 + _775;
    float _779 = as_type<float>(int(gl_VertexIndex));
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _783 = _767 + _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _785;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _793;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _799 = _767 + _797;
    float _801 = 1.0 / _787;
    float _803 = _375 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _805 = _367 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _807;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _815 = 1.0 / _791;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _817;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _823 = _821 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _825 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _827 = isnan(_767);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    bool _837 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _839 = isnan(_767);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = _771 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _851 = _771 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _853 = _771 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _855 = _167 * _167;
    float _857 = fma(_769, (*spvDescriptorSet0.vp_c10)._m0[4].x, _849);
    float _859 = fma(_769, (*spvDescriptorSet0.vp_c10)._m0[5].x, _851);
    float _861 = fma(_769, (*spvDescriptorSet0.vp_c10)._m0[6].x, _853);
    float _863 = 1.0 / _795;
    float _865 = fma(_773, (*spvDescriptorSet0.vp_c10)._m0[4].z, _857);
    float _867 = fma(_773, (*spvDescriptorSet0.vp_c10)._m0[5].z, _859);
    float _869 = fma(_773, (*spvDescriptorSet0.vp_c10)._m0[6].z, _861);
    float _871 = fma(_165, _165, _855);
    float _873 = in.m_53.x;
    float _875 = in.m_53.y;
    float _877 = _867 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _883 = fma(_169, _169, _871);
    float _885 = _865 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _887 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _889 = _877 + _887;
    float _891 = _869 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _893 = rsqrt(_883);
    float _895 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _897 = _885 + _895;
    float _899 = _889 * _889;
    float _901 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _903 = _891 + _901;
    float _905 = _777 * _863;
    float _907 = _799 * _815;
    float _909 = fma(_897, _897, _899);
    float _911 = -_847;
    float _913 = _911 + 1.0;
    float _915 = 1.0 / _881;
    float _917 = fma(_813, _907, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _919 = fma(_903, _903, _909);
    float _921 = rsqrt(_919);
    bool _923 = _873 > 0.5;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _927 = _767 + _925;
    float _929 = _169 * _893;
    bool _931 = _875 > 0.5;
    float _933 = _165 * _893;
    float _935 = _927 * _801;
    float _937 = _167 * _893;
    float _939 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _941 = _929 * _939;
    float _943 = _783 * _915;
    float _945 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _947 = _937 * _945;
    float _949 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _951 = -_941;
    float _953 = fma(_933, _949, _951);
    int _955 = as_type<int>(_779) & 1;
    bool _957 = _955 != 0;
    int _959 = as_type<int>(_779) & 2;
    bool _961 = _959 != 0;
    float _963 = fma(_809, _935, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    int _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _967 = _965 != 0;
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _971 = -_947;
    float _973 = fma(_929, _969, _971);
    int _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _977 = _975 != 0;
    float _979 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _981 = _933 * _979;
    float _983 = _953 * _953;
    float _985 = _889 * _921;
    float _987 = _897 * _921;
    float _989 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _991 = -_981;
    float _993 = fma(_937, _989, _991);
    float _995 = fma(_973, _973, _983);
    float _997 = -_985;
    float _999 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[18].w, _889);
    float _1001 = -_987;
    float _1003 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[18].w, _897);
    float _1005 = fma(_993, _993, _995);
    float _1007 = _999 * _999;
    float _1009 = _903 * _921;
    float _1011 = fma(_819, _935, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1013 = rsqrt(_1005);
    float _1015 = fma(_1003, _1003, _1007);
    float _1017 = -_1009;
    float _1019 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[18].w, _903);
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1021;
    float _1025 = fma(_1019, _1019, _1015);
    float _1027 = fma(_1023, _935, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1031 = _1029 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1033 = sqrt(_1025);
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1035;
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1041 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1039;
    float _1043 = fma(_1031, _907, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1045;
    float _1049 = fma(_823, _907, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1051 = fma(_1037, _905, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1053 = fma(_1041, _905, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1055 = _973 * _1013;
    float _1057 = _993 * _1013;
    bool _1059 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1061 = isnan(_767);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1067 = _1063 || _1065;
    float _1069 = float(_1067);
    float _1071 = fma(_1047, _905, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _1073 = !_961;
    float _1075 = _1073 ? (-0.5) : 0.5;
    float _1077 = _953 * _1013;
    float _1079 = _921 * _1033;
    float _1081 = -_835;
    float _1083 = _1081 + 1.0;
    bool _1085 = !_957;
    float _1087 = _1085 ? (-0.5) : 0.5;
    float _1089 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1075);
    bool _1091 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1093 = isnan(_767);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1099 = _1095 || _1097;
    float _1101 = float(_1099);
    float _1103 = _1069 * _1083;
    float _1105 = _805 * _1079;
    float _1107 = -_1069;
    float _1109 = _1107 + 1.0;
    float _1111 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1087);
    float _1113 = _803 * _1079;
    float _1115 = -_1101;
    float _1117 = _1115 + 1.0;
    float _1119 = _1105 * _1089;
    float _1121 = _1101 * _1109;
    float _1123 = _1113 * _1111;
    bool _1125 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1127 = isnan(_767);
    bool _1129 = _1125 || _1127;
    bool _1131 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1133 = _1129 || _1131;
    float _1135 = float(_1133);
    float _1137 = _847 * _1117;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1141 = _1139 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1143 = _933 * _1077;
    float _1145 = _937 * _1057;
    float _1147 = _1119 * _933;
    float _1149 = _1119 * _929;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1155 = -_1143;
    float _1157 = fma(_937, _1055, _1155);
    float _1159 = -_1145;
    float _1161 = fma(_929, _1077, _1159);
    float _1163 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1165 = _1163 * 0.5;
    float _1167 = fma(_1123, _1055, _1147);
    float _1169 = fma(_1123, _1057, _1149);
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1173 = _1171 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1175 = fma(_1141, _943, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1177 = fma(_1165, _1161, _1167);
    float _1179 = fma(_1165, _1157, _1169);
    float _1181 = fma(_1173, _943, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1183 = _1135 * _913;
    float _1185 = _885 + _1177;
    float _1187 = _891 + _1179;
    float _1189 = fma(_1153, _943, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1191 = _1027 * _1183;
    float _1193 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1195 = _1185 + _1193;
    float _1197 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1199 = _1187 + _1197;
    float _1201 = -_1135;
    float _1203 = _1201 + 1.0;
    float _1205 = _1011 * _1183;
    float _1207 = _1195 * _1195;
    float _1209 = _1199 * _1199;
    float _1211 = _963 * _1183;
    float _1213 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1191);
    float _1215 = _1119 * _937;
    float _1217 = _1207 + _1209;
    float _1219 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1211);
    float _1221 = fma(_1043, _1137, _1213);
    float _1223 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1205);
    float _1225 = sqrt(_1217);
    float _1227 = fma(_917, _1137, _1219);
    float _1229 = _929 * _1055;
    float _1231 = fma(_1049, _1137, _1223);
    float _1233 = fma(_1051, _1121, _1221);
    float _1235 = fma(_1053, _1121, _1227);
    float _1237 = -_1229;
    float _1239 = fma(_933, _1057, _1237);
    float _1241 = fma(_1071, _1121, _1231);
    float _1243 = fma(_1189, _1103, _1233);
    float _1245 = fma(_1175, _1103, _1235);
    float _1247 = fma(_1123, _1077, _1215);
    float _1249 = -_1075;
    int _1251 = _931 ? as_type<int>(_1249) : as_type<int>(_1075);
    float _1253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1255 = fma(_1181, _1103, _1241);
    float _1257 = fma(_1165, _1239, _1247);
    bool _1259 = !_977;
    float _1261 = _1259 ? _1075 : as_type<float>(_1251);
    float _1263 = _1075 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1265 = _1225 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1267 = _1087 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1269 = -_1087;
    int _1271 = _923 ? as_type<int>(_1269) : as_type<int>(_1087);
    float _1273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1275 = _933 * _1263;
    float _1277 = _937 * _1263;
    bool _1279 = !_967;
    float _1281 = _1279 ? _1087 : as_type<float>(_1271);
    float _1283 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1243);
    float _1285 = _877 + _1257;
    float _1287 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1245);
    float _1289 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1255);
    float _1291 = fma(_1055, _1267, _1275);
    float _1293 = fma(_1077, _1267, _1277);
    float _1295 = _1077;
    float _1297 = _1207;
    float _1299 = _1275;
    float _1301 = _1209;
    float _1303 = _1185;
    float _1305 = _883;
    float _1307 = _891;
    if (!_1265)
    {
        _1295 = _1207;
    }
    float _1309 = _1295;
    float _1311 = _1309;
    if (!_1265)
    {
        _1297 = _1187;
    }
    float _1313 = _1297;
    float _1315 = _1313;
    if (!_1265)
    {
        _1299 = _1285;
    }
    float _1317 = _1299;
    bool _1319 = !_1265;
    float _1321 = _1317;
    if (!_1319)
    {
        float _1323 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1325 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1327 = _1225 + _1325;
        float _1329 = _1285 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1331 = rsqrt(_1217);
        float _1333 = _1327 * _1323;
        float _1335 = _1333 * 0.15915493667125701904296875;
        float _1337 = _1335 * 6.283185482025146484375;
        float _1339 = sin(_1337);
        float _1341 = _1335 * 6.283185482025146484375;
        float _1343 = cos(_1341);
        float _1345 = fma(_1339, _1329, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1347 = _1331 * _1345;
        float _1349 = _1343 + (-1.0);
        float _1351 = fma(_1195, _1347, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1353 = fma(_1199, _1347, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1355 = _1349 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1357 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1359 = _1351 + _1357;
        float _1361 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1363 = _1353 + _1361;
        float _1365 = fma(_1285, _1343, _1355);
        float _1367 = _1359 * _1359;
        float _1369 = _1363 * _1363;
        _1321 = _1365;
        _1311 = _1367;
        _1301 = _1369;
        _1303 = _1351;
        _1315 = _1353;
    }
    float _1371 = _1321;
    float _1373 = _1311;
    float _1375 = _1301;
    float _1377 = _1303;
    float _1379 = _1315;
    float _1381 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1383 = _1371 + _1381;
    float _1385 = _929 * _1263;
    float _1387 = _1281 + 0.5;
    float _1389 = -_1261;
    float _1391 = _1389 + 0.5;
    float _1393 = fma(_1383, _1383, _1373);
    float _1395 = fma(_1057, _1267, _1385);
    float _1397 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1399 = _1391 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1401 = _1393 + _1375;
    float _1403 = _1283 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1405 = _1287 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1407 = _1289 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1409 = sqrt(_1401);
    float _1411 = _1161 + _1291;
    float _1413 = _1239 + _1293;
    float _1415 = _1397 * _1253;
    float _1417 = _1399 * _1273;
    float _1419 = _1403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1421 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1423 = _1407 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1425 = _1157 + _1395;
    out.m_62.x = _1415;
    out.m_62.y = _1417;
    out.m_64.x = _1419;
    out.m_64.y = _1421;
    out.m_64.z = _1423;
    bool _1427 = _1409 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1429 = isnan(_1409);
    bool _1431 = _1427 || _1429;
    bool _1433 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1435 = _1431 || _1433;
    out.m_66.x = _1411;
    out.m_66.y = _1413;
    out.m_66.z = _1425;
    float _1437 = _1401;
    float _1439 = _1377;
    if (!_1435)
    {
        _1437 = 1.0;
    }
    float _1441 = _1437;
    bool _1443 = !_1435;
    float _1445 = _1441;
    if (!_1443)
    {
        bool _1447 = _1409 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1449 = isnan(_1409);
        bool _1451 = _1447 || _1449;
        bool _1453 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1455 = _1451 || _1453;
        if (!_1455)
        {
            float _1457 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1459 = _1409 + _1457;
            float _1461 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1463 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1461;
            float _1465 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1467 = _1465 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1469 = 1.0 / _1463;
            float _1471 = _1459 * _1469;
            float _1473 = fma(_1471, _1467, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1445 = _1473;
            _1475 = true;
        }
        else
        {
            bool _1477 = _1409 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1479 = isnan(_1409);
            bool _1481 = _1477 || _1479;
            bool _1483 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1485 = _1481 || _1483;
            if (!_1485)
            {
                float _1487 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1489 = _1409 + _1487;
                float _1491 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1493 = _1491 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1495 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1497 = _1495 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1499 = 1.0 / _1493;
                float _1501 = _1489 * _1499;
                float _1503 = fma(_1501, _1497, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1445 = _1503;
                _1475 = true;
            }
            else
            {
                _1445 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1475 = false;
    float _1505 = _1445;
    float _1507 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1509 = _1371 + _1507;
    float _1511 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1513 = _1377 + _1511;
    float _1515 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1517 = _1379 + _1515;
    float _1519 = fma(_1509, _1505, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1521 = fma(_1513, _1505, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1523 = fma(_1517, _1505, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1525 = -_987;
    float _1527 = fma(_1525, (*spvDescriptorSet0.vp_c9)._m0[18].w, _885);
    float _1529 = -_877;
    float _1531 = _1529 + _1519;
    float _1533 = -_885;
    float _1535 = _1533 + _1521;
    float _1537 = -_891;
    float _1539 = _1537 + _1523;
    float _1541 = _1531 * _1531;
    float _1543 = fma(_1535, _1535, _1541);
    float _1545 = fma(_1539, _1539, _1543);
    float _1547 = sqrt(_1545);
    bool _1549 = _1547 > 0.0;
    bool _1551 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1553 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1555 = _1551 || _1553;
    bool _1557 = isnan(0.5);
    bool _1559 = _1555 || _1557;
    float _1561 = _1513;
    float _1563 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1565 = _1521;
    if (!_1549)
    {
        _1561 = _1519;
    }
    float _1567 = _1561;
    float _1569 = _1567;
    float _1571 = _1567;
    if (!_1549)
    {
        _1563 = _1523;
    }
    float _1573 = _1563;
    bool _1575 = !_1549;
    float _1577 = _1573;
    if (!_1575)
    {
        float _1579 = sqrt(_883);
        float _1581 = rsqrt(_1545);
        bool _1583 = _1579 > 0.0;
        float _1585 = _1535 * _1581;
        float _1587 = _1531 * _1581;
        float _1589 = _1539 * _1581;
        float _1591 = _1581;
        _1305 = _1579;
        if (!_1583)
        {
            _1569 = _1519;
        }
        float _1593 = _1569;
        _1571 = _1593;
        if (!_1583)
        {
            _1591 = _1523;
        }
        float _1595 = _1591;
        bool _1597 = !_1583;
        _1577 = _1595;
        if (!_1597)
        {
            float _1599 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1601 = _937 * _1587;
            float _1603 = fma(_933, _1585, _1601);
            float _1605 = fma(_929, _1589, _1603);
            float _1607 = _1599 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1609 = _1605 * _1607;
            float _1611 = fma(_165, _1609, _1521);
            float _1613 = fma(_167, _1609, _1519);
            float _1615 = fma(_169, _1609, _1523);
            _1571 = _1613;
            _1577 = _1615;
            _1565 = _1611;
        }
    }
    float _1617 = _1571;
    float _1619 = _1577;
    float _1621 = _1565;
    float _1623 = _1305;
    float _1625 = -_985;
    float _1627 = fma(_1625, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1617);
    float _1629 = -_1009;
    float _1631 = fma(_1629, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1619);
    float _1633 = -_987;
    float _1635 = fma(_1633, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1621);
    float _1637 = -_985;
    float _1639 = fma(_1637, (*spvDescriptorSet0.vp_c9)._m0[18].w, _877);
    float _1641 = -_1009;
    float _1643 = fma(_1641, (*spvDescriptorSet0.vp_c9)._m0[18].w, _891);
    float _1645 = _1627;
    float _1647 = _1635;
    float _1649 = _1631;
    float _1651 = _1623;
    if (!_1559)
    {
        float _1653 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1655 = _1639 + _1653;
        float _1657 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1659 = _1527 + _1657;
        float _1661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1663 = -_885;
        float _1665 = _1663 + _1621;
        float _1667 = _1655 * _1655;
        float _1669 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1671 = _1643 + _1669;
        float _1673 = -_877;
        float _1675 = _1673 + _1617;
        float _1677 = -_891;
        float _1679 = _1677 + _1619;
        float _1681 = fma(_1659, _1659, _1667);
        float _1683 = 1.0 / _1079;
        float _1685 = fma(_1671, _1671, _1681);
        float _1687 = sqrt(_1685);
        float _1689 = _1665 * _1683;
        float _1691 = _1675 * _1683;
        float _1693 = _1679 * _1683;
        bool _1695 = _1687 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1697 = isnan(_1687);
        bool _1699 = _1695 || _1697;
        bool _1701 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1703 = _1699 || _1701;
        float _1705 = precise::min(_1687, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1707 = _1705 * _1661;
        float _1709 = fma(_1689, _1707, _1527);
        float _1711 = fma(_1691, _1707, _1639);
        float _1713 = _1667;
        float _1715 = _1687;
        float _1717 = _1707;
        float _1719 = _1711;
        if (_1703)
        {
            float _1721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1713 = _1721;
        }
        float _1723 = _1713;
        if (_1703)
        {
            float _1725 = precise::max(_1687, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1715 = _1725;
        }
        float _1727 = _1715;
        float _1729 = fma(_1693, _1707, _1643);
        float _1731 = _1727;
        _1649 = _1729;
        if (!_1703)
        {
            _1717 = _1709;
        }
        float _1733 = _1717;
        float _1735 = _1733;
        _173 = _1723;
        if (_1703)
        {
            float _1737 = _1727 * _1723;
            _1731 = _1737;
        }
        float _1739 = _1731;
        if (_1703)
        {
            float _1741 = fma(_1689, _1739, _1527);
            _1735 = _1741;
        }
        float _1743 = _1735;
        _1647 = _1743;
        if (_1703)
        {
            float _1745 = fma(_1691, _1739, _1639);
            _1719 = _1745;
        }
        float _1747 = _1719;
        _1645 = _1747;
        if (_1703)
        {
            float _1749 = fma(_1693, _1739, _1643);
            _1649 = _1749;
        }
    }
    float _1751 = _1645;
    float _1753 = _1647;
    float _1755 = _1649;
    float _1757 = _173;
    float _1759 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1761 = _1751 + _1759;
    float _1763 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1765 = _1753 + _1763;
    float _1767 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1769 = _1755 + _1767;
    float _1771 = _1761 * _1761;
    float _1773 = fma(_1765, _1765, _1771);
    float _1775 = fma(_1769, _1769, _1773);
    float _1777 = rsqrt(_1775);
    float _1779 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1781 = _1765 * _1779;
    float _1783 = _1769 * _1779;
    float _1785 = _1781 * _1781;
    float _1787 = _1783 * _1783;
    float _1789 = _1785 + _1787;
    float _1791 = sqrt(_1789);
    bool _1793 = _1791 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1795 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1797 = _1791 + _1795;
    float _1799 = _1757;
    float _1801 = _1797;
    float _1803 = _1781;
    if (_1793)
    {
        float _1805 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1799 = _1805;
    }
    float _1807 = _1799;
    if (_1793)
    {
        float _1809 = rsqrt(_1789);
        _1651 = _1809;
    }
    float _1811 = _1651;
    float _1813 = _1811;
    if (_1793)
    {
        float _1815 = _1797 * _1807;
        _1801 = _1815;
    }
    float _1817 = _1801;
    if (_1793)
    {
        float _1819 = _1817 * 0.15915493667125701904296875;
        _1307 = _1819;
    }
    float _1821 = _1307;
    float _1823 = _1079;
    if (_1793)
    {
        float _1825 = _1821 * 6.283185482025146484375;
        float _1827 = sin(_1825);
        _1823 = _1827;
    }
    float _1829 = _1823;
    float _1831 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1833 = precise::max(0.0, _1831);
    float _1835 = _885;
    float _1837 = _1833;
    float _1839 = _1831;
    if (_1793)
    {
        float _1841 = _1821 * 6.283185482025146484375;
        float _1843 = cos(_1841);
        _1835 = _1843;
    }
    float _1845 = _1835;
    float _1847 = -_1779;
    float _1849 = -_1833;
    float _1851 = fma(_1761, _1847, _1849);
    if (!_1793)
    {
        _1837 = _1783;
    }
    float _1853 = _1837;
    float _1855 = _1853;
    if (_1793)
    {
        float _1857 = _1851 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1839 = _1857;
    }
    float _1859 = _1839;
    float _1861 = sqrt(_1775);
    float _1863 = _1829;
    float _1865 = _1859;
    if (_1793)
    {
        float _1867 = fma(_1829, _1859, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1863 = _1867;
    }
    float _1869 = _1863;
    float _1871 = _1869;
    float _1873 = _1845;
    if (_1793)
    {
        float _1875 = _1845 + (-1.0);
        _1865 = _1875;
    }
    float _1877 = _1865;
    float _1879 = _1877;
    if (_1793)
    {
        float _1881 = _1811 * _1869;
        _1439 = _1881;
    }
    float _1883 = _1439;
    if (!_1793)
    {
        _1871 = _1851;
    }
    float _1885 = _1871;
    float _1887 = _1751 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1889 = _1885;
    if (_1793)
    {
        float _1891 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1813 = _1891;
    }
    float _1893 = _1813;
    if (_1793)
    {
        float _1895 = _1781 * _1883;
        _1803 = _1895;
    }
    float _1897 = _1803;
    if (!_1793)
    {
        _1879 = _1785;
    }
    float _1899 = _1879;
    float _1901 = _1899;
    if (_1793)
    {
        float _1903 = _1783 * _1883;
        _1855 = _1903;
    }
    float _1905 = _1855;
    if (_1793)
    {
        float _1907 = fma(_1851, _1845, _1893);
        _1889 = _1907;
    }
    float _1909 = _1889;
    if (_1793)
    {
        float _1911 = _1897 * _1897;
        _1901 = _1911;
    }
    float _1913 = _1901;
    if (!_1793)
    {
        _1873 = _1787;
    }
    float _1915 = _1873;
    float _1917 = _1915;
    if (_1793)
    {
        float _1919 = _1905 * _1905;
        _1917 = _1919;
    }
    float _1921 = _1917;
    float _1923 = fma(_1909, _1909, _1913);
    float _1925 = _1923 + _1921;
    float _1927 = _1751 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1929 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1931 = fma(_1861, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1929);
    float _1933 = precise::clamp(_1931, 0.0, 1.0);
    float _1935 = _1751 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1937 = rsqrt(_1925);
    float _1939 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1927);
    float _1941 = -_1933;
    float _1943 = _1941 + 1.0;
    float _1945 = _1751 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1947 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1935);
    float _1949 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1939);
    float _1951 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1953 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1945);
    float _1955 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1947);
    float _1957 = _1949 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1959 = abs(_1943);
    float _1961 = log2(_1959);
    float _1963 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1887);
    float _1965 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1953);
    float _1967 = _1957 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1969 = _1955 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1971 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1963);
    float _1973 = _1937 * _1897;
    float _1975 = -_1967;
    float _1977 = fma(_1975, _1951, 1.0);
    float _1979 = _1965 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1981 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1983 = _1937 * _1909;
    float _1985 = _1973 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1987 = _1937 * _1905;
    float _1989 = fma(_1979, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1981);
    float _1991 = _1971 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1993 = -_1985;
    float _1995 = fma(_1983, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1993);
    float _1997 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1999 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1989);
    float _2001 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2003 = -_1987;
    float _2005 = fma(_2003, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1995);
    float _2007 = exp2(_1997);
    float _2009 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1999);
    float _2011 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2013 = fma(_2005, -0.5, 0.5);
    float _2015 = fma(_1979, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2001);
    float _2017 = fma(_2005, 0.5, 0.5);
    float _2019 = fma(_1979, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2011);
    float _2021 = _1983 + 1.0;
    float _2023 = log2(_1977);
    float _2025 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2015);
    float _2027 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2019);
    float _2029 = fma(_2017, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2031 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2025);
    float _2033 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2027);
    float _2035 = fma(_2017, _2029, -0.212114393711090087890625);
    float _2037 = 1.0 / _2009;
    float _2039 = -_1983;
    float _2041 = fma(_2007, _2021, _2039);
    float _2043 = fma(_2017, _2035, 1.570728778839111328125);
    float _2045 = sqrt(_2013);
    float _2047 = _2023 * 0.693147182464599609375;
    float _2049 = _2047 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2051 = fma(_2041, 0.5, 0.5);
    float _2053 = _2031 * _2037;
    float _2055 = _2033 * _2037;
    float _2057 = fma(_2053, 0.5, 0.5);
    float _2059 = fma(_2055, -0.5, 0.5);
    float _2061 = _2045 * 0.636619746685028076171875;
    float3 _5563 = float3(_2057, _2059, _2049);
    float _2063 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5563, float3(0.0), isnan(_5563)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5563, float3(0.0), isnan(_5563)), level(0.0)).x;
    float3 _5574 = float3(_2057, _2059, _2049);
    float4 _2066 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5574, float3(0.0), isnan(_5574)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5574, float3(0.0), isnan(_5574)), level(0.0)).xyzw;
    float _2068 = _2066.x;
    float _2070 = _2066.y;
    float _2072 = _2066.z;
    float _2074 = _2066.w;
    float _2076 = -_2043;
    float _2078 = fma(_2061, _2076, 1.0);
    float2 _5596 = float2(_2078, _2051);
    float3 _2082 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5596, float2(0.0), isnan(_5596)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5596, float2(0.0), isnan(_5596)), level(0.0)).xyz;
    float _2084 = _2082.x;
    float _2086 = _2082.y;
    float _2088 = _2082.z;
    float _2090 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_68.x = _1765;
    out.m_68.y = _1761;
    out.m_68.z = _1769;
    float _2092 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2090);
    float _2094 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2096 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2098 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2100 = _2096 || _2098;
    bool _2102 = isnan(0.5);
    bool _2104 = _2100 || _2102;
    float _2106 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2092);
    float _2108 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2094);
    float _2110 = _2106 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2112 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2108);
    float _2114 = 1.0 / _2110;
    float _2116 = _2112 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2118 = _2059;
    float _2120 = _2106;
    float _2122 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2124 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _2126 = _2110;
    float _2128 = _2057;
    if (!_2104)
    {
        _2118 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2130 = _2118;
    float _2132 = _2116 + _2110;
    if (_2104)
    {
        _2120 = 1.0;
    }
    float _2134 = _2120;
    float _2136 = _2134;
    if (!_2104)
    {
        float _2138 = -_2130;
        float _2140 = _2138 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2122 = _2140;
    }
    float _2142 = _2122;
    float _2144 = _2142;
    if (!_2104)
    {
        float _2146 = 1.0 / _2142;
        _2144 = _2146;
    }
    float _2148 = _2144;
    float _2150 = _2132 * _2114;
    float _2152 = _2150 * 0.5;
    float _2154 = _2114;
    float _2156 = _2152;
    if (!_2104)
    {
        _2154 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2158 = _2154;
    float _2160 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2162 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2160);
    float _2164 = _2158;
    if (_2104)
    {
        _2124 = 1.0;
    }
    float _2166 = _2124;
    float _2168 = _2166;
    if (!_2104)
    {
        float _2170 = -_2158;
        float _2172 = _2170 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2126 = _2172;
    }
    float _2174 = _2126;
    float _2176 = 1.0 / _2162;
    float _2178 = _2049;
    if (!_2104)
    {
        float _2180 = 1.0 / _2174;
        _2178 = _2180;
    }
    float _2182 = _2178;
    if (!_2104)
    {
        float _2184 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2186 = -_2130;
        float _2188 = fma(_2176, _2184, _2186);
        _2156 = _2188;
    }
    float _2190 = _2156;
    if (!_2104)
    {
        float _2192 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2194 = -_2158;
        float _2196 = fma(_2176, _2192, _2194);
        _2164 = _2196;
    }
    float _2198 = _2164;
    if (!_2104)
    {
        float _2200 = _2190 * _2148;
        float _2202 = precise::clamp(_2200, 0.0, 1.0);
        _2128 = _2202;
    }
    float _2204 = _2128;
    float _2206 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2208 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_2104)
    {
        float _2210 = _2198 * _2182;
        float _2212 = precise::clamp(_2210, 0.0, 1.0);
        _2136 = _2212;
    }
    float _2214 = _2136;
    if (!_2104)
    {
        float _2216 = -_2204;
        float _2218 = _2216 + 1.0;
        _2168 = _2218;
    }
    float _2220 = _2168;
    float _2222 = fma(_1979, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2206);
    float _2224 = exp2(_2208);
    float _2226 = _2214 * _2220;
    float _2228 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2222);
    bool _2230 = _2214 > 0.0;
    bool _2232 = isnan(_2214);
    bool _2234 = _2230 || _2232;
    bool _2236 = isnan(0.0);
    bool _2238 = _2234 || _2236;
    float _2240 = _2226 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2242 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2228);
    bool _2244 = _2220 <= 0.0;
    bool _2246 = !_2238;
    bool _2248 = _2244 || _2246;
    float _2250 = _2031 + _2009;
    float _2252 = _2240 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2254 = _2009 * 0.5;
    float _2256 = _2242 + _2009;
    float _2258 = _2250 * 0.5;
    out.gl_Position.x = _2031;
    out.gl_Position.y = _2033;
    out.gl_Position.z = _2242;
    out.gl_Position.w = _2009;
    float _2260 = fma(_2033, -0.5, _2254);
    float _2262 = _2256 * 0.5;
    float _2264 = -_2224;
    float _2266 = _2264 + 1.0;
    out.m_47.x = _2252;
    float _2268 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.x = _2258;
    out.m_70.y = _2260;
    out.m_70.z = _2262;
    out.m_70.w = _2009;
    float _2270 = -_2268;
    float _2272 = _2270 + 1.0;
    float _2274 = _2268 * _2063;
    float _2276 = _2074 * _2272;
    float _2278 = _2074 * _2274;
    float _2280 = _2088 * _2274;
    float _2282 = fma(_2084, _2278, _2068);
    float _2284 = fma(_2086, _2278, _2070);
    float _2286 = fma(_2074, _2280, _2072);
    out.m_72.x = _2282;
    out.m_72.y = _2284;
    out.m_72.z = _2286;
    out.m_72.w = _2276;
    if (!_2248)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2288 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2288;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1475 = false;
    bool _759 = false;
    bool _579 = false;
    bool _295 = false;
    bool _193 = false;
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
    if (!_95)
    {
        out.m_47.x = 0.0;
    }
    int _101 = 0;
    if (!_95)
    {
        float _103 = _99 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2344 = as_type<float>(_105);
        out.gl_Position.z = _2344;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    if (_119)
    {
        float _127 = float(_91);
        _125 = _127;
    }
    float _129 = _125;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
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
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2413 = as_type<float>(_143);
        out.gl_Position.z = _2413;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = in.m_51.x;
    float _147 = in.m_51.y;
    float _149 = in.m_51.z;
    bool _151 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _153 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _155 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _157 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _159 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _153);
    float _161 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _155);
    float _163 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _157);
    float _165 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _159);
    float _167 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _161);
    float _169 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _163);
    bool _171 = !_151;
    float _173 = _169;
    float _191;
    if (!_171)
    {
        float _175 = in.m_53.x;
        float _177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _181 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _183 = _181 * _177;
        float _185 = floor(_183);
        float _187 = -_185;
        float _189 = _183 + _187;
        _191 = _189;
        _193 = true;
    }
    else
    {
        float _195 = float(_91);
        float _197 = 1.0 / _195;
        float _199 = _123 * _197;
        _191 = _199;
    }
    _193 = false;
    float _201 = _191;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = _201 + _203;
    bool _207 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _209 = isnan(_201);
    bool _211 = _207 || _209;
    bool _213 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _215 = _211 || _213;
    float _217 = float(_215);
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _219;
    float _223 = -_217;
    float _225 = _223 + 1.0;
    bool _227 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _229 = isnan(_201);
    bool _231 = _227 || _229;
    bool _233 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _235 = _231 || _233;
    float _237 = float(_235);
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _239;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _245 = 1.0 / _221;
    float _247 = _237 * _225;
    float _249 = -_237;
    float _251 = _249 + 1.0;
    float _253 = _205 * _245;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _255;
    float _259 = fma(_241, _253, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _261 = fma(_257, _253, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _263 = _259 * _247;
    float _265 = _261 * _247;
    float _267 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[143].x, _263);
    float _269 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[143].y, _265);
    float _271 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[144].x, _267);
    float _273 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[144].y, _269);
    bool _275 = !_243;
    float _293;
    if (!_275)
    {
        float _277 = in.m_53.x;
        float _279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _281 = _277 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _285 = _283 * _279;
        float _287 = floor(_285);
        float _289 = -_287;
        float _291 = _285 + _289;
        _293 = _291;
        _295 = true;
    }
    else
    {
        float _297 = float(_91);
        float _299 = 1.0 / _297;
        float _301 = _123 * _299;
        _293 = _301;
    }
    _295 = false;
    float _303 = _293;
    float _305 = in.m_55.x;
    float _307 = in.m_55.y;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _311 = _303 + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _315 = _303 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _333 = 1.0 / _319;
    bool _335 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _337 = isnan(_303);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = 1.0 / _323;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _351 = _303 + _349;
    bool _353 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _355 = isnan(_303);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = 1.0 / _331;
    float _367 = _273 * _307;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _371 = _303 + _369;
    bool _373 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _375 = _271 * _305;
    float _377 = _371 * _333;
    float _379 = 1.0 / _327;
    float _381 = _351 * _347;
    bool _383 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _385 = isnan(_303);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = -_393;
    float _397 = _395 + 1.0;
    float _399 = _311 * _365;
    bool _401 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _403 = isnan(_303);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _413;
    float _417 = _345 * _397;
    float _419 = -_345;
    float _421 = _419 + 1.0;
    bool _423 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _425 = isnan(_303);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -_411;
    float _437 = _435 + 1.0;
    float _439 = fma(_415, _377, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _441 = _315 * _379;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _447;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _455 = fma(_445, _377, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _457 = fma(_449, _377, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _459 = _411 * _421;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _465 = _363 * _437;
    float _467 = -_363;
    float _469 = _467 + 1.0;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _475 = fma(_453, _381, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _477 = fma(_463, _381, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _479 = _433 * _469;
    float _481 = fma(_473, _381, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _483 = -_433;
    float _485 = _483 + 1.0;
    float _487 = _455 * _479;
    float _489 = _457 * _479;
    float _491 = _439 * _479;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _493;
    float _497 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[107].x, _487);
    float _499 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[107].y, _489);
    float _501 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[107].z, _491);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _503;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _507;
    float _511 = fma(_475, _465, _497);
    float _513 = fma(_477, _465, _499);
    float _515 = fma(_481, _465, _501);
    float _517 = fma(_505, _441, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _519 = fma(_495, _441, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _521 = fma(_509, _441, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _535 = fma(_517, _459, _511);
    float _537 = fma(_525, _399, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _539 = fma(_529, _399, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _541 = fma(_533, _399, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _543 = fma(_519, _459, _513);
    float _545 = fma(_521, _459, _515);
    float _547 = fma(_537, _417, _535);
    float _549 = fma(_539, _417, _543);
    float _551 = fma(_541, _417, _545);
    float _553 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[111].x, _547);
    float _555 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[111].y, _549);
    float _557 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[111].z, _551);
    bool _559 = !_373;
    float _577;
    if (!_559)
    {
        float _561 = in.m_53.x;
        float _563 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _565 = _561 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _567 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _569 = _567 * _563;
        float _571 = floor(_569);
        float _573 = -_571;
        float _575 = _569 + _573;
        _577 = _575;
        _579 = true;
    }
    else
    {
        float _581 = float(_91);
        float _583 = 1.0 / _581;
        float _585 = _123 * _583;
        _577 = _585;
    }
    _579 = false;
    float _587 = _577;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _591 = _587 + _589;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _601 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _603 = isnan(_587);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _617 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _619 = isnan(_587);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = 1.0 / _595;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _631;
    float _635 = -_611;
    float _637 = _635 + 1.0;
    bool _639 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _641 = isnan(_587);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    bool _651 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _653 = 1.0 / _599;
    float _655 = 1.0 / _615;
    float _657 = _633 * _629;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _663 = _627 * _637;
    float _665 = -_627;
    float _667 = _665 + 1.0;
    float _669 = fma(_657, _591, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _671;
    float _675 = _649 * _667;
    float _677 = _661 * _653;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _681 = _587 + _679;
    bool _683 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _685 = isnan(_587);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _691 = _687 || _689;
    float _693 = float(_691);
    float _695 = _669 * _675;
    float _697 = -_649;
    float _699 = _697 + 1.0;
    float _701 = fma(_677, _681, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _705 = _587 + _703;
    float _707 = _673 * _655;
    float _709 = -_693;
    float _711 = _709 + 1.0;
    float _713 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[115].x, _695);
    float _715 = fma(_707, _705, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _717 = _611 * _711;
    float _719 = fma(_701, _663, _713);
    float _721 = _555 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _723 = fma(_715, _717, _719);
    float _725 = _553 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _727 = _557 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _729 = _721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _731 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[118].x, _723);
    float _733 = _725 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _735 = _727 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _737 = _731 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _733;
    out.m_57.y = _729;
    out.m_57.z = _735;
    out.m_57.w = _737;
    bool _739 = !_651;
    float _757;
    if (!_739)
    {
        float _741 = in.m_53.x;
        float _743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _745 = _741 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _747 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _749 = _747 * _743;
        float _751 = floor(_749);
        float _753 = -_751;
        float _755 = _749 + _753;
        _757 = _755;
        _759 = true;
    }
    else
    {
        float _761 = float(_91);
        float _763 = 1.0 / _761;
        float _765 = _123 * _763;
        _757 = _765;
    }
    _759 = false;
    float _767 = _757;
    float _769 = in.m_44.x;
    float _771 = in.m_44.y;
    float _773 = in.m_44.z;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _777 = _767 + _775;
    float _779 = as_type<float>(int(gl_VertexIndex));
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _783 = _767 + _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _785;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _793;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _799 = _767 + _797;
    float _801 = 1.0 / _787;
    float _803 = _375 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _805 = _367 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _807;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _815 = 1.0 / _791;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _817;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _823 = _821 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _825 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _827 = isnan(_767);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    bool _837 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _839 = isnan(_767);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = _771 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _851 = _771 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _853 = _771 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _855 = _167 * _167;
    float _857 = fma(_769, (*spvDescriptorSet0.vp_c10)._m0[4].x, _849);
    float _859 = fma(_769, (*spvDescriptorSet0.vp_c10)._m0[5].x, _851);
    float _861 = fma(_769, (*spvDescriptorSet0.vp_c10)._m0[6].x, _853);
    float _863 = 1.0 / _795;
    float _865 = fma(_773, (*spvDescriptorSet0.vp_c10)._m0[4].z, _857);
    float _867 = fma(_773, (*spvDescriptorSet0.vp_c10)._m0[5].z, _859);
    float _869 = fma(_773, (*spvDescriptorSet0.vp_c10)._m0[6].z, _861);
    float _871 = fma(_165, _165, _855);
    float _873 = in.m_53.x;
    float _875 = in.m_53.y;
    float _877 = _867 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _883 = fma(_169, _169, _871);
    float _885 = _865 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _887 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _889 = _877 + _887;
    float _891 = _869 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _893 = rsqrt(_883);
    float _895 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _897 = _885 + _895;
    float _899 = _889 * _889;
    float _901 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _903 = _891 + _901;
    float _905 = _777 * _863;
    float _907 = _799 * _815;
    float _909 = fma(_897, _897, _899);
    float _911 = -_847;
    float _913 = _911 + 1.0;
    float _915 = 1.0 / _881;
    float _917 = fma(_813, _907, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _919 = fma(_903, _903, _909);
    float _921 = rsqrt(_919);
    bool _923 = _873 > 0.5;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _927 = _767 + _925;
    float _929 = _169 * _893;
    bool _931 = _875 > 0.5;
    float _933 = _165 * _893;
    float _935 = _927 * _801;
    float _937 = _167 * _893;
    float _939 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _941 = _929 * _939;
    float _943 = _783 * _915;
    float _945 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _947 = _937 * _945;
    float _949 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _951 = -_941;
    float _953 = fma(_933, _949, _951);
    int _955 = as_type<int>(_779) & 1;
    bool _957 = _955 != 0;
    int _959 = as_type<int>(_779) & 2;
    bool _961 = _959 != 0;
    float _963 = fma(_809, _935, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    int _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _967 = _965 != 0;
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _971 = -_947;
    float _973 = fma(_929, _969, _971);
    int _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _977 = _975 != 0;
    float _979 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _981 = _933 * _979;
    float _983 = _953 * _953;
    float _985 = _889 * _921;
    float _987 = _897 * _921;
    float _989 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _991 = -_981;
    float _993 = fma(_937, _989, _991);
    float _995 = fma(_973, _973, _983);
    float _997 = -_985;
    float _999 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[18].w, _889);
    float _1001 = -_987;
    float _1003 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[18].w, _897);
    float _1005 = fma(_993, _993, _995);
    float _1007 = _999 * _999;
    float _1009 = _903 * _921;
    float _1011 = fma(_819, _935, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1013 = rsqrt(_1005);
    float _1015 = fma(_1003, _1003, _1007);
    float _1017 = -_1009;
    float _1019 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[18].w, _903);
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1021;
    float _1025 = fma(_1019, _1019, _1015);
    float _1027 = fma(_1023, _935, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1031 = _1029 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1033 = sqrt(_1025);
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1035;
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1041 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1039;
    float _1043 = fma(_1031, _907, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1045;
    float _1049 = fma(_823, _907, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1051 = fma(_1037, _905, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1053 = fma(_1041, _905, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1055 = _973 * _1013;
    float _1057 = _993 * _1013;
    bool _1059 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1061 = isnan(_767);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1067 = _1063 || _1065;
    float _1069 = float(_1067);
    float _1071 = fma(_1047, _905, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _1073 = !_961;
    float _1075 = _1073 ? (-0.5) : 0.5;
    float _1077 = _953 * _1013;
    float _1079 = _921 * _1033;
    float _1081 = -_835;
    float _1083 = _1081 + 1.0;
    bool _1085 = !_957;
    float _1087 = _1085 ? (-0.5) : 0.5;
    float _1089 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1075);
    bool _1091 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1093 = isnan(_767);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1099 = _1095 || _1097;
    float _1101 = float(_1099);
    float _1103 = _1069 * _1083;
    float _1105 = _805 * _1079;
    float _1107 = -_1069;
    float _1109 = _1107 + 1.0;
    float _1111 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1087);
    float _1113 = _803 * _1079;
    float _1115 = -_1101;
    float _1117 = _1115 + 1.0;
    float _1119 = _1105 * _1089;
    float _1121 = _1101 * _1109;
    float _1123 = _1113 * _1111;
    bool _1125 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1127 = isnan(_767);
    bool _1129 = _1125 || _1127;
    bool _1131 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1133 = _1129 || _1131;
    float _1135 = float(_1133);
    float _1137 = _847 * _1117;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1141 = _1139 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1143 = _933 * _1077;
    float _1145 = _937 * _1057;
    float _1147 = _1119 * _933;
    float _1149 = _1119 * _929;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1155 = -_1143;
    float _1157 = fma(_937, _1055, _1155);
    float _1159 = -_1145;
    float _1161 = fma(_929, _1077, _1159);
    float _1163 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1165 = _1163 * 0.5;
    float _1167 = fma(_1123, _1055, _1147);
    float _1169 = fma(_1123, _1057, _1149);
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1173 = _1171 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1175 = fma(_1141, _943, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1177 = fma(_1165, _1161, _1167);
    float _1179 = fma(_1165, _1157, _1169);
    float _1181 = fma(_1173, _943, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1183 = _1135 * _913;
    float _1185 = _885 + _1177;
    float _1187 = _891 + _1179;
    float _1189 = fma(_1153, _943, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1191 = _1027 * _1183;
    float _1193 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1195 = _1185 + _1193;
    float _1197 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1199 = _1187 + _1197;
    float _1201 = -_1135;
    float _1203 = _1201 + 1.0;
    float _1205 = _1011 * _1183;
    float _1207 = _1195 * _1195;
    float _1209 = _1199 * _1199;
    float _1211 = _963 * _1183;
    float _1213 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1191);
    float _1215 = _1119 * _937;
    float _1217 = _1207 + _1209;
    float _1219 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1211);
    float _1221 = fma(_1043, _1137, _1213);
    float _1223 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1205);
    float _1225 = sqrt(_1217);
    float _1227 = fma(_917, _1137, _1219);
    float _1229 = _929 * _1055;
    float _1231 = fma(_1049, _1137, _1223);
    float _1233 = fma(_1051, _1121, _1221);
    float _1235 = fma(_1053, _1121, _1227);
    float _1237 = -_1229;
    float _1239 = fma(_933, _1057, _1237);
    float _1241 = fma(_1071, _1121, _1231);
    float _1243 = fma(_1189, _1103, _1233);
    float _1245 = fma(_1175, _1103, _1235);
    float _1247 = fma(_1123, _1077, _1215);
    float _1249 = -_1075;
    int _1251 = _931 ? as_type<int>(_1249) : as_type<int>(_1075);
    float _1253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1255 = fma(_1181, _1103, _1241);
    float _1257 = fma(_1165, _1239, _1247);
    bool _1259 = !_977;
    float _1261 = _1259 ? _1075 : as_type<float>(_1251);
    float _1263 = _1075 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1265 = _1225 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1267 = _1087 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1269 = -_1087;
    int _1271 = _923 ? as_type<int>(_1269) : as_type<int>(_1087);
    float _1273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1275 = _933 * _1263;
    float _1277 = _937 * _1263;
    bool _1279 = !_967;
    float _1281 = _1279 ? _1087 : as_type<float>(_1271);
    float _1283 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1243);
    float _1285 = _877 + _1257;
    float _1287 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1245);
    float _1289 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1255);
    float _1291 = fma(_1055, _1267, _1275);
    float _1293 = fma(_1077, _1267, _1277);
    float _1295 = _1077;
    float _1297 = _1207;
    float _1299 = _1275;
    float _1301 = _1209;
    float _1303 = _1185;
    float _1305 = _883;
    float _1307 = _891;
    if (!_1265)
    {
        _1295 = _1207;
    }
    float _1309 = _1295;
    float _1311 = _1309;
    if (!_1265)
    {
        _1297 = _1187;
    }
    float _1313 = _1297;
    float _1315 = _1313;
    if (!_1265)
    {
        _1299 = _1285;
    }
    float _1317 = _1299;
    bool _1319 = !_1265;
    float _1321 = _1317;
    if (!_1319)
    {
        float _1323 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1325 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1327 = _1225 + _1325;
        float _1329 = _1285 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1331 = rsqrt(_1217);
        float _1333 = _1327 * _1323;
        float _1335 = _1333 * 0.15915493667125701904296875;
        float _1337 = _1335 * 6.283185482025146484375;
        float _1339 = sin(_1337);
        float _1341 = _1335 * 6.283185482025146484375;
        float _1343 = cos(_1341);
        float _1345 = fma(_1339, _1329, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1347 = _1331 * _1345;
        float _1349 = _1343 + (-1.0);
        float _1351 = fma(_1195, _1347, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1353 = fma(_1199, _1347, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1355 = _1349 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1357 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1359 = _1351 + _1357;
        float _1361 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1363 = _1353 + _1361;
        float _1365 = fma(_1285, _1343, _1355);
        float _1367 = _1359 * _1359;
        float _1369 = _1363 * _1363;
        _1321 = _1365;
        _1311 = _1367;
        _1301 = _1369;
        _1303 = _1351;
        _1315 = _1353;
    }
    float _1371 = _1321;
    float _1373 = _1311;
    float _1375 = _1301;
    float _1377 = _1303;
    float _1379 = _1315;
    float _1381 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1383 = _1371 + _1381;
    float _1385 = _929 * _1263;
    float _1387 = _1281 + 0.5;
    float _1389 = -_1261;
    float _1391 = _1389 + 0.5;
    float _1393 = fma(_1383, _1383, _1373);
    float _1395 = fma(_1057, _1267, _1385);
    float _1397 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1399 = _1391 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1401 = _1393 + _1375;
    float _1403 = _1283 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1405 = _1287 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1407 = _1289 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1409 = sqrt(_1401);
    float _1411 = _1161 + _1291;
    float _1413 = _1239 + _1293;
    float _1415 = _1397 * _1253;
    float _1417 = _1399 * _1273;
    float _1419 = _1403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1421 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1423 = _1407 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1425 = _1157 + _1395;
    out.m_62.x = _1415;
    out.m_62.y = _1417;
    out.m_64.x = _1419;
    out.m_64.y = _1421;
    out.m_64.z = _1423;
    bool _1427 = _1409 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1429 = isnan(_1409);
    bool _1431 = _1427 || _1429;
    bool _1433 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1435 = _1431 || _1433;
    out.m_66.x = _1411;
    out.m_66.y = _1413;
    out.m_66.z = _1425;
    float _1437 = _1401;
    float _1439 = _1377;
    if (!_1435)
    {
        _1437 = 1.0;
    }
    float _1441 = _1437;
    bool _1443 = !_1435;
    float _1445 = _1441;
    if (!_1443)
    {
        bool _1447 = _1409 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1449 = isnan(_1409);
        bool _1451 = _1447 || _1449;
        bool _1453 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1455 = _1451 || _1453;
        if (!_1455)
        {
            float _1457 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1459 = _1409 + _1457;
            float _1461 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1463 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1461;
            float _1465 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1467 = _1465 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1469 = 1.0 / _1463;
            float _1471 = _1459 * _1469;
            float _1473 = fma(_1471, _1467, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1445 = _1473;
            _1475 = true;
        }
        else
        {
            bool _1477 = _1409 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1479 = isnan(_1409);
            bool _1481 = _1477 || _1479;
            bool _1483 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1485 = _1481 || _1483;
            if (!_1485)
            {
                float _1487 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1489 = _1409 + _1487;
                float _1491 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1493 = _1491 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1495 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1497 = _1495 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1499 = 1.0 / _1493;
                float _1501 = _1489 * _1499;
                float _1503 = fma(_1501, _1497, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1445 = _1503;
                _1475 = true;
            }
            else
            {
                _1445 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1475 = false;
    float _1505 = _1445;
    float _1507 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1509 = _1371 + _1507;
    float _1511 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1513 = _1377 + _1511;
    float _1515 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1517 = _1379 + _1515;
    float _1519 = fma(_1509, _1505, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1521 = fma(_1513, _1505, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1523 = fma(_1517, _1505, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1525 = -_987;
    float _1527 = fma(_1525, (*spvDescriptorSet0.vp_c9)._m0[18].w, _885);
    float _1529 = -_877;
    float _1531 = _1529 + _1519;
    float _1533 = -_885;
    float _1535 = _1533 + _1521;
    float _1537 = -_891;
    float _1539 = _1537 + _1523;
    float _1541 = _1531 * _1531;
    float _1543 = fma(_1535, _1535, _1541);
    float _1545 = fma(_1539, _1539, _1543);
    float _1547 = sqrt(_1545);
    bool _1549 = _1547 > 0.0;
    bool _1551 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1553 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1555 = _1551 || _1553;
    bool _1557 = isnan(0.5);
    bool _1559 = _1555 || _1557;
    float _1561 = _1513;
    float _1563 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1565 = _1521;
    if (!_1549)
    {
        _1561 = _1519;
    }
    float _1567 = _1561;
    float _1569 = _1567;
    float _1571 = _1567;
    if (!_1549)
    {
        _1563 = _1523;
    }
    float _1573 = _1563;
    bool _1575 = !_1549;
    float _1577 = _1573;
    if (!_1575)
    {
        float _1579 = sqrt(_883);
        float _1581 = rsqrt(_1545);
        bool _1583 = _1579 > 0.0;
        float _1585 = _1535 * _1581;
        float _1587 = _1531 * _1581;
        float _1589 = _1539 * _1581;
        float _1591 = _1581;
        _1305 = _1579;
        if (!_1583)
        {
            _1569 = _1519;
        }
        float _1593 = _1569;
        _1571 = _1593;
        if (!_1583)
        {
            _1591 = _1523;
        }
        float _1595 = _1591;
        bool _1597 = !_1583;
        _1577 = _1595;
        if (!_1597)
        {
            float _1599 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1601 = _937 * _1587;
            float _1603 = fma(_933, _1585, _1601);
            float _1605 = fma(_929, _1589, _1603);
            float _1607 = _1599 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1609 = _1605 * _1607;
            float _1611 = fma(_165, _1609, _1521);
            float _1613 = fma(_167, _1609, _1519);
            float _1615 = fma(_169, _1609, _1523);
            _1571 = _1613;
            _1577 = _1615;
            _1565 = _1611;
        }
    }
    float _1617 = _1571;
    float _1619 = _1577;
    float _1621 = _1565;
    float _1623 = _1305;
    float _1625 = -_985;
    float _1627 = fma(_1625, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1617);
    float _1629 = -_1009;
    float _1631 = fma(_1629, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1619);
    float _1633 = -_987;
    float _1635 = fma(_1633, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1621);
    float _1637 = -_985;
    float _1639 = fma(_1637, (*spvDescriptorSet0.vp_c9)._m0[18].w, _877);
    float _1641 = -_1009;
    float _1643 = fma(_1641, (*spvDescriptorSet0.vp_c9)._m0[18].w, _891);
    float _1645 = _1627;
    float _1647 = _1635;
    float _1649 = _1631;
    float _1651 = _1623;
    if (!_1559)
    {
        float _1653 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1655 = _1639 + _1653;
        float _1657 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1659 = _1527 + _1657;
        float _1661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1663 = -_885;
        float _1665 = _1663 + _1621;
        float _1667 = _1655 * _1655;
        float _1669 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1671 = _1643 + _1669;
        float _1673 = -_877;
        float _1675 = _1673 + _1617;
        float _1677 = -_891;
        float _1679 = _1677 + _1619;
        float _1681 = fma(_1659, _1659, _1667);
        float _1683 = 1.0 / _1079;
        float _1685 = fma(_1671, _1671, _1681);
        float _1687 = sqrt(_1685);
        float _1689 = _1665 * _1683;
        float _1691 = _1675 * _1683;
        float _1693 = _1679 * _1683;
        bool _1695 = _1687 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1697 = isnan(_1687);
        bool _1699 = _1695 || _1697;
        bool _1701 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1703 = _1699 || _1701;
        float _1705 = precise::min(_1687, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1707 = _1705 * _1661;
        float _1709 = fma(_1689, _1707, _1527);
        float _1711 = fma(_1691, _1707, _1639);
        float _1713 = _1667;
        float _1715 = _1687;
        float _1717 = _1707;
        float _1719 = _1711;
        if (_1703)
        {
            float _1721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1713 = _1721;
        }
        float _1723 = _1713;
        if (_1703)
        {
            float _1725 = precise::max(_1687, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1715 = _1725;
        }
        float _1727 = _1715;
        float _1729 = fma(_1693, _1707, _1643);
        float _1731 = _1727;
        _1649 = _1729;
        if (!_1703)
        {
            _1717 = _1709;
        }
        float _1733 = _1717;
        float _1735 = _1733;
        _173 = _1723;
        if (_1703)
        {
            float _1737 = _1727 * _1723;
            _1731 = _1737;
        }
        float _1739 = _1731;
        if (_1703)
        {
            float _1741 = fma(_1689, _1739, _1527);
            _1735 = _1741;
        }
        float _1743 = _1735;
        _1647 = _1743;
        if (_1703)
        {
            float _1745 = fma(_1691, _1739, _1639);
            _1719 = _1745;
        }
        float _1747 = _1719;
        _1645 = _1747;
        if (_1703)
        {
            float _1749 = fma(_1693, _1739, _1643);
            _1649 = _1749;
        }
    }
    float _1751 = _1645;
    float _1753 = _1647;
    float _1755 = _1649;
    float _1757 = _173;
    float _1759 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1761 = _1751 + _1759;
    float _1763 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1765 = _1753 + _1763;
    float _1767 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1769 = _1755 + _1767;
    float _1771 = _1761 * _1761;
    float _1773 = fma(_1765, _1765, _1771);
    float _1775 = fma(_1769, _1769, _1773);
    float _1777 = rsqrt(_1775);
    float _1779 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1781 = _1765 * _1779;
    float _1783 = _1769 * _1779;
    float _1785 = _1781 * _1781;
    float _1787 = _1783 * _1783;
    float _1789 = _1785 + _1787;
    float _1791 = sqrt(_1789);
    bool _1793 = _1791 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1795 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1797 = _1791 + _1795;
    float _1799 = _1757;
    float _1801 = _1797;
    float _1803 = _1781;
    if (_1793)
    {
        float _1805 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1799 = _1805;
    }
    float _1807 = _1799;
    if (_1793)
    {
        float _1809 = rsqrt(_1789);
        _1651 = _1809;
    }
    float _1811 = _1651;
    float _1813 = _1811;
    if (_1793)
    {
        float _1815 = _1797 * _1807;
        _1801 = _1815;
    }
    float _1817 = _1801;
    if (_1793)
    {
        float _1819 = _1817 * 0.15915493667125701904296875;
        _1307 = _1819;
    }
    float _1821 = _1307;
    float _1823 = _1079;
    if (_1793)
    {
        float _1825 = _1821 * 6.283185482025146484375;
        float _1827 = sin(_1825);
        _1823 = _1827;
    }
    float _1829 = _1823;
    float _1831 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1833 = precise::max(0.0, _1831);
    float _1835 = _885;
    float _1837 = _1833;
    float _1839 = _1831;
    if (_1793)
    {
        float _1841 = _1821 * 6.283185482025146484375;
        float _1843 = cos(_1841);
        _1835 = _1843;
    }
    float _1845 = _1835;
    float _1847 = -_1779;
    float _1849 = -_1833;
    float _1851 = fma(_1761, _1847, _1849);
    if (!_1793)
    {
        _1837 = _1783;
    }
    float _1853 = _1837;
    float _1855 = _1853;
    if (_1793)
    {
        float _1857 = _1851 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1839 = _1857;
    }
    float _1859 = _1839;
    float _1861 = sqrt(_1775);
    float _1863 = _1829;
    float _1865 = _1859;
    if (_1793)
    {
        float _1867 = fma(_1829, _1859, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1863 = _1867;
    }
    float _1869 = _1863;
    float _1871 = _1869;
    float _1873 = _1845;
    if (_1793)
    {
        float _1875 = _1845 + (-1.0);
        _1865 = _1875;
    }
    float _1877 = _1865;
    float _1879 = _1877;
    if (_1793)
    {
        float _1881 = _1811 * _1869;
        _1439 = _1881;
    }
    float _1883 = _1439;
    if (!_1793)
    {
        _1871 = _1851;
    }
    float _1885 = _1871;
    float _1887 = _1751 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1889 = _1885;
    if (_1793)
    {
        float _1891 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1813 = _1891;
    }
    float _1893 = _1813;
    if (_1793)
    {
        float _1895 = _1781 * _1883;
        _1803 = _1895;
    }
    float _1897 = _1803;
    if (!_1793)
    {
        _1879 = _1785;
    }
    float _1899 = _1879;
    float _1901 = _1899;
    if (_1793)
    {
        float _1903 = _1783 * _1883;
        _1855 = _1903;
    }
    float _1905 = _1855;
    if (_1793)
    {
        float _1907 = fma(_1851, _1845, _1893);
        _1889 = _1907;
    }
    float _1909 = _1889;
    if (_1793)
    {
        float _1911 = _1897 * _1897;
        _1901 = _1911;
    }
    float _1913 = _1901;
    if (!_1793)
    {
        _1873 = _1787;
    }
    float _1915 = _1873;
    float _1917 = _1915;
    if (_1793)
    {
        float _1919 = _1905 * _1905;
        _1917 = _1919;
    }
    float _1921 = _1917;
    float _1923 = fma(_1909, _1909, _1913);
    float _1925 = _1923 + _1921;
    float _1927 = _1751 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1929 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1931 = fma(_1861, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1929);
    float _1933 = precise::clamp(_1931, 0.0, 1.0);
    float _1935 = _1751 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1937 = rsqrt(_1925);
    float _1939 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1927);
    float _1941 = -_1933;
    float _1943 = _1941 + 1.0;
    float _1945 = _1751 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1947 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1935);
    float _1949 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1939);
    float _1951 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1953 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1945);
    float _1955 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1947);
    float _1957 = _1949 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1959 = abs(_1943);
    float _1961 = log2(_1959);
    float _1963 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1887);
    float _1965 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1953);
    float _1967 = _1957 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1969 = _1955 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1971 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1963);
    float _1973 = _1937 * _1897;
    float _1975 = -_1967;
    float _1977 = fma(_1975, _1951, 1.0);
    float _1979 = _1965 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1981 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1983 = _1937 * _1909;
    float _1985 = _1973 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1987 = _1937 * _1905;
    float _1989 = fma(_1979, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1981);
    float _1991 = _1971 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1993 = -_1985;
    float _1995 = fma(_1983, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1993);
    float _1997 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1999 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1989);
    float _2001 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2003 = -_1987;
    float _2005 = fma(_2003, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1995);
    float _2007 = exp2(_1997);
    float _2009 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1999);
    float _2011 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2013 = fma(_2005, -0.5, 0.5);
    float _2015 = fma(_1979, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2001);
    float _2017 = fma(_2005, 0.5, 0.5);
    float _2019 = fma(_1979, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2011);
    float _2021 = _1983 + 1.0;
    float _2023 = log2(_1977);
    float _2025 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2015);
    float _2027 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2019);
    float _2029 = fma(_2017, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2031 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2025);
    float _2033 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2027);
    float _2035 = fma(_2017, _2029, -0.212114393711090087890625);
    float _2037 = 1.0 / _2009;
    float _2039 = -_1983;
    float _2041 = fma(_2007, _2021, _2039);
    float _2043 = fma(_2017, _2035, 1.570728778839111328125);
    float _2045 = sqrt(_2013);
    float _2047 = _2023 * 0.693147182464599609375;
    float _2049 = _2047 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2051 = fma(_2041, 0.5, 0.5);
    float _2053 = _2031 * _2037;
    float _2055 = _2033 * _2037;
    float _2057 = fma(_2053, 0.5, 0.5);
    float _2059 = fma(_2055, -0.5, 0.5);
    float _2061 = _2045 * 0.636619746685028076171875;
    float3 _5563 = float3(_2057, _2059, _2049);
    float _2063 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5563, float3(0.0), isnan(_5563)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5563, float3(0.0), isnan(_5563)), level(0.0)).x;
    float3 _5574 = float3(_2057, _2059, _2049);
    float4 _2066 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5574, float3(0.0), isnan(_5574)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5574, float3(0.0), isnan(_5574)), level(0.0)).xyzw;
    float _2068 = _2066.x;
    float _2070 = _2066.y;
    float _2072 = _2066.z;
    float _2074 = _2066.w;
    float _2076 = -_2043;
    float _2078 = fma(_2061, _2076, 1.0);
    float2 _5596 = float2(_2078, _2051);
    float3 _2082 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5596, float2(0.0), isnan(_5596)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5596, float2(0.0), isnan(_5596)), level(0.0)).xyz;
    float _2084 = _2082.x;
    float _2086 = _2082.y;
    float _2088 = _2082.z;
    float _2090 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_68.x = _1765;
    out.m_68.y = _1761;
    out.m_68.z = _1769;
    float _2092 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2090);
    float _2094 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2096 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2098 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2100 = _2096 || _2098;
    bool _2102 = isnan(0.5);
    bool _2104 = _2100 || _2102;
    float _2106 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2092);
    float _2108 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2094);
    float _2110 = _2106 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2112 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2108);
    float _2114 = 1.0 / _2110;
    float _2116 = _2112 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2118 = _2059;
    float _2120 = _2106;
    float _2122 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2124 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _2126 = _2110;
    float _2128 = _2057;
    if (!_2104)
    {
        _2118 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2130 = _2118;
    float _2132 = _2116 + _2110;
    if (_2104)
    {
        _2120 = 1.0;
    }
    float _2134 = _2120;
    float _2136 = _2134;
    if (!_2104)
    {
        float _2138 = -_2130;
        float _2140 = _2138 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2122 = _2140;
    }
    float _2142 = _2122;
    float _2144 = _2142;
    if (!_2104)
    {
        float _2146 = 1.0 / _2142;
        _2144 = _2146;
    }
    float _2148 = _2144;
    float _2150 = _2132 * _2114;
    float _2152 = _2150 * 0.5;
    float _2154 = _2114;
    float _2156 = _2152;
    if (!_2104)
    {
        _2154 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2158 = _2154;
    float _2160 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2162 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2160);
    float _2164 = _2158;
    if (_2104)
    {
        _2124 = 1.0;
    }
    float _2166 = _2124;
    float _2168 = _2166;
    if (!_2104)
    {
        float _2170 = -_2158;
        float _2172 = _2170 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2126 = _2172;
    }
    float _2174 = _2126;
    float _2176 = 1.0 / _2162;
    float _2178 = _2049;
    if (!_2104)
    {
        float _2180 = 1.0 / _2174;
        _2178 = _2180;
    }
    float _2182 = _2178;
    if (!_2104)
    {
        float _2184 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2186 = -_2130;
        float _2188 = fma(_2176, _2184, _2186);
        _2156 = _2188;
    }
    float _2190 = _2156;
    if (!_2104)
    {
        float _2192 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2194 = -_2158;
        float _2196 = fma(_2176, _2192, _2194);
        _2164 = _2196;
    }
    float _2198 = _2164;
    if (!_2104)
    {
        float _2200 = _2190 * _2148;
        float _2202 = precise::clamp(_2200, 0.0, 1.0);
        _2128 = _2202;
    }
    float _2204 = _2128;
    float _2206 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2208 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_2104)
    {
        float _2210 = _2198 * _2182;
        float _2212 = precise::clamp(_2210, 0.0, 1.0);
        _2136 = _2212;
    }
    float _2214 = _2136;
    if (!_2104)
    {
        float _2216 = -_2204;
        float _2218 = _2216 + 1.0;
        _2168 = _2218;
    }
    float _2220 = _2168;
    float _2222 = fma(_1979, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2206);
    float _2224 = exp2(_2208);
    float _2226 = _2214 * _2220;
    float _2228 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2222);
    bool _2230 = _2214 > 0.0;
    bool _2232 = isnan(_2214);
    bool _2234 = _2230 || _2232;
    bool _2236 = isnan(0.0);
    bool _2238 = _2234 || _2236;
    float _2240 = _2226 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2242 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2228);
    bool _2244 = _2220 <= 0.0;
    bool _2246 = !_2238;
    bool _2248 = _2244 || _2246;
    float _2250 = _2031 + _2009;
    float _2252 = _2240 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2254 = _2009 * 0.5;
    float _2256 = _2242 + _2009;
    float _2258 = _2250 * 0.5;
    out.gl_Position.x = _2031;
    out.gl_Position.y = _2033;
    out.gl_Position.z = _2242;
    out.gl_Position.w = _2009;
    float _2260 = fma(_2033, -0.5, _2254);
    float _2262 = _2256 * 0.5;
    float _2264 = -_2224;
    float _2266 = _2264 + 1.0;
    out.m_47.x = _2252;
    float _2268 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.x = _2258;
    out.m_70.y = _2260;
    out.m_70.z = _2262;
    out.m_70.w = _2009;
    float _2270 = -_2268;
    float _2272 = _2270 + 1.0;
    float _2274 = _2268 * _2063;
    float _2276 = _2074 * _2272;
    float _2278 = _2074 * _2274;
    float _2280 = _2088 * _2274;
    float _2282 = fma(_2084, _2278, _2068);
    float _2284 = fma(_2086, _2278, _2070);
    float _2286 = fma(_2074, _2280, _2072);
    out.m_72.x = _2282;
    out.m_72.y = _2284;
    out.m_72.z = _2286;
    out.m_72.w = _2276;
    if (!_2248)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2288 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2288;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

