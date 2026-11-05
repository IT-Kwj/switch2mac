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
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_54 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_58 [[user(locn4)]];
    float4 m_64 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_52 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _263 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1297 = as_type<float>(_99);
        out.gl_Position.z = _1297;
    }
    if (!_87)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_83);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _93;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1365 = as_type<float>(_135);
        out.gl_Position.z = _1365;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = in.m_52.x;
    float _145 = _141 * _139;
    int _147 = as_type<int>(_137) & 1;
    bool _149 = _147 != 0;
    int _151 = as_type<int>(_137) & 2;
    bool _153 = _151 != 0;
    float _155 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _145);
    bool _157 = !_153;
    float _159 = _157 ? (-0.5) : 0.5;
    int _161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _163 = _161 != 0;
    int _165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _167 = _165 != 0;
    float _169 = _155 * 6.283185482025146484375;
    float _171 = floor(_155);
    float _173 = _169 * 0.15915493667125701904296875;
    int _175 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _177 = _175 != 0;
    bool _179 = !_163;
    int _181 = _179 ? 0 : 1;
    float _183 = _173 * 6.283185482025146484375;
    float _185 = cos(_183);
    bool _187 = !_177;
    int _189 = _187 ? 0 : 1;
    int _191 = abs(_181);
    int _193 = abs(_189);
    float _195 = -_171;
    float _197 = _155 + _195;
    bool _199 = !_167;
    int _201 = _199 ? 0 : 1;
    float _203 = -_197;
    float _205 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _207 = float(_191);
    bool _209 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _211 = fma(_185, 0.5, 0.5);
    int _213 = abs(_201);
    float _215 = abs(_205);
    float _217 = _207 * _215;
    float _219 = float(_193);
    bool _221 = _197 < 0.5;
    float _223 = float(_221);
    float _225 = -_211;
    float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _229 = !_149;
    float _231 = _229 ? (-0.5) : 0.5;
    float _233 = -_223;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_213);
    float _239 = fma(_219, _227, _217);
    float _241 = abs(_235);
    float _243 = fma(_237, _241, _239);
    bool _245 = !_209;
    float _261;
    if (!_245)
    {
        float _247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _249 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _253 = _251 * _247;
        float _255 = floor(_253);
        float _257 = -_255;
        float _259 = _253 + _257;
        _261 = _259;
        _263 = true;
    }
    else
    {
        float _265 = float(_83);
        float _267 = 1.0 / _265;
        float _269 = _117 * _267;
        _261 = _269;
    }
    _263 = false;
    float _271 = _261;
    float _273 = in.m_42.x;
    float _275 = in.m_42.y;
    float _277 = in.m_42.z;
    float _279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _281 = in.m_52.y;
    bool _283 = _143 > 0.5;
    int _285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _287 = _285 != 0;
    int _289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _291 = _289 != 0;
    float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _301 = _295 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _303 = _275 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _305 = _275 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _307 = _275 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _309;
    float _313 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[5].x, _303);
    float _315 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[4].x, _305);
    bool _317 = _281 > 0.5;
    float _319 = 1.0 / _311;
    float _321 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[5].z, _313);
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _331 = _297 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _333 = _299 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _335 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[6].x, _307);
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _345 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[4].z, _315);
    float _347 = _321 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _349 = _323 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _351 = _325 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _353 = _327 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_54.x = _301;
    out.m_54.y = _331;
    out.m_54.z = _333;
    out.m_54.w = _329;
    float _355 = 1.0 / _339;
    float _357 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[6].z, _335);
    float _359 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _361 = _347 + _359;
    out.m_56.x = _349;
    out.m_56.y = _351;
    out.m_56.z = _353;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _365 = _271 + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _369 = _271 + _367;
    float _371 = 1.0 / _343;
    float _373 = _365 * _319;
    bool _375 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _377 = isnan(_271);
    bool _379 = _375 || _377;
    bool _381 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _383 = _379 || _381;
    float _385 = float(_383);
    float _387 = _345 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _389 = _357 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _391 = _361 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _393 = -_231;
    int _395 = _283 ? as_type<int>(_393) : as_type<int>(_231);
    float _397 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _399 = _387 + _397;
    float _401 = -_159;
    int _403 = _317 ? as_type<int>(_401) : as_type<int>(_159);
    float _405 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _407 = _389 + _405;
    bool _409 = !_287;
    float _411 = _409 ? _231 : as_type<float>(_395);
    float _413 = fma(_399, (*spvDescriptorSet0.vp_c8)._m0[28].x, _391);
    bool _415 = !_291;
    float _417 = _415 ? _159 : as_type<float>(_403);
    float _419 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[28].z, _413);
    float _421 = _411 + 0.5;
    float _423 = -_417;
    float _425 = _423 + 0.5;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _429 = _271 + _427;
    float _431 = _369 * _371;
    bool _433 = _419 >= 0.0;
    float _435 = _421 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _437 = _429 * _355;
    float _439 = _361 * _361;
    float _441 = _425 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _443;
    float _447 = _435 * _279;
    float _449 = fma(_399, _399, _439);
    float _451 = _441 * _293;
    bool _453 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _455 = isnan(_271);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _461 = _457 || _459;
    float _463 = float(_461);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _465;
    float _469 = fma(_407, _407, _449);
    float _471 = fma(_445, _373, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _473 = 0.0;
    int _475 = as_type<int>(_445);
    if (_433)
    {
        _473 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _477 = _473;
    float _479 = fma(_467, _373, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _481 = -_463;
    float _483 = _481 + 1.0;
    float _485 = rsqrt(_469);
    if (_433)
    {
        float _487 = _477 * 5.0;
        _475 = as_type<int>(_487);
    }
    int _489 = _475;
    bool _491 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _493 = isnan(_271);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    out.m_58.x = _447;
    out.m_58.y = _451;
    bool _503 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _505 = isnan(_271);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _523 = _501 * _483;
    float _525 = -_501;
    float _527 = _525 + 1.0;
    if (_433)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2020 = as_type<float>(_489);
        out.gl_Position.z = _2020;
    }
    float _529 = _513 * _527;
    if (_433)
    {
        out.m_45.x = 0.0;
    }
    float _531 = _361 * _485;
    float _533 = _399 * _485;
    if (_433)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _535 = -_531;
    float _537 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[18].w, _347);
    float _539 = -_513;
    float _541 = _539 + 1.0;
    float _543 = _407 * _485;
    float _545 = -_533;
    float _547 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[18].w, _387);
    float _549 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _551 = _537 + _549;
    float _553 = fma(_517, _431, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _555 = -_543;
    float _557 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[18].w, _389);
    float _559 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _561 = _547 + _559;
    float _563 = _551 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _565 = _385 * _541;
    float _567 = fma(_521, _431, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _569 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _571 = _557 + _569;
    float _573 = fma(_561, (*spvDescriptorSet0.vp_c8)._m0[28].x, _563);
    float _575 = -_385;
    float _577 = _575 + 1.0;
    float _579 = _471 * _565;
    float _581 = _479 * _565;
    float _583 = fma(_571, (*spvDescriptorSet0.vp_c8)._m0[28].z, _573);
    float _585 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[143].x, _579);
    float _587 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[143].y, _581);
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _589;
    float _593 = -_531;
    float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[18].w, _361);
    bool _597 = _583 >= 0.0;
    float _599 = in.m_60.x;
    float _601 = in.m_60.y;
    float _603 = fma(_591, _437, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _605 = -_533;
    float _607 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[18].w, _399);
    float _609 = _595 * _595;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _611;
    float _615 = fma(_553, _529, _585);
    float _617 = -_543;
    float _619 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[18].w, _407);
    float _621 = fma(_607, _607, _609);
    float _623 = fma(_613, _437, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _625 = fma(_567, _529, _587);
    float _627 = fma(_603, _523, _615);
    float _629 = fma(_619, _619, _621);
    float _631 = _627;
    float _633 = _551;
    if (_597)
    {
        out.m_45.x = 0.0;
    }
    float _635 = fma(_623, _523, _625);
    float _637 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[146].x, _627);
    if (_597)
    {
        _631 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _639 = _631;
    float _641 = sqrt(_629);
    float _643 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[146].y, _635);
    int _645 = as_type<int>(_639);
    if (_597)
    {
        float _647 = _639 * 5.0;
        _645 = as_type<int>(_647);
    }
    int _649 = _645;
    float _651 = _637 * _599;
    if (_597)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2253 = as_type<float>(_649);
        out.gl_Position.z = _2253;
    }
    float _653 = _643 * _601;
    if (_597)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _655 = _243 * _653;
    float _657 = _243 * _651;
    float _659 = _485 * _641;
    float _661 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _159);
    float _663 = _655 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _665 = _657 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _667 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _231);
    float _669 = _659 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _671 = _669 * 0.5;
    float _673 = _659 * _663;
    float _675 = _659 * _665;
    bool _677 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _679 = isnan(0.5);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _685 = _681 || _683;
    float _687 = _661 * _673;
    float _689 = _667 * _675;
    float _691 = _687 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _693 = _687 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _695 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[26].x, _691);
    float _697 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[24].x, _693);
    float _699 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[26].z, _695);
    float _701 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[24].z, _697);
    float _703 = _699 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _705 = _701 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _707 = _389 + _703;
    float _709 = _387 + _705;
    float _711 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _713 = _707 + _711;
    float _715 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _717 = _709 + _715;
    float _719 = _713 * _713;
    float _721 = fma(_717, _717, _719);
    float _723 = _687 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _725 = sqrt(_721);
    float _727 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[25].x, _723);
    float _729 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[25].z, _727);
    float _731 = _729 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _733 = _347 + _731;
    bool _735 = _725 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _737 = _731;
    float _739 = _729;
    float _741 = _709;
    float _743 = _733;
    if (!_735)
    {
        _737 = _707;
    }
    float _745 = _737;
    float _747 = _745;
    if (!_735)
    {
        _739 = _733;
    }
    float _749 = _739;
    bool _751 = !_735;
    float _753 = _749;
    if (!_751)
    {
        float _755 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _757 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _759 = _725 + _757;
        float _761 = _733 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _763 = _759 * _755;
        float _765 = rsqrt(_721);
        float _767 = _763 * 0.15915493667125701904296875;
        float _769 = _767 * 6.283185482025146484375;
        float _771 = cos(_769);
        float _773 = _767 * 6.283185482025146484375;
        float _775 = sin(_773);
        float _777 = _771 + (-1.0);
        float _779 = _777 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _781 = fma(_775, _761, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _783 = fma(_733, _771, _779);
        float _785 = _765 * _781;
        float _787 = fma(_717, _785, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _789 = fma(_713, _785, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _741 = _787;
        _753 = _783;
        _747 = _789;
    }
    float _791 = _741;
    float _793 = _753;
    float _795 = _747;
    float _797 = -_533;
    float _799 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[18].w, _791);
    float _801 = -_531;
    float _803 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[18].w, _793);
    float _805 = -_543;
    float _807 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[18].w, _795);
    float _809 = _803;
    float _811 = _799;
    float _813 = _807;
    if (!_685)
    {
        float _815 = _551 * _551;
        float _817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _819 = -_389;
        float _821 = _819 + _795;
        float _823 = -_387;
        float _825 = _823 + _791;
        float _827 = fma(_561, _561, _815);
        float _829 = -_347;
        float _831 = _829 + _793;
        float _833 = fma(_571, _571, _827);
        float _835 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _837 = sqrt(_833);
        float _839 = 1.0 / _659;
        float _841 = precise::min(_837, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _843 = _841 * _817;
        float _845 = _835 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _847 = _843 * _839;
        float _849 = _845 * _847;
        float _851 = _821 * _847;
        float _853 = fma(_825, _849, _547);
        float _855 = fma(_831, _849, _537);
        float _857 = fma(_845, _851, _557);
        _809 = _855;
        _811 = _853;
        _813 = _857;
        _743 = _839;
    }
    float _859 = _809;
    float _861 = _811;
    float _863 = _813;
    float _865 = _743;
    float _867 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _869 = _859 + _867;
    float _871 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _873 = _861 + _871;
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _877 = _863 + _875;
    float _879 = _869 * _869;
    float _881 = fma(_873, _873, _879);
    float _883 = fma(_877, _877, _881);
    float _885 = rsqrt(_883);
    float _887 = _885 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _889 = _873 * _887;
    float _891 = _877 * _887;
    float _893 = _889 * _889;
    float _895 = _891 * _891;
    float _897 = _893 + _895;
    float _899 = sqrt(_897);
    bool _901 = _899 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _903 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _905 = _899 + _903;
    float _907 = _881;
    float _909 = _905;
    float _911 = _865;
    float _913 = _869;
    float _915 = _889;
    float _917 = _887;
    if (_901)
    {
        float _919 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _907 = _919;
    }
    float _921 = _907;
    float _923 = _921;
    if (_901)
    {
        float _925 = _905 * _921;
        _909 = _925;
    }
    float _927 = _909;
    if (_901)
    {
        float _929 = rsqrt(_897);
        _923 = _929;
    }
    float _931 = _923;
    float _933 = _931;
    if (_901)
    {
        float _935 = _927 * 0.15915493667125701904296875;
        _911 = _935;
    }
    float _937 = _911;
    float _939 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _941 = _885;
    if (_901)
    {
        float _943 = _937 * 6.283185482025146484375;
        float _945 = sin(_943);
        _941 = _945;
    }
    float _947 = _941;
    float _949 = precise::max(0.0, _939);
    float _951 = _877;
    float _953 = _949;
    if (_901)
    {
        float _955 = _937 * 6.283185482025146484375;
        float _957 = cos(_955);
        _951 = _957;
    }
    float _959 = _951;
    float _961 = -_887;
    float _963 = -_949;
    float _965 = fma(_869, _961, _963);
    float _967 = _965;
    if (_901)
    {
        float _969 = _965 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _913 = _969;
    }
    float _971 = _913;
    float _973 = _947;
    float _975 = _971;
    if (_901)
    {
        float _977 = fma(_947, _971, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _973 = _977;
    }
    float _979 = _973;
    if (!_901)
    {
        _975 = _893;
    }
    float _981 = _975;
    float _983 = _981;
    if (_901)
    {
        float _985 = _931 * _979;
        _633 = _985;
    }
    float _987 = _633;
    if (!_901)
    {
        _933 = _891;
    }
    float _989 = _933;
    float _991 = sqrt(_883);
    float _993 = _989;
    if (_901)
    {
        float _995 = _959 + (-1.0);
        _953 = _995;
    }
    float _997 = _953;
    float _999 = _997;
    if (_901)
    {
        float _1001 = _889 * _987;
        _915 = _1001;
    }
    float _1003 = _915;
    if (_901)
    {
        float _1005 = _891 * _987;
        _993 = _1005;
    }
    float _1007 = _993;
    if (_901)
    {
        float _1009 = _997 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _917 = _1009;
    }
    float _1011 = _917;
    if (_901)
    {
        float _1013 = _1003 * _1003;
        _983 = _1013;
    }
    float _1015 = _983;
    if (!_901)
    {
        _999 = _895;
    }
    float _1017 = _999;
    float _1019 = _1017;
    if (_901)
    {
        float _1021 = _1007 * _1007;
        _1019 = _1021;
    }
    float _1023 = _1019;
    if (_901)
    {
        float _1025 = fma(_965, _959, _1011);
        _967 = _1025;
    }
    float _1027 = _967;
    float _1029 = _859 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1031 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1033 = fma(_1027, _1027, _1015);
    float _1035 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1037 = fma(_991, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1035);
    float _1039 = precise::clamp(_1037, 0.0, 1.0);
    float _1041 = _1033 + _1023;
    float _1043 = _859 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1045 = -_1039;
    float _1047 = _1045 + 1.0;
    float _1049 = rsqrt(_1041);
    float _1051 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1043);
    float _1053 = _859 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1055 = _859 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1057 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1029);
    float _1059 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1051);
    float _1061 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1053);
    float _1063 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1055);
    float _1065 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1057);
    float _1067 = _1059 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1069 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1061);
    float _1071 = abs(_1047);
    float _1073 = log2(_1071);
    float _1075 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1063);
    float _1077 = _1065 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1079 = _1069 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1081 = _1067 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1083 = _1049 * _1003;
    float _1085 = _1049 * _1027;
    float _1087 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1089 = _1049 * _1007;
    float _1091 = _1083 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1093 = _1075 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1095 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1087);
    float _1097 = -_1081;
    float _1099 = fma(_1097, _1031, 1.0);
    float _1101 = -_1091;
    float _1103 = fma(_1085, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1101);
    float _1105 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1107 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1095);
    float _1109 = _1073 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1111 = -_1089;
    float _1113 = fma(_1111, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1103);
    float _1115 = log2(_1099);
    float _1117 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1107);
    float _1119 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1121 = fma(_1113, -0.5, 0.5);
    float _1123 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1105);
    float _1125 = fma(_1113, 0.5, 0.5);
    float _1127 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1119);
    float _1129 = _1085 + 1.0;
    float _1131 = exp2(_1109);
    float _1133 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1123);
    float _1135 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1127);
    float _1137 = fma(_1125, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1139 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1133);
    float _1141 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1135);
    float _1143 = fma(_1125, _1137, -0.212114393711090087890625);
    float _1145 = 1.0 / _1117;
    float _1147 = _1115 * 0.693147182464599609375;
    float _1149 = fma(_1125, _1143, 1.570728778839111328125);
    float _1151 = _1147 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1153 = sqrt(_1121);
    float _1155 = -_1085;
    float _1157 = fma(_1131, _1129, _1155);
    float _1159 = fma(_1157, 0.5, 0.5);
    float _1161 = _1139 * _1145;
    float _1163 = _1141 * _1145;
    float _1165 = fma(_1161, 0.5, 0.5);
    float _1167 = fma(_1163, -0.5, 0.5);
    float _1169 = _1153 * 0.636619746685028076171875;
    float3 _3107 = float3(_1165, _1167, _1151);
    float _1171 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3107, float3(0.0), isnan(_3107)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3107, float3(0.0), isnan(_3107)), level(0.0)).x;
    float3 _3118 = float3(_1165, _1167, _1151);
    float4 _1174 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3118, float3(0.0), isnan(_3118)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3118, float3(0.0), isnan(_3118)), level(0.0)).xyzw;
    float _1176 = _1174.x;
    float _1178 = _1174.y;
    float _1180 = _1174.z;
    float _1182 = _1174.w;
    float _1184 = -_1149;
    float _1186 = fma(_1169, _1184, 1.0);
    float2 _3140 = float2(_1186, _1159);
    float3 _1190 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3140, float2(0.0), isnan(_3140)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3140, float2(0.0), isnan(_3140)), level(0.0)).xyz;
    float _1192 = _1190.x;
    float _1194 = _1190.y;
    float _1196 = _1190.z;
    float _1198 = _1073 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1200 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1202 = _243 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1204 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1200);
    float _1206 = exp2(_1198);
    float _1208 = _1202 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1210 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1204);
    out.m_45.x = _1208;
    float _1212 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1210);
    float _1214 = _1212 + _1117;
    out.gl_Position.x = _1139;
    out.gl_Position.y = _1141;
    out.gl_Position.z = _1212;
    out.gl_Position.w = _1117;
    float _1216 = _1214 * 0.5;
    float _1218 = -_1206;
    float _1220 = _1218 + 1.0;
    float _1222 = _1220 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _1216;
    out.m_62.w = _1117;
    float _1224 = _1222 * _1171;
    float _1226 = -_1222;
    float _1228 = _1226 + 1.0;
    float _1230 = _1182 * _1224;
    float _1232 = _1196 * _1224;
    float _1234 = fma(_1192, _1230, _1176);
    float _1236 = fma(_1194, _1230, _1178);
    float _1238 = _1182 * _1228;
    float _1240 = fma(_1182, _1232, _1180);
    out.m_64.x = _1234;
    out.m_64.y = _1236;
    out.m_64.z = _1240;
    out.m_64.w = _1238;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _263 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1297 = as_type<float>(_99);
        out.gl_Position.z = _1297;
    }
    if (!_87)
    {
        return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_83);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _93;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1365 = as_type<float>(_135);
        out.gl_Position.z = _1365;
    }
    if (_129)
    {
        return out;
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = in.m_52.x;
    float _145 = _141 * _139;
    int _147 = as_type<int>(_137) & 1;
    bool _149 = _147 != 0;
    int _151 = as_type<int>(_137) & 2;
    bool _153 = _151 != 0;
    float _155 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _145);
    bool _157 = !_153;
    float _159 = _157 ? (-0.5) : 0.5;
    int _161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _163 = _161 != 0;
    int _165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _167 = _165 != 0;
    float _169 = _155 * 6.283185482025146484375;
    float _171 = floor(_155);
    float _173 = _169 * 0.15915493667125701904296875;
    int _175 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _177 = _175 != 0;
    bool _179 = !_163;
    int _181 = _179 ? 0 : 1;
    float _183 = _173 * 6.283185482025146484375;
    float _185 = cos(_183);
    bool _187 = !_177;
    int _189 = _187 ? 0 : 1;
    int _191 = abs(_181);
    int _193 = abs(_189);
    float _195 = -_171;
    float _197 = _155 + _195;
    bool _199 = !_167;
    int _201 = _199 ? 0 : 1;
    float _203 = -_197;
    float _205 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _207 = float(_191);
    bool _209 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _211 = fma(_185, 0.5, 0.5);
    int _213 = abs(_201);
    float _215 = abs(_205);
    float _217 = _207 * _215;
    float _219 = float(_193);
    bool _221 = _197 < 0.5;
    float _223 = float(_221);
    float _225 = -_211;
    float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _229 = !_149;
    float _231 = _229 ? (-0.5) : 0.5;
    float _233 = -_223;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_213);
    float _239 = fma(_219, _227, _217);
    float _241 = abs(_235);
    float _243 = fma(_237, _241, _239);
    bool _245 = !_209;
    float _261;
    if (!_245)
    {
        float _247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _249 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _253 = _251 * _247;
        float _255 = floor(_253);
        float _257 = -_255;
        float _259 = _253 + _257;
        _261 = _259;
        _263 = true;
    }
    else
    {
        float _265 = float(_83);
        float _267 = 1.0 / _265;
        float _269 = _117 * _267;
        _261 = _269;
    }
    _263 = false;
    float _271 = _261;
    float _273 = in.m_42.x;
    float _275 = in.m_42.y;
    float _277 = in.m_42.z;
    float _279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _281 = in.m_52.y;
    bool _283 = _143 > 0.5;
    int _285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _287 = _285 != 0;
    int _289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _291 = _289 != 0;
    float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _301 = _295 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _303 = _275 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _305 = _275 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _307 = _275 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _309;
    float _313 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[5].x, _303);
    float _315 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[4].x, _305);
    bool _317 = _281 > 0.5;
    float _319 = 1.0 / _311;
    float _321 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[5].z, _313);
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _331 = _297 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _333 = _299 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _335 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[6].x, _307);
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _345 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[4].z, _315);
    float _347 = _321 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _349 = _323 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _351 = _325 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _353 = _327 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_54.x = _301;
    out.m_54.y = _331;
    out.m_54.z = _333;
    out.m_54.w = _329;
    float _355 = 1.0 / _339;
    float _357 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[6].z, _335);
    float _359 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _361 = _347 + _359;
    out.m_56.x = _349;
    out.m_56.y = _351;
    out.m_56.z = _353;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _365 = _271 + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _369 = _271 + _367;
    float _371 = 1.0 / _343;
    float _373 = _365 * _319;
    bool _375 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _377 = isnan(_271);
    bool _379 = _375 || _377;
    bool _381 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _383 = _379 || _381;
    float _385 = float(_383);
    float _387 = _345 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _389 = _357 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _391 = _361 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _393 = -_231;
    int _395 = _283 ? as_type<int>(_393) : as_type<int>(_231);
    float _397 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _399 = _387 + _397;
    float _401 = -_159;
    int _403 = _317 ? as_type<int>(_401) : as_type<int>(_159);
    float _405 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _407 = _389 + _405;
    bool _409 = !_287;
    float _411 = _409 ? _231 : as_type<float>(_395);
    float _413 = fma(_399, (*spvDescriptorSet0.vp_c8)._m0[28].x, _391);
    bool _415 = !_291;
    float _417 = _415 ? _159 : as_type<float>(_403);
    float _419 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[28].z, _413);
    float _421 = _411 + 0.5;
    float _423 = -_417;
    float _425 = _423 + 0.5;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _429 = _271 + _427;
    float _431 = _369 * _371;
    bool _433 = _419 >= 0.0;
    float _435 = _421 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _437 = _429 * _355;
    float _439 = _361 * _361;
    float _441 = _425 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _443;
    float _447 = _435 * _279;
    float _449 = fma(_399, _399, _439);
    float _451 = _441 * _293;
    bool _453 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _455 = isnan(_271);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _461 = _457 || _459;
    float _463 = float(_461);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _465;
    float _469 = fma(_407, _407, _449);
    float _471 = fma(_445, _373, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _473 = 0.0;
    int _475 = as_type<int>(_445);
    if (_433)
    {
        _473 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _477 = _473;
    float _479 = fma(_467, _373, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _481 = -_463;
    float _483 = _481 + 1.0;
    float _485 = rsqrt(_469);
    if (_433)
    {
        float _487 = _477 * 5.0;
        _475 = as_type<int>(_487);
    }
    int _489 = _475;
    bool _491 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _493 = isnan(_271);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    out.m_58.x = _447;
    out.m_58.y = _451;
    bool _503 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _505 = isnan(_271);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _523 = _501 * _483;
    float _525 = -_501;
    float _527 = _525 + 1.0;
    if (_433)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2020 = as_type<float>(_489);
        out.gl_Position.z = _2020;
    }
    float _529 = _513 * _527;
    if (_433)
    {
        out.m_45.x = 0.0;
    }
    float _531 = _361 * _485;
    float _533 = _399 * _485;
    if (_433)
    {
        return out;
    }
    float _535 = -_531;
    float _537 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[18].w, _347);
    float _539 = -_513;
    float _541 = _539 + 1.0;
    float _543 = _407 * _485;
    float _545 = -_533;
    float _547 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[18].w, _387);
    float _549 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _551 = _537 + _549;
    float _553 = fma(_517, _431, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _555 = -_543;
    float _557 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[18].w, _389);
    float _559 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _561 = _547 + _559;
    float _563 = _551 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _565 = _385 * _541;
    float _567 = fma(_521, _431, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _569 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _571 = _557 + _569;
    float _573 = fma(_561, (*spvDescriptorSet0.vp_c8)._m0[28].x, _563);
    float _575 = -_385;
    float _577 = _575 + 1.0;
    float _579 = _471 * _565;
    float _581 = _479 * _565;
    float _583 = fma(_571, (*spvDescriptorSet0.vp_c8)._m0[28].z, _573);
    float _585 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[143].x, _579);
    float _587 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[143].y, _581);
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _589;
    float _593 = -_531;
    float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[18].w, _361);
    bool _597 = _583 >= 0.0;
    float _599 = in.m_60.x;
    float _601 = in.m_60.y;
    float _603 = fma(_591, _437, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _605 = -_533;
    float _607 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[18].w, _399);
    float _609 = _595 * _595;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _611;
    float _615 = fma(_553, _529, _585);
    float _617 = -_543;
    float _619 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[18].w, _407);
    float _621 = fma(_607, _607, _609);
    float _623 = fma(_613, _437, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _625 = fma(_567, _529, _587);
    float _627 = fma(_603, _523, _615);
    float _629 = fma(_619, _619, _621);
    float _631 = _627;
    float _633 = _551;
    if (_597)
    {
        out.m_45.x = 0.0;
    }
    float _635 = fma(_623, _523, _625);
    float _637 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[146].x, _627);
    if (_597)
    {
        _631 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _639 = _631;
    float _641 = sqrt(_629);
    float _643 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[146].y, _635);
    int _645 = as_type<int>(_639);
    if (_597)
    {
        float _647 = _639 * 5.0;
        _645 = as_type<int>(_647);
    }
    int _649 = _645;
    float _651 = _637 * _599;
    if (_597)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2253 = as_type<float>(_649);
        out.gl_Position.z = _2253;
    }
    float _653 = _643 * _601;
    if (_597)
    {
        return out;
    }
    float _655 = _243 * _653;
    float _657 = _243 * _651;
    float _659 = _485 * _641;
    float _661 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _159);
    float _663 = _655 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _665 = _657 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _667 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _231);
    float _669 = _659 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _671 = _669 * 0.5;
    float _673 = _659 * _663;
    float _675 = _659 * _665;
    bool _677 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _679 = isnan(0.5);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _685 = _681 || _683;
    float _687 = _661 * _673;
    float _689 = _667 * _675;
    float _691 = _687 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _693 = _687 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _695 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[26].x, _691);
    float _697 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[24].x, _693);
    float _699 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[26].z, _695);
    float _701 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[24].z, _697);
    float _703 = _699 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _705 = _701 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _707 = _389 + _703;
    float _709 = _387 + _705;
    float _711 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _713 = _707 + _711;
    float _715 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _717 = _709 + _715;
    float _719 = _713 * _713;
    float _721 = fma(_717, _717, _719);
    float _723 = _687 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _725 = sqrt(_721);
    float _727 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[25].x, _723);
    float _729 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[25].z, _727);
    float _731 = _729 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _733 = _347 + _731;
    bool _735 = _725 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _737 = _731;
    float _739 = _729;
    float _741 = _709;
    float _743 = _733;
    if (!_735)
    {
        _737 = _707;
    }
    float _745 = _737;
    float _747 = _745;
    if (!_735)
    {
        _739 = _733;
    }
    float _749 = _739;
    bool _751 = !_735;
    float _753 = _749;
    if (!_751)
    {
        float _755 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _757 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _759 = _725 + _757;
        float _761 = _733 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _763 = _759 * _755;
        float _765 = rsqrt(_721);
        float _767 = _763 * 0.15915493667125701904296875;
        float _769 = _767 * 6.283185482025146484375;
        float _771 = cos(_769);
        float _773 = _767 * 6.283185482025146484375;
        float _775 = sin(_773);
        float _777 = _771 + (-1.0);
        float _779 = _777 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _781 = fma(_775, _761, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _783 = fma(_733, _771, _779);
        float _785 = _765 * _781;
        float _787 = fma(_717, _785, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _789 = fma(_713, _785, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _741 = _787;
        _753 = _783;
        _747 = _789;
    }
    float _791 = _741;
    float _793 = _753;
    float _795 = _747;
    float _797 = -_533;
    float _799 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[18].w, _791);
    float _801 = -_531;
    float _803 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[18].w, _793);
    float _805 = -_543;
    float _807 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[18].w, _795);
    float _809 = _803;
    float _811 = _799;
    float _813 = _807;
    if (!_685)
    {
        float _815 = _551 * _551;
        float _817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _819 = -_389;
        float _821 = _819 + _795;
        float _823 = -_387;
        float _825 = _823 + _791;
        float _827 = fma(_561, _561, _815);
        float _829 = -_347;
        float _831 = _829 + _793;
        float _833 = fma(_571, _571, _827);
        float _835 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _837 = sqrt(_833);
        float _839 = 1.0 / _659;
        float _841 = precise::min(_837, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _843 = _841 * _817;
        float _845 = _835 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _847 = _843 * _839;
        float _849 = _845 * _847;
        float _851 = _821 * _847;
        float _853 = fma(_825, _849, _547);
        float _855 = fma(_831, _849, _537);
        float _857 = fma(_845, _851, _557);
        _809 = _855;
        _811 = _853;
        _813 = _857;
        _743 = _839;
    }
    float _859 = _809;
    float _861 = _811;
    float _863 = _813;
    float _865 = _743;
    float _867 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _869 = _859 + _867;
    float _871 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _873 = _861 + _871;
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _877 = _863 + _875;
    float _879 = _869 * _869;
    float _881 = fma(_873, _873, _879);
    float _883 = fma(_877, _877, _881);
    float _885 = rsqrt(_883);
    float _887 = _885 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _889 = _873 * _887;
    float _891 = _877 * _887;
    float _893 = _889 * _889;
    float _895 = _891 * _891;
    float _897 = _893 + _895;
    float _899 = sqrt(_897);
    bool _901 = _899 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _903 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _905 = _899 + _903;
    float _907 = _881;
    float _909 = _905;
    float _911 = _865;
    float _913 = _869;
    float _915 = _889;
    float _917 = _887;
    if (_901)
    {
        float _919 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _907 = _919;
    }
    float _921 = _907;
    float _923 = _921;
    if (_901)
    {
        float _925 = _905 * _921;
        _909 = _925;
    }
    float _927 = _909;
    if (_901)
    {
        float _929 = rsqrt(_897);
        _923 = _929;
    }
    float _931 = _923;
    float _933 = _931;
    if (_901)
    {
        float _935 = _927 * 0.15915493667125701904296875;
        _911 = _935;
    }
    float _937 = _911;
    float _939 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _941 = _885;
    if (_901)
    {
        float _943 = _937 * 6.283185482025146484375;
        float _945 = sin(_943);
        _941 = _945;
    }
    float _947 = _941;
    float _949 = precise::max(0.0, _939);
    float _951 = _877;
    float _953 = _949;
    if (_901)
    {
        float _955 = _937 * 6.283185482025146484375;
        float _957 = cos(_955);
        _951 = _957;
    }
    float _959 = _951;
    float _961 = -_887;
    float _963 = -_949;
    float _965 = fma(_869, _961, _963);
    float _967 = _965;
    if (_901)
    {
        float _969 = _965 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _913 = _969;
    }
    float _971 = _913;
    float _973 = _947;
    float _975 = _971;
    if (_901)
    {
        float _977 = fma(_947, _971, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _973 = _977;
    }
    float _979 = _973;
    if (!_901)
    {
        _975 = _893;
    }
    float _981 = _975;
    float _983 = _981;
    if (_901)
    {
        float _985 = _931 * _979;
        _633 = _985;
    }
    float _987 = _633;
    if (!_901)
    {
        _933 = _891;
    }
    float _989 = _933;
    float _991 = sqrt(_883);
    float _993 = _989;
    if (_901)
    {
        float _995 = _959 + (-1.0);
        _953 = _995;
    }
    float _997 = _953;
    float _999 = _997;
    if (_901)
    {
        float _1001 = _889 * _987;
        _915 = _1001;
    }
    float _1003 = _915;
    if (_901)
    {
        float _1005 = _891 * _987;
        _993 = _1005;
    }
    float _1007 = _993;
    if (_901)
    {
        float _1009 = _997 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _917 = _1009;
    }
    float _1011 = _917;
    if (_901)
    {
        float _1013 = _1003 * _1003;
        _983 = _1013;
    }
    float _1015 = _983;
    if (!_901)
    {
        _999 = _895;
    }
    float _1017 = _999;
    float _1019 = _1017;
    if (_901)
    {
        float _1021 = _1007 * _1007;
        _1019 = _1021;
    }
    float _1023 = _1019;
    if (_901)
    {
        float _1025 = fma(_965, _959, _1011);
        _967 = _1025;
    }
    float _1027 = _967;
    float _1029 = _859 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1031 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1033 = fma(_1027, _1027, _1015);
    float _1035 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1037 = fma(_991, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1035);
    float _1039 = precise::clamp(_1037, 0.0, 1.0);
    float _1041 = _1033 + _1023;
    float _1043 = _859 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1045 = -_1039;
    float _1047 = _1045 + 1.0;
    float _1049 = rsqrt(_1041);
    float _1051 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1043);
    float _1053 = _859 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1055 = _859 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1057 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1029);
    float _1059 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1051);
    float _1061 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1053);
    float _1063 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1055);
    float _1065 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1057);
    float _1067 = _1059 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1069 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1061);
    float _1071 = abs(_1047);
    float _1073 = log2(_1071);
    float _1075 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1063);
    float _1077 = _1065 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1079 = _1069 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1081 = _1067 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1083 = _1049 * _1003;
    float _1085 = _1049 * _1027;
    float _1087 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1089 = _1049 * _1007;
    float _1091 = _1083 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1093 = _1075 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1095 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1087);
    float _1097 = -_1081;
    float _1099 = fma(_1097, _1031, 1.0);
    float _1101 = -_1091;
    float _1103 = fma(_1085, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1101);
    float _1105 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1107 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1095);
    float _1109 = _1073 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1111 = -_1089;
    float _1113 = fma(_1111, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1103);
    float _1115 = log2(_1099);
    float _1117 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1107);
    float _1119 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1121 = fma(_1113, -0.5, 0.5);
    float _1123 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1105);
    float _1125 = fma(_1113, 0.5, 0.5);
    float _1127 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1119);
    float _1129 = _1085 + 1.0;
    float _1131 = exp2(_1109);
    float _1133 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1123);
    float _1135 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1127);
    float _1137 = fma(_1125, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1139 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1133);
    float _1141 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1135);
    float _1143 = fma(_1125, _1137, -0.212114393711090087890625);
    float _1145 = 1.0 / _1117;
    float _1147 = _1115 * 0.693147182464599609375;
    float _1149 = fma(_1125, _1143, 1.570728778839111328125);
    float _1151 = _1147 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1153 = sqrt(_1121);
    float _1155 = -_1085;
    float _1157 = fma(_1131, _1129, _1155);
    float _1159 = fma(_1157, 0.5, 0.5);
    float _1161 = _1139 * _1145;
    float _1163 = _1141 * _1145;
    float _1165 = fma(_1161, 0.5, 0.5);
    float _1167 = fma(_1163, -0.5, 0.5);
    float _1169 = _1153 * 0.636619746685028076171875;
    float3 _3107 = float3(_1165, _1167, _1151);
    float _1171 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3107, float3(0.0), isnan(_3107)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3107, float3(0.0), isnan(_3107)), level(0.0)).x;
    float3 _3118 = float3(_1165, _1167, _1151);
    float4 _1174 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3118, float3(0.0), isnan(_3118)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3118, float3(0.0), isnan(_3118)), level(0.0)).xyzw;
    float _1176 = _1174.x;
    float _1178 = _1174.y;
    float _1180 = _1174.z;
    float _1182 = _1174.w;
    float _1184 = -_1149;
    float _1186 = fma(_1169, _1184, 1.0);
    float2 _3140 = float2(_1186, _1159);
    float3 _1190 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3140, float2(0.0), isnan(_3140)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3140, float2(0.0), isnan(_3140)), level(0.0)).xyz;
    float _1192 = _1190.x;
    float _1194 = _1190.y;
    float _1196 = _1190.z;
    float _1198 = _1073 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1200 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1202 = _243 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1204 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1200);
    float _1206 = exp2(_1198);
    float _1208 = _1202 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1210 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1204);
    out.m_45.x = _1208;
    float _1212 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1210);
    float _1214 = _1212 + _1117;
    out.gl_Position.x = _1139;
    out.gl_Position.y = _1141;
    out.gl_Position.z = _1212;
    out.gl_Position.w = _1117;
    float _1216 = _1214 * 0.5;
    float _1218 = -_1206;
    float _1220 = _1218 + 1.0;
    float _1222 = _1220 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _1216;
    out.m_62.w = _1117;
    float _1224 = _1222 * _1171;
    float _1226 = -_1222;
    float _1228 = _1226 + 1.0;
    float _1230 = _1182 * _1224;
    float _1232 = _1196 * _1224;
    float _1234 = fma(_1192, _1230, _1176);
    float _1236 = fma(_1194, _1230, _1178);
    float _1238 = _1182 * _1228;
    float _1240 = fma(_1182, _1232, _1180);
    out.m_64.x = _1234;
    out.m_64.y = _1236;
    out.m_64.z = _1240;
    out.m_64.w = _1238;
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
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _263 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1297 = as_type<float>(_99);
        out.gl_Position.z = _1297;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_83);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _93;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1365 = as_type<float>(_135);
        out.gl_Position.z = _1365;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = in.m_52.x;
    float _145 = _141 * _139;
    int _147 = as_type<int>(_137) & 1;
    bool _149 = _147 != 0;
    int _151 = as_type<int>(_137) & 2;
    bool _153 = _151 != 0;
    float _155 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _145);
    bool _157 = !_153;
    float _159 = _157 ? (-0.5) : 0.5;
    int _161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _163 = _161 != 0;
    int _165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _167 = _165 != 0;
    float _169 = _155 * 6.283185482025146484375;
    float _171 = floor(_155);
    float _173 = _169 * 0.15915493667125701904296875;
    int _175 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _177 = _175 != 0;
    bool _179 = !_163;
    int _181 = _179 ? 0 : 1;
    float _183 = _173 * 6.283185482025146484375;
    float _185 = cos(_183);
    bool _187 = !_177;
    int _189 = _187 ? 0 : 1;
    int _191 = abs(_181);
    int _193 = abs(_189);
    float _195 = -_171;
    float _197 = _155 + _195;
    bool _199 = !_167;
    int _201 = _199 ? 0 : 1;
    float _203 = -_197;
    float _205 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _207 = float(_191);
    bool _209 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _211 = fma(_185, 0.5, 0.5);
    int _213 = abs(_201);
    float _215 = abs(_205);
    float _217 = _207 * _215;
    float _219 = float(_193);
    bool _221 = _197 < 0.5;
    float _223 = float(_221);
    float _225 = -_211;
    float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _229 = !_149;
    float _231 = _229 ? (-0.5) : 0.5;
    float _233 = -_223;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_213);
    float _239 = fma(_219, _227, _217);
    float _241 = abs(_235);
    float _243 = fma(_237, _241, _239);
    bool _245 = !_209;
    float _261;
    if (!_245)
    {
        float _247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _249 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _253 = _251 * _247;
        float _255 = floor(_253);
        float _257 = -_255;
        float _259 = _253 + _257;
        _261 = _259;
        _263 = true;
    }
    else
    {
        float _265 = float(_83);
        float _267 = 1.0 / _265;
        float _269 = _117 * _267;
        _261 = _269;
    }
    _263 = false;
    float _271 = _261;
    float _273 = in.m_42.x;
    float _275 = in.m_42.y;
    float _277 = in.m_42.z;
    float _279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _281 = in.m_52.y;
    bool _283 = _143 > 0.5;
    int _285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _287 = _285 != 0;
    int _289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _291 = _289 != 0;
    float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _301 = _295 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _303 = _275 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _305 = _275 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _307 = _275 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _309;
    float _313 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[5].x, _303);
    float _315 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[4].x, _305);
    bool _317 = _281 > 0.5;
    float _319 = 1.0 / _311;
    float _321 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[5].z, _313);
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _331 = _297 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _333 = _299 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _335 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[6].x, _307);
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _345 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[4].z, _315);
    float _347 = _321 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _349 = _323 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _351 = _325 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _353 = _327 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_54.x = _301;
    out.m_54.y = _331;
    out.m_54.z = _333;
    out.m_54.w = _329;
    float _355 = 1.0 / _339;
    float _357 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[6].z, _335);
    float _359 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _361 = _347 + _359;
    out.m_56.x = _349;
    out.m_56.y = _351;
    out.m_56.z = _353;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _365 = _271 + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _369 = _271 + _367;
    float _371 = 1.0 / _343;
    float _373 = _365 * _319;
    bool _375 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _377 = isnan(_271);
    bool _379 = _375 || _377;
    bool _381 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _383 = _379 || _381;
    float _385 = float(_383);
    float _387 = _345 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _389 = _357 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _391 = _361 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _393 = -_231;
    int _395 = _283 ? as_type<int>(_393) : as_type<int>(_231);
    float _397 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _399 = _387 + _397;
    float _401 = -_159;
    int _403 = _317 ? as_type<int>(_401) : as_type<int>(_159);
    float _405 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _407 = _389 + _405;
    bool _409 = !_287;
    float _411 = _409 ? _231 : as_type<float>(_395);
    float _413 = fma(_399, (*spvDescriptorSet0.vp_c8)._m0[28].x, _391);
    bool _415 = !_291;
    float _417 = _415 ? _159 : as_type<float>(_403);
    float _419 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[28].z, _413);
    float _421 = _411 + 0.5;
    float _423 = -_417;
    float _425 = _423 + 0.5;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _429 = _271 + _427;
    float _431 = _369 * _371;
    bool _433 = _419 >= 0.0;
    float _435 = _421 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _437 = _429 * _355;
    float _439 = _361 * _361;
    float _441 = _425 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _443;
    float _447 = _435 * _279;
    float _449 = fma(_399, _399, _439);
    float _451 = _441 * _293;
    bool _453 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _455 = isnan(_271);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _461 = _457 || _459;
    float _463 = float(_461);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _465;
    float _469 = fma(_407, _407, _449);
    float _471 = fma(_445, _373, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _473 = 0.0;
    int _475 = as_type<int>(_445);
    if (_433)
    {
        _473 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _477 = _473;
    float _479 = fma(_467, _373, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _481 = -_463;
    float _483 = _481 + 1.0;
    float _485 = rsqrt(_469);
    if (_433)
    {
        float _487 = _477 * 5.0;
        _475 = as_type<int>(_487);
    }
    int _489 = _475;
    bool _491 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _493 = isnan(_271);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    out.m_58.x = _447;
    out.m_58.y = _451;
    bool _503 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _505 = isnan(_271);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _523 = _501 * _483;
    float _525 = -_501;
    float _527 = _525 + 1.0;
    if (_433)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2020 = as_type<float>(_489);
        out.gl_Position.z = _2020;
    }
    float _529 = _513 * _527;
    if (_433)
    {
        out.m_45.x = 0.0;
    }
    float _531 = _361 * _485;
    float _533 = _399 * _485;
    if (_433)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _535 = -_531;
    float _537 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[18].w, _347);
    float _539 = -_513;
    float _541 = _539 + 1.0;
    float _543 = _407 * _485;
    float _545 = -_533;
    float _547 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[18].w, _387);
    float _549 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _551 = _537 + _549;
    float _553 = fma(_517, _431, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _555 = -_543;
    float _557 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[18].w, _389);
    float _559 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _561 = _547 + _559;
    float _563 = _551 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _565 = _385 * _541;
    float _567 = fma(_521, _431, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _569 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _571 = _557 + _569;
    float _573 = fma(_561, (*spvDescriptorSet0.vp_c8)._m0[28].x, _563);
    float _575 = -_385;
    float _577 = _575 + 1.0;
    float _579 = _471 * _565;
    float _581 = _479 * _565;
    float _583 = fma(_571, (*spvDescriptorSet0.vp_c8)._m0[28].z, _573);
    float _585 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[143].x, _579);
    float _587 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[143].y, _581);
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _589;
    float _593 = -_531;
    float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[18].w, _361);
    bool _597 = _583 >= 0.0;
    float _599 = in.m_60.x;
    float _601 = in.m_60.y;
    float _603 = fma(_591, _437, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _605 = -_533;
    float _607 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[18].w, _399);
    float _609 = _595 * _595;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _611;
    float _615 = fma(_553, _529, _585);
    float _617 = -_543;
    float _619 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[18].w, _407);
    float _621 = fma(_607, _607, _609);
    float _623 = fma(_613, _437, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _625 = fma(_567, _529, _587);
    float _627 = fma(_603, _523, _615);
    float _629 = fma(_619, _619, _621);
    float _631 = _627;
    float _633 = _551;
    if (_597)
    {
        out.m_45.x = 0.0;
    }
    float _635 = fma(_623, _523, _625);
    float _637 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[146].x, _627);
    if (_597)
    {
        _631 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _639 = _631;
    float _641 = sqrt(_629);
    float _643 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[146].y, _635);
    int _645 = as_type<int>(_639);
    if (_597)
    {
        float _647 = _639 * 5.0;
        _645 = as_type<int>(_647);
    }
    int _649 = _645;
    float _651 = _637 * _599;
    if (_597)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2253 = as_type<float>(_649);
        out.gl_Position.z = _2253;
    }
    float _653 = _643 * _601;
    if (_597)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _655 = _243 * _653;
    float _657 = _243 * _651;
    float _659 = _485 * _641;
    float _661 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _159);
    float _663 = _655 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _665 = _657 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _667 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _231);
    float _669 = _659 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _671 = _669 * 0.5;
    float _673 = _659 * _663;
    float _675 = _659 * _665;
    bool _677 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _679 = isnan(0.5);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _685 = _681 || _683;
    float _687 = _661 * _673;
    float _689 = _667 * _675;
    float _691 = _687 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _693 = _687 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _695 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[26].x, _691);
    float _697 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[24].x, _693);
    float _699 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[26].z, _695);
    float _701 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[24].z, _697);
    float _703 = _699 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _705 = _701 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _707 = _389 + _703;
    float _709 = _387 + _705;
    float _711 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _713 = _707 + _711;
    float _715 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _717 = _709 + _715;
    float _719 = _713 * _713;
    float _721 = fma(_717, _717, _719);
    float _723 = _687 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _725 = sqrt(_721);
    float _727 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[25].x, _723);
    float _729 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[25].z, _727);
    float _731 = _729 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _733 = _347 + _731;
    bool _735 = _725 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _737 = _731;
    float _739 = _729;
    float _741 = _709;
    float _743 = _733;
    if (!_735)
    {
        _737 = _707;
    }
    float _745 = _737;
    float _747 = _745;
    if (!_735)
    {
        _739 = _733;
    }
    float _749 = _739;
    bool _751 = !_735;
    float _753 = _749;
    if (!_751)
    {
        float _755 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _757 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _759 = _725 + _757;
        float _761 = _733 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _763 = _759 * _755;
        float _765 = rsqrt(_721);
        float _767 = _763 * 0.15915493667125701904296875;
        float _769 = _767 * 6.283185482025146484375;
        float _771 = cos(_769);
        float _773 = _767 * 6.283185482025146484375;
        float _775 = sin(_773);
        float _777 = _771 + (-1.0);
        float _779 = _777 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _781 = fma(_775, _761, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _783 = fma(_733, _771, _779);
        float _785 = _765 * _781;
        float _787 = fma(_717, _785, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _789 = fma(_713, _785, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _741 = _787;
        _753 = _783;
        _747 = _789;
    }
    float _791 = _741;
    float _793 = _753;
    float _795 = _747;
    float _797 = -_533;
    float _799 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[18].w, _791);
    float _801 = -_531;
    float _803 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[18].w, _793);
    float _805 = -_543;
    float _807 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[18].w, _795);
    float _809 = _803;
    float _811 = _799;
    float _813 = _807;
    if (!_685)
    {
        float _815 = _551 * _551;
        float _817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _819 = -_389;
        float _821 = _819 + _795;
        float _823 = -_387;
        float _825 = _823 + _791;
        float _827 = fma(_561, _561, _815);
        float _829 = -_347;
        float _831 = _829 + _793;
        float _833 = fma(_571, _571, _827);
        float _835 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _837 = sqrt(_833);
        float _839 = 1.0 / _659;
        float _841 = precise::min(_837, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _843 = _841 * _817;
        float _845 = _835 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _847 = _843 * _839;
        float _849 = _845 * _847;
        float _851 = _821 * _847;
        float _853 = fma(_825, _849, _547);
        float _855 = fma(_831, _849, _537);
        float _857 = fma(_845, _851, _557);
        _809 = _855;
        _811 = _853;
        _813 = _857;
        _743 = _839;
    }
    float _859 = _809;
    float _861 = _811;
    float _863 = _813;
    float _865 = _743;
    float _867 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _869 = _859 + _867;
    float _871 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _873 = _861 + _871;
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _877 = _863 + _875;
    float _879 = _869 * _869;
    float _881 = fma(_873, _873, _879);
    float _883 = fma(_877, _877, _881);
    float _885 = rsqrt(_883);
    float _887 = _885 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _889 = _873 * _887;
    float _891 = _877 * _887;
    float _893 = _889 * _889;
    float _895 = _891 * _891;
    float _897 = _893 + _895;
    float _899 = sqrt(_897);
    bool _901 = _899 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _903 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _905 = _899 + _903;
    float _907 = _881;
    float _909 = _905;
    float _911 = _865;
    float _913 = _869;
    float _915 = _889;
    float _917 = _887;
    if (_901)
    {
        float _919 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _907 = _919;
    }
    float _921 = _907;
    float _923 = _921;
    if (_901)
    {
        float _925 = _905 * _921;
        _909 = _925;
    }
    float _927 = _909;
    if (_901)
    {
        float _929 = rsqrt(_897);
        _923 = _929;
    }
    float _931 = _923;
    float _933 = _931;
    if (_901)
    {
        float _935 = _927 * 0.15915493667125701904296875;
        _911 = _935;
    }
    float _937 = _911;
    float _939 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _941 = _885;
    if (_901)
    {
        float _943 = _937 * 6.283185482025146484375;
        float _945 = sin(_943);
        _941 = _945;
    }
    float _947 = _941;
    float _949 = precise::max(0.0, _939);
    float _951 = _877;
    float _953 = _949;
    if (_901)
    {
        float _955 = _937 * 6.283185482025146484375;
        float _957 = cos(_955);
        _951 = _957;
    }
    float _959 = _951;
    float _961 = -_887;
    float _963 = -_949;
    float _965 = fma(_869, _961, _963);
    float _967 = _965;
    if (_901)
    {
        float _969 = _965 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _913 = _969;
    }
    float _971 = _913;
    float _973 = _947;
    float _975 = _971;
    if (_901)
    {
        float _977 = fma(_947, _971, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _973 = _977;
    }
    float _979 = _973;
    if (!_901)
    {
        _975 = _893;
    }
    float _981 = _975;
    float _983 = _981;
    if (_901)
    {
        float _985 = _931 * _979;
        _633 = _985;
    }
    float _987 = _633;
    if (!_901)
    {
        _933 = _891;
    }
    float _989 = _933;
    float _991 = sqrt(_883);
    float _993 = _989;
    if (_901)
    {
        float _995 = _959 + (-1.0);
        _953 = _995;
    }
    float _997 = _953;
    float _999 = _997;
    if (_901)
    {
        float _1001 = _889 * _987;
        _915 = _1001;
    }
    float _1003 = _915;
    if (_901)
    {
        float _1005 = _891 * _987;
        _993 = _1005;
    }
    float _1007 = _993;
    if (_901)
    {
        float _1009 = _997 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _917 = _1009;
    }
    float _1011 = _917;
    if (_901)
    {
        float _1013 = _1003 * _1003;
        _983 = _1013;
    }
    float _1015 = _983;
    if (!_901)
    {
        _999 = _895;
    }
    float _1017 = _999;
    float _1019 = _1017;
    if (_901)
    {
        float _1021 = _1007 * _1007;
        _1019 = _1021;
    }
    float _1023 = _1019;
    if (_901)
    {
        float _1025 = fma(_965, _959, _1011);
        _967 = _1025;
    }
    float _1027 = _967;
    float _1029 = _859 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1031 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1033 = fma(_1027, _1027, _1015);
    float _1035 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1037 = fma(_991, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1035);
    float _1039 = precise::clamp(_1037, 0.0, 1.0);
    float _1041 = _1033 + _1023;
    float _1043 = _859 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1045 = -_1039;
    float _1047 = _1045 + 1.0;
    float _1049 = rsqrt(_1041);
    float _1051 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1043);
    float _1053 = _859 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1055 = _859 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1057 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1029);
    float _1059 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1051);
    float _1061 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1053);
    float _1063 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1055);
    float _1065 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1057);
    float _1067 = _1059 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1069 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1061);
    float _1071 = abs(_1047);
    float _1073 = log2(_1071);
    float _1075 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1063);
    float _1077 = _1065 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1079 = _1069 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1081 = _1067 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1083 = _1049 * _1003;
    float _1085 = _1049 * _1027;
    float _1087 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1089 = _1049 * _1007;
    float _1091 = _1083 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1093 = _1075 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1095 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1087);
    float _1097 = -_1081;
    float _1099 = fma(_1097, _1031, 1.0);
    float _1101 = -_1091;
    float _1103 = fma(_1085, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1101);
    float _1105 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1107 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1095);
    float _1109 = _1073 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1111 = -_1089;
    float _1113 = fma(_1111, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1103);
    float _1115 = log2(_1099);
    float _1117 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1107);
    float _1119 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1121 = fma(_1113, -0.5, 0.5);
    float _1123 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1105);
    float _1125 = fma(_1113, 0.5, 0.5);
    float _1127 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1119);
    float _1129 = _1085 + 1.0;
    float _1131 = exp2(_1109);
    float _1133 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1123);
    float _1135 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1127);
    float _1137 = fma(_1125, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1139 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1133);
    float _1141 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1135);
    float _1143 = fma(_1125, _1137, -0.212114393711090087890625);
    float _1145 = 1.0 / _1117;
    float _1147 = _1115 * 0.693147182464599609375;
    float _1149 = fma(_1125, _1143, 1.570728778839111328125);
    float _1151 = _1147 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1153 = sqrt(_1121);
    float _1155 = -_1085;
    float _1157 = fma(_1131, _1129, _1155);
    float _1159 = fma(_1157, 0.5, 0.5);
    float _1161 = _1139 * _1145;
    float _1163 = _1141 * _1145;
    float _1165 = fma(_1161, 0.5, 0.5);
    float _1167 = fma(_1163, -0.5, 0.5);
    float _1169 = _1153 * 0.636619746685028076171875;
    float3 _3107 = float3(_1165, _1167, _1151);
    float _1171 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3107, float3(0.0), isnan(_3107)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3107, float3(0.0), isnan(_3107)), level(0.0)).x;
    float3 _3118 = float3(_1165, _1167, _1151);
    float4 _1174 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3118, float3(0.0), isnan(_3118)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3118, float3(0.0), isnan(_3118)), level(0.0)).xyzw;
    float _1176 = _1174.x;
    float _1178 = _1174.y;
    float _1180 = _1174.z;
    float _1182 = _1174.w;
    float _1184 = -_1149;
    float _1186 = fma(_1169, _1184, 1.0);
    float2 _3140 = float2(_1186, _1159);
    float3 _1190 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3140, float2(0.0), isnan(_3140)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3140, float2(0.0), isnan(_3140)), level(0.0)).xyz;
    float _1192 = _1190.x;
    float _1194 = _1190.y;
    float _1196 = _1190.z;
    float _1198 = _1073 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1200 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1202 = _243 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1204 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1200);
    float _1206 = exp2(_1198);
    float _1208 = _1202 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1210 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1204);
    out.m_45.x = _1208;
    float _1212 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1210);
    float _1214 = _1212 + _1117;
    out.gl_Position.x = _1139;
    out.gl_Position.y = _1141;
    out.gl_Position.z = _1212;
    out.gl_Position.w = _1117;
    float _1216 = _1214 * 0.5;
    float _1218 = -_1206;
    float _1220 = _1218 + 1.0;
    float _1222 = _1220 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _1216;
    out.m_62.w = _1117;
    float _1224 = _1222 * _1171;
    float _1226 = -_1222;
    float _1228 = _1226 + 1.0;
    float _1230 = _1182 * _1224;
    float _1232 = _1196 * _1224;
    float _1234 = fma(_1192, _1230, _1176);
    float _1236 = fma(_1194, _1230, _1178);
    float _1238 = _1182 * _1228;
    float _1240 = fma(_1182, _1232, _1180);
    out.m_64.x = _1234;
    out.m_64.y = _1236;
    out.m_64.z = _1240;
    out.m_64.w = _1238;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

