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
    constant _16* vp_c13 [[id(6)]];
    texture3d<float> vp_t_tcb_32 [[id(7)]];
    sampler vp_t_tcb_32Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_30 [[id(9)]];
    sampler vp_t_tcb_30Smplr [[id(10)]];
    texture2d<float> vp_t_tcb_1C [[id(11)]];
    sampler vp_t_tcb_1CSmplr [[id(12)]];
    sampler vp_t_tcb_32Smplr_w [[id(13)]];
    sampler vp_t_tcb_30Smplr_w [[id(14)]];
    sampler vp_t_tcb_1CSmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_66 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_80 [[user(locn3)]];
    float4 m_68 [[user(locn4)]];
    float4 m_64 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
    float4 m_78 [[user(locn8)]];
    float4 m_76 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_62 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
    float4 m_70 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2514 = false;
    bool _1655 = false;
    bool _331 = false;
    bool _221 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _94 = in.m_46.w;
    float _96 = trunc(_94);
    int _99 = int(_96);
    bool _103 = _99 >= 1;
    float _105 = 0.0;
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _105;
    float _109 = _107;
    if (!_103)
    {
        out.m_49.x = 0.0;
    }
    int _111 = 0;
    if (!_103)
    {
        float _113 = _107 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    int _117 = _115;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2767 = as_type<float>(_115);
        out.gl_Position.z = _2767;
    }
    if (!_103)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _119 = in.m_51.w;
    bool _121 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = isnan(_119);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _129 = _125 || _127;
    float _131 = -_119;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _135 = 0.0;
    float _137 = _133;
    if (_129)
    {
        float _139 = float(_99);
        _135 = _139;
    }
    float _141 = _135;
    bool _143 = _133 >= _141;
    bool _145 = !_129;
    bool _147 = _143 || _145;
    if (_147)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _109;
    if (_147)
    {
        out.m_49.x = 0.0;
    }
    if (_147)
    {
        float _151 = _149 * 5.0;
        _117 = as_type<int>(_151);
    }
    int _153 = _117;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2836 = as_type<float>(_153);
        out.gl_Position.z = _2836;
    }
    if (_147)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = in.m_56.x;
    float _159 = in.m_56.y;
    float _161 = in.m_56.z;
    int _163 = as_type<int>(_155) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_155) & 2;
    bool _169 = _167 != 0;
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _173 = _159 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _175 = _159 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _177 = _159 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _179 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[6].x, _173);
    float _181 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[4].x, _175);
    float _183 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[5].x, _177);
    float _185 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].z, _179);
    float _187 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].z, _181);
    float _189 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].z, _183);
    bool _191 = !_165;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_169;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_171;
    float _201 = _189;
    float _219;
    if (!_199)
    {
        float _203 = in.m_58.x;
        float _205 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _207 = _203 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _209 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _211 = _209 * _205;
        float _213 = floor(_211);
        float _215 = -_213;
        float _217 = _211 + _215;
        _219 = _217;
        _221 = true;
    }
    else
    {
        float _223 = float(_99);
        float _225 = 1.0 / _223;
        float _227 = _133 * _225;
        _219 = _227;
    }
    _221 = false;
    float _229 = _219;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = _229 + _231;
    bool _235 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _237 = isnan(_229);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _243 = _239 || _241;
    float _245 = float(_243);
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _247;
    float _251 = -_245;
    float _253 = _251 + 1.0;
    bool _255 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _257 = isnan(_229);
    bool _259 = _255 || _257;
    bool _261 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _263 = _259 || _261;
    float _265 = float(_263);
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _267;
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _273 = 1.0 / _249;
    float _275 = _265 * _253;
    float _277 = -_265;
    float _279 = _277 + 1.0;
    float _281 = _233 * _273;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _283;
    float _287 = fma(_269, _281, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _289 = fma(_285, _281, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _291 = _287 * _275;
    float _293 = _289 * _275;
    float _295 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].x, _291);
    float _297 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].y, _293);
    float _299 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[144].x, _295);
    float _301 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[144].y, _297);
    bool _303 = !_271;
    float _327;
    float _329;
    if (!_303)
    {
        float _305 = in.m_58.x;
        float _307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _309 = float(_99);
        float _311 = 1.0 / _309;
        float _313 = _305 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _315 = _133 * _311;
        float _317 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _319 = _317 * _307;
        float _321 = floor(_319);
        float _323 = -_321;
        float _325 = _319 + _323;
        _327 = _315;
        _329 = _325;
        _331 = true;
    }
    else
    {
        float _333 = float(_99);
        float _335 = 1.0 / _333;
        float _337 = _133 * _335;
        _327 = _337;
        _329 = _337;
    }
    _331 = false;
    float _339 = _327;
    float _341 = _329;
    float _343 = in.m_58.x;
    float _345 = in.m_58.y;
    float _347 = in.m_58.z;
    float _349 = in.m_58.w;
    float _351 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _353 = log2(_351);
    float _355 = in.m_46.x;
    float _357 = in.m_46.y;
    float _359 = in.m_46.z;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _363 = _361 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _373 = 1.0 / _363;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _383 = _353 * _133;
    float _385 = 1.0 / _367;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _391 = _349 > 0.5;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _397 = 1.0 / _371;
    bool _399 = _343 > 0.5;
    float _401 = _357 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _405 = _403 != 0;
    float _407 = _357 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _411 = _409 != 0;
    float _413 = _357 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _417 = _415 != 0;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _425 = _423 != 0;
    float _427 = 1.0 / _377;
    float _429 = -_197;
    int _431 = _391 ? as_type<int>(_429) : as_type<int>(_197);
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _435 = -_193;
    int _437 = _399 ? as_type<int>(_435) : as_type<int>(_193);
    float _439 = _387 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _443 = _441 != 0;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _447 = _445 != 0;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _451 = _449 != 0;
    float _453 = _389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _455 = _421 * _373;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _463 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[4].x, _401);
    float _465 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[5].x, _407);
    float _467 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[6].x, _413);
    float _469 = _461 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _471 = 1.0 / _381;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    out.m_60.x = _469;
    out.m_60.y = _439;
    out.m_60.z = _453;
    out.m_60.w = _433;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _485 = _475 * _385;
    float _487 = _345 * 2.0;
    float _489 = 1.0 / _395;
    bool _491 = !_405;
    float _493 = _491 ? _193 : as_type<float>(_437);
    float _495 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].z, _463);
    bool _497 = _345 > 0.5;
    float _499 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].z, _465);
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _503 = _339 + _501;
    float _505 = 1.0 / _459;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _507;
    float _511 = -_197;
    int _513 = _497 ? as_type<int>(_511) : as_type<int>(_197);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _517 = 1.0 + _515;
    bool _519 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _521 = isnan(1.0);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _527 = _523 || _525;
    float _529 = _509 * _397;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _535;
    float _539 = 1.0 / _483;
    float _541 = _533 * _427;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _547 = _537 * _471;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _549;
    float _553 = _343 * 2.0;
    float _555 = _545 * _489;
    float _557 = exp2(_383);
    float _559 = _345 + _347;
    float _561 = _551 * _505;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _563;
    float _567 = _559 + (-1.0);
    bool _569 = !_411;
    float _571 = _569 ? _197 : as_type<float>(_513);
    float _573 = floor(_553);
    float _575 = _565 * _539;
    float _577 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _579 = !_425;
    float _581 = _579 ? _197 : as_type<float>(_431);
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    bool _587 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _589 = isnan(0.0);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _595 = _591 || _593;
    float _597 = fma(_575, _503, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _599 = _347 > 0.5;
    float _601 = 1.0 / _517;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _607 = -_557;
    float _609 = _607 + 1.0;
    float _611 = -_193;
    int _613 = _599 ? as_type<int>(_611) : as_type<int>(_193);
    float _615 = _493 + 0.5;
    bool _617 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _619 = isnan(_341);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = -_571;
    float _631 = _629 + 0.5;
    float _633 = _595 ? _609 : 0.0;
    float _635 = 1.0 / _479;
    float _637 = _615 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _639 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _641 = isnan(_339);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = _499 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _653 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _655 = isnan(_339);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    bool _665 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _667 = isnan(_339);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = 1.0 / _605;
    float _679 = _347 * 2.0;
    if (_527)
    {
        float _681 = _633 * _601;
        _137 = _681;
    }
    float _683 = _137;
    bool _685 = !_417;
    float _687 = _685 ? _193 : as_type<float>(_613);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _689;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _695 = _341 + _693;
    bool _697 = _573 >= 0.0;
    bool _699 = isnan(_573);
    bool _701 = _697 || _699;
    bool _703 = isnan(0.0);
    bool _705 = _701 || _703;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _709 = _341 + _707;
    float _711 = floor(_679);
    bool _713 = _573 > 0.0;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _717 = _341 + _715;
    int _719 = _705 ? 0 : 1;
    float _721 = _585 * _635;
    float _723 = fma(_485, _709, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _727 = _339 + _725;
    float _729 = floor(_487);
    float _731 = _691 * _677;
    float _733 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].z, _467);
    float _735 = fma(_455, _695, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _739 = _339 + _737;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _743 = _339 + _741;
    float _745 = _345 + _343;
    float _747 = fma(_529, _717, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _749 = _711 >= 0.0;
    bool _751 = isnan(_711);
    bool _753 = _749 || _751;
    bool _755 = isnan(0.0);
    bool _757 = _753 || _755;
    float _759 = fma(_541, _739, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _761 = _711 > 0.0;
    float _763 = fma(_547, _743, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    int _765 = _757 ? 0 : 1;
    float _767 = _745 + (-1.0);
    bool _769 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _771 = isnan(_341);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _783 = _339 + _781;
    bool _785 = _729 > 0.0;
    float _787 = fma(_555, _727, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _789 = _729 >= 0.0;
    bool _791 = isnan(_729);
    bool _793 = _789 || _791;
    bool _795 = isnan(0.0);
    bool _797 = _793 || _795;
    float _799 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _801 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _803 = isnan(_341);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = fma(_561, _783, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    bool _815 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _817 = isnan(_341);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    float _827 = -_779;
    float _829 = _827 + 1.0;
    bool _831 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _833 = isnan(_339);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = -_649;
    float _845 = _843 + 1.0;
    bool _847 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _849 = isnan(_339);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = -_825;
    float _861 = _859 + 1.0;
    bool _863 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _865 = isnan(_339);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _871 = _867 || _869;
    float _873 = float(_871);
    float _875 = -_841;
    float _877 = _875 + 1.0;
    float _879 = _811 * _829;
    float _881 = -_857;
    float _883 = _881 + 1.0;
    float _885 = _779 * _861;
    float _887 = _649 * _877;
    float _889 = -_811;
    float _891 = _889 + 1.0;
    float _893 = _873 * _883;
    bool _895 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _897 = isnan(_339);
    bool _899 = _895 || _897;
    bool _901 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    float _907 = -_873;
    float _909 = _907 + 1.0;
    float _911 = _663 * _845;
    float _913 = -_663;
    float _915 = _913 + 1.0;
    float _917 = _627 * _891;
    float _919 = _841 * _909;
    float _921 = -_905;
    float _923 = _921 + 1.0;
    float _925 = _905 * _915;
    float _927 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _929 = _723 * _917;
    bool _931 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _933 = isnan(_339);
    bool _935 = _931 || _933;
    bool _937 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _939 = _935 || _937;
    float _941 = float(_939);
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _945 = _339 + _943;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _949 = _339 + _947;
    float _951 = -_675;
    float _953 = _951 + 1.0;
    float _955 = _675 * _923;
    float _957 = fma(_721, _945, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _959 = fma(_731, _949, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _961 = _941 * _953;
    float _963 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _965 = -_941;
    float _967 = _965 + 1.0;
    float _969 = _631 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _971 = _763 * _961;
    float _973 = -_581;
    float _975 = _973 + 0.5;
    float _977 = -_627;
    float _979 = _977 + 1.0;
    float _981 = _637 * _927;
    float _983 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[151].x, _971);
    float _985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _987 = _975 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _989 = _797 ? 0 : 1;
    float _991 = fma(_759, _955, _983);
    float _993 = _687 + 0.5;
    float _995 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[115].x, _929);
    int _997 = ~_989;
    int _999 = _997 + 1;
    int _1001 = _999 + 1;
    float _1003 = fma(_813, _925, _991);
    float _1005 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1007 = _987 * _963;
    int _1009 = _1001;
    if (!_785)
    {
        int _1011 = ~_989;
        int _1013 = _1011 + 1;
        _1009 = _1013;
    }
    int _1015 = _1009;
    float _1017 = _993 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1019 = !_443;
    int _1021 = _1019 ? 0 : 1;
    float _1023 = fma(_787, _911, _1003);
    bool _1025 = !_447;
    int _1027 = _1025 ? 0 : 1;
    float _1029 = fma(_735, _879, _995);
    float _1031 = _969 * _985;
    int _1033 = abs(_1021);
    float _1035 = _733 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1037 = abs(_1027);
    float _1039 = fma(_597, _887, _1023);
    float _1041 = in.m_62.x;
    float _1043 = in.m_62.y;
    float _1045 = in.m_62.z;
    int _1047 = ~_765;
    int _1049 = _1047 + 1;
    int _1051 = _1049 + 1;
    float _1053 = _345 + (-0.5);
    float _1055 = _1017 * _1005;
    float _1057 = _495 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1059 = _1051;
    if (!_761)
    {
        int _1061 = ~_765;
        int _1063 = _1061 + 1;
        _1059 = _1063;
    }
    int _1065 = _1059;
    float _1067 = fma(_957, _919, _1039);
    out.m_64.x = _981;
    out.m_64.y = _1031;
    out.m_64.z = _1055;
    out.m_64.w = _1007;
    float _1069 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1071 = _1057 + _1069;
    float _1073 = float(_1065);
    int _1075 = ~_719;
    int _1077 = _1075 + 1;
    int _1079 = _1077 + 1;
    int _1081 = _1079;
    if (!_713)
    {
        int _1083 = ~_719;
        int _1085 = _1083 + 1;
        _1081 = _1085;
    }
    int _1087 = _1081;
    float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1091 = _651 + _1089;
    float _1093 = float(_1033);
    float _1095 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1097 = _1035 + _1095;
    float _1099 = float(_1037);
    float _1101 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1103 = float(_1087);
    float _1105 = _1093 * _1073;
    float _1107 = fma(_747, _885, _1029);
    float _1109 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1101);
    float _1111 = _1099 * _1103;
    float _1113 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1107);
    float _1115 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1109);
    float _1117 = _1105 * (-2.0);
    float _1119 = _1091 * _1091;
    float _1121 = _343 + (-0.5);
    bool _1123 = _1115 >= 0.0;
    float _1125 = fma(_1117, _1041, _1041);
    float _1127 = fma(_959, _893, _1067);
    float _1129 = fma(_1071, _1071, _1119);
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1133 = fma(_1097, _1097, _1129);
    float _1135 = fma(_799, _1117, _799);
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1139 = rsqrt(_1133);
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1143 = (*spvDescriptorSet0.vp_c9)._m0[107].z;
    if (_1123)
    {
        _1143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1145 = _1143;
    float _1147 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1149 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1151 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1153 = _1113 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1155 = as_type<int>(_1145);
    if (_1123)
    {
        float _1157 = _1145 * 5.0;
        _1155 = as_type<int>(_1157);
    }
    int _1159 = _1155;
    float _1161 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1127);
    float _1163 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1125);
    bool _1165 = !_451;
    int _1167 = _1165 ? 0 : 1;
    out.m_66.x = _1147;
    out.m_66.y = _1149;
    out.m_66.z = _1151;
    out.m_66.w = _1153;
    float _1169 = fma(_1135, _683, _1163);
    int _1171 = abs(_1167);
    if (_1123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4440 = as_type<float>(_1159);
        out.gl_Position.z = _4440;
    }
    float _1173 = _1091 * _1139;
    float _1175 = _1071 * _1139;
    out.m_68.x = _1161;
    if (_1123)
    {
        out.m_49.x = 0.0;
    }
    if (_1123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1177 = -_1173;
    float _1179 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[18].w, _651);
    float _1181 = _1097 * _1139;
    float _1183 = -_1175;
    float _1185 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1057);
    float _1187 = float(_1171);
    float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1191 = _1179 + _1189;
    float _1193 = -_1181;
    float _1195 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1035);
    float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1199 = _1185 + _1197;
    float _1201 = _1111 * (-2.0);
    float _1203 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1205 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1207 = _1195 + _1205;
    float _1209 = float(_1015);
    float _1211 = fma(_1201, _1043, _1043);
    float _1213 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1203);
    float _1215 = -_1173;
    float _1217 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1091);
    float _1219 = fma(_577, _1201, _577);
    float _1221 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1211);
    float _1223 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1213);
    float _1225 = -_1175;
    float _1227 = fma(_1225, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1071);
    float _1229 = _1217 * _1217;
    float _1231 = _1187 * _1209;
    float _1233 = _347 + _343;
    bool _1235 = _1223 >= 0.0;
    float _1237 = fma(_1227, _1227, _1229);
    float _1239 = in.m_70.x;
    float _1241 = in.m_70.y;
    float _1243 = -_1181;
    float _1245 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1097);
    float _1247 = fma(_1219, _683, _1221);
    float _1249 = _1169 * 0.15915493667125701904296875;
    float _1251 = _1233 + (-1.0);
    float _1253 = fma(_1245, _1245, _1237);
    float _1255 = _1231 * (-2.0);
    float _1257 = _1247 * 0.15915493667125701904296875;
    float _1259 = _1249 * 6.283185482025146484375;
    float _1261 = sin(_1259);
    float _1263 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1265 = _347 + (-0.5);
    float _1267 = fma(_1255, _1045, _1045);
    float _1269 = _1249;
    int _1271 = as_type<int>(_1265);
    float _1273 = _1195;
    float _1275 = _1207;
    if (_1235)
    {
        out.m_49.x = 0.0;
    }
    float _1277 = fma(_1263, _1255, _1263);
    float _1279 = fma(_1265, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1267);
    float _1281 = _1249 * 6.283185482025146484375;
    float _1283 = cos(_1281);
    float _1285 = fma(_1277, _683, _1279);
    float _1287 = _301 * _1241;
    float _1289 = _1257 * 6.283185482025146484375;
    float _1291 = sin(_1289);
    if (_1235)
    {
        _1269 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1293 = _1269;
    float _1295 = _1285 * 0.15915493667125701904296875;
    if (_1235)
    {
        float _1297 = _1293 * 5.0;
        _1271 = as_type<int>(_1297);
    }
    int _1299 = _1271;
    float _1301 = sqrt(_1253);
    if (_1235)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4664 = as_type<float>(_1299);
        out.gl_Position.z = _4664;
    }
    float _1303 = _1257 * 6.283185482025146484375;
    float _1305 = cos(_1303);
    if (_1235)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1307 = _1295 * 6.283185482025146484375;
    float _1309 = cos(_1307);
    float _1311 = _1139 * _1301;
    float _1313 = _1287 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1315 = _299 * _1239;
    float _1317 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _1319 = _1283 * _1305;
    float _1321 = _1313 * _1311;
    float _1323 = _1315 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1325 = _1295 * 6.283185482025146484375;
    float _1327 = sin(_1325);
    float _1329 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _1331 = _1317 * _1321;
    float _1333 = _1323 * _1311;
    float _1335 = _1261 * _1291;
    float _1337 = _1283 * _1291;
    float _1339 = _1261 * _1305;
    float _1341 = _1329 * _1333;
    float _1343 = _1283 * _1309;
    float _1345 = _1305 * _1309;
    float _1347 = _1261 * _1309;
    float _1349 = _1291 * _1309;
    float _1351 = _1343 * _1331;
    float _1353 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1355 = _1353 * 0.5;
    float _1357 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1359 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1361 = fma(_1327, _1319, _1335);
    float _1363 = -_1331;
    float _1365 = _1327 * _1363;
    float _1367 = -_1339;
    float _1369 = fma(_1327, _1337, _1367);
    float _1371 = -_1337;
    float _1373 = fma(_1327, _1339, _1371);
    float _1375 = fma(_1361, _1341, _1351);
    float _1377 = fma(_1345, _1341, _1365);
    float _1379 = _1347 * _1331;
    float _1381 = fma(_1327, _1335, _1319);
    float _1383 = fma(_1369, _1355, _1375);
    float _1385 = fma(_1349, _1355, _1377);
    float _1387 = fma(_1373, _1341, _1379);
    float _1389 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1391 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1393 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1395 = fma(_1381, _1355, _1387);
    float _1397 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1399 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1391);
    float _1401 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1393);
    float _1403 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1405 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1397);
    float _1407 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1399);
    float _1409 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1401);
    float _1411 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1413 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1415 = _1407 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1417 = _1409 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1419 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1405);
    float _1421 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1389);
    float _1423 = _1057 + _1415;
    float _1425 = _1035 + _1417;
    float _1427 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1403);
    float _1429 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1411);
    float _1431 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1433 = _1423 + _1431;
    float _1435 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1437 = _1425 + _1435;
    float _1439 = -_1327;
    float _1441 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1357);
    float _1443 = -_1327;
    float _1445 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1359);
    float _1447 = _1433 * _1433;
    float _1449 = _1437 * _1437;
    float _1451 = -_1327;
    float _1453 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1413);
    float _1455 = _1419 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1457 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1421);
    float _1459 = _1447 + _1449;
    float _1461 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1427);
    float _1463 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1429);
    float _1465 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1467 = sqrt(_1459);
    float _1469 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1471 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1473 = _651 + _1455;
    float _1475 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1465);
    float _1477 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1469);
    float _1479 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1471);
    bool _1481 = _1467 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1483 = _1471;
    float _1485 = _1447;
    float _1487 = _1449;
    float _1489 = _1423;
    float _1491 = _1425;
    float _1493 = _1459;
    float _1495 = _1311;
    if (!_1481)
    {
        _1483 = _1473;
    }
    float _1497 = _1483;
    bool _1499 = !_1481;
    float _1501 = _1497;
    if (!_1499)
    {
        float _1503 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1507 = _1467 + _1505;
        float _1509 = _1473 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1511 = rsqrt(_1459);
        float _1513 = _1507 * _1503;
        float _1515 = _1513 * 0.15915493667125701904296875;
        float _1517 = _1515 * 6.283185482025146484375;
        float _1519 = sin(_1517);
        float _1521 = _1515 * 6.283185482025146484375;
        float _1523 = cos(_1521);
        float _1525 = fma(_1519, _1509, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1527 = _1511 * _1525;
        float _1529 = _1523 + (-1.0);
        float _1531 = fma(_1433, _1527, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1533 = fma(_1437, _1527, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1535 = _1529 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1537 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1539 = _1531 + _1537;
        float _1541 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1543 = _1533 + _1541;
        float _1545 = fma(_1473, _1523, _1535);
        float _1547 = _1539 * _1539;
        float _1549 = _1543 * _1543;
        _1501 = _1545;
        _1485 = _1547;
        _1487 = _1549;
        _1489 = _1531;
        _1491 = _1533;
        _1493 = _1511;
    }
    float _1551 = _1501;
    float _1553 = _1485;
    float _1555 = _1487;
    float _1557 = _1489;
    float _1559 = _1491;
    float _1561 = _1493;
    float _1563 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1565 = _1551 + _1563;
    float _1567 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1441);
    float _1569 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1445);
    float _1571 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1453);
    float _1573 = fma(_1565, _1565, _1553);
    float _1575 = _197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1577 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1475);
    float _1579 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1477);
    float _1581 = _1573 + _1555;
    float _1583 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1479);
    float _1585 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1587 = _1575 * _1567;
    float _1589 = _1575 * _1569;
    float _1591 = _1575 * _1571;
    float _1593 = sqrt(_1581);
    float _1595 = fma(_1585, _1457, _1587);
    float _1597 = fma(_1585, _1461, _1589);
    float _1599 = fma(_1585, _1463, _1591);
    float _1601 = _1577 + _1595;
    float _1603 = _1579 + _1597;
    float _1605 = _1583 + _1599;
    out.m_72.x = _1601;
    out.m_72.y = _1603;
    out.m_72.z = _1605;
    bool _1607 = _1593 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1609 = isnan(_1593);
    bool _1611 = _1607 || _1609;
    bool _1613 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1615 = _1611 || _1613;
    float _1617 = _1561;
    float _1619 = _1575;
    if (!_1615)
    {
        _1617 = 1.0;
    }
    float _1621 = _1617;
    bool _1623 = !_1615;
    float _1625 = _1621;
    if (!_1623)
    {
        bool _1627 = _1593 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1629 = isnan(_1593);
        bool _1631 = _1627 || _1629;
        bool _1633 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1635 = _1631 || _1633;
        if (!_1635)
        {
            float _1637 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1639 = _1593 + _1637;
            float _1641 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1643 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1641;
            float _1645 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1647 = _1645 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1649 = 1.0 / _1643;
            float _1651 = _1639 * _1649;
            float _1653 = fma(_1651, _1647, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1625 = _1653;
            _1655 = true;
        }
        else
        {
            bool _1657 = _1593 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1659 = isnan(_1593);
            bool _1661 = _1657 || _1659;
            bool _1663 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1665 = _1661 || _1663;
            if (!_1665)
            {
                float _1667 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1669 = _1593 + _1667;
                float _1671 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1673 = _1671 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1675 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1677 = _1675 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1679 = 1.0 / _1673;
                float _1681 = _1669 * _1679;
                float _1683 = fma(_1681, _1677, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1625 = _1683;
                _1655 = true;
            }
            else
            {
                _1625 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1655 = false;
    float _1685 = _1625;
    float _1687 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1689 = _1551 + _1687;
    float _1691 = _1179 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1693 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1695 = _1557 + _1693;
    float _1697 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1699 = _1559 + _1697;
    float _1701 = fma(_1689, _1685, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1703 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1691);
    float _1705 = fma(_1695, _1685, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1707 = fma(_1699, _1685, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1709 = -_651;
    float _1711 = _1709 + _1701;
    float _1713 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1703);
    float _1715 = -_1057;
    float _1717 = _1715 + _1705;
    float _1719 = -_1035;
    float _1721 = _1719 + _1707;
    float _1723 = _1711 * _1711;
    float _1725 = _1713 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1727 = _1179 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1729 = fma(_1717, _1717, _1723);
    float _1731 = 1.0 / _1725;
    float _1733 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1727);
    float _1735 = fma(_1721, _1721, _1729);
    float _1737 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1733);
    float _1739 = sqrt(_1735);
    float _1741 = _1737 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1743 = _1741 + _1725;
    float _1745 = _1743 * _1731;
    float _1747 = _1745 * 0.5;
    bool _1749 = _1739 > 0.0;
    float _1751 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1753 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1751);
    bool _1755 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1757 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1759 = _1755 || _1757;
    bool _1761 = isnan(0.5);
    bool _1763 = _1759 || _1761;
    float _1765 = 1.0 / _1753;
    bool _1767 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1769 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1771 = _1767 || _1769;
    bool _1773 = isnan(0.5);
    bool _1775 = _1771 || _1773;
    float _1777 = _1725;
    float _1779 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1781 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1783 = _1705;
    if (!_1749)
    {
        _1777 = _1705;
    }
    float _1785 = _1777;
    float _1787 = _1785;
    float _1789 = _1785;
    if (!_1749)
    {
        _1779 = _1701;
    }
    float _1791 = _1779;
    float _1793 = _1791;
    if (!_1749)
    {
        _1781 = _1707;
    }
    float _1795 = _1781;
    bool _1797 = !_1749;
    float _1799 = _1795;
    if (!_1797)
    {
        float _1801 = _189 * _189;
        float _1803 = rsqrt(_1735);
        float _1805 = fma(_187, _187, _1801);
        float _1807 = fma(_185, _185, _1805);
        float _1809 = sqrt(_1807);
        float _1811 = _1717 * _1803;
        float _1813 = _1711 * _1803;
        float _1815 = _1721 * _1803;
        bool _1817 = _1809 > 0.0;
        float _1819 = _1803;
        float _1821 = _1809;
        _1619 = _1807;
        if (!_1817)
        {
            _1787 = _1705;
        }
        float _1823 = _1787;
        _1789 = _1823;
        if (!_1817)
        {
            _1819 = _1701;
        }
        float _1825 = _1819;
        _1793 = _1825;
        if (!_1817)
        {
            _1821 = _1707;
        }
        float _1827 = _1821;
        bool _1829 = !_1817;
        _1799 = _1827;
        if (!_1829)
        {
            float _1831 = rsqrt(_1807);
            float _1833 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1835 = _189 * _1831;
            float _1837 = _187 * _1831;
            float _1839 = _1813 * _1835;
            float _1841 = _185 * _1831;
            float _1843 = fma(_1811, _1837, _1839);
            float _1845 = _1833 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1847 = fma(_1815, _1841, _1843);
            float _1849 = _1847 * _1845;
            float _1851 = fma(_187, _1849, _1705);
            float _1853 = fma(_189, _1849, _1701);
            float _1855 = fma(_185, _1849, _1707);
            _1789 = _1851;
            _1793 = _1853;
            _1799 = _1855;
            _1619 = _1831;
        }
    }
    float _1857 = _1789;
    float _1859 = _1793;
    float _1861 = _1799;
    float _1863 = _1619;
    float _1865 = -_1175;
    float _1867 = fma(_1865, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1857);
    float _1869 = -_1173;
    float _1871 = fma(_1869, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1859);
    float _1873 = -_1181;
    float _1875 = fma(_1873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1861);
    float _1877 = _1871;
    float _1879 = _1867;
    float _1881 = _1875;
    float _1883 = _1863;
    if (_1775)
    {
        _1783 = 1.0;
    }
    float _1885 = _1783;
    float _1887 = _1885;
    if (!_1763)
    {
        float _1889 = _1191 * _1191;
        float _1891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1893 = -_651;
        float _1895 = _1893 + _1859;
        float _1897 = -_1035;
        float _1899 = _1897 + _1861;
        float _1901 = fma(_1199, _1199, _1889);
        float _1903 = fma(_1207, _1207, _1901);
        float _1905 = 1.0 / _1311;
        float _1907 = sqrt(_1903);
        float _1909 = precise::min(_1907, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1911 = _1909 * _1891;
        float _1913 = -_1057;
        float _1915 = _1913 + _1857;
        float _1917 = _1911 * _1905;
        float _1919 = fma(_1915, _1917, _1185);
        float _1921 = fma(_1895, _1917, _1179);
        float _1923 = fma(_1899, _1917, _1195);
        _1877 = _1921;
        _1879 = _1919;
        _1881 = _1923;
        _1495 = _1905;
    }
    float _1925 = _1877;
    float _1927 = _1879;
    float _1929 = _1881;
    float _1931 = _1495;
    float _1933 = _1931;
    if (_1775)
    {
        _1933 = 1.0;
    }
    float _1935 = _1933;
    float _1937 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1939 = _1765 * _1937;
    float _1941 = _1935;
    if (!_1775)
    {
        float _1943 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1945 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1947 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1945;
        float _1949 = _1943 * 0.15915493667125701904296875;
        float _1951 = _1949 * 6.283185482025146484375;
        float _1953 = cos(_1951);
        float _1955 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1957 = _1955 * 0.15915493667125701904296875;
        float _1959 = _1949 * 6.283185482025146484375;
        float _1961 = sin(_1959);
        float _1963 = 1.0 / _1953;
        float _1965 = _1957 * 6.283185482025146484375;
        float _1967 = cos(_1965);
        float _1969 = _1961 * _1963;
        float _1971 = _1957 * 6.283185482025146484375;
        float _1973 = sin(_1971);
        float _1975 = _1967 * _1969;
        float _1977 = 1.0 / _1947;
        float _1979 = 1.0 / _1975;
        float _1981 = _1973 * _1979;
        float _1983 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1985 = fma(_1939, _1981, _1983);
        float _1987 = _1985 * _1977;
        float _1989 = precise::clamp(_1987, 0.0, 1.0);
        _1273 = _1957;
        _1887 = _1989;
    }
    float _1991 = _1273;
    float _1993 = _1887;
    float _1995 = _1991;
    if (!_1775)
    {
        float _1997 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1999 = _1997 * 0.15915493667125701904296875;
        float _2001 = _1999 * 6.283185482025146484375;
        float _2003 = cos(_2001);
        float _2005 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2007 = _2005 * 0.15915493667125701904296875;
        float _2009 = _1999 * 6.283185482025146484375;
        float _2011 = sin(_2009);
        float _2013 = 1.0 / _2003;
        float _2015 = _2007 * 6.283185482025146484375;
        float _2017 = cos(_2015);
        float _2019 = _2011 * _2013;
        float _2021 = _2007 * 6.283185482025146484375;
        float _2023 = sin(_2021);
        float _2025 = _2017 * _2019;
        float _2027 = 1.0 / _2025;
        float _2029 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2031 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2029;
        float _2033 = 1.0 / _2031;
        float _2035 = _2023 * _2027;
        float _2037 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2039 = fma(_1939, _2035, _2037);
        float _2041 = _2039 * _2033;
        float _2043 = precise::clamp(_2041, 0.0, 1.0);
        float _2045 = -_2043;
        float _2047 = _2045 + 1.0;
        _1995 = _2027;
        _1941 = _2047;
    }
    float _2049 = _1995;
    float _2051 = _1941;
    float _2053 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2055 = _1925 + _2053;
    float _2057 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2059 = _1927 + _2057;
    float _2061 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2063 = _1929 + _2061;
    float _2065 = _2055 * _2055;
    float _2067 = fma(_2059, _2059, _2065);
    float _2069 = fma(_2063, _2063, _2067);
    float _2071 = rsqrt(_2069);
    float _2073 = sqrt(_2069);
    float _2075 = _2071 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2077 = _2059 * _2075;
    float _2079 = _2063 * _2075;
    float _2081 = _2077 * _2077;
    float _2083 = _2079 * _2079;
    float _2085 = _2081 + _2083;
    float _2087 = sqrt(_2085);
    bool _2089 = _2087 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2093 = _2087 + _2091;
    float _2095 = _2049;
    float _2097 = _2093;
    float _2099 = _2055;
    float _2101 = _2077;
    if (_2089)
    {
        float _2103 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2095 = _2103;
    }
    float _2105 = _2095;
    if (_2089)
    {
        float _2107 = rsqrt(_2085);
        _1275 = _2107;
    }
    float _2109 = _1275;
    float _2111 = _2109;
    if (_2089)
    {
        float _2113 = _2093 * _2105;
        _2097 = _2113;
    }
    float _2115 = _2097;
    if (_2089)
    {
        float _2117 = _2115 * 0.15915493667125701904296875;
        _201 = _2117;
    }
    float _2119 = _201;
    float _2121 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2123 = _2063;
    if (_2089)
    {
        float _2125 = _2119 * 6.283185482025146484375;
        float _2127 = sin(_2125);
        _2123 = _2127;
    }
    float _2129 = _2123;
    float _2131 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2133 = precise::max(0.0, _2131);
    float _2135 = _2105;
    float _2137 = _2133;
    if (_2089)
    {
        float _2139 = _2119 * 6.283185482025146484375;
        float _2141 = cos(_2139);
        _2135 = _2141;
    }
    float _2143 = _2135;
    float _2145 = -_2075;
    float _2147 = -_2133;
    float _2149 = fma(_2055, _2145, _2147);
    if (_2089)
    {
        float _2151 = _2149 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2099 = _2151;
    }
    float _2153 = _2099;
    float _2155 = _2153;
    float _2157 = _2129;
    if (_2089)
    {
        float _2159 = fma(_2129, _2153, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2155 = _2159;
    }
    float _2161 = _2155;
    float _2163 = _2161;
    if (!_2089)
    {
        _2157 = _2081;
    }
    float _2165 = _2157;
    float _2167 = _1925 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2169 = _2165;
    float _2171 = _2143;
    if (_2089)
    {
        float _2173 = _2143 + (-1.0);
        _2137 = _2173;
    }
    float _2175 = _2137;
    float _2177 = _2175;
    if (_2089)
    {
        float _2179 = _2109 * _2161;
        _1883 = _2179;
    }
    float _2181 = _1883;
    if (!_2089)
    {
        _2163 = _2149;
    }
    float _2183 = _2163;
    float _2185 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2167);
    float _2187 = _2183;
    if (_2089)
    {
        float _2189 = _2175 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2111 = _2189;
    }
    float _2191 = _2111;
    if (_2089)
    {
        float _2193 = _2077 * _2181;
        _2101 = _2193;
    }
    float _2195 = _2101;
    if (!_2089)
    {
        _2177 = _2079;
    }
    float _2197 = _2177;
    float _2199 = _2197;
    if (_2089)
    {
        float _2201 = _2079 * _2181;
        _2199 = _2201;
    }
    float _2203 = _2199;
    if (_2089)
    {
        float _2205 = fma(_2149, _2143, _2191);
        _2187 = _2205;
    }
    float _2207 = _2187;
    if (_2089)
    {
        float _2209 = _2195 * _2195;
        _2169 = _2209;
    }
    float _2211 = _2169;
    if (!_2089)
    {
        _2171 = _2083;
    }
    float _2213 = _2171;
    float _2215 = _2213;
    if (_2089)
    {
        float _2217 = _2203 * _2203;
        _2215 = _2217;
    }
    float _2219 = _2215;
    float _2221 = fma(_2207, _2207, _2211);
    float _2223 = _1925 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2225 = _2221 + _2219;
    float _2227 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2223);
    float _2229 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2231 = fma(_2073, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2229);
    float _2233 = precise::clamp(_2231, 0.0, 1.0);
    float _2235 = _1925 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2237 = rsqrt(_2225);
    float _2239 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2227);
    float _2241 = -_2233;
    float _2243 = _2241 + 1.0;
    float _2245 = _1925 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2247 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2235);
    float _2249 = _2239 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2251 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2245);
    float _2253 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2247);
    float _2255 = abs(_2243);
    float _2257 = log2(_2255);
    float _2259 = _2249 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2261 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2251);
    float _2263 = _2253 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2265 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2185);
    float _2267 = -_2259;
    float _2269 = fma(_2267, _2121, 1.0);
    float _2271 = _2261 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2273 = _2263 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2275 = _2237 * _2207;
    float _2277 = _2237 * _2195;
    float _2279 = _2237 * _2203;
    float _2281 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2273);
    float _2283 = _2265 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2285 = _2277 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2287 = log2(_2269);
    float _2289 = fma(_2249, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2281);
    float _2291 = _2257 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2293 = -_2285;
    float _2295 = fma(_2275, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2293);
    float _2297 = _2263 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2299 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2289);
    float _2301 = -_2279;
    float _2303 = fma(_2301, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2295);
    float _2305 = exp2(_2291);
    float _2307 = _2263 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2309 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2297);
    float _2311 = fma(_2303, -0.5, 0.5);
    float _2313 = fma(_2303, 0.5, 0.5);
    float _2315 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2307);
    float _2317 = _2275 + 1.0;
    float _2319 = fma(_2249, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2309);
    float _2321 = 1.0 / _2299;
    float _2323 = fma(_2249, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2315);
    float _2325 = fma(_2313, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2327 = fma(_2313, _2325, -0.212114393711090087890625);
    float _2329 = sqrt(_2311);
    float _2331 = -_2275;
    float _2333 = fma(_2305, _2317, _2331);
    float _2335 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2323);
    float _2337 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2319);
    float _2339 = _2287 * 0.693147182464599609375;
    float _2341 = fma(_2313, _2327, 1.570728778839111328125);
    float _2343 = fma(_2333, 0.5, 0.5);
    float _2345 = _2335 * _2321;
    float _2347 = _2337 * _2321;
    float _2349 = _2339 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2351 = fma(_2345, 0.5, 0.5);
    float _2353 = fma(_2347, -0.5, 0.5);
    float _2355 = _2329 * 0.636619746685028076171875;
    float3 _6381 = float3(_2351, _2353, _2349);
    float _2357 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6381, float3(0.0), isnan(_6381)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6381, float3(0.0), isnan(_6381)), level(0.0)).x;
    float _2359 = -_2341;
    float _2361 = fma(_2355, _2359, 1.0);
    float3 _6397 = float3(_2351, _2353, _2349);
    float4 _2364 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6397, float3(0.0), isnan(_6397)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6397, float3(0.0), isnan(_6397)), level(0.0)).xyzw;
    float _2366 = _2364.x;
    float _2368 = _2364.y;
    float _2370 = _2364.z;
    float _2372 = _2364.w;
    float2 _6414 = float2(_2361, _2343);
    float3 _2376 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6414, float2(0.0), isnan(_6414)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6414, float2(0.0), isnan(_6414)), level(0.0)).xyz;
    float _2378 = _2376.x;
    float _2380 = _2376.y;
    float _2382 = _2376.z;
    float _2384 = _2257 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2386 = _2263 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2388 = _2073 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2390 = isnan(_2073);
    bool _2392 = _2388 || _2390;
    bool _2394 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2396 = _2392 || _2394;
    float _2398 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2386);
    float _2400 = exp2(_2384);
    float _2402 = _2299 * 0.5;
    float _2404 = fma(_2249, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2398);
    float _2406 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2404);
    float _2408 = fma(_2337, -0.5, _2402);
    float _2410 = _2335 + _2299;
    float _2412 = _2406 + _2299;
    float _2414 = _2410 * 0.5;
    out.gl_Position.x = _2335;
    out.gl_Position.y = _2337;
    out.gl_Position.z = _2406;
    out.gl_Position.w = _2299;
    float _2416 = _2412 * 0.5;
    float _2418 = -_2400;
    float _2420 = _2418 + 1.0;
    float _2422 = _2420 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_74.x = _2414;
    out.m_74.y = _2408;
    out.m_74.z = _2416;
    out.m_74.w = _2299;
    float _2424 = _2337;
    float _2426 = _2335;
    if (!_2396)
    {
        _2424 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2428 = _2424;
    float _2430 = _2428;
    float _2432 = _2428;
    if (!_2396)
    {
        _2426 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2434 = _2426;
    float _2436 = _2422 * _2357;
    float _2438 = -_2422;
    float _2440 = _2438 + 1.0;
    float _2442 = _2372 * _2436;
    float _2444 = _2372 * _2440;
    float _2446 = _2382 * _2436;
    float _2448 = fma(_2378, _2442, _2366);
    float _2450 = fma(_2380, _2442, _2368);
    float _2452 = fma(_2372, _2446, _2370);
    float _2454 = _1993 * _2051;
    out.m_76.x = _2448;
    out.m_76.y = _2450;
    out.m_76.z = _2452;
    out.m_76.w = _2444;
    float _2456 = _2454 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2458 = _2454;
    float _2460 = _2434;
    float _2462 = _2434;
    if (!_2396)
    {
        _2458 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2464 = _2458;
    bool _2466 = !_2396;
    float _2468 = _2464;
    float _2470 = _2464;
    if (!_2466)
    {
        bool _2472 = _2073 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2474 = isnan(_2073);
        bool _2476 = _2472 || _2474;
        bool _2478 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2480 = _2476 || _2478;
        if (!_2480)
        {
            float _2482 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2484 = _2073 + _2482;
            float _2486 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2488 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2486;
            float _2490 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2492 = _2490 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2494 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2496 = _2494 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2498 = 1.0 / _2488;
            float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2502 = _2500 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2504 = _2484 * _2498;
            float _2506 = precise::clamp(_2504, 0.0, 1.0);
            float _2508 = fma(_2506, _2492, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2510 = fma(_2506, _2496, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2512 = fma(_2506, _2502, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2462 = _2510;
            _2432 = _2508;
            _2470 = _2512;
            _2514 = true;
        }
        else
        {
            bool _2516 = _2073 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2518 = isnan(_2073);
            bool _2520 = _2516 || _2518;
            bool _2522 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2524 = _2520 || _2522;
            if (!_2524)
            {
                _2430 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2526 = _2430;
            _2432 = _2526;
            if (!_2524)
            {
                _2460 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2528 = _2460;
            _2462 = _2528;
            if (!_2524)
            {
                _2468 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2530 = _2468;
            bool _2532 = !_2524;
            _2470 = _2530;
            if (!_2532)
            {
                bool _2534 = _2073 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2536 = isnan(_2073);
                bool _2538 = _2534 || _2536;
                bool _2540 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2542 = _2538 || _2540;
                if (!_2542)
                {
                    float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2546 = _2073 + _2544;
                    float _2548 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2550 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2548;
                    float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2554 = _2552 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2560 = 1.0 / _2550;
                    float _2562 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2564 = _2562 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2566 = _2546 * _2560;
                    float _2568 = precise::clamp(_2566, 0.0, 1.0);
                    float _2570 = fma(_2568, _2554, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2572 = fma(_2568, _2558, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2574 = fma(_2568, _2564, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2462 = _2572;
                    _2432 = _2570;
                    _2470 = _2574;
                    _2514 = true;
                }
                else
                {
                    _2462 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2432 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2470 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2514 = false;
    float _2576 = _2462;
    float _2578 = _2432;
    float _2580 = _2470;
    float _2582 = _2456 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_78.x = 0.0;
    float _2584 = _2576 * 0.586610972881317138671875;
    bool _2586 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_49.x = _2582;
    float _2588 = fma(_2578, 0.298911988735198974609375, _2584);
    bool _2590 = _1993 > 0.0;
    bool _2592 = isnan(_1993);
    bool _2594 = _2590 || _2592;
    bool _2596 = isnan(0.0);
    bool _2598 = _2594 || _2596;
    float _2600 = fma(_2580, 0.114477999508380889892578125, _2588);
    bool _2602 = _2051 <= 0.0;
    bool _2604 = !_2598;
    bool _2606 = _2602 || _2604;
    float _2608 = -_2600;
    float _2610 = _2608 + _2578;
    float _2612 = -_2600;
    float _2614 = _2612 + _2576;
    float _2616 = -_2600;
    float _2618 = _2616 + _2580;
    float _2620 = fma(_2610, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2600);
    float _2622 = fma(_2614, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2600);
    float _2624 = fma(_2618, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2600);
    bool _2626 = !_2586;
    if (!_2626)
    {
        float _2628 = -_1925;
        float _2630 = _2628 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2632 = -_1927;
        float _2634 = _2632 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2636 = -_1929;
        float _2638 = _2636 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2640 = _2630 * _2630;
        float _2642 = fma(_2634, _2634, _2640);
        float _2644 = fma(_2638, _2638, _2642);
        float _2646 = sqrt(_2644);
        float _2648 = rsqrt(_2644);
        float _2650 = -_2646;
        float _2652 = _2650 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2654 = _2652 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2656 = precise::clamp(_2654, 0.0, 1.0);
        float _2658 = _2634 * _2648;
        float _2660 = _2630 * _2648;
        float _2662 = abs(_2656);
        float _2664 = log2(_2662);
        float _2666 = _2638 * _2648;
        float _2668 = _2658 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2670 = _1603 * _2660;
        float _2672 = -_2660;
        float _2674 = -_2668;
        float _2676 = fma(_2672, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2674);
        float _2678 = fma(_1601, _2658, _2670);
        float _2680 = -_2666;
        float _2682 = fma(_2680, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2676);
        float _2684 = fma(_1605, _2666, _2678);
        float _2686 = precise::clamp(_2684, 0.0, 1.0);
        float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2690 = _2682 + _2688;
        float _2692 = _2664 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2694 = _2690 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2696 = precise::clamp(_2694, 0.0, 1.0);
        float _2698 = exp2(_2692);
        float _2700 = _2698 * _2696;
        float _2702 = _2686 * _2700;
        float _2704 = _2702 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2706 = _2702 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2708 = _2702 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_78.x = _2704;
        out.m_78.y = _2706;
        out.m_78.z = _2708;
    }
    out.m_80.x = _2620;
    out.m_80.y = _2622;
    out.m_80.z = _2624;
    if (!_2606)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2710 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2710;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2514 = false;
    bool _1655 = false;
    bool _331 = false;
    bool _221 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _94 = in.m_46.w;
    float _96 = trunc(_94);
    int _99 = int(_96);
    bool _103 = _99 >= 1;
    float _105 = 0.0;
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _105;
    float _109 = _107;
    if (!_103)
    {
        out.m_49.x = 0.0;
    }
    int _111 = 0;
    if (!_103)
    {
        float _113 = _107 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    int _117 = _115;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2767 = as_type<float>(_115);
        out.gl_Position.z = _2767;
    }
    if (!_103)
    {
        return out;
    }
    float _119 = in.m_51.w;
    bool _121 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = isnan(_119);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _129 = _125 || _127;
    float _131 = -_119;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _135 = 0.0;
    float _137 = _133;
    if (_129)
    {
        float _139 = float(_99);
        _135 = _139;
    }
    float _141 = _135;
    bool _143 = _133 >= _141;
    bool _145 = !_129;
    bool _147 = _143 || _145;
    if (_147)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _109;
    if (_147)
    {
        out.m_49.x = 0.0;
    }
    if (_147)
    {
        float _151 = _149 * 5.0;
        _117 = as_type<int>(_151);
    }
    int _153 = _117;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2836 = as_type<float>(_153);
        out.gl_Position.z = _2836;
    }
    if (_147)
    {
        return out;
    }
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = in.m_56.x;
    float _159 = in.m_56.y;
    float _161 = in.m_56.z;
    int _163 = as_type<int>(_155) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_155) & 2;
    bool _169 = _167 != 0;
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _173 = _159 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _175 = _159 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _177 = _159 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _179 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[6].x, _173);
    float _181 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[4].x, _175);
    float _183 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[5].x, _177);
    float _185 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].z, _179);
    float _187 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].z, _181);
    float _189 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].z, _183);
    bool _191 = !_165;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_169;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_171;
    float _201 = _189;
    float _219;
    if (!_199)
    {
        float _203 = in.m_58.x;
        float _205 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _207 = _203 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _209 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _211 = _209 * _205;
        float _213 = floor(_211);
        float _215 = -_213;
        float _217 = _211 + _215;
        _219 = _217;
        _221 = true;
    }
    else
    {
        float _223 = float(_99);
        float _225 = 1.0 / _223;
        float _227 = _133 * _225;
        _219 = _227;
    }
    _221 = false;
    float _229 = _219;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = _229 + _231;
    bool _235 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _237 = isnan(_229);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _243 = _239 || _241;
    float _245 = float(_243);
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _247;
    float _251 = -_245;
    float _253 = _251 + 1.0;
    bool _255 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _257 = isnan(_229);
    bool _259 = _255 || _257;
    bool _261 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _263 = _259 || _261;
    float _265 = float(_263);
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _267;
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _273 = 1.0 / _249;
    float _275 = _265 * _253;
    float _277 = -_265;
    float _279 = _277 + 1.0;
    float _281 = _233 * _273;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _283;
    float _287 = fma(_269, _281, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _289 = fma(_285, _281, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _291 = _287 * _275;
    float _293 = _289 * _275;
    float _295 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].x, _291);
    float _297 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].y, _293);
    float _299 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[144].x, _295);
    float _301 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[144].y, _297);
    bool _303 = !_271;
    float _327;
    float _329;
    if (!_303)
    {
        float _305 = in.m_58.x;
        float _307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _309 = float(_99);
        float _311 = 1.0 / _309;
        float _313 = _305 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _315 = _133 * _311;
        float _317 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _319 = _317 * _307;
        float _321 = floor(_319);
        float _323 = -_321;
        float _325 = _319 + _323;
        _327 = _315;
        _329 = _325;
        _331 = true;
    }
    else
    {
        float _333 = float(_99);
        float _335 = 1.0 / _333;
        float _337 = _133 * _335;
        _327 = _337;
        _329 = _337;
    }
    _331 = false;
    float _339 = _327;
    float _341 = _329;
    float _343 = in.m_58.x;
    float _345 = in.m_58.y;
    float _347 = in.m_58.z;
    float _349 = in.m_58.w;
    float _351 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _353 = log2(_351);
    float _355 = in.m_46.x;
    float _357 = in.m_46.y;
    float _359 = in.m_46.z;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _363 = _361 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _373 = 1.0 / _363;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _383 = _353 * _133;
    float _385 = 1.0 / _367;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _391 = _349 > 0.5;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _397 = 1.0 / _371;
    bool _399 = _343 > 0.5;
    float _401 = _357 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _405 = _403 != 0;
    float _407 = _357 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _411 = _409 != 0;
    float _413 = _357 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _417 = _415 != 0;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _425 = _423 != 0;
    float _427 = 1.0 / _377;
    float _429 = -_197;
    int _431 = _391 ? as_type<int>(_429) : as_type<int>(_197);
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _435 = -_193;
    int _437 = _399 ? as_type<int>(_435) : as_type<int>(_193);
    float _439 = _387 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _443 = _441 != 0;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _447 = _445 != 0;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _451 = _449 != 0;
    float _453 = _389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _455 = _421 * _373;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _463 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[4].x, _401);
    float _465 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[5].x, _407);
    float _467 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[6].x, _413);
    float _469 = _461 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _471 = 1.0 / _381;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    out.m_60.x = _469;
    out.m_60.y = _439;
    out.m_60.z = _453;
    out.m_60.w = _433;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _485 = _475 * _385;
    float _487 = _345 * 2.0;
    float _489 = 1.0 / _395;
    bool _491 = !_405;
    float _493 = _491 ? _193 : as_type<float>(_437);
    float _495 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].z, _463);
    bool _497 = _345 > 0.5;
    float _499 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].z, _465);
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _503 = _339 + _501;
    float _505 = 1.0 / _459;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _507;
    float _511 = -_197;
    int _513 = _497 ? as_type<int>(_511) : as_type<int>(_197);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _517 = 1.0 + _515;
    bool _519 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _521 = isnan(1.0);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _527 = _523 || _525;
    float _529 = _509 * _397;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _535;
    float _539 = 1.0 / _483;
    float _541 = _533 * _427;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _547 = _537 * _471;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _549;
    float _553 = _343 * 2.0;
    float _555 = _545 * _489;
    float _557 = exp2(_383);
    float _559 = _345 + _347;
    float _561 = _551 * _505;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _563;
    float _567 = _559 + (-1.0);
    bool _569 = !_411;
    float _571 = _569 ? _197 : as_type<float>(_513);
    float _573 = floor(_553);
    float _575 = _565 * _539;
    float _577 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _579 = !_425;
    float _581 = _579 ? _197 : as_type<float>(_431);
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    bool _587 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _589 = isnan(0.0);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _595 = _591 || _593;
    float _597 = fma(_575, _503, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _599 = _347 > 0.5;
    float _601 = 1.0 / _517;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _607 = -_557;
    float _609 = _607 + 1.0;
    float _611 = -_193;
    int _613 = _599 ? as_type<int>(_611) : as_type<int>(_193);
    float _615 = _493 + 0.5;
    bool _617 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _619 = isnan(_341);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = -_571;
    float _631 = _629 + 0.5;
    float _633 = _595 ? _609 : 0.0;
    float _635 = 1.0 / _479;
    float _637 = _615 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _639 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _641 = isnan(_339);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = _499 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _653 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _655 = isnan(_339);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    bool _665 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _667 = isnan(_339);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = 1.0 / _605;
    float _679 = _347 * 2.0;
    if (_527)
    {
        float _681 = _633 * _601;
        _137 = _681;
    }
    float _683 = _137;
    bool _685 = !_417;
    float _687 = _685 ? _193 : as_type<float>(_613);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _689;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _695 = _341 + _693;
    bool _697 = _573 >= 0.0;
    bool _699 = isnan(_573);
    bool _701 = _697 || _699;
    bool _703 = isnan(0.0);
    bool _705 = _701 || _703;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _709 = _341 + _707;
    float _711 = floor(_679);
    bool _713 = _573 > 0.0;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _717 = _341 + _715;
    int _719 = _705 ? 0 : 1;
    float _721 = _585 * _635;
    float _723 = fma(_485, _709, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _727 = _339 + _725;
    float _729 = floor(_487);
    float _731 = _691 * _677;
    float _733 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].z, _467);
    float _735 = fma(_455, _695, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _739 = _339 + _737;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _743 = _339 + _741;
    float _745 = _345 + _343;
    float _747 = fma(_529, _717, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _749 = _711 >= 0.0;
    bool _751 = isnan(_711);
    bool _753 = _749 || _751;
    bool _755 = isnan(0.0);
    bool _757 = _753 || _755;
    float _759 = fma(_541, _739, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _761 = _711 > 0.0;
    float _763 = fma(_547, _743, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    int _765 = _757 ? 0 : 1;
    float _767 = _745 + (-1.0);
    bool _769 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _771 = isnan(_341);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _783 = _339 + _781;
    bool _785 = _729 > 0.0;
    float _787 = fma(_555, _727, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _789 = _729 >= 0.0;
    bool _791 = isnan(_729);
    bool _793 = _789 || _791;
    bool _795 = isnan(0.0);
    bool _797 = _793 || _795;
    float _799 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _801 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _803 = isnan(_341);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = fma(_561, _783, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    bool _815 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _817 = isnan(_341);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    float _827 = -_779;
    float _829 = _827 + 1.0;
    bool _831 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _833 = isnan(_339);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = -_649;
    float _845 = _843 + 1.0;
    bool _847 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _849 = isnan(_339);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = -_825;
    float _861 = _859 + 1.0;
    bool _863 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _865 = isnan(_339);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _871 = _867 || _869;
    float _873 = float(_871);
    float _875 = -_841;
    float _877 = _875 + 1.0;
    float _879 = _811 * _829;
    float _881 = -_857;
    float _883 = _881 + 1.0;
    float _885 = _779 * _861;
    float _887 = _649 * _877;
    float _889 = -_811;
    float _891 = _889 + 1.0;
    float _893 = _873 * _883;
    bool _895 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _897 = isnan(_339);
    bool _899 = _895 || _897;
    bool _901 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    float _907 = -_873;
    float _909 = _907 + 1.0;
    float _911 = _663 * _845;
    float _913 = -_663;
    float _915 = _913 + 1.0;
    float _917 = _627 * _891;
    float _919 = _841 * _909;
    float _921 = -_905;
    float _923 = _921 + 1.0;
    float _925 = _905 * _915;
    float _927 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _929 = _723 * _917;
    bool _931 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _933 = isnan(_339);
    bool _935 = _931 || _933;
    bool _937 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _939 = _935 || _937;
    float _941 = float(_939);
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _945 = _339 + _943;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _949 = _339 + _947;
    float _951 = -_675;
    float _953 = _951 + 1.0;
    float _955 = _675 * _923;
    float _957 = fma(_721, _945, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _959 = fma(_731, _949, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _961 = _941 * _953;
    float _963 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _965 = -_941;
    float _967 = _965 + 1.0;
    float _969 = _631 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _971 = _763 * _961;
    float _973 = -_581;
    float _975 = _973 + 0.5;
    float _977 = -_627;
    float _979 = _977 + 1.0;
    float _981 = _637 * _927;
    float _983 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[151].x, _971);
    float _985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _987 = _975 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _989 = _797 ? 0 : 1;
    float _991 = fma(_759, _955, _983);
    float _993 = _687 + 0.5;
    float _995 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[115].x, _929);
    int _997 = ~_989;
    int _999 = _997 + 1;
    int _1001 = _999 + 1;
    float _1003 = fma(_813, _925, _991);
    float _1005 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1007 = _987 * _963;
    int _1009 = _1001;
    if (!_785)
    {
        int _1011 = ~_989;
        int _1013 = _1011 + 1;
        _1009 = _1013;
    }
    int _1015 = _1009;
    float _1017 = _993 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1019 = !_443;
    int _1021 = _1019 ? 0 : 1;
    float _1023 = fma(_787, _911, _1003);
    bool _1025 = !_447;
    int _1027 = _1025 ? 0 : 1;
    float _1029 = fma(_735, _879, _995);
    float _1031 = _969 * _985;
    int _1033 = abs(_1021);
    float _1035 = _733 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1037 = abs(_1027);
    float _1039 = fma(_597, _887, _1023);
    float _1041 = in.m_62.x;
    float _1043 = in.m_62.y;
    float _1045 = in.m_62.z;
    int _1047 = ~_765;
    int _1049 = _1047 + 1;
    int _1051 = _1049 + 1;
    float _1053 = _345 + (-0.5);
    float _1055 = _1017 * _1005;
    float _1057 = _495 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1059 = _1051;
    if (!_761)
    {
        int _1061 = ~_765;
        int _1063 = _1061 + 1;
        _1059 = _1063;
    }
    int _1065 = _1059;
    float _1067 = fma(_957, _919, _1039);
    out.m_64.x = _981;
    out.m_64.y = _1031;
    out.m_64.z = _1055;
    out.m_64.w = _1007;
    float _1069 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1071 = _1057 + _1069;
    float _1073 = float(_1065);
    int _1075 = ~_719;
    int _1077 = _1075 + 1;
    int _1079 = _1077 + 1;
    int _1081 = _1079;
    if (!_713)
    {
        int _1083 = ~_719;
        int _1085 = _1083 + 1;
        _1081 = _1085;
    }
    int _1087 = _1081;
    float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1091 = _651 + _1089;
    float _1093 = float(_1033);
    float _1095 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1097 = _1035 + _1095;
    float _1099 = float(_1037);
    float _1101 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1103 = float(_1087);
    float _1105 = _1093 * _1073;
    float _1107 = fma(_747, _885, _1029);
    float _1109 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1101);
    float _1111 = _1099 * _1103;
    float _1113 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1107);
    float _1115 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1109);
    float _1117 = _1105 * (-2.0);
    float _1119 = _1091 * _1091;
    float _1121 = _343 + (-0.5);
    bool _1123 = _1115 >= 0.0;
    float _1125 = fma(_1117, _1041, _1041);
    float _1127 = fma(_959, _893, _1067);
    float _1129 = fma(_1071, _1071, _1119);
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1133 = fma(_1097, _1097, _1129);
    float _1135 = fma(_799, _1117, _799);
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1139 = rsqrt(_1133);
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1143 = (*spvDescriptorSet0.vp_c9)._m0[107].z;
    if (_1123)
    {
        _1143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1145 = _1143;
    float _1147 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1149 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1151 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1153 = _1113 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1155 = as_type<int>(_1145);
    if (_1123)
    {
        float _1157 = _1145 * 5.0;
        _1155 = as_type<int>(_1157);
    }
    int _1159 = _1155;
    float _1161 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1127);
    float _1163 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1125);
    bool _1165 = !_451;
    int _1167 = _1165 ? 0 : 1;
    out.m_66.x = _1147;
    out.m_66.y = _1149;
    out.m_66.z = _1151;
    out.m_66.w = _1153;
    float _1169 = fma(_1135, _683, _1163);
    int _1171 = abs(_1167);
    if (_1123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4440 = as_type<float>(_1159);
        out.gl_Position.z = _4440;
    }
    float _1173 = _1091 * _1139;
    float _1175 = _1071 * _1139;
    out.m_68.x = _1161;
    if (_1123)
    {
        out.m_49.x = 0.0;
    }
    if (_1123)
    {
        return out;
    }
    float _1177 = -_1173;
    float _1179 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[18].w, _651);
    float _1181 = _1097 * _1139;
    float _1183 = -_1175;
    float _1185 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1057);
    float _1187 = float(_1171);
    float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1191 = _1179 + _1189;
    float _1193 = -_1181;
    float _1195 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1035);
    float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1199 = _1185 + _1197;
    float _1201 = _1111 * (-2.0);
    float _1203 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1205 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1207 = _1195 + _1205;
    float _1209 = float(_1015);
    float _1211 = fma(_1201, _1043, _1043);
    float _1213 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1203);
    float _1215 = -_1173;
    float _1217 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1091);
    float _1219 = fma(_577, _1201, _577);
    float _1221 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1211);
    float _1223 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1213);
    float _1225 = -_1175;
    float _1227 = fma(_1225, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1071);
    float _1229 = _1217 * _1217;
    float _1231 = _1187 * _1209;
    float _1233 = _347 + _343;
    bool _1235 = _1223 >= 0.0;
    float _1237 = fma(_1227, _1227, _1229);
    float _1239 = in.m_70.x;
    float _1241 = in.m_70.y;
    float _1243 = -_1181;
    float _1245 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1097);
    float _1247 = fma(_1219, _683, _1221);
    float _1249 = _1169 * 0.15915493667125701904296875;
    float _1251 = _1233 + (-1.0);
    float _1253 = fma(_1245, _1245, _1237);
    float _1255 = _1231 * (-2.0);
    float _1257 = _1247 * 0.15915493667125701904296875;
    float _1259 = _1249 * 6.283185482025146484375;
    float _1261 = sin(_1259);
    float _1263 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1265 = _347 + (-0.5);
    float _1267 = fma(_1255, _1045, _1045);
    float _1269 = _1249;
    int _1271 = as_type<int>(_1265);
    float _1273 = _1195;
    float _1275 = _1207;
    if (_1235)
    {
        out.m_49.x = 0.0;
    }
    float _1277 = fma(_1263, _1255, _1263);
    float _1279 = fma(_1265, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1267);
    float _1281 = _1249 * 6.283185482025146484375;
    float _1283 = cos(_1281);
    float _1285 = fma(_1277, _683, _1279);
    float _1287 = _301 * _1241;
    float _1289 = _1257 * 6.283185482025146484375;
    float _1291 = sin(_1289);
    if (_1235)
    {
        _1269 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1293 = _1269;
    float _1295 = _1285 * 0.15915493667125701904296875;
    if (_1235)
    {
        float _1297 = _1293 * 5.0;
        _1271 = as_type<int>(_1297);
    }
    int _1299 = _1271;
    float _1301 = sqrt(_1253);
    if (_1235)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4664 = as_type<float>(_1299);
        out.gl_Position.z = _4664;
    }
    float _1303 = _1257 * 6.283185482025146484375;
    float _1305 = cos(_1303);
    if (_1235)
    {
        return out;
    }
    float _1307 = _1295 * 6.283185482025146484375;
    float _1309 = cos(_1307);
    float _1311 = _1139 * _1301;
    float _1313 = _1287 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1315 = _299 * _1239;
    float _1317 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _1319 = _1283 * _1305;
    float _1321 = _1313 * _1311;
    float _1323 = _1315 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1325 = _1295 * 6.283185482025146484375;
    float _1327 = sin(_1325);
    float _1329 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _1331 = _1317 * _1321;
    float _1333 = _1323 * _1311;
    float _1335 = _1261 * _1291;
    float _1337 = _1283 * _1291;
    float _1339 = _1261 * _1305;
    float _1341 = _1329 * _1333;
    float _1343 = _1283 * _1309;
    float _1345 = _1305 * _1309;
    float _1347 = _1261 * _1309;
    float _1349 = _1291 * _1309;
    float _1351 = _1343 * _1331;
    float _1353 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1355 = _1353 * 0.5;
    float _1357 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1359 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1361 = fma(_1327, _1319, _1335);
    float _1363 = -_1331;
    float _1365 = _1327 * _1363;
    float _1367 = -_1339;
    float _1369 = fma(_1327, _1337, _1367);
    float _1371 = -_1337;
    float _1373 = fma(_1327, _1339, _1371);
    float _1375 = fma(_1361, _1341, _1351);
    float _1377 = fma(_1345, _1341, _1365);
    float _1379 = _1347 * _1331;
    float _1381 = fma(_1327, _1335, _1319);
    float _1383 = fma(_1369, _1355, _1375);
    float _1385 = fma(_1349, _1355, _1377);
    float _1387 = fma(_1373, _1341, _1379);
    float _1389 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1391 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1393 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1395 = fma(_1381, _1355, _1387);
    float _1397 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1399 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1391);
    float _1401 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1393);
    float _1403 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1405 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1397);
    float _1407 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1399);
    float _1409 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1401);
    float _1411 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1413 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1415 = _1407 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1417 = _1409 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1419 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1405);
    float _1421 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1389);
    float _1423 = _1057 + _1415;
    float _1425 = _1035 + _1417;
    float _1427 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1403);
    float _1429 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1411);
    float _1431 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1433 = _1423 + _1431;
    float _1435 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1437 = _1425 + _1435;
    float _1439 = -_1327;
    float _1441 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1357);
    float _1443 = -_1327;
    float _1445 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1359);
    float _1447 = _1433 * _1433;
    float _1449 = _1437 * _1437;
    float _1451 = -_1327;
    float _1453 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1413);
    float _1455 = _1419 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1457 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1421);
    float _1459 = _1447 + _1449;
    float _1461 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1427);
    float _1463 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1429);
    float _1465 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1467 = sqrt(_1459);
    float _1469 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1471 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1473 = _651 + _1455;
    float _1475 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1465);
    float _1477 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1469);
    float _1479 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1471);
    bool _1481 = _1467 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1483 = _1471;
    float _1485 = _1447;
    float _1487 = _1449;
    float _1489 = _1423;
    float _1491 = _1425;
    float _1493 = _1459;
    float _1495 = _1311;
    if (!_1481)
    {
        _1483 = _1473;
    }
    float _1497 = _1483;
    bool _1499 = !_1481;
    float _1501 = _1497;
    if (!_1499)
    {
        float _1503 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1507 = _1467 + _1505;
        float _1509 = _1473 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1511 = rsqrt(_1459);
        float _1513 = _1507 * _1503;
        float _1515 = _1513 * 0.15915493667125701904296875;
        float _1517 = _1515 * 6.283185482025146484375;
        float _1519 = sin(_1517);
        float _1521 = _1515 * 6.283185482025146484375;
        float _1523 = cos(_1521);
        float _1525 = fma(_1519, _1509, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1527 = _1511 * _1525;
        float _1529 = _1523 + (-1.0);
        float _1531 = fma(_1433, _1527, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1533 = fma(_1437, _1527, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1535 = _1529 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1537 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1539 = _1531 + _1537;
        float _1541 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1543 = _1533 + _1541;
        float _1545 = fma(_1473, _1523, _1535);
        float _1547 = _1539 * _1539;
        float _1549 = _1543 * _1543;
        _1501 = _1545;
        _1485 = _1547;
        _1487 = _1549;
        _1489 = _1531;
        _1491 = _1533;
        _1493 = _1511;
    }
    float _1551 = _1501;
    float _1553 = _1485;
    float _1555 = _1487;
    float _1557 = _1489;
    float _1559 = _1491;
    float _1561 = _1493;
    float _1563 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1565 = _1551 + _1563;
    float _1567 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1441);
    float _1569 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1445);
    float _1571 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1453);
    float _1573 = fma(_1565, _1565, _1553);
    float _1575 = _197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1577 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1475);
    float _1579 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1477);
    float _1581 = _1573 + _1555;
    float _1583 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1479);
    float _1585 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1587 = _1575 * _1567;
    float _1589 = _1575 * _1569;
    float _1591 = _1575 * _1571;
    float _1593 = sqrt(_1581);
    float _1595 = fma(_1585, _1457, _1587);
    float _1597 = fma(_1585, _1461, _1589);
    float _1599 = fma(_1585, _1463, _1591);
    float _1601 = _1577 + _1595;
    float _1603 = _1579 + _1597;
    float _1605 = _1583 + _1599;
    out.m_72.x = _1601;
    out.m_72.y = _1603;
    out.m_72.z = _1605;
    bool _1607 = _1593 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1609 = isnan(_1593);
    bool _1611 = _1607 || _1609;
    bool _1613 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1615 = _1611 || _1613;
    float _1617 = _1561;
    float _1619 = _1575;
    if (!_1615)
    {
        _1617 = 1.0;
    }
    float _1621 = _1617;
    bool _1623 = !_1615;
    float _1625 = _1621;
    if (!_1623)
    {
        bool _1627 = _1593 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1629 = isnan(_1593);
        bool _1631 = _1627 || _1629;
        bool _1633 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1635 = _1631 || _1633;
        if (!_1635)
        {
            float _1637 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1639 = _1593 + _1637;
            float _1641 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1643 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1641;
            float _1645 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1647 = _1645 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1649 = 1.0 / _1643;
            float _1651 = _1639 * _1649;
            float _1653 = fma(_1651, _1647, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1625 = _1653;
            _1655 = true;
        }
        else
        {
            bool _1657 = _1593 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1659 = isnan(_1593);
            bool _1661 = _1657 || _1659;
            bool _1663 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1665 = _1661 || _1663;
            if (!_1665)
            {
                float _1667 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1669 = _1593 + _1667;
                float _1671 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1673 = _1671 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1675 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1677 = _1675 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1679 = 1.0 / _1673;
                float _1681 = _1669 * _1679;
                float _1683 = fma(_1681, _1677, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1625 = _1683;
                _1655 = true;
            }
            else
            {
                _1625 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1655 = false;
    float _1685 = _1625;
    float _1687 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1689 = _1551 + _1687;
    float _1691 = _1179 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1693 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1695 = _1557 + _1693;
    float _1697 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1699 = _1559 + _1697;
    float _1701 = fma(_1689, _1685, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1703 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1691);
    float _1705 = fma(_1695, _1685, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1707 = fma(_1699, _1685, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1709 = -_651;
    float _1711 = _1709 + _1701;
    float _1713 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1703);
    float _1715 = -_1057;
    float _1717 = _1715 + _1705;
    float _1719 = -_1035;
    float _1721 = _1719 + _1707;
    float _1723 = _1711 * _1711;
    float _1725 = _1713 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1727 = _1179 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1729 = fma(_1717, _1717, _1723);
    float _1731 = 1.0 / _1725;
    float _1733 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1727);
    float _1735 = fma(_1721, _1721, _1729);
    float _1737 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1733);
    float _1739 = sqrt(_1735);
    float _1741 = _1737 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1743 = _1741 + _1725;
    float _1745 = _1743 * _1731;
    float _1747 = _1745 * 0.5;
    bool _1749 = _1739 > 0.0;
    float _1751 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1753 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1751);
    bool _1755 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1757 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1759 = _1755 || _1757;
    bool _1761 = isnan(0.5);
    bool _1763 = _1759 || _1761;
    float _1765 = 1.0 / _1753;
    bool _1767 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1769 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1771 = _1767 || _1769;
    bool _1773 = isnan(0.5);
    bool _1775 = _1771 || _1773;
    float _1777 = _1725;
    float _1779 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1781 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1783 = _1705;
    if (!_1749)
    {
        _1777 = _1705;
    }
    float _1785 = _1777;
    float _1787 = _1785;
    float _1789 = _1785;
    if (!_1749)
    {
        _1779 = _1701;
    }
    float _1791 = _1779;
    float _1793 = _1791;
    if (!_1749)
    {
        _1781 = _1707;
    }
    float _1795 = _1781;
    bool _1797 = !_1749;
    float _1799 = _1795;
    if (!_1797)
    {
        float _1801 = _189 * _189;
        float _1803 = rsqrt(_1735);
        float _1805 = fma(_187, _187, _1801);
        float _1807 = fma(_185, _185, _1805);
        float _1809 = sqrt(_1807);
        float _1811 = _1717 * _1803;
        float _1813 = _1711 * _1803;
        float _1815 = _1721 * _1803;
        bool _1817 = _1809 > 0.0;
        float _1819 = _1803;
        float _1821 = _1809;
        _1619 = _1807;
        if (!_1817)
        {
            _1787 = _1705;
        }
        float _1823 = _1787;
        _1789 = _1823;
        if (!_1817)
        {
            _1819 = _1701;
        }
        float _1825 = _1819;
        _1793 = _1825;
        if (!_1817)
        {
            _1821 = _1707;
        }
        float _1827 = _1821;
        bool _1829 = !_1817;
        _1799 = _1827;
        if (!_1829)
        {
            float _1831 = rsqrt(_1807);
            float _1833 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1835 = _189 * _1831;
            float _1837 = _187 * _1831;
            float _1839 = _1813 * _1835;
            float _1841 = _185 * _1831;
            float _1843 = fma(_1811, _1837, _1839);
            float _1845 = _1833 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1847 = fma(_1815, _1841, _1843);
            float _1849 = _1847 * _1845;
            float _1851 = fma(_187, _1849, _1705);
            float _1853 = fma(_189, _1849, _1701);
            float _1855 = fma(_185, _1849, _1707);
            _1789 = _1851;
            _1793 = _1853;
            _1799 = _1855;
            _1619 = _1831;
        }
    }
    float _1857 = _1789;
    float _1859 = _1793;
    float _1861 = _1799;
    float _1863 = _1619;
    float _1865 = -_1175;
    float _1867 = fma(_1865, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1857);
    float _1869 = -_1173;
    float _1871 = fma(_1869, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1859);
    float _1873 = -_1181;
    float _1875 = fma(_1873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1861);
    float _1877 = _1871;
    float _1879 = _1867;
    float _1881 = _1875;
    float _1883 = _1863;
    if (_1775)
    {
        _1783 = 1.0;
    }
    float _1885 = _1783;
    float _1887 = _1885;
    if (!_1763)
    {
        float _1889 = _1191 * _1191;
        float _1891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1893 = -_651;
        float _1895 = _1893 + _1859;
        float _1897 = -_1035;
        float _1899 = _1897 + _1861;
        float _1901 = fma(_1199, _1199, _1889);
        float _1903 = fma(_1207, _1207, _1901);
        float _1905 = 1.0 / _1311;
        float _1907 = sqrt(_1903);
        float _1909 = precise::min(_1907, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1911 = _1909 * _1891;
        float _1913 = -_1057;
        float _1915 = _1913 + _1857;
        float _1917 = _1911 * _1905;
        float _1919 = fma(_1915, _1917, _1185);
        float _1921 = fma(_1895, _1917, _1179);
        float _1923 = fma(_1899, _1917, _1195);
        _1877 = _1921;
        _1879 = _1919;
        _1881 = _1923;
        _1495 = _1905;
    }
    float _1925 = _1877;
    float _1927 = _1879;
    float _1929 = _1881;
    float _1931 = _1495;
    float _1933 = _1931;
    if (_1775)
    {
        _1933 = 1.0;
    }
    float _1935 = _1933;
    float _1937 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1939 = _1765 * _1937;
    float _1941 = _1935;
    if (!_1775)
    {
        float _1943 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1945 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1947 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1945;
        float _1949 = _1943 * 0.15915493667125701904296875;
        float _1951 = _1949 * 6.283185482025146484375;
        float _1953 = cos(_1951);
        float _1955 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1957 = _1955 * 0.15915493667125701904296875;
        float _1959 = _1949 * 6.283185482025146484375;
        float _1961 = sin(_1959);
        float _1963 = 1.0 / _1953;
        float _1965 = _1957 * 6.283185482025146484375;
        float _1967 = cos(_1965);
        float _1969 = _1961 * _1963;
        float _1971 = _1957 * 6.283185482025146484375;
        float _1973 = sin(_1971);
        float _1975 = _1967 * _1969;
        float _1977 = 1.0 / _1947;
        float _1979 = 1.0 / _1975;
        float _1981 = _1973 * _1979;
        float _1983 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1985 = fma(_1939, _1981, _1983);
        float _1987 = _1985 * _1977;
        float _1989 = precise::clamp(_1987, 0.0, 1.0);
        _1273 = _1957;
        _1887 = _1989;
    }
    float _1991 = _1273;
    float _1993 = _1887;
    float _1995 = _1991;
    if (!_1775)
    {
        float _1997 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1999 = _1997 * 0.15915493667125701904296875;
        float _2001 = _1999 * 6.283185482025146484375;
        float _2003 = cos(_2001);
        float _2005 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2007 = _2005 * 0.15915493667125701904296875;
        float _2009 = _1999 * 6.283185482025146484375;
        float _2011 = sin(_2009);
        float _2013 = 1.0 / _2003;
        float _2015 = _2007 * 6.283185482025146484375;
        float _2017 = cos(_2015);
        float _2019 = _2011 * _2013;
        float _2021 = _2007 * 6.283185482025146484375;
        float _2023 = sin(_2021);
        float _2025 = _2017 * _2019;
        float _2027 = 1.0 / _2025;
        float _2029 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2031 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2029;
        float _2033 = 1.0 / _2031;
        float _2035 = _2023 * _2027;
        float _2037 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2039 = fma(_1939, _2035, _2037);
        float _2041 = _2039 * _2033;
        float _2043 = precise::clamp(_2041, 0.0, 1.0);
        float _2045 = -_2043;
        float _2047 = _2045 + 1.0;
        _1995 = _2027;
        _1941 = _2047;
    }
    float _2049 = _1995;
    float _2051 = _1941;
    float _2053 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2055 = _1925 + _2053;
    float _2057 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2059 = _1927 + _2057;
    float _2061 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2063 = _1929 + _2061;
    float _2065 = _2055 * _2055;
    float _2067 = fma(_2059, _2059, _2065);
    float _2069 = fma(_2063, _2063, _2067);
    float _2071 = rsqrt(_2069);
    float _2073 = sqrt(_2069);
    float _2075 = _2071 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2077 = _2059 * _2075;
    float _2079 = _2063 * _2075;
    float _2081 = _2077 * _2077;
    float _2083 = _2079 * _2079;
    float _2085 = _2081 + _2083;
    float _2087 = sqrt(_2085);
    bool _2089 = _2087 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2093 = _2087 + _2091;
    float _2095 = _2049;
    float _2097 = _2093;
    float _2099 = _2055;
    float _2101 = _2077;
    if (_2089)
    {
        float _2103 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2095 = _2103;
    }
    float _2105 = _2095;
    if (_2089)
    {
        float _2107 = rsqrt(_2085);
        _1275 = _2107;
    }
    float _2109 = _1275;
    float _2111 = _2109;
    if (_2089)
    {
        float _2113 = _2093 * _2105;
        _2097 = _2113;
    }
    float _2115 = _2097;
    if (_2089)
    {
        float _2117 = _2115 * 0.15915493667125701904296875;
        _201 = _2117;
    }
    float _2119 = _201;
    float _2121 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2123 = _2063;
    if (_2089)
    {
        float _2125 = _2119 * 6.283185482025146484375;
        float _2127 = sin(_2125);
        _2123 = _2127;
    }
    float _2129 = _2123;
    float _2131 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2133 = precise::max(0.0, _2131);
    float _2135 = _2105;
    float _2137 = _2133;
    if (_2089)
    {
        float _2139 = _2119 * 6.283185482025146484375;
        float _2141 = cos(_2139);
        _2135 = _2141;
    }
    float _2143 = _2135;
    float _2145 = -_2075;
    float _2147 = -_2133;
    float _2149 = fma(_2055, _2145, _2147);
    if (_2089)
    {
        float _2151 = _2149 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2099 = _2151;
    }
    float _2153 = _2099;
    float _2155 = _2153;
    float _2157 = _2129;
    if (_2089)
    {
        float _2159 = fma(_2129, _2153, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2155 = _2159;
    }
    float _2161 = _2155;
    float _2163 = _2161;
    if (!_2089)
    {
        _2157 = _2081;
    }
    float _2165 = _2157;
    float _2167 = _1925 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2169 = _2165;
    float _2171 = _2143;
    if (_2089)
    {
        float _2173 = _2143 + (-1.0);
        _2137 = _2173;
    }
    float _2175 = _2137;
    float _2177 = _2175;
    if (_2089)
    {
        float _2179 = _2109 * _2161;
        _1883 = _2179;
    }
    float _2181 = _1883;
    if (!_2089)
    {
        _2163 = _2149;
    }
    float _2183 = _2163;
    float _2185 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2167);
    float _2187 = _2183;
    if (_2089)
    {
        float _2189 = _2175 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2111 = _2189;
    }
    float _2191 = _2111;
    if (_2089)
    {
        float _2193 = _2077 * _2181;
        _2101 = _2193;
    }
    float _2195 = _2101;
    if (!_2089)
    {
        _2177 = _2079;
    }
    float _2197 = _2177;
    float _2199 = _2197;
    if (_2089)
    {
        float _2201 = _2079 * _2181;
        _2199 = _2201;
    }
    float _2203 = _2199;
    if (_2089)
    {
        float _2205 = fma(_2149, _2143, _2191);
        _2187 = _2205;
    }
    float _2207 = _2187;
    if (_2089)
    {
        float _2209 = _2195 * _2195;
        _2169 = _2209;
    }
    float _2211 = _2169;
    if (!_2089)
    {
        _2171 = _2083;
    }
    float _2213 = _2171;
    float _2215 = _2213;
    if (_2089)
    {
        float _2217 = _2203 * _2203;
        _2215 = _2217;
    }
    float _2219 = _2215;
    float _2221 = fma(_2207, _2207, _2211);
    float _2223 = _1925 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2225 = _2221 + _2219;
    float _2227 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2223);
    float _2229 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2231 = fma(_2073, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2229);
    float _2233 = precise::clamp(_2231, 0.0, 1.0);
    float _2235 = _1925 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2237 = rsqrt(_2225);
    float _2239 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2227);
    float _2241 = -_2233;
    float _2243 = _2241 + 1.0;
    float _2245 = _1925 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2247 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2235);
    float _2249 = _2239 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2251 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2245);
    float _2253 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2247);
    float _2255 = abs(_2243);
    float _2257 = log2(_2255);
    float _2259 = _2249 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2261 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2251);
    float _2263 = _2253 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2265 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2185);
    float _2267 = -_2259;
    float _2269 = fma(_2267, _2121, 1.0);
    float _2271 = _2261 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2273 = _2263 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2275 = _2237 * _2207;
    float _2277 = _2237 * _2195;
    float _2279 = _2237 * _2203;
    float _2281 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2273);
    float _2283 = _2265 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2285 = _2277 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2287 = log2(_2269);
    float _2289 = fma(_2249, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2281);
    float _2291 = _2257 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2293 = -_2285;
    float _2295 = fma(_2275, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2293);
    float _2297 = _2263 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2299 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2289);
    float _2301 = -_2279;
    float _2303 = fma(_2301, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2295);
    float _2305 = exp2(_2291);
    float _2307 = _2263 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2309 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2297);
    float _2311 = fma(_2303, -0.5, 0.5);
    float _2313 = fma(_2303, 0.5, 0.5);
    float _2315 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2307);
    float _2317 = _2275 + 1.0;
    float _2319 = fma(_2249, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2309);
    float _2321 = 1.0 / _2299;
    float _2323 = fma(_2249, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2315);
    float _2325 = fma(_2313, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2327 = fma(_2313, _2325, -0.212114393711090087890625);
    float _2329 = sqrt(_2311);
    float _2331 = -_2275;
    float _2333 = fma(_2305, _2317, _2331);
    float _2335 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2323);
    float _2337 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2319);
    float _2339 = _2287 * 0.693147182464599609375;
    float _2341 = fma(_2313, _2327, 1.570728778839111328125);
    float _2343 = fma(_2333, 0.5, 0.5);
    float _2345 = _2335 * _2321;
    float _2347 = _2337 * _2321;
    float _2349 = _2339 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2351 = fma(_2345, 0.5, 0.5);
    float _2353 = fma(_2347, -0.5, 0.5);
    float _2355 = _2329 * 0.636619746685028076171875;
    float3 _6381 = float3(_2351, _2353, _2349);
    float _2357 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6381, float3(0.0), isnan(_6381)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6381, float3(0.0), isnan(_6381)), level(0.0)).x;
    float _2359 = -_2341;
    float _2361 = fma(_2355, _2359, 1.0);
    float3 _6397 = float3(_2351, _2353, _2349);
    float4 _2364 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6397, float3(0.0), isnan(_6397)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6397, float3(0.0), isnan(_6397)), level(0.0)).xyzw;
    float _2366 = _2364.x;
    float _2368 = _2364.y;
    float _2370 = _2364.z;
    float _2372 = _2364.w;
    float2 _6414 = float2(_2361, _2343);
    float3 _2376 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6414, float2(0.0), isnan(_6414)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6414, float2(0.0), isnan(_6414)), level(0.0)).xyz;
    float _2378 = _2376.x;
    float _2380 = _2376.y;
    float _2382 = _2376.z;
    float _2384 = _2257 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2386 = _2263 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2388 = _2073 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2390 = isnan(_2073);
    bool _2392 = _2388 || _2390;
    bool _2394 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2396 = _2392 || _2394;
    float _2398 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2386);
    float _2400 = exp2(_2384);
    float _2402 = _2299 * 0.5;
    float _2404 = fma(_2249, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2398);
    float _2406 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2404);
    float _2408 = fma(_2337, -0.5, _2402);
    float _2410 = _2335 + _2299;
    float _2412 = _2406 + _2299;
    float _2414 = _2410 * 0.5;
    out.gl_Position.x = _2335;
    out.gl_Position.y = _2337;
    out.gl_Position.z = _2406;
    out.gl_Position.w = _2299;
    float _2416 = _2412 * 0.5;
    float _2418 = -_2400;
    float _2420 = _2418 + 1.0;
    float _2422 = _2420 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_74.x = _2414;
    out.m_74.y = _2408;
    out.m_74.z = _2416;
    out.m_74.w = _2299;
    float _2424 = _2337;
    float _2426 = _2335;
    if (!_2396)
    {
        _2424 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2428 = _2424;
    float _2430 = _2428;
    float _2432 = _2428;
    if (!_2396)
    {
        _2426 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2434 = _2426;
    float _2436 = _2422 * _2357;
    float _2438 = -_2422;
    float _2440 = _2438 + 1.0;
    float _2442 = _2372 * _2436;
    float _2444 = _2372 * _2440;
    float _2446 = _2382 * _2436;
    float _2448 = fma(_2378, _2442, _2366);
    float _2450 = fma(_2380, _2442, _2368);
    float _2452 = fma(_2372, _2446, _2370);
    float _2454 = _1993 * _2051;
    out.m_76.x = _2448;
    out.m_76.y = _2450;
    out.m_76.z = _2452;
    out.m_76.w = _2444;
    float _2456 = _2454 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2458 = _2454;
    float _2460 = _2434;
    float _2462 = _2434;
    if (!_2396)
    {
        _2458 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2464 = _2458;
    bool _2466 = !_2396;
    float _2468 = _2464;
    float _2470 = _2464;
    if (!_2466)
    {
        bool _2472 = _2073 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2474 = isnan(_2073);
        bool _2476 = _2472 || _2474;
        bool _2478 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2480 = _2476 || _2478;
        if (!_2480)
        {
            float _2482 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2484 = _2073 + _2482;
            float _2486 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2488 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2486;
            float _2490 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2492 = _2490 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2494 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2496 = _2494 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2498 = 1.0 / _2488;
            float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2502 = _2500 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2504 = _2484 * _2498;
            float _2506 = precise::clamp(_2504, 0.0, 1.0);
            float _2508 = fma(_2506, _2492, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2510 = fma(_2506, _2496, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2512 = fma(_2506, _2502, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2462 = _2510;
            _2432 = _2508;
            _2470 = _2512;
            _2514 = true;
        }
        else
        {
            bool _2516 = _2073 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2518 = isnan(_2073);
            bool _2520 = _2516 || _2518;
            bool _2522 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2524 = _2520 || _2522;
            if (!_2524)
            {
                _2430 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2526 = _2430;
            _2432 = _2526;
            if (!_2524)
            {
                _2460 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2528 = _2460;
            _2462 = _2528;
            if (!_2524)
            {
                _2468 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2530 = _2468;
            bool _2532 = !_2524;
            _2470 = _2530;
            if (!_2532)
            {
                bool _2534 = _2073 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2536 = isnan(_2073);
                bool _2538 = _2534 || _2536;
                bool _2540 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2542 = _2538 || _2540;
                if (!_2542)
                {
                    float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2546 = _2073 + _2544;
                    float _2548 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2550 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2548;
                    float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2554 = _2552 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2560 = 1.0 / _2550;
                    float _2562 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2564 = _2562 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2566 = _2546 * _2560;
                    float _2568 = precise::clamp(_2566, 0.0, 1.0);
                    float _2570 = fma(_2568, _2554, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2572 = fma(_2568, _2558, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2574 = fma(_2568, _2564, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2462 = _2572;
                    _2432 = _2570;
                    _2470 = _2574;
                    _2514 = true;
                }
                else
                {
                    _2462 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2432 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2470 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2514 = false;
    float _2576 = _2462;
    float _2578 = _2432;
    float _2580 = _2470;
    float _2582 = _2456 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_78.x = 0.0;
    float _2584 = _2576 * 0.586610972881317138671875;
    bool _2586 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_49.x = _2582;
    float _2588 = fma(_2578, 0.298911988735198974609375, _2584);
    bool _2590 = _1993 > 0.0;
    bool _2592 = isnan(_1993);
    bool _2594 = _2590 || _2592;
    bool _2596 = isnan(0.0);
    bool _2598 = _2594 || _2596;
    float _2600 = fma(_2580, 0.114477999508380889892578125, _2588);
    bool _2602 = _2051 <= 0.0;
    bool _2604 = !_2598;
    bool _2606 = _2602 || _2604;
    float _2608 = -_2600;
    float _2610 = _2608 + _2578;
    float _2612 = -_2600;
    float _2614 = _2612 + _2576;
    float _2616 = -_2600;
    float _2618 = _2616 + _2580;
    float _2620 = fma(_2610, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2600);
    float _2622 = fma(_2614, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2600);
    float _2624 = fma(_2618, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2600);
    bool _2626 = !_2586;
    if (!_2626)
    {
        float _2628 = -_1925;
        float _2630 = _2628 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2632 = -_1927;
        float _2634 = _2632 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2636 = -_1929;
        float _2638 = _2636 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2640 = _2630 * _2630;
        float _2642 = fma(_2634, _2634, _2640);
        float _2644 = fma(_2638, _2638, _2642);
        float _2646 = sqrt(_2644);
        float _2648 = rsqrt(_2644);
        float _2650 = -_2646;
        float _2652 = _2650 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2654 = _2652 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2656 = precise::clamp(_2654, 0.0, 1.0);
        float _2658 = _2634 * _2648;
        float _2660 = _2630 * _2648;
        float _2662 = abs(_2656);
        float _2664 = log2(_2662);
        float _2666 = _2638 * _2648;
        float _2668 = _2658 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2670 = _1603 * _2660;
        float _2672 = -_2660;
        float _2674 = -_2668;
        float _2676 = fma(_2672, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2674);
        float _2678 = fma(_1601, _2658, _2670);
        float _2680 = -_2666;
        float _2682 = fma(_2680, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2676);
        float _2684 = fma(_1605, _2666, _2678);
        float _2686 = precise::clamp(_2684, 0.0, 1.0);
        float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2690 = _2682 + _2688;
        float _2692 = _2664 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2694 = _2690 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2696 = precise::clamp(_2694, 0.0, 1.0);
        float _2698 = exp2(_2692);
        float _2700 = _2698 * _2696;
        float _2702 = _2686 * _2700;
        float _2704 = _2702 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2706 = _2702 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2708 = _2702 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_78.x = _2704;
        out.m_78.y = _2706;
        out.m_78.z = _2708;
    }
    out.m_80.x = _2620;
    out.m_80.y = _2622;
    out.m_80.z = _2624;
    if (!_2606)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2710 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2710;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2514 = false;
    bool _1655 = false;
    bool _331 = false;
    bool _221 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _94 = in.m_46.w;
    float _96 = trunc(_94);
    int _99 = int(_96);
    bool _103 = _99 >= 1;
    float _105 = 0.0;
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _105;
    float _109 = _107;
    if (!_103)
    {
        out.m_49.x = 0.0;
    }
    int _111 = 0;
    if (!_103)
    {
        float _113 = _107 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    int _117 = _115;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2767 = as_type<float>(_115);
        out.gl_Position.z = _2767;
    }
    if (!_103)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _119 = in.m_51.w;
    bool _121 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = isnan(_119);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _129 = _125 || _127;
    float _131 = -_119;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _135 = 0.0;
    float _137 = _133;
    if (_129)
    {
        float _139 = float(_99);
        _135 = _139;
    }
    float _141 = _135;
    bool _143 = _133 >= _141;
    bool _145 = !_129;
    bool _147 = _143 || _145;
    if (_147)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _109;
    if (_147)
    {
        out.m_49.x = 0.0;
    }
    if (_147)
    {
        float _151 = _149 * 5.0;
        _117 = as_type<int>(_151);
    }
    int _153 = _117;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2836 = as_type<float>(_153);
        out.gl_Position.z = _2836;
    }
    if (_147)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = in.m_56.x;
    float _159 = in.m_56.y;
    float _161 = in.m_56.z;
    int _163 = as_type<int>(_155) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_155) & 2;
    bool _169 = _167 != 0;
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _173 = _159 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _175 = _159 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _177 = _159 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _179 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[6].x, _173);
    float _181 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[4].x, _175);
    float _183 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[5].x, _177);
    float _185 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].z, _179);
    float _187 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].z, _181);
    float _189 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].z, _183);
    bool _191 = !_165;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_169;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_171;
    float _201 = _189;
    float _219;
    if (!_199)
    {
        float _203 = in.m_58.x;
        float _205 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _207 = _203 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _209 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _211 = _209 * _205;
        float _213 = floor(_211);
        float _215 = -_213;
        float _217 = _211 + _215;
        _219 = _217;
        _221 = true;
    }
    else
    {
        float _223 = float(_99);
        float _225 = 1.0 / _223;
        float _227 = _133 * _225;
        _219 = _227;
    }
    _221 = false;
    float _229 = _219;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = _229 + _231;
    bool _235 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _237 = isnan(_229);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _243 = _239 || _241;
    float _245 = float(_243);
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _247;
    float _251 = -_245;
    float _253 = _251 + 1.0;
    bool _255 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _257 = isnan(_229);
    bool _259 = _255 || _257;
    bool _261 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _263 = _259 || _261;
    float _265 = float(_263);
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _267;
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _273 = 1.0 / _249;
    float _275 = _265 * _253;
    float _277 = -_265;
    float _279 = _277 + 1.0;
    float _281 = _233 * _273;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _283;
    float _287 = fma(_269, _281, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _289 = fma(_285, _281, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _291 = _287 * _275;
    float _293 = _289 * _275;
    float _295 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].x, _291);
    float _297 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].y, _293);
    float _299 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[144].x, _295);
    float _301 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[144].y, _297);
    bool _303 = !_271;
    float _327;
    float _329;
    if (!_303)
    {
        float _305 = in.m_58.x;
        float _307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _309 = float(_99);
        float _311 = 1.0 / _309;
        float _313 = _305 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _315 = _133 * _311;
        float _317 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _319 = _317 * _307;
        float _321 = floor(_319);
        float _323 = -_321;
        float _325 = _319 + _323;
        _327 = _315;
        _329 = _325;
        _331 = true;
    }
    else
    {
        float _333 = float(_99);
        float _335 = 1.0 / _333;
        float _337 = _133 * _335;
        _327 = _337;
        _329 = _337;
    }
    _331 = false;
    float _339 = _327;
    float _341 = _329;
    float _343 = in.m_58.x;
    float _345 = in.m_58.y;
    float _347 = in.m_58.z;
    float _349 = in.m_58.w;
    float _351 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _353 = log2(_351);
    float _355 = in.m_46.x;
    float _357 = in.m_46.y;
    float _359 = in.m_46.z;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _363 = _361 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _373 = 1.0 / _363;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _383 = _353 * _133;
    float _385 = 1.0 / _367;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _391 = _349 > 0.5;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _397 = 1.0 / _371;
    bool _399 = _343 > 0.5;
    float _401 = _357 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _405 = _403 != 0;
    float _407 = _357 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _411 = _409 != 0;
    float _413 = _357 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _417 = _415 != 0;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _425 = _423 != 0;
    float _427 = 1.0 / _377;
    float _429 = -_197;
    int _431 = _391 ? as_type<int>(_429) : as_type<int>(_197);
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _435 = -_193;
    int _437 = _399 ? as_type<int>(_435) : as_type<int>(_193);
    float _439 = _387 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _443 = _441 != 0;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _447 = _445 != 0;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _451 = _449 != 0;
    float _453 = _389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _455 = _421 * _373;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _463 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[4].x, _401);
    float _465 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[5].x, _407);
    float _467 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[6].x, _413);
    float _469 = _461 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _471 = 1.0 / _381;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    out.m_60.x = _469;
    out.m_60.y = _439;
    out.m_60.z = _453;
    out.m_60.w = _433;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _485 = _475 * _385;
    float _487 = _345 * 2.0;
    float _489 = 1.0 / _395;
    bool _491 = !_405;
    float _493 = _491 ? _193 : as_type<float>(_437);
    float _495 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].z, _463);
    bool _497 = _345 > 0.5;
    float _499 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].z, _465);
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _503 = _339 + _501;
    float _505 = 1.0 / _459;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _507;
    float _511 = -_197;
    int _513 = _497 ? as_type<int>(_511) : as_type<int>(_197);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _517 = 1.0 + _515;
    bool _519 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _521 = isnan(1.0);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _527 = _523 || _525;
    float _529 = _509 * _397;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _535;
    float _539 = 1.0 / _483;
    float _541 = _533 * _427;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _547 = _537 * _471;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _549;
    float _553 = _343 * 2.0;
    float _555 = _545 * _489;
    float _557 = exp2(_383);
    float _559 = _345 + _347;
    float _561 = _551 * _505;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _563;
    float _567 = _559 + (-1.0);
    bool _569 = !_411;
    float _571 = _569 ? _197 : as_type<float>(_513);
    float _573 = floor(_553);
    float _575 = _565 * _539;
    float _577 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _579 = !_425;
    float _581 = _579 ? _197 : as_type<float>(_431);
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    bool _587 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _589 = isnan(0.0);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _595 = _591 || _593;
    float _597 = fma(_575, _503, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _599 = _347 > 0.5;
    float _601 = 1.0 / _517;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _607 = -_557;
    float _609 = _607 + 1.0;
    float _611 = -_193;
    int _613 = _599 ? as_type<int>(_611) : as_type<int>(_193);
    float _615 = _493 + 0.5;
    bool _617 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _619 = isnan(_341);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = -_571;
    float _631 = _629 + 0.5;
    float _633 = _595 ? _609 : 0.0;
    float _635 = 1.0 / _479;
    float _637 = _615 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _639 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _641 = isnan(_339);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = _499 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _653 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _655 = isnan(_339);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    bool _665 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _667 = isnan(_339);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = 1.0 / _605;
    float _679 = _347 * 2.0;
    if (_527)
    {
        float _681 = _633 * _601;
        _137 = _681;
    }
    float _683 = _137;
    bool _685 = !_417;
    float _687 = _685 ? _193 : as_type<float>(_613);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _689;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _695 = _341 + _693;
    bool _697 = _573 >= 0.0;
    bool _699 = isnan(_573);
    bool _701 = _697 || _699;
    bool _703 = isnan(0.0);
    bool _705 = _701 || _703;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _709 = _341 + _707;
    float _711 = floor(_679);
    bool _713 = _573 > 0.0;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _717 = _341 + _715;
    int _719 = _705 ? 0 : 1;
    float _721 = _585 * _635;
    float _723 = fma(_485, _709, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _727 = _339 + _725;
    float _729 = floor(_487);
    float _731 = _691 * _677;
    float _733 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].z, _467);
    float _735 = fma(_455, _695, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _739 = _339 + _737;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _743 = _339 + _741;
    float _745 = _345 + _343;
    float _747 = fma(_529, _717, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _749 = _711 >= 0.0;
    bool _751 = isnan(_711);
    bool _753 = _749 || _751;
    bool _755 = isnan(0.0);
    bool _757 = _753 || _755;
    float _759 = fma(_541, _739, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _761 = _711 > 0.0;
    float _763 = fma(_547, _743, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    int _765 = _757 ? 0 : 1;
    float _767 = _745 + (-1.0);
    bool _769 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _771 = isnan(_341);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _783 = _339 + _781;
    bool _785 = _729 > 0.0;
    float _787 = fma(_555, _727, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _789 = _729 >= 0.0;
    bool _791 = isnan(_729);
    bool _793 = _789 || _791;
    bool _795 = isnan(0.0);
    bool _797 = _793 || _795;
    float _799 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _801 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _803 = isnan(_341);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = fma(_561, _783, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    bool _815 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _817 = isnan(_341);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    float _827 = -_779;
    float _829 = _827 + 1.0;
    bool _831 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _833 = isnan(_339);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = -_649;
    float _845 = _843 + 1.0;
    bool _847 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _849 = isnan(_339);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = -_825;
    float _861 = _859 + 1.0;
    bool _863 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _865 = isnan(_339);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _871 = _867 || _869;
    float _873 = float(_871);
    float _875 = -_841;
    float _877 = _875 + 1.0;
    float _879 = _811 * _829;
    float _881 = -_857;
    float _883 = _881 + 1.0;
    float _885 = _779 * _861;
    float _887 = _649 * _877;
    float _889 = -_811;
    float _891 = _889 + 1.0;
    float _893 = _873 * _883;
    bool _895 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _897 = isnan(_339);
    bool _899 = _895 || _897;
    bool _901 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    float _907 = -_873;
    float _909 = _907 + 1.0;
    float _911 = _663 * _845;
    float _913 = -_663;
    float _915 = _913 + 1.0;
    float _917 = _627 * _891;
    float _919 = _841 * _909;
    float _921 = -_905;
    float _923 = _921 + 1.0;
    float _925 = _905 * _915;
    float _927 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _929 = _723 * _917;
    bool _931 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _933 = isnan(_339);
    bool _935 = _931 || _933;
    bool _937 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _939 = _935 || _937;
    float _941 = float(_939);
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _945 = _339 + _943;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _949 = _339 + _947;
    float _951 = -_675;
    float _953 = _951 + 1.0;
    float _955 = _675 * _923;
    float _957 = fma(_721, _945, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _959 = fma(_731, _949, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _961 = _941 * _953;
    float _963 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _965 = -_941;
    float _967 = _965 + 1.0;
    float _969 = _631 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _971 = _763 * _961;
    float _973 = -_581;
    float _975 = _973 + 0.5;
    float _977 = -_627;
    float _979 = _977 + 1.0;
    float _981 = _637 * _927;
    float _983 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[151].x, _971);
    float _985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _987 = _975 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _989 = _797 ? 0 : 1;
    float _991 = fma(_759, _955, _983);
    float _993 = _687 + 0.5;
    float _995 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[115].x, _929);
    int _997 = ~_989;
    int _999 = _997 + 1;
    int _1001 = _999 + 1;
    float _1003 = fma(_813, _925, _991);
    float _1005 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1007 = _987 * _963;
    int _1009 = _1001;
    if (!_785)
    {
        int _1011 = ~_989;
        int _1013 = _1011 + 1;
        _1009 = _1013;
    }
    int _1015 = _1009;
    float _1017 = _993 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1019 = !_443;
    int _1021 = _1019 ? 0 : 1;
    float _1023 = fma(_787, _911, _1003);
    bool _1025 = !_447;
    int _1027 = _1025 ? 0 : 1;
    float _1029 = fma(_735, _879, _995);
    float _1031 = _969 * _985;
    int _1033 = abs(_1021);
    float _1035 = _733 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1037 = abs(_1027);
    float _1039 = fma(_597, _887, _1023);
    float _1041 = in.m_62.x;
    float _1043 = in.m_62.y;
    float _1045 = in.m_62.z;
    int _1047 = ~_765;
    int _1049 = _1047 + 1;
    int _1051 = _1049 + 1;
    float _1053 = _345 + (-0.5);
    float _1055 = _1017 * _1005;
    float _1057 = _495 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1059 = _1051;
    if (!_761)
    {
        int _1061 = ~_765;
        int _1063 = _1061 + 1;
        _1059 = _1063;
    }
    int _1065 = _1059;
    float _1067 = fma(_957, _919, _1039);
    out.m_64.x = _981;
    out.m_64.y = _1031;
    out.m_64.z = _1055;
    out.m_64.w = _1007;
    float _1069 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1071 = _1057 + _1069;
    float _1073 = float(_1065);
    int _1075 = ~_719;
    int _1077 = _1075 + 1;
    int _1079 = _1077 + 1;
    int _1081 = _1079;
    if (!_713)
    {
        int _1083 = ~_719;
        int _1085 = _1083 + 1;
        _1081 = _1085;
    }
    int _1087 = _1081;
    float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1091 = _651 + _1089;
    float _1093 = float(_1033);
    float _1095 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1097 = _1035 + _1095;
    float _1099 = float(_1037);
    float _1101 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1103 = float(_1087);
    float _1105 = _1093 * _1073;
    float _1107 = fma(_747, _885, _1029);
    float _1109 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1101);
    float _1111 = _1099 * _1103;
    float _1113 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1107);
    float _1115 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1109);
    float _1117 = _1105 * (-2.0);
    float _1119 = _1091 * _1091;
    float _1121 = _343 + (-0.5);
    bool _1123 = _1115 >= 0.0;
    float _1125 = fma(_1117, _1041, _1041);
    float _1127 = fma(_959, _893, _1067);
    float _1129 = fma(_1071, _1071, _1119);
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1133 = fma(_1097, _1097, _1129);
    float _1135 = fma(_799, _1117, _799);
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1139 = rsqrt(_1133);
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1143 = (*spvDescriptorSet0.vp_c9)._m0[107].z;
    if (_1123)
    {
        _1143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1145 = _1143;
    float _1147 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1149 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1151 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1153 = _1113 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1155 = as_type<int>(_1145);
    if (_1123)
    {
        float _1157 = _1145 * 5.0;
        _1155 = as_type<int>(_1157);
    }
    int _1159 = _1155;
    float _1161 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1127);
    float _1163 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1125);
    bool _1165 = !_451;
    int _1167 = _1165 ? 0 : 1;
    out.m_66.x = _1147;
    out.m_66.y = _1149;
    out.m_66.z = _1151;
    out.m_66.w = _1153;
    float _1169 = fma(_1135, _683, _1163);
    int _1171 = abs(_1167);
    if (_1123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4440 = as_type<float>(_1159);
        out.gl_Position.z = _4440;
    }
    float _1173 = _1091 * _1139;
    float _1175 = _1071 * _1139;
    out.m_68.x = _1161;
    if (_1123)
    {
        out.m_49.x = 0.0;
    }
    if (_1123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1177 = -_1173;
    float _1179 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[18].w, _651);
    float _1181 = _1097 * _1139;
    float _1183 = -_1175;
    float _1185 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1057);
    float _1187 = float(_1171);
    float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1191 = _1179 + _1189;
    float _1193 = -_1181;
    float _1195 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1035);
    float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1199 = _1185 + _1197;
    float _1201 = _1111 * (-2.0);
    float _1203 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1205 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1207 = _1195 + _1205;
    float _1209 = float(_1015);
    float _1211 = fma(_1201, _1043, _1043);
    float _1213 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1203);
    float _1215 = -_1173;
    float _1217 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1091);
    float _1219 = fma(_577, _1201, _577);
    float _1221 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1211);
    float _1223 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1213);
    float _1225 = -_1175;
    float _1227 = fma(_1225, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1071);
    float _1229 = _1217 * _1217;
    float _1231 = _1187 * _1209;
    float _1233 = _347 + _343;
    bool _1235 = _1223 >= 0.0;
    float _1237 = fma(_1227, _1227, _1229);
    float _1239 = in.m_70.x;
    float _1241 = in.m_70.y;
    float _1243 = -_1181;
    float _1245 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1097);
    float _1247 = fma(_1219, _683, _1221);
    float _1249 = _1169 * 0.15915493667125701904296875;
    float _1251 = _1233 + (-1.0);
    float _1253 = fma(_1245, _1245, _1237);
    float _1255 = _1231 * (-2.0);
    float _1257 = _1247 * 0.15915493667125701904296875;
    float _1259 = _1249 * 6.283185482025146484375;
    float _1261 = sin(_1259);
    float _1263 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1265 = _347 + (-0.5);
    float _1267 = fma(_1255, _1045, _1045);
    float _1269 = _1249;
    int _1271 = as_type<int>(_1265);
    float _1273 = _1195;
    float _1275 = _1207;
    if (_1235)
    {
        out.m_49.x = 0.0;
    }
    float _1277 = fma(_1263, _1255, _1263);
    float _1279 = fma(_1265, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1267);
    float _1281 = _1249 * 6.283185482025146484375;
    float _1283 = cos(_1281);
    float _1285 = fma(_1277, _683, _1279);
    float _1287 = _301 * _1241;
    float _1289 = _1257 * 6.283185482025146484375;
    float _1291 = sin(_1289);
    if (_1235)
    {
        _1269 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1293 = _1269;
    float _1295 = _1285 * 0.15915493667125701904296875;
    if (_1235)
    {
        float _1297 = _1293 * 5.0;
        _1271 = as_type<int>(_1297);
    }
    int _1299 = _1271;
    float _1301 = sqrt(_1253);
    if (_1235)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4664 = as_type<float>(_1299);
        out.gl_Position.z = _4664;
    }
    float _1303 = _1257 * 6.283185482025146484375;
    float _1305 = cos(_1303);
    if (_1235)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1307 = _1295 * 6.283185482025146484375;
    float _1309 = cos(_1307);
    float _1311 = _1139 * _1301;
    float _1313 = _1287 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1315 = _299 * _1239;
    float _1317 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _1319 = _1283 * _1305;
    float _1321 = _1313 * _1311;
    float _1323 = _1315 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1325 = _1295 * 6.283185482025146484375;
    float _1327 = sin(_1325);
    float _1329 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _1331 = _1317 * _1321;
    float _1333 = _1323 * _1311;
    float _1335 = _1261 * _1291;
    float _1337 = _1283 * _1291;
    float _1339 = _1261 * _1305;
    float _1341 = _1329 * _1333;
    float _1343 = _1283 * _1309;
    float _1345 = _1305 * _1309;
    float _1347 = _1261 * _1309;
    float _1349 = _1291 * _1309;
    float _1351 = _1343 * _1331;
    float _1353 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1355 = _1353 * 0.5;
    float _1357 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1359 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1361 = fma(_1327, _1319, _1335);
    float _1363 = -_1331;
    float _1365 = _1327 * _1363;
    float _1367 = -_1339;
    float _1369 = fma(_1327, _1337, _1367);
    float _1371 = -_1337;
    float _1373 = fma(_1327, _1339, _1371);
    float _1375 = fma(_1361, _1341, _1351);
    float _1377 = fma(_1345, _1341, _1365);
    float _1379 = _1347 * _1331;
    float _1381 = fma(_1327, _1335, _1319);
    float _1383 = fma(_1369, _1355, _1375);
    float _1385 = fma(_1349, _1355, _1377);
    float _1387 = fma(_1373, _1341, _1379);
    float _1389 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1391 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1393 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1395 = fma(_1381, _1355, _1387);
    float _1397 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1399 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1391);
    float _1401 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1393);
    float _1403 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1405 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1397);
    float _1407 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1399);
    float _1409 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1401);
    float _1411 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1413 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1415 = _1407 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1417 = _1409 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1419 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1405);
    float _1421 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1389);
    float _1423 = _1057 + _1415;
    float _1425 = _1035 + _1417;
    float _1427 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1403);
    float _1429 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1411);
    float _1431 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1433 = _1423 + _1431;
    float _1435 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1437 = _1425 + _1435;
    float _1439 = -_1327;
    float _1441 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1357);
    float _1443 = -_1327;
    float _1445 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1359);
    float _1447 = _1433 * _1433;
    float _1449 = _1437 * _1437;
    float _1451 = -_1327;
    float _1453 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1413);
    float _1455 = _1419 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1457 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1421);
    float _1459 = _1447 + _1449;
    float _1461 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1427);
    float _1463 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1429);
    float _1465 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1467 = sqrt(_1459);
    float _1469 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1471 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1473 = _651 + _1455;
    float _1475 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1465);
    float _1477 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1469);
    float _1479 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1471);
    bool _1481 = _1467 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1483 = _1471;
    float _1485 = _1447;
    float _1487 = _1449;
    float _1489 = _1423;
    float _1491 = _1425;
    float _1493 = _1459;
    float _1495 = _1311;
    if (!_1481)
    {
        _1483 = _1473;
    }
    float _1497 = _1483;
    bool _1499 = !_1481;
    float _1501 = _1497;
    if (!_1499)
    {
        float _1503 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1507 = _1467 + _1505;
        float _1509 = _1473 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1511 = rsqrt(_1459);
        float _1513 = _1507 * _1503;
        float _1515 = _1513 * 0.15915493667125701904296875;
        float _1517 = _1515 * 6.283185482025146484375;
        float _1519 = sin(_1517);
        float _1521 = _1515 * 6.283185482025146484375;
        float _1523 = cos(_1521);
        float _1525 = fma(_1519, _1509, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1527 = _1511 * _1525;
        float _1529 = _1523 + (-1.0);
        float _1531 = fma(_1433, _1527, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1533 = fma(_1437, _1527, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1535 = _1529 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1537 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1539 = _1531 + _1537;
        float _1541 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1543 = _1533 + _1541;
        float _1545 = fma(_1473, _1523, _1535);
        float _1547 = _1539 * _1539;
        float _1549 = _1543 * _1543;
        _1501 = _1545;
        _1485 = _1547;
        _1487 = _1549;
        _1489 = _1531;
        _1491 = _1533;
        _1493 = _1511;
    }
    float _1551 = _1501;
    float _1553 = _1485;
    float _1555 = _1487;
    float _1557 = _1489;
    float _1559 = _1491;
    float _1561 = _1493;
    float _1563 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1565 = _1551 + _1563;
    float _1567 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1441);
    float _1569 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1445);
    float _1571 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1453);
    float _1573 = fma(_1565, _1565, _1553);
    float _1575 = _197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1577 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1475);
    float _1579 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1477);
    float _1581 = _1573 + _1555;
    float _1583 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1479);
    float _1585 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1587 = _1575 * _1567;
    float _1589 = _1575 * _1569;
    float _1591 = _1575 * _1571;
    float _1593 = sqrt(_1581);
    float _1595 = fma(_1585, _1457, _1587);
    float _1597 = fma(_1585, _1461, _1589);
    float _1599 = fma(_1585, _1463, _1591);
    float _1601 = _1577 + _1595;
    float _1603 = _1579 + _1597;
    float _1605 = _1583 + _1599;
    out.m_72.x = _1601;
    out.m_72.y = _1603;
    out.m_72.z = _1605;
    bool _1607 = _1593 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1609 = isnan(_1593);
    bool _1611 = _1607 || _1609;
    bool _1613 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1615 = _1611 || _1613;
    float _1617 = _1561;
    float _1619 = _1575;
    if (!_1615)
    {
        _1617 = 1.0;
    }
    float _1621 = _1617;
    bool _1623 = !_1615;
    float _1625 = _1621;
    if (!_1623)
    {
        bool _1627 = _1593 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1629 = isnan(_1593);
        bool _1631 = _1627 || _1629;
        bool _1633 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1635 = _1631 || _1633;
        if (!_1635)
        {
            float _1637 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1639 = _1593 + _1637;
            float _1641 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1643 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1641;
            float _1645 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1647 = _1645 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1649 = 1.0 / _1643;
            float _1651 = _1639 * _1649;
            float _1653 = fma(_1651, _1647, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1625 = _1653;
            _1655 = true;
        }
        else
        {
            bool _1657 = _1593 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1659 = isnan(_1593);
            bool _1661 = _1657 || _1659;
            bool _1663 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1665 = _1661 || _1663;
            if (!_1665)
            {
                float _1667 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1669 = _1593 + _1667;
                float _1671 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1673 = _1671 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1675 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1677 = _1675 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1679 = 1.0 / _1673;
                float _1681 = _1669 * _1679;
                float _1683 = fma(_1681, _1677, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1625 = _1683;
                _1655 = true;
            }
            else
            {
                _1625 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1655 = false;
    float _1685 = _1625;
    float _1687 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1689 = _1551 + _1687;
    float _1691 = _1179 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1693 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1695 = _1557 + _1693;
    float _1697 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1699 = _1559 + _1697;
    float _1701 = fma(_1689, _1685, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1703 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1691);
    float _1705 = fma(_1695, _1685, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1707 = fma(_1699, _1685, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1709 = -_651;
    float _1711 = _1709 + _1701;
    float _1713 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1703);
    float _1715 = -_1057;
    float _1717 = _1715 + _1705;
    float _1719 = -_1035;
    float _1721 = _1719 + _1707;
    float _1723 = _1711 * _1711;
    float _1725 = _1713 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1727 = _1179 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1729 = fma(_1717, _1717, _1723);
    float _1731 = 1.0 / _1725;
    float _1733 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1727);
    float _1735 = fma(_1721, _1721, _1729);
    float _1737 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1733);
    float _1739 = sqrt(_1735);
    float _1741 = _1737 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1743 = _1741 + _1725;
    float _1745 = _1743 * _1731;
    float _1747 = _1745 * 0.5;
    bool _1749 = _1739 > 0.0;
    float _1751 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1753 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1751);
    bool _1755 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1757 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1759 = _1755 || _1757;
    bool _1761 = isnan(0.5);
    bool _1763 = _1759 || _1761;
    float _1765 = 1.0 / _1753;
    bool _1767 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1769 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1771 = _1767 || _1769;
    bool _1773 = isnan(0.5);
    bool _1775 = _1771 || _1773;
    float _1777 = _1725;
    float _1779 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1781 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1783 = _1705;
    if (!_1749)
    {
        _1777 = _1705;
    }
    float _1785 = _1777;
    float _1787 = _1785;
    float _1789 = _1785;
    if (!_1749)
    {
        _1779 = _1701;
    }
    float _1791 = _1779;
    float _1793 = _1791;
    if (!_1749)
    {
        _1781 = _1707;
    }
    float _1795 = _1781;
    bool _1797 = !_1749;
    float _1799 = _1795;
    if (!_1797)
    {
        float _1801 = _189 * _189;
        float _1803 = rsqrt(_1735);
        float _1805 = fma(_187, _187, _1801);
        float _1807 = fma(_185, _185, _1805);
        float _1809 = sqrt(_1807);
        float _1811 = _1717 * _1803;
        float _1813 = _1711 * _1803;
        float _1815 = _1721 * _1803;
        bool _1817 = _1809 > 0.0;
        float _1819 = _1803;
        float _1821 = _1809;
        _1619 = _1807;
        if (!_1817)
        {
            _1787 = _1705;
        }
        float _1823 = _1787;
        _1789 = _1823;
        if (!_1817)
        {
            _1819 = _1701;
        }
        float _1825 = _1819;
        _1793 = _1825;
        if (!_1817)
        {
            _1821 = _1707;
        }
        float _1827 = _1821;
        bool _1829 = !_1817;
        _1799 = _1827;
        if (!_1829)
        {
            float _1831 = rsqrt(_1807);
            float _1833 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1835 = _189 * _1831;
            float _1837 = _187 * _1831;
            float _1839 = _1813 * _1835;
            float _1841 = _185 * _1831;
            float _1843 = fma(_1811, _1837, _1839);
            float _1845 = _1833 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1847 = fma(_1815, _1841, _1843);
            float _1849 = _1847 * _1845;
            float _1851 = fma(_187, _1849, _1705);
            float _1853 = fma(_189, _1849, _1701);
            float _1855 = fma(_185, _1849, _1707);
            _1789 = _1851;
            _1793 = _1853;
            _1799 = _1855;
            _1619 = _1831;
        }
    }
    float _1857 = _1789;
    float _1859 = _1793;
    float _1861 = _1799;
    float _1863 = _1619;
    float _1865 = -_1175;
    float _1867 = fma(_1865, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1857);
    float _1869 = -_1173;
    float _1871 = fma(_1869, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1859);
    float _1873 = -_1181;
    float _1875 = fma(_1873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1861);
    float _1877 = _1871;
    float _1879 = _1867;
    float _1881 = _1875;
    float _1883 = _1863;
    if (_1775)
    {
        _1783 = 1.0;
    }
    float _1885 = _1783;
    float _1887 = _1885;
    if (!_1763)
    {
        float _1889 = _1191 * _1191;
        float _1891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1893 = -_651;
        float _1895 = _1893 + _1859;
        float _1897 = -_1035;
        float _1899 = _1897 + _1861;
        float _1901 = fma(_1199, _1199, _1889);
        float _1903 = fma(_1207, _1207, _1901);
        float _1905 = 1.0 / _1311;
        float _1907 = sqrt(_1903);
        float _1909 = precise::min(_1907, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1911 = _1909 * _1891;
        float _1913 = -_1057;
        float _1915 = _1913 + _1857;
        float _1917 = _1911 * _1905;
        float _1919 = fma(_1915, _1917, _1185);
        float _1921 = fma(_1895, _1917, _1179);
        float _1923 = fma(_1899, _1917, _1195);
        _1877 = _1921;
        _1879 = _1919;
        _1881 = _1923;
        _1495 = _1905;
    }
    float _1925 = _1877;
    float _1927 = _1879;
    float _1929 = _1881;
    float _1931 = _1495;
    float _1933 = _1931;
    if (_1775)
    {
        _1933 = 1.0;
    }
    float _1935 = _1933;
    float _1937 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1939 = _1765 * _1937;
    float _1941 = _1935;
    if (!_1775)
    {
        float _1943 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1945 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1947 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1945;
        float _1949 = _1943 * 0.15915493667125701904296875;
        float _1951 = _1949 * 6.283185482025146484375;
        float _1953 = cos(_1951);
        float _1955 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1957 = _1955 * 0.15915493667125701904296875;
        float _1959 = _1949 * 6.283185482025146484375;
        float _1961 = sin(_1959);
        float _1963 = 1.0 / _1953;
        float _1965 = _1957 * 6.283185482025146484375;
        float _1967 = cos(_1965);
        float _1969 = _1961 * _1963;
        float _1971 = _1957 * 6.283185482025146484375;
        float _1973 = sin(_1971);
        float _1975 = _1967 * _1969;
        float _1977 = 1.0 / _1947;
        float _1979 = 1.0 / _1975;
        float _1981 = _1973 * _1979;
        float _1983 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1985 = fma(_1939, _1981, _1983);
        float _1987 = _1985 * _1977;
        float _1989 = precise::clamp(_1987, 0.0, 1.0);
        _1273 = _1957;
        _1887 = _1989;
    }
    float _1991 = _1273;
    float _1993 = _1887;
    float _1995 = _1991;
    if (!_1775)
    {
        float _1997 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1999 = _1997 * 0.15915493667125701904296875;
        float _2001 = _1999 * 6.283185482025146484375;
        float _2003 = cos(_2001);
        float _2005 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2007 = _2005 * 0.15915493667125701904296875;
        float _2009 = _1999 * 6.283185482025146484375;
        float _2011 = sin(_2009);
        float _2013 = 1.0 / _2003;
        float _2015 = _2007 * 6.283185482025146484375;
        float _2017 = cos(_2015);
        float _2019 = _2011 * _2013;
        float _2021 = _2007 * 6.283185482025146484375;
        float _2023 = sin(_2021);
        float _2025 = _2017 * _2019;
        float _2027 = 1.0 / _2025;
        float _2029 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2031 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2029;
        float _2033 = 1.0 / _2031;
        float _2035 = _2023 * _2027;
        float _2037 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2039 = fma(_1939, _2035, _2037);
        float _2041 = _2039 * _2033;
        float _2043 = precise::clamp(_2041, 0.0, 1.0);
        float _2045 = -_2043;
        float _2047 = _2045 + 1.0;
        _1995 = _2027;
        _1941 = _2047;
    }
    float _2049 = _1995;
    float _2051 = _1941;
    float _2053 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2055 = _1925 + _2053;
    float _2057 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2059 = _1927 + _2057;
    float _2061 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2063 = _1929 + _2061;
    float _2065 = _2055 * _2055;
    float _2067 = fma(_2059, _2059, _2065);
    float _2069 = fma(_2063, _2063, _2067);
    float _2071 = rsqrt(_2069);
    float _2073 = sqrt(_2069);
    float _2075 = _2071 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2077 = _2059 * _2075;
    float _2079 = _2063 * _2075;
    float _2081 = _2077 * _2077;
    float _2083 = _2079 * _2079;
    float _2085 = _2081 + _2083;
    float _2087 = sqrt(_2085);
    bool _2089 = _2087 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2093 = _2087 + _2091;
    float _2095 = _2049;
    float _2097 = _2093;
    float _2099 = _2055;
    float _2101 = _2077;
    if (_2089)
    {
        float _2103 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2095 = _2103;
    }
    float _2105 = _2095;
    if (_2089)
    {
        float _2107 = rsqrt(_2085);
        _1275 = _2107;
    }
    float _2109 = _1275;
    float _2111 = _2109;
    if (_2089)
    {
        float _2113 = _2093 * _2105;
        _2097 = _2113;
    }
    float _2115 = _2097;
    if (_2089)
    {
        float _2117 = _2115 * 0.15915493667125701904296875;
        _201 = _2117;
    }
    float _2119 = _201;
    float _2121 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2123 = _2063;
    if (_2089)
    {
        float _2125 = _2119 * 6.283185482025146484375;
        float _2127 = sin(_2125);
        _2123 = _2127;
    }
    float _2129 = _2123;
    float _2131 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2133 = precise::max(0.0, _2131);
    float _2135 = _2105;
    float _2137 = _2133;
    if (_2089)
    {
        float _2139 = _2119 * 6.283185482025146484375;
        float _2141 = cos(_2139);
        _2135 = _2141;
    }
    float _2143 = _2135;
    float _2145 = -_2075;
    float _2147 = -_2133;
    float _2149 = fma(_2055, _2145, _2147);
    if (_2089)
    {
        float _2151 = _2149 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2099 = _2151;
    }
    float _2153 = _2099;
    float _2155 = _2153;
    float _2157 = _2129;
    if (_2089)
    {
        float _2159 = fma(_2129, _2153, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2155 = _2159;
    }
    float _2161 = _2155;
    float _2163 = _2161;
    if (!_2089)
    {
        _2157 = _2081;
    }
    float _2165 = _2157;
    float _2167 = _1925 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2169 = _2165;
    float _2171 = _2143;
    if (_2089)
    {
        float _2173 = _2143 + (-1.0);
        _2137 = _2173;
    }
    float _2175 = _2137;
    float _2177 = _2175;
    if (_2089)
    {
        float _2179 = _2109 * _2161;
        _1883 = _2179;
    }
    float _2181 = _1883;
    if (!_2089)
    {
        _2163 = _2149;
    }
    float _2183 = _2163;
    float _2185 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2167);
    float _2187 = _2183;
    if (_2089)
    {
        float _2189 = _2175 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2111 = _2189;
    }
    float _2191 = _2111;
    if (_2089)
    {
        float _2193 = _2077 * _2181;
        _2101 = _2193;
    }
    float _2195 = _2101;
    if (!_2089)
    {
        _2177 = _2079;
    }
    float _2197 = _2177;
    float _2199 = _2197;
    if (_2089)
    {
        float _2201 = _2079 * _2181;
        _2199 = _2201;
    }
    float _2203 = _2199;
    if (_2089)
    {
        float _2205 = fma(_2149, _2143, _2191);
        _2187 = _2205;
    }
    float _2207 = _2187;
    if (_2089)
    {
        float _2209 = _2195 * _2195;
        _2169 = _2209;
    }
    float _2211 = _2169;
    if (!_2089)
    {
        _2171 = _2083;
    }
    float _2213 = _2171;
    float _2215 = _2213;
    if (_2089)
    {
        float _2217 = _2203 * _2203;
        _2215 = _2217;
    }
    float _2219 = _2215;
    float _2221 = fma(_2207, _2207, _2211);
    float _2223 = _1925 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2225 = _2221 + _2219;
    float _2227 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2223);
    float _2229 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2231 = fma(_2073, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2229);
    float _2233 = precise::clamp(_2231, 0.0, 1.0);
    float _2235 = _1925 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2237 = rsqrt(_2225);
    float _2239 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2227);
    float _2241 = -_2233;
    float _2243 = _2241 + 1.0;
    float _2245 = _1925 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2247 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2235);
    float _2249 = _2239 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2251 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2245);
    float _2253 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2247);
    float _2255 = abs(_2243);
    float _2257 = log2(_2255);
    float _2259 = _2249 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2261 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2251);
    float _2263 = _2253 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2265 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2185);
    float _2267 = -_2259;
    float _2269 = fma(_2267, _2121, 1.0);
    float _2271 = _2261 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2273 = _2263 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2275 = _2237 * _2207;
    float _2277 = _2237 * _2195;
    float _2279 = _2237 * _2203;
    float _2281 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2273);
    float _2283 = _2265 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2285 = _2277 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2287 = log2(_2269);
    float _2289 = fma(_2249, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2281);
    float _2291 = _2257 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2293 = -_2285;
    float _2295 = fma(_2275, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2293);
    float _2297 = _2263 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2299 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2289);
    float _2301 = -_2279;
    float _2303 = fma(_2301, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2295);
    float _2305 = exp2(_2291);
    float _2307 = _2263 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2309 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2297);
    float _2311 = fma(_2303, -0.5, 0.5);
    float _2313 = fma(_2303, 0.5, 0.5);
    float _2315 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2307);
    float _2317 = _2275 + 1.0;
    float _2319 = fma(_2249, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2309);
    float _2321 = 1.0 / _2299;
    float _2323 = fma(_2249, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2315);
    float _2325 = fma(_2313, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2327 = fma(_2313, _2325, -0.212114393711090087890625);
    float _2329 = sqrt(_2311);
    float _2331 = -_2275;
    float _2333 = fma(_2305, _2317, _2331);
    float _2335 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2323);
    float _2337 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2319);
    float _2339 = _2287 * 0.693147182464599609375;
    float _2341 = fma(_2313, _2327, 1.570728778839111328125);
    float _2343 = fma(_2333, 0.5, 0.5);
    float _2345 = _2335 * _2321;
    float _2347 = _2337 * _2321;
    float _2349 = _2339 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2351 = fma(_2345, 0.5, 0.5);
    float _2353 = fma(_2347, -0.5, 0.5);
    float _2355 = _2329 * 0.636619746685028076171875;
    float3 _6381 = float3(_2351, _2353, _2349);
    float _2357 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6381, float3(0.0), isnan(_6381)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6381, float3(0.0), isnan(_6381)), level(0.0)).x;
    float _2359 = -_2341;
    float _2361 = fma(_2355, _2359, 1.0);
    float3 _6397 = float3(_2351, _2353, _2349);
    float4 _2364 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6397, float3(0.0), isnan(_6397)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6397, float3(0.0), isnan(_6397)), level(0.0)).xyzw;
    float _2366 = _2364.x;
    float _2368 = _2364.y;
    float _2370 = _2364.z;
    float _2372 = _2364.w;
    float2 _6414 = float2(_2361, _2343);
    float3 _2376 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6414, float2(0.0), isnan(_6414)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6414, float2(0.0), isnan(_6414)), level(0.0)).xyz;
    float _2378 = _2376.x;
    float _2380 = _2376.y;
    float _2382 = _2376.z;
    float _2384 = _2257 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2386 = _2263 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2388 = _2073 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2390 = isnan(_2073);
    bool _2392 = _2388 || _2390;
    bool _2394 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2396 = _2392 || _2394;
    float _2398 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2386);
    float _2400 = exp2(_2384);
    float _2402 = _2299 * 0.5;
    float _2404 = fma(_2249, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2398);
    float _2406 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2404);
    float _2408 = fma(_2337, -0.5, _2402);
    float _2410 = _2335 + _2299;
    float _2412 = _2406 + _2299;
    float _2414 = _2410 * 0.5;
    out.gl_Position.x = _2335;
    out.gl_Position.y = _2337;
    out.gl_Position.z = _2406;
    out.gl_Position.w = _2299;
    float _2416 = _2412 * 0.5;
    float _2418 = -_2400;
    float _2420 = _2418 + 1.0;
    float _2422 = _2420 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_74.x = _2414;
    out.m_74.y = _2408;
    out.m_74.z = _2416;
    out.m_74.w = _2299;
    float _2424 = _2337;
    float _2426 = _2335;
    if (!_2396)
    {
        _2424 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2428 = _2424;
    float _2430 = _2428;
    float _2432 = _2428;
    if (!_2396)
    {
        _2426 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2434 = _2426;
    float _2436 = _2422 * _2357;
    float _2438 = -_2422;
    float _2440 = _2438 + 1.0;
    float _2442 = _2372 * _2436;
    float _2444 = _2372 * _2440;
    float _2446 = _2382 * _2436;
    float _2448 = fma(_2378, _2442, _2366);
    float _2450 = fma(_2380, _2442, _2368);
    float _2452 = fma(_2372, _2446, _2370);
    float _2454 = _1993 * _2051;
    out.m_76.x = _2448;
    out.m_76.y = _2450;
    out.m_76.z = _2452;
    out.m_76.w = _2444;
    float _2456 = _2454 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2458 = _2454;
    float _2460 = _2434;
    float _2462 = _2434;
    if (!_2396)
    {
        _2458 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2464 = _2458;
    bool _2466 = !_2396;
    float _2468 = _2464;
    float _2470 = _2464;
    if (!_2466)
    {
        bool _2472 = _2073 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2474 = isnan(_2073);
        bool _2476 = _2472 || _2474;
        bool _2478 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2480 = _2476 || _2478;
        if (!_2480)
        {
            float _2482 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2484 = _2073 + _2482;
            float _2486 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2488 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2486;
            float _2490 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2492 = _2490 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2494 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2496 = _2494 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2498 = 1.0 / _2488;
            float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2502 = _2500 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2504 = _2484 * _2498;
            float _2506 = precise::clamp(_2504, 0.0, 1.0);
            float _2508 = fma(_2506, _2492, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2510 = fma(_2506, _2496, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2512 = fma(_2506, _2502, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2462 = _2510;
            _2432 = _2508;
            _2470 = _2512;
            _2514 = true;
        }
        else
        {
            bool _2516 = _2073 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2518 = isnan(_2073);
            bool _2520 = _2516 || _2518;
            bool _2522 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2524 = _2520 || _2522;
            if (!_2524)
            {
                _2430 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2526 = _2430;
            _2432 = _2526;
            if (!_2524)
            {
                _2460 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2528 = _2460;
            _2462 = _2528;
            if (!_2524)
            {
                _2468 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2530 = _2468;
            bool _2532 = !_2524;
            _2470 = _2530;
            if (!_2532)
            {
                bool _2534 = _2073 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2536 = isnan(_2073);
                bool _2538 = _2534 || _2536;
                bool _2540 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2542 = _2538 || _2540;
                if (!_2542)
                {
                    float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2546 = _2073 + _2544;
                    float _2548 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2550 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2548;
                    float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2554 = _2552 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2560 = 1.0 / _2550;
                    float _2562 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2564 = _2562 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2566 = _2546 * _2560;
                    float _2568 = precise::clamp(_2566, 0.0, 1.0);
                    float _2570 = fma(_2568, _2554, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2572 = fma(_2568, _2558, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2574 = fma(_2568, _2564, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2462 = _2572;
                    _2432 = _2570;
                    _2470 = _2574;
                    _2514 = true;
                }
                else
                {
                    _2462 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2432 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2470 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2514 = false;
    float _2576 = _2462;
    float _2578 = _2432;
    float _2580 = _2470;
    float _2582 = _2456 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_78.x = 0.0;
    float _2584 = _2576 * 0.586610972881317138671875;
    bool _2586 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_49.x = _2582;
    float _2588 = fma(_2578, 0.298911988735198974609375, _2584);
    bool _2590 = _1993 > 0.0;
    bool _2592 = isnan(_1993);
    bool _2594 = _2590 || _2592;
    bool _2596 = isnan(0.0);
    bool _2598 = _2594 || _2596;
    float _2600 = fma(_2580, 0.114477999508380889892578125, _2588);
    bool _2602 = _2051 <= 0.0;
    bool _2604 = !_2598;
    bool _2606 = _2602 || _2604;
    float _2608 = -_2600;
    float _2610 = _2608 + _2578;
    float _2612 = -_2600;
    float _2614 = _2612 + _2576;
    float _2616 = -_2600;
    float _2618 = _2616 + _2580;
    float _2620 = fma(_2610, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2600);
    float _2622 = fma(_2614, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2600);
    float _2624 = fma(_2618, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2600);
    bool _2626 = !_2586;
    if (!_2626)
    {
        float _2628 = -_1925;
        float _2630 = _2628 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2632 = -_1927;
        float _2634 = _2632 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2636 = -_1929;
        float _2638 = _2636 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2640 = _2630 * _2630;
        float _2642 = fma(_2634, _2634, _2640);
        float _2644 = fma(_2638, _2638, _2642);
        float _2646 = sqrt(_2644);
        float _2648 = rsqrt(_2644);
        float _2650 = -_2646;
        float _2652 = _2650 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2654 = _2652 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2656 = precise::clamp(_2654, 0.0, 1.0);
        float _2658 = _2634 * _2648;
        float _2660 = _2630 * _2648;
        float _2662 = abs(_2656);
        float _2664 = log2(_2662);
        float _2666 = _2638 * _2648;
        float _2668 = _2658 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2670 = _1603 * _2660;
        float _2672 = -_2660;
        float _2674 = -_2668;
        float _2676 = fma(_2672, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2674);
        float _2678 = fma(_1601, _2658, _2670);
        float _2680 = -_2666;
        float _2682 = fma(_2680, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2676);
        float _2684 = fma(_1605, _2666, _2678);
        float _2686 = precise::clamp(_2684, 0.0, 1.0);
        float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2690 = _2682 + _2688;
        float _2692 = _2664 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2694 = _2690 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2696 = precise::clamp(_2694, 0.0, 1.0);
        float _2698 = exp2(_2692);
        float _2700 = _2698 * _2696;
        float _2702 = _2686 * _2700;
        float _2704 = _2702 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2706 = _2702 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2708 = _2702 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_78.x = _2704;
        out.m_78.y = _2706;
        out.m_78.z = _2708;
    }
    out.m_80.x = _2620;
    out.m_80.y = _2622;
    out.m_80.z = _2624;
    if (!_2606)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2710 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2710;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

