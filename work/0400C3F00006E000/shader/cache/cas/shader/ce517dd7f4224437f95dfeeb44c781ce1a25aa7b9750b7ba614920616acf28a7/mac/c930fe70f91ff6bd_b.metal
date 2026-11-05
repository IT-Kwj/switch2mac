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
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_20 [[id(7)]];
    sampler vp_t_tcb_20Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_20Smplr_w [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_74 [[user(locn0)]];
    float4 m_76 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_94 [[user(locn3)]];
    float4 m_98 [[user(locn4)]];
    float4 m_104 [[user(locn5)]];
    float4 m_100 [[user(locn6)]];
    float4 m_106 [[user(locn7)]];
    float4 m_86 [[user(locn8)]];
    float4 m_96 [[user(locn9)]];
    float4 m_114 [[user(locn10)]];
    float4 m_108 [[user(locn11)]];
    float4 m_57 [[user(locn12)]];
    float4 m_102 [[user(locn13)]];
    float4 m_110 [[user(locn14)]];
    float4 m_112 [[user(locn15)]];
    float4 m_80 [[user(locn16)]];
    float4 m_84 [[user(locn17)]];
    float4 m_92 [[user(locn18)]];
    float4 m_82 [[user(locn19)]];
    float4 m_90 [[user(locn20)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_78 [[attribute(0)]];
    float4 m_64 [[attribute(1)]];
    float4 m_66 [[attribute(2)]];
    float4 m_68 [[attribute(3)]];
    float4 m_88 [[attribute(4)]];
    float4 m_62 [[attribute(5)]];
    float4 m_50 [[attribute(6)]];
    float4 m_52 [[attribute(7)]];
    float4 m_70 [[attribute(8)]];
    float4 m_72 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_114 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_110 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_112 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5151 = false;
    bool _4200 = false;
    bool _609 = false;
    bool _473 = false;
    bool _275 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _128 = in.m_50.w;
    float _130 = in.m_52.w;
    float _132 = trunc(_128);
    int _135 = int(_132);
    float _137 = -_130;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.y = _139;
    bool _143 = _135 >= 1;
    float _145 = 0.0;
    float _147 = _130;
    float _149 = _139;
    if (!_143)
    {
        _145 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _145;
    if (!_143)
    {
        out.m_57.x = 0.0;
    }
    int _153 = 0;
    if (!_143)
    {
        float _155 = _151 * 5.0;
        _153 = as_type<int>(_155);
    }
    int _157 = _153;
    int _159 = _157;
    if (!_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5461 = as_type<float>(_157);
        out.gl_Position.z = _5461;
    }
    if (!_143)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _161 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _163 = isnan(_130);
    bool _165 = _161 || _163;
    bool _167 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _169 = _165 || _167;
    float _171 = float(_135);
    bool _173 = _139 >= _171;
    bool _175 = !_169;
    bool _177 = _173 || _175;
    float _179 = 1.0 / _171;
    if (_177)
    {
        _147 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _181 = _147;
    if (_177)
    {
        out.m_57.x = 0.0;
    }
    float _183 = _139 * _179;
    float _185 = _183;
    if (_177)
    {
        float _187 = _181 * 5.0;
        _159 = as_type<int>(_187);
    }
    int _189 = _159;
    out.m_55.x = _183;
    if (_177)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5524 = as_type<float>(_189);
        out.gl_Position.z = _5524;
    }
    if (_177)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _191 = as_type<float>(int(gl_VertexIndex));
    float _193 = in.m_62.x;
    float _195 = in.m_62.y;
    float _197 = in.m_62.z;
    float _199 = in.m_64.x;
    float _201 = in.m_64.y;
    float _203 = in.m_64.z;
    float _205 = in.m_66.x;
    float _207 = in.m_66.y;
    float _209 = in.m_66.z;
    float _211 = in.m_68.x;
    float _213 = in.m_68.y;
    float _215 = in.m_68.z;
    int _217 = as_type<int>(_191) & 1;
    bool _219 = _217 != 0;
    int _221 = as_type<int>(_191) & 2;
    bool _223 = _221 != 0;
    bool _225 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _227 = !_223;
    float _229 = _227 ? (-0.5) : 0.5;
    float _231 = _195 * _201;
    float _233 = _195 * _207;
    float _235 = fma(_193, _199, _231);
    float _237 = _195 * _213;
    float _239 = fma(_193, _205, _233);
    bool _241 = !_219;
    float _243 = _241 ? (-0.5) : 0.5;
    float _245 = fma(_193, _211, _237);
    float _247 = fma(_197, _203, _235);
    float _249 = fma(_197, _209, _239);
    float _251 = fma(_197, _215, _245);
    bool _253 = !_225;
    float _255 = _247;
    float _273;
    if (!_253)
    {
        float _257 = in.m_70.x;
        float _259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _261 = _257 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _265 = _263 * _259;
        float _267 = floor(_265);
        float _269 = -_267;
        float _271 = _265 + _269;
        _273 = _271;
        _275 = true;
    }
    else
    {
        _273 = _183;
    }
    _275 = false;
    float _277 = _273;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _281 = _277 + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _285 = _277 + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _293 = _291 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _295;
    bool _299 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _301 = isnan(_277);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = 1.0 / _289;
    bool _313 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _315 = 1.0 / _293;
    float _317 = 1.0 / _297;
    float _319 = _281 * _311;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _277 + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _325;
    float _329 = fma(_327, _319, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _331 = _323 * _315;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _333;
    bool _337 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _339 = isnan(_277);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = fma(_335, _319, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _351 = -_347;
    float _353 = _351 + 1.0;
    float _355 = _285 * _317;
    float _357 = -_309;
    float _359 = _357 + 1.0;
    bool _361 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _363 = isnan(_277);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = _347 * _359;
    bool _375 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _377 = isnan(_277);
    bool _379 = _375 || _377;
    bool _381 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _383 = _379 || _381;
    float _385 = float(_383);
    float _387 = _371 * _353;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _397 = -_371;
    float _399 = _397 + 1.0;
    float _401 = fma(_391, _331, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _403 = fma(_395, _331, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _405 = _385 * _399;
    float _407 = in.m_72.x;
    float _409 = in.m_72.y;
    float _411 = -_385;
    float _413 = _411 + 1.0;
    float _415 = _329 * _405;
    float _417 = _349 * _405;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _423;
    float _427 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[143].x, _415);
    float _429 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[143].y, _417);
    float _431 = fma(_421, _355, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _433 = fma(_425, _355, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _435 = fma(_401, _387, _427);
    float _437 = fma(_403, _387, _429);
    float _439 = fma(_431, _373, _435);
    float _441 = fma(_433, _373, _437);
    float _443 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[146].x, _439);
    float _445 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[146].y, _441);
    float _447 = _443 * _407;
    float _449 = _445 * _409;
    bool _451 = !_313;
    float _453 = _355;
    float _471;
    if (!_451)
    {
        float _455 = in.m_70.x;
        float _457 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _459 = _455 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _461 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _463 = _461 * _457;
        float _465 = floor(_463);
        float _467 = -_465;
        float _469 = _463 + _467;
        _471 = _469;
        _473 = true;
    }
    else
    {
        _471 = _183;
    }
    _473 = false;
    float _475 = _471;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _479 = _475 + _477;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _485 = _475 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _487 = isnan(_475);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _501 = _475 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _503 = isnan(_475);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _513;
    bool _517 = _475 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _519 = isnan(_475);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    float _529 = 1.0 / _483;
    float _531 = -_495;
    float _533 = _531 + 1.0;
    bool _535 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _537 = _511 * _533;
    float _539 = -_511;
    float _541 = _539 + 1.0;
    float _543 = 1.0 / _499;
    float _545 = _515 * _529;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _551 = fma(_545, _479, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _553 = _549 * _543;
    float _555 = _551 * _537;
    float _557 = -_527;
    float _559 = _557 + 1.0;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _563 = _475 + _561;
    float _565 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[115].x, _555);
    float _567 = _495 * _559;
    float _569 = fma(_553, _563, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _573 = fma(_569, _567, _565);
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _579 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[117].x, _573);
    float _581 = _571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _583 = _575 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _585 = _577 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _587 = _579 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_74.x = _581;
    out.m_74.y = _583;
    out.m_74.z = _585;
    out.m_74.w = _587;
    bool _589 = !_535;
    float _607;
    if (!_589)
    {
        float _591 = in.m_70.x;
        float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _595 = _591 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _597 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[11].w, _139);
        float _599 = _597 * _593;
        float _601 = floor(_599);
        float _603 = -_601;
        float _605 = _599 + _603;
        _607 = _605;
        _609 = true;
    }
    else
    {
        _607 = _183;
    }
    _609 = false;
    float _611 = _607;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _615 = _611 + _613;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _619 = _617 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _625 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _627 = isnan(_611);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _641 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _643 = isnan(_611);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = 1.0 / _619;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _655;
    float _659 = -_635;
    float _661 = _659 + 1.0;
    bool _663 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _665 = isnan(_611);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    bool _675 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _677 = 1.0 / _623;
    float _679 = 1.0 / _639;
    float _681 = _657 * _653;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _685 = _683 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _687 = _651 * _661;
    float _689 = -_651;
    float _691 = _689 + 1.0;
    float _693 = fma(_681, _615, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _695;
    float _699 = _673 * _691;
    float _701 = _685 * _677;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _705 = _611 + _703;
    bool _707 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _709 = isnan(_611);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _715 = _711 || _713;
    float _717 = float(_715);
    float _719 = _693 * _699;
    float _721 = -_673;
    float _723 = _721 + 1.0;
    float _725 = fma(_701, _705, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _729 = _611 + _727;
    float _731 = _697 * _679;
    float _733 = -_717;
    float _735 = _733 + 1.0;
    float _737 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[131].x, _719);
    float _739 = fma(_731, _729, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _741 = _635 * _735;
    float _743 = fma(_725, _687, _737);
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _747 = fma(_739, _741, _743);
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _751 = _745 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _755 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[134].x, _747);
    float _757 = _749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _759 = _753 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = _755 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_76.x = _751;
    out.m_76.y = _757;
    out.m_76.z = _759;
    out.m_76.w = _761;
    bool _763 = !_675;
    float _765 = _757;
    if (!_763)
    {
        float _767 = in.m_70.x;
        float _769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _771 = _767 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[14].x, _139);
        float _775 = _773 * _769;
        float _777 = floor(_775);
        float _779 = -_777;
        float _781 = _775 + _779;
        _185 = _781;
    }
    float _783 = _185;
    float _785 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _787 = int(_785);
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _791 = _789 != 0;
    float _793 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _795 = int(_793);
    float _797 = float(_787);
    float _799 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _801 = int(_799);
    if (_791)
    {
        _453 = 1.0;
    }
    float _803 = _453;
    float _805 = _803;
    if (_791)
    {
        _765 = 1.0;
    }
    float _807 = _765;
    int _809 = 0;
    float _811 = _807;
    if (_791)
    {
        _809 = 0;
    }
    int _813 = _809;
    float _815 = float(_795);
    float _817 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _819 = int(_817);
    float _821 = 1.0 / _797;
    float _823 = float(uint(_801));
    int _825 = ~_801;
    int _827 = _825 + 1;
    float _829 = 1.0 / _815;
    float _831 = float(uint(_819));
    float _833 = _821 * _139;
    float _835 = 1.0 / _823;
    float _837 = _821;
    float _839 = _815;
    int _841 = _813;
    if (_791)
    {
        float _843 = in.m_70.x;
        float _845 = in.m_70.y;
        _837 = _843;
        _839 = _845;
    }
    float _847 = _837;
    float _849 = _839;
    float _851 = _829 * _139;
    float _853 = 1.0 / _831;
    float _855 = trunc(_833);
    int _857 = int(_855);
    int _859 = as_type<int>(_835) + (-2);
    float _861 = trunc(_851);
    int _863 = int(_861);
    int _865 = as_type<int>(_853) + (-2);
    float _867 = 0.0;
    float _869 = _847;
    float _871 = _849;
    if (_791)
    {
        _867 = _849;
    }
    float _873 = _867;
    float _875 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _877 = int(_875);
    float _879 = float(uint(_857));
    float _881 = as_type<float>(_859) * _879;
    int _883 = as_type<int>(_879);
    float _885 = _873;
    if (_791)
    {
        _883 = 0;
    }
    int _887 = _883;
    float _889 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _891 = int(_889);
    float _893 = float(uint(_863));
    float _895 = as_type<float>(_865) * _893;
    float _897 = _893;
    int _899 = _887;
    if (_791)
    {
        _897 = _847;
    }
    float _901 = _897;
    float _903 = trunc(_881);
    float _905 = precise::max(_903, 0.0);
    uint _908 = uint(_905);
    float _910 = float(uint(_877));
    float _912 = 0.0;
    float _914 = _901;
    if (_791)
    {
        _912 = _901;
    }
    float _916 = _912;
    float _918 = 1.0 / _910;
    float _920 = float(_891);
    float _922 = trunc(_895);
    float _924 = precise::max(_922, 0.0);
    uint _926 = uint(_924);
    float _928 = 1.0 / _920;
    float _930 = _920;
    float _932 = _916;
    if (_791)
    {
        _930 = _901;
    }
    float _934 = _930;
    float _936 = _934;
    if (!_791)
    {
        float _938 = in.m_70.x;
        float _940 = in.m_70.y;
        float _942 = in.m_70.z;
        float _944 = _938 * 3.1415927410125732421875;
        float _946 = _944 * 0.15915493667125701904296875;
        float _948 = _940 * 3.1415927410125732421875;
        float _950 = _948 * 0.15915493667125701904296875;
        float _952 = _946 * 6.283185482025146484375;
        float _954 = sin(_952);
        float _956 = _950 * 6.283185482025146484375;
        float _958 = sin(_956);
        _805 = 7.345489978790283203125;
        _869 = _938;
        _914 = _940;
        _811 = 5.839270114898681640625;
        _936 = _942;
        _871 = _940;
        _885 = _958;
        _899 = 1;
        _841 = 2;
        _932 = _954;
    }
    float _960 = _805;
    float _962 = _869;
    float _964 = _914;
    float _966 = _811;
    float _968 = _936;
    float _970 = _871;
    float _972 = _885;
    int _974 = _899;
    int _976 = _841;
    float _978 = _932;
    int _980 = _827 * int(_908);
    int _982 = _980 + _857;
    float _984 = in.m_70.z;
    float _986 = in.m_70.w;
    float _988 = _960 * _962;
    int _990 = ~_819;
    int _992 = _990 + 1;
    float _994 = _960 * _964;
    float _996 = float(uint(_982));
    float _998 = _928 * _139;
    float _1000 = floor(_988);
    int _1002 = _992 * int(_926);
    int _1004 = _1002 + _863;
    float _1006 = _966 * _968;
    float _1008 = as_type<float>(_859) * _996;
    float _1010 = float(_801);
    float _1012 = in.m_78.y;
    float _1014 = float(uint(_1004));
    float _1016 = _447 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1018 = trunc(_998);
    int _1020 = int(_1018);
    float _1022 = float(_857);
    float _1024 = as_type<float>(_865) * _1014;
    int _1026 = as_type<int>(_918) + (-2);
    bool _1028 = _970 > 0.5;
    float _1030 = trunc(_1008);
    float _1032 = precise::max(_1030, 0.0);
    uint _1034 = uint(_1032);
    bool _1036 = _1022 >= _1010;
    bool _1038 = isnan(_1022);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan(_1010);
    bool _1044 = _1040 || _1042;
    float _1046 = float(_1044);
    bool _1048 = _986 > 0.5;
    float _1050 = -_1000;
    float _1052 = _988 + _1050;
    bool _1054 = _984 > 0.5;
    float _1056 = floor(_1006);
    float _1058 = float(uint(_1020));
    int _1060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1062 = _1060 != 0;
    int _1064 = ~_819;
    int _1066 = _1064 + 1;
    float _1068 = as_type<float>(_1026) * _1058;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1072 = _1070 != 0;
    int _1074 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1076 = _1074 != 0;
    int _1078 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1080 = _1078 != 0;
    float _1082 = trunc(_1024);
    float _1084 = precise::max(_1082, 0.0);
    uint _1086 = uint(_1084);
    float _1088 = -_229;
    int _1090 = _1054 ? as_type<int>(_1088) : as_type<int>(_229);
    int _1092 = int(_908) + int(_1034);
    int _1094 = ~_801;
    int _1096 = _1094 + 1;
    int _1098 = int(_1048);
    int _1100 = _1054 ? 2 : 0;
    int _1102 = _1098 | _1100;
    int _1104 = _1062 ? 4 : 0;
    int _1106 = _1102 | _1104;
    int _1108 = _1072 ? 8 : 0;
    int _1110 = _1106 | _1108;
    int _1112 = _1076 ? 16 : 0;
    int _1114 = _1110 | _1112;
    int _1116 = _1080 ? 32 : 0;
    int _1118 = _1114 | _1116;
    int _1120 = _1028 ? 64 : 0;
    int _1122 = _1118 | _1120;
    int _1124 = _1122 & 64;
    float _1126 = trunc(_1068);
    float _1128 = precise::max(_1126, 0.0);
    uint _1130 = uint(_1128);
    float _1132 = -_1056;
    float _1134 = _1006 + _1132;
    float _1136 = -_243;
    int _1138 = _1028 ? as_type<int>(_1136) : as_type<int>(_243);
    int _1140 = _1096 * _1092;
    int _1142 = _1140 + _857;
    bool _1144 = !_1076;
    float _1146 = _1144 ? _243 : as_type<float>(_1138);
    float _1148 = trunc(_1046);
    int _1150 = int(_1148);
    int _1152 = int(_926) + int(_1086);
    bool _1154 = !_1062;
    int _1156 = _1154 ? 0 : 1;
    int _1158 = ~_877;
    int _1160 = _1158 + 1;
    float _1162 = float(_819);
    float _1164 = floor(_994);
    bool _1166 = !_1080;
    float _1168 = _1166 ? _229 : as_type<float>(_1090);
    int _1170 = _1160 * int(_1130);
    int _1172 = _1170 + _1020;
    float _1174 = _1052 * _1010;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1178 = _1176 != 0;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1182 = _1180 != 0;
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1186 = _1184 != 0;
    float _1188 = _1134 * _1162;
    bool _1190 = uint(_1142) >= uint(_801);
    int _1192 = _1066 * _1152;
    int _1194 = _1192 + _863;
    float _1196 = float(_863);
    float _1198 = trunc(_1174);
    int _1200 = int(_1198);
    bool _1202 = !_1182;
    int _1204 = _1202 ? 0 : 1;
    bool _1206 = !_1178;
    int _1208 = _1206 ? 0 : 1;
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1212 = _1210 != 0;
    float _1214 = -_1164;
    float _1216 = _994 + _1214;
    bool _1218 = uint(_1194) >= uint(_819);
    float _1220 = trunc(_1188);
    int _1222 = int(_1220);
    bool _1224 = !_1190;
    int _1226 = _1224 ? 0 : (-1);
    bool _1228 = _1196 >= _1162;
    bool _1230 = isnan(_1196);
    bool _1232 = _1228 || _1230;
    bool _1234 = isnan(_1162);
    bool _1236 = _1232 || _1234;
    float _1238 = float(_1236);
    bool _1240 = !_1186;
    int _1242 = _1240 ? 0 : 1;
    bool _1244 = !_1212;
    int _1246 = _1244 ? 0 : 1;
    bool _1248 = !_1218;
    int _1250 = _1248 ? 0 : (-1);
    float _1252 = trunc(_1238);
    int _1254 = int(_1252);
    float _1256 = float(uint(_1172));
    int _1258 = abs(_1156);
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1262 = _1260 != 0;
    int _1264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1266 = _1264 != 0;
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1270 = _1268 != 0;
    float _1272 = as_type<float>(_1026) * _1256;
    int _1274 = ~_1092;
    int _1276 = _1274 + _1226;
    int _1278 = _1276 + 1;
    int _1280 = _1200 * _1258;
    int _1282 = _1280 + _857;
    int _1284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1286 = _1284 != 0;
    bool _1288 = !_1266;
    int _1290 = _1288 ? 0 : 1;
    int _1292 = _801 * _1278;
    int _1294 = _1292 + _857;
    bool _1296 = !_1286;
    int _1298 = _1296 ? 0 : 1;
    float _1300 = trunc(_1272);
    float _1302 = precise::max(_1300, 0.0);
    uint _1304 = uint(_1302);
    bool _1306 = _801 == 0;
    bool _1308 = _1124 != 0;
    int _1310 = abs(_1298);
    int _1312 = ~_1152;
    int _1314 = _1312 + _1250;
    int _1316 = _1314 + 1;
    bool _1318 = !_1306;
    int _1320 = _1318 ? _1294 : (-1);
    float _1322 = _179 * _139;
    bool _1324 = !_1262;
    int _1326 = _1324 ? 0 : 1;
    int _1328 = _819 * _1316;
    int _1330 = _1328 + _863;
    bool _1332 = _819 == 0;
    float _1334 = _1010 * _1322;
    int _1336 = ~_1150;
    int _1338 = _1336 + 1;
    int _1340 = _1338 + 1;
    float _1342 = _1162 * _1322;
    int _1344 = ~_1254;
    int _1346 = _1344 + 1;
    int _1348 = _1346 + 1;
    int _1350 = _1222 * _1310;
    int _1352 = _1350 + _863;
    bool _1354 = !_1332;
    int _1356 = _1354 ? _1330 : (-1);
    float _1358 = trunc(_1334);
    int _1360 = int(_1358);
    int _1362 = _1320 * _1340;
    int _1364 = _801 + (-1);
    int _1366 = abs(_1204);
    int _1368 = _1356 * _1348;
    int _1370 = _819 + (-1);
    int _1372 = _1150 * _1364;
    int _1374 = _1372 + _1362;
    int _1376 = abs(_1290);
    float _1378 = trunc(_1342);
    int _1380 = int(_1378);
    int _1382 = ~_877;
    int _1384 = _1382 + 1;
    int _1386 = _1254 * _1370;
    int _1388 = _1386 + _1368;
    int _1390 = _1374 * _1366;
    int _1392 = abs(_1208);
    int _1394 = abs(_1242);
    int _1396 = _1388 * _1376;
    int _1398 = abs(_1246);
    int _1400 = _1360 * _1392;
    int _1402 = _1400 + _1390;
    int _1404 = int(_1130) + int(_1304);
    int _1406 = _1282 * _1394;
    int _1408 = _1406 + _1402;
    int _1410 = abs(_1326);
    int _1412 = _1200 * _1398;
    int _1414 = _1412 + _1408;
    float _1416 = -_229;
    int _1418 = _1048 ? as_type<int>(_1416) : as_type<int>(_229);
    int _1420 = _1384 * _1404;
    int _1422 = _1420 + _1020;
    float _1424 = float(_877);
    int _1426 = _1380 * _1410;
    int _1428 = _1426 + _1396;
    bool _1430 = !_1270;
    int _1432 = _1430 ? 0 : 1;
    float _1434 = float(uint(_1414));
    float _1436 = _1424 * _1322;
    bool _1438 = uint(_1422) >= uint(_877);
    float _1440 = -_243;
    int _1442 = _1054 ? as_type<int>(_1440) : as_type<int>(_243);
    float _1444 = float(_1020);
    float _1446 = trunc(_1436);
    int _1448 = int(_1446);
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1452 = _1450 != 0;
    int _1454 = abs(_1432);
    float _1456 = as_type<float>(_859) * _1434;
    bool _1458 = _1444 >= _1424;
    bool _1460 = isnan(_1444);
    bool _1462 = _1458 || _1460;
    bool _1464 = isnan(_1424);
    bool _1466 = _1462 || _1464;
    float _1468 = float(_1466);
    bool _1470 = !_1452;
    int _1472 = _1470 ? 0 : 1;
    int _1474 = _1352 * _1454;
    int _1476 = _1474 + _1428;
    int _1478 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1480 = _1478 != 0;
    float _1482 = trunc(_1468);
    int _1484 = int(_1482);
    bool _1486 = !_1438;
    int _1488 = _1486 ? 0 : (-1);
    bool _1490 = !_1480;
    int _1492 = _1490 ? 0 : 1;
    int _1494 = ~_1404;
    int _1496 = _1494 + _1488;
    int _1498 = _1496 + 1;
    int _1500 = abs(_1492);
    float _1502 = trunc(_1456);
    float _1504 = precise::max(_1502, 0.0);
    uint _1506 = uint(_1504);
    int _1508 = abs(_1472);
    bool _1510 = !_1072;
    float _1512 = _1510 ? _229 : as_type<float>(_1418);
    float _1514 = _1216 * _1424;
    int _1516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1518 = _1516 != 0;
    int _1520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1522 = _1520 != 0;
    int _1524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1526 = _1524 != 0;
    int _1528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1530 = _1528 != 0;
    int _1532 = _1222 * _1508;
    int _1534 = _1532 + _1476;
    int _1536 = ~_801;
    int _1538 = _1536 + 1;
    int _1540 = _877 * _1498;
    int _1542 = _1540 + _1020;
    int _1544 = ~_1484;
    int _1546 = _1544 + 1;
    int _1548 = _1546 + 1;
    float _1550 = trunc(_1514);
    int _1552 = int(_1550);
    bool _1554 = !_1522;
    int _1556 = _1554 ? 0 : 1;
    int _1558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1560 = _1558 != 0;
    bool _1562 = !_1518;
    int _1564 = _1562 ? 0 : 1;
    int _1566 = _1538 * int(_1506);
    int _1568 = _1566 + _1414;
    bool _1570 = _877 == 0;
    float _1572 = float(uint(_1534));
    bool _1574 = !_1570;
    int _1576 = _1574 ? _1542 : (-1);
    float _1578 = float(uint(_1568));
    float _1580 = as_type<float>(_865) * _1572;
    int _1582 = abs(_1556);
    float _1584 = as_type<float>(_1404);
    if (_1560)
    {
        float _1586 = in.m_70.w;
        _1584 = _1586;
    }
    float _1588 = _1584;
    int _1590 = _1576 * _1548;
    int _1592 = _877 + (-1);
    float _1594 = as_type<float>(_859) * _1578;
    float _1596 = trunc(_1580);
    float _1598 = precise::max(_1596, 0.0);
    uint _1600 = uint(_1598);
    int _1602 = abs(_1564);
    int _1604 = _1484 * _1592;
    int _1606 = _1604 + _1590;
    int _1608 = ~_819;
    int _1610 = _1608 + 1;
    int _1612 = _1606 * _1582;
    float _1614 = trunc(_1594);
    float _1616 = precise::max(_1614, 0.0);
    uint _1618 = uint(_1616);
    bool _1620 = _801 == 0;
    int _1622 = _1448 * _1602;
    int _1624 = _1622 + _1612;
    int _1626 = _1552 * _1500;
    int _1628 = _1626 + _1020;
    bool _1630 = !_1526;
    int _1632 = _1630 ? 0 : 1;
    int _1634 = ~_801;
    int _1636 = _1634 + 1;
    int _1638 = _1610 * int(_1600);
    int _1640 = _1638 + _1534;
    int _1642 = abs(_1632);
    float _1644 = as_type<float>(_1500);
    if (_1560)
    {
        float _1646 = _1588 * 3.1415927410125732421875;
        _1644 = _1646;
    }
    float _1648 = _1644;
    int _1650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1652 = _1650 != 0;
    float _1654 = float(uint(_1640));
    float _1656 = _1648;
    if (_1560)
    {
        float _1658 = _1648 * 0.15915493667125701904296875;
        _1656 = _1658;
    }
    float _1660 = _1656;
    int _1662 = int(_1506) + int(_1618);
    bool _1664 = !_1530;
    int _1666 = _1664 ? 0 : 1;
    int _1668 = _1636 * _1662;
    int _1670 = _1668 + _1414;
    float _1672 = as_type<float>(_865) * _1654;
    int _1674 = abs(_1666);
    float _1676 = _1660;
    if (_1560)
    {
        float _1678 = _1660 * 6.283185482025146484375;
        float _1680 = sin(_1678);
        _1676 = _1680;
    }
    float _1682 = _1676;
    bool _1684 = uint(_1670) >= uint(_801);
    int _1686 = _1628 * _1642;
    int _1688 = _1686 + _1624;
    float _1690 = as_type<float>(_1500);
    if (_1652)
    {
        float _1692 = in.m_70.x;
        _1690 = _1692;
    }
    float _1694 = _1690;
    float _1696 = float(uint(_1282));
    float _1698 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    bool _1700 = !_1684;
    int _1702 = _1700 ? 0 : (-1);
    float _1704 = trunc(_1672);
    float _1706 = precise::max(_1704, 0.0);
    uint _1708 = uint(_1706);
    int _1710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1712 = _1710 != 0;
    float _1714 = as_type<float>(_859) * _1696;
    int _1716 = _1552 * _1674;
    int _1718 = _1716 + _1688;
    int _1720 = ~_1662;
    int _1722 = _1720 + _1702;
    int _1724 = _1722 + 1;
    float _1726 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1698);
    bool _1728 = !_1712;
    float _1730 = _1728 ? _243 : as_type<float>(_1442);
    float _1732 = _972 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1734 = trunc(_1714);
    float _1736 = precise::max(_1734, 0.0);
    uint _1738 = uint(_1736);
    float _1740 = float(uint(_1718));
    int _1742 = _801 * _1724;
    int _1744 = _1742 + _1414;
    bool _1746 = _1712;
    float _1748 = _1740;
    if (_1560)
    {
        bool _1750 = _1682 > 0.5;
        _1746 = _1750;
    }
    bool _1752 = _1746;
    int _1754 = ~_801;
    int _1756 = _1754 + 1;
    float _1758 = as_type<float>(_1026) * _1740;
    bool _1760 = !_1620;
    int _1762 = _1760 ? _1744 : (-1);
    int _1764 = int(_1600) + int(_1708);
    float _1766 = trunc(_1758);
    float _1768 = precise::max(_1766, 0.0);
    uint _1770 = uint(_1768);
    float _1772 = as_type<float>(_1708);
    if (!_1560)
    {
        _1772 = _243;
    }
    float _1774 = _1772;
    float _1776 = _1774;
    if (_1652)
    {
        float _1778 = _1694 * 3.1415927410125732421875;
        _1748 = _1778;
    }
    float _1780 = _1748;
    float _1782 = _1780;
    if (_1560)
    {
        float _1784 = -_243;
        float _1786 = _1752 ? _1784 : _243;
        _1776 = _1786;
    }
    float _1788 = _1776;
    float _1790 = float(uint(_1352));
    int _1792 = _1756 * int(_1738);
    int _1794 = _1792 + _1282;
    int _1796 = _1762 & 3;
    bool _1798 = _1796 != 0;
    if (_1652)
    {
        float _1800 = _1780 * 0.15915493667125701904296875;
        _1782 = _1800;
    }
    float _1802 = _1782;
    int _1804 = _1762 & 3;
    bool _1806 = _1804 != 0;
    float _1808 = as_type<float>(_865) * _1790;
    int _1810 = _1798 ? 0 : 1;
    bool _1812 = uint(_1804) > 1u;
    float _1814 = _1802;
    if (_1652)
    {
        float _1816 = _1802 * 6.283185482025146484375;
        float _1818 = sin(_1816);
        _1814 = _1818;
    }
    float _1820 = _1814;
    float _1822 = float(uint(_1794));
    int _1824 = ~_819;
    int _1826 = _1824 + 1;
    int _1828 = ~_877;
    int _1830 = _1828 + 1;
    float _1832 = as_type<float>(_859) * _1822;
    int _1834 = ~_1810;
    int _1836 = _1834 + 1;
    int _1838 = _1836 + 1;
    float _1840 = trunc(_1808);
    float _1842 = precise::max(_1840, 0.0);
    uint _1844 = uint(_1842);
    int _1846 = _1826 * _1764;
    int _1848 = _1846 + _1534;
    float _1850 = -_229;
    int _1852 = _1308 ? as_type<int>(_1850) : as_type<int>(_229);
    int _1854 = _1830 * int(_1770);
    int _1856 = _1854 + _1718;
    bool _1858 = uint(_1804) >= 2u;
    int _1860 = _1838;
    if (!_1812)
    {
        int _1862 = ~_1810;
        int _1864 = _1862 + 1;
        _1860 = _1864;
    }
    int _1866 = _1860;
    bool _1868 = uint(_1848) >= uint(_819);
    float _1870 = trunc(_1832);
    float _1872 = precise::max(_1870, 0.0);
    uint _1874 = uint(_1872);
    float _1876 = float(uint(_1856));
    int _1878 = ~_819;
    int _1880 = _1878 + 1;
    int _1882 = _1858 ? 0 : 1;
    float _1884 = as_type<float>(_1026) * _1876;
    bool _1886 = _1804 != 3;
    int _1888 = _1880 * int(_1844);
    int _1890 = _1888 + _1352;
    bool _1892 = !_1868;
    int _1894 = _1892 ? 0 : (-1);
    float _1896 = trunc(_1884);
    float _1898 = precise::max(_1896, 0.0);
    uint _1900 = uint(_1898);
    int _1902 = ~_1882;
    int _1904 = _1902 + 1;
    int _1906 = _1904 + 1;
    int _1908 = ~_1764;
    int _1910 = _1908 + _1894;
    int _1912 = _1910 + 1;
    float _1914 = float(uint(_1890));
    int _1916 = _819 * _1912;
    int _1918 = _1916 + _1534;
    float _1920 = _1884;
    int _1922 = _1906;
    bool _1924 = _1886;
    if (!_1652)
    {
        _1920 = _229;
    }
    float _1926 = _1920;
    float _1928 = as_type<float>(_865) * _1914;
    float _1930 = _1926;
    if (_1886)
    {
        int _1932 = ~_1882;
        int _1934 = _1932 + 1;
        _1922 = _1934;
    }
    int _1936 = _1922;
    if (_1652)
    {
        bool _1938 = _1820 > 0.5;
        _1924 = _1938;
    }
    bool _1940 = _1924;
    bool _1942 = !_1332;
    int _1944 = _1942 ? _1918 : (-1);
    int _1946 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1948 = _1946 != 0;
    float _1950 = trunc(_1928);
    float _1952 = precise::max(_1950, 0.0);
    uint _1954 = uint(_1952);
    if (_1652)
    {
        float _1956 = -_229;
        float _1958 = _1940 ? _1956 : _229;
        _1930 = _1958;
    }
    float _1960 = _1930;
    int _1962 = _1944 & 3;
    bool _1964 = _1962 != 0;
    bool _1966 = !_1948;
    float _1968 = _1966 ? _229 : as_type<float>(_1852);
    int _1970 = int(_1770) + int(_1900);
    bool _1972 = uint(_1962) > 1u;
    int _1974 = ~_877;
    int _1976 = _1974 + 1;
    int _1978 = _1944 & 3;
    bool _1980 = _1978 != 0;
    int _1982 = int(_1738) + int(_1874);
    int _1984 = _1976 * _1970;
    int _1986 = _1984 + _1718;
    int _1988 = ~_801;
    int _1990 = _1988 + 1;
    int _1992 = _1980 ? 0 : 1;
    int _1994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1996 = _1994 != 0;
    int _1998 = _1990 * _1982;
    int _2000 = _1998 + _1282;
    float _2002 = float(uint(_1628));
    bool _2004 = !_1996;
    int _2006 = _2004 ? 0 : 1;
    bool _2008 = uint(_1986) >= uint(_877);
    float _2010 = as_type<float>(_1026) * _2002;
    int _2012 = ~_1992;
    int _2014 = _2012 + 1;
    int _2016 = _2014 + 1;
    int _2018 = _2016;
    if (!_1972)
    {
        int _2020 = ~_1992;
        int _2022 = _2020 + 1;
        _2018 = _2022;
    }
    int _2024 = _2018;
    float _2026 = trunc(_2010);
    float _2028 = precise::max(_2026, 0.0);
    uint _2030 = uint(_2028);
    bool _2032 = uint(_2000) >= uint(_801);
    bool _2034 = !_2008;
    int _2036 = _2034 ? 0 : (-1);
    bool _2038 = _1962 != 3;
    bool _2040 = !_2032;
    int _2042 = _2040 ? 0 : (-1);
    bool _2044 = uint(_1962) >= 2u;
    int _2046 = ~_1970;
    int _2048 = _2046 + _2036;
    int _2050 = _2048 + 1;
    int _2052 = ~_819;
    int _2054 = _2052 + 1;
    int _2056 = int(_1844) + int(_1954);
    int _2058 = _877 * _2050;
    int _2060 = _2058 + _1718;
    int _2062 = _2044 ? 0 : 1;
    int _2064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2066 = _2064 != 0;
    int _2068 = _2054 * _2056;
    int _2070 = _2068 + _1352;
    int _2072 = ~_877;
    int _2074 = _2072 + 1;
    int _2076 = ~_2062;
    int _2078 = _2076 + 1;
    int _2080 = _2078 + 1;
    int _2082 = _2080;
    if (_2038)
    {
        int _2084 = ~_2062;
        int _2086 = _2084 + 1;
        _2082 = _2086;
    }
    int _2088 = _2082;
    int _2090 = _2074 * int(_2030);
    int _2092 = _2090 + _1628;
    int _2094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2096 = _2094 != 0;
    bool _2098 = !_2066;
    int _2100 = _2098 ? 0 : 1;
    bool _2102 = uint(_2070) >= uint(_819);
    bool _2104 = !_1570;
    int _2106 = _2104 ? _2060 : (-1);
    bool _2108 = !_2096;
    int _2110 = _2108 ? 0 : 1;
    bool _2112 = !_2102;
    int _2114 = _2112 ? 0 : (-1);
    int _2116 = _2106 & 3;
    bool _2118 = _2116 != 0;
    int _2120 = _2106 & 3;
    bool _2122 = _2120 != 0;
    float _2124 = float(uint(_2092));
    int _2126 = _2118 ? 0 : 1;
    bool _2128 = uint(_2120) > 1u;
    float _2130 = as_type<float>(_1026) * _2124;
    int _2132 = ~_2126;
    int _2134 = _2132 + 1;
    int _2136 = _2134 + 1;
    float _2138 = trunc(_2130);
    float _2140 = precise::max(_2138, 0.0);
    uint _2142 = uint(_2140);
    float _2144 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2146 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2148 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2150 = _2136;
    if (!_2128)
    {
        int _2152 = ~_2126;
        int _2154 = _2152 + 1;
        _2150 = _2154;
    }
    int _2156 = _2150;
    float _2158 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2160 = uint(_2120) >= 2u;
    int _2162 = ~_877;
    int _2164 = _2162 + 1;
    int _2166 = _2160 ? 0 : 1;
    bool _2168 = _2120 != 3;
    int _2170 = int(_2030) + int(_2142);
    int _2172 = ~_2166;
    int _2174 = _2172 + 1;
    int _2176 = _2174 + 1;
    int _2178 = _2164 * _2170;
    int _2180 = _2178 + _1628;
    int _2182 = ~_2056;
    int _2184 = _2182 + _2114;
    int _2186 = _2184 + 1;
    int _2188 = abs(_2024);
    float _2190 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2192 = _2176;
    float _2194 = as_type<float>(_2180);
    if (_2168)
    {
        int _2196 = ~_2166;
        int _2198 = _2196 + 1;
        _2192 = _2198;
    }
    int _2200 = _2192;
    int _2202 = _819 * _2186;
    int _2204 = _2202 + _1352;
    bool _2206 = uint(_2180) >= uint(_877);
    float _2208 = _984 * 2.0;
    bool _2210 = !_2206;
    int _2212 = _2210 ? 0 : (-1);
    bool _2214 = _962 > 0.5;
    bool _2216 = !_1332;
    int _2218 = _2216 ? _2204 : (-1);
    float _2220 = -_243;
    int _2222 = _2214 ? as_type<int>(_2220) : as_type<int>(_243);
    bool _2224 = _974 != 1;
    float _2226 = in.m_50.x;
    float _2228 = in.m_50.y;
    float _2230 = in.m_50.z;
    int _2232 = ~_2170;
    int _2234 = _2232 + _2212;
    int _2236 = _2234 + 1;
    int _2238 = ~_1982;
    int _2240 = _2238 + _2042;
    int _2242 = _2240 + 1;
    int _2244 = abs(_2156);
    int _2246 = _877 * _2236;
    int _2248 = _2246 + _1628;
    int _2250 = abs(_1866);
    int _2252 = _801 * _2242;
    int _2254 = _2252 + _1282;
    int _2256 = ~_2244;
    int _2258 = _2256 + 1;
    int _2260 = _2258 + 1;
    float _2262 = 0.0;
    if (!_2224)
    {
        _2262 = _970;
    }
    float _2264 = _2262;
    float _2266 = 0.0;
    float _2268 = _2264;
    if (!_2224)
    {
        _2266 = _970;
    }
    float _2270 = _2266;
    float _2272 = 0.0;
    float _2274 = _2270;
    if (!_2224)
    {
        _2272 = _984;
    }
    float _2276 = _2272;
    float _2278 = 0.0;
    float _2280 = _2276;
    if (!_2224)
    {
        _2278 = _984;
    }
    float _2282 = _2278;
    float _2284 = _2282;
    if (_2224)
    {
        _2268 = _962;
    }
    float _2286 = _2268;
    if (_2224)
    {
        _2274 = _962;
    }
    float _2288 = _2274;
    if (_2224)
    {
        _2280 = _970;
    }
    float _2290 = _2280;
    float _2292 = _201 * _2228;
    if (_2224)
    {
        _2284 = _970;
    }
    float _2294 = _2284;
    float _2296 = _207 * _2228;
    bool _2298 = _976 != 2;
    float _2300 = fma(_205, _2226, _2296);
    int _2302 = ~_2250;
    int _2304 = _2302 + 1;
    int _2306 = _2304 + 1;
    float _2308 = fma(_209, _2230, _2300);
    float _2310 = _970 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2312 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    int _2314 = abs(_2110);
    float _2316 = fma(_2310, -2.0, _2144);
    if (_2298)
    {
        _2194 = _962;
    }
    float _2318 = _2194;
    float _2320 = fma(_1732, -2.0, _2312);
    float _2322 = 0.0;
    float _2324 = _2318;
    if (_2298)
    {
        _2322 = _970;
    }
    float _2326 = _2322;
    float _2328 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2316);
    float _2330 = _2326;
    if (!_2298)
    {
        _2324 = _984;
    }
    float _2332 = _2324;
    float _2334 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2320);
    if (!_2298)
    {
        _2330 = _962;
    }
    float _2336 = _2330;
    int _2338 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2340 = _2338 != 0;
    float _2342 = _213 * _2228;
    float _2344 = fma(_199, _2226, _2292);
    float _2346 = _2228 + _1012;
    float _2348 = fma(_211, _2226, _2342);
    float _2350 = fma(_203, _2230, _2344);
    float _2352 = _962 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2354 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2356 = log2(_2354);
    float _2358 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2360 = _2336 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2362 = -_2358;
    float _2364 = fma(_2352, 2.0, _2362);
    float _2366 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2368 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2370 = !_2340;
    float _2372 = _2370 ? _243 : as_type<float>(_2222);
    float _2374 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2366);
    float _2376 = _978 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2378 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2380 = fma(_2288, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2368);
    float _2382 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2384 = _2356 * _139;
    float _2386 = -_2146;
    float _2388 = fma(_2376, 2.0, _2386);
    float _2390 = _2286 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2392 = _2332 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2394 = exp2(_2384);
    float _2396 = fma(_2294, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2378);
    float _2398 = -_2382;
    float _2400 = fma(_2390, 2.0, _2398);
    float _2402 = -_2148;
    float _2404 = fma(_2392, 2.0, _2402);
    float _2406 = _2290 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2408 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2410 = isnan(0.0);
    bool _2412 = _2408 || _2410;
    bool _2414 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2416 = _2412 || _2414;
    float _2418 = fma(_2360, -2.0, _2190);
    float _2420 = fma(_2406, -2.0, _2158);
    float _2422 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2374);
    float _2424 = -_139;
    float _2426 = fma(_2424, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2364);
    float _2428 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1726);
    float _2430 = -_139;
    float _2432 = fma(_2430, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2388);
    float _2434 = -_2394;
    float _2436 = _2434 + 1.0;
    float _2438 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2440 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2442 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2380);
    float _2444 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2396);
    float _2446 = _2416 ? _2436 : 0.0;
    float _2448 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2450 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _2452 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2454 = isnan(1.0);
    bool _2456 = _2452 || _2454;
    bool _2458 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2460 = _2456 || _2458;
    float _2462 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2464 = 1.0 + _2462;
    float _2466 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2438);
    float _2468 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2450);
    float _2470 = _962 * 2.0;
    float _2472 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2448);
    float _2474 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2440);
    float _2476 = 1.0 / _2464;
    float _2478 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2468);
    float _2480 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2472);
    float _2482 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2466);
    float _2484 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2474);
    float _2486 = -_139;
    float _2488 = fma(_2486, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2400);
    float _2490 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2420);
    float _2492 = -_139;
    float _2494 = fma(_2492, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2404);
    float _2496 = floor(_2470);
    float _2498 = fma(_215, _2230, _2348);
    float _2500 = _970 * 2.0;
    float _2502 = _1960 + (-0.5);
    float _2504 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2506 = _2504 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2508 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2418);
    if (_2460)
    {
        float _2510 = _2446 * _2476;
        _149 = _2510;
    }
    float _2512 = _149;
    float _2514 = floor(_2500);
    float _2516 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2518 = _2516 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2520 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2522 = _2520 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2524 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2526 = _2524 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2528 = -_2502;
    float _2530 = -_2334;
    float _2532 = fma(_2528, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2530);
    bool _2534 = _2496 >= 0.0;
    bool _2536 = isnan(_2496);
    bool _2538 = _2534 || _2536;
    bool _2540 = isnan(0.0);
    bool _2542 = _2538 || _2540;
    float _2544 = -_2422;
    float _2546 = _2544 + 1.0;
    float _2548 = 1.0 / _2506;
    float _2550 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2552 = _2550 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2554 = _2542 ? 0 : 1;
    float _2556 = -_2428;
    float _2558 = _2556 + 1.0;
    bool _2560 = _2496 > 0.0;
    float _2562 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2564 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2562;
    int _2566 = ~_2554;
    int _2568 = _2566 + 1;
    int _2570 = _2568 + 1;
    float _2572 = 1.0 / _2518;
    float _2574 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2576 = _2574 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2578 = -_2444;
    float _2580 = _2578 + 1.0;
    float _2582 = -_2478;
    float _2584 = _2582 + 1.0;
    bool _2586 = _2514 >= 0.0;
    bool _2588 = isnan(_2514);
    bool _2590 = _2586 || _2588;
    bool _2592 = isnan(0.0);
    bool _2594 = _2590 || _2592;
    float _2596 = 1.0 / _2522;
    float _2598 = _2564 * _2548;
    int _2600 = _2570;
    if (!_2560)
    {
        int _2602 = ~_2554;
        int _2604 = _2602 + 1;
        _2600 = _2604;
    }
    int _2606 = _2600;
    float _2608 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2610 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2608;
    bool _2612 = _2514 > 0.0;
    float _2614 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2616 = _2614 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2618 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2620 = _2618 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2622 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2624 = _2622 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2626 = floor(_2208);
    int _2628 = _2594 ? 0 : 1;
    float _2630 = _2610 * _2572;
    bool _2632 = !_1964;
    int _2634 = _2632 ? 0 : 1;
    float _2636 = -_2484;
    float _2638 = _2636 + 1.0;
    int _2640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2642 = _2640 != 0;
    int _2644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2646 = _2644 != 0;
    int _2648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2650 = _2648 != 0;
    bool _2652 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2654 = isnan(_783);
    bool _2656 = _2652 || _2654;
    bool _2658 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2660 = _2656 || _2658;
    float _2662 = float(_2660);
    float _2664 = 1.0 / _2526;
    float _2666 = _2624 * _2596;
    int _2668 = ~_2628;
    int _2670 = _2668 + 1;
    int _2672 = _2670 + 1;
    bool _2674 = !_1806;
    int _2676 = _2674 ? 0 : 1;
    float _2678 = -_2662;
    float _2680 = _2678 + 1.0;
    int _2682 = _2672;
    if (!_2612)
    {
        int _2684 = ~_2628;
        int _2686 = _2684 + 1;
        _2682 = _2686;
    }
    int _2688 = _2682;
    float _2690 = 1.0 / _2552;
    bool _2692 = _2626 > 0.0;
    bool _2694 = _2626 >= 0.0;
    bool _2696 = isnan(_2626);
    bool _2698 = _2694 || _2696;
    bool _2700 = isnan(0.0);
    bool _2702 = _2698 || _2700;
    float _2704 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2706 = _783 + _2704;
    bool _2708 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2710 = isnan(_783);
    bool _2712 = _2708 || _2710;
    bool _2714 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2716 = _2712 || _2714;
    float _2718 = float(_2716);
    float _2720 = 1.0 / _2620;
    float _2722 = _2576 * _2664;
    float _2724 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2726 = _2724 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _2728 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2730 = isnan(_783);
    bool _2732 = _2728 || _2730;
    bool _2734 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2736 = _2732 || _2734;
    float _2738 = float(_2736);
    float _2740 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2742 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2740;
    float _2744 = _2718 * _2680;
    bool _2746 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2748 = isnan(_783);
    bool _2750 = _2746 || _2748;
    bool _2752 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2754 = _2750 || _2752;
    float _2756 = float(_2754);
    float _2758 = 1.0 / _2616;
    float _2760 = fma(_2722, _2706, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2762 = _2726 * _2690;
    float _2764 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2766 = _783 + _2764;
    float _2768 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2770 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2768;
    float _2772 = -_2718;
    float _2774 = _2772 + 1.0;
    bool _2776 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2778 = isnan(_783);
    bool _2780 = _2776 || _2778;
    bool _2782 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2784 = _2780 || _2782;
    float _2786 = float(_2784);
    float _2788 = fma(_2630, _2766, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2790 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2792 = _783 + _2790;
    float _2794 = _2742 * _2720;
    float _2796 = _2738 * _2774;
    float _2798 = -_2738;
    float _2800 = _2798 + 1.0;
    float _2802 = in.m_64.w;
    float _2804 = fma(_2762, _2792, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2806 = -_2786;
    float _2808 = _2806 + 1.0;
    float _2810 = _2786 * _2800;
    float _2812 = _2770 * _2758;
    float _2814 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2816 = _783 + _2814;
    float _2818 = in.m_68.w;
    float _2820 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2822 = _783 + _2820;
    int _2824 = _1944 >> 31;
    float _2826 = fma(_2598, _2816, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2828 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2830 = isnan(_783);
    bool _2832 = _2828 || _2830;
    bool _2834 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2836 = _2832 || _2834;
    float _2838 = float(_2836);
    float _2840 = fma(_2812, _2822, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _2842 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2844 = isnan(_783);
    bool _2846 = _2842 || _2844;
    bool _2848 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2850 = _2846 || _2848;
    float _2852 = float(_2850);
    float _2854 = -_2756;
    float _2856 = _2854 + 1.0;
    int _2858 = _2824 & 3;
    float _2860 = _2838 * _2808;
    bool _2862 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2864 = isnan(_783);
    bool _2866 = _2862 || _2864;
    bool _2868 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2870 = _2866 || _2868;
    float _2872 = float(_2870);
    float _2874 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2876 = _783 + _2874;
    float _2878 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2880 = _783 + _2878;
    float _2882 = -_2838;
    float _2884 = _2882 + 1.0;
    float _2886 = _2852 * _2856;
    int _2888 = _1944 + _2858;
    float _2890 = fma(_2794, _2880, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2892 = _2872 * _2884;
    float _2894 = -_2872;
    float _2896 = _2894 + 1.0;
    float _2898 = _2826 * _2886;
    float _2900 = in.m_66.w;
    int _2902 = _2888 >> 2;
    float _2904 = -_2852;
    float _2906 = _2904 + 1.0;
    float _2908 = _2350 + _2802;
    float _2910 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2912 = _2346 + _2910;
    int _2914 = _2902 << 4;
    int _2916 = _2914 + 656;
    float _2918 = _2756 * _2896;
    float _2920 = fma(_2906, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2898);
    float _2922 = fma(_2666, _2876, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2924 = _2498 + _2818;
    float _2926 = _2912 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2928 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2930 = _2908 + _2928;
    uint _2932 = uint(int(uint(_2916) >> uint(2)));
    uint _2934 = uint(int(uint(int(_2932)) >> uint(2)));
    int _2936 = int(_2932) & 3;
    float _2938 = (*spvDescriptorSet0.vp_c9)._m0[int(_2934)][_2936];
    int _2940 = int(_2932) + 1;
    uint _2942 = uint(int(uint(_2940) >> uint(2)));
    int _2944 = _2940 & 3;
    float _2946 = (*spvDescriptorSet0.vp_c9)._m0[int(_2942)][_2944];
    float _2948 = fma(_2760, _2918, _2920);
    float _2950 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2952 = _2924 + _2950;
    float _2954 = fma(_2930, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2926);
    int _2956 = _2702 ? 0 : 1;
    float _2958 = fma(_2788, _2892, _2948);
    bool _2960 = _1962 != 3;
    float _2962 = fma(_2952, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2954);
    int _2964 = ~_2956;
    int _2966 = _2964 + 1;
    int _2968 = _2966 + 1;
    float _2970 = fma(_2804, _2860, _2958);
    int _2972 = _2968;
    float _2974 = _2810;
    if (!_2692)
    {
        int _2976 = ~_2956;
        int _2978 = _2976 + 1;
        _2972 = _2978;
    }
    int _2980 = _2972;
    float _2982 = _970 + _962;
    int _2984 = _2916 + 8;
    uint _2986 = uint(int(uint(_2984) >> uint(2)));
    uint _2988 = uint(int(uint(int(_2986)) >> uint(2)));
    int _2990 = int(_2986) & 3;
    float _2992 = (*spvDescriptorSet0.vp_c9)._m0[int(_2988)][_2990];
    int _2994 = int(_2986) + 1;
    uint _2996 = uint(int(uint(_2994) >> uint(2)));
    int _2998 = _2994 & 3;
    float _3000 = (*spvDescriptorSet0.vp_c9)._m0[int(_2996)][_2998];
    bool _3002 = _2962 >= 0.0;
    float _3004 = _2308 + _2900;
    float _3006 = _2982 + (-1.0);
    float _3008 = fma(_2840, _2810, _2970);
    float _3010 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3012 = _3004 + _3010;
    float _3014 = _962 + _984;
    float _3016 = fma(_3006, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3018 = _2930 * _2930;
    float _3020 = _962 + (-0.5);
    float _3022 = _970 + _984;
    float _3024 = _970 + (-0.5);
    float _3026 = fma(_3012, _3012, _3018);
    if (_3002)
    {
        _2974 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3028 = _2974;
    float _3030 = _1788 + 0.5;
    float _3032 = fma(_2952, _2952, _3026);
    float _3034 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3036 = int(_3034);
    int _3038 = as_type<int>(_3028);
    if (_3002)
    {
        float _3040 = _3028 * 5.0;
        _3038 = as_type<int>(_3040);
    }
    int _3042 = _3038;
    float _3044 = fma(_3030, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2432);
    int _3046 = abs(_2634);
    float _3048 = _2372 + 0.5;
    if (_3002)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9667 = as_type<float>(_3042);
        out.gl_Position.z = _9667;
    }
    float _3050 = _1968 + (-0.5);
    float _3052 = sqrt(_3032);
    int _3054 = ~_2188;
    int _3056 = _3054 + 1;
    int _3058 = _3056 + 1;
    float _3060 = fma(_3048, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2426);
    bool _3062 = !_2960;
    int _3064 = _3062 ? 0 : (-1);
    float _3066 = -_3050;
    float _3068 = -_2328;
    float _3070 = fma(_3066, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3068);
    int _3072 = abs(_2088);
    float _3074 = fma(_2922, _2796, _3008);
    int _3076 = abs(_3064);
    float _3078 = rsqrt(_3032);
    bool _3080 = !_2642;
    int _3082 = _3080 ? 0 : 1;
    int _3084 = _3058 * as_type<int>(_2946);
    float _3086 = _1016 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _3088 = float(uint(_3036));
    float _3090 = fma(_2890, _2744, _3074);
    int _3092 = ~_3046;
    int _3094 = _3092 + 1;
    int _3096 = _3094 + 1;
    float _3098 = _3052 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _3100 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3102 = ~_3072;
    int _3104 = _3102 + 1;
    int _3106 = _3104 + 1;
    float _3108 = fma(_2662, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3090);
    int _3110 = _3096 * as_type<int>(_2938);
    int _3112 = _3110 + _3084;
    float _3114 = precise::min(_3086, _3098);
    float _3116 = fma(_2912, _2912, _3018);
    int _3118 = _3106 * as_type<int>(_2992);
    int _3120 = _3118 + _3112;
    int _3122 = abs(_2100);
    float _3124 = 1.0 / _3088;
    int _3126 = ~_3076;
    int _3128 = _3126 + 1;
    int _3130 = _3128 + 1;
    out.m_80.w = _3114;
    int _3132 = ~_3122;
    int _3134 = _3132 + 1;
    int _3136 = _3134 + 1;
    float _3138 = fma(_2952, _2952, _3116);
    int _3140 = abs(_3036);
    int _3142 = _3130 * as_type<int>(_3000);
    int _3144 = _3142 + _3120;
    float _3146 = -_2546;
    float _3148 = fma(_3146, _1788, _3044);
    float _3150 = _3100 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3152 = _1730 + 0.5;
    int _3154 = _3144 * _3136;
    float _3156 = fma(_2558, _1960, _2532);
    float _3158 = _3078 * _3114;
    float _3160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3162 = _2218 * _3122;
    int _3164 = _3162 + _3154;
    float _3166 = float(uint(_3140));
    float _3168 = fma(_3150, _3152, _2488);
    int _3170 = as_type<int>(_3124) + (-2);
    out.m_82.x = _3148;
    out.m_82.y = _3156;
    float _3172 = float(uint(_3164));
    float _3174 = _3012 * _3158;
    float _3176 = 1.0 / _3166;
    int _3178 = _2106 >> 31;
    float _3180 = _2930 * _3158;
    float _3182 = as_type<float>(_3170) * _3172;
    int _3184 = abs(_3164);
    float _3186 = -_3174;
    float _3188 = _3012 + _3186;
    int _3190 = ~_3036;
    int _3192 = _3190 + 1;
    float _3194 = _1512 + (-0.5);
    float _3196 = trunc(_3182);
    float _3198 = precise::max(_3196, 0.0);
    uint _3200 = uint(_3198);
    float _3202 = _3160 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3204 = _1762 >> 31;
    float _3206 = _3188 * _3188;
    int _3208 = _3178 & 3;
    float _3210 = -_3202;
    float _3212 = -_2490;
    float _3214 = fma(_3210, _3194, _3212);
    int _3216 = _3204 & 3;
    float _3218 = -_3180;
    float _3220 = _2930 + _3218;
    int _3222 = as_type<int>(_3176) + (-2);
    float _3224 = _2952 * _3158;
    float _3226 = float(uint(_3184));
    float _3228 = fma(_3220, _3220, _3206);
    int _3230 = _1762 + _3216;
    float _3232 = -_3224;
    float _3234 = _2952 + _3232;
    int _3236 = _2106 + _3208;
    float _3238 = as_type<float>(_3222) * _3226;
    int _3240 = _3192 * int(_3200);
    int _3242 = _3240 + _3164;
    int _3244 = _3230 >> 2;
    float _3246 = fma(_3234, _3234, _3228);
    int _3248 = _3236 >> 2;
    float _3250 = trunc(_3238);
    float _3252 = precise::max(_3250, 0.0);
    uint _3254 = uint(_3252);
    float _3256 = float(uint(_3242));
    float _3258 = -_2482;
    float _3260 = _3258 + 1.0;
    int _3262 = _3244 << 4;
    int _3264 = _3262 + 368;
    float _3266 = fma(_1512, _2580, _3214);
    int _3268 = _3248 << 4;
    int _3270 = _3268 + 800;
    float _3272 = as_type<float>(_3170) * _3256;
    int _3274 = ~_3140;
    int _3276 = _3274 + 1;
    uint _3278 = uint(int(uint(_3264) >> uint(2)));
    uint _3280 = uint(int(uint(int(_3278)) >> uint(2)));
    int _3282 = int(_3278) & 3;
    float _3284 = (*spvDescriptorSet0.vp_c9)._m0[int(_3280)][_3282];
    int _3286 = int(_3278) + 1;
    uint _3288 = uint(int(uint(_3286) >> uint(2)));
    int _3290 = _3286 & 3;
    float _3292 = (*spvDescriptorSet0.vp_c9)._m0[int(_3288)][_3290];
    float _3294 = -_3260;
    float _3296 = fma(_2372, _3294, _3060);
    float _3298 = -_2442;
    float _3300 = _3298 + 1.0;
    float _3302 = -_2480;
    float _3304 = _3302 + 1.0;
    int _3306 = abs(_3082);
    float _3308 = -_3300;
    float _3310 = fma(_1730, _3308, _3168);
    float _3312 = trunc(_3272);
    float _3314 = precise::max(_3312, 0.0);
    uint _3316 = uint(_3314);
    uint _3318 = uint(int(uint(_3270) >> uint(2)));
    uint _3320 = uint(int(uint(int(_3318)) >> uint(2)));
    int _3322 = int(_3318) & 3;
    float _3324 = (*spvDescriptorSet0.vp_c9)._m0[int(_3320)][_3322];
    int _3326 = int(_3318) + 1;
    uint _3328 = uint(int(uint(_3326) >> uint(2)));
    int _3330 = _3326 & 3;
    float _3332 = (*spvDescriptorSet0.vp_c9)._m0[int(_3328)][_3330];
    int _3334 = _3276 * int(_3254);
    int _3336 = _3334 + _3184;
    float _3338 = fma(_1968, _3304, _3070);
    out.m_84.x = _3108;
    int _3340 = ~_3036;
    int _3342 = _3340 + 1;
    float _3344 = float(uint(_3336));
    out.m_86.x = _3296;
    out.m_86.y = _3338;
    out.m_86.z = _3310;
    out.m_86.w = _3266;
    float _3346 = float(_2980);
    float _3348 = sqrt(_3246);
    float _3350 = float(_3306);
    float _3352 = as_type<float>(_3222) * _3344;
    bool _3354 = !_2122;
    int _3356 = _3354 ? 0 : 1;
    if (_3002)
    {
        out.m_57.x = 0.0;
    }
    int _3358 = int(_3200) + int(_3316);
    float _3360 = _3350 * _3346;
    float _3362 = trunc(_3352);
    float _3364 = precise::max(_3362, 0.0);
    uint _3366 = uint(_3364);
    bool _3368 = _1804 != 3;
    float _3370 = _3360 * (-2.0);
    int _3372 = ~_3140;
    int _3374 = _3372 + 1;
    int _3376 = _3264 + 8;
    uint _3378 = uint(int(uint(_3376) >> uint(2)));
    uint _3380 = uint(int(uint(int(_3378)) >> uint(2)));
    int _3382 = int(_3378) & 3;
    float _3384 = (*spvDescriptorSet0.vp_c9)._m0[int(_3380)][_3382];
    int _3386 = int(_3378) + 1;
    uint _3388 = uint(int(uint(_3386) >> uint(2)));
    int _3390 = _3386 & 3;
    float _3392 = (*spvDescriptorSet0.vp_c9)._m0[int(_3388)][_3390];
    int _3394 = _3342 * _3358;
    int _3396 = _3394 + _3164;
    bool _3398 = !_3368;
    int _3400 = _3398 ? 0 : (-1);
    int _3402 = abs(_2676);
    float _3404 = rsqrt(_3138);
    bool _3406 = uint(_3396) >= uint(_3036);
    float _3408 = _3078 * _3348;
    int _3410 = _3270 + 8;
    uint _3412 = uint(int(uint(_3410) >> uint(2)));
    uint _3414 = uint(int(uint(int(_3412)) >> uint(2)));
    int _3416 = int(_3412) & 3;
    float _3418 = (*spvDescriptorSet0.vp_c9)._m0[int(_3414)][_3416];
    int _3420 = int(_3412) + 1;
    uint _3422 = uint(int(uint(_3420) >> uint(2)));
    int _3424 = _3420 & 3;
    float _3426 = (*spvDescriptorSet0.vp_c9)._m0[int(_3422)][_3424];
    int _3428 = ~_3402;
    int _3430 = _3428 + 1;
    int _3432 = _3430 + 1;
    bool _3434 = !_3406;
    int _3436 = _3434 ? 0 : (-1);
    float _3438 = _1016 * _3408;
    int _3440 = int(_3254) + int(_3366);
    bool _3442 = _2120 != 3;
    int _3444 = ~_3358;
    int _3446 = _3444 + _3436;
    int _3448 = _3446 + 1;
    int _3450 = _3374 * _3440;
    int _3452 = _3450 + _3184;
    bool _3454 = _801 == 0;
    int _3456 = _2306 * as_type<int>(_3292);
    float _3458 = _3438 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _3460 = !_1570;
    int _3462 = _3460 ? _2248 : (-1);
    int _3464 = _3432 * as_type<int>(_3284);
    int _3466 = _3464 + _3456;
    int _3468 = abs(_1936);
    int _3470 = _2260 * as_type<int>(_3332);
    bool _3472 = !_3442;
    int _3474 = _3472 ? 0 : (-1);
    int _3476 = _3036 * _3448;
    int _3478 = _3476 + _3164;
    bool _3480 = uint(_3452) >= uint(_3140);
    float _3482 = _3458 * _3404;
    int _3484 = ~_3468;
    int _3486 = _3484 + 1;
    int _3488 = _3486 + 1;
    bool _3490 = !_3480;
    int _3492 = _3490 ? 0 : (-1);
    float _3494 = _2912 * _3482;
    bool _3496 = _3036 == 0;
    float _3498 = _2930 * _3482;
    int _3500 = abs(_3356);
    float _3502 = -_3494;
    float _3504 = _2912 + _3502;
    bool _3506 = !_3496;
    int _3508 = _3506 ? _3478 : (-1);
    float _3510 = -_3498;
    float _3512 = _2930 + _3510;
    bool _3514 = _3036 == 0;
    float _3516 = _3504 * _3504;
    int _3518 = _3164 ^ _3036;
    int _3520 = ~_3492;
    int _3522 = _3440 + _3520;
    int _3524 = _3522 + 1;
    float _3526 = fma(_3512, _3512, _3516);
    uint _3528 = uint(int(uint(_3518) >> uint(31)));
    int _3530 = _3488 * as_type<int>(_3384);
    int _3532 = _3530 + _3466;
    int _3534 = abs(_3400);
    float _3536 = _2952 * _3482;
    int _3538 = abs(_2200);
    int _3540 = abs(_2006);
    float _3542 = -_3536;
    float _3544 = _2952 + _3542;
    int _3546 = ~int(_3528);
    int _3548 = _3546 + 1;
    float _3550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3552 = ~_3500;
    int _3554 = _3552 + 1;
    int _3556 = _3554 + 1;
    float _3558 = fma(_3544, _3544, _3526);
    int _3560 = ~_3534;
    int _3562 = _3560 + 1;
    int _3564 = _3562 + 1;
    int _3566 = _3524 ^ _3548;
    int _3568 = _3556 * as_type<int>(_3324);
    int _3570 = _3568 + _3470;
    int _3572 = abs(_3474);
    int _3574 = _3564 * as_type<int>(_3392);
    int _3576 = _3574 + _3532;
    int _3578 = ~_3538;
    int _3580 = _3578 + 1;
    int _3582 = _3580 + 1;
    float _3584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3586 = ~_3548;
    int _3588 = _3586 + _3566;
    int _3590 = _3588 + 1;
    int _3592 = ~_3540;
    int _3594 = _3592 + 1;
    int _3596 = _3594 + 1;
    int _3598 = _3582 * as_type<int>(_3418);
    int _3600 = _3598 + _3570;
    int _3602 = ~_3572;
    int _3604 = _3602 + 1;
    int _3606 = _3604 + 1;
    bool _3608 = !_3514;
    int _3610 = _3608 ? _3590 : (-1);
    int _3612 = _3576 * _3596;
    float _3614 = sqrt(_3558);
    int _3616 = _3606 * as_type<int>(_3426);
    int _3618 = _3616 + _3600;
    float _3620 = float(_3610);
    float _3622 = _3550 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3624 = ~_2314;
    int _3626 = _3624 + 1;
    int _3628 = _3626 + 1;
    float _3630 = _1146 + 0.5;
    bool _3632 = !_3454;
    int _3634 = _3632 ? _2254 : (-1);
    float _3636 = -_2508;
    float _3638 = fma(_3622, _3620, _3636);
    float _3640 = _1168 + (-0.5);
    int _3642 = _3618 * _3628;
    float _3644 = float(_3508);
    float _3646 = _3584 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3648 = _3634 * _3540;
    int _3650 = _3648 + _3612;
    float _3652 = -_3622;
    float _3654 = fma(_3652, _3640, _3638);
    int _3656 = _3462 * _2314;
    int _3658 = _3656 + _3642;
    float _3660 = fma(_3646, _3644, _2494);
    float _3662 = in.m_88.x;
    float _3664 = in.m_88.y;
    float _3666 = in.m_88.z;
    float _3668 = _3404 * _3614;
    float _3670 = float(_3650);
    float _3672 = fma(_3646, _3630, _3660);
    bool _3674 = !_2646;
    int _3676 = _3674 ? 0 : 1;
    float _3678 = _3438 * _3668;
    float _3680 = float(_2606);
    float _3682 = -_2584;
    float _3684 = fma(_1146, _3682, _3672);
    float _3686 = float(_3658);
    float _3688 = fma(_1168, _2638, _3654);
    int _3690 = abs(_3676);
    out.m_90.x = _3670;
    bool _3692 = !_2650;
    int _3694 = _3692 ? 0 : 1;
    float _3696 = float(_3690);
    out.m_90.w = _3686;
    out.m_92.x = _3684;
    out.m_92.y = _3688;
    out.m_94.x = _3678;
    float _3698 = _3666;
    if (_3002)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3700 = fma(_3370, _3662, _3662);
    float _3702 = -_3494;
    float _3704 = _2346 + _3702;
    float _3706 = -_3498;
    float _3708 = _2908 + _3706;
    float _3710 = fma(_3016, _3370, _3016);
    float _3712 = fma(_3020, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3700);
    float _3714 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3716 = _3704 + _3714;
    float _3718 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3720 = _3708 + _3718;
    float _3722 = _3696 * _3680;
    float _3724 = fma(_3710, _2512, _3712);
    float _3726 = _3716 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3728 = -_3536;
    float _3730 = _2924 + _3728;
    int _3732 = abs(_3694);
    float _3734 = _3022 + (-1.0);
    float _3736 = fma(_3720, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3726);
    float _3738 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3740 = _3730 + _3738;
    float _3742 = _3722 * (-2.0);
    float _3744 = float(_2688);
    float _3746 = fma(_3740, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3736);
    float _3748 = float(_3732);
    float _3750 = fma(_3734, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3752 = fma(_3742, _3664, _3664);
    float _3754 = _984 + (-0.5);
    bool _3756 = _3746 >= 0.0;
    float _3758 = _3748 * _3744;
    float _3760 = fma(_3750, _3742, _3750);
    float _3762 = fma(_3024, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3752);
    float _3764 = _3014 + (-1.0);
    float _3766 = _3758 * (-2.0);
    float _3768 = _3724 * 0.15915493667125701904296875;
    float _3770 = fma(_3760, _2512, _3762);
    float _3772 = fma(_3764, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3774 = fma(_3766, _3666, _3666);
    float _3776 = _3768 * 6.283185482025146484375;
    float _3778 = sin(_3776);
    float _3780 = _3770 * 0.15915493667125701904296875;
    float _3782 = fma(_3772, _3766, _3772);
    if (_3756)
    {
        _3698 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3784 = _3698;
    float _3786 = fma(_3754, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3774);
    int _3788 = as_type<int>(_3784);
    if (_3756)
    {
        out.m_57.x = 0.0;
    }
    float _3790 = _3768 * 6.283185482025146484375;
    float _3792 = cos(_3790);
    if (_3756)
    {
        float _3794 = _3784 * 5.0;
        _3788 = as_type<int>(_3794);
    }
    int _3796 = _3788;
    float _3798 = fma(_3782, _2512, _3786);
    if (_3756)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10765 = as_type<float>(_3796);
        out.gl_Position.z = _10765;
    }
    float _3800 = _3798 * 0.15915493667125701904296875;
    float _3802 = _3780 * 6.283185482025146484375;
    float _3804 = sin(_3802);
    float _3806 = _3780 * 6.283185482025146484375;
    float _3808 = cos(_3806);
    if (_3756)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3810 = _3800 * 6.283185482025146484375;
    float _3812 = cos(_3810);
    float _3814 = _449 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3816 = _3408 * _3668;
    float _3818 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _229);
    float _3820 = _3778 * _3804;
    float _3822 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _243);
    float _3824 = _3814 * _3816;
    float _3826 = _3792 * _3804;
    float _3828 = _3800 * 6.283185482025146484375;
    float _3830 = sin(_3828);
    float _3832 = _3678 * _3822;
    float _3834 = _3824 * _3818;
    float _3836 = _3792 * _3808;
    float _3838 = _3778 * _3808;
    float _3840 = _3792 * _3812;
    float _3842 = _3808 * _3812;
    float _3844 = _3778 * _3812;
    float _3846 = _3804 * _3812;
    float _3848 = _3840 * _3834;
    float _3850 = _3816 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3852 = _3850 * 0.5;
    float _3854 = fma(_3830, _3836, _3820);
    float _3856 = -_3838;
    float _3858 = fma(_3830, _3826, _3856);
    float _3860 = -_3834;
    float _3862 = _3830 * _3860;
    float _3864 = -_3826;
    float _3866 = fma(_3830, _3838, _3864);
    float _3868 = fma(_3854, _3832, _3848);
    float _3870 = _3844 * _3834;
    float _3872 = fma(_3842, _3832, _3862);
    float _3874 = fma(_3830, _3820, _3836);
    float _3876 = fma(_3858, _3852, _3868);
    float _3878 = fma(_3866, _3832, _3870);
    float _3880 = fma(_3846, _3852, _3872);
    float _3882 = _3876 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3884 = fma(_3874, _3852, _3878);
    float _3886 = _3876 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3888 = _3876 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3890 = fma(_3880, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3882);
    float _3892 = fma(_3880, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3886);
    float _3894 = fma(_3880, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3888);
    float _3896 = fma(_3884, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3890);
    float _3898 = fma(_3884, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3892);
    float _3900 = fma(_3884, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3894);
    float _3902 = _3896 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3904 = _3898 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3906 = _3900 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3908 = _2924 + _3902;
    float _3910 = _2908 + _3904;
    float _3912 = _2346 + _3906;
    float _3914 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3916 = _3908 + _3914;
    float _3918 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3920 = _3910 + _3918;
    float _3922 = _3916 * _3916;
    float _3924 = fma(_3920, _3920, _3922);
    float _3926 = sqrt(_3924);
    bool _3928 = _3926 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3930 = _3904;
    float _3932 = _3884;
    float _3934 = _3910;
    if (!_3928)
    {
        _3930 = _3908;
    }
    float _3936 = _3930;
    float _3938 = _3936;
    if (!_3928)
    {
        _3932 = _3912;
    }
    float _3940 = _3932;
    bool _3942 = !_3928;
    float _3944 = _3940;
    if (!_3942)
    {
        float _3946 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3948 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3950 = _3926 + _3948;
        float _3952 = rsqrt(_3924);
        float _3954 = _3950 * _3946;
        float _3956 = _3912 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3958 = _3954 * 0.15915493667125701904296875;
        float _3960 = _3958 * 6.283185482025146484375;
        float _3962 = cos(_3960);
        float _3964 = _3958 * 6.283185482025146484375;
        float _3966 = sin(_3964);
        float _3968 = _3962 + (-1.0);
        float _3970 = _3968 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3972 = fma(_3966, _3956, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3974 = fma(_3912, _3962, _3970);
        float _3976 = _3952 * _3972;
        float _3978 = fma(_3920, _3976, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3980 = fma(_3916, _3976, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3934 = _3978;
        _3938 = _3980;
        _3944 = _3974;
    }
    float _3982 = _3934;
    float _3984 = _3938;
    float _3986 = _3944;
    float _3988 = fma(_3982, 6.2500002968590706586837768554688e-05, 0.5);
    float _3990 = fma(_3984, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _11082 = float2(_3988, _3990);
    float3 _3994 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_11082, float2(0.0), isnan(_11082)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_11082, float2(0.0), isnan(_11082)), level(0.0)).xyz;
    float _3996 = _3994.x;
    float _3998 = _3994.y;
    float _4000 = _3994.z;
    float _4002 = _3854 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4004 = _3854 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4006 = _3854 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4008 = _3840 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4010 = fma(_3842, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4002);
    float _4012 = fma(_3842, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4004);
    float _4014 = _3840 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4016 = _3840 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4018 = fma(_3842, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4006);
    float _4020 = -_3830;
    float _4022 = fma(_4020, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4008);
    float _4024 = -_3830;
    float _4026 = fma(_4024, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4014);
    float _4028 = -_3830;
    float _4030 = fma(_4028, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4016);
    float _4032 = _3858 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4034 = _3858 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4036 = _3858 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4038 = _229 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4040 = fma(_3846, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4032);
    float _4042 = -_3180;
    float _4044 = _2908 + _4042;
    float _4046 = fma(_3846, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4036);
    float _4048 = fma(_4038, _4038, 1.0);
    float _4050 = -_3174;
    float _4052 = _4050 + _2346;
    float _4054 = -_3174;
    float _4056 = _4054 + _3986;
    float _4058 = -_3180;
    float _4060 = _4058 + _3982;
    float _4062 = rsqrt(_4048);
    float _4064 = fma(_3846, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4034);
    float _4066 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4068 = _4056 + _4066;
    float _4070 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4072 = _4060 + _4070;
    float _4074 = -_3224;
    float _4076 = _4074 + _3984;
    float _4078 = fma(_3844, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4026);
    float _4080 = _4068 * _4068;
    float _4082 = fma(_3844, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4030);
    float _4084 = fma(_3844, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4022);
    float _4086 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4088 = _4076 + _4086;
    float _4090 = fma(_4072, _4072, _4080);
    float _4092 = fma(_3874, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4040);
    float _4094 = fma(_3874, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4064);
    float _4096 = fma(_3874, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4046);
    float _4098 = fma(_4088, _4088, _4090);
    float _4100 = fma(_3866, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4010);
    float _4102 = _4038 * _4062;
    float _4104 = fma(_3866, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4012);
    float _4106 = _243 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4108 = _4038 * _4078;
    float _4110 = _4038 * _4082;
    float _4112 = fma(_3866, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4018);
    float _4114 = _4038 * _4084;
    float _4116 = -_4092;
    float _4118 = _4102 * _4116;
    float _4120 = -_4094;
    float _4122 = _4102 * _4120;
    float _4124 = -_4096;
    float _4126 = _4102 * _4124;
    float _4128 = sqrt(_4098);
    float _4130 = fma(_4106, _4100, _4108);
    float _4132 = fma(_4106, _4104, _4110);
    float _4134 = fma(_4106, _4112, _4114);
    float _4136 = fma(_4062, _4078, _4118);
    float _4138 = fma(_4062, _4082, _4122);
    float _4140 = _4092 + _4130;
    float _4142 = fma(_4062, _4084, _4126);
    float _4144 = _4094 + _4132;
    float _4146 = _4096 + _4134;
    out.m_96.x = _4100;
    out.m_96.y = _4104;
    out.m_96.z = _4112;
    float _4148 = -_3224;
    float _4150 = _2924 + _4148;
    out.m_98.x = _4136;
    out.m_98.y = _4138;
    out.m_98.z = _4142;
    bool _4152 = _4128 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4154 = isnan(_4128);
    bool _4156 = _4152 || _4154;
    bool _4158 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4160 = _4156 || _4158;
    out.m_100.x = _4140;
    out.m_100.y = _4144;
    out.m_100.z = _4146;
    float _4162 = _4130;
    float _4164 = _4118;
    if (!_4160)
    {
        _4162 = 1.0;
    }
    float _4166 = _4162;
    out.m_102.x = _3996;
    out.m_102.y = _3998;
    out.m_102.z = _4000;
    bool _4168 = !_4160;
    float _4170 = _4166;
    if (!_4168)
    {
        bool _4172 = _4128 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4174 = isnan(_4128);
        bool _4176 = _4172 || _4174;
        bool _4178 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4180 = _4176 || _4178;
        if (!_4180)
        {
            float _4182 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4184 = _4128 + _4182;
            float _4186 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4188 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4186;
            float _4190 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4192 = _4190 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4194 = 1.0 / _4188;
            float _4196 = _4184 * _4194;
            float _4198 = fma(_4196, _4192, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4170 = _4198;
            _4200 = true;
        }
        else
        {
            bool _4202 = _4128 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4204 = isnan(_4128);
            bool _4206 = _4202 || _4204;
            bool _4208 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4210 = _4206 || _4208;
            if (!_4210)
            {
                float _4212 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4214 = _4128 + _4212;
                float _4216 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4218 = _4216 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4220 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4222 = _4220 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4224 = 1.0 / _4218;
                float _4226 = _4214 * _4224;
                float _4228 = fma(_4226, _4222, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4170 = _4228;
                _4200 = true;
            }
            else
            {
                _4170 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4200 = false;
    float _4230 = _4170;
    float _4232 = -_3494;
    float _4234 = _4232 + _4052;
    float _4236 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4238 = _4056 + _4236;
    float _4240 = -_3498;
    float _4242 = _4240 + _4044;
    float _4244 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4246 = _4060 + _4244;
    float _4248 = _4234 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4250 = fma(_4238, _4230, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4252 = -_3536;
    float _4254 = _4252 + _4150;
    float _4256 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4258 = _4076 + _4256;
    float _4260 = fma(_4242, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4248);
    float _4262 = fma(_4246, _4230, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4264 = -_4052;
    float _4266 = _4264 + _4250;
    float _4268 = fma(_4258, _4230, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4270 = fma(_4254, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4260);
    float _4272 = -_4044;
    float _4274 = _4272 + _4262;
    float _4276 = _4266 * _4266;
    float _4278 = -_4150;
    float _4280 = _4278 + _4268;
    float _4282 = _4270 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4284 = _4234 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4286 = fma(_4274, _4274, _4276);
    float _4288 = 1.0 / _4282;
    float _4290 = fma(_4242, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4284);
    float _4292 = fma(_4280, _4280, _4286);
    float _4294 = fma(_4254, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4290);
    float _4296 = sqrt(_4292);
    float _4298 = _4294 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4300 = _4298 + _4282;
    float _4302 = _4300 * _4288;
    float _4304 = _4302 * 0.5;
    bool _4306 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4308 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4310 = _4306 || _4308;
    bool _4312 = isnan(0.5);
    bool _4314 = _4310 || _4312;
    float _4316 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4318 = fma(_4304, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4316);
    bool _4320 = _4296 > 0.0;
    float _4322 = 1.0 / _4318;
    bool _4324 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4326 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4328 = _4324 || _4326;
    bool _4330 = isnan(0.5);
    bool _4332 = _4328 || _4330;
    float _4334 = _4288;
    float _4336 = _4262;
    float _4338 = _4274;
    float _4340 = _4266;
    float _4342 = _4254;
    float _4344 = _4234;
    if (!_4320)
    {
        _4334 = _4250;
    }
    float _4346 = _4334;
    float _4348 = _4346;
    float _4350 = _4346;
    if (!_4320)
    {
        _4164 = _4268;
    }
    float _4352 = _4164;
    bool _4354 = !_4320;
    float _4356 = _4352;
    float _4358 = _4352;
    if (!_4354)
    {
        float _4360 = _249 * _249;
        float _4362 = fma(_247, _247, _4360);
        float _4364 = fma(_251, _251, _4362);
        float _4366 = rsqrt(_4292);
        float _4368 = sqrt(_4364);
        float _4370 = _4274 * _4366;
        float _4372 = _4266 * _4366;
        float _4374 = _4280 * _4366;
        bool _4376 = _4368 > 0.0;
        if (!_4376)
        {
            _4348 = _4250;
        }
        float _4378 = _4348;
        _4350 = _4378;
        if (!_4376)
        {
            _4356 = _4268;
        }
        float _4380 = _4356;
        bool _4382 = !_4376;
        _4358 = _4380;
        if (!_4382)
        {
            float _4384 = rsqrt(_4364);
            float _4386 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4388 = _249 * _4384;
            float _4390 = _247 * _4384;
            float _4392 = _251 * _4384;
            float _4394 = _4372 * _4388;
            float _4396 = fma(_4370, _4390, _4394);
            float _4398 = _4386 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4400 = fma(_4374, _4392, _4396);
            float _4402 = _4400 * _4398;
            float _4404 = fma(_247, _4402, _4262);
            float _4406 = fma(_249, _4402, _4250);
            float _4408 = fma(_251, _4402, _4268);
            _4336 = _4404;
            _4350 = _4406;
            _4358 = _4408;
            _4338 = _4396;
        }
    }
    float _4410 = _4336;
    float _4412 = _4350;
    float _4414 = _4358;
    float _4416 = _4338;
    float _4418 = -_3498;
    float _4420 = _4418 + _4410;
    float _4422 = -_3494;
    float _4424 = _4422 + _4412;
    float _4426 = -_3536;
    float _4428 = _4426 + _4414;
    float _4430 = _4416;
    float _4432 = _4424;
    float _4434 = _4420;
    float _4436 = _4428;
    float _4438 = _4412;
    if (_4314)
    {
        _4430 = 1.0;
    }
    float _4440 = _4430;
    float _4442 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4444 = _4322 * _4442;
    float _4446 = _4440;
    if (!_4332)
    {
        float _4448 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4450 = _4234 + _4448;
        float _4452 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4454 = _4242 + _4452;
        float _4456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4458 = -_4150;
        float _4460 = _4458 + _4414;
        float _4462 = _4450 * _4450;
        float _4464 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4466 = _4254 + _4464;
        float _4468 = -_4044;
        float _4470 = _4468 + _4410;
        float _4472 = -_4052;
        float _4474 = _4472 + _4412;
        float _4476 = fma(_4454, _4454, _4462);
        float _4478 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4480 = fma(_4466, _4466, _4476);
        float _4482 = sqrt(_4480);
        float _4484 = 1.0 / _3668;
        float _4486 = _4478 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4488 = precise::min(_4482, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4490 = _4488 * _4456;
        float _4492 = _4490 * _4484;
        float _4494 = _4486 * _4492;
        float _4496 = _4460 * _4492;
        float _4498 = fma(_4470, _4494, _4242);
        float _4500 = fma(_4474, _4494, _4234);
        float _4502 = fma(_4486, _4496, _4254);
        _4432 = _4500;
        _4434 = _4498;
        _4436 = _4502;
        _4438 = _4474;
        _255 = _4486;
    }
    float _4504 = _4432;
    float _4506 = _4434;
    float _4508 = _4436;
    float _4510 = _4438;
    float _4512 = _255;
    float _4514 = _4510;
    float _4516 = _4512;
    if (!_4314)
    {
        float _4518 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4520 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4522 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4520;
        float _4524 = _4518 * 0.15915493667125701904296875;
        float _4526 = _4524 * 6.283185482025146484375;
        float _4528 = cos(_4526);
        float _4530 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4532 = _4530 * 0.15915493667125701904296875;
        float _4534 = _4524 * 6.283185482025146484375;
        float _4536 = sin(_4534);
        float _4538 = 1.0 / _4528;
        float _4540 = _4532 * 6.283185482025146484375;
        float _4542 = cos(_4540);
        float _4544 = _4536 * _4538;
        float _4546 = _4532 * 6.283185482025146484375;
        float _4548 = sin(_4546);
        float _4550 = _4542 * _4544;
        float _4552 = 1.0 / _4522;
        float _4554 = 1.0 / _4550;
        float _4556 = _4548 * _4554;
        float _4558 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4560 = fma(_4444, _4556, _4558);
        float _4562 = _4560 * _4552;
        float _4564 = precise::clamp(_4562, 0.0, 1.0);
        _4514 = _4532;
        _4516 = _4552;
        _4446 = _4564;
    }
    float _4566 = _4514;
    float _4568 = _4516;
    float _4570 = _4446;
    float _4572 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4574 = _4504 + _4572;
    float _4576 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4578 = _4506 + _4576;
    float _4580 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4582 = _4508 + _4580;
    float _4584 = _4574 * _4574;
    float _4586 = fma(_4578, _4578, _4584);
    float _4588 = fma(_4582, _4582, _4586);
    float _4590 = rsqrt(_4588);
    float _4592 = _4590 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4594 = _4578 * _4592;
    float _4596 = _4582 * _4592;
    float _4598 = _4594 * _4594;
    float _4600 = _4596 * _4596;
    float _4602 = _4598 + _4600;
    float _4604 = sqrt(_4602);
    bool _4606 = _4604 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4608 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4610 = _4604 + _4608;
    float _4612 = _4590;
    float _4614 = _4568;
    float _4616 = _4610;
    float _4618 = _4566;
    float _4620 = _4574;
    if (_4606)
    {
        float _4622 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4612 = _4622;
    }
    float _4624 = _4612;
    if (_4606)
    {
        float _4626 = rsqrt(_4602);
        _4614 = _4626;
    }
    float _4628 = _4614;
    float _4630 = _4628;
    if (_4606)
    {
        float _4632 = _4610 * _4624;
        _4616 = _4632;
    }
    float _4634 = _4616;
    if (_4606)
    {
        float _4636 = _4634 * 0.15915493667125701904296875;
        _4618 = _4636;
    }
    float _4638 = _4618;
    float _4640 = _4624;
    float _4642 = _4638;
    if (_4606)
    {
        float _4644 = _4638 * 6.283185482025146484375;
        float _4646 = cos(_4644);
        _4640 = _4646;
    }
    float _4648 = _4640;
    float _4650 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4652 = precise::max(0.0, _4650);
    float _4654 = _4582;
    float _4656 = _4652;
    if (_4606)
    {
        float _4658 = _4638 * 6.283185482025146484375;
        float _4660 = sin(_4658);
        _4654 = _4660;
    }
    float _4662 = _4654;
    float _4664 = -_4592;
    float _4666 = -_4652;
    float _4668 = fma(_4574, _4664, _4666);
    if (_4606)
    {
        float _4670 = _4668 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4620 = _4670;
    }
    float _4672 = _4620;
    float _4674 = _4672;
    float _4676 = _4648;
    if (_4606)
    {
        float _4678 = _4648 + (-1.0);
        _4656 = _4678;
    }
    float _4680 = _4656;
    float _4682 = _4680;
    if (!_4606)
    {
        _4642 = _4600;
    }
    float _4684 = _4642;
    float _4686 = _4684;
    if (_4606)
    {
        float _4688 = _4680 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4682 = _4688;
    }
    float _4690 = _4682;
    float _4692 = _4662;
    if (_4606)
    {
        float _4694 = fma(_4662, _4672, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4674 = _4694;
    }
    float _4696 = _4674;
    float _4698 = _4696;
    if (!_4606)
    {
        _4692 = _4668;
    }
    float _4700 = _4692;
    float _4702 = _4700;
    if (_4606)
    {
        float _4704 = fma(_4668, _4648, _4690);
        _4702 = _4704;
    }
    float _4706 = _4702;
    if (!_4606)
    {
        _4676 = _4598;
    }
    float _4708 = _4676;
    float _4710 = _4708;
    if (_4606)
    {
        float _4712 = _4628 * _4696;
        _4340 = _4712;
    }
    float _4714 = _4340;
    float _4716 = sqrt(_4588);
    if (!_4606)
    {
        _4630 = _4594;
    }
    float _4718 = _4630;
    float _4720 = _4718;
    if (_4606)
    {
        float _4722 = _4594 * _4714;
        _4720 = _4722;
    }
    float _4724 = _4720;
    if (!_4606)
    {
        _4698 = _4596;
    }
    float _4726 = _4698;
    float _4728 = _4726;
    if (_4606)
    {
        float _4730 = _4596 * _4714;
        _4728 = _4730;
    }
    float _4732 = _4728;
    float _4734 = fma(_4242, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_4606)
    {
        float _4736 = _4724 * _4724;
        _4710 = _4736;
    }
    float _4738 = _4710;
    float _4740 = _4504 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_4606)
    {
        float _4742 = _4732 * _4732;
        _4686 = _4742;
    }
    float _4744 = _4686;
    float _4746 = fma(_4706, _4706, _4738);
    float _4748 = fma(_4506, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4740);
    float _4750 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4752 = _4746 + _4744;
    float _4754 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4756 = fma(_4716, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4754);
    float _4758 = precise::clamp(_4756, 0.0, 1.0);
    float _4760 = fma(_4508, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4748);
    float _4762 = rsqrt(_4752);
    float _4764 = -_4758;
    float _4766 = _4764 + 1.0;
    float _4768 = _4760 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4770 = fma(_4254, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4772 = _4504 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4774 = _4768 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4776 = abs(_4766);
    float _4778 = log2(_4776);
    float _4780 = _4504 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4782 = fma(_4506, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4772);
    float _4784 = -_4774;
    float _4786 = fma(_4784, _4750, 1.0);
    float _4788 = _4504 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4790 = fma(_4506, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4780);
    float _4792 = fma(_4508, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4782);
    float _4794 = fma(_4506, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4788);
    float _4796 = fma(_4508, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4790);
    float _4798 = floor(_4734);
    float _4800 = _4762 * _4724;
    float _4802 = fma(_4508, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4794);
    float _4804 = _4796 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4806 = _4762 * _4706;
    float _4808 = _4762 * _4732;
    float _4810 = _4802 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4812 = _4804 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4814 = _4800 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4816 = _4778 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4818 = floor(_4770);
    float _4820 = fma(_4810, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4812);
    float _4822 = -_4814;
    float _4824 = fma(_4806, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4822);
    float _4826 = _4792 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4828 = fma(_4768, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4820);
    float _4830 = -_4808;
    float _4832 = fma(_4830, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4824);
    float _4834 = -_4798;
    float _4836 = _4734 + _4834;
    float _4838 = exp2(_4816);
    float _4840 = fma(_4826, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4828);
    float _4842 = fma(_4832, -0.5, 0.5);
    float _4844 = _4804 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4846 = fma(_4832, 0.5, 0.5);
    float _4848 = _4804 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4850 = fma(_4810, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4844);
    float _4852 = log2(_4786);
    float _4854 = fma(_4810, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4848);
    float _4856 = fma(_4846, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4858 = fma(_4768, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4850);
    float _4860 = -_4818;
    float _4862 = _4770 + _4860;
    float _4864 = fma(_4768, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4854);
    float _4866 = fma(_4846, _4856, -0.212114393711090087890625);
    float _4868 = 1.0 / _4840;
    float _4870 = fma(_4846, _4866, 1.570728778839111328125);
    float _4872 = sqrt(_4842);
    float _4874 = _4852 * 0.693147182464599609375;
    float _4876 = _4874 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4878 = _4806 + 1.0;
    float _4880 = -_4806;
    float _4882 = fma(_4838, _4878, _4880);
    float _4884 = fma(_4826, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4858);
    float _4886 = fma(_4826, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4864);
    float _4888 = _4872 * 0.636619746685028076171875;
    float _4890 = fma(_4882, 0.5, 0.5);
    float _4892 = _4884 * _4868;
    float _4894 = _4886 * _4868;
    float _4896 = -_4870;
    float _4898 = fma(_4888, _4896, 1.0);
    float2 _12564 = float2(_4836, _4862);
    float _4900 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12564, float2(0.0), isnan(_12564)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12564, float2(0.0), isnan(_12564)), level(0.0)).x;
    float _4902 = fma(_4892, 0.5, 0.5);
    float _4904 = fma(_4894, -0.5, 0.5);
    float3 _12577 = float3(_4902, _4904, _4876);
    float _4906 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12577, float3(0.0), isnan(_12577)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12577, float3(0.0), isnan(_12577)), level(0.0)).x;
    float3 _12588 = float3(_4902, _4904, _4876);
    float4 _4909 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12588, float3(0.0), isnan(_12588)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12588, float3(0.0), isnan(_12588)), level(0.0)).xyzw;
    float _4911 = _4909.x;
    float _4913 = _4909.y;
    float _4915 = _4909.z;
    float _4917 = _4909.w;
    float2 _12604 = float2(_4898, _4890);
    float3 _4919 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12604, float2(0.0), isnan(_12604)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12604, float2(0.0), isnan(_12604)), level(0.0)).xyz;
    float _4921 = _4919.x;
    float _4923 = _4919.y;
    float _4925 = _4919.z;
    float _4927 = abs(_4444);
    float _4929 = log2(_4927);
    float _4931 = _4804 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_104.x = _4242;
    out.m_104.y = _4234;
    out.m_104.z = _4254;
    bool _4933 = _4716 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4935 = isnan(_4716);
    bool _4937 = _4933 || _4935;
    bool _4939 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4941 = _4937 || _4939;
    float _4943 = fma(_4810, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4931);
    float _4945 = _4840 * 0.5;
    out.m_106.x = _4506;
    out.m_106.y = _4504;
    out.m_106.z = _4508;
    float _4947 = fma(_4768, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4943);
    float _4949 = in.m_78.x;
    float _4951 = fma(_4826, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4947);
    float _4953 = fma(_4886, -0.5, _4945);
    float _4955 = _4929 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4957 = _4951 + _4840;
    out.gl_Position.x = _4884;
    out.gl_Position.y = _4886;
    out.gl_Position.z = _4951;
    out.gl_Position.w = _4840;
    float _4959 = _4886;
    float _4961 = _4884;
    if (!_4941)
    {
        _4342 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4963 = _4342;
    float _4965 = exp2(_4955);
    float _4967 = _4957 * 0.5;
    float _4969 = _4963;
    float _4971 = _4963;
    if (!_4941)
    {
        _4344 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4973 = _4344;
    float _4975 = _4973;
    float _4977 = _4973;
    if (!_4941)
    {
        _4959 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4979 = _4959;
    float _4981 = fma(_4965, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4983 = precise::clamp(_4981, 0.0, 1.0);
    float _4985 = _4778 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _4987 = _4444 <= 8000.0;
    bool _4989 = isnan(_4444);
    bool _4991 = _4987 || _4989;
    bool _4993 = isnan(8000.0);
    bool _4995 = _4991 || _4993;
    float _4997 = float(_4995);
    float _4999 = _4884 + _4840;
    float _5001 = fma(_4983, -2.0, 3.0);
    float _5003 = _4983 * _4983;
    float _5005 = _4999;
    float _5007 = _4979;
    float _5009 = _4979;
    if (!_4941)
    {
        _4961 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5011 = _4961;
    float _5013 = exp2(_4985);
    float _5015 = _4999 * 0.5;
    float _5017 = _5003 * _5001;
    float _5019 = _5011;
    float _5021 = _5011;
    if (!_4941)
    {
        _5005 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5023 = _5005;
    float _5025 = -_5017;
    float _5027 = _5025 + 1.0;
    float _5029 = fma(_5027, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5017);
    float _5031 = _4570 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5033 = _4997 * _5029;
    float _5035 = -_5013;
    float _5037 = _5035 + 1.0;
    out.m_108.x = _5015;
    out.m_108.y = _4953;
    out.m_108.z = _4967;
    out.m_108.w = _4840;
    float _5039 = _5033 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5041 = _5037 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5043 = -_5041;
    float _5045 = _5043 + 1.0;
    float _5047 = -_4900;
    float _5049 = _5047 + 1.0;
    float _5051 = _5049 * _5039;
    float _5053 = precise::clamp(_5051, 0.0, 1.0);
    float _5055 = _5041 * _4906;
    float _5057 = _4917 * _5045;
    float _5059 = -_5053;
    float _5061 = fma(_5059, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5063 = _5045;
    float _5065 = _5023;
    float _5067 = _5023;
    if (!_4941)
    {
        _5063 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5069 = _5063;
    float _5071 = _4917 * _5055;
    float _5073 = _4925 * _5055;
    float _5075 = _5061 * _4949;
    float _5077 = fma(_4921, _5071, _4911);
    float _5079 = fma(_4923, _5071, _4913);
    float _5081 = _5075 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5083 = fma(_4917, _5073, _4915);
    out.m_110.x = _5081;
    out.m_112.x = _5077;
    out.m_112.y = _5079;
    out.m_112.z = _5083;
    out.m_112.w = _5057;
    bool _5085 = !_4941;
    float _5087 = _5069;
    float _5089 = _5069;
    if (!_5085)
    {
        bool _5091 = _4716 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5093 = isnan(_4716);
        bool _5095 = _5091 || _5093;
        bool _5097 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5099 = _5095 || _5097;
        if (!_5099)
        {
            float _5101 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5103 = _4716 + _5101;
            float _5105 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5107 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5105;
            float _5109 = 1.0 / _5107;
            float _5111 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5113 = _5111 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5115 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5117 = _5115 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5119 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5121 = _5119 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5123 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5125 = _5123 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5127 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5129 = _5127 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5131 = _5103 * _5109;
            float _5133 = precise::clamp(_5131, 0.0, 1.0);
            float _5135 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5137 = _5135 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5139 = fma(_5133, _5113, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5141 = fma(_5133, _5137, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5143 = fma(_5133, _5117, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5145 = fma(_5133, _5121, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5147 = fma(_5133, _5125, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5149 = fma(_5133, _5129, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5009 = _5141;
            _5089 = _5147;
            _5021 = _5139;
            _4977 = _5145;
            _4971 = _5143;
            _5067 = _5149;
            _5151 = true;
        }
        else
        {
            bool _5153 = _4716 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5155 = isnan(_4716);
            bool _5157 = _5153 || _5155;
            bool _5159 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5161 = _5157 || _5159;
            if (!_5161)
            {
                _5019 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5163 = _5019;
            _5021 = _5163;
            if (!_5161)
            {
                _5007 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5165 = _5007;
            _5009 = _5165;
            if (!_5161)
            {
                _4969 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5167 = _4969;
            _4971 = _5167;
            if (!_5161)
            {
                _4975 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5169 = _4975;
            _4977 = _5169;
            if (!_5161)
            {
                _5087 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5171 = _5087;
            _5089 = _5171;
            if (!_5161)
            {
                _5065 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5173 = _5065;
            bool _5175 = !_5161;
            _5067 = _5173;
            if (!_5175)
            {
                bool _5177 = _4716 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5179 = isnan(_4716);
                bool _5181 = _5177 || _5179;
                bool _5183 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5185 = _5181 || _5183;
                if (!_5185)
                {
                    float _5187 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5189 = _4716 + _5187;
                    float _5191 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5193 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5191;
                    float _5195 = 1.0 / _5193;
                    float _5197 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5199 = _5197 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5201 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5203 = _5201 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5205 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5207 = _5205 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5209 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5211 = _5209 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5213 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5215 = _5213 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5217 = _5189 * _5195;
                    float _5219 = precise::clamp(_5217, 0.0, 1.0);
                    float _5221 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5223 = _5221 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5225 = fma(_5219, _5199, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5227 = fma(_5219, _5223, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5229 = fma(_5219, _5203, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5231 = fma(_5219, _5207, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5233 = fma(_5219, _5211, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5235 = fma(_5219, _5215, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5009 = _5227;
                    _5089 = _5233;
                    _5021 = _5225;
                    _4977 = _5231;
                    _4971 = _5229;
                    _5067 = _5235;
                    _5151 = true;
                }
                else
                {
                    _5009 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5089 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5021 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4977 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4971 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5067 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5151 = false;
    float _5237 = _5009;
    float _5239 = _5089;
    float _5241 = _5021;
    float _5243 = _4977;
    float _5245 = _4971;
    float _5247 = _5067;
    float _5249 = fma(_4144, -0.5, 0.5);
    float _5251 = precise::clamp(_5249, 0.0, 1.0);
    float _5253 = -_5237;
    float _5255 = _5253 + _5239;
    float _5257 = _5031 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5259 = -_5241;
    float _5261 = _5259 + _5243;
    out.m_114.x = 0.0;
    float _5263 = fma(_5251, _5255, _5237);
    float _5265 = fma(_5251, _5261, _5241);
    out.m_57.x = _5257;
    float _5267 = -_5245;
    float _5269 = _5267 + _5247;
    float _5271 = _5263 * 0.586610972881317138671875;
    bool _5273 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5275 = fma(_5251, _5269, _5245);
    float _5277 = fma(_5265, 0.298911988735198974609375, _5271);
    bool _5279 = _4570 > 0.0;
    bool _5281 = isnan(_4570);
    bool _5283 = _5279 || _5281;
    bool _5285 = isnan(0.0);
    bool _5287 = _5283 || _5285;
    float _5289 = fma(_5275, 0.114477999508380889892578125, _5277);
    float _5291 = -_5289;
    float _5293 = _5265 + _5291;
    float _5295 = -_5289;
    float _5297 = _5263 + _5295;
    float _5299 = -_5289;
    float _5301 = _5275 + _5299;
    float _5303 = fma(_5293, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5289);
    float _5305 = fma(_5297, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5289);
    float _5307 = fma(_5301, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5289);
    bool _5309 = !_5273;
    if (!_5309)
    {
        float _5311 = -_4504;
        float _5313 = _5311 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5315 = -_4506;
        float _5317 = _5315 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5319 = -_4508;
        float _5321 = _5319 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5323 = _5313 * _5313;
        float _5325 = fma(_5317, _5317, _5323);
        float _5327 = fma(_5321, _5321, _5325);
        float _5329 = sqrt(_5327);
        float _5331 = rsqrt(_5327);
        float _5333 = -_5329;
        float _5335 = _5333 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5337 = _5335 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5339 = precise::clamp(_5337, 0.0, 1.0);
        float _5341 = _5317 * _5331;
        float _5343 = _5313 * _5331;
        float _5345 = abs(_5339);
        float _5347 = log2(_5345);
        float _5349 = _5321 * _5331;
        float _5351 = _5341 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5353 = _4144 * _5343;
        float _5355 = -_5343;
        float _5357 = -_5351;
        float _5359 = fma(_5355, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5357);
        float _5361 = fma(_4140, _5341, _5353);
        float _5363 = -_5349;
        float _5365 = fma(_5363, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5359);
        float _5367 = fma(_4146, _5349, _5361);
        float _5369 = precise::clamp(_5367, 0.0, 1.0);
        float _5371 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5373 = _5365 + _5371;
        float _5375 = _5347 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5377 = _5373 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5379 = precise::clamp(_5377, 0.0, 1.0);
        float _5381 = exp2(_5375);
        float _5383 = _5381 * _5379;
        float _5385 = _5369 * _5383;
        float _5387 = _5385 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5389 = _5385 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5391 = _5385 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_114.x = _5387;
        out.m_114.y = _5389;
        out.m_114.z = _5391;
    }
    out.m_80.x = _5303;
    out.m_80.y = _5305;
    out.m_80.z = _5307;
    if (_5287)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_57.x = 0.0;
    float _5393 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5393;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_114 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_110 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_112 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5151 = false;
    bool _4200 = false;
    bool _609 = false;
    bool _473 = false;
    bool _275 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _128 = in.m_50.w;
    float _130 = in.m_52.w;
    float _132 = trunc(_128);
    int _135 = int(_132);
    float _137 = -_130;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.y = _139;
    bool _143 = _135 >= 1;
    float _145 = 0.0;
    float _147 = _130;
    float _149 = _139;
    if (!_143)
    {
        _145 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _145;
    if (!_143)
    {
        out.m_57.x = 0.0;
    }
    int _153 = 0;
    if (!_143)
    {
        float _155 = _151 * 5.0;
        _153 = as_type<int>(_155);
    }
    int _157 = _153;
    int _159 = _157;
    if (!_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5461 = as_type<float>(_157);
        out.gl_Position.z = _5461;
    }
    if (!_143)
    {
        return out;
    }
    bool _161 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _163 = isnan(_130);
    bool _165 = _161 || _163;
    bool _167 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _169 = _165 || _167;
    float _171 = float(_135);
    bool _173 = _139 >= _171;
    bool _175 = !_169;
    bool _177 = _173 || _175;
    float _179 = 1.0 / _171;
    if (_177)
    {
        _147 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _181 = _147;
    if (_177)
    {
        out.m_57.x = 0.0;
    }
    float _183 = _139 * _179;
    float _185 = _183;
    if (_177)
    {
        float _187 = _181 * 5.0;
        _159 = as_type<int>(_187);
    }
    int _189 = _159;
    out.m_55.x = _183;
    if (_177)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5524 = as_type<float>(_189);
        out.gl_Position.z = _5524;
    }
    if (_177)
    {
        return out;
    }
    float _191 = as_type<float>(int(gl_VertexIndex));
    float _193 = in.m_62.x;
    float _195 = in.m_62.y;
    float _197 = in.m_62.z;
    float _199 = in.m_64.x;
    float _201 = in.m_64.y;
    float _203 = in.m_64.z;
    float _205 = in.m_66.x;
    float _207 = in.m_66.y;
    float _209 = in.m_66.z;
    float _211 = in.m_68.x;
    float _213 = in.m_68.y;
    float _215 = in.m_68.z;
    int _217 = as_type<int>(_191) & 1;
    bool _219 = _217 != 0;
    int _221 = as_type<int>(_191) & 2;
    bool _223 = _221 != 0;
    bool _225 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _227 = !_223;
    float _229 = _227 ? (-0.5) : 0.5;
    float _231 = _195 * _201;
    float _233 = _195 * _207;
    float _235 = fma(_193, _199, _231);
    float _237 = _195 * _213;
    float _239 = fma(_193, _205, _233);
    bool _241 = !_219;
    float _243 = _241 ? (-0.5) : 0.5;
    float _245 = fma(_193, _211, _237);
    float _247 = fma(_197, _203, _235);
    float _249 = fma(_197, _209, _239);
    float _251 = fma(_197, _215, _245);
    bool _253 = !_225;
    float _255 = _247;
    float _273;
    if (!_253)
    {
        float _257 = in.m_70.x;
        float _259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _261 = _257 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _265 = _263 * _259;
        float _267 = floor(_265);
        float _269 = -_267;
        float _271 = _265 + _269;
        _273 = _271;
        _275 = true;
    }
    else
    {
        _273 = _183;
    }
    _275 = false;
    float _277 = _273;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _281 = _277 + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _285 = _277 + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _293 = _291 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _295;
    bool _299 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _301 = isnan(_277);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = 1.0 / _289;
    bool _313 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _315 = 1.0 / _293;
    float _317 = 1.0 / _297;
    float _319 = _281 * _311;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _277 + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _325;
    float _329 = fma(_327, _319, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _331 = _323 * _315;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _333;
    bool _337 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _339 = isnan(_277);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = fma(_335, _319, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _351 = -_347;
    float _353 = _351 + 1.0;
    float _355 = _285 * _317;
    float _357 = -_309;
    float _359 = _357 + 1.0;
    bool _361 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _363 = isnan(_277);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = _347 * _359;
    bool _375 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _377 = isnan(_277);
    bool _379 = _375 || _377;
    bool _381 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _383 = _379 || _381;
    float _385 = float(_383);
    float _387 = _371 * _353;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _397 = -_371;
    float _399 = _397 + 1.0;
    float _401 = fma(_391, _331, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _403 = fma(_395, _331, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _405 = _385 * _399;
    float _407 = in.m_72.x;
    float _409 = in.m_72.y;
    float _411 = -_385;
    float _413 = _411 + 1.0;
    float _415 = _329 * _405;
    float _417 = _349 * _405;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _423;
    float _427 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[143].x, _415);
    float _429 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[143].y, _417);
    float _431 = fma(_421, _355, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _433 = fma(_425, _355, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _435 = fma(_401, _387, _427);
    float _437 = fma(_403, _387, _429);
    float _439 = fma(_431, _373, _435);
    float _441 = fma(_433, _373, _437);
    float _443 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[146].x, _439);
    float _445 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[146].y, _441);
    float _447 = _443 * _407;
    float _449 = _445 * _409;
    bool _451 = !_313;
    float _453 = _355;
    float _471;
    if (!_451)
    {
        float _455 = in.m_70.x;
        float _457 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _459 = _455 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _461 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _463 = _461 * _457;
        float _465 = floor(_463);
        float _467 = -_465;
        float _469 = _463 + _467;
        _471 = _469;
        _473 = true;
    }
    else
    {
        _471 = _183;
    }
    _473 = false;
    float _475 = _471;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _479 = _475 + _477;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _485 = _475 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _487 = isnan(_475);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _501 = _475 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _503 = isnan(_475);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _513;
    bool _517 = _475 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _519 = isnan(_475);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    float _529 = 1.0 / _483;
    float _531 = -_495;
    float _533 = _531 + 1.0;
    bool _535 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _537 = _511 * _533;
    float _539 = -_511;
    float _541 = _539 + 1.0;
    float _543 = 1.0 / _499;
    float _545 = _515 * _529;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _551 = fma(_545, _479, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _553 = _549 * _543;
    float _555 = _551 * _537;
    float _557 = -_527;
    float _559 = _557 + 1.0;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _563 = _475 + _561;
    float _565 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[115].x, _555);
    float _567 = _495 * _559;
    float _569 = fma(_553, _563, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _573 = fma(_569, _567, _565);
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _579 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[117].x, _573);
    float _581 = _571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _583 = _575 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _585 = _577 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _587 = _579 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_74.x = _581;
    out.m_74.y = _583;
    out.m_74.z = _585;
    out.m_74.w = _587;
    bool _589 = !_535;
    float _607;
    if (!_589)
    {
        float _591 = in.m_70.x;
        float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _595 = _591 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _597 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[11].w, _139);
        float _599 = _597 * _593;
        float _601 = floor(_599);
        float _603 = -_601;
        float _605 = _599 + _603;
        _607 = _605;
        _609 = true;
    }
    else
    {
        _607 = _183;
    }
    _609 = false;
    float _611 = _607;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _615 = _611 + _613;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _619 = _617 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _625 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _627 = isnan(_611);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _641 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _643 = isnan(_611);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = 1.0 / _619;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _655;
    float _659 = -_635;
    float _661 = _659 + 1.0;
    bool _663 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _665 = isnan(_611);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    bool _675 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _677 = 1.0 / _623;
    float _679 = 1.0 / _639;
    float _681 = _657 * _653;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _685 = _683 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _687 = _651 * _661;
    float _689 = -_651;
    float _691 = _689 + 1.0;
    float _693 = fma(_681, _615, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _695;
    float _699 = _673 * _691;
    float _701 = _685 * _677;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _705 = _611 + _703;
    bool _707 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _709 = isnan(_611);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _715 = _711 || _713;
    float _717 = float(_715);
    float _719 = _693 * _699;
    float _721 = -_673;
    float _723 = _721 + 1.0;
    float _725 = fma(_701, _705, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _729 = _611 + _727;
    float _731 = _697 * _679;
    float _733 = -_717;
    float _735 = _733 + 1.0;
    float _737 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[131].x, _719);
    float _739 = fma(_731, _729, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _741 = _635 * _735;
    float _743 = fma(_725, _687, _737);
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _747 = fma(_739, _741, _743);
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _751 = _745 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _755 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[134].x, _747);
    float _757 = _749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _759 = _753 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = _755 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_76.x = _751;
    out.m_76.y = _757;
    out.m_76.z = _759;
    out.m_76.w = _761;
    bool _763 = !_675;
    float _765 = _757;
    if (!_763)
    {
        float _767 = in.m_70.x;
        float _769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _771 = _767 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[14].x, _139);
        float _775 = _773 * _769;
        float _777 = floor(_775);
        float _779 = -_777;
        float _781 = _775 + _779;
        _185 = _781;
    }
    float _783 = _185;
    float _785 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _787 = int(_785);
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _791 = _789 != 0;
    float _793 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _795 = int(_793);
    float _797 = float(_787);
    float _799 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _801 = int(_799);
    if (_791)
    {
        _453 = 1.0;
    }
    float _803 = _453;
    float _805 = _803;
    if (_791)
    {
        _765 = 1.0;
    }
    float _807 = _765;
    int _809 = 0;
    float _811 = _807;
    if (_791)
    {
        _809 = 0;
    }
    int _813 = _809;
    float _815 = float(_795);
    float _817 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _819 = int(_817);
    float _821 = 1.0 / _797;
    float _823 = float(uint(_801));
    int _825 = ~_801;
    int _827 = _825 + 1;
    float _829 = 1.0 / _815;
    float _831 = float(uint(_819));
    float _833 = _821 * _139;
    float _835 = 1.0 / _823;
    float _837 = _821;
    float _839 = _815;
    int _841 = _813;
    if (_791)
    {
        float _843 = in.m_70.x;
        float _845 = in.m_70.y;
        _837 = _843;
        _839 = _845;
    }
    float _847 = _837;
    float _849 = _839;
    float _851 = _829 * _139;
    float _853 = 1.0 / _831;
    float _855 = trunc(_833);
    int _857 = int(_855);
    int _859 = as_type<int>(_835) + (-2);
    float _861 = trunc(_851);
    int _863 = int(_861);
    int _865 = as_type<int>(_853) + (-2);
    float _867 = 0.0;
    float _869 = _847;
    float _871 = _849;
    if (_791)
    {
        _867 = _849;
    }
    float _873 = _867;
    float _875 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _877 = int(_875);
    float _879 = float(uint(_857));
    float _881 = as_type<float>(_859) * _879;
    int _883 = as_type<int>(_879);
    float _885 = _873;
    if (_791)
    {
        _883 = 0;
    }
    int _887 = _883;
    float _889 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _891 = int(_889);
    float _893 = float(uint(_863));
    float _895 = as_type<float>(_865) * _893;
    float _897 = _893;
    int _899 = _887;
    if (_791)
    {
        _897 = _847;
    }
    float _901 = _897;
    float _903 = trunc(_881);
    float _905 = precise::max(_903, 0.0);
    uint _908 = uint(_905);
    float _910 = float(uint(_877));
    float _912 = 0.0;
    float _914 = _901;
    if (_791)
    {
        _912 = _901;
    }
    float _916 = _912;
    float _918 = 1.0 / _910;
    float _920 = float(_891);
    float _922 = trunc(_895);
    float _924 = precise::max(_922, 0.0);
    uint _926 = uint(_924);
    float _928 = 1.0 / _920;
    float _930 = _920;
    float _932 = _916;
    if (_791)
    {
        _930 = _901;
    }
    float _934 = _930;
    float _936 = _934;
    if (!_791)
    {
        float _938 = in.m_70.x;
        float _940 = in.m_70.y;
        float _942 = in.m_70.z;
        float _944 = _938 * 3.1415927410125732421875;
        float _946 = _944 * 0.15915493667125701904296875;
        float _948 = _940 * 3.1415927410125732421875;
        float _950 = _948 * 0.15915493667125701904296875;
        float _952 = _946 * 6.283185482025146484375;
        float _954 = sin(_952);
        float _956 = _950 * 6.283185482025146484375;
        float _958 = sin(_956);
        _805 = 7.345489978790283203125;
        _869 = _938;
        _914 = _940;
        _811 = 5.839270114898681640625;
        _936 = _942;
        _871 = _940;
        _885 = _958;
        _899 = 1;
        _841 = 2;
        _932 = _954;
    }
    float _960 = _805;
    float _962 = _869;
    float _964 = _914;
    float _966 = _811;
    float _968 = _936;
    float _970 = _871;
    float _972 = _885;
    int _974 = _899;
    int _976 = _841;
    float _978 = _932;
    int _980 = _827 * int(_908);
    int _982 = _980 + _857;
    float _984 = in.m_70.z;
    float _986 = in.m_70.w;
    float _988 = _960 * _962;
    int _990 = ~_819;
    int _992 = _990 + 1;
    float _994 = _960 * _964;
    float _996 = float(uint(_982));
    float _998 = _928 * _139;
    float _1000 = floor(_988);
    int _1002 = _992 * int(_926);
    int _1004 = _1002 + _863;
    float _1006 = _966 * _968;
    float _1008 = as_type<float>(_859) * _996;
    float _1010 = float(_801);
    float _1012 = in.m_78.y;
    float _1014 = float(uint(_1004));
    float _1016 = _447 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1018 = trunc(_998);
    int _1020 = int(_1018);
    float _1022 = float(_857);
    float _1024 = as_type<float>(_865) * _1014;
    int _1026 = as_type<int>(_918) + (-2);
    bool _1028 = _970 > 0.5;
    float _1030 = trunc(_1008);
    float _1032 = precise::max(_1030, 0.0);
    uint _1034 = uint(_1032);
    bool _1036 = _1022 >= _1010;
    bool _1038 = isnan(_1022);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan(_1010);
    bool _1044 = _1040 || _1042;
    float _1046 = float(_1044);
    bool _1048 = _986 > 0.5;
    float _1050 = -_1000;
    float _1052 = _988 + _1050;
    bool _1054 = _984 > 0.5;
    float _1056 = floor(_1006);
    float _1058 = float(uint(_1020));
    int _1060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1062 = _1060 != 0;
    int _1064 = ~_819;
    int _1066 = _1064 + 1;
    float _1068 = as_type<float>(_1026) * _1058;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1072 = _1070 != 0;
    int _1074 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1076 = _1074 != 0;
    int _1078 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1080 = _1078 != 0;
    float _1082 = trunc(_1024);
    float _1084 = precise::max(_1082, 0.0);
    uint _1086 = uint(_1084);
    float _1088 = -_229;
    int _1090 = _1054 ? as_type<int>(_1088) : as_type<int>(_229);
    int _1092 = int(_908) + int(_1034);
    int _1094 = ~_801;
    int _1096 = _1094 + 1;
    int _1098 = int(_1048);
    int _1100 = _1054 ? 2 : 0;
    int _1102 = _1098 | _1100;
    int _1104 = _1062 ? 4 : 0;
    int _1106 = _1102 | _1104;
    int _1108 = _1072 ? 8 : 0;
    int _1110 = _1106 | _1108;
    int _1112 = _1076 ? 16 : 0;
    int _1114 = _1110 | _1112;
    int _1116 = _1080 ? 32 : 0;
    int _1118 = _1114 | _1116;
    int _1120 = _1028 ? 64 : 0;
    int _1122 = _1118 | _1120;
    int _1124 = _1122 & 64;
    float _1126 = trunc(_1068);
    float _1128 = precise::max(_1126, 0.0);
    uint _1130 = uint(_1128);
    float _1132 = -_1056;
    float _1134 = _1006 + _1132;
    float _1136 = -_243;
    int _1138 = _1028 ? as_type<int>(_1136) : as_type<int>(_243);
    int _1140 = _1096 * _1092;
    int _1142 = _1140 + _857;
    bool _1144 = !_1076;
    float _1146 = _1144 ? _243 : as_type<float>(_1138);
    float _1148 = trunc(_1046);
    int _1150 = int(_1148);
    int _1152 = int(_926) + int(_1086);
    bool _1154 = !_1062;
    int _1156 = _1154 ? 0 : 1;
    int _1158 = ~_877;
    int _1160 = _1158 + 1;
    float _1162 = float(_819);
    float _1164 = floor(_994);
    bool _1166 = !_1080;
    float _1168 = _1166 ? _229 : as_type<float>(_1090);
    int _1170 = _1160 * int(_1130);
    int _1172 = _1170 + _1020;
    float _1174 = _1052 * _1010;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1178 = _1176 != 0;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1182 = _1180 != 0;
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1186 = _1184 != 0;
    float _1188 = _1134 * _1162;
    bool _1190 = uint(_1142) >= uint(_801);
    int _1192 = _1066 * _1152;
    int _1194 = _1192 + _863;
    float _1196 = float(_863);
    float _1198 = trunc(_1174);
    int _1200 = int(_1198);
    bool _1202 = !_1182;
    int _1204 = _1202 ? 0 : 1;
    bool _1206 = !_1178;
    int _1208 = _1206 ? 0 : 1;
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1212 = _1210 != 0;
    float _1214 = -_1164;
    float _1216 = _994 + _1214;
    bool _1218 = uint(_1194) >= uint(_819);
    float _1220 = trunc(_1188);
    int _1222 = int(_1220);
    bool _1224 = !_1190;
    int _1226 = _1224 ? 0 : (-1);
    bool _1228 = _1196 >= _1162;
    bool _1230 = isnan(_1196);
    bool _1232 = _1228 || _1230;
    bool _1234 = isnan(_1162);
    bool _1236 = _1232 || _1234;
    float _1238 = float(_1236);
    bool _1240 = !_1186;
    int _1242 = _1240 ? 0 : 1;
    bool _1244 = !_1212;
    int _1246 = _1244 ? 0 : 1;
    bool _1248 = !_1218;
    int _1250 = _1248 ? 0 : (-1);
    float _1252 = trunc(_1238);
    int _1254 = int(_1252);
    float _1256 = float(uint(_1172));
    int _1258 = abs(_1156);
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1262 = _1260 != 0;
    int _1264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1266 = _1264 != 0;
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1270 = _1268 != 0;
    float _1272 = as_type<float>(_1026) * _1256;
    int _1274 = ~_1092;
    int _1276 = _1274 + _1226;
    int _1278 = _1276 + 1;
    int _1280 = _1200 * _1258;
    int _1282 = _1280 + _857;
    int _1284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1286 = _1284 != 0;
    bool _1288 = !_1266;
    int _1290 = _1288 ? 0 : 1;
    int _1292 = _801 * _1278;
    int _1294 = _1292 + _857;
    bool _1296 = !_1286;
    int _1298 = _1296 ? 0 : 1;
    float _1300 = trunc(_1272);
    float _1302 = precise::max(_1300, 0.0);
    uint _1304 = uint(_1302);
    bool _1306 = _801 == 0;
    bool _1308 = _1124 != 0;
    int _1310 = abs(_1298);
    int _1312 = ~_1152;
    int _1314 = _1312 + _1250;
    int _1316 = _1314 + 1;
    bool _1318 = !_1306;
    int _1320 = _1318 ? _1294 : (-1);
    float _1322 = _179 * _139;
    bool _1324 = !_1262;
    int _1326 = _1324 ? 0 : 1;
    int _1328 = _819 * _1316;
    int _1330 = _1328 + _863;
    bool _1332 = _819 == 0;
    float _1334 = _1010 * _1322;
    int _1336 = ~_1150;
    int _1338 = _1336 + 1;
    int _1340 = _1338 + 1;
    float _1342 = _1162 * _1322;
    int _1344 = ~_1254;
    int _1346 = _1344 + 1;
    int _1348 = _1346 + 1;
    int _1350 = _1222 * _1310;
    int _1352 = _1350 + _863;
    bool _1354 = !_1332;
    int _1356 = _1354 ? _1330 : (-1);
    float _1358 = trunc(_1334);
    int _1360 = int(_1358);
    int _1362 = _1320 * _1340;
    int _1364 = _801 + (-1);
    int _1366 = abs(_1204);
    int _1368 = _1356 * _1348;
    int _1370 = _819 + (-1);
    int _1372 = _1150 * _1364;
    int _1374 = _1372 + _1362;
    int _1376 = abs(_1290);
    float _1378 = trunc(_1342);
    int _1380 = int(_1378);
    int _1382 = ~_877;
    int _1384 = _1382 + 1;
    int _1386 = _1254 * _1370;
    int _1388 = _1386 + _1368;
    int _1390 = _1374 * _1366;
    int _1392 = abs(_1208);
    int _1394 = abs(_1242);
    int _1396 = _1388 * _1376;
    int _1398 = abs(_1246);
    int _1400 = _1360 * _1392;
    int _1402 = _1400 + _1390;
    int _1404 = int(_1130) + int(_1304);
    int _1406 = _1282 * _1394;
    int _1408 = _1406 + _1402;
    int _1410 = abs(_1326);
    int _1412 = _1200 * _1398;
    int _1414 = _1412 + _1408;
    float _1416 = -_229;
    int _1418 = _1048 ? as_type<int>(_1416) : as_type<int>(_229);
    int _1420 = _1384 * _1404;
    int _1422 = _1420 + _1020;
    float _1424 = float(_877);
    int _1426 = _1380 * _1410;
    int _1428 = _1426 + _1396;
    bool _1430 = !_1270;
    int _1432 = _1430 ? 0 : 1;
    float _1434 = float(uint(_1414));
    float _1436 = _1424 * _1322;
    bool _1438 = uint(_1422) >= uint(_877);
    float _1440 = -_243;
    int _1442 = _1054 ? as_type<int>(_1440) : as_type<int>(_243);
    float _1444 = float(_1020);
    float _1446 = trunc(_1436);
    int _1448 = int(_1446);
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1452 = _1450 != 0;
    int _1454 = abs(_1432);
    float _1456 = as_type<float>(_859) * _1434;
    bool _1458 = _1444 >= _1424;
    bool _1460 = isnan(_1444);
    bool _1462 = _1458 || _1460;
    bool _1464 = isnan(_1424);
    bool _1466 = _1462 || _1464;
    float _1468 = float(_1466);
    bool _1470 = !_1452;
    int _1472 = _1470 ? 0 : 1;
    int _1474 = _1352 * _1454;
    int _1476 = _1474 + _1428;
    int _1478 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1480 = _1478 != 0;
    float _1482 = trunc(_1468);
    int _1484 = int(_1482);
    bool _1486 = !_1438;
    int _1488 = _1486 ? 0 : (-1);
    bool _1490 = !_1480;
    int _1492 = _1490 ? 0 : 1;
    int _1494 = ~_1404;
    int _1496 = _1494 + _1488;
    int _1498 = _1496 + 1;
    int _1500 = abs(_1492);
    float _1502 = trunc(_1456);
    float _1504 = precise::max(_1502, 0.0);
    uint _1506 = uint(_1504);
    int _1508 = abs(_1472);
    bool _1510 = !_1072;
    float _1512 = _1510 ? _229 : as_type<float>(_1418);
    float _1514 = _1216 * _1424;
    int _1516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1518 = _1516 != 0;
    int _1520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1522 = _1520 != 0;
    int _1524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1526 = _1524 != 0;
    int _1528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1530 = _1528 != 0;
    int _1532 = _1222 * _1508;
    int _1534 = _1532 + _1476;
    int _1536 = ~_801;
    int _1538 = _1536 + 1;
    int _1540 = _877 * _1498;
    int _1542 = _1540 + _1020;
    int _1544 = ~_1484;
    int _1546 = _1544 + 1;
    int _1548 = _1546 + 1;
    float _1550 = trunc(_1514);
    int _1552 = int(_1550);
    bool _1554 = !_1522;
    int _1556 = _1554 ? 0 : 1;
    int _1558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1560 = _1558 != 0;
    bool _1562 = !_1518;
    int _1564 = _1562 ? 0 : 1;
    int _1566 = _1538 * int(_1506);
    int _1568 = _1566 + _1414;
    bool _1570 = _877 == 0;
    float _1572 = float(uint(_1534));
    bool _1574 = !_1570;
    int _1576 = _1574 ? _1542 : (-1);
    float _1578 = float(uint(_1568));
    float _1580 = as_type<float>(_865) * _1572;
    int _1582 = abs(_1556);
    float _1584 = as_type<float>(_1404);
    if (_1560)
    {
        float _1586 = in.m_70.w;
        _1584 = _1586;
    }
    float _1588 = _1584;
    int _1590 = _1576 * _1548;
    int _1592 = _877 + (-1);
    float _1594 = as_type<float>(_859) * _1578;
    float _1596 = trunc(_1580);
    float _1598 = precise::max(_1596, 0.0);
    uint _1600 = uint(_1598);
    int _1602 = abs(_1564);
    int _1604 = _1484 * _1592;
    int _1606 = _1604 + _1590;
    int _1608 = ~_819;
    int _1610 = _1608 + 1;
    int _1612 = _1606 * _1582;
    float _1614 = trunc(_1594);
    float _1616 = precise::max(_1614, 0.0);
    uint _1618 = uint(_1616);
    bool _1620 = _801 == 0;
    int _1622 = _1448 * _1602;
    int _1624 = _1622 + _1612;
    int _1626 = _1552 * _1500;
    int _1628 = _1626 + _1020;
    bool _1630 = !_1526;
    int _1632 = _1630 ? 0 : 1;
    int _1634 = ~_801;
    int _1636 = _1634 + 1;
    int _1638 = _1610 * int(_1600);
    int _1640 = _1638 + _1534;
    int _1642 = abs(_1632);
    float _1644 = as_type<float>(_1500);
    if (_1560)
    {
        float _1646 = _1588 * 3.1415927410125732421875;
        _1644 = _1646;
    }
    float _1648 = _1644;
    int _1650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1652 = _1650 != 0;
    float _1654 = float(uint(_1640));
    float _1656 = _1648;
    if (_1560)
    {
        float _1658 = _1648 * 0.15915493667125701904296875;
        _1656 = _1658;
    }
    float _1660 = _1656;
    int _1662 = int(_1506) + int(_1618);
    bool _1664 = !_1530;
    int _1666 = _1664 ? 0 : 1;
    int _1668 = _1636 * _1662;
    int _1670 = _1668 + _1414;
    float _1672 = as_type<float>(_865) * _1654;
    int _1674 = abs(_1666);
    float _1676 = _1660;
    if (_1560)
    {
        float _1678 = _1660 * 6.283185482025146484375;
        float _1680 = sin(_1678);
        _1676 = _1680;
    }
    float _1682 = _1676;
    bool _1684 = uint(_1670) >= uint(_801);
    int _1686 = _1628 * _1642;
    int _1688 = _1686 + _1624;
    float _1690 = as_type<float>(_1500);
    if (_1652)
    {
        float _1692 = in.m_70.x;
        _1690 = _1692;
    }
    float _1694 = _1690;
    float _1696 = float(uint(_1282));
    float _1698 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    bool _1700 = !_1684;
    int _1702 = _1700 ? 0 : (-1);
    float _1704 = trunc(_1672);
    float _1706 = precise::max(_1704, 0.0);
    uint _1708 = uint(_1706);
    int _1710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1712 = _1710 != 0;
    float _1714 = as_type<float>(_859) * _1696;
    int _1716 = _1552 * _1674;
    int _1718 = _1716 + _1688;
    int _1720 = ~_1662;
    int _1722 = _1720 + _1702;
    int _1724 = _1722 + 1;
    float _1726 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1698);
    bool _1728 = !_1712;
    float _1730 = _1728 ? _243 : as_type<float>(_1442);
    float _1732 = _972 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1734 = trunc(_1714);
    float _1736 = precise::max(_1734, 0.0);
    uint _1738 = uint(_1736);
    float _1740 = float(uint(_1718));
    int _1742 = _801 * _1724;
    int _1744 = _1742 + _1414;
    bool _1746 = _1712;
    float _1748 = _1740;
    if (_1560)
    {
        bool _1750 = _1682 > 0.5;
        _1746 = _1750;
    }
    bool _1752 = _1746;
    int _1754 = ~_801;
    int _1756 = _1754 + 1;
    float _1758 = as_type<float>(_1026) * _1740;
    bool _1760 = !_1620;
    int _1762 = _1760 ? _1744 : (-1);
    int _1764 = int(_1600) + int(_1708);
    float _1766 = trunc(_1758);
    float _1768 = precise::max(_1766, 0.0);
    uint _1770 = uint(_1768);
    float _1772 = as_type<float>(_1708);
    if (!_1560)
    {
        _1772 = _243;
    }
    float _1774 = _1772;
    float _1776 = _1774;
    if (_1652)
    {
        float _1778 = _1694 * 3.1415927410125732421875;
        _1748 = _1778;
    }
    float _1780 = _1748;
    float _1782 = _1780;
    if (_1560)
    {
        float _1784 = -_243;
        float _1786 = _1752 ? _1784 : _243;
        _1776 = _1786;
    }
    float _1788 = _1776;
    float _1790 = float(uint(_1352));
    int _1792 = _1756 * int(_1738);
    int _1794 = _1792 + _1282;
    int _1796 = _1762 & 3;
    bool _1798 = _1796 != 0;
    if (_1652)
    {
        float _1800 = _1780 * 0.15915493667125701904296875;
        _1782 = _1800;
    }
    float _1802 = _1782;
    int _1804 = _1762 & 3;
    bool _1806 = _1804 != 0;
    float _1808 = as_type<float>(_865) * _1790;
    int _1810 = _1798 ? 0 : 1;
    bool _1812 = uint(_1804) > 1u;
    float _1814 = _1802;
    if (_1652)
    {
        float _1816 = _1802 * 6.283185482025146484375;
        float _1818 = sin(_1816);
        _1814 = _1818;
    }
    float _1820 = _1814;
    float _1822 = float(uint(_1794));
    int _1824 = ~_819;
    int _1826 = _1824 + 1;
    int _1828 = ~_877;
    int _1830 = _1828 + 1;
    float _1832 = as_type<float>(_859) * _1822;
    int _1834 = ~_1810;
    int _1836 = _1834 + 1;
    int _1838 = _1836 + 1;
    float _1840 = trunc(_1808);
    float _1842 = precise::max(_1840, 0.0);
    uint _1844 = uint(_1842);
    int _1846 = _1826 * _1764;
    int _1848 = _1846 + _1534;
    float _1850 = -_229;
    int _1852 = _1308 ? as_type<int>(_1850) : as_type<int>(_229);
    int _1854 = _1830 * int(_1770);
    int _1856 = _1854 + _1718;
    bool _1858 = uint(_1804) >= 2u;
    int _1860 = _1838;
    if (!_1812)
    {
        int _1862 = ~_1810;
        int _1864 = _1862 + 1;
        _1860 = _1864;
    }
    int _1866 = _1860;
    bool _1868 = uint(_1848) >= uint(_819);
    float _1870 = trunc(_1832);
    float _1872 = precise::max(_1870, 0.0);
    uint _1874 = uint(_1872);
    float _1876 = float(uint(_1856));
    int _1878 = ~_819;
    int _1880 = _1878 + 1;
    int _1882 = _1858 ? 0 : 1;
    float _1884 = as_type<float>(_1026) * _1876;
    bool _1886 = _1804 != 3;
    int _1888 = _1880 * int(_1844);
    int _1890 = _1888 + _1352;
    bool _1892 = !_1868;
    int _1894 = _1892 ? 0 : (-1);
    float _1896 = trunc(_1884);
    float _1898 = precise::max(_1896, 0.0);
    uint _1900 = uint(_1898);
    int _1902 = ~_1882;
    int _1904 = _1902 + 1;
    int _1906 = _1904 + 1;
    int _1908 = ~_1764;
    int _1910 = _1908 + _1894;
    int _1912 = _1910 + 1;
    float _1914 = float(uint(_1890));
    int _1916 = _819 * _1912;
    int _1918 = _1916 + _1534;
    float _1920 = _1884;
    int _1922 = _1906;
    bool _1924 = _1886;
    if (!_1652)
    {
        _1920 = _229;
    }
    float _1926 = _1920;
    float _1928 = as_type<float>(_865) * _1914;
    float _1930 = _1926;
    if (_1886)
    {
        int _1932 = ~_1882;
        int _1934 = _1932 + 1;
        _1922 = _1934;
    }
    int _1936 = _1922;
    if (_1652)
    {
        bool _1938 = _1820 > 0.5;
        _1924 = _1938;
    }
    bool _1940 = _1924;
    bool _1942 = !_1332;
    int _1944 = _1942 ? _1918 : (-1);
    int _1946 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1948 = _1946 != 0;
    float _1950 = trunc(_1928);
    float _1952 = precise::max(_1950, 0.0);
    uint _1954 = uint(_1952);
    if (_1652)
    {
        float _1956 = -_229;
        float _1958 = _1940 ? _1956 : _229;
        _1930 = _1958;
    }
    float _1960 = _1930;
    int _1962 = _1944 & 3;
    bool _1964 = _1962 != 0;
    bool _1966 = !_1948;
    float _1968 = _1966 ? _229 : as_type<float>(_1852);
    int _1970 = int(_1770) + int(_1900);
    bool _1972 = uint(_1962) > 1u;
    int _1974 = ~_877;
    int _1976 = _1974 + 1;
    int _1978 = _1944 & 3;
    bool _1980 = _1978 != 0;
    int _1982 = int(_1738) + int(_1874);
    int _1984 = _1976 * _1970;
    int _1986 = _1984 + _1718;
    int _1988 = ~_801;
    int _1990 = _1988 + 1;
    int _1992 = _1980 ? 0 : 1;
    int _1994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1996 = _1994 != 0;
    int _1998 = _1990 * _1982;
    int _2000 = _1998 + _1282;
    float _2002 = float(uint(_1628));
    bool _2004 = !_1996;
    int _2006 = _2004 ? 0 : 1;
    bool _2008 = uint(_1986) >= uint(_877);
    float _2010 = as_type<float>(_1026) * _2002;
    int _2012 = ~_1992;
    int _2014 = _2012 + 1;
    int _2016 = _2014 + 1;
    int _2018 = _2016;
    if (!_1972)
    {
        int _2020 = ~_1992;
        int _2022 = _2020 + 1;
        _2018 = _2022;
    }
    int _2024 = _2018;
    float _2026 = trunc(_2010);
    float _2028 = precise::max(_2026, 0.0);
    uint _2030 = uint(_2028);
    bool _2032 = uint(_2000) >= uint(_801);
    bool _2034 = !_2008;
    int _2036 = _2034 ? 0 : (-1);
    bool _2038 = _1962 != 3;
    bool _2040 = !_2032;
    int _2042 = _2040 ? 0 : (-1);
    bool _2044 = uint(_1962) >= 2u;
    int _2046 = ~_1970;
    int _2048 = _2046 + _2036;
    int _2050 = _2048 + 1;
    int _2052 = ~_819;
    int _2054 = _2052 + 1;
    int _2056 = int(_1844) + int(_1954);
    int _2058 = _877 * _2050;
    int _2060 = _2058 + _1718;
    int _2062 = _2044 ? 0 : 1;
    int _2064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2066 = _2064 != 0;
    int _2068 = _2054 * _2056;
    int _2070 = _2068 + _1352;
    int _2072 = ~_877;
    int _2074 = _2072 + 1;
    int _2076 = ~_2062;
    int _2078 = _2076 + 1;
    int _2080 = _2078 + 1;
    int _2082 = _2080;
    if (_2038)
    {
        int _2084 = ~_2062;
        int _2086 = _2084 + 1;
        _2082 = _2086;
    }
    int _2088 = _2082;
    int _2090 = _2074 * int(_2030);
    int _2092 = _2090 + _1628;
    int _2094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2096 = _2094 != 0;
    bool _2098 = !_2066;
    int _2100 = _2098 ? 0 : 1;
    bool _2102 = uint(_2070) >= uint(_819);
    bool _2104 = !_1570;
    int _2106 = _2104 ? _2060 : (-1);
    bool _2108 = !_2096;
    int _2110 = _2108 ? 0 : 1;
    bool _2112 = !_2102;
    int _2114 = _2112 ? 0 : (-1);
    int _2116 = _2106 & 3;
    bool _2118 = _2116 != 0;
    int _2120 = _2106 & 3;
    bool _2122 = _2120 != 0;
    float _2124 = float(uint(_2092));
    int _2126 = _2118 ? 0 : 1;
    bool _2128 = uint(_2120) > 1u;
    float _2130 = as_type<float>(_1026) * _2124;
    int _2132 = ~_2126;
    int _2134 = _2132 + 1;
    int _2136 = _2134 + 1;
    float _2138 = trunc(_2130);
    float _2140 = precise::max(_2138, 0.0);
    uint _2142 = uint(_2140);
    float _2144 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2146 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2148 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2150 = _2136;
    if (!_2128)
    {
        int _2152 = ~_2126;
        int _2154 = _2152 + 1;
        _2150 = _2154;
    }
    int _2156 = _2150;
    float _2158 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2160 = uint(_2120) >= 2u;
    int _2162 = ~_877;
    int _2164 = _2162 + 1;
    int _2166 = _2160 ? 0 : 1;
    bool _2168 = _2120 != 3;
    int _2170 = int(_2030) + int(_2142);
    int _2172 = ~_2166;
    int _2174 = _2172 + 1;
    int _2176 = _2174 + 1;
    int _2178 = _2164 * _2170;
    int _2180 = _2178 + _1628;
    int _2182 = ~_2056;
    int _2184 = _2182 + _2114;
    int _2186 = _2184 + 1;
    int _2188 = abs(_2024);
    float _2190 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2192 = _2176;
    float _2194 = as_type<float>(_2180);
    if (_2168)
    {
        int _2196 = ~_2166;
        int _2198 = _2196 + 1;
        _2192 = _2198;
    }
    int _2200 = _2192;
    int _2202 = _819 * _2186;
    int _2204 = _2202 + _1352;
    bool _2206 = uint(_2180) >= uint(_877);
    float _2208 = _984 * 2.0;
    bool _2210 = !_2206;
    int _2212 = _2210 ? 0 : (-1);
    bool _2214 = _962 > 0.5;
    bool _2216 = !_1332;
    int _2218 = _2216 ? _2204 : (-1);
    float _2220 = -_243;
    int _2222 = _2214 ? as_type<int>(_2220) : as_type<int>(_243);
    bool _2224 = _974 != 1;
    float _2226 = in.m_50.x;
    float _2228 = in.m_50.y;
    float _2230 = in.m_50.z;
    int _2232 = ~_2170;
    int _2234 = _2232 + _2212;
    int _2236 = _2234 + 1;
    int _2238 = ~_1982;
    int _2240 = _2238 + _2042;
    int _2242 = _2240 + 1;
    int _2244 = abs(_2156);
    int _2246 = _877 * _2236;
    int _2248 = _2246 + _1628;
    int _2250 = abs(_1866);
    int _2252 = _801 * _2242;
    int _2254 = _2252 + _1282;
    int _2256 = ~_2244;
    int _2258 = _2256 + 1;
    int _2260 = _2258 + 1;
    float _2262 = 0.0;
    if (!_2224)
    {
        _2262 = _970;
    }
    float _2264 = _2262;
    float _2266 = 0.0;
    float _2268 = _2264;
    if (!_2224)
    {
        _2266 = _970;
    }
    float _2270 = _2266;
    float _2272 = 0.0;
    float _2274 = _2270;
    if (!_2224)
    {
        _2272 = _984;
    }
    float _2276 = _2272;
    float _2278 = 0.0;
    float _2280 = _2276;
    if (!_2224)
    {
        _2278 = _984;
    }
    float _2282 = _2278;
    float _2284 = _2282;
    if (_2224)
    {
        _2268 = _962;
    }
    float _2286 = _2268;
    if (_2224)
    {
        _2274 = _962;
    }
    float _2288 = _2274;
    if (_2224)
    {
        _2280 = _970;
    }
    float _2290 = _2280;
    float _2292 = _201 * _2228;
    if (_2224)
    {
        _2284 = _970;
    }
    float _2294 = _2284;
    float _2296 = _207 * _2228;
    bool _2298 = _976 != 2;
    float _2300 = fma(_205, _2226, _2296);
    int _2302 = ~_2250;
    int _2304 = _2302 + 1;
    int _2306 = _2304 + 1;
    float _2308 = fma(_209, _2230, _2300);
    float _2310 = _970 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2312 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    int _2314 = abs(_2110);
    float _2316 = fma(_2310, -2.0, _2144);
    if (_2298)
    {
        _2194 = _962;
    }
    float _2318 = _2194;
    float _2320 = fma(_1732, -2.0, _2312);
    float _2322 = 0.0;
    float _2324 = _2318;
    if (_2298)
    {
        _2322 = _970;
    }
    float _2326 = _2322;
    float _2328 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2316);
    float _2330 = _2326;
    if (!_2298)
    {
        _2324 = _984;
    }
    float _2332 = _2324;
    float _2334 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2320);
    if (!_2298)
    {
        _2330 = _962;
    }
    float _2336 = _2330;
    int _2338 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2340 = _2338 != 0;
    float _2342 = _213 * _2228;
    float _2344 = fma(_199, _2226, _2292);
    float _2346 = _2228 + _1012;
    float _2348 = fma(_211, _2226, _2342);
    float _2350 = fma(_203, _2230, _2344);
    float _2352 = _962 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2354 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2356 = log2(_2354);
    float _2358 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2360 = _2336 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2362 = -_2358;
    float _2364 = fma(_2352, 2.0, _2362);
    float _2366 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2368 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2370 = !_2340;
    float _2372 = _2370 ? _243 : as_type<float>(_2222);
    float _2374 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2366);
    float _2376 = _978 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2378 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2380 = fma(_2288, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2368);
    float _2382 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2384 = _2356 * _139;
    float _2386 = -_2146;
    float _2388 = fma(_2376, 2.0, _2386);
    float _2390 = _2286 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2392 = _2332 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2394 = exp2(_2384);
    float _2396 = fma(_2294, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2378);
    float _2398 = -_2382;
    float _2400 = fma(_2390, 2.0, _2398);
    float _2402 = -_2148;
    float _2404 = fma(_2392, 2.0, _2402);
    float _2406 = _2290 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2408 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2410 = isnan(0.0);
    bool _2412 = _2408 || _2410;
    bool _2414 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2416 = _2412 || _2414;
    float _2418 = fma(_2360, -2.0, _2190);
    float _2420 = fma(_2406, -2.0, _2158);
    float _2422 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2374);
    float _2424 = -_139;
    float _2426 = fma(_2424, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2364);
    float _2428 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1726);
    float _2430 = -_139;
    float _2432 = fma(_2430, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2388);
    float _2434 = -_2394;
    float _2436 = _2434 + 1.0;
    float _2438 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2440 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2442 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2380);
    float _2444 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2396);
    float _2446 = _2416 ? _2436 : 0.0;
    float _2448 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2450 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _2452 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2454 = isnan(1.0);
    bool _2456 = _2452 || _2454;
    bool _2458 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2460 = _2456 || _2458;
    float _2462 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2464 = 1.0 + _2462;
    float _2466 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2438);
    float _2468 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2450);
    float _2470 = _962 * 2.0;
    float _2472 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2448);
    float _2474 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2440);
    float _2476 = 1.0 / _2464;
    float _2478 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2468);
    float _2480 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2472);
    float _2482 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2466);
    float _2484 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2474);
    float _2486 = -_139;
    float _2488 = fma(_2486, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2400);
    float _2490 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2420);
    float _2492 = -_139;
    float _2494 = fma(_2492, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2404);
    float _2496 = floor(_2470);
    float _2498 = fma(_215, _2230, _2348);
    float _2500 = _970 * 2.0;
    float _2502 = _1960 + (-0.5);
    float _2504 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2506 = _2504 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2508 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2418);
    if (_2460)
    {
        float _2510 = _2446 * _2476;
        _149 = _2510;
    }
    float _2512 = _149;
    float _2514 = floor(_2500);
    float _2516 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2518 = _2516 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2520 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2522 = _2520 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2524 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2526 = _2524 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2528 = -_2502;
    float _2530 = -_2334;
    float _2532 = fma(_2528, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2530);
    bool _2534 = _2496 >= 0.0;
    bool _2536 = isnan(_2496);
    bool _2538 = _2534 || _2536;
    bool _2540 = isnan(0.0);
    bool _2542 = _2538 || _2540;
    float _2544 = -_2422;
    float _2546 = _2544 + 1.0;
    float _2548 = 1.0 / _2506;
    float _2550 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2552 = _2550 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2554 = _2542 ? 0 : 1;
    float _2556 = -_2428;
    float _2558 = _2556 + 1.0;
    bool _2560 = _2496 > 0.0;
    float _2562 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2564 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2562;
    int _2566 = ~_2554;
    int _2568 = _2566 + 1;
    int _2570 = _2568 + 1;
    float _2572 = 1.0 / _2518;
    float _2574 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2576 = _2574 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2578 = -_2444;
    float _2580 = _2578 + 1.0;
    float _2582 = -_2478;
    float _2584 = _2582 + 1.0;
    bool _2586 = _2514 >= 0.0;
    bool _2588 = isnan(_2514);
    bool _2590 = _2586 || _2588;
    bool _2592 = isnan(0.0);
    bool _2594 = _2590 || _2592;
    float _2596 = 1.0 / _2522;
    float _2598 = _2564 * _2548;
    int _2600 = _2570;
    if (!_2560)
    {
        int _2602 = ~_2554;
        int _2604 = _2602 + 1;
        _2600 = _2604;
    }
    int _2606 = _2600;
    float _2608 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2610 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2608;
    bool _2612 = _2514 > 0.0;
    float _2614 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2616 = _2614 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2618 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2620 = _2618 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2622 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2624 = _2622 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2626 = floor(_2208);
    int _2628 = _2594 ? 0 : 1;
    float _2630 = _2610 * _2572;
    bool _2632 = !_1964;
    int _2634 = _2632 ? 0 : 1;
    float _2636 = -_2484;
    float _2638 = _2636 + 1.0;
    int _2640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2642 = _2640 != 0;
    int _2644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2646 = _2644 != 0;
    int _2648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2650 = _2648 != 0;
    bool _2652 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2654 = isnan(_783);
    bool _2656 = _2652 || _2654;
    bool _2658 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2660 = _2656 || _2658;
    float _2662 = float(_2660);
    float _2664 = 1.0 / _2526;
    float _2666 = _2624 * _2596;
    int _2668 = ~_2628;
    int _2670 = _2668 + 1;
    int _2672 = _2670 + 1;
    bool _2674 = !_1806;
    int _2676 = _2674 ? 0 : 1;
    float _2678 = -_2662;
    float _2680 = _2678 + 1.0;
    int _2682 = _2672;
    if (!_2612)
    {
        int _2684 = ~_2628;
        int _2686 = _2684 + 1;
        _2682 = _2686;
    }
    int _2688 = _2682;
    float _2690 = 1.0 / _2552;
    bool _2692 = _2626 > 0.0;
    bool _2694 = _2626 >= 0.0;
    bool _2696 = isnan(_2626);
    bool _2698 = _2694 || _2696;
    bool _2700 = isnan(0.0);
    bool _2702 = _2698 || _2700;
    float _2704 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2706 = _783 + _2704;
    bool _2708 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2710 = isnan(_783);
    bool _2712 = _2708 || _2710;
    bool _2714 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2716 = _2712 || _2714;
    float _2718 = float(_2716);
    float _2720 = 1.0 / _2620;
    float _2722 = _2576 * _2664;
    float _2724 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2726 = _2724 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _2728 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2730 = isnan(_783);
    bool _2732 = _2728 || _2730;
    bool _2734 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2736 = _2732 || _2734;
    float _2738 = float(_2736);
    float _2740 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2742 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2740;
    float _2744 = _2718 * _2680;
    bool _2746 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2748 = isnan(_783);
    bool _2750 = _2746 || _2748;
    bool _2752 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2754 = _2750 || _2752;
    float _2756 = float(_2754);
    float _2758 = 1.0 / _2616;
    float _2760 = fma(_2722, _2706, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2762 = _2726 * _2690;
    float _2764 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2766 = _783 + _2764;
    float _2768 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2770 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2768;
    float _2772 = -_2718;
    float _2774 = _2772 + 1.0;
    bool _2776 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2778 = isnan(_783);
    bool _2780 = _2776 || _2778;
    bool _2782 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2784 = _2780 || _2782;
    float _2786 = float(_2784);
    float _2788 = fma(_2630, _2766, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2790 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2792 = _783 + _2790;
    float _2794 = _2742 * _2720;
    float _2796 = _2738 * _2774;
    float _2798 = -_2738;
    float _2800 = _2798 + 1.0;
    float _2802 = in.m_64.w;
    float _2804 = fma(_2762, _2792, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2806 = -_2786;
    float _2808 = _2806 + 1.0;
    float _2810 = _2786 * _2800;
    float _2812 = _2770 * _2758;
    float _2814 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2816 = _783 + _2814;
    float _2818 = in.m_68.w;
    float _2820 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2822 = _783 + _2820;
    int _2824 = _1944 >> 31;
    float _2826 = fma(_2598, _2816, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2828 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2830 = isnan(_783);
    bool _2832 = _2828 || _2830;
    bool _2834 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2836 = _2832 || _2834;
    float _2838 = float(_2836);
    float _2840 = fma(_2812, _2822, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _2842 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2844 = isnan(_783);
    bool _2846 = _2842 || _2844;
    bool _2848 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2850 = _2846 || _2848;
    float _2852 = float(_2850);
    float _2854 = -_2756;
    float _2856 = _2854 + 1.0;
    int _2858 = _2824 & 3;
    float _2860 = _2838 * _2808;
    bool _2862 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2864 = isnan(_783);
    bool _2866 = _2862 || _2864;
    bool _2868 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2870 = _2866 || _2868;
    float _2872 = float(_2870);
    float _2874 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2876 = _783 + _2874;
    float _2878 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2880 = _783 + _2878;
    float _2882 = -_2838;
    float _2884 = _2882 + 1.0;
    float _2886 = _2852 * _2856;
    int _2888 = _1944 + _2858;
    float _2890 = fma(_2794, _2880, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2892 = _2872 * _2884;
    float _2894 = -_2872;
    float _2896 = _2894 + 1.0;
    float _2898 = _2826 * _2886;
    float _2900 = in.m_66.w;
    int _2902 = _2888 >> 2;
    float _2904 = -_2852;
    float _2906 = _2904 + 1.0;
    float _2908 = _2350 + _2802;
    float _2910 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2912 = _2346 + _2910;
    int _2914 = _2902 << 4;
    int _2916 = _2914 + 656;
    float _2918 = _2756 * _2896;
    float _2920 = fma(_2906, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2898);
    float _2922 = fma(_2666, _2876, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2924 = _2498 + _2818;
    float _2926 = _2912 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2928 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2930 = _2908 + _2928;
    uint _2932 = uint(int(uint(_2916) >> uint(2)));
    uint _2934 = uint(int(uint(int(_2932)) >> uint(2)));
    int _2936 = int(_2932) & 3;
    float _2938 = (*spvDescriptorSet0.vp_c9)._m0[int(_2934)][_2936];
    int _2940 = int(_2932) + 1;
    uint _2942 = uint(int(uint(_2940) >> uint(2)));
    int _2944 = _2940 & 3;
    float _2946 = (*spvDescriptorSet0.vp_c9)._m0[int(_2942)][_2944];
    float _2948 = fma(_2760, _2918, _2920);
    float _2950 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2952 = _2924 + _2950;
    float _2954 = fma(_2930, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2926);
    int _2956 = _2702 ? 0 : 1;
    float _2958 = fma(_2788, _2892, _2948);
    bool _2960 = _1962 != 3;
    float _2962 = fma(_2952, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2954);
    int _2964 = ~_2956;
    int _2966 = _2964 + 1;
    int _2968 = _2966 + 1;
    float _2970 = fma(_2804, _2860, _2958);
    int _2972 = _2968;
    float _2974 = _2810;
    if (!_2692)
    {
        int _2976 = ~_2956;
        int _2978 = _2976 + 1;
        _2972 = _2978;
    }
    int _2980 = _2972;
    float _2982 = _970 + _962;
    int _2984 = _2916 + 8;
    uint _2986 = uint(int(uint(_2984) >> uint(2)));
    uint _2988 = uint(int(uint(int(_2986)) >> uint(2)));
    int _2990 = int(_2986) & 3;
    float _2992 = (*spvDescriptorSet0.vp_c9)._m0[int(_2988)][_2990];
    int _2994 = int(_2986) + 1;
    uint _2996 = uint(int(uint(_2994) >> uint(2)));
    int _2998 = _2994 & 3;
    float _3000 = (*spvDescriptorSet0.vp_c9)._m0[int(_2996)][_2998];
    bool _3002 = _2962 >= 0.0;
    float _3004 = _2308 + _2900;
    float _3006 = _2982 + (-1.0);
    float _3008 = fma(_2840, _2810, _2970);
    float _3010 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3012 = _3004 + _3010;
    float _3014 = _962 + _984;
    float _3016 = fma(_3006, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3018 = _2930 * _2930;
    float _3020 = _962 + (-0.5);
    float _3022 = _970 + _984;
    float _3024 = _970 + (-0.5);
    float _3026 = fma(_3012, _3012, _3018);
    if (_3002)
    {
        _2974 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3028 = _2974;
    float _3030 = _1788 + 0.5;
    float _3032 = fma(_2952, _2952, _3026);
    float _3034 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3036 = int(_3034);
    int _3038 = as_type<int>(_3028);
    if (_3002)
    {
        float _3040 = _3028 * 5.0;
        _3038 = as_type<int>(_3040);
    }
    int _3042 = _3038;
    float _3044 = fma(_3030, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2432);
    int _3046 = abs(_2634);
    float _3048 = _2372 + 0.5;
    if (_3002)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9667 = as_type<float>(_3042);
        out.gl_Position.z = _9667;
    }
    float _3050 = _1968 + (-0.5);
    float _3052 = sqrt(_3032);
    int _3054 = ~_2188;
    int _3056 = _3054 + 1;
    int _3058 = _3056 + 1;
    float _3060 = fma(_3048, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2426);
    bool _3062 = !_2960;
    int _3064 = _3062 ? 0 : (-1);
    float _3066 = -_3050;
    float _3068 = -_2328;
    float _3070 = fma(_3066, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3068);
    int _3072 = abs(_2088);
    float _3074 = fma(_2922, _2796, _3008);
    int _3076 = abs(_3064);
    float _3078 = rsqrt(_3032);
    bool _3080 = !_2642;
    int _3082 = _3080 ? 0 : 1;
    int _3084 = _3058 * as_type<int>(_2946);
    float _3086 = _1016 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _3088 = float(uint(_3036));
    float _3090 = fma(_2890, _2744, _3074);
    int _3092 = ~_3046;
    int _3094 = _3092 + 1;
    int _3096 = _3094 + 1;
    float _3098 = _3052 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _3100 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3102 = ~_3072;
    int _3104 = _3102 + 1;
    int _3106 = _3104 + 1;
    float _3108 = fma(_2662, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3090);
    int _3110 = _3096 * as_type<int>(_2938);
    int _3112 = _3110 + _3084;
    float _3114 = precise::min(_3086, _3098);
    float _3116 = fma(_2912, _2912, _3018);
    int _3118 = _3106 * as_type<int>(_2992);
    int _3120 = _3118 + _3112;
    int _3122 = abs(_2100);
    float _3124 = 1.0 / _3088;
    int _3126 = ~_3076;
    int _3128 = _3126 + 1;
    int _3130 = _3128 + 1;
    out.m_80.w = _3114;
    int _3132 = ~_3122;
    int _3134 = _3132 + 1;
    int _3136 = _3134 + 1;
    float _3138 = fma(_2952, _2952, _3116);
    int _3140 = abs(_3036);
    int _3142 = _3130 * as_type<int>(_3000);
    int _3144 = _3142 + _3120;
    float _3146 = -_2546;
    float _3148 = fma(_3146, _1788, _3044);
    float _3150 = _3100 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3152 = _1730 + 0.5;
    int _3154 = _3144 * _3136;
    float _3156 = fma(_2558, _1960, _2532);
    float _3158 = _3078 * _3114;
    float _3160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3162 = _2218 * _3122;
    int _3164 = _3162 + _3154;
    float _3166 = float(uint(_3140));
    float _3168 = fma(_3150, _3152, _2488);
    int _3170 = as_type<int>(_3124) + (-2);
    out.m_82.x = _3148;
    out.m_82.y = _3156;
    float _3172 = float(uint(_3164));
    float _3174 = _3012 * _3158;
    float _3176 = 1.0 / _3166;
    int _3178 = _2106 >> 31;
    float _3180 = _2930 * _3158;
    float _3182 = as_type<float>(_3170) * _3172;
    int _3184 = abs(_3164);
    float _3186 = -_3174;
    float _3188 = _3012 + _3186;
    int _3190 = ~_3036;
    int _3192 = _3190 + 1;
    float _3194 = _1512 + (-0.5);
    float _3196 = trunc(_3182);
    float _3198 = precise::max(_3196, 0.0);
    uint _3200 = uint(_3198);
    float _3202 = _3160 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3204 = _1762 >> 31;
    float _3206 = _3188 * _3188;
    int _3208 = _3178 & 3;
    float _3210 = -_3202;
    float _3212 = -_2490;
    float _3214 = fma(_3210, _3194, _3212);
    int _3216 = _3204 & 3;
    float _3218 = -_3180;
    float _3220 = _2930 + _3218;
    int _3222 = as_type<int>(_3176) + (-2);
    float _3224 = _2952 * _3158;
    float _3226 = float(uint(_3184));
    float _3228 = fma(_3220, _3220, _3206);
    int _3230 = _1762 + _3216;
    float _3232 = -_3224;
    float _3234 = _2952 + _3232;
    int _3236 = _2106 + _3208;
    float _3238 = as_type<float>(_3222) * _3226;
    int _3240 = _3192 * int(_3200);
    int _3242 = _3240 + _3164;
    int _3244 = _3230 >> 2;
    float _3246 = fma(_3234, _3234, _3228);
    int _3248 = _3236 >> 2;
    float _3250 = trunc(_3238);
    float _3252 = precise::max(_3250, 0.0);
    uint _3254 = uint(_3252);
    float _3256 = float(uint(_3242));
    float _3258 = -_2482;
    float _3260 = _3258 + 1.0;
    int _3262 = _3244 << 4;
    int _3264 = _3262 + 368;
    float _3266 = fma(_1512, _2580, _3214);
    int _3268 = _3248 << 4;
    int _3270 = _3268 + 800;
    float _3272 = as_type<float>(_3170) * _3256;
    int _3274 = ~_3140;
    int _3276 = _3274 + 1;
    uint _3278 = uint(int(uint(_3264) >> uint(2)));
    uint _3280 = uint(int(uint(int(_3278)) >> uint(2)));
    int _3282 = int(_3278) & 3;
    float _3284 = (*spvDescriptorSet0.vp_c9)._m0[int(_3280)][_3282];
    int _3286 = int(_3278) + 1;
    uint _3288 = uint(int(uint(_3286) >> uint(2)));
    int _3290 = _3286 & 3;
    float _3292 = (*spvDescriptorSet0.vp_c9)._m0[int(_3288)][_3290];
    float _3294 = -_3260;
    float _3296 = fma(_2372, _3294, _3060);
    float _3298 = -_2442;
    float _3300 = _3298 + 1.0;
    float _3302 = -_2480;
    float _3304 = _3302 + 1.0;
    int _3306 = abs(_3082);
    float _3308 = -_3300;
    float _3310 = fma(_1730, _3308, _3168);
    float _3312 = trunc(_3272);
    float _3314 = precise::max(_3312, 0.0);
    uint _3316 = uint(_3314);
    uint _3318 = uint(int(uint(_3270) >> uint(2)));
    uint _3320 = uint(int(uint(int(_3318)) >> uint(2)));
    int _3322 = int(_3318) & 3;
    float _3324 = (*spvDescriptorSet0.vp_c9)._m0[int(_3320)][_3322];
    int _3326 = int(_3318) + 1;
    uint _3328 = uint(int(uint(_3326) >> uint(2)));
    int _3330 = _3326 & 3;
    float _3332 = (*spvDescriptorSet0.vp_c9)._m0[int(_3328)][_3330];
    int _3334 = _3276 * int(_3254);
    int _3336 = _3334 + _3184;
    float _3338 = fma(_1968, _3304, _3070);
    out.m_84.x = _3108;
    int _3340 = ~_3036;
    int _3342 = _3340 + 1;
    float _3344 = float(uint(_3336));
    out.m_86.x = _3296;
    out.m_86.y = _3338;
    out.m_86.z = _3310;
    out.m_86.w = _3266;
    float _3346 = float(_2980);
    float _3348 = sqrt(_3246);
    float _3350 = float(_3306);
    float _3352 = as_type<float>(_3222) * _3344;
    bool _3354 = !_2122;
    int _3356 = _3354 ? 0 : 1;
    if (_3002)
    {
        out.m_57.x = 0.0;
    }
    int _3358 = int(_3200) + int(_3316);
    float _3360 = _3350 * _3346;
    float _3362 = trunc(_3352);
    float _3364 = precise::max(_3362, 0.0);
    uint _3366 = uint(_3364);
    bool _3368 = _1804 != 3;
    float _3370 = _3360 * (-2.0);
    int _3372 = ~_3140;
    int _3374 = _3372 + 1;
    int _3376 = _3264 + 8;
    uint _3378 = uint(int(uint(_3376) >> uint(2)));
    uint _3380 = uint(int(uint(int(_3378)) >> uint(2)));
    int _3382 = int(_3378) & 3;
    float _3384 = (*spvDescriptorSet0.vp_c9)._m0[int(_3380)][_3382];
    int _3386 = int(_3378) + 1;
    uint _3388 = uint(int(uint(_3386) >> uint(2)));
    int _3390 = _3386 & 3;
    float _3392 = (*spvDescriptorSet0.vp_c9)._m0[int(_3388)][_3390];
    int _3394 = _3342 * _3358;
    int _3396 = _3394 + _3164;
    bool _3398 = !_3368;
    int _3400 = _3398 ? 0 : (-1);
    int _3402 = abs(_2676);
    float _3404 = rsqrt(_3138);
    bool _3406 = uint(_3396) >= uint(_3036);
    float _3408 = _3078 * _3348;
    int _3410 = _3270 + 8;
    uint _3412 = uint(int(uint(_3410) >> uint(2)));
    uint _3414 = uint(int(uint(int(_3412)) >> uint(2)));
    int _3416 = int(_3412) & 3;
    float _3418 = (*spvDescriptorSet0.vp_c9)._m0[int(_3414)][_3416];
    int _3420 = int(_3412) + 1;
    uint _3422 = uint(int(uint(_3420) >> uint(2)));
    int _3424 = _3420 & 3;
    float _3426 = (*spvDescriptorSet0.vp_c9)._m0[int(_3422)][_3424];
    int _3428 = ~_3402;
    int _3430 = _3428 + 1;
    int _3432 = _3430 + 1;
    bool _3434 = !_3406;
    int _3436 = _3434 ? 0 : (-1);
    float _3438 = _1016 * _3408;
    int _3440 = int(_3254) + int(_3366);
    bool _3442 = _2120 != 3;
    int _3444 = ~_3358;
    int _3446 = _3444 + _3436;
    int _3448 = _3446 + 1;
    int _3450 = _3374 * _3440;
    int _3452 = _3450 + _3184;
    bool _3454 = _801 == 0;
    int _3456 = _2306 * as_type<int>(_3292);
    float _3458 = _3438 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _3460 = !_1570;
    int _3462 = _3460 ? _2248 : (-1);
    int _3464 = _3432 * as_type<int>(_3284);
    int _3466 = _3464 + _3456;
    int _3468 = abs(_1936);
    int _3470 = _2260 * as_type<int>(_3332);
    bool _3472 = !_3442;
    int _3474 = _3472 ? 0 : (-1);
    int _3476 = _3036 * _3448;
    int _3478 = _3476 + _3164;
    bool _3480 = uint(_3452) >= uint(_3140);
    float _3482 = _3458 * _3404;
    int _3484 = ~_3468;
    int _3486 = _3484 + 1;
    int _3488 = _3486 + 1;
    bool _3490 = !_3480;
    int _3492 = _3490 ? 0 : (-1);
    float _3494 = _2912 * _3482;
    bool _3496 = _3036 == 0;
    float _3498 = _2930 * _3482;
    int _3500 = abs(_3356);
    float _3502 = -_3494;
    float _3504 = _2912 + _3502;
    bool _3506 = !_3496;
    int _3508 = _3506 ? _3478 : (-1);
    float _3510 = -_3498;
    float _3512 = _2930 + _3510;
    bool _3514 = _3036 == 0;
    float _3516 = _3504 * _3504;
    int _3518 = _3164 ^ _3036;
    int _3520 = ~_3492;
    int _3522 = _3440 + _3520;
    int _3524 = _3522 + 1;
    float _3526 = fma(_3512, _3512, _3516);
    uint _3528 = uint(int(uint(_3518) >> uint(31)));
    int _3530 = _3488 * as_type<int>(_3384);
    int _3532 = _3530 + _3466;
    int _3534 = abs(_3400);
    float _3536 = _2952 * _3482;
    int _3538 = abs(_2200);
    int _3540 = abs(_2006);
    float _3542 = -_3536;
    float _3544 = _2952 + _3542;
    int _3546 = ~int(_3528);
    int _3548 = _3546 + 1;
    float _3550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3552 = ~_3500;
    int _3554 = _3552 + 1;
    int _3556 = _3554 + 1;
    float _3558 = fma(_3544, _3544, _3526);
    int _3560 = ~_3534;
    int _3562 = _3560 + 1;
    int _3564 = _3562 + 1;
    int _3566 = _3524 ^ _3548;
    int _3568 = _3556 * as_type<int>(_3324);
    int _3570 = _3568 + _3470;
    int _3572 = abs(_3474);
    int _3574 = _3564 * as_type<int>(_3392);
    int _3576 = _3574 + _3532;
    int _3578 = ~_3538;
    int _3580 = _3578 + 1;
    int _3582 = _3580 + 1;
    float _3584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3586 = ~_3548;
    int _3588 = _3586 + _3566;
    int _3590 = _3588 + 1;
    int _3592 = ~_3540;
    int _3594 = _3592 + 1;
    int _3596 = _3594 + 1;
    int _3598 = _3582 * as_type<int>(_3418);
    int _3600 = _3598 + _3570;
    int _3602 = ~_3572;
    int _3604 = _3602 + 1;
    int _3606 = _3604 + 1;
    bool _3608 = !_3514;
    int _3610 = _3608 ? _3590 : (-1);
    int _3612 = _3576 * _3596;
    float _3614 = sqrt(_3558);
    int _3616 = _3606 * as_type<int>(_3426);
    int _3618 = _3616 + _3600;
    float _3620 = float(_3610);
    float _3622 = _3550 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3624 = ~_2314;
    int _3626 = _3624 + 1;
    int _3628 = _3626 + 1;
    float _3630 = _1146 + 0.5;
    bool _3632 = !_3454;
    int _3634 = _3632 ? _2254 : (-1);
    float _3636 = -_2508;
    float _3638 = fma(_3622, _3620, _3636);
    float _3640 = _1168 + (-0.5);
    int _3642 = _3618 * _3628;
    float _3644 = float(_3508);
    float _3646 = _3584 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3648 = _3634 * _3540;
    int _3650 = _3648 + _3612;
    float _3652 = -_3622;
    float _3654 = fma(_3652, _3640, _3638);
    int _3656 = _3462 * _2314;
    int _3658 = _3656 + _3642;
    float _3660 = fma(_3646, _3644, _2494);
    float _3662 = in.m_88.x;
    float _3664 = in.m_88.y;
    float _3666 = in.m_88.z;
    float _3668 = _3404 * _3614;
    float _3670 = float(_3650);
    float _3672 = fma(_3646, _3630, _3660);
    bool _3674 = !_2646;
    int _3676 = _3674 ? 0 : 1;
    float _3678 = _3438 * _3668;
    float _3680 = float(_2606);
    float _3682 = -_2584;
    float _3684 = fma(_1146, _3682, _3672);
    float _3686 = float(_3658);
    float _3688 = fma(_1168, _2638, _3654);
    int _3690 = abs(_3676);
    out.m_90.x = _3670;
    bool _3692 = !_2650;
    int _3694 = _3692 ? 0 : 1;
    float _3696 = float(_3690);
    out.m_90.w = _3686;
    out.m_92.x = _3684;
    out.m_92.y = _3688;
    out.m_94.x = _3678;
    float _3698 = _3666;
    if (_3002)
    {
        return out;
    }
    float _3700 = fma(_3370, _3662, _3662);
    float _3702 = -_3494;
    float _3704 = _2346 + _3702;
    float _3706 = -_3498;
    float _3708 = _2908 + _3706;
    float _3710 = fma(_3016, _3370, _3016);
    float _3712 = fma(_3020, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3700);
    float _3714 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3716 = _3704 + _3714;
    float _3718 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3720 = _3708 + _3718;
    float _3722 = _3696 * _3680;
    float _3724 = fma(_3710, _2512, _3712);
    float _3726 = _3716 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3728 = -_3536;
    float _3730 = _2924 + _3728;
    int _3732 = abs(_3694);
    float _3734 = _3022 + (-1.0);
    float _3736 = fma(_3720, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3726);
    float _3738 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3740 = _3730 + _3738;
    float _3742 = _3722 * (-2.0);
    float _3744 = float(_2688);
    float _3746 = fma(_3740, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3736);
    float _3748 = float(_3732);
    float _3750 = fma(_3734, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3752 = fma(_3742, _3664, _3664);
    float _3754 = _984 + (-0.5);
    bool _3756 = _3746 >= 0.0;
    float _3758 = _3748 * _3744;
    float _3760 = fma(_3750, _3742, _3750);
    float _3762 = fma(_3024, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3752);
    float _3764 = _3014 + (-1.0);
    float _3766 = _3758 * (-2.0);
    float _3768 = _3724 * 0.15915493667125701904296875;
    float _3770 = fma(_3760, _2512, _3762);
    float _3772 = fma(_3764, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3774 = fma(_3766, _3666, _3666);
    float _3776 = _3768 * 6.283185482025146484375;
    float _3778 = sin(_3776);
    float _3780 = _3770 * 0.15915493667125701904296875;
    float _3782 = fma(_3772, _3766, _3772);
    if (_3756)
    {
        _3698 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3784 = _3698;
    float _3786 = fma(_3754, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3774);
    int _3788 = as_type<int>(_3784);
    if (_3756)
    {
        out.m_57.x = 0.0;
    }
    float _3790 = _3768 * 6.283185482025146484375;
    float _3792 = cos(_3790);
    if (_3756)
    {
        float _3794 = _3784 * 5.0;
        _3788 = as_type<int>(_3794);
    }
    int _3796 = _3788;
    float _3798 = fma(_3782, _2512, _3786);
    if (_3756)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10765 = as_type<float>(_3796);
        out.gl_Position.z = _10765;
    }
    float _3800 = _3798 * 0.15915493667125701904296875;
    float _3802 = _3780 * 6.283185482025146484375;
    float _3804 = sin(_3802);
    float _3806 = _3780 * 6.283185482025146484375;
    float _3808 = cos(_3806);
    if (_3756)
    {
        return out;
    }
    float _3810 = _3800 * 6.283185482025146484375;
    float _3812 = cos(_3810);
    float _3814 = _449 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3816 = _3408 * _3668;
    float _3818 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _229);
    float _3820 = _3778 * _3804;
    float _3822 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _243);
    float _3824 = _3814 * _3816;
    float _3826 = _3792 * _3804;
    float _3828 = _3800 * 6.283185482025146484375;
    float _3830 = sin(_3828);
    float _3832 = _3678 * _3822;
    float _3834 = _3824 * _3818;
    float _3836 = _3792 * _3808;
    float _3838 = _3778 * _3808;
    float _3840 = _3792 * _3812;
    float _3842 = _3808 * _3812;
    float _3844 = _3778 * _3812;
    float _3846 = _3804 * _3812;
    float _3848 = _3840 * _3834;
    float _3850 = _3816 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3852 = _3850 * 0.5;
    float _3854 = fma(_3830, _3836, _3820);
    float _3856 = -_3838;
    float _3858 = fma(_3830, _3826, _3856);
    float _3860 = -_3834;
    float _3862 = _3830 * _3860;
    float _3864 = -_3826;
    float _3866 = fma(_3830, _3838, _3864);
    float _3868 = fma(_3854, _3832, _3848);
    float _3870 = _3844 * _3834;
    float _3872 = fma(_3842, _3832, _3862);
    float _3874 = fma(_3830, _3820, _3836);
    float _3876 = fma(_3858, _3852, _3868);
    float _3878 = fma(_3866, _3832, _3870);
    float _3880 = fma(_3846, _3852, _3872);
    float _3882 = _3876 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3884 = fma(_3874, _3852, _3878);
    float _3886 = _3876 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3888 = _3876 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3890 = fma(_3880, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3882);
    float _3892 = fma(_3880, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3886);
    float _3894 = fma(_3880, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3888);
    float _3896 = fma(_3884, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3890);
    float _3898 = fma(_3884, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3892);
    float _3900 = fma(_3884, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3894);
    float _3902 = _3896 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3904 = _3898 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3906 = _3900 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3908 = _2924 + _3902;
    float _3910 = _2908 + _3904;
    float _3912 = _2346 + _3906;
    float _3914 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3916 = _3908 + _3914;
    float _3918 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3920 = _3910 + _3918;
    float _3922 = _3916 * _3916;
    float _3924 = fma(_3920, _3920, _3922);
    float _3926 = sqrt(_3924);
    bool _3928 = _3926 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3930 = _3904;
    float _3932 = _3884;
    float _3934 = _3910;
    if (!_3928)
    {
        _3930 = _3908;
    }
    float _3936 = _3930;
    float _3938 = _3936;
    if (!_3928)
    {
        _3932 = _3912;
    }
    float _3940 = _3932;
    bool _3942 = !_3928;
    float _3944 = _3940;
    if (!_3942)
    {
        float _3946 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3948 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3950 = _3926 + _3948;
        float _3952 = rsqrt(_3924);
        float _3954 = _3950 * _3946;
        float _3956 = _3912 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3958 = _3954 * 0.15915493667125701904296875;
        float _3960 = _3958 * 6.283185482025146484375;
        float _3962 = cos(_3960);
        float _3964 = _3958 * 6.283185482025146484375;
        float _3966 = sin(_3964);
        float _3968 = _3962 + (-1.0);
        float _3970 = _3968 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3972 = fma(_3966, _3956, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3974 = fma(_3912, _3962, _3970);
        float _3976 = _3952 * _3972;
        float _3978 = fma(_3920, _3976, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3980 = fma(_3916, _3976, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3934 = _3978;
        _3938 = _3980;
        _3944 = _3974;
    }
    float _3982 = _3934;
    float _3984 = _3938;
    float _3986 = _3944;
    float _3988 = fma(_3982, 6.2500002968590706586837768554688e-05, 0.5);
    float _3990 = fma(_3984, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _11082 = float2(_3988, _3990);
    float3 _3994 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_11082, float2(0.0), isnan(_11082)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_11082, float2(0.0), isnan(_11082)), level(0.0)).xyz;
    float _3996 = _3994.x;
    float _3998 = _3994.y;
    float _4000 = _3994.z;
    float _4002 = _3854 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4004 = _3854 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4006 = _3854 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4008 = _3840 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4010 = fma(_3842, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4002);
    float _4012 = fma(_3842, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4004);
    float _4014 = _3840 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4016 = _3840 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4018 = fma(_3842, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4006);
    float _4020 = -_3830;
    float _4022 = fma(_4020, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4008);
    float _4024 = -_3830;
    float _4026 = fma(_4024, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4014);
    float _4028 = -_3830;
    float _4030 = fma(_4028, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4016);
    float _4032 = _3858 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4034 = _3858 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4036 = _3858 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4038 = _229 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4040 = fma(_3846, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4032);
    float _4042 = -_3180;
    float _4044 = _2908 + _4042;
    float _4046 = fma(_3846, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4036);
    float _4048 = fma(_4038, _4038, 1.0);
    float _4050 = -_3174;
    float _4052 = _4050 + _2346;
    float _4054 = -_3174;
    float _4056 = _4054 + _3986;
    float _4058 = -_3180;
    float _4060 = _4058 + _3982;
    float _4062 = rsqrt(_4048);
    float _4064 = fma(_3846, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4034);
    float _4066 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4068 = _4056 + _4066;
    float _4070 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4072 = _4060 + _4070;
    float _4074 = -_3224;
    float _4076 = _4074 + _3984;
    float _4078 = fma(_3844, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4026);
    float _4080 = _4068 * _4068;
    float _4082 = fma(_3844, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4030);
    float _4084 = fma(_3844, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4022);
    float _4086 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4088 = _4076 + _4086;
    float _4090 = fma(_4072, _4072, _4080);
    float _4092 = fma(_3874, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4040);
    float _4094 = fma(_3874, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4064);
    float _4096 = fma(_3874, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4046);
    float _4098 = fma(_4088, _4088, _4090);
    float _4100 = fma(_3866, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4010);
    float _4102 = _4038 * _4062;
    float _4104 = fma(_3866, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4012);
    float _4106 = _243 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4108 = _4038 * _4078;
    float _4110 = _4038 * _4082;
    float _4112 = fma(_3866, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4018);
    float _4114 = _4038 * _4084;
    float _4116 = -_4092;
    float _4118 = _4102 * _4116;
    float _4120 = -_4094;
    float _4122 = _4102 * _4120;
    float _4124 = -_4096;
    float _4126 = _4102 * _4124;
    float _4128 = sqrt(_4098);
    float _4130 = fma(_4106, _4100, _4108);
    float _4132 = fma(_4106, _4104, _4110);
    float _4134 = fma(_4106, _4112, _4114);
    float _4136 = fma(_4062, _4078, _4118);
    float _4138 = fma(_4062, _4082, _4122);
    float _4140 = _4092 + _4130;
    float _4142 = fma(_4062, _4084, _4126);
    float _4144 = _4094 + _4132;
    float _4146 = _4096 + _4134;
    out.m_96.x = _4100;
    out.m_96.y = _4104;
    out.m_96.z = _4112;
    float _4148 = -_3224;
    float _4150 = _2924 + _4148;
    out.m_98.x = _4136;
    out.m_98.y = _4138;
    out.m_98.z = _4142;
    bool _4152 = _4128 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4154 = isnan(_4128);
    bool _4156 = _4152 || _4154;
    bool _4158 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4160 = _4156 || _4158;
    out.m_100.x = _4140;
    out.m_100.y = _4144;
    out.m_100.z = _4146;
    float _4162 = _4130;
    float _4164 = _4118;
    if (!_4160)
    {
        _4162 = 1.0;
    }
    float _4166 = _4162;
    out.m_102.x = _3996;
    out.m_102.y = _3998;
    out.m_102.z = _4000;
    bool _4168 = !_4160;
    float _4170 = _4166;
    if (!_4168)
    {
        bool _4172 = _4128 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4174 = isnan(_4128);
        bool _4176 = _4172 || _4174;
        bool _4178 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4180 = _4176 || _4178;
        if (!_4180)
        {
            float _4182 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4184 = _4128 + _4182;
            float _4186 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4188 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4186;
            float _4190 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4192 = _4190 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4194 = 1.0 / _4188;
            float _4196 = _4184 * _4194;
            float _4198 = fma(_4196, _4192, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4170 = _4198;
            _4200 = true;
        }
        else
        {
            bool _4202 = _4128 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4204 = isnan(_4128);
            bool _4206 = _4202 || _4204;
            bool _4208 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4210 = _4206 || _4208;
            if (!_4210)
            {
                float _4212 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4214 = _4128 + _4212;
                float _4216 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4218 = _4216 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4220 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4222 = _4220 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4224 = 1.0 / _4218;
                float _4226 = _4214 * _4224;
                float _4228 = fma(_4226, _4222, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4170 = _4228;
                _4200 = true;
            }
            else
            {
                _4170 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4200 = false;
    float _4230 = _4170;
    float _4232 = -_3494;
    float _4234 = _4232 + _4052;
    float _4236 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4238 = _4056 + _4236;
    float _4240 = -_3498;
    float _4242 = _4240 + _4044;
    float _4244 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4246 = _4060 + _4244;
    float _4248 = _4234 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4250 = fma(_4238, _4230, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4252 = -_3536;
    float _4254 = _4252 + _4150;
    float _4256 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4258 = _4076 + _4256;
    float _4260 = fma(_4242, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4248);
    float _4262 = fma(_4246, _4230, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4264 = -_4052;
    float _4266 = _4264 + _4250;
    float _4268 = fma(_4258, _4230, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4270 = fma(_4254, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4260);
    float _4272 = -_4044;
    float _4274 = _4272 + _4262;
    float _4276 = _4266 * _4266;
    float _4278 = -_4150;
    float _4280 = _4278 + _4268;
    float _4282 = _4270 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4284 = _4234 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4286 = fma(_4274, _4274, _4276);
    float _4288 = 1.0 / _4282;
    float _4290 = fma(_4242, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4284);
    float _4292 = fma(_4280, _4280, _4286);
    float _4294 = fma(_4254, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4290);
    float _4296 = sqrt(_4292);
    float _4298 = _4294 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4300 = _4298 + _4282;
    float _4302 = _4300 * _4288;
    float _4304 = _4302 * 0.5;
    bool _4306 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4308 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4310 = _4306 || _4308;
    bool _4312 = isnan(0.5);
    bool _4314 = _4310 || _4312;
    float _4316 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4318 = fma(_4304, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4316);
    bool _4320 = _4296 > 0.0;
    float _4322 = 1.0 / _4318;
    bool _4324 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4326 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4328 = _4324 || _4326;
    bool _4330 = isnan(0.5);
    bool _4332 = _4328 || _4330;
    float _4334 = _4288;
    float _4336 = _4262;
    float _4338 = _4274;
    float _4340 = _4266;
    float _4342 = _4254;
    float _4344 = _4234;
    if (!_4320)
    {
        _4334 = _4250;
    }
    float _4346 = _4334;
    float _4348 = _4346;
    float _4350 = _4346;
    if (!_4320)
    {
        _4164 = _4268;
    }
    float _4352 = _4164;
    bool _4354 = !_4320;
    float _4356 = _4352;
    float _4358 = _4352;
    if (!_4354)
    {
        float _4360 = _249 * _249;
        float _4362 = fma(_247, _247, _4360);
        float _4364 = fma(_251, _251, _4362);
        float _4366 = rsqrt(_4292);
        float _4368 = sqrt(_4364);
        float _4370 = _4274 * _4366;
        float _4372 = _4266 * _4366;
        float _4374 = _4280 * _4366;
        bool _4376 = _4368 > 0.0;
        if (!_4376)
        {
            _4348 = _4250;
        }
        float _4378 = _4348;
        _4350 = _4378;
        if (!_4376)
        {
            _4356 = _4268;
        }
        float _4380 = _4356;
        bool _4382 = !_4376;
        _4358 = _4380;
        if (!_4382)
        {
            float _4384 = rsqrt(_4364);
            float _4386 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4388 = _249 * _4384;
            float _4390 = _247 * _4384;
            float _4392 = _251 * _4384;
            float _4394 = _4372 * _4388;
            float _4396 = fma(_4370, _4390, _4394);
            float _4398 = _4386 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4400 = fma(_4374, _4392, _4396);
            float _4402 = _4400 * _4398;
            float _4404 = fma(_247, _4402, _4262);
            float _4406 = fma(_249, _4402, _4250);
            float _4408 = fma(_251, _4402, _4268);
            _4336 = _4404;
            _4350 = _4406;
            _4358 = _4408;
            _4338 = _4396;
        }
    }
    float _4410 = _4336;
    float _4412 = _4350;
    float _4414 = _4358;
    float _4416 = _4338;
    float _4418 = -_3498;
    float _4420 = _4418 + _4410;
    float _4422 = -_3494;
    float _4424 = _4422 + _4412;
    float _4426 = -_3536;
    float _4428 = _4426 + _4414;
    float _4430 = _4416;
    float _4432 = _4424;
    float _4434 = _4420;
    float _4436 = _4428;
    float _4438 = _4412;
    if (_4314)
    {
        _4430 = 1.0;
    }
    float _4440 = _4430;
    float _4442 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4444 = _4322 * _4442;
    float _4446 = _4440;
    if (!_4332)
    {
        float _4448 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4450 = _4234 + _4448;
        float _4452 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4454 = _4242 + _4452;
        float _4456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4458 = -_4150;
        float _4460 = _4458 + _4414;
        float _4462 = _4450 * _4450;
        float _4464 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4466 = _4254 + _4464;
        float _4468 = -_4044;
        float _4470 = _4468 + _4410;
        float _4472 = -_4052;
        float _4474 = _4472 + _4412;
        float _4476 = fma(_4454, _4454, _4462);
        float _4478 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4480 = fma(_4466, _4466, _4476);
        float _4482 = sqrt(_4480);
        float _4484 = 1.0 / _3668;
        float _4486 = _4478 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4488 = precise::min(_4482, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4490 = _4488 * _4456;
        float _4492 = _4490 * _4484;
        float _4494 = _4486 * _4492;
        float _4496 = _4460 * _4492;
        float _4498 = fma(_4470, _4494, _4242);
        float _4500 = fma(_4474, _4494, _4234);
        float _4502 = fma(_4486, _4496, _4254);
        _4432 = _4500;
        _4434 = _4498;
        _4436 = _4502;
        _4438 = _4474;
        _255 = _4486;
    }
    float _4504 = _4432;
    float _4506 = _4434;
    float _4508 = _4436;
    float _4510 = _4438;
    float _4512 = _255;
    float _4514 = _4510;
    float _4516 = _4512;
    if (!_4314)
    {
        float _4518 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4520 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4522 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4520;
        float _4524 = _4518 * 0.15915493667125701904296875;
        float _4526 = _4524 * 6.283185482025146484375;
        float _4528 = cos(_4526);
        float _4530 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4532 = _4530 * 0.15915493667125701904296875;
        float _4534 = _4524 * 6.283185482025146484375;
        float _4536 = sin(_4534);
        float _4538 = 1.0 / _4528;
        float _4540 = _4532 * 6.283185482025146484375;
        float _4542 = cos(_4540);
        float _4544 = _4536 * _4538;
        float _4546 = _4532 * 6.283185482025146484375;
        float _4548 = sin(_4546);
        float _4550 = _4542 * _4544;
        float _4552 = 1.0 / _4522;
        float _4554 = 1.0 / _4550;
        float _4556 = _4548 * _4554;
        float _4558 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4560 = fma(_4444, _4556, _4558);
        float _4562 = _4560 * _4552;
        float _4564 = precise::clamp(_4562, 0.0, 1.0);
        _4514 = _4532;
        _4516 = _4552;
        _4446 = _4564;
    }
    float _4566 = _4514;
    float _4568 = _4516;
    float _4570 = _4446;
    float _4572 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4574 = _4504 + _4572;
    float _4576 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4578 = _4506 + _4576;
    float _4580 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4582 = _4508 + _4580;
    float _4584 = _4574 * _4574;
    float _4586 = fma(_4578, _4578, _4584);
    float _4588 = fma(_4582, _4582, _4586);
    float _4590 = rsqrt(_4588);
    float _4592 = _4590 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4594 = _4578 * _4592;
    float _4596 = _4582 * _4592;
    float _4598 = _4594 * _4594;
    float _4600 = _4596 * _4596;
    float _4602 = _4598 + _4600;
    float _4604 = sqrt(_4602);
    bool _4606 = _4604 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4608 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4610 = _4604 + _4608;
    float _4612 = _4590;
    float _4614 = _4568;
    float _4616 = _4610;
    float _4618 = _4566;
    float _4620 = _4574;
    if (_4606)
    {
        float _4622 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4612 = _4622;
    }
    float _4624 = _4612;
    if (_4606)
    {
        float _4626 = rsqrt(_4602);
        _4614 = _4626;
    }
    float _4628 = _4614;
    float _4630 = _4628;
    if (_4606)
    {
        float _4632 = _4610 * _4624;
        _4616 = _4632;
    }
    float _4634 = _4616;
    if (_4606)
    {
        float _4636 = _4634 * 0.15915493667125701904296875;
        _4618 = _4636;
    }
    float _4638 = _4618;
    float _4640 = _4624;
    float _4642 = _4638;
    if (_4606)
    {
        float _4644 = _4638 * 6.283185482025146484375;
        float _4646 = cos(_4644);
        _4640 = _4646;
    }
    float _4648 = _4640;
    float _4650 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4652 = precise::max(0.0, _4650);
    float _4654 = _4582;
    float _4656 = _4652;
    if (_4606)
    {
        float _4658 = _4638 * 6.283185482025146484375;
        float _4660 = sin(_4658);
        _4654 = _4660;
    }
    float _4662 = _4654;
    float _4664 = -_4592;
    float _4666 = -_4652;
    float _4668 = fma(_4574, _4664, _4666);
    if (_4606)
    {
        float _4670 = _4668 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4620 = _4670;
    }
    float _4672 = _4620;
    float _4674 = _4672;
    float _4676 = _4648;
    if (_4606)
    {
        float _4678 = _4648 + (-1.0);
        _4656 = _4678;
    }
    float _4680 = _4656;
    float _4682 = _4680;
    if (!_4606)
    {
        _4642 = _4600;
    }
    float _4684 = _4642;
    float _4686 = _4684;
    if (_4606)
    {
        float _4688 = _4680 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4682 = _4688;
    }
    float _4690 = _4682;
    float _4692 = _4662;
    if (_4606)
    {
        float _4694 = fma(_4662, _4672, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4674 = _4694;
    }
    float _4696 = _4674;
    float _4698 = _4696;
    if (!_4606)
    {
        _4692 = _4668;
    }
    float _4700 = _4692;
    float _4702 = _4700;
    if (_4606)
    {
        float _4704 = fma(_4668, _4648, _4690);
        _4702 = _4704;
    }
    float _4706 = _4702;
    if (!_4606)
    {
        _4676 = _4598;
    }
    float _4708 = _4676;
    float _4710 = _4708;
    if (_4606)
    {
        float _4712 = _4628 * _4696;
        _4340 = _4712;
    }
    float _4714 = _4340;
    float _4716 = sqrt(_4588);
    if (!_4606)
    {
        _4630 = _4594;
    }
    float _4718 = _4630;
    float _4720 = _4718;
    if (_4606)
    {
        float _4722 = _4594 * _4714;
        _4720 = _4722;
    }
    float _4724 = _4720;
    if (!_4606)
    {
        _4698 = _4596;
    }
    float _4726 = _4698;
    float _4728 = _4726;
    if (_4606)
    {
        float _4730 = _4596 * _4714;
        _4728 = _4730;
    }
    float _4732 = _4728;
    float _4734 = fma(_4242, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_4606)
    {
        float _4736 = _4724 * _4724;
        _4710 = _4736;
    }
    float _4738 = _4710;
    float _4740 = _4504 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_4606)
    {
        float _4742 = _4732 * _4732;
        _4686 = _4742;
    }
    float _4744 = _4686;
    float _4746 = fma(_4706, _4706, _4738);
    float _4748 = fma(_4506, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4740);
    float _4750 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4752 = _4746 + _4744;
    float _4754 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4756 = fma(_4716, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4754);
    float _4758 = precise::clamp(_4756, 0.0, 1.0);
    float _4760 = fma(_4508, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4748);
    float _4762 = rsqrt(_4752);
    float _4764 = -_4758;
    float _4766 = _4764 + 1.0;
    float _4768 = _4760 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4770 = fma(_4254, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4772 = _4504 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4774 = _4768 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4776 = abs(_4766);
    float _4778 = log2(_4776);
    float _4780 = _4504 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4782 = fma(_4506, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4772);
    float _4784 = -_4774;
    float _4786 = fma(_4784, _4750, 1.0);
    float _4788 = _4504 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4790 = fma(_4506, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4780);
    float _4792 = fma(_4508, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4782);
    float _4794 = fma(_4506, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4788);
    float _4796 = fma(_4508, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4790);
    float _4798 = floor(_4734);
    float _4800 = _4762 * _4724;
    float _4802 = fma(_4508, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4794);
    float _4804 = _4796 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4806 = _4762 * _4706;
    float _4808 = _4762 * _4732;
    float _4810 = _4802 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4812 = _4804 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4814 = _4800 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4816 = _4778 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4818 = floor(_4770);
    float _4820 = fma(_4810, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4812);
    float _4822 = -_4814;
    float _4824 = fma(_4806, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4822);
    float _4826 = _4792 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4828 = fma(_4768, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4820);
    float _4830 = -_4808;
    float _4832 = fma(_4830, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4824);
    float _4834 = -_4798;
    float _4836 = _4734 + _4834;
    float _4838 = exp2(_4816);
    float _4840 = fma(_4826, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4828);
    float _4842 = fma(_4832, -0.5, 0.5);
    float _4844 = _4804 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4846 = fma(_4832, 0.5, 0.5);
    float _4848 = _4804 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4850 = fma(_4810, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4844);
    float _4852 = log2(_4786);
    float _4854 = fma(_4810, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4848);
    float _4856 = fma(_4846, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4858 = fma(_4768, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4850);
    float _4860 = -_4818;
    float _4862 = _4770 + _4860;
    float _4864 = fma(_4768, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4854);
    float _4866 = fma(_4846, _4856, -0.212114393711090087890625);
    float _4868 = 1.0 / _4840;
    float _4870 = fma(_4846, _4866, 1.570728778839111328125);
    float _4872 = sqrt(_4842);
    float _4874 = _4852 * 0.693147182464599609375;
    float _4876 = _4874 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4878 = _4806 + 1.0;
    float _4880 = -_4806;
    float _4882 = fma(_4838, _4878, _4880);
    float _4884 = fma(_4826, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4858);
    float _4886 = fma(_4826, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4864);
    float _4888 = _4872 * 0.636619746685028076171875;
    float _4890 = fma(_4882, 0.5, 0.5);
    float _4892 = _4884 * _4868;
    float _4894 = _4886 * _4868;
    float _4896 = -_4870;
    float _4898 = fma(_4888, _4896, 1.0);
    float2 _12564 = float2(_4836, _4862);
    float _4900 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12564, float2(0.0), isnan(_12564)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12564, float2(0.0), isnan(_12564)), level(0.0)).x;
    float _4902 = fma(_4892, 0.5, 0.5);
    float _4904 = fma(_4894, -0.5, 0.5);
    float3 _12577 = float3(_4902, _4904, _4876);
    float _4906 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12577, float3(0.0), isnan(_12577)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12577, float3(0.0), isnan(_12577)), level(0.0)).x;
    float3 _12588 = float3(_4902, _4904, _4876);
    float4 _4909 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12588, float3(0.0), isnan(_12588)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12588, float3(0.0), isnan(_12588)), level(0.0)).xyzw;
    float _4911 = _4909.x;
    float _4913 = _4909.y;
    float _4915 = _4909.z;
    float _4917 = _4909.w;
    float2 _12604 = float2(_4898, _4890);
    float3 _4919 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12604, float2(0.0), isnan(_12604)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12604, float2(0.0), isnan(_12604)), level(0.0)).xyz;
    float _4921 = _4919.x;
    float _4923 = _4919.y;
    float _4925 = _4919.z;
    float _4927 = abs(_4444);
    float _4929 = log2(_4927);
    float _4931 = _4804 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_104.x = _4242;
    out.m_104.y = _4234;
    out.m_104.z = _4254;
    bool _4933 = _4716 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4935 = isnan(_4716);
    bool _4937 = _4933 || _4935;
    bool _4939 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4941 = _4937 || _4939;
    float _4943 = fma(_4810, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4931);
    float _4945 = _4840 * 0.5;
    out.m_106.x = _4506;
    out.m_106.y = _4504;
    out.m_106.z = _4508;
    float _4947 = fma(_4768, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4943);
    float _4949 = in.m_78.x;
    float _4951 = fma(_4826, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4947);
    float _4953 = fma(_4886, -0.5, _4945);
    float _4955 = _4929 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4957 = _4951 + _4840;
    out.gl_Position.x = _4884;
    out.gl_Position.y = _4886;
    out.gl_Position.z = _4951;
    out.gl_Position.w = _4840;
    float _4959 = _4886;
    float _4961 = _4884;
    if (!_4941)
    {
        _4342 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4963 = _4342;
    float _4965 = exp2(_4955);
    float _4967 = _4957 * 0.5;
    float _4969 = _4963;
    float _4971 = _4963;
    if (!_4941)
    {
        _4344 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4973 = _4344;
    float _4975 = _4973;
    float _4977 = _4973;
    if (!_4941)
    {
        _4959 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4979 = _4959;
    float _4981 = fma(_4965, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4983 = precise::clamp(_4981, 0.0, 1.0);
    float _4985 = _4778 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _4987 = _4444 <= 8000.0;
    bool _4989 = isnan(_4444);
    bool _4991 = _4987 || _4989;
    bool _4993 = isnan(8000.0);
    bool _4995 = _4991 || _4993;
    float _4997 = float(_4995);
    float _4999 = _4884 + _4840;
    float _5001 = fma(_4983, -2.0, 3.0);
    float _5003 = _4983 * _4983;
    float _5005 = _4999;
    float _5007 = _4979;
    float _5009 = _4979;
    if (!_4941)
    {
        _4961 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5011 = _4961;
    float _5013 = exp2(_4985);
    float _5015 = _4999 * 0.5;
    float _5017 = _5003 * _5001;
    float _5019 = _5011;
    float _5021 = _5011;
    if (!_4941)
    {
        _5005 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5023 = _5005;
    float _5025 = -_5017;
    float _5027 = _5025 + 1.0;
    float _5029 = fma(_5027, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5017);
    float _5031 = _4570 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5033 = _4997 * _5029;
    float _5035 = -_5013;
    float _5037 = _5035 + 1.0;
    out.m_108.x = _5015;
    out.m_108.y = _4953;
    out.m_108.z = _4967;
    out.m_108.w = _4840;
    float _5039 = _5033 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5041 = _5037 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5043 = -_5041;
    float _5045 = _5043 + 1.0;
    float _5047 = -_4900;
    float _5049 = _5047 + 1.0;
    float _5051 = _5049 * _5039;
    float _5053 = precise::clamp(_5051, 0.0, 1.0);
    float _5055 = _5041 * _4906;
    float _5057 = _4917 * _5045;
    float _5059 = -_5053;
    float _5061 = fma(_5059, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5063 = _5045;
    float _5065 = _5023;
    float _5067 = _5023;
    if (!_4941)
    {
        _5063 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5069 = _5063;
    float _5071 = _4917 * _5055;
    float _5073 = _4925 * _5055;
    float _5075 = _5061 * _4949;
    float _5077 = fma(_4921, _5071, _4911);
    float _5079 = fma(_4923, _5071, _4913);
    float _5081 = _5075 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5083 = fma(_4917, _5073, _4915);
    out.m_110.x = _5081;
    out.m_112.x = _5077;
    out.m_112.y = _5079;
    out.m_112.z = _5083;
    out.m_112.w = _5057;
    bool _5085 = !_4941;
    float _5087 = _5069;
    float _5089 = _5069;
    if (!_5085)
    {
        bool _5091 = _4716 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5093 = isnan(_4716);
        bool _5095 = _5091 || _5093;
        bool _5097 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5099 = _5095 || _5097;
        if (!_5099)
        {
            float _5101 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5103 = _4716 + _5101;
            float _5105 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5107 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5105;
            float _5109 = 1.0 / _5107;
            float _5111 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5113 = _5111 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5115 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5117 = _5115 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5119 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5121 = _5119 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5123 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5125 = _5123 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5127 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5129 = _5127 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5131 = _5103 * _5109;
            float _5133 = precise::clamp(_5131, 0.0, 1.0);
            float _5135 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5137 = _5135 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5139 = fma(_5133, _5113, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5141 = fma(_5133, _5137, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5143 = fma(_5133, _5117, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5145 = fma(_5133, _5121, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5147 = fma(_5133, _5125, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5149 = fma(_5133, _5129, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5009 = _5141;
            _5089 = _5147;
            _5021 = _5139;
            _4977 = _5145;
            _4971 = _5143;
            _5067 = _5149;
            _5151 = true;
        }
        else
        {
            bool _5153 = _4716 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5155 = isnan(_4716);
            bool _5157 = _5153 || _5155;
            bool _5159 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5161 = _5157 || _5159;
            if (!_5161)
            {
                _5019 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5163 = _5019;
            _5021 = _5163;
            if (!_5161)
            {
                _5007 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5165 = _5007;
            _5009 = _5165;
            if (!_5161)
            {
                _4969 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5167 = _4969;
            _4971 = _5167;
            if (!_5161)
            {
                _4975 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5169 = _4975;
            _4977 = _5169;
            if (!_5161)
            {
                _5087 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5171 = _5087;
            _5089 = _5171;
            if (!_5161)
            {
                _5065 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5173 = _5065;
            bool _5175 = !_5161;
            _5067 = _5173;
            if (!_5175)
            {
                bool _5177 = _4716 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5179 = isnan(_4716);
                bool _5181 = _5177 || _5179;
                bool _5183 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5185 = _5181 || _5183;
                if (!_5185)
                {
                    float _5187 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5189 = _4716 + _5187;
                    float _5191 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5193 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5191;
                    float _5195 = 1.0 / _5193;
                    float _5197 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5199 = _5197 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5201 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5203 = _5201 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5205 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5207 = _5205 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5209 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5211 = _5209 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5213 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5215 = _5213 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5217 = _5189 * _5195;
                    float _5219 = precise::clamp(_5217, 0.0, 1.0);
                    float _5221 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5223 = _5221 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5225 = fma(_5219, _5199, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5227 = fma(_5219, _5223, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5229 = fma(_5219, _5203, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5231 = fma(_5219, _5207, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5233 = fma(_5219, _5211, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5235 = fma(_5219, _5215, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5009 = _5227;
                    _5089 = _5233;
                    _5021 = _5225;
                    _4977 = _5231;
                    _4971 = _5229;
                    _5067 = _5235;
                    _5151 = true;
                }
                else
                {
                    _5009 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5089 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5021 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4977 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4971 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5067 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5151 = false;
    float _5237 = _5009;
    float _5239 = _5089;
    float _5241 = _5021;
    float _5243 = _4977;
    float _5245 = _4971;
    float _5247 = _5067;
    float _5249 = fma(_4144, -0.5, 0.5);
    float _5251 = precise::clamp(_5249, 0.0, 1.0);
    float _5253 = -_5237;
    float _5255 = _5253 + _5239;
    float _5257 = _5031 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5259 = -_5241;
    float _5261 = _5259 + _5243;
    out.m_114.x = 0.0;
    float _5263 = fma(_5251, _5255, _5237);
    float _5265 = fma(_5251, _5261, _5241);
    out.m_57.x = _5257;
    float _5267 = -_5245;
    float _5269 = _5267 + _5247;
    float _5271 = _5263 * 0.586610972881317138671875;
    bool _5273 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5275 = fma(_5251, _5269, _5245);
    float _5277 = fma(_5265, 0.298911988735198974609375, _5271);
    bool _5279 = _4570 > 0.0;
    bool _5281 = isnan(_4570);
    bool _5283 = _5279 || _5281;
    bool _5285 = isnan(0.0);
    bool _5287 = _5283 || _5285;
    float _5289 = fma(_5275, 0.114477999508380889892578125, _5277);
    float _5291 = -_5289;
    float _5293 = _5265 + _5291;
    float _5295 = -_5289;
    float _5297 = _5263 + _5295;
    float _5299 = -_5289;
    float _5301 = _5275 + _5299;
    float _5303 = fma(_5293, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5289);
    float _5305 = fma(_5297, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5289);
    float _5307 = fma(_5301, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5289);
    bool _5309 = !_5273;
    if (!_5309)
    {
        float _5311 = -_4504;
        float _5313 = _5311 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5315 = -_4506;
        float _5317 = _5315 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5319 = -_4508;
        float _5321 = _5319 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5323 = _5313 * _5313;
        float _5325 = fma(_5317, _5317, _5323);
        float _5327 = fma(_5321, _5321, _5325);
        float _5329 = sqrt(_5327);
        float _5331 = rsqrt(_5327);
        float _5333 = -_5329;
        float _5335 = _5333 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5337 = _5335 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5339 = precise::clamp(_5337, 0.0, 1.0);
        float _5341 = _5317 * _5331;
        float _5343 = _5313 * _5331;
        float _5345 = abs(_5339);
        float _5347 = log2(_5345);
        float _5349 = _5321 * _5331;
        float _5351 = _5341 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5353 = _4144 * _5343;
        float _5355 = -_5343;
        float _5357 = -_5351;
        float _5359 = fma(_5355, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5357);
        float _5361 = fma(_4140, _5341, _5353);
        float _5363 = -_5349;
        float _5365 = fma(_5363, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5359);
        float _5367 = fma(_4146, _5349, _5361);
        float _5369 = precise::clamp(_5367, 0.0, 1.0);
        float _5371 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5373 = _5365 + _5371;
        float _5375 = _5347 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5377 = _5373 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5379 = precise::clamp(_5377, 0.0, 1.0);
        float _5381 = exp2(_5375);
        float _5383 = _5381 * _5379;
        float _5385 = _5369 * _5383;
        float _5387 = _5385 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5389 = _5385 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5391 = _5385 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_114.x = _5387;
        out.m_114.y = _5389;
        out.m_114.z = _5391;
    }
    out.m_80.x = _5303;
    out.m_80.y = _5305;
    out.m_80.z = _5307;
    if (_5287)
    {
        return out;
    }
    out.m_57.x = 0.0;
    float _5393 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5393;
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_114 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_110 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_112 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5151 = false;
    bool _4200 = false;
    bool _609 = false;
    bool _473 = false;
    bool _275 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _128 = in.m_50.w;
    float _130 = in.m_52.w;
    float _132 = trunc(_128);
    int _135 = int(_132);
    float _137 = -_130;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.y = _139;
    bool _143 = _135 >= 1;
    float _145 = 0.0;
    float _147 = _130;
    float _149 = _139;
    if (!_143)
    {
        _145 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _145;
    if (!_143)
    {
        out.m_57.x = 0.0;
    }
    int _153 = 0;
    if (!_143)
    {
        float _155 = _151 * 5.0;
        _153 = as_type<int>(_155);
    }
    int _157 = _153;
    int _159 = _157;
    if (!_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5461 = as_type<float>(_157);
        out.gl_Position.z = _5461;
    }
    if (!_143)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_114.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_114.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_114.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_114.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_112.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_112.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_112.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_112.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 96, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 97, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 98, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 99, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _161 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _163 = isnan(_130);
    bool _165 = _161 || _163;
    bool _167 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _169 = _165 || _167;
    float _171 = float(_135);
    bool _173 = _139 >= _171;
    bool _175 = !_169;
    bool _177 = _173 || _175;
    float _179 = 1.0 / _171;
    if (_177)
    {
        _147 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _181 = _147;
    if (_177)
    {
        out.m_57.x = 0.0;
    }
    float _183 = _139 * _179;
    float _185 = _183;
    if (_177)
    {
        float _187 = _181 * 5.0;
        _159 = as_type<int>(_187);
    }
    int _189 = _159;
    out.m_55.x = _183;
    if (_177)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5524 = as_type<float>(_189);
        out.gl_Position.z = _5524;
    }
    if (_177)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_114.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_114.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_114.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_114.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_112.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_112.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_112.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_112.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 96, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 97, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 98, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 99, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _191 = as_type<float>(int(gl_VertexIndex));
    float _193 = in.m_62.x;
    float _195 = in.m_62.y;
    float _197 = in.m_62.z;
    float _199 = in.m_64.x;
    float _201 = in.m_64.y;
    float _203 = in.m_64.z;
    float _205 = in.m_66.x;
    float _207 = in.m_66.y;
    float _209 = in.m_66.z;
    float _211 = in.m_68.x;
    float _213 = in.m_68.y;
    float _215 = in.m_68.z;
    int _217 = as_type<int>(_191) & 1;
    bool _219 = _217 != 0;
    int _221 = as_type<int>(_191) & 2;
    bool _223 = _221 != 0;
    bool _225 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _227 = !_223;
    float _229 = _227 ? (-0.5) : 0.5;
    float _231 = _195 * _201;
    float _233 = _195 * _207;
    float _235 = fma(_193, _199, _231);
    float _237 = _195 * _213;
    float _239 = fma(_193, _205, _233);
    bool _241 = !_219;
    float _243 = _241 ? (-0.5) : 0.5;
    float _245 = fma(_193, _211, _237);
    float _247 = fma(_197, _203, _235);
    float _249 = fma(_197, _209, _239);
    float _251 = fma(_197, _215, _245);
    bool _253 = !_225;
    float _255 = _247;
    float _273;
    if (!_253)
    {
        float _257 = in.m_70.x;
        float _259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _261 = _257 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _265 = _263 * _259;
        float _267 = floor(_265);
        float _269 = -_267;
        float _271 = _265 + _269;
        _273 = _271;
        _275 = true;
    }
    else
    {
        _273 = _183;
    }
    _275 = false;
    float _277 = _273;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _281 = _277 + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _285 = _277 + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _293 = _291 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _295;
    bool _299 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _301 = isnan(_277);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = 1.0 / _289;
    bool _313 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _315 = 1.0 / _293;
    float _317 = 1.0 / _297;
    float _319 = _281 * _311;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _277 + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _325;
    float _329 = fma(_327, _319, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _331 = _323 * _315;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _333;
    bool _337 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _339 = isnan(_277);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = fma(_335, _319, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _351 = -_347;
    float _353 = _351 + 1.0;
    float _355 = _285 * _317;
    float _357 = -_309;
    float _359 = _357 + 1.0;
    bool _361 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _363 = isnan(_277);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = _347 * _359;
    bool _375 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _377 = isnan(_277);
    bool _379 = _375 || _377;
    bool _381 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _383 = _379 || _381;
    float _385 = float(_383);
    float _387 = _371 * _353;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _397 = -_371;
    float _399 = _397 + 1.0;
    float _401 = fma(_391, _331, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _403 = fma(_395, _331, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _405 = _385 * _399;
    float _407 = in.m_72.x;
    float _409 = in.m_72.y;
    float _411 = -_385;
    float _413 = _411 + 1.0;
    float _415 = _329 * _405;
    float _417 = _349 * _405;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _423;
    float _427 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[143].x, _415);
    float _429 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[143].y, _417);
    float _431 = fma(_421, _355, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _433 = fma(_425, _355, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _435 = fma(_401, _387, _427);
    float _437 = fma(_403, _387, _429);
    float _439 = fma(_431, _373, _435);
    float _441 = fma(_433, _373, _437);
    float _443 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[146].x, _439);
    float _445 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[146].y, _441);
    float _447 = _443 * _407;
    float _449 = _445 * _409;
    bool _451 = !_313;
    float _453 = _355;
    float _471;
    if (!_451)
    {
        float _455 = in.m_70.x;
        float _457 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _459 = _455 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _461 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _463 = _461 * _457;
        float _465 = floor(_463);
        float _467 = -_465;
        float _469 = _463 + _467;
        _471 = _469;
        _473 = true;
    }
    else
    {
        _471 = _183;
    }
    _473 = false;
    float _475 = _471;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _479 = _475 + _477;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _485 = _475 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _487 = isnan(_475);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _501 = _475 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _503 = isnan(_475);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _513;
    bool _517 = _475 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _519 = isnan(_475);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    float _529 = 1.0 / _483;
    float _531 = -_495;
    float _533 = _531 + 1.0;
    bool _535 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _537 = _511 * _533;
    float _539 = -_511;
    float _541 = _539 + 1.0;
    float _543 = 1.0 / _499;
    float _545 = _515 * _529;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _551 = fma(_545, _479, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _553 = _549 * _543;
    float _555 = _551 * _537;
    float _557 = -_527;
    float _559 = _557 + 1.0;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _563 = _475 + _561;
    float _565 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[115].x, _555);
    float _567 = _495 * _559;
    float _569 = fma(_553, _563, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _573 = fma(_569, _567, _565);
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _579 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[117].x, _573);
    float _581 = _571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _583 = _575 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _585 = _577 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _587 = _579 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_74.x = _581;
    out.m_74.y = _583;
    out.m_74.z = _585;
    out.m_74.w = _587;
    bool _589 = !_535;
    float _607;
    if (!_589)
    {
        float _591 = in.m_70.x;
        float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _595 = _591 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _597 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[11].w, _139);
        float _599 = _597 * _593;
        float _601 = floor(_599);
        float _603 = -_601;
        float _605 = _599 + _603;
        _607 = _605;
        _609 = true;
    }
    else
    {
        _607 = _183;
    }
    _609 = false;
    float _611 = _607;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _615 = _611 + _613;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _619 = _617 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _625 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _627 = isnan(_611);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _641 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _643 = isnan(_611);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = 1.0 / _619;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _655;
    float _659 = -_635;
    float _661 = _659 + 1.0;
    bool _663 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _665 = isnan(_611);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    bool _675 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _677 = 1.0 / _623;
    float _679 = 1.0 / _639;
    float _681 = _657 * _653;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _685 = _683 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _687 = _651 * _661;
    float _689 = -_651;
    float _691 = _689 + 1.0;
    float _693 = fma(_681, _615, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _695;
    float _699 = _673 * _691;
    float _701 = _685 * _677;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _705 = _611 + _703;
    bool _707 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _709 = isnan(_611);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _715 = _711 || _713;
    float _717 = float(_715);
    float _719 = _693 * _699;
    float _721 = -_673;
    float _723 = _721 + 1.0;
    float _725 = fma(_701, _705, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _729 = _611 + _727;
    float _731 = _697 * _679;
    float _733 = -_717;
    float _735 = _733 + 1.0;
    float _737 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[131].x, _719);
    float _739 = fma(_731, _729, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _741 = _635 * _735;
    float _743 = fma(_725, _687, _737);
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _747 = fma(_739, _741, _743);
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _751 = _745 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _755 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[134].x, _747);
    float _757 = _749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _759 = _753 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = _755 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_76.x = _751;
    out.m_76.y = _757;
    out.m_76.z = _759;
    out.m_76.w = _761;
    bool _763 = !_675;
    float _765 = _757;
    if (!_763)
    {
        float _767 = in.m_70.x;
        float _769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _771 = _767 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[14].x, _139);
        float _775 = _773 * _769;
        float _777 = floor(_775);
        float _779 = -_777;
        float _781 = _775 + _779;
        _185 = _781;
    }
    float _783 = _185;
    float _785 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _787 = int(_785);
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _791 = _789 != 0;
    float _793 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _795 = int(_793);
    float _797 = float(_787);
    float _799 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _801 = int(_799);
    if (_791)
    {
        _453 = 1.0;
    }
    float _803 = _453;
    float _805 = _803;
    if (_791)
    {
        _765 = 1.0;
    }
    float _807 = _765;
    int _809 = 0;
    float _811 = _807;
    if (_791)
    {
        _809 = 0;
    }
    int _813 = _809;
    float _815 = float(_795);
    float _817 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _819 = int(_817);
    float _821 = 1.0 / _797;
    float _823 = float(uint(_801));
    int _825 = ~_801;
    int _827 = _825 + 1;
    float _829 = 1.0 / _815;
    float _831 = float(uint(_819));
    float _833 = _821 * _139;
    float _835 = 1.0 / _823;
    float _837 = _821;
    float _839 = _815;
    int _841 = _813;
    if (_791)
    {
        float _843 = in.m_70.x;
        float _845 = in.m_70.y;
        _837 = _843;
        _839 = _845;
    }
    float _847 = _837;
    float _849 = _839;
    float _851 = _829 * _139;
    float _853 = 1.0 / _831;
    float _855 = trunc(_833);
    int _857 = int(_855);
    int _859 = as_type<int>(_835) + (-2);
    float _861 = trunc(_851);
    int _863 = int(_861);
    int _865 = as_type<int>(_853) + (-2);
    float _867 = 0.0;
    float _869 = _847;
    float _871 = _849;
    if (_791)
    {
        _867 = _849;
    }
    float _873 = _867;
    float _875 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _877 = int(_875);
    float _879 = float(uint(_857));
    float _881 = as_type<float>(_859) * _879;
    int _883 = as_type<int>(_879);
    float _885 = _873;
    if (_791)
    {
        _883 = 0;
    }
    int _887 = _883;
    float _889 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _891 = int(_889);
    float _893 = float(uint(_863));
    float _895 = as_type<float>(_865) * _893;
    float _897 = _893;
    int _899 = _887;
    if (_791)
    {
        _897 = _847;
    }
    float _901 = _897;
    float _903 = trunc(_881);
    float _905 = precise::max(_903, 0.0);
    uint _908 = uint(_905);
    float _910 = float(uint(_877));
    float _912 = 0.0;
    float _914 = _901;
    if (_791)
    {
        _912 = _901;
    }
    float _916 = _912;
    float _918 = 1.0 / _910;
    float _920 = float(_891);
    float _922 = trunc(_895);
    float _924 = precise::max(_922, 0.0);
    uint _926 = uint(_924);
    float _928 = 1.0 / _920;
    float _930 = _920;
    float _932 = _916;
    if (_791)
    {
        _930 = _901;
    }
    float _934 = _930;
    float _936 = _934;
    if (!_791)
    {
        float _938 = in.m_70.x;
        float _940 = in.m_70.y;
        float _942 = in.m_70.z;
        float _944 = _938 * 3.1415927410125732421875;
        float _946 = _944 * 0.15915493667125701904296875;
        float _948 = _940 * 3.1415927410125732421875;
        float _950 = _948 * 0.15915493667125701904296875;
        float _952 = _946 * 6.283185482025146484375;
        float _954 = sin(_952);
        float _956 = _950 * 6.283185482025146484375;
        float _958 = sin(_956);
        _805 = 7.345489978790283203125;
        _869 = _938;
        _914 = _940;
        _811 = 5.839270114898681640625;
        _936 = _942;
        _871 = _940;
        _885 = _958;
        _899 = 1;
        _841 = 2;
        _932 = _954;
    }
    float _960 = _805;
    float _962 = _869;
    float _964 = _914;
    float _966 = _811;
    float _968 = _936;
    float _970 = _871;
    float _972 = _885;
    int _974 = _899;
    int _976 = _841;
    float _978 = _932;
    int _980 = _827 * int(_908);
    int _982 = _980 + _857;
    float _984 = in.m_70.z;
    float _986 = in.m_70.w;
    float _988 = _960 * _962;
    int _990 = ~_819;
    int _992 = _990 + 1;
    float _994 = _960 * _964;
    float _996 = float(uint(_982));
    float _998 = _928 * _139;
    float _1000 = floor(_988);
    int _1002 = _992 * int(_926);
    int _1004 = _1002 + _863;
    float _1006 = _966 * _968;
    float _1008 = as_type<float>(_859) * _996;
    float _1010 = float(_801);
    float _1012 = in.m_78.y;
    float _1014 = float(uint(_1004));
    float _1016 = _447 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1018 = trunc(_998);
    int _1020 = int(_1018);
    float _1022 = float(_857);
    float _1024 = as_type<float>(_865) * _1014;
    int _1026 = as_type<int>(_918) + (-2);
    bool _1028 = _970 > 0.5;
    float _1030 = trunc(_1008);
    float _1032 = precise::max(_1030, 0.0);
    uint _1034 = uint(_1032);
    bool _1036 = _1022 >= _1010;
    bool _1038 = isnan(_1022);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan(_1010);
    bool _1044 = _1040 || _1042;
    float _1046 = float(_1044);
    bool _1048 = _986 > 0.5;
    float _1050 = -_1000;
    float _1052 = _988 + _1050;
    bool _1054 = _984 > 0.5;
    float _1056 = floor(_1006);
    float _1058 = float(uint(_1020));
    int _1060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1062 = _1060 != 0;
    int _1064 = ~_819;
    int _1066 = _1064 + 1;
    float _1068 = as_type<float>(_1026) * _1058;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1072 = _1070 != 0;
    int _1074 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1076 = _1074 != 0;
    int _1078 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1080 = _1078 != 0;
    float _1082 = trunc(_1024);
    float _1084 = precise::max(_1082, 0.0);
    uint _1086 = uint(_1084);
    float _1088 = -_229;
    int _1090 = _1054 ? as_type<int>(_1088) : as_type<int>(_229);
    int _1092 = int(_908) + int(_1034);
    int _1094 = ~_801;
    int _1096 = _1094 + 1;
    int _1098 = int(_1048);
    int _1100 = _1054 ? 2 : 0;
    int _1102 = _1098 | _1100;
    int _1104 = _1062 ? 4 : 0;
    int _1106 = _1102 | _1104;
    int _1108 = _1072 ? 8 : 0;
    int _1110 = _1106 | _1108;
    int _1112 = _1076 ? 16 : 0;
    int _1114 = _1110 | _1112;
    int _1116 = _1080 ? 32 : 0;
    int _1118 = _1114 | _1116;
    int _1120 = _1028 ? 64 : 0;
    int _1122 = _1118 | _1120;
    int _1124 = _1122 & 64;
    float _1126 = trunc(_1068);
    float _1128 = precise::max(_1126, 0.0);
    uint _1130 = uint(_1128);
    float _1132 = -_1056;
    float _1134 = _1006 + _1132;
    float _1136 = -_243;
    int _1138 = _1028 ? as_type<int>(_1136) : as_type<int>(_243);
    int _1140 = _1096 * _1092;
    int _1142 = _1140 + _857;
    bool _1144 = !_1076;
    float _1146 = _1144 ? _243 : as_type<float>(_1138);
    float _1148 = trunc(_1046);
    int _1150 = int(_1148);
    int _1152 = int(_926) + int(_1086);
    bool _1154 = !_1062;
    int _1156 = _1154 ? 0 : 1;
    int _1158 = ~_877;
    int _1160 = _1158 + 1;
    float _1162 = float(_819);
    float _1164 = floor(_994);
    bool _1166 = !_1080;
    float _1168 = _1166 ? _229 : as_type<float>(_1090);
    int _1170 = _1160 * int(_1130);
    int _1172 = _1170 + _1020;
    float _1174 = _1052 * _1010;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1178 = _1176 != 0;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1182 = _1180 != 0;
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1186 = _1184 != 0;
    float _1188 = _1134 * _1162;
    bool _1190 = uint(_1142) >= uint(_801);
    int _1192 = _1066 * _1152;
    int _1194 = _1192 + _863;
    float _1196 = float(_863);
    float _1198 = trunc(_1174);
    int _1200 = int(_1198);
    bool _1202 = !_1182;
    int _1204 = _1202 ? 0 : 1;
    bool _1206 = !_1178;
    int _1208 = _1206 ? 0 : 1;
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1212 = _1210 != 0;
    float _1214 = -_1164;
    float _1216 = _994 + _1214;
    bool _1218 = uint(_1194) >= uint(_819);
    float _1220 = trunc(_1188);
    int _1222 = int(_1220);
    bool _1224 = !_1190;
    int _1226 = _1224 ? 0 : (-1);
    bool _1228 = _1196 >= _1162;
    bool _1230 = isnan(_1196);
    bool _1232 = _1228 || _1230;
    bool _1234 = isnan(_1162);
    bool _1236 = _1232 || _1234;
    float _1238 = float(_1236);
    bool _1240 = !_1186;
    int _1242 = _1240 ? 0 : 1;
    bool _1244 = !_1212;
    int _1246 = _1244 ? 0 : 1;
    bool _1248 = !_1218;
    int _1250 = _1248 ? 0 : (-1);
    float _1252 = trunc(_1238);
    int _1254 = int(_1252);
    float _1256 = float(uint(_1172));
    int _1258 = abs(_1156);
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1262 = _1260 != 0;
    int _1264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1266 = _1264 != 0;
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1270 = _1268 != 0;
    float _1272 = as_type<float>(_1026) * _1256;
    int _1274 = ~_1092;
    int _1276 = _1274 + _1226;
    int _1278 = _1276 + 1;
    int _1280 = _1200 * _1258;
    int _1282 = _1280 + _857;
    int _1284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1286 = _1284 != 0;
    bool _1288 = !_1266;
    int _1290 = _1288 ? 0 : 1;
    int _1292 = _801 * _1278;
    int _1294 = _1292 + _857;
    bool _1296 = !_1286;
    int _1298 = _1296 ? 0 : 1;
    float _1300 = trunc(_1272);
    float _1302 = precise::max(_1300, 0.0);
    uint _1304 = uint(_1302);
    bool _1306 = _801 == 0;
    bool _1308 = _1124 != 0;
    int _1310 = abs(_1298);
    int _1312 = ~_1152;
    int _1314 = _1312 + _1250;
    int _1316 = _1314 + 1;
    bool _1318 = !_1306;
    int _1320 = _1318 ? _1294 : (-1);
    float _1322 = _179 * _139;
    bool _1324 = !_1262;
    int _1326 = _1324 ? 0 : 1;
    int _1328 = _819 * _1316;
    int _1330 = _1328 + _863;
    bool _1332 = _819 == 0;
    float _1334 = _1010 * _1322;
    int _1336 = ~_1150;
    int _1338 = _1336 + 1;
    int _1340 = _1338 + 1;
    float _1342 = _1162 * _1322;
    int _1344 = ~_1254;
    int _1346 = _1344 + 1;
    int _1348 = _1346 + 1;
    int _1350 = _1222 * _1310;
    int _1352 = _1350 + _863;
    bool _1354 = !_1332;
    int _1356 = _1354 ? _1330 : (-1);
    float _1358 = trunc(_1334);
    int _1360 = int(_1358);
    int _1362 = _1320 * _1340;
    int _1364 = _801 + (-1);
    int _1366 = abs(_1204);
    int _1368 = _1356 * _1348;
    int _1370 = _819 + (-1);
    int _1372 = _1150 * _1364;
    int _1374 = _1372 + _1362;
    int _1376 = abs(_1290);
    float _1378 = trunc(_1342);
    int _1380 = int(_1378);
    int _1382 = ~_877;
    int _1384 = _1382 + 1;
    int _1386 = _1254 * _1370;
    int _1388 = _1386 + _1368;
    int _1390 = _1374 * _1366;
    int _1392 = abs(_1208);
    int _1394 = abs(_1242);
    int _1396 = _1388 * _1376;
    int _1398 = abs(_1246);
    int _1400 = _1360 * _1392;
    int _1402 = _1400 + _1390;
    int _1404 = int(_1130) + int(_1304);
    int _1406 = _1282 * _1394;
    int _1408 = _1406 + _1402;
    int _1410 = abs(_1326);
    int _1412 = _1200 * _1398;
    int _1414 = _1412 + _1408;
    float _1416 = -_229;
    int _1418 = _1048 ? as_type<int>(_1416) : as_type<int>(_229);
    int _1420 = _1384 * _1404;
    int _1422 = _1420 + _1020;
    float _1424 = float(_877);
    int _1426 = _1380 * _1410;
    int _1428 = _1426 + _1396;
    bool _1430 = !_1270;
    int _1432 = _1430 ? 0 : 1;
    float _1434 = float(uint(_1414));
    float _1436 = _1424 * _1322;
    bool _1438 = uint(_1422) >= uint(_877);
    float _1440 = -_243;
    int _1442 = _1054 ? as_type<int>(_1440) : as_type<int>(_243);
    float _1444 = float(_1020);
    float _1446 = trunc(_1436);
    int _1448 = int(_1446);
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1452 = _1450 != 0;
    int _1454 = abs(_1432);
    float _1456 = as_type<float>(_859) * _1434;
    bool _1458 = _1444 >= _1424;
    bool _1460 = isnan(_1444);
    bool _1462 = _1458 || _1460;
    bool _1464 = isnan(_1424);
    bool _1466 = _1462 || _1464;
    float _1468 = float(_1466);
    bool _1470 = !_1452;
    int _1472 = _1470 ? 0 : 1;
    int _1474 = _1352 * _1454;
    int _1476 = _1474 + _1428;
    int _1478 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1480 = _1478 != 0;
    float _1482 = trunc(_1468);
    int _1484 = int(_1482);
    bool _1486 = !_1438;
    int _1488 = _1486 ? 0 : (-1);
    bool _1490 = !_1480;
    int _1492 = _1490 ? 0 : 1;
    int _1494 = ~_1404;
    int _1496 = _1494 + _1488;
    int _1498 = _1496 + 1;
    int _1500 = abs(_1492);
    float _1502 = trunc(_1456);
    float _1504 = precise::max(_1502, 0.0);
    uint _1506 = uint(_1504);
    int _1508 = abs(_1472);
    bool _1510 = !_1072;
    float _1512 = _1510 ? _229 : as_type<float>(_1418);
    float _1514 = _1216 * _1424;
    int _1516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1518 = _1516 != 0;
    int _1520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1522 = _1520 != 0;
    int _1524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1526 = _1524 != 0;
    int _1528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1530 = _1528 != 0;
    int _1532 = _1222 * _1508;
    int _1534 = _1532 + _1476;
    int _1536 = ~_801;
    int _1538 = _1536 + 1;
    int _1540 = _877 * _1498;
    int _1542 = _1540 + _1020;
    int _1544 = ~_1484;
    int _1546 = _1544 + 1;
    int _1548 = _1546 + 1;
    float _1550 = trunc(_1514);
    int _1552 = int(_1550);
    bool _1554 = !_1522;
    int _1556 = _1554 ? 0 : 1;
    int _1558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1560 = _1558 != 0;
    bool _1562 = !_1518;
    int _1564 = _1562 ? 0 : 1;
    int _1566 = _1538 * int(_1506);
    int _1568 = _1566 + _1414;
    bool _1570 = _877 == 0;
    float _1572 = float(uint(_1534));
    bool _1574 = !_1570;
    int _1576 = _1574 ? _1542 : (-1);
    float _1578 = float(uint(_1568));
    float _1580 = as_type<float>(_865) * _1572;
    int _1582 = abs(_1556);
    float _1584 = as_type<float>(_1404);
    if (_1560)
    {
        float _1586 = in.m_70.w;
        _1584 = _1586;
    }
    float _1588 = _1584;
    int _1590 = _1576 * _1548;
    int _1592 = _877 + (-1);
    float _1594 = as_type<float>(_859) * _1578;
    float _1596 = trunc(_1580);
    float _1598 = precise::max(_1596, 0.0);
    uint _1600 = uint(_1598);
    int _1602 = abs(_1564);
    int _1604 = _1484 * _1592;
    int _1606 = _1604 + _1590;
    int _1608 = ~_819;
    int _1610 = _1608 + 1;
    int _1612 = _1606 * _1582;
    float _1614 = trunc(_1594);
    float _1616 = precise::max(_1614, 0.0);
    uint _1618 = uint(_1616);
    bool _1620 = _801 == 0;
    int _1622 = _1448 * _1602;
    int _1624 = _1622 + _1612;
    int _1626 = _1552 * _1500;
    int _1628 = _1626 + _1020;
    bool _1630 = !_1526;
    int _1632 = _1630 ? 0 : 1;
    int _1634 = ~_801;
    int _1636 = _1634 + 1;
    int _1638 = _1610 * int(_1600);
    int _1640 = _1638 + _1534;
    int _1642 = abs(_1632);
    float _1644 = as_type<float>(_1500);
    if (_1560)
    {
        float _1646 = _1588 * 3.1415927410125732421875;
        _1644 = _1646;
    }
    float _1648 = _1644;
    int _1650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1652 = _1650 != 0;
    float _1654 = float(uint(_1640));
    float _1656 = _1648;
    if (_1560)
    {
        float _1658 = _1648 * 0.15915493667125701904296875;
        _1656 = _1658;
    }
    float _1660 = _1656;
    int _1662 = int(_1506) + int(_1618);
    bool _1664 = !_1530;
    int _1666 = _1664 ? 0 : 1;
    int _1668 = _1636 * _1662;
    int _1670 = _1668 + _1414;
    float _1672 = as_type<float>(_865) * _1654;
    int _1674 = abs(_1666);
    float _1676 = _1660;
    if (_1560)
    {
        float _1678 = _1660 * 6.283185482025146484375;
        float _1680 = sin(_1678);
        _1676 = _1680;
    }
    float _1682 = _1676;
    bool _1684 = uint(_1670) >= uint(_801);
    int _1686 = _1628 * _1642;
    int _1688 = _1686 + _1624;
    float _1690 = as_type<float>(_1500);
    if (_1652)
    {
        float _1692 = in.m_70.x;
        _1690 = _1692;
    }
    float _1694 = _1690;
    float _1696 = float(uint(_1282));
    float _1698 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    bool _1700 = !_1684;
    int _1702 = _1700 ? 0 : (-1);
    float _1704 = trunc(_1672);
    float _1706 = precise::max(_1704, 0.0);
    uint _1708 = uint(_1706);
    int _1710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1712 = _1710 != 0;
    float _1714 = as_type<float>(_859) * _1696;
    int _1716 = _1552 * _1674;
    int _1718 = _1716 + _1688;
    int _1720 = ~_1662;
    int _1722 = _1720 + _1702;
    int _1724 = _1722 + 1;
    float _1726 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1698);
    bool _1728 = !_1712;
    float _1730 = _1728 ? _243 : as_type<float>(_1442);
    float _1732 = _972 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1734 = trunc(_1714);
    float _1736 = precise::max(_1734, 0.0);
    uint _1738 = uint(_1736);
    float _1740 = float(uint(_1718));
    int _1742 = _801 * _1724;
    int _1744 = _1742 + _1414;
    bool _1746 = _1712;
    float _1748 = _1740;
    if (_1560)
    {
        bool _1750 = _1682 > 0.5;
        _1746 = _1750;
    }
    bool _1752 = _1746;
    int _1754 = ~_801;
    int _1756 = _1754 + 1;
    float _1758 = as_type<float>(_1026) * _1740;
    bool _1760 = !_1620;
    int _1762 = _1760 ? _1744 : (-1);
    int _1764 = int(_1600) + int(_1708);
    float _1766 = trunc(_1758);
    float _1768 = precise::max(_1766, 0.0);
    uint _1770 = uint(_1768);
    float _1772 = as_type<float>(_1708);
    if (!_1560)
    {
        _1772 = _243;
    }
    float _1774 = _1772;
    float _1776 = _1774;
    if (_1652)
    {
        float _1778 = _1694 * 3.1415927410125732421875;
        _1748 = _1778;
    }
    float _1780 = _1748;
    float _1782 = _1780;
    if (_1560)
    {
        float _1784 = -_243;
        float _1786 = _1752 ? _1784 : _243;
        _1776 = _1786;
    }
    float _1788 = _1776;
    float _1790 = float(uint(_1352));
    int _1792 = _1756 * int(_1738);
    int _1794 = _1792 + _1282;
    int _1796 = _1762 & 3;
    bool _1798 = _1796 != 0;
    if (_1652)
    {
        float _1800 = _1780 * 0.15915493667125701904296875;
        _1782 = _1800;
    }
    float _1802 = _1782;
    int _1804 = _1762 & 3;
    bool _1806 = _1804 != 0;
    float _1808 = as_type<float>(_865) * _1790;
    int _1810 = _1798 ? 0 : 1;
    bool _1812 = uint(_1804) > 1u;
    float _1814 = _1802;
    if (_1652)
    {
        float _1816 = _1802 * 6.283185482025146484375;
        float _1818 = sin(_1816);
        _1814 = _1818;
    }
    float _1820 = _1814;
    float _1822 = float(uint(_1794));
    int _1824 = ~_819;
    int _1826 = _1824 + 1;
    int _1828 = ~_877;
    int _1830 = _1828 + 1;
    float _1832 = as_type<float>(_859) * _1822;
    int _1834 = ~_1810;
    int _1836 = _1834 + 1;
    int _1838 = _1836 + 1;
    float _1840 = trunc(_1808);
    float _1842 = precise::max(_1840, 0.0);
    uint _1844 = uint(_1842);
    int _1846 = _1826 * _1764;
    int _1848 = _1846 + _1534;
    float _1850 = -_229;
    int _1852 = _1308 ? as_type<int>(_1850) : as_type<int>(_229);
    int _1854 = _1830 * int(_1770);
    int _1856 = _1854 + _1718;
    bool _1858 = uint(_1804) >= 2u;
    int _1860 = _1838;
    if (!_1812)
    {
        int _1862 = ~_1810;
        int _1864 = _1862 + 1;
        _1860 = _1864;
    }
    int _1866 = _1860;
    bool _1868 = uint(_1848) >= uint(_819);
    float _1870 = trunc(_1832);
    float _1872 = precise::max(_1870, 0.0);
    uint _1874 = uint(_1872);
    float _1876 = float(uint(_1856));
    int _1878 = ~_819;
    int _1880 = _1878 + 1;
    int _1882 = _1858 ? 0 : 1;
    float _1884 = as_type<float>(_1026) * _1876;
    bool _1886 = _1804 != 3;
    int _1888 = _1880 * int(_1844);
    int _1890 = _1888 + _1352;
    bool _1892 = !_1868;
    int _1894 = _1892 ? 0 : (-1);
    float _1896 = trunc(_1884);
    float _1898 = precise::max(_1896, 0.0);
    uint _1900 = uint(_1898);
    int _1902 = ~_1882;
    int _1904 = _1902 + 1;
    int _1906 = _1904 + 1;
    int _1908 = ~_1764;
    int _1910 = _1908 + _1894;
    int _1912 = _1910 + 1;
    float _1914 = float(uint(_1890));
    int _1916 = _819 * _1912;
    int _1918 = _1916 + _1534;
    float _1920 = _1884;
    int _1922 = _1906;
    bool _1924 = _1886;
    if (!_1652)
    {
        _1920 = _229;
    }
    float _1926 = _1920;
    float _1928 = as_type<float>(_865) * _1914;
    float _1930 = _1926;
    if (_1886)
    {
        int _1932 = ~_1882;
        int _1934 = _1932 + 1;
        _1922 = _1934;
    }
    int _1936 = _1922;
    if (_1652)
    {
        bool _1938 = _1820 > 0.5;
        _1924 = _1938;
    }
    bool _1940 = _1924;
    bool _1942 = !_1332;
    int _1944 = _1942 ? _1918 : (-1);
    int _1946 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1948 = _1946 != 0;
    float _1950 = trunc(_1928);
    float _1952 = precise::max(_1950, 0.0);
    uint _1954 = uint(_1952);
    if (_1652)
    {
        float _1956 = -_229;
        float _1958 = _1940 ? _1956 : _229;
        _1930 = _1958;
    }
    float _1960 = _1930;
    int _1962 = _1944 & 3;
    bool _1964 = _1962 != 0;
    bool _1966 = !_1948;
    float _1968 = _1966 ? _229 : as_type<float>(_1852);
    int _1970 = int(_1770) + int(_1900);
    bool _1972 = uint(_1962) > 1u;
    int _1974 = ~_877;
    int _1976 = _1974 + 1;
    int _1978 = _1944 & 3;
    bool _1980 = _1978 != 0;
    int _1982 = int(_1738) + int(_1874);
    int _1984 = _1976 * _1970;
    int _1986 = _1984 + _1718;
    int _1988 = ~_801;
    int _1990 = _1988 + 1;
    int _1992 = _1980 ? 0 : 1;
    int _1994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1996 = _1994 != 0;
    int _1998 = _1990 * _1982;
    int _2000 = _1998 + _1282;
    float _2002 = float(uint(_1628));
    bool _2004 = !_1996;
    int _2006 = _2004 ? 0 : 1;
    bool _2008 = uint(_1986) >= uint(_877);
    float _2010 = as_type<float>(_1026) * _2002;
    int _2012 = ~_1992;
    int _2014 = _2012 + 1;
    int _2016 = _2014 + 1;
    int _2018 = _2016;
    if (!_1972)
    {
        int _2020 = ~_1992;
        int _2022 = _2020 + 1;
        _2018 = _2022;
    }
    int _2024 = _2018;
    float _2026 = trunc(_2010);
    float _2028 = precise::max(_2026, 0.0);
    uint _2030 = uint(_2028);
    bool _2032 = uint(_2000) >= uint(_801);
    bool _2034 = !_2008;
    int _2036 = _2034 ? 0 : (-1);
    bool _2038 = _1962 != 3;
    bool _2040 = !_2032;
    int _2042 = _2040 ? 0 : (-1);
    bool _2044 = uint(_1962) >= 2u;
    int _2046 = ~_1970;
    int _2048 = _2046 + _2036;
    int _2050 = _2048 + 1;
    int _2052 = ~_819;
    int _2054 = _2052 + 1;
    int _2056 = int(_1844) + int(_1954);
    int _2058 = _877 * _2050;
    int _2060 = _2058 + _1718;
    int _2062 = _2044 ? 0 : 1;
    int _2064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2066 = _2064 != 0;
    int _2068 = _2054 * _2056;
    int _2070 = _2068 + _1352;
    int _2072 = ~_877;
    int _2074 = _2072 + 1;
    int _2076 = ~_2062;
    int _2078 = _2076 + 1;
    int _2080 = _2078 + 1;
    int _2082 = _2080;
    if (_2038)
    {
        int _2084 = ~_2062;
        int _2086 = _2084 + 1;
        _2082 = _2086;
    }
    int _2088 = _2082;
    int _2090 = _2074 * int(_2030);
    int _2092 = _2090 + _1628;
    int _2094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2096 = _2094 != 0;
    bool _2098 = !_2066;
    int _2100 = _2098 ? 0 : 1;
    bool _2102 = uint(_2070) >= uint(_819);
    bool _2104 = !_1570;
    int _2106 = _2104 ? _2060 : (-1);
    bool _2108 = !_2096;
    int _2110 = _2108 ? 0 : 1;
    bool _2112 = !_2102;
    int _2114 = _2112 ? 0 : (-1);
    int _2116 = _2106 & 3;
    bool _2118 = _2116 != 0;
    int _2120 = _2106 & 3;
    bool _2122 = _2120 != 0;
    float _2124 = float(uint(_2092));
    int _2126 = _2118 ? 0 : 1;
    bool _2128 = uint(_2120) > 1u;
    float _2130 = as_type<float>(_1026) * _2124;
    int _2132 = ~_2126;
    int _2134 = _2132 + 1;
    int _2136 = _2134 + 1;
    float _2138 = trunc(_2130);
    float _2140 = precise::max(_2138, 0.0);
    uint _2142 = uint(_2140);
    float _2144 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2146 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2148 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2150 = _2136;
    if (!_2128)
    {
        int _2152 = ~_2126;
        int _2154 = _2152 + 1;
        _2150 = _2154;
    }
    int _2156 = _2150;
    float _2158 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2160 = uint(_2120) >= 2u;
    int _2162 = ~_877;
    int _2164 = _2162 + 1;
    int _2166 = _2160 ? 0 : 1;
    bool _2168 = _2120 != 3;
    int _2170 = int(_2030) + int(_2142);
    int _2172 = ~_2166;
    int _2174 = _2172 + 1;
    int _2176 = _2174 + 1;
    int _2178 = _2164 * _2170;
    int _2180 = _2178 + _1628;
    int _2182 = ~_2056;
    int _2184 = _2182 + _2114;
    int _2186 = _2184 + 1;
    int _2188 = abs(_2024);
    float _2190 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2192 = _2176;
    float _2194 = as_type<float>(_2180);
    if (_2168)
    {
        int _2196 = ~_2166;
        int _2198 = _2196 + 1;
        _2192 = _2198;
    }
    int _2200 = _2192;
    int _2202 = _819 * _2186;
    int _2204 = _2202 + _1352;
    bool _2206 = uint(_2180) >= uint(_877);
    float _2208 = _984 * 2.0;
    bool _2210 = !_2206;
    int _2212 = _2210 ? 0 : (-1);
    bool _2214 = _962 > 0.5;
    bool _2216 = !_1332;
    int _2218 = _2216 ? _2204 : (-1);
    float _2220 = -_243;
    int _2222 = _2214 ? as_type<int>(_2220) : as_type<int>(_243);
    bool _2224 = _974 != 1;
    float _2226 = in.m_50.x;
    float _2228 = in.m_50.y;
    float _2230 = in.m_50.z;
    int _2232 = ~_2170;
    int _2234 = _2232 + _2212;
    int _2236 = _2234 + 1;
    int _2238 = ~_1982;
    int _2240 = _2238 + _2042;
    int _2242 = _2240 + 1;
    int _2244 = abs(_2156);
    int _2246 = _877 * _2236;
    int _2248 = _2246 + _1628;
    int _2250 = abs(_1866);
    int _2252 = _801 * _2242;
    int _2254 = _2252 + _1282;
    int _2256 = ~_2244;
    int _2258 = _2256 + 1;
    int _2260 = _2258 + 1;
    float _2262 = 0.0;
    if (!_2224)
    {
        _2262 = _970;
    }
    float _2264 = _2262;
    float _2266 = 0.0;
    float _2268 = _2264;
    if (!_2224)
    {
        _2266 = _970;
    }
    float _2270 = _2266;
    float _2272 = 0.0;
    float _2274 = _2270;
    if (!_2224)
    {
        _2272 = _984;
    }
    float _2276 = _2272;
    float _2278 = 0.0;
    float _2280 = _2276;
    if (!_2224)
    {
        _2278 = _984;
    }
    float _2282 = _2278;
    float _2284 = _2282;
    if (_2224)
    {
        _2268 = _962;
    }
    float _2286 = _2268;
    if (_2224)
    {
        _2274 = _962;
    }
    float _2288 = _2274;
    if (_2224)
    {
        _2280 = _970;
    }
    float _2290 = _2280;
    float _2292 = _201 * _2228;
    if (_2224)
    {
        _2284 = _970;
    }
    float _2294 = _2284;
    float _2296 = _207 * _2228;
    bool _2298 = _976 != 2;
    float _2300 = fma(_205, _2226, _2296);
    int _2302 = ~_2250;
    int _2304 = _2302 + 1;
    int _2306 = _2304 + 1;
    float _2308 = fma(_209, _2230, _2300);
    float _2310 = _970 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2312 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    int _2314 = abs(_2110);
    float _2316 = fma(_2310, -2.0, _2144);
    if (_2298)
    {
        _2194 = _962;
    }
    float _2318 = _2194;
    float _2320 = fma(_1732, -2.0, _2312);
    float _2322 = 0.0;
    float _2324 = _2318;
    if (_2298)
    {
        _2322 = _970;
    }
    float _2326 = _2322;
    float _2328 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2316);
    float _2330 = _2326;
    if (!_2298)
    {
        _2324 = _984;
    }
    float _2332 = _2324;
    float _2334 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2320);
    if (!_2298)
    {
        _2330 = _962;
    }
    float _2336 = _2330;
    int _2338 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2340 = _2338 != 0;
    float _2342 = _213 * _2228;
    float _2344 = fma(_199, _2226, _2292);
    float _2346 = _2228 + _1012;
    float _2348 = fma(_211, _2226, _2342);
    float _2350 = fma(_203, _2230, _2344);
    float _2352 = _962 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2354 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2356 = log2(_2354);
    float _2358 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2360 = _2336 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2362 = -_2358;
    float _2364 = fma(_2352, 2.0, _2362);
    float _2366 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2368 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2370 = !_2340;
    float _2372 = _2370 ? _243 : as_type<float>(_2222);
    float _2374 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2366);
    float _2376 = _978 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2378 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2380 = fma(_2288, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2368);
    float _2382 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2384 = _2356 * _139;
    float _2386 = -_2146;
    float _2388 = fma(_2376, 2.0, _2386);
    float _2390 = _2286 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2392 = _2332 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2394 = exp2(_2384);
    float _2396 = fma(_2294, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2378);
    float _2398 = -_2382;
    float _2400 = fma(_2390, 2.0, _2398);
    float _2402 = -_2148;
    float _2404 = fma(_2392, 2.0, _2402);
    float _2406 = _2290 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2408 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2410 = isnan(0.0);
    bool _2412 = _2408 || _2410;
    bool _2414 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2416 = _2412 || _2414;
    float _2418 = fma(_2360, -2.0, _2190);
    float _2420 = fma(_2406, -2.0, _2158);
    float _2422 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2374);
    float _2424 = -_139;
    float _2426 = fma(_2424, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2364);
    float _2428 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1726);
    float _2430 = -_139;
    float _2432 = fma(_2430, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2388);
    float _2434 = -_2394;
    float _2436 = _2434 + 1.0;
    float _2438 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2440 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2442 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2380);
    float _2444 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2396);
    float _2446 = _2416 ? _2436 : 0.0;
    float _2448 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2450 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _2452 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2454 = isnan(1.0);
    bool _2456 = _2452 || _2454;
    bool _2458 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2460 = _2456 || _2458;
    float _2462 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2464 = 1.0 + _2462;
    float _2466 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2438);
    float _2468 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2450);
    float _2470 = _962 * 2.0;
    float _2472 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2448);
    float _2474 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2440);
    float _2476 = 1.0 / _2464;
    float _2478 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2468);
    float _2480 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2472);
    float _2482 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2466);
    float _2484 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2474);
    float _2486 = -_139;
    float _2488 = fma(_2486, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2400);
    float _2490 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2420);
    float _2492 = -_139;
    float _2494 = fma(_2492, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2404);
    float _2496 = floor(_2470);
    float _2498 = fma(_215, _2230, _2348);
    float _2500 = _970 * 2.0;
    float _2502 = _1960 + (-0.5);
    float _2504 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2506 = _2504 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2508 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2418);
    if (_2460)
    {
        float _2510 = _2446 * _2476;
        _149 = _2510;
    }
    float _2512 = _149;
    float _2514 = floor(_2500);
    float _2516 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2518 = _2516 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2520 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2522 = _2520 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2524 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2526 = _2524 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2528 = -_2502;
    float _2530 = -_2334;
    float _2532 = fma(_2528, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2530);
    bool _2534 = _2496 >= 0.0;
    bool _2536 = isnan(_2496);
    bool _2538 = _2534 || _2536;
    bool _2540 = isnan(0.0);
    bool _2542 = _2538 || _2540;
    float _2544 = -_2422;
    float _2546 = _2544 + 1.0;
    float _2548 = 1.0 / _2506;
    float _2550 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2552 = _2550 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2554 = _2542 ? 0 : 1;
    float _2556 = -_2428;
    float _2558 = _2556 + 1.0;
    bool _2560 = _2496 > 0.0;
    float _2562 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2564 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2562;
    int _2566 = ~_2554;
    int _2568 = _2566 + 1;
    int _2570 = _2568 + 1;
    float _2572 = 1.0 / _2518;
    float _2574 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2576 = _2574 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2578 = -_2444;
    float _2580 = _2578 + 1.0;
    float _2582 = -_2478;
    float _2584 = _2582 + 1.0;
    bool _2586 = _2514 >= 0.0;
    bool _2588 = isnan(_2514);
    bool _2590 = _2586 || _2588;
    bool _2592 = isnan(0.0);
    bool _2594 = _2590 || _2592;
    float _2596 = 1.0 / _2522;
    float _2598 = _2564 * _2548;
    int _2600 = _2570;
    if (!_2560)
    {
        int _2602 = ~_2554;
        int _2604 = _2602 + 1;
        _2600 = _2604;
    }
    int _2606 = _2600;
    float _2608 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2610 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2608;
    bool _2612 = _2514 > 0.0;
    float _2614 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2616 = _2614 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2618 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2620 = _2618 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2622 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2624 = _2622 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2626 = floor(_2208);
    int _2628 = _2594 ? 0 : 1;
    float _2630 = _2610 * _2572;
    bool _2632 = !_1964;
    int _2634 = _2632 ? 0 : 1;
    float _2636 = -_2484;
    float _2638 = _2636 + 1.0;
    int _2640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2642 = _2640 != 0;
    int _2644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2646 = _2644 != 0;
    int _2648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2650 = _2648 != 0;
    bool _2652 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2654 = isnan(_783);
    bool _2656 = _2652 || _2654;
    bool _2658 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2660 = _2656 || _2658;
    float _2662 = float(_2660);
    float _2664 = 1.0 / _2526;
    float _2666 = _2624 * _2596;
    int _2668 = ~_2628;
    int _2670 = _2668 + 1;
    int _2672 = _2670 + 1;
    bool _2674 = !_1806;
    int _2676 = _2674 ? 0 : 1;
    float _2678 = -_2662;
    float _2680 = _2678 + 1.0;
    int _2682 = _2672;
    if (!_2612)
    {
        int _2684 = ~_2628;
        int _2686 = _2684 + 1;
        _2682 = _2686;
    }
    int _2688 = _2682;
    float _2690 = 1.0 / _2552;
    bool _2692 = _2626 > 0.0;
    bool _2694 = _2626 >= 0.0;
    bool _2696 = isnan(_2626);
    bool _2698 = _2694 || _2696;
    bool _2700 = isnan(0.0);
    bool _2702 = _2698 || _2700;
    float _2704 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2706 = _783 + _2704;
    bool _2708 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2710 = isnan(_783);
    bool _2712 = _2708 || _2710;
    bool _2714 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2716 = _2712 || _2714;
    float _2718 = float(_2716);
    float _2720 = 1.0 / _2620;
    float _2722 = _2576 * _2664;
    float _2724 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2726 = _2724 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _2728 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2730 = isnan(_783);
    bool _2732 = _2728 || _2730;
    bool _2734 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2736 = _2732 || _2734;
    float _2738 = float(_2736);
    float _2740 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2742 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2740;
    float _2744 = _2718 * _2680;
    bool _2746 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2748 = isnan(_783);
    bool _2750 = _2746 || _2748;
    bool _2752 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2754 = _2750 || _2752;
    float _2756 = float(_2754);
    float _2758 = 1.0 / _2616;
    float _2760 = fma(_2722, _2706, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2762 = _2726 * _2690;
    float _2764 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2766 = _783 + _2764;
    float _2768 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2770 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2768;
    float _2772 = -_2718;
    float _2774 = _2772 + 1.0;
    bool _2776 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2778 = isnan(_783);
    bool _2780 = _2776 || _2778;
    bool _2782 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2784 = _2780 || _2782;
    float _2786 = float(_2784);
    float _2788 = fma(_2630, _2766, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2790 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2792 = _783 + _2790;
    float _2794 = _2742 * _2720;
    float _2796 = _2738 * _2774;
    float _2798 = -_2738;
    float _2800 = _2798 + 1.0;
    float _2802 = in.m_64.w;
    float _2804 = fma(_2762, _2792, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2806 = -_2786;
    float _2808 = _2806 + 1.0;
    float _2810 = _2786 * _2800;
    float _2812 = _2770 * _2758;
    float _2814 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2816 = _783 + _2814;
    float _2818 = in.m_68.w;
    float _2820 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2822 = _783 + _2820;
    int _2824 = _1944 >> 31;
    float _2826 = fma(_2598, _2816, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2828 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2830 = isnan(_783);
    bool _2832 = _2828 || _2830;
    bool _2834 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2836 = _2832 || _2834;
    float _2838 = float(_2836);
    float _2840 = fma(_2812, _2822, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _2842 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2844 = isnan(_783);
    bool _2846 = _2842 || _2844;
    bool _2848 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2850 = _2846 || _2848;
    float _2852 = float(_2850);
    float _2854 = -_2756;
    float _2856 = _2854 + 1.0;
    int _2858 = _2824 & 3;
    float _2860 = _2838 * _2808;
    bool _2862 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2864 = isnan(_783);
    bool _2866 = _2862 || _2864;
    bool _2868 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2870 = _2866 || _2868;
    float _2872 = float(_2870);
    float _2874 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2876 = _783 + _2874;
    float _2878 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2880 = _783 + _2878;
    float _2882 = -_2838;
    float _2884 = _2882 + 1.0;
    float _2886 = _2852 * _2856;
    int _2888 = _1944 + _2858;
    float _2890 = fma(_2794, _2880, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2892 = _2872 * _2884;
    float _2894 = -_2872;
    float _2896 = _2894 + 1.0;
    float _2898 = _2826 * _2886;
    float _2900 = in.m_66.w;
    int _2902 = _2888 >> 2;
    float _2904 = -_2852;
    float _2906 = _2904 + 1.0;
    float _2908 = _2350 + _2802;
    float _2910 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2912 = _2346 + _2910;
    int _2914 = _2902 << 4;
    int _2916 = _2914 + 656;
    float _2918 = _2756 * _2896;
    float _2920 = fma(_2906, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2898);
    float _2922 = fma(_2666, _2876, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2924 = _2498 + _2818;
    float _2926 = _2912 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2928 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2930 = _2908 + _2928;
    uint _2932 = uint(int(uint(_2916) >> uint(2)));
    uint _2934 = uint(int(uint(int(_2932)) >> uint(2)));
    int _2936 = int(_2932) & 3;
    float _2938 = (*spvDescriptorSet0.vp_c9)._m0[int(_2934)][_2936];
    int _2940 = int(_2932) + 1;
    uint _2942 = uint(int(uint(_2940) >> uint(2)));
    int _2944 = _2940 & 3;
    float _2946 = (*spvDescriptorSet0.vp_c9)._m0[int(_2942)][_2944];
    float _2948 = fma(_2760, _2918, _2920);
    float _2950 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2952 = _2924 + _2950;
    float _2954 = fma(_2930, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2926);
    int _2956 = _2702 ? 0 : 1;
    float _2958 = fma(_2788, _2892, _2948);
    bool _2960 = _1962 != 3;
    float _2962 = fma(_2952, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2954);
    int _2964 = ~_2956;
    int _2966 = _2964 + 1;
    int _2968 = _2966 + 1;
    float _2970 = fma(_2804, _2860, _2958);
    int _2972 = _2968;
    float _2974 = _2810;
    if (!_2692)
    {
        int _2976 = ~_2956;
        int _2978 = _2976 + 1;
        _2972 = _2978;
    }
    int _2980 = _2972;
    float _2982 = _970 + _962;
    int _2984 = _2916 + 8;
    uint _2986 = uint(int(uint(_2984) >> uint(2)));
    uint _2988 = uint(int(uint(int(_2986)) >> uint(2)));
    int _2990 = int(_2986) & 3;
    float _2992 = (*spvDescriptorSet0.vp_c9)._m0[int(_2988)][_2990];
    int _2994 = int(_2986) + 1;
    uint _2996 = uint(int(uint(_2994) >> uint(2)));
    int _2998 = _2994 & 3;
    float _3000 = (*spvDescriptorSet0.vp_c9)._m0[int(_2996)][_2998];
    bool _3002 = _2962 >= 0.0;
    float _3004 = _2308 + _2900;
    float _3006 = _2982 + (-1.0);
    float _3008 = fma(_2840, _2810, _2970);
    float _3010 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3012 = _3004 + _3010;
    float _3014 = _962 + _984;
    float _3016 = fma(_3006, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3018 = _2930 * _2930;
    float _3020 = _962 + (-0.5);
    float _3022 = _970 + _984;
    float _3024 = _970 + (-0.5);
    float _3026 = fma(_3012, _3012, _3018);
    if (_3002)
    {
        _2974 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3028 = _2974;
    float _3030 = _1788 + 0.5;
    float _3032 = fma(_2952, _2952, _3026);
    float _3034 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3036 = int(_3034);
    int _3038 = as_type<int>(_3028);
    if (_3002)
    {
        float _3040 = _3028 * 5.0;
        _3038 = as_type<int>(_3040);
    }
    int _3042 = _3038;
    float _3044 = fma(_3030, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2432);
    int _3046 = abs(_2634);
    float _3048 = _2372 + 0.5;
    if (_3002)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9667 = as_type<float>(_3042);
        out.gl_Position.z = _9667;
    }
    float _3050 = _1968 + (-0.5);
    float _3052 = sqrt(_3032);
    int _3054 = ~_2188;
    int _3056 = _3054 + 1;
    int _3058 = _3056 + 1;
    float _3060 = fma(_3048, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2426);
    bool _3062 = !_2960;
    int _3064 = _3062 ? 0 : (-1);
    float _3066 = -_3050;
    float _3068 = -_2328;
    float _3070 = fma(_3066, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3068);
    int _3072 = abs(_2088);
    float _3074 = fma(_2922, _2796, _3008);
    int _3076 = abs(_3064);
    float _3078 = rsqrt(_3032);
    bool _3080 = !_2642;
    int _3082 = _3080 ? 0 : 1;
    int _3084 = _3058 * as_type<int>(_2946);
    float _3086 = _1016 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _3088 = float(uint(_3036));
    float _3090 = fma(_2890, _2744, _3074);
    int _3092 = ~_3046;
    int _3094 = _3092 + 1;
    int _3096 = _3094 + 1;
    float _3098 = _3052 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _3100 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3102 = ~_3072;
    int _3104 = _3102 + 1;
    int _3106 = _3104 + 1;
    float _3108 = fma(_2662, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3090);
    int _3110 = _3096 * as_type<int>(_2938);
    int _3112 = _3110 + _3084;
    float _3114 = precise::min(_3086, _3098);
    float _3116 = fma(_2912, _2912, _3018);
    int _3118 = _3106 * as_type<int>(_2992);
    int _3120 = _3118 + _3112;
    int _3122 = abs(_2100);
    float _3124 = 1.0 / _3088;
    int _3126 = ~_3076;
    int _3128 = _3126 + 1;
    int _3130 = _3128 + 1;
    out.m_80.w = _3114;
    int _3132 = ~_3122;
    int _3134 = _3132 + 1;
    int _3136 = _3134 + 1;
    float _3138 = fma(_2952, _2952, _3116);
    int _3140 = abs(_3036);
    int _3142 = _3130 * as_type<int>(_3000);
    int _3144 = _3142 + _3120;
    float _3146 = -_2546;
    float _3148 = fma(_3146, _1788, _3044);
    float _3150 = _3100 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3152 = _1730 + 0.5;
    int _3154 = _3144 * _3136;
    float _3156 = fma(_2558, _1960, _2532);
    float _3158 = _3078 * _3114;
    float _3160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3162 = _2218 * _3122;
    int _3164 = _3162 + _3154;
    float _3166 = float(uint(_3140));
    float _3168 = fma(_3150, _3152, _2488);
    int _3170 = as_type<int>(_3124) + (-2);
    out.m_82.x = _3148;
    out.m_82.y = _3156;
    float _3172 = float(uint(_3164));
    float _3174 = _3012 * _3158;
    float _3176 = 1.0 / _3166;
    int _3178 = _2106 >> 31;
    float _3180 = _2930 * _3158;
    float _3182 = as_type<float>(_3170) * _3172;
    int _3184 = abs(_3164);
    float _3186 = -_3174;
    float _3188 = _3012 + _3186;
    int _3190 = ~_3036;
    int _3192 = _3190 + 1;
    float _3194 = _1512 + (-0.5);
    float _3196 = trunc(_3182);
    float _3198 = precise::max(_3196, 0.0);
    uint _3200 = uint(_3198);
    float _3202 = _3160 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3204 = _1762 >> 31;
    float _3206 = _3188 * _3188;
    int _3208 = _3178 & 3;
    float _3210 = -_3202;
    float _3212 = -_2490;
    float _3214 = fma(_3210, _3194, _3212);
    int _3216 = _3204 & 3;
    float _3218 = -_3180;
    float _3220 = _2930 + _3218;
    int _3222 = as_type<int>(_3176) + (-2);
    float _3224 = _2952 * _3158;
    float _3226 = float(uint(_3184));
    float _3228 = fma(_3220, _3220, _3206);
    int _3230 = _1762 + _3216;
    float _3232 = -_3224;
    float _3234 = _2952 + _3232;
    int _3236 = _2106 + _3208;
    float _3238 = as_type<float>(_3222) * _3226;
    int _3240 = _3192 * int(_3200);
    int _3242 = _3240 + _3164;
    int _3244 = _3230 >> 2;
    float _3246 = fma(_3234, _3234, _3228);
    int _3248 = _3236 >> 2;
    float _3250 = trunc(_3238);
    float _3252 = precise::max(_3250, 0.0);
    uint _3254 = uint(_3252);
    float _3256 = float(uint(_3242));
    float _3258 = -_2482;
    float _3260 = _3258 + 1.0;
    int _3262 = _3244 << 4;
    int _3264 = _3262 + 368;
    float _3266 = fma(_1512, _2580, _3214);
    int _3268 = _3248 << 4;
    int _3270 = _3268 + 800;
    float _3272 = as_type<float>(_3170) * _3256;
    int _3274 = ~_3140;
    int _3276 = _3274 + 1;
    uint _3278 = uint(int(uint(_3264) >> uint(2)));
    uint _3280 = uint(int(uint(int(_3278)) >> uint(2)));
    int _3282 = int(_3278) & 3;
    float _3284 = (*spvDescriptorSet0.vp_c9)._m0[int(_3280)][_3282];
    int _3286 = int(_3278) + 1;
    uint _3288 = uint(int(uint(_3286) >> uint(2)));
    int _3290 = _3286 & 3;
    float _3292 = (*spvDescriptorSet0.vp_c9)._m0[int(_3288)][_3290];
    float _3294 = -_3260;
    float _3296 = fma(_2372, _3294, _3060);
    float _3298 = -_2442;
    float _3300 = _3298 + 1.0;
    float _3302 = -_2480;
    float _3304 = _3302 + 1.0;
    int _3306 = abs(_3082);
    float _3308 = -_3300;
    float _3310 = fma(_1730, _3308, _3168);
    float _3312 = trunc(_3272);
    float _3314 = precise::max(_3312, 0.0);
    uint _3316 = uint(_3314);
    uint _3318 = uint(int(uint(_3270) >> uint(2)));
    uint _3320 = uint(int(uint(int(_3318)) >> uint(2)));
    int _3322 = int(_3318) & 3;
    float _3324 = (*spvDescriptorSet0.vp_c9)._m0[int(_3320)][_3322];
    int _3326 = int(_3318) + 1;
    uint _3328 = uint(int(uint(_3326) >> uint(2)));
    int _3330 = _3326 & 3;
    float _3332 = (*spvDescriptorSet0.vp_c9)._m0[int(_3328)][_3330];
    int _3334 = _3276 * int(_3254);
    int _3336 = _3334 + _3184;
    float _3338 = fma(_1968, _3304, _3070);
    out.m_84.x = _3108;
    int _3340 = ~_3036;
    int _3342 = _3340 + 1;
    float _3344 = float(uint(_3336));
    out.m_86.x = _3296;
    out.m_86.y = _3338;
    out.m_86.z = _3310;
    out.m_86.w = _3266;
    float _3346 = float(_2980);
    float _3348 = sqrt(_3246);
    float _3350 = float(_3306);
    float _3352 = as_type<float>(_3222) * _3344;
    bool _3354 = !_2122;
    int _3356 = _3354 ? 0 : 1;
    if (_3002)
    {
        out.m_57.x = 0.0;
    }
    int _3358 = int(_3200) + int(_3316);
    float _3360 = _3350 * _3346;
    float _3362 = trunc(_3352);
    float _3364 = precise::max(_3362, 0.0);
    uint _3366 = uint(_3364);
    bool _3368 = _1804 != 3;
    float _3370 = _3360 * (-2.0);
    int _3372 = ~_3140;
    int _3374 = _3372 + 1;
    int _3376 = _3264 + 8;
    uint _3378 = uint(int(uint(_3376) >> uint(2)));
    uint _3380 = uint(int(uint(int(_3378)) >> uint(2)));
    int _3382 = int(_3378) & 3;
    float _3384 = (*spvDescriptorSet0.vp_c9)._m0[int(_3380)][_3382];
    int _3386 = int(_3378) + 1;
    uint _3388 = uint(int(uint(_3386) >> uint(2)));
    int _3390 = _3386 & 3;
    float _3392 = (*spvDescriptorSet0.vp_c9)._m0[int(_3388)][_3390];
    int _3394 = _3342 * _3358;
    int _3396 = _3394 + _3164;
    bool _3398 = !_3368;
    int _3400 = _3398 ? 0 : (-1);
    int _3402 = abs(_2676);
    float _3404 = rsqrt(_3138);
    bool _3406 = uint(_3396) >= uint(_3036);
    float _3408 = _3078 * _3348;
    int _3410 = _3270 + 8;
    uint _3412 = uint(int(uint(_3410) >> uint(2)));
    uint _3414 = uint(int(uint(int(_3412)) >> uint(2)));
    int _3416 = int(_3412) & 3;
    float _3418 = (*spvDescriptorSet0.vp_c9)._m0[int(_3414)][_3416];
    int _3420 = int(_3412) + 1;
    uint _3422 = uint(int(uint(_3420) >> uint(2)));
    int _3424 = _3420 & 3;
    float _3426 = (*spvDescriptorSet0.vp_c9)._m0[int(_3422)][_3424];
    int _3428 = ~_3402;
    int _3430 = _3428 + 1;
    int _3432 = _3430 + 1;
    bool _3434 = !_3406;
    int _3436 = _3434 ? 0 : (-1);
    float _3438 = _1016 * _3408;
    int _3440 = int(_3254) + int(_3366);
    bool _3442 = _2120 != 3;
    int _3444 = ~_3358;
    int _3446 = _3444 + _3436;
    int _3448 = _3446 + 1;
    int _3450 = _3374 * _3440;
    int _3452 = _3450 + _3184;
    bool _3454 = _801 == 0;
    int _3456 = _2306 * as_type<int>(_3292);
    float _3458 = _3438 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _3460 = !_1570;
    int _3462 = _3460 ? _2248 : (-1);
    int _3464 = _3432 * as_type<int>(_3284);
    int _3466 = _3464 + _3456;
    int _3468 = abs(_1936);
    int _3470 = _2260 * as_type<int>(_3332);
    bool _3472 = !_3442;
    int _3474 = _3472 ? 0 : (-1);
    int _3476 = _3036 * _3448;
    int _3478 = _3476 + _3164;
    bool _3480 = uint(_3452) >= uint(_3140);
    float _3482 = _3458 * _3404;
    int _3484 = ~_3468;
    int _3486 = _3484 + 1;
    int _3488 = _3486 + 1;
    bool _3490 = !_3480;
    int _3492 = _3490 ? 0 : (-1);
    float _3494 = _2912 * _3482;
    bool _3496 = _3036 == 0;
    float _3498 = _2930 * _3482;
    int _3500 = abs(_3356);
    float _3502 = -_3494;
    float _3504 = _2912 + _3502;
    bool _3506 = !_3496;
    int _3508 = _3506 ? _3478 : (-1);
    float _3510 = -_3498;
    float _3512 = _2930 + _3510;
    bool _3514 = _3036 == 0;
    float _3516 = _3504 * _3504;
    int _3518 = _3164 ^ _3036;
    int _3520 = ~_3492;
    int _3522 = _3440 + _3520;
    int _3524 = _3522 + 1;
    float _3526 = fma(_3512, _3512, _3516);
    uint _3528 = uint(int(uint(_3518) >> uint(31)));
    int _3530 = _3488 * as_type<int>(_3384);
    int _3532 = _3530 + _3466;
    int _3534 = abs(_3400);
    float _3536 = _2952 * _3482;
    int _3538 = abs(_2200);
    int _3540 = abs(_2006);
    float _3542 = -_3536;
    float _3544 = _2952 + _3542;
    int _3546 = ~int(_3528);
    int _3548 = _3546 + 1;
    float _3550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3552 = ~_3500;
    int _3554 = _3552 + 1;
    int _3556 = _3554 + 1;
    float _3558 = fma(_3544, _3544, _3526);
    int _3560 = ~_3534;
    int _3562 = _3560 + 1;
    int _3564 = _3562 + 1;
    int _3566 = _3524 ^ _3548;
    int _3568 = _3556 * as_type<int>(_3324);
    int _3570 = _3568 + _3470;
    int _3572 = abs(_3474);
    int _3574 = _3564 * as_type<int>(_3392);
    int _3576 = _3574 + _3532;
    int _3578 = ~_3538;
    int _3580 = _3578 + 1;
    int _3582 = _3580 + 1;
    float _3584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3586 = ~_3548;
    int _3588 = _3586 + _3566;
    int _3590 = _3588 + 1;
    int _3592 = ~_3540;
    int _3594 = _3592 + 1;
    int _3596 = _3594 + 1;
    int _3598 = _3582 * as_type<int>(_3418);
    int _3600 = _3598 + _3570;
    int _3602 = ~_3572;
    int _3604 = _3602 + 1;
    int _3606 = _3604 + 1;
    bool _3608 = !_3514;
    int _3610 = _3608 ? _3590 : (-1);
    int _3612 = _3576 * _3596;
    float _3614 = sqrt(_3558);
    int _3616 = _3606 * as_type<int>(_3426);
    int _3618 = _3616 + _3600;
    float _3620 = float(_3610);
    float _3622 = _3550 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3624 = ~_2314;
    int _3626 = _3624 + 1;
    int _3628 = _3626 + 1;
    float _3630 = _1146 + 0.5;
    bool _3632 = !_3454;
    int _3634 = _3632 ? _2254 : (-1);
    float _3636 = -_2508;
    float _3638 = fma(_3622, _3620, _3636);
    float _3640 = _1168 + (-0.5);
    int _3642 = _3618 * _3628;
    float _3644 = float(_3508);
    float _3646 = _3584 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3648 = _3634 * _3540;
    int _3650 = _3648 + _3612;
    float _3652 = -_3622;
    float _3654 = fma(_3652, _3640, _3638);
    int _3656 = _3462 * _2314;
    int _3658 = _3656 + _3642;
    float _3660 = fma(_3646, _3644, _2494);
    float _3662 = in.m_88.x;
    float _3664 = in.m_88.y;
    float _3666 = in.m_88.z;
    float _3668 = _3404 * _3614;
    float _3670 = float(_3650);
    float _3672 = fma(_3646, _3630, _3660);
    bool _3674 = !_2646;
    int _3676 = _3674 ? 0 : 1;
    float _3678 = _3438 * _3668;
    float _3680 = float(_2606);
    float _3682 = -_2584;
    float _3684 = fma(_1146, _3682, _3672);
    float _3686 = float(_3658);
    float _3688 = fma(_1168, _2638, _3654);
    int _3690 = abs(_3676);
    out.m_90.x = _3670;
    bool _3692 = !_2650;
    int _3694 = _3692 ? 0 : 1;
    float _3696 = float(_3690);
    out.m_90.w = _3686;
    out.m_92.x = _3684;
    out.m_92.y = _3688;
    out.m_94.x = _3678;
    float _3698 = _3666;
    if (_3002)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_114.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_114.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_114.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_114.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_112.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_112.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_112.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_112.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 96, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 97, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 98, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 99, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3700 = fma(_3370, _3662, _3662);
    float _3702 = -_3494;
    float _3704 = _2346 + _3702;
    float _3706 = -_3498;
    float _3708 = _2908 + _3706;
    float _3710 = fma(_3016, _3370, _3016);
    float _3712 = fma(_3020, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3700);
    float _3714 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3716 = _3704 + _3714;
    float _3718 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3720 = _3708 + _3718;
    float _3722 = _3696 * _3680;
    float _3724 = fma(_3710, _2512, _3712);
    float _3726 = _3716 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3728 = -_3536;
    float _3730 = _2924 + _3728;
    int _3732 = abs(_3694);
    float _3734 = _3022 + (-1.0);
    float _3736 = fma(_3720, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3726);
    float _3738 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3740 = _3730 + _3738;
    float _3742 = _3722 * (-2.0);
    float _3744 = float(_2688);
    float _3746 = fma(_3740, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3736);
    float _3748 = float(_3732);
    float _3750 = fma(_3734, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3752 = fma(_3742, _3664, _3664);
    float _3754 = _984 + (-0.5);
    bool _3756 = _3746 >= 0.0;
    float _3758 = _3748 * _3744;
    float _3760 = fma(_3750, _3742, _3750);
    float _3762 = fma(_3024, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3752);
    float _3764 = _3014 + (-1.0);
    float _3766 = _3758 * (-2.0);
    float _3768 = _3724 * 0.15915493667125701904296875;
    float _3770 = fma(_3760, _2512, _3762);
    float _3772 = fma(_3764, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3774 = fma(_3766, _3666, _3666);
    float _3776 = _3768 * 6.283185482025146484375;
    float _3778 = sin(_3776);
    float _3780 = _3770 * 0.15915493667125701904296875;
    float _3782 = fma(_3772, _3766, _3772);
    if (_3756)
    {
        _3698 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3784 = _3698;
    float _3786 = fma(_3754, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3774);
    int _3788 = as_type<int>(_3784);
    if (_3756)
    {
        out.m_57.x = 0.0;
    }
    float _3790 = _3768 * 6.283185482025146484375;
    float _3792 = cos(_3790);
    if (_3756)
    {
        float _3794 = _3784 * 5.0;
        _3788 = as_type<int>(_3794);
    }
    int _3796 = _3788;
    float _3798 = fma(_3782, _2512, _3786);
    if (_3756)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10765 = as_type<float>(_3796);
        out.gl_Position.z = _10765;
    }
    float _3800 = _3798 * 0.15915493667125701904296875;
    float _3802 = _3780 * 6.283185482025146484375;
    float _3804 = sin(_3802);
    float _3806 = _3780 * 6.283185482025146484375;
    float _3808 = cos(_3806);
    if (_3756)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_114.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_114.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_114.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_114.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_112.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_112.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_112.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_112.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 96, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 97, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 98, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 99, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3810 = _3800 * 6.283185482025146484375;
    float _3812 = cos(_3810);
    float _3814 = _449 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3816 = _3408 * _3668;
    float _3818 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _229);
    float _3820 = _3778 * _3804;
    float _3822 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _243);
    float _3824 = _3814 * _3816;
    float _3826 = _3792 * _3804;
    float _3828 = _3800 * 6.283185482025146484375;
    float _3830 = sin(_3828);
    float _3832 = _3678 * _3822;
    float _3834 = _3824 * _3818;
    float _3836 = _3792 * _3808;
    float _3838 = _3778 * _3808;
    float _3840 = _3792 * _3812;
    float _3842 = _3808 * _3812;
    float _3844 = _3778 * _3812;
    float _3846 = _3804 * _3812;
    float _3848 = _3840 * _3834;
    float _3850 = _3816 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3852 = _3850 * 0.5;
    float _3854 = fma(_3830, _3836, _3820);
    float _3856 = -_3838;
    float _3858 = fma(_3830, _3826, _3856);
    float _3860 = -_3834;
    float _3862 = _3830 * _3860;
    float _3864 = -_3826;
    float _3866 = fma(_3830, _3838, _3864);
    float _3868 = fma(_3854, _3832, _3848);
    float _3870 = _3844 * _3834;
    float _3872 = fma(_3842, _3832, _3862);
    float _3874 = fma(_3830, _3820, _3836);
    float _3876 = fma(_3858, _3852, _3868);
    float _3878 = fma(_3866, _3832, _3870);
    float _3880 = fma(_3846, _3852, _3872);
    float _3882 = _3876 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3884 = fma(_3874, _3852, _3878);
    float _3886 = _3876 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3888 = _3876 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3890 = fma(_3880, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3882);
    float _3892 = fma(_3880, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3886);
    float _3894 = fma(_3880, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3888);
    float _3896 = fma(_3884, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3890);
    float _3898 = fma(_3884, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3892);
    float _3900 = fma(_3884, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3894);
    float _3902 = _3896 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3904 = _3898 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3906 = _3900 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3908 = _2924 + _3902;
    float _3910 = _2908 + _3904;
    float _3912 = _2346 + _3906;
    float _3914 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3916 = _3908 + _3914;
    float _3918 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3920 = _3910 + _3918;
    float _3922 = _3916 * _3916;
    float _3924 = fma(_3920, _3920, _3922);
    float _3926 = sqrt(_3924);
    bool _3928 = _3926 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3930 = _3904;
    float _3932 = _3884;
    float _3934 = _3910;
    if (!_3928)
    {
        _3930 = _3908;
    }
    float _3936 = _3930;
    float _3938 = _3936;
    if (!_3928)
    {
        _3932 = _3912;
    }
    float _3940 = _3932;
    bool _3942 = !_3928;
    float _3944 = _3940;
    if (!_3942)
    {
        float _3946 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3948 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3950 = _3926 + _3948;
        float _3952 = rsqrt(_3924);
        float _3954 = _3950 * _3946;
        float _3956 = _3912 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3958 = _3954 * 0.15915493667125701904296875;
        float _3960 = _3958 * 6.283185482025146484375;
        float _3962 = cos(_3960);
        float _3964 = _3958 * 6.283185482025146484375;
        float _3966 = sin(_3964);
        float _3968 = _3962 + (-1.0);
        float _3970 = _3968 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3972 = fma(_3966, _3956, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3974 = fma(_3912, _3962, _3970);
        float _3976 = _3952 * _3972;
        float _3978 = fma(_3920, _3976, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3980 = fma(_3916, _3976, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3934 = _3978;
        _3938 = _3980;
        _3944 = _3974;
    }
    float _3982 = _3934;
    float _3984 = _3938;
    float _3986 = _3944;
    float _3988 = fma(_3982, 6.2500002968590706586837768554688e-05, 0.5);
    float _3990 = fma(_3984, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _11082 = float2(_3988, _3990);
    float3 _3994 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_11082, float2(0.0), isnan(_11082)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_11082, float2(0.0), isnan(_11082)), level(0.0)).xyz;
    float _3996 = _3994.x;
    float _3998 = _3994.y;
    float _4000 = _3994.z;
    float _4002 = _3854 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4004 = _3854 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4006 = _3854 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4008 = _3840 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4010 = fma(_3842, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4002);
    float _4012 = fma(_3842, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4004);
    float _4014 = _3840 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4016 = _3840 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4018 = fma(_3842, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4006);
    float _4020 = -_3830;
    float _4022 = fma(_4020, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4008);
    float _4024 = -_3830;
    float _4026 = fma(_4024, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4014);
    float _4028 = -_3830;
    float _4030 = fma(_4028, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4016);
    float _4032 = _3858 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4034 = _3858 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4036 = _3858 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4038 = _229 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4040 = fma(_3846, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4032);
    float _4042 = -_3180;
    float _4044 = _2908 + _4042;
    float _4046 = fma(_3846, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4036);
    float _4048 = fma(_4038, _4038, 1.0);
    float _4050 = -_3174;
    float _4052 = _4050 + _2346;
    float _4054 = -_3174;
    float _4056 = _4054 + _3986;
    float _4058 = -_3180;
    float _4060 = _4058 + _3982;
    float _4062 = rsqrt(_4048);
    float _4064 = fma(_3846, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4034);
    float _4066 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4068 = _4056 + _4066;
    float _4070 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4072 = _4060 + _4070;
    float _4074 = -_3224;
    float _4076 = _4074 + _3984;
    float _4078 = fma(_3844, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4026);
    float _4080 = _4068 * _4068;
    float _4082 = fma(_3844, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4030);
    float _4084 = fma(_3844, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4022);
    float _4086 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4088 = _4076 + _4086;
    float _4090 = fma(_4072, _4072, _4080);
    float _4092 = fma(_3874, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4040);
    float _4094 = fma(_3874, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4064);
    float _4096 = fma(_3874, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4046);
    float _4098 = fma(_4088, _4088, _4090);
    float _4100 = fma(_3866, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4010);
    float _4102 = _4038 * _4062;
    float _4104 = fma(_3866, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4012);
    float _4106 = _243 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4108 = _4038 * _4078;
    float _4110 = _4038 * _4082;
    float _4112 = fma(_3866, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4018);
    float _4114 = _4038 * _4084;
    float _4116 = -_4092;
    float _4118 = _4102 * _4116;
    float _4120 = -_4094;
    float _4122 = _4102 * _4120;
    float _4124 = -_4096;
    float _4126 = _4102 * _4124;
    float _4128 = sqrt(_4098);
    float _4130 = fma(_4106, _4100, _4108);
    float _4132 = fma(_4106, _4104, _4110);
    float _4134 = fma(_4106, _4112, _4114);
    float _4136 = fma(_4062, _4078, _4118);
    float _4138 = fma(_4062, _4082, _4122);
    float _4140 = _4092 + _4130;
    float _4142 = fma(_4062, _4084, _4126);
    float _4144 = _4094 + _4132;
    float _4146 = _4096 + _4134;
    out.m_96.x = _4100;
    out.m_96.y = _4104;
    out.m_96.z = _4112;
    float _4148 = -_3224;
    float _4150 = _2924 + _4148;
    out.m_98.x = _4136;
    out.m_98.y = _4138;
    out.m_98.z = _4142;
    bool _4152 = _4128 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4154 = isnan(_4128);
    bool _4156 = _4152 || _4154;
    bool _4158 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4160 = _4156 || _4158;
    out.m_100.x = _4140;
    out.m_100.y = _4144;
    out.m_100.z = _4146;
    float _4162 = _4130;
    float _4164 = _4118;
    if (!_4160)
    {
        _4162 = 1.0;
    }
    float _4166 = _4162;
    out.m_102.x = _3996;
    out.m_102.y = _3998;
    out.m_102.z = _4000;
    bool _4168 = !_4160;
    float _4170 = _4166;
    if (!_4168)
    {
        bool _4172 = _4128 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4174 = isnan(_4128);
        bool _4176 = _4172 || _4174;
        bool _4178 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4180 = _4176 || _4178;
        if (!_4180)
        {
            float _4182 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4184 = _4128 + _4182;
            float _4186 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4188 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4186;
            float _4190 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4192 = _4190 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4194 = 1.0 / _4188;
            float _4196 = _4184 * _4194;
            float _4198 = fma(_4196, _4192, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4170 = _4198;
            _4200 = true;
        }
        else
        {
            bool _4202 = _4128 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4204 = isnan(_4128);
            bool _4206 = _4202 || _4204;
            bool _4208 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4210 = _4206 || _4208;
            if (!_4210)
            {
                float _4212 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4214 = _4128 + _4212;
                float _4216 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4218 = _4216 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4220 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4222 = _4220 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4224 = 1.0 / _4218;
                float _4226 = _4214 * _4224;
                float _4228 = fma(_4226, _4222, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4170 = _4228;
                _4200 = true;
            }
            else
            {
                _4170 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4200 = false;
    float _4230 = _4170;
    float _4232 = -_3494;
    float _4234 = _4232 + _4052;
    float _4236 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4238 = _4056 + _4236;
    float _4240 = -_3498;
    float _4242 = _4240 + _4044;
    float _4244 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4246 = _4060 + _4244;
    float _4248 = _4234 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4250 = fma(_4238, _4230, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4252 = -_3536;
    float _4254 = _4252 + _4150;
    float _4256 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4258 = _4076 + _4256;
    float _4260 = fma(_4242, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4248);
    float _4262 = fma(_4246, _4230, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4264 = -_4052;
    float _4266 = _4264 + _4250;
    float _4268 = fma(_4258, _4230, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4270 = fma(_4254, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4260);
    float _4272 = -_4044;
    float _4274 = _4272 + _4262;
    float _4276 = _4266 * _4266;
    float _4278 = -_4150;
    float _4280 = _4278 + _4268;
    float _4282 = _4270 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4284 = _4234 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4286 = fma(_4274, _4274, _4276);
    float _4288 = 1.0 / _4282;
    float _4290 = fma(_4242, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4284);
    float _4292 = fma(_4280, _4280, _4286);
    float _4294 = fma(_4254, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4290);
    float _4296 = sqrt(_4292);
    float _4298 = _4294 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4300 = _4298 + _4282;
    float _4302 = _4300 * _4288;
    float _4304 = _4302 * 0.5;
    bool _4306 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4308 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4310 = _4306 || _4308;
    bool _4312 = isnan(0.5);
    bool _4314 = _4310 || _4312;
    float _4316 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4318 = fma(_4304, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4316);
    bool _4320 = _4296 > 0.0;
    float _4322 = 1.0 / _4318;
    bool _4324 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4326 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4328 = _4324 || _4326;
    bool _4330 = isnan(0.5);
    bool _4332 = _4328 || _4330;
    float _4334 = _4288;
    float _4336 = _4262;
    float _4338 = _4274;
    float _4340 = _4266;
    float _4342 = _4254;
    float _4344 = _4234;
    if (!_4320)
    {
        _4334 = _4250;
    }
    float _4346 = _4334;
    float _4348 = _4346;
    float _4350 = _4346;
    if (!_4320)
    {
        _4164 = _4268;
    }
    float _4352 = _4164;
    bool _4354 = !_4320;
    float _4356 = _4352;
    float _4358 = _4352;
    if (!_4354)
    {
        float _4360 = _249 * _249;
        float _4362 = fma(_247, _247, _4360);
        float _4364 = fma(_251, _251, _4362);
        float _4366 = rsqrt(_4292);
        float _4368 = sqrt(_4364);
        float _4370 = _4274 * _4366;
        float _4372 = _4266 * _4366;
        float _4374 = _4280 * _4366;
        bool _4376 = _4368 > 0.0;
        if (!_4376)
        {
            _4348 = _4250;
        }
        float _4378 = _4348;
        _4350 = _4378;
        if (!_4376)
        {
            _4356 = _4268;
        }
        float _4380 = _4356;
        bool _4382 = !_4376;
        _4358 = _4380;
        if (!_4382)
        {
            float _4384 = rsqrt(_4364);
            float _4386 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4388 = _249 * _4384;
            float _4390 = _247 * _4384;
            float _4392 = _251 * _4384;
            float _4394 = _4372 * _4388;
            float _4396 = fma(_4370, _4390, _4394);
            float _4398 = _4386 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4400 = fma(_4374, _4392, _4396);
            float _4402 = _4400 * _4398;
            float _4404 = fma(_247, _4402, _4262);
            float _4406 = fma(_249, _4402, _4250);
            float _4408 = fma(_251, _4402, _4268);
            _4336 = _4404;
            _4350 = _4406;
            _4358 = _4408;
            _4338 = _4396;
        }
    }
    float _4410 = _4336;
    float _4412 = _4350;
    float _4414 = _4358;
    float _4416 = _4338;
    float _4418 = -_3498;
    float _4420 = _4418 + _4410;
    float _4422 = -_3494;
    float _4424 = _4422 + _4412;
    float _4426 = -_3536;
    float _4428 = _4426 + _4414;
    float _4430 = _4416;
    float _4432 = _4424;
    float _4434 = _4420;
    float _4436 = _4428;
    float _4438 = _4412;
    if (_4314)
    {
        _4430 = 1.0;
    }
    float _4440 = _4430;
    float _4442 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4444 = _4322 * _4442;
    float _4446 = _4440;
    if (!_4332)
    {
        float _4448 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4450 = _4234 + _4448;
        float _4452 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4454 = _4242 + _4452;
        float _4456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4458 = -_4150;
        float _4460 = _4458 + _4414;
        float _4462 = _4450 * _4450;
        float _4464 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4466 = _4254 + _4464;
        float _4468 = -_4044;
        float _4470 = _4468 + _4410;
        float _4472 = -_4052;
        float _4474 = _4472 + _4412;
        float _4476 = fma(_4454, _4454, _4462);
        float _4478 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4480 = fma(_4466, _4466, _4476);
        float _4482 = sqrt(_4480);
        float _4484 = 1.0 / _3668;
        float _4486 = _4478 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4488 = precise::min(_4482, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4490 = _4488 * _4456;
        float _4492 = _4490 * _4484;
        float _4494 = _4486 * _4492;
        float _4496 = _4460 * _4492;
        float _4498 = fma(_4470, _4494, _4242);
        float _4500 = fma(_4474, _4494, _4234);
        float _4502 = fma(_4486, _4496, _4254);
        _4432 = _4500;
        _4434 = _4498;
        _4436 = _4502;
        _4438 = _4474;
        _255 = _4486;
    }
    float _4504 = _4432;
    float _4506 = _4434;
    float _4508 = _4436;
    float _4510 = _4438;
    float _4512 = _255;
    float _4514 = _4510;
    float _4516 = _4512;
    if (!_4314)
    {
        float _4518 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4520 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4522 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4520;
        float _4524 = _4518 * 0.15915493667125701904296875;
        float _4526 = _4524 * 6.283185482025146484375;
        float _4528 = cos(_4526);
        float _4530 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4532 = _4530 * 0.15915493667125701904296875;
        float _4534 = _4524 * 6.283185482025146484375;
        float _4536 = sin(_4534);
        float _4538 = 1.0 / _4528;
        float _4540 = _4532 * 6.283185482025146484375;
        float _4542 = cos(_4540);
        float _4544 = _4536 * _4538;
        float _4546 = _4532 * 6.283185482025146484375;
        float _4548 = sin(_4546);
        float _4550 = _4542 * _4544;
        float _4552 = 1.0 / _4522;
        float _4554 = 1.0 / _4550;
        float _4556 = _4548 * _4554;
        float _4558 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4560 = fma(_4444, _4556, _4558);
        float _4562 = _4560 * _4552;
        float _4564 = precise::clamp(_4562, 0.0, 1.0);
        _4514 = _4532;
        _4516 = _4552;
        _4446 = _4564;
    }
    float _4566 = _4514;
    float _4568 = _4516;
    float _4570 = _4446;
    float _4572 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4574 = _4504 + _4572;
    float _4576 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4578 = _4506 + _4576;
    float _4580 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4582 = _4508 + _4580;
    float _4584 = _4574 * _4574;
    float _4586 = fma(_4578, _4578, _4584);
    float _4588 = fma(_4582, _4582, _4586);
    float _4590 = rsqrt(_4588);
    float _4592 = _4590 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4594 = _4578 * _4592;
    float _4596 = _4582 * _4592;
    float _4598 = _4594 * _4594;
    float _4600 = _4596 * _4596;
    float _4602 = _4598 + _4600;
    float _4604 = sqrt(_4602);
    bool _4606 = _4604 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4608 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4610 = _4604 + _4608;
    float _4612 = _4590;
    float _4614 = _4568;
    float _4616 = _4610;
    float _4618 = _4566;
    float _4620 = _4574;
    if (_4606)
    {
        float _4622 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4612 = _4622;
    }
    float _4624 = _4612;
    if (_4606)
    {
        float _4626 = rsqrt(_4602);
        _4614 = _4626;
    }
    float _4628 = _4614;
    float _4630 = _4628;
    if (_4606)
    {
        float _4632 = _4610 * _4624;
        _4616 = _4632;
    }
    float _4634 = _4616;
    if (_4606)
    {
        float _4636 = _4634 * 0.15915493667125701904296875;
        _4618 = _4636;
    }
    float _4638 = _4618;
    float _4640 = _4624;
    float _4642 = _4638;
    if (_4606)
    {
        float _4644 = _4638 * 6.283185482025146484375;
        float _4646 = cos(_4644);
        _4640 = _4646;
    }
    float _4648 = _4640;
    float _4650 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4652 = precise::max(0.0, _4650);
    float _4654 = _4582;
    float _4656 = _4652;
    if (_4606)
    {
        float _4658 = _4638 * 6.283185482025146484375;
        float _4660 = sin(_4658);
        _4654 = _4660;
    }
    float _4662 = _4654;
    float _4664 = -_4592;
    float _4666 = -_4652;
    float _4668 = fma(_4574, _4664, _4666);
    if (_4606)
    {
        float _4670 = _4668 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4620 = _4670;
    }
    float _4672 = _4620;
    float _4674 = _4672;
    float _4676 = _4648;
    if (_4606)
    {
        float _4678 = _4648 + (-1.0);
        _4656 = _4678;
    }
    float _4680 = _4656;
    float _4682 = _4680;
    if (!_4606)
    {
        _4642 = _4600;
    }
    float _4684 = _4642;
    float _4686 = _4684;
    if (_4606)
    {
        float _4688 = _4680 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4682 = _4688;
    }
    float _4690 = _4682;
    float _4692 = _4662;
    if (_4606)
    {
        float _4694 = fma(_4662, _4672, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4674 = _4694;
    }
    float _4696 = _4674;
    float _4698 = _4696;
    if (!_4606)
    {
        _4692 = _4668;
    }
    float _4700 = _4692;
    float _4702 = _4700;
    if (_4606)
    {
        float _4704 = fma(_4668, _4648, _4690);
        _4702 = _4704;
    }
    float _4706 = _4702;
    if (!_4606)
    {
        _4676 = _4598;
    }
    float _4708 = _4676;
    float _4710 = _4708;
    if (_4606)
    {
        float _4712 = _4628 * _4696;
        _4340 = _4712;
    }
    float _4714 = _4340;
    float _4716 = sqrt(_4588);
    if (!_4606)
    {
        _4630 = _4594;
    }
    float _4718 = _4630;
    float _4720 = _4718;
    if (_4606)
    {
        float _4722 = _4594 * _4714;
        _4720 = _4722;
    }
    float _4724 = _4720;
    if (!_4606)
    {
        _4698 = _4596;
    }
    float _4726 = _4698;
    float _4728 = _4726;
    if (_4606)
    {
        float _4730 = _4596 * _4714;
        _4728 = _4730;
    }
    float _4732 = _4728;
    float _4734 = fma(_4242, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_4606)
    {
        float _4736 = _4724 * _4724;
        _4710 = _4736;
    }
    float _4738 = _4710;
    float _4740 = _4504 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_4606)
    {
        float _4742 = _4732 * _4732;
        _4686 = _4742;
    }
    float _4744 = _4686;
    float _4746 = fma(_4706, _4706, _4738);
    float _4748 = fma(_4506, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4740);
    float _4750 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4752 = _4746 + _4744;
    float _4754 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4756 = fma(_4716, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4754);
    float _4758 = precise::clamp(_4756, 0.0, 1.0);
    float _4760 = fma(_4508, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4748);
    float _4762 = rsqrt(_4752);
    float _4764 = -_4758;
    float _4766 = _4764 + 1.0;
    float _4768 = _4760 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4770 = fma(_4254, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4772 = _4504 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4774 = _4768 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4776 = abs(_4766);
    float _4778 = log2(_4776);
    float _4780 = _4504 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4782 = fma(_4506, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4772);
    float _4784 = -_4774;
    float _4786 = fma(_4784, _4750, 1.0);
    float _4788 = _4504 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4790 = fma(_4506, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4780);
    float _4792 = fma(_4508, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4782);
    float _4794 = fma(_4506, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4788);
    float _4796 = fma(_4508, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4790);
    float _4798 = floor(_4734);
    float _4800 = _4762 * _4724;
    float _4802 = fma(_4508, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4794);
    float _4804 = _4796 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4806 = _4762 * _4706;
    float _4808 = _4762 * _4732;
    float _4810 = _4802 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4812 = _4804 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4814 = _4800 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4816 = _4778 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4818 = floor(_4770);
    float _4820 = fma(_4810, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4812);
    float _4822 = -_4814;
    float _4824 = fma(_4806, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4822);
    float _4826 = _4792 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4828 = fma(_4768, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4820);
    float _4830 = -_4808;
    float _4832 = fma(_4830, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4824);
    float _4834 = -_4798;
    float _4836 = _4734 + _4834;
    float _4838 = exp2(_4816);
    float _4840 = fma(_4826, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4828);
    float _4842 = fma(_4832, -0.5, 0.5);
    float _4844 = _4804 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4846 = fma(_4832, 0.5, 0.5);
    float _4848 = _4804 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4850 = fma(_4810, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4844);
    float _4852 = log2(_4786);
    float _4854 = fma(_4810, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4848);
    float _4856 = fma(_4846, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4858 = fma(_4768, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4850);
    float _4860 = -_4818;
    float _4862 = _4770 + _4860;
    float _4864 = fma(_4768, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4854);
    float _4866 = fma(_4846, _4856, -0.212114393711090087890625);
    float _4868 = 1.0 / _4840;
    float _4870 = fma(_4846, _4866, 1.570728778839111328125);
    float _4872 = sqrt(_4842);
    float _4874 = _4852 * 0.693147182464599609375;
    float _4876 = _4874 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4878 = _4806 + 1.0;
    float _4880 = -_4806;
    float _4882 = fma(_4838, _4878, _4880);
    float _4884 = fma(_4826, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4858);
    float _4886 = fma(_4826, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4864);
    float _4888 = _4872 * 0.636619746685028076171875;
    float _4890 = fma(_4882, 0.5, 0.5);
    float _4892 = _4884 * _4868;
    float _4894 = _4886 * _4868;
    float _4896 = -_4870;
    float _4898 = fma(_4888, _4896, 1.0);
    float2 _12564 = float2(_4836, _4862);
    float _4900 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12564, float2(0.0), isnan(_12564)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12564, float2(0.0), isnan(_12564)), level(0.0)).x;
    float _4902 = fma(_4892, 0.5, 0.5);
    float _4904 = fma(_4894, -0.5, 0.5);
    float3 _12577 = float3(_4902, _4904, _4876);
    float _4906 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12577, float3(0.0), isnan(_12577)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12577, float3(0.0), isnan(_12577)), level(0.0)).x;
    float3 _12588 = float3(_4902, _4904, _4876);
    float4 _4909 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12588, float3(0.0), isnan(_12588)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12588, float3(0.0), isnan(_12588)), level(0.0)).xyzw;
    float _4911 = _4909.x;
    float _4913 = _4909.y;
    float _4915 = _4909.z;
    float _4917 = _4909.w;
    float2 _12604 = float2(_4898, _4890);
    float3 _4919 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12604, float2(0.0), isnan(_12604)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12604, float2(0.0), isnan(_12604)), level(0.0)).xyz;
    float _4921 = _4919.x;
    float _4923 = _4919.y;
    float _4925 = _4919.z;
    float _4927 = abs(_4444);
    float _4929 = log2(_4927);
    float _4931 = _4804 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_104.x = _4242;
    out.m_104.y = _4234;
    out.m_104.z = _4254;
    bool _4933 = _4716 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4935 = isnan(_4716);
    bool _4937 = _4933 || _4935;
    bool _4939 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4941 = _4937 || _4939;
    float _4943 = fma(_4810, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4931);
    float _4945 = _4840 * 0.5;
    out.m_106.x = _4506;
    out.m_106.y = _4504;
    out.m_106.z = _4508;
    float _4947 = fma(_4768, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4943);
    float _4949 = in.m_78.x;
    float _4951 = fma(_4826, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4947);
    float _4953 = fma(_4886, -0.5, _4945);
    float _4955 = _4929 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4957 = _4951 + _4840;
    out.gl_Position.x = _4884;
    out.gl_Position.y = _4886;
    out.gl_Position.z = _4951;
    out.gl_Position.w = _4840;
    float _4959 = _4886;
    float _4961 = _4884;
    if (!_4941)
    {
        _4342 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4963 = _4342;
    float _4965 = exp2(_4955);
    float _4967 = _4957 * 0.5;
    float _4969 = _4963;
    float _4971 = _4963;
    if (!_4941)
    {
        _4344 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4973 = _4344;
    float _4975 = _4973;
    float _4977 = _4973;
    if (!_4941)
    {
        _4959 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4979 = _4959;
    float _4981 = fma(_4965, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4983 = precise::clamp(_4981, 0.0, 1.0);
    float _4985 = _4778 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _4987 = _4444 <= 8000.0;
    bool _4989 = isnan(_4444);
    bool _4991 = _4987 || _4989;
    bool _4993 = isnan(8000.0);
    bool _4995 = _4991 || _4993;
    float _4997 = float(_4995);
    float _4999 = _4884 + _4840;
    float _5001 = fma(_4983, -2.0, 3.0);
    float _5003 = _4983 * _4983;
    float _5005 = _4999;
    float _5007 = _4979;
    float _5009 = _4979;
    if (!_4941)
    {
        _4961 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5011 = _4961;
    float _5013 = exp2(_4985);
    float _5015 = _4999 * 0.5;
    float _5017 = _5003 * _5001;
    float _5019 = _5011;
    float _5021 = _5011;
    if (!_4941)
    {
        _5005 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5023 = _5005;
    float _5025 = -_5017;
    float _5027 = _5025 + 1.0;
    float _5029 = fma(_5027, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5017);
    float _5031 = _4570 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5033 = _4997 * _5029;
    float _5035 = -_5013;
    float _5037 = _5035 + 1.0;
    out.m_108.x = _5015;
    out.m_108.y = _4953;
    out.m_108.z = _4967;
    out.m_108.w = _4840;
    float _5039 = _5033 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5041 = _5037 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5043 = -_5041;
    float _5045 = _5043 + 1.0;
    float _5047 = -_4900;
    float _5049 = _5047 + 1.0;
    float _5051 = _5049 * _5039;
    float _5053 = precise::clamp(_5051, 0.0, 1.0);
    float _5055 = _5041 * _4906;
    float _5057 = _4917 * _5045;
    float _5059 = -_5053;
    float _5061 = fma(_5059, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5063 = _5045;
    float _5065 = _5023;
    float _5067 = _5023;
    if (!_4941)
    {
        _5063 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5069 = _5063;
    float _5071 = _4917 * _5055;
    float _5073 = _4925 * _5055;
    float _5075 = _5061 * _4949;
    float _5077 = fma(_4921, _5071, _4911);
    float _5079 = fma(_4923, _5071, _4913);
    float _5081 = _5075 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5083 = fma(_4917, _5073, _4915);
    out.m_110.x = _5081;
    out.m_112.x = _5077;
    out.m_112.y = _5079;
    out.m_112.z = _5083;
    out.m_112.w = _5057;
    bool _5085 = !_4941;
    float _5087 = _5069;
    float _5089 = _5069;
    if (!_5085)
    {
        bool _5091 = _4716 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5093 = isnan(_4716);
        bool _5095 = _5091 || _5093;
        bool _5097 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5099 = _5095 || _5097;
        if (!_5099)
        {
            float _5101 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5103 = _4716 + _5101;
            float _5105 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5107 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5105;
            float _5109 = 1.0 / _5107;
            float _5111 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5113 = _5111 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5115 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5117 = _5115 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5119 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5121 = _5119 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5123 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5125 = _5123 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5127 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5129 = _5127 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5131 = _5103 * _5109;
            float _5133 = precise::clamp(_5131, 0.0, 1.0);
            float _5135 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5137 = _5135 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5139 = fma(_5133, _5113, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5141 = fma(_5133, _5137, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5143 = fma(_5133, _5117, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5145 = fma(_5133, _5121, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5147 = fma(_5133, _5125, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5149 = fma(_5133, _5129, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5009 = _5141;
            _5089 = _5147;
            _5021 = _5139;
            _4977 = _5145;
            _4971 = _5143;
            _5067 = _5149;
            _5151 = true;
        }
        else
        {
            bool _5153 = _4716 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5155 = isnan(_4716);
            bool _5157 = _5153 || _5155;
            bool _5159 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5161 = _5157 || _5159;
            if (!_5161)
            {
                _5019 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5163 = _5019;
            _5021 = _5163;
            if (!_5161)
            {
                _5007 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5165 = _5007;
            _5009 = _5165;
            if (!_5161)
            {
                _4969 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5167 = _4969;
            _4971 = _5167;
            if (!_5161)
            {
                _4975 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5169 = _4975;
            _4977 = _5169;
            if (!_5161)
            {
                _5087 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5171 = _5087;
            _5089 = _5171;
            if (!_5161)
            {
                _5065 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5173 = _5065;
            bool _5175 = !_5161;
            _5067 = _5173;
            if (!_5175)
            {
                bool _5177 = _4716 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5179 = isnan(_4716);
                bool _5181 = _5177 || _5179;
                bool _5183 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5185 = _5181 || _5183;
                if (!_5185)
                {
                    float _5187 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5189 = _4716 + _5187;
                    float _5191 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5193 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5191;
                    float _5195 = 1.0 / _5193;
                    float _5197 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5199 = _5197 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5201 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5203 = _5201 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5205 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5207 = _5205 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5209 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5211 = _5209 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5213 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5215 = _5213 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5217 = _5189 * _5195;
                    float _5219 = precise::clamp(_5217, 0.0, 1.0);
                    float _5221 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5223 = _5221 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5225 = fma(_5219, _5199, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5227 = fma(_5219, _5223, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5229 = fma(_5219, _5203, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5231 = fma(_5219, _5207, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5233 = fma(_5219, _5211, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5235 = fma(_5219, _5215, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5009 = _5227;
                    _5089 = _5233;
                    _5021 = _5225;
                    _4977 = _5231;
                    _4971 = _5229;
                    _5067 = _5235;
                    _5151 = true;
                }
                else
                {
                    _5009 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5089 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5021 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4977 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4971 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5067 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5151 = false;
    float _5237 = _5009;
    float _5239 = _5089;
    float _5241 = _5021;
    float _5243 = _4977;
    float _5245 = _4971;
    float _5247 = _5067;
    float _5249 = fma(_4144, -0.5, 0.5);
    float _5251 = precise::clamp(_5249, 0.0, 1.0);
    float _5253 = -_5237;
    float _5255 = _5253 + _5239;
    float _5257 = _5031 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5259 = -_5241;
    float _5261 = _5259 + _5243;
    out.m_114.x = 0.0;
    float _5263 = fma(_5251, _5255, _5237);
    float _5265 = fma(_5251, _5261, _5241);
    out.m_57.x = _5257;
    float _5267 = -_5245;
    float _5269 = _5267 + _5247;
    float _5271 = _5263 * 0.586610972881317138671875;
    bool _5273 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5275 = fma(_5251, _5269, _5245);
    float _5277 = fma(_5265, 0.298911988735198974609375, _5271);
    bool _5279 = _4570 > 0.0;
    bool _5281 = isnan(_4570);
    bool _5283 = _5279 || _5281;
    bool _5285 = isnan(0.0);
    bool _5287 = _5283 || _5285;
    float _5289 = fma(_5275, 0.114477999508380889892578125, _5277);
    float _5291 = -_5289;
    float _5293 = _5265 + _5291;
    float _5295 = -_5289;
    float _5297 = _5263 + _5295;
    float _5299 = -_5289;
    float _5301 = _5275 + _5299;
    float _5303 = fma(_5293, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5289);
    float _5305 = fma(_5297, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5289);
    float _5307 = fma(_5301, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5289);
    bool _5309 = !_5273;
    if (!_5309)
    {
        float _5311 = -_4504;
        float _5313 = _5311 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5315 = -_4506;
        float _5317 = _5315 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5319 = -_4508;
        float _5321 = _5319 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5323 = _5313 * _5313;
        float _5325 = fma(_5317, _5317, _5323);
        float _5327 = fma(_5321, _5321, _5325);
        float _5329 = sqrt(_5327);
        float _5331 = rsqrt(_5327);
        float _5333 = -_5329;
        float _5335 = _5333 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5337 = _5335 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5339 = precise::clamp(_5337, 0.0, 1.0);
        float _5341 = _5317 * _5331;
        float _5343 = _5313 * _5331;
        float _5345 = abs(_5339);
        float _5347 = log2(_5345);
        float _5349 = _5321 * _5331;
        float _5351 = _5341 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5353 = _4144 * _5343;
        float _5355 = -_5343;
        float _5357 = -_5351;
        float _5359 = fma(_5355, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5357);
        float _5361 = fma(_4140, _5341, _5353);
        float _5363 = -_5349;
        float _5365 = fma(_5363, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5359);
        float _5367 = fma(_4146, _5349, _5361);
        float _5369 = precise::clamp(_5367, 0.0, 1.0);
        float _5371 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5373 = _5365 + _5371;
        float _5375 = _5347 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5377 = _5373 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5379 = precise::clamp(_5377, 0.0, 1.0);
        float _5381 = exp2(_5375);
        float _5383 = _5381 * _5379;
        float _5385 = _5369 * _5383;
        float _5387 = _5385 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5389 = _5385 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5391 = _5385 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_114.x = _5387;
        out.m_114.y = _5389;
        out.m_114.z = _5391;
    }
    out.m_80.x = _5303;
    out.m_80.y = _5305;
    out.m_80.z = _5307;
    if (_5287)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_114.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_114.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_114.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_114.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_112.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_112.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_112.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_112.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 96, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 97, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 98, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 99, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_57.x = 0.0;
    float _5393 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5393;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_114.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_114.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_114.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_114.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_112.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_112.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_112.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_112.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 96, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 97, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 98, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 99, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

