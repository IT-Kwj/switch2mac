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
    texture2d<float> vp_t_tcb_10 [[id(5)]];
    sampler vp_t_tcb_10Smplr [[id(6)]];
    sampler vp_t_tcb_10Smplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_48 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_54 [[user(locn2)]];
    float4 m_60 [[user(locn3)]];
    float4 m_38 [[user(locn4)]];
    float4 m_52 [[user(locn5)]];
    float4 m_56 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_35 [[attribute(2)]];
    float4 m_40 [[attribute(3)]];
    float4 m_58 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_44 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _74 = in.m_35.w;
    float _76 = trunc(_74);
    int _79 = int(_76);
    bool _83 = _79 >= 1;
    float _85 = 0.0;
    float _87 = as_type<float>(_79);
    if (!_83)
    {
        _85 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _89 = _85;
    float _91 = _89;
    if (!_83)
    {
        out.m_38.x = 0.0;
    }
    int _93 = 0;
    if (!_83)
    {
        float _95 = _89 * 5.0;
        _93 = as_type<int>(_95);
    }
    int _97 = _93;
    int _99 = _97;
    if (!_83)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2459 = as_type<float>(_97);
        out.gl_Position.z = _2459;
    }
    if (!_83)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _101 = in.m_40.w;
    bool _103 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_101;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_111)
    {
        float _117 = float(_79);
        _91 = _117;
    }
    float _119 = _91;
    bool _121 = _115 >= _119;
    bool _123 = !_111;
    bool _125 = _121 || _123;
    if (_125)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _87;
    if (_125)
    {
        out.m_38.x = 0.0;
    }
    if (_125)
    {
        float _129 = _127 * 5.0;
        _99 = as_type<int>(_129);
    }
    int _131 = _99;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2527 = as_type<float>(_131);
        out.gl_Position.z = _2527;
    }
    if (_125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = in.m_42.w;
    float _135 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _137 = in.m_44.y;
    int _139 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _141 = _139 != 0;
    float _143 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _147 = _145 != 0;
    float _149 = in.m_42.y;
    float _151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _155 = _153 != 0;
    float _157 = in.m_42.z;
    int _159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _161 = _159 != 0;
    float _163 = in.m_42.x;
    float _165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _167 = in.m_44.x;
    float _169 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _171 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _173 = _133 > 0.5;
    float _175 = _151 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _177 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _179 = -_137;
    float _181 = _179 + 1.0;
    float _183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _185 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _187 = _149 > 0.5;
    float _189 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[88].w, _169);
    float _191 = 0.0;
    float _193 = _137;
    bool _195 = _173;
    float _197 = _143;
    if (!_147)
    {
        _191 = _149;
    }
    float _199 = _191;
    float _201 = _165 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _203 = _157 > 0.5;
    int _205 = _187 ? as_type<int>(_181) : as_type<int>(_137);
    int _207 = _203 ? as_type<int>(_181) : as_type<int>(_137);
    float _209 = _155 ? as_type<float>(_205) : _137;
    float _211 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _213 = _161 ? as_type<float>(_207) : _137;
    float _215 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _217 = _149 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _219 = _199;
    float _221 = _167;
    if (_141)
    {
        float _223 = _173 ? _181 : _137;
        _193 = _223;
    }
    float _225 = _193;
    float _227 = fma(_217, -2.0, _215);
    float _229 = _135 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _235 = _233 != 0;
    float _237 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _227);
    int _239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _241 = _239 != 0;
    float _243 = _163 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _247 = _245 != 0;
    float _249 = fma(_229, _209, -0.5);
    float _251 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[78].w, _231);
    float _253 = _231;
    float _255 = _229;
    int _257 = as_type<int>(_237);
    float _259 = _243;
    float _261 = _249;
    if (!_147)
    {
        _253 = _199;
    }
    float _263 = _253;
    float _265 = fma(_175, _225, -0.5);
    float _267 = _263;
    if (_147)
    {
        _255 = _163;
    }
    float _269 = _255;
    float _271 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _251);
    float _273 = _269;
    if (_147)
    {
        _219 = _149;
    }
    float _275 = _219;
    float _277 = fma(_213, _201, -0.5);
    float _279 = _275;
    if (!_147)
    {
        _273 = _157;
    }
    float _281 = _273;
    float _283 = -_237;
    float _285 = fma(_271, _249, _283);
    int _287 = as_type<int>(_281);
    int _289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[87].x);
    if (_241)
    {
        float _291 = -_167;
        float _293 = _291 + 1.0;
        _257 = as_type<int>(_293);
    }
    int _295 = _257;
    if (_235)
    {
        bool _297 = _163 > 0.5;
        _195 = _297;
    }
    bool _299 = _195;
    float _301 = _281 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (_235)
    {
        float _303 = -_167;
        float _305 = _303 + 1.0;
        _287 = as_type<int>(_305);
    }
    int _307 = _287;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _311 = as_type<float>(_307);
    if (_247)
    {
        float _313 = -_167;
        float _315 = _313 + 1.0;
        _289 = as_type<int>(_315);
    }
    int _317 = _289;
    float _319 = -_211;
    float _321 = fma(_243, 2.0, _319);
    if (_147)
    {
        _267 = _163;
    }
    float _323 = _267;
    float _325 = -_309;
    float _327 = fma(_301, 2.0, _325);
    if (!_235)
    {
        _259 = _167;
    }
    float _329 = _259;
    float _331 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[83].z, _171);
    float _333 = 0.0;
    float _335 = _329;
    float _337 = _331;
    if (!_241)
    {
        _333 = _167;
    }
    float _339 = _333;
    float _341 = _323 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _343 = _339;
    if (_235)
    {
        float _345 = _299 ? as_type<float>(_307) : _167;
        _335 = _345;
    }
    float _347 = _335;
    if (_241)
    {
        float _349 = _203 ? as_type<float>(_295) : _167;
        _343 = _349;
    }
    float _351 = _343;
    float _353 = -_177;
    float _355 = fma(_341, 2.0, _353);
    if (_247)
    {
        float _357 = _187 ? as_type<float>(_317) : _167;
        _221 = _357;
    }
    float _359 = _221;
    float _361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _363 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _367 = _363 || _365;
    bool _369 = isnan(1.0);
    bool _371 = _367 || _369;
    if (!_147)
    {
        _311 = _157;
    }
    float _373 = _311;
    float _375 = _373;
    if (_147)
    {
        _375 = _275;
    }
    float _377 = _375;
    float _379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _381 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[83].w, _185);
    if (!_147)
    {
        _261 = _157;
    }
    float _383 = _261;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _387 = _383;
    if (_147)
    {
        _387 = _275;
    }
    float _389 = _387;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _393 = 0.0;
    if (!_371)
    {
        float _395 = _143 * _143;
        float _397 = _395 * 0.5;
        _393 = _397;
    }
    float _399 = _393;
    float _401 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[78].z, _385);
    float _403 = _399;
    if (!_147)
    {
        _279 = _163;
    }
    float _405 = _279;
    float _407 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[88].z, _391);
    float _409 = _361 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_371)
    {
        float _411 = _399 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _403 = _411;
    }
    float _413 = _403;
    float _415 = _379 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _417 = !_371;
    float _419 = _413;
    if (!_417)
    {
        float _421 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _423 = log2(_421);
        float _425 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _427 = _425 + 1.0;
        float _429 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _431 = _143 * _423;
        float _433 = 1.0 / _427;
        float _435 = _429 * 0.693147182464599609375;
        float _437 = exp2(_431);
        float _439 = 1.0 / _435;
        float _441 = _437 + (-1.0);
        float _443 = -_441;
        float _445 = fma(_443, _439, _143);
        float _447 = _445 * _433;
        float _449 = _447 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _419 = _449;
    }
    float _451 = _419;
    bool _453 = !_371;
    if (!_453)
    {
        float _455 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _457 = log2(_455);
        float _459 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _461 = _459 + 1.0;
        float _463 = 1.0 / _461;
        float _465 = _143 * _457;
        float _467 = exp2(_465);
        float _469 = -_467;
        float _471 = _469 + 1.0;
        float _473 = _471 * _463;
        _197 = _473;
    }
    float _475 = _197;
    float _477 = fma(_409, _347, -0.5);
    float _479 = in.m_46.w;
    float _481 = fma(_415, _351, -0.5);
    float _483 = in.m_40.x;
    float _485 = in.m_40.y;
    float _487 = in.m_40.z;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _491 = in.m_35.x;
    float _493 = in.m_35.y;
    float _495 = in.m_35.z;
    float _497 = _389 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _505 = fma(_497, -2.0, _489);
    float _507 = _451 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _509 = _499 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _511 = _501 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _513 = _183 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _515 = _503 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _517 = _451 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _519 = _451 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _521 = fma(_513, _359, -0.5);
    float _523 = _405 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _525 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[81].y, _505);
    float _527 = -_115;
    float _529 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[86].x, _327);
    float _531 = -_115;
    float _533 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[81].x, _355);
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _537 = fma(_475, _485, _507);
    float _539 = fma(_475, _483, _517);
    float _541 = -_115;
    float _543 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[76].x, _321);
    float _545 = fma(_475, _487, _519);
    float _547 = fma(_537, _479, _493);
    float _549 = fma(_539, _479, _491);
    float _551 = fma(_545, _479, _495);
    float _553 = _547 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _555 = _547 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _557 = _547 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _561 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[5].x, _553);
    float _563 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[4].x, _555);
    float _565 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[6].x, _557);
    out.m_48.x = _509;
    out.m_48.y = _511;
    out.m_48.z = _515;
    out.m_48.w = _535;
    float _567 = fma(_551, (*spvDescriptorSet0.vp_c10)._m0[5].z, _561);
    float _569 = fma(_551, (*spvDescriptorSet0.vp_c10)._m0[4].z, _563);
    float _571 = fma(_551, (*spvDescriptorSet0.vp_c10)._m0[6].z, _565);
    float _573 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _401);
    float _575 = _567 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _577 = _569 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _579 = _571 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _581 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].z, _331);
    float _583 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[87].w, _189);
    float _585 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _587 = _577 + _585;
    float _589 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _591 = _579 + _589;
    float _593 = fma(_581, _481, _533);
    float _595 = fma(_523, -2.0, _559);
    float _597 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _599 = _575 + _597;
    float _601 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[87].z, _407);
    float _603 = fma(_573, _477, _543);
    float _605 = _599 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _607 = fma(_601, _521, _529);
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _611 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[28].x, _605);
    float _613 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].w, _381);
    float _615 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[86].y, _595);
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _619 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[28].z, _611);
    float _621 = -_525;
    float _623 = fma(_613, _265, _621);
    float _625 = _599 * _599;
    float _627 = -_615;
    float _629 = fma(_583, _277, _627);
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _633 = _619 >= 0.0;
    float _635 = fma(_587, _587, _625);
    float _637 = _285 + 0.5;
    float _639 = _607 + 0.5;
    float _641 = _623 + 0.5;
    float _643 = fma(_591, _591, _635);
    float _645 = rsqrt(_643);
    float _647 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _649 = _617 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _651 = as_type<int>(_623);
    float _653 = 1.0;
    if (_633)
    {
        _337 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _655 = _337;
    float _657 = _631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _659 = _603 + 0.5;
    float _661 = _593 + 0.5;
    float _663 = _629 + 0.5;
    if (_633)
    {
        float _665 = _655 * 5.0;
        _651 = as_type<int>(_665);
    }
    int _667 = _651;
    out.m_50.x = _647;
    out.m_50.y = _649;
    out.m_50.z = _657;
    out.m_52.x = 1.0;
    out.m_52.y = 1.0;
    out.m_52.z = 1.0;
    float _669 = _599 * _645;
    float _671 = _587 * _645;
    out.m_54.x = _659;
    out.m_54.y = _637;
    out.m_54.z = _661;
    out.m_54.w = _641;
    out.m_56.x = _639;
    out.m_56.y = _663;
    if (_633)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3517 = as_type<float>(_667);
        out.gl_Position.z = _3517;
    }
    if (_633)
    {
        out.m_38.x = 0.0;
    }
    if (_633)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _673 = -_669;
    float _675 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[18].w, _575);
    float _677 = _591 * _645;
    float _679 = -_671;
    float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[18].w, _577);
    float _683 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _685 = _675 + _683;
    float _687 = -_677;
    float _689 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[18].w, _579);
    float _691 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _693 = _681 + _691;
    float _695 = _685 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _697 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _699 = _689 + _697;
    float _701 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[28].x, _695);
    float _703 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[28].z, _701);
    bool _705 = _703 >= 0.0;
    if (_705)
    {
        _653 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _707 = _653;
    int _709 = as_type<int>(_707);
    if (_705)
    {
        out.m_38.x = 0.0;
    }
    if (_705)
    {
        float _711 = _707 * 5.0;
        _709 = as_type<int>(_711);
    }
    int _713 = _709;
    if (_705)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3611 = as_type<float>(_713);
        out.gl_Position.z = _3611;
    }
    if (_705)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _715 = _675 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _717 = _675 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    float _719 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[11].x, _715);
    float _721 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[9].x, _717);
    float _723 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[11].z, _719);
    float _725 = _675 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    float _727 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[9].z, _721);
    float _729 = _723 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _731 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[8].x, _725);
    float _733 = _727 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    float _735 = 1.0 / _729;
    float _737 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[8].z, _731);
    float _739 = _729 * 0.5;
    float _741 = _737 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _743 = fma(_733, -0.5, _739);
    float _745 = _741 + _729;
    float _747 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4899999797344207763671875, _743);
    float _749 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _743);
    float _751 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _743);
    float _753 = _745 * 0.5;
    float _755 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _743);
    float _757 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _743);
    float _759 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.2800000011920928955078125, _743);
    float _761 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _753);
    float _763 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _753);
    float _765 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _753);
    float _767 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _753);
    float _769 = _761 * _735;
    float _771 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _743);
    float _773 = _747 * _735;
    float _775 = _749 * _735;
    float _777 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _753);
    float _779 = _763 * _735;
    float _781 = _751 * _735;
    float _783 = _765 * _735;
    float _785 = _767 * _735;
    float _787 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _743);
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _791 = _743 + _789;
    float _793 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _753);
    float _795 = _755 * _735;
    float _797 = _757 * _735;
    float _799 = _759 * _735;
    float _801 = _771 * _735;
    float2 _3794 = float2(_769, _773);
    float _803 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3794, float2(0.0), isnan(_3794)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3794, float2(0.0), isnan(_3794)), level(0.0)).x;
    float2 _3804 = float2(_779, _781);
    float _805 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3804, float2(0.0), isnan(_3804)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3804, float2(0.0), isnan(_3804)), level(0.0)).x;
    float2 _3812 = float2(_779, _775);
    float _807 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3812, float2(0.0), isnan(_3812)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3812, float2(0.0), isnan(_3812)), level(0.0)).x;
    float2 _3820 = float2(_783, _795);
    float _809 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3820, float2(0.0), isnan(_3820)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3820, float2(0.0), isnan(_3820)), level(0.0)).x;
    float2 _3828 = float2(_785, _799);
    float _811 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3828, float2(0.0), isnan(_3828)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3828, float2(0.0), isnan(_3828)), level(0.0)).x;
    float _813 = _743 * _735;
    float _815 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _743);
    float _817 = _743 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _819 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _743);
    float _821 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _743);
    float _823 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _743);
    float _825 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _743);
    float _827 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _743);
    float _829 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _743);
    float _831 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _743);
    float _833 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _743);
    float _835 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _743);
    float _837 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _743);
    float _839 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _743);
    float _841 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _743);
    float _843 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _753);
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _847 = _753 + _845;
    float _849 = _777 * _735;
    float _851 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _743);
    float _853 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _753);
    float _855 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _753);
    float _857 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _753);
    float _859 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _753);
    float _861 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _753);
    float _863 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _753);
    float _865 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _753);
    float _867 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _753);
    float _869 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _753);
    float _871 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _753);
    float _873 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _753);
    float _875 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _753);
    float _877 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _753);
    float _879 = _793 * _735;
    float _881 = _787 * _735;
    float _883 = _791 * _735;
    float _885 = _753 * _735;
    float _887 = _843 * _735;
    float2 _3991 = float2(_849, _797);
    float _889 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3991, float2(0.0), isnan(_3991)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3991, float2(0.0), isnan(_3991)), level(0.0)).x;
    float2 _3999 = float2(_849, _801);
    float _891 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3999, float2(0.0), isnan(_3999)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3999, float2(0.0), isnan(_3999)), level(0.0)).x;
    float _893 = _847 * _735;
    float _895 = _817 * _735;
    float _897 = _821 * _735;
    float _899 = _823 * _735;
    float _901 = _875 * _735;
    float2 _4022 = float2(_879, _881);
    float _903 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4022, float2(0.0), isnan(_4022)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4022, float2(0.0), isnan(_4022)), level(0.0)).x;
    float2 _4030 = float2(_885, _881);
    float _905 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4030, float2(0.0), isnan(_4030)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4030, float2(0.0), isnan(_4030)), level(0.0)).x;
    float2 _4038 = float2(_885, _883);
    float _907 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4038, float2(0.0), isnan(_4038)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4038, float2(0.0), isnan(_4038)), level(0.0)).x;
    float _909 = _877 * _735;
    float _911 = _753 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _913 = _825 * _735;
    float2 _4056 = float2(_885, _895);
    float _915 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4056, float2(0.0), isnan(_4056)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4056, float2(0.0), isnan(_4056)), level(0.0)).x;
    float2 _4064 = float2(_887, _897);
    float _917 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4064, float2(0.0), isnan(_4064)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4064, float2(0.0), isnan(_4064)), level(0.0)).x;
    float2 _4072 = float2(_885, _897);
    float _919 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4072, float2(0.0), isnan(_4072)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4072, float2(0.0), isnan(_4072)), level(0.0)).x;
    float2 _4080 = float2(_885, _899);
    float _921 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4080, float2(0.0), isnan(_4080)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4080, float2(0.0), isnan(_4080)), level(0.0)).x;
    float2 _4088 = float2(_885, _913);
    float _923 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4088, float2(0.0), isnan(_4088)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4088, float2(0.0), isnan(_4088)), level(0.0)).x;
    float2 _4096 = float2(_885, _813);
    float _925 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4096, float2(0.0), isnan(_4096)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4096, float2(0.0), isnan(_4096)), level(0.0)).x;
    float2 _4104 = float2(_893, _813);
    float _927 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4104, float2(0.0), isnan(_4104)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4104, float2(0.0), isnan(_4104)), level(0.0)).x;
    float _929 = _815 * _735;
    float _931 = _853 * _735;
    float _933 = _819 * _735;
    float _935 = _911 * _735;
    float _937 = _857 * _735;
    float _939 = _855 * _735;
    float _941 = _859 * _735;
    float2 _4133 = float2(_931, _929);
    float _943 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4133, float2(0.0), isnan(_4133)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4133, float2(0.0), isnan(_4133)), level(0.0)).x;
    float2 _4141 = float2(_931, _933);
    float _945 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4141, float2(0.0), isnan(_4141)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4141, float2(0.0), isnan(_4141)), level(0.0)).x;
    float2 _4149 = float2(_931, _813);
    float _947 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4149, float2(0.0), isnan(_4149)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4149, float2(0.0), isnan(_4149)), level(0.0)).x;
    float2 _4157 = float2(_935, _813);
    float _949 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4157, float2(0.0), isnan(_4157)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4157, float2(0.0), isnan(_4157)), level(0.0)).x;
    float2 _4165 = float2(_939, _813);
    float _951 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4165, float2(0.0), isnan(_4165)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4165, float2(0.0), isnan(_4165)), level(0.0)).x;
    float2 _4173 = float2(_937, _813);
    float _953 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4173, float2(0.0), isnan(_4173)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4173, float2(0.0), isnan(_4173)), level(0.0)).x;
    float2 _4181 = float2(_941, _813);
    float _955 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4181, float2(0.0), isnan(_4181)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4181, float2(0.0), isnan(_4181)), level(0.0)).x;
    float _957 = _827 * _735;
    float _959 = _829 * _735;
    float _961 = _861 * _735;
    float _963 = _865 * _735;
    float _965 = _863 * _735;
    float _967 = _867 * _735;
    float _969 = _831 * _735;
    float _971 = _869 * _735;
    float _973 = _833 * _735;
    float _975 = _871 * _735;
    float _977 = _835 * _735;
    float _979 = _873 * _735;
    float2 _4225 = float2(_961, _957);
    float _981 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4225, float2(0.0), isnan(_4225)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4225, float2(0.0), isnan(_4225)), level(0.0)).x;
    float2 _4233 = float2(_965, _959);
    float _983 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4233, float2(0.0), isnan(_4233)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4233, float2(0.0), isnan(_4233)), level(0.0)).x;
    float2 _4241 = float2(_963, _969);
    float _985 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4241, float2(0.0), isnan(_4241)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4241, float2(0.0), isnan(_4241)), level(0.0)).x;
    float2 _4249 = float2(_967, _973);
    float _987 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4249, float2(0.0), isnan(_4249)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4249, float2(0.0), isnan(_4249)), level(0.0)).x;
    float2 _4257 = float2(_971, _977);
    float _989 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4257, float2(0.0), isnan(_4257)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4257, float2(0.0), isnan(_4257)), level(0.0)).x;
    float _991 = _837 * _735;
    float _993 = _839 * _735;
    float _995 = _841 * _735;
    float _997 = _851 * _735;
    float2 _4277 = float2(_975, _991);
    float _999 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4277, float2(0.0), isnan(_4277)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4277, float2(0.0), isnan(_4277)), level(0.0)).x;
    float2 _4285 = float2(_979, _993);
    float _1001 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4285, float2(0.0), isnan(_4285)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4285, float2(0.0), isnan(_4285)), level(0.0)).x;
    float2 _4293 = float2(_901, _995);
    float _1003 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4293, float2(0.0), isnan(_4293)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4293, float2(0.0), isnan(_4293)), level(0.0)).x;
    float2 _4301 = float2(_909, _997);
    float _1005 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4301, float2(0.0), isnan(_4301)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4301, float2(0.0), isnan(_4301)), level(0.0)).x;
    float _1007 = -_669;
    float _1009 = fma(_1007, (*spvDescriptorSet0.vp_c9)._m0[18].w, _599);
    float _1011 = -_671;
    float _1013 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[18].w, _587);
    float _1015 = -_677;
    float _1017 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[18].w, _591);
    float _1019 = _1009 * _1009;
    float _1021 = fma(_1013, _1013, _1019);
    float _1023 = in.m_46.x;
    float _1025 = in.m_46.y;
    float _1027 = in.m_46.z;
    float _1029 = fma(_1017, _1017, _1021);
    float _1031 = in.m_58.x;
    float _1033 = in.m_58.y;
    float _1035 = in.m_58.z;
    float _1037 = sqrt(_1029);
    bool _1039 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1041 = isnan(0.5);
    bool _1043 = _1039 || _1041;
    bool _1045 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1047 = _1043 || _1045;
    float _1049 = _645 * _1037;
    float _1051 = _1025 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1053 = _1023 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1055 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1057 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1059 = _1053 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1061 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1033);
    float _1063 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1031);
    float _1065 = _1049 * _1057;
    float _1067 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1069 = _1049 * _1059;
    float _1071 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1035);
    float _1073 = _1061 * _1065;
    float _1075 = _1049 * _1067;
    float _1077 = _1063 * _1069;
    float _1079 = _1073 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1081 = _1071 * _1075;
    float _1083 = _1073 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1085 = _1073 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1087 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1079);
    float _1089 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1083);
    float _1091 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1085);
    float _1093 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1087);
    float _1095 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1089);
    float _1097 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1091);
    float _1099 = _1093 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1101 = _675 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1103 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1105 = _1097 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1107 = _579 + _1099;
    float _1109 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1101);
    float _1111 = _577 + _1103;
    float _1113 = _575 + _1105;
    float _1115 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1117 = _1107 + _1115;
    float _1119 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1121 = _1111 + _1119;
    float _1123 = _1117 * _1117;
    float _1125 = fma(_1121, _1121, _1123);
    float _1127 = sqrt(_1125);
    bool _1129 = _1127 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1131 = _1097;
    float _1133 = _1105;
    float _1135 = _1113;
    if (!_1129)
    {
        _1131 = _1111;
    }
    float _1137 = _1131;
    float _1139 = _1137;
    if (!_1129)
    {
        _1133 = _1107;
    }
    float _1141 = _1133;
    bool _1143 = !_1129;
    float _1145 = _1141;
    if (!_1143)
    {
        float _1147 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1149 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1151 = _1127 + _1149;
        float _1153 = _1113 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1155 = rsqrt(_1125);
        float _1157 = _1151 * _1147;
        float _1159 = _1157 * 0.15915493667125701904296875;
        float _1161 = _1159 * 6.283185482025146484375;
        float _1163 = cos(_1161);
        float _1165 = _1159 * 6.283185482025146484375;
        float _1167 = sin(_1165);
        float _1169 = _1163 + (-1.0);
        float _1171 = fma(_1167, _1153, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1173 = _1169 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1175 = _1155 * _1171;
        float _1177 = fma(_1113, _1163, _1173);
        float _1179 = fma(_1121, _1175, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1181 = fma(_1117, _1175, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1139 = _1179;
        _1135 = _1177;
        _1145 = _1181;
    }
    float _1183 = _1139;
    float _1185 = _1135;
    float _1187 = _1145;
    float _1189 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1109);
    float _1191 = -_671;
    float _1193 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1183);
    float _1195 = -_669;
    float _1197 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1185);
    float _1199 = -_677;
    float _1201 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1187);
    float _1203 = _1189 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1205 = _1197;
    float _1207 = _1193;
    float _1209 = _1201;
    if (!_1047)
    {
        float _1211 = _685 * _685;
        float _1213 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1215 = -_579;
        float _1217 = _1215 + _1187;
        float _1219 = fma(_693, _693, _1211);
        float _1221 = fma(_699, _699, _1219);
        float _1223 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1225 = sqrt(_1221);
        float _1227 = 1.0 / _1049;
        float _1229 = precise::min(_1225, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1231 = _1229 * _1213;
        float _1233 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1235 = -_577;
        float _1237 = _1235 + _1183;
        float _1239 = _1231 * _1227;
        float _1241 = -_575;
        float _1243 = _1241 + _1185;
        float _1245 = _1233 * _1239;
        float _1247 = _1217 * _1239;
        float _1249 = fma(_1237, _1245, _681);
        float _1251 = fma(_1243, _1245, _675);
        float _1253 = fma(_1233, _1247, _689);
        _1205 = _1251;
        _1207 = _1249;
        _1209 = _1253;
    }
    float _1255 = _1205;
    float _1257 = _1207;
    float _1259 = _1209;
    float _1261 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1263 = _1203 + _729;
    float _1265 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1267 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1269 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1261);
    float _1271 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1273 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1265);
    float _1275 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1267);
    float _1277 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1269);
    float _1279 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1271);
    float _1281 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1273);
    float _1283 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1275);
    float _1285 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1287 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1279);
    float _1289 = _1281 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1291 = _1283 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1293 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1295 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1297 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1299 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1301 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1293);
    float _1303 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1295);
    float _1305 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1297);
    float _1307 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1299);
    float _1309 = _1287 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1311 = _1263 * _735;
    float _1313 = _1311 * 0.5;
    float _1315 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1305);
    float _1317 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1303);
    float _1319 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1307);
    float _1321 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1323 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1321);
    float _1325 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1315);
    float _1327 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1329 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1327);
    float _1331 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1333 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1331);
    float _1335 = 1.0 / _1323;
    float _1337 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1339 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1337);
    float _1341 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1301);
    float _1343 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1319);
    float _1345 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1347 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1345);
    float _1349 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1351 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1349);
    float _1353 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1341);
    float _1355 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1317);
    float _1357 = 1.0 / _1329;
    float _1359 = _1325 + _1343;
    float _1361 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1363 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1361);
    out.gl_Position.x = _1353;
    out.gl_Position.y = _1355;
    out.gl_Position.z = _1325;
    out.gl_Position.w = _1343;
    float _1365 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1367 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1365);
    float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1371 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1369);
    float _1373 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1375 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1373);
    float _1377 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1379 = _1335 * _1377;
    float _1381 = 1.0 / _1333;
    float _1383 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1385 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1383);
    float _1387 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1389 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1387);
    float _1391 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1393 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1391);
    float _1395 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1397 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1395);
    float _1399 = _1359 * 0.5;
    float _1401 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1403 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1401);
    float _1405 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1407 = -_1379;
    float _1409 = fma(_1357, _1405, _1407);
    float _1411 = 1.0 / _1371;
    float _1413 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1415 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1413);
    out.m_60.z = _1399;
    out.m_60.w = _1343;
    float _1417 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1419 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1417);
    bool _1421 = _1409 >= 0.0;
    bool _1423 = isnan(_1409);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan(0.0);
    bool _1429 = _1425 || _1427;
    float _1431 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1433 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1431);
    float _1435 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1437 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1435);
    float _1439 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1441 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1439);
    float _1443 = 1.0 / _1339;
    float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1447 = -_1379;
    float _1449 = fma(_1381, _1445, _1447);
    float _1451 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1453 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1451);
    float _1455 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1457 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1455);
    float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1461 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1459);
    float _1463 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1465 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1463);
    bool _1467 = _1449 >= 0.0;
    bool _1469 = isnan(_1449);
    bool _1471 = _1467 || _1469;
    bool _1473 = isnan(0.0);
    bool _1475 = _1471 || _1473;
    float _1477 = float(_1475);
    float _1479 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1481 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1479);
    float _1483 = 1.0 / _1347;
    bool _1485 = !_1429;
    float _1487 = _1485 ? 0.0 : 2.0;
    float _1489 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1491 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1489);
    float _1493 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1495 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1493);
    float _1497 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1499 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1497);
    float _1501 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1503 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1501);
    float _1505 = _1487 + _1477;
    float _1507 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1509 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1507);
    float _1511 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1513 = -_1379;
    float _1515 = fma(_1443, _1511, _1513);
    float _1517 = 1.0 / _1393;
    float _1519 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1521 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1519);
    float _1523 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1525 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1523);
    float _1527 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1529 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1527);
    bool _1531 = _1515 >= 0.0;
    bool _1533 = isnan(_1515);
    bool _1535 = _1531 || _1533;
    bool _1537 = isnan(0.0);
    bool _1539 = _1535 || _1537;
    float _1541 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1543 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1541);
    float _1545 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1547 = -_1379;
    float _1549 = fma(_1483, _1545, _1547);
    bool _1551 = !_1539;
    float _1553 = _1551 ? 0.0 : 2.0;
    float _1555 = 1.0 / _1397;
    bool _1557 = _1549 >= 0.0;
    bool _1559 = isnan(_1549);
    bool _1561 = _1557 || _1559;
    bool _1563 = isnan(0.0);
    bool _1565 = _1561 || _1563;
    float _1567 = float(_1565);
    float _1569 = _1505 + _1553;
    float _1571 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1573 = -_1379;
    float _1575 = fma(_1411, _1571, _1573);
    float _1577 = _1569 + _1567;
    float _1579 = 1.0 / _1437;
    bool _1581 = _1575 >= 0.0;
    bool _1583 = isnan(_1575);
    bool _1585 = _1581 || _1583;
    bool _1587 = isnan(0.0);
    bool _1589 = _1585 || _1587;
    float _1591 = float(_1589);
    float _1593 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1595 = -_1379;
    float _1597 = fma(_1555, _1593, _1595);
    float _1599 = 1.0 / _1351;
    float _1601 = 1.0 / _1495;
    float _1603 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1605 = -_1379;
    float _1607 = fma(_1599, _1603, _1605);
    float _1609 = 1.0 / _1543;
    bool _1611 = _1607 >= 0.0;
    bool _1613 = isnan(_1607);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan(0.0);
    bool _1619 = _1615 || _1617;
    float _1621 = float(_1619);
    float _1623 = _1577 + _1621;
    float _1625 = 1.0 / _1363;
    float _1627 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1629 = -_1379;
    float _1631 = fma(_1625, _1627, _1629);
    bool _1633 = _1631 >= 0.0;
    bool _1635 = isnan(_1631);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan(0.0);
    bool _1641 = _1637 || _1639;
    bool _1643 = !_1641;
    float _1645 = _1643 ? 0.0 : 2.0;
    float _1647 = _1623 + _1645;
    float _1649 = 1.0 / _1367;
    float _1651 = _1647 + _1591;
    float _1653 = 1.0 / _1385;
    float _1655 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1657 = -_1379;
    float _1659 = fma(_1649, _1655, _1657);
    bool _1661 = _1659 >= 0.0;
    bool _1663 = isnan(_1659);
    bool _1665 = _1661 || _1663;
    bool _1667 = isnan(0.0);
    bool _1669 = _1665 || _1667;
    float _1671 = 1.0 / _1375;
    float _1673 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1675 = -_1379;
    float _1677 = fma(_1653, _1673, _1675);
    float _1679 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1681 = -_1379;
    float _1683 = fma(_1671, _1679, _1681);
    bool _1685 = _1683 >= 0.0;
    bool _1687 = isnan(_1683);
    bool _1689 = _1685 || _1687;
    bool _1691 = isnan(0.0);
    bool _1693 = _1689 || _1691;
    bool _1695 = !_1669;
    float _1697 = _1695 ? 0.0 : 2.0;
    bool _1699 = !_1693;
    float _1701 = _1699 ? 0.0 : 2.0;
    float _1703 = _1651 + _1697;
    bool _1705 = _1677 >= 0.0;
    bool _1707 = isnan(_1677);
    bool _1709 = _1705 || _1707;
    bool _1711 = isnan(0.0);
    bool _1713 = _1709 || _1711;
    float _1715 = float(_1713);
    float _1717 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1719 = -_1379;
    float _1721 = fma(_1517, _1717, _1719);
    float _1723 = _1703 + _1701;
    bool _1725 = _1721 >= 0.0;
    bool _1727 = isnan(_1721);
    bool _1729 = _1725 || _1727;
    bool _1731 = isnan(0.0);
    bool _1733 = _1729 || _1731;
    float _1735 = float(_1733);
    float _1737 = _1723 + _1715;
    float _1739 = 1.0 / _1389;
    float _1741 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1743 = -_1379;
    float _1745 = fma(_1739, _1741, _1743);
    bool _1747 = _1745 >= 0.0;
    bool _1749 = isnan(_1745);
    bool _1751 = _1747 || _1749;
    bool _1753 = isnan(0.0);
    bool _1755 = _1751 || _1753;
    bool _1757 = !_1755;
    float _1759 = _1757 ? 0.0 : 2.0;
    float _1761 = _1737 + _1759;
    bool _1763 = _1597 >= 0.0;
    bool _1765 = isnan(_1597);
    bool _1767 = _1763 || _1765;
    bool _1769 = isnan(0.0);
    bool _1771 = _1767 || _1769;
    float _1773 = float(_1771);
    float _1775 = _1761 + _1735;
    float _1777 = 1.0 / _1419;
    float _1779 = _1775 + _1773;
    float _1781 = 1.0 / _1403;
    float _1783 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1785 = -_1379;
    float _1787 = fma(_1777, _1783, _1785);
    bool _1789 = _1787 >= 0.0;
    bool _1791 = isnan(_1787);
    bool _1793 = _1789 || _1791;
    bool _1795 = isnan(0.0);
    bool _1797 = _1793 || _1795;
    float _1799 = float(_1797);
    float _1801 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1803 = -_1379;
    float _1805 = fma(_1579, _1801, _1803);
    float _1807 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1809 = -_1379;
    float _1811 = fma(_1781, _1807, _1809);
    float _1813 = 1.0 / _1529;
    bool _1815 = _1811 >= 0.0;
    bool _1817 = isnan(_1811);
    bool _1819 = _1815 || _1817;
    bool _1821 = isnan(0.0);
    bool _1823 = _1819 || _1821;
    bool _1825 = !_1823;
    float _1827 = _1825 ? 0.0 : 2.0;
    float _1829 = _1779 + _1827;
    float _1831 = 1.0 / _1415;
    float _1833 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1835 = -_1379;
    float _1837 = fma(_1813, _1833, _1835);
    float _1839 = _1829 + _1799;
    float _1841 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1843 = -_1379;
    float _1845 = fma(_1831, _1841, _1843);
    bool _1847 = _1845 >= 0.0;
    bool _1849 = isnan(_1845);
    bool _1851 = _1847 || _1849;
    bool _1853 = isnan(0.0);
    bool _1855 = _1851 || _1853;
    float _1857 = 1.0 / _1433;
    float _1859 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1861 = -_1379;
    float _1863 = fma(_1857, _1859, _1861);
    bool _1865 = _1863 >= 0.0;
    bool _1867 = isnan(_1863);
    bool _1869 = _1865 || _1867;
    bool _1871 = isnan(0.0);
    bool _1873 = _1869 || _1871;
    bool _1875 = !_1855;
    float _1877 = _1875 ? 0.0 : 2.0;
    bool _1879 = !_1873;
    float _1881 = _1879 ? 0.0 : 2.0;
    float _1883 = _1839 + _1877;
    bool _1885 = _1805 >= 0.0;
    bool _1887 = isnan(_1805);
    bool _1889 = _1885 || _1887;
    bool _1891 = isnan(0.0);
    bool _1893 = _1889 || _1891;
    float _1895 = float(_1893);
    float _1897 = _1883 + _1881;
    float _1899 = _1897 + _1895;
    float _1901 = 1.0 / _1441;
    float _1903 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1905 = -_1379;
    float _1907 = fma(_1901, _1903, _1905);
    bool _1909 = _1907 >= 0.0;
    bool _1911 = isnan(_1907);
    bool _1913 = _1909 || _1911;
    bool _1915 = isnan(0.0);
    bool _1917 = _1913 || _1915;
    float _1919 = 1.0 / _1453;
    float _1921 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1923 = -_1379;
    float _1925 = fma(_1919, _1921, _1923);
    bool _1927 = !_1917;
    float _1929 = _1927 ? 0.0 : 2.0;
    bool _1931 = _1925 >= 0.0;
    bool _1933 = isnan(_1925);
    bool _1935 = _1931 || _1933;
    bool _1937 = isnan(0.0);
    bool _1939 = _1935 || _1937;
    float _1941 = float(_1939);
    float _1943 = _1899 + _1929;
    float _1945 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1947 = -_1379;
    float _1949 = fma(_1601, _1945, _1947);
    float _1951 = 1.0 / _1457;
    float _1953 = _1943 + _1941;
    bool _1955 = _1949 >= 0.0;
    bool _1957 = isnan(_1949);
    bool _1959 = _1955 || _1957;
    bool _1961 = isnan(0.0);
    bool _1963 = _1959 || _1961;
    float _1965 = float(_1963);
    float _1967 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1969 = -_1379;
    float _1971 = fma(_1951, _1967, _1969);
    bool _1973 = _1971 >= 0.0;
    bool _1975 = isnan(_1971);
    bool _1977 = _1973 || _1975;
    bool _1979 = isnan(0.0);
    bool _1981 = _1977 || _1979;
    float _1983 = float(_1981);
    float _1985 = _1953 + _1983;
    float _1987 = 1.0 / _1461;
    float _1989 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1991 = -_1379;
    float _1993 = fma(_1987, _1989, _1991);
    bool _1995 = _1993 >= 0.0;
    bool _1997 = isnan(_1993);
    bool _1999 = _1995 || _1997;
    bool _2001 = isnan(0.0);
    bool _2003 = _1999 || _2001;
    bool _2005 = !_2003;
    float _2007 = _2005 ? 0.0 : 2.0;
    float _2009 = _1985 + _2007;
    float _2011 = 1.0 / _1465;
    float _2013 = _2009 + _1965;
    float _2015 = 1.0 / _1503;
    float _2017 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2019 = -_1379;
    float _2021 = fma(_2011, _2017, _2019);
    bool _2023 = _2021 >= 0.0;
    bool _2025 = isnan(_2021);
    bool _2027 = _2023 || _2025;
    bool _2029 = isnan(0.0);
    bool _2031 = _2027 || _2029;
    float _2033 = 1.0 / _1481;
    float _2035 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2037 = -_1379;
    float _2039 = fma(_2015, _2035, _2037);
    float _2041 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2043 = -_1379;
    float _2045 = fma(_2033, _2041, _2043);
    bool _2047 = _2045 >= 0.0;
    bool _2049 = isnan(_2045);
    bool _2051 = _2047 || _2049;
    bool _2053 = isnan(0.0);
    bool _2055 = _2051 || _2053;
    float _2057 = 1.0 / _1491;
    float _2059 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2061 = -_1379;
    float _2063 = fma(_2057, _2059, _2061);
    bool _2065 = _2063 >= 0.0;
    bool _2067 = isnan(_2063);
    bool _2069 = _2065 || _2067;
    bool _2071 = isnan(0.0);
    bool _2073 = _2069 || _2071;
    float _2075 = 1.0 / _1499;
    bool _2077 = !_2073;
    float _2079 = _2077 ? 0.0 : 3.0;
    float _2081 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2083 = -_1379;
    float _2085 = fma(_2075, _2081, _2083);
    bool _2087 = _2085 >= 0.0;
    bool _2089 = isnan(_2085);
    bool _2091 = _2087 || _2089;
    bool _2093 = isnan(0.0);
    bool _2095 = _2091 || _2093;
    bool _2097 = !_2055;
    float _2099 = _2097 ? 0.0 : 3.0;
    bool _2101 = _2039 >= 0.0;
    bool _2103 = isnan(_2039);
    bool _2105 = _2101 || _2103;
    bool _2107 = isnan(0.0);
    bool _2109 = _2105 || _2107;
    bool _2111 = !_2095;
    float _2113 = _2111 ? 0.0 : 3.0;
    float _2115 = _2099 + _2079;
    bool _2117 = !_2031;
    float _2119 = _2117 ? 0.0 : 2.0;
    bool _2121 = !_2109;
    float _2123 = _2121 ? 0.0 : 3.0;
    float _2125 = _2115 + _2113;
    bool _2127 = _1837 >= 0.0;
    bool _2129 = isnan(_1837);
    bool _2131 = _2127 || _2129;
    bool _2133 = isnan(0.0);
    bool _2135 = _2131 || _2133;
    float _2137 = _2013 + _2119;
    float _2139 = 1.0 / _1521;
    float _2141 = _2125 + _2123;
    bool _2143 = !_2135;
    float _2145 = _2143 ? 0.0 : 3.0;
    float _2147 = _2137 * 0.02857142873108386993408203125;
    float _2149 = precise::clamp(_2147, 0.0, 1.0);
    float _2151 = 1.0 / _1509;
    float _2153 = 1.0 / _1525;
    float _2155 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2157 = -_1379;
    float _2159 = fma(_2139, _2155, _2157);
    float _2161 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2163 = -_1379;
    float _2165 = fma(_2151, _2161, _2163);
    bool _2167 = _2165 >= 0.0;
    bool _2169 = isnan(_2165);
    bool _2171 = _2167 || _2169;
    bool _2173 = isnan(0.0);
    bool _2175 = _2171 || _2173;
    bool _2177 = !_2175;
    float _2179 = _2177 ? 0.0 : 3.0;
    bool _2181 = _2159 >= 0.0;
    bool _2183 = isnan(_2159);
    bool _2185 = _2181 || _2183;
    bool _2187 = isnan(0.0);
    bool _2189 = _2185 || _2187;
    float _2191 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2193 = -_1379;
    float _2195 = fma(_2153, _2191, _2193);
    float _2197 = _2141 + _2179;
    bool _2199 = !_2189;
    float _2201 = _2199 ? 0.0 : 3.0;
    bool _2203 = _2195 >= 0.0;
    bool _2205 = isnan(_2195);
    bool _2207 = _2203 || _2205;
    bool _2209 = isnan(0.0);
    bool _2211 = _2207 || _2209;
    float _2213 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2215 = -_1379;
    float _2217 = fma(_1609, _2213, _2215);
    float _2219 = _2197 + _2201;
    bool _2221 = !_2211;
    float _2223 = _2221 ? 0.0 : 3.0;
    bool _2225 = _2217 >= 0.0;
    bool _2227 = isnan(_2217);
    bool _2229 = _2225 || _2227;
    bool _2231 = isnan(0.0);
    bool _2233 = _2229 || _2231;
    float _2235 = _2219 + _2223;
    bool _2237 = !_2233;
    float _2239 = _2237 ? 0.0 : 5.0;
    bool _2241 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2243 = isnan(0.5);
    bool _2245 = _2241 || _2243;
    bool _2247 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2249 = _2245 || _2247;
    float _2251 = _2235 + _2145;
    float _2253 = _2251 + _2239;
    float _2255 = _2253 * 0.14285714924335479736328125;
    float _2257 = precise::clamp(_2255, 0.0, 1.0);
    float _2259 = _2149 * _2257;
    float _2261 = _2149;
    float _2263 = _2257;
    if (_2249)
    {
        _2261 = 1.0;
    }
    float _2265 = _2261;
    float _2267 = _2265;
    if (_2249)
    {
        _2263 = 1.0;
    }
    float _2269 = _2263;
    float _2271 = _2269;
    if (!_2249)
    {
        float _2273 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2275 = _2273 * 0.15915493667125701904296875;
        float _2277 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2279 = _2275 * 6.283185482025146484375;
        float _2281 = cos(_2279);
        float _2283 = _2277 * 0.15915493667125701904296875;
        float _2285 = _2275 * 6.283185482025146484375;
        float _2287 = sin(_2285);
        float _2289 = 1.0 / _2281;
        float _2291 = _2283 * 6.283185482025146484375;
        float _2293 = cos(_2291);
        float _2295 = _2287 * _2289;
        float _2297 = _2283 * 6.283185482025146484375;
        float _2299 = sin(_2297);
        float _2301 = _2293 * _2295;
        float _2303 = 1.0 / _2301;
        float _2305 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2307 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2305;
        float _2309 = 1.0 / _2307;
        float _2311 = _2299 * _2303;
        float _2313 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2315 = fma(_1379, _2311, _2313);
        float _2317 = _2315 * _2309;
        float _2319 = precise::clamp(_2317, 0.0, 1.0);
        _2271 = _2319;
    }
    float _2321 = _2271;
    if (!_2249)
    {
        float _2323 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2325 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2327 = _2323 * 0.15915493667125701904296875;
        float _2329 = _2325 * 0.15915493667125701904296875;
        float _2331 = _2327 * 6.283185482025146484375;
        float _2333 = cos(_2331);
        float _2335 = _2327 * 6.283185482025146484375;
        float _2337 = sin(_2335);
        float _2339 = 1.0 / _2333;
        float _2341 = _2329 * 6.283185482025146484375;
        float _2343 = cos(_2341);
        float _2345 = _2337 * _2339;
        float _2347 = _2329 * 6.283185482025146484375;
        float _2349 = sin(_2347);
        float _2351 = _2343 * _2345;
        float _2353 = 1.0 / _2351;
        float _2355 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2357 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2355;
        float _2359 = 1.0 / _2357;
        float _2361 = _2349 * _2353;
        float _2363 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2365 = fma(_1379, _2361, _2363);
        float _2367 = _2365 * _2359;
        float _2369 = precise::clamp(_2367, 0.0, 1.0);
        float _2371 = -_2369;
        float _2373 = _2371 + 1.0;
        _2267 = _2373;
    }
    float _2375 = _2267;
    float _2377 = _2259 * _2321;
    bool _2379 = _2321 > 0.0;
    bool _2381 = isnan(_2321);
    bool _2383 = _2379 || _2381;
    bool _2385 = isnan(0.0);
    bool _2387 = _2383 || _2385;
    float _2389 = _2377 * _2375;
    bool _2391 = _2375 <= 0.0;
    bool _2393 = !_2387;
    bool _2395 = _2391 || _2393;
    float _2397 = _2389 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2399 = _2397 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_38.x = _2399;
    if (!_2395)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2401 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_38.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2401;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _74 = in.m_35.w;
    float _76 = trunc(_74);
    int _79 = int(_76);
    bool _83 = _79 >= 1;
    float _85 = 0.0;
    float _87 = as_type<float>(_79);
    if (!_83)
    {
        _85 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _89 = _85;
    float _91 = _89;
    if (!_83)
    {
        out.m_38.x = 0.0;
    }
    int _93 = 0;
    if (!_83)
    {
        float _95 = _89 * 5.0;
        _93 = as_type<int>(_95);
    }
    int _97 = _93;
    int _99 = _97;
    if (!_83)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2459 = as_type<float>(_97);
        out.gl_Position.z = _2459;
    }
    if (!_83)
    {
        return out;
    }
    float _101 = in.m_40.w;
    bool _103 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_101;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_111)
    {
        float _117 = float(_79);
        _91 = _117;
    }
    float _119 = _91;
    bool _121 = _115 >= _119;
    bool _123 = !_111;
    bool _125 = _121 || _123;
    if (_125)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _87;
    if (_125)
    {
        out.m_38.x = 0.0;
    }
    if (_125)
    {
        float _129 = _127 * 5.0;
        _99 = as_type<int>(_129);
    }
    int _131 = _99;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2527 = as_type<float>(_131);
        out.gl_Position.z = _2527;
    }
    if (_125)
    {
        return out;
    }
    float _133 = in.m_42.w;
    float _135 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _137 = in.m_44.y;
    int _139 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _141 = _139 != 0;
    float _143 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _147 = _145 != 0;
    float _149 = in.m_42.y;
    float _151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _155 = _153 != 0;
    float _157 = in.m_42.z;
    int _159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _161 = _159 != 0;
    float _163 = in.m_42.x;
    float _165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _167 = in.m_44.x;
    float _169 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _171 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _173 = _133 > 0.5;
    float _175 = _151 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _177 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _179 = -_137;
    float _181 = _179 + 1.0;
    float _183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _185 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _187 = _149 > 0.5;
    float _189 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[88].w, _169);
    float _191 = 0.0;
    float _193 = _137;
    bool _195 = _173;
    float _197 = _143;
    if (!_147)
    {
        _191 = _149;
    }
    float _199 = _191;
    float _201 = _165 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _203 = _157 > 0.5;
    int _205 = _187 ? as_type<int>(_181) : as_type<int>(_137);
    int _207 = _203 ? as_type<int>(_181) : as_type<int>(_137);
    float _209 = _155 ? as_type<float>(_205) : _137;
    float _211 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _213 = _161 ? as_type<float>(_207) : _137;
    float _215 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _217 = _149 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _219 = _199;
    float _221 = _167;
    if (_141)
    {
        float _223 = _173 ? _181 : _137;
        _193 = _223;
    }
    float _225 = _193;
    float _227 = fma(_217, -2.0, _215);
    float _229 = _135 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _235 = _233 != 0;
    float _237 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _227);
    int _239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _241 = _239 != 0;
    float _243 = _163 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _247 = _245 != 0;
    float _249 = fma(_229, _209, -0.5);
    float _251 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[78].w, _231);
    float _253 = _231;
    float _255 = _229;
    int _257 = as_type<int>(_237);
    float _259 = _243;
    float _261 = _249;
    if (!_147)
    {
        _253 = _199;
    }
    float _263 = _253;
    float _265 = fma(_175, _225, -0.5);
    float _267 = _263;
    if (_147)
    {
        _255 = _163;
    }
    float _269 = _255;
    float _271 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _251);
    float _273 = _269;
    if (_147)
    {
        _219 = _149;
    }
    float _275 = _219;
    float _277 = fma(_213, _201, -0.5);
    float _279 = _275;
    if (!_147)
    {
        _273 = _157;
    }
    float _281 = _273;
    float _283 = -_237;
    float _285 = fma(_271, _249, _283);
    int _287 = as_type<int>(_281);
    int _289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[87].x);
    if (_241)
    {
        float _291 = -_167;
        float _293 = _291 + 1.0;
        _257 = as_type<int>(_293);
    }
    int _295 = _257;
    if (_235)
    {
        bool _297 = _163 > 0.5;
        _195 = _297;
    }
    bool _299 = _195;
    float _301 = _281 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (_235)
    {
        float _303 = -_167;
        float _305 = _303 + 1.0;
        _287 = as_type<int>(_305);
    }
    int _307 = _287;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _311 = as_type<float>(_307);
    if (_247)
    {
        float _313 = -_167;
        float _315 = _313 + 1.0;
        _289 = as_type<int>(_315);
    }
    int _317 = _289;
    float _319 = -_211;
    float _321 = fma(_243, 2.0, _319);
    if (_147)
    {
        _267 = _163;
    }
    float _323 = _267;
    float _325 = -_309;
    float _327 = fma(_301, 2.0, _325);
    if (!_235)
    {
        _259 = _167;
    }
    float _329 = _259;
    float _331 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[83].z, _171);
    float _333 = 0.0;
    float _335 = _329;
    float _337 = _331;
    if (!_241)
    {
        _333 = _167;
    }
    float _339 = _333;
    float _341 = _323 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _343 = _339;
    if (_235)
    {
        float _345 = _299 ? as_type<float>(_307) : _167;
        _335 = _345;
    }
    float _347 = _335;
    if (_241)
    {
        float _349 = _203 ? as_type<float>(_295) : _167;
        _343 = _349;
    }
    float _351 = _343;
    float _353 = -_177;
    float _355 = fma(_341, 2.0, _353);
    if (_247)
    {
        float _357 = _187 ? as_type<float>(_317) : _167;
        _221 = _357;
    }
    float _359 = _221;
    float _361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _363 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _367 = _363 || _365;
    bool _369 = isnan(1.0);
    bool _371 = _367 || _369;
    if (!_147)
    {
        _311 = _157;
    }
    float _373 = _311;
    float _375 = _373;
    if (_147)
    {
        _375 = _275;
    }
    float _377 = _375;
    float _379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _381 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[83].w, _185);
    if (!_147)
    {
        _261 = _157;
    }
    float _383 = _261;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _387 = _383;
    if (_147)
    {
        _387 = _275;
    }
    float _389 = _387;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _393 = 0.0;
    if (!_371)
    {
        float _395 = _143 * _143;
        float _397 = _395 * 0.5;
        _393 = _397;
    }
    float _399 = _393;
    float _401 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[78].z, _385);
    float _403 = _399;
    if (!_147)
    {
        _279 = _163;
    }
    float _405 = _279;
    float _407 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[88].z, _391);
    float _409 = _361 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_371)
    {
        float _411 = _399 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _403 = _411;
    }
    float _413 = _403;
    float _415 = _379 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _417 = !_371;
    float _419 = _413;
    if (!_417)
    {
        float _421 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _423 = log2(_421);
        float _425 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _427 = _425 + 1.0;
        float _429 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _431 = _143 * _423;
        float _433 = 1.0 / _427;
        float _435 = _429 * 0.693147182464599609375;
        float _437 = exp2(_431);
        float _439 = 1.0 / _435;
        float _441 = _437 + (-1.0);
        float _443 = -_441;
        float _445 = fma(_443, _439, _143);
        float _447 = _445 * _433;
        float _449 = _447 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _419 = _449;
    }
    float _451 = _419;
    bool _453 = !_371;
    if (!_453)
    {
        float _455 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _457 = log2(_455);
        float _459 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _461 = _459 + 1.0;
        float _463 = 1.0 / _461;
        float _465 = _143 * _457;
        float _467 = exp2(_465);
        float _469 = -_467;
        float _471 = _469 + 1.0;
        float _473 = _471 * _463;
        _197 = _473;
    }
    float _475 = _197;
    float _477 = fma(_409, _347, -0.5);
    float _479 = in.m_46.w;
    float _481 = fma(_415, _351, -0.5);
    float _483 = in.m_40.x;
    float _485 = in.m_40.y;
    float _487 = in.m_40.z;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _491 = in.m_35.x;
    float _493 = in.m_35.y;
    float _495 = in.m_35.z;
    float _497 = _389 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _505 = fma(_497, -2.0, _489);
    float _507 = _451 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _509 = _499 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _511 = _501 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _513 = _183 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _515 = _503 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _517 = _451 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _519 = _451 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _521 = fma(_513, _359, -0.5);
    float _523 = _405 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _525 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[81].y, _505);
    float _527 = -_115;
    float _529 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[86].x, _327);
    float _531 = -_115;
    float _533 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[81].x, _355);
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _537 = fma(_475, _485, _507);
    float _539 = fma(_475, _483, _517);
    float _541 = -_115;
    float _543 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[76].x, _321);
    float _545 = fma(_475, _487, _519);
    float _547 = fma(_537, _479, _493);
    float _549 = fma(_539, _479, _491);
    float _551 = fma(_545, _479, _495);
    float _553 = _547 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _555 = _547 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _557 = _547 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _561 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[5].x, _553);
    float _563 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[4].x, _555);
    float _565 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[6].x, _557);
    out.m_48.x = _509;
    out.m_48.y = _511;
    out.m_48.z = _515;
    out.m_48.w = _535;
    float _567 = fma(_551, (*spvDescriptorSet0.vp_c10)._m0[5].z, _561);
    float _569 = fma(_551, (*spvDescriptorSet0.vp_c10)._m0[4].z, _563);
    float _571 = fma(_551, (*spvDescriptorSet0.vp_c10)._m0[6].z, _565);
    float _573 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _401);
    float _575 = _567 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _577 = _569 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _579 = _571 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _581 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].z, _331);
    float _583 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[87].w, _189);
    float _585 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _587 = _577 + _585;
    float _589 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _591 = _579 + _589;
    float _593 = fma(_581, _481, _533);
    float _595 = fma(_523, -2.0, _559);
    float _597 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _599 = _575 + _597;
    float _601 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[87].z, _407);
    float _603 = fma(_573, _477, _543);
    float _605 = _599 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _607 = fma(_601, _521, _529);
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _611 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[28].x, _605);
    float _613 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].w, _381);
    float _615 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[86].y, _595);
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _619 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[28].z, _611);
    float _621 = -_525;
    float _623 = fma(_613, _265, _621);
    float _625 = _599 * _599;
    float _627 = -_615;
    float _629 = fma(_583, _277, _627);
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _633 = _619 >= 0.0;
    float _635 = fma(_587, _587, _625);
    float _637 = _285 + 0.5;
    float _639 = _607 + 0.5;
    float _641 = _623 + 0.5;
    float _643 = fma(_591, _591, _635);
    float _645 = rsqrt(_643);
    float _647 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _649 = _617 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _651 = as_type<int>(_623);
    float _653 = 1.0;
    if (_633)
    {
        _337 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _655 = _337;
    float _657 = _631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _659 = _603 + 0.5;
    float _661 = _593 + 0.5;
    float _663 = _629 + 0.5;
    if (_633)
    {
        float _665 = _655 * 5.0;
        _651 = as_type<int>(_665);
    }
    int _667 = _651;
    out.m_50.x = _647;
    out.m_50.y = _649;
    out.m_50.z = _657;
    out.m_52.x = 1.0;
    out.m_52.y = 1.0;
    out.m_52.z = 1.0;
    float _669 = _599 * _645;
    float _671 = _587 * _645;
    out.m_54.x = _659;
    out.m_54.y = _637;
    out.m_54.z = _661;
    out.m_54.w = _641;
    out.m_56.x = _639;
    out.m_56.y = _663;
    if (_633)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3517 = as_type<float>(_667);
        out.gl_Position.z = _3517;
    }
    if (_633)
    {
        out.m_38.x = 0.0;
    }
    if (_633)
    {
        return out;
    }
    float _673 = -_669;
    float _675 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[18].w, _575);
    float _677 = _591 * _645;
    float _679 = -_671;
    float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[18].w, _577);
    float _683 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _685 = _675 + _683;
    float _687 = -_677;
    float _689 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[18].w, _579);
    float _691 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _693 = _681 + _691;
    float _695 = _685 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _697 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _699 = _689 + _697;
    float _701 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[28].x, _695);
    float _703 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[28].z, _701);
    bool _705 = _703 >= 0.0;
    if (_705)
    {
        _653 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _707 = _653;
    int _709 = as_type<int>(_707);
    if (_705)
    {
        out.m_38.x = 0.0;
    }
    if (_705)
    {
        float _711 = _707 * 5.0;
        _709 = as_type<int>(_711);
    }
    int _713 = _709;
    if (_705)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3611 = as_type<float>(_713);
        out.gl_Position.z = _3611;
    }
    if (_705)
    {
        return out;
    }
    float _715 = _675 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _717 = _675 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    float _719 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[11].x, _715);
    float _721 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[9].x, _717);
    float _723 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[11].z, _719);
    float _725 = _675 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    float _727 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[9].z, _721);
    float _729 = _723 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _731 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[8].x, _725);
    float _733 = _727 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    float _735 = 1.0 / _729;
    float _737 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[8].z, _731);
    float _739 = _729 * 0.5;
    float _741 = _737 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _743 = fma(_733, -0.5, _739);
    float _745 = _741 + _729;
    float _747 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4899999797344207763671875, _743);
    float _749 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _743);
    float _751 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _743);
    float _753 = _745 * 0.5;
    float _755 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _743);
    float _757 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _743);
    float _759 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.2800000011920928955078125, _743);
    float _761 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _753);
    float _763 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _753);
    float _765 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _753);
    float _767 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _753);
    float _769 = _761 * _735;
    float _771 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _743);
    float _773 = _747 * _735;
    float _775 = _749 * _735;
    float _777 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _753);
    float _779 = _763 * _735;
    float _781 = _751 * _735;
    float _783 = _765 * _735;
    float _785 = _767 * _735;
    float _787 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _743);
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _791 = _743 + _789;
    float _793 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _753);
    float _795 = _755 * _735;
    float _797 = _757 * _735;
    float _799 = _759 * _735;
    float _801 = _771 * _735;
    float2 _3794 = float2(_769, _773);
    float _803 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3794, float2(0.0), isnan(_3794)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3794, float2(0.0), isnan(_3794)), level(0.0)).x;
    float2 _3804 = float2(_779, _781);
    float _805 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3804, float2(0.0), isnan(_3804)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3804, float2(0.0), isnan(_3804)), level(0.0)).x;
    float2 _3812 = float2(_779, _775);
    float _807 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3812, float2(0.0), isnan(_3812)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3812, float2(0.0), isnan(_3812)), level(0.0)).x;
    float2 _3820 = float2(_783, _795);
    float _809 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3820, float2(0.0), isnan(_3820)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3820, float2(0.0), isnan(_3820)), level(0.0)).x;
    float2 _3828 = float2(_785, _799);
    float _811 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3828, float2(0.0), isnan(_3828)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3828, float2(0.0), isnan(_3828)), level(0.0)).x;
    float _813 = _743 * _735;
    float _815 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _743);
    float _817 = _743 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _819 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _743);
    float _821 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _743);
    float _823 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _743);
    float _825 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _743);
    float _827 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _743);
    float _829 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _743);
    float _831 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _743);
    float _833 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _743);
    float _835 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _743);
    float _837 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _743);
    float _839 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _743);
    float _841 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _743);
    float _843 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _753);
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _847 = _753 + _845;
    float _849 = _777 * _735;
    float _851 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _743);
    float _853 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _753);
    float _855 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _753);
    float _857 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _753);
    float _859 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _753);
    float _861 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _753);
    float _863 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _753);
    float _865 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _753);
    float _867 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _753);
    float _869 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _753);
    float _871 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _753);
    float _873 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _753);
    float _875 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _753);
    float _877 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _753);
    float _879 = _793 * _735;
    float _881 = _787 * _735;
    float _883 = _791 * _735;
    float _885 = _753 * _735;
    float _887 = _843 * _735;
    float2 _3991 = float2(_849, _797);
    float _889 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3991, float2(0.0), isnan(_3991)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3991, float2(0.0), isnan(_3991)), level(0.0)).x;
    float2 _3999 = float2(_849, _801);
    float _891 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3999, float2(0.0), isnan(_3999)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3999, float2(0.0), isnan(_3999)), level(0.0)).x;
    float _893 = _847 * _735;
    float _895 = _817 * _735;
    float _897 = _821 * _735;
    float _899 = _823 * _735;
    float _901 = _875 * _735;
    float2 _4022 = float2(_879, _881);
    float _903 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4022, float2(0.0), isnan(_4022)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4022, float2(0.0), isnan(_4022)), level(0.0)).x;
    float2 _4030 = float2(_885, _881);
    float _905 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4030, float2(0.0), isnan(_4030)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4030, float2(0.0), isnan(_4030)), level(0.0)).x;
    float2 _4038 = float2(_885, _883);
    float _907 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4038, float2(0.0), isnan(_4038)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4038, float2(0.0), isnan(_4038)), level(0.0)).x;
    float _909 = _877 * _735;
    float _911 = _753 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _913 = _825 * _735;
    float2 _4056 = float2(_885, _895);
    float _915 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4056, float2(0.0), isnan(_4056)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4056, float2(0.0), isnan(_4056)), level(0.0)).x;
    float2 _4064 = float2(_887, _897);
    float _917 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4064, float2(0.0), isnan(_4064)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4064, float2(0.0), isnan(_4064)), level(0.0)).x;
    float2 _4072 = float2(_885, _897);
    float _919 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4072, float2(0.0), isnan(_4072)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4072, float2(0.0), isnan(_4072)), level(0.0)).x;
    float2 _4080 = float2(_885, _899);
    float _921 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4080, float2(0.0), isnan(_4080)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4080, float2(0.0), isnan(_4080)), level(0.0)).x;
    float2 _4088 = float2(_885, _913);
    float _923 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4088, float2(0.0), isnan(_4088)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4088, float2(0.0), isnan(_4088)), level(0.0)).x;
    float2 _4096 = float2(_885, _813);
    float _925 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4096, float2(0.0), isnan(_4096)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4096, float2(0.0), isnan(_4096)), level(0.0)).x;
    float2 _4104 = float2(_893, _813);
    float _927 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4104, float2(0.0), isnan(_4104)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4104, float2(0.0), isnan(_4104)), level(0.0)).x;
    float _929 = _815 * _735;
    float _931 = _853 * _735;
    float _933 = _819 * _735;
    float _935 = _911 * _735;
    float _937 = _857 * _735;
    float _939 = _855 * _735;
    float _941 = _859 * _735;
    float2 _4133 = float2(_931, _929);
    float _943 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4133, float2(0.0), isnan(_4133)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4133, float2(0.0), isnan(_4133)), level(0.0)).x;
    float2 _4141 = float2(_931, _933);
    float _945 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4141, float2(0.0), isnan(_4141)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4141, float2(0.0), isnan(_4141)), level(0.0)).x;
    float2 _4149 = float2(_931, _813);
    float _947 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4149, float2(0.0), isnan(_4149)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4149, float2(0.0), isnan(_4149)), level(0.0)).x;
    float2 _4157 = float2(_935, _813);
    float _949 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4157, float2(0.0), isnan(_4157)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4157, float2(0.0), isnan(_4157)), level(0.0)).x;
    float2 _4165 = float2(_939, _813);
    float _951 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4165, float2(0.0), isnan(_4165)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4165, float2(0.0), isnan(_4165)), level(0.0)).x;
    float2 _4173 = float2(_937, _813);
    float _953 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4173, float2(0.0), isnan(_4173)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4173, float2(0.0), isnan(_4173)), level(0.0)).x;
    float2 _4181 = float2(_941, _813);
    float _955 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4181, float2(0.0), isnan(_4181)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4181, float2(0.0), isnan(_4181)), level(0.0)).x;
    float _957 = _827 * _735;
    float _959 = _829 * _735;
    float _961 = _861 * _735;
    float _963 = _865 * _735;
    float _965 = _863 * _735;
    float _967 = _867 * _735;
    float _969 = _831 * _735;
    float _971 = _869 * _735;
    float _973 = _833 * _735;
    float _975 = _871 * _735;
    float _977 = _835 * _735;
    float _979 = _873 * _735;
    float2 _4225 = float2(_961, _957);
    float _981 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4225, float2(0.0), isnan(_4225)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4225, float2(0.0), isnan(_4225)), level(0.0)).x;
    float2 _4233 = float2(_965, _959);
    float _983 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4233, float2(0.0), isnan(_4233)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4233, float2(0.0), isnan(_4233)), level(0.0)).x;
    float2 _4241 = float2(_963, _969);
    float _985 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4241, float2(0.0), isnan(_4241)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4241, float2(0.0), isnan(_4241)), level(0.0)).x;
    float2 _4249 = float2(_967, _973);
    float _987 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4249, float2(0.0), isnan(_4249)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4249, float2(0.0), isnan(_4249)), level(0.0)).x;
    float2 _4257 = float2(_971, _977);
    float _989 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4257, float2(0.0), isnan(_4257)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4257, float2(0.0), isnan(_4257)), level(0.0)).x;
    float _991 = _837 * _735;
    float _993 = _839 * _735;
    float _995 = _841 * _735;
    float _997 = _851 * _735;
    float2 _4277 = float2(_975, _991);
    float _999 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4277, float2(0.0), isnan(_4277)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4277, float2(0.0), isnan(_4277)), level(0.0)).x;
    float2 _4285 = float2(_979, _993);
    float _1001 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4285, float2(0.0), isnan(_4285)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4285, float2(0.0), isnan(_4285)), level(0.0)).x;
    float2 _4293 = float2(_901, _995);
    float _1003 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4293, float2(0.0), isnan(_4293)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4293, float2(0.0), isnan(_4293)), level(0.0)).x;
    float2 _4301 = float2(_909, _997);
    float _1005 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4301, float2(0.0), isnan(_4301)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4301, float2(0.0), isnan(_4301)), level(0.0)).x;
    float _1007 = -_669;
    float _1009 = fma(_1007, (*spvDescriptorSet0.vp_c9)._m0[18].w, _599);
    float _1011 = -_671;
    float _1013 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[18].w, _587);
    float _1015 = -_677;
    float _1017 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[18].w, _591);
    float _1019 = _1009 * _1009;
    float _1021 = fma(_1013, _1013, _1019);
    float _1023 = in.m_46.x;
    float _1025 = in.m_46.y;
    float _1027 = in.m_46.z;
    float _1029 = fma(_1017, _1017, _1021);
    float _1031 = in.m_58.x;
    float _1033 = in.m_58.y;
    float _1035 = in.m_58.z;
    float _1037 = sqrt(_1029);
    bool _1039 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1041 = isnan(0.5);
    bool _1043 = _1039 || _1041;
    bool _1045 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1047 = _1043 || _1045;
    float _1049 = _645 * _1037;
    float _1051 = _1025 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1053 = _1023 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1055 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1057 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1059 = _1053 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1061 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1033);
    float _1063 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1031);
    float _1065 = _1049 * _1057;
    float _1067 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1069 = _1049 * _1059;
    float _1071 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1035);
    float _1073 = _1061 * _1065;
    float _1075 = _1049 * _1067;
    float _1077 = _1063 * _1069;
    float _1079 = _1073 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1081 = _1071 * _1075;
    float _1083 = _1073 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1085 = _1073 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1087 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1079);
    float _1089 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1083);
    float _1091 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1085);
    float _1093 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1087);
    float _1095 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1089);
    float _1097 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1091);
    float _1099 = _1093 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1101 = _675 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1103 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1105 = _1097 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1107 = _579 + _1099;
    float _1109 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1101);
    float _1111 = _577 + _1103;
    float _1113 = _575 + _1105;
    float _1115 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1117 = _1107 + _1115;
    float _1119 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1121 = _1111 + _1119;
    float _1123 = _1117 * _1117;
    float _1125 = fma(_1121, _1121, _1123);
    float _1127 = sqrt(_1125);
    bool _1129 = _1127 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1131 = _1097;
    float _1133 = _1105;
    float _1135 = _1113;
    if (!_1129)
    {
        _1131 = _1111;
    }
    float _1137 = _1131;
    float _1139 = _1137;
    if (!_1129)
    {
        _1133 = _1107;
    }
    float _1141 = _1133;
    bool _1143 = !_1129;
    float _1145 = _1141;
    if (!_1143)
    {
        float _1147 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1149 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1151 = _1127 + _1149;
        float _1153 = _1113 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1155 = rsqrt(_1125);
        float _1157 = _1151 * _1147;
        float _1159 = _1157 * 0.15915493667125701904296875;
        float _1161 = _1159 * 6.283185482025146484375;
        float _1163 = cos(_1161);
        float _1165 = _1159 * 6.283185482025146484375;
        float _1167 = sin(_1165);
        float _1169 = _1163 + (-1.0);
        float _1171 = fma(_1167, _1153, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1173 = _1169 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1175 = _1155 * _1171;
        float _1177 = fma(_1113, _1163, _1173);
        float _1179 = fma(_1121, _1175, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1181 = fma(_1117, _1175, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1139 = _1179;
        _1135 = _1177;
        _1145 = _1181;
    }
    float _1183 = _1139;
    float _1185 = _1135;
    float _1187 = _1145;
    float _1189 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1109);
    float _1191 = -_671;
    float _1193 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1183);
    float _1195 = -_669;
    float _1197 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1185);
    float _1199 = -_677;
    float _1201 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1187);
    float _1203 = _1189 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1205 = _1197;
    float _1207 = _1193;
    float _1209 = _1201;
    if (!_1047)
    {
        float _1211 = _685 * _685;
        float _1213 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1215 = -_579;
        float _1217 = _1215 + _1187;
        float _1219 = fma(_693, _693, _1211);
        float _1221 = fma(_699, _699, _1219);
        float _1223 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1225 = sqrt(_1221);
        float _1227 = 1.0 / _1049;
        float _1229 = precise::min(_1225, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1231 = _1229 * _1213;
        float _1233 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1235 = -_577;
        float _1237 = _1235 + _1183;
        float _1239 = _1231 * _1227;
        float _1241 = -_575;
        float _1243 = _1241 + _1185;
        float _1245 = _1233 * _1239;
        float _1247 = _1217 * _1239;
        float _1249 = fma(_1237, _1245, _681);
        float _1251 = fma(_1243, _1245, _675);
        float _1253 = fma(_1233, _1247, _689);
        _1205 = _1251;
        _1207 = _1249;
        _1209 = _1253;
    }
    float _1255 = _1205;
    float _1257 = _1207;
    float _1259 = _1209;
    float _1261 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1263 = _1203 + _729;
    float _1265 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1267 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1269 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1261);
    float _1271 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1273 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1265);
    float _1275 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1267);
    float _1277 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1269);
    float _1279 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1271);
    float _1281 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1273);
    float _1283 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1275);
    float _1285 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1287 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1279);
    float _1289 = _1281 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1291 = _1283 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1293 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1295 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1297 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1299 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1301 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1293);
    float _1303 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1295);
    float _1305 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1297);
    float _1307 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1299);
    float _1309 = _1287 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1311 = _1263 * _735;
    float _1313 = _1311 * 0.5;
    float _1315 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1305);
    float _1317 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1303);
    float _1319 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1307);
    float _1321 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1323 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1321);
    float _1325 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1315);
    float _1327 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1329 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1327);
    float _1331 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1333 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1331);
    float _1335 = 1.0 / _1323;
    float _1337 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1339 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1337);
    float _1341 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1301);
    float _1343 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1319);
    float _1345 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1347 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1345);
    float _1349 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1351 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1349);
    float _1353 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1341);
    float _1355 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1317);
    float _1357 = 1.0 / _1329;
    float _1359 = _1325 + _1343;
    float _1361 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1363 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1361);
    out.gl_Position.x = _1353;
    out.gl_Position.y = _1355;
    out.gl_Position.z = _1325;
    out.gl_Position.w = _1343;
    float _1365 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1367 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1365);
    float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1371 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1369);
    float _1373 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1375 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1373);
    float _1377 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1379 = _1335 * _1377;
    float _1381 = 1.0 / _1333;
    float _1383 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1385 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1383);
    float _1387 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1389 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1387);
    float _1391 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1393 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1391);
    float _1395 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1397 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1395);
    float _1399 = _1359 * 0.5;
    float _1401 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1403 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1401);
    float _1405 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1407 = -_1379;
    float _1409 = fma(_1357, _1405, _1407);
    float _1411 = 1.0 / _1371;
    float _1413 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1415 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1413);
    out.m_60.z = _1399;
    out.m_60.w = _1343;
    float _1417 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1419 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1417);
    bool _1421 = _1409 >= 0.0;
    bool _1423 = isnan(_1409);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan(0.0);
    bool _1429 = _1425 || _1427;
    float _1431 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1433 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1431);
    float _1435 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1437 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1435);
    float _1439 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1441 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1439);
    float _1443 = 1.0 / _1339;
    float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1447 = -_1379;
    float _1449 = fma(_1381, _1445, _1447);
    float _1451 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1453 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1451);
    float _1455 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1457 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1455);
    float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1461 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1459);
    float _1463 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1465 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1463);
    bool _1467 = _1449 >= 0.0;
    bool _1469 = isnan(_1449);
    bool _1471 = _1467 || _1469;
    bool _1473 = isnan(0.0);
    bool _1475 = _1471 || _1473;
    float _1477 = float(_1475);
    float _1479 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1481 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1479);
    float _1483 = 1.0 / _1347;
    bool _1485 = !_1429;
    float _1487 = _1485 ? 0.0 : 2.0;
    float _1489 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1491 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1489);
    float _1493 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1495 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1493);
    float _1497 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1499 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1497);
    float _1501 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1503 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1501);
    float _1505 = _1487 + _1477;
    float _1507 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1509 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1507);
    float _1511 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1513 = -_1379;
    float _1515 = fma(_1443, _1511, _1513);
    float _1517 = 1.0 / _1393;
    float _1519 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1521 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1519);
    float _1523 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1525 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1523);
    float _1527 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1529 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1527);
    bool _1531 = _1515 >= 0.0;
    bool _1533 = isnan(_1515);
    bool _1535 = _1531 || _1533;
    bool _1537 = isnan(0.0);
    bool _1539 = _1535 || _1537;
    float _1541 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1543 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1541);
    float _1545 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1547 = -_1379;
    float _1549 = fma(_1483, _1545, _1547);
    bool _1551 = !_1539;
    float _1553 = _1551 ? 0.0 : 2.0;
    float _1555 = 1.0 / _1397;
    bool _1557 = _1549 >= 0.0;
    bool _1559 = isnan(_1549);
    bool _1561 = _1557 || _1559;
    bool _1563 = isnan(0.0);
    bool _1565 = _1561 || _1563;
    float _1567 = float(_1565);
    float _1569 = _1505 + _1553;
    float _1571 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1573 = -_1379;
    float _1575 = fma(_1411, _1571, _1573);
    float _1577 = _1569 + _1567;
    float _1579 = 1.0 / _1437;
    bool _1581 = _1575 >= 0.0;
    bool _1583 = isnan(_1575);
    bool _1585 = _1581 || _1583;
    bool _1587 = isnan(0.0);
    bool _1589 = _1585 || _1587;
    float _1591 = float(_1589);
    float _1593 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1595 = -_1379;
    float _1597 = fma(_1555, _1593, _1595);
    float _1599 = 1.0 / _1351;
    float _1601 = 1.0 / _1495;
    float _1603 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1605 = -_1379;
    float _1607 = fma(_1599, _1603, _1605);
    float _1609 = 1.0 / _1543;
    bool _1611 = _1607 >= 0.0;
    bool _1613 = isnan(_1607);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan(0.0);
    bool _1619 = _1615 || _1617;
    float _1621 = float(_1619);
    float _1623 = _1577 + _1621;
    float _1625 = 1.0 / _1363;
    float _1627 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1629 = -_1379;
    float _1631 = fma(_1625, _1627, _1629);
    bool _1633 = _1631 >= 0.0;
    bool _1635 = isnan(_1631);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan(0.0);
    bool _1641 = _1637 || _1639;
    bool _1643 = !_1641;
    float _1645 = _1643 ? 0.0 : 2.0;
    float _1647 = _1623 + _1645;
    float _1649 = 1.0 / _1367;
    float _1651 = _1647 + _1591;
    float _1653 = 1.0 / _1385;
    float _1655 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1657 = -_1379;
    float _1659 = fma(_1649, _1655, _1657);
    bool _1661 = _1659 >= 0.0;
    bool _1663 = isnan(_1659);
    bool _1665 = _1661 || _1663;
    bool _1667 = isnan(0.0);
    bool _1669 = _1665 || _1667;
    float _1671 = 1.0 / _1375;
    float _1673 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1675 = -_1379;
    float _1677 = fma(_1653, _1673, _1675);
    float _1679 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1681 = -_1379;
    float _1683 = fma(_1671, _1679, _1681);
    bool _1685 = _1683 >= 0.0;
    bool _1687 = isnan(_1683);
    bool _1689 = _1685 || _1687;
    bool _1691 = isnan(0.0);
    bool _1693 = _1689 || _1691;
    bool _1695 = !_1669;
    float _1697 = _1695 ? 0.0 : 2.0;
    bool _1699 = !_1693;
    float _1701 = _1699 ? 0.0 : 2.0;
    float _1703 = _1651 + _1697;
    bool _1705 = _1677 >= 0.0;
    bool _1707 = isnan(_1677);
    bool _1709 = _1705 || _1707;
    bool _1711 = isnan(0.0);
    bool _1713 = _1709 || _1711;
    float _1715 = float(_1713);
    float _1717 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1719 = -_1379;
    float _1721 = fma(_1517, _1717, _1719);
    float _1723 = _1703 + _1701;
    bool _1725 = _1721 >= 0.0;
    bool _1727 = isnan(_1721);
    bool _1729 = _1725 || _1727;
    bool _1731 = isnan(0.0);
    bool _1733 = _1729 || _1731;
    float _1735 = float(_1733);
    float _1737 = _1723 + _1715;
    float _1739 = 1.0 / _1389;
    float _1741 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1743 = -_1379;
    float _1745 = fma(_1739, _1741, _1743);
    bool _1747 = _1745 >= 0.0;
    bool _1749 = isnan(_1745);
    bool _1751 = _1747 || _1749;
    bool _1753 = isnan(0.0);
    bool _1755 = _1751 || _1753;
    bool _1757 = !_1755;
    float _1759 = _1757 ? 0.0 : 2.0;
    float _1761 = _1737 + _1759;
    bool _1763 = _1597 >= 0.0;
    bool _1765 = isnan(_1597);
    bool _1767 = _1763 || _1765;
    bool _1769 = isnan(0.0);
    bool _1771 = _1767 || _1769;
    float _1773 = float(_1771);
    float _1775 = _1761 + _1735;
    float _1777 = 1.0 / _1419;
    float _1779 = _1775 + _1773;
    float _1781 = 1.0 / _1403;
    float _1783 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1785 = -_1379;
    float _1787 = fma(_1777, _1783, _1785);
    bool _1789 = _1787 >= 0.0;
    bool _1791 = isnan(_1787);
    bool _1793 = _1789 || _1791;
    bool _1795 = isnan(0.0);
    bool _1797 = _1793 || _1795;
    float _1799 = float(_1797);
    float _1801 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1803 = -_1379;
    float _1805 = fma(_1579, _1801, _1803);
    float _1807 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1809 = -_1379;
    float _1811 = fma(_1781, _1807, _1809);
    float _1813 = 1.0 / _1529;
    bool _1815 = _1811 >= 0.0;
    bool _1817 = isnan(_1811);
    bool _1819 = _1815 || _1817;
    bool _1821 = isnan(0.0);
    bool _1823 = _1819 || _1821;
    bool _1825 = !_1823;
    float _1827 = _1825 ? 0.0 : 2.0;
    float _1829 = _1779 + _1827;
    float _1831 = 1.0 / _1415;
    float _1833 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1835 = -_1379;
    float _1837 = fma(_1813, _1833, _1835);
    float _1839 = _1829 + _1799;
    float _1841 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1843 = -_1379;
    float _1845 = fma(_1831, _1841, _1843);
    bool _1847 = _1845 >= 0.0;
    bool _1849 = isnan(_1845);
    bool _1851 = _1847 || _1849;
    bool _1853 = isnan(0.0);
    bool _1855 = _1851 || _1853;
    float _1857 = 1.0 / _1433;
    float _1859 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1861 = -_1379;
    float _1863 = fma(_1857, _1859, _1861);
    bool _1865 = _1863 >= 0.0;
    bool _1867 = isnan(_1863);
    bool _1869 = _1865 || _1867;
    bool _1871 = isnan(0.0);
    bool _1873 = _1869 || _1871;
    bool _1875 = !_1855;
    float _1877 = _1875 ? 0.0 : 2.0;
    bool _1879 = !_1873;
    float _1881 = _1879 ? 0.0 : 2.0;
    float _1883 = _1839 + _1877;
    bool _1885 = _1805 >= 0.0;
    bool _1887 = isnan(_1805);
    bool _1889 = _1885 || _1887;
    bool _1891 = isnan(0.0);
    bool _1893 = _1889 || _1891;
    float _1895 = float(_1893);
    float _1897 = _1883 + _1881;
    float _1899 = _1897 + _1895;
    float _1901 = 1.0 / _1441;
    float _1903 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1905 = -_1379;
    float _1907 = fma(_1901, _1903, _1905);
    bool _1909 = _1907 >= 0.0;
    bool _1911 = isnan(_1907);
    bool _1913 = _1909 || _1911;
    bool _1915 = isnan(0.0);
    bool _1917 = _1913 || _1915;
    float _1919 = 1.0 / _1453;
    float _1921 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1923 = -_1379;
    float _1925 = fma(_1919, _1921, _1923);
    bool _1927 = !_1917;
    float _1929 = _1927 ? 0.0 : 2.0;
    bool _1931 = _1925 >= 0.0;
    bool _1933 = isnan(_1925);
    bool _1935 = _1931 || _1933;
    bool _1937 = isnan(0.0);
    bool _1939 = _1935 || _1937;
    float _1941 = float(_1939);
    float _1943 = _1899 + _1929;
    float _1945 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1947 = -_1379;
    float _1949 = fma(_1601, _1945, _1947);
    float _1951 = 1.0 / _1457;
    float _1953 = _1943 + _1941;
    bool _1955 = _1949 >= 0.0;
    bool _1957 = isnan(_1949);
    bool _1959 = _1955 || _1957;
    bool _1961 = isnan(0.0);
    bool _1963 = _1959 || _1961;
    float _1965 = float(_1963);
    float _1967 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1969 = -_1379;
    float _1971 = fma(_1951, _1967, _1969);
    bool _1973 = _1971 >= 0.0;
    bool _1975 = isnan(_1971);
    bool _1977 = _1973 || _1975;
    bool _1979 = isnan(0.0);
    bool _1981 = _1977 || _1979;
    float _1983 = float(_1981);
    float _1985 = _1953 + _1983;
    float _1987 = 1.0 / _1461;
    float _1989 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1991 = -_1379;
    float _1993 = fma(_1987, _1989, _1991);
    bool _1995 = _1993 >= 0.0;
    bool _1997 = isnan(_1993);
    bool _1999 = _1995 || _1997;
    bool _2001 = isnan(0.0);
    bool _2003 = _1999 || _2001;
    bool _2005 = !_2003;
    float _2007 = _2005 ? 0.0 : 2.0;
    float _2009 = _1985 + _2007;
    float _2011 = 1.0 / _1465;
    float _2013 = _2009 + _1965;
    float _2015 = 1.0 / _1503;
    float _2017 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2019 = -_1379;
    float _2021 = fma(_2011, _2017, _2019);
    bool _2023 = _2021 >= 0.0;
    bool _2025 = isnan(_2021);
    bool _2027 = _2023 || _2025;
    bool _2029 = isnan(0.0);
    bool _2031 = _2027 || _2029;
    float _2033 = 1.0 / _1481;
    float _2035 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2037 = -_1379;
    float _2039 = fma(_2015, _2035, _2037);
    float _2041 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2043 = -_1379;
    float _2045 = fma(_2033, _2041, _2043);
    bool _2047 = _2045 >= 0.0;
    bool _2049 = isnan(_2045);
    bool _2051 = _2047 || _2049;
    bool _2053 = isnan(0.0);
    bool _2055 = _2051 || _2053;
    float _2057 = 1.0 / _1491;
    float _2059 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2061 = -_1379;
    float _2063 = fma(_2057, _2059, _2061);
    bool _2065 = _2063 >= 0.0;
    bool _2067 = isnan(_2063);
    bool _2069 = _2065 || _2067;
    bool _2071 = isnan(0.0);
    bool _2073 = _2069 || _2071;
    float _2075 = 1.0 / _1499;
    bool _2077 = !_2073;
    float _2079 = _2077 ? 0.0 : 3.0;
    float _2081 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2083 = -_1379;
    float _2085 = fma(_2075, _2081, _2083);
    bool _2087 = _2085 >= 0.0;
    bool _2089 = isnan(_2085);
    bool _2091 = _2087 || _2089;
    bool _2093 = isnan(0.0);
    bool _2095 = _2091 || _2093;
    bool _2097 = !_2055;
    float _2099 = _2097 ? 0.0 : 3.0;
    bool _2101 = _2039 >= 0.0;
    bool _2103 = isnan(_2039);
    bool _2105 = _2101 || _2103;
    bool _2107 = isnan(0.0);
    bool _2109 = _2105 || _2107;
    bool _2111 = !_2095;
    float _2113 = _2111 ? 0.0 : 3.0;
    float _2115 = _2099 + _2079;
    bool _2117 = !_2031;
    float _2119 = _2117 ? 0.0 : 2.0;
    bool _2121 = !_2109;
    float _2123 = _2121 ? 0.0 : 3.0;
    float _2125 = _2115 + _2113;
    bool _2127 = _1837 >= 0.0;
    bool _2129 = isnan(_1837);
    bool _2131 = _2127 || _2129;
    bool _2133 = isnan(0.0);
    bool _2135 = _2131 || _2133;
    float _2137 = _2013 + _2119;
    float _2139 = 1.0 / _1521;
    float _2141 = _2125 + _2123;
    bool _2143 = !_2135;
    float _2145 = _2143 ? 0.0 : 3.0;
    float _2147 = _2137 * 0.02857142873108386993408203125;
    float _2149 = precise::clamp(_2147, 0.0, 1.0);
    float _2151 = 1.0 / _1509;
    float _2153 = 1.0 / _1525;
    float _2155 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2157 = -_1379;
    float _2159 = fma(_2139, _2155, _2157);
    float _2161 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2163 = -_1379;
    float _2165 = fma(_2151, _2161, _2163);
    bool _2167 = _2165 >= 0.0;
    bool _2169 = isnan(_2165);
    bool _2171 = _2167 || _2169;
    bool _2173 = isnan(0.0);
    bool _2175 = _2171 || _2173;
    bool _2177 = !_2175;
    float _2179 = _2177 ? 0.0 : 3.0;
    bool _2181 = _2159 >= 0.0;
    bool _2183 = isnan(_2159);
    bool _2185 = _2181 || _2183;
    bool _2187 = isnan(0.0);
    bool _2189 = _2185 || _2187;
    float _2191 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2193 = -_1379;
    float _2195 = fma(_2153, _2191, _2193);
    float _2197 = _2141 + _2179;
    bool _2199 = !_2189;
    float _2201 = _2199 ? 0.0 : 3.0;
    bool _2203 = _2195 >= 0.0;
    bool _2205 = isnan(_2195);
    bool _2207 = _2203 || _2205;
    bool _2209 = isnan(0.0);
    bool _2211 = _2207 || _2209;
    float _2213 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2215 = -_1379;
    float _2217 = fma(_1609, _2213, _2215);
    float _2219 = _2197 + _2201;
    bool _2221 = !_2211;
    float _2223 = _2221 ? 0.0 : 3.0;
    bool _2225 = _2217 >= 0.0;
    bool _2227 = isnan(_2217);
    bool _2229 = _2225 || _2227;
    bool _2231 = isnan(0.0);
    bool _2233 = _2229 || _2231;
    float _2235 = _2219 + _2223;
    bool _2237 = !_2233;
    float _2239 = _2237 ? 0.0 : 5.0;
    bool _2241 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2243 = isnan(0.5);
    bool _2245 = _2241 || _2243;
    bool _2247 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2249 = _2245 || _2247;
    float _2251 = _2235 + _2145;
    float _2253 = _2251 + _2239;
    float _2255 = _2253 * 0.14285714924335479736328125;
    float _2257 = precise::clamp(_2255, 0.0, 1.0);
    float _2259 = _2149 * _2257;
    float _2261 = _2149;
    float _2263 = _2257;
    if (_2249)
    {
        _2261 = 1.0;
    }
    float _2265 = _2261;
    float _2267 = _2265;
    if (_2249)
    {
        _2263 = 1.0;
    }
    float _2269 = _2263;
    float _2271 = _2269;
    if (!_2249)
    {
        float _2273 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2275 = _2273 * 0.15915493667125701904296875;
        float _2277 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2279 = _2275 * 6.283185482025146484375;
        float _2281 = cos(_2279);
        float _2283 = _2277 * 0.15915493667125701904296875;
        float _2285 = _2275 * 6.283185482025146484375;
        float _2287 = sin(_2285);
        float _2289 = 1.0 / _2281;
        float _2291 = _2283 * 6.283185482025146484375;
        float _2293 = cos(_2291);
        float _2295 = _2287 * _2289;
        float _2297 = _2283 * 6.283185482025146484375;
        float _2299 = sin(_2297);
        float _2301 = _2293 * _2295;
        float _2303 = 1.0 / _2301;
        float _2305 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2307 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2305;
        float _2309 = 1.0 / _2307;
        float _2311 = _2299 * _2303;
        float _2313 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2315 = fma(_1379, _2311, _2313);
        float _2317 = _2315 * _2309;
        float _2319 = precise::clamp(_2317, 0.0, 1.0);
        _2271 = _2319;
    }
    float _2321 = _2271;
    if (!_2249)
    {
        float _2323 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2325 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2327 = _2323 * 0.15915493667125701904296875;
        float _2329 = _2325 * 0.15915493667125701904296875;
        float _2331 = _2327 * 6.283185482025146484375;
        float _2333 = cos(_2331);
        float _2335 = _2327 * 6.283185482025146484375;
        float _2337 = sin(_2335);
        float _2339 = 1.0 / _2333;
        float _2341 = _2329 * 6.283185482025146484375;
        float _2343 = cos(_2341);
        float _2345 = _2337 * _2339;
        float _2347 = _2329 * 6.283185482025146484375;
        float _2349 = sin(_2347);
        float _2351 = _2343 * _2345;
        float _2353 = 1.0 / _2351;
        float _2355 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2357 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2355;
        float _2359 = 1.0 / _2357;
        float _2361 = _2349 * _2353;
        float _2363 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2365 = fma(_1379, _2361, _2363);
        float _2367 = _2365 * _2359;
        float _2369 = precise::clamp(_2367, 0.0, 1.0);
        float _2371 = -_2369;
        float _2373 = _2371 + 1.0;
        _2267 = _2373;
    }
    float _2375 = _2267;
    float _2377 = _2259 * _2321;
    bool _2379 = _2321 > 0.0;
    bool _2381 = isnan(_2321);
    bool _2383 = _2379 || _2381;
    bool _2385 = isnan(0.0);
    bool _2387 = _2383 || _2385;
    float _2389 = _2377 * _2375;
    bool _2391 = _2375 <= 0.0;
    bool _2393 = !_2387;
    bool _2395 = _2391 || _2393;
    float _2397 = _2389 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2399 = _2397 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_38.x = _2399;
    if (!_2395)
    {
        return out;
    }
    float _2401 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_38.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2401;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _74 = in.m_35.w;
    float _76 = trunc(_74);
    int _79 = int(_76);
    bool _83 = _79 >= 1;
    float _85 = 0.0;
    float _87 = as_type<float>(_79);
    if (!_83)
    {
        _85 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _89 = _85;
    float _91 = _89;
    if (!_83)
    {
        out.m_38.x = 0.0;
    }
    int _93 = 0;
    if (!_83)
    {
        float _95 = _89 * 5.0;
        _93 = as_type<int>(_95);
    }
    int _97 = _93;
    int _99 = _97;
    if (!_83)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2459 = as_type<float>(_97);
        out.gl_Position.z = _2459;
    }
    if (!_83)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _101 = in.m_40.w;
    bool _103 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_101;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_111)
    {
        float _117 = float(_79);
        _91 = _117;
    }
    float _119 = _91;
    bool _121 = _115 >= _119;
    bool _123 = !_111;
    bool _125 = _121 || _123;
    if (_125)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _87;
    if (_125)
    {
        out.m_38.x = 0.0;
    }
    if (_125)
    {
        float _129 = _127 * 5.0;
        _99 = as_type<int>(_129);
    }
    int _131 = _99;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2527 = as_type<float>(_131);
        out.gl_Position.z = _2527;
    }
    if (_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_42.w;
    float _135 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _137 = in.m_44.y;
    int _139 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _141 = _139 != 0;
    float _143 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _147 = _145 != 0;
    float _149 = in.m_42.y;
    float _151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _155 = _153 != 0;
    float _157 = in.m_42.z;
    int _159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _161 = _159 != 0;
    float _163 = in.m_42.x;
    float _165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _167 = in.m_44.x;
    float _169 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _171 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _173 = _133 > 0.5;
    float _175 = _151 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _177 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _179 = -_137;
    float _181 = _179 + 1.0;
    float _183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _185 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _187 = _149 > 0.5;
    float _189 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[88].w, _169);
    float _191 = 0.0;
    float _193 = _137;
    bool _195 = _173;
    float _197 = _143;
    if (!_147)
    {
        _191 = _149;
    }
    float _199 = _191;
    float _201 = _165 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _203 = _157 > 0.5;
    int _205 = _187 ? as_type<int>(_181) : as_type<int>(_137);
    int _207 = _203 ? as_type<int>(_181) : as_type<int>(_137);
    float _209 = _155 ? as_type<float>(_205) : _137;
    float _211 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _213 = _161 ? as_type<float>(_207) : _137;
    float _215 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _217 = _149 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _219 = _199;
    float _221 = _167;
    if (_141)
    {
        float _223 = _173 ? _181 : _137;
        _193 = _223;
    }
    float _225 = _193;
    float _227 = fma(_217, -2.0, _215);
    float _229 = _135 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _235 = _233 != 0;
    float _237 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _227);
    int _239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _241 = _239 != 0;
    float _243 = _163 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _247 = _245 != 0;
    float _249 = fma(_229, _209, -0.5);
    float _251 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[78].w, _231);
    float _253 = _231;
    float _255 = _229;
    int _257 = as_type<int>(_237);
    float _259 = _243;
    float _261 = _249;
    if (!_147)
    {
        _253 = _199;
    }
    float _263 = _253;
    float _265 = fma(_175, _225, -0.5);
    float _267 = _263;
    if (_147)
    {
        _255 = _163;
    }
    float _269 = _255;
    float _271 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _251);
    float _273 = _269;
    if (_147)
    {
        _219 = _149;
    }
    float _275 = _219;
    float _277 = fma(_213, _201, -0.5);
    float _279 = _275;
    if (!_147)
    {
        _273 = _157;
    }
    float _281 = _273;
    float _283 = -_237;
    float _285 = fma(_271, _249, _283);
    int _287 = as_type<int>(_281);
    int _289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[87].x);
    if (_241)
    {
        float _291 = -_167;
        float _293 = _291 + 1.0;
        _257 = as_type<int>(_293);
    }
    int _295 = _257;
    if (_235)
    {
        bool _297 = _163 > 0.5;
        _195 = _297;
    }
    bool _299 = _195;
    float _301 = _281 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (_235)
    {
        float _303 = -_167;
        float _305 = _303 + 1.0;
        _287 = as_type<int>(_305);
    }
    int _307 = _287;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _311 = as_type<float>(_307);
    if (_247)
    {
        float _313 = -_167;
        float _315 = _313 + 1.0;
        _289 = as_type<int>(_315);
    }
    int _317 = _289;
    float _319 = -_211;
    float _321 = fma(_243, 2.0, _319);
    if (_147)
    {
        _267 = _163;
    }
    float _323 = _267;
    float _325 = -_309;
    float _327 = fma(_301, 2.0, _325);
    if (!_235)
    {
        _259 = _167;
    }
    float _329 = _259;
    float _331 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[83].z, _171);
    float _333 = 0.0;
    float _335 = _329;
    float _337 = _331;
    if (!_241)
    {
        _333 = _167;
    }
    float _339 = _333;
    float _341 = _323 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _343 = _339;
    if (_235)
    {
        float _345 = _299 ? as_type<float>(_307) : _167;
        _335 = _345;
    }
    float _347 = _335;
    if (_241)
    {
        float _349 = _203 ? as_type<float>(_295) : _167;
        _343 = _349;
    }
    float _351 = _343;
    float _353 = -_177;
    float _355 = fma(_341, 2.0, _353);
    if (_247)
    {
        float _357 = _187 ? as_type<float>(_317) : _167;
        _221 = _357;
    }
    float _359 = _221;
    float _361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _363 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _367 = _363 || _365;
    bool _369 = isnan(1.0);
    bool _371 = _367 || _369;
    if (!_147)
    {
        _311 = _157;
    }
    float _373 = _311;
    float _375 = _373;
    if (_147)
    {
        _375 = _275;
    }
    float _377 = _375;
    float _379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _381 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[83].w, _185);
    if (!_147)
    {
        _261 = _157;
    }
    float _383 = _261;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _387 = _383;
    if (_147)
    {
        _387 = _275;
    }
    float _389 = _387;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _393 = 0.0;
    if (!_371)
    {
        float _395 = _143 * _143;
        float _397 = _395 * 0.5;
        _393 = _397;
    }
    float _399 = _393;
    float _401 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[78].z, _385);
    float _403 = _399;
    if (!_147)
    {
        _279 = _163;
    }
    float _405 = _279;
    float _407 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[88].z, _391);
    float _409 = _361 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_371)
    {
        float _411 = _399 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _403 = _411;
    }
    float _413 = _403;
    float _415 = _379 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _417 = !_371;
    float _419 = _413;
    if (!_417)
    {
        float _421 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _423 = log2(_421);
        float _425 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _427 = _425 + 1.0;
        float _429 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _431 = _143 * _423;
        float _433 = 1.0 / _427;
        float _435 = _429 * 0.693147182464599609375;
        float _437 = exp2(_431);
        float _439 = 1.0 / _435;
        float _441 = _437 + (-1.0);
        float _443 = -_441;
        float _445 = fma(_443, _439, _143);
        float _447 = _445 * _433;
        float _449 = _447 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _419 = _449;
    }
    float _451 = _419;
    bool _453 = !_371;
    if (!_453)
    {
        float _455 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _457 = log2(_455);
        float _459 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _461 = _459 + 1.0;
        float _463 = 1.0 / _461;
        float _465 = _143 * _457;
        float _467 = exp2(_465);
        float _469 = -_467;
        float _471 = _469 + 1.0;
        float _473 = _471 * _463;
        _197 = _473;
    }
    float _475 = _197;
    float _477 = fma(_409, _347, -0.5);
    float _479 = in.m_46.w;
    float _481 = fma(_415, _351, -0.5);
    float _483 = in.m_40.x;
    float _485 = in.m_40.y;
    float _487 = in.m_40.z;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _491 = in.m_35.x;
    float _493 = in.m_35.y;
    float _495 = in.m_35.z;
    float _497 = _389 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _505 = fma(_497, -2.0, _489);
    float _507 = _451 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _509 = _499 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _511 = _501 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _513 = _183 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _515 = _503 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _517 = _451 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _519 = _451 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _521 = fma(_513, _359, -0.5);
    float _523 = _405 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _525 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[81].y, _505);
    float _527 = -_115;
    float _529 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[86].x, _327);
    float _531 = -_115;
    float _533 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[81].x, _355);
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _537 = fma(_475, _485, _507);
    float _539 = fma(_475, _483, _517);
    float _541 = -_115;
    float _543 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[76].x, _321);
    float _545 = fma(_475, _487, _519);
    float _547 = fma(_537, _479, _493);
    float _549 = fma(_539, _479, _491);
    float _551 = fma(_545, _479, _495);
    float _553 = _547 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _555 = _547 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _557 = _547 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _561 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[5].x, _553);
    float _563 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[4].x, _555);
    float _565 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[6].x, _557);
    out.m_48.x = _509;
    out.m_48.y = _511;
    out.m_48.z = _515;
    out.m_48.w = _535;
    float _567 = fma(_551, (*spvDescriptorSet0.vp_c10)._m0[5].z, _561);
    float _569 = fma(_551, (*spvDescriptorSet0.vp_c10)._m0[4].z, _563);
    float _571 = fma(_551, (*spvDescriptorSet0.vp_c10)._m0[6].z, _565);
    float _573 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _401);
    float _575 = _567 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _577 = _569 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _579 = _571 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _581 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].z, _331);
    float _583 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[87].w, _189);
    float _585 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _587 = _577 + _585;
    float _589 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _591 = _579 + _589;
    float _593 = fma(_581, _481, _533);
    float _595 = fma(_523, -2.0, _559);
    float _597 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _599 = _575 + _597;
    float _601 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[87].z, _407);
    float _603 = fma(_573, _477, _543);
    float _605 = _599 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _607 = fma(_601, _521, _529);
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _611 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[28].x, _605);
    float _613 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].w, _381);
    float _615 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[86].y, _595);
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _619 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[28].z, _611);
    float _621 = -_525;
    float _623 = fma(_613, _265, _621);
    float _625 = _599 * _599;
    float _627 = -_615;
    float _629 = fma(_583, _277, _627);
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _633 = _619 >= 0.0;
    float _635 = fma(_587, _587, _625);
    float _637 = _285 + 0.5;
    float _639 = _607 + 0.5;
    float _641 = _623 + 0.5;
    float _643 = fma(_591, _591, _635);
    float _645 = rsqrt(_643);
    float _647 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _649 = _617 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _651 = as_type<int>(_623);
    float _653 = 1.0;
    if (_633)
    {
        _337 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _655 = _337;
    float _657 = _631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _659 = _603 + 0.5;
    float _661 = _593 + 0.5;
    float _663 = _629 + 0.5;
    if (_633)
    {
        float _665 = _655 * 5.0;
        _651 = as_type<int>(_665);
    }
    int _667 = _651;
    out.m_50.x = _647;
    out.m_50.y = _649;
    out.m_50.z = _657;
    out.m_52.x = 1.0;
    out.m_52.y = 1.0;
    out.m_52.z = 1.0;
    float _669 = _599 * _645;
    float _671 = _587 * _645;
    out.m_54.x = _659;
    out.m_54.y = _637;
    out.m_54.z = _661;
    out.m_54.w = _641;
    out.m_56.x = _639;
    out.m_56.y = _663;
    if (_633)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3517 = as_type<float>(_667);
        out.gl_Position.z = _3517;
    }
    if (_633)
    {
        out.m_38.x = 0.0;
    }
    if (_633)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _673 = -_669;
    float _675 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[18].w, _575);
    float _677 = _591 * _645;
    float _679 = -_671;
    float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[18].w, _577);
    float _683 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _685 = _675 + _683;
    float _687 = -_677;
    float _689 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[18].w, _579);
    float _691 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _693 = _681 + _691;
    float _695 = _685 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _697 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _699 = _689 + _697;
    float _701 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[28].x, _695);
    float _703 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[28].z, _701);
    bool _705 = _703 >= 0.0;
    if (_705)
    {
        _653 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _707 = _653;
    int _709 = as_type<int>(_707);
    if (_705)
    {
        out.m_38.x = 0.0;
    }
    if (_705)
    {
        float _711 = _707 * 5.0;
        _709 = as_type<int>(_711);
    }
    int _713 = _709;
    if (_705)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3611 = as_type<float>(_713);
        out.gl_Position.z = _3611;
    }
    if (_705)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _715 = _675 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _717 = _675 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    float _719 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[11].x, _715);
    float _721 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[9].x, _717);
    float _723 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[11].z, _719);
    float _725 = _675 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    float _727 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[9].z, _721);
    float _729 = _723 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _731 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[8].x, _725);
    float _733 = _727 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    float _735 = 1.0 / _729;
    float _737 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[8].z, _731);
    float _739 = _729 * 0.5;
    float _741 = _737 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _743 = fma(_733, -0.5, _739);
    float _745 = _741 + _729;
    float _747 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4899999797344207763671875, _743);
    float _749 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _743);
    float _751 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _743);
    float _753 = _745 * 0.5;
    float _755 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _743);
    float _757 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _743);
    float _759 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.2800000011920928955078125, _743);
    float _761 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _753);
    float _763 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _753);
    float _765 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _753);
    float _767 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _753);
    float _769 = _761 * _735;
    float _771 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _743);
    float _773 = _747 * _735;
    float _775 = _749 * _735;
    float _777 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _753);
    float _779 = _763 * _735;
    float _781 = _751 * _735;
    float _783 = _765 * _735;
    float _785 = _767 * _735;
    float _787 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _743);
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _791 = _743 + _789;
    float _793 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _753);
    float _795 = _755 * _735;
    float _797 = _757 * _735;
    float _799 = _759 * _735;
    float _801 = _771 * _735;
    float2 _3794 = float2(_769, _773);
    float _803 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3794, float2(0.0), isnan(_3794)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3794, float2(0.0), isnan(_3794)), level(0.0)).x;
    float2 _3804 = float2(_779, _781);
    float _805 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3804, float2(0.0), isnan(_3804)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3804, float2(0.0), isnan(_3804)), level(0.0)).x;
    float2 _3812 = float2(_779, _775);
    float _807 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3812, float2(0.0), isnan(_3812)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3812, float2(0.0), isnan(_3812)), level(0.0)).x;
    float2 _3820 = float2(_783, _795);
    float _809 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3820, float2(0.0), isnan(_3820)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3820, float2(0.0), isnan(_3820)), level(0.0)).x;
    float2 _3828 = float2(_785, _799);
    float _811 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3828, float2(0.0), isnan(_3828)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3828, float2(0.0), isnan(_3828)), level(0.0)).x;
    float _813 = _743 * _735;
    float _815 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _743);
    float _817 = _743 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _819 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _743);
    float _821 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _743);
    float _823 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _743);
    float _825 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _743);
    float _827 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _743);
    float _829 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _743);
    float _831 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _743);
    float _833 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _743);
    float _835 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _743);
    float _837 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _743);
    float _839 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _743);
    float _841 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _743);
    float _843 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _753);
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _847 = _753 + _845;
    float _849 = _777 * _735;
    float _851 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _743);
    float _853 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _753);
    float _855 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _753);
    float _857 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _753);
    float _859 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _753);
    float _861 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _753);
    float _863 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _753);
    float _865 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _753);
    float _867 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _753);
    float _869 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _753);
    float _871 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _753);
    float _873 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _753);
    float _875 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _753);
    float _877 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _753);
    float _879 = _793 * _735;
    float _881 = _787 * _735;
    float _883 = _791 * _735;
    float _885 = _753 * _735;
    float _887 = _843 * _735;
    float2 _3991 = float2(_849, _797);
    float _889 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3991, float2(0.0), isnan(_3991)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3991, float2(0.0), isnan(_3991)), level(0.0)).x;
    float2 _3999 = float2(_849, _801);
    float _891 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3999, float2(0.0), isnan(_3999)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3999, float2(0.0), isnan(_3999)), level(0.0)).x;
    float _893 = _847 * _735;
    float _895 = _817 * _735;
    float _897 = _821 * _735;
    float _899 = _823 * _735;
    float _901 = _875 * _735;
    float2 _4022 = float2(_879, _881);
    float _903 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4022, float2(0.0), isnan(_4022)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4022, float2(0.0), isnan(_4022)), level(0.0)).x;
    float2 _4030 = float2(_885, _881);
    float _905 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4030, float2(0.0), isnan(_4030)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4030, float2(0.0), isnan(_4030)), level(0.0)).x;
    float2 _4038 = float2(_885, _883);
    float _907 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4038, float2(0.0), isnan(_4038)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4038, float2(0.0), isnan(_4038)), level(0.0)).x;
    float _909 = _877 * _735;
    float _911 = _753 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _913 = _825 * _735;
    float2 _4056 = float2(_885, _895);
    float _915 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4056, float2(0.0), isnan(_4056)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4056, float2(0.0), isnan(_4056)), level(0.0)).x;
    float2 _4064 = float2(_887, _897);
    float _917 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4064, float2(0.0), isnan(_4064)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4064, float2(0.0), isnan(_4064)), level(0.0)).x;
    float2 _4072 = float2(_885, _897);
    float _919 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4072, float2(0.0), isnan(_4072)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4072, float2(0.0), isnan(_4072)), level(0.0)).x;
    float2 _4080 = float2(_885, _899);
    float _921 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4080, float2(0.0), isnan(_4080)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4080, float2(0.0), isnan(_4080)), level(0.0)).x;
    float2 _4088 = float2(_885, _913);
    float _923 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4088, float2(0.0), isnan(_4088)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4088, float2(0.0), isnan(_4088)), level(0.0)).x;
    float2 _4096 = float2(_885, _813);
    float _925 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4096, float2(0.0), isnan(_4096)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4096, float2(0.0), isnan(_4096)), level(0.0)).x;
    float2 _4104 = float2(_893, _813);
    float _927 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4104, float2(0.0), isnan(_4104)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4104, float2(0.0), isnan(_4104)), level(0.0)).x;
    float _929 = _815 * _735;
    float _931 = _853 * _735;
    float _933 = _819 * _735;
    float _935 = _911 * _735;
    float _937 = _857 * _735;
    float _939 = _855 * _735;
    float _941 = _859 * _735;
    float2 _4133 = float2(_931, _929);
    float _943 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4133, float2(0.0), isnan(_4133)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4133, float2(0.0), isnan(_4133)), level(0.0)).x;
    float2 _4141 = float2(_931, _933);
    float _945 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4141, float2(0.0), isnan(_4141)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4141, float2(0.0), isnan(_4141)), level(0.0)).x;
    float2 _4149 = float2(_931, _813);
    float _947 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4149, float2(0.0), isnan(_4149)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4149, float2(0.0), isnan(_4149)), level(0.0)).x;
    float2 _4157 = float2(_935, _813);
    float _949 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4157, float2(0.0), isnan(_4157)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4157, float2(0.0), isnan(_4157)), level(0.0)).x;
    float2 _4165 = float2(_939, _813);
    float _951 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4165, float2(0.0), isnan(_4165)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4165, float2(0.0), isnan(_4165)), level(0.0)).x;
    float2 _4173 = float2(_937, _813);
    float _953 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4173, float2(0.0), isnan(_4173)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4173, float2(0.0), isnan(_4173)), level(0.0)).x;
    float2 _4181 = float2(_941, _813);
    float _955 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4181, float2(0.0), isnan(_4181)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4181, float2(0.0), isnan(_4181)), level(0.0)).x;
    float _957 = _827 * _735;
    float _959 = _829 * _735;
    float _961 = _861 * _735;
    float _963 = _865 * _735;
    float _965 = _863 * _735;
    float _967 = _867 * _735;
    float _969 = _831 * _735;
    float _971 = _869 * _735;
    float _973 = _833 * _735;
    float _975 = _871 * _735;
    float _977 = _835 * _735;
    float _979 = _873 * _735;
    float2 _4225 = float2(_961, _957);
    float _981 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4225, float2(0.0), isnan(_4225)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4225, float2(0.0), isnan(_4225)), level(0.0)).x;
    float2 _4233 = float2(_965, _959);
    float _983 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4233, float2(0.0), isnan(_4233)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4233, float2(0.0), isnan(_4233)), level(0.0)).x;
    float2 _4241 = float2(_963, _969);
    float _985 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4241, float2(0.0), isnan(_4241)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4241, float2(0.0), isnan(_4241)), level(0.0)).x;
    float2 _4249 = float2(_967, _973);
    float _987 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4249, float2(0.0), isnan(_4249)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4249, float2(0.0), isnan(_4249)), level(0.0)).x;
    float2 _4257 = float2(_971, _977);
    float _989 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4257, float2(0.0), isnan(_4257)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4257, float2(0.0), isnan(_4257)), level(0.0)).x;
    float _991 = _837 * _735;
    float _993 = _839 * _735;
    float _995 = _841 * _735;
    float _997 = _851 * _735;
    float2 _4277 = float2(_975, _991);
    float _999 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4277, float2(0.0), isnan(_4277)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4277, float2(0.0), isnan(_4277)), level(0.0)).x;
    float2 _4285 = float2(_979, _993);
    float _1001 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4285, float2(0.0), isnan(_4285)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4285, float2(0.0), isnan(_4285)), level(0.0)).x;
    float2 _4293 = float2(_901, _995);
    float _1003 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4293, float2(0.0), isnan(_4293)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4293, float2(0.0), isnan(_4293)), level(0.0)).x;
    float2 _4301 = float2(_909, _997);
    float _1005 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4301, float2(0.0), isnan(_4301)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4301, float2(0.0), isnan(_4301)), level(0.0)).x;
    float _1007 = -_669;
    float _1009 = fma(_1007, (*spvDescriptorSet0.vp_c9)._m0[18].w, _599);
    float _1011 = -_671;
    float _1013 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[18].w, _587);
    float _1015 = -_677;
    float _1017 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[18].w, _591);
    float _1019 = _1009 * _1009;
    float _1021 = fma(_1013, _1013, _1019);
    float _1023 = in.m_46.x;
    float _1025 = in.m_46.y;
    float _1027 = in.m_46.z;
    float _1029 = fma(_1017, _1017, _1021);
    float _1031 = in.m_58.x;
    float _1033 = in.m_58.y;
    float _1035 = in.m_58.z;
    float _1037 = sqrt(_1029);
    bool _1039 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1041 = isnan(0.5);
    bool _1043 = _1039 || _1041;
    bool _1045 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1047 = _1043 || _1045;
    float _1049 = _645 * _1037;
    float _1051 = _1025 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1053 = _1023 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1055 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1057 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1059 = _1053 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1061 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1033);
    float _1063 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1031);
    float _1065 = _1049 * _1057;
    float _1067 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1069 = _1049 * _1059;
    float _1071 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1035);
    float _1073 = _1061 * _1065;
    float _1075 = _1049 * _1067;
    float _1077 = _1063 * _1069;
    float _1079 = _1073 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1081 = _1071 * _1075;
    float _1083 = _1073 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1085 = _1073 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1087 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1079);
    float _1089 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1083);
    float _1091 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1085);
    float _1093 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1087);
    float _1095 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1089);
    float _1097 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1091);
    float _1099 = _1093 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1101 = _675 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1103 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1105 = _1097 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1107 = _579 + _1099;
    float _1109 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1101);
    float _1111 = _577 + _1103;
    float _1113 = _575 + _1105;
    float _1115 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1117 = _1107 + _1115;
    float _1119 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1121 = _1111 + _1119;
    float _1123 = _1117 * _1117;
    float _1125 = fma(_1121, _1121, _1123);
    float _1127 = sqrt(_1125);
    bool _1129 = _1127 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1131 = _1097;
    float _1133 = _1105;
    float _1135 = _1113;
    if (!_1129)
    {
        _1131 = _1111;
    }
    float _1137 = _1131;
    float _1139 = _1137;
    if (!_1129)
    {
        _1133 = _1107;
    }
    float _1141 = _1133;
    bool _1143 = !_1129;
    float _1145 = _1141;
    if (!_1143)
    {
        float _1147 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1149 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1151 = _1127 + _1149;
        float _1153 = _1113 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1155 = rsqrt(_1125);
        float _1157 = _1151 * _1147;
        float _1159 = _1157 * 0.15915493667125701904296875;
        float _1161 = _1159 * 6.283185482025146484375;
        float _1163 = cos(_1161);
        float _1165 = _1159 * 6.283185482025146484375;
        float _1167 = sin(_1165);
        float _1169 = _1163 + (-1.0);
        float _1171 = fma(_1167, _1153, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1173 = _1169 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1175 = _1155 * _1171;
        float _1177 = fma(_1113, _1163, _1173);
        float _1179 = fma(_1121, _1175, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1181 = fma(_1117, _1175, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1139 = _1179;
        _1135 = _1177;
        _1145 = _1181;
    }
    float _1183 = _1139;
    float _1185 = _1135;
    float _1187 = _1145;
    float _1189 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1109);
    float _1191 = -_671;
    float _1193 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1183);
    float _1195 = -_669;
    float _1197 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1185);
    float _1199 = -_677;
    float _1201 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1187);
    float _1203 = _1189 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1205 = _1197;
    float _1207 = _1193;
    float _1209 = _1201;
    if (!_1047)
    {
        float _1211 = _685 * _685;
        float _1213 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1215 = -_579;
        float _1217 = _1215 + _1187;
        float _1219 = fma(_693, _693, _1211);
        float _1221 = fma(_699, _699, _1219);
        float _1223 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1225 = sqrt(_1221);
        float _1227 = 1.0 / _1049;
        float _1229 = precise::min(_1225, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1231 = _1229 * _1213;
        float _1233 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1235 = -_577;
        float _1237 = _1235 + _1183;
        float _1239 = _1231 * _1227;
        float _1241 = -_575;
        float _1243 = _1241 + _1185;
        float _1245 = _1233 * _1239;
        float _1247 = _1217 * _1239;
        float _1249 = fma(_1237, _1245, _681);
        float _1251 = fma(_1243, _1245, _675);
        float _1253 = fma(_1233, _1247, _689);
        _1205 = _1251;
        _1207 = _1249;
        _1209 = _1253;
    }
    float _1255 = _1205;
    float _1257 = _1207;
    float _1259 = _1209;
    float _1261 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1263 = _1203 + _729;
    float _1265 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1267 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1269 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1261);
    float _1271 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1273 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1265);
    float _1275 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1267);
    float _1277 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1269);
    float _1279 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1271);
    float _1281 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1273);
    float _1283 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1275);
    float _1285 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1287 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1279);
    float _1289 = _1281 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1291 = _1283 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1293 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1295 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1297 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1299 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1301 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1293);
    float _1303 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1295);
    float _1305 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1297);
    float _1307 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1299);
    float _1309 = _1287 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1311 = _1263 * _735;
    float _1313 = _1311 * 0.5;
    float _1315 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1305);
    float _1317 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1303);
    float _1319 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1307);
    float _1321 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1323 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1321);
    float _1325 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1315);
    float _1327 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1329 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1327);
    float _1331 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1333 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1331);
    float _1335 = 1.0 / _1323;
    float _1337 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1339 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1337);
    float _1341 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1301);
    float _1343 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1319);
    float _1345 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1347 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1345);
    float _1349 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1351 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1349);
    float _1353 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1341);
    float _1355 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1317);
    float _1357 = 1.0 / _1329;
    float _1359 = _1325 + _1343;
    float _1361 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1363 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1361);
    out.gl_Position.x = _1353;
    out.gl_Position.y = _1355;
    out.gl_Position.z = _1325;
    out.gl_Position.w = _1343;
    float _1365 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1367 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1365);
    float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1371 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1369);
    float _1373 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1375 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1373);
    float _1377 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1379 = _1335 * _1377;
    float _1381 = 1.0 / _1333;
    float _1383 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1385 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1383);
    float _1387 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1389 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1387);
    float _1391 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1393 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1391);
    float _1395 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1397 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1395);
    float _1399 = _1359 * 0.5;
    float _1401 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1403 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1401);
    float _1405 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1407 = -_1379;
    float _1409 = fma(_1357, _1405, _1407);
    float _1411 = 1.0 / _1371;
    float _1413 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1415 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1413);
    out.m_60.z = _1399;
    out.m_60.w = _1343;
    float _1417 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1419 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1417);
    bool _1421 = _1409 >= 0.0;
    bool _1423 = isnan(_1409);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan(0.0);
    bool _1429 = _1425 || _1427;
    float _1431 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1433 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1431);
    float _1435 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1437 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1435);
    float _1439 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1441 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1439);
    float _1443 = 1.0 / _1339;
    float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1447 = -_1379;
    float _1449 = fma(_1381, _1445, _1447);
    float _1451 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1453 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1451);
    float _1455 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1457 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1455);
    float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1461 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1459);
    float _1463 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1465 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1463);
    bool _1467 = _1449 >= 0.0;
    bool _1469 = isnan(_1449);
    bool _1471 = _1467 || _1469;
    bool _1473 = isnan(0.0);
    bool _1475 = _1471 || _1473;
    float _1477 = float(_1475);
    float _1479 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1481 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1479);
    float _1483 = 1.0 / _1347;
    bool _1485 = !_1429;
    float _1487 = _1485 ? 0.0 : 2.0;
    float _1489 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1491 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1489);
    float _1493 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1495 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1493);
    float _1497 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1499 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1497);
    float _1501 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1503 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1501);
    float _1505 = _1487 + _1477;
    float _1507 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1509 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1507);
    float _1511 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1513 = -_1379;
    float _1515 = fma(_1443, _1511, _1513);
    float _1517 = 1.0 / _1393;
    float _1519 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1521 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1519);
    float _1523 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1525 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1523);
    float _1527 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1529 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1527);
    bool _1531 = _1515 >= 0.0;
    bool _1533 = isnan(_1515);
    bool _1535 = _1531 || _1533;
    bool _1537 = isnan(0.0);
    bool _1539 = _1535 || _1537;
    float _1541 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1543 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1541);
    float _1545 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1547 = -_1379;
    float _1549 = fma(_1483, _1545, _1547);
    bool _1551 = !_1539;
    float _1553 = _1551 ? 0.0 : 2.0;
    float _1555 = 1.0 / _1397;
    bool _1557 = _1549 >= 0.0;
    bool _1559 = isnan(_1549);
    bool _1561 = _1557 || _1559;
    bool _1563 = isnan(0.0);
    bool _1565 = _1561 || _1563;
    float _1567 = float(_1565);
    float _1569 = _1505 + _1553;
    float _1571 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1573 = -_1379;
    float _1575 = fma(_1411, _1571, _1573);
    float _1577 = _1569 + _1567;
    float _1579 = 1.0 / _1437;
    bool _1581 = _1575 >= 0.0;
    bool _1583 = isnan(_1575);
    bool _1585 = _1581 || _1583;
    bool _1587 = isnan(0.0);
    bool _1589 = _1585 || _1587;
    float _1591 = float(_1589);
    float _1593 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1595 = -_1379;
    float _1597 = fma(_1555, _1593, _1595);
    float _1599 = 1.0 / _1351;
    float _1601 = 1.0 / _1495;
    float _1603 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1605 = -_1379;
    float _1607 = fma(_1599, _1603, _1605);
    float _1609 = 1.0 / _1543;
    bool _1611 = _1607 >= 0.0;
    bool _1613 = isnan(_1607);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan(0.0);
    bool _1619 = _1615 || _1617;
    float _1621 = float(_1619);
    float _1623 = _1577 + _1621;
    float _1625 = 1.0 / _1363;
    float _1627 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1629 = -_1379;
    float _1631 = fma(_1625, _1627, _1629);
    bool _1633 = _1631 >= 0.0;
    bool _1635 = isnan(_1631);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan(0.0);
    bool _1641 = _1637 || _1639;
    bool _1643 = !_1641;
    float _1645 = _1643 ? 0.0 : 2.0;
    float _1647 = _1623 + _1645;
    float _1649 = 1.0 / _1367;
    float _1651 = _1647 + _1591;
    float _1653 = 1.0 / _1385;
    float _1655 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1657 = -_1379;
    float _1659 = fma(_1649, _1655, _1657);
    bool _1661 = _1659 >= 0.0;
    bool _1663 = isnan(_1659);
    bool _1665 = _1661 || _1663;
    bool _1667 = isnan(0.0);
    bool _1669 = _1665 || _1667;
    float _1671 = 1.0 / _1375;
    float _1673 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1675 = -_1379;
    float _1677 = fma(_1653, _1673, _1675);
    float _1679 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1681 = -_1379;
    float _1683 = fma(_1671, _1679, _1681);
    bool _1685 = _1683 >= 0.0;
    bool _1687 = isnan(_1683);
    bool _1689 = _1685 || _1687;
    bool _1691 = isnan(0.0);
    bool _1693 = _1689 || _1691;
    bool _1695 = !_1669;
    float _1697 = _1695 ? 0.0 : 2.0;
    bool _1699 = !_1693;
    float _1701 = _1699 ? 0.0 : 2.0;
    float _1703 = _1651 + _1697;
    bool _1705 = _1677 >= 0.0;
    bool _1707 = isnan(_1677);
    bool _1709 = _1705 || _1707;
    bool _1711 = isnan(0.0);
    bool _1713 = _1709 || _1711;
    float _1715 = float(_1713);
    float _1717 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1719 = -_1379;
    float _1721 = fma(_1517, _1717, _1719);
    float _1723 = _1703 + _1701;
    bool _1725 = _1721 >= 0.0;
    bool _1727 = isnan(_1721);
    bool _1729 = _1725 || _1727;
    bool _1731 = isnan(0.0);
    bool _1733 = _1729 || _1731;
    float _1735 = float(_1733);
    float _1737 = _1723 + _1715;
    float _1739 = 1.0 / _1389;
    float _1741 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1743 = -_1379;
    float _1745 = fma(_1739, _1741, _1743);
    bool _1747 = _1745 >= 0.0;
    bool _1749 = isnan(_1745);
    bool _1751 = _1747 || _1749;
    bool _1753 = isnan(0.0);
    bool _1755 = _1751 || _1753;
    bool _1757 = !_1755;
    float _1759 = _1757 ? 0.0 : 2.0;
    float _1761 = _1737 + _1759;
    bool _1763 = _1597 >= 0.0;
    bool _1765 = isnan(_1597);
    bool _1767 = _1763 || _1765;
    bool _1769 = isnan(0.0);
    bool _1771 = _1767 || _1769;
    float _1773 = float(_1771);
    float _1775 = _1761 + _1735;
    float _1777 = 1.0 / _1419;
    float _1779 = _1775 + _1773;
    float _1781 = 1.0 / _1403;
    float _1783 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1785 = -_1379;
    float _1787 = fma(_1777, _1783, _1785);
    bool _1789 = _1787 >= 0.0;
    bool _1791 = isnan(_1787);
    bool _1793 = _1789 || _1791;
    bool _1795 = isnan(0.0);
    bool _1797 = _1793 || _1795;
    float _1799 = float(_1797);
    float _1801 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1803 = -_1379;
    float _1805 = fma(_1579, _1801, _1803);
    float _1807 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1809 = -_1379;
    float _1811 = fma(_1781, _1807, _1809);
    float _1813 = 1.0 / _1529;
    bool _1815 = _1811 >= 0.0;
    bool _1817 = isnan(_1811);
    bool _1819 = _1815 || _1817;
    bool _1821 = isnan(0.0);
    bool _1823 = _1819 || _1821;
    bool _1825 = !_1823;
    float _1827 = _1825 ? 0.0 : 2.0;
    float _1829 = _1779 + _1827;
    float _1831 = 1.0 / _1415;
    float _1833 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1835 = -_1379;
    float _1837 = fma(_1813, _1833, _1835);
    float _1839 = _1829 + _1799;
    float _1841 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1843 = -_1379;
    float _1845 = fma(_1831, _1841, _1843);
    bool _1847 = _1845 >= 0.0;
    bool _1849 = isnan(_1845);
    bool _1851 = _1847 || _1849;
    bool _1853 = isnan(0.0);
    bool _1855 = _1851 || _1853;
    float _1857 = 1.0 / _1433;
    float _1859 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1861 = -_1379;
    float _1863 = fma(_1857, _1859, _1861);
    bool _1865 = _1863 >= 0.0;
    bool _1867 = isnan(_1863);
    bool _1869 = _1865 || _1867;
    bool _1871 = isnan(0.0);
    bool _1873 = _1869 || _1871;
    bool _1875 = !_1855;
    float _1877 = _1875 ? 0.0 : 2.0;
    bool _1879 = !_1873;
    float _1881 = _1879 ? 0.0 : 2.0;
    float _1883 = _1839 + _1877;
    bool _1885 = _1805 >= 0.0;
    bool _1887 = isnan(_1805);
    bool _1889 = _1885 || _1887;
    bool _1891 = isnan(0.0);
    bool _1893 = _1889 || _1891;
    float _1895 = float(_1893);
    float _1897 = _1883 + _1881;
    float _1899 = _1897 + _1895;
    float _1901 = 1.0 / _1441;
    float _1903 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1905 = -_1379;
    float _1907 = fma(_1901, _1903, _1905);
    bool _1909 = _1907 >= 0.0;
    bool _1911 = isnan(_1907);
    bool _1913 = _1909 || _1911;
    bool _1915 = isnan(0.0);
    bool _1917 = _1913 || _1915;
    float _1919 = 1.0 / _1453;
    float _1921 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1923 = -_1379;
    float _1925 = fma(_1919, _1921, _1923);
    bool _1927 = !_1917;
    float _1929 = _1927 ? 0.0 : 2.0;
    bool _1931 = _1925 >= 0.0;
    bool _1933 = isnan(_1925);
    bool _1935 = _1931 || _1933;
    bool _1937 = isnan(0.0);
    bool _1939 = _1935 || _1937;
    float _1941 = float(_1939);
    float _1943 = _1899 + _1929;
    float _1945 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1947 = -_1379;
    float _1949 = fma(_1601, _1945, _1947);
    float _1951 = 1.0 / _1457;
    float _1953 = _1943 + _1941;
    bool _1955 = _1949 >= 0.0;
    bool _1957 = isnan(_1949);
    bool _1959 = _1955 || _1957;
    bool _1961 = isnan(0.0);
    bool _1963 = _1959 || _1961;
    float _1965 = float(_1963);
    float _1967 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1969 = -_1379;
    float _1971 = fma(_1951, _1967, _1969);
    bool _1973 = _1971 >= 0.0;
    bool _1975 = isnan(_1971);
    bool _1977 = _1973 || _1975;
    bool _1979 = isnan(0.0);
    bool _1981 = _1977 || _1979;
    float _1983 = float(_1981);
    float _1985 = _1953 + _1983;
    float _1987 = 1.0 / _1461;
    float _1989 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1991 = -_1379;
    float _1993 = fma(_1987, _1989, _1991);
    bool _1995 = _1993 >= 0.0;
    bool _1997 = isnan(_1993);
    bool _1999 = _1995 || _1997;
    bool _2001 = isnan(0.0);
    bool _2003 = _1999 || _2001;
    bool _2005 = !_2003;
    float _2007 = _2005 ? 0.0 : 2.0;
    float _2009 = _1985 + _2007;
    float _2011 = 1.0 / _1465;
    float _2013 = _2009 + _1965;
    float _2015 = 1.0 / _1503;
    float _2017 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2019 = -_1379;
    float _2021 = fma(_2011, _2017, _2019);
    bool _2023 = _2021 >= 0.0;
    bool _2025 = isnan(_2021);
    bool _2027 = _2023 || _2025;
    bool _2029 = isnan(0.0);
    bool _2031 = _2027 || _2029;
    float _2033 = 1.0 / _1481;
    float _2035 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2037 = -_1379;
    float _2039 = fma(_2015, _2035, _2037);
    float _2041 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2043 = -_1379;
    float _2045 = fma(_2033, _2041, _2043);
    bool _2047 = _2045 >= 0.0;
    bool _2049 = isnan(_2045);
    bool _2051 = _2047 || _2049;
    bool _2053 = isnan(0.0);
    bool _2055 = _2051 || _2053;
    float _2057 = 1.0 / _1491;
    float _2059 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2061 = -_1379;
    float _2063 = fma(_2057, _2059, _2061);
    bool _2065 = _2063 >= 0.0;
    bool _2067 = isnan(_2063);
    bool _2069 = _2065 || _2067;
    bool _2071 = isnan(0.0);
    bool _2073 = _2069 || _2071;
    float _2075 = 1.0 / _1499;
    bool _2077 = !_2073;
    float _2079 = _2077 ? 0.0 : 3.0;
    float _2081 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2083 = -_1379;
    float _2085 = fma(_2075, _2081, _2083);
    bool _2087 = _2085 >= 0.0;
    bool _2089 = isnan(_2085);
    bool _2091 = _2087 || _2089;
    bool _2093 = isnan(0.0);
    bool _2095 = _2091 || _2093;
    bool _2097 = !_2055;
    float _2099 = _2097 ? 0.0 : 3.0;
    bool _2101 = _2039 >= 0.0;
    bool _2103 = isnan(_2039);
    bool _2105 = _2101 || _2103;
    bool _2107 = isnan(0.0);
    bool _2109 = _2105 || _2107;
    bool _2111 = !_2095;
    float _2113 = _2111 ? 0.0 : 3.0;
    float _2115 = _2099 + _2079;
    bool _2117 = !_2031;
    float _2119 = _2117 ? 0.0 : 2.0;
    bool _2121 = !_2109;
    float _2123 = _2121 ? 0.0 : 3.0;
    float _2125 = _2115 + _2113;
    bool _2127 = _1837 >= 0.0;
    bool _2129 = isnan(_1837);
    bool _2131 = _2127 || _2129;
    bool _2133 = isnan(0.0);
    bool _2135 = _2131 || _2133;
    float _2137 = _2013 + _2119;
    float _2139 = 1.0 / _1521;
    float _2141 = _2125 + _2123;
    bool _2143 = !_2135;
    float _2145 = _2143 ? 0.0 : 3.0;
    float _2147 = _2137 * 0.02857142873108386993408203125;
    float _2149 = precise::clamp(_2147, 0.0, 1.0);
    float _2151 = 1.0 / _1509;
    float _2153 = 1.0 / _1525;
    float _2155 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2157 = -_1379;
    float _2159 = fma(_2139, _2155, _2157);
    float _2161 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2163 = -_1379;
    float _2165 = fma(_2151, _2161, _2163);
    bool _2167 = _2165 >= 0.0;
    bool _2169 = isnan(_2165);
    bool _2171 = _2167 || _2169;
    bool _2173 = isnan(0.0);
    bool _2175 = _2171 || _2173;
    bool _2177 = !_2175;
    float _2179 = _2177 ? 0.0 : 3.0;
    bool _2181 = _2159 >= 0.0;
    bool _2183 = isnan(_2159);
    bool _2185 = _2181 || _2183;
    bool _2187 = isnan(0.0);
    bool _2189 = _2185 || _2187;
    float _2191 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2193 = -_1379;
    float _2195 = fma(_2153, _2191, _2193);
    float _2197 = _2141 + _2179;
    bool _2199 = !_2189;
    float _2201 = _2199 ? 0.0 : 3.0;
    bool _2203 = _2195 >= 0.0;
    bool _2205 = isnan(_2195);
    bool _2207 = _2203 || _2205;
    bool _2209 = isnan(0.0);
    bool _2211 = _2207 || _2209;
    float _2213 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2215 = -_1379;
    float _2217 = fma(_1609, _2213, _2215);
    float _2219 = _2197 + _2201;
    bool _2221 = !_2211;
    float _2223 = _2221 ? 0.0 : 3.0;
    bool _2225 = _2217 >= 0.0;
    bool _2227 = isnan(_2217);
    bool _2229 = _2225 || _2227;
    bool _2231 = isnan(0.0);
    bool _2233 = _2229 || _2231;
    float _2235 = _2219 + _2223;
    bool _2237 = !_2233;
    float _2239 = _2237 ? 0.0 : 5.0;
    bool _2241 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2243 = isnan(0.5);
    bool _2245 = _2241 || _2243;
    bool _2247 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2249 = _2245 || _2247;
    float _2251 = _2235 + _2145;
    float _2253 = _2251 + _2239;
    float _2255 = _2253 * 0.14285714924335479736328125;
    float _2257 = precise::clamp(_2255, 0.0, 1.0);
    float _2259 = _2149 * _2257;
    float _2261 = _2149;
    float _2263 = _2257;
    if (_2249)
    {
        _2261 = 1.0;
    }
    float _2265 = _2261;
    float _2267 = _2265;
    if (_2249)
    {
        _2263 = 1.0;
    }
    float _2269 = _2263;
    float _2271 = _2269;
    if (!_2249)
    {
        float _2273 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2275 = _2273 * 0.15915493667125701904296875;
        float _2277 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2279 = _2275 * 6.283185482025146484375;
        float _2281 = cos(_2279);
        float _2283 = _2277 * 0.15915493667125701904296875;
        float _2285 = _2275 * 6.283185482025146484375;
        float _2287 = sin(_2285);
        float _2289 = 1.0 / _2281;
        float _2291 = _2283 * 6.283185482025146484375;
        float _2293 = cos(_2291);
        float _2295 = _2287 * _2289;
        float _2297 = _2283 * 6.283185482025146484375;
        float _2299 = sin(_2297);
        float _2301 = _2293 * _2295;
        float _2303 = 1.0 / _2301;
        float _2305 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2307 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2305;
        float _2309 = 1.0 / _2307;
        float _2311 = _2299 * _2303;
        float _2313 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2315 = fma(_1379, _2311, _2313);
        float _2317 = _2315 * _2309;
        float _2319 = precise::clamp(_2317, 0.0, 1.0);
        _2271 = _2319;
    }
    float _2321 = _2271;
    if (!_2249)
    {
        float _2323 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2325 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2327 = _2323 * 0.15915493667125701904296875;
        float _2329 = _2325 * 0.15915493667125701904296875;
        float _2331 = _2327 * 6.283185482025146484375;
        float _2333 = cos(_2331);
        float _2335 = _2327 * 6.283185482025146484375;
        float _2337 = sin(_2335);
        float _2339 = 1.0 / _2333;
        float _2341 = _2329 * 6.283185482025146484375;
        float _2343 = cos(_2341);
        float _2345 = _2337 * _2339;
        float _2347 = _2329 * 6.283185482025146484375;
        float _2349 = sin(_2347);
        float _2351 = _2343 * _2345;
        float _2353 = 1.0 / _2351;
        float _2355 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2357 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2355;
        float _2359 = 1.0 / _2357;
        float _2361 = _2349 * _2353;
        float _2363 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2365 = fma(_1379, _2361, _2363);
        float _2367 = _2365 * _2359;
        float _2369 = precise::clamp(_2367, 0.0, 1.0);
        float _2371 = -_2369;
        float _2373 = _2371 + 1.0;
        _2267 = _2373;
    }
    float _2375 = _2267;
    float _2377 = _2259 * _2321;
    bool _2379 = _2321 > 0.0;
    bool _2381 = isnan(_2321);
    bool _2383 = _2379 || _2381;
    bool _2385 = isnan(0.0);
    bool _2387 = _2383 || _2385;
    float _2389 = _2377 * _2375;
    bool _2391 = _2375 <= 0.0;
    bool _2393 = !_2387;
    bool _2395 = _2391 || _2393;
    float _2397 = _2389 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2399 = _2397 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_38.x = _2399;
    if (!_2395)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2401 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_38.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2401;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

