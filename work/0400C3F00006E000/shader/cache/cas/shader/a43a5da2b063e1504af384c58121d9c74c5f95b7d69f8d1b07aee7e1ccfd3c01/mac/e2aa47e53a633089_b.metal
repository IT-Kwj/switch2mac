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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_62 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_78 [[user(locn2)]];
    float4 m_88 [[user(locn3)]];
    float4 m_72 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
    float4 m_90 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_86 [[user(locn9)]];
    float4 m_70 [[user(locn10)]];
    float4 m_80 [[user(locn11)]];
    float4 m_49 [[user(locn12)]];
    float4 m_68 [[user(locn13)]];
    float4 m_66 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_76 [[attribute(0)]];
    float4 m_60 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_58 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3899 = false;
    bool _535 = false;
    bool _355 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_46.w;
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
        out.m_49.x = 0.0;
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
        float _4198 = as_type<float>(_125);
        out.gl_Position.z = _4198;
    }
    if (!_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_51.w;
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
        out.m_49.x = 0.0;
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
        float _4268 = as_type<float>(_163);
        out.gl_Position.z = _4268;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _169 = in.m_56.x;
    float _171 = in.m_56.y;
    int _173 = as_type<int>(_165) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_165) & 2;
    bool _179 = _177 != 0;
    float _181 = _169 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _183 = _171 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _185 = !_175;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_179;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_167;
    float _211;
    if (!_193)
    {
        float _195 = in.m_58.x;
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _211 = _209;
        _213 = true;
    }
    else
    {
        float _215 = float(_109);
        float _217 = 1.0 / _215;
        float _219 = _143 * _217;
        _211 = _219;
    }
    _213 = false;
    float _221 = _211;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _225 = _221 + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _229 = _227 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _231 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _233 = isnan(_221);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _239 = _235 || _237;
    float _241 = float(_239);
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _245 = _243 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _247 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _249 = isnan(_221);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _259;
    bool _263 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _265 = isnan(_221);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = 1.0 / _229;
    float _277 = -_241;
    float _279 = _277 + 1.0;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _283 = _257 * _279;
    float _285 = -_257;
    float _287 = _285 + 1.0;
    float _289 = 1.0 / _245;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _297 = _291 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _299 = _261 * _275;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _305 = _293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _307 = _295 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _309 = fma(_299, _225, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _311 = _303 * _289;
    float _313 = _309 * _283;
    float _315 = -_273;
    float _317 = _315 + 1.0;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _321 = _221 + _319;
    float _323 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[115].x, _313);
    float _325 = _241 * _317;
    float _327 = fma(_311, _321, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _329 = fma(_327, _325, _323);
    float _331 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[117].x, _329);
    float _333 = _331 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _335 = !_281;
    float _353;
    if (!_335)
    {
        float _337 = in.m_58.x;
        float _339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _341 = _337 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _343 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[11].w, _143);
        float _345 = _343 * _339;
        float _347 = floor(_345);
        float _349 = -_347;
        float _351 = _345 + _349;
        _353 = _351;
        _355 = true;
    }
    else
    {
        float _357 = float(_109);
        float _359 = 1.0 / _357;
        float _361 = _143 * _359;
        _353 = _361;
    }
    _355 = false;
    float _363 = _353;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _367 = _363 + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _377 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _379 = isnan(_363);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _393 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _395 = isnan(_363);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = 1.0 / _371;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _407;
    float _411 = -_387;
    float _413 = _411 + 1.0;
    bool _415 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _417 = isnan(_363);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    bool _427 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _429 = 1.0 / _375;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _433 = 1.0 / _391;
    float _435 = _409 * _405;
    float _437 = -_403;
    float _439 = _437 + 1.0;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _443 = _441 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _445 = _403 * _413;
    float _447 = fma(_435, _367, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _449 = _425 * _439;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _451;
    float _455 = _443 * _429;
    bool _457 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _459 = isnan(_363);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _471 = _363 + _469;
    float _473 = _447 * _449;
    float _475 = -_425;
    float _477 = _475 + 1.0;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _481 = _363 + _479;
    float _483 = fma(_455, _471, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _485 = -_467;
    float _487 = _485 + 1.0;
    float _489 = _453 * _433;
    float _491 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[131].x, _473);
    float _493 = _387 * _487;
    float _495 = fma(_489, _481, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _497 = fma(_483, _445, _491);
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _503 = _431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _505 = fma(_495, _493, _497);
    float _507 = _499 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _509 = _501 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _511 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[134].x, _505);
    float _513 = _511 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _515 = !_427;
    float _533;
    if (!_515)
    {
        float _517 = in.m_58.x;
        float _519 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _521 = _517 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _523 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[14].x, _143);
        float _525 = _523 * _519;
        float _527 = floor(_525);
        float _529 = -_527;
        float _531 = _525 + _529;
        _533 = _531;
        _535 = true;
    }
    else
    {
        float _537 = float(_109);
        float _539 = 1.0 / _537;
        float _541 = _143 * _539;
        _533 = _541;
    }
    _535 = false;
    float _543 = _533;
    float _545 = in.m_58.x;
    float _547 = in.m_58.y;
    float _549 = in.m_58.z;
    float _551 = in.m_58.w;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _555 = _543 + _553;
    float _557 = in.m_46.x;
    float _559 = in.m_46.y;
    float _561 = in.m_46.z;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _571 = 1.0 / _565;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _581 = _543 + _579;
    float _583 = _183 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _585 = 1.0 / _569;
    float _587 = _545 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _593 = 1.0 / _575;
    float _595 = -_577;
    float _597 = fma(_587, 2.0, _595);
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _605 = _547 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _607 = _559 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _609 = 1.0 / _603;
    float _611 = fma(_605, -2.0, _599);
    float _613 = _559 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _615 = fma(_557, (*spvDescriptorSet0.vp_c10)._m0[5].x, _607);
    float _617 = _559 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _623;
    float _627 = 1.0 / _591;
    float _629 = fma(_557, (*spvDescriptorSet0.vp_c10)._m0[6].x, _617);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _635 = _625 * _593;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _641 = -_143;
    float _643 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[76].x, _597);
    float _645 = 1.0 / _621;
    float _647 = fma(_557, (*spvDescriptorSet0.vp_c10)._m0[4].x, _613);
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _649;
    int _653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _655 = _653 != 0;
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _659 = _657 != 0;
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _663 = _661 != 0;
    float _665 = fma(_635, _581, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _667 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _669 = isnan(_543);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _679;
    float _683 = _651 * _585;
    float _685 = _545 * 2.0;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _691 = _681 * _609;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _697 = 1.0 / _633;
    float _699 = _689 * _571;
    float _701 = _545 + _547;
    float _703 = _695 * _645;
    float _705 = _547 * 2.0;
    float _707 = _701 + (-1.0);
    float _709 = floor(_685);
    float _711 = _639 * _627;
    float _713 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _715 = _549 + _547;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _717;
    float _721 = fma(_699, _555, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _723 = _715 + (-1.0);
    float _725 = floor(_705);
    float _727 = _549 * 2.0;
    float _729 = _719 * _697;
    float _731 = _549 + _545;
    float _733 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _735 = !_659;
    int _737 = _735 ? 0 : 1;
    float _739 = _731 + (-1.0);
    float _741 = floor(_727);
    bool _743 = _709 > 0.0;
    bool _745 = _709 >= 0.0;
    bool _747 = isnan(_709);
    bool _749 = _745 || _747;
    bool _751 = isnan(0.0);
    bool _753 = _749 || _751;
    float _755 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _757 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _759 = isnan(_543);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    int _769 = _753 ? 0 : 1;
    float _771 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _773 = int(_771);
    bool _775 = _725 > 0.0;
    float _777 = -_767;
    float _779 = _777 + 1.0;
    bool _781 = _725 >= 0.0;
    bool _783 = isnan(_725);
    bool _785 = _781 || _783;
    bool _787 = isnan(0.0);
    bool _789 = _785 || _787;
    bool _791 = !_655;
    int _793 = _791 ? 0 : 1;
    bool _795 = !_663;
    int _797 = _795 ? 0 : 1;
    float _799 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _801 = int(_799);
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _805 = _803 != 0;
    int _807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _809 = _807 != 0;
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _813 = _811 != 0;
    bool _815 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _817 = isnan(_543);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    int _827 = ~_769;
    int _829 = _827 + 1;
    int _831 = _829 + 1;
    int _833 = _831;
    if (!_743)
    {
        int _835 = ~_769;
        int _837 = _835 + 1;
        _833 = _837;
    }
    int _839 = _833;
    float _841 = -_825;
    float _843 = _841 + 1.0;
    bool _845 = !_805;
    float _847 = _845 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _849 = _741 > 0.0;
    bool _851 = _741 >= 0.0;
    bool _853 = isnan(_741);
    bool _855 = _851 || _853;
    bool _857 = isnan(0.0);
    bool _859 = _855 || _857;
    float _861 = _825 * _779;
    int _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _865 = _863 != 0;
    float _867 = fma(_561, (*spvDescriptorSet0.vp_c10)._m0[5].z, _615);
    bool _869 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _871 = isnan(_543);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = fma(_561, (*spvDescriptorSet0.vp_c10)._m0[4].z, _647);
    bool _883 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _885 = isnan(_543);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = fma(_561, (*spvDescriptorSet0.vp_c10)._m0[6].z, _629);
    bool _897 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _899 = isnan(_543);
    bool _901 = _897 || _899;
    bool _903 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _905 = _901 || _903;
    float _907 = float(_905);
    float _909 = _879 * _843;
    float _911 = -_879;
    float _913 = _911 + 1.0;
    float _915 = -_893;
    float _917 = _915 + 1.0;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _921 = _543 + _919;
    bool _923 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _925 = isnan(_543);
    bool _927 = _923 || _925;
    bool _929 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _931 = _927 || _929;
    float _933 = float(_931);
    float _935 = _893 * _913;
    float _937 = _907 * _917;
    float _939 = fma(_683, _921, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _941 = as_type<int>(_917);
    float _943 = _939;
    float _945 = _847;
    if (_865)
    {
        _941 = 0;
    }
    int _947 = _941;
    float _949 = -_907;
    float _951 = _949 + 1.0;
    bool _953 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _955 = isnan(_543);
    bool _957 = _953 || _955;
    bool _959 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _961 = _957 || _959;
    float _963 = float(_961);
    float _965 = -_933;
    float _967 = _965 + 1.0;
    int _969 = _947;
    if (!_865)
    {
        _969 = 1;
    }
    int _971 = _969;
    float _973 = _933 * _951;
    int _975 = _859 ? 0 : 1;
    float _977 = -_963;
    float _979 = _977 + 1.0;
    bool _981 = _971 != 1;
    float _983 = _963 * _967;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _987 = _543 + _985;
    float _989 = _677 * _979;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _993 = _543 + _991;
    float _995 = fma(_691, _987, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _997 = _939 * _989;
    float _999 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1001 = log2(_999);
    float _1003 = float(_773);
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1007 = float(_801);
    float _1009 = fma(_711, _993, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    if (!_981)
    {
        _943 = _547;
    }
    float _1011 = _943;
    float _1013 = _881 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1015 = _1011;
    if (_981)
    {
        _1015 = _545;
    }
    float _1017 = _1015;
    float _1019 = 1.0 / _1007;
    float _1021 = float(_109);
    float _1023 = _895 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1025 = ~_975;
    int _1027 = _1025 + 1;
    int _1029 = _1027 + 1;
    float _1031 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1005);
    float _1033 = _1017;
    int _1035 = _1029;
    if (!_981)
    {
        _1033 = _549;
    }
    float _1037 = _1033;
    float _1039 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1041 = _1013 + _1039;
    float _1043 = _1001 * _143;
    float _1045 = _1001;
    float _1047 = _1037;
    if (!_981)
    {
        _1045 = _547;
    }
    float _1049 = _1045;
    float _1051 = 1.0 / _1003;
    float _1053 = _1049;
    if (_981)
    {
        _1053 = _545;
    }
    float _1055 = _1053;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_981)
    {
        _1047 = _547;
    }
    float _1059 = _1047;
    float _1061 = -_677;
    float _1063 = _1061 + 1.0;
    if (!_849)
    {
        int _1065 = ~_975;
        int _1067 = _1065 + 1;
        _1035 = _1067;
    }
    int _1069 = _1035;
    float _1071 = _1019 * _143;
    float _1073 = exp2(_1043);
    int _1075 = abs(as_type<int>(_847));
    float _1077 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_981)
    {
        _945 = _549;
    }
    float _1079 = _945;
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1083 = _1079;
    if (_981)
    {
        _1083 = _547;
    }
    float _1085 = _1083;
    float _1087 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[159].x, _997);
    float _1089 = float(_1075);
    float _1091 = 1.0 / _1021;
    float _1093 = fma(_1085, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1057);
    float _1095 = fma(_1077, -2.0, _1081);
    float _1097 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _611);
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1101 = _867 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1105 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1107 = float(_1069);
    float _1109 = -_1073;
    float _1111 = _1109 + 1.0;
    bool _1113 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1115 = isnan(0.0);
    bool _1117 = _1113 || _1115;
    bool _1119 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1121 = _1117 || _1119;
    float _1123 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1099);
    float _1125 = _1089 * _1107;
    float _1127 = _1051 * _143;
    float _1129 = in.m_60.x;
    float _1131 = in.m_60.y;
    float _1133 = in.m_60.z;
    float _1135 = -_1103;
    float _1137 = fma(_1105, 2.0, _1135);
    float _1139 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1141 = _1101 + _1139;
    float _1143 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1123);
    float _1145 = _1121 ? _1111 : 0.0;
    float _1147 = _1141 * _1141;
    bool _1149 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1151 = isnan(1.0);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1157 = _1153 || _1155;
    float _1159 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1161 = 1.0 + _1159;
    float _1163 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1165 = _1091 * _143;
    float _1167 = fma(_1041, _1041, _1147);
    float _1169 = 1.0 / _1161;
    float _1171 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1163);
    bool _1173 = !_809;
    int _1175 = _1173 ? 0 : 1;
    float _1177 = _1125 * (-2.0);
    float _1179 = float(_839);
    float _1181 = -_143;
    float _1183 = fma(_1181, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1137);
    int _1185 = abs(_1175);
    float _1187 = _545 + (-0.5);
    float _1189 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1031);
    float _1191 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1193 = _1023 + _1191;
    float _1195 = float(_1185);
    float _1197 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1171);
    float _1199 = fma(_1177, _1129, _1129);
    float _1201 = fma(_1193, _1193, _1167);
    float _1203 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1093);
    float _1205 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1095);
    if (_1157)
    {
        float _1207 = _1145 * _1169;
        _145 = _1207;
    }
    float _1209 = _145;
    float _1211 = sqrt(_1201);
    float _1213 = fma(_713, _1177, _713);
    float _1215 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1199);
    float _1217 = _1195 * _1179;
    float _1219 = _181 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1221 = _789 ? 0 : 1;
    float _1223 = fma(_1213, _1209, _1215);
    float _1225 = _1217 * (-2.0);
    float _1227 = rsqrt(_1201);
    bool _1229 = !_813;
    int _1231 = _1229 ? 0 : 1;
    float _1233 = _1219 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1235 = fma(_733, _1225, _733);
    float _1237 = fma(_1225, _1131, _1131);
    int _1239 = abs(_1231);
    float _1241 = _547 + (-0.5);
    int _1243 = ~_1221;
    int _1245 = _1243 + 1;
    int _1247 = _1245 + 1;
    float _1249 = _1211 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _1251 = _1247;
    if (!_775)
    {
        int _1253 = ~_1221;
        int _1255 = _1253 + 1;
        _1251 = _1255;
    }
    int _1257 = _1251;
    float _1259 = _1223 * 0.15915493667125701904296875;
    float _1261 = fma(_1241, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1237);
    float _1263 = float(_1239);
    float _1265 = fma(_721, _983, _1087);
    float _1267 = precise::min(_1233, _1249);
    float _1269 = fma(_1235, _1209, _1261);
    float _1271 = float(_1257);
    float _1273 = fma(_665, _973, _1265);
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1277 = _543 + _1275;
    float _1279 = _1227 * _1267;
    float _1281 = _1269 * 0.15915493667125701904296875;
    float _1283 = _1263 * _1271;
    float _1285 = fma(_1009, _937, _1273);
    float _1287 = _1141 * _1279;
    float _1289 = _1041 * _1279;
    float _1291 = _1283 * (-2.0);
    float _1293 = -_1287;
    float _1295 = _1141 + _1293;
    float _1297 = -_1289;
    float _1299 = _1041 + _1297;
    float _1301 = fma(_1291, _1133, _1133);
    float _1303 = _549 + (-0.5);
    float _1305 = _1295 * _1295;
    float _1307 = _1193 * _1279;
    float _1309 = fma(_755, _1291, _755);
    float _1311 = fma(_1303, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1301);
    float _1313 = fma(_1299, _1299, _1305);
    float _1315 = -_1307;
    float _1317 = _1193 + _1315;
    float _1319 = fma(_1309, _1209, _1311);
    float _1321 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1323 = _543 + _1321;
    float _1325 = fma(_1317, _1317, _1313);
    float _1327 = _1259 * 6.283185482025146484375;
    float _1329 = sin(_1327);
    float _1331 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1333 = fma(_729, _1323, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1335 = _1319 * 0.15915493667125701904296875;
    float _1337 = fma(_703, _1277, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1339 = fma(_995, _935, _1285);
    float _1341 = sqrt(_1325);
    float _1343 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1331);
    float _1345 = fma(_1337, _909, _1339);
    float _1347 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1343);
    float _1349 = fma(_1333, _861, _1345);
    float _1351 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _1353 = _1259 * 6.283185482025146484375;
    float _1355 = cos(_1353);
    float _1357 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1349);
    float _1359 = _1281 * 6.283185482025146484375;
    float _1361 = sin(_1359);
    float _1363 = _1227 * _1341;
    float _1365 = _583 * _1363;
    float _1367 = _1219 * _1363;
    float _1369 = _1363 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1371 = _1369 * 0.5;
    float _1373 = _1281 * 6.283185482025146484375;
    float _1375 = cos(_1373);
    float _1377 = _1365 * _1351;
    float _1379 = _1335 * 6.283185482025146484375;
    float _1381 = cos(_1379);
    float _1383 = _1329 * _1361;
    float _1385 = _1355 * _1361;
    float _1387 = _1335 * 6.283185482025146484375;
    float _1389 = sin(_1387);
    float _1391 = _1329 * _1375;
    float _1393 = _1355 * _1375;
    float _1395 = sqrt(_1347);
    float _1397 = _1355 * _1381;
    float _1399 = _1375 * _1381;
    float _1401 = _1329 * _1381;
    float _1403 = _1361 * _1381;
    float _1405 = _1401 * _1377;
    float _1407 = -_1385;
    float _1409 = fma(_1389, _1391, _1407);
    float _1411 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _1413 = fma(_1389, _1393, _1383);
    float _1415 = -_1391;
    float _1417 = fma(_1389, _1385, _1415);
    float _1419 = fma(_1389, _1383, _1393);
    float _1421 = _1367 * _1411;
    float _1423 = -_1377;
    float _1425 = _1389 * _1423;
    float _1427 = _1395 * 50.0;
    float _1429 = _1397 * _1377;
    float _1431 = fma(_1399, _1421, _1425);
    float _1433 = fma(_1409, _1421, _1405);
    float _1435 = _1357 * _1427;
    float _1437 = fma(_1413, _1421, _1429);
    float _1439 = fma(_1403, _1371, _1431);
    float _1441 = fma(_1419, _1371, _1433);
    float _1443 = -_1289;
    float _1445 = _1013 + _1443;
    float _1447 = fma(_1417, _1371, _1437);
    float _1449 = -_1287;
    float _1451 = _1101 + _1449;
    float _1453 = -_1307;
    float _1455 = _1023 + _1453;
    float _1457 = _1435 * _1435;
    float _1459 = _1447 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1461 = _1447 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1463 = _1447 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1465 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1467 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1459);
    float _1469 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1461);
    float _1471 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1463);
    float _1473 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1465);
    float _1475 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1467);
    float _1477 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1469);
    float _1479 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1471);
    float _1481 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1473);
    float _1483 = _1475 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1485 = _1477 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1487 = _1479 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1489 = _1481 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1491 = _1483 * _1483;
    float _1493 = _1013 + _1485;
    float _1495 = _1023 + _1487;
    float _1497 = rsqrt(_1457);
    float _1499 = fma(_1485, _1485, _1491);
    float _1501 = fma(_1487, _1487, _1499);
    float _1503 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1505 = _1495 + _1503;
    float _1507 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1509 = _1493 + _1507;
    float _1511 = sqrt(_1457);
    float _1513 = _1505 * _1505;
    float _1515 = fma(_1509, _1509, _1513);
    float _1517 = 1.0 / _1489;
    float _1519 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1521 = _1435 * _1497;
    float _1523 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1519);
    float _1525 = rsqrt(_1501);
    float _1527 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1523);
    float _1529 = _1527 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1531 = sqrt(_1515);
    float _1533 = _1529 + _1489;
    float _1535 = _1533 * _1517;
    float _1537 = _1535 * 0.5;
    float _1539 = _1483 * _1525;
    float _1541 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1543 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1541);
    float _1545 = _1521 * _1539;
    float _1547 = 1.0 / _1543;
    bool _1549 = _1531 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1551 = _1545 * _1511;
    int _1553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1555 = _1553 != 0;
    int _1557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1559 = _1557 != 0;
    int _1561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1563 = _1561 != 0;
    int _1565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1567 = _1565 != 0;
    float _1569 = fma(_1521, _1551, _1483);
    bool _1571 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1573 = isnan(0.5);
    bool _1575 = _1571 || _1573;
    bool _1577 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1579 = _1575 || _1577;
    float _1581 = _1101 + _1569;
    bool _1583 = !_1559;
    int _1585 = _1583 ? 0 : 1;
    bool _1587 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1589 = isnan(0.5);
    bool _1591 = _1587 || _1589;
    bool _1593 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1595 = _1591 || _1593;
    bool _1597 = !_1555;
    int _1599 = _1597 ? 0 : 1;
    bool _1601 = !_1563;
    int _1603 = _1601 ? 0 : 1;
    bool _1605 = !_1567;
    int _1607 = _1605 ? 0 : 1;
    float _1609 = _1483;
    float _1611 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1613 = _1525;
    float _1615 = _1569;
    float _1617 = _1505;
    float _1619 = _1307;
    float _1621 = _1495;
    if (!_1549)
    {
        _1609 = _1493;
    }
    float _1623 = _1609;
    float _1625 = _1623;
    if (!_1549)
    {
        _1611 = _1495;
    }
    float _1627 = _1611;
    float _1629 = _1627;
    if (!_1549)
    {
        _1613 = _1581;
    }
    float _1631 = _1613;
    bool _1633 = !_1549;
    float _1635 = _1631;
    if (!_1633)
    {
        float _1637 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1639 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1641 = _1531 + _1639;
        float _1643 = rsqrt(_1515);
        float _1645 = _1641 * _1637;
        float _1647 = _1581 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1649 = _1645 * 0.15915493667125701904296875;
        float _1651 = _1649 * 6.283185482025146484375;
        float _1653 = cos(_1651);
        float _1655 = _1649 * 6.283185482025146484375;
        float _1657 = sin(_1655);
        float _1659 = _1653 + (-1.0);
        float _1661 = _1659 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1663 = fma(_1657, _1647, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1665 = fma(_1581, _1653, _1661);
        float _1667 = _1643 * _1663;
        float _1669 = fma(_1509, _1667, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1671 = fma(_1505, _1667, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1625 = _1669;
        _1635 = _1665;
        _1629 = _1671;
        _1615 = _1643;
    }
    float _1673 = _1625;
    float _1675 = _1635;
    float _1677 = _1629;
    float _1679 = _1615;
    float _1681 = -_1289;
    float _1683 = _1681 + _1673;
    float _1685 = -_1287;
    float _1687 = _1685 + _1675;
    float _1689 = -_1307;
    float _1691 = _1689 + _1677;
    float _1693 = _1687;
    float _1695 = _1683;
    float _1697 = _1691;
    float _1699 = _1673;
    float _1701 = _1679;
    if (_1595)
    {
        _1617 = 1.0;
    }
    float _1703 = _1617;
    float _1705 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1707 = _1547 * _1705;
    float _1709 = _1703;
    if (!_1579)
    {
        float _1711 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1713 = _1451 + _1711;
        float _1715 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1717 = _1445 + _1715;
        float _1719 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1721 = -_1013;
        float _1723 = _1721 + _1673;
        float _1725 = _1713 * _1713;
        float _1727 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1729 = _1455 + _1727;
        float _1731 = -_1101;
        float _1733 = _1731 + _1675;
        float _1735 = -_1023;
        float _1737 = _1735 + _1677;
        float _1739 = fma(_1717, _1717, _1725);
        float _1741 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1743 = fma(_1729, _1729, _1739);
        float _1745 = sqrt(_1743);
        float _1747 = _1719 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1749 = precise::min(_1745, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1751 = _1749 * _1741;
        float _1753 = _1747 * _1751;
        float _1755 = fma(_1723, _1753, _1445);
        float _1757 = fma(_1733, _1753, _1451);
        float _1759 = fma(_1737, _1753, _1455);
        _1693 = _1757;
        _1695 = _1755;
        _1697 = _1759;
        _1619 = _1719;
        _1699 = _1753;
    }
    float _1761 = _1693;
    float _1763 = _1695;
    float _1765 = _1697;
    float _1767 = _1619;
    float _1769 = _1699;
    float _1771 = _1769;
    float _1773 = _1767;
    if (!_1595)
    {
        float _1775 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1777 = _1775 * 0.15915493667125701904296875;
        float _1779 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1781 = _1777 * 6.283185482025146484375;
        float _1783 = cos(_1781);
        float _1785 = _1779 * 0.15915493667125701904296875;
        float _1787 = _1777 * 6.283185482025146484375;
        float _1789 = sin(_1787);
        float _1791 = 1.0 / _1783;
        float _1793 = _1785 * 6.283185482025146484375;
        float _1795 = cos(_1793);
        float _1797 = _1789 * _1791;
        float _1799 = _1785 * 6.283185482025146484375;
        float _1801 = sin(_1799);
        float _1803 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1805 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1803;
        float _1807 = _1795 * _1797;
        float _1809 = 1.0 / _1805;
        float _1811 = 1.0 / _1807;
        float _1813 = _1801 * _1811;
        float _1815 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1817 = fma(_1707, _1813, _1815);
        float _1819 = _1817 * _1809;
        float _1821 = precise::clamp(_1819, 0.0, 1.0);
        _1771 = _1777;
        _1709 = _1821;
    }
    float _1823 = _1771;
    float _1825 = _1709;
    float _1827 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1829 = _1761 + _1827;
    float _1831 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1833 = _1763 + _1831;
    float _1835 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1837 = _1765 + _1835;
    float _1839 = _1829 * _1829;
    float _1841 = fma(_1833, _1833, _1839);
    float _1843 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1845 = fma(_1837, _1837, _1841);
    float _1847 = rsqrt(_1845);
    float _1849 = sqrt(_1845);
    float _1851 = _1847 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1853 = _1833 * _1851;
    float _1855 = _1837 * _1851;
    float _1857 = _1853 * _1853;
    float _1859 = _1855 * _1855;
    float _1861 = _1857 + _1859;
    float _1863 = sqrt(_1861);
    bool _1865 = _1863 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1867 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1869 = _1863 + _1867;
    float _1871 = _1837;
    float _1873 = _1861;
    float _1875 = _1869;
    float _1877 = _1851;
    float _1879 = _1839;
    if (_1865)
    {
        float _1881 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1871 = _1881;
    }
    float _1883 = _1871;
    if (_1865)
    {
        float _1885 = rsqrt(_1861);
        _1873 = _1885;
    }
    float _1887 = _1873;
    float _1889 = _1887;
    if (_1865)
    {
        float _1891 = _1869 * _1883;
        _1875 = _1891;
    }
    float _1893 = _1875;
    if (_1865)
    {
        float _1895 = _1893 * 0.15915493667125701904296875;
        _1773 = _1895;
    }
    float _1897 = _1773;
    float _1899 = _1883;
    float _1901 = _1897;
    if (_1865)
    {
        float _1903 = _1897 * 6.283185482025146484375;
        float _1905 = sin(_1903);
        _1899 = _1905;
    }
    float _1907 = _1899;
    float _1909 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1911 = precise::max(0.0, _1909);
    float _1913 = _1823;
    if (_1865)
    {
        float _1915 = _1897 * 6.283185482025146484375;
        float _1917 = cos(_1915);
        _1913 = _1917;
    }
    float _1919 = _1913;
    float _1921 = -_1851;
    float _1923 = -_1911;
    float _1925 = fma(_1829, _1921, _1923);
    if (_1865)
    {
        float _1927 = _1925 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1877 = _1927;
    }
    float _1929 = _1877;
    float _1931 = _1929;
    if (!_1865)
    {
        _1901 = _1859;
    }
    float _1933 = _1901;
    float _1935 = fma(_1445, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1937 = _1907;
    float _1939 = _1933;
    if (_1865)
    {
        float _1941 = fma(_1907, _1929, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1931 = _1941;
    }
    float _1943 = _1931;
    float _1945 = _1943;
    if (!_1865)
    {
        _1937 = _1853;
    }
    float _1947 = _1937;
    float _1949 = floor(_1935);
    float _1951 = _1947;
    if (_1865)
    {
        float _1953 = _1919 + (-1.0);
        _1879 = _1953;
    }
    float _1955 = _1879;
    float _1957 = _1955;
    if (_1865)
    {
        float _1959 = _1887 * _1943;
        _1621 = _1959;
    }
    float _1961 = _1621;
    if (!_1865)
    {
        _1945 = _1925;
    }
    float _1963 = _1945;
    float _1965 = _1963;
    if (_1865)
    {
        float _1967 = _1955 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1701 = _1967;
    }
    float _1969 = _1701;
    if (_1865)
    {
        float _1971 = _1853 * _1961;
        _1951 = _1971;
    }
    float _1973 = _1951;
    if (!_1865)
    {
        _1957 = _1855;
    }
    float _1975 = _1957;
    float _1977 = _1975;
    if (_1865)
    {
        float _1979 = _1855 * _1961;
        _1977 = _1979;
    }
    float _1981 = _1977;
    if (!_1865)
    {
        _1889 = _1857;
    }
    float _1983 = _1889;
    float _1985 = _1983;
    if (_1865)
    {
        float _1987 = fma(_1925, _1919, _1969);
        _1965 = _1987;
    }
    float _1989 = _1965;
    if (_1865)
    {
        float _1991 = _1973 * _1973;
        _1985 = _1991;
    }
    float _1993 = _1985;
    if (_1865)
    {
        float _1995 = _1981 * _1981;
        _1939 = _1995;
    }
    float _1997 = _1939;
    float _1999 = _1761 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2001 = fma(_1989, _1989, _1993);
    float _2003 = _1761 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2005 = fma(_1455, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2007 = _1761 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2009 = _2001 + _1997;
    float _2011 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1999);
    float _2013 = _1761 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2015 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2007);
    float _2017 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2003);
    float _2019 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2011);
    float _2021 = rsqrt(_2009);
    float _2023 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2015);
    float _2025 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2027 = fma(_1849, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2025);
    float _2029 = precise::clamp(_2027, 0.0, 1.0);
    float _2031 = _2019 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2033 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2013);
    float _2035 = _2023 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2037 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2017);
    float _2039 = -_2029;
    float _2041 = _2039 + 1.0;
    float _2043 = _2031 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2045 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2033);
    float _2047 = _2037 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2049 = floor(_2005);
    float _2051 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2043);
    float _2053 = _2045 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2055 = _2047 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2057 = -_1949;
    float _2059 = _1935 + _2057;
    float _2061 = fma(_2047, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2051);
    float _2063 = _2021 * _1973;
    float _2065 = _2021 * _1981;
    float _2067 = abs(_2041);
    float _2069 = log2(_2067);
    float _2071 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2061);
    float _2073 = _2021 * _1989;
    float _2075 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2077 = -_2055;
    float _2079 = fma(_2077, _1843, 1.0);
    float _2081 = _2031 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2083 = -_2075;
    float _2085 = fma(_2073, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2083);
    float _2087 = log2(_2079);
    float _2089 = -_2049;
    float _2091 = _2005 + _2089;
    float _2093 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2081);
    float _2095 = -_2065;
    float _2097 = fma(_2095, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2085);
    float _2099 = _2031 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2101 = fma(_2047, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2093);
    float _2103 = _2073 + 1.0;
    float _2105 = _2069 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2107 = fma(_2097, -0.5, 0.5);
    float _2109 = 1.0 / _2071;
    float _2111 = fma(_2097, 0.5, 0.5);
    float _2113 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2099);
    float _2115 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2101);
    float _2117 = fma(_2111, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2119 = fma(_2047, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2113);
    float _2121 = _2087 * 0.693147182464599609375;
    float _2123 = exp2(_2105);
    float _2125 = fma(_2111, _2117, -0.212114393711090087890625);
    float _2127 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2119);
    float _2129 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2131 = sqrt(_2107);
    float _2133 = _2115 * _2109;
    float _2135 = -_2073;
    float _2137 = fma(_2123, _2103, _2135);
    float _2139 = fma(_2111, _2125, 1.570728778839111328125);
    float _2141 = _2127 * _2109;
    float _2143 = fma(_2137, 0.5, 0.5);
    float _2145 = fma(_2141, -0.5, 0.5);
    float _2147 = _2131 * 0.636619746685028076171875;
    float _2149 = fma(_2133, 0.5, 0.5);
    float _2151 = -_2139;
    float _2153 = fma(_2147, _2151, 1.0);
    float2 _7375 = float2(_2059, _2091);
    float _2155 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7375, float2(0.0), isnan(_7375)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7375, float2(0.0), isnan(_7375)), level(0.0)).x;
    float3 _7386 = float3(_2149, _2145, _2129);
    float _2157 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7386, float3(0.0), isnan(_7386)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7386, float3(0.0), isnan(_7386)), level(0.0)).x;
    float3 _7397 = float3(_2149, _2145, _2129);
    float4 _2160 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7397, float3(0.0), isnan(_7397)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7397, float3(0.0), isnan(_7397)), level(0.0)).xyzw;
    float _2162 = _2160.x;
    float _2164 = _2160.y;
    float _2166 = _2160.z;
    float _2168 = _2160.w;
    float2 _7413 = float2(_2153, _2143);
    float3 _2172 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7413, float2(0.0), isnan(_7413)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7413, float2(0.0), isnan(_7413)), level(0.0)).xyz;
    float _2174 = _2172.x;
    float _2176 = _2172.y;
    float _2178 = _2172.z;
    float _2180 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2182 = int(_2180);
    int _2184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2186 = _2184 != 0;
    out.m_62.x = _297;
    out.m_62.y = _305;
    out.m_62.z = _307;
    out.m_62.w = _333;
    int _2188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2190 = _2188 != 0;
    float _2192 = _2069 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2194 = abs(_1585);
    out.m_64.x = _503;
    out.m_64.y = _509;
    out.m_64.z = _507;
    out.m_64.w = _513;
    int _2196 = abs(_1599);
    float _2198 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2200 = int(_2198);
    int _2202 = abs(_797);
    out.m_66.x = _1445;
    out.m_66.y = _1451;
    out.m_66.z = _1455;
    int _2204 = abs(_1603);
    float _2206 = _2031 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2208 = _551 > 0.5;
    out.m_68.w = _1267;
    float _2210 = -_1203;
    float _2212 = _2210 + 1.0;
    float _2214 = float(uint(_2182));
    float _2216 = trunc(_1071);
    int _2218 = int(_2216);
    out.m_70.x = _1367;
    int _2220 = ~_2182;
    int _2222 = _2220 + 1;
    float _2224 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2206);
    bool _2226 = _2182 == 0;
    out.m_72.x = _1763;
    out.m_72.y = _1761;
    out.m_72.z = _1765;
    float _2228 = float(uint(_2200));
    float _2230 = 1.0 / _2214;
    int _2232 = ~_2200;
    int _2234 = _2232 + 1;
    float _2236 = trunc(_1127);
    int _2238 = int(_2236);
    float _2240 = float(uint(_2218));
    float _2242 = _2149;
    float _2244 = _2212;
    float _2246 = _2115;
    if (_2186)
    {
        float _2248 = in.m_58.x;
        _2242 = _2248;
    }
    float _2250 = _2242;
    int _2252 = ~_2200;
    int _2254 = _2252 + 1;
    float _2256 = fma(_2047, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2224);
    float _2258 = _2250;
    if (!_2186)
    {
        float _2260 = in.m_58.y;
        _2258 = _2260;
    }
    float _2262 = _2258;
    float _2264 = 1.0 / _2228;
    int _2266 = as_type<int>(_2230) + (-2);
    int _2268 = ~_2182;
    int _2270 = _2268 + 1;
    float _2272 = _2230;
    if (_2186)
    {
        _2272 = 1.0;
    }
    float _2274 = _2272;
    float _2276 = as_type<float>(_2266) * _2240;
    float _2278 = _2274;
    if (!_2186)
    {
        _2278 = 1.2345600128173828125;
    }
    float _2280 = _2278;
    float _2282 = exp2(_2192);
    float _2284 = float(uint(_2238));
    int _2286 = as_type<int>(_2264) + (-2);
    float _2288 = trunc(_2276);
    float _2290 = precise::max(_2288, 0.0);
    uint _2293 = uint(_2290);
    float _2295 = as_type<float>(_2286) * _2284;
    float _2297 = _2262 * _2280;
    int _2299 = ~_2200;
    int _2301 = _2299 + 1;
    float _2303 = -_2282;
    float _2305 = _2303 + 1.0;
    float _2307 = trunc(_2295);
    float _2309 = precise::max(_2307, 0.0);
    uint _2311 = uint(_2309);
    float _2313 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2315 = _2270 * int(_2293);
    int _2317 = _2315 + _2218;
    float _2319 = floor(_2297);
    float _2321 = float(uint(_2317));
    int _2323 = _2234 * int(_2311);
    int _2325 = _2323 + _2238;
    float _2327 = as_type<float>(_2266) * _2321;
    float _2329 = float(uint(_2325));
    float _2331 = as_type<float>(_2325);
    if (_2186)
    {
        _2331 = 1.0;
    }
    float _2333 = _2331;
    float _2335 = trunc(_2327);
    float _2337 = precise::max(_2335, 0.0);
    uint _2339 = uint(_2337);
    float _2341 = _2333;
    if (!_2186)
    {
        _2341 = 7.345489978790283203125;
    }
    float _2343 = _2341;
    float _2345 = as_type<float>(_2286) * _2329;
    float _2347 = -_2319;
    float _2349 = _2297 + _2347;
    float _2351 = _2343 * _545;
    float _2353 = trunc(_2345);
    float _2355 = precise::max(_2353, 0.0);
    uint _2357 = uint(_2355);
    float _2359 = floor(_2351);
    int _2361 = int(_2293) + int(_2339);
    float _2363 = float(_2182);
    int _2365 = _2222 * _2361;
    int _2367 = _2365 + _2218;
    int _2369 = int(_2311) + int(_2357);
    float _2371 = float(_2218);
    bool _2373 = uint(_2367) >= uint(_2182);
    bool _2375 = _2371 >= _2363;
    bool _2377 = isnan(_2371);
    bool _2379 = _2375 || _2377;
    bool _2381 = isnan(_2363);
    bool _2383 = _2379 || _2381;
    float _2385 = float(_2383);
    int _2387 = _2301 * _2369;
    int _2389 = _2387 + _2238;
    float _2391 = -_2359;
    float _2393 = _2351 + _2391;
    float _2395 = float(_2200);
    bool _2397 = !_2373;
    int _2399 = _2397 ? 0 : (-1);
    float _2401 = trunc(_2385);
    int _2403 = int(_2401);
    bool _2405 = uint(_2389) >= uint(_2200);
    float _2407 = _2393 * _2363;
    float _2409 = float(_2238);
    int _2411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2413 = _2411 != 0;
    bool _2415 = !_2405;
    int _2417 = _2415 ? 0 : (-1);
    float _2419 = trunc(_2407);
    int _2421 = int(_2419);
    int _2423 = ~_2361;
    int _2425 = _2423 + _2399;
    int _2427 = _2425 + 1;
    bool _2429 = _2409 >= _2395;
    bool _2431 = isnan(_2409);
    bool _2433 = _2429 || _2431;
    bool _2435 = isnan(_2395);
    bool _2437 = _2433 || _2435;
    float _2439 = float(_2437);
    bool _2441 = !_2413;
    int _2443 = _2441 ? 0 : 1;
    int _2445 = ~_2369;
    int _2447 = _2445 + _2417;
    int _2449 = _2447 + 1;
    float _2451 = _2363 * _1165;
    int _2453 = abs(_2443);
    float _2455 = trunc(_2439);
    int _2457 = int(_2455);
    int _2459 = _2182 * _2427;
    int _2461 = _2459 + _2218;
    float _2463 = _2349 * _2395;
    int _2465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2467 = _2465 != 0;
    float _2469 = _2395 * _1165;
    int _2471 = ~_2403;
    int _2473 = _2471 + 1;
    int _2475 = _2473 + 1;
    int _2477 = _2421 * _2453;
    int _2479 = _2477 + _2218;
    bool _2481 = !_2226;
    int _2483 = _2481 ? _2461 : (-1);
    float _2485 = trunc(_2463);
    int _2487 = int(_2485);
    bool _2489 = !_2467;
    int _2491 = _2489 ? 0 : 1;
    bool _2493 = _2200 == 0;
    int _2495 = _2483 * _2475;
    int _2497 = abs(_2491);
    int _2499 = _2200 * _2449;
    int _2501 = _2499 + _2238;
    int _2503 = _2182 + (-1);
    float _2505 = trunc(_2451);
    int _2507 = int(_2505);
    int _2509 = ~_2457;
    int _2511 = _2509 + 1;
    int _2513 = _2511 + 1;
    bool _2515 = !_2493;
    int _2517 = _2515 ? _2501 : (-1);
    int _2519 = _2403 * _2503;
    int _2521 = _2519 + _2495;
    int _2523 = abs(_737);
    int _2525 = _2517 * _2513;
    float _2527 = trunc(_2469);
    int _2529 = int(_2527);
    int _2531 = _2487 * _2497;
    int _2533 = _2531 + _2238;
    int _2535 = _2200 + (-1);
    int _2537 = abs(_793);
    int _2539 = _2521 * _2523;
    bool _2541 = !_2190;
    int _2543 = _2541 ? 0 : 1;
    int _2545 = _2457 * _2535;
    int _2547 = _2545 + _2525;
    int _2549 = _2507 * _2537;
    int _2551 = _2549 + _2539;
    int _2553 = _2547 * _2194;
    int _2555 = abs(_2543);
    int _2557 = _2479 * _2202;
    int _2559 = _2557 + _2551;
    int _2561 = ~_2182;
    int _2563 = _2561 + 1;
    int _2565 = _2529 * _2196;
    int _2567 = _2565 + _2553;
    int _2569 = _2421 * _2555;
    int _2571 = _2569 + _2559;
    int _2573 = abs(_1607);
    float _2575 = float(uint(_2533));
    int _2577 = _2533 * _2204;
    int _2579 = _2577 + _2567;
    float _2581 = float(uint(_2571));
    int _2583 = ~_2182;
    int _2585 = _2583 + 1;
    int _2587 = _2487 * _2573;
    int _2589 = _2587 + _2579;
    float _2591 = float(uint(_2479));
    float _2593 = as_type<float>(_2266) * _2581;
    float _2595 = float(uint(_2589));
    float _2597 = trunc(_2593);
    float _2599 = precise::max(_2597, 0.0);
    uint _2601 = uint(_2599);
    float _2603 = as_type<float>(_2286) * _2595;
    float _2605 = as_type<float>(_2266) * _2591;
    float _2607 = trunc(_2603);
    float _2609 = precise::max(_2607, 0.0);
    uint _2611 = uint(_2609);
    int _2613 = _2563 * int(_2601);
    int _2615 = _2613 + _2571;
    float _2617 = as_type<float>(_2286) * _2575;
    float _2619 = trunc(_2605);
    float _2621 = precise::max(_2619, 0.0);
    uint _2623 = uint(_2621);
    int _2625 = ~_2200;
    int _2627 = _2625 + 1;
    float _2629 = float(uint(_2615));
    int _2631 = _2627 * int(_2611);
    int _2633 = _2631 + _2589;
    float _2635 = as_type<float>(_2266) * _2629;
    float _2637 = trunc(_2617);
    float _2639 = precise::max(_2637, 0.0);
    uint _2641 = uint(_2639);
    float _2643 = float(uint(_2633));
    int _2645 = _2585 * int(_2623);
    int _2647 = _2645 + _2479;
    int _2649 = ~_2200;
    int _2651 = _2649 + 1;
    float _2653 = trunc(_2635);
    float _2655 = precise::max(_2653, 0.0);
    uint _2657 = uint(_2655);
    float _2659 = as_type<float>(_2286) * _2643;
    float _2661 = float(uint(_2647));
    int _2663 = ~_2182;
    int _2665 = _2663 + 1;
    float _2667 = trunc(_2659);
    float _2669 = precise::max(_2667, 0.0);
    uint _2671 = uint(_2669);
    float _2673 = as_type<float>(_2266) * _2661;
    int _2675 = _2651 * int(_2641);
    int _2677 = _2675 + _2533;
    float _2679 = float(uint(_2677));
    float _2681 = trunc(_2673);
    float _2683 = precise::max(_2681, 0.0);
    uint _2685 = uint(_2683);
    int _2687 = int(_2601) + int(_2657);
    float _2689 = as_type<float>(_2286) * _2679;
    int _2691 = ~_2200;
    int _2693 = _2691 + 1;
    int _2695 = _2665 * _2687;
    int _2697 = _2695 + _2571;
    int _2699 = int(_2611) + int(_2671);
    bool _2701 = uint(_2697) >= uint(_2182);
    float _2703 = trunc(_2689);
    float _2705 = precise::max(_2703, 0.0);
    uint _2707 = uint(_2705);
    int _2709 = ~_2182;
    int _2711 = _2709 + 1;
    int _2713 = _2693 * _2699;
    int _2715 = _2713 + _2589;
    bool _2717 = !_2701;
    int _2719 = _2717 ? 0 : (-1);
    int _2721 = int(_2623) + int(_2685);
    bool _2723 = uint(_2715) >= uint(_2200);
    int _2725 = ~_2687;
    int _2727 = _2725 + _2719;
    int _2729 = _2727 + 1;
    int _2731 = _2711 * _2721;
    int _2733 = _2731 + _2479;
    bool _2735 = !_2723;
    int _2737 = _2735 ? 0 : (-1);
    int _2739 = _2182 * _2729;
    int _2741 = _2739 + _2571;
    int _2743 = ~_2699;
    int _2745 = _2743 + _2737;
    int _2747 = _2745 + 1;
    bool _2749 = uint(_2733) >= uint(_2182);
    bool _2751 = !_2226;
    int _2753 = _2751 ? _2741 : (-1);
    int _2755 = _2200 * _2747;
    int _2757 = _2755 + _2589;
    bool _2759 = !_2749;
    int _2761 = _2759 ? 0 : (-1);
    int _2763 = _2753 & 3;
    bool _2765 = _2763 != 0;
    float _2767 = -_2155;
    float _2769 = _2767 + 1.0;
    bool _2771 = !_2493;
    int _2773 = _2771 ? _2757 : (-1);
    float _2775 = _2313 * _2157;
    int _2777 = ~_2721;
    int _2779 = _2777 + _2761;
    int _2781 = _2779 + 1;
    int _2783 = _2773 >> 31;
    int _2785 = _2753 >> 31;
    int _2787 = _2182 * _2781;
    int _2789 = _2787 + _2479;
    int _2791 = _2783 & 3;
    int _2793 = _2753 & 3;
    bool _2795 = _2793 != 0;
    int _2797 = _2785 & 3;
    bool _2799 = _2763 != 3;
    int _2801 = _2773 + _2791;
    int _2803 = _2795 ? 0 : 1;
    int _2805 = _2753 + _2797;
    bool _2807 = uint(_2763) >= 2u;
    int _2809 = _2801 >> 2;
    int _2811 = _2805 >> 2;
    int _2813 = _2807 ? 0 : 1;
    int _2815 = _2809 << 4;
    int _2817 = _2815 + 512;
    int _2819 = int(_2641) + int(_2707);
    int _2821 = _2811 << 4;
    int _2823 = _2821 + 368;
    int _2825 = ~_2813;
    int _2827 = _2825 + 1;
    int _2829 = _2827 + 1;
    int _2831 = _2254 * _2819;
    int _2833 = _2831 + _2533;
    bool _2835 = uint(_2763) > 1u;
    int _2837 = _2829;
    if (_2799)
    {
        int _2839 = ~_2813;
        int _2841 = _2839 + 1;
        _2837 = _2841;
    }
    int _2843 = _2837;
    uint _2845 = uint(int(uint(_2817) >> uint(2)));
    uint _2847 = uint(int(uint(int(_2845)) >> uint(2)));
    int _2849 = int(_2845) & 3;
    float _2851 = (*spvDescriptorSet0.vp_c9)._m0[int(_2847)][_2849];
    int _2853 = int(_2845) + 1;
    uint _2855 = uint(int(uint(_2853) >> uint(2)));
    int _2857 = _2853 & 3;
    float _2859 = (*spvDescriptorSet0.vp_c9)._m0[int(_2855)][_2857];
    bool _2861 = _2763 != 3;
    int _2863 = ~_2803;
    int _2865 = _2863 + 1;
    int _2867 = _2865 + 1;
    bool _2869 = !_2226;
    int _2871 = _2869 ? _2789 : (-1);
    bool _2873 = !_2765;
    int _2875 = _2873 ? 0 : 1;
    uint _2877 = uint(int(uint(_2823) >> uint(2)));
    uint _2879 = uint(int(uint(int(_2877)) >> uint(2)));
    int _2881 = int(_2877) & 3;
    float _2883 = (*spvDescriptorSet0.vp_c9)._m0[int(_2879)][_2881];
    int _2885 = int(_2877) + 1;
    uint _2887 = uint(int(uint(_2885) >> uint(2)));
    int _2889 = _2885 & 3;
    float _2891 = (*spvDescriptorSet0.vp_c9)._m0[int(_2887)][_2889];
    int _2893 = _2867;
    if (!_2835)
    {
        int _2895 = ~_2803;
        int _2897 = _2895 + 1;
        _2893 = _2897;
    }
    int _2899 = _2893;
    bool _2901 = uint(_2833) >= uint(_2200);
    int _2903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2905 = _2903 != 0;
    int _2907 = _2773 & 3;
    bool _2909 = _2907 != 0;
    int _2911 = _2817 + 8;
    uint _2913 = uint(int(uint(_2911) >> uint(2)));
    uint _2915 = uint(int(uint(int(_2913)) >> uint(2)));
    int _2917 = int(_2913) & 3;
    float _2919 = (*spvDescriptorSet0.vp_c9)._m0[int(_2915)][_2917];
    int _2921 = int(_2913) + 1;
    uint _2923 = uint(int(uint(_2921) >> uint(2)));
    int _2925 = _2921 & 3;
    float _2927 = (*spvDescriptorSet0.vp_c9)._m0[int(_2923)][_2925];
    int _2929 = _2773 & 3;
    bool _2931 = _2929 != 0;
    bool _2933 = !_2905;
    int _2935 = _2933 ? 0 : 1;
    bool _2937 = uint(_2929) > 1u;
    bool _2939 = !_2901;
    int _2941 = _2939 ? 0 : (-1);
    int _2943 = _2823 + 8;
    uint _2945 = uint(int(uint(_2943) >> uint(2)));
    uint _2947 = uint(int(uint(int(_2945)) >> uint(2)));
    int _2949 = int(_2945) & 3;
    float _2951 = (*spvDescriptorSet0.vp_c9)._m0[int(_2947)][_2949];
    int _2953 = int(_2945) + 1;
    uint _2955 = uint(int(uint(_2953) >> uint(2)));
    int _2957 = _2953 & 3;
    float _2959 = (*spvDescriptorSet0.vp_c9)._m0[int(_2955)][_2957];
    bool _2961 = _2929 != 3;
    int _2963 = _2909 ? 0 : 1;
    bool _2965 = !_2861;
    int _2967 = _2965 ? 0 : (-1);
    bool _2969 = uint(_2929) >= 2u;
    int _2971 = ~_2963;
    int _2973 = _2971 + 1;
    int _2975 = _2973 + 1;
    int _2977 = ~_2819;
    int _2979 = _2977 + _2941;
    int _2981 = _2979 + 1;
    int _2983 = _2975;
    if (!_2937)
    {
        int _2985 = ~_2963;
        int _2987 = _2985 + 1;
        _2983 = _2987;
    }
    int _2989 = _2983;
    int _2991 = _2969 ? 0 : 1;
    bool _2993 = _2929 != 3;
    bool _2995 = _545 > 0.5;
    int _2997 = _2200 * _2981;
    int _2999 = _2997 + _2533;
    int _3001 = abs(_2989);
    int _3003 = ~_2991;
    int _3005 = _3003 + 1;
    int _3007 = _3005 + 1;
    int _3009 = abs(_2899);
    int _3011 = _3007;
    if (_2961)
    {
        int _3013 = ~_2991;
        int _3015 = _3013 + 1;
        _3011 = _3015;
    }
    int _3017 = _3011;
    bool _3019 = _547 > 0.5;
    bool _3021 = !_2493;
    int _3023 = _3021 ? _2999 : (-1);
    float _3025 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3027 = int(_3025);
    bool _3029 = _549 > 0.5;
    int _3031 = ~_3001;
    int _3033 = _3031 + 1;
    int _3035 = _3033 + 1;
    bool _3037 = !_2931;
    int _3039 = _3037 ? 0 : 1;
    int _3041 = ~_3009;
    int _3043 = _3041 + 1;
    int _3045 = _3043 + 1;
    int _3047 = _3035 * as_type<int>(_2859);
    int _3049 = abs(_2875);
    int _3051 = abs(_3039);
    int _3053 = _3045 * as_type<int>(_2891);
    int _3055 = abs(_2843);
    float _3057 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3059 = int(_3057);
    int _3061 = abs(_2967);
    int _3063 = abs(_3017);
    int _3065 = ~_3049;
    int _3067 = _3065 + 1;
    int _3069 = _3067 + 1;
    int _3071 = ~_3051;
    int _3073 = _3071 + 1;
    int _3075 = _3073 + 1;
    int _3077 = _3069 * as_type<int>(_2883);
    int _3079 = _3077 + _3053;
    float _3081 = -_191;
    int _3083 = _2208 ? as_type<int>(_3081) : as_type<int>(_191);
    int _3085 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3087 = _3085 != 0;
    int _3089 = _3075 * as_type<int>(_2851);
    int _3091 = _3089 + _3047;
    int _3093 = ~_3055;
    int _3095 = _3093 + 1;
    int _3097 = _3095 + 1;
    int _3099 = ~_3063;
    int _3101 = _3099 + 1;
    int _3103 = _3101 + 1;
    bool _3105 = !_3087;
    int _3107 = _3105 ? 0 : 1;
    int _3109 = _3097 * as_type<int>(_2951);
    int _3111 = _3109 + _3079;
    int _3113 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3115 = _3113 != 0;
    int _3117 = _3103 * as_type<int>(_2919);
    int _3119 = _3117 + _3091;
    int _3121 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3123 = _3121 != 0;
    int _3125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3127 = _3125 != 0;
    bool _3129 = !_2993;
    int _3131 = _3129 ? 0 : (-1);
    int _3133 = ~_3061;
    int _3135 = _3133 + 1;
    int _3137 = _3135 + 1;
    int _3139 = abs(_3107);
    int _3141 = abs(_3131);
    int _3143 = _3137 * as_type<int>(_2959);
    int _3145 = _3143 + _3111;
    float _3147 = float(uint(_3027));
    float _3149 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3151 = float(uint(_3059));
    int _3153 = ~_3139;
    int _3155 = _3153 + 1;
    int _3157 = _3155 + 1;
    float _3159 = 1.0 / _3147;
    int _3161 = ~_3141;
    int _3163 = _3161 + 1;
    int _3165 = _3163 + 1;
    float _3167 = -_1389;
    float _3169 = fma(_3167, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3149);
    int _3171 = abs(_2935);
    int _3173 = _3145 * _3157;
    int _3175 = abs(_3027);
    int _3177 = _3165 * as_type<int>(_2927);
    int _3179 = _3177 + _3119;
    int _3181 = ~_3171;
    int _3183 = _3181 + 1;
    int _3185 = _3183 + 1;
    float _3187 = 1.0 / _3151;
    float _3189 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3191 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3193 = float(uint(_3175));
    int _3195 = abs(_3059);
    float _3197 = -_1389;
    float _3199 = fma(_3197, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3191);
    int _3201 = ~_3175;
    int _3203 = _3201 + 1;
    float _3205 = 1.0 / _3193;
    float _3207 = -_1389;
    float _3209 = fma(_3207, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3189);
    int _3211 = _3179 * _3185;
    float _3213 = float(uint(_3195));
    int _3215 = _2871 * _3139;
    int _3217 = _3215 + _3173;
    float _3219 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3209);
    int _3221 = _3023 * _3171;
    int _3223 = _3221 + _3211;
    int _3225 = as_type<int>(_3159) + (-2);
    float _3227 = 1.0 / _3213;
    float _3229 = float(uint(_3217));
    float _3231 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3169);
    int _3233 = as_type<int>(_3187) + (-2);
    float _3235 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3199);
    float _3237 = float(uint(_3223));
    float _3239 = _1413 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3241 = _1413 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3243 = abs(_3217);
    float _3245 = as_type<float>(_3225) * _3229;
    float _3247 = as_type<float>(_3233) * _3237;
    float _3249 = _1413 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3251 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3239);
    float _3253 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3241);
    int _3255 = as_type<int>(_3205) + (-2);
    float _3257 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3249);
    float _3259 = float(uint(_3243));
    float _3261 = trunc(_3247);
    float _3263 = precise::max(_3261, 0.0);
    uint _3265 = uint(_3263);
    float _3267 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3269 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3271 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3273 = as_type<float>(_3255) * _3259;
    float _3275 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3267);
    float _3277 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3269);
    float _3279 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3271);
    float _3281 = abs(_1707);
    float _3283 = log2(_3281);
    float _3285 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3275);
    int _3287 = ~_3059;
    int _3289 = _3287 + 1;
    float _3291 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3277);
    float _3293 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3279);
    int _3295 = abs(_3223);
    float _3297 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3251);
    int _3299 = as_type<int>(_3227) + (-2);
    float _3301 = trunc(_3245);
    float _3303 = precise::max(_3301, 0.0);
    uint _3305 = uint(_3303);
    int _3307 = _3289 * int(_3265);
    int _3309 = _3307 + _3223;
    int _3311 = ~_3027;
    int _3313 = _3311 + 1;
    float _3315 = float(uint(_3309));
    float _3317 = trunc(_3273);
    float _3319 = precise::max(_3317, 0.0);
    uint _3321 = uint(_3319);
    float _3323 = float(uint(_3295));
    float _3325 = _3283 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3327 = as_type<float>(_3233) * _3315;
    float _3329 = as_type<float>(_3299) * _3323;
    int _3331 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3333 = _3331 != 0;
    int _3335 = _3313 * int(_3305);
    int _3337 = _3335 + _3217;
    float _3339 = exp2(_3325);
    bool _3341 = !_3115;
    float _3343 = _3341 ? _191 : as_type<float>(_3083);
    bool _3345 = _3059 == 0;
    float _3347 = float(uint(_3337));
    int _3349 = _3203 * int(_3321);
    int _3351 = _3349 + _3243;
    float _3353 = trunc(_3329);
    float _3355 = precise::max(_3353, 0.0);
    uint _3357 = uint(_3355);
    bool _3359 = _1707 <= 8000.0;
    bool _3361 = isnan(_1707);
    bool _3363 = _3359 || _3361;
    bool _3365 = isnan(8000.0);
    bool _3367 = _3363 || _3365;
    float _3369 = float(_3367);
    float _3371 = float(uint(_3351));
    float _3373 = as_type<float>(_3225) * _3347;
    float _3375 = -_191;
    int _3377 = _3019 ? as_type<int>(_3375) : as_type<int>(_191);
    float _3379 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3253);
    float _3381 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3257);
    float _3383 = as_type<float>(_3255) * _3371;
    int _3385 = ~_3195;
    int _3387 = _3385 + 1;
    float _3389 = fma(_3339, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3391 = precise::clamp(_3389, 0.0, 1.0);
    bool _3393 = !_3123;
    float _3395 = _3393 ? _191 : as_type<float>(_3377);
    float _3397 = trunc(_3373);
    float _3399 = precise::max(_3397, 0.0);
    uint _3401 = uint(_3399);
    float _3403 = -_187;
    int _3405 = _2995 ? as_type<int>(_3403) : as_type<int>(_187);
    float _3407 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3409 = -_187;
    int _3411 = _3029 ? as_type<int>(_3409) : as_type<int>(_187);
    int _3413 = _3387 * int(_3357);
    int _3415 = _3413 + _3295;
    bool _3417 = !_3333;
    float _3419 = _3417 ? _187 : as_type<float>(_3405);
    float _3421 = _3407 * _3219;
    bool _3423 = !_3127;
    float _3425 = _3423 ? _187 : as_type<float>(_3411);
    float _3427 = trunc(_3327);
    float _3429 = precise::max(_3427, 0.0);
    uint _3431 = uint(_3429);
    float _3433 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3435 = float(uint(_3415));
    float _3437 = _3407 * _3231;
    float _3439 = fma(_3433, _3297, _3421);
    out.m_74.x = _3297;
    out.m_74.y = _3379;
    out.m_74.z = _3381;
    float _3441 = as_type<float>(_3299) * _3435;
    float _3443 = trunc(_3383);
    float _3445 = precise::max(_3443, 0.0);
    uint _3447 = uint(_3445);
    float _3449 = fma(_3391, -2.0, 3.0);
    float _3451 = _3391 * _3391;
    float _3453 = _3407 * _3235;
    float _3455 = fma(_3433, _3379, _3437);
    int _3457 = int(_3305) + int(_3401);
    float _3459 = _3451 * _3449;
    float _3461 = fma(_3433, _3381, _3453);
    float _3463 = trunc(_3441);
    float _3465 = precise::max(_3463, 0.0);
    uint _3467 = uint(_3465);
    int _3469 = int(_3265) + int(_3431);
    float _3471 = -_3459;
    float _3473 = _3471 + 1.0;
    int _3475 = ~_3027;
    int _3477 = _3475 + 1;
    int _3479 = ~_3059;
    int _3481 = _3479 + 1;
    float _3483 = fma(_3473, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3459);
    int _3485 = ~_3175;
    int _3487 = _3485 + 1;
    int _3489 = _3477 * _3457;
    int _3491 = _3489 + _3217;
    int _3493 = int(_3321) + int(_3447);
    int _3495 = _3481 * _3469;
    int _3497 = _3495 + _3223;
    int _3499 = ~_3195;
    int _3501 = _3499 + 1;
    float _3503 = _3369 * _3483;
    bool _3505 = uint(_3491) >= uint(_3027);
    int _3507 = _3487 * _3493;
    int _3509 = _3507 + _3243;
    bool _3511 = uint(_3497) >= uint(_3059);
    float _3513 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3515 = int(_3357) + int(_3467);
    float _3517 = _3503 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _3519 = !_3505;
    int _3521 = _3519 ? 0 : (-1);
    bool _3523 = !_3511;
    int _3525 = _3523 ? 0 : (-1);
    int _3527 = _3501 * _3515;
    int _3529 = _3527 + _3295;
    bool _3531 = uint(_3509) >= uint(_3175);
    float _3533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3535 = ~_3457;
    int _3537 = _3535 + _3521;
    int _3539 = _3537 + 1;
    float _3541 = _2769 * _3517;
    float _3543 = precise::clamp(_3541, 0.0, 1.0);
    bool _3545 = uint(_3529) >= uint(_3195);
    int _3547 = ~_3469;
    int _3549 = _3547 + _3525;
    int _3551 = _3549 + 1;
    int _3553 = _3027 * _3539;
    int _3555 = _3553 + _3217;
    int _3557 = _3223 ^ _3059;
    float _3559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3561 = _3217 ^ _3027;
    int _3563 = _3059 * _3551;
    int _3565 = _3563 + _3223;
    bool _3567 = _3027 == 0;
    float _3569 = _3513 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3571 = _3027 == 0;
    bool _3573 = !_3545;
    int _3575 = _3573 ? 0 : (-1);
    uint _3577 = uint(int(uint(_3557) >> uint(31)));
    bool _3579 = !_3531;
    int _3581 = _3579 ? 0 : (-1);
    uint _3583 = uint(int(uint(_3561) >> uint(31)));
    bool _3585 = _3059 == 0;
    float _3587 = _3559 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3589 = ~_3575;
    int _3591 = _3515 + _3589;
    int _3593 = _3591 + 1;
    int _3595 = ~int(_3577);
    int _3597 = _3595 + 1;
    float _3599 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3601 = ~_3581;
    int _3603 = _3493 + _3601;
    int _3605 = _3603 + 1;
    int _3607 = ~int(_3583);
    int _3609 = _3607 + 1;
    int _3611 = _3593 ^ _3597;
    float _3613 = fma(_3407, _3407, 1.0);
    int _3615 = _3605 ^ _3609;
    bool _3617 = !_3567;
    int _3619 = _3617 ? _3555 : (-1);
    int _3621 = ~_3609;
    int _3623 = _3621 + _3615;
    int _3625 = _3623 + 1;
    float _3627 = rsqrt(_3613);
    bool _3629 = !_3345;
    int _3631 = _3629 ? _3565 : (-1);
    float _3633 = float(_3619);
    int _3635 = ~_3597;
    int _3637 = _3635 + _3611;
    int _3639 = _3637 + 1;
    float _3641 = float(_3631);
    float _3643 = fma(_3569, _3633, _643);
    bool _3645 = !_3571;
    int _3647 = _3645 ? _3625 : (-1);
    float _3649 = _3419 + 0.5;
    float _3651 = _2178 * _2775;
    float _3653 = fma(_3587, _3641, _1183);
    bool _3655 = !_3585;
    int _3657 = _3655 ? _3639 : (-1);
    float _3659 = fma(_3569, _3649, _3643);
    float _3661 = float(_3647);
    float _3663 = _3533 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3665 = float(_3657);
    float _3667 = _3599 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3669 = _3395 + (-0.5);
    float _3671 = -_1097;
    float _3673 = fma(_3663, _3661, _3671);
    float _3675 = _3407 * _3627;
    float _3677 = -_1205;
    float _3679 = fma(_3667, _3665, _3677);
    float _3681 = _3425 + 0.5;
    float _3683 = -_3663;
    float _3685 = fma(_3683, _3669, _3673);
    float _3687 = -_3291;
    float _3689 = _3675 * _3687;
    float _3691 = _3343 + (-0.5);
    float _3693 = fma(_3587, _3681, _3653);
    float _3695 = -_3285;
    float _3697 = _3675 * _3695;
    float _3699 = fma(_3627, _3231, _3689);
    float _3701 = -_1197;
    float _3703 = _3701 + 1.0;
    float _3705 = -_3293;
    float _3707 = _3675 * _3705;
    float _3709 = -_3667;
    float _3711 = fma(_3709, _3691, _3679);
    float _3713 = fma(_3627, _3219, _3697);
    float _3715 = -_3703;
    float _3717 = fma(_3419, _3715, _3659);
    float _3719 = fma(_3627, _3235, _3707);
    float _3721 = in.m_76.x;
    float _3723 = -_1143;
    float _3725 = _3723 + 1.0;
    float _3727 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2256);
    float _3729 = -_1189;
    float _3731 = _3729 + 1.0;
    out.m_78.x = _3713;
    out.m_78.y = _3699;
    out.m_78.z = _3719;
    float _3733 = fma(_3395, _3725, _3685);
    float _3735 = _2071 * 0.5;
    float _3737 = _3727 + _2071;
    float _3739 = _2115 + _2071;
    float _3741 = -_3731;
    float _3743 = fma(_3425, _3741, _3693);
    float _3745 = fma(_2127, -0.5, _3735);
    float _3747 = _3285 + _3439;
    float _3749 = _3737 * 0.5;
    float _3751 = _3739 * 0.5;
    float _3753 = fma(_3343, _2212, _3711);
    float _3755 = -_2313;
    float _3757 = _3755 + 1.0;
    float _3759 = _3291 + _3455;
    float _3761 = _3293 + _3461;
    float _3763 = fma(_2168, _3651, _2166);
    float _3765 = -_3543;
    float _3767 = fma(_3765, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3769 = _2168 * _2775;
    out.m_80.x = _3751;
    out.m_80.y = _3745;
    out.m_80.z = _3749;
    out.m_80.w = _2071;
    bool _3771 = _1849 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3773 = isnan(_1849);
    bool _3775 = _3771 || _3773;
    bool _3777 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3779 = _3775 || _3777;
    float _3781 = _3767 * _3721;
    float _3783 = fma(_2174, _3769, _2162);
    float _3785 = fma(_2176, _3769, _2164);
    float _3787 = _2168 * _3757;
    float _3789 = _3781 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_82.x = _3717;
    out.m_82.y = _3733;
    out.m_82.z = _3743;
    out.m_82.w = _3753;
    out.m_84.x = _3789;
    float _3791 = _3711;
    float _3793 = _3719;
    float _3795 = _3769;
    float _3797 = _3757;
    if (!_3779)
    {
        _2244 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3799 = _2244;
    out.m_86.x = _3783;
    out.m_86.y = _3785;
    out.m_86.z = _3763;
    out.m_86.w = _3787;
    float _3801 = _3799;
    float _3803 = _3799;
    if (!_3779)
    {
        _3791 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3805 = _3791;
    float _3807 = _3805;
    float _3809 = _3805;
    if (!_3779)
    {
        _3793 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3811 = _3793;
    out.m_88.x = _3747;
    out.m_88.y = _3759;
    out.m_88.z = _3761;
    float _3813 = _3811;
    float _3815 = _3811;
    if (!_3779)
    {
        _3795 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3817 = _3795;
    float _3819 = _3817;
    float _3821 = _3817;
    if (!_3779)
    {
        _3797 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3823 = _3797;
    out.gl_Position.x = _2115;
    out.gl_Position.y = _2127;
    out.gl_Position.z = _3727;
    out.gl_Position.w = _2071;
    float _3825 = _1825 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3827 = _3823;
    float _3829 = _3823;
    if (!_3779)
    {
        _2246 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3831 = _2246;
    bool _3833 = !_3779;
    float _3835 = _3831;
    float _3837 = _3831;
    if (!_3833)
    {
        bool _3839 = _1849 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3841 = isnan(_1849);
        bool _3843 = _3839 || _3841;
        bool _3845 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3847 = _3843 || _3845;
        if (!_3847)
        {
            float _3849 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3851 = _1849 + _3849;
            float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3855 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3853;
            float _3857 = 1.0 / _3855;
            float _3859 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3861 = _3859 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3863 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3865 = _3863 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3867 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3869 = _3867 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3871 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3873 = _3871 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3875 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3877 = _3875 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3879 = _3851 * _3857;
            float _3881 = precise::clamp(_3879, 0.0, 1.0);
            float _3883 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3885 = _3883 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3887 = fma(_3881, _3861, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3889 = fma(_3881, _3885, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3891 = fma(_3881, _3865, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3893 = fma(_3881, _3869, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3895 = fma(_3881, _3873, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3897 = fma(_3881, _3877, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3837 = _3889;
            _3821 = _3895;
            _3803 = _3887;
            _3815 = _3893;
            _3809 = _3891;
            _3829 = _3897;
            _3899 = true;
        }
        else
        {
            bool _3901 = _1849 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3903 = isnan(_1849);
            bool _3905 = _3901 || _3903;
            bool _3907 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3909 = _3905 || _3907;
            if (!_3909)
            {
                _3801 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3911 = _3801;
            _3803 = _3911;
            if (!_3909)
            {
                _3835 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3913 = _3835;
            _3837 = _3913;
            if (!_3909)
            {
                _3807 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3915 = _3807;
            _3809 = _3915;
            if (!_3909)
            {
                _3813 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3917 = _3813;
            _3815 = _3917;
            if (!_3909)
            {
                _3819 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3919 = _3819;
            _3821 = _3919;
            if (!_3909)
            {
                _3827 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3921 = _3827;
            bool _3923 = !_3909;
            _3829 = _3921;
            if (!_3923)
            {
                bool _3925 = _1849 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3927 = isnan(_1849);
                bool _3929 = _3925 || _3927;
                bool _3931 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3933 = _3929 || _3931;
                if (!_3933)
                {
                    float _3935 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3937 = _1849 + _3935;
                    float _3939 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3941 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3939;
                    float _3943 = 1.0 / _3941;
                    float _3945 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3947 = _3945 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3949 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3951 = _3949 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3953 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3955 = _3953 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3957 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3959 = _3957 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3961 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3963 = _3961 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3965 = _3937 * _3943;
                    float _3967 = precise::clamp(_3965, 0.0, 1.0);
                    float _3969 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3971 = _3969 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3973 = fma(_3967, _3947, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3975 = fma(_3967, _3971, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3977 = fma(_3967, _3951, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3979 = fma(_3967, _3955, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3981 = fma(_3967, _3959, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3983 = fma(_3967, _3963, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3837 = _3975;
                    _3821 = _3981;
                    _3803 = _3973;
                    _3815 = _3979;
                    _3809 = _3977;
                    _3829 = _3983;
                    _3899 = true;
                }
                else
                {
                    _3837 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3821 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3803 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3815 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3809 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3829 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3899 = false;
    float _3985 = _3837;
    float _3987 = _3821;
    float _3989 = _3803;
    float _3991 = _3815;
    float _3993 = _3809;
    float _3995 = _3829;
    float _3997 = fma(_3759, -0.5, 0.5);
    float _3999 = precise::clamp(_3997, 0.0, 1.0);
    float _4001 = -_3985;
    float _4003 = _4001 + _3987;
    float _4005 = _3825 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4007 = -_3989;
    float _4009 = _4007 + _3991;
    float _4011 = fma(_3999, _4003, _3985);
    out.m_90.x = 0.0;
    float _4013 = -_3993;
    float _4015 = _4013 + _3995;
    float _4017 = fma(_3999, _4009, _3989);
    float _4019 = _4011 * 0.586610972881317138671875;
    out.m_49.x = _4005;
    bool _4021 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4023 = fma(_3999, _4015, _3993);
    float _4025 = fma(_4017, 0.298911988735198974609375, _4019);
    bool _4027 = _1825 > 0.0;
    bool _4029 = isnan(_1825);
    bool _4031 = _4027 || _4029;
    bool _4033 = isnan(0.0);
    bool _4035 = _4031 || _4033;
    float _4037 = fma(_4023, 0.114477999508380889892578125, _4025);
    float _4039 = -_4037;
    float _4041 = _4017 + _4039;
    float _4043 = -_4037;
    float _4045 = _4011 + _4043;
    float _4047 = -_4037;
    float _4049 = _4023 + _4047;
    float _4051 = fma(_4041, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4037);
    float _4053 = fma(_4045, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4037);
    float _4055 = fma(_4049, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4037);
    bool _4057 = !_4021;
    if (!_4057)
    {
        float _4059 = -_1761;
        float _4061 = _4059 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4063 = -_1763;
        float _4065 = _4063 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4067 = -_1765;
        float _4069 = _4067 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4071 = _4061 * _4061;
        float _4073 = fma(_4065, _4065, _4071);
        float _4075 = fma(_4069, _4069, _4073);
        float _4077 = sqrt(_4075);
        float _4079 = rsqrt(_4075);
        float _4081 = -_4077;
        float _4083 = _4081 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4085 = _4083 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4087 = precise::clamp(_4085, 0.0, 1.0);
        float _4089 = _4065 * _4079;
        float _4091 = _4061 * _4079;
        float _4093 = abs(_4087);
        float _4095 = log2(_4093);
        float _4097 = _4069 * _4079;
        float _4099 = _4089 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4101 = _3759 * _4091;
        float _4103 = -_4091;
        float _4105 = -_4099;
        float _4107 = fma(_4103, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4105);
        float _4109 = fma(_3747, _4089, _4101);
        float _4111 = -_4097;
        float _4113 = fma(_4111, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4107);
        float _4115 = fma(_3761, _4097, _4109);
        float _4117 = precise::clamp(_4115, 0.0, 1.0);
        float _4119 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4121 = _4113 + _4119;
        float _4123 = _4095 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4125 = _4121 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4127 = precise::clamp(_4125, 0.0, 1.0);
        float _4129 = exp2(_4123);
        float _4131 = _4129 * _4127;
        float _4133 = _4117 * _4131;
        float _4135 = _4133 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4137 = _4133 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4139 = _4133 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _4135;
        out.m_90.y = _4137;
        out.m_90.z = _4139;
    }
    out.m_68.x = _4051;
    out.m_68.y = _4053;
    out.m_68.z = _4055;
    if (_4035)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _4141 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4141;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3899 = false;
    bool _535 = false;
    bool _355 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_46.w;
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
        out.m_49.x = 0.0;
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
        float _4198 = as_type<float>(_125);
        out.gl_Position.z = _4198;
    }
    if (!_113)
    {
        return out;
    }
    float _129 = in.m_51.w;
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
        out.m_49.x = 0.0;
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
        float _4268 = as_type<float>(_163);
        out.gl_Position.z = _4268;
    }
    if (_155)
    {
        return out;
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _169 = in.m_56.x;
    float _171 = in.m_56.y;
    int _173 = as_type<int>(_165) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_165) & 2;
    bool _179 = _177 != 0;
    float _181 = _169 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _183 = _171 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _185 = !_175;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_179;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_167;
    float _211;
    if (!_193)
    {
        float _195 = in.m_58.x;
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _211 = _209;
        _213 = true;
    }
    else
    {
        float _215 = float(_109);
        float _217 = 1.0 / _215;
        float _219 = _143 * _217;
        _211 = _219;
    }
    _213 = false;
    float _221 = _211;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _225 = _221 + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _229 = _227 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _231 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _233 = isnan(_221);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _239 = _235 || _237;
    float _241 = float(_239);
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _245 = _243 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _247 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _249 = isnan(_221);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _259;
    bool _263 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _265 = isnan(_221);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = 1.0 / _229;
    float _277 = -_241;
    float _279 = _277 + 1.0;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _283 = _257 * _279;
    float _285 = -_257;
    float _287 = _285 + 1.0;
    float _289 = 1.0 / _245;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _297 = _291 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _299 = _261 * _275;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _305 = _293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _307 = _295 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _309 = fma(_299, _225, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _311 = _303 * _289;
    float _313 = _309 * _283;
    float _315 = -_273;
    float _317 = _315 + 1.0;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _321 = _221 + _319;
    float _323 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[115].x, _313);
    float _325 = _241 * _317;
    float _327 = fma(_311, _321, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _329 = fma(_327, _325, _323);
    float _331 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[117].x, _329);
    float _333 = _331 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _335 = !_281;
    float _353;
    if (!_335)
    {
        float _337 = in.m_58.x;
        float _339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _341 = _337 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _343 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[11].w, _143);
        float _345 = _343 * _339;
        float _347 = floor(_345);
        float _349 = -_347;
        float _351 = _345 + _349;
        _353 = _351;
        _355 = true;
    }
    else
    {
        float _357 = float(_109);
        float _359 = 1.0 / _357;
        float _361 = _143 * _359;
        _353 = _361;
    }
    _355 = false;
    float _363 = _353;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _367 = _363 + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _377 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _379 = isnan(_363);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _393 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _395 = isnan(_363);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = 1.0 / _371;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _407;
    float _411 = -_387;
    float _413 = _411 + 1.0;
    bool _415 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _417 = isnan(_363);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    bool _427 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _429 = 1.0 / _375;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _433 = 1.0 / _391;
    float _435 = _409 * _405;
    float _437 = -_403;
    float _439 = _437 + 1.0;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _443 = _441 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _445 = _403 * _413;
    float _447 = fma(_435, _367, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _449 = _425 * _439;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _451;
    float _455 = _443 * _429;
    bool _457 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _459 = isnan(_363);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _471 = _363 + _469;
    float _473 = _447 * _449;
    float _475 = -_425;
    float _477 = _475 + 1.0;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _481 = _363 + _479;
    float _483 = fma(_455, _471, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _485 = -_467;
    float _487 = _485 + 1.0;
    float _489 = _453 * _433;
    float _491 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[131].x, _473);
    float _493 = _387 * _487;
    float _495 = fma(_489, _481, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _497 = fma(_483, _445, _491);
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _503 = _431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _505 = fma(_495, _493, _497);
    float _507 = _499 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _509 = _501 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _511 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[134].x, _505);
    float _513 = _511 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _515 = !_427;
    float _533;
    if (!_515)
    {
        float _517 = in.m_58.x;
        float _519 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _521 = _517 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _523 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[14].x, _143);
        float _525 = _523 * _519;
        float _527 = floor(_525);
        float _529 = -_527;
        float _531 = _525 + _529;
        _533 = _531;
        _535 = true;
    }
    else
    {
        float _537 = float(_109);
        float _539 = 1.0 / _537;
        float _541 = _143 * _539;
        _533 = _541;
    }
    _535 = false;
    float _543 = _533;
    float _545 = in.m_58.x;
    float _547 = in.m_58.y;
    float _549 = in.m_58.z;
    float _551 = in.m_58.w;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _555 = _543 + _553;
    float _557 = in.m_46.x;
    float _559 = in.m_46.y;
    float _561 = in.m_46.z;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _571 = 1.0 / _565;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _581 = _543 + _579;
    float _583 = _183 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _585 = 1.0 / _569;
    float _587 = _545 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _593 = 1.0 / _575;
    float _595 = -_577;
    float _597 = fma(_587, 2.0, _595);
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _605 = _547 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _607 = _559 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _609 = 1.0 / _603;
    float _611 = fma(_605, -2.0, _599);
    float _613 = _559 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _615 = fma(_557, (*spvDescriptorSet0.vp_c10)._m0[5].x, _607);
    float _617 = _559 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _623;
    float _627 = 1.0 / _591;
    float _629 = fma(_557, (*spvDescriptorSet0.vp_c10)._m0[6].x, _617);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _635 = _625 * _593;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _641 = -_143;
    float _643 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[76].x, _597);
    float _645 = 1.0 / _621;
    float _647 = fma(_557, (*spvDescriptorSet0.vp_c10)._m0[4].x, _613);
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _649;
    int _653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _655 = _653 != 0;
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _659 = _657 != 0;
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _663 = _661 != 0;
    float _665 = fma(_635, _581, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _667 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _669 = isnan(_543);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _679;
    float _683 = _651 * _585;
    float _685 = _545 * 2.0;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _691 = _681 * _609;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _697 = 1.0 / _633;
    float _699 = _689 * _571;
    float _701 = _545 + _547;
    float _703 = _695 * _645;
    float _705 = _547 * 2.0;
    float _707 = _701 + (-1.0);
    float _709 = floor(_685);
    float _711 = _639 * _627;
    float _713 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _715 = _549 + _547;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _717;
    float _721 = fma(_699, _555, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _723 = _715 + (-1.0);
    float _725 = floor(_705);
    float _727 = _549 * 2.0;
    float _729 = _719 * _697;
    float _731 = _549 + _545;
    float _733 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _735 = !_659;
    int _737 = _735 ? 0 : 1;
    float _739 = _731 + (-1.0);
    float _741 = floor(_727);
    bool _743 = _709 > 0.0;
    bool _745 = _709 >= 0.0;
    bool _747 = isnan(_709);
    bool _749 = _745 || _747;
    bool _751 = isnan(0.0);
    bool _753 = _749 || _751;
    float _755 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _757 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _759 = isnan(_543);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    int _769 = _753 ? 0 : 1;
    float _771 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _773 = int(_771);
    bool _775 = _725 > 0.0;
    float _777 = -_767;
    float _779 = _777 + 1.0;
    bool _781 = _725 >= 0.0;
    bool _783 = isnan(_725);
    bool _785 = _781 || _783;
    bool _787 = isnan(0.0);
    bool _789 = _785 || _787;
    bool _791 = !_655;
    int _793 = _791 ? 0 : 1;
    bool _795 = !_663;
    int _797 = _795 ? 0 : 1;
    float _799 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _801 = int(_799);
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _805 = _803 != 0;
    int _807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _809 = _807 != 0;
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _813 = _811 != 0;
    bool _815 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _817 = isnan(_543);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    int _827 = ~_769;
    int _829 = _827 + 1;
    int _831 = _829 + 1;
    int _833 = _831;
    if (!_743)
    {
        int _835 = ~_769;
        int _837 = _835 + 1;
        _833 = _837;
    }
    int _839 = _833;
    float _841 = -_825;
    float _843 = _841 + 1.0;
    bool _845 = !_805;
    float _847 = _845 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _849 = _741 > 0.0;
    bool _851 = _741 >= 0.0;
    bool _853 = isnan(_741);
    bool _855 = _851 || _853;
    bool _857 = isnan(0.0);
    bool _859 = _855 || _857;
    float _861 = _825 * _779;
    int _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _865 = _863 != 0;
    float _867 = fma(_561, (*spvDescriptorSet0.vp_c10)._m0[5].z, _615);
    bool _869 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _871 = isnan(_543);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = fma(_561, (*spvDescriptorSet0.vp_c10)._m0[4].z, _647);
    bool _883 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _885 = isnan(_543);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = fma(_561, (*spvDescriptorSet0.vp_c10)._m0[6].z, _629);
    bool _897 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _899 = isnan(_543);
    bool _901 = _897 || _899;
    bool _903 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _905 = _901 || _903;
    float _907 = float(_905);
    float _909 = _879 * _843;
    float _911 = -_879;
    float _913 = _911 + 1.0;
    float _915 = -_893;
    float _917 = _915 + 1.0;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _921 = _543 + _919;
    bool _923 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _925 = isnan(_543);
    bool _927 = _923 || _925;
    bool _929 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _931 = _927 || _929;
    float _933 = float(_931);
    float _935 = _893 * _913;
    float _937 = _907 * _917;
    float _939 = fma(_683, _921, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _941 = as_type<int>(_917);
    float _943 = _939;
    float _945 = _847;
    if (_865)
    {
        _941 = 0;
    }
    int _947 = _941;
    float _949 = -_907;
    float _951 = _949 + 1.0;
    bool _953 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _955 = isnan(_543);
    bool _957 = _953 || _955;
    bool _959 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _961 = _957 || _959;
    float _963 = float(_961);
    float _965 = -_933;
    float _967 = _965 + 1.0;
    int _969 = _947;
    if (!_865)
    {
        _969 = 1;
    }
    int _971 = _969;
    float _973 = _933 * _951;
    int _975 = _859 ? 0 : 1;
    float _977 = -_963;
    float _979 = _977 + 1.0;
    bool _981 = _971 != 1;
    float _983 = _963 * _967;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _987 = _543 + _985;
    float _989 = _677 * _979;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _993 = _543 + _991;
    float _995 = fma(_691, _987, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _997 = _939 * _989;
    float _999 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1001 = log2(_999);
    float _1003 = float(_773);
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1007 = float(_801);
    float _1009 = fma(_711, _993, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    if (!_981)
    {
        _943 = _547;
    }
    float _1011 = _943;
    float _1013 = _881 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1015 = _1011;
    if (_981)
    {
        _1015 = _545;
    }
    float _1017 = _1015;
    float _1019 = 1.0 / _1007;
    float _1021 = float(_109);
    float _1023 = _895 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1025 = ~_975;
    int _1027 = _1025 + 1;
    int _1029 = _1027 + 1;
    float _1031 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1005);
    float _1033 = _1017;
    int _1035 = _1029;
    if (!_981)
    {
        _1033 = _549;
    }
    float _1037 = _1033;
    float _1039 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1041 = _1013 + _1039;
    float _1043 = _1001 * _143;
    float _1045 = _1001;
    float _1047 = _1037;
    if (!_981)
    {
        _1045 = _547;
    }
    float _1049 = _1045;
    float _1051 = 1.0 / _1003;
    float _1053 = _1049;
    if (_981)
    {
        _1053 = _545;
    }
    float _1055 = _1053;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_981)
    {
        _1047 = _547;
    }
    float _1059 = _1047;
    float _1061 = -_677;
    float _1063 = _1061 + 1.0;
    if (!_849)
    {
        int _1065 = ~_975;
        int _1067 = _1065 + 1;
        _1035 = _1067;
    }
    int _1069 = _1035;
    float _1071 = _1019 * _143;
    float _1073 = exp2(_1043);
    int _1075 = abs(as_type<int>(_847));
    float _1077 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_981)
    {
        _945 = _549;
    }
    float _1079 = _945;
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1083 = _1079;
    if (_981)
    {
        _1083 = _547;
    }
    float _1085 = _1083;
    float _1087 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[159].x, _997);
    float _1089 = float(_1075);
    float _1091 = 1.0 / _1021;
    float _1093 = fma(_1085, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1057);
    float _1095 = fma(_1077, -2.0, _1081);
    float _1097 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _611);
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1101 = _867 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1105 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1107 = float(_1069);
    float _1109 = -_1073;
    float _1111 = _1109 + 1.0;
    bool _1113 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1115 = isnan(0.0);
    bool _1117 = _1113 || _1115;
    bool _1119 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1121 = _1117 || _1119;
    float _1123 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1099);
    float _1125 = _1089 * _1107;
    float _1127 = _1051 * _143;
    float _1129 = in.m_60.x;
    float _1131 = in.m_60.y;
    float _1133 = in.m_60.z;
    float _1135 = -_1103;
    float _1137 = fma(_1105, 2.0, _1135);
    float _1139 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1141 = _1101 + _1139;
    float _1143 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1123);
    float _1145 = _1121 ? _1111 : 0.0;
    float _1147 = _1141 * _1141;
    bool _1149 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1151 = isnan(1.0);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1157 = _1153 || _1155;
    float _1159 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1161 = 1.0 + _1159;
    float _1163 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1165 = _1091 * _143;
    float _1167 = fma(_1041, _1041, _1147);
    float _1169 = 1.0 / _1161;
    float _1171 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1163);
    bool _1173 = !_809;
    int _1175 = _1173 ? 0 : 1;
    float _1177 = _1125 * (-2.0);
    float _1179 = float(_839);
    float _1181 = -_143;
    float _1183 = fma(_1181, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1137);
    int _1185 = abs(_1175);
    float _1187 = _545 + (-0.5);
    float _1189 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1031);
    float _1191 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1193 = _1023 + _1191;
    float _1195 = float(_1185);
    float _1197 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1171);
    float _1199 = fma(_1177, _1129, _1129);
    float _1201 = fma(_1193, _1193, _1167);
    float _1203 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1093);
    float _1205 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1095);
    if (_1157)
    {
        float _1207 = _1145 * _1169;
        _145 = _1207;
    }
    float _1209 = _145;
    float _1211 = sqrt(_1201);
    float _1213 = fma(_713, _1177, _713);
    float _1215 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1199);
    float _1217 = _1195 * _1179;
    float _1219 = _181 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1221 = _789 ? 0 : 1;
    float _1223 = fma(_1213, _1209, _1215);
    float _1225 = _1217 * (-2.0);
    float _1227 = rsqrt(_1201);
    bool _1229 = !_813;
    int _1231 = _1229 ? 0 : 1;
    float _1233 = _1219 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1235 = fma(_733, _1225, _733);
    float _1237 = fma(_1225, _1131, _1131);
    int _1239 = abs(_1231);
    float _1241 = _547 + (-0.5);
    int _1243 = ~_1221;
    int _1245 = _1243 + 1;
    int _1247 = _1245 + 1;
    float _1249 = _1211 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _1251 = _1247;
    if (!_775)
    {
        int _1253 = ~_1221;
        int _1255 = _1253 + 1;
        _1251 = _1255;
    }
    int _1257 = _1251;
    float _1259 = _1223 * 0.15915493667125701904296875;
    float _1261 = fma(_1241, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1237);
    float _1263 = float(_1239);
    float _1265 = fma(_721, _983, _1087);
    float _1267 = precise::min(_1233, _1249);
    float _1269 = fma(_1235, _1209, _1261);
    float _1271 = float(_1257);
    float _1273 = fma(_665, _973, _1265);
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1277 = _543 + _1275;
    float _1279 = _1227 * _1267;
    float _1281 = _1269 * 0.15915493667125701904296875;
    float _1283 = _1263 * _1271;
    float _1285 = fma(_1009, _937, _1273);
    float _1287 = _1141 * _1279;
    float _1289 = _1041 * _1279;
    float _1291 = _1283 * (-2.0);
    float _1293 = -_1287;
    float _1295 = _1141 + _1293;
    float _1297 = -_1289;
    float _1299 = _1041 + _1297;
    float _1301 = fma(_1291, _1133, _1133);
    float _1303 = _549 + (-0.5);
    float _1305 = _1295 * _1295;
    float _1307 = _1193 * _1279;
    float _1309 = fma(_755, _1291, _755);
    float _1311 = fma(_1303, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1301);
    float _1313 = fma(_1299, _1299, _1305);
    float _1315 = -_1307;
    float _1317 = _1193 + _1315;
    float _1319 = fma(_1309, _1209, _1311);
    float _1321 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1323 = _543 + _1321;
    float _1325 = fma(_1317, _1317, _1313);
    float _1327 = _1259 * 6.283185482025146484375;
    float _1329 = sin(_1327);
    float _1331 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1333 = fma(_729, _1323, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1335 = _1319 * 0.15915493667125701904296875;
    float _1337 = fma(_703, _1277, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1339 = fma(_995, _935, _1285);
    float _1341 = sqrt(_1325);
    float _1343 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1331);
    float _1345 = fma(_1337, _909, _1339);
    float _1347 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1343);
    float _1349 = fma(_1333, _861, _1345);
    float _1351 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _1353 = _1259 * 6.283185482025146484375;
    float _1355 = cos(_1353);
    float _1357 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1349);
    float _1359 = _1281 * 6.283185482025146484375;
    float _1361 = sin(_1359);
    float _1363 = _1227 * _1341;
    float _1365 = _583 * _1363;
    float _1367 = _1219 * _1363;
    float _1369 = _1363 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1371 = _1369 * 0.5;
    float _1373 = _1281 * 6.283185482025146484375;
    float _1375 = cos(_1373);
    float _1377 = _1365 * _1351;
    float _1379 = _1335 * 6.283185482025146484375;
    float _1381 = cos(_1379);
    float _1383 = _1329 * _1361;
    float _1385 = _1355 * _1361;
    float _1387 = _1335 * 6.283185482025146484375;
    float _1389 = sin(_1387);
    float _1391 = _1329 * _1375;
    float _1393 = _1355 * _1375;
    float _1395 = sqrt(_1347);
    float _1397 = _1355 * _1381;
    float _1399 = _1375 * _1381;
    float _1401 = _1329 * _1381;
    float _1403 = _1361 * _1381;
    float _1405 = _1401 * _1377;
    float _1407 = -_1385;
    float _1409 = fma(_1389, _1391, _1407);
    float _1411 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _1413 = fma(_1389, _1393, _1383);
    float _1415 = -_1391;
    float _1417 = fma(_1389, _1385, _1415);
    float _1419 = fma(_1389, _1383, _1393);
    float _1421 = _1367 * _1411;
    float _1423 = -_1377;
    float _1425 = _1389 * _1423;
    float _1427 = _1395 * 50.0;
    float _1429 = _1397 * _1377;
    float _1431 = fma(_1399, _1421, _1425);
    float _1433 = fma(_1409, _1421, _1405);
    float _1435 = _1357 * _1427;
    float _1437 = fma(_1413, _1421, _1429);
    float _1439 = fma(_1403, _1371, _1431);
    float _1441 = fma(_1419, _1371, _1433);
    float _1443 = -_1289;
    float _1445 = _1013 + _1443;
    float _1447 = fma(_1417, _1371, _1437);
    float _1449 = -_1287;
    float _1451 = _1101 + _1449;
    float _1453 = -_1307;
    float _1455 = _1023 + _1453;
    float _1457 = _1435 * _1435;
    float _1459 = _1447 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1461 = _1447 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1463 = _1447 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1465 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1467 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1459);
    float _1469 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1461);
    float _1471 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1463);
    float _1473 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1465);
    float _1475 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1467);
    float _1477 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1469);
    float _1479 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1471);
    float _1481 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1473);
    float _1483 = _1475 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1485 = _1477 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1487 = _1479 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1489 = _1481 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1491 = _1483 * _1483;
    float _1493 = _1013 + _1485;
    float _1495 = _1023 + _1487;
    float _1497 = rsqrt(_1457);
    float _1499 = fma(_1485, _1485, _1491);
    float _1501 = fma(_1487, _1487, _1499);
    float _1503 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1505 = _1495 + _1503;
    float _1507 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1509 = _1493 + _1507;
    float _1511 = sqrt(_1457);
    float _1513 = _1505 * _1505;
    float _1515 = fma(_1509, _1509, _1513);
    float _1517 = 1.0 / _1489;
    float _1519 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1521 = _1435 * _1497;
    float _1523 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1519);
    float _1525 = rsqrt(_1501);
    float _1527 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1523);
    float _1529 = _1527 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1531 = sqrt(_1515);
    float _1533 = _1529 + _1489;
    float _1535 = _1533 * _1517;
    float _1537 = _1535 * 0.5;
    float _1539 = _1483 * _1525;
    float _1541 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1543 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1541);
    float _1545 = _1521 * _1539;
    float _1547 = 1.0 / _1543;
    bool _1549 = _1531 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1551 = _1545 * _1511;
    int _1553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1555 = _1553 != 0;
    int _1557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1559 = _1557 != 0;
    int _1561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1563 = _1561 != 0;
    int _1565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1567 = _1565 != 0;
    float _1569 = fma(_1521, _1551, _1483);
    bool _1571 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1573 = isnan(0.5);
    bool _1575 = _1571 || _1573;
    bool _1577 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1579 = _1575 || _1577;
    float _1581 = _1101 + _1569;
    bool _1583 = !_1559;
    int _1585 = _1583 ? 0 : 1;
    bool _1587 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1589 = isnan(0.5);
    bool _1591 = _1587 || _1589;
    bool _1593 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1595 = _1591 || _1593;
    bool _1597 = !_1555;
    int _1599 = _1597 ? 0 : 1;
    bool _1601 = !_1563;
    int _1603 = _1601 ? 0 : 1;
    bool _1605 = !_1567;
    int _1607 = _1605 ? 0 : 1;
    float _1609 = _1483;
    float _1611 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1613 = _1525;
    float _1615 = _1569;
    float _1617 = _1505;
    float _1619 = _1307;
    float _1621 = _1495;
    if (!_1549)
    {
        _1609 = _1493;
    }
    float _1623 = _1609;
    float _1625 = _1623;
    if (!_1549)
    {
        _1611 = _1495;
    }
    float _1627 = _1611;
    float _1629 = _1627;
    if (!_1549)
    {
        _1613 = _1581;
    }
    float _1631 = _1613;
    bool _1633 = !_1549;
    float _1635 = _1631;
    if (!_1633)
    {
        float _1637 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1639 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1641 = _1531 + _1639;
        float _1643 = rsqrt(_1515);
        float _1645 = _1641 * _1637;
        float _1647 = _1581 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1649 = _1645 * 0.15915493667125701904296875;
        float _1651 = _1649 * 6.283185482025146484375;
        float _1653 = cos(_1651);
        float _1655 = _1649 * 6.283185482025146484375;
        float _1657 = sin(_1655);
        float _1659 = _1653 + (-1.0);
        float _1661 = _1659 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1663 = fma(_1657, _1647, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1665 = fma(_1581, _1653, _1661);
        float _1667 = _1643 * _1663;
        float _1669 = fma(_1509, _1667, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1671 = fma(_1505, _1667, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1625 = _1669;
        _1635 = _1665;
        _1629 = _1671;
        _1615 = _1643;
    }
    float _1673 = _1625;
    float _1675 = _1635;
    float _1677 = _1629;
    float _1679 = _1615;
    float _1681 = -_1289;
    float _1683 = _1681 + _1673;
    float _1685 = -_1287;
    float _1687 = _1685 + _1675;
    float _1689 = -_1307;
    float _1691 = _1689 + _1677;
    float _1693 = _1687;
    float _1695 = _1683;
    float _1697 = _1691;
    float _1699 = _1673;
    float _1701 = _1679;
    if (_1595)
    {
        _1617 = 1.0;
    }
    float _1703 = _1617;
    float _1705 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1707 = _1547 * _1705;
    float _1709 = _1703;
    if (!_1579)
    {
        float _1711 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1713 = _1451 + _1711;
        float _1715 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1717 = _1445 + _1715;
        float _1719 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1721 = -_1013;
        float _1723 = _1721 + _1673;
        float _1725 = _1713 * _1713;
        float _1727 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1729 = _1455 + _1727;
        float _1731 = -_1101;
        float _1733 = _1731 + _1675;
        float _1735 = -_1023;
        float _1737 = _1735 + _1677;
        float _1739 = fma(_1717, _1717, _1725);
        float _1741 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1743 = fma(_1729, _1729, _1739);
        float _1745 = sqrt(_1743);
        float _1747 = _1719 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1749 = precise::min(_1745, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1751 = _1749 * _1741;
        float _1753 = _1747 * _1751;
        float _1755 = fma(_1723, _1753, _1445);
        float _1757 = fma(_1733, _1753, _1451);
        float _1759 = fma(_1737, _1753, _1455);
        _1693 = _1757;
        _1695 = _1755;
        _1697 = _1759;
        _1619 = _1719;
        _1699 = _1753;
    }
    float _1761 = _1693;
    float _1763 = _1695;
    float _1765 = _1697;
    float _1767 = _1619;
    float _1769 = _1699;
    float _1771 = _1769;
    float _1773 = _1767;
    if (!_1595)
    {
        float _1775 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1777 = _1775 * 0.15915493667125701904296875;
        float _1779 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1781 = _1777 * 6.283185482025146484375;
        float _1783 = cos(_1781);
        float _1785 = _1779 * 0.15915493667125701904296875;
        float _1787 = _1777 * 6.283185482025146484375;
        float _1789 = sin(_1787);
        float _1791 = 1.0 / _1783;
        float _1793 = _1785 * 6.283185482025146484375;
        float _1795 = cos(_1793);
        float _1797 = _1789 * _1791;
        float _1799 = _1785 * 6.283185482025146484375;
        float _1801 = sin(_1799);
        float _1803 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1805 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1803;
        float _1807 = _1795 * _1797;
        float _1809 = 1.0 / _1805;
        float _1811 = 1.0 / _1807;
        float _1813 = _1801 * _1811;
        float _1815 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1817 = fma(_1707, _1813, _1815);
        float _1819 = _1817 * _1809;
        float _1821 = precise::clamp(_1819, 0.0, 1.0);
        _1771 = _1777;
        _1709 = _1821;
    }
    float _1823 = _1771;
    float _1825 = _1709;
    float _1827 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1829 = _1761 + _1827;
    float _1831 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1833 = _1763 + _1831;
    float _1835 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1837 = _1765 + _1835;
    float _1839 = _1829 * _1829;
    float _1841 = fma(_1833, _1833, _1839);
    float _1843 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1845 = fma(_1837, _1837, _1841);
    float _1847 = rsqrt(_1845);
    float _1849 = sqrt(_1845);
    float _1851 = _1847 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1853 = _1833 * _1851;
    float _1855 = _1837 * _1851;
    float _1857 = _1853 * _1853;
    float _1859 = _1855 * _1855;
    float _1861 = _1857 + _1859;
    float _1863 = sqrt(_1861);
    bool _1865 = _1863 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1867 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1869 = _1863 + _1867;
    float _1871 = _1837;
    float _1873 = _1861;
    float _1875 = _1869;
    float _1877 = _1851;
    float _1879 = _1839;
    if (_1865)
    {
        float _1881 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1871 = _1881;
    }
    float _1883 = _1871;
    if (_1865)
    {
        float _1885 = rsqrt(_1861);
        _1873 = _1885;
    }
    float _1887 = _1873;
    float _1889 = _1887;
    if (_1865)
    {
        float _1891 = _1869 * _1883;
        _1875 = _1891;
    }
    float _1893 = _1875;
    if (_1865)
    {
        float _1895 = _1893 * 0.15915493667125701904296875;
        _1773 = _1895;
    }
    float _1897 = _1773;
    float _1899 = _1883;
    float _1901 = _1897;
    if (_1865)
    {
        float _1903 = _1897 * 6.283185482025146484375;
        float _1905 = sin(_1903);
        _1899 = _1905;
    }
    float _1907 = _1899;
    float _1909 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1911 = precise::max(0.0, _1909);
    float _1913 = _1823;
    if (_1865)
    {
        float _1915 = _1897 * 6.283185482025146484375;
        float _1917 = cos(_1915);
        _1913 = _1917;
    }
    float _1919 = _1913;
    float _1921 = -_1851;
    float _1923 = -_1911;
    float _1925 = fma(_1829, _1921, _1923);
    if (_1865)
    {
        float _1927 = _1925 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1877 = _1927;
    }
    float _1929 = _1877;
    float _1931 = _1929;
    if (!_1865)
    {
        _1901 = _1859;
    }
    float _1933 = _1901;
    float _1935 = fma(_1445, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1937 = _1907;
    float _1939 = _1933;
    if (_1865)
    {
        float _1941 = fma(_1907, _1929, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1931 = _1941;
    }
    float _1943 = _1931;
    float _1945 = _1943;
    if (!_1865)
    {
        _1937 = _1853;
    }
    float _1947 = _1937;
    float _1949 = floor(_1935);
    float _1951 = _1947;
    if (_1865)
    {
        float _1953 = _1919 + (-1.0);
        _1879 = _1953;
    }
    float _1955 = _1879;
    float _1957 = _1955;
    if (_1865)
    {
        float _1959 = _1887 * _1943;
        _1621 = _1959;
    }
    float _1961 = _1621;
    if (!_1865)
    {
        _1945 = _1925;
    }
    float _1963 = _1945;
    float _1965 = _1963;
    if (_1865)
    {
        float _1967 = _1955 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1701 = _1967;
    }
    float _1969 = _1701;
    if (_1865)
    {
        float _1971 = _1853 * _1961;
        _1951 = _1971;
    }
    float _1973 = _1951;
    if (!_1865)
    {
        _1957 = _1855;
    }
    float _1975 = _1957;
    float _1977 = _1975;
    if (_1865)
    {
        float _1979 = _1855 * _1961;
        _1977 = _1979;
    }
    float _1981 = _1977;
    if (!_1865)
    {
        _1889 = _1857;
    }
    float _1983 = _1889;
    float _1985 = _1983;
    if (_1865)
    {
        float _1987 = fma(_1925, _1919, _1969);
        _1965 = _1987;
    }
    float _1989 = _1965;
    if (_1865)
    {
        float _1991 = _1973 * _1973;
        _1985 = _1991;
    }
    float _1993 = _1985;
    if (_1865)
    {
        float _1995 = _1981 * _1981;
        _1939 = _1995;
    }
    float _1997 = _1939;
    float _1999 = _1761 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2001 = fma(_1989, _1989, _1993);
    float _2003 = _1761 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2005 = fma(_1455, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2007 = _1761 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2009 = _2001 + _1997;
    float _2011 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1999);
    float _2013 = _1761 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2015 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2007);
    float _2017 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2003);
    float _2019 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2011);
    float _2021 = rsqrt(_2009);
    float _2023 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2015);
    float _2025 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2027 = fma(_1849, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2025);
    float _2029 = precise::clamp(_2027, 0.0, 1.0);
    float _2031 = _2019 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2033 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2013);
    float _2035 = _2023 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2037 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2017);
    float _2039 = -_2029;
    float _2041 = _2039 + 1.0;
    float _2043 = _2031 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2045 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2033);
    float _2047 = _2037 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2049 = floor(_2005);
    float _2051 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2043);
    float _2053 = _2045 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2055 = _2047 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2057 = -_1949;
    float _2059 = _1935 + _2057;
    float _2061 = fma(_2047, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2051);
    float _2063 = _2021 * _1973;
    float _2065 = _2021 * _1981;
    float _2067 = abs(_2041);
    float _2069 = log2(_2067);
    float _2071 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2061);
    float _2073 = _2021 * _1989;
    float _2075 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2077 = -_2055;
    float _2079 = fma(_2077, _1843, 1.0);
    float _2081 = _2031 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2083 = -_2075;
    float _2085 = fma(_2073, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2083);
    float _2087 = log2(_2079);
    float _2089 = -_2049;
    float _2091 = _2005 + _2089;
    float _2093 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2081);
    float _2095 = -_2065;
    float _2097 = fma(_2095, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2085);
    float _2099 = _2031 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2101 = fma(_2047, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2093);
    float _2103 = _2073 + 1.0;
    float _2105 = _2069 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2107 = fma(_2097, -0.5, 0.5);
    float _2109 = 1.0 / _2071;
    float _2111 = fma(_2097, 0.5, 0.5);
    float _2113 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2099);
    float _2115 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2101);
    float _2117 = fma(_2111, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2119 = fma(_2047, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2113);
    float _2121 = _2087 * 0.693147182464599609375;
    float _2123 = exp2(_2105);
    float _2125 = fma(_2111, _2117, -0.212114393711090087890625);
    float _2127 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2119);
    float _2129 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2131 = sqrt(_2107);
    float _2133 = _2115 * _2109;
    float _2135 = -_2073;
    float _2137 = fma(_2123, _2103, _2135);
    float _2139 = fma(_2111, _2125, 1.570728778839111328125);
    float _2141 = _2127 * _2109;
    float _2143 = fma(_2137, 0.5, 0.5);
    float _2145 = fma(_2141, -0.5, 0.5);
    float _2147 = _2131 * 0.636619746685028076171875;
    float _2149 = fma(_2133, 0.5, 0.5);
    float _2151 = -_2139;
    float _2153 = fma(_2147, _2151, 1.0);
    float2 _7375 = float2(_2059, _2091);
    float _2155 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7375, float2(0.0), isnan(_7375)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7375, float2(0.0), isnan(_7375)), level(0.0)).x;
    float3 _7386 = float3(_2149, _2145, _2129);
    float _2157 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7386, float3(0.0), isnan(_7386)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7386, float3(0.0), isnan(_7386)), level(0.0)).x;
    float3 _7397 = float3(_2149, _2145, _2129);
    float4 _2160 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7397, float3(0.0), isnan(_7397)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7397, float3(0.0), isnan(_7397)), level(0.0)).xyzw;
    float _2162 = _2160.x;
    float _2164 = _2160.y;
    float _2166 = _2160.z;
    float _2168 = _2160.w;
    float2 _7413 = float2(_2153, _2143);
    float3 _2172 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7413, float2(0.0), isnan(_7413)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7413, float2(0.0), isnan(_7413)), level(0.0)).xyz;
    float _2174 = _2172.x;
    float _2176 = _2172.y;
    float _2178 = _2172.z;
    float _2180 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2182 = int(_2180);
    int _2184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2186 = _2184 != 0;
    out.m_62.x = _297;
    out.m_62.y = _305;
    out.m_62.z = _307;
    out.m_62.w = _333;
    int _2188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2190 = _2188 != 0;
    float _2192 = _2069 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2194 = abs(_1585);
    out.m_64.x = _503;
    out.m_64.y = _509;
    out.m_64.z = _507;
    out.m_64.w = _513;
    int _2196 = abs(_1599);
    float _2198 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2200 = int(_2198);
    int _2202 = abs(_797);
    out.m_66.x = _1445;
    out.m_66.y = _1451;
    out.m_66.z = _1455;
    int _2204 = abs(_1603);
    float _2206 = _2031 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2208 = _551 > 0.5;
    out.m_68.w = _1267;
    float _2210 = -_1203;
    float _2212 = _2210 + 1.0;
    float _2214 = float(uint(_2182));
    float _2216 = trunc(_1071);
    int _2218 = int(_2216);
    out.m_70.x = _1367;
    int _2220 = ~_2182;
    int _2222 = _2220 + 1;
    float _2224 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2206);
    bool _2226 = _2182 == 0;
    out.m_72.x = _1763;
    out.m_72.y = _1761;
    out.m_72.z = _1765;
    float _2228 = float(uint(_2200));
    float _2230 = 1.0 / _2214;
    int _2232 = ~_2200;
    int _2234 = _2232 + 1;
    float _2236 = trunc(_1127);
    int _2238 = int(_2236);
    float _2240 = float(uint(_2218));
    float _2242 = _2149;
    float _2244 = _2212;
    float _2246 = _2115;
    if (_2186)
    {
        float _2248 = in.m_58.x;
        _2242 = _2248;
    }
    float _2250 = _2242;
    int _2252 = ~_2200;
    int _2254 = _2252 + 1;
    float _2256 = fma(_2047, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2224);
    float _2258 = _2250;
    if (!_2186)
    {
        float _2260 = in.m_58.y;
        _2258 = _2260;
    }
    float _2262 = _2258;
    float _2264 = 1.0 / _2228;
    int _2266 = as_type<int>(_2230) + (-2);
    int _2268 = ~_2182;
    int _2270 = _2268 + 1;
    float _2272 = _2230;
    if (_2186)
    {
        _2272 = 1.0;
    }
    float _2274 = _2272;
    float _2276 = as_type<float>(_2266) * _2240;
    float _2278 = _2274;
    if (!_2186)
    {
        _2278 = 1.2345600128173828125;
    }
    float _2280 = _2278;
    float _2282 = exp2(_2192);
    float _2284 = float(uint(_2238));
    int _2286 = as_type<int>(_2264) + (-2);
    float _2288 = trunc(_2276);
    float _2290 = precise::max(_2288, 0.0);
    uint _2293 = uint(_2290);
    float _2295 = as_type<float>(_2286) * _2284;
    float _2297 = _2262 * _2280;
    int _2299 = ~_2200;
    int _2301 = _2299 + 1;
    float _2303 = -_2282;
    float _2305 = _2303 + 1.0;
    float _2307 = trunc(_2295);
    float _2309 = precise::max(_2307, 0.0);
    uint _2311 = uint(_2309);
    float _2313 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2315 = _2270 * int(_2293);
    int _2317 = _2315 + _2218;
    float _2319 = floor(_2297);
    float _2321 = float(uint(_2317));
    int _2323 = _2234 * int(_2311);
    int _2325 = _2323 + _2238;
    float _2327 = as_type<float>(_2266) * _2321;
    float _2329 = float(uint(_2325));
    float _2331 = as_type<float>(_2325);
    if (_2186)
    {
        _2331 = 1.0;
    }
    float _2333 = _2331;
    float _2335 = trunc(_2327);
    float _2337 = precise::max(_2335, 0.0);
    uint _2339 = uint(_2337);
    float _2341 = _2333;
    if (!_2186)
    {
        _2341 = 7.345489978790283203125;
    }
    float _2343 = _2341;
    float _2345 = as_type<float>(_2286) * _2329;
    float _2347 = -_2319;
    float _2349 = _2297 + _2347;
    float _2351 = _2343 * _545;
    float _2353 = trunc(_2345);
    float _2355 = precise::max(_2353, 0.0);
    uint _2357 = uint(_2355);
    float _2359 = floor(_2351);
    int _2361 = int(_2293) + int(_2339);
    float _2363 = float(_2182);
    int _2365 = _2222 * _2361;
    int _2367 = _2365 + _2218;
    int _2369 = int(_2311) + int(_2357);
    float _2371 = float(_2218);
    bool _2373 = uint(_2367) >= uint(_2182);
    bool _2375 = _2371 >= _2363;
    bool _2377 = isnan(_2371);
    bool _2379 = _2375 || _2377;
    bool _2381 = isnan(_2363);
    bool _2383 = _2379 || _2381;
    float _2385 = float(_2383);
    int _2387 = _2301 * _2369;
    int _2389 = _2387 + _2238;
    float _2391 = -_2359;
    float _2393 = _2351 + _2391;
    float _2395 = float(_2200);
    bool _2397 = !_2373;
    int _2399 = _2397 ? 0 : (-1);
    float _2401 = trunc(_2385);
    int _2403 = int(_2401);
    bool _2405 = uint(_2389) >= uint(_2200);
    float _2407 = _2393 * _2363;
    float _2409 = float(_2238);
    int _2411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2413 = _2411 != 0;
    bool _2415 = !_2405;
    int _2417 = _2415 ? 0 : (-1);
    float _2419 = trunc(_2407);
    int _2421 = int(_2419);
    int _2423 = ~_2361;
    int _2425 = _2423 + _2399;
    int _2427 = _2425 + 1;
    bool _2429 = _2409 >= _2395;
    bool _2431 = isnan(_2409);
    bool _2433 = _2429 || _2431;
    bool _2435 = isnan(_2395);
    bool _2437 = _2433 || _2435;
    float _2439 = float(_2437);
    bool _2441 = !_2413;
    int _2443 = _2441 ? 0 : 1;
    int _2445 = ~_2369;
    int _2447 = _2445 + _2417;
    int _2449 = _2447 + 1;
    float _2451 = _2363 * _1165;
    int _2453 = abs(_2443);
    float _2455 = trunc(_2439);
    int _2457 = int(_2455);
    int _2459 = _2182 * _2427;
    int _2461 = _2459 + _2218;
    float _2463 = _2349 * _2395;
    int _2465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2467 = _2465 != 0;
    float _2469 = _2395 * _1165;
    int _2471 = ~_2403;
    int _2473 = _2471 + 1;
    int _2475 = _2473 + 1;
    int _2477 = _2421 * _2453;
    int _2479 = _2477 + _2218;
    bool _2481 = !_2226;
    int _2483 = _2481 ? _2461 : (-1);
    float _2485 = trunc(_2463);
    int _2487 = int(_2485);
    bool _2489 = !_2467;
    int _2491 = _2489 ? 0 : 1;
    bool _2493 = _2200 == 0;
    int _2495 = _2483 * _2475;
    int _2497 = abs(_2491);
    int _2499 = _2200 * _2449;
    int _2501 = _2499 + _2238;
    int _2503 = _2182 + (-1);
    float _2505 = trunc(_2451);
    int _2507 = int(_2505);
    int _2509 = ~_2457;
    int _2511 = _2509 + 1;
    int _2513 = _2511 + 1;
    bool _2515 = !_2493;
    int _2517 = _2515 ? _2501 : (-1);
    int _2519 = _2403 * _2503;
    int _2521 = _2519 + _2495;
    int _2523 = abs(_737);
    int _2525 = _2517 * _2513;
    float _2527 = trunc(_2469);
    int _2529 = int(_2527);
    int _2531 = _2487 * _2497;
    int _2533 = _2531 + _2238;
    int _2535 = _2200 + (-1);
    int _2537 = abs(_793);
    int _2539 = _2521 * _2523;
    bool _2541 = !_2190;
    int _2543 = _2541 ? 0 : 1;
    int _2545 = _2457 * _2535;
    int _2547 = _2545 + _2525;
    int _2549 = _2507 * _2537;
    int _2551 = _2549 + _2539;
    int _2553 = _2547 * _2194;
    int _2555 = abs(_2543);
    int _2557 = _2479 * _2202;
    int _2559 = _2557 + _2551;
    int _2561 = ~_2182;
    int _2563 = _2561 + 1;
    int _2565 = _2529 * _2196;
    int _2567 = _2565 + _2553;
    int _2569 = _2421 * _2555;
    int _2571 = _2569 + _2559;
    int _2573 = abs(_1607);
    float _2575 = float(uint(_2533));
    int _2577 = _2533 * _2204;
    int _2579 = _2577 + _2567;
    float _2581 = float(uint(_2571));
    int _2583 = ~_2182;
    int _2585 = _2583 + 1;
    int _2587 = _2487 * _2573;
    int _2589 = _2587 + _2579;
    float _2591 = float(uint(_2479));
    float _2593 = as_type<float>(_2266) * _2581;
    float _2595 = float(uint(_2589));
    float _2597 = trunc(_2593);
    float _2599 = precise::max(_2597, 0.0);
    uint _2601 = uint(_2599);
    float _2603 = as_type<float>(_2286) * _2595;
    float _2605 = as_type<float>(_2266) * _2591;
    float _2607 = trunc(_2603);
    float _2609 = precise::max(_2607, 0.0);
    uint _2611 = uint(_2609);
    int _2613 = _2563 * int(_2601);
    int _2615 = _2613 + _2571;
    float _2617 = as_type<float>(_2286) * _2575;
    float _2619 = trunc(_2605);
    float _2621 = precise::max(_2619, 0.0);
    uint _2623 = uint(_2621);
    int _2625 = ~_2200;
    int _2627 = _2625 + 1;
    float _2629 = float(uint(_2615));
    int _2631 = _2627 * int(_2611);
    int _2633 = _2631 + _2589;
    float _2635 = as_type<float>(_2266) * _2629;
    float _2637 = trunc(_2617);
    float _2639 = precise::max(_2637, 0.0);
    uint _2641 = uint(_2639);
    float _2643 = float(uint(_2633));
    int _2645 = _2585 * int(_2623);
    int _2647 = _2645 + _2479;
    int _2649 = ~_2200;
    int _2651 = _2649 + 1;
    float _2653 = trunc(_2635);
    float _2655 = precise::max(_2653, 0.0);
    uint _2657 = uint(_2655);
    float _2659 = as_type<float>(_2286) * _2643;
    float _2661 = float(uint(_2647));
    int _2663 = ~_2182;
    int _2665 = _2663 + 1;
    float _2667 = trunc(_2659);
    float _2669 = precise::max(_2667, 0.0);
    uint _2671 = uint(_2669);
    float _2673 = as_type<float>(_2266) * _2661;
    int _2675 = _2651 * int(_2641);
    int _2677 = _2675 + _2533;
    float _2679 = float(uint(_2677));
    float _2681 = trunc(_2673);
    float _2683 = precise::max(_2681, 0.0);
    uint _2685 = uint(_2683);
    int _2687 = int(_2601) + int(_2657);
    float _2689 = as_type<float>(_2286) * _2679;
    int _2691 = ~_2200;
    int _2693 = _2691 + 1;
    int _2695 = _2665 * _2687;
    int _2697 = _2695 + _2571;
    int _2699 = int(_2611) + int(_2671);
    bool _2701 = uint(_2697) >= uint(_2182);
    float _2703 = trunc(_2689);
    float _2705 = precise::max(_2703, 0.0);
    uint _2707 = uint(_2705);
    int _2709 = ~_2182;
    int _2711 = _2709 + 1;
    int _2713 = _2693 * _2699;
    int _2715 = _2713 + _2589;
    bool _2717 = !_2701;
    int _2719 = _2717 ? 0 : (-1);
    int _2721 = int(_2623) + int(_2685);
    bool _2723 = uint(_2715) >= uint(_2200);
    int _2725 = ~_2687;
    int _2727 = _2725 + _2719;
    int _2729 = _2727 + 1;
    int _2731 = _2711 * _2721;
    int _2733 = _2731 + _2479;
    bool _2735 = !_2723;
    int _2737 = _2735 ? 0 : (-1);
    int _2739 = _2182 * _2729;
    int _2741 = _2739 + _2571;
    int _2743 = ~_2699;
    int _2745 = _2743 + _2737;
    int _2747 = _2745 + 1;
    bool _2749 = uint(_2733) >= uint(_2182);
    bool _2751 = !_2226;
    int _2753 = _2751 ? _2741 : (-1);
    int _2755 = _2200 * _2747;
    int _2757 = _2755 + _2589;
    bool _2759 = !_2749;
    int _2761 = _2759 ? 0 : (-1);
    int _2763 = _2753 & 3;
    bool _2765 = _2763 != 0;
    float _2767 = -_2155;
    float _2769 = _2767 + 1.0;
    bool _2771 = !_2493;
    int _2773 = _2771 ? _2757 : (-1);
    float _2775 = _2313 * _2157;
    int _2777 = ~_2721;
    int _2779 = _2777 + _2761;
    int _2781 = _2779 + 1;
    int _2783 = _2773 >> 31;
    int _2785 = _2753 >> 31;
    int _2787 = _2182 * _2781;
    int _2789 = _2787 + _2479;
    int _2791 = _2783 & 3;
    int _2793 = _2753 & 3;
    bool _2795 = _2793 != 0;
    int _2797 = _2785 & 3;
    bool _2799 = _2763 != 3;
    int _2801 = _2773 + _2791;
    int _2803 = _2795 ? 0 : 1;
    int _2805 = _2753 + _2797;
    bool _2807 = uint(_2763) >= 2u;
    int _2809 = _2801 >> 2;
    int _2811 = _2805 >> 2;
    int _2813 = _2807 ? 0 : 1;
    int _2815 = _2809 << 4;
    int _2817 = _2815 + 512;
    int _2819 = int(_2641) + int(_2707);
    int _2821 = _2811 << 4;
    int _2823 = _2821 + 368;
    int _2825 = ~_2813;
    int _2827 = _2825 + 1;
    int _2829 = _2827 + 1;
    int _2831 = _2254 * _2819;
    int _2833 = _2831 + _2533;
    bool _2835 = uint(_2763) > 1u;
    int _2837 = _2829;
    if (_2799)
    {
        int _2839 = ~_2813;
        int _2841 = _2839 + 1;
        _2837 = _2841;
    }
    int _2843 = _2837;
    uint _2845 = uint(int(uint(_2817) >> uint(2)));
    uint _2847 = uint(int(uint(int(_2845)) >> uint(2)));
    int _2849 = int(_2845) & 3;
    float _2851 = (*spvDescriptorSet0.vp_c9)._m0[int(_2847)][_2849];
    int _2853 = int(_2845) + 1;
    uint _2855 = uint(int(uint(_2853) >> uint(2)));
    int _2857 = _2853 & 3;
    float _2859 = (*spvDescriptorSet0.vp_c9)._m0[int(_2855)][_2857];
    bool _2861 = _2763 != 3;
    int _2863 = ~_2803;
    int _2865 = _2863 + 1;
    int _2867 = _2865 + 1;
    bool _2869 = !_2226;
    int _2871 = _2869 ? _2789 : (-1);
    bool _2873 = !_2765;
    int _2875 = _2873 ? 0 : 1;
    uint _2877 = uint(int(uint(_2823) >> uint(2)));
    uint _2879 = uint(int(uint(int(_2877)) >> uint(2)));
    int _2881 = int(_2877) & 3;
    float _2883 = (*spvDescriptorSet0.vp_c9)._m0[int(_2879)][_2881];
    int _2885 = int(_2877) + 1;
    uint _2887 = uint(int(uint(_2885) >> uint(2)));
    int _2889 = _2885 & 3;
    float _2891 = (*spvDescriptorSet0.vp_c9)._m0[int(_2887)][_2889];
    int _2893 = _2867;
    if (!_2835)
    {
        int _2895 = ~_2803;
        int _2897 = _2895 + 1;
        _2893 = _2897;
    }
    int _2899 = _2893;
    bool _2901 = uint(_2833) >= uint(_2200);
    int _2903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2905 = _2903 != 0;
    int _2907 = _2773 & 3;
    bool _2909 = _2907 != 0;
    int _2911 = _2817 + 8;
    uint _2913 = uint(int(uint(_2911) >> uint(2)));
    uint _2915 = uint(int(uint(int(_2913)) >> uint(2)));
    int _2917 = int(_2913) & 3;
    float _2919 = (*spvDescriptorSet0.vp_c9)._m0[int(_2915)][_2917];
    int _2921 = int(_2913) + 1;
    uint _2923 = uint(int(uint(_2921) >> uint(2)));
    int _2925 = _2921 & 3;
    float _2927 = (*spvDescriptorSet0.vp_c9)._m0[int(_2923)][_2925];
    int _2929 = _2773 & 3;
    bool _2931 = _2929 != 0;
    bool _2933 = !_2905;
    int _2935 = _2933 ? 0 : 1;
    bool _2937 = uint(_2929) > 1u;
    bool _2939 = !_2901;
    int _2941 = _2939 ? 0 : (-1);
    int _2943 = _2823 + 8;
    uint _2945 = uint(int(uint(_2943) >> uint(2)));
    uint _2947 = uint(int(uint(int(_2945)) >> uint(2)));
    int _2949 = int(_2945) & 3;
    float _2951 = (*spvDescriptorSet0.vp_c9)._m0[int(_2947)][_2949];
    int _2953 = int(_2945) + 1;
    uint _2955 = uint(int(uint(_2953) >> uint(2)));
    int _2957 = _2953 & 3;
    float _2959 = (*spvDescriptorSet0.vp_c9)._m0[int(_2955)][_2957];
    bool _2961 = _2929 != 3;
    int _2963 = _2909 ? 0 : 1;
    bool _2965 = !_2861;
    int _2967 = _2965 ? 0 : (-1);
    bool _2969 = uint(_2929) >= 2u;
    int _2971 = ~_2963;
    int _2973 = _2971 + 1;
    int _2975 = _2973 + 1;
    int _2977 = ~_2819;
    int _2979 = _2977 + _2941;
    int _2981 = _2979 + 1;
    int _2983 = _2975;
    if (!_2937)
    {
        int _2985 = ~_2963;
        int _2987 = _2985 + 1;
        _2983 = _2987;
    }
    int _2989 = _2983;
    int _2991 = _2969 ? 0 : 1;
    bool _2993 = _2929 != 3;
    bool _2995 = _545 > 0.5;
    int _2997 = _2200 * _2981;
    int _2999 = _2997 + _2533;
    int _3001 = abs(_2989);
    int _3003 = ~_2991;
    int _3005 = _3003 + 1;
    int _3007 = _3005 + 1;
    int _3009 = abs(_2899);
    int _3011 = _3007;
    if (_2961)
    {
        int _3013 = ~_2991;
        int _3015 = _3013 + 1;
        _3011 = _3015;
    }
    int _3017 = _3011;
    bool _3019 = _547 > 0.5;
    bool _3021 = !_2493;
    int _3023 = _3021 ? _2999 : (-1);
    float _3025 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3027 = int(_3025);
    bool _3029 = _549 > 0.5;
    int _3031 = ~_3001;
    int _3033 = _3031 + 1;
    int _3035 = _3033 + 1;
    bool _3037 = !_2931;
    int _3039 = _3037 ? 0 : 1;
    int _3041 = ~_3009;
    int _3043 = _3041 + 1;
    int _3045 = _3043 + 1;
    int _3047 = _3035 * as_type<int>(_2859);
    int _3049 = abs(_2875);
    int _3051 = abs(_3039);
    int _3053 = _3045 * as_type<int>(_2891);
    int _3055 = abs(_2843);
    float _3057 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3059 = int(_3057);
    int _3061 = abs(_2967);
    int _3063 = abs(_3017);
    int _3065 = ~_3049;
    int _3067 = _3065 + 1;
    int _3069 = _3067 + 1;
    int _3071 = ~_3051;
    int _3073 = _3071 + 1;
    int _3075 = _3073 + 1;
    int _3077 = _3069 * as_type<int>(_2883);
    int _3079 = _3077 + _3053;
    float _3081 = -_191;
    int _3083 = _2208 ? as_type<int>(_3081) : as_type<int>(_191);
    int _3085 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3087 = _3085 != 0;
    int _3089 = _3075 * as_type<int>(_2851);
    int _3091 = _3089 + _3047;
    int _3093 = ~_3055;
    int _3095 = _3093 + 1;
    int _3097 = _3095 + 1;
    int _3099 = ~_3063;
    int _3101 = _3099 + 1;
    int _3103 = _3101 + 1;
    bool _3105 = !_3087;
    int _3107 = _3105 ? 0 : 1;
    int _3109 = _3097 * as_type<int>(_2951);
    int _3111 = _3109 + _3079;
    int _3113 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3115 = _3113 != 0;
    int _3117 = _3103 * as_type<int>(_2919);
    int _3119 = _3117 + _3091;
    int _3121 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3123 = _3121 != 0;
    int _3125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3127 = _3125 != 0;
    bool _3129 = !_2993;
    int _3131 = _3129 ? 0 : (-1);
    int _3133 = ~_3061;
    int _3135 = _3133 + 1;
    int _3137 = _3135 + 1;
    int _3139 = abs(_3107);
    int _3141 = abs(_3131);
    int _3143 = _3137 * as_type<int>(_2959);
    int _3145 = _3143 + _3111;
    float _3147 = float(uint(_3027));
    float _3149 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3151 = float(uint(_3059));
    int _3153 = ~_3139;
    int _3155 = _3153 + 1;
    int _3157 = _3155 + 1;
    float _3159 = 1.0 / _3147;
    int _3161 = ~_3141;
    int _3163 = _3161 + 1;
    int _3165 = _3163 + 1;
    float _3167 = -_1389;
    float _3169 = fma(_3167, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3149);
    int _3171 = abs(_2935);
    int _3173 = _3145 * _3157;
    int _3175 = abs(_3027);
    int _3177 = _3165 * as_type<int>(_2927);
    int _3179 = _3177 + _3119;
    int _3181 = ~_3171;
    int _3183 = _3181 + 1;
    int _3185 = _3183 + 1;
    float _3187 = 1.0 / _3151;
    float _3189 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3191 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3193 = float(uint(_3175));
    int _3195 = abs(_3059);
    float _3197 = -_1389;
    float _3199 = fma(_3197, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3191);
    int _3201 = ~_3175;
    int _3203 = _3201 + 1;
    float _3205 = 1.0 / _3193;
    float _3207 = -_1389;
    float _3209 = fma(_3207, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3189);
    int _3211 = _3179 * _3185;
    float _3213 = float(uint(_3195));
    int _3215 = _2871 * _3139;
    int _3217 = _3215 + _3173;
    float _3219 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3209);
    int _3221 = _3023 * _3171;
    int _3223 = _3221 + _3211;
    int _3225 = as_type<int>(_3159) + (-2);
    float _3227 = 1.0 / _3213;
    float _3229 = float(uint(_3217));
    float _3231 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3169);
    int _3233 = as_type<int>(_3187) + (-2);
    float _3235 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3199);
    float _3237 = float(uint(_3223));
    float _3239 = _1413 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3241 = _1413 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3243 = abs(_3217);
    float _3245 = as_type<float>(_3225) * _3229;
    float _3247 = as_type<float>(_3233) * _3237;
    float _3249 = _1413 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3251 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3239);
    float _3253 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3241);
    int _3255 = as_type<int>(_3205) + (-2);
    float _3257 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3249);
    float _3259 = float(uint(_3243));
    float _3261 = trunc(_3247);
    float _3263 = precise::max(_3261, 0.0);
    uint _3265 = uint(_3263);
    float _3267 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3269 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3271 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3273 = as_type<float>(_3255) * _3259;
    float _3275 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3267);
    float _3277 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3269);
    float _3279 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3271);
    float _3281 = abs(_1707);
    float _3283 = log2(_3281);
    float _3285 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3275);
    int _3287 = ~_3059;
    int _3289 = _3287 + 1;
    float _3291 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3277);
    float _3293 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3279);
    int _3295 = abs(_3223);
    float _3297 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3251);
    int _3299 = as_type<int>(_3227) + (-2);
    float _3301 = trunc(_3245);
    float _3303 = precise::max(_3301, 0.0);
    uint _3305 = uint(_3303);
    int _3307 = _3289 * int(_3265);
    int _3309 = _3307 + _3223;
    int _3311 = ~_3027;
    int _3313 = _3311 + 1;
    float _3315 = float(uint(_3309));
    float _3317 = trunc(_3273);
    float _3319 = precise::max(_3317, 0.0);
    uint _3321 = uint(_3319);
    float _3323 = float(uint(_3295));
    float _3325 = _3283 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3327 = as_type<float>(_3233) * _3315;
    float _3329 = as_type<float>(_3299) * _3323;
    int _3331 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3333 = _3331 != 0;
    int _3335 = _3313 * int(_3305);
    int _3337 = _3335 + _3217;
    float _3339 = exp2(_3325);
    bool _3341 = !_3115;
    float _3343 = _3341 ? _191 : as_type<float>(_3083);
    bool _3345 = _3059 == 0;
    float _3347 = float(uint(_3337));
    int _3349 = _3203 * int(_3321);
    int _3351 = _3349 + _3243;
    float _3353 = trunc(_3329);
    float _3355 = precise::max(_3353, 0.0);
    uint _3357 = uint(_3355);
    bool _3359 = _1707 <= 8000.0;
    bool _3361 = isnan(_1707);
    bool _3363 = _3359 || _3361;
    bool _3365 = isnan(8000.0);
    bool _3367 = _3363 || _3365;
    float _3369 = float(_3367);
    float _3371 = float(uint(_3351));
    float _3373 = as_type<float>(_3225) * _3347;
    float _3375 = -_191;
    int _3377 = _3019 ? as_type<int>(_3375) : as_type<int>(_191);
    float _3379 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3253);
    float _3381 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3257);
    float _3383 = as_type<float>(_3255) * _3371;
    int _3385 = ~_3195;
    int _3387 = _3385 + 1;
    float _3389 = fma(_3339, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3391 = precise::clamp(_3389, 0.0, 1.0);
    bool _3393 = !_3123;
    float _3395 = _3393 ? _191 : as_type<float>(_3377);
    float _3397 = trunc(_3373);
    float _3399 = precise::max(_3397, 0.0);
    uint _3401 = uint(_3399);
    float _3403 = -_187;
    int _3405 = _2995 ? as_type<int>(_3403) : as_type<int>(_187);
    float _3407 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3409 = -_187;
    int _3411 = _3029 ? as_type<int>(_3409) : as_type<int>(_187);
    int _3413 = _3387 * int(_3357);
    int _3415 = _3413 + _3295;
    bool _3417 = !_3333;
    float _3419 = _3417 ? _187 : as_type<float>(_3405);
    float _3421 = _3407 * _3219;
    bool _3423 = !_3127;
    float _3425 = _3423 ? _187 : as_type<float>(_3411);
    float _3427 = trunc(_3327);
    float _3429 = precise::max(_3427, 0.0);
    uint _3431 = uint(_3429);
    float _3433 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3435 = float(uint(_3415));
    float _3437 = _3407 * _3231;
    float _3439 = fma(_3433, _3297, _3421);
    out.m_74.x = _3297;
    out.m_74.y = _3379;
    out.m_74.z = _3381;
    float _3441 = as_type<float>(_3299) * _3435;
    float _3443 = trunc(_3383);
    float _3445 = precise::max(_3443, 0.0);
    uint _3447 = uint(_3445);
    float _3449 = fma(_3391, -2.0, 3.0);
    float _3451 = _3391 * _3391;
    float _3453 = _3407 * _3235;
    float _3455 = fma(_3433, _3379, _3437);
    int _3457 = int(_3305) + int(_3401);
    float _3459 = _3451 * _3449;
    float _3461 = fma(_3433, _3381, _3453);
    float _3463 = trunc(_3441);
    float _3465 = precise::max(_3463, 0.0);
    uint _3467 = uint(_3465);
    int _3469 = int(_3265) + int(_3431);
    float _3471 = -_3459;
    float _3473 = _3471 + 1.0;
    int _3475 = ~_3027;
    int _3477 = _3475 + 1;
    int _3479 = ~_3059;
    int _3481 = _3479 + 1;
    float _3483 = fma(_3473, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3459);
    int _3485 = ~_3175;
    int _3487 = _3485 + 1;
    int _3489 = _3477 * _3457;
    int _3491 = _3489 + _3217;
    int _3493 = int(_3321) + int(_3447);
    int _3495 = _3481 * _3469;
    int _3497 = _3495 + _3223;
    int _3499 = ~_3195;
    int _3501 = _3499 + 1;
    float _3503 = _3369 * _3483;
    bool _3505 = uint(_3491) >= uint(_3027);
    int _3507 = _3487 * _3493;
    int _3509 = _3507 + _3243;
    bool _3511 = uint(_3497) >= uint(_3059);
    float _3513 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3515 = int(_3357) + int(_3467);
    float _3517 = _3503 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _3519 = !_3505;
    int _3521 = _3519 ? 0 : (-1);
    bool _3523 = !_3511;
    int _3525 = _3523 ? 0 : (-1);
    int _3527 = _3501 * _3515;
    int _3529 = _3527 + _3295;
    bool _3531 = uint(_3509) >= uint(_3175);
    float _3533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3535 = ~_3457;
    int _3537 = _3535 + _3521;
    int _3539 = _3537 + 1;
    float _3541 = _2769 * _3517;
    float _3543 = precise::clamp(_3541, 0.0, 1.0);
    bool _3545 = uint(_3529) >= uint(_3195);
    int _3547 = ~_3469;
    int _3549 = _3547 + _3525;
    int _3551 = _3549 + 1;
    int _3553 = _3027 * _3539;
    int _3555 = _3553 + _3217;
    int _3557 = _3223 ^ _3059;
    float _3559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3561 = _3217 ^ _3027;
    int _3563 = _3059 * _3551;
    int _3565 = _3563 + _3223;
    bool _3567 = _3027 == 0;
    float _3569 = _3513 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3571 = _3027 == 0;
    bool _3573 = !_3545;
    int _3575 = _3573 ? 0 : (-1);
    uint _3577 = uint(int(uint(_3557) >> uint(31)));
    bool _3579 = !_3531;
    int _3581 = _3579 ? 0 : (-1);
    uint _3583 = uint(int(uint(_3561) >> uint(31)));
    bool _3585 = _3059 == 0;
    float _3587 = _3559 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3589 = ~_3575;
    int _3591 = _3515 + _3589;
    int _3593 = _3591 + 1;
    int _3595 = ~int(_3577);
    int _3597 = _3595 + 1;
    float _3599 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3601 = ~_3581;
    int _3603 = _3493 + _3601;
    int _3605 = _3603 + 1;
    int _3607 = ~int(_3583);
    int _3609 = _3607 + 1;
    int _3611 = _3593 ^ _3597;
    float _3613 = fma(_3407, _3407, 1.0);
    int _3615 = _3605 ^ _3609;
    bool _3617 = !_3567;
    int _3619 = _3617 ? _3555 : (-1);
    int _3621 = ~_3609;
    int _3623 = _3621 + _3615;
    int _3625 = _3623 + 1;
    float _3627 = rsqrt(_3613);
    bool _3629 = !_3345;
    int _3631 = _3629 ? _3565 : (-1);
    float _3633 = float(_3619);
    int _3635 = ~_3597;
    int _3637 = _3635 + _3611;
    int _3639 = _3637 + 1;
    float _3641 = float(_3631);
    float _3643 = fma(_3569, _3633, _643);
    bool _3645 = !_3571;
    int _3647 = _3645 ? _3625 : (-1);
    float _3649 = _3419 + 0.5;
    float _3651 = _2178 * _2775;
    float _3653 = fma(_3587, _3641, _1183);
    bool _3655 = !_3585;
    int _3657 = _3655 ? _3639 : (-1);
    float _3659 = fma(_3569, _3649, _3643);
    float _3661 = float(_3647);
    float _3663 = _3533 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3665 = float(_3657);
    float _3667 = _3599 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3669 = _3395 + (-0.5);
    float _3671 = -_1097;
    float _3673 = fma(_3663, _3661, _3671);
    float _3675 = _3407 * _3627;
    float _3677 = -_1205;
    float _3679 = fma(_3667, _3665, _3677);
    float _3681 = _3425 + 0.5;
    float _3683 = -_3663;
    float _3685 = fma(_3683, _3669, _3673);
    float _3687 = -_3291;
    float _3689 = _3675 * _3687;
    float _3691 = _3343 + (-0.5);
    float _3693 = fma(_3587, _3681, _3653);
    float _3695 = -_3285;
    float _3697 = _3675 * _3695;
    float _3699 = fma(_3627, _3231, _3689);
    float _3701 = -_1197;
    float _3703 = _3701 + 1.0;
    float _3705 = -_3293;
    float _3707 = _3675 * _3705;
    float _3709 = -_3667;
    float _3711 = fma(_3709, _3691, _3679);
    float _3713 = fma(_3627, _3219, _3697);
    float _3715 = -_3703;
    float _3717 = fma(_3419, _3715, _3659);
    float _3719 = fma(_3627, _3235, _3707);
    float _3721 = in.m_76.x;
    float _3723 = -_1143;
    float _3725 = _3723 + 1.0;
    float _3727 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2256);
    float _3729 = -_1189;
    float _3731 = _3729 + 1.0;
    out.m_78.x = _3713;
    out.m_78.y = _3699;
    out.m_78.z = _3719;
    float _3733 = fma(_3395, _3725, _3685);
    float _3735 = _2071 * 0.5;
    float _3737 = _3727 + _2071;
    float _3739 = _2115 + _2071;
    float _3741 = -_3731;
    float _3743 = fma(_3425, _3741, _3693);
    float _3745 = fma(_2127, -0.5, _3735);
    float _3747 = _3285 + _3439;
    float _3749 = _3737 * 0.5;
    float _3751 = _3739 * 0.5;
    float _3753 = fma(_3343, _2212, _3711);
    float _3755 = -_2313;
    float _3757 = _3755 + 1.0;
    float _3759 = _3291 + _3455;
    float _3761 = _3293 + _3461;
    float _3763 = fma(_2168, _3651, _2166);
    float _3765 = -_3543;
    float _3767 = fma(_3765, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3769 = _2168 * _2775;
    out.m_80.x = _3751;
    out.m_80.y = _3745;
    out.m_80.z = _3749;
    out.m_80.w = _2071;
    bool _3771 = _1849 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3773 = isnan(_1849);
    bool _3775 = _3771 || _3773;
    bool _3777 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3779 = _3775 || _3777;
    float _3781 = _3767 * _3721;
    float _3783 = fma(_2174, _3769, _2162);
    float _3785 = fma(_2176, _3769, _2164);
    float _3787 = _2168 * _3757;
    float _3789 = _3781 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_82.x = _3717;
    out.m_82.y = _3733;
    out.m_82.z = _3743;
    out.m_82.w = _3753;
    out.m_84.x = _3789;
    float _3791 = _3711;
    float _3793 = _3719;
    float _3795 = _3769;
    float _3797 = _3757;
    if (!_3779)
    {
        _2244 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3799 = _2244;
    out.m_86.x = _3783;
    out.m_86.y = _3785;
    out.m_86.z = _3763;
    out.m_86.w = _3787;
    float _3801 = _3799;
    float _3803 = _3799;
    if (!_3779)
    {
        _3791 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3805 = _3791;
    float _3807 = _3805;
    float _3809 = _3805;
    if (!_3779)
    {
        _3793 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3811 = _3793;
    out.m_88.x = _3747;
    out.m_88.y = _3759;
    out.m_88.z = _3761;
    float _3813 = _3811;
    float _3815 = _3811;
    if (!_3779)
    {
        _3795 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3817 = _3795;
    float _3819 = _3817;
    float _3821 = _3817;
    if (!_3779)
    {
        _3797 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3823 = _3797;
    out.gl_Position.x = _2115;
    out.gl_Position.y = _2127;
    out.gl_Position.z = _3727;
    out.gl_Position.w = _2071;
    float _3825 = _1825 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3827 = _3823;
    float _3829 = _3823;
    if (!_3779)
    {
        _2246 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3831 = _2246;
    bool _3833 = !_3779;
    float _3835 = _3831;
    float _3837 = _3831;
    if (!_3833)
    {
        bool _3839 = _1849 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3841 = isnan(_1849);
        bool _3843 = _3839 || _3841;
        bool _3845 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3847 = _3843 || _3845;
        if (!_3847)
        {
            float _3849 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3851 = _1849 + _3849;
            float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3855 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3853;
            float _3857 = 1.0 / _3855;
            float _3859 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3861 = _3859 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3863 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3865 = _3863 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3867 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3869 = _3867 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3871 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3873 = _3871 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3875 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3877 = _3875 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3879 = _3851 * _3857;
            float _3881 = precise::clamp(_3879, 0.0, 1.0);
            float _3883 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3885 = _3883 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3887 = fma(_3881, _3861, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3889 = fma(_3881, _3885, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3891 = fma(_3881, _3865, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3893 = fma(_3881, _3869, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3895 = fma(_3881, _3873, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3897 = fma(_3881, _3877, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3837 = _3889;
            _3821 = _3895;
            _3803 = _3887;
            _3815 = _3893;
            _3809 = _3891;
            _3829 = _3897;
            _3899 = true;
        }
        else
        {
            bool _3901 = _1849 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3903 = isnan(_1849);
            bool _3905 = _3901 || _3903;
            bool _3907 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3909 = _3905 || _3907;
            if (!_3909)
            {
                _3801 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3911 = _3801;
            _3803 = _3911;
            if (!_3909)
            {
                _3835 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3913 = _3835;
            _3837 = _3913;
            if (!_3909)
            {
                _3807 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3915 = _3807;
            _3809 = _3915;
            if (!_3909)
            {
                _3813 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3917 = _3813;
            _3815 = _3917;
            if (!_3909)
            {
                _3819 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3919 = _3819;
            _3821 = _3919;
            if (!_3909)
            {
                _3827 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3921 = _3827;
            bool _3923 = !_3909;
            _3829 = _3921;
            if (!_3923)
            {
                bool _3925 = _1849 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3927 = isnan(_1849);
                bool _3929 = _3925 || _3927;
                bool _3931 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3933 = _3929 || _3931;
                if (!_3933)
                {
                    float _3935 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3937 = _1849 + _3935;
                    float _3939 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3941 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3939;
                    float _3943 = 1.0 / _3941;
                    float _3945 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3947 = _3945 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3949 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3951 = _3949 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3953 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3955 = _3953 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3957 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3959 = _3957 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3961 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3963 = _3961 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3965 = _3937 * _3943;
                    float _3967 = precise::clamp(_3965, 0.0, 1.0);
                    float _3969 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3971 = _3969 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3973 = fma(_3967, _3947, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3975 = fma(_3967, _3971, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3977 = fma(_3967, _3951, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3979 = fma(_3967, _3955, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3981 = fma(_3967, _3959, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3983 = fma(_3967, _3963, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3837 = _3975;
                    _3821 = _3981;
                    _3803 = _3973;
                    _3815 = _3979;
                    _3809 = _3977;
                    _3829 = _3983;
                    _3899 = true;
                }
                else
                {
                    _3837 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3821 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3803 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3815 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3809 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3829 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3899 = false;
    float _3985 = _3837;
    float _3987 = _3821;
    float _3989 = _3803;
    float _3991 = _3815;
    float _3993 = _3809;
    float _3995 = _3829;
    float _3997 = fma(_3759, -0.5, 0.5);
    float _3999 = precise::clamp(_3997, 0.0, 1.0);
    float _4001 = -_3985;
    float _4003 = _4001 + _3987;
    float _4005 = _3825 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4007 = -_3989;
    float _4009 = _4007 + _3991;
    float _4011 = fma(_3999, _4003, _3985);
    out.m_90.x = 0.0;
    float _4013 = -_3993;
    float _4015 = _4013 + _3995;
    float _4017 = fma(_3999, _4009, _3989);
    float _4019 = _4011 * 0.586610972881317138671875;
    out.m_49.x = _4005;
    bool _4021 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4023 = fma(_3999, _4015, _3993);
    float _4025 = fma(_4017, 0.298911988735198974609375, _4019);
    bool _4027 = _1825 > 0.0;
    bool _4029 = isnan(_1825);
    bool _4031 = _4027 || _4029;
    bool _4033 = isnan(0.0);
    bool _4035 = _4031 || _4033;
    float _4037 = fma(_4023, 0.114477999508380889892578125, _4025);
    float _4039 = -_4037;
    float _4041 = _4017 + _4039;
    float _4043 = -_4037;
    float _4045 = _4011 + _4043;
    float _4047 = -_4037;
    float _4049 = _4023 + _4047;
    float _4051 = fma(_4041, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4037);
    float _4053 = fma(_4045, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4037);
    float _4055 = fma(_4049, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4037);
    bool _4057 = !_4021;
    if (!_4057)
    {
        float _4059 = -_1761;
        float _4061 = _4059 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4063 = -_1763;
        float _4065 = _4063 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4067 = -_1765;
        float _4069 = _4067 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4071 = _4061 * _4061;
        float _4073 = fma(_4065, _4065, _4071);
        float _4075 = fma(_4069, _4069, _4073);
        float _4077 = sqrt(_4075);
        float _4079 = rsqrt(_4075);
        float _4081 = -_4077;
        float _4083 = _4081 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4085 = _4083 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4087 = precise::clamp(_4085, 0.0, 1.0);
        float _4089 = _4065 * _4079;
        float _4091 = _4061 * _4079;
        float _4093 = abs(_4087);
        float _4095 = log2(_4093);
        float _4097 = _4069 * _4079;
        float _4099 = _4089 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4101 = _3759 * _4091;
        float _4103 = -_4091;
        float _4105 = -_4099;
        float _4107 = fma(_4103, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4105);
        float _4109 = fma(_3747, _4089, _4101);
        float _4111 = -_4097;
        float _4113 = fma(_4111, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4107);
        float _4115 = fma(_3761, _4097, _4109);
        float _4117 = precise::clamp(_4115, 0.0, 1.0);
        float _4119 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4121 = _4113 + _4119;
        float _4123 = _4095 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4125 = _4121 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4127 = precise::clamp(_4125, 0.0, 1.0);
        float _4129 = exp2(_4123);
        float _4131 = _4129 * _4127;
        float _4133 = _4117 * _4131;
        float _4135 = _4133 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4137 = _4133 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4139 = _4133 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _4135;
        out.m_90.y = _4137;
        out.m_90.z = _4139;
    }
    out.m_68.x = _4051;
    out.m_68.y = _4053;
    out.m_68.z = _4055;
    if (_4035)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _4141 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4141;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3899 = false;
    bool _535 = false;
    bool _355 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_46.w;
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
        out.m_49.x = 0.0;
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
        float _4198 = as_type<float>(_125);
        out.gl_Position.z = _4198;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_51.w;
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
        out.m_49.x = 0.0;
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
        float _4268 = as_type<float>(_163);
        out.gl_Position.z = _4268;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _169 = in.m_56.x;
    float _171 = in.m_56.y;
    int _173 = as_type<int>(_165) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_165) & 2;
    bool _179 = _177 != 0;
    float _181 = _169 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _183 = _171 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _185 = !_175;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_179;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_167;
    float _211;
    if (!_193)
    {
        float _195 = in.m_58.x;
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _211 = _209;
        _213 = true;
    }
    else
    {
        float _215 = float(_109);
        float _217 = 1.0 / _215;
        float _219 = _143 * _217;
        _211 = _219;
    }
    _213 = false;
    float _221 = _211;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _225 = _221 + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _229 = _227 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _231 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _233 = isnan(_221);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _239 = _235 || _237;
    float _241 = float(_239);
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _245 = _243 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _247 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _249 = isnan(_221);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _259;
    bool _263 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _265 = isnan(_221);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = 1.0 / _229;
    float _277 = -_241;
    float _279 = _277 + 1.0;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _283 = _257 * _279;
    float _285 = -_257;
    float _287 = _285 + 1.0;
    float _289 = 1.0 / _245;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _297 = _291 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _299 = _261 * _275;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _305 = _293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _307 = _295 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _309 = fma(_299, _225, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _311 = _303 * _289;
    float _313 = _309 * _283;
    float _315 = -_273;
    float _317 = _315 + 1.0;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _321 = _221 + _319;
    float _323 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[115].x, _313);
    float _325 = _241 * _317;
    float _327 = fma(_311, _321, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _329 = fma(_327, _325, _323);
    float _331 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[117].x, _329);
    float _333 = _331 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _335 = !_281;
    float _353;
    if (!_335)
    {
        float _337 = in.m_58.x;
        float _339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _341 = _337 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _343 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[11].w, _143);
        float _345 = _343 * _339;
        float _347 = floor(_345);
        float _349 = -_347;
        float _351 = _345 + _349;
        _353 = _351;
        _355 = true;
    }
    else
    {
        float _357 = float(_109);
        float _359 = 1.0 / _357;
        float _361 = _143 * _359;
        _353 = _361;
    }
    _355 = false;
    float _363 = _353;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _367 = _363 + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _377 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _379 = isnan(_363);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _393 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _395 = isnan(_363);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = 1.0 / _371;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _407;
    float _411 = -_387;
    float _413 = _411 + 1.0;
    bool _415 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _417 = isnan(_363);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    bool _427 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _429 = 1.0 / _375;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _433 = 1.0 / _391;
    float _435 = _409 * _405;
    float _437 = -_403;
    float _439 = _437 + 1.0;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _443 = _441 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _445 = _403 * _413;
    float _447 = fma(_435, _367, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _449 = _425 * _439;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _451;
    float _455 = _443 * _429;
    bool _457 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _459 = isnan(_363);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _471 = _363 + _469;
    float _473 = _447 * _449;
    float _475 = -_425;
    float _477 = _475 + 1.0;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _481 = _363 + _479;
    float _483 = fma(_455, _471, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _485 = -_467;
    float _487 = _485 + 1.0;
    float _489 = _453 * _433;
    float _491 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[131].x, _473);
    float _493 = _387 * _487;
    float _495 = fma(_489, _481, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _497 = fma(_483, _445, _491);
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _503 = _431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _505 = fma(_495, _493, _497);
    float _507 = _499 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _509 = _501 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _511 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[134].x, _505);
    float _513 = _511 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _515 = !_427;
    float _533;
    if (!_515)
    {
        float _517 = in.m_58.x;
        float _519 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _521 = _517 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _523 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[14].x, _143);
        float _525 = _523 * _519;
        float _527 = floor(_525);
        float _529 = -_527;
        float _531 = _525 + _529;
        _533 = _531;
        _535 = true;
    }
    else
    {
        float _537 = float(_109);
        float _539 = 1.0 / _537;
        float _541 = _143 * _539;
        _533 = _541;
    }
    _535 = false;
    float _543 = _533;
    float _545 = in.m_58.x;
    float _547 = in.m_58.y;
    float _549 = in.m_58.z;
    float _551 = in.m_58.w;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _555 = _543 + _553;
    float _557 = in.m_46.x;
    float _559 = in.m_46.y;
    float _561 = in.m_46.z;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _571 = 1.0 / _565;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _581 = _543 + _579;
    float _583 = _183 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _585 = 1.0 / _569;
    float _587 = _545 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _593 = 1.0 / _575;
    float _595 = -_577;
    float _597 = fma(_587, 2.0, _595);
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _605 = _547 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _607 = _559 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _609 = 1.0 / _603;
    float _611 = fma(_605, -2.0, _599);
    float _613 = _559 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _615 = fma(_557, (*spvDescriptorSet0.vp_c10)._m0[5].x, _607);
    float _617 = _559 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _623;
    float _627 = 1.0 / _591;
    float _629 = fma(_557, (*spvDescriptorSet0.vp_c10)._m0[6].x, _617);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _635 = _625 * _593;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _641 = -_143;
    float _643 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[76].x, _597);
    float _645 = 1.0 / _621;
    float _647 = fma(_557, (*spvDescriptorSet0.vp_c10)._m0[4].x, _613);
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _649;
    int _653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _655 = _653 != 0;
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _659 = _657 != 0;
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _663 = _661 != 0;
    float _665 = fma(_635, _581, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _667 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _669 = isnan(_543);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _679;
    float _683 = _651 * _585;
    float _685 = _545 * 2.0;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _691 = _681 * _609;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _697 = 1.0 / _633;
    float _699 = _689 * _571;
    float _701 = _545 + _547;
    float _703 = _695 * _645;
    float _705 = _547 * 2.0;
    float _707 = _701 + (-1.0);
    float _709 = floor(_685);
    float _711 = _639 * _627;
    float _713 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _715 = _549 + _547;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _717;
    float _721 = fma(_699, _555, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _723 = _715 + (-1.0);
    float _725 = floor(_705);
    float _727 = _549 * 2.0;
    float _729 = _719 * _697;
    float _731 = _549 + _545;
    float _733 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _735 = !_659;
    int _737 = _735 ? 0 : 1;
    float _739 = _731 + (-1.0);
    float _741 = floor(_727);
    bool _743 = _709 > 0.0;
    bool _745 = _709 >= 0.0;
    bool _747 = isnan(_709);
    bool _749 = _745 || _747;
    bool _751 = isnan(0.0);
    bool _753 = _749 || _751;
    float _755 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _757 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _759 = isnan(_543);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    int _769 = _753 ? 0 : 1;
    float _771 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _773 = int(_771);
    bool _775 = _725 > 0.0;
    float _777 = -_767;
    float _779 = _777 + 1.0;
    bool _781 = _725 >= 0.0;
    bool _783 = isnan(_725);
    bool _785 = _781 || _783;
    bool _787 = isnan(0.0);
    bool _789 = _785 || _787;
    bool _791 = !_655;
    int _793 = _791 ? 0 : 1;
    bool _795 = !_663;
    int _797 = _795 ? 0 : 1;
    float _799 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _801 = int(_799);
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _805 = _803 != 0;
    int _807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _809 = _807 != 0;
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _813 = _811 != 0;
    bool _815 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _817 = isnan(_543);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    int _827 = ~_769;
    int _829 = _827 + 1;
    int _831 = _829 + 1;
    int _833 = _831;
    if (!_743)
    {
        int _835 = ~_769;
        int _837 = _835 + 1;
        _833 = _837;
    }
    int _839 = _833;
    float _841 = -_825;
    float _843 = _841 + 1.0;
    bool _845 = !_805;
    float _847 = _845 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _849 = _741 > 0.0;
    bool _851 = _741 >= 0.0;
    bool _853 = isnan(_741);
    bool _855 = _851 || _853;
    bool _857 = isnan(0.0);
    bool _859 = _855 || _857;
    float _861 = _825 * _779;
    int _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _865 = _863 != 0;
    float _867 = fma(_561, (*spvDescriptorSet0.vp_c10)._m0[5].z, _615);
    bool _869 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _871 = isnan(_543);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = fma(_561, (*spvDescriptorSet0.vp_c10)._m0[4].z, _647);
    bool _883 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _885 = isnan(_543);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = fma(_561, (*spvDescriptorSet0.vp_c10)._m0[6].z, _629);
    bool _897 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _899 = isnan(_543);
    bool _901 = _897 || _899;
    bool _903 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _905 = _901 || _903;
    float _907 = float(_905);
    float _909 = _879 * _843;
    float _911 = -_879;
    float _913 = _911 + 1.0;
    float _915 = -_893;
    float _917 = _915 + 1.0;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _921 = _543 + _919;
    bool _923 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _925 = isnan(_543);
    bool _927 = _923 || _925;
    bool _929 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _931 = _927 || _929;
    float _933 = float(_931);
    float _935 = _893 * _913;
    float _937 = _907 * _917;
    float _939 = fma(_683, _921, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _941 = as_type<int>(_917);
    float _943 = _939;
    float _945 = _847;
    if (_865)
    {
        _941 = 0;
    }
    int _947 = _941;
    float _949 = -_907;
    float _951 = _949 + 1.0;
    bool _953 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _955 = isnan(_543);
    bool _957 = _953 || _955;
    bool _959 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _961 = _957 || _959;
    float _963 = float(_961);
    float _965 = -_933;
    float _967 = _965 + 1.0;
    int _969 = _947;
    if (!_865)
    {
        _969 = 1;
    }
    int _971 = _969;
    float _973 = _933 * _951;
    int _975 = _859 ? 0 : 1;
    float _977 = -_963;
    float _979 = _977 + 1.0;
    bool _981 = _971 != 1;
    float _983 = _963 * _967;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _987 = _543 + _985;
    float _989 = _677 * _979;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _993 = _543 + _991;
    float _995 = fma(_691, _987, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _997 = _939 * _989;
    float _999 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1001 = log2(_999);
    float _1003 = float(_773);
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1007 = float(_801);
    float _1009 = fma(_711, _993, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    if (!_981)
    {
        _943 = _547;
    }
    float _1011 = _943;
    float _1013 = _881 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1015 = _1011;
    if (_981)
    {
        _1015 = _545;
    }
    float _1017 = _1015;
    float _1019 = 1.0 / _1007;
    float _1021 = float(_109);
    float _1023 = _895 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1025 = ~_975;
    int _1027 = _1025 + 1;
    int _1029 = _1027 + 1;
    float _1031 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1005);
    float _1033 = _1017;
    int _1035 = _1029;
    if (!_981)
    {
        _1033 = _549;
    }
    float _1037 = _1033;
    float _1039 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1041 = _1013 + _1039;
    float _1043 = _1001 * _143;
    float _1045 = _1001;
    float _1047 = _1037;
    if (!_981)
    {
        _1045 = _547;
    }
    float _1049 = _1045;
    float _1051 = 1.0 / _1003;
    float _1053 = _1049;
    if (_981)
    {
        _1053 = _545;
    }
    float _1055 = _1053;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_981)
    {
        _1047 = _547;
    }
    float _1059 = _1047;
    float _1061 = -_677;
    float _1063 = _1061 + 1.0;
    if (!_849)
    {
        int _1065 = ~_975;
        int _1067 = _1065 + 1;
        _1035 = _1067;
    }
    int _1069 = _1035;
    float _1071 = _1019 * _143;
    float _1073 = exp2(_1043);
    int _1075 = abs(as_type<int>(_847));
    float _1077 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_981)
    {
        _945 = _549;
    }
    float _1079 = _945;
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1083 = _1079;
    if (_981)
    {
        _1083 = _547;
    }
    float _1085 = _1083;
    float _1087 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[159].x, _997);
    float _1089 = float(_1075);
    float _1091 = 1.0 / _1021;
    float _1093 = fma(_1085, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1057);
    float _1095 = fma(_1077, -2.0, _1081);
    float _1097 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _611);
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1101 = _867 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1105 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1107 = float(_1069);
    float _1109 = -_1073;
    float _1111 = _1109 + 1.0;
    bool _1113 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1115 = isnan(0.0);
    bool _1117 = _1113 || _1115;
    bool _1119 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1121 = _1117 || _1119;
    float _1123 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1099);
    float _1125 = _1089 * _1107;
    float _1127 = _1051 * _143;
    float _1129 = in.m_60.x;
    float _1131 = in.m_60.y;
    float _1133 = in.m_60.z;
    float _1135 = -_1103;
    float _1137 = fma(_1105, 2.0, _1135);
    float _1139 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1141 = _1101 + _1139;
    float _1143 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1123);
    float _1145 = _1121 ? _1111 : 0.0;
    float _1147 = _1141 * _1141;
    bool _1149 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1151 = isnan(1.0);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1157 = _1153 || _1155;
    float _1159 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1161 = 1.0 + _1159;
    float _1163 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1165 = _1091 * _143;
    float _1167 = fma(_1041, _1041, _1147);
    float _1169 = 1.0 / _1161;
    float _1171 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1163);
    bool _1173 = !_809;
    int _1175 = _1173 ? 0 : 1;
    float _1177 = _1125 * (-2.0);
    float _1179 = float(_839);
    float _1181 = -_143;
    float _1183 = fma(_1181, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1137);
    int _1185 = abs(_1175);
    float _1187 = _545 + (-0.5);
    float _1189 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1031);
    float _1191 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1193 = _1023 + _1191;
    float _1195 = float(_1185);
    float _1197 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1171);
    float _1199 = fma(_1177, _1129, _1129);
    float _1201 = fma(_1193, _1193, _1167);
    float _1203 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1093);
    float _1205 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1095);
    if (_1157)
    {
        float _1207 = _1145 * _1169;
        _145 = _1207;
    }
    float _1209 = _145;
    float _1211 = sqrt(_1201);
    float _1213 = fma(_713, _1177, _713);
    float _1215 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1199);
    float _1217 = _1195 * _1179;
    float _1219 = _181 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1221 = _789 ? 0 : 1;
    float _1223 = fma(_1213, _1209, _1215);
    float _1225 = _1217 * (-2.0);
    float _1227 = rsqrt(_1201);
    bool _1229 = !_813;
    int _1231 = _1229 ? 0 : 1;
    float _1233 = _1219 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1235 = fma(_733, _1225, _733);
    float _1237 = fma(_1225, _1131, _1131);
    int _1239 = abs(_1231);
    float _1241 = _547 + (-0.5);
    int _1243 = ~_1221;
    int _1245 = _1243 + 1;
    int _1247 = _1245 + 1;
    float _1249 = _1211 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _1251 = _1247;
    if (!_775)
    {
        int _1253 = ~_1221;
        int _1255 = _1253 + 1;
        _1251 = _1255;
    }
    int _1257 = _1251;
    float _1259 = _1223 * 0.15915493667125701904296875;
    float _1261 = fma(_1241, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1237);
    float _1263 = float(_1239);
    float _1265 = fma(_721, _983, _1087);
    float _1267 = precise::min(_1233, _1249);
    float _1269 = fma(_1235, _1209, _1261);
    float _1271 = float(_1257);
    float _1273 = fma(_665, _973, _1265);
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1277 = _543 + _1275;
    float _1279 = _1227 * _1267;
    float _1281 = _1269 * 0.15915493667125701904296875;
    float _1283 = _1263 * _1271;
    float _1285 = fma(_1009, _937, _1273);
    float _1287 = _1141 * _1279;
    float _1289 = _1041 * _1279;
    float _1291 = _1283 * (-2.0);
    float _1293 = -_1287;
    float _1295 = _1141 + _1293;
    float _1297 = -_1289;
    float _1299 = _1041 + _1297;
    float _1301 = fma(_1291, _1133, _1133);
    float _1303 = _549 + (-0.5);
    float _1305 = _1295 * _1295;
    float _1307 = _1193 * _1279;
    float _1309 = fma(_755, _1291, _755);
    float _1311 = fma(_1303, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1301);
    float _1313 = fma(_1299, _1299, _1305);
    float _1315 = -_1307;
    float _1317 = _1193 + _1315;
    float _1319 = fma(_1309, _1209, _1311);
    float _1321 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1323 = _543 + _1321;
    float _1325 = fma(_1317, _1317, _1313);
    float _1327 = _1259 * 6.283185482025146484375;
    float _1329 = sin(_1327);
    float _1331 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1333 = fma(_729, _1323, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1335 = _1319 * 0.15915493667125701904296875;
    float _1337 = fma(_703, _1277, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1339 = fma(_995, _935, _1285);
    float _1341 = sqrt(_1325);
    float _1343 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1331);
    float _1345 = fma(_1337, _909, _1339);
    float _1347 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1343);
    float _1349 = fma(_1333, _861, _1345);
    float _1351 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _1353 = _1259 * 6.283185482025146484375;
    float _1355 = cos(_1353);
    float _1357 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1349);
    float _1359 = _1281 * 6.283185482025146484375;
    float _1361 = sin(_1359);
    float _1363 = _1227 * _1341;
    float _1365 = _583 * _1363;
    float _1367 = _1219 * _1363;
    float _1369 = _1363 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1371 = _1369 * 0.5;
    float _1373 = _1281 * 6.283185482025146484375;
    float _1375 = cos(_1373);
    float _1377 = _1365 * _1351;
    float _1379 = _1335 * 6.283185482025146484375;
    float _1381 = cos(_1379);
    float _1383 = _1329 * _1361;
    float _1385 = _1355 * _1361;
    float _1387 = _1335 * 6.283185482025146484375;
    float _1389 = sin(_1387);
    float _1391 = _1329 * _1375;
    float _1393 = _1355 * _1375;
    float _1395 = sqrt(_1347);
    float _1397 = _1355 * _1381;
    float _1399 = _1375 * _1381;
    float _1401 = _1329 * _1381;
    float _1403 = _1361 * _1381;
    float _1405 = _1401 * _1377;
    float _1407 = -_1385;
    float _1409 = fma(_1389, _1391, _1407);
    float _1411 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _1413 = fma(_1389, _1393, _1383);
    float _1415 = -_1391;
    float _1417 = fma(_1389, _1385, _1415);
    float _1419 = fma(_1389, _1383, _1393);
    float _1421 = _1367 * _1411;
    float _1423 = -_1377;
    float _1425 = _1389 * _1423;
    float _1427 = _1395 * 50.0;
    float _1429 = _1397 * _1377;
    float _1431 = fma(_1399, _1421, _1425);
    float _1433 = fma(_1409, _1421, _1405);
    float _1435 = _1357 * _1427;
    float _1437 = fma(_1413, _1421, _1429);
    float _1439 = fma(_1403, _1371, _1431);
    float _1441 = fma(_1419, _1371, _1433);
    float _1443 = -_1289;
    float _1445 = _1013 + _1443;
    float _1447 = fma(_1417, _1371, _1437);
    float _1449 = -_1287;
    float _1451 = _1101 + _1449;
    float _1453 = -_1307;
    float _1455 = _1023 + _1453;
    float _1457 = _1435 * _1435;
    float _1459 = _1447 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1461 = _1447 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1463 = _1447 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1465 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1467 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1459);
    float _1469 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1461);
    float _1471 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1463);
    float _1473 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1465);
    float _1475 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1467);
    float _1477 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1469);
    float _1479 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1471);
    float _1481 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1473);
    float _1483 = _1475 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1485 = _1477 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1487 = _1479 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1489 = _1481 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1491 = _1483 * _1483;
    float _1493 = _1013 + _1485;
    float _1495 = _1023 + _1487;
    float _1497 = rsqrt(_1457);
    float _1499 = fma(_1485, _1485, _1491);
    float _1501 = fma(_1487, _1487, _1499);
    float _1503 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1505 = _1495 + _1503;
    float _1507 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1509 = _1493 + _1507;
    float _1511 = sqrt(_1457);
    float _1513 = _1505 * _1505;
    float _1515 = fma(_1509, _1509, _1513);
    float _1517 = 1.0 / _1489;
    float _1519 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1521 = _1435 * _1497;
    float _1523 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1519);
    float _1525 = rsqrt(_1501);
    float _1527 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1523);
    float _1529 = _1527 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1531 = sqrt(_1515);
    float _1533 = _1529 + _1489;
    float _1535 = _1533 * _1517;
    float _1537 = _1535 * 0.5;
    float _1539 = _1483 * _1525;
    float _1541 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1543 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1541);
    float _1545 = _1521 * _1539;
    float _1547 = 1.0 / _1543;
    bool _1549 = _1531 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1551 = _1545 * _1511;
    int _1553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1555 = _1553 != 0;
    int _1557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1559 = _1557 != 0;
    int _1561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1563 = _1561 != 0;
    int _1565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1567 = _1565 != 0;
    float _1569 = fma(_1521, _1551, _1483);
    bool _1571 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1573 = isnan(0.5);
    bool _1575 = _1571 || _1573;
    bool _1577 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1579 = _1575 || _1577;
    float _1581 = _1101 + _1569;
    bool _1583 = !_1559;
    int _1585 = _1583 ? 0 : 1;
    bool _1587 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1589 = isnan(0.5);
    bool _1591 = _1587 || _1589;
    bool _1593 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1595 = _1591 || _1593;
    bool _1597 = !_1555;
    int _1599 = _1597 ? 0 : 1;
    bool _1601 = !_1563;
    int _1603 = _1601 ? 0 : 1;
    bool _1605 = !_1567;
    int _1607 = _1605 ? 0 : 1;
    float _1609 = _1483;
    float _1611 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1613 = _1525;
    float _1615 = _1569;
    float _1617 = _1505;
    float _1619 = _1307;
    float _1621 = _1495;
    if (!_1549)
    {
        _1609 = _1493;
    }
    float _1623 = _1609;
    float _1625 = _1623;
    if (!_1549)
    {
        _1611 = _1495;
    }
    float _1627 = _1611;
    float _1629 = _1627;
    if (!_1549)
    {
        _1613 = _1581;
    }
    float _1631 = _1613;
    bool _1633 = !_1549;
    float _1635 = _1631;
    if (!_1633)
    {
        float _1637 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1639 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1641 = _1531 + _1639;
        float _1643 = rsqrt(_1515);
        float _1645 = _1641 * _1637;
        float _1647 = _1581 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1649 = _1645 * 0.15915493667125701904296875;
        float _1651 = _1649 * 6.283185482025146484375;
        float _1653 = cos(_1651);
        float _1655 = _1649 * 6.283185482025146484375;
        float _1657 = sin(_1655);
        float _1659 = _1653 + (-1.0);
        float _1661 = _1659 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1663 = fma(_1657, _1647, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1665 = fma(_1581, _1653, _1661);
        float _1667 = _1643 * _1663;
        float _1669 = fma(_1509, _1667, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1671 = fma(_1505, _1667, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1625 = _1669;
        _1635 = _1665;
        _1629 = _1671;
        _1615 = _1643;
    }
    float _1673 = _1625;
    float _1675 = _1635;
    float _1677 = _1629;
    float _1679 = _1615;
    float _1681 = -_1289;
    float _1683 = _1681 + _1673;
    float _1685 = -_1287;
    float _1687 = _1685 + _1675;
    float _1689 = -_1307;
    float _1691 = _1689 + _1677;
    float _1693 = _1687;
    float _1695 = _1683;
    float _1697 = _1691;
    float _1699 = _1673;
    float _1701 = _1679;
    if (_1595)
    {
        _1617 = 1.0;
    }
    float _1703 = _1617;
    float _1705 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1707 = _1547 * _1705;
    float _1709 = _1703;
    if (!_1579)
    {
        float _1711 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1713 = _1451 + _1711;
        float _1715 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1717 = _1445 + _1715;
        float _1719 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1721 = -_1013;
        float _1723 = _1721 + _1673;
        float _1725 = _1713 * _1713;
        float _1727 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1729 = _1455 + _1727;
        float _1731 = -_1101;
        float _1733 = _1731 + _1675;
        float _1735 = -_1023;
        float _1737 = _1735 + _1677;
        float _1739 = fma(_1717, _1717, _1725);
        float _1741 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1743 = fma(_1729, _1729, _1739);
        float _1745 = sqrt(_1743);
        float _1747 = _1719 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1749 = precise::min(_1745, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1751 = _1749 * _1741;
        float _1753 = _1747 * _1751;
        float _1755 = fma(_1723, _1753, _1445);
        float _1757 = fma(_1733, _1753, _1451);
        float _1759 = fma(_1737, _1753, _1455);
        _1693 = _1757;
        _1695 = _1755;
        _1697 = _1759;
        _1619 = _1719;
        _1699 = _1753;
    }
    float _1761 = _1693;
    float _1763 = _1695;
    float _1765 = _1697;
    float _1767 = _1619;
    float _1769 = _1699;
    float _1771 = _1769;
    float _1773 = _1767;
    if (!_1595)
    {
        float _1775 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1777 = _1775 * 0.15915493667125701904296875;
        float _1779 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1781 = _1777 * 6.283185482025146484375;
        float _1783 = cos(_1781);
        float _1785 = _1779 * 0.15915493667125701904296875;
        float _1787 = _1777 * 6.283185482025146484375;
        float _1789 = sin(_1787);
        float _1791 = 1.0 / _1783;
        float _1793 = _1785 * 6.283185482025146484375;
        float _1795 = cos(_1793);
        float _1797 = _1789 * _1791;
        float _1799 = _1785 * 6.283185482025146484375;
        float _1801 = sin(_1799);
        float _1803 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1805 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1803;
        float _1807 = _1795 * _1797;
        float _1809 = 1.0 / _1805;
        float _1811 = 1.0 / _1807;
        float _1813 = _1801 * _1811;
        float _1815 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1817 = fma(_1707, _1813, _1815);
        float _1819 = _1817 * _1809;
        float _1821 = precise::clamp(_1819, 0.0, 1.0);
        _1771 = _1777;
        _1709 = _1821;
    }
    float _1823 = _1771;
    float _1825 = _1709;
    float _1827 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1829 = _1761 + _1827;
    float _1831 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1833 = _1763 + _1831;
    float _1835 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1837 = _1765 + _1835;
    float _1839 = _1829 * _1829;
    float _1841 = fma(_1833, _1833, _1839);
    float _1843 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1845 = fma(_1837, _1837, _1841);
    float _1847 = rsqrt(_1845);
    float _1849 = sqrt(_1845);
    float _1851 = _1847 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1853 = _1833 * _1851;
    float _1855 = _1837 * _1851;
    float _1857 = _1853 * _1853;
    float _1859 = _1855 * _1855;
    float _1861 = _1857 + _1859;
    float _1863 = sqrt(_1861);
    bool _1865 = _1863 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1867 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1869 = _1863 + _1867;
    float _1871 = _1837;
    float _1873 = _1861;
    float _1875 = _1869;
    float _1877 = _1851;
    float _1879 = _1839;
    if (_1865)
    {
        float _1881 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1871 = _1881;
    }
    float _1883 = _1871;
    if (_1865)
    {
        float _1885 = rsqrt(_1861);
        _1873 = _1885;
    }
    float _1887 = _1873;
    float _1889 = _1887;
    if (_1865)
    {
        float _1891 = _1869 * _1883;
        _1875 = _1891;
    }
    float _1893 = _1875;
    if (_1865)
    {
        float _1895 = _1893 * 0.15915493667125701904296875;
        _1773 = _1895;
    }
    float _1897 = _1773;
    float _1899 = _1883;
    float _1901 = _1897;
    if (_1865)
    {
        float _1903 = _1897 * 6.283185482025146484375;
        float _1905 = sin(_1903);
        _1899 = _1905;
    }
    float _1907 = _1899;
    float _1909 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1911 = precise::max(0.0, _1909);
    float _1913 = _1823;
    if (_1865)
    {
        float _1915 = _1897 * 6.283185482025146484375;
        float _1917 = cos(_1915);
        _1913 = _1917;
    }
    float _1919 = _1913;
    float _1921 = -_1851;
    float _1923 = -_1911;
    float _1925 = fma(_1829, _1921, _1923);
    if (_1865)
    {
        float _1927 = _1925 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1877 = _1927;
    }
    float _1929 = _1877;
    float _1931 = _1929;
    if (!_1865)
    {
        _1901 = _1859;
    }
    float _1933 = _1901;
    float _1935 = fma(_1445, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1937 = _1907;
    float _1939 = _1933;
    if (_1865)
    {
        float _1941 = fma(_1907, _1929, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1931 = _1941;
    }
    float _1943 = _1931;
    float _1945 = _1943;
    if (!_1865)
    {
        _1937 = _1853;
    }
    float _1947 = _1937;
    float _1949 = floor(_1935);
    float _1951 = _1947;
    if (_1865)
    {
        float _1953 = _1919 + (-1.0);
        _1879 = _1953;
    }
    float _1955 = _1879;
    float _1957 = _1955;
    if (_1865)
    {
        float _1959 = _1887 * _1943;
        _1621 = _1959;
    }
    float _1961 = _1621;
    if (!_1865)
    {
        _1945 = _1925;
    }
    float _1963 = _1945;
    float _1965 = _1963;
    if (_1865)
    {
        float _1967 = _1955 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1701 = _1967;
    }
    float _1969 = _1701;
    if (_1865)
    {
        float _1971 = _1853 * _1961;
        _1951 = _1971;
    }
    float _1973 = _1951;
    if (!_1865)
    {
        _1957 = _1855;
    }
    float _1975 = _1957;
    float _1977 = _1975;
    if (_1865)
    {
        float _1979 = _1855 * _1961;
        _1977 = _1979;
    }
    float _1981 = _1977;
    if (!_1865)
    {
        _1889 = _1857;
    }
    float _1983 = _1889;
    float _1985 = _1983;
    if (_1865)
    {
        float _1987 = fma(_1925, _1919, _1969);
        _1965 = _1987;
    }
    float _1989 = _1965;
    if (_1865)
    {
        float _1991 = _1973 * _1973;
        _1985 = _1991;
    }
    float _1993 = _1985;
    if (_1865)
    {
        float _1995 = _1981 * _1981;
        _1939 = _1995;
    }
    float _1997 = _1939;
    float _1999 = _1761 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2001 = fma(_1989, _1989, _1993);
    float _2003 = _1761 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2005 = fma(_1455, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2007 = _1761 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2009 = _2001 + _1997;
    float _2011 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1999);
    float _2013 = _1761 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2015 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2007);
    float _2017 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2003);
    float _2019 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2011);
    float _2021 = rsqrt(_2009);
    float _2023 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2015);
    float _2025 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2027 = fma(_1849, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2025);
    float _2029 = precise::clamp(_2027, 0.0, 1.0);
    float _2031 = _2019 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2033 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2013);
    float _2035 = _2023 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2037 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2017);
    float _2039 = -_2029;
    float _2041 = _2039 + 1.0;
    float _2043 = _2031 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2045 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2033);
    float _2047 = _2037 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2049 = floor(_2005);
    float _2051 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2043);
    float _2053 = _2045 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2055 = _2047 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2057 = -_1949;
    float _2059 = _1935 + _2057;
    float _2061 = fma(_2047, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2051);
    float _2063 = _2021 * _1973;
    float _2065 = _2021 * _1981;
    float _2067 = abs(_2041);
    float _2069 = log2(_2067);
    float _2071 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2061);
    float _2073 = _2021 * _1989;
    float _2075 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2077 = -_2055;
    float _2079 = fma(_2077, _1843, 1.0);
    float _2081 = _2031 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2083 = -_2075;
    float _2085 = fma(_2073, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2083);
    float _2087 = log2(_2079);
    float _2089 = -_2049;
    float _2091 = _2005 + _2089;
    float _2093 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2081);
    float _2095 = -_2065;
    float _2097 = fma(_2095, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2085);
    float _2099 = _2031 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2101 = fma(_2047, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2093);
    float _2103 = _2073 + 1.0;
    float _2105 = _2069 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2107 = fma(_2097, -0.5, 0.5);
    float _2109 = 1.0 / _2071;
    float _2111 = fma(_2097, 0.5, 0.5);
    float _2113 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2099);
    float _2115 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2101);
    float _2117 = fma(_2111, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2119 = fma(_2047, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2113);
    float _2121 = _2087 * 0.693147182464599609375;
    float _2123 = exp2(_2105);
    float _2125 = fma(_2111, _2117, -0.212114393711090087890625);
    float _2127 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2119);
    float _2129 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2131 = sqrt(_2107);
    float _2133 = _2115 * _2109;
    float _2135 = -_2073;
    float _2137 = fma(_2123, _2103, _2135);
    float _2139 = fma(_2111, _2125, 1.570728778839111328125);
    float _2141 = _2127 * _2109;
    float _2143 = fma(_2137, 0.5, 0.5);
    float _2145 = fma(_2141, -0.5, 0.5);
    float _2147 = _2131 * 0.636619746685028076171875;
    float _2149 = fma(_2133, 0.5, 0.5);
    float _2151 = -_2139;
    float _2153 = fma(_2147, _2151, 1.0);
    float2 _7375 = float2(_2059, _2091);
    float _2155 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7375, float2(0.0), isnan(_7375)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7375, float2(0.0), isnan(_7375)), level(0.0)).x;
    float3 _7386 = float3(_2149, _2145, _2129);
    float _2157 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7386, float3(0.0), isnan(_7386)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7386, float3(0.0), isnan(_7386)), level(0.0)).x;
    float3 _7397 = float3(_2149, _2145, _2129);
    float4 _2160 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7397, float3(0.0), isnan(_7397)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7397, float3(0.0), isnan(_7397)), level(0.0)).xyzw;
    float _2162 = _2160.x;
    float _2164 = _2160.y;
    float _2166 = _2160.z;
    float _2168 = _2160.w;
    float2 _7413 = float2(_2153, _2143);
    float3 _2172 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7413, float2(0.0), isnan(_7413)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7413, float2(0.0), isnan(_7413)), level(0.0)).xyz;
    float _2174 = _2172.x;
    float _2176 = _2172.y;
    float _2178 = _2172.z;
    float _2180 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2182 = int(_2180);
    int _2184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2186 = _2184 != 0;
    out.m_62.x = _297;
    out.m_62.y = _305;
    out.m_62.z = _307;
    out.m_62.w = _333;
    int _2188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2190 = _2188 != 0;
    float _2192 = _2069 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2194 = abs(_1585);
    out.m_64.x = _503;
    out.m_64.y = _509;
    out.m_64.z = _507;
    out.m_64.w = _513;
    int _2196 = abs(_1599);
    float _2198 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2200 = int(_2198);
    int _2202 = abs(_797);
    out.m_66.x = _1445;
    out.m_66.y = _1451;
    out.m_66.z = _1455;
    int _2204 = abs(_1603);
    float _2206 = _2031 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2208 = _551 > 0.5;
    out.m_68.w = _1267;
    float _2210 = -_1203;
    float _2212 = _2210 + 1.0;
    float _2214 = float(uint(_2182));
    float _2216 = trunc(_1071);
    int _2218 = int(_2216);
    out.m_70.x = _1367;
    int _2220 = ~_2182;
    int _2222 = _2220 + 1;
    float _2224 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2206);
    bool _2226 = _2182 == 0;
    out.m_72.x = _1763;
    out.m_72.y = _1761;
    out.m_72.z = _1765;
    float _2228 = float(uint(_2200));
    float _2230 = 1.0 / _2214;
    int _2232 = ~_2200;
    int _2234 = _2232 + 1;
    float _2236 = trunc(_1127);
    int _2238 = int(_2236);
    float _2240 = float(uint(_2218));
    float _2242 = _2149;
    float _2244 = _2212;
    float _2246 = _2115;
    if (_2186)
    {
        float _2248 = in.m_58.x;
        _2242 = _2248;
    }
    float _2250 = _2242;
    int _2252 = ~_2200;
    int _2254 = _2252 + 1;
    float _2256 = fma(_2047, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2224);
    float _2258 = _2250;
    if (!_2186)
    {
        float _2260 = in.m_58.y;
        _2258 = _2260;
    }
    float _2262 = _2258;
    float _2264 = 1.0 / _2228;
    int _2266 = as_type<int>(_2230) + (-2);
    int _2268 = ~_2182;
    int _2270 = _2268 + 1;
    float _2272 = _2230;
    if (_2186)
    {
        _2272 = 1.0;
    }
    float _2274 = _2272;
    float _2276 = as_type<float>(_2266) * _2240;
    float _2278 = _2274;
    if (!_2186)
    {
        _2278 = 1.2345600128173828125;
    }
    float _2280 = _2278;
    float _2282 = exp2(_2192);
    float _2284 = float(uint(_2238));
    int _2286 = as_type<int>(_2264) + (-2);
    float _2288 = trunc(_2276);
    float _2290 = precise::max(_2288, 0.0);
    uint _2293 = uint(_2290);
    float _2295 = as_type<float>(_2286) * _2284;
    float _2297 = _2262 * _2280;
    int _2299 = ~_2200;
    int _2301 = _2299 + 1;
    float _2303 = -_2282;
    float _2305 = _2303 + 1.0;
    float _2307 = trunc(_2295);
    float _2309 = precise::max(_2307, 0.0);
    uint _2311 = uint(_2309);
    float _2313 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2315 = _2270 * int(_2293);
    int _2317 = _2315 + _2218;
    float _2319 = floor(_2297);
    float _2321 = float(uint(_2317));
    int _2323 = _2234 * int(_2311);
    int _2325 = _2323 + _2238;
    float _2327 = as_type<float>(_2266) * _2321;
    float _2329 = float(uint(_2325));
    float _2331 = as_type<float>(_2325);
    if (_2186)
    {
        _2331 = 1.0;
    }
    float _2333 = _2331;
    float _2335 = trunc(_2327);
    float _2337 = precise::max(_2335, 0.0);
    uint _2339 = uint(_2337);
    float _2341 = _2333;
    if (!_2186)
    {
        _2341 = 7.345489978790283203125;
    }
    float _2343 = _2341;
    float _2345 = as_type<float>(_2286) * _2329;
    float _2347 = -_2319;
    float _2349 = _2297 + _2347;
    float _2351 = _2343 * _545;
    float _2353 = trunc(_2345);
    float _2355 = precise::max(_2353, 0.0);
    uint _2357 = uint(_2355);
    float _2359 = floor(_2351);
    int _2361 = int(_2293) + int(_2339);
    float _2363 = float(_2182);
    int _2365 = _2222 * _2361;
    int _2367 = _2365 + _2218;
    int _2369 = int(_2311) + int(_2357);
    float _2371 = float(_2218);
    bool _2373 = uint(_2367) >= uint(_2182);
    bool _2375 = _2371 >= _2363;
    bool _2377 = isnan(_2371);
    bool _2379 = _2375 || _2377;
    bool _2381 = isnan(_2363);
    bool _2383 = _2379 || _2381;
    float _2385 = float(_2383);
    int _2387 = _2301 * _2369;
    int _2389 = _2387 + _2238;
    float _2391 = -_2359;
    float _2393 = _2351 + _2391;
    float _2395 = float(_2200);
    bool _2397 = !_2373;
    int _2399 = _2397 ? 0 : (-1);
    float _2401 = trunc(_2385);
    int _2403 = int(_2401);
    bool _2405 = uint(_2389) >= uint(_2200);
    float _2407 = _2393 * _2363;
    float _2409 = float(_2238);
    int _2411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2413 = _2411 != 0;
    bool _2415 = !_2405;
    int _2417 = _2415 ? 0 : (-1);
    float _2419 = trunc(_2407);
    int _2421 = int(_2419);
    int _2423 = ~_2361;
    int _2425 = _2423 + _2399;
    int _2427 = _2425 + 1;
    bool _2429 = _2409 >= _2395;
    bool _2431 = isnan(_2409);
    bool _2433 = _2429 || _2431;
    bool _2435 = isnan(_2395);
    bool _2437 = _2433 || _2435;
    float _2439 = float(_2437);
    bool _2441 = !_2413;
    int _2443 = _2441 ? 0 : 1;
    int _2445 = ~_2369;
    int _2447 = _2445 + _2417;
    int _2449 = _2447 + 1;
    float _2451 = _2363 * _1165;
    int _2453 = abs(_2443);
    float _2455 = trunc(_2439);
    int _2457 = int(_2455);
    int _2459 = _2182 * _2427;
    int _2461 = _2459 + _2218;
    float _2463 = _2349 * _2395;
    int _2465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2467 = _2465 != 0;
    float _2469 = _2395 * _1165;
    int _2471 = ~_2403;
    int _2473 = _2471 + 1;
    int _2475 = _2473 + 1;
    int _2477 = _2421 * _2453;
    int _2479 = _2477 + _2218;
    bool _2481 = !_2226;
    int _2483 = _2481 ? _2461 : (-1);
    float _2485 = trunc(_2463);
    int _2487 = int(_2485);
    bool _2489 = !_2467;
    int _2491 = _2489 ? 0 : 1;
    bool _2493 = _2200 == 0;
    int _2495 = _2483 * _2475;
    int _2497 = abs(_2491);
    int _2499 = _2200 * _2449;
    int _2501 = _2499 + _2238;
    int _2503 = _2182 + (-1);
    float _2505 = trunc(_2451);
    int _2507 = int(_2505);
    int _2509 = ~_2457;
    int _2511 = _2509 + 1;
    int _2513 = _2511 + 1;
    bool _2515 = !_2493;
    int _2517 = _2515 ? _2501 : (-1);
    int _2519 = _2403 * _2503;
    int _2521 = _2519 + _2495;
    int _2523 = abs(_737);
    int _2525 = _2517 * _2513;
    float _2527 = trunc(_2469);
    int _2529 = int(_2527);
    int _2531 = _2487 * _2497;
    int _2533 = _2531 + _2238;
    int _2535 = _2200 + (-1);
    int _2537 = abs(_793);
    int _2539 = _2521 * _2523;
    bool _2541 = !_2190;
    int _2543 = _2541 ? 0 : 1;
    int _2545 = _2457 * _2535;
    int _2547 = _2545 + _2525;
    int _2549 = _2507 * _2537;
    int _2551 = _2549 + _2539;
    int _2553 = _2547 * _2194;
    int _2555 = abs(_2543);
    int _2557 = _2479 * _2202;
    int _2559 = _2557 + _2551;
    int _2561 = ~_2182;
    int _2563 = _2561 + 1;
    int _2565 = _2529 * _2196;
    int _2567 = _2565 + _2553;
    int _2569 = _2421 * _2555;
    int _2571 = _2569 + _2559;
    int _2573 = abs(_1607);
    float _2575 = float(uint(_2533));
    int _2577 = _2533 * _2204;
    int _2579 = _2577 + _2567;
    float _2581 = float(uint(_2571));
    int _2583 = ~_2182;
    int _2585 = _2583 + 1;
    int _2587 = _2487 * _2573;
    int _2589 = _2587 + _2579;
    float _2591 = float(uint(_2479));
    float _2593 = as_type<float>(_2266) * _2581;
    float _2595 = float(uint(_2589));
    float _2597 = trunc(_2593);
    float _2599 = precise::max(_2597, 0.0);
    uint _2601 = uint(_2599);
    float _2603 = as_type<float>(_2286) * _2595;
    float _2605 = as_type<float>(_2266) * _2591;
    float _2607 = trunc(_2603);
    float _2609 = precise::max(_2607, 0.0);
    uint _2611 = uint(_2609);
    int _2613 = _2563 * int(_2601);
    int _2615 = _2613 + _2571;
    float _2617 = as_type<float>(_2286) * _2575;
    float _2619 = trunc(_2605);
    float _2621 = precise::max(_2619, 0.0);
    uint _2623 = uint(_2621);
    int _2625 = ~_2200;
    int _2627 = _2625 + 1;
    float _2629 = float(uint(_2615));
    int _2631 = _2627 * int(_2611);
    int _2633 = _2631 + _2589;
    float _2635 = as_type<float>(_2266) * _2629;
    float _2637 = trunc(_2617);
    float _2639 = precise::max(_2637, 0.0);
    uint _2641 = uint(_2639);
    float _2643 = float(uint(_2633));
    int _2645 = _2585 * int(_2623);
    int _2647 = _2645 + _2479;
    int _2649 = ~_2200;
    int _2651 = _2649 + 1;
    float _2653 = trunc(_2635);
    float _2655 = precise::max(_2653, 0.0);
    uint _2657 = uint(_2655);
    float _2659 = as_type<float>(_2286) * _2643;
    float _2661 = float(uint(_2647));
    int _2663 = ~_2182;
    int _2665 = _2663 + 1;
    float _2667 = trunc(_2659);
    float _2669 = precise::max(_2667, 0.0);
    uint _2671 = uint(_2669);
    float _2673 = as_type<float>(_2266) * _2661;
    int _2675 = _2651 * int(_2641);
    int _2677 = _2675 + _2533;
    float _2679 = float(uint(_2677));
    float _2681 = trunc(_2673);
    float _2683 = precise::max(_2681, 0.0);
    uint _2685 = uint(_2683);
    int _2687 = int(_2601) + int(_2657);
    float _2689 = as_type<float>(_2286) * _2679;
    int _2691 = ~_2200;
    int _2693 = _2691 + 1;
    int _2695 = _2665 * _2687;
    int _2697 = _2695 + _2571;
    int _2699 = int(_2611) + int(_2671);
    bool _2701 = uint(_2697) >= uint(_2182);
    float _2703 = trunc(_2689);
    float _2705 = precise::max(_2703, 0.0);
    uint _2707 = uint(_2705);
    int _2709 = ~_2182;
    int _2711 = _2709 + 1;
    int _2713 = _2693 * _2699;
    int _2715 = _2713 + _2589;
    bool _2717 = !_2701;
    int _2719 = _2717 ? 0 : (-1);
    int _2721 = int(_2623) + int(_2685);
    bool _2723 = uint(_2715) >= uint(_2200);
    int _2725 = ~_2687;
    int _2727 = _2725 + _2719;
    int _2729 = _2727 + 1;
    int _2731 = _2711 * _2721;
    int _2733 = _2731 + _2479;
    bool _2735 = !_2723;
    int _2737 = _2735 ? 0 : (-1);
    int _2739 = _2182 * _2729;
    int _2741 = _2739 + _2571;
    int _2743 = ~_2699;
    int _2745 = _2743 + _2737;
    int _2747 = _2745 + 1;
    bool _2749 = uint(_2733) >= uint(_2182);
    bool _2751 = !_2226;
    int _2753 = _2751 ? _2741 : (-1);
    int _2755 = _2200 * _2747;
    int _2757 = _2755 + _2589;
    bool _2759 = !_2749;
    int _2761 = _2759 ? 0 : (-1);
    int _2763 = _2753 & 3;
    bool _2765 = _2763 != 0;
    float _2767 = -_2155;
    float _2769 = _2767 + 1.0;
    bool _2771 = !_2493;
    int _2773 = _2771 ? _2757 : (-1);
    float _2775 = _2313 * _2157;
    int _2777 = ~_2721;
    int _2779 = _2777 + _2761;
    int _2781 = _2779 + 1;
    int _2783 = _2773 >> 31;
    int _2785 = _2753 >> 31;
    int _2787 = _2182 * _2781;
    int _2789 = _2787 + _2479;
    int _2791 = _2783 & 3;
    int _2793 = _2753 & 3;
    bool _2795 = _2793 != 0;
    int _2797 = _2785 & 3;
    bool _2799 = _2763 != 3;
    int _2801 = _2773 + _2791;
    int _2803 = _2795 ? 0 : 1;
    int _2805 = _2753 + _2797;
    bool _2807 = uint(_2763) >= 2u;
    int _2809 = _2801 >> 2;
    int _2811 = _2805 >> 2;
    int _2813 = _2807 ? 0 : 1;
    int _2815 = _2809 << 4;
    int _2817 = _2815 + 512;
    int _2819 = int(_2641) + int(_2707);
    int _2821 = _2811 << 4;
    int _2823 = _2821 + 368;
    int _2825 = ~_2813;
    int _2827 = _2825 + 1;
    int _2829 = _2827 + 1;
    int _2831 = _2254 * _2819;
    int _2833 = _2831 + _2533;
    bool _2835 = uint(_2763) > 1u;
    int _2837 = _2829;
    if (_2799)
    {
        int _2839 = ~_2813;
        int _2841 = _2839 + 1;
        _2837 = _2841;
    }
    int _2843 = _2837;
    uint _2845 = uint(int(uint(_2817) >> uint(2)));
    uint _2847 = uint(int(uint(int(_2845)) >> uint(2)));
    int _2849 = int(_2845) & 3;
    float _2851 = (*spvDescriptorSet0.vp_c9)._m0[int(_2847)][_2849];
    int _2853 = int(_2845) + 1;
    uint _2855 = uint(int(uint(_2853) >> uint(2)));
    int _2857 = _2853 & 3;
    float _2859 = (*spvDescriptorSet0.vp_c9)._m0[int(_2855)][_2857];
    bool _2861 = _2763 != 3;
    int _2863 = ~_2803;
    int _2865 = _2863 + 1;
    int _2867 = _2865 + 1;
    bool _2869 = !_2226;
    int _2871 = _2869 ? _2789 : (-1);
    bool _2873 = !_2765;
    int _2875 = _2873 ? 0 : 1;
    uint _2877 = uint(int(uint(_2823) >> uint(2)));
    uint _2879 = uint(int(uint(int(_2877)) >> uint(2)));
    int _2881 = int(_2877) & 3;
    float _2883 = (*spvDescriptorSet0.vp_c9)._m0[int(_2879)][_2881];
    int _2885 = int(_2877) + 1;
    uint _2887 = uint(int(uint(_2885) >> uint(2)));
    int _2889 = _2885 & 3;
    float _2891 = (*spvDescriptorSet0.vp_c9)._m0[int(_2887)][_2889];
    int _2893 = _2867;
    if (!_2835)
    {
        int _2895 = ~_2803;
        int _2897 = _2895 + 1;
        _2893 = _2897;
    }
    int _2899 = _2893;
    bool _2901 = uint(_2833) >= uint(_2200);
    int _2903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2905 = _2903 != 0;
    int _2907 = _2773 & 3;
    bool _2909 = _2907 != 0;
    int _2911 = _2817 + 8;
    uint _2913 = uint(int(uint(_2911) >> uint(2)));
    uint _2915 = uint(int(uint(int(_2913)) >> uint(2)));
    int _2917 = int(_2913) & 3;
    float _2919 = (*spvDescriptorSet0.vp_c9)._m0[int(_2915)][_2917];
    int _2921 = int(_2913) + 1;
    uint _2923 = uint(int(uint(_2921) >> uint(2)));
    int _2925 = _2921 & 3;
    float _2927 = (*spvDescriptorSet0.vp_c9)._m0[int(_2923)][_2925];
    int _2929 = _2773 & 3;
    bool _2931 = _2929 != 0;
    bool _2933 = !_2905;
    int _2935 = _2933 ? 0 : 1;
    bool _2937 = uint(_2929) > 1u;
    bool _2939 = !_2901;
    int _2941 = _2939 ? 0 : (-1);
    int _2943 = _2823 + 8;
    uint _2945 = uint(int(uint(_2943) >> uint(2)));
    uint _2947 = uint(int(uint(int(_2945)) >> uint(2)));
    int _2949 = int(_2945) & 3;
    float _2951 = (*spvDescriptorSet0.vp_c9)._m0[int(_2947)][_2949];
    int _2953 = int(_2945) + 1;
    uint _2955 = uint(int(uint(_2953) >> uint(2)));
    int _2957 = _2953 & 3;
    float _2959 = (*spvDescriptorSet0.vp_c9)._m0[int(_2955)][_2957];
    bool _2961 = _2929 != 3;
    int _2963 = _2909 ? 0 : 1;
    bool _2965 = !_2861;
    int _2967 = _2965 ? 0 : (-1);
    bool _2969 = uint(_2929) >= 2u;
    int _2971 = ~_2963;
    int _2973 = _2971 + 1;
    int _2975 = _2973 + 1;
    int _2977 = ~_2819;
    int _2979 = _2977 + _2941;
    int _2981 = _2979 + 1;
    int _2983 = _2975;
    if (!_2937)
    {
        int _2985 = ~_2963;
        int _2987 = _2985 + 1;
        _2983 = _2987;
    }
    int _2989 = _2983;
    int _2991 = _2969 ? 0 : 1;
    bool _2993 = _2929 != 3;
    bool _2995 = _545 > 0.5;
    int _2997 = _2200 * _2981;
    int _2999 = _2997 + _2533;
    int _3001 = abs(_2989);
    int _3003 = ~_2991;
    int _3005 = _3003 + 1;
    int _3007 = _3005 + 1;
    int _3009 = abs(_2899);
    int _3011 = _3007;
    if (_2961)
    {
        int _3013 = ~_2991;
        int _3015 = _3013 + 1;
        _3011 = _3015;
    }
    int _3017 = _3011;
    bool _3019 = _547 > 0.5;
    bool _3021 = !_2493;
    int _3023 = _3021 ? _2999 : (-1);
    float _3025 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3027 = int(_3025);
    bool _3029 = _549 > 0.5;
    int _3031 = ~_3001;
    int _3033 = _3031 + 1;
    int _3035 = _3033 + 1;
    bool _3037 = !_2931;
    int _3039 = _3037 ? 0 : 1;
    int _3041 = ~_3009;
    int _3043 = _3041 + 1;
    int _3045 = _3043 + 1;
    int _3047 = _3035 * as_type<int>(_2859);
    int _3049 = abs(_2875);
    int _3051 = abs(_3039);
    int _3053 = _3045 * as_type<int>(_2891);
    int _3055 = abs(_2843);
    float _3057 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3059 = int(_3057);
    int _3061 = abs(_2967);
    int _3063 = abs(_3017);
    int _3065 = ~_3049;
    int _3067 = _3065 + 1;
    int _3069 = _3067 + 1;
    int _3071 = ~_3051;
    int _3073 = _3071 + 1;
    int _3075 = _3073 + 1;
    int _3077 = _3069 * as_type<int>(_2883);
    int _3079 = _3077 + _3053;
    float _3081 = -_191;
    int _3083 = _2208 ? as_type<int>(_3081) : as_type<int>(_191);
    int _3085 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3087 = _3085 != 0;
    int _3089 = _3075 * as_type<int>(_2851);
    int _3091 = _3089 + _3047;
    int _3093 = ~_3055;
    int _3095 = _3093 + 1;
    int _3097 = _3095 + 1;
    int _3099 = ~_3063;
    int _3101 = _3099 + 1;
    int _3103 = _3101 + 1;
    bool _3105 = !_3087;
    int _3107 = _3105 ? 0 : 1;
    int _3109 = _3097 * as_type<int>(_2951);
    int _3111 = _3109 + _3079;
    int _3113 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3115 = _3113 != 0;
    int _3117 = _3103 * as_type<int>(_2919);
    int _3119 = _3117 + _3091;
    int _3121 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3123 = _3121 != 0;
    int _3125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3127 = _3125 != 0;
    bool _3129 = !_2993;
    int _3131 = _3129 ? 0 : (-1);
    int _3133 = ~_3061;
    int _3135 = _3133 + 1;
    int _3137 = _3135 + 1;
    int _3139 = abs(_3107);
    int _3141 = abs(_3131);
    int _3143 = _3137 * as_type<int>(_2959);
    int _3145 = _3143 + _3111;
    float _3147 = float(uint(_3027));
    float _3149 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3151 = float(uint(_3059));
    int _3153 = ~_3139;
    int _3155 = _3153 + 1;
    int _3157 = _3155 + 1;
    float _3159 = 1.0 / _3147;
    int _3161 = ~_3141;
    int _3163 = _3161 + 1;
    int _3165 = _3163 + 1;
    float _3167 = -_1389;
    float _3169 = fma(_3167, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3149);
    int _3171 = abs(_2935);
    int _3173 = _3145 * _3157;
    int _3175 = abs(_3027);
    int _3177 = _3165 * as_type<int>(_2927);
    int _3179 = _3177 + _3119;
    int _3181 = ~_3171;
    int _3183 = _3181 + 1;
    int _3185 = _3183 + 1;
    float _3187 = 1.0 / _3151;
    float _3189 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3191 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3193 = float(uint(_3175));
    int _3195 = abs(_3059);
    float _3197 = -_1389;
    float _3199 = fma(_3197, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3191);
    int _3201 = ~_3175;
    int _3203 = _3201 + 1;
    float _3205 = 1.0 / _3193;
    float _3207 = -_1389;
    float _3209 = fma(_3207, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3189);
    int _3211 = _3179 * _3185;
    float _3213 = float(uint(_3195));
    int _3215 = _2871 * _3139;
    int _3217 = _3215 + _3173;
    float _3219 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3209);
    int _3221 = _3023 * _3171;
    int _3223 = _3221 + _3211;
    int _3225 = as_type<int>(_3159) + (-2);
    float _3227 = 1.0 / _3213;
    float _3229 = float(uint(_3217));
    float _3231 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3169);
    int _3233 = as_type<int>(_3187) + (-2);
    float _3235 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3199);
    float _3237 = float(uint(_3223));
    float _3239 = _1413 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3241 = _1413 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3243 = abs(_3217);
    float _3245 = as_type<float>(_3225) * _3229;
    float _3247 = as_type<float>(_3233) * _3237;
    float _3249 = _1413 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3251 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3239);
    float _3253 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3241);
    int _3255 = as_type<int>(_3205) + (-2);
    float _3257 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3249);
    float _3259 = float(uint(_3243));
    float _3261 = trunc(_3247);
    float _3263 = precise::max(_3261, 0.0);
    uint _3265 = uint(_3263);
    float _3267 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3269 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3271 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3273 = as_type<float>(_3255) * _3259;
    float _3275 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3267);
    float _3277 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3269);
    float _3279 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3271);
    float _3281 = abs(_1707);
    float _3283 = log2(_3281);
    float _3285 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3275);
    int _3287 = ~_3059;
    int _3289 = _3287 + 1;
    float _3291 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3277);
    float _3293 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3279);
    int _3295 = abs(_3223);
    float _3297 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3251);
    int _3299 = as_type<int>(_3227) + (-2);
    float _3301 = trunc(_3245);
    float _3303 = precise::max(_3301, 0.0);
    uint _3305 = uint(_3303);
    int _3307 = _3289 * int(_3265);
    int _3309 = _3307 + _3223;
    int _3311 = ~_3027;
    int _3313 = _3311 + 1;
    float _3315 = float(uint(_3309));
    float _3317 = trunc(_3273);
    float _3319 = precise::max(_3317, 0.0);
    uint _3321 = uint(_3319);
    float _3323 = float(uint(_3295));
    float _3325 = _3283 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3327 = as_type<float>(_3233) * _3315;
    float _3329 = as_type<float>(_3299) * _3323;
    int _3331 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3333 = _3331 != 0;
    int _3335 = _3313 * int(_3305);
    int _3337 = _3335 + _3217;
    float _3339 = exp2(_3325);
    bool _3341 = !_3115;
    float _3343 = _3341 ? _191 : as_type<float>(_3083);
    bool _3345 = _3059 == 0;
    float _3347 = float(uint(_3337));
    int _3349 = _3203 * int(_3321);
    int _3351 = _3349 + _3243;
    float _3353 = trunc(_3329);
    float _3355 = precise::max(_3353, 0.0);
    uint _3357 = uint(_3355);
    bool _3359 = _1707 <= 8000.0;
    bool _3361 = isnan(_1707);
    bool _3363 = _3359 || _3361;
    bool _3365 = isnan(8000.0);
    bool _3367 = _3363 || _3365;
    float _3369 = float(_3367);
    float _3371 = float(uint(_3351));
    float _3373 = as_type<float>(_3225) * _3347;
    float _3375 = -_191;
    int _3377 = _3019 ? as_type<int>(_3375) : as_type<int>(_191);
    float _3379 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3253);
    float _3381 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3257);
    float _3383 = as_type<float>(_3255) * _3371;
    int _3385 = ~_3195;
    int _3387 = _3385 + 1;
    float _3389 = fma(_3339, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3391 = precise::clamp(_3389, 0.0, 1.0);
    bool _3393 = !_3123;
    float _3395 = _3393 ? _191 : as_type<float>(_3377);
    float _3397 = trunc(_3373);
    float _3399 = precise::max(_3397, 0.0);
    uint _3401 = uint(_3399);
    float _3403 = -_187;
    int _3405 = _2995 ? as_type<int>(_3403) : as_type<int>(_187);
    float _3407 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3409 = -_187;
    int _3411 = _3029 ? as_type<int>(_3409) : as_type<int>(_187);
    int _3413 = _3387 * int(_3357);
    int _3415 = _3413 + _3295;
    bool _3417 = !_3333;
    float _3419 = _3417 ? _187 : as_type<float>(_3405);
    float _3421 = _3407 * _3219;
    bool _3423 = !_3127;
    float _3425 = _3423 ? _187 : as_type<float>(_3411);
    float _3427 = trunc(_3327);
    float _3429 = precise::max(_3427, 0.0);
    uint _3431 = uint(_3429);
    float _3433 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3435 = float(uint(_3415));
    float _3437 = _3407 * _3231;
    float _3439 = fma(_3433, _3297, _3421);
    out.m_74.x = _3297;
    out.m_74.y = _3379;
    out.m_74.z = _3381;
    float _3441 = as_type<float>(_3299) * _3435;
    float _3443 = trunc(_3383);
    float _3445 = precise::max(_3443, 0.0);
    uint _3447 = uint(_3445);
    float _3449 = fma(_3391, -2.0, 3.0);
    float _3451 = _3391 * _3391;
    float _3453 = _3407 * _3235;
    float _3455 = fma(_3433, _3379, _3437);
    int _3457 = int(_3305) + int(_3401);
    float _3459 = _3451 * _3449;
    float _3461 = fma(_3433, _3381, _3453);
    float _3463 = trunc(_3441);
    float _3465 = precise::max(_3463, 0.0);
    uint _3467 = uint(_3465);
    int _3469 = int(_3265) + int(_3431);
    float _3471 = -_3459;
    float _3473 = _3471 + 1.0;
    int _3475 = ~_3027;
    int _3477 = _3475 + 1;
    int _3479 = ~_3059;
    int _3481 = _3479 + 1;
    float _3483 = fma(_3473, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3459);
    int _3485 = ~_3175;
    int _3487 = _3485 + 1;
    int _3489 = _3477 * _3457;
    int _3491 = _3489 + _3217;
    int _3493 = int(_3321) + int(_3447);
    int _3495 = _3481 * _3469;
    int _3497 = _3495 + _3223;
    int _3499 = ~_3195;
    int _3501 = _3499 + 1;
    float _3503 = _3369 * _3483;
    bool _3505 = uint(_3491) >= uint(_3027);
    int _3507 = _3487 * _3493;
    int _3509 = _3507 + _3243;
    bool _3511 = uint(_3497) >= uint(_3059);
    float _3513 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3515 = int(_3357) + int(_3467);
    float _3517 = _3503 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _3519 = !_3505;
    int _3521 = _3519 ? 0 : (-1);
    bool _3523 = !_3511;
    int _3525 = _3523 ? 0 : (-1);
    int _3527 = _3501 * _3515;
    int _3529 = _3527 + _3295;
    bool _3531 = uint(_3509) >= uint(_3175);
    float _3533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3535 = ~_3457;
    int _3537 = _3535 + _3521;
    int _3539 = _3537 + 1;
    float _3541 = _2769 * _3517;
    float _3543 = precise::clamp(_3541, 0.0, 1.0);
    bool _3545 = uint(_3529) >= uint(_3195);
    int _3547 = ~_3469;
    int _3549 = _3547 + _3525;
    int _3551 = _3549 + 1;
    int _3553 = _3027 * _3539;
    int _3555 = _3553 + _3217;
    int _3557 = _3223 ^ _3059;
    float _3559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3561 = _3217 ^ _3027;
    int _3563 = _3059 * _3551;
    int _3565 = _3563 + _3223;
    bool _3567 = _3027 == 0;
    float _3569 = _3513 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3571 = _3027 == 0;
    bool _3573 = !_3545;
    int _3575 = _3573 ? 0 : (-1);
    uint _3577 = uint(int(uint(_3557) >> uint(31)));
    bool _3579 = !_3531;
    int _3581 = _3579 ? 0 : (-1);
    uint _3583 = uint(int(uint(_3561) >> uint(31)));
    bool _3585 = _3059 == 0;
    float _3587 = _3559 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3589 = ~_3575;
    int _3591 = _3515 + _3589;
    int _3593 = _3591 + 1;
    int _3595 = ~int(_3577);
    int _3597 = _3595 + 1;
    float _3599 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3601 = ~_3581;
    int _3603 = _3493 + _3601;
    int _3605 = _3603 + 1;
    int _3607 = ~int(_3583);
    int _3609 = _3607 + 1;
    int _3611 = _3593 ^ _3597;
    float _3613 = fma(_3407, _3407, 1.0);
    int _3615 = _3605 ^ _3609;
    bool _3617 = !_3567;
    int _3619 = _3617 ? _3555 : (-1);
    int _3621 = ~_3609;
    int _3623 = _3621 + _3615;
    int _3625 = _3623 + 1;
    float _3627 = rsqrt(_3613);
    bool _3629 = !_3345;
    int _3631 = _3629 ? _3565 : (-1);
    float _3633 = float(_3619);
    int _3635 = ~_3597;
    int _3637 = _3635 + _3611;
    int _3639 = _3637 + 1;
    float _3641 = float(_3631);
    float _3643 = fma(_3569, _3633, _643);
    bool _3645 = !_3571;
    int _3647 = _3645 ? _3625 : (-1);
    float _3649 = _3419 + 0.5;
    float _3651 = _2178 * _2775;
    float _3653 = fma(_3587, _3641, _1183);
    bool _3655 = !_3585;
    int _3657 = _3655 ? _3639 : (-1);
    float _3659 = fma(_3569, _3649, _3643);
    float _3661 = float(_3647);
    float _3663 = _3533 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3665 = float(_3657);
    float _3667 = _3599 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3669 = _3395 + (-0.5);
    float _3671 = -_1097;
    float _3673 = fma(_3663, _3661, _3671);
    float _3675 = _3407 * _3627;
    float _3677 = -_1205;
    float _3679 = fma(_3667, _3665, _3677);
    float _3681 = _3425 + 0.5;
    float _3683 = -_3663;
    float _3685 = fma(_3683, _3669, _3673);
    float _3687 = -_3291;
    float _3689 = _3675 * _3687;
    float _3691 = _3343 + (-0.5);
    float _3693 = fma(_3587, _3681, _3653);
    float _3695 = -_3285;
    float _3697 = _3675 * _3695;
    float _3699 = fma(_3627, _3231, _3689);
    float _3701 = -_1197;
    float _3703 = _3701 + 1.0;
    float _3705 = -_3293;
    float _3707 = _3675 * _3705;
    float _3709 = -_3667;
    float _3711 = fma(_3709, _3691, _3679);
    float _3713 = fma(_3627, _3219, _3697);
    float _3715 = -_3703;
    float _3717 = fma(_3419, _3715, _3659);
    float _3719 = fma(_3627, _3235, _3707);
    float _3721 = in.m_76.x;
    float _3723 = -_1143;
    float _3725 = _3723 + 1.0;
    float _3727 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2256);
    float _3729 = -_1189;
    float _3731 = _3729 + 1.0;
    out.m_78.x = _3713;
    out.m_78.y = _3699;
    out.m_78.z = _3719;
    float _3733 = fma(_3395, _3725, _3685);
    float _3735 = _2071 * 0.5;
    float _3737 = _3727 + _2071;
    float _3739 = _2115 + _2071;
    float _3741 = -_3731;
    float _3743 = fma(_3425, _3741, _3693);
    float _3745 = fma(_2127, -0.5, _3735);
    float _3747 = _3285 + _3439;
    float _3749 = _3737 * 0.5;
    float _3751 = _3739 * 0.5;
    float _3753 = fma(_3343, _2212, _3711);
    float _3755 = -_2313;
    float _3757 = _3755 + 1.0;
    float _3759 = _3291 + _3455;
    float _3761 = _3293 + _3461;
    float _3763 = fma(_2168, _3651, _2166);
    float _3765 = -_3543;
    float _3767 = fma(_3765, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3769 = _2168 * _2775;
    out.m_80.x = _3751;
    out.m_80.y = _3745;
    out.m_80.z = _3749;
    out.m_80.w = _2071;
    bool _3771 = _1849 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3773 = isnan(_1849);
    bool _3775 = _3771 || _3773;
    bool _3777 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3779 = _3775 || _3777;
    float _3781 = _3767 * _3721;
    float _3783 = fma(_2174, _3769, _2162);
    float _3785 = fma(_2176, _3769, _2164);
    float _3787 = _2168 * _3757;
    float _3789 = _3781 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_82.x = _3717;
    out.m_82.y = _3733;
    out.m_82.z = _3743;
    out.m_82.w = _3753;
    out.m_84.x = _3789;
    float _3791 = _3711;
    float _3793 = _3719;
    float _3795 = _3769;
    float _3797 = _3757;
    if (!_3779)
    {
        _2244 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3799 = _2244;
    out.m_86.x = _3783;
    out.m_86.y = _3785;
    out.m_86.z = _3763;
    out.m_86.w = _3787;
    float _3801 = _3799;
    float _3803 = _3799;
    if (!_3779)
    {
        _3791 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3805 = _3791;
    float _3807 = _3805;
    float _3809 = _3805;
    if (!_3779)
    {
        _3793 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3811 = _3793;
    out.m_88.x = _3747;
    out.m_88.y = _3759;
    out.m_88.z = _3761;
    float _3813 = _3811;
    float _3815 = _3811;
    if (!_3779)
    {
        _3795 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3817 = _3795;
    float _3819 = _3817;
    float _3821 = _3817;
    if (!_3779)
    {
        _3797 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3823 = _3797;
    out.gl_Position.x = _2115;
    out.gl_Position.y = _2127;
    out.gl_Position.z = _3727;
    out.gl_Position.w = _2071;
    float _3825 = _1825 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3827 = _3823;
    float _3829 = _3823;
    if (!_3779)
    {
        _2246 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3831 = _2246;
    bool _3833 = !_3779;
    float _3835 = _3831;
    float _3837 = _3831;
    if (!_3833)
    {
        bool _3839 = _1849 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3841 = isnan(_1849);
        bool _3843 = _3839 || _3841;
        bool _3845 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3847 = _3843 || _3845;
        if (!_3847)
        {
            float _3849 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3851 = _1849 + _3849;
            float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3855 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3853;
            float _3857 = 1.0 / _3855;
            float _3859 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3861 = _3859 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3863 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3865 = _3863 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3867 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3869 = _3867 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3871 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3873 = _3871 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3875 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3877 = _3875 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3879 = _3851 * _3857;
            float _3881 = precise::clamp(_3879, 0.0, 1.0);
            float _3883 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3885 = _3883 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3887 = fma(_3881, _3861, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3889 = fma(_3881, _3885, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3891 = fma(_3881, _3865, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3893 = fma(_3881, _3869, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3895 = fma(_3881, _3873, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3897 = fma(_3881, _3877, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3837 = _3889;
            _3821 = _3895;
            _3803 = _3887;
            _3815 = _3893;
            _3809 = _3891;
            _3829 = _3897;
            _3899 = true;
        }
        else
        {
            bool _3901 = _1849 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3903 = isnan(_1849);
            bool _3905 = _3901 || _3903;
            bool _3907 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3909 = _3905 || _3907;
            if (!_3909)
            {
                _3801 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3911 = _3801;
            _3803 = _3911;
            if (!_3909)
            {
                _3835 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3913 = _3835;
            _3837 = _3913;
            if (!_3909)
            {
                _3807 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3915 = _3807;
            _3809 = _3915;
            if (!_3909)
            {
                _3813 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3917 = _3813;
            _3815 = _3917;
            if (!_3909)
            {
                _3819 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3919 = _3819;
            _3821 = _3919;
            if (!_3909)
            {
                _3827 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3921 = _3827;
            bool _3923 = !_3909;
            _3829 = _3921;
            if (!_3923)
            {
                bool _3925 = _1849 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3927 = isnan(_1849);
                bool _3929 = _3925 || _3927;
                bool _3931 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3933 = _3929 || _3931;
                if (!_3933)
                {
                    float _3935 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3937 = _1849 + _3935;
                    float _3939 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3941 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3939;
                    float _3943 = 1.0 / _3941;
                    float _3945 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3947 = _3945 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3949 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3951 = _3949 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3953 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3955 = _3953 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3957 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3959 = _3957 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3961 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3963 = _3961 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3965 = _3937 * _3943;
                    float _3967 = precise::clamp(_3965, 0.0, 1.0);
                    float _3969 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3971 = _3969 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3973 = fma(_3967, _3947, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3975 = fma(_3967, _3971, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3977 = fma(_3967, _3951, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3979 = fma(_3967, _3955, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3981 = fma(_3967, _3959, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3983 = fma(_3967, _3963, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3837 = _3975;
                    _3821 = _3981;
                    _3803 = _3973;
                    _3815 = _3979;
                    _3809 = _3977;
                    _3829 = _3983;
                    _3899 = true;
                }
                else
                {
                    _3837 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3821 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3803 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3815 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3809 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3829 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3899 = false;
    float _3985 = _3837;
    float _3987 = _3821;
    float _3989 = _3803;
    float _3991 = _3815;
    float _3993 = _3809;
    float _3995 = _3829;
    float _3997 = fma(_3759, -0.5, 0.5);
    float _3999 = precise::clamp(_3997, 0.0, 1.0);
    float _4001 = -_3985;
    float _4003 = _4001 + _3987;
    float _4005 = _3825 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4007 = -_3989;
    float _4009 = _4007 + _3991;
    float _4011 = fma(_3999, _4003, _3985);
    out.m_90.x = 0.0;
    float _4013 = -_3993;
    float _4015 = _4013 + _3995;
    float _4017 = fma(_3999, _4009, _3989);
    float _4019 = _4011 * 0.586610972881317138671875;
    out.m_49.x = _4005;
    bool _4021 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4023 = fma(_3999, _4015, _3993);
    float _4025 = fma(_4017, 0.298911988735198974609375, _4019);
    bool _4027 = _1825 > 0.0;
    bool _4029 = isnan(_1825);
    bool _4031 = _4027 || _4029;
    bool _4033 = isnan(0.0);
    bool _4035 = _4031 || _4033;
    float _4037 = fma(_4023, 0.114477999508380889892578125, _4025);
    float _4039 = -_4037;
    float _4041 = _4017 + _4039;
    float _4043 = -_4037;
    float _4045 = _4011 + _4043;
    float _4047 = -_4037;
    float _4049 = _4023 + _4047;
    float _4051 = fma(_4041, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4037);
    float _4053 = fma(_4045, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4037);
    float _4055 = fma(_4049, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4037);
    bool _4057 = !_4021;
    if (!_4057)
    {
        float _4059 = -_1761;
        float _4061 = _4059 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4063 = -_1763;
        float _4065 = _4063 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4067 = -_1765;
        float _4069 = _4067 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4071 = _4061 * _4061;
        float _4073 = fma(_4065, _4065, _4071);
        float _4075 = fma(_4069, _4069, _4073);
        float _4077 = sqrt(_4075);
        float _4079 = rsqrt(_4075);
        float _4081 = -_4077;
        float _4083 = _4081 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4085 = _4083 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4087 = precise::clamp(_4085, 0.0, 1.0);
        float _4089 = _4065 * _4079;
        float _4091 = _4061 * _4079;
        float _4093 = abs(_4087);
        float _4095 = log2(_4093);
        float _4097 = _4069 * _4079;
        float _4099 = _4089 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4101 = _3759 * _4091;
        float _4103 = -_4091;
        float _4105 = -_4099;
        float _4107 = fma(_4103, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4105);
        float _4109 = fma(_3747, _4089, _4101);
        float _4111 = -_4097;
        float _4113 = fma(_4111, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4107);
        float _4115 = fma(_3761, _4097, _4109);
        float _4117 = precise::clamp(_4115, 0.0, 1.0);
        float _4119 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4121 = _4113 + _4119;
        float _4123 = _4095 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4125 = _4121 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4127 = precise::clamp(_4125, 0.0, 1.0);
        float _4129 = exp2(_4123);
        float _4131 = _4129 * _4127;
        float _4133 = _4117 * _4131;
        float _4135 = _4133 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4137 = _4133 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4139 = _4133 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _4135;
        out.m_90.y = _4137;
        out.m_90.z = _4139;
    }
    out.m_68.x = _4051;
    out.m_68.y = _4053;
    out.m_68.z = _4055;
    if (_4035)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _4141 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4141;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

