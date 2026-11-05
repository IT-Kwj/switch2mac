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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    texture2d<float> vp_t_tcb_20 [[id(14)]];
    sampler vp_t_tcb_20Smplr [[id(15)]];
    sampler vp_t_tcb_24Smplr_w [[id(16)]];
    sampler vp_t_tcb_32Smplr_w [[id(17)]];
    sampler vp_t_tcb_30Smplr_w [[id(18)]];
    sampler vp_t_tcb_1CSmplr_w [[id(19)]];
    sampler vp_t_tcb_20Smplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_62 [[user(locn0)]];
    float4 m_70 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_80 [[user(locn3)]];
    float4 m_90 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_64 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_78 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 m_86 [[user(locn11)]];
    float4 m_82 [[user(locn12)]];
    float4 m_84 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_74 [[attribute(0)]];
    float4 m_66 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_58 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2356 = false;
    bool _549 = false;
    bool _399 = false;
    bool _205 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_48.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_51.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2655 = as_type<float>(_125);
        out.gl_Position.z = _2655;
    }
    if (!_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_53.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_109);
        _119 = _147;
    }
    float _149 = _119;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_51.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2725 = as_type<float>(_163);
        out.gl_Position.z = _2725;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _169 = as_type<int>(_165) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_165) & 2;
    bool _175 = _173 != 0;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_167;
    float _203;
    if (!_185)
    {
        float _187 = in.m_58.x;
        float _189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _191 = _187 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _195 = _193 * _189;
        float _197 = floor(_195);
        float _199 = -_197;
        float _201 = _195 + _199;
        _203 = _201;
        _205 = true;
    }
    else
    {
        float _207 = float(_109);
        float _209 = 1.0 / _207;
        float _211 = _143 * _209;
        _203 = _211;
    }
    _205 = false;
    float _213 = _203;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _217 = _213 + _215;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _221 = _213 + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _225 = _213 + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _233 = _231 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _235;
    bool _239 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _241 = isnan(_213);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = 1.0 / _229;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _255 = 1.0 / _237;
    float _257 = 1.0 / _233;
    float _259 = _217 * _251;
    bool _261 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _263 = isnan(_213);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = -_249;
    float _275 = _273 + 1.0;
    float _277 = _271 * _275;
    float _279 = _221 * _255;
    bool _281 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _283 = isnan(_213);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = -_271;
    float _295 = _293 + 1.0;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _299 = _297 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _301 = _291 * _295;
    float _303 = -_291;
    float _305 = _303 + 1.0;
    float _307 = _225 * _257;
    bool _309 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _311 = isnan(_213);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _321;
    float _325 = fma(_299, _307, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _335 = fma(_323, _259, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _337 = _319 * _305;
    float _339 = fma(_329, _259, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _341 = fma(_333, _307, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _343 = -_319;
    float _345 = _343 + 1.0;
    float _347 = _335 * _337;
    float _349 = _339 * _337;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _351;
    float _355 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[143].x, _347);
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _357;
    float _361 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[143].y, _349);
    float _363 = fma(_353, _279, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _365 = fma(_325, _301, _355);
    float _367 = fma(_359, _279, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _369 = fma(_341, _301, _361);
    float _371 = fma(_363, _277, _365);
    float _373 = fma(_367, _277, _369);
    float _375 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[146].x, _371);
    float _377 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[146].y, _373);
    bool _379 = !_253;
    float _397;
    if (!_379)
    {
        float _381 = in.m_58.x;
        float _383 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _385 = _381 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _387 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _389 = _387 * _383;
        float _391 = floor(_389);
        float _393 = -_391;
        float _395 = _389 + _393;
        _397 = _395;
        _399 = true;
    }
    else
    {
        float _401 = float(_109);
        float _403 = 1.0 / _401;
        float _405 = _143 * _403;
        _397 = _405;
    }
    _399 = false;
    float _407 = _397;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _411 = _407 + _409;
    float _413 = in.m_60.x;
    float _415 = in.m_60.y;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _421 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _423 = isnan(_407);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _437 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _439 = isnan(_407);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _449;
    bool _453 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _455 = isnan(_407);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _461 = _457 || _459;
    float _463 = float(_461);
    float _465 = 1.0 / _419;
    float _467 = -_431;
    float _469 = _467 + 1.0;
    bool _471 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _473 = _447 * _469;
    float _475 = -_447;
    float _477 = _475 + 1.0;
    float _479 = 1.0 / _435;
    float _481 = _451 * _465;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _487 = _377 * _415;
    float _489 = fma(_481, _411, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _491 = _485 * _479;
    float _493 = _489 * _473;
    float _495 = -_463;
    float _497 = _495 + 1.0;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _501 = _407 + _499;
    float _503 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[115].x, _493);
    float _505 = _431 * _497;
    float _507 = fma(_491, _501, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _511 = _375 * _413;
    float _513 = fma(_507, _505, _503);
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _517 = _509 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _519 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[117].x, _513);
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _523 = _515 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _525 = _519 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _527 = _521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _517;
    out.m_62.y = _527;
    out.m_62.z = _523;
    out.m_62.w = _525;
    bool _529 = !_471;
    float _547;
    if (!_529)
    {
        float _531 = in.m_58.x;
        float _533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _535 = _531 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _537 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[11].w, _143);
        float _539 = _537 * _533;
        float _541 = floor(_539);
        float _543 = -_541;
        float _545 = _539 + _543;
        _547 = _545;
        _549 = true;
    }
    else
    {
        float _551 = float(_109);
        float _553 = 1.0 / _551;
        float _555 = _143 * _553;
        _547 = _555;
    }
    _549 = false;
    float _557 = _547;
    float _559 = in.m_58.x;
    float _561 = in.m_58.y;
    float _563 = in.m_58.z;
    float _565 = in.m_58.w;
    float _567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _569 = in.m_48.x;
    float _571 = in.m_48.y;
    float _573 = in.m_48.z;
    int _575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _577 = _575 != 0;
    int _579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _581 = _579 != 0;
    int _583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _585 = _583 != 0;
    float _587 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _591 = _589 != 0;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _597 = _559 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _599 = _559 > 0.5;
    float _601 = _561 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _603 = _565 > 0.5;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _609 = -_179;
    int _611 = _599 ? as_type<int>(_609) : as_type<int>(_179);
    float _613 = _571 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _617 = _615 != 0;
    int _619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _621 = _619 != 0;
    float _623 = 1.0 / _607;
    float _625 = -_593;
    float _627 = fma(_597, 2.0, _625);
    bool _629 = !_577;
    float _631 = _629 ? _179 : as_type<float>(_611);
    float _633 = _571 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _635 = _561 > 0.5;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _641 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[5].x, _613);
    float _643 = fma(_601, -2.0, _595);
    float _645 = -_183;
    int _647 = _635 ? as_type<int>(_645) : as_type<int>(_183);
    float _649 = _559 * 2.0;
    float _651 = 1.0 / _639;
    bool _653 = !_581;
    float _655 = _653 ? _183 : as_type<float>(_647);
    float _657 = _563 * 2.0;
    int _659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _661 = _659 != 0;
    float _663 = _571 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _669;
    float _673 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[6].x, _633);
    float _675 = floor(_657);
    float _677 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[4].x, _663);
    float _679 = _671 * _623;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _685 = -_179;
    int _687 = _635 ? as_type<int>(_685) : as_type<int>(_179);
    float _689 = _561 + _563;
    bool _691 = _563 > 0.5;
    float _693 = _561 * 2.0;
    float _695 = 1.0 / _667;
    float _697 = _683 * _651;
    float _699 = _689 + (-1.0);
    float _701 = -_179;
    int _703 = _691 ? as_type<int>(_701) : as_type<int>(_179);
    float _705 = -_143;
    float _707 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[76].x, _627);
    float _709 = -_183;
    float _711 = _691 ? _709 : _183;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _713;
    float _717 = floor(_649);
    float _719 = _561 + _559;
    bool _721 = _675 > 0.0;
    float _723 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _725 = !_617;
    float _727 = _725 ? _179 : as_type<float>(_687);
    float _729 = _719 + (-1.0);
    bool _731 = _675 >= 0.0;
    bool _733 = isnan(_675);
    bool _735 = _731 || _733;
    bool _737 = isnan(0.0);
    bool _739 = _735 || _737;
    float _741 = _631 + 0.5;
    float _743 = _715 * _695;
    float _745 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _747 = !_621;
    float _749 = _747 ? _183 : _711;
    float _751 = floor(_693);
    int _753 = _739 ? 0 : 1;
    float _755 = fma(_573, (*spvDescriptorSet0.vp_c10)._m0[5].z, _641);
    float _757 = fma(_573, (*spvDescriptorSet0.vp_c10)._m0[6].z, _673);
    float _759 = _711;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    int _763 = as_type<int>(_745);
    if (!_661)
    {
        _759 = _563;
    }
    float _765 = _759;
    float _767 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _643);
    bool _769 = _717 > 0.0;
    float _771 = _655 + (-0.5);
    bool _773 = _717 >= 0.0;
    bool _775 = isnan(_717);
    bool _777 = _773 || _775;
    bool _779 = isnan(0.0);
    bool _781 = _777 || _779;
    float _783 = fma(_573, (*spvDescriptorSet0.vp_c10)._m0[4].z, _677);
    int _785 = ~_753;
    int _787 = _785 + 1;
    int _789 = _787 + 1;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _793 = _557 + _791;
    int _795 = _789;
    float _797 = _765;
    if (!_721)
    {
        int _799 = ~_753;
        int _801 = _799 + 1;
        _795 = _801;
    }
    int _803 = _795;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _807 = _557 + _805;
    int _809 = _781 ? 0 : 1;
    float _811 = fma(_679, _793, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _813 = fma(_697, _807, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _815 = ~_809;
    int _817 = _815 + 1;
    int _819 = _817 + 1;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _823 = _557 + _821;
    int _825 = _819;
    if (!_769)
    {
        int _827 = ~_809;
        int _829 = _827 + 1;
        _825 = _829;
    }
    int _831 = _825;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _835 = _557 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _837 = isnan(_557);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _843 = _839 || _841;
    float _845 = float(_843);
    float _847 = fma(_743, _823, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _849 = _751 >= 0.0;
    bool _851 = isnan(_751);
    bool _853 = _849 || _851;
    bool _855 = isnan(0.0);
    bool _857 = _853 || _855;
    float _859 = -_749;
    float _861 = _859 + 0.5;
    if (_661)
    {
        _797 = _561;
    }
    float _863 = _797;
    float _865 = -_845;
    float _867 = _865 + 1.0;
    bool _869 = _751 > 0.0;
    float _871 = _755 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _873 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[83].w, _833);
    bool _875 = _557 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _877 = isnan(_557);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _883 = _879 || _881;
    float _885 = float(_883);
    float _887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _889 = _871;
    if (!_661)
    {
        _761 = _561;
    }
    float _891 = _761;
    float _893 = _861 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _895 = 0.0;
    float _897 = _891;
    if (!_661)
    {
        _895 = _563;
    }
    float _899 = _895;
    float _901 = _885 * _867;
    float _903 = _899;
    if (_661)
    {
        _897 = _559;
    }
    float _905 = _897;
    float _907 = -_885;
    float _909 = _907 + 1.0;
    if (_661)
    {
        _903 = _561;
    }
    float _911 = _903;
    float _913 = _783 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _915 = _857 ? 0 : 1;
    float _917 = _757 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _921 = _919 != 0;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _925 = _923 != 0;
    int _927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _929 = _927 != 0;
    float _931 = _911 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _933 = _557 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _935 = isnan(_557);
    bool _937 = _933 || _935;
    bool _939 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _941 = _937 || _939;
    float _943 = float(_941);
    float _945 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _873);
    bool _947 = _557 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _949 = isnan(_557);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _955 = _951 || _953;
    float _957 = float(_955);
    float _959 = _567 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _961 = _587 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _963 = -_943;
    float _965 = _963 + 1.0;
    float _967 = _887 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _969 = fma(_959, _741, _707);
    float _971 = _957 * _909;
    float _973 = -_961;
    float _975 = -_767;
    float _977 = fma(_973, _771, _975);
    float _979 = _811 * _971;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _983 = -_957;
    float _985 = _983 + 1.0;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _989 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _991 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[83].z, _981);
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _995 = _905 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _997 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[131].x, _979);
    float _999 = _845 * _965;
    float _1001 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _991);
    float _1003 = -_993;
    float _1005 = fma(_995, 2.0, _1003);
    float _1007 = fma(_931, -2.0, _987);
    float _1009 = -_183;
    int _1011 = _603 ? as_type<int>(_1009) : as_type<int>(_183);
    float _1013 = fma(_813, _901, _997);
    bool _1015 = !_591;
    float _1017 = _1015 ? _179 : as_type<float>(_703);
    float _1019 = -_143;
    float _1021 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1005);
    bool _1023 = !_585;
    float _1025 = _1023 ? _183 : as_type<float>(_1011);
    float _1027 = _727 + 0.5;
    float _1029 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1031 = _1017 + 0.5;
    float _1033 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1007);
    float _1035 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1037 = fma(_847, _999, _1013);
    float _1039 = fma(_967, _1031, _1021);
    float _1041 = _1025 + (-0.5);
    float _1043 = _1035 * _989;
    float _1045 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1047 = log2(_1045);
    float _1049 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1051 = _917 + _1049;
    float _1053 = -_945;
    float _1055 = _1053 + 1.0;
    bool _1057 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1059 = isnan(0.0);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1065 = _1061 || _1063;
    float _1067 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1069 = ~_915;
    int _1071 = _1069 + 1;
    int _1073 = _1071 + 1;
    float _1075 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1079 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1067);
    float _1081 = _1029 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1083 = _1073;
    if (!_869)
    {
        int _1085 = ~_915;
        int _1087 = _1085 + 1;
        _1083 = _1087;
    }
    int _1089 = _1083;
    float _1091 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1077);
    float _1093 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1079);
    float _1095 = -_1081;
    float _1097 = -_1033;
    float _1099 = fma(_1095, _1041, _1097);
    float _1101 = _1047 * _143;
    float _1103 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1037);
    float _1105 = -_1093;
    float _1107 = _1105 + 1.0;
    float _1109 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1111 = _871 + _1109;
    float _1113 = -_1001;
    float _1115 = _1113 + 1.0;
    float _1117 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1119 = _913 + _1117;
    float _1121 = -_1107;
    float _1123 = fma(_631, _1121, _969);
    float _1125 = exp2(_1101);
    float _1127 = _893 * _1075;
    float _1129 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1131 = -_1115;
    float _1133 = fma(_1017, _1131, _1039);
    float _1135 = _1111 * _1111;
    bool _1137 = !_921;
    int _1139 = _1137 ? 0 : 1;
    float _1141 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1129);
    bool _1143 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1145 = isnan(1.0);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1151 = _1147 || _1149;
    out.m_64.x = _1043;
    out.m_64.y = _1127;
    int _1153 = abs(_1139);
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1157 = 1.0 + _1155;
    float _1159 = fma(_1119, _1119, _1135);
    float _1161 = in.m_66.x;
    float _1163 = in.m_66.y;
    float _1165 = in.m_66.z;
    float _1167 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1141);
    float _1169 = 1.0 / _1157;
    float _1171 = fma(_1051, _1051, _1159);
    bool _1173 = !_925;
    int _1175 = _1173 ? 0 : 1;
    float _1177 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1091);
    float _1179 = float(_803);
    float _1181 = -_1125;
    float _1183 = _1181 + 1.0;
    float _1185 = -_1177;
    float _1187 = _1185 + 1.0;
    bool _1189 = _1167 >= 0.0;
    float _1191 = rsqrt(_1171);
    int _1193 = abs(_1175);
    float _1195 = fma(_655, _1187, _977);
    float _1197 = float(_831);
    float _1199 = fma(_1025, _1055, _1099);
    float _1201 = float(_1153);
    float _1203 = _1103 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1205 = _1065 ? _1183 : 0.0;
    float _1207 = _1201 * _1179;
    float _1209 = _1169;
    if (_1151)
    {
        float _1211 = _1205 * _1169;
        _145 = _1211;
    }
    float _1213 = _145;
    float _1215 = _1207 * (-2.0);
    float _1217 = float(_1193);
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    if (_1189)
    {
        _1209 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1221 = _1209;
    float _1223 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1225 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1227 = fma(_745, _1215, _745);
    float _1229 = _1217 * _1197;
    float _1231 = fma(_1215, _1161, _1161);
    float _1233 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1235 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1237 = _1225 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1189)
    {
        float _1239 = _1221 * 5.0;
        _763 = as_type<int>(_1239);
    }
    int _1241 = _763;
    float _1243 = _1111 * _1191;
    out.m_68.x = _1123;
    out.m_68.y = _1195;
    out.m_68.z = _1133;
    out.m_68.w = _1199;
    float _1245 = _1229 * (-2.0);
    float _1247 = -_1243;
    float _1249 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1111);
    out.m_70.x = _1233;
    out.m_70.y = _1235;
    out.m_70.z = _1237;
    out.m_70.w = _1203;
    float _1251 = fma(_723, _1245, _723);
    float _1253 = fma(_1245, _1163, _1163);
    float _1255 = _1249 * _1249;
    if (_1189)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4484 = as_type<float>(_1241);
        out.gl_Position.z = _4484;
    }
    if (_1189)
    {
        out.m_51.x = 0.0;
    }
    float _1257 = _1119 * _1191;
    bool _1259 = !_929;
    int _1261 = _1259 ? 0 : 1;
    float _1263 = -_1257;
    float _1265 = fma(_1263, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1119);
    if (_1189)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1267 = -_1243;
    float _1269 = fma(_1267, (*spvDescriptorSet0.vp_c9)._m0[18].w, _871);
    float _1271 = -_1257;
    float _1273 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[18].w, _913);
    float _1275 = _1051 * _1191;
    float _1277 = _559 + (-0.5);
    float _1279 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1281 = _1269 + _1279;
    float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1285 = _1273 + _1283;
    int _1287 = abs(_1261);
    float _1289 = fma(_1277, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1231);
    float _1291 = _1281 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1293 = -_1275;
    float _1295 = fma(_1293, (*spvDescriptorSet0.vp_c9)._m0[18].w, _917);
    float _1297 = _561 + (-0.5);
    float _1299 = fma(_1227, _1213, _1289);
    float _1301 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1291);
    float _1303 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1305 = _1295 + _1303;
    float _1307 = float(_1089);
    float _1309 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1253);
    float _1311 = fma(_1265, _1265, _1255);
    float _1313 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1301);
    float _1315 = _1299 * 0.15915493667125701904296875;
    float _1317 = -_1275;
    float _1319 = fma(_1317, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1051);
    float _1321 = _563 + _559;
    float _1323 = float(_1287);
    float _1325 = fma(_1251, _1213, _1309);
    bool _1327 = _1313 >= 0.0;
    float _1329 = fma(_1319, _1319, _1311);
    float _1331 = _1323 * _1307;
    float _1333 = _1321 + (-1.0);
    float _1335 = _1325 * 0.15915493667125701904296875;
    float _1337 = sqrt(_1329);
    float _1339 = _1331 * (-2.0);
    float _1341 = fma(_1333, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1343 = _563 + (-0.5);
    float _1345 = fma(_1339, _1165, _1165);
    float _1347 = fma(_1341, _1339, _1341);
    float _1349 = _1331;
    int _1351 = as_type<int>(_1343);
    if (_1327)
    {
        _1349 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1353 = _1349;
    float _1355 = _1315 * 6.283185482025146484375;
    float _1357 = sin(_1355);
    float _1359 = fma(_1343, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1345);
    if (_1327)
    {
        out.m_51.x = 0.0;
    }
    if (_1327)
    {
        float _1361 = _1353 * 5.0;
        _1351 = as_type<int>(_1361);
    }
    int _1363 = _1351;
    float _1365 = fma(_1347, _1213, _1359);
    float _1367 = _1315 * 6.283185482025146484375;
    float _1369 = cos(_1367);
    if (_1327)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4687 = as_type<float>(_1363);
        out.gl_Position.z = _4687;
    }
    float _1371 = _1365 * 0.15915493667125701904296875;
    float _1373 = _1335 * 6.283185482025146484375;
    float _1375 = sin(_1373);
    float _1377 = _1335 * 6.283185482025146484375;
    float _1379 = cos(_1377);
    float _1381 = _1369;
    if (_1327)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1383 = _1371 * 6.283185482025146484375;
    float _1385 = cos(_1383);
    float _1387 = _1191 * _1337;
    float _1389 = _487 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1391 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _1393 = _1357 * _1375;
    float _1395 = _1369 * _1379;
    float _1397 = _1387 * _1389;
    float _1399 = _1357 * _1379;
    float _1401 = _1371 * 6.283185482025146484375;
    float _1403 = sin(_1401);
    float _1405 = _1391 * _1397;
    float _1407 = _511 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1409 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _1411 = _1369 * _1375;
    float _1413 = _1387 * _1407;
    float _1415 = _1369 * _1385;
    float _1417 = _1379 * _1385;
    float _1419 = _1357 * _1385;
    float _1421 = _1409 * _1413;
    float _1423 = _1415 * _1405;
    float _1425 = _1375 * _1385;
    float _1427 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1429 = _1427 * 0.5;
    float _1431 = fma(_1403, _1395, _1393);
    float _1433 = -_1399;
    float _1435 = fma(_1403, _1411, _1433);
    float _1437 = -_1405;
    float _1439 = _1403 * _1437;
    float _1441 = -_1411;
    float _1443 = fma(_1403, _1399, _1441);
    float _1445 = fma(_1431, _1421, _1423);
    float _1447 = _1419 * _1405;
    float _1449 = fma(_1417, _1421, _1439);
    float _1451 = fma(_1403, _1393, _1395);
    float _1453 = fma(_1435, _1429, _1445);
    float _1455 = fma(_1443, _1421, _1447);
    float _1457 = fma(_1425, _1429, _1449);
    float _1459 = _1453 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1461 = fma(_1451, _1429, _1455);
    float _1463 = _1453 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1465 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1459);
    float _1467 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1463);
    float _1469 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1465);
    float _1471 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1467);
    float _1473 = _1469 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1475 = _1471 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1477 = _917 + _1473;
    float _1479 = _913 + _1475;
    float _1481 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1483 = _1477 + _1481;
    float _1485 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1487 = _1479 + _1485;
    float _1489 = _1483 * _1483;
    float _1491 = fma(_1487, _1487, _1489);
    float _1493 = _1453 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1495 = sqrt(_1491);
    float _1497 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1493);
    float _1499 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1497);
    float _1501 = _1499 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1503 = _871 + _1501;
    bool _1505 = _1495 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1507 = _1501;
    float _1509 = _1479;
    float _1511 = _1503;
    float _1513 = _1477;
    if (!_1505)
    {
        _1507 = _1477;
    }
    float _1515 = _1507;
    float _1517 = _1515;
    if (!_1505)
    {
        _889 = _1503;
    }
    float _1519 = _889;
    bool _1521 = !_1505;
    float _1523 = _1519;
    if (!_1521)
    {
        float _1525 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1527 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1529 = _1495 + _1527;
        float _1531 = rsqrt(_1491);
        float _1533 = _1529 * _1525;
        float _1535 = _1503 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1537 = _1533 * 0.15915493667125701904296875;
        float _1539 = _1537 * 6.283185482025146484375;
        float _1541 = sin(_1539);
        float _1543 = _1537 * 6.283185482025146484375;
        float _1545 = cos(_1543);
        float _1547 = fma(_1541, _1535, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1549 = _1531 * _1547;
        float _1551 = _1545 + (-1.0);
        float _1553 = fma(_1487, _1549, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1555 = fma(_1483, _1549, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1557 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1559 = fma(_1503, _1545, _1557);
        _1523 = _1559;
        _1509 = _1553;
        _1517 = _1555;
    }
    float _1561 = _1523;
    float _1563 = _1509;
    float _1565 = _1517;
    float _1567 = -_1243;
    float _1569 = fma(_1567, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1561);
    float _1571 = -_1257;
    float _1573 = fma(_1571, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1563);
    float _1575 = -_1275;
    float _1577 = fma(_1575, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1565);
    float _1579 = fma(_1563, 6.2500002968590706586837768554688e-05, 0.5);
    float _1581 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1583 = _1569 + _1581;
    float _1585 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1587 = _1573 + _1585;
    float _1589 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1591 = _1577 + _1589;
    float _1593 = fma(_1565, 6.2500002968590706586837768554688e-05, 0.5);
    float _1595 = _1583 * _1583;
    float _1597 = fma(_1587, _1587, _1595);
    float _1599 = fma(_1591, _1591, _1597);
    float _1601 = rsqrt(_1599);
    float _1603 = sqrt(_1599);
    float _1605 = _1601 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1607 = _1587 * _1605;
    float _1609 = _1591 * _1605;
    float _1611 = _1607 * _1607;
    float _1613 = _1609 * _1609;
    float _1615 = _1611 + _1613;
    float _1617 = sqrt(_1615);
    bool _1619 = _1617 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1621 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1623 = _1617 + _1621;
    float _1625 = _1591;
    float _1627 = _1623;
    float _1629 = _1583;
    float _1631 = _1607;
    if (_1619)
    {
        float _1633 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1625 = _1633;
    }
    float _1635 = _1625;
    if (_1619)
    {
        float _1637 = _1623 * _1635;
        _1627 = _1637;
    }
    float _1639 = _1627;
    if (_1619)
    {
        float _1641 = _1639 * 0.15915493667125701904296875;
        _1381 = _1641;
    }
    float _1643 = _1381;
    float _1645 = _1601;
    if (_1619)
    {
        float _1647 = _1643 * 6.283185482025146484375;
        float _1649 = sin(_1647);
        _1645 = _1649;
    }
    float _1651 = _1645;
    float _1653 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1655 = precise::max(0.0, _1653);
    float _1657 = _1483;
    float _1659 = _1655;
    if (_1619)
    {
        float _1661 = _1643 * 6.283185482025146484375;
        float _1663 = cos(_1661);
        _1657 = _1663;
    }
    float _1665 = _1657;
    float _1667 = -_1605;
    float _1669 = -_1655;
    float _1671 = fma(_1583, _1667, _1669);
    float _1673 = _1653;
    if (_1619)
    {
        float _1675 = rsqrt(_1615);
        _1673 = _1675;
    }
    float _1677 = _1673;
    if (_1619)
    {
        float _1679 = _1671 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1659 = _1679;
    }
    float _1681 = _1659;
    float _1683 = _1681;
    float _1685 = _1651;
    if (_1619)
    {
        float _1687 = fma(_1651, _1681, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1683 = _1687;
    }
    float _1689 = _1683;
    float _1691 = _1689;
    if (!_1619)
    {
        _1685 = _1609;
    }
    float _1693 = _1685;
    float _1695 = _1693;
    if (_1619)
    {
        float _1697 = _1665 + (-1.0);
        _1629 = _1697;
    }
    float _1699 = _1629;
    float _1701 = _1699;
    if (_1619)
    {
        float _1703 = _1699 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1511 = _1703;
    }
    float _1705 = _1511;
    if (!_1619)
    {
        _1701 = _1613;
    }
    float _1707 = _1701;
    float _1709 = _1677;
    float _1711 = _1707;
    if (_1619)
    {
        float _1713 = _1677 * _1689;
        _1513 = _1713;
    }
    float _1715 = _1513;
    if (!_1619)
    {
        _1709 = _1671;
    }
    float _1717 = _1709;
    float _1719 = _1717;
    if (_1619)
    {
        float _1721 = fma(_1671, _1665, _1705);
        _1719 = _1721;
    }
    float _1723 = _1719;
    if (!_1619)
    {
        _1691 = _1611;
    }
    float _1725 = _1691;
    float _1727 = _1725;
    if (_1619)
    {
        float _1729 = _1607 * _1715;
        _1631 = _1729;
    }
    float _1731 = _1631;
    if (_1619)
    {
        float _1733 = _1609 * _1715;
        _1695 = _1733;
    }
    float _1735 = _1695;
    float _1737 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1619)
    {
        float _1739 = _1731 * _1731;
        _1727 = _1739;
    }
    float _1741 = _1727;
    if (_1619)
    {
        float _1743 = _1735 * _1735;
        _1711 = _1743;
    }
    float _1745 = _1711;
    float _1747 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1737);
    float _1749 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1751 = fma(_1723, _1723, _1741);
    float _1753 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1755 = fma(_1603, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1753);
    float _1757 = precise::clamp(_1755, 0.0, 1.0);
    float _1759 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1747);
    float _1761 = _1751 + _1745;
    float _1763 = -_1757;
    float _1765 = _1763 + 1.0;
    float _1767 = _1759 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1769 = rsqrt(_1761);
    float _1771 = fma(_1273, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1773 = fma(_1295, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1775 = abs(_1765);
    float _1777 = log2(_1775);
    float _1779 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1781 = _1769 * _1731;
    float _1783 = _1769 * _1723;
    float _1785 = _1769 * _1735;
    float _1787 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1789 = _1781 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1791 = _1767 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1793 = floor(_1771);
    float _1795 = -_1789;
    float _1797 = fma(_1783, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1795);
    float _1799 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1779);
    float _1801 = -_1791;
    float _1803 = fma(_1801, _1749, 1.0);
    float _1805 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1787);
    float _1807 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1809 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1799);
    float _1811 = -_1785;
    float _1813 = fma(_1811, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1797);
    float _1815 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1805);
    float _1817 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1807);
    float _1819 = _1809 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1821 = floor(_1773);
    float _1823 = _1815 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1825 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1817);
    float _1827 = _1819 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1829 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1831 = fma(_1813, -0.5, 0.5);
    float _1833 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1827);
    float _1835 = _1825 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1837 = fma(_1813, 0.5, 0.5);
    float _1839 = exp2(_1829);
    float _1841 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1833);
    float _1843 = -_1793;
    float _1845 = _1771 + _1843;
    float _1847 = fma(_1837, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1849 = _1819 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1851 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1841);
    float _1853 = -_1821;
    float _1855 = _1773 + _1853;
    float _1857 = fma(_1837, _1847, -0.212114393711090087890625);
    float _1859 = log2(_1803);
    float _1861 = _1819 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1863 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1849);
    float _1865 = _1783 + 1.0;
    float _1867 = 1.0 / _1851;
    float _1869 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1861);
    float _1871 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1863);
    float _1873 = -_1783;
    float _1875 = fma(_1839, _1865, _1873);
    float _1877 = sqrt(_1831);
    float _1879 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1869);
    float _1881 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1871);
    float _1883 = _1859 * 0.693147182464599609375;
    float2 _5541 = float2(_1845, _1855);
    float _1885 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5541, float2(0.0), isnan(_5541)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5541, float2(0.0), isnan(_5541)), level(0.0)).x;
    float _1887 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1879);
    float _1889 = fma(_1837, _1857, 1.570728778839111328125);
    float _1891 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1893 = _1881 * _1867;
    float _1895 = _1887 * _1867;
    float _1897 = fma(_1875, 0.5, 0.5);
    float _1899 = fma(_1893, 0.5, 0.5);
    float _1901 = fma(_1895, -0.5, 0.5);
    float _1903 = _1877 * 0.636619746685028076171875;
    float _1905 = -_1889;
    float _1907 = fma(_1903, _1905, 1.0);
    float3 _5585 = float3(_1899, _1901, _1891);
    float _1909 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5585, float3(0.0), isnan(_5585)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5585, float3(0.0), isnan(_5585)), level(0.0)).x;
    float3 _5596 = float3(_1899, _1901, _1891);
    float4 _1912 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5596, float3(0.0), isnan(_5596)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5596, float3(0.0), isnan(_5596)), level(0.0)).xyzw;
    float _1914 = _1912.x;
    float _1916 = _1912.y;
    float _1918 = _1912.z;
    float _1920 = _1912.w;
    float2 _5612 = float2(_1907, _1897);
    float3 _1924 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5612, float2(0.0), isnan(_5612)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5612, float2(0.0), isnan(_5612)), level(0.0)).xyz;
    float _1926 = _1924.x;
    float _1928 = _1924.y;
    float _1930 = _1924.z;
    float2 _5626 = float2(_1579, _1593);
    float3 _1932 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5626, float2(0.0), isnan(_5626)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5626, float2(0.0), isnan(_5626)), level(0.0)).xyz;
    float _1934 = _1932.x;
    float _1936 = _1932.y;
    float _1938 = _1932.z;
    float _1940 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1942 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1944 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1946 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1948 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1940);
    float _1950 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1942);
    float _1952 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1954 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1948);
    float _1956 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1950);
    float _1958 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1960 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1944);
    float _1962 = _1954 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1964 = _1956 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1966 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1968 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1946);
    float _1970 = 1.0 / _1962;
    float _1972 = _1964 + _1962;
    float _1974 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1966);
    float _1976 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1952);
    bool _1978 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1980 = isnan(0.5);
    bool _1982 = _1978 || _1980;
    bool _1984 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1986 = _1982 || _1984;
    float _1988 = _1415 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1990 = _1972 * _1970;
    float _1992 = _1990 * 0.5;
    float _1994 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1996 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1994);
    float _1998 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2000 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1958);
    float _2002 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2004 = 1.0 / _1996;
    float _2006 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1998);
    float _2008 = _1415 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2010 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1968);
    float _2012 = -_1403;
    float _2014 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2008);
    float _2016 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2014);
    float _2018 = _2002 * _2016;
    float _2020 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2022 = _2004 * _2020;
    float _2024 = abs(_2022);
    float _2026 = log2(_2024);
    float _2028 = _2026 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2030 = _1415 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2032 = -_1403;
    float _2034 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1988);
    float _2036 = -_1403;
    float _2038 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2030);
    float _2040 = exp2(_2028);
    float _2042 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2034);
    float _2044 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1960);
    float _2046 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2038);
    float _2048 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1976);
    float _2050 = fma(_2002, _2002, 1.0);
    float _2052 = rsqrt(_2050);
    float _2054 = fma(_2040, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2056 = precise::clamp(_2054, 0.0, 1.0);
    float _2058 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2006);
    float _2060 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2000);
    float _2062 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1974);
    float _2064 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_72.x = _2058;
    out.m_72.y = _2060;
    out.m_72.z = _2062;
    float _2066 = fma(_2056, -2.0, 3.0);
    float _2068 = _2056 * _2056;
    float _2070 = fma(_2064, _2058, _2018);
    float _2072 = _2002 * _2042;
    float _2074 = _2068 * _2066;
    float _2076 = _1819 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2078 = _2002 * _2046;
    float _2080 = fma(_2064, _2060, _2072);
    float _2082 = -_2074;
    float _2084 = _2082 + 1.0;
    float _2086 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2076);
    float _2088 = _2002 * _2052;
    float _2090 = _2058;
    float _2092 = _2088;
    float _2094 = _2042;
    if (!_1986)
    {
        _2090 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2096 = _2090;
    float _2098 = fma(_2064, _2062, _2078);
    float _2100 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2086);
    float _2102 = -_2044;
    float _2104 = _2088 * _2102;
    float _2106 = -_2010;
    float _2108 = _2088 * _2106;
    float _2110 = -_2048;
    float _2112 = _2088 * _2110;
    float _2114 = _2100;
    if (!_1986)
    {
        float _2116 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2118 = _2096 + _2116;
        _2092 = _2118;
    }
    float _2120 = _2092;
    float _2122 = fma(_2052, _2016, _2104);
    float _2124 = fma(_2052, _2042, _2108);
    float _2126 = fma(_2052, _2046, _2112);
    float _2128 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2130 = in.m_74.x;
    bool _2132 = _2022 <= 8000.0;
    bool _2134 = isnan(_2022);
    bool _2136 = _2132 || _2134;
    bool _2138 = isnan(8000.0);
    bool _2140 = _2136 || _2138;
    float _2142 = float(_2140);
    float _2144 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2074);
    float _2146 = _2002;
    float _2148 = _2126;
    float _2150 = _2124;
    if (!_1986)
    {
        float _2152 = 1.0 / _2120;
        _2146 = _2152;
    }
    float _2154 = _2146;
    out.m_76.x = _2122;
    out.m_76.y = _2124;
    out.m_76.z = _2126;
    float _2156 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2100);
    float _2158 = _2142 * _2144;
    float _2160 = _1851 * 0.5;
    if (!_1986)
    {
        float _2162 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2164 = _2022 + _2162;
        _2114 = _2164;
    }
    float _2166 = _2114;
    float _2168 = _2156 + _1851;
    float _2170 = _2158 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2172 = exp2(_2128);
    float _2174 = fma(_1887, -0.5, _2160);
    out.gl_Position.x = _1881;
    out.gl_Position.y = _1887;
    out.gl_Position.z = _2156;
    out.gl_Position.w = _1851;
    float _2176 = _2174;
    if (_1986)
    {
        _2094 = 1.0;
    }
    float _2178 = _2094;
    float _2180 = _1881 + _1851;
    float _2182 = _2044 + _2070;
    float _2184 = _2178;
    float _2186 = _1851;
    if (!_1986)
    {
        float _2188 = _2166 * _2154;
        float _2190 = precise::clamp(_2188, 0.0, 1.0);
        _2184 = _2190;
    }
    float _2192 = _2184;
    float _2194 = _2010 + _2080;
    float _2196 = _2048 + _2098;
    bool _2198 = _1603 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2200 = isnan(_1603);
    bool _2202 = _2198 || _2200;
    bool _2204 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2206 = _2202 || _2204;
    float _2208 = _2168 * 0.5;
    float _2210 = _2180 * 0.5;
    out.m_78.x = _2182;
    out.m_78.y = _2194;
    out.m_78.z = _2196;
    float _2212 = -_2172;
    float _2214 = _2212 + 1.0;
    out.m_80.x = _2210;
    out.m_80.y = _2174;
    out.m_80.z = _2208;
    out.m_80.w = _1851;
    float _2216 = _2214 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2206)
    {
        _2148 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2218 = _2148;
    float _2220 = _2218;
    float _2222 = _2218;
    if (!_2206)
    {
        _2150 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2224 = _2150;
    float _2226 = _2192 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2228 = _2224;
    float _2230 = _2224;
    if (!_2206)
    {
        _2186 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2232 = _2186;
    float _2234 = _2232;
    float _2236 = _2232;
    if (!_2206)
    {
        _2176 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2238 = _2176;
    float _2240 = -_1885;
    float _2242 = _2240 + 1.0;
    float _2244 = _2242 * _2170;
    float _2246 = precise::clamp(_2244, 0.0, 1.0);
    float _2248 = -_2246;
    float _2250 = fma(_2248, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2252 = -_2216;
    float _2254 = _2252 + 1.0;
    float _2256 = _2250 * _2130;
    float _2258 = _2256 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2260 = _2216 * _1909;
    float _2262 = _1920 * _2254;
    float _2264 = _2254;
    float _2266 = _1934;
    float _2268 = _2238;
    float _2270 = _2238;
    if (!_2206)
    {
        _2264 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2272 = _2264;
    out.m_82.x = _2258;
    float _2274 = _1920 * _2260;
    float _2276 = _1930 * _2260;
    float _2278 = fma(_1926, _2274, _1914);
    float _2280 = fma(_1928, _2274, _1916);
    float _2282 = fma(_1920, _2276, _1918);
    out.m_84.x = _2278;
    out.m_84.y = _2280;
    out.m_84.z = _2282;
    out.m_84.w = _2262;
    out.m_86.x = _1934;
    out.m_86.y = _1936;
    out.m_86.z = _1938;
    float _2284 = _2272;
    float _2286 = _2272;
    if (!_2206)
    {
        _2266 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2288 = _2266;
    bool _2290 = !_2206;
    float _2292 = _2288;
    float _2294 = _2288;
    if (!_2290)
    {
        bool _2296 = _1603 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2298 = isnan(_1603);
        bool _2300 = _2296 || _2298;
        bool _2302 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2304 = _2300 || _2302;
        if (!_2304)
        {
            float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2308 = _1603 + _2306;
            float _2310 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2312 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2310;
            float _2314 = 1.0 / _2312;
            float _2316 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2318 = _2316 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2320 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2322 = _2320 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2324 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2326 = _2324 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2328 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2330 = _2328 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2332 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2334 = _2332 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2336 = _2308 * _2314;
            float _2338 = precise::clamp(_2336, 0.0, 1.0);
            float _2340 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2342 = _2340 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2344 = fma(_2338, _2318, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2346 = fma(_2338, _2342, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2348 = fma(_2338, _2322, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2350 = fma(_2338, _2326, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2352 = fma(_2338, _2330, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2354 = fma(_2338, _2334, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2236 = _2344;
            _2286 = _2352;
            _2222 = _2346;
            _2230 = _2350;
            _2270 = _2348;
            _2294 = _2354;
            _2356 = true;
        }
        else
        {
            bool _2358 = _1603 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2360 = isnan(_1603);
            bool _2362 = _2358 || _2360;
            bool _2364 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2366 = _2362 || _2364;
            if (!_2366)
            {
                _2220 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2368 = _2220;
            _2222 = _2368;
            if (!_2366)
            {
                _2234 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2370 = _2234;
            _2236 = _2370;
            if (!_2366)
            {
                _2268 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2372 = _2268;
            _2270 = _2372;
            if (!_2366)
            {
                _2228 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2374 = _2228;
            _2230 = _2374;
            if (!_2366)
            {
                _2284 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2376 = _2284;
            _2286 = _2376;
            if (!_2366)
            {
                _2292 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2378 = _2292;
            bool _2380 = !_2366;
            _2294 = _2378;
            if (!_2380)
            {
                bool _2382 = _1603 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2384 = isnan(_1603);
                bool _2386 = _2382 || _2384;
                bool _2388 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2390 = _2386 || _2388;
                if (!_2390)
                {
                    float _2392 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2394 = _1603 + _2392;
                    float _2396 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2398 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2396;
                    float _2400 = 1.0 / _2398;
                    float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2404 = _2402 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2406 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2408 = _2406 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2410 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2412 = _2410 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2414 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2416 = _2414 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2418 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2420 = _2418 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2422 = _2394 * _2400;
                    float _2424 = precise::clamp(_2422, 0.0, 1.0);
                    float _2426 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2428 = _2426 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2430 = fma(_2424, _2404, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2432 = fma(_2424, _2428, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2434 = fma(_2424, _2408, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2436 = fma(_2424, _2412, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2438 = fma(_2424, _2416, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2440 = fma(_2424, _2420, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2236 = _2430;
                    _2286 = _2438;
                    _2222 = _2432;
                    _2230 = _2436;
                    _2270 = _2434;
                    _2294 = _2440;
                    _2356 = true;
                }
                else
                {
                    _2236 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2286 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2222 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2230 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2270 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2294 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2356 = false;
    float _2442 = _2236;
    float _2444 = _2286;
    float _2446 = _2222;
    float _2448 = _2230;
    float _2450 = _2270;
    float _2452 = _2294;
    float _2454 = fma(_2194, -0.5, 0.5);
    float _2456 = precise::clamp(_2454, 0.0, 1.0);
    float _2458 = -_2442;
    float _2460 = _2458 + _2444;
    float _2462 = -_2446;
    float _2464 = _2462 + _2448;
    out.m_88.x = 0.0;
    float _2466 = fma(_2456, _2460, _2442);
    float _2468 = -_2450;
    float _2470 = _2468 + _2452;
    float _2472 = fma(_2456, _2464, _2446);
    float _2474 = _2466 * 0.586610972881317138671875;
    bool _2476 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2478 = fma(_2456, _2470, _2450);
    float _2480 = _2226 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2482 = fma(_2472, 0.298911988735198974609375, _2474);
    bool _2484 = _2192 > 0.0;
    bool _2486 = isnan(_2192);
    bool _2488 = _2484 || _2486;
    bool _2490 = isnan(0.0);
    bool _2492 = _2488 || _2490;
    float _2494 = fma(_2478, 0.114477999508380889892578125, _2482);
    out.m_51.x = _2480;
    float _2496 = -_2494;
    float _2498 = _2472 + _2496;
    float _2500 = -_2494;
    float _2502 = _2466 + _2500;
    float _2504 = -_2494;
    float _2506 = _2478 + _2504;
    float _2508 = fma(_2498, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2494);
    float _2510 = fma(_2502, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2494);
    float _2512 = fma(_2506, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2494);
    bool _2514 = !_2476;
    if (!_2514)
    {
        float _2516 = -_1569;
        float _2518 = _2516 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2520 = -_1573;
        float _2522 = _2520 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2524 = -_1577;
        float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2528 = _2518 * _2518;
        float _2530 = fma(_2522, _2522, _2528);
        float _2532 = fma(_2526, _2526, _2530);
        float _2534 = sqrt(_2532);
        float _2536 = rsqrt(_2532);
        float _2538 = -_2534;
        float _2540 = _2538 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2542 = _2540 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2544 = precise::clamp(_2542, 0.0, 1.0);
        float _2546 = _2522 * _2536;
        float _2548 = _2518 * _2536;
        float _2550 = abs(_2544);
        float _2552 = log2(_2550);
        float _2554 = _2526 * _2536;
        float _2556 = _2546 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2558 = _2194 * _2548;
        float _2560 = -_2548;
        float _2562 = -_2556;
        float _2564 = fma(_2560, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2562);
        float _2566 = fma(_2182, _2546, _2558);
        float _2568 = -_2554;
        float _2570 = fma(_2568, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2564);
        float _2572 = fma(_2196, _2554, _2566);
        float _2574 = precise::clamp(_2572, 0.0, 1.0);
        float _2576 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2578 = _2570 + _2576;
        float _2580 = _2552 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2582 = _2578 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2584 = precise::clamp(_2582, 0.0, 1.0);
        float _2586 = exp2(_2580);
        float _2588 = _2586 * _2584;
        float _2590 = _2574 * _2588;
        float _2592 = _2590 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2594 = _2590 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2596 = _2590 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _2592;
        out.m_88.y = _2594;
        out.m_88.z = _2596;
    }
    out.m_90.x = _2508;
    out.m_90.y = _2510;
    out.m_90.z = _2512;
    if (_2492)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2598 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_51.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2598;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2356 = false;
    bool _549 = false;
    bool _399 = false;
    bool _205 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_48.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_51.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2655 = as_type<float>(_125);
        out.gl_Position.z = _2655;
    }
    if (!_113)
    {
        return out;
    }
    float _129 = in.m_53.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_109);
        _119 = _147;
    }
    float _149 = _119;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_51.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2725 = as_type<float>(_163);
        out.gl_Position.z = _2725;
    }
    if (_155)
    {
        return out;
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _169 = as_type<int>(_165) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_165) & 2;
    bool _175 = _173 != 0;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_167;
    float _203;
    if (!_185)
    {
        float _187 = in.m_58.x;
        float _189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _191 = _187 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _195 = _193 * _189;
        float _197 = floor(_195);
        float _199 = -_197;
        float _201 = _195 + _199;
        _203 = _201;
        _205 = true;
    }
    else
    {
        float _207 = float(_109);
        float _209 = 1.0 / _207;
        float _211 = _143 * _209;
        _203 = _211;
    }
    _205 = false;
    float _213 = _203;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _217 = _213 + _215;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _221 = _213 + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _225 = _213 + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _233 = _231 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _235;
    bool _239 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _241 = isnan(_213);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = 1.0 / _229;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _255 = 1.0 / _237;
    float _257 = 1.0 / _233;
    float _259 = _217 * _251;
    bool _261 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _263 = isnan(_213);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = -_249;
    float _275 = _273 + 1.0;
    float _277 = _271 * _275;
    float _279 = _221 * _255;
    bool _281 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _283 = isnan(_213);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = -_271;
    float _295 = _293 + 1.0;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _299 = _297 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _301 = _291 * _295;
    float _303 = -_291;
    float _305 = _303 + 1.0;
    float _307 = _225 * _257;
    bool _309 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _311 = isnan(_213);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _321;
    float _325 = fma(_299, _307, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _335 = fma(_323, _259, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _337 = _319 * _305;
    float _339 = fma(_329, _259, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _341 = fma(_333, _307, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _343 = -_319;
    float _345 = _343 + 1.0;
    float _347 = _335 * _337;
    float _349 = _339 * _337;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _351;
    float _355 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[143].x, _347);
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _357;
    float _361 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[143].y, _349);
    float _363 = fma(_353, _279, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _365 = fma(_325, _301, _355);
    float _367 = fma(_359, _279, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _369 = fma(_341, _301, _361);
    float _371 = fma(_363, _277, _365);
    float _373 = fma(_367, _277, _369);
    float _375 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[146].x, _371);
    float _377 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[146].y, _373);
    bool _379 = !_253;
    float _397;
    if (!_379)
    {
        float _381 = in.m_58.x;
        float _383 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _385 = _381 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _387 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _389 = _387 * _383;
        float _391 = floor(_389);
        float _393 = -_391;
        float _395 = _389 + _393;
        _397 = _395;
        _399 = true;
    }
    else
    {
        float _401 = float(_109);
        float _403 = 1.0 / _401;
        float _405 = _143 * _403;
        _397 = _405;
    }
    _399 = false;
    float _407 = _397;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _411 = _407 + _409;
    float _413 = in.m_60.x;
    float _415 = in.m_60.y;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _421 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _423 = isnan(_407);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _437 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _439 = isnan(_407);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _449;
    bool _453 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _455 = isnan(_407);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _461 = _457 || _459;
    float _463 = float(_461);
    float _465 = 1.0 / _419;
    float _467 = -_431;
    float _469 = _467 + 1.0;
    bool _471 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _473 = _447 * _469;
    float _475 = -_447;
    float _477 = _475 + 1.0;
    float _479 = 1.0 / _435;
    float _481 = _451 * _465;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _487 = _377 * _415;
    float _489 = fma(_481, _411, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _491 = _485 * _479;
    float _493 = _489 * _473;
    float _495 = -_463;
    float _497 = _495 + 1.0;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _501 = _407 + _499;
    float _503 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[115].x, _493);
    float _505 = _431 * _497;
    float _507 = fma(_491, _501, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _511 = _375 * _413;
    float _513 = fma(_507, _505, _503);
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _517 = _509 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _519 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[117].x, _513);
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _523 = _515 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _525 = _519 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _527 = _521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _517;
    out.m_62.y = _527;
    out.m_62.z = _523;
    out.m_62.w = _525;
    bool _529 = !_471;
    float _547;
    if (!_529)
    {
        float _531 = in.m_58.x;
        float _533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _535 = _531 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _537 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[11].w, _143);
        float _539 = _537 * _533;
        float _541 = floor(_539);
        float _543 = -_541;
        float _545 = _539 + _543;
        _547 = _545;
        _549 = true;
    }
    else
    {
        float _551 = float(_109);
        float _553 = 1.0 / _551;
        float _555 = _143 * _553;
        _547 = _555;
    }
    _549 = false;
    float _557 = _547;
    float _559 = in.m_58.x;
    float _561 = in.m_58.y;
    float _563 = in.m_58.z;
    float _565 = in.m_58.w;
    float _567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _569 = in.m_48.x;
    float _571 = in.m_48.y;
    float _573 = in.m_48.z;
    int _575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _577 = _575 != 0;
    int _579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _581 = _579 != 0;
    int _583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _585 = _583 != 0;
    float _587 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _591 = _589 != 0;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _597 = _559 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _599 = _559 > 0.5;
    float _601 = _561 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _603 = _565 > 0.5;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _609 = -_179;
    int _611 = _599 ? as_type<int>(_609) : as_type<int>(_179);
    float _613 = _571 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _617 = _615 != 0;
    int _619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _621 = _619 != 0;
    float _623 = 1.0 / _607;
    float _625 = -_593;
    float _627 = fma(_597, 2.0, _625);
    bool _629 = !_577;
    float _631 = _629 ? _179 : as_type<float>(_611);
    float _633 = _571 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _635 = _561 > 0.5;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _641 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[5].x, _613);
    float _643 = fma(_601, -2.0, _595);
    float _645 = -_183;
    int _647 = _635 ? as_type<int>(_645) : as_type<int>(_183);
    float _649 = _559 * 2.0;
    float _651 = 1.0 / _639;
    bool _653 = !_581;
    float _655 = _653 ? _183 : as_type<float>(_647);
    float _657 = _563 * 2.0;
    int _659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _661 = _659 != 0;
    float _663 = _571 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _669;
    float _673 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[6].x, _633);
    float _675 = floor(_657);
    float _677 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[4].x, _663);
    float _679 = _671 * _623;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _685 = -_179;
    int _687 = _635 ? as_type<int>(_685) : as_type<int>(_179);
    float _689 = _561 + _563;
    bool _691 = _563 > 0.5;
    float _693 = _561 * 2.0;
    float _695 = 1.0 / _667;
    float _697 = _683 * _651;
    float _699 = _689 + (-1.0);
    float _701 = -_179;
    int _703 = _691 ? as_type<int>(_701) : as_type<int>(_179);
    float _705 = -_143;
    float _707 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[76].x, _627);
    float _709 = -_183;
    float _711 = _691 ? _709 : _183;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _713;
    float _717 = floor(_649);
    float _719 = _561 + _559;
    bool _721 = _675 > 0.0;
    float _723 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _725 = !_617;
    float _727 = _725 ? _179 : as_type<float>(_687);
    float _729 = _719 + (-1.0);
    bool _731 = _675 >= 0.0;
    bool _733 = isnan(_675);
    bool _735 = _731 || _733;
    bool _737 = isnan(0.0);
    bool _739 = _735 || _737;
    float _741 = _631 + 0.5;
    float _743 = _715 * _695;
    float _745 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _747 = !_621;
    float _749 = _747 ? _183 : _711;
    float _751 = floor(_693);
    int _753 = _739 ? 0 : 1;
    float _755 = fma(_573, (*spvDescriptorSet0.vp_c10)._m0[5].z, _641);
    float _757 = fma(_573, (*spvDescriptorSet0.vp_c10)._m0[6].z, _673);
    float _759 = _711;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    int _763 = as_type<int>(_745);
    if (!_661)
    {
        _759 = _563;
    }
    float _765 = _759;
    float _767 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _643);
    bool _769 = _717 > 0.0;
    float _771 = _655 + (-0.5);
    bool _773 = _717 >= 0.0;
    bool _775 = isnan(_717);
    bool _777 = _773 || _775;
    bool _779 = isnan(0.0);
    bool _781 = _777 || _779;
    float _783 = fma(_573, (*spvDescriptorSet0.vp_c10)._m0[4].z, _677);
    int _785 = ~_753;
    int _787 = _785 + 1;
    int _789 = _787 + 1;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _793 = _557 + _791;
    int _795 = _789;
    float _797 = _765;
    if (!_721)
    {
        int _799 = ~_753;
        int _801 = _799 + 1;
        _795 = _801;
    }
    int _803 = _795;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _807 = _557 + _805;
    int _809 = _781 ? 0 : 1;
    float _811 = fma(_679, _793, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _813 = fma(_697, _807, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _815 = ~_809;
    int _817 = _815 + 1;
    int _819 = _817 + 1;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _823 = _557 + _821;
    int _825 = _819;
    if (!_769)
    {
        int _827 = ~_809;
        int _829 = _827 + 1;
        _825 = _829;
    }
    int _831 = _825;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _835 = _557 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _837 = isnan(_557);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _843 = _839 || _841;
    float _845 = float(_843);
    float _847 = fma(_743, _823, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _849 = _751 >= 0.0;
    bool _851 = isnan(_751);
    bool _853 = _849 || _851;
    bool _855 = isnan(0.0);
    bool _857 = _853 || _855;
    float _859 = -_749;
    float _861 = _859 + 0.5;
    if (_661)
    {
        _797 = _561;
    }
    float _863 = _797;
    float _865 = -_845;
    float _867 = _865 + 1.0;
    bool _869 = _751 > 0.0;
    float _871 = _755 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _873 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[83].w, _833);
    bool _875 = _557 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _877 = isnan(_557);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _883 = _879 || _881;
    float _885 = float(_883);
    float _887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _889 = _871;
    if (!_661)
    {
        _761 = _561;
    }
    float _891 = _761;
    float _893 = _861 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _895 = 0.0;
    float _897 = _891;
    if (!_661)
    {
        _895 = _563;
    }
    float _899 = _895;
    float _901 = _885 * _867;
    float _903 = _899;
    if (_661)
    {
        _897 = _559;
    }
    float _905 = _897;
    float _907 = -_885;
    float _909 = _907 + 1.0;
    if (_661)
    {
        _903 = _561;
    }
    float _911 = _903;
    float _913 = _783 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _915 = _857 ? 0 : 1;
    float _917 = _757 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _921 = _919 != 0;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _925 = _923 != 0;
    int _927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _929 = _927 != 0;
    float _931 = _911 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _933 = _557 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _935 = isnan(_557);
    bool _937 = _933 || _935;
    bool _939 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _941 = _937 || _939;
    float _943 = float(_941);
    float _945 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _873);
    bool _947 = _557 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _949 = isnan(_557);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _955 = _951 || _953;
    float _957 = float(_955);
    float _959 = _567 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _961 = _587 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _963 = -_943;
    float _965 = _963 + 1.0;
    float _967 = _887 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _969 = fma(_959, _741, _707);
    float _971 = _957 * _909;
    float _973 = -_961;
    float _975 = -_767;
    float _977 = fma(_973, _771, _975);
    float _979 = _811 * _971;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _983 = -_957;
    float _985 = _983 + 1.0;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _989 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _991 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[83].z, _981);
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _995 = _905 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _997 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[131].x, _979);
    float _999 = _845 * _965;
    float _1001 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _991);
    float _1003 = -_993;
    float _1005 = fma(_995, 2.0, _1003);
    float _1007 = fma(_931, -2.0, _987);
    float _1009 = -_183;
    int _1011 = _603 ? as_type<int>(_1009) : as_type<int>(_183);
    float _1013 = fma(_813, _901, _997);
    bool _1015 = !_591;
    float _1017 = _1015 ? _179 : as_type<float>(_703);
    float _1019 = -_143;
    float _1021 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1005);
    bool _1023 = !_585;
    float _1025 = _1023 ? _183 : as_type<float>(_1011);
    float _1027 = _727 + 0.5;
    float _1029 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1031 = _1017 + 0.5;
    float _1033 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1007);
    float _1035 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1037 = fma(_847, _999, _1013);
    float _1039 = fma(_967, _1031, _1021);
    float _1041 = _1025 + (-0.5);
    float _1043 = _1035 * _989;
    float _1045 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1047 = log2(_1045);
    float _1049 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1051 = _917 + _1049;
    float _1053 = -_945;
    float _1055 = _1053 + 1.0;
    bool _1057 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1059 = isnan(0.0);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1065 = _1061 || _1063;
    float _1067 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1069 = ~_915;
    int _1071 = _1069 + 1;
    int _1073 = _1071 + 1;
    float _1075 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1079 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1067);
    float _1081 = _1029 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1083 = _1073;
    if (!_869)
    {
        int _1085 = ~_915;
        int _1087 = _1085 + 1;
        _1083 = _1087;
    }
    int _1089 = _1083;
    float _1091 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1077);
    float _1093 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1079);
    float _1095 = -_1081;
    float _1097 = -_1033;
    float _1099 = fma(_1095, _1041, _1097);
    float _1101 = _1047 * _143;
    float _1103 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1037);
    float _1105 = -_1093;
    float _1107 = _1105 + 1.0;
    float _1109 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1111 = _871 + _1109;
    float _1113 = -_1001;
    float _1115 = _1113 + 1.0;
    float _1117 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1119 = _913 + _1117;
    float _1121 = -_1107;
    float _1123 = fma(_631, _1121, _969);
    float _1125 = exp2(_1101);
    float _1127 = _893 * _1075;
    float _1129 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1131 = -_1115;
    float _1133 = fma(_1017, _1131, _1039);
    float _1135 = _1111 * _1111;
    bool _1137 = !_921;
    int _1139 = _1137 ? 0 : 1;
    float _1141 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1129);
    bool _1143 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1145 = isnan(1.0);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1151 = _1147 || _1149;
    out.m_64.x = _1043;
    out.m_64.y = _1127;
    int _1153 = abs(_1139);
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1157 = 1.0 + _1155;
    float _1159 = fma(_1119, _1119, _1135);
    float _1161 = in.m_66.x;
    float _1163 = in.m_66.y;
    float _1165 = in.m_66.z;
    float _1167 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1141);
    float _1169 = 1.0 / _1157;
    float _1171 = fma(_1051, _1051, _1159);
    bool _1173 = !_925;
    int _1175 = _1173 ? 0 : 1;
    float _1177 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1091);
    float _1179 = float(_803);
    float _1181 = -_1125;
    float _1183 = _1181 + 1.0;
    float _1185 = -_1177;
    float _1187 = _1185 + 1.0;
    bool _1189 = _1167 >= 0.0;
    float _1191 = rsqrt(_1171);
    int _1193 = abs(_1175);
    float _1195 = fma(_655, _1187, _977);
    float _1197 = float(_831);
    float _1199 = fma(_1025, _1055, _1099);
    float _1201 = float(_1153);
    float _1203 = _1103 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1205 = _1065 ? _1183 : 0.0;
    float _1207 = _1201 * _1179;
    float _1209 = _1169;
    if (_1151)
    {
        float _1211 = _1205 * _1169;
        _145 = _1211;
    }
    float _1213 = _145;
    float _1215 = _1207 * (-2.0);
    float _1217 = float(_1193);
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    if (_1189)
    {
        _1209 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1221 = _1209;
    float _1223 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1225 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1227 = fma(_745, _1215, _745);
    float _1229 = _1217 * _1197;
    float _1231 = fma(_1215, _1161, _1161);
    float _1233 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1235 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1237 = _1225 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1189)
    {
        float _1239 = _1221 * 5.0;
        _763 = as_type<int>(_1239);
    }
    int _1241 = _763;
    float _1243 = _1111 * _1191;
    out.m_68.x = _1123;
    out.m_68.y = _1195;
    out.m_68.z = _1133;
    out.m_68.w = _1199;
    float _1245 = _1229 * (-2.0);
    float _1247 = -_1243;
    float _1249 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1111);
    out.m_70.x = _1233;
    out.m_70.y = _1235;
    out.m_70.z = _1237;
    out.m_70.w = _1203;
    float _1251 = fma(_723, _1245, _723);
    float _1253 = fma(_1245, _1163, _1163);
    float _1255 = _1249 * _1249;
    if (_1189)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4484 = as_type<float>(_1241);
        out.gl_Position.z = _4484;
    }
    if (_1189)
    {
        out.m_51.x = 0.0;
    }
    float _1257 = _1119 * _1191;
    bool _1259 = !_929;
    int _1261 = _1259 ? 0 : 1;
    float _1263 = -_1257;
    float _1265 = fma(_1263, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1119);
    if (_1189)
    {
        return out;
    }
    float _1267 = -_1243;
    float _1269 = fma(_1267, (*spvDescriptorSet0.vp_c9)._m0[18].w, _871);
    float _1271 = -_1257;
    float _1273 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[18].w, _913);
    float _1275 = _1051 * _1191;
    float _1277 = _559 + (-0.5);
    float _1279 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1281 = _1269 + _1279;
    float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1285 = _1273 + _1283;
    int _1287 = abs(_1261);
    float _1289 = fma(_1277, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1231);
    float _1291 = _1281 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1293 = -_1275;
    float _1295 = fma(_1293, (*spvDescriptorSet0.vp_c9)._m0[18].w, _917);
    float _1297 = _561 + (-0.5);
    float _1299 = fma(_1227, _1213, _1289);
    float _1301 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1291);
    float _1303 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1305 = _1295 + _1303;
    float _1307 = float(_1089);
    float _1309 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1253);
    float _1311 = fma(_1265, _1265, _1255);
    float _1313 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1301);
    float _1315 = _1299 * 0.15915493667125701904296875;
    float _1317 = -_1275;
    float _1319 = fma(_1317, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1051);
    float _1321 = _563 + _559;
    float _1323 = float(_1287);
    float _1325 = fma(_1251, _1213, _1309);
    bool _1327 = _1313 >= 0.0;
    float _1329 = fma(_1319, _1319, _1311);
    float _1331 = _1323 * _1307;
    float _1333 = _1321 + (-1.0);
    float _1335 = _1325 * 0.15915493667125701904296875;
    float _1337 = sqrt(_1329);
    float _1339 = _1331 * (-2.0);
    float _1341 = fma(_1333, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1343 = _563 + (-0.5);
    float _1345 = fma(_1339, _1165, _1165);
    float _1347 = fma(_1341, _1339, _1341);
    float _1349 = _1331;
    int _1351 = as_type<int>(_1343);
    if (_1327)
    {
        _1349 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1353 = _1349;
    float _1355 = _1315 * 6.283185482025146484375;
    float _1357 = sin(_1355);
    float _1359 = fma(_1343, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1345);
    if (_1327)
    {
        out.m_51.x = 0.0;
    }
    if (_1327)
    {
        float _1361 = _1353 * 5.0;
        _1351 = as_type<int>(_1361);
    }
    int _1363 = _1351;
    float _1365 = fma(_1347, _1213, _1359);
    float _1367 = _1315 * 6.283185482025146484375;
    float _1369 = cos(_1367);
    if (_1327)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4687 = as_type<float>(_1363);
        out.gl_Position.z = _4687;
    }
    float _1371 = _1365 * 0.15915493667125701904296875;
    float _1373 = _1335 * 6.283185482025146484375;
    float _1375 = sin(_1373);
    float _1377 = _1335 * 6.283185482025146484375;
    float _1379 = cos(_1377);
    float _1381 = _1369;
    if (_1327)
    {
        return out;
    }
    float _1383 = _1371 * 6.283185482025146484375;
    float _1385 = cos(_1383);
    float _1387 = _1191 * _1337;
    float _1389 = _487 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1391 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _1393 = _1357 * _1375;
    float _1395 = _1369 * _1379;
    float _1397 = _1387 * _1389;
    float _1399 = _1357 * _1379;
    float _1401 = _1371 * 6.283185482025146484375;
    float _1403 = sin(_1401);
    float _1405 = _1391 * _1397;
    float _1407 = _511 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1409 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _1411 = _1369 * _1375;
    float _1413 = _1387 * _1407;
    float _1415 = _1369 * _1385;
    float _1417 = _1379 * _1385;
    float _1419 = _1357 * _1385;
    float _1421 = _1409 * _1413;
    float _1423 = _1415 * _1405;
    float _1425 = _1375 * _1385;
    float _1427 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1429 = _1427 * 0.5;
    float _1431 = fma(_1403, _1395, _1393);
    float _1433 = -_1399;
    float _1435 = fma(_1403, _1411, _1433);
    float _1437 = -_1405;
    float _1439 = _1403 * _1437;
    float _1441 = -_1411;
    float _1443 = fma(_1403, _1399, _1441);
    float _1445 = fma(_1431, _1421, _1423);
    float _1447 = _1419 * _1405;
    float _1449 = fma(_1417, _1421, _1439);
    float _1451 = fma(_1403, _1393, _1395);
    float _1453 = fma(_1435, _1429, _1445);
    float _1455 = fma(_1443, _1421, _1447);
    float _1457 = fma(_1425, _1429, _1449);
    float _1459 = _1453 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1461 = fma(_1451, _1429, _1455);
    float _1463 = _1453 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1465 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1459);
    float _1467 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1463);
    float _1469 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1465);
    float _1471 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1467);
    float _1473 = _1469 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1475 = _1471 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1477 = _917 + _1473;
    float _1479 = _913 + _1475;
    float _1481 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1483 = _1477 + _1481;
    float _1485 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1487 = _1479 + _1485;
    float _1489 = _1483 * _1483;
    float _1491 = fma(_1487, _1487, _1489);
    float _1493 = _1453 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1495 = sqrt(_1491);
    float _1497 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1493);
    float _1499 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1497);
    float _1501 = _1499 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1503 = _871 + _1501;
    bool _1505 = _1495 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1507 = _1501;
    float _1509 = _1479;
    float _1511 = _1503;
    float _1513 = _1477;
    if (!_1505)
    {
        _1507 = _1477;
    }
    float _1515 = _1507;
    float _1517 = _1515;
    if (!_1505)
    {
        _889 = _1503;
    }
    float _1519 = _889;
    bool _1521 = !_1505;
    float _1523 = _1519;
    if (!_1521)
    {
        float _1525 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1527 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1529 = _1495 + _1527;
        float _1531 = rsqrt(_1491);
        float _1533 = _1529 * _1525;
        float _1535 = _1503 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1537 = _1533 * 0.15915493667125701904296875;
        float _1539 = _1537 * 6.283185482025146484375;
        float _1541 = sin(_1539);
        float _1543 = _1537 * 6.283185482025146484375;
        float _1545 = cos(_1543);
        float _1547 = fma(_1541, _1535, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1549 = _1531 * _1547;
        float _1551 = _1545 + (-1.0);
        float _1553 = fma(_1487, _1549, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1555 = fma(_1483, _1549, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1557 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1559 = fma(_1503, _1545, _1557);
        _1523 = _1559;
        _1509 = _1553;
        _1517 = _1555;
    }
    float _1561 = _1523;
    float _1563 = _1509;
    float _1565 = _1517;
    float _1567 = -_1243;
    float _1569 = fma(_1567, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1561);
    float _1571 = -_1257;
    float _1573 = fma(_1571, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1563);
    float _1575 = -_1275;
    float _1577 = fma(_1575, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1565);
    float _1579 = fma(_1563, 6.2500002968590706586837768554688e-05, 0.5);
    float _1581 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1583 = _1569 + _1581;
    float _1585 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1587 = _1573 + _1585;
    float _1589 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1591 = _1577 + _1589;
    float _1593 = fma(_1565, 6.2500002968590706586837768554688e-05, 0.5);
    float _1595 = _1583 * _1583;
    float _1597 = fma(_1587, _1587, _1595);
    float _1599 = fma(_1591, _1591, _1597);
    float _1601 = rsqrt(_1599);
    float _1603 = sqrt(_1599);
    float _1605 = _1601 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1607 = _1587 * _1605;
    float _1609 = _1591 * _1605;
    float _1611 = _1607 * _1607;
    float _1613 = _1609 * _1609;
    float _1615 = _1611 + _1613;
    float _1617 = sqrt(_1615);
    bool _1619 = _1617 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1621 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1623 = _1617 + _1621;
    float _1625 = _1591;
    float _1627 = _1623;
    float _1629 = _1583;
    float _1631 = _1607;
    if (_1619)
    {
        float _1633 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1625 = _1633;
    }
    float _1635 = _1625;
    if (_1619)
    {
        float _1637 = _1623 * _1635;
        _1627 = _1637;
    }
    float _1639 = _1627;
    if (_1619)
    {
        float _1641 = _1639 * 0.15915493667125701904296875;
        _1381 = _1641;
    }
    float _1643 = _1381;
    float _1645 = _1601;
    if (_1619)
    {
        float _1647 = _1643 * 6.283185482025146484375;
        float _1649 = sin(_1647);
        _1645 = _1649;
    }
    float _1651 = _1645;
    float _1653 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1655 = precise::max(0.0, _1653);
    float _1657 = _1483;
    float _1659 = _1655;
    if (_1619)
    {
        float _1661 = _1643 * 6.283185482025146484375;
        float _1663 = cos(_1661);
        _1657 = _1663;
    }
    float _1665 = _1657;
    float _1667 = -_1605;
    float _1669 = -_1655;
    float _1671 = fma(_1583, _1667, _1669);
    float _1673 = _1653;
    if (_1619)
    {
        float _1675 = rsqrt(_1615);
        _1673 = _1675;
    }
    float _1677 = _1673;
    if (_1619)
    {
        float _1679 = _1671 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1659 = _1679;
    }
    float _1681 = _1659;
    float _1683 = _1681;
    float _1685 = _1651;
    if (_1619)
    {
        float _1687 = fma(_1651, _1681, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1683 = _1687;
    }
    float _1689 = _1683;
    float _1691 = _1689;
    if (!_1619)
    {
        _1685 = _1609;
    }
    float _1693 = _1685;
    float _1695 = _1693;
    if (_1619)
    {
        float _1697 = _1665 + (-1.0);
        _1629 = _1697;
    }
    float _1699 = _1629;
    float _1701 = _1699;
    if (_1619)
    {
        float _1703 = _1699 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1511 = _1703;
    }
    float _1705 = _1511;
    if (!_1619)
    {
        _1701 = _1613;
    }
    float _1707 = _1701;
    float _1709 = _1677;
    float _1711 = _1707;
    if (_1619)
    {
        float _1713 = _1677 * _1689;
        _1513 = _1713;
    }
    float _1715 = _1513;
    if (!_1619)
    {
        _1709 = _1671;
    }
    float _1717 = _1709;
    float _1719 = _1717;
    if (_1619)
    {
        float _1721 = fma(_1671, _1665, _1705);
        _1719 = _1721;
    }
    float _1723 = _1719;
    if (!_1619)
    {
        _1691 = _1611;
    }
    float _1725 = _1691;
    float _1727 = _1725;
    if (_1619)
    {
        float _1729 = _1607 * _1715;
        _1631 = _1729;
    }
    float _1731 = _1631;
    if (_1619)
    {
        float _1733 = _1609 * _1715;
        _1695 = _1733;
    }
    float _1735 = _1695;
    float _1737 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1619)
    {
        float _1739 = _1731 * _1731;
        _1727 = _1739;
    }
    float _1741 = _1727;
    if (_1619)
    {
        float _1743 = _1735 * _1735;
        _1711 = _1743;
    }
    float _1745 = _1711;
    float _1747 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1737);
    float _1749 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1751 = fma(_1723, _1723, _1741);
    float _1753 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1755 = fma(_1603, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1753);
    float _1757 = precise::clamp(_1755, 0.0, 1.0);
    float _1759 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1747);
    float _1761 = _1751 + _1745;
    float _1763 = -_1757;
    float _1765 = _1763 + 1.0;
    float _1767 = _1759 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1769 = rsqrt(_1761);
    float _1771 = fma(_1273, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1773 = fma(_1295, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1775 = abs(_1765);
    float _1777 = log2(_1775);
    float _1779 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1781 = _1769 * _1731;
    float _1783 = _1769 * _1723;
    float _1785 = _1769 * _1735;
    float _1787 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1789 = _1781 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1791 = _1767 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1793 = floor(_1771);
    float _1795 = -_1789;
    float _1797 = fma(_1783, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1795);
    float _1799 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1779);
    float _1801 = -_1791;
    float _1803 = fma(_1801, _1749, 1.0);
    float _1805 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1787);
    float _1807 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1809 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1799);
    float _1811 = -_1785;
    float _1813 = fma(_1811, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1797);
    float _1815 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1805);
    float _1817 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1807);
    float _1819 = _1809 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1821 = floor(_1773);
    float _1823 = _1815 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1825 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1817);
    float _1827 = _1819 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1829 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1831 = fma(_1813, -0.5, 0.5);
    float _1833 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1827);
    float _1835 = _1825 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1837 = fma(_1813, 0.5, 0.5);
    float _1839 = exp2(_1829);
    float _1841 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1833);
    float _1843 = -_1793;
    float _1845 = _1771 + _1843;
    float _1847 = fma(_1837, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1849 = _1819 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1851 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1841);
    float _1853 = -_1821;
    float _1855 = _1773 + _1853;
    float _1857 = fma(_1837, _1847, -0.212114393711090087890625);
    float _1859 = log2(_1803);
    float _1861 = _1819 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1863 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1849);
    float _1865 = _1783 + 1.0;
    float _1867 = 1.0 / _1851;
    float _1869 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1861);
    float _1871 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1863);
    float _1873 = -_1783;
    float _1875 = fma(_1839, _1865, _1873);
    float _1877 = sqrt(_1831);
    float _1879 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1869);
    float _1881 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1871);
    float _1883 = _1859 * 0.693147182464599609375;
    float2 _5541 = float2(_1845, _1855);
    float _1885 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5541, float2(0.0), isnan(_5541)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5541, float2(0.0), isnan(_5541)), level(0.0)).x;
    float _1887 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1879);
    float _1889 = fma(_1837, _1857, 1.570728778839111328125);
    float _1891 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1893 = _1881 * _1867;
    float _1895 = _1887 * _1867;
    float _1897 = fma(_1875, 0.5, 0.5);
    float _1899 = fma(_1893, 0.5, 0.5);
    float _1901 = fma(_1895, -0.5, 0.5);
    float _1903 = _1877 * 0.636619746685028076171875;
    float _1905 = -_1889;
    float _1907 = fma(_1903, _1905, 1.0);
    float3 _5585 = float3(_1899, _1901, _1891);
    float _1909 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5585, float3(0.0), isnan(_5585)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5585, float3(0.0), isnan(_5585)), level(0.0)).x;
    float3 _5596 = float3(_1899, _1901, _1891);
    float4 _1912 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5596, float3(0.0), isnan(_5596)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5596, float3(0.0), isnan(_5596)), level(0.0)).xyzw;
    float _1914 = _1912.x;
    float _1916 = _1912.y;
    float _1918 = _1912.z;
    float _1920 = _1912.w;
    float2 _5612 = float2(_1907, _1897);
    float3 _1924 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5612, float2(0.0), isnan(_5612)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5612, float2(0.0), isnan(_5612)), level(0.0)).xyz;
    float _1926 = _1924.x;
    float _1928 = _1924.y;
    float _1930 = _1924.z;
    float2 _5626 = float2(_1579, _1593);
    float3 _1932 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5626, float2(0.0), isnan(_5626)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5626, float2(0.0), isnan(_5626)), level(0.0)).xyz;
    float _1934 = _1932.x;
    float _1936 = _1932.y;
    float _1938 = _1932.z;
    float _1940 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1942 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1944 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1946 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1948 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1940);
    float _1950 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1942);
    float _1952 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1954 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1948);
    float _1956 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1950);
    float _1958 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1960 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1944);
    float _1962 = _1954 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1964 = _1956 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1966 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1968 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1946);
    float _1970 = 1.0 / _1962;
    float _1972 = _1964 + _1962;
    float _1974 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1966);
    float _1976 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1952);
    bool _1978 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1980 = isnan(0.5);
    bool _1982 = _1978 || _1980;
    bool _1984 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1986 = _1982 || _1984;
    float _1988 = _1415 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1990 = _1972 * _1970;
    float _1992 = _1990 * 0.5;
    float _1994 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1996 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1994);
    float _1998 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2000 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1958);
    float _2002 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2004 = 1.0 / _1996;
    float _2006 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1998);
    float _2008 = _1415 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2010 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1968);
    float _2012 = -_1403;
    float _2014 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2008);
    float _2016 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2014);
    float _2018 = _2002 * _2016;
    float _2020 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2022 = _2004 * _2020;
    float _2024 = abs(_2022);
    float _2026 = log2(_2024);
    float _2028 = _2026 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2030 = _1415 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2032 = -_1403;
    float _2034 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1988);
    float _2036 = -_1403;
    float _2038 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2030);
    float _2040 = exp2(_2028);
    float _2042 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2034);
    float _2044 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1960);
    float _2046 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2038);
    float _2048 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1976);
    float _2050 = fma(_2002, _2002, 1.0);
    float _2052 = rsqrt(_2050);
    float _2054 = fma(_2040, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2056 = precise::clamp(_2054, 0.0, 1.0);
    float _2058 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2006);
    float _2060 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2000);
    float _2062 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1974);
    float _2064 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_72.x = _2058;
    out.m_72.y = _2060;
    out.m_72.z = _2062;
    float _2066 = fma(_2056, -2.0, 3.0);
    float _2068 = _2056 * _2056;
    float _2070 = fma(_2064, _2058, _2018);
    float _2072 = _2002 * _2042;
    float _2074 = _2068 * _2066;
    float _2076 = _1819 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2078 = _2002 * _2046;
    float _2080 = fma(_2064, _2060, _2072);
    float _2082 = -_2074;
    float _2084 = _2082 + 1.0;
    float _2086 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2076);
    float _2088 = _2002 * _2052;
    float _2090 = _2058;
    float _2092 = _2088;
    float _2094 = _2042;
    if (!_1986)
    {
        _2090 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2096 = _2090;
    float _2098 = fma(_2064, _2062, _2078);
    float _2100 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2086);
    float _2102 = -_2044;
    float _2104 = _2088 * _2102;
    float _2106 = -_2010;
    float _2108 = _2088 * _2106;
    float _2110 = -_2048;
    float _2112 = _2088 * _2110;
    float _2114 = _2100;
    if (!_1986)
    {
        float _2116 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2118 = _2096 + _2116;
        _2092 = _2118;
    }
    float _2120 = _2092;
    float _2122 = fma(_2052, _2016, _2104);
    float _2124 = fma(_2052, _2042, _2108);
    float _2126 = fma(_2052, _2046, _2112);
    float _2128 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2130 = in.m_74.x;
    bool _2132 = _2022 <= 8000.0;
    bool _2134 = isnan(_2022);
    bool _2136 = _2132 || _2134;
    bool _2138 = isnan(8000.0);
    bool _2140 = _2136 || _2138;
    float _2142 = float(_2140);
    float _2144 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2074);
    float _2146 = _2002;
    float _2148 = _2126;
    float _2150 = _2124;
    if (!_1986)
    {
        float _2152 = 1.0 / _2120;
        _2146 = _2152;
    }
    float _2154 = _2146;
    out.m_76.x = _2122;
    out.m_76.y = _2124;
    out.m_76.z = _2126;
    float _2156 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2100);
    float _2158 = _2142 * _2144;
    float _2160 = _1851 * 0.5;
    if (!_1986)
    {
        float _2162 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2164 = _2022 + _2162;
        _2114 = _2164;
    }
    float _2166 = _2114;
    float _2168 = _2156 + _1851;
    float _2170 = _2158 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2172 = exp2(_2128);
    float _2174 = fma(_1887, -0.5, _2160);
    out.gl_Position.x = _1881;
    out.gl_Position.y = _1887;
    out.gl_Position.z = _2156;
    out.gl_Position.w = _1851;
    float _2176 = _2174;
    if (_1986)
    {
        _2094 = 1.0;
    }
    float _2178 = _2094;
    float _2180 = _1881 + _1851;
    float _2182 = _2044 + _2070;
    float _2184 = _2178;
    float _2186 = _1851;
    if (!_1986)
    {
        float _2188 = _2166 * _2154;
        float _2190 = precise::clamp(_2188, 0.0, 1.0);
        _2184 = _2190;
    }
    float _2192 = _2184;
    float _2194 = _2010 + _2080;
    float _2196 = _2048 + _2098;
    bool _2198 = _1603 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2200 = isnan(_1603);
    bool _2202 = _2198 || _2200;
    bool _2204 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2206 = _2202 || _2204;
    float _2208 = _2168 * 0.5;
    float _2210 = _2180 * 0.5;
    out.m_78.x = _2182;
    out.m_78.y = _2194;
    out.m_78.z = _2196;
    float _2212 = -_2172;
    float _2214 = _2212 + 1.0;
    out.m_80.x = _2210;
    out.m_80.y = _2174;
    out.m_80.z = _2208;
    out.m_80.w = _1851;
    float _2216 = _2214 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2206)
    {
        _2148 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2218 = _2148;
    float _2220 = _2218;
    float _2222 = _2218;
    if (!_2206)
    {
        _2150 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2224 = _2150;
    float _2226 = _2192 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2228 = _2224;
    float _2230 = _2224;
    if (!_2206)
    {
        _2186 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2232 = _2186;
    float _2234 = _2232;
    float _2236 = _2232;
    if (!_2206)
    {
        _2176 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2238 = _2176;
    float _2240 = -_1885;
    float _2242 = _2240 + 1.0;
    float _2244 = _2242 * _2170;
    float _2246 = precise::clamp(_2244, 0.0, 1.0);
    float _2248 = -_2246;
    float _2250 = fma(_2248, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2252 = -_2216;
    float _2254 = _2252 + 1.0;
    float _2256 = _2250 * _2130;
    float _2258 = _2256 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2260 = _2216 * _1909;
    float _2262 = _1920 * _2254;
    float _2264 = _2254;
    float _2266 = _1934;
    float _2268 = _2238;
    float _2270 = _2238;
    if (!_2206)
    {
        _2264 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2272 = _2264;
    out.m_82.x = _2258;
    float _2274 = _1920 * _2260;
    float _2276 = _1930 * _2260;
    float _2278 = fma(_1926, _2274, _1914);
    float _2280 = fma(_1928, _2274, _1916);
    float _2282 = fma(_1920, _2276, _1918);
    out.m_84.x = _2278;
    out.m_84.y = _2280;
    out.m_84.z = _2282;
    out.m_84.w = _2262;
    out.m_86.x = _1934;
    out.m_86.y = _1936;
    out.m_86.z = _1938;
    float _2284 = _2272;
    float _2286 = _2272;
    if (!_2206)
    {
        _2266 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2288 = _2266;
    bool _2290 = !_2206;
    float _2292 = _2288;
    float _2294 = _2288;
    if (!_2290)
    {
        bool _2296 = _1603 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2298 = isnan(_1603);
        bool _2300 = _2296 || _2298;
        bool _2302 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2304 = _2300 || _2302;
        if (!_2304)
        {
            float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2308 = _1603 + _2306;
            float _2310 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2312 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2310;
            float _2314 = 1.0 / _2312;
            float _2316 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2318 = _2316 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2320 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2322 = _2320 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2324 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2326 = _2324 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2328 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2330 = _2328 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2332 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2334 = _2332 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2336 = _2308 * _2314;
            float _2338 = precise::clamp(_2336, 0.0, 1.0);
            float _2340 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2342 = _2340 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2344 = fma(_2338, _2318, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2346 = fma(_2338, _2342, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2348 = fma(_2338, _2322, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2350 = fma(_2338, _2326, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2352 = fma(_2338, _2330, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2354 = fma(_2338, _2334, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2236 = _2344;
            _2286 = _2352;
            _2222 = _2346;
            _2230 = _2350;
            _2270 = _2348;
            _2294 = _2354;
            _2356 = true;
        }
        else
        {
            bool _2358 = _1603 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2360 = isnan(_1603);
            bool _2362 = _2358 || _2360;
            bool _2364 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2366 = _2362 || _2364;
            if (!_2366)
            {
                _2220 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2368 = _2220;
            _2222 = _2368;
            if (!_2366)
            {
                _2234 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2370 = _2234;
            _2236 = _2370;
            if (!_2366)
            {
                _2268 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2372 = _2268;
            _2270 = _2372;
            if (!_2366)
            {
                _2228 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2374 = _2228;
            _2230 = _2374;
            if (!_2366)
            {
                _2284 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2376 = _2284;
            _2286 = _2376;
            if (!_2366)
            {
                _2292 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2378 = _2292;
            bool _2380 = !_2366;
            _2294 = _2378;
            if (!_2380)
            {
                bool _2382 = _1603 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2384 = isnan(_1603);
                bool _2386 = _2382 || _2384;
                bool _2388 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2390 = _2386 || _2388;
                if (!_2390)
                {
                    float _2392 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2394 = _1603 + _2392;
                    float _2396 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2398 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2396;
                    float _2400 = 1.0 / _2398;
                    float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2404 = _2402 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2406 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2408 = _2406 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2410 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2412 = _2410 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2414 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2416 = _2414 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2418 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2420 = _2418 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2422 = _2394 * _2400;
                    float _2424 = precise::clamp(_2422, 0.0, 1.0);
                    float _2426 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2428 = _2426 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2430 = fma(_2424, _2404, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2432 = fma(_2424, _2428, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2434 = fma(_2424, _2408, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2436 = fma(_2424, _2412, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2438 = fma(_2424, _2416, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2440 = fma(_2424, _2420, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2236 = _2430;
                    _2286 = _2438;
                    _2222 = _2432;
                    _2230 = _2436;
                    _2270 = _2434;
                    _2294 = _2440;
                    _2356 = true;
                }
                else
                {
                    _2236 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2286 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2222 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2230 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2270 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2294 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2356 = false;
    float _2442 = _2236;
    float _2444 = _2286;
    float _2446 = _2222;
    float _2448 = _2230;
    float _2450 = _2270;
    float _2452 = _2294;
    float _2454 = fma(_2194, -0.5, 0.5);
    float _2456 = precise::clamp(_2454, 0.0, 1.0);
    float _2458 = -_2442;
    float _2460 = _2458 + _2444;
    float _2462 = -_2446;
    float _2464 = _2462 + _2448;
    out.m_88.x = 0.0;
    float _2466 = fma(_2456, _2460, _2442);
    float _2468 = -_2450;
    float _2470 = _2468 + _2452;
    float _2472 = fma(_2456, _2464, _2446);
    float _2474 = _2466 * 0.586610972881317138671875;
    bool _2476 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2478 = fma(_2456, _2470, _2450);
    float _2480 = _2226 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2482 = fma(_2472, 0.298911988735198974609375, _2474);
    bool _2484 = _2192 > 0.0;
    bool _2486 = isnan(_2192);
    bool _2488 = _2484 || _2486;
    bool _2490 = isnan(0.0);
    bool _2492 = _2488 || _2490;
    float _2494 = fma(_2478, 0.114477999508380889892578125, _2482);
    out.m_51.x = _2480;
    float _2496 = -_2494;
    float _2498 = _2472 + _2496;
    float _2500 = -_2494;
    float _2502 = _2466 + _2500;
    float _2504 = -_2494;
    float _2506 = _2478 + _2504;
    float _2508 = fma(_2498, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2494);
    float _2510 = fma(_2502, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2494);
    float _2512 = fma(_2506, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2494);
    bool _2514 = !_2476;
    if (!_2514)
    {
        float _2516 = -_1569;
        float _2518 = _2516 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2520 = -_1573;
        float _2522 = _2520 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2524 = -_1577;
        float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2528 = _2518 * _2518;
        float _2530 = fma(_2522, _2522, _2528);
        float _2532 = fma(_2526, _2526, _2530);
        float _2534 = sqrt(_2532);
        float _2536 = rsqrt(_2532);
        float _2538 = -_2534;
        float _2540 = _2538 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2542 = _2540 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2544 = precise::clamp(_2542, 0.0, 1.0);
        float _2546 = _2522 * _2536;
        float _2548 = _2518 * _2536;
        float _2550 = abs(_2544);
        float _2552 = log2(_2550);
        float _2554 = _2526 * _2536;
        float _2556 = _2546 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2558 = _2194 * _2548;
        float _2560 = -_2548;
        float _2562 = -_2556;
        float _2564 = fma(_2560, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2562);
        float _2566 = fma(_2182, _2546, _2558);
        float _2568 = -_2554;
        float _2570 = fma(_2568, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2564);
        float _2572 = fma(_2196, _2554, _2566);
        float _2574 = precise::clamp(_2572, 0.0, 1.0);
        float _2576 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2578 = _2570 + _2576;
        float _2580 = _2552 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2582 = _2578 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2584 = precise::clamp(_2582, 0.0, 1.0);
        float _2586 = exp2(_2580);
        float _2588 = _2586 * _2584;
        float _2590 = _2574 * _2588;
        float _2592 = _2590 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2594 = _2590 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2596 = _2590 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _2592;
        out.m_88.y = _2594;
        out.m_88.z = _2596;
    }
    out.m_90.x = _2508;
    out.m_90.y = _2510;
    out.m_90.z = _2512;
    if (_2492)
    {
        return out;
    }
    float _2598 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_51.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2598;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2356 = false;
    bool _549 = false;
    bool _399 = false;
    bool _205 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_48.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_51.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2655 = as_type<float>(_125);
        out.gl_Position.z = _2655;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_53.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_109);
        _119 = _147;
    }
    float _149 = _119;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_51.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2725 = as_type<float>(_163);
        out.gl_Position.z = _2725;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _169 = as_type<int>(_165) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_165) & 2;
    bool _175 = _173 != 0;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_167;
    float _203;
    if (!_185)
    {
        float _187 = in.m_58.x;
        float _189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _191 = _187 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _195 = _193 * _189;
        float _197 = floor(_195);
        float _199 = -_197;
        float _201 = _195 + _199;
        _203 = _201;
        _205 = true;
    }
    else
    {
        float _207 = float(_109);
        float _209 = 1.0 / _207;
        float _211 = _143 * _209;
        _203 = _211;
    }
    _205 = false;
    float _213 = _203;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _217 = _213 + _215;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _221 = _213 + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _225 = _213 + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _233 = _231 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _235;
    bool _239 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _241 = isnan(_213);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = 1.0 / _229;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _255 = 1.0 / _237;
    float _257 = 1.0 / _233;
    float _259 = _217 * _251;
    bool _261 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _263 = isnan(_213);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = -_249;
    float _275 = _273 + 1.0;
    float _277 = _271 * _275;
    float _279 = _221 * _255;
    bool _281 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _283 = isnan(_213);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = -_271;
    float _295 = _293 + 1.0;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _299 = _297 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _301 = _291 * _295;
    float _303 = -_291;
    float _305 = _303 + 1.0;
    float _307 = _225 * _257;
    bool _309 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _311 = isnan(_213);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _321;
    float _325 = fma(_299, _307, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _335 = fma(_323, _259, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _337 = _319 * _305;
    float _339 = fma(_329, _259, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _341 = fma(_333, _307, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _343 = -_319;
    float _345 = _343 + 1.0;
    float _347 = _335 * _337;
    float _349 = _339 * _337;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _351;
    float _355 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[143].x, _347);
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _357;
    float _361 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[143].y, _349);
    float _363 = fma(_353, _279, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _365 = fma(_325, _301, _355);
    float _367 = fma(_359, _279, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _369 = fma(_341, _301, _361);
    float _371 = fma(_363, _277, _365);
    float _373 = fma(_367, _277, _369);
    float _375 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[146].x, _371);
    float _377 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[146].y, _373);
    bool _379 = !_253;
    float _397;
    if (!_379)
    {
        float _381 = in.m_58.x;
        float _383 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _385 = _381 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _387 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _389 = _387 * _383;
        float _391 = floor(_389);
        float _393 = -_391;
        float _395 = _389 + _393;
        _397 = _395;
        _399 = true;
    }
    else
    {
        float _401 = float(_109);
        float _403 = 1.0 / _401;
        float _405 = _143 * _403;
        _397 = _405;
    }
    _399 = false;
    float _407 = _397;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _411 = _407 + _409;
    float _413 = in.m_60.x;
    float _415 = in.m_60.y;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _421 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _423 = isnan(_407);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _437 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _439 = isnan(_407);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _449;
    bool _453 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _455 = isnan(_407);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _461 = _457 || _459;
    float _463 = float(_461);
    float _465 = 1.0 / _419;
    float _467 = -_431;
    float _469 = _467 + 1.0;
    bool _471 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _473 = _447 * _469;
    float _475 = -_447;
    float _477 = _475 + 1.0;
    float _479 = 1.0 / _435;
    float _481 = _451 * _465;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _487 = _377 * _415;
    float _489 = fma(_481, _411, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _491 = _485 * _479;
    float _493 = _489 * _473;
    float _495 = -_463;
    float _497 = _495 + 1.0;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _501 = _407 + _499;
    float _503 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[115].x, _493);
    float _505 = _431 * _497;
    float _507 = fma(_491, _501, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _511 = _375 * _413;
    float _513 = fma(_507, _505, _503);
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _517 = _509 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _519 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[117].x, _513);
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _523 = _515 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _525 = _519 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _527 = _521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _517;
    out.m_62.y = _527;
    out.m_62.z = _523;
    out.m_62.w = _525;
    bool _529 = !_471;
    float _547;
    if (!_529)
    {
        float _531 = in.m_58.x;
        float _533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _535 = _531 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _537 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[11].w, _143);
        float _539 = _537 * _533;
        float _541 = floor(_539);
        float _543 = -_541;
        float _545 = _539 + _543;
        _547 = _545;
        _549 = true;
    }
    else
    {
        float _551 = float(_109);
        float _553 = 1.0 / _551;
        float _555 = _143 * _553;
        _547 = _555;
    }
    _549 = false;
    float _557 = _547;
    float _559 = in.m_58.x;
    float _561 = in.m_58.y;
    float _563 = in.m_58.z;
    float _565 = in.m_58.w;
    float _567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _569 = in.m_48.x;
    float _571 = in.m_48.y;
    float _573 = in.m_48.z;
    int _575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _577 = _575 != 0;
    int _579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _581 = _579 != 0;
    int _583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _585 = _583 != 0;
    float _587 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _591 = _589 != 0;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _597 = _559 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _599 = _559 > 0.5;
    float _601 = _561 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _603 = _565 > 0.5;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _609 = -_179;
    int _611 = _599 ? as_type<int>(_609) : as_type<int>(_179);
    float _613 = _571 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _617 = _615 != 0;
    int _619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _621 = _619 != 0;
    float _623 = 1.0 / _607;
    float _625 = -_593;
    float _627 = fma(_597, 2.0, _625);
    bool _629 = !_577;
    float _631 = _629 ? _179 : as_type<float>(_611);
    float _633 = _571 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _635 = _561 > 0.5;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _641 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[5].x, _613);
    float _643 = fma(_601, -2.0, _595);
    float _645 = -_183;
    int _647 = _635 ? as_type<int>(_645) : as_type<int>(_183);
    float _649 = _559 * 2.0;
    float _651 = 1.0 / _639;
    bool _653 = !_581;
    float _655 = _653 ? _183 : as_type<float>(_647);
    float _657 = _563 * 2.0;
    int _659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _661 = _659 != 0;
    float _663 = _571 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _669;
    float _673 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[6].x, _633);
    float _675 = floor(_657);
    float _677 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[4].x, _663);
    float _679 = _671 * _623;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _685 = -_179;
    int _687 = _635 ? as_type<int>(_685) : as_type<int>(_179);
    float _689 = _561 + _563;
    bool _691 = _563 > 0.5;
    float _693 = _561 * 2.0;
    float _695 = 1.0 / _667;
    float _697 = _683 * _651;
    float _699 = _689 + (-1.0);
    float _701 = -_179;
    int _703 = _691 ? as_type<int>(_701) : as_type<int>(_179);
    float _705 = -_143;
    float _707 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[76].x, _627);
    float _709 = -_183;
    float _711 = _691 ? _709 : _183;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _713;
    float _717 = floor(_649);
    float _719 = _561 + _559;
    bool _721 = _675 > 0.0;
    float _723 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _725 = !_617;
    float _727 = _725 ? _179 : as_type<float>(_687);
    float _729 = _719 + (-1.0);
    bool _731 = _675 >= 0.0;
    bool _733 = isnan(_675);
    bool _735 = _731 || _733;
    bool _737 = isnan(0.0);
    bool _739 = _735 || _737;
    float _741 = _631 + 0.5;
    float _743 = _715 * _695;
    float _745 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _747 = !_621;
    float _749 = _747 ? _183 : _711;
    float _751 = floor(_693);
    int _753 = _739 ? 0 : 1;
    float _755 = fma(_573, (*spvDescriptorSet0.vp_c10)._m0[5].z, _641);
    float _757 = fma(_573, (*spvDescriptorSet0.vp_c10)._m0[6].z, _673);
    float _759 = _711;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    int _763 = as_type<int>(_745);
    if (!_661)
    {
        _759 = _563;
    }
    float _765 = _759;
    float _767 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _643);
    bool _769 = _717 > 0.0;
    float _771 = _655 + (-0.5);
    bool _773 = _717 >= 0.0;
    bool _775 = isnan(_717);
    bool _777 = _773 || _775;
    bool _779 = isnan(0.0);
    bool _781 = _777 || _779;
    float _783 = fma(_573, (*spvDescriptorSet0.vp_c10)._m0[4].z, _677);
    int _785 = ~_753;
    int _787 = _785 + 1;
    int _789 = _787 + 1;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _793 = _557 + _791;
    int _795 = _789;
    float _797 = _765;
    if (!_721)
    {
        int _799 = ~_753;
        int _801 = _799 + 1;
        _795 = _801;
    }
    int _803 = _795;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _807 = _557 + _805;
    int _809 = _781 ? 0 : 1;
    float _811 = fma(_679, _793, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _813 = fma(_697, _807, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _815 = ~_809;
    int _817 = _815 + 1;
    int _819 = _817 + 1;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _823 = _557 + _821;
    int _825 = _819;
    if (!_769)
    {
        int _827 = ~_809;
        int _829 = _827 + 1;
        _825 = _829;
    }
    int _831 = _825;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _835 = _557 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _837 = isnan(_557);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _843 = _839 || _841;
    float _845 = float(_843);
    float _847 = fma(_743, _823, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _849 = _751 >= 0.0;
    bool _851 = isnan(_751);
    bool _853 = _849 || _851;
    bool _855 = isnan(0.0);
    bool _857 = _853 || _855;
    float _859 = -_749;
    float _861 = _859 + 0.5;
    if (_661)
    {
        _797 = _561;
    }
    float _863 = _797;
    float _865 = -_845;
    float _867 = _865 + 1.0;
    bool _869 = _751 > 0.0;
    float _871 = _755 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _873 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[83].w, _833);
    bool _875 = _557 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _877 = isnan(_557);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _883 = _879 || _881;
    float _885 = float(_883);
    float _887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _889 = _871;
    if (!_661)
    {
        _761 = _561;
    }
    float _891 = _761;
    float _893 = _861 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _895 = 0.0;
    float _897 = _891;
    if (!_661)
    {
        _895 = _563;
    }
    float _899 = _895;
    float _901 = _885 * _867;
    float _903 = _899;
    if (_661)
    {
        _897 = _559;
    }
    float _905 = _897;
    float _907 = -_885;
    float _909 = _907 + 1.0;
    if (_661)
    {
        _903 = _561;
    }
    float _911 = _903;
    float _913 = _783 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _915 = _857 ? 0 : 1;
    float _917 = _757 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _921 = _919 != 0;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _925 = _923 != 0;
    int _927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _929 = _927 != 0;
    float _931 = _911 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _933 = _557 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _935 = isnan(_557);
    bool _937 = _933 || _935;
    bool _939 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _941 = _937 || _939;
    float _943 = float(_941);
    float _945 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _873);
    bool _947 = _557 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _949 = isnan(_557);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _955 = _951 || _953;
    float _957 = float(_955);
    float _959 = _567 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _961 = _587 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _963 = -_943;
    float _965 = _963 + 1.0;
    float _967 = _887 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _969 = fma(_959, _741, _707);
    float _971 = _957 * _909;
    float _973 = -_961;
    float _975 = -_767;
    float _977 = fma(_973, _771, _975);
    float _979 = _811 * _971;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _983 = -_957;
    float _985 = _983 + 1.0;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _989 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _991 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[83].z, _981);
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _995 = _905 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _997 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[131].x, _979);
    float _999 = _845 * _965;
    float _1001 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _991);
    float _1003 = -_993;
    float _1005 = fma(_995, 2.0, _1003);
    float _1007 = fma(_931, -2.0, _987);
    float _1009 = -_183;
    int _1011 = _603 ? as_type<int>(_1009) : as_type<int>(_183);
    float _1013 = fma(_813, _901, _997);
    bool _1015 = !_591;
    float _1017 = _1015 ? _179 : as_type<float>(_703);
    float _1019 = -_143;
    float _1021 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1005);
    bool _1023 = !_585;
    float _1025 = _1023 ? _183 : as_type<float>(_1011);
    float _1027 = _727 + 0.5;
    float _1029 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1031 = _1017 + 0.5;
    float _1033 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1007);
    float _1035 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1037 = fma(_847, _999, _1013);
    float _1039 = fma(_967, _1031, _1021);
    float _1041 = _1025 + (-0.5);
    float _1043 = _1035 * _989;
    float _1045 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1047 = log2(_1045);
    float _1049 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1051 = _917 + _1049;
    float _1053 = -_945;
    float _1055 = _1053 + 1.0;
    bool _1057 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1059 = isnan(0.0);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1065 = _1061 || _1063;
    float _1067 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1069 = ~_915;
    int _1071 = _1069 + 1;
    int _1073 = _1071 + 1;
    float _1075 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1079 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1067);
    float _1081 = _1029 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1083 = _1073;
    if (!_869)
    {
        int _1085 = ~_915;
        int _1087 = _1085 + 1;
        _1083 = _1087;
    }
    int _1089 = _1083;
    float _1091 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1077);
    float _1093 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1079);
    float _1095 = -_1081;
    float _1097 = -_1033;
    float _1099 = fma(_1095, _1041, _1097);
    float _1101 = _1047 * _143;
    float _1103 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1037);
    float _1105 = -_1093;
    float _1107 = _1105 + 1.0;
    float _1109 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1111 = _871 + _1109;
    float _1113 = -_1001;
    float _1115 = _1113 + 1.0;
    float _1117 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1119 = _913 + _1117;
    float _1121 = -_1107;
    float _1123 = fma(_631, _1121, _969);
    float _1125 = exp2(_1101);
    float _1127 = _893 * _1075;
    float _1129 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1131 = -_1115;
    float _1133 = fma(_1017, _1131, _1039);
    float _1135 = _1111 * _1111;
    bool _1137 = !_921;
    int _1139 = _1137 ? 0 : 1;
    float _1141 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1129);
    bool _1143 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1145 = isnan(1.0);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1151 = _1147 || _1149;
    out.m_64.x = _1043;
    out.m_64.y = _1127;
    int _1153 = abs(_1139);
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1157 = 1.0 + _1155;
    float _1159 = fma(_1119, _1119, _1135);
    float _1161 = in.m_66.x;
    float _1163 = in.m_66.y;
    float _1165 = in.m_66.z;
    float _1167 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1141);
    float _1169 = 1.0 / _1157;
    float _1171 = fma(_1051, _1051, _1159);
    bool _1173 = !_925;
    int _1175 = _1173 ? 0 : 1;
    float _1177 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1091);
    float _1179 = float(_803);
    float _1181 = -_1125;
    float _1183 = _1181 + 1.0;
    float _1185 = -_1177;
    float _1187 = _1185 + 1.0;
    bool _1189 = _1167 >= 0.0;
    float _1191 = rsqrt(_1171);
    int _1193 = abs(_1175);
    float _1195 = fma(_655, _1187, _977);
    float _1197 = float(_831);
    float _1199 = fma(_1025, _1055, _1099);
    float _1201 = float(_1153);
    float _1203 = _1103 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1205 = _1065 ? _1183 : 0.0;
    float _1207 = _1201 * _1179;
    float _1209 = _1169;
    if (_1151)
    {
        float _1211 = _1205 * _1169;
        _145 = _1211;
    }
    float _1213 = _145;
    float _1215 = _1207 * (-2.0);
    float _1217 = float(_1193);
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    if (_1189)
    {
        _1209 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1221 = _1209;
    float _1223 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1225 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1227 = fma(_745, _1215, _745);
    float _1229 = _1217 * _1197;
    float _1231 = fma(_1215, _1161, _1161);
    float _1233 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1235 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1237 = _1225 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1189)
    {
        float _1239 = _1221 * 5.0;
        _763 = as_type<int>(_1239);
    }
    int _1241 = _763;
    float _1243 = _1111 * _1191;
    out.m_68.x = _1123;
    out.m_68.y = _1195;
    out.m_68.z = _1133;
    out.m_68.w = _1199;
    float _1245 = _1229 * (-2.0);
    float _1247 = -_1243;
    float _1249 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1111);
    out.m_70.x = _1233;
    out.m_70.y = _1235;
    out.m_70.z = _1237;
    out.m_70.w = _1203;
    float _1251 = fma(_723, _1245, _723);
    float _1253 = fma(_1245, _1163, _1163);
    float _1255 = _1249 * _1249;
    if (_1189)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4484 = as_type<float>(_1241);
        out.gl_Position.z = _4484;
    }
    if (_1189)
    {
        out.m_51.x = 0.0;
    }
    float _1257 = _1119 * _1191;
    bool _1259 = !_929;
    int _1261 = _1259 ? 0 : 1;
    float _1263 = -_1257;
    float _1265 = fma(_1263, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1119);
    if (_1189)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1267 = -_1243;
    float _1269 = fma(_1267, (*spvDescriptorSet0.vp_c9)._m0[18].w, _871);
    float _1271 = -_1257;
    float _1273 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[18].w, _913);
    float _1275 = _1051 * _1191;
    float _1277 = _559 + (-0.5);
    float _1279 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1281 = _1269 + _1279;
    float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1285 = _1273 + _1283;
    int _1287 = abs(_1261);
    float _1289 = fma(_1277, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1231);
    float _1291 = _1281 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1293 = -_1275;
    float _1295 = fma(_1293, (*spvDescriptorSet0.vp_c9)._m0[18].w, _917);
    float _1297 = _561 + (-0.5);
    float _1299 = fma(_1227, _1213, _1289);
    float _1301 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1291);
    float _1303 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1305 = _1295 + _1303;
    float _1307 = float(_1089);
    float _1309 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1253);
    float _1311 = fma(_1265, _1265, _1255);
    float _1313 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1301);
    float _1315 = _1299 * 0.15915493667125701904296875;
    float _1317 = -_1275;
    float _1319 = fma(_1317, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1051);
    float _1321 = _563 + _559;
    float _1323 = float(_1287);
    float _1325 = fma(_1251, _1213, _1309);
    bool _1327 = _1313 >= 0.0;
    float _1329 = fma(_1319, _1319, _1311);
    float _1331 = _1323 * _1307;
    float _1333 = _1321 + (-1.0);
    float _1335 = _1325 * 0.15915493667125701904296875;
    float _1337 = sqrt(_1329);
    float _1339 = _1331 * (-2.0);
    float _1341 = fma(_1333, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1343 = _563 + (-0.5);
    float _1345 = fma(_1339, _1165, _1165);
    float _1347 = fma(_1341, _1339, _1341);
    float _1349 = _1331;
    int _1351 = as_type<int>(_1343);
    if (_1327)
    {
        _1349 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1353 = _1349;
    float _1355 = _1315 * 6.283185482025146484375;
    float _1357 = sin(_1355);
    float _1359 = fma(_1343, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1345);
    if (_1327)
    {
        out.m_51.x = 0.0;
    }
    if (_1327)
    {
        float _1361 = _1353 * 5.0;
        _1351 = as_type<int>(_1361);
    }
    int _1363 = _1351;
    float _1365 = fma(_1347, _1213, _1359);
    float _1367 = _1315 * 6.283185482025146484375;
    float _1369 = cos(_1367);
    if (_1327)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4687 = as_type<float>(_1363);
        out.gl_Position.z = _4687;
    }
    float _1371 = _1365 * 0.15915493667125701904296875;
    float _1373 = _1335 * 6.283185482025146484375;
    float _1375 = sin(_1373);
    float _1377 = _1335 * 6.283185482025146484375;
    float _1379 = cos(_1377);
    float _1381 = _1369;
    if (_1327)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1383 = _1371 * 6.283185482025146484375;
    float _1385 = cos(_1383);
    float _1387 = _1191 * _1337;
    float _1389 = _487 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1391 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _1393 = _1357 * _1375;
    float _1395 = _1369 * _1379;
    float _1397 = _1387 * _1389;
    float _1399 = _1357 * _1379;
    float _1401 = _1371 * 6.283185482025146484375;
    float _1403 = sin(_1401);
    float _1405 = _1391 * _1397;
    float _1407 = _511 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1409 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _1411 = _1369 * _1375;
    float _1413 = _1387 * _1407;
    float _1415 = _1369 * _1385;
    float _1417 = _1379 * _1385;
    float _1419 = _1357 * _1385;
    float _1421 = _1409 * _1413;
    float _1423 = _1415 * _1405;
    float _1425 = _1375 * _1385;
    float _1427 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1429 = _1427 * 0.5;
    float _1431 = fma(_1403, _1395, _1393);
    float _1433 = -_1399;
    float _1435 = fma(_1403, _1411, _1433);
    float _1437 = -_1405;
    float _1439 = _1403 * _1437;
    float _1441 = -_1411;
    float _1443 = fma(_1403, _1399, _1441);
    float _1445 = fma(_1431, _1421, _1423);
    float _1447 = _1419 * _1405;
    float _1449 = fma(_1417, _1421, _1439);
    float _1451 = fma(_1403, _1393, _1395);
    float _1453 = fma(_1435, _1429, _1445);
    float _1455 = fma(_1443, _1421, _1447);
    float _1457 = fma(_1425, _1429, _1449);
    float _1459 = _1453 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1461 = fma(_1451, _1429, _1455);
    float _1463 = _1453 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1465 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1459);
    float _1467 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1463);
    float _1469 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1465);
    float _1471 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1467);
    float _1473 = _1469 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1475 = _1471 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1477 = _917 + _1473;
    float _1479 = _913 + _1475;
    float _1481 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1483 = _1477 + _1481;
    float _1485 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1487 = _1479 + _1485;
    float _1489 = _1483 * _1483;
    float _1491 = fma(_1487, _1487, _1489);
    float _1493 = _1453 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1495 = sqrt(_1491);
    float _1497 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1493);
    float _1499 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1497);
    float _1501 = _1499 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1503 = _871 + _1501;
    bool _1505 = _1495 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1507 = _1501;
    float _1509 = _1479;
    float _1511 = _1503;
    float _1513 = _1477;
    if (!_1505)
    {
        _1507 = _1477;
    }
    float _1515 = _1507;
    float _1517 = _1515;
    if (!_1505)
    {
        _889 = _1503;
    }
    float _1519 = _889;
    bool _1521 = !_1505;
    float _1523 = _1519;
    if (!_1521)
    {
        float _1525 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1527 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1529 = _1495 + _1527;
        float _1531 = rsqrt(_1491);
        float _1533 = _1529 * _1525;
        float _1535 = _1503 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1537 = _1533 * 0.15915493667125701904296875;
        float _1539 = _1537 * 6.283185482025146484375;
        float _1541 = sin(_1539);
        float _1543 = _1537 * 6.283185482025146484375;
        float _1545 = cos(_1543);
        float _1547 = fma(_1541, _1535, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1549 = _1531 * _1547;
        float _1551 = _1545 + (-1.0);
        float _1553 = fma(_1487, _1549, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1555 = fma(_1483, _1549, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1557 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1559 = fma(_1503, _1545, _1557);
        _1523 = _1559;
        _1509 = _1553;
        _1517 = _1555;
    }
    float _1561 = _1523;
    float _1563 = _1509;
    float _1565 = _1517;
    float _1567 = -_1243;
    float _1569 = fma(_1567, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1561);
    float _1571 = -_1257;
    float _1573 = fma(_1571, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1563);
    float _1575 = -_1275;
    float _1577 = fma(_1575, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1565);
    float _1579 = fma(_1563, 6.2500002968590706586837768554688e-05, 0.5);
    float _1581 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1583 = _1569 + _1581;
    float _1585 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1587 = _1573 + _1585;
    float _1589 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1591 = _1577 + _1589;
    float _1593 = fma(_1565, 6.2500002968590706586837768554688e-05, 0.5);
    float _1595 = _1583 * _1583;
    float _1597 = fma(_1587, _1587, _1595);
    float _1599 = fma(_1591, _1591, _1597);
    float _1601 = rsqrt(_1599);
    float _1603 = sqrt(_1599);
    float _1605 = _1601 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1607 = _1587 * _1605;
    float _1609 = _1591 * _1605;
    float _1611 = _1607 * _1607;
    float _1613 = _1609 * _1609;
    float _1615 = _1611 + _1613;
    float _1617 = sqrt(_1615);
    bool _1619 = _1617 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1621 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1623 = _1617 + _1621;
    float _1625 = _1591;
    float _1627 = _1623;
    float _1629 = _1583;
    float _1631 = _1607;
    if (_1619)
    {
        float _1633 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1625 = _1633;
    }
    float _1635 = _1625;
    if (_1619)
    {
        float _1637 = _1623 * _1635;
        _1627 = _1637;
    }
    float _1639 = _1627;
    if (_1619)
    {
        float _1641 = _1639 * 0.15915493667125701904296875;
        _1381 = _1641;
    }
    float _1643 = _1381;
    float _1645 = _1601;
    if (_1619)
    {
        float _1647 = _1643 * 6.283185482025146484375;
        float _1649 = sin(_1647);
        _1645 = _1649;
    }
    float _1651 = _1645;
    float _1653 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1655 = precise::max(0.0, _1653);
    float _1657 = _1483;
    float _1659 = _1655;
    if (_1619)
    {
        float _1661 = _1643 * 6.283185482025146484375;
        float _1663 = cos(_1661);
        _1657 = _1663;
    }
    float _1665 = _1657;
    float _1667 = -_1605;
    float _1669 = -_1655;
    float _1671 = fma(_1583, _1667, _1669);
    float _1673 = _1653;
    if (_1619)
    {
        float _1675 = rsqrt(_1615);
        _1673 = _1675;
    }
    float _1677 = _1673;
    if (_1619)
    {
        float _1679 = _1671 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1659 = _1679;
    }
    float _1681 = _1659;
    float _1683 = _1681;
    float _1685 = _1651;
    if (_1619)
    {
        float _1687 = fma(_1651, _1681, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1683 = _1687;
    }
    float _1689 = _1683;
    float _1691 = _1689;
    if (!_1619)
    {
        _1685 = _1609;
    }
    float _1693 = _1685;
    float _1695 = _1693;
    if (_1619)
    {
        float _1697 = _1665 + (-1.0);
        _1629 = _1697;
    }
    float _1699 = _1629;
    float _1701 = _1699;
    if (_1619)
    {
        float _1703 = _1699 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1511 = _1703;
    }
    float _1705 = _1511;
    if (!_1619)
    {
        _1701 = _1613;
    }
    float _1707 = _1701;
    float _1709 = _1677;
    float _1711 = _1707;
    if (_1619)
    {
        float _1713 = _1677 * _1689;
        _1513 = _1713;
    }
    float _1715 = _1513;
    if (!_1619)
    {
        _1709 = _1671;
    }
    float _1717 = _1709;
    float _1719 = _1717;
    if (_1619)
    {
        float _1721 = fma(_1671, _1665, _1705);
        _1719 = _1721;
    }
    float _1723 = _1719;
    if (!_1619)
    {
        _1691 = _1611;
    }
    float _1725 = _1691;
    float _1727 = _1725;
    if (_1619)
    {
        float _1729 = _1607 * _1715;
        _1631 = _1729;
    }
    float _1731 = _1631;
    if (_1619)
    {
        float _1733 = _1609 * _1715;
        _1695 = _1733;
    }
    float _1735 = _1695;
    float _1737 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1619)
    {
        float _1739 = _1731 * _1731;
        _1727 = _1739;
    }
    float _1741 = _1727;
    if (_1619)
    {
        float _1743 = _1735 * _1735;
        _1711 = _1743;
    }
    float _1745 = _1711;
    float _1747 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1737);
    float _1749 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1751 = fma(_1723, _1723, _1741);
    float _1753 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1755 = fma(_1603, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1753);
    float _1757 = precise::clamp(_1755, 0.0, 1.0);
    float _1759 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1747);
    float _1761 = _1751 + _1745;
    float _1763 = -_1757;
    float _1765 = _1763 + 1.0;
    float _1767 = _1759 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1769 = rsqrt(_1761);
    float _1771 = fma(_1273, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1773 = fma(_1295, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1775 = abs(_1765);
    float _1777 = log2(_1775);
    float _1779 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1781 = _1769 * _1731;
    float _1783 = _1769 * _1723;
    float _1785 = _1769 * _1735;
    float _1787 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1789 = _1781 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1791 = _1767 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1793 = floor(_1771);
    float _1795 = -_1789;
    float _1797 = fma(_1783, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1795);
    float _1799 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1779);
    float _1801 = -_1791;
    float _1803 = fma(_1801, _1749, 1.0);
    float _1805 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1787);
    float _1807 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1809 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1799);
    float _1811 = -_1785;
    float _1813 = fma(_1811, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1797);
    float _1815 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1805);
    float _1817 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1807);
    float _1819 = _1809 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1821 = floor(_1773);
    float _1823 = _1815 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1825 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1817);
    float _1827 = _1819 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1829 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1831 = fma(_1813, -0.5, 0.5);
    float _1833 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1827);
    float _1835 = _1825 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1837 = fma(_1813, 0.5, 0.5);
    float _1839 = exp2(_1829);
    float _1841 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1833);
    float _1843 = -_1793;
    float _1845 = _1771 + _1843;
    float _1847 = fma(_1837, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1849 = _1819 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1851 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1841);
    float _1853 = -_1821;
    float _1855 = _1773 + _1853;
    float _1857 = fma(_1837, _1847, -0.212114393711090087890625);
    float _1859 = log2(_1803);
    float _1861 = _1819 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1863 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1849);
    float _1865 = _1783 + 1.0;
    float _1867 = 1.0 / _1851;
    float _1869 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1861);
    float _1871 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1863);
    float _1873 = -_1783;
    float _1875 = fma(_1839, _1865, _1873);
    float _1877 = sqrt(_1831);
    float _1879 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1869);
    float _1881 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1871);
    float _1883 = _1859 * 0.693147182464599609375;
    float2 _5541 = float2(_1845, _1855);
    float _1885 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5541, float2(0.0), isnan(_5541)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5541, float2(0.0), isnan(_5541)), level(0.0)).x;
    float _1887 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1879);
    float _1889 = fma(_1837, _1857, 1.570728778839111328125);
    float _1891 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1893 = _1881 * _1867;
    float _1895 = _1887 * _1867;
    float _1897 = fma(_1875, 0.5, 0.5);
    float _1899 = fma(_1893, 0.5, 0.5);
    float _1901 = fma(_1895, -0.5, 0.5);
    float _1903 = _1877 * 0.636619746685028076171875;
    float _1905 = -_1889;
    float _1907 = fma(_1903, _1905, 1.0);
    float3 _5585 = float3(_1899, _1901, _1891);
    float _1909 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5585, float3(0.0), isnan(_5585)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5585, float3(0.0), isnan(_5585)), level(0.0)).x;
    float3 _5596 = float3(_1899, _1901, _1891);
    float4 _1912 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5596, float3(0.0), isnan(_5596)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5596, float3(0.0), isnan(_5596)), level(0.0)).xyzw;
    float _1914 = _1912.x;
    float _1916 = _1912.y;
    float _1918 = _1912.z;
    float _1920 = _1912.w;
    float2 _5612 = float2(_1907, _1897);
    float3 _1924 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5612, float2(0.0), isnan(_5612)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5612, float2(0.0), isnan(_5612)), level(0.0)).xyz;
    float _1926 = _1924.x;
    float _1928 = _1924.y;
    float _1930 = _1924.z;
    float2 _5626 = float2(_1579, _1593);
    float3 _1932 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5626, float2(0.0), isnan(_5626)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5626, float2(0.0), isnan(_5626)), level(0.0)).xyz;
    float _1934 = _1932.x;
    float _1936 = _1932.y;
    float _1938 = _1932.z;
    float _1940 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1942 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1944 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1946 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1948 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1940);
    float _1950 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1942);
    float _1952 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1954 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1948);
    float _1956 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1950);
    float _1958 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1960 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1944);
    float _1962 = _1954 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1964 = _1956 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1966 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1968 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1946);
    float _1970 = 1.0 / _1962;
    float _1972 = _1964 + _1962;
    float _1974 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1966);
    float _1976 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1952);
    bool _1978 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1980 = isnan(0.5);
    bool _1982 = _1978 || _1980;
    bool _1984 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1986 = _1982 || _1984;
    float _1988 = _1415 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1990 = _1972 * _1970;
    float _1992 = _1990 * 0.5;
    float _1994 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1996 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1994);
    float _1998 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2000 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1958);
    float _2002 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2004 = 1.0 / _1996;
    float _2006 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1998);
    float _2008 = _1415 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2010 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1968);
    float _2012 = -_1403;
    float _2014 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2008);
    float _2016 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2014);
    float _2018 = _2002 * _2016;
    float _2020 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2022 = _2004 * _2020;
    float _2024 = abs(_2022);
    float _2026 = log2(_2024);
    float _2028 = _2026 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2030 = _1415 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2032 = -_1403;
    float _2034 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1988);
    float _2036 = -_1403;
    float _2038 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2030);
    float _2040 = exp2(_2028);
    float _2042 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2034);
    float _2044 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1960);
    float _2046 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2038);
    float _2048 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1976);
    float _2050 = fma(_2002, _2002, 1.0);
    float _2052 = rsqrt(_2050);
    float _2054 = fma(_2040, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2056 = precise::clamp(_2054, 0.0, 1.0);
    float _2058 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2006);
    float _2060 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2000);
    float _2062 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1974);
    float _2064 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_72.x = _2058;
    out.m_72.y = _2060;
    out.m_72.z = _2062;
    float _2066 = fma(_2056, -2.0, 3.0);
    float _2068 = _2056 * _2056;
    float _2070 = fma(_2064, _2058, _2018);
    float _2072 = _2002 * _2042;
    float _2074 = _2068 * _2066;
    float _2076 = _1819 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2078 = _2002 * _2046;
    float _2080 = fma(_2064, _2060, _2072);
    float _2082 = -_2074;
    float _2084 = _2082 + 1.0;
    float _2086 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2076);
    float _2088 = _2002 * _2052;
    float _2090 = _2058;
    float _2092 = _2088;
    float _2094 = _2042;
    if (!_1986)
    {
        _2090 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2096 = _2090;
    float _2098 = fma(_2064, _2062, _2078);
    float _2100 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2086);
    float _2102 = -_2044;
    float _2104 = _2088 * _2102;
    float _2106 = -_2010;
    float _2108 = _2088 * _2106;
    float _2110 = -_2048;
    float _2112 = _2088 * _2110;
    float _2114 = _2100;
    if (!_1986)
    {
        float _2116 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2118 = _2096 + _2116;
        _2092 = _2118;
    }
    float _2120 = _2092;
    float _2122 = fma(_2052, _2016, _2104);
    float _2124 = fma(_2052, _2042, _2108);
    float _2126 = fma(_2052, _2046, _2112);
    float _2128 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2130 = in.m_74.x;
    bool _2132 = _2022 <= 8000.0;
    bool _2134 = isnan(_2022);
    bool _2136 = _2132 || _2134;
    bool _2138 = isnan(8000.0);
    bool _2140 = _2136 || _2138;
    float _2142 = float(_2140);
    float _2144 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2074);
    float _2146 = _2002;
    float _2148 = _2126;
    float _2150 = _2124;
    if (!_1986)
    {
        float _2152 = 1.0 / _2120;
        _2146 = _2152;
    }
    float _2154 = _2146;
    out.m_76.x = _2122;
    out.m_76.y = _2124;
    out.m_76.z = _2126;
    float _2156 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2100);
    float _2158 = _2142 * _2144;
    float _2160 = _1851 * 0.5;
    if (!_1986)
    {
        float _2162 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2164 = _2022 + _2162;
        _2114 = _2164;
    }
    float _2166 = _2114;
    float _2168 = _2156 + _1851;
    float _2170 = _2158 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2172 = exp2(_2128);
    float _2174 = fma(_1887, -0.5, _2160);
    out.gl_Position.x = _1881;
    out.gl_Position.y = _1887;
    out.gl_Position.z = _2156;
    out.gl_Position.w = _1851;
    float _2176 = _2174;
    if (_1986)
    {
        _2094 = 1.0;
    }
    float _2178 = _2094;
    float _2180 = _1881 + _1851;
    float _2182 = _2044 + _2070;
    float _2184 = _2178;
    float _2186 = _1851;
    if (!_1986)
    {
        float _2188 = _2166 * _2154;
        float _2190 = precise::clamp(_2188, 0.0, 1.0);
        _2184 = _2190;
    }
    float _2192 = _2184;
    float _2194 = _2010 + _2080;
    float _2196 = _2048 + _2098;
    bool _2198 = _1603 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2200 = isnan(_1603);
    bool _2202 = _2198 || _2200;
    bool _2204 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2206 = _2202 || _2204;
    float _2208 = _2168 * 0.5;
    float _2210 = _2180 * 0.5;
    out.m_78.x = _2182;
    out.m_78.y = _2194;
    out.m_78.z = _2196;
    float _2212 = -_2172;
    float _2214 = _2212 + 1.0;
    out.m_80.x = _2210;
    out.m_80.y = _2174;
    out.m_80.z = _2208;
    out.m_80.w = _1851;
    float _2216 = _2214 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2206)
    {
        _2148 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2218 = _2148;
    float _2220 = _2218;
    float _2222 = _2218;
    if (!_2206)
    {
        _2150 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2224 = _2150;
    float _2226 = _2192 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2228 = _2224;
    float _2230 = _2224;
    if (!_2206)
    {
        _2186 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2232 = _2186;
    float _2234 = _2232;
    float _2236 = _2232;
    if (!_2206)
    {
        _2176 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2238 = _2176;
    float _2240 = -_1885;
    float _2242 = _2240 + 1.0;
    float _2244 = _2242 * _2170;
    float _2246 = precise::clamp(_2244, 0.0, 1.0);
    float _2248 = -_2246;
    float _2250 = fma(_2248, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2252 = -_2216;
    float _2254 = _2252 + 1.0;
    float _2256 = _2250 * _2130;
    float _2258 = _2256 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2260 = _2216 * _1909;
    float _2262 = _1920 * _2254;
    float _2264 = _2254;
    float _2266 = _1934;
    float _2268 = _2238;
    float _2270 = _2238;
    if (!_2206)
    {
        _2264 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2272 = _2264;
    out.m_82.x = _2258;
    float _2274 = _1920 * _2260;
    float _2276 = _1930 * _2260;
    float _2278 = fma(_1926, _2274, _1914);
    float _2280 = fma(_1928, _2274, _1916);
    float _2282 = fma(_1920, _2276, _1918);
    out.m_84.x = _2278;
    out.m_84.y = _2280;
    out.m_84.z = _2282;
    out.m_84.w = _2262;
    out.m_86.x = _1934;
    out.m_86.y = _1936;
    out.m_86.z = _1938;
    float _2284 = _2272;
    float _2286 = _2272;
    if (!_2206)
    {
        _2266 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2288 = _2266;
    bool _2290 = !_2206;
    float _2292 = _2288;
    float _2294 = _2288;
    if (!_2290)
    {
        bool _2296 = _1603 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2298 = isnan(_1603);
        bool _2300 = _2296 || _2298;
        bool _2302 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2304 = _2300 || _2302;
        if (!_2304)
        {
            float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2308 = _1603 + _2306;
            float _2310 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2312 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2310;
            float _2314 = 1.0 / _2312;
            float _2316 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2318 = _2316 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2320 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2322 = _2320 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2324 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2326 = _2324 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2328 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2330 = _2328 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2332 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2334 = _2332 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2336 = _2308 * _2314;
            float _2338 = precise::clamp(_2336, 0.0, 1.0);
            float _2340 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2342 = _2340 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2344 = fma(_2338, _2318, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2346 = fma(_2338, _2342, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2348 = fma(_2338, _2322, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2350 = fma(_2338, _2326, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2352 = fma(_2338, _2330, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2354 = fma(_2338, _2334, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2236 = _2344;
            _2286 = _2352;
            _2222 = _2346;
            _2230 = _2350;
            _2270 = _2348;
            _2294 = _2354;
            _2356 = true;
        }
        else
        {
            bool _2358 = _1603 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2360 = isnan(_1603);
            bool _2362 = _2358 || _2360;
            bool _2364 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2366 = _2362 || _2364;
            if (!_2366)
            {
                _2220 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2368 = _2220;
            _2222 = _2368;
            if (!_2366)
            {
                _2234 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2370 = _2234;
            _2236 = _2370;
            if (!_2366)
            {
                _2268 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2372 = _2268;
            _2270 = _2372;
            if (!_2366)
            {
                _2228 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2374 = _2228;
            _2230 = _2374;
            if (!_2366)
            {
                _2284 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2376 = _2284;
            _2286 = _2376;
            if (!_2366)
            {
                _2292 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2378 = _2292;
            bool _2380 = !_2366;
            _2294 = _2378;
            if (!_2380)
            {
                bool _2382 = _1603 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2384 = isnan(_1603);
                bool _2386 = _2382 || _2384;
                bool _2388 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2390 = _2386 || _2388;
                if (!_2390)
                {
                    float _2392 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2394 = _1603 + _2392;
                    float _2396 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2398 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2396;
                    float _2400 = 1.0 / _2398;
                    float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2404 = _2402 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2406 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2408 = _2406 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2410 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2412 = _2410 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2414 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2416 = _2414 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2418 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2420 = _2418 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2422 = _2394 * _2400;
                    float _2424 = precise::clamp(_2422, 0.0, 1.0);
                    float _2426 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2428 = _2426 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2430 = fma(_2424, _2404, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2432 = fma(_2424, _2428, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2434 = fma(_2424, _2408, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2436 = fma(_2424, _2412, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2438 = fma(_2424, _2416, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2440 = fma(_2424, _2420, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2236 = _2430;
                    _2286 = _2438;
                    _2222 = _2432;
                    _2230 = _2436;
                    _2270 = _2434;
                    _2294 = _2440;
                    _2356 = true;
                }
                else
                {
                    _2236 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2286 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2222 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2230 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2270 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2294 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2356 = false;
    float _2442 = _2236;
    float _2444 = _2286;
    float _2446 = _2222;
    float _2448 = _2230;
    float _2450 = _2270;
    float _2452 = _2294;
    float _2454 = fma(_2194, -0.5, 0.5);
    float _2456 = precise::clamp(_2454, 0.0, 1.0);
    float _2458 = -_2442;
    float _2460 = _2458 + _2444;
    float _2462 = -_2446;
    float _2464 = _2462 + _2448;
    out.m_88.x = 0.0;
    float _2466 = fma(_2456, _2460, _2442);
    float _2468 = -_2450;
    float _2470 = _2468 + _2452;
    float _2472 = fma(_2456, _2464, _2446);
    float _2474 = _2466 * 0.586610972881317138671875;
    bool _2476 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2478 = fma(_2456, _2470, _2450);
    float _2480 = _2226 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2482 = fma(_2472, 0.298911988735198974609375, _2474);
    bool _2484 = _2192 > 0.0;
    bool _2486 = isnan(_2192);
    bool _2488 = _2484 || _2486;
    bool _2490 = isnan(0.0);
    bool _2492 = _2488 || _2490;
    float _2494 = fma(_2478, 0.114477999508380889892578125, _2482);
    out.m_51.x = _2480;
    float _2496 = -_2494;
    float _2498 = _2472 + _2496;
    float _2500 = -_2494;
    float _2502 = _2466 + _2500;
    float _2504 = -_2494;
    float _2506 = _2478 + _2504;
    float _2508 = fma(_2498, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2494);
    float _2510 = fma(_2502, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2494);
    float _2512 = fma(_2506, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2494);
    bool _2514 = !_2476;
    if (!_2514)
    {
        float _2516 = -_1569;
        float _2518 = _2516 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2520 = -_1573;
        float _2522 = _2520 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2524 = -_1577;
        float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2528 = _2518 * _2518;
        float _2530 = fma(_2522, _2522, _2528);
        float _2532 = fma(_2526, _2526, _2530);
        float _2534 = sqrt(_2532);
        float _2536 = rsqrt(_2532);
        float _2538 = -_2534;
        float _2540 = _2538 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2542 = _2540 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2544 = precise::clamp(_2542, 0.0, 1.0);
        float _2546 = _2522 * _2536;
        float _2548 = _2518 * _2536;
        float _2550 = abs(_2544);
        float _2552 = log2(_2550);
        float _2554 = _2526 * _2536;
        float _2556 = _2546 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2558 = _2194 * _2548;
        float _2560 = -_2548;
        float _2562 = -_2556;
        float _2564 = fma(_2560, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2562);
        float _2566 = fma(_2182, _2546, _2558);
        float _2568 = -_2554;
        float _2570 = fma(_2568, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2564);
        float _2572 = fma(_2196, _2554, _2566);
        float _2574 = precise::clamp(_2572, 0.0, 1.0);
        float _2576 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2578 = _2570 + _2576;
        float _2580 = _2552 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2582 = _2578 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2584 = precise::clamp(_2582, 0.0, 1.0);
        float _2586 = exp2(_2580);
        float _2588 = _2586 * _2584;
        float _2590 = _2574 * _2588;
        float _2592 = _2590 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2594 = _2590 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2596 = _2590 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _2592;
        out.m_88.y = _2594;
        out.m_88.z = _2596;
    }
    out.m_90.x = _2508;
    out.m_90.y = _2510;
    out.m_90.z = _2512;
    if (_2492)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2598 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_51.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2598;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

