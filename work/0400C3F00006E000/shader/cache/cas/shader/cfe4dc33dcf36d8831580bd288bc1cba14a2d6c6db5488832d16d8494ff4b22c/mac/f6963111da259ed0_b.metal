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
    float4 m_56 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
    float4 m_64 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_54 [[attribute(4)]];
    float4 m_52 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _91 = as_type<float>(_83);
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _89;
    float _95 = _93;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_87)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1278 = as_type<float>(_101);
        out.gl_Position.z = _1278;
    }
    if (!_87)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_83);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    if (_129)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _91;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _103 = as_type<int>(_133);
    }
    int _135 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1346 = as_type<float>(_135);
        out.gl_Position.z = _1346;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    float _139 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _141 = in.m_52.w;
    bool _143 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _145 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _147 = _143 || _145;
    bool _149 = isnan(1.0);
    bool _151 = _147 || _149;
    float _153 = in.m_54.y;
    float _155 = in.m_47.x;
    float _157 = in.m_47.y;
    float _159 = in.m_47.z;
    float _161 = in.m_42.x;
    float _163 = in.m_42.y;
    float _165 = in.m_42.z;
    float _167 = 0.0;
    float _169 = _139;
    if (!_151)
    {
        float _171 = _139 * _139;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = _175;
    if (!_151)
    {
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _179;
    }
    float _181 = _177;
    int _183 = as_type<int>(_137) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_137) & 2;
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_151;
    float _201 = _181;
    if (!_199)
    {
        float _203 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = log2(_203);
        float _207 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _209 = _207 + 1.0;
        float _211 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = _139 * _205;
        float _215 = exp2(_213);
        float _217 = _211 * 0.693147182464599609375;
        float _219 = 1.0 / _217;
        float _221 = 1.0 / _209;
        float _223 = _215 + (-1.0);
        float _225 = -_223;
        float _227 = fma(_225, _219, _139);
        float _229 = _227 * _221;
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
        float _247 = _139 * _239;
        float _249 = exp2(_247);
        float _251 = -_249;
        float _253 = _251 + 1.0;
        float _255 = _253 * _245;
        _169 = _255;
    }
    float _257 = _169;
    float _259 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _261 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _263 = in.m_54.x;
    float _265 = fma(_257, _157, _259);
    float _267 = fma(_257, _155, _261);
    float _269 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _273 = _271 != 0;
    float _275 = fma(_265, _141, _163);
    float _277 = fma(_267, _141, _161);
    float _279 = fma(_257, _159, _269);
    int _281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _283 = _281 != 0;
    float _285 = _275 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _287 = _275 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _289 = fma(_279, _141, _165);
    float _291 = _275 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _293 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[5].x, _285);
    float _295 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[4].x, _287);
    bool _297 = _153 > 0.5;
    float _299 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[6].x, _291);
    float _301 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[5].z, _293);
    float _303 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[4].z, _295);
    float _305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _307 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[6].z, _299);
    float _309 = _301 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _311 = _303 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _313 = _263 > 0.5;
    float _315 = _307 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _317 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _319 = _309 + _317;
    float _321 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _323 = _311 + _321;
    float _325 = -_193;
    int _327 = _313 ? as_type<int>(_325) : as_type<int>(_193);
    float _329 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _331 = _315 + _329;
    float _333 = _319 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _335 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _337 = -_197;
    int _339 = _297 ? as_type<int>(_337) : as_type<int>(_197);
    float _341 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _343 = fma(_323, (*spvDescriptorSet0.vp_c8)._m0[28].x, _333);
    bool _345 = !_273;
    float _347 = _345 ? _193 : as_type<float>(_327);
    bool _349 = !_283;
    float _351 = _349 ? _197 : as_type<float>(_339);
    float _353 = fma(_331, (*spvDescriptorSet0.vp_c8)._m0[28].z, _343);
    float _355 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _357 = _347 + 0.5;
    float _359 = _341 * _305;
    float _361 = -_351;
    float _363 = _361 + 0.5;
    bool _365 = _353 >= 0.0;
    float _367 = _319 * _319;
    float _369 = _357 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _371 = _363 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _373 = fma(_323, _323, _367);
    float _375 = _369 * _335;
    float _377 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[20].x, _359);
    float _379 = fma(_331, _331, _373);
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _383 = _371 * _355;
    float _385 = rsqrt(_379);
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _391 = _371;
    if (_365)
    {
        _391 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _393 = _391;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _401 = floor(_377);
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _405 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _407 = _387 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _409 = _389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = _395 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _413 = _397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _415 = _399 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _417 = as_type<int>(_393);
    if (_365)
    {
        float _419 = _393 * 5.0;
        _417 = as_type<int>(_419);
    }
    int _421 = _417;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _425 = _423 != 0;
    int _427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _429 = _427 != 0;
    out.m_56.x = _405;
    out.m_56.y = _407;
    out.m_56.z = _409;
    out.m_56.w = _403;
    float _431 = _319 * _385;
    float _433 = _323 * _385;
    out.m_58.x = _411;
    out.m_58.y = _413;
    out.m_58.z = _415;
    bool _435 = !_425;
    int _437 = _435 ? 0 : 1;
    bool _439 = !_429;
    int _441 = _439 ? 0 : 1;
    out.m_60.x = _375;
    out.m_60.y = _383;
    float _443 = _431;
    if (_365)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1881 = as_type<float>(_421);
        out.gl_Position.z = _1881;
    }
    if (_365)
    {
        out.m_45.x = 0.0;
    }
    if (_365)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _445 = -_431;
    float _447 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[18].w, _309);
    float _449 = -_433;
    float _451 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[18].w, _311);
    float _453 = _331 * _385;
    float _455 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _457 = _447 + _455;
    float _459 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _461 = _451 + _459;
    int _463 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _465 = _463 != 0;
    float _467 = -_431;
    float _469 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[18].w, _319);
    float _471 = _457 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _473 = -_453;
    float _475 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[18].w, _315);
    float _477 = in.m_52.x;
    float _479 = fma(_461, (*spvDescriptorSet0.vp_c8)._m0[28].x, _471);
    float _481 = _377 * 6.283185482025146484375;
    float _483 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _485 = _475 + _483;
    float _487 = -_433;
    float _489 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[18].w, _323);
    float _491 = -_401;
    float _493 = _377 + _491;
    float _495 = _481 * 0.15915493667125701904296875;
    float _497 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[28].z, _479);
    int _499 = abs(_437);
    float _501 = _469 * _469;
    bool _503 = !_465;
    int _505 = _503 ? 0 : 1;
    float _507 = in.m_52.y;
    float _509 = _495 * 6.283185482025146484375;
    float _511 = cos(_509);
    bool _513 = _497 >= 0.0;
    float _515 = fma(_489, _489, _501);
    float _517 = float(_499);
    float _519 = -_453;
    float _521 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[18].w, _331);
    float _523 = -_493;
    float _525 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _527 = abs(_505);
    float _529 = fma(_521, _521, _515);
    float _531 = abs(_525);
    float _533 = _517 * _531;
    bool _535 = _493 < 0.5;
    float _537 = float(_535);
    int _539 = abs(_441);
    float _541 = sqrt(_529);
    float _543 = float(_527);
    float _545 = -_537;
    float _547 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _549 = fma(_511, 0.5, 0.5);
    float _551 = float(_539);
    float _553 = _525;
    if (_513)
    {
        out.m_45.x = 0.0;
    }
    if (_513)
    {
        _553 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _555 = _553;
    float _557 = -_549;
    float _559 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _561 = fma(_543, _559, _533);
    int _563 = as_type<int>(_555);
    if (_513)
    {
        float _565 = _555 * 5.0;
        _563 = as_type<int>(_565);
    }
    int _567 = _563;
    float _569 = _477 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _571 = _507 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _573 = abs(_547);
    float _575 = fma(_551, _573, _561);
    float _577 = _385 * _541;
    float _579 = _575 * _569;
    float _581 = _575 * _571;
    if (_513)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2108 = as_type<float>(_567);
        out.gl_Position.z = _2108;
    }
    if (_513)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _583 = _581 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _585 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _587 = _579 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _589 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _591 = _577 * _583;
    float _593 = _577 * _587;
    float _595 = _585 * _591;
    float _597 = _589 * _593;
    float _599 = _577 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _601 = _599 * 0.5;
    float _603 = _595 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _605 = _595 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _607 = fma(_597, (*spvDescriptorSet0.vp_c8)._m0[26].x, _603);
    float _609 = fma(_597, (*spvDescriptorSet0.vp_c8)._m0[24].x, _605);
    float _611 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[26].z, _607);
    float _613 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[24].z, _609);
    float _615 = _611 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _617 = _613 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _619 = _315 + _615;
    float _621 = _311 + _617;
    float _623 = _595 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _625 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _627 = _619 + _625;
    float _629 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _631 = _621 + _629;
    float _633 = fma(_597, (*spvDescriptorSet0.vp_c8)._m0[25].x, _623);
    float _635 = _627 * _627;
    float _637 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[25].z, _633);
    float _639 = fma(_631, _631, _635);
    float _641 = _637 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _643 = sqrt(_639);
    float _645 = _309 + _641;
    bool _647 = _643 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _649 = _623;
    float _651 = _637;
    float _653 = _641;
    float _655 = _621;
    float _657 = _619;
    if (!_647)
    {
        _649 = _621;
    }
    float _659 = _649;
    float _661 = _659;
    if (!_647)
    {
        _651 = _619;
    }
    float _663 = _651;
    float _665 = _663;
    if (!_647)
    {
        _653 = _645;
    }
    float _667 = _653;
    bool _669 = !_647;
    float _671 = _667;
    if (!_669)
    {
        float _673 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _675 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _677 = _643 + _675;
        float _679 = _645 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _681 = rsqrt(_639);
        float _683 = _677 * _673;
        float _685 = _683 * 0.15915493667125701904296875;
        float _687 = _685 * 6.283185482025146484375;
        float _689 = cos(_687);
        float _691 = _685 * 6.283185482025146484375;
        float _693 = sin(_691);
        float _695 = _689 + (-1.0);
        float _697 = _695 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _699 = fma(_693, _679, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _701 = fma(_645, _689, _697);
        float _703 = _681 * _699;
        float _705 = fma(_631, _703, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _707 = fma(_627, _703, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _671 = _701;
        _661 = _705;
        _665 = _707;
        _655 = _685;
    }
    float _709 = _671;
    float _711 = _661;
    float _713 = _665;
    float _715 = _655;
    float _717 = -_431;
    float _719 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[18].w, _709);
    float _721 = -_433;
    float _723 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[18].w, _711);
    float _725 = -_453;
    float _727 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[18].w, _713);
    float _729 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _731 = _719 + _729;
    float _733 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _735 = _723 + _733;
    float _737 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _739 = _727 + _737;
    float _741 = _731 * _731;
    float _743 = fma(_735, _735, _741);
    float _745 = fma(_739, _739, _743);
    float _747 = rsqrt(_745);
    float _749 = sqrt(_745);
    float _751 = _747 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _753 = _735 * _751;
    float _755 = _739 * _751;
    float _757 = _753 * _753;
    float _759 = _755 * _755;
    float _761 = _757 + _759;
    float _763 = sqrt(_761);
    bool _765 = _763 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _767 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _769 = _763 + _767;
    float _771 = _747;
    float _773 = _761;
    float _775 = _769;
    float _777 = _731;
    if (_765)
    {
        float _779 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _771 = _779;
    }
    float _781 = _771;
    if (_765)
    {
        float _783 = rsqrt(_761);
        _773 = _783;
    }
    float _785 = _773;
    if (_765)
    {
        float _787 = _769 * _781;
        _775 = _787;
    }
    float _789 = _775;
    if (_765)
    {
        float _791 = _789 * 0.15915493667125701904296875;
        _657 = _791;
    }
    float _793 = _657;
    float _795 = _739;
    if (_765)
    {
        float _797 = _793 * 6.283185482025146484375;
        float _799 = sin(_797);
        _795 = _799;
    }
    float _801 = _795;
    float _803 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _805 = precise::max(0.0, _803);
    float _807 = _715;
    float _809 = _805;
    float _811 = _803;
    if (_765)
    {
        float _813 = _793 * 6.283185482025146484375;
        float _815 = cos(_813);
        _807 = _815;
    }
    float _817 = _807;
    float _819 = -_751;
    float _821 = -_805;
    float _823 = fma(_731, _819, _821);
    if (!_765)
    {
        _777 = _753;
    }
    float _825 = _777;
    float _827 = _825;
    if (_765)
    {
        float _829 = _823 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _809 = _829;
    }
    float _831 = _809;
    float _833 = _801;
    float _835 = _831;
    if (_765)
    {
        float _837 = fma(_801, _831, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _833 = _837;
    }
    float _839 = _833;
    float _841 = _839;
    float _843 = _817;
    if (_765)
    {
        float _845 = _817 + (-1.0);
        _811 = _845;
    }
    float _847 = _811;
    float _849 = _847;
    if (_765)
    {
        float _851 = _785 * _839;
        _443 = _851;
    }
    float _853 = _443;
    if (!_765)
    {
        _841 = _823;
    }
    float _855 = _841;
    float _857 = _719 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _859 = _855;
    if (_765)
    {
        float _861 = _847 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _835 = _861;
    }
    float _863 = _835;
    float _865 = _863;
    if (_765)
    {
        float _867 = _753 * _853;
        _827 = _867;
    }
    float _869 = _827;
    if (!_765)
    {
        _849 = _755;
    }
    float _871 = _849;
    float _873 = _871;
    if (_765)
    {
        float _875 = _755 * _853;
        _873 = _875;
    }
    float _877 = _873;
    if (_765)
    {
        float _879 = fma(_823, _817, _863);
        _859 = _879;
    }
    float _881 = _859;
    if (!_765)
    {
        _865 = _757;
    }
    float _883 = _865;
    float _885 = _883;
    if (_765)
    {
        float _887 = _869 * _869;
        _885 = _887;
    }
    float _889 = _885;
    if (!_765)
    {
        _843 = _759;
    }
    float _891 = _843;
    float _893 = _891;
    if (_765)
    {
        float _895 = _877 * _877;
        _893 = _895;
    }
    float _897 = _893;
    float _899 = _719 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _901 = fma(_881, _881, _889);
    float _903 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[0].x, _857);
    float _905 = _719 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _907 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[1].x, _899);
    float _909 = _901 + _897;
    float _911 = _719 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _913 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[1].z, _907);
    float _915 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[2].x, _905);
    float _917 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[0].z, _903);
    float _919 = rsqrt(_909);
    float _921 = _913 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _923 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _925 = fma(_749, (*spvDescriptorSet0.vp_c15)._m0[23].w, _923);
    float _927 = precise::clamp(_925, 0.0, 1.0);
    float _929 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[3].x, _911);
    float _931 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[2].z, _915);
    float _933 = _917 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _935 = _921 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _937 = -_927;
    float _939 = _937 + 1.0;
    float _941 = _931 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _943 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[3].z, _929);
    float _945 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[7].x, _935);
    float _947 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _949 = _941 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _951 = abs(_939);
    float _953 = log2(_951);
    float _955 = _943 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _957 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[7].z, _945);
    float _959 = _919 * _869;
    float _961 = _919 * _877;
    float _963 = -_949;
    float _965 = fma(_963, _947, 1.0);
    float _967 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[7].w, _957);
    float _969 = _919 * _881;
    float _971 = _959 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _973 = _921 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _975 = 1.0 / _967;
    float _977 = -_971;
    float _979 = fma(_969, (*spvDescriptorSet0.vp_c15)._m0[21].y, _977);
    float _981 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[5].x, _973);
    float _983 = -_961;
    float _985 = fma(_983, (*spvDescriptorSet0.vp_c15)._m0[21].z, _979);
    float _987 = _953 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _989 = _921 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _991 = log2(_965);
    float _993 = fma(_985, -0.5, 0.5);
    float _995 = fma(_985, 0.5, 0.5);
    float _997 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[4].x, _989);
    float _999 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[5].z, _981);
    float _1001 = _969 + 1.0;
    float _1003 = fma(_995, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1005 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[4].z, _997);
    float _1007 = exp2(_987);
    float _1009 = fma(_995, _1003, -0.212114393711090087890625);
    float _1011 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1005);
    float _1013 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[5].w, _999);
    float _1015 = fma(_995, _1009, 1.570728778839111328125);
    float _1017 = _1011 * _975;
    float _1019 = sqrt(_993);
    float _1021 = _991 * 0.693147182464599609375;
    float _1023 = fma(_1017, 0.5, 0.5);
    float _1025 = _1021 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1027 = -_969;
    float _1029 = fma(_1007, _1001, _1027);
    float _1031 = _1013 * _975;
    float _1033 = fma(_1029, 0.5, 0.5);
    float _1035 = fma(_1031, -0.5, 0.5);
    float _1037 = _1019 * 0.636619746685028076171875;
    float _1039 = -_1015;
    float _1041 = fma(_1037, _1039, 1.0);
    float3 _2877 = float3(_1023, _1035, _1025);
    float _1043 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2877, float3(0.0), isnan(_2877)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2877, float3(0.0), isnan(_2877)), level(0.0)).x;
    float3 _2888 = float3(_1023, _1035, _1025);
    float4 _1046 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2888, float3(0.0), isnan(_2888)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2888, float3(0.0), isnan(_2888)), level(0.0)).xyzw;
    float _1048 = _1046.x;
    float _1050 = _1046.y;
    float _1052 = _1046.z;
    float _1054 = _1046.w;
    float2 _2905 = float2(_1041, _1033);
    float3 _1058 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2905, float2(0.0), isnan(_2905)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2905, float2(0.0), isnan(_2905)), level(0.0)).xyz;
    float _1060 = _1058.x;
    float _1062 = _1058.y;
    float _1064 = _1058.z;
    float _1066 = _447 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1068 = _953 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1070 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1072 = isnan(0.5);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1078 = _1074 || _1076;
    float _1080 = _921 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1082 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1066);
    float _1084 = _447 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1086 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1080);
    float _1088 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1082);
    float _1090 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1084);
    float _1092 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1086);
    float _1094 = _1088 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1096 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1090);
    float _1098 = exp2(_1068);
    float _1100 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1092);
    float _1102 = _1096 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1104 = _1102 + _1094;
    float _1106 = 1.0 / _1094;
    float _1108 = _1104 * _1106;
    float _1110 = _1108 * 0.5;
    float _1112 = _1104;
    if (_1078)
    {
        _1112 = 1.0;
    }
    float _1114 = _1112;
    float _1116 = _1114;
    if (!_1078)
    {
        float _1118 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1120 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1122 = _1118 * 0.15915493667125701904296875;
        float _1124 = _1120 * 0.15915493667125701904296875;
        float _1126 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1128 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1126);
        float _1130 = _1122 * 6.283185482025146484375;
        float _1132 = cos(_1130);
        float _1134 = _1122 * 6.283185482025146484375;
        float _1136 = sin(_1134);
        float _1138 = 1.0 / _1132;
        float _1140 = _1124 * 6.283185482025146484375;
        float _1142 = cos(_1140);
        float _1144 = _1136 * _1138;
        float _1146 = _1124 * 6.283185482025146484375;
        float _1148 = sin(_1146);
        float _1150 = _1142 * _1144;
        float _1152 = 1.0 / _1128;
        float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1156 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1154;
        float _1158 = 1.0 / _1150;
        float _1160 = 1.0 / _1156;
        float _1162 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1164 = _1152 * _1162;
        float _1166 = _1148 * _1158;
        float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1170 = fma(_1166, _1164, _1168);
        float _1172 = _1170 * _1160;
        float _1174 = precise::clamp(_1172, 0.0, 1.0);
        _1116 = _1174;
    }
    float _1176 = _1116;
    float _1178 = _1100 + _967;
    float _1180 = -_1098;
    float _1182 = _1180 + 1.0;
    bool _1184 = _1176 > 0.0;
    bool _1186 = isnan(_1176);
    bool _1188 = _1184 || _1186;
    bool _1190 = isnan(0.0);
    bool _1192 = _1188 || _1190;
    float _1194 = _1176 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1196 = _1178 * 0.5;
    float _1198 = _1182 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1200 = _1194 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1202 = _1198 * _1043;
    float _1204 = -_1198;
    float _1206 = _1204 + 1.0;
    out.gl_Position.x = _1011;
    out.gl_Position.y = _1013;
    out.gl_Position.z = _1100;
    out.gl_Position.w = _967;
    float _1208 = _1054 * _1202;
    float _1210 = _1064 * _1202;
    float _1212 = _1054 * _1206;
    out.m_62.z = _1196;
    out.m_62.w = _967;
    float _1214 = fma(_1060, _1208, _1048);
    float _1216 = fma(_1062, _1208, _1050);
    float _1218 = fma(_1054, _1210, _1052);
    out.m_45.x = _1200;
    out.m_64.x = _1214;
    out.m_64.y = _1216;
    out.m_64.z = _1218;
    out.m_64.w = _1212;
    if (_1192)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1220 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1220;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _91 = as_type<float>(_83);
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _89;
    float _95 = _93;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_87)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1278 = as_type<float>(_101);
        out.gl_Position.z = _1278;
    }
    if (!_87)
    {
        return out;
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_83);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    if (_129)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _91;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _103 = as_type<int>(_133);
    }
    int _135 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1346 = as_type<float>(_135);
        out.gl_Position.z = _1346;
    }
    if (_129)
    {
        return out;
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    float _139 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _141 = in.m_52.w;
    bool _143 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _145 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _147 = _143 || _145;
    bool _149 = isnan(1.0);
    bool _151 = _147 || _149;
    float _153 = in.m_54.y;
    float _155 = in.m_47.x;
    float _157 = in.m_47.y;
    float _159 = in.m_47.z;
    float _161 = in.m_42.x;
    float _163 = in.m_42.y;
    float _165 = in.m_42.z;
    float _167 = 0.0;
    float _169 = _139;
    if (!_151)
    {
        float _171 = _139 * _139;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = _175;
    if (!_151)
    {
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _179;
    }
    float _181 = _177;
    int _183 = as_type<int>(_137) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_137) & 2;
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_151;
    float _201 = _181;
    if (!_199)
    {
        float _203 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = log2(_203);
        float _207 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _209 = _207 + 1.0;
        float _211 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = _139 * _205;
        float _215 = exp2(_213);
        float _217 = _211 * 0.693147182464599609375;
        float _219 = 1.0 / _217;
        float _221 = 1.0 / _209;
        float _223 = _215 + (-1.0);
        float _225 = -_223;
        float _227 = fma(_225, _219, _139);
        float _229 = _227 * _221;
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
        float _247 = _139 * _239;
        float _249 = exp2(_247);
        float _251 = -_249;
        float _253 = _251 + 1.0;
        float _255 = _253 * _245;
        _169 = _255;
    }
    float _257 = _169;
    float _259 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _261 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _263 = in.m_54.x;
    float _265 = fma(_257, _157, _259);
    float _267 = fma(_257, _155, _261);
    float _269 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _273 = _271 != 0;
    float _275 = fma(_265, _141, _163);
    float _277 = fma(_267, _141, _161);
    float _279 = fma(_257, _159, _269);
    int _281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _283 = _281 != 0;
    float _285 = _275 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _287 = _275 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _289 = fma(_279, _141, _165);
    float _291 = _275 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _293 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[5].x, _285);
    float _295 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[4].x, _287);
    bool _297 = _153 > 0.5;
    float _299 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[6].x, _291);
    float _301 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[5].z, _293);
    float _303 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[4].z, _295);
    float _305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _307 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[6].z, _299);
    float _309 = _301 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _311 = _303 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _313 = _263 > 0.5;
    float _315 = _307 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _317 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _319 = _309 + _317;
    float _321 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _323 = _311 + _321;
    float _325 = -_193;
    int _327 = _313 ? as_type<int>(_325) : as_type<int>(_193);
    float _329 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _331 = _315 + _329;
    float _333 = _319 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _335 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _337 = -_197;
    int _339 = _297 ? as_type<int>(_337) : as_type<int>(_197);
    float _341 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _343 = fma(_323, (*spvDescriptorSet0.vp_c8)._m0[28].x, _333);
    bool _345 = !_273;
    float _347 = _345 ? _193 : as_type<float>(_327);
    bool _349 = !_283;
    float _351 = _349 ? _197 : as_type<float>(_339);
    float _353 = fma(_331, (*spvDescriptorSet0.vp_c8)._m0[28].z, _343);
    float _355 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _357 = _347 + 0.5;
    float _359 = _341 * _305;
    float _361 = -_351;
    float _363 = _361 + 0.5;
    bool _365 = _353 >= 0.0;
    float _367 = _319 * _319;
    float _369 = _357 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _371 = _363 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _373 = fma(_323, _323, _367);
    float _375 = _369 * _335;
    float _377 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[20].x, _359);
    float _379 = fma(_331, _331, _373);
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _383 = _371 * _355;
    float _385 = rsqrt(_379);
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _391 = _371;
    if (_365)
    {
        _391 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _393 = _391;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _401 = floor(_377);
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _405 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _407 = _387 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _409 = _389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = _395 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _413 = _397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _415 = _399 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _417 = as_type<int>(_393);
    if (_365)
    {
        float _419 = _393 * 5.0;
        _417 = as_type<int>(_419);
    }
    int _421 = _417;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _425 = _423 != 0;
    int _427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _429 = _427 != 0;
    out.m_56.x = _405;
    out.m_56.y = _407;
    out.m_56.z = _409;
    out.m_56.w = _403;
    float _431 = _319 * _385;
    float _433 = _323 * _385;
    out.m_58.x = _411;
    out.m_58.y = _413;
    out.m_58.z = _415;
    bool _435 = !_425;
    int _437 = _435 ? 0 : 1;
    bool _439 = !_429;
    int _441 = _439 ? 0 : 1;
    out.m_60.x = _375;
    out.m_60.y = _383;
    float _443 = _431;
    if (_365)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1881 = as_type<float>(_421);
        out.gl_Position.z = _1881;
    }
    if (_365)
    {
        out.m_45.x = 0.0;
    }
    if (_365)
    {
        return out;
    }
    float _445 = -_431;
    float _447 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[18].w, _309);
    float _449 = -_433;
    float _451 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[18].w, _311);
    float _453 = _331 * _385;
    float _455 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _457 = _447 + _455;
    float _459 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _461 = _451 + _459;
    int _463 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _465 = _463 != 0;
    float _467 = -_431;
    float _469 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[18].w, _319);
    float _471 = _457 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _473 = -_453;
    float _475 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[18].w, _315);
    float _477 = in.m_52.x;
    float _479 = fma(_461, (*spvDescriptorSet0.vp_c8)._m0[28].x, _471);
    float _481 = _377 * 6.283185482025146484375;
    float _483 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _485 = _475 + _483;
    float _487 = -_433;
    float _489 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[18].w, _323);
    float _491 = -_401;
    float _493 = _377 + _491;
    float _495 = _481 * 0.15915493667125701904296875;
    float _497 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[28].z, _479);
    int _499 = abs(_437);
    float _501 = _469 * _469;
    bool _503 = !_465;
    int _505 = _503 ? 0 : 1;
    float _507 = in.m_52.y;
    float _509 = _495 * 6.283185482025146484375;
    float _511 = cos(_509);
    bool _513 = _497 >= 0.0;
    float _515 = fma(_489, _489, _501);
    float _517 = float(_499);
    float _519 = -_453;
    float _521 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[18].w, _331);
    float _523 = -_493;
    float _525 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _527 = abs(_505);
    float _529 = fma(_521, _521, _515);
    float _531 = abs(_525);
    float _533 = _517 * _531;
    bool _535 = _493 < 0.5;
    float _537 = float(_535);
    int _539 = abs(_441);
    float _541 = sqrt(_529);
    float _543 = float(_527);
    float _545 = -_537;
    float _547 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _549 = fma(_511, 0.5, 0.5);
    float _551 = float(_539);
    float _553 = _525;
    if (_513)
    {
        out.m_45.x = 0.0;
    }
    if (_513)
    {
        _553 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _555 = _553;
    float _557 = -_549;
    float _559 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _561 = fma(_543, _559, _533);
    int _563 = as_type<int>(_555);
    if (_513)
    {
        float _565 = _555 * 5.0;
        _563 = as_type<int>(_565);
    }
    int _567 = _563;
    float _569 = _477 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _571 = _507 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _573 = abs(_547);
    float _575 = fma(_551, _573, _561);
    float _577 = _385 * _541;
    float _579 = _575 * _569;
    float _581 = _575 * _571;
    if (_513)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2108 = as_type<float>(_567);
        out.gl_Position.z = _2108;
    }
    if (_513)
    {
        return out;
    }
    float _583 = _581 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _585 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _587 = _579 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _589 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _591 = _577 * _583;
    float _593 = _577 * _587;
    float _595 = _585 * _591;
    float _597 = _589 * _593;
    float _599 = _577 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _601 = _599 * 0.5;
    float _603 = _595 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _605 = _595 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _607 = fma(_597, (*spvDescriptorSet0.vp_c8)._m0[26].x, _603);
    float _609 = fma(_597, (*spvDescriptorSet0.vp_c8)._m0[24].x, _605);
    float _611 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[26].z, _607);
    float _613 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[24].z, _609);
    float _615 = _611 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _617 = _613 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _619 = _315 + _615;
    float _621 = _311 + _617;
    float _623 = _595 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _625 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _627 = _619 + _625;
    float _629 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _631 = _621 + _629;
    float _633 = fma(_597, (*spvDescriptorSet0.vp_c8)._m0[25].x, _623);
    float _635 = _627 * _627;
    float _637 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[25].z, _633);
    float _639 = fma(_631, _631, _635);
    float _641 = _637 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _643 = sqrt(_639);
    float _645 = _309 + _641;
    bool _647 = _643 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _649 = _623;
    float _651 = _637;
    float _653 = _641;
    float _655 = _621;
    float _657 = _619;
    if (!_647)
    {
        _649 = _621;
    }
    float _659 = _649;
    float _661 = _659;
    if (!_647)
    {
        _651 = _619;
    }
    float _663 = _651;
    float _665 = _663;
    if (!_647)
    {
        _653 = _645;
    }
    float _667 = _653;
    bool _669 = !_647;
    float _671 = _667;
    if (!_669)
    {
        float _673 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _675 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _677 = _643 + _675;
        float _679 = _645 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _681 = rsqrt(_639);
        float _683 = _677 * _673;
        float _685 = _683 * 0.15915493667125701904296875;
        float _687 = _685 * 6.283185482025146484375;
        float _689 = cos(_687);
        float _691 = _685 * 6.283185482025146484375;
        float _693 = sin(_691);
        float _695 = _689 + (-1.0);
        float _697 = _695 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _699 = fma(_693, _679, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _701 = fma(_645, _689, _697);
        float _703 = _681 * _699;
        float _705 = fma(_631, _703, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _707 = fma(_627, _703, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _671 = _701;
        _661 = _705;
        _665 = _707;
        _655 = _685;
    }
    float _709 = _671;
    float _711 = _661;
    float _713 = _665;
    float _715 = _655;
    float _717 = -_431;
    float _719 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[18].w, _709);
    float _721 = -_433;
    float _723 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[18].w, _711);
    float _725 = -_453;
    float _727 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[18].w, _713);
    float _729 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _731 = _719 + _729;
    float _733 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _735 = _723 + _733;
    float _737 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _739 = _727 + _737;
    float _741 = _731 * _731;
    float _743 = fma(_735, _735, _741);
    float _745 = fma(_739, _739, _743);
    float _747 = rsqrt(_745);
    float _749 = sqrt(_745);
    float _751 = _747 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _753 = _735 * _751;
    float _755 = _739 * _751;
    float _757 = _753 * _753;
    float _759 = _755 * _755;
    float _761 = _757 + _759;
    float _763 = sqrt(_761);
    bool _765 = _763 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _767 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _769 = _763 + _767;
    float _771 = _747;
    float _773 = _761;
    float _775 = _769;
    float _777 = _731;
    if (_765)
    {
        float _779 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _771 = _779;
    }
    float _781 = _771;
    if (_765)
    {
        float _783 = rsqrt(_761);
        _773 = _783;
    }
    float _785 = _773;
    if (_765)
    {
        float _787 = _769 * _781;
        _775 = _787;
    }
    float _789 = _775;
    if (_765)
    {
        float _791 = _789 * 0.15915493667125701904296875;
        _657 = _791;
    }
    float _793 = _657;
    float _795 = _739;
    if (_765)
    {
        float _797 = _793 * 6.283185482025146484375;
        float _799 = sin(_797);
        _795 = _799;
    }
    float _801 = _795;
    float _803 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _805 = precise::max(0.0, _803);
    float _807 = _715;
    float _809 = _805;
    float _811 = _803;
    if (_765)
    {
        float _813 = _793 * 6.283185482025146484375;
        float _815 = cos(_813);
        _807 = _815;
    }
    float _817 = _807;
    float _819 = -_751;
    float _821 = -_805;
    float _823 = fma(_731, _819, _821);
    if (!_765)
    {
        _777 = _753;
    }
    float _825 = _777;
    float _827 = _825;
    if (_765)
    {
        float _829 = _823 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _809 = _829;
    }
    float _831 = _809;
    float _833 = _801;
    float _835 = _831;
    if (_765)
    {
        float _837 = fma(_801, _831, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _833 = _837;
    }
    float _839 = _833;
    float _841 = _839;
    float _843 = _817;
    if (_765)
    {
        float _845 = _817 + (-1.0);
        _811 = _845;
    }
    float _847 = _811;
    float _849 = _847;
    if (_765)
    {
        float _851 = _785 * _839;
        _443 = _851;
    }
    float _853 = _443;
    if (!_765)
    {
        _841 = _823;
    }
    float _855 = _841;
    float _857 = _719 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _859 = _855;
    if (_765)
    {
        float _861 = _847 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _835 = _861;
    }
    float _863 = _835;
    float _865 = _863;
    if (_765)
    {
        float _867 = _753 * _853;
        _827 = _867;
    }
    float _869 = _827;
    if (!_765)
    {
        _849 = _755;
    }
    float _871 = _849;
    float _873 = _871;
    if (_765)
    {
        float _875 = _755 * _853;
        _873 = _875;
    }
    float _877 = _873;
    if (_765)
    {
        float _879 = fma(_823, _817, _863);
        _859 = _879;
    }
    float _881 = _859;
    if (!_765)
    {
        _865 = _757;
    }
    float _883 = _865;
    float _885 = _883;
    if (_765)
    {
        float _887 = _869 * _869;
        _885 = _887;
    }
    float _889 = _885;
    if (!_765)
    {
        _843 = _759;
    }
    float _891 = _843;
    float _893 = _891;
    if (_765)
    {
        float _895 = _877 * _877;
        _893 = _895;
    }
    float _897 = _893;
    float _899 = _719 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _901 = fma(_881, _881, _889);
    float _903 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[0].x, _857);
    float _905 = _719 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _907 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[1].x, _899);
    float _909 = _901 + _897;
    float _911 = _719 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _913 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[1].z, _907);
    float _915 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[2].x, _905);
    float _917 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[0].z, _903);
    float _919 = rsqrt(_909);
    float _921 = _913 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _923 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _925 = fma(_749, (*spvDescriptorSet0.vp_c15)._m0[23].w, _923);
    float _927 = precise::clamp(_925, 0.0, 1.0);
    float _929 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[3].x, _911);
    float _931 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[2].z, _915);
    float _933 = _917 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _935 = _921 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _937 = -_927;
    float _939 = _937 + 1.0;
    float _941 = _931 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _943 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[3].z, _929);
    float _945 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[7].x, _935);
    float _947 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _949 = _941 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _951 = abs(_939);
    float _953 = log2(_951);
    float _955 = _943 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _957 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[7].z, _945);
    float _959 = _919 * _869;
    float _961 = _919 * _877;
    float _963 = -_949;
    float _965 = fma(_963, _947, 1.0);
    float _967 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[7].w, _957);
    float _969 = _919 * _881;
    float _971 = _959 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _973 = _921 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _975 = 1.0 / _967;
    float _977 = -_971;
    float _979 = fma(_969, (*spvDescriptorSet0.vp_c15)._m0[21].y, _977);
    float _981 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[5].x, _973);
    float _983 = -_961;
    float _985 = fma(_983, (*spvDescriptorSet0.vp_c15)._m0[21].z, _979);
    float _987 = _953 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _989 = _921 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _991 = log2(_965);
    float _993 = fma(_985, -0.5, 0.5);
    float _995 = fma(_985, 0.5, 0.5);
    float _997 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[4].x, _989);
    float _999 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[5].z, _981);
    float _1001 = _969 + 1.0;
    float _1003 = fma(_995, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1005 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[4].z, _997);
    float _1007 = exp2(_987);
    float _1009 = fma(_995, _1003, -0.212114393711090087890625);
    float _1011 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1005);
    float _1013 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[5].w, _999);
    float _1015 = fma(_995, _1009, 1.570728778839111328125);
    float _1017 = _1011 * _975;
    float _1019 = sqrt(_993);
    float _1021 = _991 * 0.693147182464599609375;
    float _1023 = fma(_1017, 0.5, 0.5);
    float _1025 = _1021 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1027 = -_969;
    float _1029 = fma(_1007, _1001, _1027);
    float _1031 = _1013 * _975;
    float _1033 = fma(_1029, 0.5, 0.5);
    float _1035 = fma(_1031, -0.5, 0.5);
    float _1037 = _1019 * 0.636619746685028076171875;
    float _1039 = -_1015;
    float _1041 = fma(_1037, _1039, 1.0);
    float3 _2877 = float3(_1023, _1035, _1025);
    float _1043 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2877, float3(0.0), isnan(_2877)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2877, float3(0.0), isnan(_2877)), level(0.0)).x;
    float3 _2888 = float3(_1023, _1035, _1025);
    float4 _1046 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2888, float3(0.0), isnan(_2888)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2888, float3(0.0), isnan(_2888)), level(0.0)).xyzw;
    float _1048 = _1046.x;
    float _1050 = _1046.y;
    float _1052 = _1046.z;
    float _1054 = _1046.w;
    float2 _2905 = float2(_1041, _1033);
    float3 _1058 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2905, float2(0.0), isnan(_2905)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2905, float2(0.0), isnan(_2905)), level(0.0)).xyz;
    float _1060 = _1058.x;
    float _1062 = _1058.y;
    float _1064 = _1058.z;
    float _1066 = _447 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1068 = _953 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1070 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1072 = isnan(0.5);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1078 = _1074 || _1076;
    float _1080 = _921 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1082 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1066);
    float _1084 = _447 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1086 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1080);
    float _1088 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1082);
    float _1090 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1084);
    float _1092 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1086);
    float _1094 = _1088 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1096 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1090);
    float _1098 = exp2(_1068);
    float _1100 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1092);
    float _1102 = _1096 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1104 = _1102 + _1094;
    float _1106 = 1.0 / _1094;
    float _1108 = _1104 * _1106;
    float _1110 = _1108 * 0.5;
    float _1112 = _1104;
    if (_1078)
    {
        _1112 = 1.0;
    }
    float _1114 = _1112;
    float _1116 = _1114;
    if (!_1078)
    {
        float _1118 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1120 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1122 = _1118 * 0.15915493667125701904296875;
        float _1124 = _1120 * 0.15915493667125701904296875;
        float _1126 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1128 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1126);
        float _1130 = _1122 * 6.283185482025146484375;
        float _1132 = cos(_1130);
        float _1134 = _1122 * 6.283185482025146484375;
        float _1136 = sin(_1134);
        float _1138 = 1.0 / _1132;
        float _1140 = _1124 * 6.283185482025146484375;
        float _1142 = cos(_1140);
        float _1144 = _1136 * _1138;
        float _1146 = _1124 * 6.283185482025146484375;
        float _1148 = sin(_1146);
        float _1150 = _1142 * _1144;
        float _1152 = 1.0 / _1128;
        float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1156 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1154;
        float _1158 = 1.0 / _1150;
        float _1160 = 1.0 / _1156;
        float _1162 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1164 = _1152 * _1162;
        float _1166 = _1148 * _1158;
        float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1170 = fma(_1166, _1164, _1168);
        float _1172 = _1170 * _1160;
        float _1174 = precise::clamp(_1172, 0.0, 1.0);
        _1116 = _1174;
    }
    float _1176 = _1116;
    float _1178 = _1100 + _967;
    float _1180 = -_1098;
    float _1182 = _1180 + 1.0;
    bool _1184 = _1176 > 0.0;
    bool _1186 = isnan(_1176);
    bool _1188 = _1184 || _1186;
    bool _1190 = isnan(0.0);
    bool _1192 = _1188 || _1190;
    float _1194 = _1176 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1196 = _1178 * 0.5;
    float _1198 = _1182 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1200 = _1194 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1202 = _1198 * _1043;
    float _1204 = -_1198;
    float _1206 = _1204 + 1.0;
    out.gl_Position.x = _1011;
    out.gl_Position.y = _1013;
    out.gl_Position.z = _1100;
    out.gl_Position.w = _967;
    float _1208 = _1054 * _1202;
    float _1210 = _1064 * _1202;
    float _1212 = _1054 * _1206;
    out.m_62.z = _1196;
    out.m_62.w = _967;
    float _1214 = fma(_1060, _1208, _1048);
    float _1216 = fma(_1062, _1208, _1050);
    float _1218 = fma(_1054, _1210, _1052);
    out.m_45.x = _1200;
    out.m_64.x = _1214;
    out.m_64.y = _1216;
    out.m_64.z = _1218;
    out.m_64.w = _1212;
    if (_1192)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1220 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1220;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _91 = as_type<float>(_83);
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _89;
    float _95 = _93;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_87)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1278 = as_type<float>(_101);
        out.gl_Position.z = _1278;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_83);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    if (_129)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _91;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _103 = as_type<int>(_133);
    }
    int _135 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1346 = as_type<float>(_135);
        out.gl_Position.z = _1346;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    float _139 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _141 = in.m_52.w;
    bool _143 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _145 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _147 = _143 || _145;
    bool _149 = isnan(1.0);
    bool _151 = _147 || _149;
    float _153 = in.m_54.y;
    float _155 = in.m_47.x;
    float _157 = in.m_47.y;
    float _159 = in.m_47.z;
    float _161 = in.m_42.x;
    float _163 = in.m_42.y;
    float _165 = in.m_42.z;
    float _167 = 0.0;
    float _169 = _139;
    if (!_151)
    {
        float _171 = _139 * _139;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = _175;
    if (!_151)
    {
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _179;
    }
    float _181 = _177;
    int _183 = as_type<int>(_137) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_137) & 2;
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_151;
    float _201 = _181;
    if (!_199)
    {
        float _203 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = log2(_203);
        float _207 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _209 = _207 + 1.0;
        float _211 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = _139 * _205;
        float _215 = exp2(_213);
        float _217 = _211 * 0.693147182464599609375;
        float _219 = 1.0 / _217;
        float _221 = 1.0 / _209;
        float _223 = _215 + (-1.0);
        float _225 = -_223;
        float _227 = fma(_225, _219, _139);
        float _229 = _227 * _221;
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
        float _247 = _139 * _239;
        float _249 = exp2(_247);
        float _251 = -_249;
        float _253 = _251 + 1.0;
        float _255 = _253 * _245;
        _169 = _255;
    }
    float _257 = _169;
    float _259 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _261 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _263 = in.m_54.x;
    float _265 = fma(_257, _157, _259);
    float _267 = fma(_257, _155, _261);
    float _269 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _273 = _271 != 0;
    float _275 = fma(_265, _141, _163);
    float _277 = fma(_267, _141, _161);
    float _279 = fma(_257, _159, _269);
    int _281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _283 = _281 != 0;
    float _285 = _275 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _287 = _275 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _289 = fma(_279, _141, _165);
    float _291 = _275 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _293 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[5].x, _285);
    float _295 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[4].x, _287);
    bool _297 = _153 > 0.5;
    float _299 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[6].x, _291);
    float _301 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[5].z, _293);
    float _303 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[4].z, _295);
    float _305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _307 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[6].z, _299);
    float _309 = _301 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _311 = _303 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _313 = _263 > 0.5;
    float _315 = _307 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _317 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _319 = _309 + _317;
    float _321 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _323 = _311 + _321;
    float _325 = -_193;
    int _327 = _313 ? as_type<int>(_325) : as_type<int>(_193);
    float _329 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _331 = _315 + _329;
    float _333 = _319 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _335 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _337 = -_197;
    int _339 = _297 ? as_type<int>(_337) : as_type<int>(_197);
    float _341 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _343 = fma(_323, (*spvDescriptorSet0.vp_c8)._m0[28].x, _333);
    bool _345 = !_273;
    float _347 = _345 ? _193 : as_type<float>(_327);
    bool _349 = !_283;
    float _351 = _349 ? _197 : as_type<float>(_339);
    float _353 = fma(_331, (*spvDescriptorSet0.vp_c8)._m0[28].z, _343);
    float _355 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _357 = _347 + 0.5;
    float _359 = _341 * _305;
    float _361 = -_351;
    float _363 = _361 + 0.5;
    bool _365 = _353 >= 0.0;
    float _367 = _319 * _319;
    float _369 = _357 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _371 = _363 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _373 = fma(_323, _323, _367);
    float _375 = _369 * _335;
    float _377 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[20].x, _359);
    float _379 = fma(_331, _331, _373);
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _383 = _371 * _355;
    float _385 = rsqrt(_379);
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _391 = _371;
    if (_365)
    {
        _391 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _393 = _391;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _401 = floor(_377);
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _405 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _407 = _387 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _409 = _389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = _395 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _413 = _397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _415 = _399 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _417 = as_type<int>(_393);
    if (_365)
    {
        float _419 = _393 * 5.0;
        _417 = as_type<int>(_419);
    }
    int _421 = _417;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _425 = _423 != 0;
    int _427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _429 = _427 != 0;
    out.m_56.x = _405;
    out.m_56.y = _407;
    out.m_56.z = _409;
    out.m_56.w = _403;
    float _431 = _319 * _385;
    float _433 = _323 * _385;
    out.m_58.x = _411;
    out.m_58.y = _413;
    out.m_58.z = _415;
    bool _435 = !_425;
    int _437 = _435 ? 0 : 1;
    bool _439 = !_429;
    int _441 = _439 ? 0 : 1;
    out.m_60.x = _375;
    out.m_60.y = _383;
    float _443 = _431;
    if (_365)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1881 = as_type<float>(_421);
        out.gl_Position.z = _1881;
    }
    if (_365)
    {
        out.m_45.x = 0.0;
    }
    if (_365)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _445 = -_431;
    float _447 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[18].w, _309);
    float _449 = -_433;
    float _451 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[18].w, _311);
    float _453 = _331 * _385;
    float _455 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _457 = _447 + _455;
    float _459 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _461 = _451 + _459;
    int _463 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _465 = _463 != 0;
    float _467 = -_431;
    float _469 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[18].w, _319);
    float _471 = _457 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _473 = -_453;
    float _475 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[18].w, _315);
    float _477 = in.m_52.x;
    float _479 = fma(_461, (*spvDescriptorSet0.vp_c8)._m0[28].x, _471);
    float _481 = _377 * 6.283185482025146484375;
    float _483 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _485 = _475 + _483;
    float _487 = -_433;
    float _489 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[18].w, _323);
    float _491 = -_401;
    float _493 = _377 + _491;
    float _495 = _481 * 0.15915493667125701904296875;
    float _497 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[28].z, _479);
    int _499 = abs(_437);
    float _501 = _469 * _469;
    bool _503 = !_465;
    int _505 = _503 ? 0 : 1;
    float _507 = in.m_52.y;
    float _509 = _495 * 6.283185482025146484375;
    float _511 = cos(_509);
    bool _513 = _497 >= 0.0;
    float _515 = fma(_489, _489, _501);
    float _517 = float(_499);
    float _519 = -_453;
    float _521 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[18].w, _331);
    float _523 = -_493;
    float _525 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _527 = abs(_505);
    float _529 = fma(_521, _521, _515);
    float _531 = abs(_525);
    float _533 = _517 * _531;
    bool _535 = _493 < 0.5;
    float _537 = float(_535);
    int _539 = abs(_441);
    float _541 = sqrt(_529);
    float _543 = float(_527);
    float _545 = -_537;
    float _547 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _549 = fma(_511, 0.5, 0.5);
    float _551 = float(_539);
    float _553 = _525;
    if (_513)
    {
        out.m_45.x = 0.0;
    }
    if (_513)
    {
        _553 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _555 = _553;
    float _557 = -_549;
    float _559 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _561 = fma(_543, _559, _533);
    int _563 = as_type<int>(_555);
    if (_513)
    {
        float _565 = _555 * 5.0;
        _563 = as_type<int>(_565);
    }
    int _567 = _563;
    float _569 = _477 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _571 = _507 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _573 = abs(_547);
    float _575 = fma(_551, _573, _561);
    float _577 = _385 * _541;
    float _579 = _575 * _569;
    float _581 = _575 * _571;
    if (_513)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2108 = as_type<float>(_567);
        out.gl_Position.z = _2108;
    }
    if (_513)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _583 = _581 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _585 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _587 = _579 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _589 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _591 = _577 * _583;
    float _593 = _577 * _587;
    float _595 = _585 * _591;
    float _597 = _589 * _593;
    float _599 = _577 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _601 = _599 * 0.5;
    float _603 = _595 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _605 = _595 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _607 = fma(_597, (*spvDescriptorSet0.vp_c8)._m0[26].x, _603);
    float _609 = fma(_597, (*spvDescriptorSet0.vp_c8)._m0[24].x, _605);
    float _611 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[26].z, _607);
    float _613 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[24].z, _609);
    float _615 = _611 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _617 = _613 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _619 = _315 + _615;
    float _621 = _311 + _617;
    float _623 = _595 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _625 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _627 = _619 + _625;
    float _629 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _631 = _621 + _629;
    float _633 = fma(_597, (*spvDescriptorSet0.vp_c8)._m0[25].x, _623);
    float _635 = _627 * _627;
    float _637 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[25].z, _633);
    float _639 = fma(_631, _631, _635);
    float _641 = _637 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _643 = sqrt(_639);
    float _645 = _309 + _641;
    bool _647 = _643 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _649 = _623;
    float _651 = _637;
    float _653 = _641;
    float _655 = _621;
    float _657 = _619;
    if (!_647)
    {
        _649 = _621;
    }
    float _659 = _649;
    float _661 = _659;
    if (!_647)
    {
        _651 = _619;
    }
    float _663 = _651;
    float _665 = _663;
    if (!_647)
    {
        _653 = _645;
    }
    float _667 = _653;
    bool _669 = !_647;
    float _671 = _667;
    if (!_669)
    {
        float _673 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _675 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _677 = _643 + _675;
        float _679 = _645 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _681 = rsqrt(_639);
        float _683 = _677 * _673;
        float _685 = _683 * 0.15915493667125701904296875;
        float _687 = _685 * 6.283185482025146484375;
        float _689 = cos(_687);
        float _691 = _685 * 6.283185482025146484375;
        float _693 = sin(_691);
        float _695 = _689 + (-1.0);
        float _697 = _695 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _699 = fma(_693, _679, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _701 = fma(_645, _689, _697);
        float _703 = _681 * _699;
        float _705 = fma(_631, _703, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _707 = fma(_627, _703, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _671 = _701;
        _661 = _705;
        _665 = _707;
        _655 = _685;
    }
    float _709 = _671;
    float _711 = _661;
    float _713 = _665;
    float _715 = _655;
    float _717 = -_431;
    float _719 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[18].w, _709);
    float _721 = -_433;
    float _723 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[18].w, _711);
    float _725 = -_453;
    float _727 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[18].w, _713);
    float _729 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _731 = _719 + _729;
    float _733 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _735 = _723 + _733;
    float _737 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _739 = _727 + _737;
    float _741 = _731 * _731;
    float _743 = fma(_735, _735, _741);
    float _745 = fma(_739, _739, _743);
    float _747 = rsqrt(_745);
    float _749 = sqrt(_745);
    float _751 = _747 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _753 = _735 * _751;
    float _755 = _739 * _751;
    float _757 = _753 * _753;
    float _759 = _755 * _755;
    float _761 = _757 + _759;
    float _763 = sqrt(_761);
    bool _765 = _763 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _767 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _769 = _763 + _767;
    float _771 = _747;
    float _773 = _761;
    float _775 = _769;
    float _777 = _731;
    if (_765)
    {
        float _779 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _771 = _779;
    }
    float _781 = _771;
    if (_765)
    {
        float _783 = rsqrt(_761);
        _773 = _783;
    }
    float _785 = _773;
    if (_765)
    {
        float _787 = _769 * _781;
        _775 = _787;
    }
    float _789 = _775;
    if (_765)
    {
        float _791 = _789 * 0.15915493667125701904296875;
        _657 = _791;
    }
    float _793 = _657;
    float _795 = _739;
    if (_765)
    {
        float _797 = _793 * 6.283185482025146484375;
        float _799 = sin(_797);
        _795 = _799;
    }
    float _801 = _795;
    float _803 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _805 = precise::max(0.0, _803);
    float _807 = _715;
    float _809 = _805;
    float _811 = _803;
    if (_765)
    {
        float _813 = _793 * 6.283185482025146484375;
        float _815 = cos(_813);
        _807 = _815;
    }
    float _817 = _807;
    float _819 = -_751;
    float _821 = -_805;
    float _823 = fma(_731, _819, _821);
    if (!_765)
    {
        _777 = _753;
    }
    float _825 = _777;
    float _827 = _825;
    if (_765)
    {
        float _829 = _823 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _809 = _829;
    }
    float _831 = _809;
    float _833 = _801;
    float _835 = _831;
    if (_765)
    {
        float _837 = fma(_801, _831, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _833 = _837;
    }
    float _839 = _833;
    float _841 = _839;
    float _843 = _817;
    if (_765)
    {
        float _845 = _817 + (-1.0);
        _811 = _845;
    }
    float _847 = _811;
    float _849 = _847;
    if (_765)
    {
        float _851 = _785 * _839;
        _443 = _851;
    }
    float _853 = _443;
    if (!_765)
    {
        _841 = _823;
    }
    float _855 = _841;
    float _857 = _719 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _859 = _855;
    if (_765)
    {
        float _861 = _847 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _835 = _861;
    }
    float _863 = _835;
    float _865 = _863;
    if (_765)
    {
        float _867 = _753 * _853;
        _827 = _867;
    }
    float _869 = _827;
    if (!_765)
    {
        _849 = _755;
    }
    float _871 = _849;
    float _873 = _871;
    if (_765)
    {
        float _875 = _755 * _853;
        _873 = _875;
    }
    float _877 = _873;
    if (_765)
    {
        float _879 = fma(_823, _817, _863);
        _859 = _879;
    }
    float _881 = _859;
    if (!_765)
    {
        _865 = _757;
    }
    float _883 = _865;
    float _885 = _883;
    if (_765)
    {
        float _887 = _869 * _869;
        _885 = _887;
    }
    float _889 = _885;
    if (!_765)
    {
        _843 = _759;
    }
    float _891 = _843;
    float _893 = _891;
    if (_765)
    {
        float _895 = _877 * _877;
        _893 = _895;
    }
    float _897 = _893;
    float _899 = _719 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _901 = fma(_881, _881, _889);
    float _903 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[0].x, _857);
    float _905 = _719 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _907 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[1].x, _899);
    float _909 = _901 + _897;
    float _911 = _719 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _913 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[1].z, _907);
    float _915 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[2].x, _905);
    float _917 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[0].z, _903);
    float _919 = rsqrt(_909);
    float _921 = _913 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _923 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _925 = fma(_749, (*spvDescriptorSet0.vp_c15)._m0[23].w, _923);
    float _927 = precise::clamp(_925, 0.0, 1.0);
    float _929 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[3].x, _911);
    float _931 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[2].z, _915);
    float _933 = _917 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _935 = _921 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _937 = -_927;
    float _939 = _937 + 1.0;
    float _941 = _931 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _943 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[3].z, _929);
    float _945 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[7].x, _935);
    float _947 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _949 = _941 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _951 = abs(_939);
    float _953 = log2(_951);
    float _955 = _943 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _957 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[7].z, _945);
    float _959 = _919 * _869;
    float _961 = _919 * _877;
    float _963 = -_949;
    float _965 = fma(_963, _947, 1.0);
    float _967 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[7].w, _957);
    float _969 = _919 * _881;
    float _971 = _959 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _973 = _921 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _975 = 1.0 / _967;
    float _977 = -_971;
    float _979 = fma(_969, (*spvDescriptorSet0.vp_c15)._m0[21].y, _977);
    float _981 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[5].x, _973);
    float _983 = -_961;
    float _985 = fma(_983, (*spvDescriptorSet0.vp_c15)._m0[21].z, _979);
    float _987 = _953 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _989 = _921 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _991 = log2(_965);
    float _993 = fma(_985, -0.5, 0.5);
    float _995 = fma(_985, 0.5, 0.5);
    float _997 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[4].x, _989);
    float _999 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[5].z, _981);
    float _1001 = _969 + 1.0;
    float _1003 = fma(_995, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1005 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[4].z, _997);
    float _1007 = exp2(_987);
    float _1009 = fma(_995, _1003, -0.212114393711090087890625);
    float _1011 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1005);
    float _1013 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[5].w, _999);
    float _1015 = fma(_995, _1009, 1.570728778839111328125);
    float _1017 = _1011 * _975;
    float _1019 = sqrt(_993);
    float _1021 = _991 * 0.693147182464599609375;
    float _1023 = fma(_1017, 0.5, 0.5);
    float _1025 = _1021 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1027 = -_969;
    float _1029 = fma(_1007, _1001, _1027);
    float _1031 = _1013 * _975;
    float _1033 = fma(_1029, 0.5, 0.5);
    float _1035 = fma(_1031, -0.5, 0.5);
    float _1037 = _1019 * 0.636619746685028076171875;
    float _1039 = -_1015;
    float _1041 = fma(_1037, _1039, 1.0);
    float3 _2877 = float3(_1023, _1035, _1025);
    float _1043 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2877, float3(0.0), isnan(_2877)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2877, float3(0.0), isnan(_2877)), level(0.0)).x;
    float3 _2888 = float3(_1023, _1035, _1025);
    float4 _1046 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2888, float3(0.0), isnan(_2888)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2888, float3(0.0), isnan(_2888)), level(0.0)).xyzw;
    float _1048 = _1046.x;
    float _1050 = _1046.y;
    float _1052 = _1046.z;
    float _1054 = _1046.w;
    float2 _2905 = float2(_1041, _1033);
    float3 _1058 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2905, float2(0.0), isnan(_2905)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2905, float2(0.0), isnan(_2905)), level(0.0)).xyz;
    float _1060 = _1058.x;
    float _1062 = _1058.y;
    float _1064 = _1058.z;
    float _1066 = _447 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1068 = _953 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1070 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1072 = isnan(0.5);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1078 = _1074 || _1076;
    float _1080 = _921 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1082 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1066);
    float _1084 = _447 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1086 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1080);
    float _1088 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1082);
    float _1090 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1084);
    float _1092 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1086);
    float _1094 = _1088 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1096 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1090);
    float _1098 = exp2(_1068);
    float _1100 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1092);
    float _1102 = _1096 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1104 = _1102 + _1094;
    float _1106 = 1.0 / _1094;
    float _1108 = _1104 * _1106;
    float _1110 = _1108 * 0.5;
    float _1112 = _1104;
    if (_1078)
    {
        _1112 = 1.0;
    }
    float _1114 = _1112;
    float _1116 = _1114;
    if (!_1078)
    {
        float _1118 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1120 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1122 = _1118 * 0.15915493667125701904296875;
        float _1124 = _1120 * 0.15915493667125701904296875;
        float _1126 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1128 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1126);
        float _1130 = _1122 * 6.283185482025146484375;
        float _1132 = cos(_1130);
        float _1134 = _1122 * 6.283185482025146484375;
        float _1136 = sin(_1134);
        float _1138 = 1.0 / _1132;
        float _1140 = _1124 * 6.283185482025146484375;
        float _1142 = cos(_1140);
        float _1144 = _1136 * _1138;
        float _1146 = _1124 * 6.283185482025146484375;
        float _1148 = sin(_1146);
        float _1150 = _1142 * _1144;
        float _1152 = 1.0 / _1128;
        float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1156 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1154;
        float _1158 = 1.0 / _1150;
        float _1160 = 1.0 / _1156;
        float _1162 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1164 = _1152 * _1162;
        float _1166 = _1148 * _1158;
        float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1170 = fma(_1166, _1164, _1168);
        float _1172 = _1170 * _1160;
        float _1174 = precise::clamp(_1172, 0.0, 1.0);
        _1116 = _1174;
    }
    float _1176 = _1116;
    float _1178 = _1100 + _967;
    float _1180 = -_1098;
    float _1182 = _1180 + 1.0;
    bool _1184 = _1176 > 0.0;
    bool _1186 = isnan(_1176);
    bool _1188 = _1184 || _1186;
    bool _1190 = isnan(0.0);
    bool _1192 = _1188 || _1190;
    float _1194 = _1176 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1196 = _1178 * 0.5;
    float _1198 = _1182 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1200 = _1194 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1202 = _1198 * _1043;
    float _1204 = -_1198;
    float _1206 = _1204 + 1.0;
    out.gl_Position.x = _1011;
    out.gl_Position.y = _1013;
    out.gl_Position.z = _1100;
    out.gl_Position.w = _967;
    float _1208 = _1054 * _1202;
    float _1210 = _1064 * _1202;
    float _1212 = _1054 * _1206;
    out.m_62.z = _1196;
    out.m_62.w = _967;
    float _1214 = fma(_1060, _1208, _1048);
    float _1216 = fma(_1062, _1208, _1050);
    float _1218 = fma(_1054, _1210, _1052);
    out.m_45.x = _1200;
    out.m_64.x = _1214;
    out.m_64.y = _1216;
    out.m_64.z = _1218;
    out.m_64.w = _1212;
    if (_1192)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1220 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1220;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

