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
    float4 m_66 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_88 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 m_72 [[user(locn5)]];
    float4 m_80 [[user(locn6)]];
    float4 m_70 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_86 [[user(locn9)]];
    float4 m_82 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_78 [[attribute(0)]];
    float4 m_74 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_62 [[attribute(5)]];
    float4 m_64 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2590 = false;
    bool _1605 = false;
    bool _329 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_48.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    if (!_111)
    {
        out.m_51.x = 0.0;
    }
    int _117 = 0;
    if (!_111)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2894 = as_type<float>(_121);
        out.gl_Position.z = _2894;
    }
    if (!_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_53.w;
    float _127 = float(_107);
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
    float _153 = _125;
    float _155 = _145;
    float _157 = _133;
    if (_151)
    {
        _153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _153;
    if (_151)
    {
        out.m_51.x = 0.0;
    }
    if (_151)
    {
        float _161 = _159 * 5.0;
        _123 = as_type<int>(_161);
    }
    int _163 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2967 = as_type<float>(_163);
        out.gl_Position.z = _2967;
    }
    if (_151)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = in.m_60.x;
    float _169 = in.m_60.y;
    float _171 = in.m_60.z;
    int _173 = as_type<int>(_165) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_165) & 2;
    bool _179 = _177 != 0;
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _183 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _185 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _187 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _189 = !_175;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _183);
    float _195 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _185);
    float _197 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _187);
    bool _199 = !_179;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _193);
    float _205 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _195);
    float _207 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _197);
    bool _209 = !_181;
    float _211 = _207;
    float _213 = _205;
    float _231;
    if (!_209)
    {
        float _215 = in.m_62.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        _231 = _145;
    }
    _233 = false;
    float _235 = _231;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = _235 + _237;
    bool _241 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _243 = isnan(_235);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _253;
    float _257 = -_251;
    float _259 = _257 + 1.0;
    bool _261 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _263 = isnan(_235);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _273;
    bool _277 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _279 = 1.0 / _255;
    float _281 = _271 * _259;
    float _283 = -_271;
    float _285 = _283 + 1.0;
    float _287 = _239 * _279;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _289;
    float _293 = fma(_275, _287, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _295 = fma(_291, _287, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _297 = _293 * _281;
    float _299 = _295 * _281;
    float _301 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[143].x, _297);
    float _303 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[143].y, _299);
    float _305 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[144].x, _301);
    float _307 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[144].y, _303);
    bool _309 = !_277;
    float _327;
    if (!_309)
    {
        float _311 = in.m_62.x;
        float _313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _315 = _311 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _319 = _317 * _313;
        float _321 = floor(_319);
        float _323 = -_321;
        float _325 = _319 + _323;
        _327 = _325;
        _329 = true;
    }
    else
    {
        _327 = _145;
    }
    _329 = false;
    float _331 = _327;
    float _333 = in.m_64.x;
    float _335 = in.m_64.y;
    bool _337 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _339 = isnan(_331);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _353 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _355 = isnan(_331);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _371 = _331 + _369;
    float _373 = -_347;
    float _375 = _373 + 1.0;
    bool _377 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _379 = 1.0 / _351;
    float _381 = _363 * _375;
    float _383 = -_363;
    float _385 = _383 + 1.0;
    float _387 = _307 * _335;
    float _389 = _305 * _333;
    float _391 = _367 * _379;
    float _393 = fma(_391, _371, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _395 = _393 * _381;
    float _397 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[115].x, _395);
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _405 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[116].x, _397);
    float _407 = _399 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _409 = _401 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = _403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _413 = _405 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _407;
    out.m_66.y = _409;
    out.m_66.z = _411;
    out.m_66.w = _413;
    bool _415 = !_377;
    if (!_415)
    {
        float _417 = in.m_62.x;
        float _419 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _421 = _417 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _423 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[11].w, _133);
        float _425 = _423 * _419;
        float _427 = floor(_425);
        float _429 = -_427;
        float _431 = _425 + _429;
        _155 = _431;
    }
    float _433 = _155;
    float _435 = in.m_62.x;
    float _437 = in.m_62.y;
    float _439 = in.m_62.z;
    float _441 = in.m_62.w;
    float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _445 = in.m_48.x;
    float _447 = in.m_48.y;
    float _449 = in.m_48.z;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _453 = _451 != 0;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _457 = _455 != 0;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _463 = _461 != 0;
    float _465 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _469 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _471 = _437 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _473 = _441 > 0.5;
    float _475 = _435 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _479 = fma(_471, -2.0, _459);
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _483 = _481 != 0;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _487 = _485 != 0;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _493 = -_201;
    int _495 = _473 ? as_type<int>(_493) : as_type<int>(_201);
    float _497 = -_467;
    float _499 = fma(_475, 2.0, _497);
    bool _501 = _435 > 0.5;
    float _503 = _447 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _505 = 1.0 / _491;
    float _507 = _447 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _509 = -_191;
    int _511 = _501 ? as_type<int>(_509) : as_type<int>(_191);
    float _513 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[4].x, _503);
    int _515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _517 = _515 != 0;
    float _519 = _439 * 2.0;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _521;
    float _525 = _447 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _527 = _435 * 2.0;
    float _529 = floor(_519);
    bool _531 = !_453;
    float _533 = _531 ? _191 : as_type<float>(_511);
    float _535 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[6].x, _525);
    bool _537 = _437 > 0.5;
    float _539 = _437 + _439;
    float _541 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[5].x, _507);
    float _543 = -_133;
    float _545 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[76].x, _499);
    float _547 = -_201;
    int _549 = _537 ? as_type<int>(_547) : as_type<int>(_201);
    float _551 = floor(_527);
    float _553 = _539 + (-1.0);
    float _555 = _523 * _505;
    float _557 = _437 + _435;
    bool _559 = !_457;
    float _561 = _559 ? _201 : as_type<float>(_549);
    float _563 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _565 = _439 > 0.5;
    float _567 = _557 + (-1.0);
    float _569 = _533 + 0.5;
    float _571 = -_191;
    int _573 = _537 ? as_type<int>(_571) : as_type<int>(_191);
    float _575 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[4].z, _513);
    bool _577 = _529 > 0.0;
    float _579 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _581 = _529 >= 0.0;
    bool _583 = isnan(_529);
    bool _585 = _581 || _583;
    bool _587 = isnan(0.0);
    bool _589 = _585 || _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _593 = _433 + _591;
    float _595 = _553;
    float _597 = _443;
    float _599 = _535;
    if (!_517)
    {
        _595 = _439;
    }
    float _601 = _595;
    float _603 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[5].z, _541);
    float _605 = _601;
    if (_517)
    {
        _605 = _437;
    }
    float _607 = _605;
    float _609 = fma(_555, _593, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _611 = -_191;
    int _613 = _565 ? as_type<int>(_611) : as_type<int>(_191);
    float _615 = _443 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _617 = -_201;
    int _619 = _565 ? as_type<int>(_617) : as_type<int>(_201);
    float _621 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[83].w, _477);
    bool _623 = !_463;
    float _625 = _623 ? _191 : as_type<float>(_613);
    float _627 = fma(_615, _569, _545);
    bool _629 = _551 > 0.0;
    float _631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _633 = _551 >= 0.0;
    bool _635 = isnan(_551);
    bool _637 = _633 || _635;
    bool _639 = isnan(0.0);
    bool _641 = _637 || _639;
    float _643 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[6].z, _535);
    bool _645 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _647 = isnan(_433);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = _603 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _659 = !_487;
    float _661 = _659 ? _201 : as_type<float>(_619);
    float _663 = _465 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _665 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _667 = isnan(_433);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _479);
    float _679 = -_655;
    float _681 = _679 + 1.0;
    float _683 = _561 + (-0.5);
    float _685 = -_661;
    float _687 = _685 + 0.5;
    float _689 = _657;
    if (!_517)
    {
        _597 = _437;
    }
    float _691 = _597;
    float _693 = _675 * _681;
    float _695 = _691;
    if (_517)
    {
        _695 = _435;
    }
    float _697 = _695;
    float _699 = -_663;
    float _701 = -_677;
    float _703 = fma(_699, _683, _701);
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _707 = !_483;
    float _709 = _707 ? _191 : as_type<float>(_573);
    float _711 = _609 * _693;
    int _713 = _589 ? 0 : 1;
    float _715 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[83].z, _705);
    if (!_517)
    {
        _599 = _439;
    }
    float _717 = _599;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _723 = _721 != 0;
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _727 = _725 != 0;
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _731 = _729 != 0;
    float _733 = _697 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _735 = _717;
    if (_517)
    {
        _735 = _437;
    }
    float _737 = _735;
    float _739 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _741 = -_719;
    float _743 = fma(_733, 2.0, _741);
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _747 = _745 != 0;
    float _749 = _737 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _751 = -_675;
    float _753 = _751 + 1.0;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _757 = _631 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _759 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _761 = !_747;
    float _763 = _761 ? _201 : as_type<float>(_495);
    float _765 = fma(_749, -2.0, _755);
    float _767 = _625 + 0.5;
    float _769 = -_133;
    float _771 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[81].x, _743);
    float _773 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[131].x, _711);
    float _775 = _709 + 0.5;
    float _777 = _469 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _779 = fma(_757, _767, _771);
    float _781 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[132].x, _773);
    float _783 = _775 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _785 = _763 + (-0.5);
    float _787 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _765);
    float _789 = _687 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _791 = _783 * _739;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _795 = -_777;
    float _797 = -_787;
    float _799 = fma(_795, _785, _797);
    float _801 = _789 * _759;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _805 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[78].w, _793);
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _809 = ~_713;
    int _811 = _809 + 1;
    int _813 = _811 + 1;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _817 = _813;
    if (!_577)
    {
        int _819 = ~_713;
        int _821 = _819 + 1;
        _817 = _821;
    }
    int _823 = _817;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _827 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[78].z, _803);
    float _829 = _575 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _831 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _833 = _657 + _831;
    float _835 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _805);
    float _837 = _807 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _839 = _815 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _841 = _825 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _843 = _781 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _845 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _847 = log2(_845);
    float _849 = _643 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _851 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _853 = _829 + _851;
    float _855 = _833 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _857 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _827);
    float _859 = -_835;
    float _861 = _859 + 1.0;
    float _863 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _865 = _849 + _863;
    float _867 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[28].x, _855);
    float _869 = -_857;
    float _871 = _869 + 1.0;
    out.m_68.x = _837;
    out.m_68.y = _839;
    out.m_68.z = _841;
    out.m_68.w = _843;
    float _873 = fma(_561, _861, _703);
    float _875 = _833 * _833;
    float _877 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[28].z, _867);
    float _879 = -_871;
    float _881 = fma(_533, _879, _627);
    float _883 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _621);
    float _885 = fma(_853, _853, _875);
    out.m_70.x = _791;
    out.m_70.y = _801;
    bool _887 = _877 >= 0.0;
    float _889 = _847 * _133;
    float _891 = float(_823);
    float _893 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _715);
    float _895 = _437 * 2.0;
    bool _897 = !_723;
    int _899 = _897 ? 0 : 1;
    float _901 = fma(_865, _865, _885);
    float _903 = -_883;
    float _905 = _903 + 1.0;
    int _907 = abs(_899);
    float _909 = exp2(_889);
    bool _911 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _913 = isnan(1.0);
    bool _915 = _911 || _913;
    bool _917 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _919 = _915 || _917;
    float _921 = fma(_763, _905, _799);
    float _923 = float(_907);
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _927 = 1.0 + _925;
    float _929 = -_893;
    float _931 = _929 + 1.0;
    float _933 = _883;
    if (_887)
    {
        _933 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _935 = _933;
    int _937 = as_type<int>(_935);
    if (_887)
    {
        out.m_51.x = 0.0;
    }
    float _939 = rsqrt(_901);
    float _941 = _923 * _891;
    float _943 = -_931;
    float _945 = fma(_625, _943, _779);
    if (_887)
    {
        float _947 = _935 * 5.0;
        _937 = as_type<int>(_947);
    }
    int _949 = _937;
    bool _951 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _953 = isnan(0.0);
    bool _955 = _951 || _953;
    bool _957 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _959 = _955 || _957;
    out.m_72.x = _881;
    out.m_72.y = _873;
    out.m_72.z = _945;
    out.m_72.w = _921;
    float _961 = 1.0 / _927;
    float _963 = -_909;
    float _965 = _963 + 1.0;
    bool _967 = !_727;
    int _969 = _967 ? 0 : 1;
    float _971 = in.m_74.x;
    float _973 = in.m_74.y;
    float _975 = in.m_74.z;
    bool _977 = !_731;
    int _979 = _977 ? 0 : 1;
    if (_887)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4330 = as_type<float>(_949);
        out.gl_Position.z = _4330;
    }
    float _981 = floor(_895);
    float _983 = _853 * _939;
    float _985 = _833 * _939;
    if (_887)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _987 = -_985;
    float _989 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[18].w, _657);
    float _991 = _865 * _939;
    float _993 = -_983;
    float _995 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[18].w, _829);
    float _997 = _959 ? _965 : 0.0;
    float _999 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1001 = _989 + _999;
    float _1003 = -_991;
    float _1005 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[18].w, _849);
    float _1007 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1009 = _995 + _1007;
    int _1011 = _641 ? 0 : 1;
    float _1013 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1015 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1017 = _1005 + _1015;
    bool _1019 = _981 > 0.0;
    float _1021 = -_985;
    float _1023 = fma(_1021, (*spvDescriptorSet0.vp_c9)._m0[18].w, _833);
    float _1025 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1013);
    bool _1027 = _981 >= 0.0;
    bool _1029 = isnan(_981);
    bool _1031 = _1027 || _1029;
    bool _1033 = isnan(0.0);
    bool _1035 = _1031 || _1033;
    float _1037 = _941 * (-2.0);
    int _1039 = ~_1011;
    int _1041 = _1039 + 1;
    int _1043 = _1041 + 1;
    float _1045 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1025);
    int _1047 = _1043;
    if (!_629)
    {
        int _1049 = ~_1011;
        int _1051 = _1049 + 1;
        _1047 = _1051;
    }
    int _1053 = _1047;
    float _1055 = fma(_579, _1037, _579);
    float _1057 = fma(_1037, _971, _971);
    float _1059 = _435 + (-0.5);
    bool _1061 = _1045 >= 0.0;
    float _1063 = -_983;
    float _1065 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[18].w, _853);
    float _1067 = _1023 * _1023;
    float _1069 = _1055;
    if (_919)
    {
        float _1071 = _997 * _961;
        _157 = _1071;
    }
    float _1073 = _157;
    float _1075 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1057);
    int _1077 = abs(_969);
    float _1079 = fma(_1065, _1065, _1067);
    float _1081 = -_991;
    float _1083 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[18].w, _865);
    float _1085 = fma(_1055, _1073, _1075);
    float _1087 = float(_1053);
    float _1089 = _437 + (-0.5);
    float _1091 = float(_1077);
    float _1093 = fma(_1083, _1083, _1079);
    float _1095 = _1085 * 0.15915493667125701904296875;
    if (_1061)
    {
        _1069 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1097 = _1069;
    int _1099 = as_type<int>(_1097);
    if (_1061)
    {
        out.m_51.x = 0.0;
    }
    float _1101 = _1091 * _1087;
    float _1103 = _1095 * 6.283185482025146484375;
    float _1105 = sin(_1103);
    int _1107 = _1035 ? 0 : 1;
    if (_1061)
    {
        float _1109 = _1097 * 5.0;
        _1099 = as_type<int>(_1109);
    }
    int _1111 = _1099;
    float _1113 = _1101 * (-2.0);
    int _1115 = ~_1107;
    int _1117 = _1115 + 1;
    int _1119 = _1117 + 1;
    float _1121 = fma(_1113, _973, _973);
    float _1123 = sqrt(_1093);
    int _1125 = _1119;
    if (!_1019)
    {
        int _1127 = ~_1107;
        int _1129 = _1127 + 1;
        _1125 = _1129;
    }
    int _1131 = _1125;
    if (_1061)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4572 = as_type<float>(_1111);
        out.gl_Position.z = _4572;
    }
    float _1133 = fma(_563, _1113, _563);
    int _1135 = abs(_979);
    if (_1061)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1137 = -_657;
    float _1139 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1141 = float(_1131);
    float _1143 = -_829;
    float _1145 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1147 = -_849;
    float _1149 = _1147 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1151 = _1139 * _1139;
    float _1153 = float(_1135);
    float _1155 = fma(_1089, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1121);
    float _1157 = _439 + _435;
    float _1159 = fma(_1145, _1145, _1151);
    float _1161 = _1153 * _1141;
    float _1163 = fma(_1133, _1073, _1155);
    float _1165 = fma(_1149, _1149, _1159);
    float _1167 = _1157 + (-1.0);
    float _1169 = _1161 * (-2.0);
    float _1171 = _1163 * 0.15915493667125701904296875;
    float _1173 = _439 + (-0.5);
    float _1175 = fma(_1167, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1177 = rsqrt(_1165);
    float _1179 = fma(_1169, _975, _975);
    float _1181 = fma(_1175, _1169, _1175);
    float _1183 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1179);
    float _1185 = _1095 * 6.283185482025146484375;
    float _1187 = cos(_1185);
    float _1189 = fma(_1181, _1073, _1183);
    float _1191 = _1189 * 0.15915493667125701904296875;
    float _1193 = _1145 * _1177;
    float _1195 = _1149 * _1177;
    float _1197 = _1171 * 6.283185482025146484375;
    float _1199 = sin(_1197);
    float _1201 = _1139 * _1177;
    float _1203 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1205 = _1193 * _1203;
    float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1209 = _1195 * _1207;
    float _1211 = _939 * _1123;
    float _1213 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1215 = _1201 * _1213;
    float _1217 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1219 = -_1205;
    float _1221 = fma(_1195, _1217, _1219);
    float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1225 = -_1209;
    float _1227 = fma(_1201, _1223, _1225);
    float _1229 = _1171 * 6.283185482025146484375;
    float _1231 = cos(_1229);
    float _1233 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1235 = -_1215;
    float _1237 = fma(_1193, _1233, _1235);
    float _1239 = _1221 * _1221;
    float _1241 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1243 = _1241 * 0.5;
    float _1245 = fma(_1227, _1227, _1239);
    float _1247 = _1191 * 6.283185482025146484375;
    float _1249 = sin(_1247);
    float _1251 = _1105 * _1199;
    float _1253 = fma(_1237, _1237, _1245);
    float _1255 = _1187 * _1199;
    float _1257 = _1191 * 6.283185482025146484375;
    float _1259 = cos(_1257);
    float _1261 = _1187 * _1231;
    float _1263 = _1105 * _1231;
    float _1265 = rsqrt(_1253);
    float _1267 = fma(_1249, _1261, _1251);
    float _1269 = fma(_1249, _1251, _1261);
    float _1271 = _1187 * _1259;
    float _1273 = _1231 * _1259;
    float _1275 = _1105 * _1259;
    float _1277 = _1199 * _1259;
    float _1279 = _387 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1281 = _389 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1283 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _1285 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1287 = _1211 * _1279;
    float _1289 = _1211 * _1281;
    float _1291 = _1221 * _1265;
    float _1293 = -_1255;
    float _1295 = fma(_1249, _1263, _1293);
    float _1297 = _1283 * _1287;
    float _1299 = _1285 * _1289;
    float _1301 = _1227 * _1265;
    float _1303 = -_1263;
    float _1305 = fma(_1249, _1255, _1303);
    float _1307 = _1271 * _1297;
    float _1309 = _1237 * _1265;
    float _1311 = -_1297;
    float _1313 = _1249 * _1311;
    float _1315 = _1195 * _1291;
    float _1317 = fma(_1267, _1299, _1307);
    float _1319 = _1201 * _1301;
    float _1321 = _1275 * _1297;
    float _1323 = fma(_1273, _1299, _1313);
    float _1325 = fma(_1305, _1243, _1317);
    float _1327 = -_1315;
    float _1329 = fma(_1201, _1309, _1327);
    float _1331 = -_1319;
    float _1333 = fma(_1193, _1291, _1331);
    float _1335 = fma(_1295, _1299, _1321);
    float _1337 = fma(_1277, _1243, _1323);
    float _1339 = _1329 * _1325;
    float _1341 = _1333 * _1325;
    float _1343 = fma(_1269, _1243, _1335);
    float _1345 = _1193 * _1309;
    float _1347 = fma(_1301, _1337, _1339);
    float _1349 = fma(_1309, _1337, _1341);
    float _1351 = _1271 * _1329;
    float _1353 = -_1345;
    float _1355 = fma(_1195, _1301, _1353);
    float _1357 = fma(_1193, _1343, _1347);
    float _1359 = fma(_1195, _1343, _1349);
    float _1361 = _1271 * _1333;
    float _1363 = _1271 * _1355;
    float _1365 = _829 + _1357;
    float _1367 = _849 + _1359;
    float _1369 = _1267 * _1329;
    float _1371 = _1267 * _1355;
    float _1373 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1375 = _1365 + _1373;
    float _1377 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1379 = _1367 + _1377;
    float _1381 = _1267 * _1333;
    float _1383 = _1305 * _1329;
    float _1385 = _1375 * _1375;
    float _1387 = _1379 * _1379;
    float _1389 = _1305 * _1333;
    float _1391 = _1305 * _1355;
    float _1393 = _1355 * _1325;
    float _1395 = _1385 + _1387;
    float _1397 = -_1249;
    float _1399 = fma(_1397, _1301, _1351);
    float _1401 = -_1249;
    float _1403 = fma(_1401, _1291, _1363);
    float _1405 = fma(_1291, _1337, _1393);
    float _1407 = sqrt(_1395);
    float _1409 = -_1249;
    float _1411 = fma(_1409, _1309, _1361);
    float _1413 = fma(_1273, _1301, _1369);
    float _1415 = fma(_1201, _1343, _1405);
    float _1417 = fma(_1273, _1291, _1371);
    float _1419 = fma(_1277, _1301, _1383);
    float _1421 = fma(_1277, _1291, _1391);
    float _1423 = fma(_1277, _1309, _1389);
    float _1425 = fma(_1275, _1193, _1399);
    float _1427 = _657 + _1415;
    float _1429 = fma(_1275, _1201, _1403);
    float _1431 = fma(_1273, _1309, _1381);
    float _1433 = fma(_1275, _1195, _1411);
    bool _1435 = _1407 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1437 = _1415;
    float _1439 = _1385;
    float _1441 = _1387;
    float _1443 = _1365;
    float _1445 = _1367;
    if (!_1435)
    {
        _1437 = _1385;
    }
    float _1447 = _1437;
    float _1449 = _1447;
    if (!_1435)
    {
        _1439 = _1427;
    }
    float _1451 = _1439;
    bool _1453 = !_1435;
    float _1455 = _1451;
    if (!_1453)
    {
        float _1457 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1459 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1461 = _1407 + _1459;
        float _1463 = rsqrt(_1395);
        float _1465 = _1461 * _1457;
        float _1467 = _1427 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1469 = _1465 * 0.15915493667125701904296875;
        float _1471 = _1469 * 6.283185482025146484375;
        float _1473 = sin(_1471);
        float _1475 = _1469 * 6.283185482025146484375;
        float _1477 = cos(_1475);
        float _1479 = fma(_1473, _1467, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1481 = _1463 * _1479;
        float _1483 = fma(_1375, _1481, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1485 = _1477 + (-1.0);
        float _1487 = fma(_1379, _1481, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1489 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1491 = _1483 + _1489;
        float _1493 = _1485 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1495 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1497 = _1487 + _1495;
        float _1499 = _1491 * _1491;
        float _1501 = fma(_1427, _1477, _1493);
        float _1503 = _1497 * _1497;
        _1455 = _1501;
        _1449 = _1499;
        _1441 = _1503;
        _1443 = _1483;
        _1445 = _1487;
    }
    float _1505 = _1455;
    float _1507 = _1449;
    float _1509 = _1441;
    float _1511 = _1443;
    float _1513 = _1445;
    float _1515 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1517 = _1505 + _1515;
    float _1519 = fma(_1295, _1201, _1417);
    float _1521 = fma(_1269, _1201, _1421);
    float _1523 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1525 = fma(_1517, _1517, _1507);
    float _1527 = fma(_1295, _1193, _1413);
    float _1529 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1531 = _1523 * _1425;
    float _1533 = _1525 + _1509;
    float _1535 = fma(_1295, _1195, _1431);
    float _1537 = fma(_1269, _1193, _1419);
    float _1539 = _1523 * _1429;
    float _1541 = _1523 * _1433;
    float _1543 = fma(_1269, _1195, _1423);
    float _1545 = fma(_1529, _1527, _1531);
    float _1547 = sqrt(_1533);
    float _1549 = fma(_1529, _1519, _1539);
    float _1551 = fma(_1529, _1535, _1541);
    float _1553 = _1537 + _1545;
    float _1555 = _1521 + _1549;
    float _1557 = _1543 + _1551;
    out.m_76.x = _1553;
    out.m_76.y = _1555;
    out.m_76.z = _1557;
    bool _1559 = _1547 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1561 = isnan(_1547);
    bool _1563 = _1559 || _1561;
    bool _1565 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1567 = _1563 || _1565;
    float _1569 = _1531;
    if (!_1567)
    {
        _1569 = 1.0;
    }
    float _1571 = _1569;
    bool _1573 = !_1567;
    float _1575 = _1571;
    if (!_1573)
    {
        bool _1577 = _1547 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1579 = isnan(_1547);
        bool _1581 = _1577 || _1579;
        bool _1583 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1585 = _1581 || _1583;
        if (!_1585)
        {
            float _1587 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1589 = _1547 + _1587;
            float _1591 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1593 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1591;
            float _1595 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1597 = _1595 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1599 = 1.0 / _1593;
            float _1601 = _1589 * _1599;
            float _1603 = fma(_1601, _1597, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1575 = _1603;
            _1605 = true;
        }
        else
        {
            bool _1607 = _1547 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1609 = isnan(_1547);
            bool _1611 = _1607 || _1609;
            bool _1613 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1615 = _1611 || _1613;
            if (!_1615)
            {
                float _1617 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1619 = _1547 + _1617;
                float _1621 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1623 = _1621 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1625 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1627 = _1625 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1629 = 1.0 / _1623;
                float _1631 = _1619 * _1629;
                float _1633 = fma(_1631, _1627, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1575 = _1633;
                _1605 = true;
            }
            else
            {
                _1575 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1605 = false;
    float _1635 = _1575;
    float _1637 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1639 = _1505 + _1637;
    float _1641 = _989 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1643 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1645 = _1511 + _1643;
    float _1647 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1649 = _1513 + _1647;
    float _1651 = fma(_1639, _1635, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1653 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1641);
    float _1655 = fma(_1645, _1635, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1657 = fma(_1649, _1635, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1659 = -_657;
    float _1661 = _1659 + _1651;
    float _1663 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1653);
    float _1665 = -_829;
    float _1667 = _1665 + _1655;
    float _1669 = -_849;
    float _1671 = _1669 + _1657;
    float _1673 = _1661 * _1661;
    float _1675 = _1663 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1677 = _989 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1679 = fma(_1667, _1667, _1673);
    float _1681 = 1.0 / _1675;
    float _1683 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1677);
    float _1685 = fma(_1671, _1671, _1679);
    float _1687 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1683);
    float _1689 = sqrt(_1685);
    float _1691 = _1687 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1693 = _1691 + _1675;
    float _1695 = _1693 * _1681;
    float _1697 = _1695 * 0.5;
    bool _1699 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1701 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1703 = _1699 || _1701;
    bool _1705 = isnan(0.5);
    bool _1707 = _1703 || _1705;
    bool _1709 = _1689 > 0.0;
    float _1711 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1713 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1711);
    bool _1715 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1717 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1719 = _1715 || _1717;
    bool _1721 = isnan(0.5);
    bool _1723 = _1719 || _1721;
    float _1725 = 1.0 / _1713;
    float _1727 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1729 = _1681;
    float _1731 = _1651;
    float _1733 = _1657;
    if (!_1709)
    {
        _1727 = _1655;
    }
    float _1735 = _1727;
    float _1737 = _1735;
    if (!_1709)
    {
        _1729 = _1657;
    }
    float _1739 = _1729;
    bool _1741 = !_1709;
    float _1743 = _1739;
    float _1745 = _1739;
    if (!_1741)
    {
        float _1747 = _205 * _205;
        float _1749 = fma(_203, _203, _1747);
        float _1751 = fma(_207, _207, _1749);
        float _1753 = rsqrt(_1685);
        float _1755 = sqrt(_1751);
        float _1757 = _1667 * _1753;
        float _1759 = _1661 * _1753;
        float _1761 = _1671 * _1753;
        bool _1763 = _1755 > 0.0;
        float _1765 = _1755;
        if (!_1763)
        {
            _1765 = _1655;
        }
        float _1767 = _1765;
        _1737 = _1767;
        if (!_1763)
        {
            _1743 = _1657;
        }
        float _1769 = _1743;
        bool _1771 = !_1763;
        _1745 = _1769;
        if (!_1771)
        {
            float _1773 = rsqrt(_1751);
            float _1775 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1777 = _205 * _1773;
            float _1779 = _203 * _1773;
            float _1781 = _207 * _1773;
            float _1783 = _1759 * _1777;
            float _1785 = fma(_1757, _1779, _1783);
            float _1787 = _1775 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1789 = fma(_1761, _1781, _1785);
            float _1791 = _1789 * _1787;
            float _1793 = fma(_203, _1791, _1655);
            float _1795 = fma(_205, _1791, _1651);
            float _1797 = fma(_207, _1791, _1657);
            _1737 = _1793;
            _1731 = _1795;
            _1745 = _1797;
        }
    }
    float _1799 = _1737;
    float _1801 = _1731;
    float _1803 = _1745;
    float _1805 = -_983;
    float _1807 = fma(_1805, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1799);
    float _1809 = -_985;
    float _1811 = fma(_1809, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1801);
    float _1813 = -_991;
    float _1815 = fma(_1813, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1803);
    float _1817 = _1811;
    float _1819 = _1807;
    float _1821 = _1815;
    float _1823 = _1803;
    if (_1723)
    {
        _1733 = 1.0;
    }
    float _1825 = _1733;
    float _1827 = _1825;
    if (!_1707)
    {
        float _1829 = _1001 * _1001;
        float _1831 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1833 = -_849;
        float _1835 = _1833 + _1803;
        float _1837 = -_657;
        float _1839 = _1837 + _1801;
        float _1841 = fma(_1009, _1009, _1829);
        float _1843 = -_829;
        float _1845 = _1843 + _1799;
        float _1847 = fma(_1017, _1017, _1841);
        float _1849 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1851 = sqrt(_1847);
        float _1853 = 1.0 / _1211;
        float _1855 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1857 = precise::min(_1851, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1859 = _1857 * _1831;
        float _1861 = _1859 * _1853;
        float _1863 = _1855 * _1861;
        float _1865 = _1835 * _1861;
        float _1867 = fma(_1839, _1863, _989);
        float _1869 = fma(_1845, _1863, _995);
        float _1871 = fma(_1855, _1865, _1005);
        _1817 = _1867;
        _1819 = _1869;
        _1821 = _1871;
        _1823 = _1865;
        _689 = _1863;
    }
    float _1873 = _1817;
    float _1875 = _1819;
    float _1877 = _1821;
    float _1879 = _1823;
    float _1881 = _689;
    float _1883 = _1881;
    float _1885 = _1879;
    if (_1723)
    {
        _1883 = 1.0;
    }
    float _1887 = _1883;
    float _1889 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1891 = _1725 * _1889;
    float _1893 = _1887;
    if (!_1723)
    {
        float _1895 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1897 = _1895 * 0.15915493667125701904296875;
        float _1899 = _1897 * 6.283185482025146484375;
        float _1901 = cos(_1899);
        float _1903 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1905 = _1903 * 0.15915493667125701904296875;
        float _1907 = _1897 * 6.283185482025146484375;
        float _1909 = sin(_1907);
        float _1911 = 1.0 / _1901;
        float _1913 = _1905 * 6.283185482025146484375;
        float _1915 = cos(_1913);
        float _1917 = _1909 * _1911;
        float _1919 = _1905 * 6.283185482025146484375;
        float _1921 = sin(_1919);
        float _1923 = _1915 * _1917;
        float _1925 = 1.0 / _1923;
        float _1927 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1929 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1927;
        float _1931 = 1.0 / _1929;
        float _1933 = _1921 * _1925;
        float _1935 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1937 = fma(_1891, _1933, _1935);
        float _1939 = _1937 * _1931;
        float _1941 = precise::clamp(_1939, 0.0, 1.0);
        _211 = _1931;
        _213 = _1905;
        _1827 = _1941;
    }
    float _1943 = _211;
    float _1945 = _213;
    float _1947 = _1827;
    float _1949 = _1943;
    if (!_1723)
    {
        float _1951 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1953 = _1951 * 0.15915493667125701904296875;
        float _1955 = _1953 * 6.283185482025146484375;
        float _1957 = cos(_1955);
        float _1959 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1961 = _1959 * 0.15915493667125701904296875;
        float _1963 = _1953 * 6.283185482025146484375;
        float _1965 = sin(_1963);
        float _1967 = 1.0 / _1957;
        float _1969 = _1961 * 6.283185482025146484375;
        float _1971 = cos(_1969);
        float _1973 = _1965 * _1967;
        float _1975 = _1961 * 6.283185482025146484375;
        float _1977 = sin(_1975);
        float _1979 = _1971 * _1973;
        float _1981 = 1.0 / _1979;
        float _1983 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1985 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1983;
        float _1987 = 1.0 / _1985;
        float _1989 = _1977 * _1981;
        float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1993 = fma(_1891, _1989, _1991);
        float _1995 = _1993 * _1987;
        float _1997 = precise::clamp(_1995, 0.0, 1.0);
        float _1999 = -_1997;
        float _2001 = _1999 + 1.0;
        _1949 = _1957;
        _1893 = _2001;
    }
    float _2003 = _1949;
    float _2005 = _1893;
    float _2007 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2009 = _1873 + _2007;
    float _2011 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2013 = _1875 + _2011;
    float _2015 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2017 = _1877 + _2015;
    float _2019 = _2009 * _2009;
    float _2021 = fma(_2013, _2013, _2019);
    float _2023 = fma(_2017, _2017, _2021);
    float _2025 = rsqrt(_2023);
    float _2027 = _2025 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2029 = _2013 * _2027;
    float _2031 = _2017 * _2027;
    float _2033 = _2029 * _2029;
    float _2035 = _2031 * _2031;
    float _2037 = _2033 + _2035;
    float _2039 = sqrt(_2037);
    bool _2041 = _2039 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2043 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2045 = _2039 + _2043;
    float _2047 = _2003;
    float _2049 = _2037;
    float _2051 = _2045;
    float _2053 = _2009;
    float _2055 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _2057 = _2029;
    if (_2041)
    {
        float _2059 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2047 = _2059;
    }
    float _2061 = _2047;
    if (_2041)
    {
        float _2063 = rsqrt(_2037);
        _2049 = _2063;
    }
    float _2065 = _2049;
    float _2067 = _2061;
    float _2069 = _2065;
    if (_2041)
    {
        float _2071 = _2045 * _2061;
        _2051 = _2071;
    }
    float _2073 = _2051;
    if (_2041)
    {
        float _2075 = _2073 * 0.15915493667125701904296875;
        _2067 = _2075;
    }
    float _2077 = _2067;
    float _2079 = _2017;
    float _2081 = _2077;
    if (_2041)
    {
        float _2083 = _2077 * 6.283185482025146484375;
        float _2085 = sin(_2083);
        _2079 = _2085;
    }
    float _2087 = _2079;
    float _2089 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2091 = precise::max(0.0, _2089);
    float _2093 = _1945;
    if (_2041)
    {
        float _2095 = _2077 * 6.283185482025146484375;
        float _2097 = cos(_2095);
        _2093 = _2097;
    }
    float _2099 = _2093;
    float _2101 = -_2027;
    float _2103 = -_2091;
    float _2105 = fma(_2009, _2101, _2103);
    float _2107 = fma(_995, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_2041)
    {
        float _2109 = _2105 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2053 = _2109;
    }
    float _2111 = _2053;
    float _2113 = sqrt(_2023);
    float _2115 = _2111;
    if (!_2041)
    {
        _2081 = _2105;
    }
    float _2117 = _2081;
    float _2119 = _2087;
    float _2121 = _2117;
    if (_2041)
    {
        float _2123 = fma(_2087, _2111, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2119 = _2123;
    }
    float _2125 = _2119;
    float _2127 = _2125;
    float _2129 = _2099;
    if (_2041)
    {
        float _2131 = _2099 + (-1.0);
        _2115 = _2131;
    }
    float _2133 = _2115;
    if (_2041)
    {
        float _2135 = _2065 * _2125;
        _2055 = _2135;
    }
    float _2137 = _2055;
    if (!_2041)
    {
        _2069 = _2031;
    }
    float _2139 = _2069;
    float _2141 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2143 = _2139;
    if (_2041)
    {
        float _2145 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1885 = _2145;
    }
    float _2147 = _1885;
    if (_2041)
    {
        float _2149 = _2029 * _2137;
        _2057 = _2149;
    }
    float _2151 = _2057;
    if (!_2041)
    {
        _2127 = _2033;
    }
    float _2153 = _2127;
    float _2155 = _2153;
    if (_2041)
    {
        float _2157 = _2031 * _2137;
        _2143 = _2157;
    }
    float _2159 = _2143;
    if (_2041)
    {
        float _2161 = fma(_2105, _2099, _2147);
        _2121 = _2161;
    }
    float _2163 = _2121;
    if (_2041)
    {
        float _2165 = _2151 * _2151;
        _2155 = _2165;
    }
    float _2167 = _2155;
    if (!_2041)
    {
        _2129 = _2035;
    }
    float _2169 = _2129;
    float _2171 = _2169;
    if (_2041)
    {
        float _2173 = _2159 * _2159;
        _2171 = _2173;
    }
    float _2175 = _2171;
    float _2177 = fma(_2163, _2163, _2167);
    float _2179 = floor(_2107);
    float _2181 = _2177 + _2175;
    float _2183 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2141);
    float _2185 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2187 = fma(_2113, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2185);
    float _2189 = precise::clamp(_2187, 0.0, 1.0);
    float _2191 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2193 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2183);
    float _2195 = -_2189;
    float _2197 = _2195 + 1.0;
    float _2199 = rsqrt(_2181);
    float _2201 = _2193 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2203 = fma(_1005, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2205 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2207 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2209 = abs(_2197);
    float _2211 = log2(_2209);
    float _2213 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2215 = -_2207;
    float _2217 = fma(_2215, _2191, 1.0);
    float _2219 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2221 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2213);
    float _2223 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2219);
    float _2225 = _2199 * _2151;
    float _2227 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2221);
    float _2229 = _2199 * _2163;
    float _2231 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2223);
    float _2233 = _2199 * _2159;
    float _2235 = _2227 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2237 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2239 = _2231 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2241 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2205);
    float _2243 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2245 = -_2237;
    float _2247 = fma(_2229, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2245);
    float _2249 = log2(_2217);
    float _2251 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2241);
    float _2253 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2243);
    float _2255 = -_2233;
    float _2257 = fma(_2255, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2247);
    float _2259 = _2211 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2261 = -_2179;
    float _2263 = _2107 + _2261;
    float _2265 = fma(_2201, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2253);
    float _2267 = fma(_2257, -0.5, 0.5);
    float _2269 = floor(_2203);
    float _2271 = _2251 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2273 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2275 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2277 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2265);
    float _2279 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2273);
    float _2281 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2275);
    float _2283 = exp2(_2259);
    float _2285 = fma(_2257, 0.5, 0.5);
    float _2287 = fma(_2201, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2279);
    float _2289 = fma(_2201, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2281);
    float _2291 = _2249 * 0.693147182464599609375;
    float _2293 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2287);
    float _2295 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2289);
    float _2297 = 1.0 / _2277;
    float _2299 = -_2269;
    float _2301 = _2203 + _2299;
    float _2303 = fma(_2285, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2305 = _2229 + 1.0;
    float _2307 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2309 = fma(_2285, _2303, -0.212114393711090087890625);
    float _2311 = sqrt(_2267);
    float2 _6442 = float2(_2263, _2301);
    float _2313 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6442, float2(0.0), isnan(_6442)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6442, float2(0.0), isnan(_6442)), level(0.0)).x;
    float _2315 = -_2229;
    float _2317 = fma(_2283, _2305, _2315);
    float _2319 = fma(_2285, _2309, 1.570728778839111328125);
    float _2321 = fma(_2317, 0.5, 0.5);
    float _2323 = _2293 * _2297;
    float _2325 = _2295 * _2297;
    float _2327 = fma(_2323, 0.5, 0.5);
    float _2329 = fma(_2325, -0.5, 0.5);
    float _2331 = _2311 * 0.636619746685028076171875;
    float3 _6478 = float3(_2327, _2329, _2307);
    float _2333 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6478, float3(0.0), isnan(_6478)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6478, float3(0.0), isnan(_6478)), level(0.0)).x;
    float3 _6489 = float3(_2327, _2329, _2307);
    float4 _2336 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6489, float3(0.0), isnan(_6489)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6489, float3(0.0), isnan(_6489)), level(0.0)).xyzw;
    float _2338 = _2336.x;
    float _2340 = _2336.y;
    float _2342 = _2336.z;
    float _2344 = _2336.w;
    float _2346 = -_2319;
    float _2348 = fma(_2331, _2346, 1.0);
    float2 _6510 = float2(_2348, _2321);
    float3 _2352 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6510, float2(0.0), isnan(_6510)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6510, float2(0.0), isnan(_6510)), level(0.0)).xyz;
    float _2354 = _2352.x;
    float _2356 = _2352.y;
    float _2358 = _2352.z;
    float _2360 = abs(_1891);
    float _2362 = log2(_2360);
    float _2364 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2366 = in.m_78.x;
    float _2368 = _2277 * 0.5;
    float _2370 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2364);
    bool _2372 = _1891 <= 8000.0;
    bool _2374 = isnan(_1891);
    bool _2376 = _2372 || _2374;
    bool _2378 = isnan(8000.0);
    bool _2380 = _2376 || _2378;
    float _2382 = float(_2380);
    float _2384 = fma(_2201, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2370);
    float _2386 = _2293 + _2277;
    bool _2388 = _2113 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2390 = isnan(_2113);
    bool _2392 = _2388 || _2390;
    bool _2394 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2396 = _2392 || _2394;
    float _2398 = _2386 * 0.5;
    float _2400 = _2362 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2402 = exp2(_2400);
    float _2404 = fma(_2402, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2406 = precise::clamp(_2404, 0.0, 1.0);
    float _2408 = _2211 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2410 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2384);
    float _2412 = fma(_2406, -2.0, 3.0);
    float _2414 = _2406 * _2406;
    float _2416 = _2410 + _2277;
    float _2418 = exp2(_2408);
    out.gl_Position.x = _2293;
    out.gl_Position.y = _2295;
    out.gl_Position.z = _2410;
    out.gl_Position.w = _2277;
    float _2420 = _2414 * _2412;
    float _2422 = _2416 * 0.5;
    float _2424 = -_2420;
    float _2426 = _2424 + 1.0;
    float _2428 = fma(_2426, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2420);
    float _2430 = fma(_2295, -0.5, _2368);
    float _2432 = _2382 * _2428;
    float _2434 = -_2418;
    float _2436 = _2434 + 1.0;
    out.m_80.x = _2398;
    out.m_80.y = _2430;
    out.m_80.z = _2422;
    out.m_80.w = _2277;
    float _2438 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2440 = _1947 * _2005;
    float _2442 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2444 = _2277;
    float _2446 = _2410;
    float _2448 = _2295;
    float _2450 = _2440;
    if (!_2396)
    {
        _2444 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2452 = _2444;
    float _2454 = _2452;
    float _2456 = _2452;
    if (!_2396)
    {
        _2446 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2458 = _2446;
    float _2460 = _2458;
    float _2462 = _2458;
    if (!_2396)
    {
        _2448 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2464 = _2448;
    float _2466 = -_2313;
    float _2468 = _2466 + 1.0;
    float _2470 = _2468 * _2438;
    float _2472 = precise::clamp(_2470, 0.0, 1.0);
    float _2474 = -_2472;
    float _2476 = fma(_2474, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2478 = _2476 * _2366;
    float _2480 = _2442 * _2333;
    float _2482 = -_2442;
    float _2484 = _2482 + 1.0;
    float _2486 = _2344 * _2480;
    float _2488 = _2358 * _2480;
    float _2490 = fma(_2356, _2486, _2340);
    float _2492 = fma(_2354, _2486, _2338);
    float _2494 = _2478 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2496 = _2344 * _2484;
    float _2498 = fma(_2344, _2488, _2342);
    float _2500 = _2440 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2502 = _2478;
    float _2504 = _2338;
    float _2506 = _2464;
    float _2508 = _2464;
    if (!_2396)
    {
        _2502 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2510 = _2502;
    out.m_82.x = _2494;
    float _2512 = _2510;
    float _2514 = _2510;
    if (!_2396)
    {
        _2504 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2516 = _2504;
    float _2518 = _2516;
    float _2520 = _2516;
    if (!_2396)
    {
        _2450 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2522 = _2450;
    out.m_84.x = _2492;
    out.m_84.y = _2490;
    out.m_84.z = _2498;
    out.m_84.w = _2496;
    bool _2524 = !_2396;
    float _2526 = _2522;
    float _2528 = _2522;
    if (!_2524)
    {
        bool _2530 = _2113 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2532 = isnan(_2113);
        bool _2534 = _2530 || _2532;
        bool _2536 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2538 = _2534 || _2536;
        if (!_2538)
        {
            float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2542 = _2113 + _2540;
            float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2546 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2544;
            float _2548 = 1.0 / _2546;
            float _2550 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2552 = _2550 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2554 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2556 = _2554 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2558 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2560 = _2558 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2562 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2564 = _2562 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2568 = _2566 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2570 = _2542 * _2548;
            float _2572 = precise::clamp(_2570, 0.0, 1.0);
            float _2574 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2576 = _2574 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2578 = fma(_2572, _2552, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2580 = fma(_2572, _2576, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2582 = fma(_2572, _2556, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2584 = fma(_2572, _2560, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2586 = fma(_2572, _2564, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2588 = fma(_2572, _2568, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2520 = _2580;
            _2508 = _2586;
            _2514 = _2578;
            _2462 = _2584;
            _2456 = _2582;
            _2528 = _2588;
            _2590 = true;
        }
        else
        {
            bool _2592 = _2113 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2594 = isnan(_2113);
            bool _2596 = _2592 || _2594;
            bool _2598 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2600 = _2596 || _2598;
            if (!_2600)
            {
                _2512 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2602 = _2512;
            _2514 = _2602;
            if (!_2600)
            {
                _2518 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2604 = _2518;
            _2520 = _2604;
            if (!_2600)
            {
                _2454 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2606 = _2454;
            _2456 = _2606;
            if (!_2600)
            {
                _2460 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2608 = _2460;
            _2462 = _2608;
            if (!_2600)
            {
                _2506 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2610 = _2506;
            _2508 = _2610;
            if (!_2600)
            {
                _2526 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2612 = _2526;
            bool _2614 = !_2600;
            _2528 = _2612;
            if (!_2614)
            {
                bool _2616 = _2113 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2618 = isnan(_2113);
                bool _2620 = _2616 || _2618;
                bool _2622 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2624 = _2620 || _2622;
                if (!_2624)
                {
                    float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2628 = _2113 + _2626;
                    float _2630 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2632 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2630;
                    float _2634 = 1.0 / _2632;
                    float _2636 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2638 = _2636 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2640 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2642 = _2640 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2644 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2646 = _2644 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2648 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2650 = _2648 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2652 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2654 = _2652 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2656 = _2628 * _2634;
                    float _2658 = precise::clamp(_2656, 0.0, 1.0);
                    float _2660 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2662 = _2660 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2664 = fma(_2658, _2638, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2666 = fma(_2658, _2662, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2668 = fma(_2658, _2642, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2670 = fma(_2658, _2646, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2672 = fma(_2658, _2650, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2674 = fma(_2658, _2654, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2520 = _2666;
                    _2508 = _2672;
                    _2514 = _2664;
                    _2462 = _2670;
                    _2456 = _2668;
                    _2528 = _2674;
                    _2590 = true;
                }
                else
                {
                    _2520 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2508 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2514 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2462 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2456 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2528 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2590 = false;
    float _2676 = _2520;
    float _2678 = _2508;
    float _2680 = _2514;
    float _2682 = _2462;
    float _2684 = _2456;
    float _2686 = _2528;
    float _2688 = fma(_1555, -0.5, 0.5);
    float _2690 = precise::clamp(_2688, 0.0, 1.0);
    float _2692 = -_2676;
    float _2694 = _2692 + _2678;
    float _2696 = -_2680;
    float _2698 = _2696 + _2682;
    out.m_86.x = 0.0;
    float _2700 = -_2684;
    float _2702 = _2700 + _2686;
    float _2704 = fma(_2690, _2694, _2676);
    float _2706 = fma(_2690, _2698, _2680);
    bool _2708 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2710 = _2704 * 0.586610972881317138671875;
    float _2712 = fma(_2690, _2702, _2684);
    float _2714 = _2500 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2716 = fma(_2706, 0.298911988735198974609375, _2710);
    bool _2718 = _1947 > 0.0;
    bool _2720 = isnan(_1947);
    bool _2722 = _2718 || _2720;
    bool _2724 = isnan(0.0);
    bool _2726 = _2722 || _2724;
    float _2728 = fma(_2712, 0.114477999508380889892578125, _2716);
    out.m_51.x = _2714;
    bool _2730 = _2005 <= 0.0;
    bool _2732 = !_2726;
    bool _2734 = _2730 || _2732;
    float _2736 = -_2728;
    float _2738 = _2706 + _2736;
    float _2740 = -_2728;
    float _2742 = _2704 + _2740;
    float _2744 = -_2728;
    float _2746 = _2712 + _2744;
    float _2748 = fma(_2738, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2728);
    float _2750 = fma(_2742, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2728);
    float _2752 = fma(_2746, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2728);
    bool _2754 = !_2708;
    if (!_2754)
    {
        float _2756 = -_1873;
        float _2758 = _2756 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2760 = -_1875;
        float _2762 = _2760 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2764 = -_1877;
        float _2766 = _2764 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2768 = _2758 * _2758;
        float _2770 = fma(_2762, _2762, _2768);
        float _2772 = fma(_2766, _2766, _2770);
        float _2774 = sqrt(_2772);
        float _2776 = rsqrt(_2772);
        float _2778 = -_2774;
        float _2780 = _2778 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2782 = _2780 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2784 = precise::clamp(_2782, 0.0, 1.0);
        float _2786 = _2762 * _2776;
        float _2788 = _2758 * _2776;
        float _2790 = abs(_2784);
        float _2792 = log2(_2790);
        float _2794 = _2766 * _2776;
        float _2796 = _2786 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2798 = _1555 * _2788;
        float _2800 = -_2788;
        float _2802 = -_2796;
        float _2804 = fma(_2800, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2802);
        float _2806 = fma(_1553, _2786, _2798);
        float _2808 = -_2794;
        float _2810 = fma(_2808, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2804);
        float _2812 = fma(_1557, _2794, _2806);
        float _2814 = precise::clamp(_2812, 0.0, 1.0);
        float _2816 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2818 = _2810 + _2816;
        float _2820 = _2792 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2822 = _2818 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2824 = precise::clamp(_2822, 0.0, 1.0);
        float _2826 = exp2(_2820);
        float _2828 = _2826 * _2824;
        float _2830 = _2814 * _2828;
        float _2832 = _2830 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2834 = _2830 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2836 = _2830 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _2832;
        out.m_86.y = _2834;
        out.m_86.z = _2836;
    }
    out.m_88.x = _2748;
    out.m_88.y = _2750;
    out.m_88.z = _2752;
    if (!_2734)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2838 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2838;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2590 = false;
    bool _1605 = false;
    bool _329 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_48.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    if (!_111)
    {
        out.m_51.x = 0.0;
    }
    int _117 = 0;
    if (!_111)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2894 = as_type<float>(_121);
        out.gl_Position.z = _2894;
    }
    if (!_111)
    {
        return out;
    }
    float _125 = in.m_53.w;
    float _127 = float(_107);
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
    float _153 = _125;
    float _155 = _145;
    float _157 = _133;
    if (_151)
    {
        _153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _153;
    if (_151)
    {
        out.m_51.x = 0.0;
    }
    if (_151)
    {
        float _161 = _159 * 5.0;
        _123 = as_type<int>(_161);
    }
    int _163 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2967 = as_type<float>(_163);
        out.gl_Position.z = _2967;
    }
    if (_151)
    {
        return out;
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = in.m_60.x;
    float _169 = in.m_60.y;
    float _171 = in.m_60.z;
    int _173 = as_type<int>(_165) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_165) & 2;
    bool _179 = _177 != 0;
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _183 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _185 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _187 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _189 = !_175;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _183);
    float _195 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _185);
    float _197 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _187);
    bool _199 = !_179;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _193);
    float _205 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _195);
    float _207 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _197);
    bool _209 = !_181;
    float _211 = _207;
    float _213 = _205;
    float _231;
    if (!_209)
    {
        float _215 = in.m_62.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        _231 = _145;
    }
    _233 = false;
    float _235 = _231;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = _235 + _237;
    bool _241 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _243 = isnan(_235);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _253;
    float _257 = -_251;
    float _259 = _257 + 1.0;
    bool _261 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _263 = isnan(_235);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _273;
    bool _277 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _279 = 1.0 / _255;
    float _281 = _271 * _259;
    float _283 = -_271;
    float _285 = _283 + 1.0;
    float _287 = _239 * _279;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _289;
    float _293 = fma(_275, _287, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _295 = fma(_291, _287, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _297 = _293 * _281;
    float _299 = _295 * _281;
    float _301 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[143].x, _297);
    float _303 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[143].y, _299);
    float _305 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[144].x, _301);
    float _307 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[144].y, _303);
    bool _309 = !_277;
    float _327;
    if (!_309)
    {
        float _311 = in.m_62.x;
        float _313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _315 = _311 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _319 = _317 * _313;
        float _321 = floor(_319);
        float _323 = -_321;
        float _325 = _319 + _323;
        _327 = _325;
        _329 = true;
    }
    else
    {
        _327 = _145;
    }
    _329 = false;
    float _331 = _327;
    float _333 = in.m_64.x;
    float _335 = in.m_64.y;
    bool _337 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _339 = isnan(_331);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _353 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _355 = isnan(_331);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _371 = _331 + _369;
    float _373 = -_347;
    float _375 = _373 + 1.0;
    bool _377 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _379 = 1.0 / _351;
    float _381 = _363 * _375;
    float _383 = -_363;
    float _385 = _383 + 1.0;
    float _387 = _307 * _335;
    float _389 = _305 * _333;
    float _391 = _367 * _379;
    float _393 = fma(_391, _371, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _395 = _393 * _381;
    float _397 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[115].x, _395);
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _405 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[116].x, _397);
    float _407 = _399 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _409 = _401 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = _403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _413 = _405 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _407;
    out.m_66.y = _409;
    out.m_66.z = _411;
    out.m_66.w = _413;
    bool _415 = !_377;
    if (!_415)
    {
        float _417 = in.m_62.x;
        float _419 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _421 = _417 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _423 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[11].w, _133);
        float _425 = _423 * _419;
        float _427 = floor(_425);
        float _429 = -_427;
        float _431 = _425 + _429;
        _155 = _431;
    }
    float _433 = _155;
    float _435 = in.m_62.x;
    float _437 = in.m_62.y;
    float _439 = in.m_62.z;
    float _441 = in.m_62.w;
    float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _445 = in.m_48.x;
    float _447 = in.m_48.y;
    float _449 = in.m_48.z;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _453 = _451 != 0;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _457 = _455 != 0;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _463 = _461 != 0;
    float _465 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _469 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _471 = _437 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _473 = _441 > 0.5;
    float _475 = _435 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _479 = fma(_471, -2.0, _459);
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _483 = _481 != 0;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _487 = _485 != 0;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _493 = -_201;
    int _495 = _473 ? as_type<int>(_493) : as_type<int>(_201);
    float _497 = -_467;
    float _499 = fma(_475, 2.0, _497);
    bool _501 = _435 > 0.5;
    float _503 = _447 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _505 = 1.0 / _491;
    float _507 = _447 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _509 = -_191;
    int _511 = _501 ? as_type<int>(_509) : as_type<int>(_191);
    float _513 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[4].x, _503);
    int _515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _517 = _515 != 0;
    float _519 = _439 * 2.0;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _521;
    float _525 = _447 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _527 = _435 * 2.0;
    float _529 = floor(_519);
    bool _531 = !_453;
    float _533 = _531 ? _191 : as_type<float>(_511);
    float _535 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[6].x, _525);
    bool _537 = _437 > 0.5;
    float _539 = _437 + _439;
    float _541 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[5].x, _507);
    float _543 = -_133;
    float _545 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[76].x, _499);
    float _547 = -_201;
    int _549 = _537 ? as_type<int>(_547) : as_type<int>(_201);
    float _551 = floor(_527);
    float _553 = _539 + (-1.0);
    float _555 = _523 * _505;
    float _557 = _437 + _435;
    bool _559 = !_457;
    float _561 = _559 ? _201 : as_type<float>(_549);
    float _563 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _565 = _439 > 0.5;
    float _567 = _557 + (-1.0);
    float _569 = _533 + 0.5;
    float _571 = -_191;
    int _573 = _537 ? as_type<int>(_571) : as_type<int>(_191);
    float _575 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[4].z, _513);
    bool _577 = _529 > 0.0;
    float _579 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _581 = _529 >= 0.0;
    bool _583 = isnan(_529);
    bool _585 = _581 || _583;
    bool _587 = isnan(0.0);
    bool _589 = _585 || _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _593 = _433 + _591;
    float _595 = _553;
    float _597 = _443;
    float _599 = _535;
    if (!_517)
    {
        _595 = _439;
    }
    float _601 = _595;
    float _603 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[5].z, _541);
    float _605 = _601;
    if (_517)
    {
        _605 = _437;
    }
    float _607 = _605;
    float _609 = fma(_555, _593, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _611 = -_191;
    int _613 = _565 ? as_type<int>(_611) : as_type<int>(_191);
    float _615 = _443 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _617 = -_201;
    int _619 = _565 ? as_type<int>(_617) : as_type<int>(_201);
    float _621 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[83].w, _477);
    bool _623 = !_463;
    float _625 = _623 ? _191 : as_type<float>(_613);
    float _627 = fma(_615, _569, _545);
    bool _629 = _551 > 0.0;
    float _631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _633 = _551 >= 0.0;
    bool _635 = isnan(_551);
    bool _637 = _633 || _635;
    bool _639 = isnan(0.0);
    bool _641 = _637 || _639;
    float _643 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[6].z, _535);
    bool _645 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _647 = isnan(_433);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = _603 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _659 = !_487;
    float _661 = _659 ? _201 : as_type<float>(_619);
    float _663 = _465 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _665 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _667 = isnan(_433);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _479);
    float _679 = -_655;
    float _681 = _679 + 1.0;
    float _683 = _561 + (-0.5);
    float _685 = -_661;
    float _687 = _685 + 0.5;
    float _689 = _657;
    if (!_517)
    {
        _597 = _437;
    }
    float _691 = _597;
    float _693 = _675 * _681;
    float _695 = _691;
    if (_517)
    {
        _695 = _435;
    }
    float _697 = _695;
    float _699 = -_663;
    float _701 = -_677;
    float _703 = fma(_699, _683, _701);
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _707 = !_483;
    float _709 = _707 ? _191 : as_type<float>(_573);
    float _711 = _609 * _693;
    int _713 = _589 ? 0 : 1;
    float _715 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[83].z, _705);
    if (!_517)
    {
        _599 = _439;
    }
    float _717 = _599;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _723 = _721 != 0;
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _727 = _725 != 0;
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _731 = _729 != 0;
    float _733 = _697 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _735 = _717;
    if (_517)
    {
        _735 = _437;
    }
    float _737 = _735;
    float _739 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _741 = -_719;
    float _743 = fma(_733, 2.0, _741);
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _747 = _745 != 0;
    float _749 = _737 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _751 = -_675;
    float _753 = _751 + 1.0;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _757 = _631 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _759 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _761 = !_747;
    float _763 = _761 ? _201 : as_type<float>(_495);
    float _765 = fma(_749, -2.0, _755);
    float _767 = _625 + 0.5;
    float _769 = -_133;
    float _771 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[81].x, _743);
    float _773 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[131].x, _711);
    float _775 = _709 + 0.5;
    float _777 = _469 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _779 = fma(_757, _767, _771);
    float _781 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[132].x, _773);
    float _783 = _775 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _785 = _763 + (-0.5);
    float _787 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _765);
    float _789 = _687 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _791 = _783 * _739;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _795 = -_777;
    float _797 = -_787;
    float _799 = fma(_795, _785, _797);
    float _801 = _789 * _759;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _805 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[78].w, _793);
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _809 = ~_713;
    int _811 = _809 + 1;
    int _813 = _811 + 1;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _817 = _813;
    if (!_577)
    {
        int _819 = ~_713;
        int _821 = _819 + 1;
        _817 = _821;
    }
    int _823 = _817;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _827 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[78].z, _803);
    float _829 = _575 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _831 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _833 = _657 + _831;
    float _835 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _805);
    float _837 = _807 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _839 = _815 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _841 = _825 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _843 = _781 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _845 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _847 = log2(_845);
    float _849 = _643 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _851 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _853 = _829 + _851;
    float _855 = _833 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _857 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _827);
    float _859 = -_835;
    float _861 = _859 + 1.0;
    float _863 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _865 = _849 + _863;
    float _867 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[28].x, _855);
    float _869 = -_857;
    float _871 = _869 + 1.0;
    out.m_68.x = _837;
    out.m_68.y = _839;
    out.m_68.z = _841;
    out.m_68.w = _843;
    float _873 = fma(_561, _861, _703);
    float _875 = _833 * _833;
    float _877 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[28].z, _867);
    float _879 = -_871;
    float _881 = fma(_533, _879, _627);
    float _883 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _621);
    float _885 = fma(_853, _853, _875);
    out.m_70.x = _791;
    out.m_70.y = _801;
    bool _887 = _877 >= 0.0;
    float _889 = _847 * _133;
    float _891 = float(_823);
    float _893 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _715);
    float _895 = _437 * 2.0;
    bool _897 = !_723;
    int _899 = _897 ? 0 : 1;
    float _901 = fma(_865, _865, _885);
    float _903 = -_883;
    float _905 = _903 + 1.0;
    int _907 = abs(_899);
    float _909 = exp2(_889);
    bool _911 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _913 = isnan(1.0);
    bool _915 = _911 || _913;
    bool _917 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _919 = _915 || _917;
    float _921 = fma(_763, _905, _799);
    float _923 = float(_907);
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _927 = 1.0 + _925;
    float _929 = -_893;
    float _931 = _929 + 1.0;
    float _933 = _883;
    if (_887)
    {
        _933 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _935 = _933;
    int _937 = as_type<int>(_935);
    if (_887)
    {
        out.m_51.x = 0.0;
    }
    float _939 = rsqrt(_901);
    float _941 = _923 * _891;
    float _943 = -_931;
    float _945 = fma(_625, _943, _779);
    if (_887)
    {
        float _947 = _935 * 5.0;
        _937 = as_type<int>(_947);
    }
    int _949 = _937;
    bool _951 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _953 = isnan(0.0);
    bool _955 = _951 || _953;
    bool _957 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _959 = _955 || _957;
    out.m_72.x = _881;
    out.m_72.y = _873;
    out.m_72.z = _945;
    out.m_72.w = _921;
    float _961 = 1.0 / _927;
    float _963 = -_909;
    float _965 = _963 + 1.0;
    bool _967 = !_727;
    int _969 = _967 ? 0 : 1;
    float _971 = in.m_74.x;
    float _973 = in.m_74.y;
    float _975 = in.m_74.z;
    bool _977 = !_731;
    int _979 = _977 ? 0 : 1;
    if (_887)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4330 = as_type<float>(_949);
        out.gl_Position.z = _4330;
    }
    float _981 = floor(_895);
    float _983 = _853 * _939;
    float _985 = _833 * _939;
    if (_887)
    {
        return out;
    }
    float _987 = -_985;
    float _989 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[18].w, _657);
    float _991 = _865 * _939;
    float _993 = -_983;
    float _995 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[18].w, _829);
    float _997 = _959 ? _965 : 0.0;
    float _999 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1001 = _989 + _999;
    float _1003 = -_991;
    float _1005 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[18].w, _849);
    float _1007 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1009 = _995 + _1007;
    int _1011 = _641 ? 0 : 1;
    float _1013 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1015 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1017 = _1005 + _1015;
    bool _1019 = _981 > 0.0;
    float _1021 = -_985;
    float _1023 = fma(_1021, (*spvDescriptorSet0.vp_c9)._m0[18].w, _833);
    float _1025 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1013);
    bool _1027 = _981 >= 0.0;
    bool _1029 = isnan(_981);
    bool _1031 = _1027 || _1029;
    bool _1033 = isnan(0.0);
    bool _1035 = _1031 || _1033;
    float _1037 = _941 * (-2.0);
    int _1039 = ~_1011;
    int _1041 = _1039 + 1;
    int _1043 = _1041 + 1;
    float _1045 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1025);
    int _1047 = _1043;
    if (!_629)
    {
        int _1049 = ~_1011;
        int _1051 = _1049 + 1;
        _1047 = _1051;
    }
    int _1053 = _1047;
    float _1055 = fma(_579, _1037, _579);
    float _1057 = fma(_1037, _971, _971);
    float _1059 = _435 + (-0.5);
    bool _1061 = _1045 >= 0.0;
    float _1063 = -_983;
    float _1065 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[18].w, _853);
    float _1067 = _1023 * _1023;
    float _1069 = _1055;
    if (_919)
    {
        float _1071 = _997 * _961;
        _157 = _1071;
    }
    float _1073 = _157;
    float _1075 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1057);
    int _1077 = abs(_969);
    float _1079 = fma(_1065, _1065, _1067);
    float _1081 = -_991;
    float _1083 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[18].w, _865);
    float _1085 = fma(_1055, _1073, _1075);
    float _1087 = float(_1053);
    float _1089 = _437 + (-0.5);
    float _1091 = float(_1077);
    float _1093 = fma(_1083, _1083, _1079);
    float _1095 = _1085 * 0.15915493667125701904296875;
    if (_1061)
    {
        _1069 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1097 = _1069;
    int _1099 = as_type<int>(_1097);
    if (_1061)
    {
        out.m_51.x = 0.0;
    }
    float _1101 = _1091 * _1087;
    float _1103 = _1095 * 6.283185482025146484375;
    float _1105 = sin(_1103);
    int _1107 = _1035 ? 0 : 1;
    if (_1061)
    {
        float _1109 = _1097 * 5.0;
        _1099 = as_type<int>(_1109);
    }
    int _1111 = _1099;
    float _1113 = _1101 * (-2.0);
    int _1115 = ~_1107;
    int _1117 = _1115 + 1;
    int _1119 = _1117 + 1;
    float _1121 = fma(_1113, _973, _973);
    float _1123 = sqrt(_1093);
    int _1125 = _1119;
    if (!_1019)
    {
        int _1127 = ~_1107;
        int _1129 = _1127 + 1;
        _1125 = _1129;
    }
    int _1131 = _1125;
    if (_1061)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4572 = as_type<float>(_1111);
        out.gl_Position.z = _4572;
    }
    float _1133 = fma(_563, _1113, _563);
    int _1135 = abs(_979);
    if (_1061)
    {
        return out;
    }
    float _1137 = -_657;
    float _1139 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1141 = float(_1131);
    float _1143 = -_829;
    float _1145 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1147 = -_849;
    float _1149 = _1147 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1151 = _1139 * _1139;
    float _1153 = float(_1135);
    float _1155 = fma(_1089, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1121);
    float _1157 = _439 + _435;
    float _1159 = fma(_1145, _1145, _1151);
    float _1161 = _1153 * _1141;
    float _1163 = fma(_1133, _1073, _1155);
    float _1165 = fma(_1149, _1149, _1159);
    float _1167 = _1157 + (-1.0);
    float _1169 = _1161 * (-2.0);
    float _1171 = _1163 * 0.15915493667125701904296875;
    float _1173 = _439 + (-0.5);
    float _1175 = fma(_1167, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1177 = rsqrt(_1165);
    float _1179 = fma(_1169, _975, _975);
    float _1181 = fma(_1175, _1169, _1175);
    float _1183 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1179);
    float _1185 = _1095 * 6.283185482025146484375;
    float _1187 = cos(_1185);
    float _1189 = fma(_1181, _1073, _1183);
    float _1191 = _1189 * 0.15915493667125701904296875;
    float _1193 = _1145 * _1177;
    float _1195 = _1149 * _1177;
    float _1197 = _1171 * 6.283185482025146484375;
    float _1199 = sin(_1197);
    float _1201 = _1139 * _1177;
    float _1203 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1205 = _1193 * _1203;
    float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1209 = _1195 * _1207;
    float _1211 = _939 * _1123;
    float _1213 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1215 = _1201 * _1213;
    float _1217 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1219 = -_1205;
    float _1221 = fma(_1195, _1217, _1219);
    float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1225 = -_1209;
    float _1227 = fma(_1201, _1223, _1225);
    float _1229 = _1171 * 6.283185482025146484375;
    float _1231 = cos(_1229);
    float _1233 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1235 = -_1215;
    float _1237 = fma(_1193, _1233, _1235);
    float _1239 = _1221 * _1221;
    float _1241 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1243 = _1241 * 0.5;
    float _1245 = fma(_1227, _1227, _1239);
    float _1247 = _1191 * 6.283185482025146484375;
    float _1249 = sin(_1247);
    float _1251 = _1105 * _1199;
    float _1253 = fma(_1237, _1237, _1245);
    float _1255 = _1187 * _1199;
    float _1257 = _1191 * 6.283185482025146484375;
    float _1259 = cos(_1257);
    float _1261 = _1187 * _1231;
    float _1263 = _1105 * _1231;
    float _1265 = rsqrt(_1253);
    float _1267 = fma(_1249, _1261, _1251);
    float _1269 = fma(_1249, _1251, _1261);
    float _1271 = _1187 * _1259;
    float _1273 = _1231 * _1259;
    float _1275 = _1105 * _1259;
    float _1277 = _1199 * _1259;
    float _1279 = _387 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1281 = _389 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1283 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _1285 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1287 = _1211 * _1279;
    float _1289 = _1211 * _1281;
    float _1291 = _1221 * _1265;
    float _1293 = -_1255;
    float _1295 = fma(_1249, _1263, _1293);
    float _1297 = _1283 * _1287;
    float _1299 = _1285 * _1289;
    float _1301 = _1227 * _1265;
    float _1303 = -_1263;
    float _1305 = fma(_1249, _1255, _1303);
    float _1307 = _1271 * _1297;
    float _1309 = _1237 * _1265;
    float _1311 = -_1297;
    float _1313 = _1249 * _1311;
    float _1315 = _1195 * _1291;
    float _1317 = fma(_1267, _1299, _1307);
    float _1319 = _1201 * _1301;
    float _1321 = _1275 * _1297;
    float _1323 = fma(_1273, _1299, _1313);
    float _1325 = fma(_1305, _1243, _1317);
    float _1327 = -_1315;
    float _1329 = fma(_1201, _1309, _1327);
    float _1331 = -_1319;
    float _1333 = fma(_1193, _1291, _1331);
    float _1335 = fma(_1295, _1299, _1321);
    float _1337 = fma(_1277, _1243, _1323);
    float _1339 = _1329 * _1325;
    float _1341 = _1333 * _1325;
    float _1343 = fma(_1269, _1243, _1335);
    float _1345 = _1193 * _1309;
    float _1347 = fma(_1301, _1337, _1339);
    float _1349 = fma(_1309, _1337, _1341);
    float _1351 = _1271 * _1329;
    float _1353 = -_1345;
    float _1355 = fma(_1195, _1301, _1353);
    float _1357 = fma(_1193, _1343, _1347);
    float _1359 = fma(_1195, _1343, _1349);
    float _1361 = _1271 * _1333;
    float _1363 = _1271 * _1355;
    float _1365 = _829 + _1357;
    float _1367 = _849 + _1359;
    float _1369 = _1267 * _1329;
    float _1371 = _1267 * _1355;
    float _1373 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1375 = _1365 + _1373;
    float _1377 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1379 = _1367 + _1377;
    float _1381 = _1267 * _1333;
    float _1383 = _1305 * _1329;
    float _1385 = _1375 * _1375;
    float _1387 = _1379 * _1379;
    float _1389 = _1305 * _1333;
    float _1391 = _1305 * _1355;
    float _1393 = _1355 * _1325;
    float _1395 = _1385 + _1387;
    float _1397 = -_1249;
    float _1399 = fma(_1397, _1301, _1351);
    float _1401 = -_1249;
    float _1403 = fma(_1401, _1291, _1363);
    float _1405 = fma(_1291, _1337, _1393);
    float _1407 = sqrt(_1395);
    float _1409 = -_1249;
    float _1411 = fma(_1409, _1309, _1361);
    float _1413 = fma(_1273, _1301, _1369);
    float _1415 = fma(_1201, _1343, _1405);
    float _1417 = fma(_1273, _1291, _1371);
    float _1419 = fma(_1277, _1301, _1383);
    float _1421 = fma(_1277, _1291, _1391);
    float _1423 = fma(_1277, _1309, _1389);
    float _1425 = fma(_1275, _1193, _1399);
    float _1427 = _657 + _1415;
    float _1429 = fma(_1275, _1201, _1403);
    float _1431 = fma(_1273, _1309, _1381);
    float _1433 = fma(_1275, _1195, _1411);
    bool _1435 = _1407 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1437 = _1415;
    float _1439 = _1385;
    float _1441 = _1387;
    float _1443 = _1365;
    float _1445 = _1367;
    if (!_1435)
    {
        _1437 = _1385;
    }
    float _1447 = _1437;
    float _1449 = _1447;
    if (!_1435)
    {
        _1439 = _1427;
    }
    float _1451 = _1439;
    bool _1453 = !_1435;
    float _1455 = _1451;
    if (!_1453)
    {
        float _1457 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1459 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1461 = _1407 + _1459;
        float _1463 = rsqrt(_1395);
        float _1465 = _1461 * _1457;
        float _1467 = _1427 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1469 = _1465 * 0.15915493667125701904296875;
        float _1471 = _1469 * 6.283185482025146484375;
        float _1473 = sin(_1471);
        float _1475 = _1469 * 6.283185482025146484375;
        float _1477 = cos(_1475);
        float _1479 = fma(_1473, _1467, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1481 = _1463 * _1479;
        float _1483 = fma(_1375, _1481, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1485 = _1477 + (-1.0);
        float _1487 = fma(_1379, _1481, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1489 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1491 = _1483 + _1489;
        float _1493 = _1485 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1495 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1497 = _1487 + _1495;
        float _1499 = _1491 * _1491;
        float _1501 = fma(_1427, _1477, _1493);
        float _1503 = _1497 * _1497;
        _1455 = _1501;
        _1449 = _1499;
        _1441 = _1503;
        _1443 = _1483;
        _1445 = _1487;
    }
    float _1505 = _1455;
    float _1507 = _1449;
    float _1509 = _1441;
    float _1511 = _1443;
    float _1513 = _1445;
    float _1515 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1517 = _1505 + _1515;
    float _1519 = fma(_1295, _1201, _1417);
    float _1521 = fma(_1269, _1201, _1421);
    float _1523 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1525 = fma(_1517, _1517, _1507);
    float _1527 = fma(_1295, _1193, _1413);
    float _1529 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1531 = _1523 * _1425;
    float _1533 = _1525 + _1509;
    float _1535 = fma(_1295, _1195, _1431);
    float _1537 = fma(_1269, _1193, _1419);
    float _1539 = _1523 * _1429;
    float _1541 = _1523 * _1433;
    float _1543 = fma(_1269, _1195, _1423);
    float _1545 = fma(_1529, _1527, _1531);
    float _1547 = sqrt(_1533);
    float _1549 = fma(_1529, _1519, _1539);
    float _1551 = fma(_1529, _1535, _1541);
    float _1553 = _1537 + _1545;
    float _1555 = _1521 + _1549;
    float _1557 = _1543 + _1551;
    out.m_76.x = _1553;
    out.m_76.y = _1555;
    out.m_76.z = _1557;
    bool _1559 = _1547 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1561 = isnan(_1547);
    bool _1563 = _1559 || _1561;
    bool _1565 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1567 = _1563 || _1565;
    float _1569 = _1531;
    if (!_1567)
    {
        _1569 = 1.0;
    }
    float _1571 = _1569;
    bool _1573 = !_1567;
    float _1575 = _1571;
    if (!_1573)
    {
        bool _1577 = _1547 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1579 = isnan(_1547);
        bool _1581 = _1577 || _1579;
        bool _1583 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1585 = _1581 || _1583;
        if (!_1585)
        {
            float _1587 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1589 = _1547 + _1587;
            float _1591 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1593 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1591;
            float _1595 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1597 = _1595 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1599 = 1.0 / _1593;
            float _1601 = _1589 * _1599;
            float _1603 = fma(_1601, _1597, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1575 = _1603;
            _1605 = true;
        }
        else
        {
            bool _1607 = _1547 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1609 = isnan(_1547);
            bool _1611 = _1607 || _1609;
            bool _1613 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1615 = _1611 || _1613;
            if (!_1615)
            {
                float _1617 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1619 = _1547 + _1617;
                float _1621 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1623 = _1621 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1625 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1627 = _1625 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1629 = 1.0 / _1623;
                float _1631 = _1619 * _1629;
                float _1633 = fma(_1631, _1627, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1575 = _1633;
                _1605 = true;
            }
            else
            {
                _1575 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1605 = false;
    float _1635 = _1575;
    float _1637 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1639 = _1505 + _1637;
    float _1641 = _989 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1643 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1645 = _1511 + _1643;
    float _1647 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1649 = _1513 + _1647;
    float _1651 = fma(_1639, _1635, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1653 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1641);
    float _1655 = fma(_1645, _1635, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1657 = fma(_1649, _1635, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1659 = -_657;
    float _1661 = _1659 + _1651;
    float _1663 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1653);
    float _1665 = -_829;
    float _1667 = _1665 + _1655;
    float _1669 = -_849;
    float _1671 = _1669 + _1657;
    float _1673 = _1661 * _1661;
    float _1675 = _1663 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1677 = _989 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1679 = fma(_1667, _1667, _1673);
    float _1681 = 1.0 / _1675;
    float _1683 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1677);
    float _1685 = fma(_1671, _1671, _1679);
    float _1687 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1683);
    float _1689 = sqrt(_1685);
    float _1691 = _1687 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1693 = _1691 + _1675;
    float _1695 = _1693 * _1681;
    float _1697 = _1695 * 0.5;
    bool _1699 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1701 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1703 = _1699 || _1701;
    bool _1705 = isnan(0.5);
    bool _1707 = _1703 || _1705;
    bool _1709 = _1689 > 0.0;
    float _1711 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1713 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1711);
    bool _1715 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1717 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1719 = _1715 || _1717;
    bool _1721 = isnan(0.5);
    bool _1723 = _1719 || _1721;
    float _1725 = 1.0 / _1713;
    float _1727 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1729 = _1681;
    float _1731 = _1651;
    float _1733 = _1657;
    if (!_1709)
    {
        _1727 = _1655;
    }
    float _1735 = _1727;
    float _1737 = _1735;
    if (!_1709)
    {
        _1729 = _1657;
    }
    float _1739 = _1729;
    bool _1741 = !_1709;
    float _1743 = _1739;
    float _1745 = _1739;
    if (!_1741)
    {
        float _1747 = _205 * _205;
        float _1749 = fma(_203, _203, _1747);
        float _1751 = fma(_207, _207, _1749);
        float _1753 = rsqrt(_1685);
        float _1755 = sqrt(_1751);
        float _1757 = _1667 * _1753;
        float _1759 = _1661 * _1753;
        float _1761 = _1671 * _1753;
        bool _1763 = _1755 > 0.0;
        float _1765 = _1755;
        if (!_1763)
        {
            _1765 = _1655;
        }
        float _1767 = _1765;
        _1737 = _1767;
        if (!_1763)
        {
            _1743 = _1657;
        }
        float _1769 = _1743;
        bool _1771 = !_1763;
        _1745 = _1769;
        if (!_1771)
        {
            float _1773 = rsqrt(_1751);
            float _1775 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1777 = _205 * _1773;
            float _1779 = _203 * _1773;
            float _1781 = _207 * _1773;
            float _1783 = _1759 * _1777;
            float _1785 = fma(_1757, _1779, _1783);
            float _1787 = _1775 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1789 = fma(_1761, _1781, _1785);
            float _1791 = _1789 * _1787;
            float _1793 = fma(_203, _1791, _1655);
            float _1795 = fma(_205, _1791, _1651);
            float _1797 = fma(_207, _1791, _1657);
            _1737 = _1793;
            _1731 = _1795;
            _1745 = _1797;
        }
    }
    float _1799 = _1737;
    float _1801 = _1731;
    float _1803 = _1745;
    float _1805 = -_983;
    float _1807 = fma(_1805, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1799);
    float _1809 = -_985;
    float _1811 = fma(_1809, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1801);
    float _1813 = -_991;
    float _1815 = fma(_1813, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1803);
    float _1817 = _1811;
    float _1819 = _1807;
    float _1821 = _1815;
    float _1823 = _1803;
    if (_1723)
    {
        _1733 = 1.0;
    }
    float _1825 = _1733;
    float _1827 = _1825;
    if (!_1707)
    {
        float _1829 = _1001 * _1001;
        float _1831 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1833 = -_849;
        float _1835 = _1833 + _1803;
        float _1837 = -_657;
        float _1839 = _1837 + _1801;
        float _1841 = fma(_1009, _1009, _1829);
        float _1843 = -_829;
        float _1845 = _1843 + _1799;
        float _1847 = fma(_1017, _1017, _1841);
        float _1849 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1851 = sqrt(_1847);
        float _1853 = 1.0 / _1211;
        float _1855 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1857 = precise::min(_1851, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1859 = _1857 * _1831;
        float _1861 = _1859 * _1853;
        float _1863 = _1855 * _1861;
        float _1865 = _1835 * _1861;
        float _1867 = fma(_1839, _1863, _989);
        float _1869 = fma(_1845, _1863, _995);
        float _1871 = fma(_1855, _1865, _1005);
        _1817 = _1867;
        _1819 = _1869;
        _1821 = _1871;
        _1823 = _1865;
        _689 = _1863;
    }
    float _1873 = _1817;
    float _1875 = _1819;
    float _1877 = _1821;
    float _1879 = _1823;
    float _1881 = _689;
    float _1883 = _1881;
    float _1885 = _1879;
    if (_1723)
    {
        _1883 = 1.0;
    }
    float _1887 = _1883;
    float _1889 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1891 = _1725 * _1889;
    float _1893 = _1887;
    if (!_1723)
    {
        float _1895 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1897 = _1895 * 0.15915493667125701904296875;
        float _1899 = _1897 * 6.283185482025146484375;
        float _1901 = cos(_1899);
        float _1903 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1905 = _1903 * 0.15915493667125701904296875;
        float _1907 = _1897 * 6.283185482025146484375;
        float _1909 = sin(_1907);
        float _1911 = 1.0 / _1901;
        float _1913 = _1905 * 6.283185482025146484375;
        float _1915 = cos(_1913);
        float _1917 = _1909 * _1911;
        float _1919 = _1905 * 6.283185482025146484375;
        float _1921 = sin(_1919);
        float _1923 = _1915 * _1917;
        float _1925 = 1.0 / _1923;
        float _1927 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1929 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1927;
        float _1931 = 1.0 / _1929;
        float _1933 = _1921 * _1925;
        float _1935 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1937 = fma(_1891, _1933, _1935);
        float _1939 = _1937 * _1931;
        float _1941 = precise::clamp(_1939, 0.0, 1.0);
        _211 = _1931;
        _213 = _1905;
        _1827 = _1941;
    }
    float _1943 = _211;
    float _1945 = _213;
    float _1947 = _1827;
    float _1949 = _1943;
    if (!_1723)
    {
        float _1951 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1953 = _1951 * 0.15915493667125701904296875;
        float _1955 = _1953 * 6.283185482025146484375;
        float _1957 = cos(_1955);
        float _1959 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1961 = _1959 * 0.15915493667125701904296875;
        float _1963 = _1953 * 6.283185482025146484375;
        float _1965 = sin(_1963);
        float _1967 = 1.0 / _1957;
        float _1969 = _1961 * 6.283185482025146484375;
        float _1971 = cos(_1969);
        float _1973 = _1965 * _1967;
        float _1975 = _1961 * 6.283185482025146484375;
        float _1977 = sin(_1975);
        float _1979 = _1971 * _1973;
        float _1981 = 1.0 / _1979;
        float _1983 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1985 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1983;
        float _1987 = 1.0 / _1985;
        float _1989 = _1977 * _1981;
        float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1993 = fma(_1891, _1989, _1991);
        float _1995 = _1993 * _1987;
        float _1997 = precise::clamp(_1995, 0.0, 1.0);
        float _1999 = -_1997;
        float _2001 = _1999 + 1.0;
        _1949 = _1957;
        _1893 = _2001;
    }
    float _2003 = _1949;
    float _2005 = _1893;
    float _2007 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2009 = _1873 + _2007;
    float _2011 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2013 = _1875 + _2011;
    float _2015 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2017 = _1877 + _2015;
    float _2019 = _2009 * _2009;
    float _2021 = fma(_2013, _2013, _2019);
    float _2023 = fma(_2017, _2017, _2021);
    float _2025 = rsqrt(_2023);
    float _2027 = _2025 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2029 = _2013 * _2027;
    float _2031 = _2017 * _2027;
    float _2033 = _2029 * _2029;
    float _2035 = _2031 * _2031;
    float _2037 = _2033 + _2035;
    float _2039 = sqrt(_2037);
    bool _2041 = _2039 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2043 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2045 = _2039 + _2043;
    float _2047 = _2003;
    float _2049 = _2037;
    float _2051 = _2045;
    float _2053 = _2009;
    float _2055 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _2057 = _2029;
    if (_2041)
    {
        float _2059 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2047 = _2059;
    }
    float _2061 = _2047;
    if (_2041)
    {
        float _2063 = rsqrt(_2037);
        _2049 = _2063;
    }
    float _2065 = _2049;
    float _2067 = _2061;
    float _2069 = _2065;
    if (_2041)
    {
        float _2071 = _2045 * _2061;
        _2051 = _2071;
    }
    float _2073 = _2051;
    if (_2041)
    {
        float _2075 = _2073 * 0.15915493667125701904296875;
        _2067 = _2075;
    }
    float _2077 = _2067;
    float _2079 = _2017;
    float _2081 = _2077;
    if (_2041)
    {
        float _2083 = _2077 * 6.283185482025146484375;
        float _2085 = sin(_2083);
        _2079 = _2085;
    }
    float _2087 = _2079;
    float _2089 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2091 = precise::max(0.0, _2089);
    float _2093 = _1945;
    if (_2041)
    {
        float _2095 = _2077 * 6.283185482025146484375;
        float _2097 = cos(_2095);
        _2093 = _2097;
    }
    float _2099 = _2093;
    float _2101 = -_2027;
    float _2103 = -_2091;
    float _2105 = fma(_2009, _2101, _2103);
    float _2107 = fma(_995, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_2041)
    {
        float _2109 = _2105 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2053 = _2109;
    }
    float _2111 = _2053;
    float _2113 = sqrt(_2023);
    float _2115 = _2111;
    if (!_2041)
    {
        _2081 = _2105;
    }
    float _2117 = _2081;
    float _2119 = _2087;
    float _2121 = _2117;
    if (_2041)
    {
        float _2123 = fma(_2087, _2111, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2119 = _2123;
    }
    float _2125 = _2119;
    float _2127 = _2125;
    float _2129 = _2099;
    if (_2041)
    {
        float _2131 = _2099 + (-1.0);
        _2115 = _2131;
    }
    float _2133 = _2115;
    if (_2041)
    {
        float _2135 = _2065 * _2125;
        _2055 = _2135;
    }
    float _2137 = _2055;
    if (!_2041)
    {
        _2069 = _2031;
    }
    float _2139 = _2069;
    float _2141 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2143 = _2139;
    if (_2041)
    {
        float _2145 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1885 = _2145;
    }
    float _2147 = _1885;
    if (_2041)
    {
        float _2149 = _2029 * _2137;
        _2057 = _2149;
    }
    float _2151 = _2057;
    if (!_2041)
    {
        _2127 = _2033;
    }
    float _2153 = _2127;
    float _2155 = _2153;
    if (_2041)
    {
        float _2157 = _2031 * _2137;
        _2143 = _2157;
    }
    float _2159 = _2143;
    if (_2041)
    {
        float _2161 = fma(_2105, _2099, _2147);
        _2121 = _2161;
    }
    float _2163 = _2121;
    if (_2041)
    {
        float _2165 = _2151 * _2151;
        _2155 = _2165;
    }
    float _2167 = _2155;
    if (!_2041)
    {
        _2129 = _2035;
    }
    float _2169 = _2129;
    float _2171 = _2169;
    if (_2041)
    {
        float _2173 = _2159 * _2159;
        _2171 = _2173;
    }
    float _2175 = _2171;
    float _2177 = fma(_2163, _2163, _2167);
    float _2179 = floor(_2107);
    float _2181 = _2177 + _2175;
    float _2183 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2141);
    float _2185 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2187 = fma(_2113, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2185);
    float _2189 = precise::clamp(_2187, 0.0, 1.0);
    float _2191 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2193 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2183);
    float _2195 = -_2189;
    float _2197 = _2195 + 1.0;
    float _2199 = rsqrt(_2181);
    float _2201 = _2193 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2203 = fma(_1005, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2205 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2207 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2209 = abs(_2197);
    float _2211 = log2(_2209);
    float _2213 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2215 = -_2207;
    float _2217 = fma(_2215, _2191, 1.0);
    float _2219 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2221 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2213);
    float _2223 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2219);
    float _2225 = _2199 * _2151;
    float _2227 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2221);
    float _2229 = _2199 * _2163;
    float _2231 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2223);
    float _2233 = _2199 * _2159;
    float _2235 = _2227 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2237 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2239 = _2231 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2241 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2205);
    float _2243 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2245 = -_2237;
    float _2247 = fma(_2229, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2245);
    float _2249 = log2(_2217);
    float _2251 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2241);
    float _2253 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2243);
    float _2255 = -_2233;
    float _2257 = fma(_2255, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2247);
    float _2259 = _2211 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2261 = -_2179;
    float _2263 = _2107 + _2261;
    float _2265 = fma(_2201, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2253);
    float _2267 = fma(_2257, -0.5, 0.5);
    float _2269 = floor(_2203);
    float _2271 = _2251 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2273 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2275 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2277 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2265);
    float _2279 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2273);
    float _2281 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2275);
    float _2283 = exp2(_2259);
    float _2285 = fma(_2257, 0.5, 0.5);
    float _2287 = fma(_2201, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2279);
    float _2289 = fma(_2201, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2281);
    float _2291 = _2249 * 0.693147182464599609375;
    float _2293 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2287);
    float _2295 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2289);
    float _2297 = 1.0 / _2277;
    float _2299 = -_2269;
    float _2301 = _2203 + _2299;
    float _2303 = fma(_2285, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2305 = _2229 + 1.0;
    float _2307 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2309 = fma(_2285, _2303, -0.212114393711090087890625);
    float _2311 = sqrt(_2267);
    float2 _6442 = float2(_2263, _2301);
    float _2313 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6442, float2(0.0), isnan(_6442)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6442, float2(0.0), isnan(_6442)), level(0.0)).x;
    float _2315 = -_2229;
    float _2317 = fma(_2283, _2305, _2315);
    float _2319 = fma(_2285, _2309, 1.570728778839111328125);
    float _2321 = fma(_2317, 0.5, 0.5);
    float _2323 = _2293 * _2297;
    float _2325 = _2295 * _2297;
    float _2327 = fma(_2323, 0.5, 0.5);
    float _2329 = fma(_2325, -0.5, 0.5);
    float _2331 = _2311 * 0.636619746685028076171875;
    float3 _6478 = float3(_2327, _2329, _2307);
    float _2333 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6478, float3(0.0), isnan(_6478)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6478, float3(0.0), isnan(_6478)), level(0.0)).x;
    float3 _6489 = float3(_2327, _2329, _2307);
    float4 _2336 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6489, float3(0.0), isnan(_6489)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6489, float3(0.0), isnan(_6489)), level(0.0)).xyzw;
    float _2338 = _2336.x;
    float _2340 = _2336.y;
    float _2342 = _2336.z;
    float _2344 = _2336.w;
    float _2346 = -_2319;
    float _2348 = fma(_2331, _2346, 1.0);
    float2 _6510 = float2(_2348, _2321);
    float3 _2352 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6510, float2(0.0), isnan(_6510)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6510, float2(0.0), isnan(_6510)), level(0.0)).xyz;
    float _2354 = _2352.x;
    float _2356 = _2352.y;
    float _2358 = _2352.z;
    float _2360 = abs(_1891);
    float _2362 = log2(_2360);
    float _2364 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2366 = in.m_78.x;
    float _2368 = _2277 * 0.5;
    float _2370 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2364);
    bool _2372 = _1891 <= 8000.0;
    bool _2374 = isnan(_1891);
    bool _2376 = _2372 || _2374;
    bool _2378 = isnan(8000.0);
    bool _2380 = _2376 || _2378;
    float _2382 = float(_2380);
    float _2384 = fma(_2201, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2370);
    float _2386 = _2293 + _2277;
    bool _2388 = _2113 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2390 = isnan(_2113);
    bool _2392 = _2388 || _2390;
    bool _2394 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2396 = _2392 || _2394;
    float _2398 = _2386 * 0.5;
    float _2400 = _2362 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2402 = exp2(_2400);
    float _2404 = fma(_2402, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2406 = precise::clamp(_2404, 0.0, 1.0);
    float _2408 = _2211 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2410 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2384);
    float _2412 = fma(_2406, -2.0, 3.0);
    float _2414 = _2406 * _2406;
    float _2416 = _2410 + _2277;
    float _2418 = exp2(_2408);
    out.gl_Position.x = _2293;
    out.gl_Position.y = _2295;
    out.gl_Position.z = _2410;
    out.gl_Position.w = _2277;
    float _2420 = _2414 * _2412;
    float _2422 = _2416 * 0.5;
    float _2424 = -_2420;
    float _2426 = _2424 + 1.0;
    float _2428 = fma(_2426, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2420);
    float _2430 = fma(_2295, -0.5, _2368);
    float _2432 = _2382 * _2428;
    float _2434 = -_2418;
    float _2436 = _2434 + 1.0;
    out.m_80.x = _2398;
    out.m_80.y = _2430;
    out.m_80.z = _2422;
    out.m_80.w = _2277;
    float _2438 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2440 = _1947 * _2005;
    float _2442 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2444 = _2277;
    float _2446 = _2410;
    float _2448 = _2295;
    float _2450 = _2440;
    if (!_2396)
    {
        _2444 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2452 = _2444;
    float _2454 = _2452;
    float _2456 = _2452;
    if (!_2396)
    {
        _2446 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2458 = _2446;
    float _2460 = _2458;
    float _2462 = _2458;
    if (!_2396)
    {
        _2448 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2464 = _2448;
    float _2466 = -_2313;
    float _2468 = _2466 + 1.0;
    float _2470 = _2468 * _2438;
    float _2472 = precise::clamp(_2470, 0.0, 1.0);
    float _2474 = -_2472;
    float _2476 = fma(_2474, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2478 = _2476 * _2366;
    float _2480 = _2442 * _2333;
    float _2482 = -_2442;
    float _2484 = _2482 + 1.0;
    float _2486 = _2344 * _2480;
    float _2488 = _2358 * _2480;
    float _2490 = fma(_2356, _2486, _2340);
    float _2492 = fma(_2354, _2486, _2338);
    float _2494 = _2478 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2496 = _2344 * _2484;
    float _2498 = fma(_2344, _2488, _2342);
    float _2500 = _2440 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2502 = _2478;
    float _2504 = _2338;
    float _2506 = _2464;
    float _2508 = _2464;
    if (!_2396)
    {
        _2502 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2510 = _2502;
    out.m_82.x = _2494;
    float _2512 = _2510;
    float _2514 = _2510;
    if (!_2396)
    {
        _2504 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2516 = _2504;
    float _2518 = _2516;
    float _2520 = _2516;
    if (!_2396)
    {
        _2450 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2522 = _2450;
    out.m_84.x = _2492;
    out.m_84.y = _2490;
    out.m_84.z = _2498;
    out.m_84.w = _2496;
    bool _2524 = !_2396;
    float _2526 = _2522;
    float _2528 = _2522;
    if (!_2524)
    {
        bool _2530 = _2113 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2532 = isnan(_2113);
        bool _2534 = _2530 || _2532;
        bool _2536 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2538 = _2534 || _2536;
        if (!_2538)
        {
            float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2542 = _2113 + _2540;
            float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2546 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2544;
            float _2548 = 1.0 / _2546;
            float _2550 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2552 = _2550 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2554 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2556 = _2554 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2558 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2560 = _2558 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2562 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2564 = _2562 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2568 = _2566 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2570 = _2542 * _2548;
            float _2572 = precise::clamp(_2570, 0.0, 1.0);
            float _2574 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2576 = _2574 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2578 = fma(_2572, _2552, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2580 = fma(_2572, _2576, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2582 = fma(_2572, _2556, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2584 = fma(_2572, _2560, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2586 = fma(_2572, _2564, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2588 = fma(_2572, _2568, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2520 = _2580;
            _2508 = _2586;
            _2514 = _2578;
            _2462 = _2584;
            _2456 = _2582;
            _2528 = _2588;
            _2590 = true;
        }
        else
        {
            bool _2592 = _2113 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2594 = isnan(_2113);
            bool _2596 = _2592 || _2594;
            bool _2598 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2600 = _2596 || _2598;
            if (!_2600)
            {
                _2512 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2602 = _2512;
            _2514 = _2602;
            if (!_2600)
            {
                _2518 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2604 = _2518;
            _2520 = _2604;
            if (!_2600)
            {
                _2454 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2606 = _2454;
            _2456 = _2606;
            if (!_2600)
            {
                _2460 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2608 = _2460;
            _2462 = _2608;
            if (!_2600)
            {
                _2506 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2610 = _2506;
            _2508 = _2610;
            if (!_2600)
            {
                _2526 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2612 = _2526;
            bool _2614 = !_2600;
            _2528 = _2612;
            if (!_2614)
            {
                bool _2616 = _2113 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2618 = isnan(_2113);
                bool _2620 = _2616 || _2618;
                bool _2622 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2624 = _2620 || _2622;
                if (!_2624)
                {
                    float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2628 = _2113 + _2626;
                    float _2630 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2632 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2630;
                    float _2634 = 1.0 / _2632;
                    float _2636 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2638 = _2636 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2640 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2642 = _2640 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2644 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2646 = _2644 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2648 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2650 = _2648 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2652 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2654 = _2652 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2656 = _2628 * _2634;
                    float _2658 = precise::clamp(_2656, 0.0, 1.0);
                    float _2660 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2662 = _2660 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2664 = fma(_2658, _2638, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2666 = fma(_2658, _2662, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2668 = fma(_2658, _2642, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2670 = fma(_2658, _2646, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2672 = fma(_2658, _2650, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2674 = fma(_2658, _2654, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2520 = _2666;
                    _2508 = _2672;
                    _2514 = _2664;
                    _2462 = _2670;
                    _2456 = _2668;
                    _2528 = _2674;
                    _2590 = true;
                }
                else
                {
                    _2520 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2508 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2514 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2462 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2456 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2528 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2590 = false;
    float _2676 = _2520;
    float _2678 = _2508;
    float _2680 = _2514;
    float _2682 = _2462;
    float _2684 = _2456;
    float _2686 = _2528;
    float _2688 = fma(_1555, -0.5, 0.5);
    float _2690 = precise::clamp(_2688, 0.0, 1.0);
    float _2692 = -_2676;
    float _2694 = _2692 + _2678;
    float _2696 = -_2680;
    float _2698 = _2696 + _2682;
    out.m_86.x = 0.0;
    float _2700 = -_2684;
    float _2702 = _2700 + _2686;
    float _2704 = fma(_2690, _2694, _2676);
    float _2706 = fma(_2690, _2698, _2680);
    bool _2708 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2710 = _2704 * 0.586610972881317138671875;
    float _2712 = fma(_2690, _2702, _2684);
    float _2714 = _2500 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2716 = fma(_2706, 0.298911988735198974609375, _2710);
    bool _2718 = _1947 > 0.0;
    bool _2720 = isnan(_1947);
    bool _2722 = _2718 || _2720;
    bool _2724 = isnan(0.0);
    bool _2726 = _2722 || _2724;
    float _2728 = fma(_2712, 0.114477999508380889892578125, _2716);
    out.m_51.x = _2714;
    bool _2730 = _2005 <= 0.0;
    bool _2732 = !_2726;
    bool _2734 = _2730 || _2732;
    float _2736 = -_2728;
    float _2738 = _2706 + _2736;
    float _2740 = -_2728;
    float _2742 = _2704 + _2740;
    float _2744 = -_2728;
    float _2746 = _2712 + _2744;
    float _2748 = fma(_2738, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2728);
    float _2750 = fma(_2742, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2728);
    float _2752 = fma(_2746, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2728);
    bool _2754 = !_2708;
    if (!_2754)
    {
        float _2756 = -_1873;
        float _2758 = _2756 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2760 = -_1875;
        float _2762 = _2760 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2764 = -_1877;
        float _2766 = _2764 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2768 = _2758 * _2758;
        float _2770 = fma(_2762, _2762, _2768);
        float _2772 = fma(_2766, _2766, _2770);
        float _2774 = sqrt(_2772);
        float _2776 = rsqrt(_2772);
        float _2778 = -_2774;
        float _2780 = _2778 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2782 = _2780 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2784 = precise::clamp(_2782, 0.0, 1.0);
        float _2786 = _2762 * _2776;
        float _2788 = _2758 * _2776;
        float _2790 = abs(_2784);
        float _2792 = log2(_2790);
        float _2794 = _2766 * _2776;
        float _2796 = _2786 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2798 = _1555 * _2788;
        float _2800 = -_2788;
        float _2802 = -_2796;
        float _2804 = fma(_2800, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2802);
        float _2806 = fma(_1553, _2786, _2798);
        float _2808 = -_2794;
        float _2810 = fma(_2808, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2804);
        float _2812 = fma(_1557, _2794, _2806);
        float _2814 = precise::clamp(_2812, 0.0, 1.0);
        float _2816 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2818 = _2810 + _2816;
        float _2820 = _2792 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2822 = _2818 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2824 = precise::clamp(_2822, 0.0, 1.0);
        float _2826 = exp2(_2820);
        float _2828 = _2826 * _2824;
        float _2830 = _2814 * _2828;
        float _2832 = _2830 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2834 = _2830 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2836 = _2830 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _2832;
        out.m_86.y = _2834;
        out.m_86.z = _2836;
    }
    out.m_88.x = _2748;
    out.m_88.y = _2750;
    out.m_88.z = _2752;
    if (!_2734)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2838 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2838;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2590 = false;
    bool _1605 = false;
    bool _329 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_48.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    if (!_111)
    {
        out.m_51.x = 0.0;
    }
    int _117 = 0;
    if (!_111)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2894 = as_type<float>(_121);
        out.gl_Position.z = _2894;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_53.w;
    float _127 = float(_107);
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
    float _153 = _125;
    float _155 = _145;
    float _157 = _133;
    if (_151)
    {
        _153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _153;
    if (_151)
    {
        out.m_51.x = 0.0;
    }
    if (_151)
    {
        float _161 = _159 * 5.0;
        _123 = as_type<int>(_161);
    }
    int _163 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2967 = as_type<float>(_163);
        out.gl_Position.z = _2967;
    }
    if (_151)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = in.m_60.x;
    float _169 = in.m_60.y;
    float _171 = in.m_60.z;
    int _173 = as_type<int>(_165) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_165) & 2;
    bool _179 = _177 != 0;
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _183 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _185 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _187 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _189 = !_175;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _183);
    float _195 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _185);
    float _197 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _187);
    bool _199 = !_179;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _193);
    float _205 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _195);
    float _207 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _197);
    bool _209 = !_181;
    float _211 = _207;
    float _213 = _205;
    float _231;
    if (!_209)
    {
        float _215 = in.m_62.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        _231 = _145;
    }
    _233 = false;
    float _235 = _231;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = _235 + _237;
    bool _241 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _243 = isnan(_235);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _253;
    float _257 = -_251;
    float _259 = _257 + 1.0;
    bool _261 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _263 = isnan(_235);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _273;
    bool _277 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _279 = 1.0 / _255;
    float _281 = _271 * _259;
    float _283 = -_271;
    float _285 = _283 + 1.0;
    float _287 = _239 * _279;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _289;
    float _293 = fma(_275, _287, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _295 = fma(_291, _287, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _297 = _293 * _281;
    float _299 = _295 * _281;
    float _301 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[143].x, _297);
    float _303 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[143].y, _299);
    float _305 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[144].x, _301);
    float _307 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[144].y, _303);
    bool _309 = !_277;
    float _327;
    if (!_309)
    {
        float _311 = in.m_62.x;
        float _313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _315 = _311 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _319 = _317 * _313;
        float _321 = floor(_319);
        float _323 = -_321;
        float _325 = _319 + _323;
        _327 = _325;
        _329 = true;
    }
    else
    {
        _327 = _145;
    }
    _329 = false;
    float _331 = _327;
    float _333 = in.m_64.x;
    float _335 = in.m_64.y;
    bool _337 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _339 = isnan(_331);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _353 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _355 = isnan(_331);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _371 = _331 + _369;
    float _373 = -_347;
    float _375 = _373 + 1.0;
    bool _377 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _379 = 1.0 / _351;
    float _381 = _363 * _375;
    float _383 = -_363;
    float _385 = _383 + 1.0;
    float _387 = _307 * _335;
    float _389 = _305 * _333;
    float _391 = _367 * _379;
    float _393 = fma(_391, _371, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _395 = _393 * _381;
    float _397 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[115].x, _395);
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _405 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[116].x, _397);
    float _407 = _399 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _409 = _401 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = _403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _413 = _405 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _407;
    out.m_66.y = _409;
    out.m_66.z = _411;
    out.m_66.w = _413;
    bool _415 = !_377;
    if (!_415)
    {
        float _417 = in.m_62.x;
        float _419 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _421 = _417 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _423 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[11].w, _133);
        float _425 = _423 * _419;
        float _427 = floor(_425);
        float _429 = -_427;
        float _431 = _425 + _429;
        _155 = _431;
    }
    float _433 = _155;
    float _435 = in.m_62.x;
    float _437 = in.m_62.y;
    float _439 = in.m_62.z;
    float _441 = in.m_62.w;
    float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _445 = in.m_48.x;
    float _447 = in.m_48.y;
    float _449 = in.m_48.z;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _453 = _451 != 0;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _457 = _455 != 0;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _463 = _461 != 0;
    float _465 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _469 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _471 = _437 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _473 = _441 > 0.5;
    float _475 = _435 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _479 = fma(_471, -2.0, _459);
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _483 = _481 != 0;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _487 = _485 != 0;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _493 = -_201;
    int _495 = _473 ? as_type<int>(_493) : as_type<int>(_201);
    float _497 = -_467;
    float _499 = fma(_475, 2.0, _497);
    bool _501 = _435 > 0.5;
    float _503 = _447 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _505 = 1.0 / _491;
    float _507 = _447 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _509 = -_191;
    int _511 = _501 ? as_type<int>(_509) : as_type<int>(_191);
    float _513 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[4].x, _503);
    int _515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _517 = _515 != 0;
    float _519 = _439 * 2.0;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _521;
    float _525 = _447 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _527 = _435 * 2.0;
    float _529 = floor(_519);
    bool _531 = !_453;
    float _533 = _531 ? _191 : as_type<float>(_511);
    float _535 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[6].x, _525);
    bool _537 = _437 > 0.5;
    float _539 = _437 + _439;
    float _541 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[5].x, _507);
    float _543 = -_133;
    float _545 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[76].x, _499);
    float _547 = -_201;
    int _549 = _537 ? as_type<int>(_547) : as_type<int>(_201);
    float _551 = floor(_527);
    float _553 = _539 + (-1.0);
    float _555 = _523 * _505;
    float _557 = _437 + _435;
    bool _559 = !_457;
    float _561 = _559 ? _201 : as_type<float>(_549);
    float _563 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _565 = _439 > 0.5;
    float _567 = _557 + (-1.0);
    float _569 = _533 + 0.5;
    float _571 = -_191;
    int _573 = _537 ? as_type<int>(_571) : as_type<int>(_191);
    float _575 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[4].z, _513);
    bool _577 = _529 > 0.0;
    float _579 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _581 = _529 >= 0.0;
    bool _583 = isnan(_529);
    bool _585 = _581 || _583;
    bool _587 = isnan(0.0);
    bool _589 = _585 || _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _593 = _433 + _591;
    float _595 = _553;
    float _597 = _443;
    float _599 = _535;
    if (!_517)
    {
        _595 = _439;
    }
    float _601 = _595;
    float _603 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[5].z, _541);
    float _605 = _601;
    if (_517)
    {
        _605 = _437;
    }
    float _607 = _605;
    float _609 = fma(_555, _593, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _611 = -_191;
    int _613 = _565 ? as_type<int>(_611) : as_type<int>(_191);
    float _615 = _443 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _617 = -_201;
    int _619 = _565 ? as_type<int>(_617) : as_type<int>(_201);
    float _621 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[83].w, _477);
    bool _623 = !_463;
    float _625 = _623 ? _191 : as_type<float>(_613);
    float _627 = fma(_615, _569, _545);
    bool _629 = _551 > 0.0;
    float _631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _633 = _551 >= 0.0;
    bool _635 = isnan(_551);
    bool _637 = _633 || _635;
    bool _639 = isnan(0.0);
    bool _641 = _637 || _639;
    float _643 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[6].z, _535);
    bool _645 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _647 = isnan(_433);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = _603 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _659 = !_487;
    float _661 = _659 ? _201 : as_type<float>(_619);
    float _663 = _465 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _665 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _667 = isnan(_433);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _479);
    float _679 = -_655;
    float _681 = _679 + 1.0;
    float _683 = _561 + (-0.5);
    float _685 = -_661;
    float _687 = _685 + 0.5;
    float _689 = _657;
    if (!_517)
    {
        _597 = _437;
    }
    float _691 = _597;
    float _693 = _675 * _681;
    float _695 = _691;
    if (_517)
    {
        _695 = _435;
    }
    float _697 = _695;
    float _699 = -_663;
    float _701 = -_677;
    float _703 = fma(_699, _683, _701);
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _707 = !_483;
    float _709 = _707 ? _191 : as_type<float>(_573);
    float _711 = _609 * _693;
    int _713 = _589 ? 0 : 1;
    float _715 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[83].z, _705);
    if (!_517)
    {
        _599 = _439;
    }
    float _717 = _599;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _723 = _721 != 0;
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _727 = _725 != 0;
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _731 = _729 != 0;
    float _733 = _697 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _735 = _717;
    if (_517)
    {
        _735 = _437;
    }
    float _737 = _735;
    float _739 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _741 = -_719;
    float _743 = fma(_733, 2.0, _741);
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _747 = _745 != 0;
    float _749 = _737 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _751 = -_675;
    float _753 = _751 + 1.0;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _757 = _631 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _759 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _761 = !_747;
    float _763 = _761 ? _201 : as_type<float>(_495);
    float _765 = fma(_749, -2.0, _755);
    float _767 = _625 + 0.5;
    float _769 = -_133;
    float _771 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[81].x, _743);
    float _773 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[131].x, _711);
    float _775 = _709 + 0.5;
    float _777 = _469 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _779 = fma(_757, _767, _771);
    float _781 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[132].x, _773);
    float _783 = _775 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _785 = _763 + (-0.5);
    float _787 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _765);
    float _789 = _687 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _791 = _783 * _739;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _795 = -_777;
    float _797 = -_787;
    float _799 = fma(_795, _785, _797);
    float _801 = _789 * _759;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _805 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[78].w, _793);
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _809 = ~_713;
    int _811 = _809 + 1;
    int _813 = _811 + 1;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _817 = _813;
    if (!_577)
    {
        int _819 = ~_713;
        int _821 = _819 + 1;
        _817 = _821;
    }
    int _823 = _817;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _827 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[78].z, _803);
    float _829 = _575 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _831 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _833 = _657 + _831;
    float _835 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _805);
    float _837 = _807 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _839 = _815 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _841 = _825 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _843 = _781 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _845 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _847 = log2(_845);
    float _849 = _643 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _851 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _853 = _829 + _851;
    float _855 = _833 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _857 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _827);
    float _859 = -_835;
    float _861 = _859 + 1.0;
    float _863 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _865 = _849 + _863;
    float _867 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[28].x, _855);
    float _869 = -_857;
    float _871 = _869 + 1.0;
    out.m_68.x = _837;
    out.m_68.y = _839;
    out.m_68.z = _841;
    out.m_68.w = _843;
    float _873 = fma(_561, _861, _703);
    float _875 = _833 * _833;
    float _877 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[28].z, _867);
    float _879 = -_871;
    float _881 = fma(_533, _879, _627);
    float _883 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _621);
    float _885 = fma(_853, _853, _875);
    out.m_70.x = _791;
    out.m_70.y = _801;
    bool _887 = _877 >= 0.0;
    float _889 = _847 * _133;
    float _891 = float(_823);
    float _893 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _715);
    float _895 = _437 * 2.0;
    bool _897 = !_723;
    int _899 = _897 ? 0 : 1;
    float _901 = fma(_865, _865, _885);
    float _903 = -_883;
    float _905 = _903 + 1.0;
    int _907 = abs(_899);
    float _909 = exp2(_889);
    bool _911 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _913 = isnan(1.0);
    bool _915 = _911 || _913;
    bool _917 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _919 = _915 || _917;
    float _921 = fma(_763, _905, _799);
    float _923 = float(_907);
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _927 = 1.0 + _925;
    float _929 = -_893;
    float _931 = _929 + 1.0;
    float _933 = _883;
    if (_887)
    {
        _933 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _935 = _933;
    int _937 = as_type<int>(_935);
    if (_887)
    {
        out.m_51.x = 0.0;
    }
    float _939 = rsqrt(_901);
    float _941 = _923 * _891;
    float _943 = -_931;
    float _945 = fma(_625, _943, _779);
    if (_887)
    {
        float _947 = _935 * 5.0;
        _937 = as_type<int>(_947);
    }
    int _949 = _937;
    bool _951 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _953 = isnan(0.0);
    bool _955 = _951 || _953;
    bool _957 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _959 = _955 || _957;
    out.m_72.x = _881;
    out.m_72.y = _873;
    out.m_72.z = _945;
    out.m_72.w = _921;
    float _961 = 1.0 / _927;
    float _963 = -_909;
    float _965 = _963 + 1.0;
    bool _967 = !_727;
    int _969 = _967 ? 0 : 1;
    float _971 = in.m_74.x;
    float _973 = in.m_74.y;
    float _975 = in.m_74.z;
    bool _977 = !_731;
    int _979 = _977 ? 0 : 1;
    if (_887)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4330 = as_type<float>(_949);
        out.gl_Position.z = _4330;
    }
    float _981 = floor(_895);
    float _983 = _853 * _939;
    float _985 = _833 * _939;
    if (_887)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _987 = -_985;
    float _989 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[18].w, _657);
    float _991 = _865 * _939;
    float _993 = -_983;
    float _995 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[18].w, _829);
    float _997 = _959 ? _965 : 0.0;
    float _999 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1001 = _989 + _999;
    float _1003 = -_991;
    float _1005 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[18].w, _849);
    float _1007 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1009 = _995 + _1007;
    int _1011 = _641 ? 0 : 1;
    float _1013 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1015 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1017 = _1005 + _1015;
    bool _1019 = _981 > 0.0;
    float _1021 = -_985;
    float _1023 = fma(_1021, (*spvDescriptorSet0.vp_c9)._m0[18].w, _833);
    float _1025 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1013);
    bool _1027 = _981 >= 0.0;
    bool _1029 = isnan(_981);
    bool _1031 = _1027 || _1029;
    bool _1033 = isnan(0.0);
    bool _1035 = _1031 || _1033;
    float _1037 = _941 * (-2.0);
    int _1039 = ~_1011;
    int _1041 = _1039 + 1;
    int _1043 = _1041 + 1;
    float _1045 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1025);
    int _1047 = _1043;
    if (!_629)
    {
        int _1049 = ~_1011;
        int _1051 = _1049 + 1;
        _1047 = _1051;
    }
    int _1053 = _1047;
    float _1055 = fma(_579, _1037, _579);
    float _1057 = fma(_1037, _971, _971);
    float _1059 = _435 + (-0.5);
    bool _1061 = _1045 >= 0.0;
    float _1063 = -_983;
    float _1065 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[18].w, _853);
    float _1067 = _1023 * _1023;
    float _1069 = _1055;
    if (_919)
    {
        float _1071 = _997 * _961;
        _157 = _1071;
    }
    float _1073 = _157;
    float _1075 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1057);
    int _1077 = abs(_969);
    float _1079 = fma(_1065, _1065, _1067);
    float _1081 = -_991;
    float _1083 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[18].w, _865);
    float _1085 = fma(_1055, _1073, _1075);
    float _1087 = float(_1053);
    float _1089 = _437 + (-0.5);
    float _1091 = float(_1077);
    float _1093 = fma(_1083, _1083, _1079);
    float _1095 = _1085 * 0.15915493667125701904296875;
    if (_1061)
    {
        _1069 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1097 = _1069;
    int _1099 = as_type<int>(_1097);
    if (_1061)
    {
        out.m_51.x = 0.0;
    }
    float _1101 = _1091 * _1087;
    float _1103 = _1095 * 6.283185482025146484375;
    float _1105 = sin(_1103);
    int _1107 = _1035 ? 0 : 1;
    if (_1061)
    {
        float _1109 = _1097 * 5.0;
        _1099 = as_type<int>(_1109);
    }
    int _1111 = _1099;
    float _1113 = _1101 * (-2.0);
    int _1115 = ~_1107;
    int _1117 = _1115 + 1;
    int _1119 = _1117 + 1;
    float _1121 = fma(_1113, _973, _973);
    float _1123 = sqrt(_1093);
    int _1125 = _1119;
    if (!_1019)
    {
        int _1127 = ~_1107;
        int _1129 = _1127 + 1;
        _1125 = _1129;
    }
    int _1131 = _1125;
    if (_1061)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4572 = as_type<float>(_1111);
        out.gl_Position.z = _4572;
    }
    float _1133 = fma(_563, _1113, _563);
    int _1135 = abs(_979);
    if (_1061)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1137 = -_657;
    float _1139 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1141 = float(_1131);
    float _1143 = -_829;
    float _1145 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1147 = -_849;
    float _1149 = _1147 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1151 = _1139 * _1139;
    float _1153 = float(_1135);
    float _1155 = fma(_1089, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1121);
    float _1157 = _439 + _435;
    float _1159 = fma(_1145, _1145, _1151);
    float _1161 = _1153 * _1141;
    float _1163 = fma(_1133, _1073, _1155);
    float _1165 = fma(_1149, _1149, _1159);
    float _1167 = _1157 + (-1.0);
    float _1169 = _1161 * (-2.0);
    float _1171 = _1163 * 0.15915493667125701904296875;
    float _1173 = _439 + (-0.5);
    float _1175 = fma(_1167, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1177 = rsqrt(_1165);
    float _1179 = fma(_1169, _975, _975);
    float _1181 = fma(_1175, _1169, _1175);
    float _1183 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1179);
    float _1185 = _1095 * 6.283185482025146484375;
    float _1187 = cos(_1185);
    float _1189 = fma(_1181, _1073, _1183);
    float _1191 = _1189 * 0.15915493667125701904296875;
    float _1193 = _1145 * _1177;
    float _1195 = _1149 * _1177;
    float _1197 = _1171 * 6.283185482025146484375;
    float _1199 = sin(_1197);
    float _1201 = _1139 * _1177;
    float _1203 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1205 = _1193 * _1203;
    float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1209 = _1195 * _1207;
    float _1211 = _939 * _1123;
    float _1213 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1215 = _1201 * _1213;
    float _1217 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1219 = -_1205;
    float _1221 = fma(_1195, _1217, _1219);
    float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1225 = -_1209;
    float _1227 = fma(_1201, _1223, _1225);
    float _1229 = _1171 * 6.283185482025146484375;
    float _1231 = cos(_1229);
    float _1233 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1235 = -_1215;
    float _1237 = fma(_1193, _1233, _1235);
    float _1239 = _1221 * _1221;
    float _1241 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1243 = _1241 * 0.5;
    float _1245 = fma(_1227, _1227, _1239);
    float _1247 = _1191 * 6.283185482025146484375;
    float _1249 = sin(_1247);
    float _1251 = _1105 * _1199;
    float _1253 = fma(_1237, _1237, _1245);
    float _1255 = _1187 * _1199;
    float _1257 = _1191 * 6.283185482025146484375;
    float _1259 = cos(_1257);
    float _1261 = _1187 * _1231;
    float _1263 = _1105 * _1231;
    float _1265 = rsqrt(_1253);
    float _1267 = fma(_1249, _1261, _1251);
    float _1269 = fma(_1249, _1251, _1261);
    float _1271 = _1187 * _1259;
    float _1273 = _1231 * _1259;
    float _1275 = _1105 * _1259;
    float _1277 = _1199 * _1259;
    float _1279 = _387 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1281 = _389 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1283 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _1285 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1287 = _1211 * _1279;
    float _1289 = _1211 * _1281;
    float _1291 = _1221 * _1265;
    float _1293 = -_1255;
    float _1295 = fma(_1249, _1263, _1293);
    float _1297 = _1283 * _1287;
    float _1299 = _1285 * _1289;
    float _1301 = _1227 * _1265;
    float _1303 = -_1263;
    float _1305 = fma(_1249, _1255, _1303);
    float _1307 = _1271 * _1297;
    float _1309 = _1237 * _1265;
    float _1311 = -_1297;
    float _1313 = _1249 * _1311;
    float _1315 = _1195 * _1291;
    float _1317 = fma(_1267, _1299, _1307);
    float _1319 = _1201 * _1301;
    float _1321 = _1275 * _1297;
    float _1323 = fma(_1273, _1299, _1313);
    float _1325 = fma(_1305, _1243, _1317);
    float _1327 = -_1315;
    float _1329 = fma(_1201, _1309, _1327);
    float _1331 = -_1319;
    float _1333 = fma(_1193, _1291, _1331);
    float _1335 = fma(_1295, _1299, _1321);
    float _1337 = fma(_1277, _1243, _1323);
    float _1339 = _1329 * _1325;
    float _1341 = _1333 * _1325;
    float _1343 = fma(_1269, _1243, _1335);
    float _1345 = _1193 * _1309;
    float _1347 = fma(_1301, _1337, _1339);
    float _1349 = fma(_1309, _1337, _1341);
    float _1351 = _1271 * _1329;
    float _1353 = -_1345;
    float _1355 = fma(_1195, _1301, _1353);
    float _1357 = fma(_1193, _1343, _1347);
    float _1359 = fma(_1195, _1343, _1349);
    float _1361 = _1271 * _1333;
    float _1363 = _1271 * _1355;
    float _1365 = _829 + _1357;
    float _1367 = _849 + _1359;
    float _1369 = _1267 * _1329;
    float _1371 = _1267 * _1355;
    float _1373 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1375 = _1365 + _1373;
    float _1377 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1379 = _1367 + _1377;
    float _1381 = _1267 * _1333;
    float _1383 = _1305 * _1329;
    float _1385 = _1375 * _1375;
    float _1387 = _1379 * _1379;
    float _1389 = _1305 * _1333;
    float _1391 = _1305 * _1355;
    float _1393 = _1355 * _1325;
    float _1395 = _1385 + _1387;
    float _1397 = -_1249;
    float _1399 = fma(_1397, _1301, _1351);
    float _1401 = -_1249;
    float _1403 = fma(_1401, _1291, _1363);
    float _1405 = fma(_1291, _1337, _1393);
    float _1407 = sqrt(_1395);
    float _1409 = -_1249;
    float _1411 = fma(_1409, _1309, _1361);
    float _1413 = fma(_1273, _1301, _1369);
    float _1415 = fma(_1201, _1343, _1405);
    float _1417 = fma(_1273, _1291, _1371);
    float _1419 = fma(_1277, _1301, _1383);
    float _1421 = fma(_1277, _1291, _1391);
    float _1423 = fma(_1277, _1309, _1389);
    float _1425 = fma(_1275, _1193, _1399);
    float _1427 = _657 + _1415;
    float _1429 = fma(_1275, _1201, _1403);
    float _1431 = fma(_1273, _1309, _1381);
    float _1433 = fma(_1275, _1195, _1411);
    bool _1435 = _1407 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1437 = _1415;
    float _1439 = _1385;
    float _1441 = _1387;
    float _1443 = _1365;
    float _1445 = _1367;
    if (!_1435)
    {
        _1437 = _1385;
    }
    float _1447 = _1437;
    float _1449 = _1447;
    if (!_1435)
    {
        _1439 = _1427;
    }
    float _1451 = _1439;
    bool _1453 = !_1435;
    float _1455 = _1451;
    if (!_1453)
    {
        float _1457 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1459 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1461 = _1407 + _1459;
        float _1463 = rsqrt(_1395);
        float _1465 = _1461 * _1457;
        float _1467 = _1427 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1469 = _1465 * 0.15915493667125701904296875;
        float _1471 = _1469 * 6.283185482025146484375;
        float _1473 = sin(_1471);
        float _1475 = _1469 * 6.283185482025146484375;
        float _1477 = cos(_1475);
        float _1479 = fma(_1473, _1467, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1481 = _1463 * _1479;
        float _1483 = fma(_1375, _1481, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1485 = _1477 + (-1.0);
        float _1487 = fma(_1379, _1481, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1489 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1491 = _1483 + _1489;
        float _1493 = _1485 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1495 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1497 = _1487 + _1495;
        float _1499 = _1491 * _1491;
        float _1501 = fma(_1427, _1477, _1493);
        float _1503 = _1497 * _1497;
        _1455 = _1501;
        _1449 = _1499;
        _1441 = _1503;
        _1443 = _1483;
        _1445 = _1487;
    }
    float _1505 = _1455;
    float _1507 = _1449;
    float _1509 = _1441;
    float _1511 = _1443;
    float _1513 = _1445;
    float _1515 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1517 = _1505 + _1515;
    float _1519 = fma(_1295, _1201, _1417);
    float _1521 = fma(_1269, _1201, _1421);
    float _1523 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1525 = fma(_1517, _1517, _1507);
    float _1527 = fma(_1295, _1193, _1413);
    float _1529 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1531 = _1523 * _1425;
    float _1533 = _1525 + _1509;
    float _1535 = fma(_1295, _1195, _1431);
    float _1537 = fma(_1269, _1193, _1419);
    float _1539 = _1523 * _1429;
    float _1541 = _1523 * _1433;
    float _1543 = fma(_1269, _1195, _1423);
    float _1545 = fma(_1529, _1527, _1531);
    float _1547 = sqrt(_1533);
    float _1549 = fma(_1529, _1519, _1539);
    float _1551 = fma(_1529, _1535, _1541);
    float _1553 = _1537 + _1545;
    float _1555 = _1521 + _1549;
    float _1557 = _1543 + _1551;
    out.m_76.x = _1553;
    out.m_76.y = _1555;
    out.m_76.z = _1557;
    bool _1559 = _1547 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1561 = isnan(_1547);
    bool _1563 = _1559 || _1561;
    bool _1565 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1567 = _1563 || _1565;
    float _1569 = _1531;
    if (!_1567)
    {
        _1569 = 1.0;
    }
    float _1571 = _1569;
    bool _1573 = !_1567;
    float _1575 = _1571;
    if (!_1573)
    {
        bool _1577 = _1547 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1579 = isnan(_1547);
        bool _1581 = _1577 || _1579;
        bool _1583 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1585 = _1581 || _1583;
        if (!_1585)
        {
            float _1587 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1589 = _1547 + _1587;
            float _1591 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1593 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1591;
            float _1595 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1597 = _1595 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1599 = 1.0 / _1593;
            float _1601 = _1589 * _1599;
            float _1603 = fma(_1601, _1597, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1575 = _1603;
            _1605 = true;
        }
        else
        {
            bool _1607 = _1547 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1609 = isnan(_1547);
            bool _1611 = _1607 || _1609;
            bool _1613 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1615 = _1611 || _1613;
            if (!_1615)
            {
                float _1617 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1619 = _1547 + _1617;
                float _1621 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1623 = _1621 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1625 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1627 = _1625 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1629 = 1.0 / _1623;
                float _1631 = _1619 * _1629;
                float _1633 = fma(_1631, _1627, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1575 = _1633;
                _1605 = true;
            }
            else
            {
                _1575 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1605 = false;
    float _1635 = _1575;
    float _1637 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1639 = _1505 + _1637;
    float _1641 = _989 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1643 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1645 = _1511 + _1643;
    float _1647 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1649 = _1513 + _1647;
    float _1651 = fma(_1639, _1635, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1653 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1641);
    float _1655 = fma(_1645, _1635, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1657 = fma(_1649, _1635, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1659 = -_657;
    float _1661 = _1659 + _1651;
    float _1663 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1653);
    float _1665 = -_829;
    float _1667 = _1665 + _1655;
    float _1669 = -_849;
    float _1671 = _1669 + _1657;
    float _1673 = _1661 * _1661;
    float _1675 = _1663 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1677 = _989 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1679 = fma(_1667, _1667, _1673);
    float _1681 = 1.0 / _1675;
    float _1683 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1677);
    float _1685 = fma(_1671, _1671, _1679);
    float _1687 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1683);
    float _1689 = sqrt(_1685);
    float _1691 = _1687 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1693 = _1691 + _1675;
    float _1695 = _1693 * _1681;
    float _1697 = _1695 * 0.5;
    bool _1699 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1701 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1703 = _1699 || _1701;
    bool _1705 = isnan(0.5);
    bool _1707 = _1703 || _1705;
    bool _1709 = _1689 > 0.0;
    float _1711 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1713 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1711);
    bool _1715 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1717 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1719 = _1715 || _1717;
    bool _1721 = isnan(0.5);
    bool _1723 = _1719 || _1721;
    float _1725 = 1.0 / _1713;
    float _1727 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1729 = _1681;
    float _1731 = _1651;
    float _1733 = _1657;
    if (!_1709)
    {
        _1727 = _1655;
    }
    float _1735 = _1727;
    float _1737 = _1735;
    if (!_1709)
    {
        _1729 = _1657;
    }
    float _1739 = _1729;
    bool _1741 = !_1709;
    float _1743 = _1739;
    float _1745 = _1739;
    if (!_1741)
    {
        float _1747 = _205 * _205;
        float _1749 = fma(_203, _203, _1747);
        float _1751 = fma(_207, _207, _1749);
        float _1753 = rsqrt(_1685);
        float _1755 = sqrt(_1751);
        float _1757 = _1667 * _1753;
        float _1759 = _1661 * _1753;
        float _1761 = _1671 * _1753;
        bool _1763 = _1755 > 0.0;
        float _1765 = _1755;
        if (!_1763)
        {
            _1765 = _1655;
        }
        float _1767 = _1765;
        _1737 = _1767;
        if (!_1763)
        {
            _1743 = _1657;
        }
        float _1769 = _1743;
        bool _1771 = !_1763;
        _1745 = _1769;
        if (!_1771)
        {
            float _1773 = rsqrt(_1751);
            float _1775 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1777 = _205 * _1773;
            float _1779 = _203 * _1773;
            float _1781 = _207 * _1773;
            float _1783 = _1759 * _1777;
            float _1785 = fma(_1757, _1779, _1783);
            float _1787 = _1775 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1789 = fma(_1761, _1781, _1785);
            float _1791 = _1789 * _1787;
            float _1793 = fma(_203, _1791, _1655);
            float _1795 = fma(_205, _1791, _1651);
            float _1797 = fma(_207, _1791, _1657);
            _1737 = _1793;
            _1731 = _1795;
            _1745 = _1797;
        }
    }
    float _1799 = _1737;
    float _1801 = _1731;
    float _1803 = _1745;
    float _1805 = -_983;
    float _1807 = fma(_1805, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1799);
    float _1809 = -_985;
    float _1811 = fma(_1809, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1801);
    float _1813 = -_991;
    float _1815 = fma(_1813, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1803);
    float _1817 = _1811;
    float _1819 = _1807;
    float _1821 = _1815;
    float _1823 = _1803;
    if (_1723)
    {
        _1733 = 1.0;
    }
    float _1825 = _1733;
    float _1827 = _1825;
    if (!_1707)
    {
        float _1829 = _1001 * _1001;
        float _1831 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1833 = -_849;
        float _1835 = _1833 + _1803;
        float _1837 = -_657;
        float _1839 = _1837 + _1801;
        float _1841 = fma(_1009, _1009, _1829);
        float _1843 = -_829;
        float _1845 = _1843 + _1799;
        float _1847 = fma(_1017, _1017, _1841);
        float _1849 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1851 = sqrt(_1847);
        float _1853 = 1.0 / _1211;
        float _1855 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1857 = precise::min(_1851, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1859 = _1857 * _1831;
        float _1861 = _1859 * _1853;
        float _1863 = _1855 * _1861;
        float _1865 = _1835 * _1861;
        float _1867 = fma(_1839, _1863, _989);
        float _1869 = fma(_1845, _1863, _995);
        float _1871 = fma(_1855, _1865, _1005);
        _1817 = _1867;
        _1819 = _1869;
        _1821 = _1871;
        _1823 = _1865;
        _689 = _1863;
    }
    float _1873 = _1817;
    float _1875 = _1819;
    float _1877 = _1821;
    float _1879 = _1823;
    float _1881 = _689;
    float _1883 = _1881;
    float _1885 = _1879;
    if (_1723)
    {
        _1883 = 1.0;
    }
    float _1887 = _1883;
    float _1889 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1891 = _1725 * _1889;
    float _1893 = _1887;
    if (!_1723)
    {
        float _1895 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1897 = _1895 * 0.15915493667125701904296875;
        float _1899 = _1897 * 6.283185482025146484375;
        float _1901 = cos(_1899);
        float _1903 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1905 = _1903 * 0.15915493667125701904296875;
        float _1907 = _1897 * 6.283185482025146484375;
        float _1909 = sin(_1907);
        float _1911 = 1.0 / _1901;
        float _1913 = _1905 * 6.283185482025146484375;
        float _1915 = cos(_1913);
        float _1917 = _1909 * _1911;
        float _1919 = _1905 * 6.283185482025146484375;
        float _1921 = sin(_1919);
        float _1923 = _1915 * _1917;
        float _1925 = 1.0 / _1923;
        float _1927 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1929 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1927;
        float _1931 = 1.0 / _1929;
        float _1933 = _1921 * _1925;
        float _1935 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1937 = fma(_1891, _1933, _1935);
        float _1939 = _1937 * _1931;
        float _1941 = precise::clamp(_1939, 0.0, 1.0);
        _211 = _1931;
        _213 = _1905;
        _1827 = _1941;
    }
    float _1943 = _211;
    float _1945 = _213;
    float _1947 = _1827;
    float _1949 = _1943;
    if (!_1723)
    {
        float _1951 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1953 = _1951 * 0.15915493667125701904296875;
        float _1955 = _1953 * 6.283185482025146484375;
        float _1957 = cos(_1955);
        float _1959 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1961 = _1959 * 0.15915493667125701904296875;
        float _1963 = _1953 * 6.283185482025146484375;
        float _1965 = sin(_1963);
        float _1967 = 1.0 / _1957;
        float _1969 = _1961 * 6.283185482025146484375;
        float _1971 = cos(_1969);
        float _1973 = _1965 * _1967;
        float _1975 = _1961 * 6.283185482025146484375;
        float _1977 = sin(_1975);
        float _1979 = _1971 * _1973;
        float _1981 = 1.0 / _1979;
        float _1983 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1985 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1983;
        float _1987 = 1.0 / _1985;
        float _1989 = _1977 * _1981;
        float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1993 = fma(_1891, _1989, _1991);
        float _1995 = _1993 * _1987;
        float _1997 = precise::clamp(_1995, 0.0, 1.0);
        float _1999 = -_1997;
        float _2001 = _1999 + 1.0;
        _1949 = _1957;
        _1893 = _2001;
    }
    float _2003 = _1949;
    float _2005 = _1893;
    float _2007 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2009 = _1873 + _2007;
    float _2011 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2013 = _1875 + _2011;
    float _2015 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2017 = _1877 + _2015;
    float _2019 = _2009 * _2009;
    float _2021 = fma(_2013, _2013, _2019);
    float _2023 = fma(_2017, _2017, _2021);
    float _2025 = rsqrt(_2023);
    float _2027 = _2025 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2029 = _2013 * _2027;
    float _2031 = _2017 * _2027;
    float _2033 = _2029 * _2029;
    float _2035 = _2031 * _2031;
    float _2037 = _2033 + _2035;
    float _2039 = sqrt(_2037);
    bool _2041 = _2039 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2043 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2045 = _2039 + _2043;
    float _2047 = _2003;
    float _2049 = _2037;
    float _2051 = _2045;
    float _2053 = _2009;
    float _2055 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _2057 = _2029;
    if (_2041)
    {
        float _2059 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2047 = _2059;
    }
    float _2061 = _2047;
    if (_2041)
    {
        float _2063 = rsqrt(_2037);
        _2049 = _2063;
    }
    float _2065 = _2049;
    float _2067 = _2061;
    float _2069 = _2065;
    if (_2041)
    {
        float _2071 = _2045 * _2061;
        _2051 = _2071;
    }
    float _2073 = _2051;
    if (_2041)
    {
        float _2075 = _2073 * 0.15915493667125701904296875;
        _2067 = _2075;
    }
    float _2077 = _2067;
    float _2079 = _2017;
    float _2081 = _2077;
    if (_2041)
    {
        float _2083 = _2077 * 6.283185482025146484375;
        float _2085 = sin(_2083);
        _2079 = _2085;
    }
    float _2087 = _2079;
    float _2089 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2091 = precise::max(0.0, _2089);
    float _2093 = _1945;
    if (_2041)
    {
        float _2095 = _2077 * 6.283185482025146484375;
        float _2097 = cos(_2095);
        _2093 = _2097;
    }
    float _2099 = _2093;
    float _2101 = -_2027;
    float _2103 = -_2091;
    float _2105 = fma(_2009, _2101, _2103);
    float _2107 = fma(_995, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_2041)
    {
        float _2109 = _2105 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2053 = _2109;
    }
    float _2111 = _2053;
    float _2113 = sqrt(_2023);
    float _2115 = _2111;
    if (!_2041)
    {
        _2081 = _2105;
    }
    float _2117 = _2081;
    float _2119 = _2087;
    float _2121 = _2117;
    if (_2041)
    {
        float _2123 = fma(_2087, _2111, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2119 = _2123;
    }
    float _2125 = _2119;
    float _2127 = _2125;
    float _2129 = _2099;
    if (_2041)
    {
        float _2131 = _2099 + (-1.0);
        _2115 = _2131;
    }
    float _2133 = _2115;
    if (_2041)
    {
        float _2135 = _2065 * _2125;
        _2055 = _2135;
    }
    float _2137 = _2055;
    if (!_2041)
    {
        _2069 = _2031;
    }
    float _2139 = _2069;
    float _2141 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2143 = _2139;
    if (_2041)
    {
        float _2145 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1885 = _2145;
    }
    float _2147 = _1885;
    if (_2041)
    {
        float _2149 = _2029 * _2137;
        _2057 = _2149;
    }
    float _2151 = _2057;
    if (!_2041)
    {
        _2127 = _2033;
    }
    float _2153 = _2127;
    float _2155 = _2153;
    if (_2041)
    {
        float _2157 = _2031 * _2137;
        _2143 = _2157;
    }
    float _2159 = _2143;
    if (_2041)
    {
        float _2161 = fma(_2105, _2099, _2147);
        _2121 = _2161;
    }
    float _2163 = _2121;
    if (_2041)
    {
        float _2165 = _2151 * _2151;
        _2155 = _2165;
    }
    float _2167 = _2155;
    if (!_2041)
    {
        _2129 = _2035;
    }
    float _2169 = _2129;
    float _2171 = _2169;
    if (_2041)
    {
        float _2173 = _2159 * _2159;
        _2171 = _2173;
    }
    float _2175 = _2171;
    float _2177 = fma(_2163, _2163, _2167);
    float _2179 = floor(_2107);
    float _2181 = _2177 + _2175;
    float _2183 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2141);
    float _2185 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2187 = fma(_2113, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2185);
    float _2189 = precise::clamp(_2187, 0.0, 1.0);
    float _2191 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2193 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2183);
    float _2195 = -_2189;
    float _2197 = _2195 + 1.0;
    float _2199 = rsqrt(_2181);
    float _2201 = _2193 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2203 = fma(_1005, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2205 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2207 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2209 = abs(_2197);
    float _2211 = log2(_2209);
    float _2213 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2215 = -_2207;
    float _2217 = fma(_2215, _2191, 1.0);
    float _2219 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2221 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2213);
    float _2223 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2219);
    float _2225 = _2199 * _2151;
    float _2227 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2221);
    float _2229 = _2199 * _2163;
    float _2231 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2223);
    float _2233 = _2199 * _2159;
    float _2235 = _2227 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2237 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2239 = _2231 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2241 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2205);
    float _2243 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2245 = -_2237;
    float _2247 = fma(_2229, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2245);
    float _2249 = log2(_2217);
    float _2251 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2241);
    float _2253 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2243);
    float _2255 = -_2233;
    float _2257 = fma(_2255, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2247);
    float _2259 = _2211 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2261 = -_2179;
    float _2263 = _2107 + _2261;
    float _2265 = fma(_2201, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2253);
    float _2267 = fma(_2257, -0.5, 0.5);
    float _2269 = floor(_2203);
    float _2271 = _2251 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2273 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2275 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2277 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2265);
    float _2279 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2273);
    float _2281 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2275);
    float _2283 = exp2(_2259);
    float _2285 = fma(_2257, 0.5, 0.5);
    float _2287 = fma(_2201, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2279);
    float _2289 = fma(_2201, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2281);
    float _2291 = _2249 * 0.693147182464599609375;
    float _2293 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2287);
    float _2295 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2289);
    float _2297 = 1.0 / _2277;
    float _2299 = -_2269;
    float _2301 = _2203 + _2299;
    float _2303 = fma(_2285, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2305 = _2229 + 1.0;
    float _2307 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2309 = fma(_2285, _2303, -0.212114393711090087890625);
    float _2311 = sqrt(_2267);
    float2 _6442 = float2(_2263, _2301);
    float _2313 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6442, float2(0.0), isnan(_6442)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6442, float2(0.0), isnan(_6442)), level(0.0)).x;
    float _2315 = -_2229;
    float _2317 = fma(_2283, _2305, _2315);
    float _2319 = fma(_2285, _2309, 1.570728778839111328125);
    float _2321 = fma(_2317, 0.5, 0.5);
    float _2323 = _2293 * _2297;
    float _2325 = _2295 * _2297;
    float _2327 = fma(_2323, 0.5, 0.5);
    float _2329 = fma(_2325, -0.5, 0.5);
    float _2331 = _2311 * 0.636619746685028076171875;
    float3 _6478 = float3(_2327, _2329, _2307);
    float _2333 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6478, float3(0.0), isnan(_6478)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6478, float3(0.0), isnan(_6478)), level(0.0)).x;
    float3 _6489 = float3(_2327, _2329, _2307);
    float4 _2336 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6489, float3(0.0), isnan(_6489)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6489, float3(0.0), isnan(_6489)), level(0.0)).xyzw;
    float _2338 = _2336.x;
    float _2340 = _2336.y;
    float _2342 = _2336.z;
    float _2344 = _2336.w;
    float _2346 = -_2319;
    float _2348 = fma(_2331, _2346, 1.0);
    float2 _6510 = float2(_2348, _2321);
    float3 _2352 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6510, float2(0.0), isnan(_6510)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6510, float2(0.0), isnan(_6510)), level(0.0)).xyz;
    float _2354 = _2352.x;
    float _2356 = _2352.y;
    float _2358 = _2352.z;
    float _2360 = abs(_1891);
    float _2362 = log2(_2360);
    float _2364 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2366 = in.m_78.x;
    float _2368 = _2277 * 0.5;
    float _2370 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2364);
    bool _2372 = _1891 <= 8000.0;
    bool _2374 = isnan(_1891);
    bool _2376 = _2372 || _2374;
    bool _2378 = isnan(8000.0);
    bool _2380 = _2376 || _2378;
    float _2382 = float(_2380);
    float _2384 = fma(_2201, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2370);
    float _2386 = _2293 + _2277;
    bool _2388 = _2113 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2390 = isnan(_2113);
    bool _2392 = _2388 || _2390;
    bool _2394 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2396 = _2392 || _2394;
    float _2398 = _2386 * 0.5;
    float _2400 = _2362 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2402 = exp2(_2400);
    float _2404 = fma(_2402, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2406 = precise::clamp(_2404, 0.0, 1.0);
    float _2408 = _2211 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2410 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2384);
    float _2412 = fma(_2406, -2.0, 3.0);
    float _2414 = _2406 * _2406;
    float _2416 = _2410 + _2277;
    float _2418 = exp2(_2408);
    out.gl_Position.x = _2293;
    out.gl_Position.y = _2295;
    out.gl_Position.z = _2410;
    out.gl_Position.w = _2277;
    float _2420 = _2414 * _2412;
    float _2422 = _2416 * 0.5;
    float _2424 = -_2420;
    float _2426 = _2424 + 1.0;
    float _2428 = fma(_2426, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2420);
    float _2430 = fma(_2295, -0.5, _2368);
    float _2432 = _2382 * _2428;
    float _2434 = -_2418;
    float _2436 = _2434 + 1.0;
    out.m_80.x = _2398;
    out.m_80.y = _2430;
    out.m_80.z = _2422;
    out.m_80.w = _2277;
    float _2438 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2440 = _1947 * _2005;
    float _2442 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2444 = _2277;
    float _2446 = _2410;
    float _2448 = _2295;
    float _2450 = _2440;
    if (!_2396)
    {
        _2444 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2452 = _2444;
    float _2454 = _2452;
    float _2456 = _2452;
    if (!_2396)
    {
        _2446 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2458 = _2446;
    float _2460 = _2458;
    float _2462 = _2458;
    if (!_2396)
    {
        _2448 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2464 = _2448;
    float _2466 = -_2313;
    float _2468 = _2466 + 1.0;
    float _2470 = _2468 * _2438;
    float _2472 = precise::clamp(_2470, 0.0, 1.0);
    float _2474 = -_2472;
    float _2476 = fma(_2474, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2478 = _2476 * _2366;
    float _2480 = _2442 * _2333;
    float _2482 = -_2442;
    float _2484 = _2482 + 1.0;
    float _2486 = _2344 * _2480;
    float _2488 = _2358 * _2480;
    float _2490 = fma(_2356, _2486, _2340);
    float _2492 = fma(_2354, _2486, _2338);
    float _2494 = _2478 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2496 = _2344 * _2484;
    float _2498 = fma(_2344, _2488, _2342);
    float _2500 = _2440 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2502 = _2478;
    float _2504 = _2338;
    float _2506 = _2464;
    float _2508 = _2464;
    if (!_2396)
    {
        _2502 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2510 = _2502;
    out.m_82.x = _2494;
    float _2512 = _2510;
    float _2514 = _2510;
    if (!_2396)
    {
        _2504 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2516 = _2504;
    float _2518 = _2516;
    float _2520 = _2516;
    if (!_2396)
    {
        _2450 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2522 = _2450;
    out.m_84.x = _2492;
    out.m_84.y = _2490;
    out.m_84.z = _2498;
    out.m_84.w = _2496;
    bool _2524 = !_2396;
    float _2526 = _2522;
    float _2528 = _2522;
    if (!_2524)
    {
        bool _2530 = _2113 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2532 = isnan(_2113);
        bool _2534 = _2530 || _2532;
        bool _2536 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2538 = _2534 || _2536;
        if (!_2538)
        {
            float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2542 = _2113 + _2540;
            float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2546 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2544;
            float _2548 = 1.0 / _2546;
            float _2550 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2552 = _2550 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2554 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2556 = _2554 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2558 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2560 = _2558 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2562 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2564 = _2562 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2568 = _2566 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2570 = _2542 * _2548;
            float _2572 = precise::clamp(_2570, 0.0, 1.0);
            float _2574 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2576 = _2574 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2578 = fma(_2572, _2552, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2580 = fma(_2572, _2576, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2582 = fma(_2572, _2556, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2584 = fma(_2572, _2560, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2586 = fma(_2572, _2564, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2588 = fma(_2572, _2568, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2520 = _2580;
            _2508 = _2586;
            _2514 = _2578;
            _2462 = _2584;
            _2456 = _2582;
            _2528 = _2588;
            _2590 = true;
        }
        else
        {
            bool _2592 = _2113 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2594 = isnan(_2113);
            bool _2596 = _2592 || _2594;
            bool _2598 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2600 = _2596 || _2598;
            if (!_2600)
            {
                _2512 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2602 = _2512;
            _2514 = _2602;
            if (!_2600)
            {
                _2518 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2604 = _2518;
            _2520 = _2604;
            if (!_2600)
            {
                _2454 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2606 = _2454;
            _2456 = _2606;
            if (!_2600)
            {
                _2460 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2608 = _2460;
            _2462 = _2608;
            if (!_2600)
            {
                _2506 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2610 = _2506;
            _2508 = _2610;
            if (!_2600)
            {
                _2526 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2612 = _2526;
            bool _2614 = !_2600;
            _2528 = _2612;
            if (!_2614)
            {
                bool _2616 = _2113 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2618 = isnan(_2113);
                bool _2620 = _2616 || _2618;
                bool _2622 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2624 = _2620 || _2622;
                if (!_2624)
                {
                    float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2628 = _2113 + _2626;
                    float _2630 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2632 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2630;
                    float _2634 = 1.0 / _2632;
                    float _2636 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2638 = _2636 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2640 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2642 = _2640 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2644 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2646 = _2644 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2648 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2650 = _2648 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2652 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2654 = _2652 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2656 = _2628 * _2634;
                    float _2658 = precise::clamp(_2656, 0.0, 1.0);
                    float _2660 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2662 = _2660 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2664 = fma(_2658, _2638, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2666 = fma(_2658, _2662, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2668 = fma(_2658, _2642, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2670 = fma(_2658, _2646, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2672 = fma(_2658, _2650, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2674 = fma(_2658, _2654, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2520 = _2666;
                    _2508 = _2672;
                    _2514 = _2664;
                    _2462 = _2670;
                    _2456 = _2668;
                    _2528 = _2674;
                    _2590 = true;
                }
                else
                {
                    _2520 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2508 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2514 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2462 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2456 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2528 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2590 = false;
    float _2676 = _2520;
    float _2678 = _2508;
    float _2680 = _2514;
    float _2682 = _2462;
    float _2684 = _2456;
    float _2686 = _2528;
    float _2688 = fma(_1555, -0.5, 0.5);
    float _2690 = precise::clamp(_2688, 0.0, 1.0);
    float _2692 = -_2676;
    float _2694 = _2692 + _2678;
    float _2696 = -_2680;
    float _2698 = _2696 + _2682;
    out.m_86.x = 0.0;
    float _2700 = -_2684;
    float _2702 = _2700 + _2686;
    float _2704 = fma(_2690, _2694, _2676);
    float _2706 = fma(_2690, _2698, _2680);
    bool _2708 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2710 = _2704 * 0.586610972881317138671875;
    float _2712 = fma(_2690, _2702, _2684);
    float _2714 = _2500 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2716 = fma(_2706, 0.298911988735198974609375, _2710);
    bool _2718 = _1947 > 0.0;
    bool _2720 = isnan(_1947);
    bool _2722 = _2718 || _2720;
    bool _2724 = isnan(0.0);
    bool _2726 = _2722 || _2724;
    float _2728 = fma(_2712, 0.114477999508380889892578125, _2716);
    out.m_51.x = _2714;
    bool _2730 = _2005 <= 0.0;
    bool _2732 = !_2726;
    bool _2734 = _2730 || _2732;
    float _2736 = -_2728;
    float _2738 = _2706 + _2736;
    float _2740 = -_2728;
    float _2742 = _2704 + _2740;
    float _2744 = -_2728;
    float _2746 = _2712 + _2744;
    float _2748 = fma(_2738, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2728);
    float _2750 = fma(_2742, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2728);
    float _2752 = fma(_2746, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2728);
    bool _2754 = !_2708;
    if (!_2754)
    {
        float _2756 = -_1873;
        float _2758 = _2756 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2760 = -_1875;
        float _2762 = _2760 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2764 = -_1877;
        float _2766 = _2764 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2768 = _2758 * _2758;
        float _2770 = fma(_2762, _2762, _2768);
        float _2772 = fma(_2766, _2766, _2770);
        float _2774 = sqrt(_2772);
        float _2776 = rsqrt(_2772);
        float _2778 = -_2774;
        float _2780 = _2778 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2782 = _2780 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2784 = precise::clamp(_2782, 0.0, 1.0);
        float _2786 = _2762 * _2776;
        float _2788 = _2758 * _2776;
        float _2790 = abs(_2784);
        float _2792 = log2(_2790);
        float _2794 = _2766 * _2776;
        float _2796 = _2786 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2798 = _1555 * _2788;
        float _2800 = -_2788;
        float _2802 = -_2796;
        float _2804 = fma(_2800, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2802);
        float _2806 = fma(_1553, _2786, _2798);
        float _2808 = -_2794;
        float _2810 = fma(_2808, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2804);
        float _2812 = fma(_1557, _2794, _2806);
        float _2814 = precise::clamp(_2812, 0.0, 1.0);
        float _2816 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2818 = _2810 + _2816;
        float _2820 = _2792 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2822 = _2818 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2824 = precise::clamp(_2822, 0.0, 1.0);
        float _2826 = exp2(_2820);
        float _2828 = _2826 * _2824;
        float _2830 = _2814 * _2828;
        float _2832 = _2830 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2834 = _2830 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2836 = _2830 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _2832;
        out.m_86.y = _2834;
        out.m_86.z = _2836;
    }
    out.m_88.x = _2748;
    out.m_88.y = _2750;
    out.m_88.z = _2752;
    if (!_2734)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2838 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2838;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

