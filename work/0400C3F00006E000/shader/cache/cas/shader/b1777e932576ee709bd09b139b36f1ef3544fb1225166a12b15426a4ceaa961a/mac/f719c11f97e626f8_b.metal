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
    float4 m_64 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_86 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 m_72 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_68 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_84 [[user(locn9)]];
    float4 m_80 [[user(locn10)]];
    float4 m_82 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_76 [[attribute(0)]];
    float4 m_70 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_60 [[attribute(4)]];
    float4 m_62 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2466 = false;
    bool _1579 = false;
    bool _299 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_48.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    float _113 = as_type<float>(_105);
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _111;
    if (!_109)
    {
        out.m_51.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2772 = as_type<float>(_121);
        out.gl_Position.z = _2772;
    }
    if (!_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_53.w;
    float _127 = float(_105);
    float _129 = 1.0 / _127;
    float _131 = -_125;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_125);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = _133 * _129;
    bool _147 = _133 >= _127;
    bool _149 = !_143;
    bool _151 = _147 || _149;
    out.m_55.x = _145;
    float _153 = _145;
    float _155 = _133;
    if (_151)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _113;
    if (_151)
    {
        out.m_51.x = 0.0;
    }
    if (_151)
    {
        float _159 = _157 * 5.0;
        _123 = as_type<int>(_159);
    }
    int _161 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2844 = as_type<float>(_161);
        out.gl_Position.z = _2844;
    }
    if (_151)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _167 = as_type<int>(_163) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_163) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_165;
    float _201;
    if (!_183)
    {
        float _185 = in.m_60.x;
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        _201 = _145;
    }
    _203 = false;
    float _205 = _201;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _209 = _205 + _207;
    bool _211 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _213 = isnan(_205);
    bool _215 = _211 || _213;
    bool _217 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _219 = _215 || _217;
    float _221 = float(_219);
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _223;
    float _227 = -_221;
    float _229 = _227 + 1.0;
    bool _231 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _233 = isnan(_205);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _239 = _235 || _237;
    float _241 = float(_239);
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _243;
    bool _247 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _249 = 1.0 / _225;
    float _251 = _241 * _229;
    float _253 = -_241;
    float _255 = _253 + 1.0;
    float _257 = _209 * _249;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _259;
    float _263 = fma(_245, _257, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _265 = fma(_261, _257, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _267 = _263 * _251;
    float _269 = _265 * _251;
    float _271 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[143].x, _267);
    float _273 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[143].y, _269);
    float _275 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[144].x, _271);
    float _277 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[144].y, _273);
    bool _279 = !_247;
    float _297;
    if (!_279)
    {
        float _281 = in.m_60.x;
        float _283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _285 = _281 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _289 = _287 * _283;
        float _291 = floor(_289);
        float _293 = -_291;
        float _295 = _289 + _293;
        _297 = _295;
        _299 = true;
    }
    else
    {
        _297 = _145;
    }
    _299 = false;
    float _301 = _297;
    bool _303 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _305 = isnan(_301);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _319 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _321 = isnan(_301);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _337 = _301 + _335;
    float _339 = -_313;
    float _341 = _339 + 1.0;
    bool _343 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _345 = 1.0 / _317;
    float _347 = _329 * _341;
    float _349 = -_329;
    float _351 = _349 + 1.0;
    float _353 = _333 * _345;
    float _355 = fma(_353, _337, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _357 = _355 * _347;
    float _359 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[115].x, _357);
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _367 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[116].x, _359);
    float _369 = _361 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _371 = _363 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _373 = _365 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _375 = _367 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _377 = in.m_62.x;
    float _379 = in.m_62.y;
    out.m_64.x = _369;
    out.m_64.y = _371;
    out.m_64.z = _373;
    out.m_64.w = _375;
    float _381 = _277 * _379;
    float _383 = _275 * _377;
    bool _385 = !_343;
    if (!_385)
    {
        float _387 = in.m_60.x;
        float _389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _391 = _387 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _393 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[11].w, _133);
        float _395 = _393 * _389;
        float _397 = floor(_395);
        float _399 = -_397;
        float _401 = _395 + _399;
        _153 = _401;
    }
    float _403 = _153;
    float _405 = in.m_60.x;
    float _407 = in.m_60.y;
    float _409 = in.m_60.z;
    float _411 = in.m_60.w;
    float _413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _415 = in.m_48.x;
    float _417 = in.m_48.y;
    float _419 = in.m_48.z;
    int _421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _423 = _421 != 0;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _431 = _429 != 0;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _437 = _435 != 0;
    float _439 = 1.0 / _427;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _445 = _411 > 0.5;
    float _447 = _405 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _449 = _407 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _453 = _451 != 0;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _457 = _455 != 0;
    float _459 = -_433;
    float _461 = fma(_447, 2.0, _459);
    float _463 = -_181;
    int _465 = _445 ? as_type<int>(_463) : as_type<int>(_181);
    float _467 = _409 * 2.0;
    bool _469 = _405 > 0.5;
    float _471 = _417 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _473 = fma(_449, -2.0, _441);
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _477 = -_177;
    int _479 = _469 ? as_type<int>(_477) : as_type<int>(_177);
    float _481 = floor(_467);
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _485 = _483 != 0;
    float _487 = _417 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _489 = _417 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _491 = !_423;
    float _493 = _491 ? _177 : as_type<float>(_479);
    float _495 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].x, _471);
    bool _497 = _407 > 0.5;
    float _499 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].x, _487);
    float _501 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].x, _489);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _503;
    float _507 = _407 + _409;
    float _509 = _405 * 2.0;
    float _511 = -_181;
    int _513 = _497 ? as_type<int>(_511) : as_type<int>(_181);
    float _515 = _505 * _439;
    float _517 = _507 + (-1.0);
    float _519 = floor(_509);
    bool _521 = !_431;
    float _523 = _521 ? _181 : as_type<float>(_513);
    float _525 = _407 + _405;
    float _527 = -_177;
    float _529 = _497 ? _527 : _177;
    float _531 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _533 = _525 + (-1.0);
    bool _535 = _409 > 0.5;
    float _537 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[4].z, _499);
    bool _539 = !_453;
    float _541 = _539 ? _177 : _529;
    float _543 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _545 = _481 > 0.0;
    float _547 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[5].z, _495);
    bool _549 = _481 >= 0.0;
    bool _551 = isnan(_481);
    bool _553 = _549 || _551;
    bool _555 = isnan(0.0);
    bool _557 = _553 || _555;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _561 = _403 + _559;
    float _563 = _529;
    float _565 = _475;
    if (!_485)
    {
        _563 = _409;
    }
    float _567 = _563;
    float _569 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[6].z, _501);
    float _571 = _567;
    if (_485)
    {
        _571 = _407;
    }
    float _573 = _571;
    float _575 = fma(_515, _561, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _577 = -_181;
    int _579 = _535 ? as_type<int>(_577) : as_type<int>(_181);
    float _581 = _413 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _583 = -_177;
    int _585 = _535 ? as_type<int>(_583) : as_type<int>(_177);
    float _587 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[83].w, _475);
    bool _589 = !_457;
    float _591 = _589 ? _181 : as_type<float>(_579);
    float _593 = -_133;
    float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[76].x, _461);
    bool _597 = !_437;
    float _599 = _597 ? _177 : as_type<float>(_585);
    float _601 = _493 + 0.5;
    bool _603 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _605 = isnan(_403);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _617 = _519 > 0.0;
    float _619 = fma(_581, _601, _595);
    bool _621 = _519 >= 0.0;
    bool _623 = isnan(_519);
    bool _625 = _621 || _623;
    bool _627 = isnan(0.0);
    bool _629 = _625 || _627;
    float _631 = _443 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _633 = _557 ? 0 : 1;
    float _635 = -_613;
    float _637 = _635 + 1.0;
    bool _639 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _641 = isnan(_403);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _473);
    int _653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _655 = _653 != 0;
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _659 = _657 != 0;
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _663 = _661 != 0;
    float _665 = _523 + (-0.5);
    float _667 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _669 = _519;
    if (!_485)
    {
        _565 = _407;
    }
    float _671 = _565;
    float _673 = _649 * _637;
    float _675 = _671;
    if (!_485)
    {
        _669 = _409;
    }
    float _677 = _669;
    float _679 = -_631;
    float _681 = -_651;
    float _683 = fma(_679, _665, _681);
    float _685 = _677;
    if (_485)
    {
        _675 = _405;
    }
    float _687 = _675;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_485)
    {
        _685 = _407;
    }
    float _691 = _685;
    float _693 = _575 * _673;
    float _695 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[83].z, _689);
    float _697 = _687 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _701 = _699 != 0;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _705 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _707 = _691 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _711 = -_649;
    float _713 = _711 + 1.0;
    int _715 = ~_633;
    int _717 = _715 + 1;
    int _719 = _717 + 1;
    float _721 = -_703;
    float _723 = fma(_697, 2.0, _721);
    int _725 = _719;
    if (!_545)
    {
        int _727 = ~_633;
        int _729 = _727 + 1;
        _725 = _729;
    }
    int _731 = _725;
    float _733 = _615 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _735 = !_701;
    float _737 = _735 ? _181 : as_type<float>(_465);
    float _739 = fma(_707, -2.0, _709);
    float _741 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[131].x, _693);
    float _743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _745 = -_591;
    float _747 = _745 + 0.5;
    float _749 = _541 + 0.5;
    float _751 = _599 + 0.5;
    float _753 = -_133;
    float _755 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[81].x, _723);
    float _757 = _667 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _759 = _737 + (-0.5);
    float _761 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _739);
    float _763 = _747 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _765 = fma(_733, _751, _755);
    float _767 = _749 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _769 = -_757;
    float _771 = -_761;
    float _773 = fma(_769, _759, _771);
    float _775 = _763 * _705;
    float _777 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[132].x, _741);
    float _779 = _547 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _785 = _767 * _743;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _791 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[78].z, _781);
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _795 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[78].w, _783);
    float _797 = _537 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _799 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _801 = _779 + _799;
    float _803 = _787 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _805 = _789 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _807 = _793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _809 = _777 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _811 = _569 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _813 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _815 = _797 + _813;
    float _817 = _801 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _819 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _795);
    float _821 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _823 = log2(_821);
    float _825 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _827 = _811 + _825;
    float _829 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[28].x, _817);
    float _831 = -_819;
    float _833 = _831 + 1.0;
    out.m_66.x = _803;
    out.m_66.y = _805;
    out.m_66.z = _807;
    out.m_66.w = _809;
    float _835 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _695);
    float _837 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[28].z, _829);
    float _839 = fma(_523, _833, _683);
    float _841 = _801 * _801;
    out.m_68.x = _785;
    out.m_68.y = _775;
    float _843 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _791);
    bool _845 = _837 >= 0.0;
    float _847 = fma(_815, _815, _841);
    float _849 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _587);
    float _851 = -_843;
    float _853 = _851 + 1.0;
    bool _855 = !_659;
    int _857 = _855 ? 0 : 1;
    float _859 = _823 * _133;
    float _861 = fma(_827, _827, _847);
    bool _863 = !_655;
    int _865 = _863 ? 0 : 1;
    float _867 = -_835;
    float _869 = _867 + 1.0;
    float _871 = float(_731);
    float _873 = -_853;
    float _875 = fma(_493, _873, _619);
    int _877 = abs(_865);
    float _879 = -_869;
    float _881 = fma(_599, _879, _765);
    float _883 = exp2(_859);
    float _885 = float(_877);
    float _887 = _407 * 2.0;
    bool _889 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _891 = isnan(1.0);
    bool _893 = _889 || _891;
    bool _895 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _897 = _893 || _895;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _901 = 1.0 + _899;
    float _903 = _847;
    float _905 = _779;
    if (_845)
    {
        _903 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _907 = _903;
    float _909 = _885 * _871;
    float _911 = -_849;
    float _913 = _911 + 1.0;
    float _915 = in.m_70.x;
    float _917 = in.m_70.y;
    float _919 = in.m_70.z;
    float _921 = rsqrt(_861);
    float _923 = fma(_737, _913, _773);
    int _925 = as_type<int>(_907);
    if (_845)
    {
        float _927 = _907 * 5.0;
        _925 = as_type<int>(_927);
    }
    int _929 = _925;
    if (_845)
    {
        out.m_51.x = 0.0;
    }
    bool _931 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _933 = isnan(0.0);
    bool _935 = _931 || _933;
    bool _937 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _939 = _935 || _937;
    float _941 = -_883;
    float _943 = _941 + 1.0;
    float _945 = floor(_887);
    out.m_72.x = _875;
    out.m_72.y = _839;
    out.m_72.z = _881;
    out.m_72.w = _923;
    bool _947 = !_663;
    int _949 = _947 ? 0 : 1;
    if (_845)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4154 = as_type<float>(_929);
        out.gl_Position.z = _4154;
    }
    float _951 = 1.0 / _901;
    float _953 = _801 * _921;
    float _955 = _815 * _921;
    if (_845)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _957 = -_953;
    float _959 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[18].w, _779);
    float _961 = _827 * _921;
    float _963 = -_955;
    float _965 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[18].w, _797);
    int _967 = _629 ? 0 : 1;
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _971 = _959 + _969;
    float _973 = -_961;
    float _975 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[18].w, _811);
    float _977 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _979 = _965 + _977;
    float _981 = _909 * (-2.0);
    float _983 = _971 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _985 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _987 = _975 + _985;
    int _989 = ~_967;
    int _991 = _989 + 1;
    int _993 = _991 + 1;
    float _995 = fma(_543, _981, _543);
    float _997 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[28].x, _983);
    int _999 = _993;
    float _1001 = _961;
    float _1003 = _971;
    if (!_617)
    {
        int _1005 = ~_967;
        int _1007 = _1005 + 1;
        _999 = _1007;
    }
    int _1009 = _999;
    float _1011 = -_953;
    float _1013 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[18].w, _801);
    int _1015 = abs(_857);
    float _1017 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[28].z, _997);
    float _1019 = _939 ? _943 : 0.0;
    float _1021 = fma(_981, _915, _915);
    float _1023 = _405 + (-0.5);
    bool _1025 = _945 > 0.0;
    float _1027 = -_955;
    float _1029 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[18].w, _815);
    bool _1031 = _1017 >= 0.0;
    float _1033 = _1013 * _1013;
    float _1035 = float(_1009);
    if (_897)
    {
        float _1037 = _1019 * _951;
        _155 = _1037;
    }
    float _1039 = _155;
    float _1041 = float(_1015);
    float _1043 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1021);
    bool _1045 = _945 >= 0.0;
    bool _1047 = isnan(_945);
    bool _1049 = _1045 || _1047;
    bool _1051 = isnan(0.0);
    bool _1053 = _1049 || _1051;
    float _1055 = fma(_1029, _1029, _1033);
    float _1057 = -_961;
    float _1059 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[18].w, _827);
    float _1061 = _1041 * _1035;
    float _1063 = fma(_995, _1039, _1043);
    int _1065 = _1053 ? 0 : 1;
    float _1067 = fma(_1059, _1059, _1055);
    float _1069 = _1061 * (-2.0);
    float _1071 = _1063 * 0.15915493667125701904296875;
    int _1073 = ~_1065;
    int _1075 = _1073 + 1;
    int _1077 = _1075 + 1;
    int _1079 = _1077;
    float _1081 = _1055;
    if (!_1025)
    {
        int _1083 = ~_1065;
        int _1085 = _1083 + 1;
        _1079 = _1085;
    }
    int _1087 = _1079;
    float _1089 = fma(_531, _1069, _531);
    if (_1031)
    {
        _1081 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1091 = _1081;
    float _1093 = sqrt(_1067);
    int _1095 = as_type<int>(_1091);
    if (_1031)
    {
        out.m_51.x = 0.0;
    }
    float _1097 = fma(_1069, _917, _917);
    float _1099 = _407 + (-0.5);
    if (_1031)
    {
        float _1101 = _1091 * 5.0;
        _1095 = as_type<int>(_1101);
    }
    int _1103 = _1095;
    int _1105 = abs(_949);
    float _1107 = _1071 * 6.283185482025146484375;
    float _1109 = sin(_1107);
    if (_1031)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4404 = as_type<float>(_1103);
        out.gl_Position.z = _4404;
    }
    if (_1031)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1111 = -_779;
    float _1113 = _1111 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1115 = -_797;
    float _1117 = _1115 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1119 = -_811;
    float _1121 = _1119 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1123 = _1113 * _1113;
    float _1125 = float(_1087);
    float _1127 = _409 + _405;
    float _1129 = float(_1105);
    float _1131 = fma(_1117, _1117, _1123);
    float _1133 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1097);
    float _1135 = _1127 + (-1.0);
    float _1137 = _409 + (-0.5);
    float _1139 = fma(_1121, _1121, _1131);
    float _1141 = _1129 * _1125;
    float _1143 = fma(_1089, _1039, _1133);
    float _1145 = _1071 * 6.283185482025146484375;
    float _1147 = cos(_1145);
    float _1149 = _1141 * (-2.0);
    float _1151 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1153 = _1143 * 0.15915493667125701904296875;
    float _1155 = fma(_1149, _919, _919);
    float _1157 = fma(_1151, _1149, _1151);
    float _1159 = rsqrt(_1139);
    float _1161 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1155);
    float _1163 = fma(_1157, _1039, _1161);
    float _1165 = _1153 * 6.283185482025146484375;
    float _1167 = sin(_1165);
    float _1169 = _1163 * 0.15915493667125701904296875;
    float _1171 = _1117 * _1159;
    float _1173 = _1121 * _1159;
    float _1175 = _1113 * _1159;
    float _1177 = _1153 * 6.283185482025146484375;
    float _1179 = cos(_1177);
    float _1181 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1183 = _1171 * _1181;
    float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1187 = _1173 * _1185;
    float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1191 = _1175 * _1189;
    float _1193 = _381 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1195 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1197 = -_1183;
    float _1199 = fma(_1173, _1195, _1197);
    float _1201 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1203 = -_1187;
    float _1205 = fma(_1175, _1201, _1203);
    float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1209 = -_1191;
    float _1211 = fma(_1171, _1207, _1209);
    float _1213 = _1169 * 6.283185482025146484375;
    float _1215 = sin(_1213);
    float _1217 = _1199 * _1199;
    float _1219 = _1109 * _1167;
    float _1221 = _1147 * _1167;
    float _1223 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _1225 = fma(_1205, _1205, _1217);
    float _1227 = _921 * _1093;
    float _1229 = _1169 * 6.283185482025146484375;
    float _1231 = cos(_1229);
    float _1233 = fma(_1211, _1211, _1225);
    float _1235 = _1147 * _1179;
    float _1237 = _1109 * _1179;
    float _1239 = rsqrt(_1233);
    float _1241 = fma(_1215, _1235, _1219);
    float _1243 = fma(_1215, _1219, _1235);
    float _1245 = _1147 * _1231;
    float _1247 = _1179 * _1231;
    float _1249 = _1109 * _1231;
    float _1251 = _1167 * _1231;
    float _1253 = _383 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1255 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _1257 = _1227 * _1193;
    float _1259 = _1227 * _1253;
    float _1261 = _1205 * _1239;
    float _1263 = _1255 * _1257;
    float _1265 = _1199 * _1239;
    float _1267 = _1223 * _1259;
    float _1269 = -_1221;
    float _1271 = fma(_1215, _1237, _1269);
    float _1273 = _1245 * _1263;
    float _1275 = -_1237;
    float _1277 = fma(_1215, _1221, _1275);
    float _1279 = _1211 * _1239;
    float _1281 = _1227 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1283 = _1281 * 0.5;
    float _1285 = -_1263;
    float _1287 = _1215 * _1285;
    float _1289 = fma(_1241, _1267, _1273);
    float _1291 = _1173 * _1265;
    float _1293 = _1175 * _1261;
    float _1295 = _1249 * _1263;
    float _1297 = fma(_1247, _1267, _1287);
    float _1299 = fma(_1277, _1283, _1289);
    float _1301 = -_1291;
    float _1303 = fma(_1175, _1279, _1301);
    float _1305 = -_1293;
    float _1307 = fma(_1171, _1265, _1305);
    float _1309 = fma(_1271, _1267, _1295);
    float _1311 = fma(_1251, _1283, _1297);
    float _1313 = _1303 * _1299;
    float _1315 = _1307 * _1299;
    float _1317 = fma(_1243, _1283, _1309);
    float _1319 = _1245 * _1303;
    float _1321 = fma(_1261, _1311, _1313);
    float _1323 = fma(_1279, _1311, _1315);
    float _1325 = _1171 * _1279;
    float _1327 = _1245 * _1307;
    float _1329 = fma(_1171, _1317, _1321);
    float _1331 = fma(_1173, _1317, _1323);
    float _1333 = -_1325;
    float _1335 = fma(_1173, _1261, _1333);
    float _1337 = _1241 * _1303;
    float _1339 = _797 + _1329;
    float _1341 = _811 + _1331;
    float _1343 = _1335 * _1299;
    float _1345 = _1245 * _1335;
    float _1347 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1349 = _1339 + _1347;
    float _1351 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1353 = _1341 + _1351;
    float _1355 = _1241 * _1335;
    float _1357 = _1241 * _1307;
    float _1359 = _1349 * _1349;
    float _1361 = _1353 * _1353;
    float _1363 = _1277 * _1307;
    float _1365 = fma(_1265, _1311, _1343);
    float _1367 = _1277 * _1303;
    float _1369 = _1359 + _1361;
    float _1371 = -_1215;
    float _1373 = fma(_1371, _1265, _1345);
    float _1375 = fma(_1175, _1317, _1365);
    float _1377 = _1277 * _1335;
    float _1379 = sqrt(_1369);
    float _1381 = -_1215;
    float _1383 = fma(_1381, _1261, _1319);
    float _1385 = -_1215;
    float _1387 = fma(_1385, _1279, _1327);
    float _1389 = _779 + _1375;
    float _1391 = fma(_1247, _1261, _1337);
    float _1393 = fma(_1247, _1265, _1355);
    float _1395 = fma(_1247, _1279, _1357);
    float _1397 = fma(_1251, _1261, _1367);
    float _1399 = fma(_1251, _1265, _1377);
    float _1401 = fma(_1249, _1171, _1383);
    float _1403 = fma(_1249, _1175, _1373);
    float _1405 = fma(_1251, _1279, _1363);
    float _1407 = fma(_1249, _1173, _1387);
    bool _1409 = _1379 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1411 = _1261;
    float _1413 = _1359;
    float _1415 = _1361;
    float _1417 = _1341;
    float _1419 = _1339;
    if (!_1409)
    {
        _1411 = _1359;
    }
    float _1421 = _1411;
    float _1423 = _1421;
    if (!_1409)
    {
        _1413 = _1389;
    }
    float _1425 = _1413;
    bool _1427 = !_1409;
    float _1429 = _1425;
    if (!_1427)
    {
        float _1431 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1433 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1435 = _1379 + _1433;
        float _1437 = rsqrt(_1369);
        float _1439 = _1435 * _1431;
        float _1441 = _1389 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1443 = _1439 * 0.15915493667125701904296875;
        float _1445 = _1443 * 6.283185482025146484375;
        float _1447 = sin(_1445);
        float _1449 = _1443 * 6.283185482025146484375;
        float _1451 = cos(_1449);
        float _1453 = fma(_1447, _1441, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1455 = _1437 * _1453;
        float _1457 = fma(_1349, _1455, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1459 = _1451 + (-1.0);
        float _1461 = fma(_1353, _1455, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1463 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1465 = _1457 + _1463;
        float _1467 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1469 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1471 = _1461 + _1469;
        float _1473 = _1465 * _1465;
        float _1475 = fma(_1389, _1451, _1467);
        float _1477 = _1471 * _1471;
        _1429 = _1475;
        _1423 = _1473;
        _1415 = _1477;
        _1417 = _1461;
        _1419 = _1457;
    }
    float _1479 = _1429;
    float _1481 = _1423;
    float _1483 = _1415;
    float _1485 = _1417;
    float _1487 = _1419;
    float _1489 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1491 = _1479 + _1489;
    float _1493 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1495 = fma(_1271, _1171, _1391);
    float _1497 = fma(_1243, _1171, _1397);
    float _1499 = fma(_1491, _1491, _1481);
    float _1501 = fma(_1243, _1175, _1399);
    float _1503 = fma(_1243, _1173, _1405);
    float _1505 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1507 = _1499 + _1483;
    float _1509 = _1493 * _1401;
    float _1511 = fma(_1271, _1175, _1393);
    float _1513 = fma(_1271, _1173, _1395);
    float _1515 = _1493 * _1403;
    float _1517 = _1493 * _1407;
    float _1519 = sqrt(_1507);
    float _1521 = fma(_1505, _1495, _1509);
    float _1523 = fma(_1505, _1511, _1515);
    float _1525 = fma(_1505, _1513, _1517);
    float _1527 = _1497 + _1521;
    float _1529 = _1501 + _1523;
    float _1531 = _1503 + _1525;
    out.m_74.x = _1527;
    out.m_74.y = _1529;
    out.m_74.z = _1531;
    bool _1533 = _1519 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1535 = isnan(_1519);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1541 = _1537 || _1539;
    float _1543 = _1515;
    if (!_1541)
    {
        _1543 = 1.0;
    }
    float _1545 = _1543;
    bool _1547 = !_1541;
    float _1549 = _1545;
    if (!_1547)
    {
        bool _1551 = _1519 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1553 = isnan(_1519);
        bool _1555 = _1551 || _1553;
        bool _1557 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1559 = _1555 || _1557;
        if (!_1559)
        {
            float _1561 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1563 = _1519 + _1561;
            float _1565 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1567 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1565;
            float _1569 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1571 = _1569 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1573 = 1.0 / _1567;
            float _1575 = _1563 * _1573;
            float _1577 = fma(_1575, _1571, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1549 = _1577;
            _1579 = true;
        }
        else
        {
            bool _1581 = _1519 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1583 = isnan(_1519);
            bool _1585 = _1581 || _1583;
            bool _1587 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1589 = _1585 || _1587;
            if (!_1589)
            {
                float _1591 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1593 = _1519 + _1591;
                float _1595 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1597 = _1595 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1599 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1601 = _1599 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1603 = 1.0 / _1597;
                float _1605 = _1593 * _1603;
                float _1607 = fma(_1605, _1601, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1549 = _1607;
                _1579 = true;
            }
            else
            {
                _1549 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1579 = false;
    float _1609 = _1549;
    float _1611 = _959 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1613 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1615 = _1479 + _1613;
    float _1617 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1611);
    float _1619 = _959 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1621 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1623 = _1485 + _1621;
    float _1625 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1617);
    bool _1627 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1629 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1631 = _1627 || _1629;
    bool _1633 = isnan(0.5);
    bool _1635 = _1631 || _1633;
    float _1637 = fma(_1615, _1609, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _1639 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1641 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1643 = _1639 || _1641;
    bool _1645 = isnan(0.5);
    bool _1647 = _1643 || _1645;
    float _1649 = _1625 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1651 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1619);
    float _1653 = fma(_1623, _1609, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1655 = 1.0 / _1649;
    float _1657 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1651);
    float _1659 = -_961;
    float _1661 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1653);
    float _1663 = _1657 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1665 = _1663 + _1649;
    float _1667 = _1649;
    float _1669 = _1661;
    if (_1647)
    {
        _1667 = 1.0;
    }
    float _1671 = _1667;
    float _1673 = _1665 * _1655;
    float _1675 = _1673 * 0.5;
    float _1677 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1679 = _1487 + _1677;
    float _1681 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1683 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1681);
    float _1685 = fma(_1679, _1609, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1687 = -_953;
    float _1689 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1637);
    float _1691 = 1.0 / _1683;
    float _1693 = -_955;
    float _1695 = fma(_1693, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1685);
    float _1697 = _1689;
    float _1699 = _1695;
    float _1701 = _1671;
    if (!_1635)
    {
        float _1703 = _971 * _971;
        float _1705 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1707 = -_811;
        float _1709 = _1707 + _1653;
        float _1711 = -_779;
        float _1713 = _1711 + _1637;
        float _1715 = fma(_979, _979, _1703);
        float _1717 = fma(_987, _987, _1715);
        float _1719 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1721 = sqrt(_1717);
        float _1723 = 1.0 / _1227;
        float _1725 = _1719 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1727 = precise::min(_1721, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1729 = _1727 * _1705;
        float _1731 = -_797;
        float _1733 = _1731 + _1685;
        float _1735 = _1729 * _1723;
        float _1737 = _1725 * _1735;
        float _1739 = _1709 * _1735;
        float _1741 = fma(_1713, _1737, _959);
        float _1743 = fma(_1733, _1737, _965);
        float _1745 = fma(_1725, _1739, _975);
        _1001 = _1735;
        _1697 = _1741;
        _1699 = _1743;
        _1669 = _1745;
        _905 = _1737;
    }
    float _1747 = _1001;
    float _1749 = _1697;
    float _1751 = _1699;
    float _1753 = _1669;
    float _1755 = _905;
    float _1757 = _1755;
    float _1759 = _1747;
    if (_1647)
    {
        _1757 = 1.0;
    }
    float _1761 = _1757;
    float _1763 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1765 = _1691 * _1763;
    float _1767 = _1761;
    if (!_1647)
    {
        float _1769 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1771 = _1769 * 0.15915493667125701904296875;
        float _1773 = _1771 * 6.283185482025146484375;
        float _1775 = cos(_1773);
        float _1777 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1779 = _1777 * 0.15915493667125701904296875;
        float _1781 = _1771 * 6.283185482025146484375;
        float _1783 = sin(_1781);
        float _1785 = 1.0 / _1775;
        float _1787 = _1779 * 6.283185482025146484375;
        float _1789 = cos(_1787);
        float _1791 = _1783 * _1785;
        float _1793 = _1779 * 6.283185482025146484375;
        float _1795 = sin(_1793);
        float _1797 = _1789 * _1791;
        float _1799 = 1.0 / _1797;
        float _1801 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1803 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1801;
        float _1805 = 1.0 / _1803;
        float _1807 = _1795 * _1799;
        float _1809 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1811 = fma(_1765, _1807, _1809);
        float _1813 = _1811 * _1805;
        float _1815 = precise::clamp(_1813, 0.0, 1.0);
        _1759 = _1779;
        _1701 = _1815;
    }
    float _1817 = _1759;
    float _1819 = _1701;
    float _1821 = _1817;
    if (!_1647)
    {
        float _1823 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1825 = _1823 * 0.15915493667125701904296875;
        float _1827 = _1825 * 6.283185482025146484375;
        float _1829 = cos(_1827);
        float _1831 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1833 = _1831 * 0.15915493667125701904296875;
        float _1835 = _1825 * 6.283185482025146484375;
        float _1837 = sin(_1835);
        float _1839 = 1.0 / _1829;
        float _1841 = _1833 * 6.283185482025146484375;
        float _1843 = cos(_1841);
        float _1845 = _1837 * _1839;
        float _1847 = _1833 * 6.283185482025146484375;
        float _1849 = sin(_1847);
        float _1851 = _1843 * _1845;
        float _1853 = 1.0 / _1851;
        float _1855 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1857 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1855;
        float _1859 = 1.0 / _1857;
        float _1861 = _1849 * _1853;
        float _1863 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1865 = fma(_1765, _1861, _1863);
        float _1867 = _1865 * _1859;
        float _1869 = precise::clamp(_1867, 0.0, 1.0);
        float _1871 = -_1869;
        float _1873 = _1871 + 1.0;
        _1821 = _1853;
        _1767 = _1873;
    }
    float _1875 = _1821;
    float _1877 = _1767;
    float _1879 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1881 = _1749 + _1879;
    float _1883 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1885 = _1751 + _1883;
    float _1887 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1889 = _1753 + _1887;
    float _1891 = _1881 * _1881;
    float _1893 = fma(_1885, _1885, _1891);
    float _1895 = fma(_1889, _1889, _1893);
    float _1897 = rsqrt(_1895);
    float _1899 = _1897 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1901 = _1885 * _1899;
    float _1903 = _1889 * _1899;
    float _1905 = _1901 * _1901;
    float _1907 = _1903 * _1903;
    float _1909 = _1905 + _1907;
    float _1911 = sqrt(_1909);
    bool _1913 = _1911 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1915 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1917 = _1911 + _1915;
    float _1919 = _1897;
    float _1921 = _1909;
    float _1923 = _1917;
    float _1925 = _1875;
    float _1927 = _1881;
    float _1929 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1913)
    {
        float _1931 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1919 = _1931;
    }
    float _1933 = _1919;
    if (_1913)
    {
        float _1935 = rsqrt(_1909);
        _1921 = _1935;
    }
    float _1937 = _1921;
    float _1939 = _1937;
    if (_1913)
    {
        float _1941 = _1917 * _1933;
        _1923 = _1941;
    }
    float _1943 = _1923;
    if (_1913)
    {
        float _1945 = _1943 * 0.15915493667125701904296875;
        _1003 = _1945;
    }
    float _1947 = _1003;
    float _1949 = _1933;
    float _1951 = _1947;
    if (_1913)
    {
        float _1953 = _1947 * 6.283185482025146484375;
        float _1955 = sin(_1953);
        _1949 = _1955;
    }
    float _1957 = _1949;
    float _1959 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1961 = precise::max(0.0, _1959);
    float _1963 = _1889;
    float _1965 = _1961;
    if (_1913)
    {
        float _1967 = _1947 * 6.283185482025146484375;
        float _1969 = cos(_1967);
        _1963 = _1969;
    }
    float _1971 = _1963;
    float _1973 = -_1899;
    float _1975 = -_1961;
    float _1977 = fma(_1881, _1973, _1975);
    if (_1913)
    {
        float _1979 = _1977 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1965 = _1979;
    }
    float _1981 = _1965;
    if (!_1913)
    {
        _1951 = _1901;
    }
    float _1983 = _1951;
    float _1985 = _1957;
    float _1987 = _1983;
    if (_1913)
    {
        float _1989 = fma(_1957, _1981, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1925 = _1989;
    }
    float _1991 = _1925;
    float _1993 = fma(_965, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1995 = _1991;
    if (!_1913)
    {
        _1985 = _1903;
    }
    float _1997 = _1985;
    float _1999 = sqrt(_1895);
    float _2001 = _1997;
    float _2003 = _1971;
    if (_1913)
    {
        float _2005 = _1971 + (-1.0);
        _1927 = _2005;
    }
    float _2007 = _1927;
    float _2009 = _2007;
    if (_1913)
    {
        float _2011 = _1937 * _1991;
        _1929 = _2011;
    }
    float _2013 = _1929;
    if (!_1913)
    {
        _1995 = _1977;
    }
    float _2015 = _1995;
    float _2017 = _2015;
    if (_1913)
    {
        float _2019 = _2007 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2009 = _2019;
    }
    float _2021 = _2009;
    if (_1913)
    {
        float _2023 = _1901 * _2013;
        _1987 = _2023;
    }
    float _2025 = _1987;
    if (!_1913)
    {
        _1939 = _1905;
    }
    float _2027 = _1939;
    float _2029 = _2027;
    if (_1913)
    {
        float _2031 = _1903 * _2013;
        _2001 = _2031;
    }
    float _2033 = _2001;
    if (_1913)
    {
        float _2035 = fma(_1977, _1971, _2021);
        _2017 = _2035;
    }
    float _2037 = _2017;
    if (_1913)
    {
        float _2039 = _2025 * _2025;
        _2029 = _2039;
    }
    float _2041 = _2029;
    if (!_1913)
    {
        _2003 = _1907;
    }
    float _2043 = _2003;
    float _2045 = _2043;
    if (_1913)
    {
        float _2047 = _2033 * _2033;
        _2045 = _2047;
    }
    float _2049 = _2045;
    float _2051 = fma(_2037, _2037, _2041);
    float _2053 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2055 = floor(_1993);
    float _2057 = _2051 + _2049;
    float _2059 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2053);
    float _2061 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2063 = fma(_1999, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2061);
    float _2065 = precise::clamp(_2063, 0.0, 1.0);
    float _2067 = fma(_975, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2069 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2059);
    float _2071 = -_2065;
    float _2073 = _2071 + 1.0;
    float _2075 = rsqrt(_2057);
    float _2077 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2079 = _2069 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2081 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2083 = _2079 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2085 = abs(_2073);
    float _2087 = log2(_2085);
    float _2089 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2091 = -_2083;
    float _2093 = fma(_2091, _2077, 1.0);
    float _2095 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2097 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2081);
    float _2099 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2089);
    float _2101 = -_2055;
    float _2103 = _1993 + _2101;
    float _2105 = _2075 * _2025;
    float _2107 = _2075 * _2037;
    float _2109 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2095);
    float _2111 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2099);
    float _2113 = _2075 * _2033;
    float _2115 = _2105 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2117 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2109);
    float _2119 = _2111 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2121 = floor(_2067);
    float _2123 = -_2115;
    float _2125 = fma(_2107, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2123);
    float _2127 = _2117 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2129 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2131 = _2087 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2133 = -_2113;
    float _2135 = fma(_2133, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2125);
    float _2137 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2097);
    float _2139 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2129);
    float _2141 = exp2(_2131);
    float _2143 = fma(_2135, -0.5, 0.5);
    float _2145 = _2137 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2147 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2139);
    float _2149 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2151 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2153 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2147);
    float _2155 = log2(_2093);
    float _2157 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2149);
    float _2159 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2151);
    float _2161 = fma(_2135, 0.5, 0.5);
    float _2163 = -_2121;
    float _2165 = _2067 + _2163;
    float _2167 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2157);
    float _2169 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2159);
    float _2171 = fma(_2161, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2173 = 1.0 / _2153;
    float _2175 = _2107 + 1.0;
    float _2177 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2167);
    float _2179 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2169);
    float _2181 = fma(_2161, _2171, -0.212114393711090087890625);
    float _2183 = -_2107;
    float _2185 = fma(_2141, _2175, _2183);
    float _2187 = sqrt(_2143);
    float _2189 = _2155 * 0.693147182464599609375;
    float2 _6121 = float2(_2103, _2165);
    float _2191 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6121, float2(0.0), isnan(_6121)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6121, float2(0.0), isnan(_6121)), level(0.0)).x;
    float _2193 = fma(_2161, _2181, 1.570728778839111328125);
    float _2195 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2197 = _2177 * _2173;
    float _2199 = _2179 * _2173;
    float _2201 = fma(_2197, 0.5, 0.5);
    float _2203 = fma(_2199, -0.5, 0.5);
    float _2205 = _2187 * 0.636619746685028076171875;
    float3 _6153 = float3(_2201, _2203, _2195);
    float _2207 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6153, float3(0.0), isnan(_6153)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6153, float3(0.0), isnan(_6153)), level(0.0)).x;
    float _2209 = -_2193;
    float _2211 = fma(_2205, _2209, 1.0);
    float _2213 = fma(_2185, 0.5, 0.5);
    float3 _6171 = float3(_2201, _2203, _2195);
    float4 _2216 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6171, float3(0.0), isnan(_6171)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6171, float3(0.0), isnan(_6171)), level(0.0)).xyzw;
    float _2218 = _2216.x;
    float _2220 = _2216.y;
    float _2222 = _2216.z;
    float _2224 = _2216.w;
    float2 _6187 = float2(_2211, _2213);
    float3 _2228 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6187, float2(0.0), isnan(_6187)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6187, float2(0.0), isnan(_6187)), level(0.0)).xyz;
    float _2230 = _2228.x;
    float _2232 = _2228.y;
    float _2234 = _2228.z;
    float _2236 = abs(_1765);
    float _2238 = log2(_2236);
    float _2240 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2242 = _2087 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2244 = _1999 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2246 = isnan(_1999);
    bool _2248 = _2244 || _2246;
    bool _2250 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2252 = _2248 || _2250;
    float _2254 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2240);
    float _2256 = exp2(_2242);
    float _2258 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2254);
    float _2260 = in.m_76.x;
    float _2262 = _2177 + _2153;
    float _2264 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2258);
    float _2266 = _2238 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2268 = _1765 <= 8000.0;
    bool _2270 = isnan(_1765);
    bool _2272 = _2268 || _2270;
    bool _2274 = isnan(8000.0);
    bool _2276 = _2272 || _2274;
    float _2278 = float(_2276);
    float _2280 = _2153 * 0.5;
    float _2282 = _2264 + _2153;
    float _2284 = _2262 * 0.5;
    out.gl_Position.x = _2177;
    out.gl_Position.y = _2179;
    out.gl_Position.z = _2264;
    out.gl_Position.w = _2153;
    float _2286 = exp2(_2266);
    float _2288 = _2282 * 0.5;
    float _2290 = -_2256;
    float _2292 = _2290 + 1.0;
    float _2294 = _1819 * _1877;
    float _2296 = _2264;
    float _2298 = _2153;
    float _2300 = _2179;
    float _2302 = _2294;
    if (!_2252)
    {
        _2296 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2304 = _2296;
    float _2306 = fma(_2286, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2308 = precise::clamp(_2306, 0.0, 1.0);
    float _2310 = _2304;
    float _2312 = _2304;
    if (!_2252)
    {
        _2298 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2314 = _2298;
    float _2316 = fma(_2308, -2.0, 3.0);
    float _2318 = _2308 * _2308;
    float _2320 = _2318 * _2316;
    float _2322 = -_2320;
    float _2324 = _2322 + 1.0;
    float _2326 = fma(_2324, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2320);
    float _2328 = fma(_2179, -0.5, _2280);
    float _2330 = _2292 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2332 = _2314;
    float _2334 = _2314;
    if (!_2252)
    {
        _2300 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2336 = _2300;
    float _2338 = _2278 * _2326;
    out.m_78.x = _2284;
    out.m_78.y = _2328;
    out.m_78.z = _2288;
    out.m_78.w = _2153;
    float _2340 = _2338 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2342 = _2294 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2344 = _2336;
    float _2346 = _2336;
    if (!_2252)
    {
        _2302 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2348 = _2302;
    float _2350 = -_2191;
    float _2352 = _2350 + 1.0;
    float _2354 = _2352 * _2340;
    float _2356 = precise::clamp(_2354, 0.0, 1.0);
    float _2358 = -_2356;
    float _2360 = fma(_2358, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2362 = _2360 * _2260;
    float _2364 = _2330 * _2207;
    float _2366 = -_2330;
    float _2368 = _2366 + 1.0;
    float _2370 = _2362 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2372 = _2362;
    float _2374 = _2368;
    float _2376 = _2348;
    float _2378 = _2348;
    if (!_2252)
    {
        _2372 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2380 = _2372;
    float _2382 = _2224 * _2364;
    out.m_80.x = _2370;
    float _2384 = _2234 * _2364;
    float _2386 = fma(_2230, _2382, _2218);
    float _2388 = fma(_2232, _2382, _2220);
    float _2390 = _2224 * _2368;
    float _2392 = fma(_2224, _2384, _2222);
    float _2394 = _2380;
    float _2396 = _2380;
    if (!_2252)
    {
        _2374 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2398 = _2374;
    out.m_82.x = _2386;
    out.m_82.y = _2388;
    out.m_82.z = _2392;
    out.m_82.w = _2390;
    bool _2400 = !_2252;
    float _2402 = _2398;
    float _2404 = _2398;
    if (!_2400)
    {
        bool _2406 = _1999 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2408 = isnan(_1999);
        bool _2410 = _2406 || _2408;
        bool _2412 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2414 = _2410 || _2412;
        if (!_2414)
        {
            float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2418 = _1999 + _2416;
            float _2420 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2422 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2420;
            float _2424 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2426 = _2424 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2428 = 1.0 / _2422;
            float _2430 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2432 = _2430 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2434 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2436 = _2434 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2440 = _2438 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2444 = _2442 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2446 = _2418 * _2428;
            float _2448 = precise::clamp(_2446, 0.0, 1.0);
            float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2452 = _2450 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2454 = fma(_2448, _2426, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2456 = fma(_2448, _2452, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2458 = fma(_2448, _2432, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2460 = fma(_2448, _2436, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2462 = fma(_2448, _2440, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2464 = fma(_2448, _2444, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2404 = _2458;
            _2346 = _2462;
            _2396 = _2454;
            _2312 = _2460;
            _2334 = _2456;
            _2378 = _2464;
            _2466 = true;
        }
        else
        {
            bool _2468 = _1999 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2470 = isnan(_1999);
            bool _2472 = _2468 || _2470;
            bool _2474 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2476 = _2472 || _2474;
            if (!_2476)
            {
                _2394 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2478 = _2394;
            _2396 = _2478;
            if (!_2476)
            {
                _2402 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2480 = _2402;
            _2404 = _2480;
            if (!_2476)
            {
                _2332 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2482 = _2332;
            _2334 = _2482;
            if (!_2476)
            {
                _2310 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2484 = _2310;
            _2312 = _2484;
            if (!_2476)
            {
                _2344 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2486 = _2344;
            _2346 = _2486;
            if (!_2476)
            {
                _2376 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2488 = _2376;
            bool _2490 = !_2476;
            _2378 = _2488;
            if (!_2490)
            {
                bool _2492 = _1999 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2494 = isnan(_1999);
                bool _2496 = _2492 || _2494;
                bool _2498 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2500 = _2496 || _2498;
                if (!_2500)
                {
                    float _2502 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2504 = _1999 + _2502;
                    float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2508 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2506;
                    float _2510 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2512 = _2510 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2514 = 1.0 / _2508;
                    float _2516 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2518 = _2516 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2520 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2522 = _2520 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2530 = _2528 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2532 = _2504 * _2514;
                    float _2534 = precise::clamp(_2532, 0.0, 1.0);
                    float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2538 = _2536 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2540 = fma(_2534, _2512, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2542 = fma(_2534, _2538, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2544 = fma(_2534, _2518, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2546 = fma(_2534, _2522, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2548 = fma(_2534, _2526, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2550 = fma(_2534, _2530, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2404 = _2544;
                    _2346 = _2548;
                    _2396 = _2540;
                    _2312 = _2546;
                    _2334 = _2542;
                    _2378 = _2550;
                    _2466 = true;
                }
                else
                {
                    _2404 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2346 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2396 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2312 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2334 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2378 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2466 = false;
    float _2552 = _2404;
    float _2554 = _2346;
    float _2556 = _2396;
    float _2558 = _2312;
    float _2560 = _2334;
    float _2562 = _2378;
    float _2564 = fma(_1529, -0.5, 0.5);
    float _2566 = precise::clamp(_2564, 0.0, 1.0);
    float _2568 = -_2552;
    float _2570 = _2568 + _2554;
    float _2572 = _2342 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2574 = -_2556;
    float _2576 = _2574 + _2558;
    out.m_84.x = 0.0;
    float _2578 = fma(_2566, _2570, _2552);
    float _2580 = fma(_2566, _2576, _2556);
    out.m_51.x = _2572;
    float _2582 = -_2560;
    float _2584 = _2582 + _2562;
    float _2586 = _2578 * 0.586610972881317138671875;
    bool _2588 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2590 = fma(_2566, _2584, _2560);
    float _2592 = fma(_2580, 0.298911988735198974609375, _2586);
    bool _2594 = _1819 > 0.0;
    bool _2596 = isnan(_1819);
    bool _2598 = _2594 || _2596;
    bool _2600 = isnan(0.0);
    bool _2602 = _2598 || _2600;
    float _2604 = fma(_2590, 0.114477999508380889892578125, _2592);
    bool _2606 = _1877 <= 0.0;
    bool _2608 = !_2602;
    bool _2610 = _2606 || _2608;
    float _2612 = -_2604;
    float _2614 = _2580 + _2612;
    float _2616 = -_2604;
    float _2618 = _2578 + _2616;
    float _2620 = -_2604;
    float _2622 = _2590 + _2620;
    float _2624 = fma(_2614, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2604);
    float _2626 = fma(_2618, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2604);
    float _2628 = fma(_2622, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2604);
    bool _2630 = !_2588;
    if (!_2630)
    {
        float _2632 = -_1749;
        float _2634 = _2632 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2636 = -_1751;
        float _2638 = _2636 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2640 = -_1753;
        float _2642 = _2640 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2644 = _2634 * _2634;
        float _2646 = fma(_2638, _2638, _2644);
        float _2648 = fma(_2642, _2642, _2646);
        float _2650 = sqrt(_2648);
        float _2652 = rsqrt(_2648);
        float _2654 = -_2650;
        float _2656 = _2654 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2658 = _2656 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2660 = precise::clamp(_2658, 0.0, 1.0);
        float _2662 = _2638 * _2652;
        float _2664 = _2634 * _2652;
        float _2666 = abs(_2660);
        float _2668 = log2(_2666);
        float _2670 = _2642 * _2652;
        float _2672 = _2662 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2674 = _1529 * _2664;
        float _2676 = -_2664;
        float _2678 = -_2672;
        float _2680 = fma(_2676, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2678);
        float _2682 = fma(_1527, _2662, _2674);
        float _2684 = -_2670;
        float _2686 = fma(_2684, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2680);
        float _2688 = fma(_1531, _2670, _2682);
        float _2690 = precise::clamp(_2688, 0.0, 1.0);
        float _2692 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2694 = _2686 + _2692;
        float _2696 = _2668 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2698 = _2694 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2700 = precise::clamp(_2698, 0.0, 1.0);
        float _2702 = exp2(_2696);
        float _2704 = _2702 * _2700;
        float _2706 = _2690 * _2704;
        float _2708 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2710 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2712 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2708;
        out.m_84.y = _2710;
        out.m_84.z = _2712;
    }
    out.m_86.x = _2624;
    out.m_86.y = _2626;
    out.m_86.z = _2628;
    if (!_2610)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2714 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2714;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2466 = false;
    bool _1579 = false;
    bool _299 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_48.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    float _113 = as_type<float>(_105);
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _111;
    if (!_109)
    {
        out.m_51.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2772 = as_type<float>(_121);
        out.gl_Position.z = _2772;
    }
    if (!_109)
    {
        return out;
    }
    float _125 = in.m_53.w;
    float _127 = float(_105);
    float _129 = 1.0 / _127;
    float _131 = -_125;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_125);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = _133 * _129;
    bool _147 = _133 >= _127;
    bool _149 = !_143;
    bool _151 = _147 || _149;
    out.m_55.x = _145;
    float _153 = _145;
    float _155 = _133;
    if (_151)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _113;
    if (_151)
    {
        out.m_51.x = 0.0;
    }
    if (_151)
    {
        float _159 = _157 * 5.0;
        _123 = as_type<int>(_159);
    }
    int _161 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2844 = as_type<float>(_161);
        out.gl_Position.z = _2844;
    }
    if (_151)
    {
        return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _167 = as_type<int>(_163) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_163) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_165;
    float _201;
    if (!_183)
    {
        float _185 = in.m_60.x;
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        _201 = _145;
    }
    _203 = false;
    float _205 = _201;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _209 = _205 + _207;
    bool _211 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _213 = isnan(_205);
    bool _215 = _211 || _213;
    bool _217 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _219 = _215 || _217;
    float _221 = float(_219);
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _223;
    float _227 = -_221;
    float _229 = _227 + 1.0;
    bool _231 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _233 = isnan(_205);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _239 = _235 || _237;
    float _241 = float(_239);
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _243;
    bool _247 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _249 = 1.0 / _225;
    float _251 = _241 * _229;
    float _253 = -_241;
    float _255 = _253 + 1.0;
    float _257 = _209 * _249;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _259;
    float _263 = fma(_245, _257, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _265 = fma(_261, _257, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _267 = _263 * _251;
    float _269 = _265 * _251;
    float _271 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[143].x, _267);
    float _273 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[143].y, _269);
    float _275 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[144].x, _271);
    float _277 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[144].y, _273);
    bool _279 = !_247;
    float _297;
    if (!_279)
    {
        float _281 = in.m_60.x;
        float _283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _285 = _281 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _289 = _287 * _283;
        float _291 = floor(_289);
        float _293 = -_291;
        float _295 = _289 + _293;
        _297 = _295;
        _299 = true;
    }
    else
    {
        _297 = _145;
    }
    _299 = false;
    float _301 = _297;
    bool _303 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _305 = isnan(_301);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _319 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _321 = isnan(_301);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _337 = _301 + _335;
    float _339 = -_313;
    float _341 = _339 + 1.0;
    bool _343 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _345 = 1.0 / _317;
    float _347 = _329 * _341;
    float _349 = -_329;
    float _351 = _349 + 1.0;
    float _353 = _333 * _345;
    float _355 = fma(_353, _337, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _357 = _355 * _347;
    float _359 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[115].x, _357);
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _367 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[116].x, _359);
    float _369 = _361 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _371 = _363 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _373 = _365 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _375 = _367 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _377 = in.m_62.x;
    float _379 = in.m_62.y;
    out.m_64.x = _369;
    out.m_64.y = _371;
    out.m_64.z = _373;
    out.m_64.w = _375;
    float _381 = _277 * _379;
    float _383 = _275 * _377;
    bool _385 = !_343;
    if (!_385)
    {
        float _387 = in.m_60.x;
        float _389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _391 = _387 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _393 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[11].w, _133);
        float _395 = _393 * _389;
        float _397 = floor(_395);
        float _399 = -_397;
        float _401 = _395 + _399;
        _153 = _401;
    }
    float _403 = _153;
    float _405 = in.m_60.x;
    float _407 = in.m_60.y;
    float _409 = in.m_60.z;
    float _411 = in.m_60.w;
    float _413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _415 = in.m_48.x;
    float _417 = in.m_48.y;
    float _419 = in.m_48.z;
    int _421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _423 = _421 != 0;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _431 = _429 != 0;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _437 = _435 != 0;
    float _439 = 1.0 / _427;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _445 = _411 > 0.5;
    float _447 = _405 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _449 = _407 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _453 = _451 != 0;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _457 = _455 != 0;
    float _459 = -_433;
    float _461 = fma(_447, 2.0, _459);
    float _463 = -_181;
    int _465 = _445 ? as_type<int>(_463) : as_type<int>(_181);
    float _467 = _409 * 2.0;
    bool _469 = _405 > 0.5;
    float _471 = _417 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _473 = fma(_449, -2.0, _441);
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _477 = -_177;
    int _479 = _469 ? as_type<int>(_477) : as_type<int>(_177);
    float _481 = floor(_467);
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _485 = _483 != 0;
    float _487 = _417 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _489 = _417 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _491 = !_423;
    float _493 = _491 ? _177 : as_type<float>(_479);
    float _495 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].x, _471);
    bool _497 = _407 > 0.5;
    float _499 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].x, _487);
    float _501 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].x, _489);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _503;
    float _507 = _407 + _409;
    float _509 = _405 * 2.0;
    float _511 = -_181;
    int _513 = _497 ? as_type<int>(_511) : as_type<int>(_181);
    float _515 = _505 * _439;
    float _517 = _507 + (-1.0);
    float _519 = floor(_509);
    bool _521 = !_431;
    float _523 = _521 ? _181 : as_type<float>(_513);
    float _525 = _407 + _405;
    float _527 = -_177;
    float _529 = _497 ? _527 : _177;
    float _531 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _533 = _525 + (-1.0);
    bool _535 = _409 > 0.5;
    float _537 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[4].z, _499);
    bool _539 = !_453;
    float _541 = _539 ? _177 : _529;
    float _543 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _545 = _481 > 0.0;
    float _547 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[5].z, _495);
    bool _549 = _481 >= 0.0;
    bool _551 = isnan(_481);
    bool _553 = _549 || _551;
    bool _555 = isnan(0.0);
    bool _557 = _553 || _555;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _561 = _403 + _559;
    float _563 = _529;
    float _565 = _475;
    if (!_485)
    {
        _563 = _409;
    }
    float _567 = _563;
    float _569 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[6].z, _501);
    float _571 = _567;
    if (_485)
    {
        _571 = _407;
    }
    float _573 = _571;
    float _575 = fma(_515, _561, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _577 = -_181;
    int _579 = _535 ? as_type<int>(_577) : as_type<int>(_181);
    float _581 = _413 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _583 = -_177;
    int _585 = _535 ? as_type<int>(_583) : as_type<int>(_177);
    float _587 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[83].w, _475);
    bool _589 = !_457;
    float _591 = _589 ? _181 : as_type<float>(_579);
    float _593 = -_133;
    float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[76].x, _461);
    bool _597 = !_437;
    float _599 = _597 ? _177 : as_type<float>(_585);
    float _601 = _493 + 0.5;
    bool _603 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _605 = isnan(_403);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _617 = _519 > 0.0;
    float _619 = fma(_581, _601, _595);
    bool _621 = _519 >= 0.0;
    bool _623 = isnan(_519);
    bool _625 = _621 || _623;
    bool _627 = isnan(0.0);
    bool _629 = _625 || _627;
    float _631 = _443 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _633 = _557 ? 0 : 1;
    float _635 = -_613;
    float _637 = _635 + 1.0;
    bool _639 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _641 = isnan(_403);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _473);
    int _653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _655 = _653 != 0;
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _659 = _657 != 0;
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _663 = _661 != 0;
    float _665 = _523 + (-0.5);
    float _667 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _669 = _519;
    if (!_485)
    {
        _565 = _407;
    }
    float _671 = _565;
    float _673 = _649 * _637;
    float _675 = _671;
    if (!_485)
    {
        _669 = _409;
    }
    float _677 = _669;
    float _679 = -_631;
    float _681 = -_651;
    float _683 = fma(_679, _665, _681);
    float _685 = _677;
    if (_485)
    {
        _675 = _405;
    }
    float _687 = _675;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_485)
    {
        _685 = _407;
    }
    float _691 = _685;
    float _693 = _575 * _673;
    float _695 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[83].z, _689);
    float _697 = _687 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _701 = _699 != 0;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _705 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _707 = _691 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _711 = -_649;
    float _713 = _711 + 1.0;
    int _715 = ~_633;
    int _717 = _715 + 1;
    int _719 = _717 + 1;
    float _721 = -_703;
    float _723 = fma(_697, 2.0, _721);
    int _725 = _719;
    if (!_545)
    {
        int _727 = ~_633;
        int _729 = _727 + 1;
        _725 = _729;
    }
    int _731 = _725;
    float _733 = _615 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _735 = !_701;
    float _737 = _735 ? _181 : as_type<float>(_465);
    float _739 = fma(_707, -2.0, _709);
    float _741 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[131].x, _693);
    float _743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _745 = -_591;
    float _747 = _745 + 0.5;
    float _749 = _541 + 0.5;
    float _751 = _599 + 0.5;
    float _753 = -_133;
    float _755 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[81].x, _723);
    float _757 = _667 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _759 = _737 + (-0.5);
    float _761 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _739);
    float _763 = _747 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _765 = fma(_733, _751, _755);
    float _767 = _749 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _769 = -_757;
    float _771 = -_761;
    float _773 = fma(_769, _759, _771);
    float _775 = _763 * _705;
    float _777 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[132].x, _741);
    float _779 = _547 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _785 = _767 * _743;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _791 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[78].z, _781);
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _795 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[78].w, _783);
    float _797 = _537 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _799 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _801 = _779 + _799;
    float _803 = _787 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _805 = _789 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _807 = _793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _809 = _777 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _811 = _569 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _813 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _815 = _797 + _813;
    float _817 = _801 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _819 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _795);
    float _821 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _823 = log2(_821);
    float _825 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _827 = _811 + _825;
    float _829 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[28].x, _817);
    float _831 = -_819;
    float _833 = _831 + 1.0;
    out.m_66.x = _803;
    out.m_66.y = _805;
    out.m_66.z = _807;
    out.m_66.w = _809;
    float _835 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _695);
    float _837 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[28].z, _829);
    float _839 = fma(_523, _833, _683);
    float _841 = _801 * _801;
    out.m_68.x = _785;
    out.m_68.y = _775;
    float _843 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _791);
    bool _845 = _837 >= 0.0;
    float _847 = fma(_815, _815, _841);
    float _849 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _587);
    float _851 = -_843;
    float _853 = _851 + 1.0;
    bool _855 = !_659;
    int _857 = _855 ? 0 : 1;
    float _859 = _823 * _133;
    float _861 = fma(_827, _827, _847);
    bool _863 = !_655;
    int _865 = _863 ? 0 : 1;
    float _867 = -_835;
    float _869 = _867 + 1.0;
    float _871 = float(_731);
    float _873 = -_853;
    float _875 = fma(_493, _873, _619);
    int _877 = abs(_865);
    float _879 = -_869;
    float _881 = fma(_599, _879, _765);
    float _883 = exp2(_859);
    float _885 = float(_877);
    float _887 = _407 * 2.0;
    bool _889 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _891 = isnan(1.0);
    bool _893 = _889 || _891;
    bool _895 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _897 = _893 || _895;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _901 = 1.0 + _899;
    float _903 = _847;
    float _905 = _779;
    if (_845)
    {
        _903 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _907 = _903;
    float _909 = _885 * _871;
    float _911 = -_849;
    float _913 = _911 + 1.0;
    float _915 = in.m_70.x;
    float _917 = in.m_70.y;
    float _919 = in.m_70.z;
    float _921 = rsqrt(_861);
    float _923 = fma(_737, _913, _773);
    int _925 = as_type<int>(_907);
    if (_845)
    {
        float _927 = _907 * 5.0;
        _925 = as_type<int>(_927);
    }
    int _929 = _925;
    if (_845)
    {
        out.m_51.x = 0.0;
    }
    bool _931 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _933 = isnan(0.0);
    bool _935 = _931 || _933;
    bool _937 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _939 = _935 || _937;
    float _941 = -_883;
    float _943 = _941 + 1.0;
    float _945 = floor(_887);
    out.m_72.x = _875;
    out.m_72.y = _839;
    out.m_72.z = _881;
    out.m_72.w = _923;
    bool _947 = !_663;
    int _949 = _947 ? 0 : 1;
    if (_845)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4154 = as_type<float>(_929);
        out.gl_Position.z = _4154;
    }
    float _951 = 1.0 / _901;
    float _953 = _801 * _921;
    float _955 = _815 * _921;
    if (_845)
    {
        return out;
    }
    float _957 = -_953;
    float _959 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[18].w, _779);
    float _961 = _827 * _921;
    float _963 = -_955;
    float _965 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[18].w, _797);
    int _967 = _629 ? 0 : 1;
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _971 = _959 + _969;
    float _973 = -_961;
    float _975 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[18].w, _811);
    float _977 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _979 = _965 + _977;
    float _981 = _909 * (-2.0);
    float _983 = _971 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _985 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _987 = _975 + _985;
    int _989 = ~_967;
    int _991 = _989 + 1;
    int _993 = _991 + 1;
    float _995 = fma(_543, _981, _543);
    float _997 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[28].x, _983);
    int _999 = _993;
    float _1001 = _961;
    float _1003 = _971;
    if (!_617)
    {
        int _1005 = ~_967;
        int _1007 = _1005 + 1;
        _999 = _1007;
    }
    int _1009 = _999;
    float _1011 = -_953;
    float _1013 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[18].w, _801);
    int _1015 = abs(_857);
    float _1017 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[28].z, _997);
    float _1019 = _939 ? _943 : 0.0;
    float _1021 = fma(_981, _915, _915);
    float _1023 = _405 + (-0.5);
    bool _1025 = _945 > 0.0;
    float _1027 = -_955;
    float _1029 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[18].w, _815);
    bool _1031 = _1017 >= 0.0;
    float _1033 = _1013 * _1013;
    float _1035 = float(_1009);
    if (_897)
    {
        float _1037 = _1019 * _951;
        _155 = _1037;
    }
    float _1039 = _155;
    float _1041 = float(_1015);
    float _1043 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1021);
    bool _1045 = _945 >= 0.0;
    bool _1047 = isnan(_945);
    bool _1049 = _1045 || _1047;
    bool _1051 = isnan(0.0);
    bool _1053 = _1049 || _1051;
    float _1055 = fma(_1029, _1029, _1033);
    float _1057 = -_961;
    float _1059 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[18].w, _827);
    float _1061 = _1041 * _1035;
    float _1063 = fma(_995, _1039, _1043);
    int _1065 = _1053 ? 0 : 1;
    float _1067 = fma(_1059, _1059, _1055);
    float _1069 = _1061 * (-2.0);
    float _1071 = _1063 * 0.15915493667125701904296875;
    int _1073 = ~_1065;
    int _1075 = _1073 + 1;
    int _1077 = _1075 + 1;
    int _1079 = _1077;
    float _1081 = _1055;
    if (!_1025)
    {
        int _1083 = ~_1065;
        int _1085 = _1083 + 1;
        _1079 = _1085;
    }
    int _1087 = _1079;
    float _1089 = fma(_531, _1069, _531);
    if (_1031)
    {
        _1081 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1091 = _1081;
    float _1093 = sqrt(_1067);
    int _1095 = as_type<int>(_1091);
    if (_1031)
    {
        out.m_51.x = 0.0;
    }
    float _1097 = fma(_1069, _917, _917);
    float _1099 = _407 + (-0.5);
    if (_1031)
    {
        float _1101 = _1091 * 5.0;
        _1095 = as_type<int>(_1101);
    }
    int _1103 = _1095;
    int _1105 = abs(_949);
    float _1107 = _1071 * 6.283185482025146484375;
    float _1109 = sin(_1107);
    if (_1031)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4404 = as_type<float>(_1103);
        out.gl_Position.z = _4404;
    }
    if (_1031)
    {
        return out;
    }
    float _1111 = -_779;
    float _1113 = _1111 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1115 = -_797;
    float _1117 = _1115 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1119 = -_811;
    float _1121 = _1119 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1123 = _1113 * _1113;
    float _1125 = float(_1087);
    float _1127 = _409 + _405;
    float _1129 = float(_1105);
    float _1131 = fma(_1117, _1117, _1123);
    float _1133 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1097);
    float _1135 = _1127 + (-1.0);
    float _1137 = _409 + (-0.5);
    float _1139 = fma(_1121, _1121, _1131);
    float _1141 = _1129 * _1125;
    float _1143 = fma(_1089, _1039, _1133);
    float _1145 = _1071 * 6.283185482025146484375;
    float _1147 = cos(_1145);
    float _1149 = _1141 * (-2.0);
    float _1151 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1153 = _1143 * 0.15915493667125701904296875;
    float _1155 = fma(_1149, _919, _919);
    float _1157 = fma(_1151, _1149, _1151);
    float _1159 = rsqrt(_1139);
    float _1161 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1155);
    float _1163 = fma(_1157, _1039, _1161);
    float _1165 = _1153 * 6.283185482025146484375;
    float _1167 = sin(_1165);
    float _1169 = _1163 * 0.15915493667125701904296875;
    float _1171 = _1117 * _1159;
    float _1173 = _1121 * _1159;
    float _1175 = _1113 * _1159;
    float _1177 = _1153 * 6.283185482025146484375;
    float _1179 = cos(_1177);
    float _1181 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1183 = _1171 * _1181;
    float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1187 = _1173 * _1185;
    float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1191 = _1175 * _1189;
    float _1193 = _381 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1195 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1197 = -_1183;
    float _1199 = fma(_1173, _1195, _1197);
    float _1201 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1203 = -_1187;
    float _1205 = fma(_1175, _1201, _1203);
    float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1209 = -_1191;
    float _1211 = fma(_1171, _1207, _1209);
    float _1213 = _1169 * 6.283185482025146484375;
    float _1215 = sin(_1213);
    float _1217 = _1199 * _1199;
    float _1219 = _1109 * _1167;
    float _1221 = _1147 * _1167;
    float _1223 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _1225 = fma(_1205, _1205, _1217);
    float _1227 = _921 * _1093;
    float _1229 = _1169 * 6.283185482025146484375;
    float _1231 = cos(_1229);
    float _1233 = fma(_1211, _1211, _1225);
    float _1235 = _1147 * _1179;
    float _1237 = _1109 * _1179;
    float _1239 = rsqrt(_1233);
    float _1241 = fma(_1215, _1235, _1219);
    float _1243 = fma(_1215, _1219, _1235);
    float _1245 = _1147 * _1231;
    float _1247 = _1179 * _1231;
    float _1249 = _1109 * _1231;
    float _1251 = _1167 * _1231;
    float _1253 = _383 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1255 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _1257 = _1227 * _1193;
    float _1259 = _1227 * _1253;
    float _1261 = _1205 * _1239;
    float _1263 = _1255 * _1257;
    float _1265 = _1199 * _1239;
    float _1267 = _1223 * _1259;
    float _1269 = -_1221;
    float _1271 = fma(_1215, _1237, _1269);
    float _1273 = _1245 * _1263;
    float _1275 = -_1237;
    float _1277 = fma(_1215, _1221, _1275);
    float _1279 = _1211 * _1239;
    float _1281 = _1227 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1283 = _1281 * 0.5;
    float _1285 = -_1263;
    float _1287 = _1215 * _1285;
    float _1289 = fma(_1241, _1267, _1273);
    float _1291 = _1173 * _1265;
    float _1293 = _1175 * _1261;
    float _1295 = _1249 * _1263;
    float _1297 = fma(_1247, _1267, _1287);
    float _1299 = fma(_1277, _1283, _1289);
    float _1301 = -_1291;
    float _1303 = fma(_1175, _1279, _1301);
    float _1305 = -_1293;
    float _1307 = fma(_1171, _1265, _1305);
    float _1309 = fma(_1271, _1267, _1295);
    float _1311 = fma(_1251, _1283, _1297);
    float _1313 = _1303 * _1299;
    float _1315 = _1307 * _1299;
    float _1317 = fma(_1243, _1283, _1309);
    float _1319 = _1245 * _1303;
    float _1321 = fma(_1261, _1311, _1313);
    float _1323 = fma(_1279, _1311, _1315);
    float _1325 = _1171 * _1279;
    float _1327 = _1245 * _1307;
    float _1329 = fma(_1171, _1317, _1321);
    float _1331 = fma(_1173, _1317, _1323);
    float _1333 = -_1325;
    float _1335 = fma(_1173, _1261, _1333);
    float _1337 = _1241 * _1303;
    float _1339 = _797 + _1329;
    float _1341 = _811 + _1331;
    float _1343 = _1335 * _1299;
    float _1345 = _1245 * _1335;
    float _1347 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1349 = _1339 + _1347;
    float _1351 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1353 = _1341 + _1351;
    float _1355 = _1241 * _1335;
    float _1357 = _1241 * _1307;
    float _1359 = _1349 * _1349;
    float _1361 = _1353 * _1353;
    float _1363 = _1277 * _1307;
    float _1365 = fma(_1265, _1311, _1343);
    float _1367 = _1277 * _1303;
    float _1369 = _1359 + _1361;
    float _1371 = -_1215;
    float _1373 = fma(_1371, _1265, _1345);
    float _1375 = fma(_1175, _1317, _1365);
    float _1377 = _1277 * _1335;
    float _1379 = sqrt(_1369);
    float _1381 = -_1215;
    float _1383 = fma(_1381, _1261, _1319);
    float _1385 = -_1215;
    float _1387 = fma(_1385, _1279, _1327);
    float _1389 = _779 + _1375;
    float _1391 = fma(_1247, _1261, _1337);
    float _1393 = fma(_1247, _1265, _1355);
    float _1395 = fma(_1247, _1279, _1357);
    float _1397 = fma(_1251, _1261, _1367);
    float _1399 = fma(_1251, _1265, _1377);
    float _1401 = fma(_1249, _1171, _1383);
    float _1403 = fma(_1249, _1175, _1373);
    float _1405 = fma(_1251, _1279, _1363);
    float _1407 = fma(_1249, _1173, _1387);
    bool _1409 = _1379 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1411 = _1261;
    float _1413 = _1359;
    float _1415 = _1361;
    float _1417 = _1341;
    float _1419 = _1339;
    if (!_1409)
    {
        _1411 = _1359;
    }
    float _1421 = _1411;
    float _1423 = _1421;
    if (!_1409)
    {
        _1413 = _1389;
    }
    float _1425 = _1413;
    bool _1427 = !_1409;
    float _1429 = _1425;
    if (!_1427)
    {
        float _1431 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1433 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1435 = _1379 + _1433;
        float _1437 = rsqrt(_1369);
        float _1439 = _1435 * _1431;
        float _1441 = _1389 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1443 = _1439 * 0.15915493667125701904296875;
        float _1445 = _1443 * 6.283185482025146484375;
        float _1447 = sin(_1445);
        float _1449 = _1443 * 6.283185482025146484375;
        float _1451 = cos(_1449);
        float _1453 = fma(_1447, _1441, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1455 = _1437 * _1453;
        float _1457 = fma(_1349, _1455, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1459 = _1451 + (-1.0);
        float _1461 = fma(_1353, _1455, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1463 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1465 = _1457 + _1463;
        float _1467 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1469 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1471 = _1461 + _1469;
        float _1473 = _1465 * _1465;
        float _1475 = fma(_1389, _1451, _1467);
        float _1477 = _1471 * _1471;
        _1429 = _1475;
        _1423 = _1473;
        _1415 = _1477;
        _1417 = _1461;
        _1419 = _1457;
    }
    float _1479 = _1429;
    float _1481 = _1423;
    float _1483 = _1415;
    float _1485 = _1417;
    float _1487 = _1419;
    float _1489 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1491 = _1479 + _1489;
    float _1493 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1495 = fma(_1271, _1171, _1391);
    float _1497 = fma(_1243, _1171, _1397);
    float _1499 = fma(_1491, _1491, _1481);
    float _1501 = fma(_1243, _1175, _1399);
    float _1503 = fma(_1243, _1173, _1405);
    float _1505 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1507 = _1499 + _1483;
    float _1509 = _1493 * _1401;
    float _1511 = fma(_1271, _1175, _1393);
    float _1513 = fma(_1271, _1173, _1395);
    float _1515 = _1493 * _1403;
    float _1517 = _1493 * _1407;
    float _1519 = sqrt(_1507);
    float _1521 = fma(_1505, _1495, _1509);
    float _1523 = fma(_1505, _1511, _1515);
    float _1525 = fma(_1505, _1513, _1517);
    float _1527 = _1497 + _1521;
    float _1529 = _1501 + _1523;
    float _1531 = _1503 + _1525;
    out.m_74.x = _1527;
    out.m_74.y = _1529;
    out.m_74.z = _1531;
    bool _1533 = _1519 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1535 = isnan(_1519);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1541 = _1537 || _1539;
    float _1543 = _1515;
    if (!_1541)
    {
        _1543 = 1.0;
    }
    float _1545 = _1543;
    bool _1547 = !_1541;
    float _1549 = _1545;
    if (!_1547)
    {
        bool _1551 = _1519 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1553 = isnan(_1519);
        bool _1555 = _1551 || _1553;
        bool _1557 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1559 = _1555 || _1557;
        if (!_1559)
        {
            float _1561 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1563 = _1519 + _1561;
            float _1565 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1567 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1565;
            float _1569 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1571 = _1569 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1573 = 1.0 / _1567;
            float _1575 = _1563 * _1573;
            float _1577 = fma(_1575, _1571, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1549 = _1577;
            _1579 = true;
        }
        else
        {
            bool _1581 = _1519 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1583 = isnan(_1519);
            bool _1585 = _1581 || _1583;
            bool _1587 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1589 = _1585 || _1587;
            if (!_1589)
            {
                float _1591 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1593 = _1519 + _1591;
                float _1595 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1597 = _1595 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1599 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1601 = _1599 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1603 = 1.0 / _1597;
                float _1605 = _1593 * _1603;
                float _1607 = fma(_1605, _1601, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1549 = _1607;
                _1579 = true;
            }
            else
            {
                _1549 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1579 = false;
    float _1609 = _1549;
    float _1611 = _959 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1613 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1615 = _1479 + _1613;
    float _1617 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1611);
    float _1619 = _959 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1621 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1623 = _1485 + _1621;
    float _1625 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1617);
    bool _1627 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1629 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1631 = _1627 || _1629;
    bool _1633 = isnan(0.5);
    bool _1635 = _1631 || _1633;
    float _1637 = fma(_1615, _1609, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _1639 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1641 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1643 = _1639 || _1641;
    bool _1645 = isnan(0.5);
    bool _1647 = _1643 || _1645;
    float _1649 = _1625 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1651 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1619);
    float _1653 = fma(_1623, _1609, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1655 = 1.0 / _1649;
    float _1657 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1651);
    float _1659 = -_961;
    float _1661 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1653);
    float _1663 = _1657 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1665 = _1663 + _1649;
    float _1667 = _1649;
    float _1669 = _1661;
    if (_1647)
    {
        _1667 = 1.0;
    }
    float _1671 = _1667;
    float _1673 = _1665 * _1655;
    float _1675 = _1673 * 0.5;
    float _1677 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1679 = _1487 + _1677;
    float _1681 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1683 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1681);
    float _1685 = fma(_1679, _1609, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1687 = -_953;
    float _1689 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1637);
    float _1691 = 1.0 / _1683;
    float _1693 = -_955;
    float _1695 = fma(_1693, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1685);
    float _1697 = _1689;
    float _1699 = _1695;
    float _1701 = _1671;
    if (!_1635)
    {
        float _1703 = _971 * _971;
        float _1705 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1707 = -_811;
        float _1709 = _1707 + _1653;
        float _1711 = -_779;
        float _1713 = _1711 + _1637;
        float _1715 = fma(_979, _979, _1703);
        float _1717 = fma(_987, _987, _1715);
        float _1719 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1721 = sqrt(_1717);
        float _1723 = 1.0 / _1227;
        float _1725 = _1719 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1727 = precise::min(_1721, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1729 = _1727 * _1705;
        float _1731 = -_797;
        float _1733 = _1731 + _1685;
        float _1735 = _1729 * _1723;
        float _1737 = _1725 * _1735;
        float _1739 = _1709 * _1735;
        float _1741 = fma(_1713, _1737, _959);
        float _1743 = fma(_1733, _1737, _965);
        float _1745 = fma(_1725, _1739, _975);
        _1001 = _1735;
        _1697 = _1741;
        _1699 = _1743;
        _1669 = _1745;
        _905 = _1737;
    }
    float _1747 = _1001;
    float _1749 = _1697;
    float _1751 = _1699;
    float _1753 = _1669;
    float _1755 = _905;
    float _1757 = _1755;
    float _1759 = _1747;
    if (_1647)
    {
        _1757 = 1.0;
    }
    float _1761 = _1757;
    float _1763 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1765 = _1691 * _1763;
    float _1767 = _1761;
    if (!_1647)
    {
        float _1769 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1771 = _1769 * 0.15915493667125701904296875;
        float _1773 = _1771 * 6.283185482025146484375;
        float _1775 = cos(_1773);
        float _1777 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1779 = _1777 * 0.15915493667125701904296875;
        float _1781 = _1771 * 6.283185482025146484375;
        float _1783 = sin(_1781);
        float _1785 = 1.0 / _1775;
        float _1787 = _1779 * 6.283185482025146484375;
        float _1789 = cos(_1787);
        float _1791 = _1783 * _1785;
        float _1793 = _1779 * 6.283185482025146484375;
        float _1795 = sin(_1793);
        float _1797 = _1789 * _1791;
        float _1799 = 1.0 / _1797;
        float _1801 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1803 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1801;
        float _1805 = 1.0 / _1803;
        float _1807 = _1795 * _1799;
        float _1809 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1811 = fma(_1765, _1807, _1809);
        float _1813 = _1811 * _1805;
        float _1815 = precise::clamp(_1813, 0.0, 1.0);
        _1759 = _1779;
        _1701 = _1815;
    }
    float _1817 = _1759;
    float _1819 = _1701;
    float _1821 = _1817;
    if (!_1647)
    {
        float _1823 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1825 = _1823 * 0.15915493667125701904296875;
        float _1827 = _1825 * 6.283185482025146484375;
        float _1829 = cos(_1827);
        float _1831 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1833 = _1831 * 0.15915493667125701904296875;
        float _1835 = _1825 * 6.283185482025146484375;
        float _1837 = sin(_1835);
        float _1839 = 1.0 / _1829;
        float _1841 = _1833 * 6.283185482025146484375;
        float _1843 = cos(_1841);
        float _1845 = _1837 * _1839;
        float _1847 = _1833 * 6.283185482025146484375;
        float _1849 = sin(_1847);
        float _1851 = _1843 * _1845;
        float _1853 = 1.0 / _1851;
        float _1855 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1857 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1855;
        float _1859 = 1.0 / _1857;
        float _1861 = _1849 * _1853;
        float _1863 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1865 = fma(_1765, _1861, _1863);
        float _1867 = _1865 * _1859;
        float _1869 = precise::clamp(_1867, 0.0, 1.0);
        float _1871 = -_1869;
        float _1873 = _1871 + 1.0;
        _1821 = _1853;
        _1767 = _1873;
    }
    float _1875 = _1821;
    float _1877 = _1767;
    float _1879 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1881 = _1749 + _1879;
    float _1883 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1885 = _1751 + _1883;
    float _1887 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1889 = _1753 + _1887;
    float _1891 = _1881 * _1881;
    float _1893 = fma(_1885, _1885, _1891);
    float _1895 = fma(_1889, _1889, _1893);
    float _1897 = rsqrt(_1895);
    float _1899 = _1897 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1901 = _1885 * _1899;
    float _1903 = _1889 * _1899;
    float _1905 = _1901 * _1901;
    float _1907 = _1903 * _1903;
    float _1909 = _1905 + _1907;
    float _1911 = sqrt(_1909);
    bool _1913 = _1911 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1915 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1917 = _1911 + _1915;
    float _1919 = _1897;
    float _1921 = _1909;
    float _1923 = _1917;
    float _1925 = _1875;
    float _1927 = _1881;
    float _1929 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1913)
    {
        float _1931 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1919 = _1931;
    }
    float _1933 = _1919;
    if (_1913)
    {
        float _1935 = rsqrt(_1909);
        _1921 = _1935;
    }
    float _1937 = _1921;
    float _1939 = _1937;
    if (_1913)
    {
        float _1941 = _1917 * _1933;
        _1923 = _1941;
    }
    float _1943 = _1923;
    if (_1913)
    {
        float _1945 = _1943 * 0.15915493667125701904296875;
        _1003 = _1945;
    }
    float _1947 = _1003;
    float _1949 = _1933;
    float _1951 = _1947;
    if (_1913)
    {
        float _1953 = _1947 * 6.283185482025146484375;
        float _1955 = sin(_1953);
        _1949 = _1955;
    }
    float _1957 = _1949;
    float _1959 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1961 = precise::max(0.0, _1959);
    float _1963 = _1889;
    float _1965 = _1961;
    if (_1913)
    {
        float _1967 = _1947 * 6.283185482025146484375;
        float _1969 = cos(_1967);
        _1963 = _1969;
    }
    float _1971 = _1963;
    float _1973 = -_1899;
    float _1975 = -_1961;
    float _1977 = fma(_1881, _1973, _1975);
    if (_1913)
    {
        float _1979 = _1977 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1965 = _1979;
    }
    float _1981 = _1965;
    if (!_1913)
    {
        _1951 = _1901;
    }
    float _1983 = _1951;
    float _1985 = _1957;
    float _1987 = _1983;
    if (_1913)
    {
        float _1989 = fma(_1957, _1981, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1925 = _1989;
    }
    float _1991 = _1925;
    float _1993 = fma(_965, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1995 = _1991;
    if (!_1913)
    {
        _1985 = _1903;
    }
    float _1997 = _1985;
    float _1999 = sqrt(_1895);
    float _2001 = _1997;
    float _2003 = _1971;
    if (_1913)
    {
        float _2005 = _1971 + (-1.0);
        _1927 = _2005;
    }
    float _2007 = _1927;
    float _2009 = _2007;
    if (_1913)
    {
        float _2011 = _1937 * _1991;
        _1929 = _2011;
    }
    float _2013 = _1929;
    if (!_1913)
    {
        _1995 = _1977;
    }
    float _2015 = _1995;
    float _2017 = _2015;
    if (_1913)
    {
        float _2019 = _2007 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2009 = _2019;
    }
    float _2021 = _2009;
    if (_1913)
    {
        float _2023 = _1901 * _2013;
        _1987 = _2023;
    }
    float _2025 = _1987;
    if (!_1913)
    {
        _1939 = _1905;
    }
    float _2027 = _1939;
    float _2029 = _2027;
    if (_1913)
    {
        float _2031 = _1903 * _2013;
        _2001 = _2031;
    }
    float _2033 = _2001;
    if (_1913)
    {
        float _2035 = fma(_1977, _1971, _2021);
        _2017 = _2035;
    }
    float _2037 = _2017;
    if (_1913)
    {
        float _2039 = _2025 * _2025;
        _2029 = _2039;
    }
    float _2041 = _2029;
    if (!_1913)
    {
        _2003 = _1907;
    }
    float _2043 = _2003;
    float _2045 = _2043;
    if (_1913)
    {
        float _2047 = _2033 * _2033;
        _2045 = _2047;
    }
    float _2049 = _2045;
    float _2051 = fma(_2037, _2037, _2041);
    float _2053 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2055 = floor(_1993);
    float _2057 = _2051 + _2049;
    float _2059 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2053);
    float _2061 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2063 = fma(_1999, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2061);
    float _2065 = precise::clamp(_2063, 0.0, 1.0);
    float _2067 = fma(_975, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2069 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2059);
    float _2071 = -_2065;
    float _2073 = _2071 + 1.0;
    float _2075 = rsqrt(_2057);
    float _2077 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2079 = _2069 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2081 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2083 = _2079 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2085 = abs(_2073);
    float _2087 = log2(_2085);
    float _2089 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2091 = -_2083;
    float _2093 = fma(_2091, _2077, 1.0);
    float _2095 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2097 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2081);
    float _2099 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2089);
    float _2101 = -_2055;
    float _2103 = _1993 + _2101;
    float _2105 = _2075 * _2025;
    float _2107 = _2075 * _2037;
    float _2109 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2095);
    float _2111 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2099);
    float _2113 = _2075 * _2033;
    float _2115 = _2105 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2117 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2109);
    float _2119 = _2111 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2121 = floor(_2067);
    float _2123 = -_2115;
    float _2125 = fma(_2107, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2123);
    float _2127 = _2117 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2129 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2131 = _2087 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2133 = -_2113;
    float _2135 = fma(_2133, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2125);
    float _2137 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2097);
    float _2139 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2129);
    float _2141 = exp2(_2131);
    float _2143 = fma(_2135, -0.5, 0.5);
    float _2145 = _2137 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2147 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2139);
    float _2149 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2151 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2153 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2147);
    float _2155 = log2(_2093);
    float _2157 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2149);
    float _2159 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2151);
    float _2161 = fma(_2135, 0.5, 0.5);
    float _2163 = -_2121;
    float _2165 = _2067 + _2163;
    float _2167 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2157);
    float _2169 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2159);
    float _2171 = fma(_2161, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2173 = 1.0 / _2153;
    float _2175 = _2107 + 1.0;
    float _2177 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2167);
    float _2179 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2169);
    float _2181 = fma(_2161, _2171, -0.212114393711090087890625);
    float _2183 = -_2107;
    float _2185 = fma(_2141, _2175, _2183);
    float _2187 = sqrt(_2143);
    float _2189 = _2155 * 0.693147182464599609375;
    float2 _6121 = float2(_2103, _2165);
    float _2191 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6121, float2(0.0), isnan(_6121)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6121, float2(0.0), isnan(_6121)), level(0.0)).x;
    float _2193 = fma(_2161, _2181, 1.570728778839111328125);
    float _2195 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2197 = _2177 * _2173;
    float _2199 = _2179 * _2173;
    float _2201 = fma(_2197, 0.5, 0.5);
    float _2203 = fma(_2199, -0.5, 0.5);
    float _2205 = _2187 * 0.636619746685028076171875;
    float3 _6153 = float3(_2201, _2203, _2195);
    float _2207 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6153, float3(0.0), isnan(_6153)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6153, float3(0.0), isnan(_6153)), level(0.0)).x;
    float _2209 = -_2193;
    float _2211 = fma(_2205, _2209, 1.0);
    float _2213 = fma(_2185, 0.5, 0.5);
    float3 _6171 = float3(_2201, _2203, _2195);
    float4 _2216 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6171, float3(0.0), isnan(_6171)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6171, float3(0.0), isnan(_6171)), level(0.0)).xyzw;
    float _2218 = _2216.x;
    float _2220 = _2216.y;
    float _2222 = _2216.z;
    float _2224 = _2216.w;
    float2 _6187 = float2(_2211, _2213);
    float3 _2228 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6187, float2(0.0), isnan(_6187)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6187, float2(0.0), isnan(_6187)), level(0.0)).xyz;
    float _2230 = _2228.x;
    float _2232 = _2228.y;
    float _2234 = _2228.z;
    float _2236 = abs(_1765);
    float _2238 = log2(_2236);
    float _2240 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2242 = _2087 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2244 = _1999 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2246 = isnan(_1999);
    bool _2248 = _2244 || _2246;
    bool _2250 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2252 = _2248 || _2250;
    float _2254 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2240);
    float _2256 = exp2(_2242);
    float _2258 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2254);
    float _2260 = in.m_76.x;
    float _2262 = _2177 + _2153;
    float _2264 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2258);
    float _2266 = _2238 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2268 = _1765 <= 8000.0;
    bool _2270 = isnan(_1765);
    bool _2272 = _2268 || _2270;
    bool _2274 = isnan(8000.0);
    bool _2276 = _2272 || _2274;
    float _2278 = float(_2276);
    float _2280 = _2153 * 0.5;
    float _2282 = _2264 + _2153;
    float _2284 = _2262 * 0.5;
    out.gl_Position.x = _2177;
    out.gl_Position.y = _2179;
    out.gl_Position.z = _2264;
    out.gl_Position.w = _2153;
    float _2286 = exp2(_2266);
    float _2288 = _2282 * 0.5;
    float _2290 = -_2256;
    float _2292 = _2290 + 1.0;
    float _2294 = _1819 * _1877;
    float _2296 = _2264;
    float _2298 = _2153;
    float _2300 = _2179;
    float _2302 = _2294;
    if (!_2252)
    {
        _2296 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2304 = _2296;
    float _2306 = fma(_2286, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2308 = precise::clamp(_2306, 0.0, 1.0);
    float _2310 = _2304;
    float _2312 = _2304;
    if (!_2252)
    {
        _2298 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2314 = _2298;
    float _2316 = fma(_2308, -2.0, 3.0);
    float _2318 = _2308 * _2308;
    float _2320 = _2318 * _2316;
    float _2322 = -_2320;
    float _2324 = _2322 + 1.0;
    float _2326 = fma(_2324, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2320);
    float _2328 = fma(_2179, -0.5, _2280);
    float _2330 = _2292 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2332 = _2314;
    float _2334 = _2314;
    if (!_2252)
    {
        _2300 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2336 = _2300;
    float _2338 = _2278 * _2326;
    out.m_78.x = _2284;
    out.m_78.y = _2328;
    out.m_78.z = _2288;
    out.m_78.w = _2153;
    float _2340 = _2338 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2342 = _2294 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2344 = _2336;
    float _2346 = _2336;
    if (!_2252)
    {
        _2302 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2348 = _2302;
    float _2350 = -_2191;
    float _2352 = _2350 + 1.0;
    float _2354 = _2352 * _2340;
    float _2356 = precise::clamp(_2354, 0.0, 1.0);
    float _2358 = -_2356;
    float _2360 = fma(_2358, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2362 = _2360 * _2260;
    float _2364 = _2330 * _2207;
    float _2366 = -_2330;
    float _2368 = _2366 + 1.0;
    float _2370 = _2362 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2372 = _2362;
    float _2374 = _2368;
    float _2376 = _2348;
    float _2378 = _2348;
    if (!_2252)
    {
        _2372 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2380 = _2372;
    float _2382 = _2224 * _2364;
    out.m_80.x = _2370;
    float _2384 = _2234 * _2364;
    float _2386 = fma(_2230, _2382, _2218);
    float _2388 = fma(_2232, _2382, _2220);
    float _2390 = _2224 * _2368;
    float _2392 = fma(_2224, _2384, _2222);
    float _2394 = _2380;
    float _2396 = _2380;
    if (!_2252)
    {
        _2374 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2398 = _2374;
    out.m_82.x = _2386;
    out.m_82.y = _2388;
    out.m_82.z = _2392;
    out.m_82.w = _2390;
    bool _2400 = !_2252;
    float _2402 = _2398;
    float _2404 = _2398;
    if (!_2400)
    {
        bool _2406 = _1999 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2408 = isnan(_1999);
        bool _2410 = _2406 || _2408;
        bool _2412 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2414 = _2410 || _2412;
        if (!_2414)
        {
            float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2418 = _1999 + _2416;
            float _2420 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2422 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2420;
            float _2424 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2426 = _2424 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2428 = 1.0 / _2422;
            float _2430 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2432 = _2430 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2434 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2436 = _2434 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2440 = _2438 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2444 = _2442 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2446 = _2418 * _2428;
            float _2448 = precise::clamp(_2446, 0.0, 1.0);
            float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2452 = _2450 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2454 = fma(_2448, _2426, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2456 = fma(_2448, _2452, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2458 = fma(_2448, _2432, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2460 = fma(_2448, _2436, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2462 = fma(_2448, _2440, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2464 = fma(_2448, _2444, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2404 = _2458;
            _2346 = _2462;
            _2396 = _2454;
            _2312 = _2460;
            _2334 = _2456;
            _2378 = _2464;
            _2466 = true;
        }
        else
        {
            bool _2468 = _1999 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2470 = isnan(_1999);
            bool _2472 = _2468 || _2470;
            bool _2474 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2476 = _2472 || _2474;
            if (!_2476)
            {
                _2394 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2478 = _2394;
            _2396 = _2478;
            if (!_2476)
            {
                _2402 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2480 = _2402;
            _2404 = _2480;
            if (!_2476)
            {
                _2332 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2482 = _2332;
            _2334 = _2482;
            if (!_2476)
            {
                _2310 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2484 = _2310;
            _2312 = _2484;
            if (!_2476)
            {
                _2344 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2486 = _2344;
            _2346 = _2486;
            if (!_2476)
            {
                _2376 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2488 = _2376;
            bool _2490 = !_2476;
            _2378 = _2488;
            if (!_2490)
            {
                bool _2492 = _1999 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2494 = isnan(_1999);
                bool _2496 = _2492 || _2494;
                bool _2498 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2500 = _2496 || _2498;
                if (!_2500)
                {
                    float _2502 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2504 = _1999 + _2502;
                    float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2508 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2506;
                    float _2510 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2512 = _2510 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2514 = 1.0 / _2508;
                    float _2516 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2518 = _2516 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2520 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2522 = _2520 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2530 = _2528 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2532 = _2504 * _2514;
                    float _2534 = precise::clamp(_2532, 0.0, 1.0);
                    float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2538 = _2536 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2540 = fma(_2534, _2512, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2542 = fma(_2534, _2538, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2544 = fma(_2534, _2518, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2546 = fma(_2534, _2522, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2548 = fma(_2534, _2526, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2550 = fma(_2534, _2530, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2404 = _2544;
                    _2346 = _2548;
                    _2396 = _2540;
                    _2312 = _2546;
                    _2334 = _2542;
                    _2378 = _2550;
                    _2466 = true;
                }
                else
                {
                    _2404 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2346 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2396 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2312 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2334 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2378 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2466 = false;
    float _2552 = _2404;
    float _2554 = _2346;
    float _2556 = _2396;
    float _2558 = _2312;
    float _2560 = _2334;
    float _2562 = _2378;
    float _2564 = fma(_1529, -0.5, 0.5);
    float _2566 = precise::clamp(_2564, 0.0, 1.0);
    float _2568 = -_2552;
    float _2570 = _2568 + _2554;
    float _2572 = _2342 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2574 = -_2556;
    float _2576 = _2574 + _2558;
    out.m_84.x = 0.0;
    float _2578 = fma(_2566, _2570, _2552);
    float _2580 = fma(_2566, _2576, _2556);
    out.m_51.x = _2572;
    float _2582 = -_2560;
    float _2584 = _2582 + _2562;
    float _2586 = _2578 * 0.586610972881317138671875;
    bool _2588 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2590 = fma(_2566, _2584, _2560);
    float _2592 = fma(_2580, 0.298911988735198974609375, _2586);
    bool _2594 = _1819 > 0.0;
    bool _2596 = isnan(_1819);
    bool _2598 = _2594 || _2596;
    bool _2600 = isnan(0.0);
    bool _2602 = _2598 || _2600;
    float _2604 = fma(_2590, 0.114477999508380889892578125, _2592);
    bool _2606 = _1877 <= 0.0;
    bool _2608 = !_2602;
    bool _2610 = _2606 || _2608;
    float _2612 = -_2604;
    float _2614 = _2580 + _2612;
    float _2616 = -_2604;
    float _2618 = _2578 + _2616;
    float _2620 = -_2604;
    float _2622 = _2590 + _2620;
    float _2624 = fma(_2614, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2604);
    float _2626 = fma(_2618, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2604);
    float _2628 = fma(_2622, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2604);
    bool _2630 = !_2588;
    if (!_2630)
    {
        float _2632 = -_1749;
        float _2634 = _2632 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2636 = -_1751;
        float _2638 = _2636 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2640 = -_1753;
        float _2642 = _2640 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2644 = _2634 * _2634;
        float _2646 = fma(_2638, _2638, _2644);
        float _2648 = fma(_2642, _2642, _2646);
        float _2650 = sqrt(_2648);
        float _2652 = rsqrt(_2648);
        float _2654 = -_2650;
        float _2656 = _2654 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2658 = _2656 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2660 = precise::clamp(_2658, 0.0, 1.0);
        float _2662 = _2638 * _2652;
        float _2664 = _2634 * _2652;
        float _2666 = abs(_2660);
        float _2668 = log2(_2666);
        float _2670 = _2642 * _2652;
        float _2672 = _2662 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2674 = _1529 * _2664;
        float _2676 = -_2664;
        float _2678 = -_2672;
        float _2680 = fma(_2676, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2678);
        float _2682 = fma(_1527, _2662, _2674);
        float _2684 = -_2670;
        float _2686 = fma(_2684, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2680);
        float _2688 = fma(_1531, _2670, _2682);
        float _2690 = precise::clamp(_2688, 0.0, 1.0);
        float _2692 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2694 = _2686 + _2692;
        float _2696 = _2668 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2698 = _2694 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2700 = precise::clamp(_2698, 0.0, 1.0);
        float _2702 = exp2(_2696);
        float _2704 = _2702 * _2700;
        float _2706 = _2690 * _2704;
        float _2708 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2710 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2712 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2708;
        out.m_84.y = _2710;
        out.m_84.z = _2712;
    }
    out.m_86.x = _2624;
    out.m_86.y = _2626;
    out.m_86.z = _2628;
    if (!_2610)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2714 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2714;
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
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2466 = false;
    bool _1579 = false;
    bool _299 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_48.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    float _113 = as_type<float>(_105);
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _111;
    if (!_109)
    {
        out.m_51.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2772 = as_type<float>(_121);
        out.gl_Position.z = _2772;
    }
    if (!_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_53.w;
    float _127 = float(_105);
    float _129 = 1.0 / _127;
    float _131 = -_125;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_125);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = _133 * _129;
    bool _147 = _133 >= _127;
    bool _149 = !_143;
    bool _151 = _147 || _149;
    out.m_55.x = _145;
    float _153 = _145;
    float _155 = _133;
    if (_151)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _113;
    if (_151)
    {
        out.m_51.x = 0.0;
    }
    if (_151)
    {
        float _159 = _157 * 5.0;
        _123 = as_type<int>(_159);
    }
    int _161 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2844 = as_type<float>(_161);
        out.gl_Position.z = _2844;
    }
    if (_151)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _167 = as_type<int>(_163) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_163) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_165;
    float _201;
    if (!_183)
    {
        float _185 = in.m_60.x;
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        _201 = _145;
    }
    _203 = false;
    float _205 = _201;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _209 = _205 + _207;
    bool _211 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _213 = isnan(_205);
    bool _215 = _211 || _213;
    bool _217 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _219 = _215 || _217;
    float _221 = float(_219);
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _223;
    float _227 = -_221;
    float _229 = _227 + 1.0;
    bool _231 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _233 = isnan(_205);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _239 = _235 || _237;
    float _241 = float(_239);
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _243;
    bool _247 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _249 = 1.0 / _225;
    float _251 = _241 * _229;
    float _253 = -_241;
    float _255 = _253 + 1.0;
    float _257 = _209 * _249;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _259;
    float _263 = fma(_245, _257, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _265 = fma(_261, _257, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _267 = _263 * _251;
    float _269 = _265 * _251;
    float _271 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[143].x, _267);
    float _273 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[143].y, _269);
    float _275 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[144].x, _271);
    float _277 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[144].y, _273);
    bool _279 = !_247;
    float _297;
    if (!_279)
    {
        float _281 = in.m_60.x;
        float _283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _285 = _281 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _289 = _287 * _283;
        float _291 = floor(_289);
        float _293 = -_291;
        float _295 = _289 + _293;
        _297 = _295;
        _299 = true;
    }
    else
    {
        _297 = _145;
    }
    _299 = false;
    float _301 = _297;
    bool _303 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _305 = isnan(_301);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _319 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _321 = isnan(_301);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _337 = _301 + _335;
    float _339 = -_313;
    float _341 = _339 + 1.0;
    bool _343 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _345 = 1.0 / _317;
    float _347 = _329 * _341;
    float _349 = -_329;
    float _351 = _349 + 1.0;
    float _353 = _333 * _345;
    float _355 = fma(_353, _337, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _357 = _355 * _347;
    float _359 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[115].x, _357);
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _367 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[116].x, _359);
    float _369 = _361 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _371 = _363 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _373 = _365 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _375 = _367 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _377 = in.m_62.x;
    float _379 = in.m_62.y;
    out.m_64.x = _369;
    out.m_64.y = _371;
    out.m_64.z = _373;
    out.m_64.w = _375;
    float _381 = _277 * _379;
    float _383 = _275 * _377;
    bool _385 = !_343;
    if (!_385)
    {
        float _387 = in.m_60.x;
        float _389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _391 = _387 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _393 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[11].w, _133);
        float _395 = _393 * _389;
        float _397 = floor(_395);
        float _399 = -_397;
        float _401 = _395 + _399;
        _153 = _401;
    }
    float _403 = _153;
    float _405 = in.m_60.x;
    float _407 = in.m_60.y;
    float _409 = in.m_60.z;
    float _411 = in.m_60.w;
    float _413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _415 = in.m_48.x;
    float _417 = in.m_48.y;
    float _419 = in.m_48.z;
    int _421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _423 = _421 != 0;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _431 = _429 != 0;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _437 = _435 != 0;
    float _439 = 1.0 / _427;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _445 = _411 > 0.5;
    float _447 = _405 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _449 = _407 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _453 = _451 != 0;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _457 = _455 != 0;
    float _459 = -_433;
    float _461 = fma(_447, 2.0, _459);
    float _463 = -_181;
    int _465 = _445 ? as_type<int>(_463) : as_type<int>(_181);
    float _467 = _409 * 2.0;
    bool _469 = _405 > 0.5;
    float _471 = _417 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _473 = fma(_449, -2.0, _441);
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _477 = -_177;
    int _479 = _469 ? as_type<int>(_477) : as_type<int>(_177);
    float _481 = floor(_467);
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _485 = _483 != 0;
    float _487 = _417 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _489 = _417 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _491 = !_423;
    float _493 = _491 ? _177 : as_type<float>(_479);
    float _495 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].x, _471);
    bool _497 = _407 > 0.5;
    float _499 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].x, _487);
    float _501 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].x, _489);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _503;
    float _507 = _407 + _409;
    float _509 = _405 * 2.0;
    float _511 = -_181;
    int _513 = _497 ? as_type<int>(_511) : as_type<int>(_181);
    float _515 = _505 * _439;
    float _517 = _507 + (-1.0);
    float _519 = floor(_509);
    bool _521 = !_431;
    float _523 = _521 ? _181 : as_type<float>(_513);
    float _525 = _407 + _405;
    float _527 = -_177;
    float _529 = _497 ? _527 : _177;
    float _531 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _533 = _525 + (-1.0);
    bool _535 = _409 > 0.5;
    float _537 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[4].z, _499);
    bool _539 = !_453;
    float _541 = _539 ? _177 : _529;
    float _543 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _545 = _481 > 0.0;
    float _547 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[5].z, _495);
    bool _549 = _481 >= 0.0;
    bool _551 = isnan(_481);
    bool _553 = _549 || _551;
    bool _555 = isnan(0.0);
    bool _557 = _553 || _555;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _561 = _403 + _559;
    float _563 = _529;
    float _565 = _475;
    if (!_485)
    {
        _563 = _409;
    }
    float _567 = _563;
    float _569 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[6].z, _501);
    float _571 = _567;
    if (_485)
    {
        _571 = _407;
    }
    float _573 = _571;
    float _575 = fma(_515, _561, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _577 = -_181;
    int _579 = _535 ? as_type<int>(_577) : as_type<int>(_181);
    float _581 = _413 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _583 = -_177;
    int _585 = _535 ? as_type<int>(_583) : as_type<int>(_177);
    float _587 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[83].w, _475);
    bool _589 = !_457;
    float _591 = _589 ? _181 : as_type<float>(_579);
    float _593 = -_133;
    float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[76].x, _461);
    bool _597 = !_437;
    float _599 = _597 ? _177 : as_type<float>(_585);
    float _601 = _493 + 0.5;
    bool _603 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _605 = isnan(_403);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _617 = _519 > 0.0;
    float _619 = fma(_581, _601, _595);
    bool _621 = _519 >= 0.0;
    bool _623 = isnan(_519);
    bool _625 = _621 || _623;
    bool _627 = isnan(0.0);
    bool _629 = _625 || _627;
    float _631 = _443 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _633 = _557 ? 0 : 1;
    float _635 = -_613;
    float _637 = _635 + 1.0;
    bool _639 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _641 = isnan(_403);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _473);
    int _653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _655 = _653 != 0;
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _659 = _657 != 0;
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _663 = _661 != 0;
    float _665 = _523 + (-0.5);
    float _667 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _669 = _519;
    if (!_485)
    {
        _565 = _407;
    }
    float _671 = _565;
    float _673 = _649 * _637;
    float _675 = _671;
    if (!_485)
    {
        _669 = _409;
    }
    float _677 = _669;
    float _679 = -_631;
    float _681 = -_651;
    float _683 = fma(_679, _665, _681);
    float _685 = _677;
    if (_485)
    {
        _675 = _405;
    }
    float _687 = _675;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_485)
    {
        _685 = _407;
    }
    float _691 = _685;
    float _693 = _575 * _673;
    float _695 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[83].z, _689);
    float _697 = _687 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _701 = _699 != 0;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _705 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _707 = _691 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _711 = -_649;
    float _713 = _711 + 1.0;
    int _715 = ~_633;
    int _717 = _715 + 1;
    int _719 = _717 + 1;
    float _721 = -_703;
    float _723 = fma(_697, 2.0, _721);
    int _725 = _719;
    if (!_545)
    {
        int _727 = ~_633;
        int _729 = _727 + 1;
        _725 = _729;
    }
    int _731 = _725;
    float _733 = _615 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _735 = !_701;
    float _737 = _735 ? _181 : as_type<float>(_465);
    float _739 = fma(_707, -2.0, _709);
    float _741 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[131].x, _693);
    float _743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _745 = -_591;
    float _747 = _745 + 0.5;
    float _749 = _541 + 0.5;
    float _751 = _599 + 0.5;
    float _753 = -_133;
    float _755 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[81].x, _723);
    float _757 = _667 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _759 = _737 + (-0.5);
    float _761 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _739);
    float _763 = _747 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _765 = fma(_733, _751, _755);
    float _767 = _749 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _769 = -_757;
    float _771 = -_761;
    float _773 = fma(_769, _759, _771);
    float _775 = _763 * _705;
    float _777 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[132].x, _741);
    float _779 = _547 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _785 = _767 * _743;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _791 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[78].z, _781);
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _795 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[78].w, _783);
    float _797 = _537 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _799 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _801 = _779 + _799;
    float _803 = _787 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _805 = _789 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _807 = _793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _809 = _777 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _811 = _569 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _813 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _815 = _797 + _813;
    float _817 = _801 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _819 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _795);
    float _821 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _823 = log2(_821);
    float _825 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _827 = _811 + _825;
    float _829 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[28].x, _817);
    float _831 = -_819;
    float _833 = _831 + 1.0;
    out.m_66.x = _803;
    out.m_66.y = _805;
    out.m_66.z = _807;
    out.m_66.w = _809;
    float _835 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _695);
    float _837 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[28].z, _829);
    float _839 = fma(_523, _833, _683);
    float _841 = _801 * _801;
    out.m_68.x = _785;
    out.m_68.y = _775;
    float _843 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _791);
    bool _845 = _837 >= 0.0;
    float _847 = fma(_815, _815, _841);
    float _849 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _587);
    float _851 = -_843;
    float _853 = _851 + 1.0;
    bool _855 = !_659;
    int _857 = _855 ? 0 : 1;
    float _859 = _823 * _133;
    float _861 = fma(_827, _827, _847);
    bool _863 = !_655;
    int _865 = _863 ? 0 : 1;
    float _867 = -_835;
    float _869 = _867 + 1.0;
    float _871 = float(_731);
    float _873 = -_853;
    float _875 = fma(_493, _873, _619);
    int _877 = abs(_865);
    float _879 = -_869;
    float _881 = fma(_599, _879, _765);
    float _883 = exp2(_859);
    float _885 = float(_877);
    float _887 = _407 * 2.0;
    bool _889 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _891 = isnan(1.0);
    bool _893 = _889 || _891;
    bool _895 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _897 = _893 || _895;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _901 = 1.0 + _899;
    float _903 = _847;
    float _905 = _779;
    if (_845)
    {
        _903 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _907 = _903;
    float _909 = _885 * _871;
    float _911 = -_849;
    float _913 = _911 + 1.0;
    float _915 = in.m_70.x;
    float _917 = in.m_70.y;
    float _919 = in.m_70.z;
    float _921 = rsqrt(_861);
    float _923 = fma(_737, _913, _773);
    int _925 = as_type<int>(_907);
    if (_845)
    {
        float _927 = _907 * 5.0;
        _925 = as_type<int>(_927);
    }
    int _929 = _925;
    if (_845)
    {
        out.m_51.x = 0.0;
    }
    bool _931 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _933 = isnan(0.0);
    bool _935 = _931 || _933;
    bool _937 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _939 = _935 || _937;
    float _941 = -_883;
    float _943 = _941 + 1.0;
    float _945 = floor(_887);
    out.m_72.x = _875;
    out.m_72.y = _839;
    out.m_72.z = _881;
    out.m_72.w = _923;
    bool _947 = !_663;
    int _949 = _947 ? 0 : 1;
    if (_845)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4154 = as_type<float>(_929);
        out.gl_Position.z = _4154;
    }
    float _951 = 1.0 / _901;
    float _953 = _801 * _921;
    float _955 = _815 * _921;
    if (_845)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _957 = -_953;
    float _959 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[18].w, _779);
    float _961 = _827 * _921;
    float _963 = -_955;
    float _965 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[18].w, _797);
    int _967 = _629 ? 0 : 1;
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _971 = _959 + _969;
    float _973 = -_961;
    float _975 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[18].w, _811);
    float _977 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _979 = _965 + _977;
    float _981 = _909 * (-2.0);
    float _983 = _971 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _985 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _987 = _975 + _985;
    int _989 = ~_967;
    int _991 = _989 + 1;
    int _993 = _991 + 1;
    float _995 = fma(_543, _981, _543);
    float _997 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[28].x, _983);
    int _999 = _993;
    float _1001 = _961;
    float _1003 = _971;
    if (!_617)
    {
        int _1005 = ~_967;
        int _1007 = _1005 + 1;
        _999 = _1007;
    }
    int _1009 = _999;
    float _1011 = -_953;
    float _1013 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[18].w, _801);
    int _1015 = abs(_857);
    float _1017 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[28].z, _997);
    float _1019 = _939 ? _943 : 0.0;
    float _1021 = fma(_981, _915, _915);
    float _1023 = _405 + (-0.5);
    bool _1025 = _945 > 0.0;
    float _1027 = -_955;
    float _1029 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[18].w, _815);
    bool _1031 = _1017 >= 0.0;
    float _1033 = _1013 * _1013;
    float _1035 = float(_1009);
    if (_897)
    {
        float _1037 = _1019 * _951;
        _155 = _1037;
    }
    float _1039 = _155;
    float _1041 = float(_1015);
    float _1043 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1021);
    bool _1045 = _945 >= 0.0;
    bool _1047 = isnan(_945);
    bool _1049 = _1045 || _1047;
    bool _1051 = isnan(0.0);
    bool _1053 = _1049 || _1051;
    float _1055 = fma(_1029, _1029, _1033);
    float _1057 = -_961;
    float _1059 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[18].w, _827);
    float _1061 = _1041 * _1035;
    float _1063 = fma(_995, _1039, _1043);
    int _1065 = _1053 ? 0 : 1;
    float _1067 = fma(_1059, _1059, _1055);
    float _1069 = _1061 * (-2.0);
    float _1071 = _1063 * 0.15915493667125701904296875;
    int _1073 = ~_1065;
    int _1075 = _1073 + 1;
    int _1077 = _1075 + 1;
    int _1079 = _1077;
    float _1081 = _1055;
    if (!_1025)
    {
        int _1083 = ~_1065;
        int _1085 = _1083 + 1;
        _1079 = _1085;
    }
    int _1087 = _1079;
    float _1089 = fma(_531, _1069, _531);
    if (_1031)
    {
        _1081 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1091 = _1081;
    float _1093 = sqrt(_1067);
    int _1095 = as_type<int>(_1091);
    if (_1031)
    {
        out.m_51.x = 0.0;
    }
    float _1097 = fma(_1069, _917, _917);
    float _1099 = _407 + (-0.5);
    if (_1031)
    {
        float _1101 = _1091 * 5.0;
        _1095 = as_type<int>(_1101);
    }
    int _1103 = _1095;
    int _1105 = abs(_949);
    float _1107 = _1071 * 6.283185482025146484375;
    float _1109 = sin(_1107);
    if (_1031)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4404 = as_type<float>(_1103);
        out.gl_Position.z = _4404;
    }
    if (_1031)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1111 = -_779;
    float _1113 = _1111 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1115 = -_797;
    float _1117 = _1115 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1119 = -_811;
    float _1121 = _1119 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1123 = _1113 * _1113;
    float _1125 = float(_1087);
    float _1127 = _409 + _405;
    float _1129 = float(_1105);
    float _1131 = fma(_1117, _1117, _1123);
    float _1133 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1097);
    float _1135 = _1127 + (-1.0);
    float _1137 = _409 + (-0.5);
    float _1139 = fma(_1121, _1121, _1131);
    float _1141 = _1129 * _1125;
    float _1143 = fma(_1089, _1039, _1133);
    float _1145 = _1071 * 6.283185482025146484375;
    float _1147 = cos(_1145);
    float _1149 = _1141 * (-2.0);
    float _1151 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1153 = _1143 * 0.15915493667125701904296875;
    float _1155 = fma(_1149, _919, _919);
    float _1157 = fma(_1151, _1149, _1151);
    float _1159 = rsqrt(_1139);
    float _1161 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1155);
    float _1163 = fma(_1157, _1039, _1161);
    float _1165 = _1153 * 6.283185482025146484375;
    float _1167 = sin(_1165);
    float _1169 = _1163 * 0.15915493667125701904296875;
    float _1171 = _1117 * _1159;
    float _1173 = _1121 * _1159;
    float _1175 = _1113 * _1159;
    float _1177 = _1153 * 6.283185482025146484375;
    float _1179 = cos(_1177);
    float _1181 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1183 = _1171 * _1181;
    float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1187 = _1173 * _1185;
    float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1191 = _1175 * _1189;
    float _1193 = _381 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1195 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1197 = -_1183;
    float _1199 = fma(_1173, _1195, _1197);
    float _1201 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1203 = -_1187;
    float _1205 = fma(_1175, _1201, _1203);
    float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1209 = -_1191;
    float _1211 = fma(_1171, _1207, _1209);
    float _1213 = _1169 * 6.283185482025146484375;
    float _1215 = sin(_1213);
    float _1217 = _1199 * _1199;
    float _1219 = _1109 * _1167;
    float _1221 = _1147 * _1167;
    float _1223 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _1225 = fma(_1205, _1205, _1217);
    float _1227 = _921 * _1093;
    float _1229 = _1169 * 6.283185482025146484375;
    float _1231 = cos(_1229);
    float _1233 = fma(_1211, _1211, _1225);
    float _1235 = _1147 * _1179;
    float _1237 = _1109 * _1179;
    float _1239 = rsqrt(_1233);
    float _1241 = fma(_1215, _1235, _1219);
    float _1243 = fma(_1215, _1219, _1235);
    float _1245 = _1147 * _1231;
    float _1247 = _1179 * _1231;
    float _1249 = _1109 * _1231;
    float _1251 = _1167 * _1231;
    float _1253 = _383 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1255 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _1257 = _1227 * _1193;
    float _1259 = _1227 * _1253;
    float _1261 = _1205 * _1239;
    float _1263 = _1255 * _1257;
    float _1265 = _1199 * _1239;
    float _1267 = _1223 * _1259;
    float _1269 = -_1221;
    float _1271 = fma(_1215, _1237, _1269);
    float _1273 = _1245 * _1263;
    float _1275 = -_1237;
    float _1277 = fma(_1215, _1221, _1275);
    float _1279 = _1211 * _1239;
    float _1281 = _1227 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1283 = _1281 * 0.5;
    float _1285 = -_1263;
    float _1287 = _1215 * _1285;
    float _1289 = fma(_1241, _1267, _1273);
    float _1291 = _1173 * _1265;
    float _1293 = _1175 * _1261;
    float _1295 = _1249 * _1263;
    float _1297 = fma(_1247, _1267, _1287);
    float _1299 = fma(_1277, _1283, _1289);
    float _1301 = -_1291;
    float _1303 = fma(_1175, _1279, _1301);
    float _1305 = -_1293;
    float _1307 = fma(_1171, _1265, _1305);
    float _1309 = fma(_1271, _1267, _1295);
    float _1311 = fma(_1251, _1283, _1297);
    float _1313 = _1303 * _1299;
    float _1315 = _1307 * _1299;
    float _1317 = fma(_1243, _1283, _1309);
    float _1319 = _1245 * _1303;
    float _1321 = fma(_1261, _1311, _1313);
    float _1323 = fma(_1279, _1311, _1315);
    float _1325 = _1171 * _1279;
    float _1327 = _1245 * _1307;
    float _1329 = fma(_1171, _1317, _1321);
    float _1331 = fma(_1173, _1317, _1323);
    float _1333 = -_1325;
    float _1335 = fma(_1173, _1261, _1333);
    float _1337 = _1241 * _1303;
    float _1339 = _797 + _1329;
    float _1341 = _811 + _1331;
    float _1343 = _1335 * _1299;
    float _1345 = _1245 * _1335;
    float _1347 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1349 = _1339 + _1347;
    float _1351 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1353 = _1341 + _1351;
    float _1355 = _1241 * _1335;
    float _1357 = _1241 * _1307;
    float _1359 = _1349 * _1349;
    float _1361 = _1353 * _1353;
    float _1363 = _1277 * _1307;
    float _1365 = fma(_1265, _1311, _1343);
    float _1367 = _1277 * _1303;
    float _1369 = _1359 + _1361;
    float _1371 = -_1215;
    float _1373 = fma(_1371, _1265, _1345);
    float _1375 = fma(_1175, _1317, _1365);
    float _1377 = _1277 * _1335;
    float _1379 = sqrt(_1369);
    float _1381 = -_1215;
    float _1383 = fma(_1381, _1261, _1319);
    float _1385 = -_1215;
    float _1387 = fma(_1385, _1279, _1327);
    float _1389 = _779 + _1375;
    float _1391 = fma(_1247, _1261, _1337);
    float _1393 = fma(_1247, _1265, _1355);
    float _1395 = fma(_1247, _1279, _1357);
    float _1397 = fma(_1251, _1261, _1367);
    float _1399 = fma(_1251, _1265, _1377);
    float _1401 = fma(_1249, _1171, _1383);
    float _1403 = fma(_1249, _1175, _1373);
    float _1405 = fma(_1251, _1279, _1363);
    float _1407 = fma(_1249, _1173, _1387);
    bool _1409 = _1379 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1411 = _1261;
    float _1413 = _1359;
    float _1415 = _1361;
    float _1417 = _1341;
    float _1419 = _1339;
    if (!_1409)
    {
        _1411 = _1359;
    }
    float _1421 = _1411;
    float _1423 = _1421;
    if (!_1409)
    {
        _1413 = _1389;
    }
    float _1425 = _1413;
    bool _1427 = !_1409;
    float _1429 = _1425;
    if (!_1427)
    {
        float _1431 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1433 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1435 = _1379 + _1433;
        float _1437 = rsqrt(_1369);
        float _1439 = _1435 * _1431;
        float _1441 = _1389 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1443 = _1439 * 0.15915493667125701904296875;
        float _1445 = _1443 * 6.283185482025146484375;
        float _1447 = sin(_1445);
        float _1449 = _1443 * 6.283185482025146484375;
        float _1451 = cos(_1449);
        float _1453 = fma(_1447, _1441, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1455 = _1437 * _1453;
        float _1457 = fma(_1349, _1455, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1459 = _1451 + (-1.0);
        float _1461 = fma(_1353, _1455, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1463 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1465 = _1457 + _1463;
        float _1467 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1469 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1471 = _1461 + _1469;
        float _1473 = _1465 * _1465;
        float _1475 = fma(_1389, _1451, _1467);
        float _1477 = _1471 * _1471;
        _1429 = _1475;
        _1423 = _1473;
        _1415 = _1477;
        _1417 = _1461;
        _1419 = _1457;
    }
    float _1479 = _1429;
    float _1481 = _1423;
    float _1483 = _1415;
    float _1485 = _1417;
    float _1487 = _1419;
    float _1489 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1491 = _1479 + _1489;
    float _1493 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1495 = fma(_1271, _1171, _1391);
    float _1497 = fma(_1243, _1171, _1397);
    float _1499 = fma(_1491, _1491, _1481);
    float _1501 = fma(_1243, _1175, _1399);
    float _1503 = fma(_1243, _1173, _1405);
    float _1505 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1507 = _1499 + _1483;
    float _1509 = _1493 * _1401;
    float _1511 = fma(_1271, _1175, _1393);
    float _1513 = fma(_1271, _1173, _1395);
    float _1515 = _1493 * _1403;
    float _1517 = _1493 * _1407;
    float _1519 = sqrt(_1507);
    float _1521 = fma(_1505, _1495, _1509);
    float _1523 = fma(_1505, _1511, _1515);
    float _1525 = fma(_1505, _1513, _1517);
    float _1527 = _1497 + _1521;
    float _1529 = _1501 + _1523;
    float _1531 = _1503 + _1525;
    out.m_74.x = _1527;
    out.m_74.y = _1529;
    out.m_74.z = _1531;
    bool _1533 = _1519 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1535 = isnan(_1519);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1541 = _1537 || _1539;
    float _1543 = _1515;
    if (!_1541)
    {
        _1543 = 1.0;
    }
    float _1545 = _1543;
    bool _1547 = !_1541;
    float _1549 = _1545;
    if (!_1547)
    {
        bool _1551 = _1519 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1553 = isnan(_1519);
        bool _1555 = _1551 || _1553;
        bool _1557 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1559 = _1555 || _1557;
        if (!_1559)
        {
            float _1561 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1563 = _1519 + _1561;
            float _1565 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1567 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1565;
            float _1569 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1571 = _1569 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1573 = 1.0 / _1567;
            float _1575 = _1563 * _1573;
            float _1577 = fma(_1575, _1571, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1549 = _1577;
            _1579 = true;
        }
        else
        {
            bool _1581 = _1519 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1583 = isnan(_1519);
            bool _1585 = _1581 || _1583;
            bool _1587 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1589 = _1585 || _1587;
            if (!_1589)
            {
                float _1591 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1593 = _1519 + _1591;
                float _1595 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1597 = _1595 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1599 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1601 = _1599 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1603 = 1.0 / _1597;
                float _1605 = _1593 * _1603;
                float _1607 = fma(_1605, _1601, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1549 = _1607;
                _1579 = true;
            }
            else
            {
                _1549 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1579 = false;
    float _1609 = _1549;
    float _1611 = _959 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1613 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1615 = _1479 + _1613;
    float _1617 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1611);
    float _1619 = _959 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1621 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1623 = _1485 + _1621;
    float _1625 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1617);
    bool _1627 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1629 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1631 = _1627 || _1629;
    bool _1633 = isnan(0.5);
    bool _1635 = _1631 || _1633;
    float _1637 = fma(_1615, _1609, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _1639 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1641 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1643 = _1639 || _1641;
    bool _1645 = isnan(0.5);
    bool _1647 = _1643 || _1645;
    float _1649 = _1625 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1651 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1619);
    float _1653 = fma(_1623, _1609, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1655 = 1.0 / _1649;
    float _1657 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1651);
    float _1659 = -_961;
    float _1661 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1653);
    float _1663 = _1657 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1665 = _1663 + _1649;
    float _1667 = _1649;
    float _1669 = _1661;
    if (_1647)
    {
        _1667 = 1.0;
    }
    float _1671 = _1667;
    float _1673 = _1665 * _1655;
    float _1675 = _1673 * 0.5;
    float _1677 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1679 = _1487 + _1677;
    float _1681 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1683 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1681);
    float _1685 = fma(_1679, _1609, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1687 = -_953;
    float _1689 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1637);
    float _1691 = 1.0 / _1683;
    float _1693 = -_955;
    float _1695 = fma(_1693, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1685);
    float _1697 = _1689;
    float _1699 = _1695;
    float _1701 = _1671;
    if (!_1635)
    {
        float _1703 = _971 * _971;
        float _1705 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1707 = -_811;
        float _1709 = _1707 + _1653;
        float _1711 = -_779;
        float _1713 = _1711 + _1637;
        float _1715 = fma(_979, _979, _1703);
        float _1717 = fma(_987, _987, _1715);
        float _1719 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1721 = sqrt(_1717);
        float _1723 = 1.0 / _1227;
        float _1725 = _1719 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1727 = precise::min(_1721, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1729 = _1727 * _1705;
        float _1731 = -_797;
        float _1733 = _1731 + _1685;
        float _1735 = _1729 * _1723;
        float _1737 = _1725 * _1735;
        float _1739 = _1709 * _1735;
        float _1741 = fma(_1713, _1737, _959);
        float _1743 = fma(_1733, _1737, _965);
        float _1745 = fma(_1725, _1739, _975);
        _1001 = _1735;
        _1697 = _1741;
        _1699 = _1743;
        _1669 = _1745;
        _905 = _1737;
    }
    float _1747 = _1001;
    float _1749 = _1697;
    float _1751 = _1699;
    float _1753 = _1669;
    float _1755 = _905;
    float _1757 = _1755;
    float _1759 = _1747;
    if (_1647)
    {
        _1757 = 1.0;
    }
    float _1761 = _1757;
    float _1763 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1765 = _1691 * _1763;
    float _1767 = _1761;
    if (!_1647)
    {
        float _1769 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1771 = _1769 * 0.15915493667125701904296875;
        float _1773 = _1771 * 6.283185482025146484375;
        float _1775 = cos(_1773);
        float _1777 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1779 = _1777 * 0.15915493667125701904296875;
        float _1781 = _1771 * 6.283185482025146484375;
        float _1783 = sin(_1781);
        float _1785 = 1.0 / _1775;
        float _1787 = _1779 * 6.283185482025146484375;
        float _1789 = cos(_1787);
        float _1791 = _1783 * _1785;
        float _1793 = _1779 * 6.283185482025146484375;
        float _1795 = sin(_1793);
        float _1797 = _1789 * _1791;
        float _1799 = 1.0 / _1797;
        float _1801 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1803 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1801;
        float _1805 = 1.0 / _1803;
        float _1807 = _1795 * _1799;
        float _1809 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1811 = fma(_1765, _1807, _1809);
        float _1813 = _1811 * _1805;
        float _1815 = precise::clamp(_1813, 0.0, 1.0);
        _1759 = _1779;
        _1701 = _1815;
    }
    float _1817 = _1759;
    float _1819 = _1701;
    float _1821 = _1817;
    if (!_1647)
    {
        float _1823 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1825 = _1823 * 0.15915493667125701904296875;
        float _1827 = _1825 * 6.283185482025146484375;
        float _1829 = cos(_1827);
        float _1831 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1833 = _1831 * 0.15915493667125701904296875;
        float _1835 = _1825 * 6.283185482025146484375;
        float _1837 = sin(_1835);
        float _1839 = 1.0 / _1829;
        float _1841 = _1833 * 6.283185482025146484375;
        float _1843 = cos(_1841);
        float _1845 = _1837 * _1839;
        float _1847 = _1833 * 6.283185482025146484375;
        float _1849 = sin(_1847);
        float _1851 = _1843 * _1845;
        float _1853 = 1.0 / _1851;
        float _1855 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1857 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1855;
        float _1859 = 1.0 / _1857;
        float _1861 = _1849 * _1853;
        float _1863 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1865 = fma(_1765, _1861, _1863);
        float _1867 = _1865 * _1859;
        float _1869 = precise::clamp(_1867, 0.0, 1.0);
        float _1871 = -_1869;
        float _1873 = _1871 + 1.0;
        _1821 = _1853;
        _1767 = _1873;
    }
    float _1875 = _1821;
    float _1877 = _1767;
    float _1879 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1881 = _1749 + _1879;
    float _1883 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1885 = _1751 + _1883;
    float _1887 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1889 = _1753 + _1887;
    float _1891 = _1881 * _1881;
    float _1893 = fma(_1885, _1885, _1891);
    float _1895 = fma(_1889, _1889, _1893);
    float _1897 = rsqrt(_1895);
    float _1899 = _1897 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1901 = _1885 * _1899;
    float _1903 = _1889 * _1899;
    float _1905 = _1901 * _1901;
    float _1907 = _1903 * _1903;
    float _1909 = _1905 + _1907;
    float _1911 = sqrt(_1909);
    bool _1913 = _1911 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1915 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1917 = _1911 + _1915;
    float _1919 = _1897;
    float _1921 = _1909;
    float _1923 = _1917;
    float _1925 = _1875;
    float _1927 = _1881;
    float _1929 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1913)
    {
        float _1931 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1919 = _1931;
    }
    float _1933 = _1919;
    if (_1913)
    {
        float _1935 = rsqrt(_1909);
        _1921 = _1935;
    }
    float _1937 = _1921;
    float _1939 = _1937;
    if (_1913)
    {
        float _1941 = _1917 * _1933;
        _1923 = _1941;
    }
    float _1943 = _1923;
    if (_1913)
    {
        float _1945 = _1943 * 0.15915493667125701904296875;
        _1003 = _1945;
    }
    float _1947 = _1003;
    float _1949 = _1933;
    float _1951 = _1947;
    if (_1913)
    {
        float _1953 = _1947 * 6.283185482025146484375;
        float _1955 = sin(_1953);
        _1949 = _1955;
    }
    float _1957 = _1949;
    float _1959 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1961 = precise::max(0.0, _1959);
    float _1963 = _1889;
    float _1965 = _1961;
    if (_1913)
    {
        float _1967 = _1947 * 6.283185482025146484375;
        float _1969 = cos(_1967);
        _1963 = _1969;
    }
    float _1971 = _1963;
    float _1973 = -_1899;
    float _1975 = -_1961;
    float _1977 = fma(_1881, _1973, _1975);
    if (_1913)
    {
        float _1979 = _1977 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1965 = _1979;
    }
    float _1981 = _1965;
    if (!_1913)
    {
        _1951 = _1901;
    }
    float _1983 = _1951;
    float _1985 = _1957;
    float _1987 = _1983;
    if (_1913)
    {
        float _1989 = fma(_1957, _1981, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1925 = _1989;
    }
    float _1991 = _1925;
    float _1993 = fma(_965, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1995 = _1991;
    if (!_1913)
    {
        _1985 = _1903;
    }
    float _1997 = _1985;
    float _1999 = sqrt(_1895);
    float _2001 = _1997;
    float _2003 = _1971;
    if (_1913)
    {
        float _2005 = _1971 + (-1.0);
        _1927 = _2005;
    }
    float _2007 = _1927;
    float _2009 = _2007;
    if (_1913)
    {
        float _2011 = _1937 * _1991;
        _1929 = _2011;
    }
    float _2013 = _1929;
    if (!_1913)
    {
        _1995 = _1977;
    }
    float _2015 = _1995;
    float _2017 = _2015;
    if (_1913)
    {
        float _2019 = _2007 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2009 = _2019;
    }
    float _2021 = _2009;
    if (_1913)
    {
        float _2023 = _1901 * _2013;
        _1987 = _2023;
    }
    float _2025 = _1987;
    if (!_1913)
    {
        _1939 = _1905;
    }
    float _2027 = _1939;
    float _2029 = _2027;
    if (_1913)
    {
        float _2031 = _1903 * _2013;
        _2001 = _2031;
    }
    float _2033 = _2001;
    if (_1913)
    {
        float _2035 = fma(_1977, _1971, _2021);
        _2017 = _2035;
    }
    float _2037 = _2017;
    if (_1913)
    {
        float _2039 = _2025 * _2025;
        _2029 = _2039;
    }
    float _2041 = _2029;
    if (!_1913)
    {
        _2003 = _1907;
    }
    float _2043 = _2003;
    float _2045 = _2043;
    if (_1913)
    {
        float _2047 = _2033 * _2033;
        _2045 = _2047;
    }
    float _2049 = _2045;
    float _2051 = fma(_2037, _2037, _2041);
    float _2053 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2055 = floor(_1993);
    float _2057 = _2051 + _2049;
    float _2059 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2053);
    float _2061 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2063 = fma(_1999, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2061);
    float _2065 = precise::clamp(_2063, 0.0, 1.0);
    float _2067 = fma(_975, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2069 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2059);
    float _2071 = -_2065;
    float _2073 = _2071 + 1.0;
    float _2075 = rsqrt(_2057);
    float _2077 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2079 = _2069 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2081 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2083 = _2079 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2085 = abs(_2073);
    float _2087 = log2(_2085);
    float _2089 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2091 = -_2083;
    float _2093 = fma(_2091, _2077, 1.0);
    float _2095 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2097 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2081);
    float _2099 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2089);
    float _2101 = -_2055;
    float _2103 = _1993 + _2101;
    float _2105 = _2075 * _2025;
    float _2107 = _2075 * _2037;
    float _2109 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2095);
    float _2111 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2099);
    float _2113 = _2075 * _2033;
    float _2115 = _2105 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2117 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2109);
    float _2119 = _2111 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2121 = floor(_2067);
    float _2123 = -_2115;
    float _2125 = fma(_2107, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2123);
    float _2127 = _2117 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2129 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2131 = _2087 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2133 = -_2113;
    float _2135 = fma(_2133, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2125);
    float _2137 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2097);
    float _2139 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2129);
    float _2141 = exp2(_2131);
    float _2143 = fma(_2135, -0.5, 0.5);
    float _2145 = _2137 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2147 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2139);
    float _2149 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2151 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2153 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2147);
    float _2155 = log2(_2093);
    float _2157 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2149);
    float _2159 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2151);
    float _2161 = fma(_2135, 0.5, 0.5);
    float _2163 = -_2121;
    float _2165 = _2067 + _2163;
    float _2167 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2157);
    float _2169 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2159);
    float _2171 = fma(_2161, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2173 = 1.0 / _2153;
    float _2175 = _2107 + 1.0;
    float _2177 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2167);
    float _2179 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2169);
    float _2181 = fma(_2161, _2171, -0.212114393711090087890625);
    float _2183 = -_2107;
    float _2185 = fma(_2141, _2175, _2183);
    float _2187 = sqrt(_2143);
    float _2189 = _2155 * 0.693147182464599609375;
    float2 _6121 = float2(_2103, _2165);
    float _2191 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6121, float2(0.0), isnan(_6121)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6121, float2(0.0), isnan(_6121)), level(0.0)).x;
    float _2193 = fma(_2161, _2181, 1.570728778839111328125);
    float _2195 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2197 = _2177 * _2173;
    float _2199 = _2179 * _2173;
    float _2201 = fma(_2197, 0.5, 0.5);
    float _2203 = fma(_2199, -0.5, 0.5);
    float _2205 = _2187 * 0.636619746685028076171875;
    float3 _6153 = float3(_2201, _2203, _2195);
    float _2207 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6153, float3(0.0), isnan(_6153)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6153, float3(0.0), isnan(_6153)), level(0.0)).x;
    float _2209 = -_2193;
    float _2211 = fma(_2205, _2209, 1.0);
    float _2213 = fma(_2185, 0.5, 0.5);
    float3 _6171 = float3(_2201, _2203, _2195);
    float4 _2216 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6171, float3(0.0), isnan(_6171)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6171, float3(0.0), isnan(_6171)), level(0.0)).xyzw;
    float _2218 = _2216.x;
    float _2220 = _2216.y;
    float _2222 = _2216.z;
    float _2224 = _2216.w;
    float2 _6187 = float2(_2211, _2213);
    float3 _2228 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6187, float2(0.0), isnan(_6187)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6187, float2(0.0), isnan(_6187)), level(0.0)).xyz;
    float _2230 = _2228.x;
    float _2232 = _2228.y;
    float _2234 = _2228.z;
    float _2236 = abs(_1765);
    float _2238 = log2(_2236);
    float _2240 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2242 = _2087 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2244 = _1999 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2246 = isnan(_1999);
    bool _2248 = _2244 || _2246;
    bool _2250 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2252 = _2248 || _2250;
    float _2254 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2240);
    float _2256 = exp2(_2242);
    float _2258 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2254);
    float _2260 = in.m_76.x;
    float _2262 = _2177 + _2153;
    float _2264 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2258);
    float _2266 = _2238 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2268 = _1765 <= 8000.0;
    bool _2270 = isnan(_1765);
    bool _2272 = _2268 || _2270;
    bool _2274 = isnan(8000.0);
    bool _2276 = _2272 || _2274;
    float _2278 = float(_2276);
    float _2280 = _2153 * 0.5;
    float _2282 = _2264 + _2153;
    float _2284 = _2262 * 0.5;
    out.gl_Position.x = _2177;
    out.gl_Position.y = _2179;
    out.gl_Position.z = _2264;
    out.gl_Position.w = _2153;
    float _2286 = exp2(_2266);
    float _2288 = _2282 * 0.5;
    float _2290 = -_2256;
    float _2292 = _2290 + 1.0;
    float _2294 = _1819 * _1877;
    float _2296 = _2264;
    float _2298 = _2153;
    float _2300 = _2179;
    float _2302 = _2294;
    if (!_2252)
    {
        _2296 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2304 = _2296;
    float _2306 = fma(_2286, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2308 = precise::clamp(_2306, 0.0, 1.0);
    float _2310 = _2304;
    float _2312 = _2304;
    if (!_2252)
    {
        _2298 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2314 = _2298;
    float _2316 = fma(_2308, -2.0, 3.0);
    float _2318 = _2308 * _2308;
    float _2320 = _2318 * _2316;
    float _2322 = -_2320;
    float _2324 = _2322 + 1.0;
    float _2326 = fma(_2324, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2320);
    float _2328 = fma(_2179, -0.5, _2280);
    float _2330 = _2292 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2332 = _2314;
    float _2334 = _2314;
    if (!_2252)
    {
        _2300 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2336 = _2300;
    float _2338 = _2278 * _2326;
    out.m_78.x = _2284;
    out.m_78.y = _2328;
    out.m_78.z = _2288;
    out.m_78.w = _2153;
    float _2340 = _2338 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2342 = _2294 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2344 = _2336;
    float _2346 = _2336;
    if (!_2252)
    {
        _2302 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2348 = _2302;
    float _2350 = -_2191;
    float _2352 = _2350 + 1.0;
    float _2354 = _2352 * _2340;
    float _2356 = precise::clamp(_2354, 0.0, 1.0);
    float _2358 = -_2356;
    float _2360 = fma(_2358, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2362 = _2360 * _2260;
    float _2364 = _2330 * _2207;
    float _2366 = -_2330;
    float _2368 = _2366 + 1.0;
    float _2370 = _2362 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2372 = _2362;
    float _2374 = _2368;
    float _2376 = _2348;
    float _2378 = _2348;
    if (!_2252)
    {
        _2372 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2380 = _2372;
    float _2382 = _2224 * _2364;
    out.m_80.x = _2370;
    float _2384 = _2234 * _2364;
    float _2386 = fma(_2230, _2382, _2218);
    float _2388 = fma(_2232, _2382, _2220);
    float _2390 = _2224 * _2368;
    float _2392 = fma(_2224, _2384, _2222);
    float _2394 = _2380;
    float _2396 = _2380;
    if (!_2252)
    {
        _2374 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2398 = _2374;
    out.m_82.x = _2386;
    out.m_82.y = _2388;
    out.m_82.z = _2392;
    out.m_82.w = _2390;
    bool _2400 = !_2252;
    float _2402 = _2398;
    float _2404 = _2398;
    if (!_2400)
    {
        bool _2406 = _1999 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2408 = isnan(_1999);
        bool _2410 = _2406 || _2408;
        bool _2412 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2414 = _2410 || _2412;
        if (!_2414)
        {
            float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2418 = _1999 + _2416;
            float _2420 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2422 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2420;
            float _2424 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2426 = _2424 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2428 = 1.0 / _2422;
            float _2430 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2432 = _2430 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2434 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2436 = _2434 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2440 = _2438 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2444 = _2442 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2446 = _2418 * _2428;
            float _2448 = precise::clamp(_2446, 0.0, 1.0);
            float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2452 = _2450 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2454 = fma(_2448, _2426, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2456 = fma(_2448, _2452, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2458 = fma(_2448, _2432, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2460 = fma(_2448, _2436, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2462 = fma(_2448, _2440, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2464 = fma(_2448, _2444, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2404 = _2458;
            _2346 = _2462;
            _2396 = _2454;
            _2312 = _2460;
            _2334 = _2456;
            _2378 = _2464;
            _2466 = true;
        }
        else
        {
            bool _2468 = _1999 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2470 = isnan(_1999);
            bool _2472 = _2468 || _2470;
            bool _2474 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2476 = _2472 || _2474;
            if (!_2476)
            {
                _2394 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2478 = _2394;
            _2396 = _2478;
            if (!_2476)
            {
                _2402 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2480 = _2402;
            _2404 = _2480;
            if (!_2476)
            {
                _2332 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2482 = _2332;
            _2334 = _2482;
            if (!_2476)
            {
                _2310 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2484 = _2310;
            _2312 = _2484;
            if (!_2476)
            {
                _2344 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2486 = _2344;
            _2346 = _2486;
            if (!_2476)
            {
                _2376 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2488 = _2376;
            bool _2490 = !_2476;
            _2378 = _2488;
            if (!_2490)
            {
                bool _2492 = _1999 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2494 = isnan(_1999);
                bool _2496 = _2492 || _2494;
                bool _2498 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2500 = _2496 || _2498;
                if (!_2500)
                {
                    float _2502 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2504 = _1999 + _2502;
                    float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2508 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2506;
                    float _2510 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2512 = _2510 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2514 = 1.0 / _2508;
                    float _2516 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2518 = _2516 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2520 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2522 = _2520 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2530 = _2528 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2532 = _2504 * _2514;
                    float _2534 = precise::clamp(_2532, 0.0, 1.0);
                    float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2538 = _2536 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2540 = fma(_2534, _2512, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2542 = fma(_2534, _2538, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2544 = fma(_2534, _2518, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2546 = fma(_2534, _2522, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2548 = fma(_2534, _2526, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2550 = fma(_2534, _2530, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2404 = _2544;
                    _2346 = _2548;
                    _2396 = _2540;
                    _2312 = _2546;
                    _2334 = _2542;
                    _2378 = _2550;
                    _2466 = true;
                }
                else
                {
                    _2404 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2346 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2396 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2312 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2334 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2378 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2466 = false;
    float _2552 = _2404;
    float _2554 = _2346;
    float _2556 = _2396;
    float _2558 = _2312;
    float _2560 = _2334;
    float _2562 = _2378;
    float _2564 = fma(_1529, -0.5, 0.5);
    float _2566 = precise::clamp(_2564, 0.0, 1.0);
    float _2568 = -_2552;
    float _2570 = _2568 + _2554;
    float _2572 = _2342 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2574 = -_2556;
    float _2576 = _2574 + _2558;
    out.m_84.x = 0.0;
    float _2578 = fma(_2566, _2570, _2552);
    float _2580 = fma(_2566, _2576, _2556);
    out.m_51.x = _2572;
    float _2582 = -_2560;
    float _2584 = _2582 + _2562;
    float _2586 = _2578 * 0.586610972881317138671875;
    bool _2588 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2590 = fma(_2566, _2584, _2560);
    float _2592 = fma(_2580, 0.298911988735198974609375, _2586);
    bool _2594 = _1819 > 0.0;
    bool _2596 = isnan(_1819);
    bool _2598 = _2594 || _2596;
    bool _2600 = isnan(0.0);
    bool _2602 = _2598 || _2600;
    float _2604 = fma(_2590, 0.114477999508380889892578125, _2592);
    bool _2606 = _1877 <= 0.0;
    bool _2608 = !_2602;
    bool _2610 = _2606 || _2608;
    float _2612 = -_2604;
    float _2614 = _2580 + _2612;
    float _2616 = -_2604;
    float _2618 = _2578 + _2616;
    float _2620 = -_2604;
    float _2622 = _2590 + _2620;
    float _2624 = fma(_2614, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2604);
    float _2626 = fma(_2618, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2604);
    float _2628 = fma(_2622, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2604);
    bool _2630 = !_2588;
    if (!_2630)
    {
        float _2632 = -_1749;
        float _2634 = _2632 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2636 = -_1751;
        float _2638 = _2636 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2640 = -_1753;
        float _2642 = _2640 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2644 = _2634 * _2634;
        float _2646 = fma(_2638, _2638, _2644);
        float _2648 = fma(_2642, _2642, _2646);
        float _2650 = sqrt(_2648);
        float _2652 = rsqrt(_2648);
        float _2654 = -_2650;
        float _2656 = _2654 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2658 = _2656 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2660 = precise::clamp(_2658, 0.0, 1.0);
        float _2662 = _2638 * _2652;
        float _2664 = _2634 * _2652;
        float _2666 = abs(_2660);
        float _2668 = log2(_2666);
        float _2670 = _2642 * _2652;
        float _2672 = _2662 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2674 = _1529 * _2664;
        float _2676 = -_2664;
        float _2678 = -_2672;
        float _2680 = fma(_2676, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2678);
        float _2682 = fma(_1527, _2662, _2674);
        float _2684 = -_2670;
        float _2686 = fma(_2684, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2680);
        float _2688 = fma(_1531, _2670, _2682);
        float _2690 = precise::clamp(_2688, 0.0, 1.0);
        float _2692 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2694 = _2686 + _2692;
        float _2696 = _2668 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2698 = _2694 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2700 = precise::clamp(_2698, 0.0, 1.0);
        float _2702 = exp2(_2696);
        float _2704 = _2702 * _2700;
        float _2706 = _2690 * _2704;
        float _2708 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2710 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2712 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2708;
        out.m_84.y = _2710;
        out.m_84.z = _2712;
    }
    out.m_86.x = _2624;
    out.m_86.y = _2626;
    out.m_86.z = _2628;
    if (!_2610)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2714 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2714;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

