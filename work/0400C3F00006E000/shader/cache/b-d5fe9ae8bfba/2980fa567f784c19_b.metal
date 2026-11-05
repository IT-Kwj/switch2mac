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
    float4 m_74 [[user(locn5)]];
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
    float4 m_72 [[attribute(1)]];
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2584 = false;
    bool _1611 = false;
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
        float _2888 = as_type<float>(_121);
        out.gl_Position.z = _2888;
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
        float _2961 = as_type<float>(_163);
        out.gl_Position.z = _2961;
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
    float _211 = _203;
    float _213 = _207;
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
    bool _333 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _335 = isnan(_331);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _349 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _351 = isnan(_331);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _367 = _331 + _365;
    float _369 = -_343;
    float _371 = _369 + 1.0;
    bool _373 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _375 = 1.0 / _347;
    float _377 = _359 * _371;
    float _379 = -_359;
    float _381 = _379 + 1.0;
    float _383 = _363 * _375;
    float _385 = fma(_383, _367, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _387 = _385 * _377;
    float _389 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[115].x, _387);
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _397 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[116].x, _389);
    float _399 = _391 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _401 = _393 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _403 = _395 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _405 = _397 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _407 = in.m_64.x;
    float _409 = in.m_64.y;
    out.m_66.x = _399;
    out.m_66.y = _401;
    out.m_66.z = _403;
    out.m_66.w = _405;
    float _411 = _307 * _409;
    float _413 = _305 * _407;
    bool _415 = !_373;
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
    float _443 = _413 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _445 = _411 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _447 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _451 = _449 != 0;
    float _453 = _201 * _445;
    float _455 = in.m_48.x;
    float _457 = in.m_48.y;
    float _459 = in.m_48.z;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _463 = _191 * _443;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _469 = _433 + _467;
    int _471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _473 = _471 != 0;
    float _475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _479 = _477 != 0;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _483 = _481 != 0;
    float _485 = _435 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _487 = _441 > 0.5;
    float _489 = _437 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _491 = -_461;
    float _493 = fma(_485, 2.0, _491);
    float _495 = _439 * 2.0;
    float _497 = fma(_489, -2.0, _465);
    bool _499 = _437 > 0.5;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _505 = _457 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _507 = _457 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _509 = _457 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _511 = 1.0 / _503;
    bool _513 = _435 > 0.5;
    float _515 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[5].x, _507);
    float _517 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[6].x, _509);
    float _519 = -_453;
    int _521 = _499 ? as_type<int>(_519) : as_type<int>(_453);
    float _523 = -_133;
    float _525 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[76].x, _493);
    float _527 = -_463;
    int _529 = _513 ? as_type<int>(_527) : as_type<int>(_463);
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _533 = floor(_495);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _535;
    float _539 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[4].x, _505);
    float _541 = _437 + _439;
    bool _543 = !_473;
    float _545 = _543 ? _453 : as_type<float>(_521);
    float _547 = _435 * 2.0;
    bool _549 = !_479;
    float _551 = _549 ? _463 : as_type<float>(_529);
    float _553 = _537 * _511;
    float _555 = _541 + (-1.0);
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _559 = _557 != 0;
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _563 = _561 != 0;
    float _565 = fma(_553, _469, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _567 = _439 > 0.5;
    float _569 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _571 = _437 + _435;
    float _573 = -_191;
    int _575 = _499 ? as_type<int>(_573) : as_type<int>(_191);
    float _577 = _447 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _579 = -_201;
    int _581 = _567 ? as_type<int>(_579) : as_type<int>(_201);
    float _583 = _571 + (-1.0);
    bool _585 = !_559;
    float _587 = _585 ? _191 : as_type<float>(_575);
    float _589 = _551 + 0.5;
    bool _591 = !_563;
    float _593 = _591 ? _201 : as_type<float>(_581);
    float _595 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _597 = _533 > 0.0;
    float _599 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[4].z, _539);
    bool _601 = _533 >= 0.0;
    bool _603 = isnan(_533);
    bool _605 = _601 || _603;
    bool _607 = isnan(0.0);
    bool _609 = _605 || _607;
    float _611 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[5].z, _515);
    float _613 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[6].z, _517);
    bool _615 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _617 = isnan(_433);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = floor(_547);
    bool _629 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _631 = isnan(_433);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = fma(_577, _589, _525);
    float _643 = -_625;
    float _645 = _643 + 1.0;
    float _647 = 0.0;
    float _649 = _507;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    float _653 = _463;
    float _655 = _453;
    if (!_451)
    {
        _647 = _437;
    }
    float _657 = _647;
    float _659 = _611 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _661 = _657;
    if (_451)
    {
        _661 = _435;
    }
    float _663 = _661;
    float _665 = _639 * _645;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _669 = _609 ? 0 : 1;
    float _671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _673 = _565 * _665;
    float _675 = _475 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_451)
    {
        _649 = _439;
    }
    float _677 = _649;
    float _679 = -_639;
    float _681 = _679 + 1.0;
    float _683 = _677;
    if (!_451)
    {
        _651 = _439;
    }
    float _685 = _651;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _689 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _497);
    float _691 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[83].z, _667);
    float _693 = _545 + (-0.5);
    int _695 = ~_669;
    int _697 = _695 + 1;
    int _699 = _697 + 1;
    float _701 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[131].x, _673);
    float _703 = _685;
    int _705 = _699;
    if (_451)
    {
        _683 = _437;
    }
    float _707 = _683;
    float _709 = -_675;
    float _711 = -_689;
    float _713 = fma(_709, _693, _711);
    if (_451)
    {
        _703 = _437;
    }
    float _715 = _703;
    float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    if (!_597)
    {
        int _719 = ~_669;
        int _721 = _719 + 1;
        _705 = _721;
    }
    int _723 = _705;
    float _725 = _707 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _727 = _627 > 0.0;
    float _729 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[83].w, _531);
    bool _731 = _627 >= 0.0;
    bool _733 = isnan(_627);
    bool _735 = _731 || _733;
    bool _737 = isnan(0.0);
    bool _739 = _735 || _737;
    float _741 = _587 + 0.5;
    float _743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _745 = _723;
    if (_483)
    {
        float _747 = -_463;
        float _749 = _567 ? _747 : _463;
        _653 = _749;
    }
    float _751 = _653;
    float _753 = -_593;
    float _755 = _753 + 0.5;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _759 = _757 != 0;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _763 = _761 != 0;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _767 = _765 != 0;
    float _769 = _741 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _773 = _771 != 0;
    float _775 = _755 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _777 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _779 = _769 * _671;
    float _781 = _775 * _717;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _785 = _663 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _787 = _599 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _789 = _751 + 0.5;
    float _791 = fma(_725, -2.0, _783);
    float _793 = _743 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _795 = _787;
    if (_773)
    {
        float _797 = -_453;
        float _799 = _487 ? _797 : _453;
        _655 = _799;
    }
    float _801 = _655;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _805 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _791);
    float _807 = -_687;
    float _809 = fma(_785, 2.0, _807);
    float _811 = _801 + (-0.5);
    float _813 = _777 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _815 = _613 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _819 = -_793;
    float _821 = -_805;
    float _823 = fma(_819, _811, _821);
    float _825 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[78].w, _803);
    float _827 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _829 = _659 + _827;
    float _831 = -_133;
    float _833 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[81].x, _809);
    float _835 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[78].z, _817);
    float _837 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _839 = _787 + _837;
    float _841 = _829 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _843 = fma(_813, _789, _833);
    float _845 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[132].x, _701);
    float _847 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _849 = _815 + _847;
    float _851 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[28].x, _841);
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _855 = _845 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _859 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[28].z, _851);
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _863 = _853 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _865 = _857 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _867 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _825);
    float _869 = _861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _871 = _859 >= 0.0;
    float _873 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _875 = log2(_873);
    float _877 = -_867;
    float _879 = _877 + 1.0;
    float _881 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _835);
    out.m_68.x = _863;
    out.m_68.y = _865;
    out.m_68.z = _869;
    out.m_68.w = _855;
    float _883 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _691);
    float _885 = fma(_545, _879, _713);
    float _887 = _829 * _829;
    float _889 = -_881;
    float _891 = _889 + 1.0;
    float _893 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _729);
    out.m_70.x = _779;
    out.m_70.y = _781;
    float _895 = fma(_839, _839, _887);
    float _897 = -_891;
    float _899 = fma(_551, _897, _641);
    float _901 = _869;
    if (_871)
    {
        out.m_51.x = 0.0;
    }
    float _903 = fma(_849, _849, _895);
    bool _905 = !_763;
    int _907 = _905 ? 0 : 1;
    float _909 = _875 * _133;
    bool _911 = !_759;
    int _913 = _911 ? 0 : 1;
    float _915 = _437 * 2.0;
    if (_871)
    {
        _901 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _917 = _901;
    float _919 = rsqrt(_903);
    int _921 = abs(_913);
    float _923 = -_883;
    float _925 = _923 + 1.0;
    float _927 = float(_723);
    if (_871)
    {
        float _929 = _917 * 5.0;
        _745 = as_type<int>(_929);
    }
    int _931 = _745;
    float _933 = float(_921);
    float _935 = -_893;
    float _937 = _935 + 1.0;
    bool _939 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _941 = isnan(1.0);
    bool _943 = _939 || _941;
    bool _945 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _947 = _943 || _945;
    float _949 = exp2(_909);
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _953 = 1.0 + _951;
    float _955 = _933 * _927;
    float _957 = -_925;
    float _959 = fma(_751, _957, _843);
    float _961 = in.m_72.x;
    float _963 = in.m_72.y;
    float _965 = in.m_72.z;
    float _967 = fma(_801, _937, _823);
    bool _969 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _971 = isnan(0.0);
    bool _973 = _969 || _971;
    bool _975 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _977 = _973 || _975;
    float _979 = 1.0 / _953;
    bool _981 = !_767;
    int _983 = _981 ? 0 : 1;
    out.m_74.x = _899;
    out.m_74.y = _885;
    out.m_74.z = _959;
    out.m_74.w = _967;
    float _985 = _839 * _919;
    if (_871)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4330 = as_type<float>(_931);
        out.gl_Position.z = _4330;
    }
    float _987 = floor(_915);
    float _989 = -_949;
    float _991 = _989 + 1.0;
    float _993 = _829 * _919;
    if (_871)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _995 = -_993;
    float _997 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[18].w, _659);
    float _999 = _849 * _919;
    float _1001 = -_985;
    float _1003 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[18].w, _787);
    int _1005 = _739 ? 0 : 1;
    float _1007 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1009 = _997 + _1007;
    float _1011 = -_999;
    float _1013 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[18].w, _815);
    float _1015 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1017 = _1003 + _1015;
    float _1019 = _955 * (-2.0);
    float _1021 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1023 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1025 = _1013 + _1023;
    int _1027 = ~_1005;
    int _1029 = _1027 + 1;
    int _1031 = _1029 + 1;
    float _1033 = -_993;
    float _1035 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[18].w, _829);
    float _1037 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1021);
    int _1039 = _1031;
    float _1041 = _1003;
    if (!_727)
    {
        int _1043 = ~_1005;
        int _1045 = _1043 + 1;
        _1039 = _1045;
    }
    int _1047 = _1039;
    float _1049 = -_985;
    float _1051 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[18].w, _839);
    float _1053 = _977 ? _991 : 0.0;
    float _1055 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1037);
    float _1057 = fma(_595, _1019, _595);
    int _1059 = abs(_907);
    float _1061 = fma(_1019, _961, _961);
    float _1063 = _435 + (-0.5);
    bool _1065 = _1055 >= 0.0;
    float _1067 = _1035 * _1035;
    float _1069 = float(_1047);
    float _1071 = _1057;
    if (_947)
    {
        float _1073 = _1053 * _979;
        _157 = _1073;
    }
    float _1075 = _157;
    float _1077 = float(_1059);
    float _1079 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1061);
    float _1081 = fma(_1051, _1051, _1067);
    float _1083 = -_999;
    float _1085 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[18].w, _849);
    bool _1087 = _987 > 0.0;
    float _1089 = _1077 * _1069;
    float _1091 = fma(_1057, _1075, _1079);
    float _1093 = fma(_1085, _1085, _1081);
    bool _1095 = _987 >= 0.0;
    bool _1097 = isnan(_987);
    bool _1099 = _1095 || _1097;
    bool _1101 = isnan(0.0);
    bool _1103 = _1099 || _1101;
    float _1105 = _1089 * (-2.0);
    float _1107 = _1091 * 0.15915493667125701904296875;
    if (_1065)
    {
        _1071 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1109 = _1071;
    float _1111 = fma(_569, _1105, _569);
    float _1113 = sqrt(_1093);
    int _1115 = _1103 ? 0 : 1;
    int _1117 = as_type<int>(_1109);
    if (_1065)
    {
        float _1119 = _1109 * 5.0;
        _1117 = as_type<int>(_1119);
    }
    int _1121 = _1117;
    if (_1065)
    {
        out.m_51.x = 0.0;
    }
    float _1123 = fma(_1105, _963, _963);
    int _1125 = ~_1115;
    int _1127 = _1125 + 1;
    int _1129 = _1127 + 1;
    float _1131 = _437 + (-0.5);
    int _1133 = _1129;
    if (_1065)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4563 = as_type<float>(_1121);
        out.gl_Position.z = _4563;
    }
    float _1135 = _1107 * 6.283185482025146484375;
    float _1137 = sin(_1135);
    if (!_1087)
    {
        int _1139 = ~_1115;
        int _1141 = _1139 + 1;
        _1133 = _1141;
    }
    int _1143 = _1133;
    int _1145 = abs(_983);
    if (_1065)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1147 = -_659;
    float _1149 = _1147 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1151 = -_787;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1155 = -_815;
    float _1157 = _1155 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1159 = _1149 * _1149;
    float _1161 = float(_1143);
    float _1163 = fma(_1131, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1123);
    float _1165 = float(_1145);
    float _1167 = fma(_1153, _1153, _1159);
    float _1169 = _439 + _435;
    float _1171 = fma(_1111, _1075, _1163);
    float _1173 = _439 + (-0.5);
    float _1175 = fma(_1157, _1157, _1167);
    float _1177 = _1165 * _1161;
    float _1179 = _1169 + (-1.0);
    float _1181 = _1171 * 0.15915493667125701904296875;
    float _1183 = _1177 * (-2.0);
    float _1185 = rsqrt(_1175);
    float _1187 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1189 = fma(_1183, _965, _965);
    float _1191 = fma(_1187, _1183, _1187);
    float _1193 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1189);
    float _1195 = _1107 * 6.283185482025146484375;
    float _1197 = cos(_1195);
    float _1199 = fma(_1191, _1075, _1193);
    float _1201 = _1199 * 0.15915493667125701904296875;
    float _1203 = _1153 * _1185;
    float _1205 = _1157 * _1185;
    float _1207 = _1149 * _1185;
    float _1209 = _1181 * 6.283185482025146484375;
    float _1211 = sin(_1209);
    float _1213 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1215 = _1203 * _1213;
    float _1217 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1219 = _1205 * _1217;
    float _1221 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1223 = _1207 * _1221;
    float _1225 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1227 = -_1215;
    float _1229 = fma(_1205, _1225, _1227);
    float _1231 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1233 = -_1219;
    float _1235 = fma(_1207, _1231, _1233);
    float _1237 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1239 = -_1223;
    float _1241 = fma(_1203, _1237, _1239);
    float _1243 = _1181 * 6.283185482025146484375;
    float _1245 = cos(_1243);
    float _1247 = _1229 * _1229;
    float _1249 = _919 * _1113;
    float _1251 = fma(_1235, _1235, _1247);
    float _1253 = _1249 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1255 = _1253 * 0.5;
    float _1257 = _1201 * 6.283185482025146484375;
    float _1259 = cos(_1257);
    float _1261 = fma(_1241, _1241, _1251);
    float _1263 = _1137 * _1211;
    float _1265 = _1197 * _1211;
    float _1267 = _1201 * 6.283185482025146484375;
    float _1269 = sin(_1267);
    float _1271 = _1197 * _1245;
    float _1273 = _1137 * _1245;
    float _1275 = rsqrt(_1261);
    float _1277 = _1197 * _1259;
    float _1279 = _1245 * _1259;
    float _1281 = _445 * _1249;
    float _1283 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _1285 = _1137 * _1259;
    float _1287 = fma(_1269, _1271, _1263);
    float _1289 = fma(_1269, _1263, _1271);
    float _1291 = _1211 * _1259;
    float _1293 = -_1265;
    float _1295 = fma(_1269, _1273, _1293);
    float _1297 = _443 * _1249;
    float _1299 = -_1273;
    float _1301 = fma(_1269, _1265, _1299);
    float _1303 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1305 = _1283 * _1281;
    float _1307 = _1235 * _1275;
    float _1309 = _1229 * _1275;
    float _1311 = _1303 * _1297;
    float _1313 = _1277 * _1305;
    float _1315 = -_1305;
    float _1317 = _1269 * _1315;
    float _1319 = _1285 * _1305;
    float _1321 = _1241 * _1275;
    float _1323 = fma(_1287, _1311, _1313);
    float _1325 = _1205 * _1309;
    float _1327 = _1207 * _1307;
    float _1329 = fma(_1279, _1311, _1317);
    float _1331 = fma(_1301, _1255, _1323);
    float _1333 = -_1325;
    float _1335 = fma(_1207, _1321, _1333);
    float _1337 = -_1327;
    float _1339 = fma(_1203, _1309, _1337);
    float _1341 = fma(_1295, _1311, _1319);
    float _1343 = fma(_1291, _1255, _1329);
    float _1345 = _1335 * _1331;
    float _1347 = _1339 * _1331;
    float _1349 = fma(_1289, _1255, _1341);
    float _1351 = _1203 * _1321;
    float _1353 = fma(_1307, _1343, _1345);
    float _1355 = fma(_1321, _1343, _1347);
    float _1357 = _1277 * _1335;
    float _1359 = -_1351;
    float _1361 = fma(_1205, _1307, _1359);
    float _1363 = fma(_1203, _1349, _1353);
    float _1365 = fma(_1205, _1349, _1355);
    float _1367 = _1277 * _1339;
    float _1369 = _1361 * _1331;
    float _1371 = _787 + _1363;
    float _1373 = _815 + _1365;
    float _1375 = _1277 * _1361;
    float _1377 = _1287 * _1361;
    float _1379 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1381 = _1371 + _1379;
    float _1383 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1385 = _1373 + _1383;
    float _1387 = _1301 * _1361;
    float _1389 = fma(_1309, _1343, _1369);
    float _1391 = _1381 * _1381;
    float _1393 = _1385 * _1385;
    float _1395 = _1287 * _1335;
    float _1397 = fma(_1207, _1349, _1389);
    float _1399 = _1287 * _1339;
    float _1401 = _1391 + _1393;
    float _1403 = _1301 * _1335;
    float _1405 = _1301 * _1339;
    float _1407 = -_1269;
    float _1409 = fma(_1407, _1307, _1357);
    float _1411 = sqrt(_1401);
    float _1413 = -_1269;
    float _1415 = fma(_1413, _1309, _1375);
    float _1417 = _659 + _1397;
    float _1419 = -_1269;
    float _1421 = fma(_1419, _1321, _1367);
    float _1423 = fma(_1279, _1309, _1377);
    float _1425 = fma(_1291, _1307, _1403);
    float _1427 = fma(_1291, _1309, _1387);
    float _1429 = fma(_1291, _1321, _1405);
    float _1431 = fma(_1279, _1307, _1395);
    float _1433 = fma(_1285, _1203, _1409);
    float _1435 = fma(_1285, _1207, _1415);
    float _1437 = fma(_1279, _1321, _1399);
    float _1439 = fma(_1285, _1205, _1421);
    bool _1441 = _1411 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1443 = _1307;
    float _1445 = _1391;
    float _1447 = _1393;
    float _1449 = _1371;
    float _1451 = _1373;
    if (!_1441)
    {
        _1443 = _1391;
    }
    float _1453 = _1443;
    float _1455 = _1453;
    if (!_1441)
    {
        _1445 = _1417;
    }
    float _1457 = _1445;
    bool _1459 = !_1441;
    float _1461 = _1457;
    if (!_1459)
    {
        float _1463 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1465 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1467 = _1411 + _1465;
        float _1469 = rsqrt(_1401);
        float _1471 = _1467 * _1463;
        float _1473 = _1417 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1475 = _1471 * 0.15915493667125701904296875;
        float _1477 = _1475 * 6.283185482025146484375;
        float _1479 = sin(_1477);
        float _1481 = _1475 * 6.283185482025146484375;
        float _1483 = cos(_1481);
        float _1485 = fma(_1479, _1473, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1487 = _1469 * _1485;
        float _1489 = fma(_1381, _1487, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1491 = _1483 + (-1.0);
        float _1493 = fma(_1385, _1487, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1495 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1497 = _1489 + _1495;
        float _1499 = _1491 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1501 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1503 = _1493 + _1501;
        float _1505 = _1497 * _1497;
        float _1507 = fma(_1417, _1483, _1499);
        float _1509 = _1503 * _1503;
        _1461 = _1507;
        _1455 = _1505;
        _1447 = _1509;
        _1449 = _1489;
        _1451 = _1493;
    }
    float _1511 = _1461;
    float _1513 = _1455;
    float _1515 = _1447;
    float _1517 = _1449;
    float _1519 = _1451;
    float _1521 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1523 = _1511 + _1521;
    float _1525 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1527 = fma(_1295, _1203, _1431);
    float _1529 = fma(_1289, _1203, _1425);
    float _1531 = fma(_1523, _1523, _1513);
    float _1533 = fma(_1289, _1207, _1427);
    float _1535 = fma(_1289, _1205, _1429);
    float _1537 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1539 = _1531 + _1515;
    float _1541 = _1525 * _1433;
    float _1543 = fma(_1295, _1207, _1423);
    float _1545 = fma(_1295, _1205, _1437);
    float _1547 = _1525 * _1435;
    float _1549 = _1525 * _1439;
    float _1551 = sqrt(_1539);
    float _1553 = fma(_1537, _1527, _1541);
    float _1555 = fma(_1537, _1543, _1547);
    float _1557 = fma(_1537, _1545, _1549);
    float _1559 = _1529 + _1553;
    float _1561 = _1533 + _1555;
    float _1563 = _1535 + _1557;
    out.m_76.x = _1559;
    out.m_76.y = _1561;
    out.m_76.z = _1563;
    bool _1565 = _1551 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1567 = isnan(_1551);
    bool _1569 = _1565 || _1567;
    bool _1571 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1573 = _1569 || _1571;
    float _1575 = _1547;
    if (!_1573)
    {
        _1575 = 1.0;
    }
    float _1577 = _1575;
    bool _1579 = !_1573;
    float _1581 = _1577;
    if (!_1579)
    {
        bool _1583 = _1551 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1585 = isnan(_1551);
        bool _1587 = _1583 || _1585;
        bool _1589 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1591 = _1587 || _1589;
        if (!_1591)
        {
            float _1593 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1595 = _1551 + _1593;
            float _1597 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1599 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1597;
            float _1601 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1603 = _1601 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1605 = 1.0 / _1599;
            float _1607 = _1595 * _1605;
            float _1609 = fma(_1607, _1603, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1581 = _1609;
            _1611 = true;
        }
        else
        {
            bool _1613 = _1551 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1615 = isnan(_1551);
            bool _1617 = _1613 || _1615;
            bool _1619 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1621 = _1617 || _1619;
            if (!_1621)
            {
                float _1623 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1625 = _1551 + _1623;
                float _1627 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1629 = _1627 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1631 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1633 = _1631 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1635 = 1.0 / _1629;
                float _1637 = _1625 * _1635;
                float _1639 = fma(_1637, _1633, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1581 = _1639;
                _1611 = true;
            }
            else
            {
                _1581 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1611 = false;
    float _1641 = _1581;
    float _1643 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1645 = _1511 + _1643;
    float _1647 = _997 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1649 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1651 = _1517 + _1649;
    float _1653 = fma(_1645, _1641, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1655 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1647);
    float _1657 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1659 = _1519 + _1657;
    float _1661 = fma(_1651, _1641, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1663 = -_659;
    float _1665 = _1663 + _1653;
    float _1667 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1655);
    float _1669 = fma(_1659, _1641, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1671 = -_787;
    float _1673 = _1671 + _1661;
    float _1675 = _1665 * _1665;
    float _1677 = _1667 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1679 = -_815;
    float _1681 = _1679 + _1669;
    float _1683 = _997 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1685 = fma(_1673, _1673, _1675);
    float _1687 = 1.0 / _1677;
    float _1689 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1683);
    float _1691 = fma(_1681, _1681, _1685);
    float _1693 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1689);
    float _1695 = sqrt(_1691);
    float _1697 = _1693 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1699 = _1697 + _1677;
    float _1701 = _1699 * _1687;
    float _1703 = _1701 * 0.5;
    bool _1705 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1707 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1709 = _1705 || _1707;
    bool _1711 = isnan(0.5);
    bool _1713 = _1709 || _1711;
    bool _1715 = _1695 > 0.0;
    float _1717 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1719 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1717);
    bool _1721 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1723 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1725 = _1721 || _1723;
    bool _1727 = isnan(0.5);
    bool _1729 = _1725 || _1727;
    float _1731 = 1.0 / _1719;
    float _1733 = _1687;
    float _1735 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1737 = _1653;
    float _1739 = _1691;
    float _1741 = _1661;
    if (!_1715)
    {
        _1733 = _1661;
    }
    float _1743 = _1733;
    float _1745 = _1743;
    float _1747 = _1743;
    if (!_1715)
    {
        _1735 = _1669;
    }
    float _1749 = _1735;
    bool _1751 = !_1715;
    float _1753 = _1749;
    if (!_1751)
    {
        float _1755 = _205 * _205;
        float _1757 = fma(_203, _203, _1755);
        float _1759 = rsqrt(_1691);
        float _1761 = fma(_207, _207, _1757);
        float _1763 = sqrt(_1761);
        float _1765 = _1673 * _1759;
        float _1767 = _1665 * _1759;
        float _1769 = _1681 * _1759;
        bool _1771 = _1763 > 0.0;
        float _1773 = _1763;
        if (!_1771)
        {
            _1745 = _1661;
        }
        float _1775 = _1745;
        _1747 = _1775;
        if (!_1771)
        {
            _1773 = _1669;
        }
        float _1777 = _1773;
        bool _1779 = !_1771;
        _1753 = _1777;
        if (!_1779)
        {
            float _1781 = rsqrt(_1761);
            float _1783 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1785 = _205 * _1781;
            float _1787 = _203 * _1781;
            float _1789 = _1767 * _1785;
            float _1791 = _207 * _1781;
            float _1793 = fma(_1765, _1787, _1789);
            float _1795 = _1783 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1797 = fma(_1769, _1791, _1793);
            float _1799 = _1797 * _1795;
            float _1801 = fma(_203, _1799, _1661);
            float _1803 = fma(_205, _1799, _1653);
            float _1805 = fma(_207, _1799, _1669);
            _1747 = _1801;
            _1737 = _1803;
            _1753 = _1805;
            _1739 = _1783;
        }
    }
    float _1807 = _1747;
    float _1809 = _1737;
    float _1811 = _1753;
    float _1813 = _1739;
    float _1815 = -_985;
    float _1817 = fma(_1815, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1807);
    float _1819 = -_993;
    float _1821 = fma(_1819, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1809);
    float _1823 = -_999;
    float _1825 = fma(_1823, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1811);
    float _1827 = _1821;
    float _1829 = _1817;
    float _1831 = _1825;
    float _1833 = _1813;
    if (_1713)
    {
        _1741 = 1.0;
    }
    float _1835 = _1741;
    float _1837 = _1835;
    if (!_1729)
    {
        float _1839 = _1009 * _1009;
        float _1841 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1843 = -_815;
        float _1845 = _1843 + _1811;
        float _1847 = -_659;
        float _1849 = _1847 + _1809;
        float _1851 = fma(_1017, _1017, _1839);
        float _1853 = fma(_1025, _1025, _1851);
        float _1855 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1857 = sqrt(_1853);
        float _1859 = _1841 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1861 = 1.0 / _1249;
        float _1863 = precise::min(_1857, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1865 = _1863 * _1855;
        float _1867 = _1865 * _1861;
        float _1869 = -_787;
        float _1871 = _1869 + _1807;
        float _1873 = _1859 * _1867;
        float _1875 = _1845 * _1867;
        float _1877 = fma(_1849, _1873, _997);
        float _1879 = fma(_1871, _1873, _1003);
        float _1881 = fma(_1859, _1875, _1013);
        _1827 = _1877;
        _1829 = _1879;
        _1831 = _1881;
    }
    float _1883 = _1827;
    float _1885 = _1829;
    float _1887 = _1831;
    if (_1713)
    {
        _795 = 1.0;
    }
    float _1889 = _795;
    float _1891 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1893 = _1731 * _1891;
    float _1895 = _1889;
    if (!_1713)
    {
        float _1897 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1899 = _1897 * 0.15915493667125701904296875;
        float _1901 = _1899 * 6.283185482025146484375;
        float _1903 = cos(_1901);
        float _1905 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1907 = _1905 * 0.15915493667125701904296875;
        float _1909 = _1899 * 6.283185482025146484375;
        float _1911 = sin(_1909);
        float _1913 = 1.0 / _1903;
        float _1915 = _1907 * 6.283185482025146484375;
        float _1917 = cos(_1915);
        float _1919 = _1911 * _1913;
        float _1921 = _1907 * 6.283185482025146484375;
        float _1923 = sin(_1921);
        float _1925 = _1917 * _1919;
        float _1927 = 1.0 / _1925;
        float _1929 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1931 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1929;
        float _1933 = 1.0 / _1931;
        float _1935 = _1923 * _1927;
        float _1937 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1939 = fma(_1893, _1935, _1937);
        float _1941 = _1939 * _1933;
        float _1943 = precise::clamp(_1941, 0.0, 1.0);
        _211 = _1907;
        _1837 = _1943;
    }
    float _1945 = _211;
    float _1947 = _1837;
    if (!_1713)
    {
        float _1949 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1951 = _1949 * 0.15915493667125701904296875;
        float _1953 = _1951 * 6.283185482025146484375;
        float _1955 = cos(_1953);
        float _1957 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1959 = _1957 * 0.15915493667125701904296875;
        float _1961 = _1951 * 6.283185482025146484375;
        float _1963 = sin(_1961);
        float _1965 = 1.0 / _1955;
        float _1967 = _1959 * 6.283185482025146484375;
        float _1969 = cos(_1967);
        float _1971 = _1963 * _1965;
        float _1973 = _1959 * 6.283185482025146484375;
        float _1975 = sin(_1973);
        float _1977 = _1969 * _1971;
        float _1979 = 1.0 / _1977;
        float _1981 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1983 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1981;
        float _1985 = 1.0 / _1983;
        float _1987 = _1975 * _1979;
        float _1989 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1991 = fma(_1893, _1987, _1989);
        float _1993 = _1991 * _1985;
        float _1995 = precise::clamp(_1993, 0.0, 1.0);
        float _1997 = -_1995;
        float _1999 = _1997 + 1.0;
        _213 = _1979;
        _1895 = _1999;
    }
    float _2001 = _213;
    float _2003 = _1895;
    float _2005 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2007 = _1883 + _2005;
    float _2009 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2011 = _1885 + _2009;
    float _2013 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2015 = _1887 + _2013;
    float _2017 = _2007 * _2007;
    float _2019 = fma(_2011, _2011, _2017);
    float _2021 = fma(_2015, _2015, _2019);
    float _2023 = rsqrt(_2021);
    float _2025 = sqrt(_2021);
    float _2027 = _2023 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2029 = _2011 * _2027;
    float _2031 = _2015 * _2027;
    float _2033 = _2029 * _2029;
    float _2035 = _2031 * _2031;
    float _2037 = _2033 + _2035;
    float _2039 = sqrt(_2037);
    bool _2041 = _2039 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2043 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2045 = _2039 + _2043;
    float _2047 = _1945;
    float _2049 = _2037;
    float _2051 = _2045;
    float _2053 = _2007;
    float _2055 = _2029;
    if (_2041)
    {
        float _2057 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2047 = _2057;
    }
    float _2059 = _2047;
    if (_2041)
    {
        float _2061 = rsqrt(_2037);
        _2049 = _2061;
    }
    float _2063 = _2049;
    float _2065 = _2059;
    float _2067 = _2063;
    if (_2041)
    {
        float _2069 = _2045 * _2059;
        _2051 = _2069;
    }
    float _2071 = _2051;
    if (_2041)
    {
        float _2073 = _2071 * 0.15915493667125701904296875;
        _2065 = _2073;
    }
    float _2075 = _2065;
    float _2077 = _2015;
    float _2079 = _2075;
    if (_2041)
    {
        float _2081 = _2075 * 6.283185482025146484375;
        float _2083 = sin(_2081);
        _2077 = _2083;
    }
    float _2085 = _2077;
    float _2087 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2089 = precise::max(0.0, _2087);
    float _2091 = _2001;
    if (_2041)
    {
        float _2093 = _2075 * 6.283185482025146484375;
        float _2095 = cos(_2093);
        _2091 = _2095;
    }
    float _2097 = _2091;
    float _2099 = -_2027;
    float _2101 = -_2089;
    float _2103 = fma(_2007, _2099, _2101);
    float _2105 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_2041)
    {
        float _2107 = _2103 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2053 = _2107;
    }
    float _2109 = _2053;
    float _2111 = _2109;
    if (!_2041)
    {
        _2079 = _2103;
    }
    float _2113 = _2079;
    float _2115 = fma(_1003, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2117 = _2113;
    if (!_2041)
    {
        _1041 = _2035;
    }
    float _2119 = _1041;
    float _2121 = _2085;
    float _2123 = _2119;
    if (_2041)
    {
        float _2125 = fma(_2085, _2109, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2121 = _2125;
    }
    float _2127 = _2121;
    float _2129 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2105);
    float _2131 = _2127;
    if (_2041)
    {
        float _2133 = _2097 + (-1.0);
        _2111 = _2133;
    }
    float _2135 = _2111;
    float _2137 = _2135;
    if (_2041)
    {
        float _2139 = _2063 * _2127;
        _1833 = _2139;
    }
    float _2141 = _1833;
    if (!_2041)
    {
        _2067 = _2031;
    }
    float _2143 = _2067;
    float _2145 = fma(_1013, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2147 = _2143;
    if (_2041)
    {
        float _2149 = _2135 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2137 = _2149;
    }
    float _2151 = _2137;
    if (_2041)
    {
        float _2153 = _2029 * _2141;
        _2055 = _2153;
    }
    float _2155 = _2055;
    if (!_2041)
    {
        _2131 = _2033;
    }
    float _2157 = _2131;
    float _2159 = _2157;
    if (_2041)
    {
        float _2161 = _2031 * _2141;
        _2147 = _2161;
    }
    float _2163 = _2147;
    if (_2041)
    {
        float _2165 = fma(_2103, _2097, _2151);
        _2117 = _2165;
    }
    float _2167 = _2117;
    if (_2041)
    {
        float _2169 = _2155 * _2155;
        _2159 = _2169;
    }
    float _2171 = _2159;
    float _2173 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_2041)
    {
        float _2175 = _2163 * _2163;
        _2123 = _2175;
    }
    float _2177 = _2123;
    float _2179 = fma(_2167, _2167, _2171);
    float _2181 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2173);
    float _2183 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2185 = floor(_2115);
    float _2187 = _2179 + _2177;
    float _2189 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2181);
    float _2191 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2193 = fma(_2025, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2191);
    float _2195 = precise::clamp(_2193, 0.0, 1.0);
    float _2197 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2183);
    float _2199 = _2189 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2201 = rsqrt(_2187);
    float _2203 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2205 = _2199 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2207 = -_2195;
    float _2209 = _2207 + 1.0;
    float _2211 = -_2205;
    float _2213 = fma(_2211, _2203, 1.0);
    float _2215 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2217 = floor(_2145);
    float _2219 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2215);
    float _2221 = _2201 * _2155;
    float _2223 = _2201 * _2167;
    float _2225 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2197);
    float _2227 = abs(_2209);
    float _2229 = log2(_2227);
    float _2231 = _2221 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2233 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2219);
    float _2235 = _2225 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2237 = _2201 * _2163;
    float _2239 = -_2231;
    float _2241 = fma(_2223, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2239);
    float _2243 = _2233 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2245 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2247 = -_2185;
    float _2249 = _2115 + _2247;
    float _2251 = -_2237;
    float _2253 = fma(_2251, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2241);
    float _2255 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2129);
    float _2257 = fma(_2243, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2245);
    float _2259 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2261 = fma(_2253, -0.5, 0.5);
    float _2263 = _2255 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2265 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2257);
    float _2267 = _2229 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2269 = log2(_2213);
    float _2271 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2273 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2265);
    float _2275 = fma(_2243, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2259);
    float _2277 = fma(_2253, 0.5, 0.5);
    float _2279 = fma(_2243, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2271);
    float _2281 = -_2217;
    float _2283 = _2145 + _2281;
    float _2285 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2275);
    float _2287 = exp2(_2267);
    float _2289 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2279);
    float _2291 = fma(_2277, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2293 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2285);
    float _2295 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2289);
    float _2297 = fma(_2277, _2291, -0.212114393711090087890625);
    float _2299 = 1.0 / _2273;
    float _2301 = _2269 * 0.693147182464599609375;
    float _2303 = sqrt(_2261);
    float2 _6422 = float2(_2249, _2283);
    float _2305 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6422, float2(0.0), isnan(_6422)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6422, float2(0.0), isnan(_6422)), level(0.0)).x;
    float _2307 = fma(_2277, _2297, 1.570728778839111328125);
    float _2309 = _2301 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2311 = _2293 * _2299;
    float _2313 = _2223 + 1.0;
    float _2315 = fma(_2311, 0.5, 0.5);
    float _2317 = -_2223;
    float _2319 = fma(_2287, _2313, _2317);
    float _2321 = _2295 * _2299;
    float _2323 = _2303 * 0.636619746685028076171875;
    float _2325 = fma(_2319, 0.5, 0.5);
    float _2327 = fma(_2321, -0.5, 0.5);
    float _2329 = -_2307;
    float _2331 = fma(_2323, _2329, 1.0);
    float3 _6469 = float3(_2315, _2327, _2309);
    float _2333 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6469, float3(0.0), isnan(_6469)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6469, float3(0.0), isnan(_6469)), level(0.0)).x;
    float3 _6480 = float3(_2315, _2327, _2309);
    float4 _2336 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6480, float3(0.0), isnan(_6480)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6480, float3(0.0), isnan(_6480)), level(0.0)).xyzw;
    float _2338 = _2336.x;
    float _2340 = _2336.y;
    float _2342 = _2336.z;
    float _2344 = _2336.w;
    float2 _6496 = float2(_2331, _2325);
    float3 _2348 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6496, float2(0.0), isnan(_6496)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6496, float2(0.0), isnan(_6496)), level(0.0)).xyz;
    float _2350 = _2348.x;
    float _2352 = _2348.y;
    float _2354 = _2348.z;
    float _2356 = abs(_1893);
    float _2358 = log2(_2356);
    float _2360 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2362 = _2025 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2364 = isnan(_2025);
    bool _2366 = _2362 || _2364;
    bool _2368 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2370 = _2366 || _2368;
    float _2372 = fma(_2243, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2360);
    float _2374 = _2229 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2376 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2372);
    float _2378 = exp2(_2374);
    float _2380 = in.m_78.x;
    float _2382 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2376);
    float _2384 = _2358 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2386 = _1893 <= 8000.0;
    bool _2388 = isnan(_1893);
    bool _2390 = _2386 || _2388;
    bool _2392 = isnan(8000.0);
    bool _2394 = _2390 || _2392;
    float _2396 = float(_2394);
    float _2398 = _2273 * 0.5;
    float _2400 = _2382 + _2273;
    float _2402 = _2293 + _2273;
    out.gl_Position.x = _2293;
    out.gl_Position.y = _2295;
    out.gl_Position.z = _2382;
    out.gl_Position.w = _2273;
    float _2404 = exp2(_2384);
    float _2406 = fma(_2295, -0.5, _2398);
    float _2408 = _2400 * 0.5;
    float _2410 = _2402 * 0.5;
    float _2412 = -_2378;
    float _2414 = _2412 + 1.0;
    float _2416 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2418 = _1947 * _2003;
    float _2420 = _2382;
    float _2422 = _2295;
    float _2424 = _2273;
    float _2426 = _2293;
    if (!_2370)
    {
        _2420 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2428 = _2420;
    float _2430 = _2428;
    float _2432 = _2428;
    if (!_2370)
    {
        _2422 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2434 = _2422;
    float _2436 = fma(_2404, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2438 = precise::clamp(_2436, 0.0, 1.0);
    float _2440 = _2434;
    float _2442 = _2434;
    if (!_2370)
    {
        _2424 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2444 = _2424;
    float _2446 = fma(_2438, -2.0, 3.0);
    float _2448 = _2438 * _2438;
    out.m_80.x = _2410;
    out.m_80.y = _2406;
    out.m_80.z = _2408;
    out.m_80.w = _2273;
    float _2450 = _2444;
    float _2452 = _2444;
    if (!_2370)
    {
        _2426 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2454 = _2426;
    float _2456 = _2448 * _2446;
    float _2458 = -_2456;
    float _2460 = _2458 + 1.0;
    float _2462 = fma(_2460, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2456);
    float _2464 = _2396 * _2462;
    float _2466 = _2464 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2468 = -_2305;
    float _2470 = _2468 + 1.0;
    float _2472 = _2470 * _2466;
    float _2474 = precise::clamp(_2472, 0.0, 1.0);
    float _2476 = -_2474;
    float _2478 = fma(_2476, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2480 = _2478 * _2380;
    float _2482 = _2416 * _2333;
    float _2484 = -_2416;
    float _2486 = _2484 + 1.0;
    float _2488 = _2344 * _2482;
    float _2490 = _2354 * _2482;
    float _2492 = _2344 * _2486;
    float _2494 = _2486;
    float _2496 = _2480;
    float _2498 = _2454;
    float _2500 = _2454;
    if (!_2370)
    {
        _2494 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2502 = _2494;
    float _2504 = fma(_2350, _2488, _2338);
    float _2506 = fma(_2352, _2488, _2340);
    float _2508 = _2480 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2510 = fma(_2344, _2490, _2342);
    float _2512 = _2502;
    float _2514 = _2502;
    if (!_2370)
    {
        _2496 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2516 = _2496;
    out.m_82.x = _2508;
    out.m_84.x = _2504;
    out.m_84.y = _2506;
    out.m_84.z = _2510;
    out.m_84.w = _2492;
    bool _2518 = !_2370;
    float _2520 = _2516;
    float _2522 = _2516;
    if (!_2518)
    {
        bool _2524 = _2025 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2526 = isnan(_2025);
        bool _2528 = _2524 || _2526;
        bool _2530 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2532 = _2528 || _2530;
        if (!_2532)
        {
            float _2534 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2536 = _2025 + _2534;
            float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2540 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2538;
            float _2542 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2544 = _2542 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2546 = 1.0 / _2540;
            float _2548 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2550 = _2548 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2554 = _2552 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2560 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2562 = _2560 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2564 = _2536 * _2546;
            float _2566 = precise::clamp(_2564, 0.0, 1.0);
            float _2568 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2570 = _2568 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2572 = fma(_2566, _2544, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2574 = fma(_2566, _2570, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2576 = fma(_2566, _2550, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2578 = fma(_2566, _2554, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2580 = fma(_2566, _2558, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2582 = fma(_2566, _2562, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2514 = _2576;
            _2442 = _2580;
            _2522 = _2572;
            _2432 = _2578;
            _2452 = _2574;
            _2500 = _2582;
            _2584 = true;
        }
        else
        {
            bool _2586 = _2025 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2588 = isnan(_2025);
            bool _2590 = _2586 || _2588;
            bool _2592 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2594 = _2590 || _2592;
            if (!_2594)
            {
                _2520 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2596 = _2520;
            _2522 = _2596;
            if (!_2594)
            {
                _2512 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2598 = _2512;
            _2514 = _2598;
            if (!_2594)
            {
                _2450 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2600 = _2450;
            _2452 = _2600;
            if (!_2594)
            {
                _2430 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2602 = _2430;
            _2432 = _2602;
            if (!_2594)
            {
                _2440 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2604 = _2440;
            _2442 = _2604;
            if (!_2594)
            {
                _2498 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2606 = _2498;
            bool _2608 = !_2594;
            _2500 = _2606;
            if (!_2608)
            {
                bool _2610 = _2025 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2612 = isnan(_2025);
                bool _2614 = _2610 || _2612;
                bool _2616 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2618 = _2614 || _2616;
                if (!_2618)
                {
                    float _2620 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2622 = _2025 + _2620;
                    float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2626 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2624;
                    float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2630 = _2628 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2632 = 1.0 / _2626;
                    float _2634 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2636 = _2634 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2642 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2644 = _2642 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2648 = _2646 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2650 = _2622 * _2632;
                    float _2652 = precise::clamp(_2650, 0.0, 1.0);
                    float _2654 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2656 = _2654 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2658 = fma(_2652, _2630, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2660 = fma(_2652, _2656, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2662 = fma(_2652, _2636, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2664 = fma(_2652, _2640, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2666 = fma(_2652, _2644, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2668 = fma(_2652, _2648, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2514 = _2662;
                    _2442 = _2666;
                    _2522 = _2658;
                    _2432 = _2664;
                    _2452 = _2660;
                    _2500 = _2668;
                    _2584 = true;
                }
                else
                {
                    _2514 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2442 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2522 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2432 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2452 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2500 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2584 = false;
    float _2670 = _2514;
    float _2672 = _2442;
    float _2674 = _2522;
    float _2676 = _2432;
    float _2678 = _2452;
    float _2680 = _2500;
    float _2682 = _2418 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2684 = fma(_1561, -0.5, 0.5);
    float _2686 = precise::clamp(_2684, 0.0, 1.0);
    float _2688 = -_2670;
    float _2690 = _2688 + _2672;
    float _2692 = -_2674;
    float _2694 = _2692 + _2676;
    out.m_51.x = _2682;
    float _2696 = fma(_2686, _2690, _2670);
    float _2698 = -_2678;
    float _2700 = _2698 + _2680;
    float _2702 = fma(_2686, _2694, _2674);
    float _2704 = _2696 * 0.586610972881317138671875;
    bool _2706 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2708 = fma(_2686, _2700, _2678);
    out.m_86.x = 0.0;
    float _2710 = fma(_2702, 0.298911988735198974609375, _2704);
    bool _2712 = _1947 > 0.0;
    bool _2714 = isnan(_1947);
    bool _2716 = _2712 || _2714;
    bool _2718 = isnan(0.0);
    bool _2720 = _2716 || _2718;
    float _2722 = fma(_2708, 0.114477999508380889892578125, _2710);
    bool _2724 = _2003 <= 0.0;
    bool _2726 = !_2720;
    bool _2728 = _2724 || _2726;
    float _2730 = -_2722;
    float _2732 = _2702 + _2730;
    float _2734 = -_2722;
    float _2736 = _2696 + _2734;
    float _2738 = -_2722;
    float _2740 = _2708 + _2738;
    float _2742 = fma(_2732, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2722);
    float _2744 = fma(_2736, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2722);
    float _2746 = fma(_2740, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2722);
    bool _2748 = !_2706;
    if (!_2748)
    {
        float _2750 = -_1883;
        float _2752 = _2750 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2754 = -_1885;
        float _2756 = _2754 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2758 = -_1887;
        float _2760 = _2758 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2762 = _2752 * _2752;
        float _2764 = fma(_2756, _2756, _2762);
        float _2766 = fma(_2760, _2760, _2764);
        float _2768 = sqrt(_2766);
        float _2770 = rsqrt(_2766);
        float _2772 = -_2768;
        float _2774 = _2772 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2776 = _2774 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2778 = precise::clamp(_2776, 0.0, 1.0);
        float _2780 = _2756 * _2770;
        float _2782 = _2752 * _2770;
        float _2784 = abs(_2778);
        float _2786 = log2(_2784);
        float _2788 = _2760 * _2770;
        float _2790 = _2780 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2792 = _1561 * _2782;
        float _2794 = -_2782;
        float _2796 = -_2790;
        float _2798 = fma(_2794, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2796);
        float _2800 = fma(_1559, _2780, _2792);
        float _2802 = -_2788;
        float _2804 = fma(_2802, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2798);
        float _2806 = fma(_1563, _2788, _2800);
        float _2808 = precise::clamp(_2806, 0.0, 1.0);
        float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2812 = _2804 + _2810;
        float _2814 = _2786 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2816 = _2812 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2818 = precise::clamp(_2816, 0.0, 1.0);
        float _2820 = exp2(_2814);
        float _2822 = _2820 * _2818;
        float _2824 = _2808 * _2822;
        float _2826 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2828 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2830 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _2826;
        out.m_86.y = _2828;
        out.m_86.z = _2830;
    }
    out.m_88.x = _2742;
    out.m_88.y = _2744;
    out.m_88.z = _2746;
    if (!_2728)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2832 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2832;
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2584 = false;
    bool _1611 = false;
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
        float _2888 = as_type<float>(_121);
        out.gl_Position.z = _2888;
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
        float _2961 = as_type<float>(_163);
        out.gl_Position.z = _2961;
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
    float _211 = _203;
    float _213 = _207;
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
    bool _333 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _335 = isnan(_331);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _349 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _351 = isnan(_331);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _367 = _331 + _365;
    float _369 = -_343;
    float _371 = _369 + 1.0;
    bool _373 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _375 = 1.0 / _347;
    float _377 = _359 * _371;
    float _379 = -_359;
    float _381 = _379 + 1.0;
    float _383 = _363 * _375;
    float _385 = fma(_383, _367, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _387 = _385 * _377;
    float _389 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[115].x, _387);
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _397 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[116].x, _389);
    float _399 = _391 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _401 = _393 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _403 = _395 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _405 = _397 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _407 = in.m_64.x;
    float _409 = in.m_64.y;
    out.m_66.x = _399;
    out.m_66.y = _401;
    out.m_66.z = _403;
    out.m_66.w = _405;
    float _411 = _307 * _409;
    float _413 = _305 * _407;
    bool _415 = !_373;
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
    float _443 = _413 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _445 = _411 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _447 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _451 = _449 != 0;
    float _453 = _201 * _445;
    float _455 = in.m_48.x;
    float _457 = in.m_48.y;
    float _459 = in.m_48.z;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _463 = _191 * _443;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _469 = _433 + _467;
    int _471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _473 = _471 != 0;
    float _475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _479 = _477 != 0;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _483 = _481 != 0;
    float _485 = _435 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _487 = _441 > 0.5;
    float _489 = _437 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _491 = -_461;
    float _493 = fma(_485, 2.0, _491);
    float _495 = _439 * 2.0;
    float _497 = fma(_489, -2.0, _465);
    bool _499 = _437 > 0.5;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _505 = _457 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _507 = _457 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _509 = _457 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _511 = 1.0 / _503;
    bool _513 = _435 > 0.5;
    float _515 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[5].x, _507);
    float _517 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[6].x, _509);
    float _519 = -_453;
    int _521 = _499 ? as_type<int>(_519) : as_type<int>(_453);
    float _523 = -_133;
    float _525 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[76].x, _493);
    float _527 = -_463;
    int _529 = _513 ? as_type<int>(_527) : as_type<int>(_463);
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _533 = floor(_495);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _535;
    float _539 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[4].x, _505);
    float _541 = _437 + _439;
    bool _543 = !_473;
    float _545 = _543 ? _453 : as_type<float>(_521);
    float _547 = _435 * 2.0;
    bool _549 = !_479;
    float _551 = _549 ? _463 : as_type<float>(_529);
    float _553 = _537 * _511;
    float _555 = _541 + (-1.0);
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _559 = _557 != 0;
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _563 = _561 != 0;
    float _565 = fma(_553, _469, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _567 = _439 > 0.5;
    float _569 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _571 = _437 + _435;
    float _573 = -_191;
    int _575 = _499 ? as_type<int>(_573) : as_type<int>(_191);
    float _577 = _447 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _579 = -_201;
    int _581 = _567 ? as_type<int>(_579) : as_type<int>(_201);
    float _583 = _571 + (-1.0);
    bool _585 = !_559;
    float _587 = _585 ? _191 : as_type<float>(_575);
    float _589 = _551 + 0.5;
    bool _591 = !_563;
    float _593 = _591 ? _201 : as_type<float>(_581);
    float _595 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _597 = _533 > 0.0;
    float _599 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[4].z, _539);
    bool _601 = _533 >= 0.0;
    bool _603 = isnan(_533);
    bool _605 = _601 || _603;
    bool _607 = isnan(0.0);
    bool _609 = _605 || _607;
    float _611 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[5].z, _515);
    float _613 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[6].z, _517);
    bool _615 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _617 = isnan(_433);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = floor(_547);
    bool _629 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _631 = isnan(_433);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = fma(_577, _589, _525);
    float _643 = -_625;
    float _645 = _643 + 1.0;
    float _647 = 0.0;
    float _649 = _507;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    float _653 = _463;
    float _655 = _453;
    if (!_451)
    {
        _647 = _437;
    }
    float _657 = _647;
    float _659 = _611 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _661 = _657;
    if (_451)
    {
        _661 = _435;
    }
    float _663 = _661;
    float _665 = _639 * _645;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _669 = _609 ? 0 : 1;
    float _671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _673 = _565 * _665;
    float _675 = _475 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_451)
    {
        _649 = _439;
    }
    float _677 = _649;
    float _679 = -_639;
    float _681 = _679 + 1.0;
    float _683 = _677;
    if (!_451)
    {
        _651 = _439;
    }
    float _685 = _651;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _689 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _497);
    float _691 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[83].z, _667);
    float _693 = _545 + (-0.5);
    int _695 = ~_669;
    int _697 = _695 + 1;
    int _699 = _697 + 1;
    float _701 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[131].x, _673);
    float _703 = _685;
    int _705 = _699;
    if (_451)
    {
        _683 = _437;
    }
    float _707 = _683;
    float _709 = -_675;
    float _711 = -_689;
    float _713 = fma(_709, _693, _711);
    if (_451)
    {
        _703 = _437;
    }
    float _715 = _703;
    float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    if (!_597)
    {
        int _719 = ~_669;
        int _721 = _719 + 1;
        _705 = _721;
    }
    int _723 = _705;
    float _725 = _707 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _727 = _627 > 0.0;
    float _729 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[83].w, _531);
    bool _731 = _627 >= 0.0;
    bool _733 = isnan(_627);
    bool _735 = _731 || _733;
    bool _737 = isnan(0.0);
    bool _739 = _735 || _737;
    float _741 = _587 + 0.5;
    float _743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _745 = _723;
    if (_483)
    {
        float _747 = -_463;
        float _749 = _567 ? _747 : _463;
        _653 = _749;
    }
    float _751 = _653;
    float _753 = -_593;
    float _755 = _753 + 0.5;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _759 = _757 != 0;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _763 = _761 != 0;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _767 = _765 != 0;
    float _769 = _741 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _773 = _771 != 0;
    float _775 = _755 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _777 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _779 = _769 * _671;
    float _781 = _775 * _717;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _785 = _663 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _787 = _599 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _789 = _751 + 0.5;
    float _791 = fma(_725, -2.0, _783);
    float _793 = _743 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _795 = _787;
    if (_773)
    {
        float _797 = -_453;
        float _799 = _487 ? _797 : _453;
        _655 = _799;
    }
    float _801 = _655;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _805 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _791);
    float _807 = -_687;
    float _809 = fma(_785, 2.0, _807);
    float _811 = _801 + (-0.5);
    float _813 = _777 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _815 = _613 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _819 = -_793;
    float _821 = -_805;
    float _823 = fma(_819, _811, _821);
    float _825 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[78].w, _803);
    float _827 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _829 = _659 + _827;
    float _831 = -_133;
    float _833 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[81].x, _809);
    float _835 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[78].z, _817);
    float _837 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _839 = _787 + _837;
    float _841 = _829 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _843 = fma(_813, _789, _833);
    float _845 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[132].x, _701);
    float _847 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _849 = _815 + _847;
    float _851 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[28].x, _841);
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _855 = _845 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _859 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[28].z, _851);
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _863 = _853 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _865 = _857 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _867 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _825);
    float _869 = _861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _871 = _859 >= 0.0;
    float _873 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _875 = log2(_873);
    float _877 = -_867;
    float _879 = _877 + 1.0;
    float _881 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _835);
    out.m_68.x = _863;
    out.m_68.y = _865;
    out.m_68.z = _869;
    out.m_68.w = _855;
    float _883 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _691);
    float _885 = fma(_545, _879, _713);
    float _887 = _829 * _829;
    float _889 = -_881;
    float _891 = _889 + 1.0;
    float _893 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _729);
    out.m_70.x = _779;
    out.m_70.y = _781;
    float _895 = fma(_839, _839, _887);
    float _897 = -_891;
    float _899 = fma(_551, _897, _641);
    float _901 = _869;
    if (_871)
    {
        out.m_51.x = 0.0;
    }
    float _903 = fma(_849, _849, _895);
    bool _905 = !_763;
    int _907 = _905 ? 0 : 1;
    float _909 = _875 * _133;
    bool _911 = !_759;
    int _913 = _911 ? 0 : 1;
    float _915 = _437 * 2.0;
    if (_871)
    {
        _901 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _917 = _901;
    float _919 = rsqrt(_903);
    int _921 = abs(_913);
    float _923 = -_883;
    float _925 = _923 + 1.0;
    float _927 = float(_723);
    if (_871)
    {
        float _929 = _917 * 5.0;
        _745 = as_type<int>(_929);
    }
    int _931 = _745;
    float _933 = float(_921);
    float _935 = -_893;
    float _937 = _935 + 1.0;
    bool _939 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _941 = isnan(1.0);
    bool _943 = _939 || _941;
    bool _945 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _947 = _943 || _945;
    float _949 = exp2(_909);
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _953 = 1.0 + _951;
    float _955 = _933 * _927;
    float _957 = -_925;
    float _959 = fma(_751, _957, _843);
    float _961 = in.m_72.x;
    float _963 = in.m_72.y;
    float _965 = in.m_72.z;
    float _967 = fma(_801, _937, _823);
    bool _969 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _971 = isnan(0.0);
    bool _973 = _969 || _971;
    bool _975 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _977 = _973 || _975;
    float _979 = 1.0 / _953;
    bool _981 = !_767;
    int _983 = _981 ? 0 : 1;
    out.m_74.x = _899;
    out.m_74.y = _885;
    out.m_74.z = _959;
    out.m_74.w = _967;
    float _985 = _839 * _919;
    if (_871)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4330 = as_type<float>(_931);
        out.gl_Position.z = _4330;
    }
    float _987 = floor(_915);
    float _989 = -_949;
    float _991 = _989 + 1.0;
    float _993 = _829 * _919;
    if (_871)
    {
        return out;
    }
    float _995 = -_993;
    float _997 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[18].w, _659);
    float _999 = _849 * _919;
    float _1001 = -_985;
    float _1003 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[18].w, _787);
    int _1005 = _739 ? 0 : 1;
    float _1007 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1009 = _997 + _1007;
    float _1011 = -_999;
    float _1013 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[18].w, _815);
    float _1015 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1017 = _1003 + _1015;
    float _1019 = _955 * (-2.0);
    float _1021 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1023 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1025 = _1013 + _1023;
    int _1027 = ~_1005;
    int _1029 = _1027 + 1;
    int _1031 = _1029 + 1;
    float _1033 = -_993;
    float _1035 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[18].w, _829);
    float _1037 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1021);
    int _1039 = _1031;
    float _1041 = _1003;
    if (!_727)
    {
        int _1043 = ~_1005;
        int _1045 = _1043 + 1;
        _1039 = _1045;
    }
    int _1047 = _1039;
    float _1049 = -_985;
    float _1051 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[18].w, _839);
    float _1053 = _977 ? _991 : 0.0;
    float _1055 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1037);
    float _1057 = fma(_595, _1019, _595);
    int _1059 = abs(_907);
    float _1061 = fma(_1019, _961, _961);
    float _1063 = _435 + (-0.5);
    bool _1065 = _1055 >= 0.0;
    float _1067 = _1035 * _1035;
    float _1069 = float(_1047);
    float _1071 = _1057;
    if (_947)
    {
        float _1073 = _1053 * _979;
        _157 = _1073;
    }
    float _1075 = _157;
    float _1077 = float(_1059);
    float _1079 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1061);
    float _1081 = fma(_1051, _1051, _1067);
    float _1083 = -_999;
    float _1085 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[18].w, _849);
    bool _1087 = _987 > 0.0;
    float _1089 = _1077 * _1069;
    float _1091 = fma(_1057, _1075, _1079);
    float _1093 = fma(_1085, _1085, _1081);
    bool _1095 = _987 >= 0.0;
    bool _1097 = isnan(_987);
    bool _1099 = _1095 || _1097;
    bool _1101 = isnan(0.0);
    bool _1103 = _1099 || _1101;
    float _1105 = _1089 * (-2.0);
    float _1107 = _1091 * 0.15915493667125701904296875;
    if (_1065)
    {
        _1071 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1109 = _1071;
    float _1111 = fma(_569, _1105, _569);
    float _1113 = sqrt(_1093);
    int _1115 = _1103 ? 0 : 1;
    int _1117 = as_type<int>(_1109);
    if (_1065)
    {
        float _1119 = _1109 * 5.0;
        _1117 = as_type<int>(_1119);
    }
    int _1121 = _1117;
    if (_1065)
    {
        out.m_51.x = 0.0;
    }
    float _1123 = fma(_1105, _963, _963);
    int _1125 = ~_1115;
    int _1127 = _1125 + 1;
    int _1129 = _1127 + 1;
    float _1131 = _437 + (-0.5);
    int _1133 = _1129;
    if (_1065)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4563 = as_type<float>(_1121);
        out.gl_Position.z = _4563;
    }
    float _1135 = _1107 * 6.283185482025146484375;
    float _1137 = sin(_1135);
    if (!_1087)
    {
        int _1139 = ~_1115;
        int _1141 = _1139 + 1;
        _1133 = _1141;
    }
    int _1143 = _1133;
    int _1145 = abs(_983);
    if (_1065)
    {
        return out;
    }
    float _1147 = -_659;
    float _1149 = _1147 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1151 = -_787;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1155 = -_815;
    float _1157 = _1155 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1159 = _1149 * _1149;
    float _1161 = float(_1143);
    float _1163 = fma(_1131, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1123);
    float _1165 = float(_1145);
    float _1167 = fma(_1153, _1153, _1159);
    float _1169 = _439 + _435;
    float _1171 = fma(_1111, _1075, _1163);
    float _1173 = _439 + (-0.5);
    float _1175 = fma(_1157, _1157, _1167);
    float _1177 = _1165 * _1161;
    float _1179 = _1169 + (-1.0);
    float _1181 = _1171 * 0.15915493667125701904296875;
    float _1183 = _1177 * (-2.0);
    float _1185 = rsqrt(_1175);
    float _1187 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1189 = fma(_1183, _965, _965);
    float _1191 = fma(_1187, _1183, _1187);
    float _1193 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1189);
    float _1195 = _1107 * 6.283185482025146484375;
    float _1197 = cos(_1195);
    float _1199 = fma(_1191, _1075, _1193);
    float _1201 = _1199 * 0.15915493667125701904296875;
    float _1203 = _1153 * _1185;
    float _1205 = _1157 * _1185;
    float _1207 = _1149 * _1185;
    float _1209 = _1181 * 6.283185482025146484375;
    float _1211 = sin(_1209);
    float _1213 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1215 = _1203 * _1213;
    float _1217 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1219 = _1205 * _1217;
    float _1221 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1223 = _1207 * _1221;
    float _1225 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1227 = -_1215;
    float _1229 = fma(_1205, _1225, _1227);
    float _1231 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1233 = -_1219;
    float _1235 = fma(_1207, _1231, _1233);
    float _1237 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1239 = -_1223;
    float _1241 = fma(_1203, _1237, _1239);
    float _1243 = _1181 * 6.283185482025146484375;
    float _1245 = cos(_1243);
    float _1247 = _1229 * _1229;
    float _1249 = _919 * _1113;
    float _1251 = fma(_1235, _1235, _1247);
    float _1253 = _1249 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1255 = _1253 * 0.5;
    float _1257 = _1201 * 6.283185482025146484375;
    float _1259 = cos(_1257);
    float _1261 = fma(_1241, _1241, _1251);
    float _1263 = _1137 * _1211;
    float _1265 = _1197 * _1211;
    float _1267 = _1201 * 6.283185482025146484375;
    float _1269 = sin(_1267);
    float _1271 = _1197 * _1245;
    float _1273 = _1137 * _1245;
    float _1275 = rsqrt(_1261);
    float _1277 = _1197 * _1259;
    float _1279 = _1245 * _1259;
    float _1281 = _445 * _1249;
    float _1283 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _1285 = _1137 * _1259;
    float _1287 = fma(_1269, _1271, _1263);
    float _1289 = fma(_1269, _1263, _1271);
    float _1291 = _1211 * _1259;
    float _1293 = -_1265;
    float _1295 = fma(_1269, _1273, _1293);
    float _1297 = _443 * _1249;
    float _1299 = -_1273;
    float _1301 = fma(_1269, _1265, _1299);
    float _1303 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1305 = _1283 * _1281;
    float _1307 = _1235 * _1275;
    float _1309 = _1229 * _1275;
    float _1311 = _1303 * _1297;
    float _1313 = _1277 * _1305;
    float _1315 = -_1305;
    float _1317 = _1269 * _1315;
    float _1319 = _1285 * _1305;
    float _1321 = _1241 * _1275;
    float _1323 = fma(_1287, _1311, _1313);
    float _1325 = _1205 * _1309;
    float _1327 = _1207 * _1307;
    float _1329 = fma(_1279, _1311, _1317);
    float _1331 = fma(_1301, _1255, _1323);
    float _1333 = -_1325;
    float _1335 = fma(_1207, _1321, _1333);
    float _1337 = -_1327;
    float _1339 = fma(_1203, _1309, _1337);
    float _1341 = fma(_1295, _1311, _1319);
    float _1343 = fma(_1291, _1255, _1329);
    float _1345 = _1335 * _1331;
    float _1347 = _1339 * _1331;
    float _1349 = fma(_1289, _1255, _1341);
    float _1351 = _1203 * _1321;
    float _1353 = fma(_1307, _1343, _1345);
    float _1355 = fma(_1321, _1343, _1347);
    float _1357 = _1277 * _1335;
    float _1359 = -_1351;
    float _1361 = fma(_1205, _1307, _1359);
    float _1363 = fma(_1203, _1349, _1353);
    float _1365 = fma(_1205, _1349, _1355);
    float _1367 = _1277 * _1339;
    float _1369 = _1361 * _1331;
    float _1371 = _787 + _1363;
    float _1373 = _815 + _1365;
    float _1375 = _1277 * _1361;
    float _1377 = _1287 * _1361;
    float _1379 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1381 = _1371 + _1379;
    float _1383 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1385 = _1373 + _1383;
    float _1387 = _1301 * _1361;
    float _1389 = fma(_1309, _1343, _1369);
    float _1391 = _1381 * _1381;
    float _1393 = _1385 * _1385;
    float _1395 = _1287 * _1335;
    float _1397 = fma(_1207, _1349, _1389);
    float _1399 = _1287 * _1339;
    float _1401 = _1391 + _1393;
    float _1403 = _1301 * _1335;
    float _1405 = _1301 * _1339;
    float _1407 = -_1269;
    float _1409 = fma(_1407, _1307, _1357);
    float _1411 = sqrt(_1401);
    float _1413 = -_1269;
    float _1415 = fma(_1413, _1309, _1375);
    float _1417 = _659 + _1397;
    float _1419 = -_1269;
    float _1421 = fma(_1419, _1321, _1367);
    float _1423 = fma(_1279, _1309, _1377);
    float _1425 = fma(_1291, _1307, _1403);
    float _1427 = fma(_1291, _1309, _1387);
    float _1429 = fma(_1291, _1321, _1405);
    float _1431 = fma(_1279, _1307, _1395);
    float _1433 = fma(_1285, _1203, _1409);
    float _1435 = fma(_1285, _1207, _1415);
    float _1437 = fma(_1279, _1321, _1399);
    float _1439 = fma(_1285, _1205, _1421);
    bool _1441 = _1411 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1443 = _1307;
    float _1445 = _1391;
    float _1447 = _1393;
    float _1449 = _1371;
    float _1451 = _1373;
    if (!_1441)
    {
        _1443 = _1391;
    }
    float _1453 = _1443;
    float _1455 = _1453;
    if (!_1441)
    {
        _1445 = _1417;
    }
    float _1457 = _1445;
    bool _1459 = !_1441;
    float _1461 = _1457;
    if (!_1459)
    {
        float _1463 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1465 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1467 = _1411 + _1465;
        float _1469 = rsqrt(_1401);
        float _1471 = _1467 * _1463;
        float _1473 = _1417 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1475 = _1471 * 0.15915493667125701904296875;
        float _1477 = _1475 * 6.283185482025146484375;
        float _1479 = sin(_1477);
        float _1481 = _1475 * 6.283185482025146484375;
        float _1483 = cos(_1481);
        float _1485 = fma(_1479, _1473, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1487 = _1469 * _1485;
        float _1489 = fma(_1381, _1487, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1491 = _1483 + (-1.0);
        float _1493 = fma(_1385, _1487, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1495 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1497 = _1489 + _1495;
        float _1499 = _1491 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1501 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1503 = _1493 + _1501;
        float _1505 = _1497 * _1497;
        float _1507 = fma(_1417, _1483, _1499);
        float _1509 = _1503 * _1503;
        _1461 = _1507;
        _1455 = _1505;
        _1447 = _1509;
        _1449 = _1489;
        _1451 = _1493;
    }
    float _1511 = _1461;
    float _1513 = _1455;
    float _1515 = _1447;
    float _1517 = _1449;
    float _1519 = _1451;
    float _1521 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1523 = _1511 + _1521;
    float _1525 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1527 = fma(_1295, _1203, _1431);
    float _1529 = fma(_1289, _1203, _1425);
    float _1531 = fma(_1523, _1523, _1513);
    float _1533 = fma(_1289, _1207, _1427);
    float _1535 = fma(_1289, _1205, _1429);
    float _1537 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1539 = _1531 + _1515;
    float _1541 = _1525 * _1433;
    float _1543 = fma(_1295, _1207, _1423);
    float _1545 = fma(_1295, _1205, _1437);
    float _1547 = _1525 * _1435;
    float _1549 = _1525 * _1439;
    float _1551 = sqrt(_1539);
    float _1553 = fma(_1537, _1527, _1541);
    float _1555 = fma(_1537, _1543, _1547);
    float _1557 = fma(_1537, _1545, _1549);
    float _1559 = _1529 + _1553;
    float _1561 = _1533 + _1555;
    float _1563 = _1535 + _1557;
    out.m_76.x = _1559;
    out.m_76.y = _1561;
    out.m_76.z = _1563;
    bool _1565 = _1551 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1567 = isnan(_1551);
    bool _1569 = _1565 || _1567;
    bool _1571 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1573 = _1569 || _1571;
    float _1575 = _1547;
    if (!_1573)
    {
        _1575 = 1.0;
    }
    float _1577 = _1575;
    bool _1579 = !_1573;
    float _1581 = _1577;
    if (!_1579)
    {
        bool _1583 = _1551 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1585 = isnan(_1551);
        bool _1587 = _1583 || _1585;
        bool _1589 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1591 = _1587 || _1589;
        if (!_1591)
        {
            float _1593 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1595 = _1551 + _1593;
            float _1597 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1599 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1597;
            float _1601 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1603 = _1601 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1605 = 1.0 / _1599;
            float _1607 = _1595 * _1605;
            float _1609 = fma(_1607, _1603, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1581 = _1609;
            _1611 = true;
        }
        else
        {
            bool _1613 = _1551 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1615 = isnan(_1551);
            bool _1617 = _1613 || _1615;
            bool _1619 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1621 = _1617 || _1619;
            if (!_1621)
            {
                float _1623 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1625 = _1551 + _1623;
                float _1627 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1629 = _1627 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1631 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1633 = _1631 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1635 = 1.0 / _1629;
                float _1637 = _1625 * _1635;
                float _1639 = fma(_1637, _1633, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1581 = _1639;
                _1611 = true;
            }
            else
            {
                _1581 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1611 = false;
    float _1641 = _1581;
    float _1643 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1645 = _1511 + _1643;
    float _1647 = _997 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1649 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1651 = _1517 + _1649;
    float _1653 = fma(_1645, _1641, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1655 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1647);
    float _1657 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1659 = _1519 + _1657;
    float _1661 = fma(_1651, _1641, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1663 = -_659;
    float _1665 = _1663 + _1653;
    float _1667 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1655);
    float _1669 = fma(_1659, _1641, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1671 = -_787;
    float _1673 = _1671 + _1661;
    float _1675 = _1665 * _1665;
    float _1677 = _1667 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1679 = -_815;
    float _1681 = _1679 + _1669;
    float _1683 = _997 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1685 = fma(_1673, _1673, _1675);
    float _1687 = 1.0 / _1677;
    float _1689 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1683);
    float _1691 = fma(_1681, _1681, _1685);
    float _1693 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1689);
    float _1695 = sqrt(_1691);
    float _1697 = _1693 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1699 = _1697 + _1677;
    float _1701 = _1699 * _1687;
    float _1703 = _1701 * 0.5;
    bool _1705 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1707 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1709 = _1705 || _1707;
    bool _1711 = isnan(0.5);
    bool _1713 = _1709 || _1711;
    bool _1715 = _1695 > 0.0;
    float _1717 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1719 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1717);
    bool _1721 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1723 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1725 = _1721 || _1723;
    bool _1727 = isnan(0.5);
    bool _1729 = _1725 || _1727;
    float _1731 = 1.0 / _1719;
    float _1733 = _1687;
    float _1735 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1737 = _1653;
    float _1739 = _1691;
    float _1741 = _1661;
    if (!_1715)
    {
        _1733 = _1661;
    }
    float _1743 = _1733;
    float _1745 = _1743;
    float _1747 = _1743;
    if (!_1715)
    {
        _1735 = _1669;
    }
    float _1749 = _1735;
    bool _1751 = !_1715;
    float _1753 = _1749;
    if (!_1751)
    {
        float _1755 = _205 * _205;
        float _1757 = fma(_203, _203, _1755);
        float _1759 = rsqrt(_1691);
        float _1761 = fma(_207, _207, _1757);
        float _1763 = sqrt(_1761);
        float _1765 = _1673 * _1759;
        float _1767 = _1665 * _1759;
        float _1769 = _1681 * _1759;
        bool _1771 = _1763 > 0.0;
        float _1773 = _1763;
        if (!_1771)
        {
            _1745 = _1661;
        }
        float _1775 = _1745;
        _1747 = _1775;
        if (!_1771)
        {
            _1773 = _1669;
        }
        float _1777 = _1773;
        bool _1779 = !_1771;
        _1753 = _1777;
        if (!_1779)
        {
            float _1781 = rsqrt(_1761);
            float _1783 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1785 = _205 * _1781;
            float _1787 = _203 * _1781;
            float _1789 = _1767 * _1785;
            float _1791 = _207 * _1781;
            float _1793 = fma(_1765, _1787, _1789);
            float _1795 = _1783 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1797 = fma(_1769, _1791, _1793);
            float _1799 = _1797 * _1795;
            float _1801 = fma(_203, _1799, _1661);
            float _1803 = fma(_205, _1799, _1653);
            float _1805 = fma(_207, _1799, _1669);
            _1747 = _1801;
            _1737 = _1803;
            _1753 = _1805;
            _1739 = _1783;
        }
    }
    float _1807 = _1747;
    float _1809 = _1737;
    float _1811 = _1753;
    float _1813 = _1739;
    float _1815 = -_985;
    float _1817 = fma(_1815, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1807);
    float _1819 = -_993;
    float _1821 = fma(_1819, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1809);
    float _1823 = -_999;
    float _1825 = fma(_1823, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1811);
    float _1827 = _1821;
    float _1829 = _1817;
    float _1831 = _1825;
    float _1833 = _1813;
    if (_1713)
    {
        _1741 = 1.0;
    }
    float _1835 = _1741;
    float _1837 = _1835;
    if (!_1729)
    {
        float _1839 = _1009 * _1009;
        float _1841 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1843 = -_815;
        float _1845 = _1843 + _1811;
        float _1847 = -_659;
        float _1849 = _1847 + _1809;
        float _1851 = fma(_1017, _1017, _1839);
        float _1853 = fma(_1025, _1025, _1851);
        float _1855 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1857 = sqrt(_1853);
        float _1859 = _1841 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1861 = 1.0 / _1249;
        float _1863 = precise::min(_1857, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1865 = _1863 * _1855;
        float _1867 = _1865 * _1861;
        float _1869 = -_787;
        float _1871 = _1869 + _1807;
        float _1873 = _1859 * _1867;
        float _1875 = _1845 * _1867;
        float _1877 = fma(_1849, _1873, _997);
        float _1879 = fma(_1871, _1873, _1003);
        float _1881 = fma(_1859, _1875, _1013);
        _1827 = _1877;
        _1829 = _1879;
        _1831 = _1881;
    }
    float _1883 = _1827;
    float _1885 = _1829;
    float _1887 = _1831;
    if (_1713)
    {
        _795 = 1.0;
    }
    float _1889 = _795;
    float _1891 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1893 = _1731 * _1891;
    float _1895 = _1889;
    if (!_1713)
    {
        float _1897 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1899 = _1897 * 0.15915493667125701904296875;
        float _1901 = _1899 * 6.283185482025146484375;
        float _1903 = cos(_1901);
        float _1905 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1907 = _1905 * 0.15915493667125701904296875;
        float _1909 = _1899 * 6.283185482025146484375;
        float _1911 = sin(_1909);
        float _1913 = 1.0 / _1903;
        float _1915 = _1907 * 6.283185482025146484375;
        float _1917 = cos(_1915);
        float _1919 = _1911 * _1913;
        float _1921 = _1907 * 6.283185482025146484375;
        float _1923 = sin(_1921);
        float _1925 = _1917 * _1919;
        float _1927 = 1.0 / _1925;
        float _1929 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1931 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1929;
        float _1933 = 1.0 / _1931;
        float _1935 = _1923 * _1927;
        float _1937 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1939 = fma(_1893, _1935, _1937);
        float _1941 = _1939 * _1933;
        float _1943 = precise::clamp(_1941, 0.0, 1.0);
        _211 = _1907;
        _1837 = _1943;
    }
    float _1945 = _211;
    float _1947 = _1837;
    if (!_1713)
    {
        float _1949 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1951 = _1949 * 0.15915493667125701904296875;
        float _1953 = _1951 * 6.283185482025146484375;
        float _1955 = cos(_1953);
        float _1957 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1959 = _1957 * 0.15915493667125701904296875;
        float _1961 = _1951 * 6.283185482025146484375;
        float _1963 = sin(_1961);
        float _1965 = 1.0 / _1955;
        float _1967 = _1959 * 6.283185482025146484375;
        float _1969 = cos(_1967);
        float _1971 = _1963 * _1965;
        float _1973 = _1959 * 6.283185482025146484375;
        float _1975 = sin(_1973);
        float _1977 = _1969 * _1971;
        float _1979 = 1.0 / _1977;
        float _1981 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1983 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1981;
        float _1985 = 1.0 / _1983;
        float _1987 = _1975 * _1979;
        float _1989 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1991 = fma(_1893, _1987, _1989);
        float _1993 = _1991 * _1985;
        float _1995 = precise::clamp(_1993, 0.0, 1.0);
        float _1997 = -_1995;
        float _1999 = _1997 + 1.0;
        _213 = _1979;
        _1895 = _1999;
    }
    float _2001 = _213;
    float _2003 = _1895;
    float _2005 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2007 = _1883 + _2005;
    float _2009 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2011 = _1885 + _2009;
    float _2013 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2015 = _1887 + _2013;
    float _2017 = _2007 * _2007;
    float _2019 = fma(_2011, _2011, _2017);
    float _2021 = fma(_2015, _2015, _2019);
    float _2023 = rsqrt(_2021);
    float _2025 = sqrt(_2021);
    float _2027 = _2023 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2029 = _2011 * _2027;
    float _2031 = _2015 * _2027;
    float _2033 = _2029 * _2029;
    float _2035 = _2031 * _2031;
    float _2037 = _2033 + _2035;
    float _2039 = sqrt(_2037);
    bool _2041 = _2039 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2043 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2045 = _2039 + _2043;
    float _2047 = _1945;
    float _2049 = _2037;
    float _2051 = _2045;
    float _2053 = _2007;
    float _2055 = _2029;
    if (_2041)
    {
        float _2057 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2047 = _2057;
    }
    float _2059 = _2047;
    if (_2041)
    {
        float _2061 = rsqrt(_2037);
        _2049 = _2061;
    }
    float _2063 = _2049;
    float _2065 = _2059;
    float _2067 = _2063;
    if (_2041)
    {
        float _2069 = _2045 * _2059;
        _2051 = _2069;
    }
    float _2071 = _2051;
    if (_2041)
    {
        float _2073 = _2071 * 0.15915493667125701904296875;
        _2065 = _2073;
    }
    float _2075 = _2065;
    float _2077 = _2015;
    float _2079 = _2075;
    if (_2041)
    {
        float _2081 = _2075 * 6.283185482025146484375;
        float _2083 = sin(_2081);
        _2077 = _2083;
    }
    float _2085 = _2077;
    float _2087 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2089 = precise::max(0.0, _2087);
    float _2091 = _2001;
    if (_2041)
    {
        float _2093 = _2075 * 6.283185482025146484375;
        float _2095 = cos(_2093);
        _2091 = _2095;
    }
    float _2097 = _2091;
    float _2099 = -_2027;
    float _2101 = -_2089;
    float _2103 = fma(_2007, _2099, _2101);
    float _2105 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_2041)
    {
        float _2107 = _2103 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2053 = _2107;
    }
    float _2109 = _2053;
    float _2111 = _2109;
    if (!_2041)
    {
        _2079 = _2103;
    }
    float _2113 = _2079;
    float _2115 = fma(_1003, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2117 = _2113;
    if (!_2041)
    {
        _1041 = _2035;
    }
    float _2119 = _1041;
    float _2121 = _2085;
    float _2123 = _2119;
    if (_2041)
    {
        float _2125 = fma(_2085, _2109, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2121 = _2125;
    }
    float _2127 = _2121;
    float _2129 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2105);
    float _2131 = _2127;
    if (_2041)
    {
        float _2133 = _2097 + (-1.0);
        _2111 = _2133;
    }
    float _2135 = _2111;
    float _2137 = _2135;
    if (_2041)
    {
        float _2139 = _2063 * _2127;
        _1833 = _2139;
    }
    float _2141 = _1833;
    if (!_2041)
    {
        _2067 = _2031;
    }
    float _2143 = _2067;
    float _2145 = fma(_1013, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2147 = _2143;
    if (_2041)
    {
        float _2149 = _2135 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2137 = _2149;
    }
    float _2151 = _2137;
    if (_2041)
    {
        float _2153 = _2029 * _2141;
        _2055 = _2153;
    }
    float _2155 = _2055;
    if (!_2041)
    {
        _2131 = _2033;
    }
    float _2157 = _2131;
    float _2159 = _2157;
    if (_2041)
    {
        float _2161 = _2031 * _2141;
        _2147 = _2161;
    }
    float _2163 = _2147;
    if (_2041)
    {
        float _2165 = fma(_2103, _2097, _2151);
        _2117 = _2165;
    }
    float _2167 = _2117;
    if (_2041)
    {
        float _2169 = _2155 * _2155;
        _2159 = _2169;
    }
    float _2171 = _2159;
    float _2173 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_2041)
    {
        float _2175 = _2163 * _2163;
        _2123 = _2175;
    }
    float _2177 = _2123;
    float _2179 = fma(_2167, _2167, _2171);
    float _2181 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2173);
    float _2183 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2185 = floor(_2115);
    float _2187 = _2179 + _2177;
    float _2189 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2181);
    float _2191 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2193 = fma(_2025, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2191);
    float _2195 = precise::clamp(_2193, 0.0, 1.0);
    float _2197 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2183);
    float _2199 = _2189 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2201 = rsqrt(_2187);
    float _2203 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2205 = _2199 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2207 = -_2195;
    float _2209 = _2207 + 1.0;
    float _2211 = -_2205;
    float _2213 = fma(_2211, _2203, 1.0);
    float _2215 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2217 = floor(_2145);
    float _2219 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2215);
    float _2221 = _2201 * _2155;
    float _2223 = _2201 * _2167;
    float _2225 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2197);
    float _2227 = abs(_2209);
    float _2229 = log2(_2227);
    float _2231 = _2221 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2233 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2219);
    float _2235 = _2225 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2237 = _2201 * _2163;
    float _2239 = -_2231;
    float _2241 = fma(_2223, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2239);
    float _2243 = _2233 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2245 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2247 = -_2185;
    float _2249 = _2115 + _2247;
    float _2251 = -_2237;
    float _2253 = fma(_2251, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2241);
    float _2255 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2129);
    float _2257 = fma(_2243, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2245);
    float _2259 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2261 = fma(_2253, -0.5, 0.5);
    float _2263 = _2255 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2265 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2257);
    float _2267 = _2229 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2269 = log2(_2213);
    float _2271 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2273 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2265);
    float _2275 = fma(_2243, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2259);
    float _2277 = fma(_2253, 0.5, 0.5);
    float _2279 = fma(_2243, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2271);
    float _2281 = -_2217;
    float _2283 = _2145 + _2281;
    float _2285 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2275);
    float _2287 = exp2(_2267);
    float _2289 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2279);
    float _2291 = fma(_2277, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2293 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2285);
    float _2295 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2289);
    float _2297 = fma(_2277, _2291, -0.212114393711090087890625);
    float _2299 = 1.0 / _2273;
    float _2301 = _2269 * 0.693147182464599609375;
    float _2303 = sqrt(_2261);
    float2 _6422 = float2(_2249, _2283);
    float _2305 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6422, float2(0.0), isnan(_6422)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6422, float2(0.0), isnan(_6422)), level(0.0)).x;
    float _2307 = fma(_2277, _2297, 1.570728778839111328125);
    float _2309 = _2301 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2311 = _2293 * _2299;
    float _2313 = _2223 + 1.0;
    float _2315 = fma(_2311, 0.5, 0.5);
    float _2317 = -_2223;
    float _2319 = fma(_2287, _2313, _2317);
    float _2321 = _2295 * _2299;
    float _2323 = _2303 * 0.636619746685028076171875;
    float _2325 = fma(_2319, 0.5, 0.5);
    float _2327 = fma(_2321, -0.5, 0.5);
    float _2329 = -_2307;
    float _2331 = fma(_2323, _2329, 1.0);
    float3 _6469 = float3(_2315, _2327, _2309);
    float _2333 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6469, float3(0.0), isnan(_6469)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6469, float3(0.0), isnan(_6469)), level(0.0)).x;
    float3 _6480 = float3(_2315, _2327, _2309);
    float4 _2336 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6480, float3(0.0), isnan(_6480)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6480, float3(0.0), isnan(_6480)), level(0.0)).xyzw;
    float _2338 = _2336.x;
    float _2340 = _2336.y;
    float _2342 = _2336.z;
    float _2344 = _2336.w;
    float2 _6496 = float2(_2331, _2325);
    float3 _2348 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6496, float2(0.0), isnan(_6496)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6496, float2(0.0), isnan(_6496)), level(0.0)).xyz;
    float _2350 = _2348.x;
    float _2352 = _2348.y;
    float _2354 = _2348.z;
    float _2356 = abs(_1893);
    float _2358 = log2(_2356);
    float _2360 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2362 = _2025 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2364 = isnan(_2025);
    bool _2366 = _2362 || _2364;
    bool _2368 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2370 = _2366 || _2368;
    float _2372 = fma(_2243, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2360);
    float _2374 = _2229 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2376 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2372);
    float _2378 = exp2(_2374);
    float _2380 = in.m_78.x;
    float _2382 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2376);
    float _2384 = _2358 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2386 = _1893 <= 8000.0;
    bool _2388 = isnan(_1893);
    bool _2390 = _2386 || _2388;
    bool _2392 = isnan(8000.0);
    bool _2394 = _2390 || _2392;
    float _2396 = float(_2394);
    float _2398 = _2273 * 0.5;
    float _2400 = _2382 + _2273;
    float _2402 = _2293 + _2273;
    out.gl_Position.x = _2293;
    out.gl_Position.y = _2295;
    out.gl_Position.z = _2382;
    out.gl_Position.w = _2273;
    float _2404 = exp2(_2384);
    float _2406 = fma(_2295, -0.5, _2398);
    float _2408 = _2400 * 0.5;
    float _2410 = _2402 * 0.5;
    float _2412 = -_2378;
    float _2414 = _2412 + 1.0;
    float _2416 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2418 = _1947 * _2003;
    float _2420 = _2382;
    float _2422 = _2295;
    float _2424 = _2273;
    float _2426 = _2293;
    if (!_2370)
    {
        _2420 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2428 = _2420;
    float _2430 = _2428;
    float _2432 = _2428;
    if (!_2370)
    {
        _2422 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2434 = _2422;
    float _2436 = fma(_2404, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2438 = precise::clamp(_2436, 0.0, 1.0);
    float _2440 = _2434;
    float _2442 = _2434;
    if (!_2370)
    {
        _2424 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2444 = _2424;
    float _2446 = fma(_2438, -2.0, 3.0);
    float _2448 = _2438 * _2438;
    out.m_80.x = _2410;
    out.m_80.y = _2406;
    out.m_80.z = _2408;
    out.m_80.w = _2273;
    float _2450 = _2444;
    float _2452 = _2444;
    if (!_2370)
    {
        _2426 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2454 = _2426;
    float _2456 = _2448 * _2446;
    float _2458 = -_2456;
    float _2460 = _2458 + 1.0;
    float _2462 = fma(_2460, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2456);
    float _2464 = _2396 * _2462;
    float _2466 = _2464 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2468 = -_2305;
    float _2470 = _2468 + 1.0;
    float _2472 = _2470 * _2466;
    float _2474 = precise::clamp(_2472, 0.0, 1.0);
    float _2476 = -_2474;
    float _2478 = fma(_2476, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2480 = _2478 * _2380;
    float _2482 = _2416 * _2333;
    float _2484 = -_2416;
    float _2486 = _2484 + 1.0;
    float _2488 = _2344 * _2482;
    float _2490 = _2354 * _2482;
    float _2492 = _2344 * _2486;
    float _2494 = _2486;
    float _2496 = _2480;
    float _2498 = _2454;
    float _2500 = _2454;
    if (!_2370)
    {
        _2494 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2502 = _2494;
    float _2504 = fma(_2350, _2488, _2338);
    float _2506 = fma(_2352, _2488, _2340);
    float _2508 = _2480 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2510 = fma(_2344, _2490, _2342);
    float _2512 = _2502;
    float _2514 = _2502;
    if (!_2370)
    {
        _2496 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2516 = _2496;
    out.m_82.x = _2508;
    out.m_84.x = _2504;
    out.m_84.y = _2506;
    out.m_84.z = _2510;
    out.m_84.w = _2492;
    bool _2518 = !_2370;
    float _2520 = _2516;
    float _2522 = _2516;
    if (!_2518)
    {
        bool _2524 = _2025 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2526 = isnan(_2025);
        bool _2528 = _2524 || _2526;
        bool _2530 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2532 = _2528 || _2530;
        if (!_2532)
        {
            float _2534 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2536 = _2025 + _2534;
            float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2540 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2538;
            float _2542 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2544 = _2542 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2546 = 1.0 / _2540;
            float _2548 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2550 = _2548 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2554 = _2552 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2560 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2562 = _2560 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2564 = _2536 * _2546;
            float _2566 = precise::clamp(_2564, 0.0, 1.0);
            float _2568 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2570 = _2568 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2572 = fma(_2566, _2544, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2574 = fma(_2566, _2570, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2576 = fma(_2566, _2550, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2578 = fma(_2566, _2554, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2580 = fma(_2566, _2558, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2582 = fma(_2566, _2562, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2514 = _2576;
            _2442 = _2580;
            _2522 = _2572;
            _2432 = _2578;
            _2452 = _2574;
            _2500 = _2582;
            _2584 = true;
        }
        else
        {
            bool _2586 = _2025 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2588 = isnan(_2025);
            bool _2590 = _2586 || _2588;
            bool _2592 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2594 = _2590 || _2592;
            if (!_2594)
            {
                _2520 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2596 = _2520;
            _2522 = _2596;
            if (!_2594)
            {
                _2512 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2598 = _2512;
            _2514 = _2598;
            if (!_2594)
            {
                _2450 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2600 = _2450;
            _2452 = _2600;
            if (!_2594)
            {
                _2430 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2602 = _2430;
            _2432 = _2602;
            if (!_2594)
            {
                _2440 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2604 = _2440;
            _2442 = _2604;
            if (!_2594)
            {
                _2498 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2606 = _2498;
            bool _2608 = !_2594;
            _2500 = _2606;
            if (!_2608)
            {
                bool _2610 = _2025 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2612 = isnan(_2025);
                bool _2614 = _2610 || _2612;
                bool _2616 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2618 = _2614 || _2616;
                if (!_2618)
                {
                    float _2620 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2622 = _2025 + _2620;
                    float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2626 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2624;
                    float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2630 = _2628 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2632 = 1.0 / _2626;
                    float _2634 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2636 = _2634 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2642 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2644 = _2642 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2648 = _2646 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2650 = _2622 * _2632;
                    float _2652 = precise::clamp(_2650, 0.0, 1.0);
                    float _2654 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2656 = _2654 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2658 = fma(_2652, _2630, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2660 = fma(_2652, _2656, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2662 = fma(_2652, _2636, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2664 = fma(_2652, _2640, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2666 = fma(_2652, _2644, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2668 = fma(_2652, _2648, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2514 = _2662;
                    _2442 = _2666;
                    _2522 = _2658;
                    _2432 = _2664;
                    _2452 = _2660;
                    _2500 = _2668;
                    _2584 = true;
                }
                else
                {
                    _2514 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2442 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2522 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2432 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2452 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2500 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2584 = false;
    float _2670 = _2514;
    float _2672 = _2442;
    float _2674 = _2522;
    float _2676 = _2432;
    float _2678 = _2452;
    float _2680 = _2500;
    float _2682 = _2418 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2684 = fma(_1561, -0.5, 0.5);
    float _2686 = precise::clamp(_2684, 0.0, 1.0);
    float _2688 = -_2670;
    float _2690 = _2688 + _2672;
    float _2692 = -_2674;
    float _2694 = _2692 + _2676;
    out.m_51.x = _2682;
    float _2696 = fma(_2686, _2690, _2670);
    float _2698 = -_2678;
    float _2700 = _2698 + _2680;
    float _2702 = fma(_2686, _2694, _2674);
    float _2704 = _2696 * 0.586610972881317138671875;
    bool _2706 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2708 = fma(_2686, _2700, _2678);
    out.m_86.x = 0.0;
    float _2710 = fma(_2702, 0.298911988735198974609375, _2704);
    bool _2712 = _1947 > 0.0;
    bool _2714 = isnan(_1947);
    bool _2716 = _2712 || _2714;
    bool _2718 = isnan(0.0);
    bool _2720 = _2716 || _2718;
    float _2722 = fma(_2708, 0.114477999508380889892578125, _2710);
    bool _2724 = _2003 <= 0.0;
    bool _2726 = !_2720;
    bool _2728 = _2724 || _2726;
    float _2730 = -_2722;
    float _2732 = _2702 + _2730;
    float _2734 = -_2722;
    float _2736 = _2696 + _2734;
    float _2738 = -_2722;
    float _2740 = _2708 + _2738;
    float _2742 = fma(_2732, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2722);
    float _2744 = fma(_2736, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2722);
    float _2746 = fma(_2740, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2722);
    bool _2748 = !_2706;
    if (!_2748)
    {
        float _2750 = -_1883;
        float _2752 = _2750 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2754 = -_1885;
        float _2756 = _2754 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2758 = -_1887;
        float _2760 = _2758 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2762 = _2752 * _2752;
        float _2764 = fma(_2756, _2756, _2762);
        float _2766 = fma(_2760, _2760, _2764);
        float _2768 = sqrt(_2766);
        float _2770 = rsqrt(_2766);
        float _2772 = -_2768;
        float _2774 = _2772 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2776 = _2774 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2778 = precise::clamp(_2776, 0.0, 1.0);
        float _2780 = _2756 * _2770;
        float _2782 = _2752 * _2770;
        float _2784 = abs(_2778);
        float _2786 = log2(_2784);
        float _2788 = _2760 * _2770;
        float _2790 = _2780 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2792 = _1561 * _2782;
        float _2794 = -_2782;
        float _2796 = -_2790;
        float _2798 = fma(_2794, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2796);
        float _2800 = fma(_1559, _2780, _2792);
        float _2802 = -_2788;
        float _2804 = fma(_2802, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2798);
        float _2806 = fma(_1563, _2788, _2800);
        float _2808 = precise::clamp(_2806, 0.0, 1.0);
        float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2812 = _2804 + _2810;
        float _2814 = _2786 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2816 = _2812 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2818 = precise::clamp(_2816, 0.0, 1.0);
        float _2820 = exp2(_2814);
        float _2822 = _2820 * _2818;
        float _2824 = _2808 * _2822;
        float _2826 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2828 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2830 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _2826;
        out.m_86.y = _2828;
        out.m_86.z = _2830;
    }
    out.m_88.x = _2742;
    out.m_88.y = _2744;
    out.m_88.z = _2746;
    if (!_2728)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2832 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2832;
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2584 = false;
    bool _1611 = false;
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
        float _2888 = as_type<float>(_121);
        out.gl_Position.z = _2888;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2961 = as_type<float>(_163);
        out.gl_Position.z = _2961;
    }
    if (_151)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _211 = _203;
    float _213 = _207;
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
    bool _333 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _335 = isnan(_331);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _349 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _351 = isnan(_331);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _367 = _331 + _365;
    float _369 = -_343;
    float _371 = _369 + 1.0;
    bool _373 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _375 = 1.0 / _347;
    float _377 = _359 * _371;
    float _379 = -_359;
    float _381 = _379 + 1.0;
    float _383 = _363 * _375;
    float _385 = fma(_383, _367, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _387 = _385 * _377;
    float _389 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[115].x, _387);
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _397 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[116].x, _389);
    float _399 = _391 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _401 = _393 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _403 = _395 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _405 = _397 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _407 = in.m_64.x;
    float _409 = in.m_64.y;
    out.m_66.x = _399;
    out.m_66.y = _401;
    out.m_66.z = _403;
    out.m_66.w = _405;
    float _411 = _307 * _409;
    float _413 = _305 * _407;
    bool _415 = !_373;
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
    float _443 = _413 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _445 = _411 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _447 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _451 = _449 != 0;
    float _453 = _201 * _445;
    float _455 = in.m_48.x;
    float _457 = in.m_48.y;
    float _459 = in.m_48.z;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _463 = _191 * _443;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _469 = _433 + _467;
    int _471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _473 = _471 != 0;
    float _475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _479 = _477 != 0;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _483 = _481 != 0;
    float _485 = _435 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _487 = _441 > 0.5;
    float _489 = _437 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _491 = -_461;
    float _493 = fma(_485, 2.0, _491);
    float _495 = _439 * 2.0;
    float _497 = fma(_489, -2.0, _465);
    bool _499 = _437 > 0.5;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _505 = _457 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _507 = _457 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _509 = _457 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _511 = 1.0 / _503;
    bool _513 = _435 > 0.5;
    float _515 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[5].x, _507);
    float _517 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[6].x, _509);
    float _519 = -_453;
    int _521 = _499 ? as_type<int>(_519) : as_type<int>(_453);
    float _523 = -_133;
    float _525 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[76].x, _493);
    float _527 = -_463;
    int _529 = _513 ? as_type<int>(_527) : as_type<int>(_463);
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _533 = floor(_495);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _535;
    float _539 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[4].x, _505);
    float _541 = _437 + _439;
    bool _543 = !_473;
    float _545 = _543 ? _453 : as_type<float>(_521);
    float _547 = _435 * 2.0;
    bool _549 = !_479;
    float _551 = _549 ? _463 : as_type<float>(_529);
    float _553 = _537 * _511;
    float _555 = _541 + (-1.0);
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _559 = _557 != 0;
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _563 = _561 != 0;
    float _565 = fma(_553, _469, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _567 = _439 > 0.5;
    float _569 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _571 = _437 + _435;
    float _573 = -_191;
    int _575 = _499 ? as_type<int>(_573) : as_type<int>(_191);
    float _577 = _447 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _579 = -_201;
    int _581 = _567 ? as_type<int>(_579) : as_type<int>(_201);
    float _583 = _571 + (-1.0);
    bool _585 = !_559;
    float _587 = _585 ? _191 : as_type<float>(_575);
    float _589 = _551 + 0.5;
    bool _591 = !_563;
    float _593 = _591 ? _201 : as_type<float>(_581);
    float _595 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _597 = _533 > 0.0;
    float _599 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[4].z, _539);
    bool _601 = _533 >= 0.0;
    bool _603 = isnan(_533);
    bool _605 = _601 || _603;
    bool _607 = isnan(0.0);
    bool _609 = _605 || _607;
    float _611 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[5].z, _515);
    float _613 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[6].z, _517);
    bool _615 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _617 = isnan(_433);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = floor(_547);
    bool _629 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _631 = isnan(_433);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = fma(_577, _589, _525);
    float _643 = -_625;
    float _645 = _643 + 1.0;
    float _647 = 0.0;
    float _649 = _507;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    float _653 = _463;
    float _655 = _453;
    if (!_451)
    {
        _647 = _437;
    }
    float _657 = _647;
    float _659 = _611 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _661 = _657;
    if (_451)
    {
        _661 = _435;
    }
    float _663 = _661;
    float _665 = _639 * _645;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _669 = _609 ? 0 : 1;
    float _671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _673 = _565 * _665;
    float _675 = _475 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_451)
    {
        _649 = _439;
    }
    float _677 = _649;
    float _679 = -_639;
    float _681 = _679 + 1.0;
    float _683 = _677;
    if (!_451)
    {
        _651 = _439;
    }
    float _685 = _651;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _689 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _497);
    float _691 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[83].z, _667);
    float _693 = _545 + (-0.5);
    int _695 = ~_669;
    int _697 = _695 + 1;
    int _699 = _697 + 1;
    float _701 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[131].x, _673);
    float _703 = _685;
    int _705 = _699;
    if (_451)
    {
        _683 = _437;
    }
    float _707 = _683;
    float _709 = -_675;
    float _711 = -_689;
    float _713 = fma(_709, _693, _711);
    if (_451)
    {
        _703 = _437;
    }
    float _715 = _703;
    float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    if (!_597)
    {
        int _719 = ~_669;
        int _721 = _719 + 1;
        _705 = _721;
    }
    int _723 = _705;
    float _725 = _707 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _727 = _627 > 0.0;
    float _729 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[83].w, _531);
    bool _731 = _627 >= 0.0;
    bool _733 = isnan(_627);
    bool _735 = _731 || _733;
    bool _737 = isnan(0.0);
    bool _739 = _735 || _737;
    float _741 = _587 + 0.5;
    float _743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _745 = _723;
    if (_483)
    {
        float _747 = -_463;
        float _749 = _567 ? _747 : _463;
        _653 = _749;
    }
    float _751 = _653;
    float _753 = -_593;
    float _755 = _753 + 0.5;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _759 = _757 != 0;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _763 = _761 != 0;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _767 = _765 != 0;
    float _769 = _741 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _773 = _771 != 0;
    float _775 = _755 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _777 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _779 = _769 * _671;
    float _781 = _775 * _717;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _785 = _663 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _787 = _599 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _789 = _751 + 0.5;
    float _791 = fma(_725, -2.0, _783);
    float _793 = _743 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _795 = _787;
    if (_773)
    {
        float _797 = -_453;
        float _799 = _487 ? _797 : _453;
        _655 = _799;
    }
    float _801 = _655;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _805 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _791);
    float _807 = -_687;
    float _809 = fma(_785, 2.0, _807);
    float _811 = _801 + (-0.5);
    float _813 = _777 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _815 = _613 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _819 = -_793;
    float _821 = -_805;
    float _823 = fma(_819, _811, _821);
    float _825 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[78].w, _803);
    float _827 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _829 = _659 + _827;
    float _831 = -_133;
    float _833 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[81].x, _809);
    float _835 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[78].z, _817);
    float _837 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _839 = _787 + _837;
    float _841 = _829 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _843 = fma(_813, _789, _833);
    float _845 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[132].x, _701);
    float _847 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _849 = _815 + _847;
    float _851 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[28].x, _841);
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _855 = _845 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _859 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[28].z, _851);
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _863 = _853 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _865 = _857 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _867 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _825);
    float _869 = _861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _871 = _859 >= 0.0;
    float _873 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _875 = log2(_873);
    float _877 = -_867;
    float _879 = _877 + 1.0;
    float _881 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _835);
    out.m_68.x = _863;
    out.m_68.y = _865;
    out.m_68.z = _869;
    out.m_68.w = _855;
    float _883 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _691);
    float _885 = fma(_545, _879, _713);
    float _887 = _829 * _829;
    float _889 = -_881;
    float _891 = _889 + 1.0;
    float _893 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _729);
    out.m_70.x = _779;
    out.m_70.y = _781;
    float _895 = fma(_839, _839, _887);
    float _897 = -_891;
    float _899 = fma(_551, _897, _641);
    float _901 = _869;
    if (_871)
    {
        out.m_51.x = 0.0;
    }
    float _903 = fma(_849, _849, _895);
    bool _905 = !_763;
    int _907 = _905 ? 0 : 1;
    float _909 = _875 * _133;
    bool _911 = !_759;
    int _913 = _911 ? 0 : 1;
    float _915 = _437 * 2.0;
    if (_871)
    {
        _901 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _917 = _901;
    float _919 = rsqrt(_903);
    int _921 = abs(_913);
    float _923 = -_883;
    float _925 = _923 + 1.0;
    float _927 = float(_723);
    if (_871)
    {
        float _929 = _917 * 5.0;
        _745 = as_type<int>(_929);
    }
    int _931 = _745;
    float _933 = float(_921);
    float _935 = -_893;
    float _937 = _935 + 1.0;
    bool _939 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _941 = isnan(1.0);
    bool _943 = _939 || _941;
    bool _945 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _947 = _943 || _945;
    float _949 = exp2(_909);
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _953 = 1.0 + _951;
    float _955 = _933 * _927;
    float _957 = -_925;
    float _959 = fma(_751, _957, _843);
    float _961 = in.m_72.x;
    float _963 = in.m_72.y;
    float _965 = in.m_72.z;
    float _967 = fma(_801, _937, _823);
    bool _969 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _971 = isnan(0.0);
    bool _973 = _969 || _971;
    bool _975 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _977 = _973 || _975;
    float _979 = 1.0 / _953;
    bool _981 = !_767;
    int _983 = _981 ? 0 : 1;
    out.m_74.x = _899;
    out.m_74.y = _885;
    out.m_74.z = _959;
    out.m_74.w = _967;
    float _985 = _839 * _919;
    if (_871)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4330 = as_type<float>(_931);
        out.gl_Position.z = _4330;
    }
    float _987 = floor(_915);
    float _989 = -_949;
    float _991 = _989 + 1.0;
    float _993 = _829 * _919;
    if (_871)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _995 = -_993;
    float _997 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[18].w, _659);
    float _999 = _849 * _919;
    float _1001 = -_985;
    float _1003 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[18].w, _787);
    int _1005 = _739 ? 0 : 1;
    float _1007 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1009 = _997 + _1007;
    float _1011 = -_999;
    float _1013 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[18].w, _815);
    float _1015 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1017 = _1003 + _1015;
    float _1019 = _955 * (-2.0);
    float _1021 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1023 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1025 = _1013 + _1023;
    int _1027 = ~_1005;
    int _1029 = _1027 + 1;
    int _1031 = _1029 + 1;
    float _1033 = -_993;
    float _1035 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[18].w, _829);
    float _1037 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1021);
    int _1039 = _1031;
    float _1041 = _1003;
    if (!_727)
    {
        int _1043 = ~_1005;
        int _1045 = _1043 + 1;
        _1039 = _1045;
    }
    int _1047 = _1039;
    float _1049 = -_985;
    float _1051 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[18].w, _839);
    float _1053 = _977 ? _991 : 0.0;
    float _1055 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1037);
    float _1057 = fma(_595, _1019, _595);
    int _1059 = abs(_907);
    float _1061 = fma(_1019, _961, _961);
    float _1063 = _435 + (-0.5);
    bool _1065 = _1055 >= 0.0;
    float _1067 = _1035 * _1035;
    float _1069 = float(_1047);
    float _1071 = _1057;
    if (_947)
    {
        float _1073 = _1053 * _979;
        _157 = _1073;
    }
    float _1075 = _157;
    float _1077 = float(_1059);
    float _1079 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1061);
    float _1081 = fma(_1051, _1051, _1067);
    float _1083 = -_999;
    float _1085 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[18].w, _849);
    bool _1087 = _987 > 0.0;
    float _1089 = _1077 * _1069;
    float _1091 = fma(_1057, _1075, _1079);
    float _1093 = fma(_1085, _1085, _1081);
    bool _1095 = _987 >= 0.0;
    bool _1097 = isnan(_987);
    bool _1099 = _1095 || _1097;
    bool _1101 = isnan(0.0);
    bool _1103 = _1099 || _1101;
    float _1105 = _1089 * (-2.0);
    float _1107 = _1091 * 0.15915493667125701904296875;
    if (_1065)
    {
        _1071 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1109 = _1071;
    float _1111 = fma(_569, _1105, _569);
    float _1113 = sqrt(_1093);
    int _1115 = _1103 ? 0 : 1;
    int _1117 = as_type<int>(_1109);
    if (_1065)
    {
        float _1119 = _1109 * 5.0;
        _1117 = as_type<int>(_1119);
    }
    int _1121 = _1117;
    if (_1065)
    {
        out.m_51.x = 0.0;
    }
    float _1123 = fma(_1105, _963, _963);
    int _1125 = ~_1115;
    int _1127 = _1125 + 1;
    int _1129 = _1127 + 1;
    float _1131 = _437 + (-0.5);
    int _1133 = _1129;
    if (_1065)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4563 = as_type<float>(_1121);
        out.gl_Position.z = _4563;
    }
    float _1135 = _1107 * 6.283185482025146484375;
    float _1137 = sin(_1135);
    if (!_1087)
    {
        int _1139 = ~_1115;
        int _1141 = _1139 + 1;
        _1133 = _1141;
    }
    int _1143 = _1133;
    int _1145 = abs(_983);
    if (_1065)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1147 = -_659;
    float _1149 = _1147 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1151 = -_787;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1155 = -_815;
    float _1157 = _1155 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1159 = _1149 * _1149;
    float _1161 = float(_1143);
    float _1163 = fma(_1131, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1123);
    float _1165 = float(_1145);
    float _1167 = fma(_1153, _1153, _1159);
    float _1169 = _439 + _435;
    float _1171 = fma(_1111, _1075, _1163);
    float _1173 = _439 + (-0.5);
    float _1175 = fma(_1157, _1157, _1167);
    float _1177 = _1165 * _1161;
    float _1179 = _1169 + (-1.0);
    float _1181 = _1171 * 0.15915493667125701904296875;
    float _1183 = _1177 * (-2.0);
    float _1185 = rsqrt(_1175);
    float _1187 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1189 = fma(_1183, _965, _965);
    float _1191 = fma(_1187, _1183, _1187);
    float _1193 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1189);
    float _1195 = _1107 * 6.283185482025146484375;
    float _1197 = cos(_1195);
    float _1199 = fma(_1191, _1075, _1193);
    float _1201 = _1199 * 0.15915493667125701904296875;
    float _1203 = _1153 * _1185;
    float _1205 = _1157 * _1185;
    float _1207 = _1149 * _1185;
    float _1209 = _1181 * 6.283185482025146484375;
    float _1211 = sin(_1209);
    float _1213 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1215 = _1203 * _1213;
    float _1217 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1219 = _1205 * _1217;
    float _1221 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1223 = _1207 * _1221;
    float _1225 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1227 = -_1215;
    float _1229 = fma(_1205, _1225, _1227);
    float _1231 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1233 = -_1219;
    float _1235 = fma(_1207, _1231, _1233);
    float _1237 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1239 = -_1223;
    float _1241 = fma(_1203, _1237, _1239);
    float _1243 = _1181 * 6.283185482025146484375;
    float _1245 = cos(_1243);
    float _1247 = _1229 * _1229;
    float _1249 = _919 * _1113;
    float _1251 = fma(_1235, _1235, _1247);
    float _1253 = _1249 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1255 = _1253 * 0.5;
    float _1257 = _1201 * 6.283185482025146484375;
    float _1259 = cos(_1257);
    float _1261 = fma(_1241, _1241, _1251);
    float _1263 = _1137 * _1211;
    float _1265 = _1197 * _1211;
    float _1267 = _1201 * 6.283185482025146484375;
    float _1269 = sin(_1267);
    float _1271 = _1197 * _1245;
    float _1273 = _1137 * _1245;
    float _1275 = rsqrt(_1261);
    float _1277 = _1197 * _1259;
    float _1279 = _1245 * _1259;
    float _1281 = _445 * _1249;
    float _1283 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _1285 = _1137 * _1259;
    float _1287 = fma(_1269, _1271, _1263);
    float _1289 = fma(_1269, _1263, _1271);
    float _1291 = _1211 * _1259;
    float _1293 = -_1265;
    float _1295 = fma(_1269, _1273, _1293);
    float _1297 = _443 * _1249;
    float _1299 = -_1273;
    float _1301 = fma(_1269, _1265, _1299);
    float _1303 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1305 = _1283 * _1281;
    float _1307 = _1235 * _1275;
    float _1309 = _1229 * _1275;
    float _1311 = _1303 * _1297;
    float _1313 = _1277 * _1305;
    float _1315 = -_1305;
    float _1317 = _1269 * _1315;
    float _1319 = _1285 * _1305;
    float _1321 = _1241 * _1275;
    float _1323 = fma(_1287, _1311, _1313);
    float _1325 = _1205 * _1309;
    float _1327 = _1207 * _1307;
    float _1329 = fma(_1279, _1311, _1317);
    float _1331 = fma(_1301, _1255, _1323);
    float _1333 = -_1325;
    float _1335 = fma(_1207, _1321, _1333);
    float _1337 = -_1327;
    float _1339 = fma(_1203, _1309, _1337);
    float _1341 = fma(_1295, _1311, _1319);
    float _1343 = fma(_1291, _1255, _1329);
    float _1345 = _1335 * _1331;
    float _1347 = _1339 * _1331;
    float _1349 = fma(_1289, _1255, _1341);
    float _1351 = _1203 * _1321;
    float _1353 = fma(_1307, _1343, _1345);
    float _1355 = fma(_1321, _1343, _1347);
    float _1357 = _1277 * _1335;
    float _1359 = -_1351;
    float _1361 = fma(_1205, _1307, _1359);
    float _1363 = fma(_1203, _1349, _1353);
    float _1365 = fma(_1205, _1349, _1355);
    float _1367 = _1277 * _1339;
    float _1369 = _1361 * _1331;
    float _1371 = _787 + _1363;
    float _1373 = _815 + _1365;
    float _1375 = _1277 * _1361;
    float _1377 = _1287 * _1361;
    float _1379 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1381 = _1371 + _1379;
    float _1383 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1385 = _1373 + _1383;
    float _1387 = _1301 * _1361;
    float _1389 = fma(_1309, _1343, _1369);
    float _1391 = _1381 * _1381;
    float _1393 = _1385 * _1385;
    float _1395 = _1287 * _1335;
    float _1397 = fma(_1207, _1349, _1389);
    float _1399 = _1287 * _1339;
    float _1401 = _1391 + _1393;
    float _1403 = _1301 * _1335;
    float _1405 = _1301 * _1339;
    float _1407 = -_1269;
    float _1409 = fma(_1407, _1307, _1357);
    float _1411 = sqrt(_1401);
    float _1413 = -_1269;
    float _1415 = fma(_1413, _1309, _1375);
    float _1417 = _659 + _1397;
    float _1419 = -_1269;
    float _1421 = fma(_1419, _1321, _1367);
    float _1423 = fma(_1279, _1309, _1377);
    float _1425 = fma(_1291, _1307, _1403);
    float _1427 = fma(_1291, _1309, _1387);
    float _1429 = fma(_1291, _1321, _1405);
    float _1431 = fma(_1279, _1307, _1395);
    float _1433 = fma(_1285, _1203, _1409);
    float _1435 = fma(_1285, _1207, _1415);
    float _1437 = fma(_1279, _1321, _1399);
    float _1439 = fma(_1285, _1205, _1421);
    bool _1441 = _1411 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1443 = _1307;
    float _1445 = _1391;
    float _1447 = _1393;
    float _1449 = _1371;
    float _1451 = _1373;
    if (!_1441)
    {
        _1443 = _1391;
    }
    float _1453 = _1443;
    float _1455 = _1453;
    if (!_1441)
    {
        _1445 = _1417;
    }
    float _1457 = _1445;
    bool _1459 = !_1441;
    float _1461 = _1457;
    if (!_1459)
    {
        float _1463 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1465 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1467 = _1411 + _1465;
        float _1469 = rsqrt(_1401);
        float _1471 = _1467 * _1463;
        float _1473 = _1417 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1475 = _1471 * 0.15915493667125701904296875;
        float _1477 = _1475 * 6.283185482025146484375;
        float _1479 = sin(_1477);
        float _1481 = _1475 * 6.283185482025146484375;
        float _1483 = cos(_1481);
        float _1485 = fma(_1479, _1473, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1487 = _1469 * _1485;
        float _1489 = fma(_1381, _1487, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1491 = _1483 + (-1.0);
        float _1493 = fma(_1385, _1487, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1495 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1497 = _1489 + _1495;
        float _1499 = _1491 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1501 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1503 = _1493 + _1501;
        float _1505 = _1497 * _1497;
        float _1507 = fma(_1417, _1483, _1499);
        float _1509 = _1503 * _1503;
        _1461 = _1507;
        _1455 = _1505;
        _1447 = _1509;
        _1449 = _1489;
        _1451 = _1493;
    }
    float _1511 = _1461;
    float _1513 = _1455;
    float _1515 = _1447;
    float _1517 = _1449;
    float _1519 = _1451;
    float _1521 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1523 = _1511 + _1521;
    float _1525 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1527 = fma(_1295, _1203, _1431);
    float _1529 = fma(_1289, _1203, _1425);
    float _1531 = fma(_1523, _1523, _1513);
    float _1533 = fma(_1289, _1207, _1427);
    float _1535 = fma(_1289, _1205, _1429);
    float _1537 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1539 = _1531 + _1515;
    float _1541 = _1525 * _1433;
    float _1543 = fma(_1295, _1207, _1423);
    float _1545 = fma(_1295, _1205, _1437);
    float _1547 = _1525 * _1435;
    float _1549 = _1525 * _1439;
    float _1551 = sqrt(_1539);
    float _1553 = fma(_1537, _1527, _1541);
    float _1555 = fma(_1537, _1543, _1547);
    float _1557 = fma(_1537, _1545, _1549);
    float _1559 = _1529 + _1553;
    float _1561 = _1533 + _1555;
    float _1563 = _1535 + _1557;
    out.m_76.x = _1559;
    out.m_76.y = _1561;
    out.m_76.z = _1563;
    bool _1565 = _1551 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1567 = isnan(_1551);
    bool _1569 = _1565 || _1567;
    bool _1571 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1573 = _1569 || _1571;
    float _1575 = _1547;
    if (!_1573)
    {
        _1575 = 1.0;
    }
    float _1577 = _1575;
    bool _1579 = !_1573;
    float _1581 = _1577;
    if (!_1579)
    {
        bool _1583 = _1551 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1585 = isnan(_1551);
        bool _1587 = _1583 || _1585;
        bool _1589 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1591 = _1587 || _1589;
        if (!_1591)
        {
            float _1593 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1595 = _1551 + _1593;
            float _1597 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1599 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1597;
            float _1601 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1603 = _1601 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1605 = 1.0 / _1599;
            float _1607 = _1595 * _1605;
            float _1609 = fma(_1607, _1603, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1581 = _1609;
            _1611 = true;
        }
        else
        {
            bool _1613 = _1551 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1615 = isnan(_1551);
            bool _1617 = _1613 || _1615;
            bool _1619 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1621 = _1617 || _1619;
            if (!_1621)
            {
                float _1623 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1625 = _1551 + _1623;
                float _1627 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1629 = _1627 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1631 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1633 = _1631 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1635 = 1.0 / _1629;
                float _1637 = _1625 * _1635;
                float _1639 = fma(_1637, _1633, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1581 = _1639;
                _1611 = true;
            }
            else
            {
                _1581 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1611 = false;
    float _1641 = _1581;
    float _1643 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1645 = _1511 + _1643;
    float _1647 = _997 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1649 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1651 = _1517 + _1649;
    float _1653 = fma(_1645, _1641, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1655 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1647);
    float _1657 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1659 = _1519 + _1657;
    float _1661 = fma(_1651, _1641, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1663 = -_659;
    float _1665 = _1663 + _1653;
    float _1667 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1655);
    float _1669 = fma(_1659, _1641, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1671 = -_787;
    float _1673 = _1671 + _1661;
    float _1675 = _1665 * _1665;
    float _1677 = _1667 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1679 = -_815;
    float _1681 = _1679 + _1669;
    float _1683 = _997 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1685 = fma(_1673, _1673, _1675);
    float _1687 = 1.0 / _1677;
    float _1689 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1683);
    float _1691 = fma(_1681, _1681, _1685);
    float _1693 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1689);
    float _1695 = sqrt(_1691);
    float _1697 = _1693 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1699 = _1697 + _1677;
    float _1701 = _1699 * _1687;
    float _1703 = _1701 * 0.5;
    bool _1705 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1707 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1709 = _1705 || _1707;
    bool _1711 = isnan(0.5);
    bool _1713 = _1709 || _1711;
    bool _1715 = _1695 > 0.0;
    float _1717 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1719 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1717);
    bool _1721 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1723 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1725 = _1721 || _1723;
    bool _1727 = isnan(0.5);
    bool _1729 = _1725 || _1727;
    float _1731 = 1.0 / _1719;
    float _1733 = _1687;
    float _1735 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1737 = _1653;
    float _1739 = _1691;
    float _1741 = _1661;
    if (!_1715)
    {
        _1733 = _1661;
    }
    float _1743 = _1733;
    float _1745 = _1743;
    float _1747 = _1743;
    if (!_1715)
    {
        _1735 = _1669;
    }
    float _1749 = _1735;
    bool _1751 = !_1715;
    float _1753 = _1749;
    if (!_1751)
    {
        float _1755 = _205 * _205;
        float _1757 = fma(_203, _203, _1755);
        float _1759 = rsqrt(_1691);
        float _1761 = fma(_207, _207, _1757);
        float _1763 = sqrt(_1761);
        float _1765 = _1673 * _1759;
        float _1767 = _1665 * _1759;
        float _1769 = _1681 * _1759;
        bool _1771 = _1763 > 0.0;
        float _1773 = _1763;
        if (!_1771)
        {
            _1745 = _1661;
        }
        float _1775 = _1745;
        _1747 = _1775;
        if (!_1771)
        {
            _1773 = _1669;
        }
        float _1777 = _1773;
        bool _1779 = !_1771;
        _1753 = _1777;
        if (!_1779)
        {
            float _1781 = rsqrt(_1761);
            float _1783 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1785 = _205 * _1781;
            float _1787 = _203 * _1781;
            float _1789 = _1767 * _1785;
            float _1791 = _207 * _1781;
            float _1793 = fma(_1765, _1787, _1789);
            float _1795 = _1783 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1797 = fma(_1769, _1791, _1793);
            float _1799 = _1797 * _1795;
            float _1801 = fma(_203, _1799, _1661);
            float _1803 = fma(_205, _1799, _1653);
            float _1805 = fma(_207, _1799, _1669);
            _1747 = _1801;
            _1737 = _1803;
            _1753 = _1805;
            _1739 = _1783;
        }
    }
    float _1807 = _1747;
    float _1809 = _1737;
    float _1811 = _1753;
    float _1813 = _1739;
    float _1815 = -_985;
    float _1817 = fma(_1815, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1807);
    float _1819 = -_993;
    float _1821 = fma(_1819, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1809);
    float _1823 = -_999;
    float _1825 = fma(_1823, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1811);
    float _1827 = _1821;
    float _1829 = _1817;
    float _1831 = _1825;
    float _1833 = _1813;
    if (_1713)
    {
        _1741 = 1.0;
    }
    float _1835 = _1741;
    float _1837 = _1835;
    if (!_1729)
    {
        float _1839 = _1009 * _1009;
        float _1841 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1843 = -_815;
        float _1845 = _1843 + _1811;
        float _1847 = -_659;
        float _1849 = _1847 + _1809;
        float _1851 = fma(_1017, _1017, _1839);
        float _1853 = fma(_1025, _1025, _1851);
        float _1855 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1857 = sqrt(_1853);
        float _1859 = _1841 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1861 = 1.0 / _1249;
        float _1863 = precise::min(_1857, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1865 = _1863 * _1855;
        float _1867 = _1865 * _1861;
        float _1869 = -_787;
        float _1871 = _1869 + _1807;
        float _1873 = _1859 * _1867;
        float _1875 = _1845 * _1867;
        float _1877 = fma(_1849, _1873, _997);
        float _1879 = fma(_1871, _1873, _1003);
        float _1881 = fma(_1859, _1875, _1013);
        _1827 = _1877;
        _1829 = _1879;
        _1831 = _1881;
    }
    float _1883 = _1827;
    float _1885 = _1829;
    float _1887 = _1831;
    if (_1713)
    {
        _795 = 1.0;
    }
    float _1889 = _795;
    float _1891 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1893 = _1731 * _1891;
    float _1895 = _1889;
    if (!_1713)
    {
        float _1897 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1899 = _1897 * 0.15915493667125701904296875;
        float _1901 = _1899 * 6.283185482025146484375;
        float _1903 = cos(_1901);
        float _1905 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1907 = _1905 * 0.15915493667125701904296875;
        float _1909 = _1899 * 6.283185482025146484375;
        float _1911 = sin(_1909);
        float _1913 = 1.0 / _1903;
        float _1915 = _1907 * 6.283185482025146484375;
        float _1917 = cos(_1915);
        float _1919 = _1911 * _1913;
        float _1921 = _1907 * 6.283185482025146484375;
        float _1923 = sin(_1921);
        float _1925 = _1917 * _1919;
        float _1927 = 1.0 / _1925;
        float _1929 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1931 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1929;
        float _1933 = 1.0 / _1931;
        float _1935 = _1923 * _1927;
        float _1937 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1939 = fma(_1893, _1935, _1937);
        float _1941 = _1939 * _1933;
        float _1943 = precise::clamp(_1941, 0.0, 1.0);
        _211 = _1907;
        _1837 = _1943;
    }
    float _1945 = _211;
    float _1947 = _1837;
    if (!_1713)
    {
        float _1949 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1951 = _1949 * 0.15915493667125701904296875;
        float _1953 = _1951 * 6.283185482025146484375;
        float _1955 = cos(_1953);
        float _1957 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1959 = _1957 * 0.15915493667125701904296875;
        float _1961 = _1951 * 6.283185482025146484375;
        float _1963 = sin(_1961);
        float _1965 = 1.0 / _1955;
        float _1967 = _1959 * 6.283185482025146484375;
        float _1969 = cos(_1967);
        float _1971 = _1963 * _1965;
        float _1973 = _1959 * 6.283185482025146484375;
        float _1975 = sin(_1973);
        float _1977 = _1969 * _1971;
        float _1979 = 1.0 / _1977;
        float _1981 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1983 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1981;
        float _1985 = 1.0 / _1983;
        float _1987 = _1975 * _1979;
        float _1989 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1991 = fma(_1893, _1987, _1989);
        float _1993 = _1991 * _1985;
        float _1995 = precise::clamp(_1993, 0.0, 1.0);
        float _1997 = -_1995;
        float _1999 = _1997 + 1.0;
        _213 = _1979;
        _1895 = _1999;
    }
    float _2001 = _213;
    float _2003 = _1895;
    float _2005 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2007 = _1883 + _2005;
    float _2009 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2011 = _1885 + _2009;
    float _2013 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2015 = _1887 + _2013;
    float _2017 = _2007 * _2007;
    float _2019 = fma(_2011, _2011, _2017);
    float _2021 = fma(_2015, _2015, _2019);
    float _2023 = rsqrt(_2021);
    float _2025 = sqrt(_2021);
    float _2027 = _2023 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2029 = _2011 * _2027;
    float _2031 = _2015 * _2027;
    float _2033 = _2029 * _2029;
    float _2035 = _2031 * _2031;
    float _2037 = _2033 + _2035;
    float _2039 = sqrt(_2037);
    bool _2041 = _2039 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2043 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2045 = _2039 + _2043;
    float _2047 = _1945;
    float _2049 = _2037;
    float _2051 = _2045;
    float _2053 = _2007;
    float _2055 = _2029;
    if (_2041)
    {
        float _2057 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2047 = _2057;
    }
    float _2059 = _2047;
    if (_2041)
    {
        float _2061 = rsqrt(_2037);
        _2049 = _2061;
    }
    float _2063 = _2049;
    float _2065 = _2059;
    float _2067 = _2063;
    if (_2041)
    {
        float _2069 = _2045 * _2059;
        _2051 = _2069;
    }
    float _2071 = _2051;
    if (_2041)
    {
        float _2073 = _2071 * 0.15915493667125701904296875;
        _2065 = _2073;
    }
    float _2075 = _2065;
    float _2077 = _2015;
    float _2079 = _2075;
    if (_2041)
    {
        float _2081 = _2075 * 6.283185482025146484375;
        float _2083 = sin(_2081);
        _2077 = _2083;
    }
    float _2085 = _2077;
    float _2087 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2089 = precise::max(0.0, _2087);
    float _2091 = _2001;
    if (_2041)
    {
        float _2093 = _2075 * 6.283185482025146484375;
        float _2095 = cos(_2093);
        _2091 = _2095;
    }
    float _2097 = _2091;
    float _2099 = -_2027;
    float _2101 = -_2089;
    float _2103 = fma(_2007, _2099, _2101);
    float _2105 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_2041)
    {
        float _2107 = _2103 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2053 = _2107;
    }
    float _2109 = _2053;
    float _2111 = _2109;
    if (!_2041)
    {
        _2079 = _2103;
    }
    float _2113 = _2079;
    float _2115 = fma(_1003, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2117 = _2113;
    if (!_2041)
    {
        _1041 = _2035;
    }
    float _2119 = _1041;
    float _2121 = _2085;
    float _2123 = _2119;
    if (_2041)
    {
        float _2125 = fma(_2085, _2109, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2121 = _2125;
    }
    float _2127 = _2121;
    float _2129 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2105);
    float _2131 = _2127;
    if (_2041)
    {
        float _2133 = _2097 + (-1.0);
        _2111 = _2133;
    }
    float _2135 = _2111;
    float _2137 = _2135;
    if (_2041)
    {
        float _2139 = _2063 * _2127;
        _1833 = _2139;
    }
    float _2141 = _1833;
    if (!_2041)
    {
        _2067 = _2031;
    }
    float _2143 = _2067;
    float _2145 = fma(_1013, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2147 = _2143;
    if (_2041)
    {
        float _2149 = _2135 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2137 = _2149;
    }
    float _2151 = _2137;
    if (_2041)
    {
        float _2153 = _2029 * _2141;
        _2055 = _2153;
    }
    float _2155 = _2055;
    if (!_2041)
    {
        _2131 = _2033;
    }
    float _2157 = _2131;
    float _2159 = _2157;
    if (_2041)
    {
        float _2161 = _2031 * _2141;
        _2147 = _2161;
    }
    float _2163 = _2147;
    if (_2041)
    {
        float _2165 = fma(_2103, _2097, _2151);
        _2117 = _2165;
    }
    float _2167 = _2117;
    if (_2041)
    {
        float _2169 = _2155 * _2155;
        _2159 = _2169;
    }
    float _2171 = _2159;
    float _2173 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_2041)
    {
        float _2175 = _2163 * _2163;
        _2123 = _2175;
    }
    float _2177 = _2123;
    float _2179 = fma(_2167, _2167, _2171);
    float _2181 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2173);
    float _2183 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2185 = floor(_2115);
    float _2187 = _2179 + _2177;
    float _2189 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2181);
    float _2191 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2193 = fma(_2025, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2191);
    float _2195 = precise::clamp(_2193, 0.0, 1.0);
    float _2197 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2183);
    float _2199 = _2189 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2201 = rsqrt(_2187);
    float _2203 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2205 = _2199 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2207 = -_2195;
    float _2209 = _2207 + 1.0;
    float _2211 = -_2205;
    float _2213 = fma(_2211, _2203, 1.0);
    float _2215 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2217 = floor(_2145);
    float _2219 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2215);
    float _2221 = _2201 * _2155;
    float _2223 = _2201 * _2167;
    float _2225 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2197);
    float _2227 = abs(_2209);
    float _2229 = log2(_2227);
    float _2231 = _2221 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2233 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2219);
    float _2235 = _2225 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2237 = _2201 * _2163;
    float _2239 = -_2231;
    float _2241 = fma(_2223, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2239);
    float _2243 = _2233 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2245 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2247 = -_2185;
    float _2249 = _2115 + _2247;
    float _2251 = -_2237;
    float _2253 = fma(_2251, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2241);
    float _2255 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2129);
    float _2257 = fma(_2243, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2245);
    float _2259 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2261 = fma(_2253, -0.5, 0.5);
    float _2263 = _2255 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2265 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2257);
    float _2267 = _2229 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2269 = log2(_2213);
    float _2271 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2273 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2265);
    float _2275 = fma(_2243, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2259);
    float _2277 = fma(_2253, 0.5, 0.5);
    float _2279 = fma(_2243, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2271);
    float _2281 = -_2217;
    float _2283 = _2145 + _2281;
    float _2285 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2275);
    float _2287 = exp2(_2267);
    float _2289 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2279);
    float _2291 = fma(_2277, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2293 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2285);
    float _2295 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2289);
    float _2297 = fma(_2277, _2291, -0.212114393711090087890625);
    float _2299 = 1.0 / _2273;
    float _2301 = _2269 * 0.693147182464599609375;
    float _2303 = sqrt(_2261);
    float2 _6422 = float2(_2249, _2283);
    float _2305 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6422, float2(0.0), isnan(_6422)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6422, float2(0.0), isnan(_6422)), level(0.0)).x;
    float _2307 = fma(_2277, _2297, 1.570728778839111328125);
    float _2309 = _2301 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2311 = _2293 * _2299;
    float _2313 = _2223 + 1.0;
    float _2315 = fma(_2311, 0.5, 0.5);
    float _2317 = -_2223;
    float _2319 = fma(_2287, _2313, _2317);
    float _2321 = _2295 * _2299;
    float _2323 = _2303 * 0.636619746685028076171875;
    float _2325 = fma(_2319, 0.5, 0.5);
    float _2327 = fma(_2321, -0.5, 0.5);
    float _2329 = -_2307;
    float _2331 = fma(_2323, _2329, 1.0);
    float3 _6469 = float3(_2315, _2327, _2309);
    float _2333 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6469, float3(0.0), isnan(_6469)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6469, float3(0.0), isnan(_6469)), level(0.0)).x;
    float3 _6480 = float3(_2315, _2327, _2309);
    float4 _2336 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6480, float3(0.0), isnan(_6480)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6480, float3(0.0), isnan(_6480)), level(0.0)).xyzw;
    float _2338 = _2336.x;
    float _2340 = _2336.y;
    float _2342 = _2336.z;
    float _2344 = _2336.w;
    float2 _6496 = float2(_2331, _2325);
    float3 _2348 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6496, float2(0.0), isnan(_6496)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6496, float2(0.0), isnan(_6496)), level(0.0)).xyz;
    float _2350 = _2348.x;
    float _2352 = _2348.y;
    float _2354 = _2348.z;
    float _2356 = abs(_1893);
    float _2358 = log2(_2356);
    float _2360 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2362 = _2025 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2364 = isnan(_2025);
    bool _2366 = _2362 || _2364;
    bool _2368 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2370 = _2366 || _2368;
    float _2372 = fma(_2243, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2360);
    float _2374 = _2229 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2376 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2372);
    float _2378 = exp2(_2374);
    float _2380 = in.m_78.x;
    float _2382 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2376);
    float _2384 = _2358 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2386 = _1893 <= 8000.0;
    bool _2388 = isnan(_1893);
    bool _2390 = _2386 || _2388;
    bool _2392 = isnan(8000.0);
    bool _2394 = _2390 || _2392;
    float _2396 = float(_2394);
    float _2398 = _2273 * 0.5;
    float _2400 = _2382 + _2273;
    float _2402 = _2293 + _2273;
    out.gl_Position.x = _2293;
    out.gl_Position.y = _2295;
    out.gl_Position.z = _2382;
    out.gl_Position.w = _2273;
    float _2404 = exp2(_2384);
    float _2406 = fma(_2295, -0.5, _2398);
    float _2408 = _2400 * 0.5;
    float _2410 = _2402 * 0.5;
    float _2412 = -_2378;
    float _2414 = _2412 + 1.0;
    float _2416 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2418 = _1947 * _2003;
    float _2420 = _2382;
    float _2422 = _2295;
    float _2424 = _2273;
    float _2426 = _2293;
    if (!_2370)
    {
        _2420 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2428 = _2420;
    float _2430 = _2428;
    float _2432 = _2428;
    if (!_2370)
    {
        _2422 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2434 = _2422;
    float _2436 = fma(_2404, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2438 = precise::clamp(_2436, 0.0, 1.0);
    float _2440 = _2434;
    float _2442 = _2434;
    if (!_2370)
    {
        _2424 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2444 = _2424;
    float _2446 = fma(_2438, -2.0, 3.0);
    float _2448 = _2438 * _2438;
    out.m_80.x = _2410;
    out.m_80.y = _2406;
    out.m_80.z = _2408;
    out.m_80.w = _2273;
    float _2450 = _2444;
    float _2452 = _2444;
    if (!_2370)
    {
        _2426 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2454 = _2426;
    float _2456 = _2448 * _2446;
    float _2458 = -_2456;
    float _2460 = _2458 + 1.0;
    float _2462 = fma(_2460, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2456);
    float _2464 = _2396 * _2462;
    float _2466 = _2464 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2468 = -_2305;
    float _2470 = _2468 + 1.0;
    float _2472 = _2470 * _2466;
    float _2474 = precise::clamp(_2472, 0.0, 1.0);
    float _2476 = -_2474;
    float _2478 = fma(_2476, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2480 = _2478 * _2380;
    float _2482 = _2416 * _2333;
    float _2484 = -_2416;
    float _2486 = _2484 + 1.0;
    float _2488 = _2344 * _2482;
    float _2490 = _2354 * _2482;
    float _2492 = _2344 * _2486;
    float _2494 = _2486;
    float _2496 = _2480;
    float _2498 = _2454;
    float _2500 = _2454;
    if (!_2370)
    {
        _2494 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2502 = _2494;
    float _2504 = fma(_2350, _2488, _2338);
    float _2506 = fma(_2352, _2488, _2340);
    float _2508 = _2480 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2510 = fma(_2344, _2490, _2342);
    float _2512 = _2502;
    float _2514 = _2502;
    if (!_2370)
    {
        _2496 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2516 = _2496;
    out.m_82.x = _2508;
    out.m_84.x = _2504;
    out.m_84.y = _2506;
    out.m_84.z = _2510;
    out.m_84.w = _2492;
    bool _2518 = !_2370;
    float _2520 = _2516;
    float _2522 = _2516;
    if (!_2518)
    {
        bool _2524 = _2025 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2526 = isnan(_2025);
        bool _2528 = _2524 || _2526;
        bool _2530 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2532 = _2528 || _2530;
        if (!_2532)
        {
            float _2534 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2536 = _2025 + _2534;
            float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2540 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2538;
            float _2542 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2544 = _2542 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2546 = 1.0 / _2540;
            float _2548 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2550 = _2548 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2554 = _2552 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2560 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2562 = _2560 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2564 = _2536 * _2546;
            float _2566 = precise::clamp(_2564, 0.0, 1.0);
            float _2568 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2570 = _2568 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2572 = fma(_2566, _2544, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2574 = fma(_2566, _2570, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2576 = fma(_2566, _2550, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2578 = fma(_2566, _2554, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2580 = fma(_2566, _2558, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2582 = fma(_2566, _2562, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2514 = _2576;
            _2442 = _2580;
            _2522 = _2572;
            _2432 = _2578;
            _2452 = _2574;
            _2500 = _2582;
            _2584 = true;
        }
        else
        {
            bool _2586 = _2025 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2588 = isnan(_2025);
            bool _2590 = _2586 || _2588;
            bool _2592 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2594 = _2590 || _2592;
            if (!_2594)
            {
                _2520 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2596 = _2520;
            _2522 = _2596;
            if (!_2594)
            {
                _2512 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2598 = _2512;
            _2514 = _2598;
            if (!_2594)
            {
                _2450 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2600 = _2450;
            _2452 = _2600;
            if (!_2594)
            {
                _2430 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2602 = _2430;
            _2432 = _2602;
            if (!_2594)
            {
                _2440 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2604 = _2440;
            _2442 = _2604;
            if (!_2594)
            {
                _2498 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2606 = _2498;
            bool _2608 = !_2594;
            _2500 = _2606;
            if (!_2608)
            {
                bool _2610 = _2025 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2612 = isnan(_2025);
                bool _2614 = _2610 || _2612;
                bool _2616 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2618 = _2614 || _2616;
                if (!_2618)
                {
                    float _2620 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2622 = _2025 + _2620;
                    float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2626 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2624;
                    float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2630 = _2628 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2632 = 1.0 / _2626;
                    float _2634 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2636 = _2634 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2642 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2644 = _2642 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2648 = _2646 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2650 = _2622 * _2632;
                    float _2652 = precise::clamp(_2650, 0.0, 1.0);
                    float _2654 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2656 = _2654 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2658 = fma(_2652, _2630, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2660 = fma(_2652, _2656, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2662 = fma(_2652, _2636, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2664 = fma(_2652, _2640, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2666 = fma(_2652, _2644, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2668 = fma(_2652, _2648, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2514 = _2662;
                    _2442 = _2666;
                    _2522 = _2658;
                    _2432 = _2664;
                    _2452 = _2660;
                    _2500 = _2668;
                    _2584 = true;
                }
                else
                {
                    _2514 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2442 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2522 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2432 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2452 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2500 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2584 = false;
    float _2670 = _2514;
    float _2672 = _2442;
    float _2674 = _2522;
    float _2676 = _2432;
    float _2678 = _2452;
    float _2680 = _2500;
    float _2682 = _2418 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2684 = fma(_1561, -0.5, 0.5);
    float _2686 = precise::clamp(_2684, 0.0, 1.0);
    float _2688 = -_2670;
    float _2690 = _2688 + _2672;
    float _2692 = -_2674;
    float _2694 = _2692 + _2676;
    out.m_51.x = _2682;
    float _2696 = fma(_2686, _2690, _2670);
    float _2698 = -_2678;
    float _2700 = _2698 + _2680;
    float _2702 = fma(_2686, _2694, _2674);
    float _2704 = _2696 * 0.586610972881317138671875;
    bool _2706 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2708 = fma(_2686, _2700, _2678);
    out.m_86.x = 0.0;
    float _2710 = fma(_2702, 0.298911988735198974609375, _2704);
    bool _2712 = _1947 > 0.0;
    bool _2714 = isnan(_1947);
    bool _2716 = _2712 || _2714;
    bool _2718 = isnan(0.0);
    bool _2720 = _2716 || _2718;
    float _2722 = fma(_2708, 0.114477999508380889892578125, _2710);
    bool _2724 = _2003 <= 0.0;
    bool _2726 = !_2720;
    bool _2728 = _2724 || _2726;
    float _2730 = -_2722;
    float _2732 = _2702 + _2730;
    float _2734 = -_2722;
    float _2736 = _2696 + _2734;
    float _2738 = -_2722;
    float _2740 = _2708 + _2738;
    float _2742 = fma(_2732, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2722);
    float _2744 = fma(_2736, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2722);
    float _2746 = fma(_2740, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2722);
    bool _2748 = !_2706;
    if (!_2748)
    {
        float _2750 = -_1883;
        float _2752 = _2750 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2754 = -_1885;
        float _2756 = _2754 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2758 = -_1887;
        float _2760 = _2758 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2762 = _2752 * _2752;
        float _2764 = fma(_2756, _2756, _2762);
        float _2766 = fma(_2760, _2760, _2764);
        float _2768 = sqrt(_2766);
        float _2770 = rsqrt(_2766);
        float _2772 = -_2768;
        float _2774 = _2772 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2776 = _2774 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2778 = precise::clamp(_2776, 0.0, 1.0);
        float _2780 = _2756 * _2770;
        float _2782 = _2752 * _2770;
        float _2784 = abs(_2778);
        float _2786 = log2(_2784);
        float _2788 = _2760 * _2770;
        float _2790 = _2780 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2792 = _1561 * _2782;
        float _2794 = -_2782;
        float _2796 = -_2790;
        float _2798 = fma(_2794, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2796);
        float _2800 = fma(_1559, _2780, _2792);
        float _2802 = -_2788;
        float _2804 = fma(_2802, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2798);
        float _2806 = fma(_1563, _2788, _2800);
        float _2808 = precise::clamp(_2806, 0.0, 1.0);
        float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2812 = _2804 + _2810;
        float _2814 = _2786 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2816 = _2812 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2818 = precise::clamp(_2816, 0.0, 1.0);
        float _2820 = exp2(_2814);
        float _2822 = _2820 * _2818;
        float _2824 = _2808 * _2822;
        float _2826 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2828 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2830 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _2826;
        out.m_86.y = _2828;
        out.m_86.z = _2830;
    }
    out.m_88.x = _2742;
    out.m_88.y = _2744;
    out.m_88.z = _2746;
    if (!_2728)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2832 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2832;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

