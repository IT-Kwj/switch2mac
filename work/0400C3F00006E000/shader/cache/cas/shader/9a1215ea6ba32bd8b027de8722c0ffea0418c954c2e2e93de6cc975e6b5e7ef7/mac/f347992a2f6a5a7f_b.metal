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
    float4 m_55 [[user(locn2)]];
    float4 m_96 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_72 [[user(locn5)]];
    float4 m_88 [[user(locn6)]];
    float4 m_70 [[user(locn7)]];
    float4 m_78 [[user(locn8)]];
    float4 m_68 [[user(locn9)]];
    float4 m_76 [[user(locn10)]];
    float4 m_82 [[user(locn11)]];
    float4 m_84 [[user(locn12)]];
    float4 m_80 [[user(locn13)]];
    float4 m_94 [[user(locn14)]];
    float4 m_90 [[user(locn15)]];
    float4 m_92 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_86 [[attribute(0)]];
    float4 m_74 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_50 [[attribute(3)]];
    float4 m_60 [[attribute(4)]];
    float4 m_62 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4929 = false;
    bool _4160 = false;
    bool _605 = false;
    bool _499 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_48.w;
    float _112 = in.m_50.w;
    float _114 = trunc(_110);
    int _117 = int(_114);
    float _119 = -_112;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _121;
    bool _125 = _117 >= 1;
    float _127 = 0.0;
    float _129 = as_type<float>(_117);
    float _131 = _121;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _127;
    if (!_125)
    {
        out.m_55.x = 0.0;
    }
    int _135 = 0;
    if (!_125)
    {
        float _137 = _133 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5188 = as_type<float>(_139);
        out.gl_Position.z = _5188;
    }
    if (!_125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _143 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_112);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = float(_117);
    bool _155 = _121 >= _153;
    bool _157 = !_151;
    bool _159 = _155 || _157;
    float _161 = 1.0 / _153;
    if (_159)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _129;
    if (_159)
    {
        out.m_55.x = 0.0;
    }
    float _165 = _121 * _161;
    float _167 = _165;
    if (_159)
    {
        float _169 = _163 * 5.0;
        _141 = as_type<int>(_169);
    }
    int _171 = _141;
    out.m_53.x = _165;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5251 = as_type<float>(_171);
        out.gl_Position.z = _5251;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _173 = as_type<float>(int(gl_VertexIndex));
    bool _175 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _177 = as_type<int>(_173) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_173) & 2;
    bool _183 = _181 != 0;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_175;
    float _211;
    if (!_193)
    {
        float _195 = in.m_60.x;
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _211 = _209;
        _213 = true;
    }
    else
    {
        _211 = _165;
    }
    _213 = false;
    float _215 = _211;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _219 = _215 + _217;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _227 = _225 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _229;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _235 = _233 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _237 = 1.0 / _223;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _239;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _245 = 1.0 / _231;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = _215 + _247;
    float _251 = 1.0 / _227;
    float _253 = _249 * _237;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = _215 + _255;
    bool _259 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _261 = isnan(_215);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    bool _271 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _273 = isnan(_215);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = 1.0 / _235;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _287 = _215 + _285;
    float _289 = _257 * _245;
    bool _291 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _293 = isnan(_215);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = 1.0 / _241;
    float _305 = _219 * _251;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _309 = _215 + _307;
    float _311 = -_301;
    float _313 = _311 + 1.0;
    float _315 = _287 * _283;
    float _317 = -_269;
    float _319 = _317 + 1.0;
    float _321 = _281 * _313;
    bool _323 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _325 = isnan(_215);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = _301 * _319;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _341;
    float _345 = _309 * _303;
    bool _347 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _349 = isnan(_215);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = -_281;
    float _361 = _359 + 1.0;
    float _363 = fma(_339, _253, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _365 = fma(_343, _253, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _367 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _369 = isnan(_215);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = _357 * _361;
    float _381 = -_357;
    float _383 = _381 + 1.0;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _393 = _333 * _383;
    float _395 = -_333;
    float _397 = _395 + 1.0;
    float _399 = -_377;
    float _401 = _399 + 1.0;
    float _403 = fma(_391, _305, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _405 = fma(_387, _305, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _407 = _377 * _397;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _413;
    float _417 = _363 * _407;
    float _419 = _365 * _407;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _425 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[143].x, _417);
    float _427 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[143].y, _419);
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _433 = fma(_411, _289, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _435 = fma(_403, _393, _425);
    float _437 = fma(_415, _289, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _439 = fma(_405, _393, _427);
    float _441 = fma(_423, _315, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _443;
    float _447 = fma(_433, _379, _435);
    float _449 = fma(_431, _315, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _451;
    float _455 = fma(_437, _379, _439);
    float _457 = fma(_445, _345, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _459 = fma(_441, _321, _447);
    float _461 = fma(_453, _345, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _463 = fma(_449, _321, _455);
    float _465 = fma(_457, _335, _459);
    float _467 = fma(_461, _335, _463);
    float _469 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[148].x, _465);
    float _471 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[148].y, _467);
    bool _473 = !_243;
    float _475 = _345;
    float _477 = _305;
    float _479 = _289;
    float _497;
    if (!_473)
    {
        float _481 = in.m_60.x;
        float _483 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _485 = _481 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _487 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _489 = _487 * _483;
        float _491 = floor(_489);
        float _493 = -_491;
        float _495 = _489 + _493;
        _497 = _495;
        _499 = true;
    }
    else
    {
        _497 = _165;
    }
    _499 = false;
    float _501 = _497;
    bool _503 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _505 = isnan(_501);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _519 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _521 = isnan(_501);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _537 = _501 + _535;
    float _539 = -_513;
    float _541 = _539 + 1.0;
    bool _543 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _545 = 1.0 / _517;
    float _547 = _529 * _541;
    float _549 = -_529;
    float _551 = _549 + 1.0;
    float _553 = _533 * _545;
    float _555 = fma(_553, _537, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _559 = _555 * _547;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _563 = _557 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _565 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[115].x, _559);
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _569 = _561 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _571 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[116].x, _565);
    float _573 = in.m_62.x;
    float _575 = in.m_62.y;
    float _577 = _567 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _579 = _571 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _577;
    out.m_64.y = _569;
    out.m_64.z = _563;
    out.m_64.w = _579;
    float _581 = _471 * _575;
    float _583 = _469 * _573;
    bool _585 = !_543;
    float _603;
    if (!_585)
    {
        float _587 = in.m_60.x;
        float _589 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _591 = _587 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _593 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _595 = _593 * _589;
        float _597 = floor(_595);
        float _599 = -_597;
        float _601 = _595 + _599;
        _603 = _601;
        _605 = true;
    }
    else
    {
        _603 = _165;
    }
    _605 = false;
    float _607 = _603;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _611 = _607 + _609;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _617 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _619 = isnan(_607);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _633 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _635 = isnan(_607);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _645;
    bool _649 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _651 = isnan(_607);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = 1.0 / _615;
    float _663 = -_627;
    float _665 = _663 + 1.0;
    bool _667 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _669 = 1.0 / _631;
    float _671 = _647 * _661;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _677 = -_659;
    float _679 = _677 + 1.0;
    float _681 = fma(_671, _611, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _683 = _643 * _665;
    float _685 = -_643;
    float _687 = _685 + 1.0;
    float _689 = _627 * _679;
    float _691 = _675 * _669;
    float _693 = _681 * _683;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _697 = _607 + _695;
    float _699 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[131].x, _693);
    float _701 = fma(_691, _697, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _705 = fma(_701, _689, _699);
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _709 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _713 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[133].x, _705);
    float _715 = _707 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _717 = _711 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _719 = _713 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_66.x = _709;
    out.m_66.y = _715;
    out.m_66.z = _717;
    out.m_66.w = _719;
    bool _721 = !_667;
    int _723 = as_type<int>(_717);
    if (!_721)
    {
        float _725 = in.m_60.x;
        float _727 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _729 = _725 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _731 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[14].x, _121);
        float _733 = _731 * _727;
        float _735 = floor(_733);
        float _737 = -_735;
        float _739 = _733 + _737;
        _167 = _739;
    }
    float _741 = _167;
    float _743 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _745 = int(_743);
    int _747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _749 = _747 != 0;
    float _751 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _753 = int(_751);
    float _755 = float(_745);
    float _757 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _759 = int(_757);
    float _761 = _699;
    if (_749)
    {
        float _763 = in.m_60.w;
        _761 = _763;
    }
    float _765 = _761;
    float _767 = float(_753);
    float _769 = 1.0 / _755;
    float _771 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _773 = int(_771);
    float _775 = float(uint(_759));
    float _777 = float(_759);
    int _779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _781 = _779 != 0;
    float _783 = _769 * _121;
    float _785 = 1.0 / _767;
    float _787 = float(_773);
    float _789 = 1.0 / _775;
    float _791 = _787;
    if (_781)
    {
        _475 = 1.0;
    }
    float _793 = _475;
    float _795 = _793;
    if (_781)
    {
        _477 = 1.0;
    }
    float _797 = _477;
    float _799 = _797;
    if (_781)
    {
        _723 = 0;
    }
    int _801 = _723;
    float _803 = trunc(_783);
    int _805 = int(_803);
    float _807 = _785 * _121;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _811 = _785;
    int _813 = _801;
    if (_781)
    {
        float _815 = in.m_60.x;
        float _817 = in.m_60.y;
        _809 = _815;
        _811 = _817;
    }
    float _819 = _809;
    float _821 = _811;
    float _823 = 1.0 / _787;
    int _825 = as_type<int>(_789) + (-2);
    int _827 = as_type<int>(_789);
    if (_781)
    {
        _827 = 0;
    }
    int _829 = _827;
    float _831 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _833 = int(_831);
    int _835 = _829;
    if (_749)
    {
        float _837 = _765 * 3.1415927410125732421875;
        _791 = _837;
    }
    float _839 = _791;
    int _841 = ~_759;
    int _843 = _841 + 1;
    if (_749)
    {
        float _845 = _839 * 0.15915493667125701904296875;
        _479 = _845;
    }
    float _847 = _479;
    float _849 = float(uint(_805));
    float _851 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _853 = int(_851);
    float _855 = _823 * _121;
    float _857 = as_type<float>(_825) * _849;
    float _859 = float(_805);
    float _861 = 0.0;
    float _863 = _859;
    float _865 = _819;
    float _867 = _821;
    if (_781)
    {
        _861 = _821;
    }
    float _869 = _861;
    bool _871 = _859 >= _777;
    bool _873 = isnan(_859);
    bool _875 = _871 || _873;
    bool _877 = isnan(_777);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    float _883 = trunc(_857);
    float _885 = precise::max(_883, 0.0);
    uint _888 = uint(_885);
    float _890 = float(uint(_833));
    float _892 = float(uint(_853));
    float _894 = 1.0 / _890;
    float _896 = trunc(_807);
    int _898 = int(_896);
    int _900 = _843 * int(_888);
    int _902 = _900 + _805;
    float _904 = trunc(_855);
    int _906 = int(_904);
    float _908 = _847;
    float _910 = _892;
    float _912 = _869;
    if (_749)
    {
        float _914 = _847 * 6.283185482025146484375;
        float _916 = sin(_914);
        _908 = _916;
    }
    float _918 = _908;
    float _920 = trunc(_881);
    int _922 = int(_920);
    float _924 = 1.0 / _892;
    if (_781)
    {
        _910 = _819;
    }
    float _926 = _910;
    float _928 = 0.0;
    float _930 = _926;
    if (_781)
    {
        _928 = _926;
    }
    float _932 = _928;
    float _934 = _932;
    if (_781)
    {
        _863 = _926;
    }
    float _936 = _863;
    float _938 = _936;
    if (!_781)
    {
        float _940 = in.m_60.x;
        float _942 = in.m_60.y;
        float _944 = in.m_60.z;
        float _946 = _940 * 3.1415927410125732421875;
        float _948 = _946 * 0.15915493667125701904296875;
        float _950 = _942 * 3.1415927410125732421875;
        float _952 = _950 * 0.15915493667125701904296875;
        float _954 = _948 * 6.283185482025146484375;
        float _956 = sin(_954);
        float _958 = _952 * 6.283185482025146484375;
        float _960 = sin(_958);
        _795 = 7.345489978790283203125;
        _865 = _940;
        _799 = 5.839270114898681640625;
        _938 = _944;
        _867 = _942;
        _930 = _942;
        _813 = 1;
        _835 = 2;
        _912 = _960;
        _934 = _956;
    }
    float _962 = _795;
    float _964 = _865;
    float _966 = _799;
    float _968 = _938;
    float _970 = _867;
    float _972 = _930;
    int _974 = _813;
    int _976 = _835;
    float _978 = _912;
    float _980 = _934;
    float _982 = float(uint(_902));
    float _984 = _962 * _964;
    int _986 = as_type<int>(_894) + (-2);
    float _988 = _966 * _968;
    float _990 = float(uint(_898));
    float _992 = as_type<float>(_825) * _982;
    float _994 = floor(_984);
    float _996 = in.m_60.z;
    float _998 = in.m_60.w;
    int _1000 = ~_759;
    int _1002 = _1000 + 1;
    float _1004 = as_type<float>(_986) * _990;
    int _1006 = as_type<int>(_924) + (-2);
    float _1008 = _970 + _964;
    float _1010 = float(uint(_906));
    float _1012 = _970 * 2.0;
    float _1014 = trunc(_992);
    float _1016 = precise::max(_1014, 0.0);
    uint _1018 = uint(_1016);
    int _1020 = ~_833;
    int _1022 = _1020 + 1;
    float _1024 = as_type<float>(_1006) * _1010;
    int _1026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1028 = _1026 != 0;
    bool _1030 = _759 == 0;
    float _1032 = trunc(_1004);
    float _1034 = precise::max(_1032, 0.0);
    uint _1036 = uint(_1034);
    float _1038 = -_994;
    float _1040 = _984 + _1038;
    float _1042 = 0.0;
    bool _1044 = _1028;
    if (!_749)
    {
        _1042 = _187;
    }
    float _1046 = _1042;
    float _1048 = _1040 * _777;
    bool _1050 = _970 > 0.5;
    int _1052 = int(_888) + int(_1018);
    float _1054 = trunc(_1024);
    float _1056 = precise::max(_1054, 0.0);
    uint _1058 = uint(_1056);
    bool _1060 = _998 > 0.5;
    bool _1062 = !_1028;
    int _1064 = _1062 ? 0 : 1;
    int _1066 = _1002 * _1052;
    int _1068 = _1066 + _805;
    float _1070 = _1046;
    if (_749)
    {
        bool _1072 = _918 > 0.5;
        _1044 = _1072;
    }
    bool _1074 = _1044;
    float _1076 = _962 * _972;
    int _1078 = _1022 * int(_1036);
    int _1080 = _1078 + _898;
    float _1082 = floor(_988);
    bool _1084 = uint(_1068) >= uint(_759);
    int _1086 = ~_853;
    int _1088 = _1086 + 1;
    float _1090 = float(uint(_1080));
    bool _1092 = !_1084;
    int _1094 = _1092 ? 0 : (-1);
    int _1096 = _1088 * int(_1058);
    int _1098 = _1096 + _906;
    int _1100 = abs(_1064);
    float _1102 = as_type<float>(_986) * _1090;
    int _1104 = ~_1052;
    int _1106 = _1104 + _1094;
    int _1108 = _1106 + 1;
    float _1110 = trunc(_1048);
    int _1112 = int(_1110);
    float _1114 = float(uint(_1098));
    int _1116 = ~_922;
    int _1118 = _1116 + 1;
    int _1120 = _1118 + 1;
    int _1122 = _759 * _1108;
    int _1124 = _1122 + _805;
    int _1126 = _759 + (-1);
    float _1128 = as_type<float>(_1006) * _1114;
    if (_749)
    {
        float _1130 = -_187;
        float _1132 = _1074 ? _1130 : _187;
        _1070 = _1132;
    }
    float _1134 = _1070;
    float _1136 = trunc(_1102);
    float _1138 = precise::max(_1136, 0.0);
    uint _1140 = uint(_1138);
    bool _1142 = !_1030;
    int _1144 = _1142 ? _1124 : (-1);
    float _1146 = -_1082;
    float _1148 = _988 + _1146;
    bool _1150 = _996 > 0.5;
    float _1152 = -_187;
    int _1154 = _1050 ? as_type<int>(_1152) : as_type<int>(_187);
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1158 = _1156 != 0;
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1162 = _1160 != 0;
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1166 = _1164 != 0;
    float _1168 = trunc(_1128);
    float _1170 = precise::max(_1168, 0.0);
    uint _1172 = uint(_1170);
    int _1174 = _1112 * _1100;
    int _1176 = _1174 + _805;
    int _1178 = int(_1060);
    int _1180 = _1150 ? 2 : 0;
    int _1182 = _1178 | _1180;
    int _1184 = _1074 ? 4 : 0;
    int _1186 = _1182 | _1184;
    int _1188 = _1158 ? 8 : 0;
    int _1190 = _1186 | _1188;
    int _1192 = _1162 ? 16 : 0;
    int _1194 = _1190 | _1192;
    int _1196 = _1166 ? 32 : 0;
    int _1198 = _1194 | _1196;
    int _1200 = _1050 ? 64 : 0;
    int _1202 = _1198 | _1200;
    int _1204 = _1202 & 64;
    float _1206 = -_191;
    int _1208 = _1060 ? as_type<int>(_1206) : as_type<int>(_191);
    float _1210 = float(_833);
    float _1212 = floor(_1076);
    int _1214 = int(_1036) + int(_1140);
    int _1216 = _1144 * _1120;
    float _1218 = -_191;
    int _1220 = _1150 ? as_type<int>(_1218) : as_type<int>(_191);
    float _1222 = _1148 * _1210;
    bool _1224 = !_1162;
    float _1226 = _1224 ? _187 : as_type<float>(_1154);
    int _1228 = _922 * _1126;
    int _1230 = _1228 + _1216;
    float _1232 = _161 * _121;
    bool _1234 = !_1166;
    float _1236 = _1234 ? _191 : as_type<float>(_1220);
    float _1238 = trunc(_1222);
    int _1240 = int(_1238);
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1244 = _1242 != 0;
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1248 = _1246 != 0;
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1252 = _1250 != 0;
    float _1254 = _777 * _1232;
    int _1256 = int(_1058) + int(_1172);
    int _1258 = ~_833;
    int _1260 = _1258 + 1;
    bool _1262 = !_1248;
    int _1264 = _1262 ? 0 : 1;
    float _1266 = trunc(_1254);
    int _1268 = int(_1266);
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1272 = _1270 != 0;
    int _1274 = _1260 * _1214;
    int _1276 = _1274 + _898;
    int _1278 = abs(_1264);
    float _1280 = -_1212;
    float _1282 = _1076 + _1280;
    bool _1284 = !_1244;
    int _1286 = _1284 ? 0 : 1;
    bool _1288 = !_1158;
    float _1290 = _1288 ? _191 : as_type<float>(_1208);
    int _1292 = _1230 * _1278;
    float _1294 = float(_898);
    bool _1296 = !_1252;
    int _1298 = _1296 ? 0 : 1;
    int _1300 = ~_853;
    int _1302 = _1300 + 1;
    int _1304 = abs(_1286);
    bool _1306 = !_1272;
    int _1308 = _1306 ? 0 : 1;
    int _1310 = _1302 * _1256;
    int _1312 = _1310 + _906;
    int _1314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1316 = _1314 != 0;
    int _1318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1320 = _1318 != 0;
    int _1322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1324 = _1322 != 0;
    int _1326 = _1268 * _1304;
    int _1328 = _1326 + _1292;
    bool _1330 = _1294 >= _1210;
    bool _1332 = isnan(_1294);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan(_1210);
    bool _1338 = _1334 || _1336;
    float _1340 = float(_1338);
    float _1342 = _1210 * _1232;
    int _1344 = abs(_1298);
    int _1346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1348 = _1346 != 0;
    int _1350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1352 = _1350 != 0;
    float _1354 = trunc(_1340);
    int _1356 = int(_1354);
    int _1358 = abs(_1308);
    int _1360 = _1176 * _1344;
    int _1362 = _1360 + _1328;
    bool _1364 = uint(_1276) >= uint(_833);
    bool _1366 = !_1316;
    int _1368 = _1366 ? 0 : 1;
    bool _1370 = _1204 != 0;
    float _1372 = trunc(_1342);
    int _1374 = int(_1372);
    bool _1376 = !_1348;
    int _1378 = _1376 ? 0 : 1;
    bool _1380 = !_1352;
    int _1382 = _1380 ? 0 : 1;
    bool _1384 = uint(_1312) >= uint(_853);
    int _1386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1388 = _1386 != 0;
    bool _1390 = !_1364;
    int _1392 = _1390 ? 0 : (-1);
    bool _1394 = !_1388;
    int _1396 = _1394 ? 0 : 1;
    int _1398 = _1112 * _1358;
    int _1400 = _1398 + _1362;
    bool _1402 = !_1384;
    int _1404 = _1402 ? 0 : (-1);
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1408 = _1406 != 0;
    int _1410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1412 = _1410 != 0;
    int _1414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1416 = _1414 != 0;
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1420 = _1418 != 0;
    int _1422 = ~_1214;
    int _1424 = _1422 + _1392;
    int _1426 = _1424 + 1;
    float _1428 = float(uint(_1400));
    bool _1430 = !_1412;
    int _1432 = _1430 ? 0 : 1;
    int _1434 = _833 * _1426;
    int _1436 = _1434 + _898;
    bool _1438 = _833 == 0;
    float _1440 = as_type<float>(_825) * _1428;
    int _1442 = ~_1356;
    int _1444 = _1442 + 1;
    int _1446 = _1444 + 1;
    bool _1448 = !_1438;
    int _1450 = _1448 ? _1436 : (-1);
    bool _1452 = !_1320;
    int _1454 = _1452 ? 0 : 1;
    int _1456 = _833 + (-1);
    int _1458 = _1450 * _1446;
    int _1460 = abs(_1454);
    bool _1462 = !_1324;
    int _1464 = _1462 ? 0 : 1;
    int _1466 = _1356 * _1456;
    int _1468 = _1466 + _1458;
    float _1470 = trunc(_1440);
    float _1472 = precise::max(_1470, 0.0);
    uint _1474 = uint(_1472);
    int _1476 = abs(_1368);
    float _1478 = float(_853);
    int _1480 = _1468 * _1460;
    float _1482 = float(_906);
    int _1484 = abs(_1378);
    int _1486 = _1374 * _1476;
    int _1488 = _1486 + _1480;
    int _1490 = abs(_1464);
    float _1492 = _1478 * _1232;
    bool _1494 = _1482 >= _1478;
    bool _1496 = isnan(_1482);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan(_1478);
    bool _1502 = _1498 || _1500;
    float _1504 = float(_1502);
    int _1506 = _1240 * _1484;
    int _1508 = _1506 + _898;
    float _1510 = _1282 * _1478;
    int _1512 = ~_759;
    int _1514 = _1512 + 1;
    float _1516 = trunc(_1492);
    int _1518 = int(_1516);
    int _1520 = abs(_1382);
    int _1522 = _1508 * _1490;
    int _1524 = _1522 + _1488;
    int _1526 = ~_1256;
    int _1528 = _1526 + _1404;
    int _1530 = _1528 + 1;
    int _1532 = _1514 * int(_1474);
    int _1534 = _1532 + _1400;
    bool _1536 = !_1408;
    int _1538 = _1536 ? 0 : 1;
    int _1540 = _1240 * _1520;
    int _1542 = _1540 + _1524;
    bool _1544 = _853 == 0;
    float _1546 = trunc(_1504);
    int _1548 = int(_1546);
    float _1550 = float(uint(_1534));
    int _1552 = _853 * _1530;
    int _1554 = _1552 + _906;
    float _1556 = float(uint(_1542));
    int _1558 = abs(_1396);
    float _1560 = as_type<float>(_825) * _1550;
    bool _1562 = !_1544;
    int _1564 = _1562 ? _1554 : (-1);
    float _1566 = as_type<float>(_986) * _1556;
    int _1568 = _853 + (-1);
    float _1570 = trunc(_1510);
    int _1572 = int(_1570);
    int _1574 = abs(_1432);
    int _1576 = ~_833;
    int _1578 = _1576 + 1;
    bool _1580 = _759 == 0;
    int _1582 = ~_1548;
    int _1584 = _1582 + 1;
    int _1586 = _1584 + 1;
    float _1588 = trunc(_1566);
    float _1590 = precise::max(_1588, 0.0);
    uint _1592 = uint(_1590);
    bool _1594 = _996 > 0.5;
    int _1596 = _1564 * _1586;
    float _1598 = trunc(_1560);
    float _1600 = precise::max(_1598, 0.0);
    uint _1602 = uint(_1600);
    int _1604 = _1548 * _1568;
    int _1606 = _1604 + _1596;
    int _1608 = _1572 * _1558;
    int _1610 = _1608 + _906;
    float _1612 = float(uint(_1176));
    int _1614 = _1606 * _1574;
    bool _1616 = !_1416;
    int _1618 = _1616 ? 0 : 1;
    int _1620 = _1578 * int(_1592);
    int _1622 = _1620 + _1542;
    float _1624 = as_type<float>(_825) * _1612;
    int _1626 = ~_759;
    int _1628 = _1626 + 1;
    int _1630 = abs(_1618);
    float _1632 = trunc(_1624);
    float _1634 = precise::max(_1632, 0.0);
    uint _1636 = uint(_1634);
    int _1638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1640 = _1638 != 0;
    int _1642 = int(_1474) + int(_1602);
    float _1644 = float(uint(_1622));
    int _1646 = abs(_1538);
    int _1648 = _1628 * _1642;
    int _1650 = _1648 + _1400;
    bool _1652 = !_1420;
    int _1654 = _1652 ? 0 : 1;
    float _1656 = as_type<float>(_986) * _1644;
    int _1658 = ~_759;
    int _1660 = _1658 + 1;
    int _1662 = _1518 * _1646;
    int _1664 = _1662 + _1614;
    float _1666 = trunc(_1656);
    float _1668 = precise::max(_1666, 0.0);
    uint _1670 = uint(_1668);
    int _1672 = abs(_1654);
    int _1674 = _1660 * int(_1636);
    int _1676 = _1674 + _1176;
    bool _1678 = uint(_1650) >= uint(_759);
    int _1680 = _1610 * _1630;
    int _1682 = _1680 + _1664;
    float _1684 = float(uint(_1676));
    float _1686 = as_type<float>(_1672);
    if (_1640)
    {
        float _1688 = in.m_60.x;
        _1686 = _1688;
    }
    float _1690 = _1686;
    bool _1692 = !_1678;
    int _1694 = _1692 ? 0 : (-1);
    int _1696 = _1572 * _1672;
    int _1698 = _1696 + _1682;
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1702 = _1700 != 0;
    float _1704 = as_type<float>(_825) * _1684;
    int _1706 = ~_1642;
    int _1708 = _1706 + _1694;
    int _1710 = _1708 + 1;
    float _1712 = float(uint(_1698));
    int _1714 = ~_853;
    int _1716 = _1714 + 1;
    int _1718 = _759 * _1710;
    int _1720 = _1718 + _1400;
    float _1722 = float(uint(_1508));
    float _1724 = as_type<float>(_1006) * _1712;
    float _1726 = -_187;
    int _1728 = _1594 ? as_type<int>(_1726) : as_type<int>(_187);
    float _1730 = trunc(_1704);
    float _1732 = precise::max(_1730, 0.0);
    uint _1734 = uint(_1732);
    bool _1736 = !_1580;
    int _1738 = _1736 ? _1720 : (-1);
    float _1740 = as_type<float>(_986) * _1722;
    int _1742 = int(_1592) + int(_1670);
    int _1744 = _1738 & 3;
    bool _1746 = _1744 != 0;
    int _1748 = ~_833;
    int _1750 = _1748 + 1;
    float _1752 = trunc(_1724);
    float _1754 = precise::max(_1752, 0.0);
    uint _1756 = uint(_1754);
    bool _1758 = !_1702;
    float _1760 = _1758 ? _187 : as_type<float>(_1728);
    float _1762 = _1722;
    if (_1640)
    {
        float _1764 = _1690 * 3.1415927410125732421875;
        _1762 = _1764;
    }
    float _1766 = _1762;
    int _1768 = _1750 * _1742;
    int _1770 = _1768 + _1542;
    bool _1772 = uint(_1744) > 1u;
    float _1774 = _1766;
    if (_1640)
    {
        float _1776 = _1766 * 0.15915493667125701904296875;
        _1774 = _1776;
    }
    float _1778 = _1774;
    float _1780 = -_191;
    int _1782 = _1370 ? as_type<int>(_1780) : as_type<int>(_191);
    float _1784 = trunc(_1740);
    float _1786 = precise::max(_1784, 0.0);
    uint _1788 = uint(_1786);
    int _1790 = _1738 & 3;
    bool _1792 = _1790 != 0;
    int _1794 = ~_833;
    int _1796 = _1794 + 1;
    int _1798 = _1792 ? 0 : 1;
    bool _1800 = uint(_1770) >= uint(_833);
    int _1802 = _1716 * int(_1756);
    int _1804 = _1802 + _1698;
    float _1806 = _1778;
    if (_1640)
    {
        float _1808 = _1778 * 6.283185482025146484375;
        float _1810 = sin(_1808);
        _1806 = _1810;
    }
    float _1812 = _1806;
    int _1814 = ~_1798;
    int _1816 = _1814 + 1;
    int _1818 = _1816 + 1;
    float _1820 = float(uint(_1804));
    int _1822 = _1818;
    if (!_1772)
    {
        int _1824 = ~_1798;
        int _1826 = _1824 + 1;
        _1822 = _1826;
    }
    int _1828 = _1822;
    int _1830 = _1796 * int(_1788);
    int _1832 = _1830 + _1508;
    bool _1834 = !_1800;
    int _1836 = _1834 ? 0 : (-1);
    float _1838 = as_type<float>(_1006) * _1820;
    bool _1840 = _1744 != 3;
    int _1842 = ~_1742;
    int _1844 = _1842 + _1836;
    int _1846 = _1844 + 1;
    bool _1848 = uint(_1744) >= 2u;
    float _1850 = trunc(_1838);
    float _1852 = precise::max(_1850, 0.0);
    uint _1854 = uint(_1852);
    int _1856 = _833 * _1846;
    int _1858 = _1856 + _1542;
    int _1860 = _1848 ? 0 : 1;
    float _1862 = float(uint(_1832));
    bool _1864 = !_1438;
    int _1866 = _1864 ? _1858 : (-1);
    int _1868 = ~_1860;
    int _1870 = _1868 + 1;
    int _1872 = _1870 + 1;
    float _1874 = as_type<float>(_986) * _1862;
    int _1876 = _1872;
    bool _1878 = _1840;
    if (_1840)
    {
        int _1880 = ~_1860;
        int _1882 = _1880 + 1;
        _1876 = _1882;
    }
    int _1884 = _1876;
    int _1886 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1888 = _1886 != 0;
    float _1890 = _1812;
    if (_1640)
    {
        bool _1892 = _1812 > 0.5;
        _1878 = _1892;
    }
    bool _1894 = _1878;
    int _1896 = _1866 & 3;
    bool _1898 = _1896 != 0;
    if (!_1640)
    {
        _1890 = _191;
    }
    float _1900 = _1890;
    float _1902 = _1900;
    if (_1640)
    {
        float _1904 = -_191;
        float _1906 = _1894 ? _1904 : _191;
        _1902 = _1906;
    }
    float _1908 = _1902;
    bool _1910 = !_1888;
    float _1912 = _1910 ? _191 : as_type<float>(_1782);
    int _1914 = ~_759;
    int _1916 = _1914 + 1;
    float _1918 = _1908 + (-0.5);
    int _1920 = ~_853;
    int _1922 = _1920 + 1;
    int _1924 = _1866 & 3;
    bool _1926 = _1924 != 0;
    bool _1928 = uint(_1896) > 1u;
    int _1930 = int(_1756) + int(_1854);
    int _1932 = int(_1636) + int(_1734);
    int _1934 = _1922 * _1930;
    int _1936 = _1934 + _1698;
    int _1938 = _1926 ? 0 : 1;
    float _1940 = trunc(_1874);
    float _1942 = precise::max(_1940, 0.0);
    uint _1944 = uint(_1942);
    int _1946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1948 = _1946 != 0;
    int _1950 = _1916 * _1932;
    int _1952 = _1950 + _1176;
    float _1954 = float(uint(_1610));
    bool _1956 = !_1948;
    int _1958 = _1956 ? 0 : 1;
    bool _1960 = uint(_1936) >= uint(_853);
    float _1962 = as_type<float>(_1006) * _1954;
    int _1964 = ~_1938;
    int _1966 = _1964 + 1;
    int _1968 = _1966 + 1;
    int _1970 = _1968;
    if (!_1928)
    {
        int _1972 = ~_1938;
        int _1974 = _1972 + 1;
        _1970 = _1974;
    }
    int _1976 = _1970;
    float _1978 = trunc(_1962);
    float _1980 = precise::max(_1978, 0.0);
    uint _1982 = uint(_1980);
    bool _1984 = uint(_1952) >= uint(_759);
    bool _1986 = !_1960;
    int _1988 = _1986 ? 0 : (-1);
    bool _1990 = _1896 != 3;
    bool _1992 = !_1984;
    int _1994 = _1992 ? 0 : (-1);
    bool _1996 = uint(_1896) >= 2u;
    int _1998 = ~_1930;
    int _2000 = _1998 + _1988;
    int _2002 = _2000 + 1;
    int _2004 = _1996 ? 0 : 1;
    int _2006 = ~_833;
    int _2008 = _2006 + 1;
    int _2010 = _853 * _2002;
    int _2012 = _2010 + _1698;
    int _2014 = int(_1788) + int(_1944);
    int _2016 = ~_853;
    int _2018 = _2016 + 1;
    int _2020 = ~_2004;
    int _2022 = _2020 + 1;
    int _2024 = _2022 + 1;
    int _2026 = _2008 * _2014;
    int _2028 = _2026 + _1508;
    int _2030 = _2024;
    if (_1990)
    {
        int _2032 = ~_2004;
        int _2034 = _2032 + 1;
        _2030 = _2034;
    }
    int _2036 = _2030;
    int _2038 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2040 = _2038 != 0;
    int _2042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2044 = _2042 != 0;
    bool _2046 = !_2040;
    int _2048 = _2046 ? 0 : 1;
    bool _2050 = uint(_2028) >= uint(_833);
    int _2052 = _2018 * int(_1982);
    int _2054 = _2052 + _1610;
    bool _2056 = !_1544;
    int _2058 = _2056 ? _2012 : (-1);
    bool _2060 = !_2050;
    int _2062 = _2060 ? 0 : (-1);
    int _2064 = _2058 & 3;
    bool _2066 = _2064 != 0;
    int _2068 = _2058 & 3;
    bool _2070 = _2068 != 0;
    float _2072 = float(uint(_2054));
    int _2074 = _2066 ? 0 : 1;
    bool _2076 = uint(_2068) > 1u;
    float _2078 = as_type<float>(_1006) * _2072;
    int _2080 = ~_2074;
    int _2082 = _2080 + 1;
    int _2084 = _2082 + 1;
    int _2086 = ~_853;
    int _2088 = _2086 + 1;
    float _2090 = trunc(_2078);
    float _2092 = precise::max(_2090, 0.0);
    uint _2094 = uint(_2092);
    float _2096 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2098 = _2096 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2100 = _2084;
    float _2102 = as_type<float>(_2036);
    if (!_2076)
    {
        int _2104 = ~_2074;
        int _2106 = _2104 + 1;
        _2100 = _2106;
    }
    int _2108 = _2100;
    float _2110 = 1.0 / _2098;
    bool _2112 = uint(_2068) >= 2u;
    float _2114 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2116 = _2114 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2118 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2120 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2118;
    int _2122 = _2112 ? 0 : 1;
    bool _2124 = _2068 != 3;
    float _2126 = 1.0 / _2116;
    int _2128 = int(_1982) + int(_2094);
    float _2130 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2132 = _2130 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _2134 = ~_2122;
    int _2136 = _2134 + 1;
    int _2138 = _2136 + 1;
    float _2140 = in.m_48.x;
    float _2142 = in.m_48.y;
    float _2144 = in.m_48.z;
    int _2146 = _2088 * _2128;
    int _2148 = _2146 + _1610;
    float _2150 = 1.0 / _2132;
    float _2152 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _2154 = ~_2014;
    int _2156 = _2154 + _2062;
    int _2158 = _2156 + 1;
    float _2160 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2162 = _2138;
    if (_2124)
    {
        int _2164 = ~_2122;
        int _2166 = _2164 + 1;
        _2162 = _2166;
    }
    int _2168 = _2162;
    float _2170 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2172 = _2170 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2174 = uint(_2148) >= uint(_853);
    bool _2176 = !_2174;
    int _2178 = _2176 ? 0 : (-1);
    float _2180 = 1.0 / _2172;
    bool _2182 = _964 > 0.5;
    float _2184 = -_187;
    int _2186 = _2182 ? as_type<int>(_2184) : as_type<int>(_187);
    int _2188 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2190 = _2188 != 0;
    float _2192 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2194 = _2192 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2196 = _2142 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2198 = _2142 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _2200 = !_2190;
    float _2202 = _2200 ? _187 : as_type<float>(_2186);
    float _2204 = 1.0 / _2194;
    bool _2206 = _974 != 1;
    float _2208 = _964 * 2.0;
    float _2210 = _2142 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2212 = fma(_2140, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2196);
    float _2214 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2216 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2214;
    float _2218 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2220 = _2218 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2222 = fma(_2140, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2198);
    float _2224 = floor(_2208);
    float _2226 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2228 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2226;
    float _2230 = fma(_2140, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2210);
    float _2232 = _2216 * _2150;
    float _2234 = _2228 * _2110;
    float _2236 = 0.0;
    if (!_2206)
    {
        _2236 = _970;
    }
    float _2238 = _2236;
    float _2240 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2242 = _2240 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2244 = 0.0;
    float _2246 = _2238;
    if (!_2206)
    {
        _2244 = _970;
    }
    float _2248 = _2244;
    float _2250 = _2220 * _2204;
    float _2252 = 0.0;
    float _2254 = _2248;
    if (!_2206)
    {
        _2252 = _996;
    }
    float _2256 = _2252;
    float _2258 = _2242 * _2126;
    float _2260 = 0.0;
    float _2262 = _2256;
    if (!_2206)
    {
        _2260 = _996;
    }
    float _2264 = _2260;
    float _2266 = _996 * 2.0;
    float _2268 = _2264;
    if (_2206)
    {
        _2246 = _964;
    }
    float _2270 = _2246;
    float _2272 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2274 = _2272 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    if (_2206)
    {
        _2254 = _964;
    }
    float _2276 = _2254;
    float _2278 = fma(_2144, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2222);
    if (_2206)
    {
        _2262 = _970;
    }
    float _2280 = _2262;
    float _2282 = floor(_2266);
    if (_2206)
    {
        _2268 = _970;
    }
    float _2284 = _2268;
    float _2286 = _2270 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2288 = _976 != 2;
    float _2290 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2292 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2290;
    float _2294 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2296 = _2294 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2298 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2300 = isnan(_741);
    bool _2302 = _2298 || _2300;
    bool _2304 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2306 = _2302 || _2304;
    float _2308 = float(_2306);
    float _2310 = 1.0 / _2274;
    float _2312 = _2292 * _2180;
    float _2314 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2316 = _2314 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2318 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2320 = isnan(_741);
    bool _2322 = _2318 || _2320;
    bool _2324 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2326 = _2322 || _2324;
    float _2328 = float(_2326);
    float _2330 = _2280 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2332 = !_2044;
    int _2334 = _2332 ? 0 : 1;
    float _2336 = 1.0 / _2316;
    float _2338 = 0.0;
    if (_2288)
    {
        _2338 = _964;
    }
    float _2340 = _2338;
    float _2342 = 0.0;
    float _2344 = _2340;
    if (_2288)
    {
        _2342 = _970;
    }
    float _2346 = _2342;
    float _2348 = _2346;
    if (!_2288)
    {
        _2344 = _996;
    }
    float _2350 = _2344;
    if (!_2288)
    {
        _2348 = _964;
    }
    float _2352 = _2348;
    float _2354 = _2296 * _2310;
    bool _2356 = _2224 >= 0.0;
    bool _2358 = isnan(_2224);
    bool _2360 = _2356 || _2358;
    bool _2362 = isnan(0.0);
    bool _2364 = _2360 || _2362;
    float _2366 = _2350 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _2368 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2370 = isnan(_741);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2376 = _2372 || _2374;
    float _2378 = float(_2376);
    float _2380 = _2352 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2382 = _2364 ? 0 : 1;
    bool _2384 = _2224 > 0.0;
    float _2386 = -_2308;
    float _2388 = _2386 + 1.0;
    float _2390 = _2120 * _2336;
    int _2392 = ~_2382;
    int _2394 = _2392 + 1;
    int _2396 = _2394 + 1;
    float _2398 = -_2378;
    float _2400 = _2398 + 1.0;
    float _2402 = _2378 * _2388;
    bool _2404 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2406 = isnan(_741);
    bool _2408 = _2404 || _2406;
    bool _2410 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2412 = _2408 || _2410;
    float _2414 = float(_2412);
    float _2416 = _2328 * _2400;
    float _2418 = -_2328;
    float _2420 = _2418 + 1.0;
    int _2422 = abs(_2036);
    float _2424 = -_2414;
    float _2426 = _2424 + 1.0;
    int _2428 = ~_2128;
    int _2430 = _2428 + _2178;
    int _2432 = _2430 + 1;
    float _2434 = _2414 * _2420;
    int _2436 = _2396;
    if (!_2384)
    {
        int _2438 = ~_2382;
        int _2440 = _2438 + 1;
        _2436 = _2440;
    }
    int _2442 = _2436;
    float _2444 = fma(_2144, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2212);
    bool _2446 = _2282 >= 0.0;
    bool _2448 = isnan(_2282);
    bool _2450 = _2446 || _2448;
    bool _2452 = isnan(0.0);
    bool _2454 = _2450 || _2452;
    float _2456 = fma(_2144, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2230);
    bool _2458 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2460 = isnan(_741);
    bool _2462 = _2458 || _2460;
    bool _2464 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2466 = _2462 || _2464;
    float _2468 = float(_2466);
    float _2470 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2472 = _741 + _2470;
    int _2474 = _2454 ? 0 : 1;
    float _2476 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2478 = _741 + _2476;
    bool _2480 = _2282 > 0.0;
    float _2482 = fma(_2234, _2472, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2484 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2486 = isnan(_741);
    bool _2488 = _2484 || _2486;
    bool _2490 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2492 = _2488 || _2490;
    float _2494 = float(_2492);
    float _2496 = fma(_2258, _2478, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2498 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2500 = _741 + _2498;
    int _2502 = ~_2422;
    int _2504 = _2502 + 1;
    int _2506 = _2504 + 1;
    int _2508 = _853 * _2432;
    int _2510 = _2508 + _1610;
    float _2512 = _2494 * _2426;
    float _2514 = -_2494;
    float _2516 = _2514 + 1.0;
    bool _2518 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2520 = isnan(_741);
    bool _2522 = _2518 || _2520;
    bool _2524 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2526 = _2522 || _2524;
    float _2528 = float(_2526);
    float _2530 = fma(_2250, _2500, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2532 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2152);
    float _2534 = _2468 * _2516;
    float _2536 = -_2468;
    float _2538 = _2536 + 1.0;
    bool _2540 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2542 = isnan(_741);
    bool _2544 = _2540 || _2542;
    bool _2546 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2548 = _2544 || _2546;
    float _2550 = float(_2548);
    float _2552 = -_2528;
    float _2554 = _2552 + 1.0;
    float _2556 = _970 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2558 = _2528 * _2538;
    float _2560 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2562 = _741 + _2560;
    float _2564 = _2550 * _2554;
    float _2566 = -_2550;
    float _2568 = _2566 + 1.0;
    float _2570 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2572 = _741 + _2570;
    float _2574 = fma(_2232, _2562, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2576 = _2482 * _2564;
    float _2578 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2580 = _741 + _2578;
    float _2582 = fma(_2312, _2572, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _2584 = ~_2474;
    int _2586 = _2584 + 1;
    int _2588 = _2586 + 1;
    float _2590 = fma(_2568, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2576);
    float _2592 = fma(_2354, _2580, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2594 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2596 = _741 + _2594;
    float _2598 = fma(_2496, _2558, _2590);
    float _2600 = _964 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2602 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2604 = _2588;
    if (!_2480)
    {
        int _2606 = ~_2474;
        int _2608 = _2606 + 1;
        _2604 = _2608;
    }
    int _2610 = _2604;
    float _2612 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2614 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2616 = fma(_2390, _2596, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2618 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2602);
    float _2620 = _964 + _996;
    float _2622 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2624 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2614);
    float _2626 = _964 + (-0.5);
    float _2628 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2612);
    float _2630 = _970 + _996;
    float _2632 = _970 + (-0.5);
    float _2634 = -_2622;
    float _2636 = fma(_2600, 2.0, _2634);
    float _2638 = fma(_2574, _2534, _2598);
    float _2640 = fma(_2556, -2.0, _2160);
    float _2642 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2644 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2646 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2642);
    float _2648 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2650 = _978 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2652 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2644);
    float _2654 = _980 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2656 = _1008 + (-1.0);
    float _2658 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2660 = fma(_2650, -2.0, _2648);
    float _2662 = _2444 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2664 = _1866 >> 31;
    float _2666 = -_2658;
    float _2668 = fma(_2654, 2.0, _2666);
    int _2670 = _833 * _2158;
    int _2672 = _2670 + _1508;
    float _2674 = fma(_2530, _2512, _2638);
    int _2676 = _2664 & 3;
    float _2678 = fma(_2656, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2680 = _2278 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2682 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2684 = _2662 + _2682;
    float _2686 = _2630 + (-1.0);
    int _2688 = _1866 + _2676;
    float _2690 = _2456 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2692 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2694 = _2680 + _2692;
    float _2696 = _2684 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2698 = fma(_2686, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _2700 = _2688 >> 2;
    float _2702 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2704 = _2690 + _2702;
    float _2706 = fma(_2694, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2696);
    bool _2708 = _1896 != 3;
    float _2710 = floor(_1012);
    int _2712 = _2700 << 4;
    int _2714 = _2712 + 656;
    float _2716 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2706);
    float _2718 = fma(_2582, _2434, _2674);
    uint _2720 = uint(int(uint(_2714) >> uint(2)));
    uint _2722 = uint(int(uint(int(_2720)) >> uint(2)));
    int _2724 = int(_2720) & 3;
    float _2726 = (*spvDescriptorSet0.vp_c9)._m0[int(_2722)][_2724];
    int _2728 = int(_2720) + 1;
    uint _2730 = uint(int(uint(_2728) >> uint(2)));
    int _2732 = _2728 & 3;
    float _2734 = (*spvDescriptorSet0.vp_c9)._m0[int(_2730)][_2732];
    float _2736 = _1134 + 0.5;
    float _2738 = -_121;
    float _2740 = fma(_2738, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2668);
    float _2742 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2660);
    bool _2744 = !_1438;
    int _2746 = _2744 ? _2672 : (-1);
    float _2748 = -_121;
    float _2750 = fma(_2748, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2636);
    float _2752 = fma(_2592, _2416, _2718);
    int _2754 = _2714 + 8;
    uint _2756 = uint(int(uint(_2754) >> uint(2)));
    uint _2758 = uint(int(uint(int(_2756)) >> uint(2)));
    int _2760 = int(_2756) & 3;
    float _2762 = (*spvDescriptorSet0.vp_c9)._m0[int(_2758)][_2760];
    int _2764 = int(_2756) + 1;
    uint _2766 = uint(int(uint(_2764) >> uint(2)));
    int _2768 = _2764 & 3;
    float _2770 = (*spvDescriptorSet0.vp_c9)._m0[int(_2766)][_2768];
    bool _2772 = !_1898;
    int _2774 = _2772 ? 0 : 1;
    float _2776 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2652);
    bool _2778 = _2710 > 0.0;
    float _2780 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2646);
    bool _2782 = _2710 >= 0.0;
    bool _2784 = isnan(_2710);
    bool _2786 = _2782 || _2784;
    bool _2788 = isnan(0.0);
    bool _2790 = _2786 || _2788;
    float _2792 = -_2776;
    float _2794 = _2792 + 1.0;
    bool _2796 = !_2708;
    int _2798 = _2796 ? 0 : (-1);
    float _2800 = fma(_2616, _2402, _2752);
    bool _2802 = _2716 >= 0.0;
    float _2804 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2806 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2808 = abs(_2798);
    float _2810 = fma(_2308, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2800);
    float _2812 = fma(_2276, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2804);
    float _2814 = fma(_2284, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2806);
    float _2816 = fma(_2736, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2740);
    float _2818 = _2202 + 0.5;
    float _2820 = -_1918;
    float _2822 = -_2742;
    float _2824 = fma(_2820, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2822);
    float _2826 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2640);
    float _2828 = _1912 + (-0.5);
    float _2830 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2832 = fma(_2818, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2750);
    int _2834 = abs(_1976);
    float _2836 = -_2828;
    float _2838 = -_2826;
    float _2840 = fma(_2836, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2838);
    float _2842 = -_2830;
    float _2844 = fma(_2286, 2.0, _2842);
    int _2846 = abs(_2774);
    float _2848 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2850 = int(_2848);
    int _2852 = ~_2834;
    int _2854 = _2852 + 1;
    int _2856 = _2854 + 1;
    float _2858 = -_121;
    float _2860 = fma(_2858, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2844);
    float _2862 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2814);
    float _2864 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2618);
    float _2866 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2628);
    if (_2802)
    {
        _2102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2868 = _2102;
    float _2870 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2872 = _2856 * as_type<int>(_2734);
    int _2874 = ~_2846;
    int _2876 = _2874 + 1;
    int _2878 = _2876 + 1;
    float _2880 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2882 = -_2870;
    float _2884 = fma(_2366, 2.0, _2882);
    int _2886 = abs(_2850);
    int _2888 = _2878 * as_type<int>(_2726);
    int _2890 = _2888 + _2872;
    int _2892 = as_type<int>(_2868);
    if (_2802)
    {
        float _2894 = _2868 * 5.0;
        _2892 = as_type<int>(_2894);
    }
    int _2896 = _2892;
    float _2898 = fma(_2380, -2.0, _2880);
    int _2900 = abs(_2048);
    int _2902 = _2506 * as_type<int>(_2762);
    int _2904 = _2902 + _2890;
    if (_2802)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9247 = as_type<float>(_2896);
        out.gl_Position.z = _9247;
    }
    float _2906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2908 = ~_2808;
    int _2910 = _2908 + 1;
    int _2912 = _2910 + 1;
    float _2914 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2916 = float(uint(_2850));
    float _2918 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2812);
    int _2920 = ~_2886;
    int _2922 = _2920 + 1;
    int _2924 = _2912 * as_type<int>(_2770);
    int _2926 = _2924 + _2904;
    float _2928 = float(uint(_2886));
    float _2930 = fma(_2330, -2.0, _2914);
    float _2932 = 1.0 / _2916;
    int _2934 = _1738 >> 31;
    float _2936 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2898);
    int _2938 = ~_2900;
    int _2940 = _2938 + 1;
    int _2942 = _2940 + 1;
    float _2944 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2930);
    int _2946 = _2934 & 3;
    float _2948 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2532);
    int _2950 = _2058 >> 31;
    float _2952 = 1.0 / _2928;
    int _2954 = _1738 + _2946;
    int _2956 = _2926 * _2942;
    int _2958 = _2950 & 3;
    float _2960 = _2906 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2962 = _2954 >> 2;
    int _2964 = _2746 * _2900;
    int _2966 = _2964 + _2956;
    int _2968 = _2058 + _2958;
    float _2970 = -_2794;
    float _2972 = fma(_2970, _1134, _2816);
    int _2974 = _2962 << 4;
    int _2976 = _2974 + 368;
    float _2978 = -_2780;
    float _2980 = _2978 + 1.0;
    int _2982 = _2968 >> 2;
    float _2984 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2986 = abs(_2966);
    uint _2988 = uint(int(uint(_2976) >> uint(2)));
    uint _2990 = uint(int(uint(int(_2988)) >> uint(2)));
    int _2992 = int(_2988) & 3;
    float _2994 = (*spvDescriptorSet0.vp_c9)._m0[int(_2990)][_2992];
    int _2996 = int(_2988) + 1;
    uint _2998 = uint(int(uint(_2996) >> uint(2)));
    int _3000 = _2996 & 3;
    float _3002 = (*spvDescriptorSet0.vp_c9)._m0[int(_2998)][_3000];
    int _3004 = as_type<int>(_2932) + (-2);
    float _3006 = fma(_2980, _1908, _2824);
    float _3008 = float(uint(_2966));
    float _3010 = _1760 + 0.5;
    int _3012 = as_type<int>(_2952) + (-2);
    float _3014 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2624);
    int _3016 = _2982 << 4;
    int _3018 = _3016 + 800;
    float _3020 = as_type<float>(_3004) * _3008;
    float _3022 = float(uint(_2986));
    float _3024 = fma(_2960, _3010, _2860);
    uint _3026 = uint(int(uint(_3018) >> uint(2)));
    uint _3028 = uint(int(uint(int(_3026)) >> uint(2)));
    int _3030 = int(_3026) & 3;
    float _3032 = (*spvDescriptorSet0.vp_c9)._m0[int(_3028)][_3030];
    int _3034 = int(_3026) + 1;
    uint _3036 = uint(int(uint(_3034) >> uint(2)));
    int _3038 = _3034 & 3;
    float _3040 = (*spvDescriptorSet0.vp_c9)._m0[int(_3036)][_3038];
    int _3042 = ~_2850;
    int _3044 = _3042 + 1;
    out.m_68.x = _2972;
    out.m_68.y = _3006;
    float _3046 = as_type<float>(_3012) * _3022;
    float _3048 = trunc(_3020);
    float _3050 = precise::max(_3048, 0.0);
    uint _3052 = uint(_3050);
    float _3054 = _1290 + (-0.5);
    float _3056 = _2984 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3058 = -_3014;
    float _3060 = _3058 + 1.0;
    int _3062 = ~_1932;
    int _3064 = _3062 + _1994;
    int _3066 = _3064 + 1;
    float _3068 = -_3056;
    float _3070 = -_2944;
    float _3072 = fma(_3068, _3054, _3070);
    bool _3074 = !_1746;
    int _3076 = _3074 ? 0 : 1;
    float _3078 = trunc(_3046);
    float _3080 = precise::max(_3078, 0.0);
    uint _3082 = uint(_3080);
    int _3084 = _2976 + 8;
    uint _3086 = uint(int(uint(_3084) >> uint(2)));
    uint _3088 = uint(int(uint(int(_3086)) >> uint(2)));
    int _3090 = int(_3086) & 3;
    float _3092 = (*spvDescriptorSet0.vp_c9)._m0[int(_3088)][_3090];
    int _3094 = int(_3086) + 1;
    uint _3096 = uint(int(uint(_3094) >> uint(2)));
    int _3098 = _3094 & 3;
    float _3100 = (*spvDescriptorSet0.vp_c9)._m0[int(_3096)][_3098];
    int _3102 = _759 * _3066;
    int _3104 = _3102 + _1176;
    int _3106 = abs(_3076);
    out.m_70.x = _2810;
    int _3108 = abs(_1884);
    bool _3110 = _759 == 0;
    int _3112 = _3044 * int(_3052);
    int _3114 = _3112 + _2966;
    int _3116 = _3018 + 8;
    uint _3118 = uint(int(uint(_3116) >> uint(2)));
    uint _3120 = uint(int(uint(int(_3118)) >> uint(2)));
    int _3122 = int(_3118) & 3;
    float _3124 = (*spvDescriptorSet0.vp_c9)._m0[int(_3120)][_3122];
    int _3126 = int(_3118) + 1;
    uint _3128 = uint(int(uint(_3126) >> uint(2)));
    int _3130 = _3126 & 3;
    float _3132 = (*spvDescriptorSet0.vp_c9)._m0[int(_3128)][_3130];
    int _3134 = abs(_1958);
    if (_2802)
    {
        out.m_55.x = 0.0;
    }
    bool _3136 = !_3110;
    int _3138 = _3136 ? _3104 : (-1);
    float _3140 = float(uint(_3114));
    int _3142 = _2922 * int(_3082);
    int _3144 = _3142 + _2986;
    int _3146 = abs(_1828);
    float _3148 = as_type<float>(_3004) * _3140;
    bool _3150 = !_2070;
    int _3152 = _3150 ? 0 : 1;
    float _3154 = float(uint(_3144));
    int _3156 = abs(_2108);
    float _3158 = as_type<float>(_3012) * _3154;
    float _3160 = trunc(_3148);
    float _3162 = precise::max(_3160, 0.0);
    uint _3164 = uint(_3162);
    int _3166 = ~_3156;
    int _3168 = _3166 + 1;
    int _3170 = _3168 + 1;
    int _3172 = ~_3146;
    int _3174 = _3172 + 1;
    int _3176 = _3174 + 1;
    bool _3178 = _1744 != 3;
    int _3180 = abs(_3152);
    float _3182 = trunc(_3158);
    float _3184 = precise::max(_3182, 0.0);
    uint _3186 = uint(_3184);
    int _3188 = _3176 * as_type<int>(_3002);
    int _3190 = _3170 * as_type<int>(_3040);
    int _3192 = ~_2850;
    int _3194 = _3192 + 1;
    int _3196 = ~_3106;
    int _3198 = _3196 + 1;
    int _3200 = _3198 + 1;
    int _3202 = ~_3180;
    int _3204 = _3202 + 1;
    int _3206 = _3204 + 1;
    int _3208 = int(_3052) + int(_3164);
    int _3210 = _3200 * as_type<int>(_2994);
    int _3212 = _3210 + _3188;
    int _3214 = _3206 * as_type<int>(_3032);
    int _3216 = _3214 + _3190;
    int _3218 = ~_2886;
    int _3220 = _3218 + 1;
    int _3222 = _3194 * _3208;
    int _3224 = _3222 + _2966;
    int _3226 = int(_3082) + int(_3186);
    bool _3228 = !_3178;
    int _3230 = _3228 ? 0 : (-1);
    int _3232 = ~_3108;
    int _3234 = _3232 + 1;
    int _3236 = _3234 + 1;
    int _3238 = _3220 * _3226;
    int _3240 = _3238 + _2986;
    bool _3242 = uint(_3224) >= uint(_2850);
    int _3244 = abs(_3230);
    int _3246 = _3236 * as_type<int>(_3092);
    int _3248 = _3246 + _3212;
    bool _3250 = !_3242;
    int _3252 = _3250 ? 0 : (-1);
    bool _3254 = uint(_3240) >= uint(_2886);
    int _3256 = _2966 ^ _2850;
    int _3258 = abs(_2168);
    int _3260 = ~_3244;
    int _3262 = _3260 + 1;
    int _3264 = _3262 + 1;
    bool _3266 = !_3254;
    int _3268 = _3266 ? 0 : (-1);
    uint _3270 = uint(int(uint(_3256) >> uint(31)));
    int _3272 = _3264 * as_type<int>(_3100);
    int _3274 = _3272 + _3248;
    bool _3276 = _2068 != 3;
    int _3278 = ~_3258;
    int _3280 = _3278 + 1;
    int _3282 = _3280 + 1;
    int _3284 = ~_3268;
    int _3286 = _3226 + _3284;
    int _3288 = _3286 + 1;
    int _3290 = ~int(_3270);
    int _3292 = _3290 + 1;
    int _3294 = _3282 * as_type<int>(_3124);
    int _3296 = _3294 + _3216;
    int _3298 = ~_3208;
    int _3300 = _3298 + _3252;
    int _3302 = _3300 + 1;
    bool _3304 = !_3276;
    int _3306 = _3304 ? 0 : (-1);
    int _3308 = _3288 ^ _3292;
    int _3310 = _2850 * _3302;
    int _3312 = _3310 + _2966;
    int _3314 = abs(_3306);
    bool _3316 = _2850 == 0;
    bool _3318 = _2850 == 0;
    int _3320 = ~_3292;
    int _3322 = _3320 + _3308;
    int _3324 = _3322 + 1;
    int _3326 = ~_3314;
    int _3328 = _3326 + 1;
    int _3330 = _3328 + 1;
    bool _3332 = !_3316;
    int _3334 = _3332 ? _3312 : (-1);
    bool _3336 = !_3318;
    int _3338 = _3336 ? _3324 : (-1);
    int _3340 = _3330 * as_type<int>(_3132);
    int _3342 = _3340 + _3296;
    int _3344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3346 = _3344 != 0;
    int _3348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3350 = _3348 != 0;
    int _3352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3354 = _3352 != 0;
    float _3356 = -_2862;
    float _3358 = _3356 + 1.0;
    float _3360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3362 = abs(_2334);
    float _3364 = fma(_1290, _3358, _3072);
    int _3366 = ~_3134;
    int _3368 = _3366 + 1;
    int _3370 = _3368 + 1;
    float _3372 = -_2918;
    float _3374 = _3372 + 1.0;
    int _3376 = ~_3362;
    int _3378 = _3376 + 1;
    int _3380 = _3378 + 1;
    float _3382 = float(_3338);
    float _3384 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3386 = log2(_3384);
    int _3388 = _3274 * _3370;
    float _3390 = -_2864;
    float _3392 = _3390 + 1.0;
    float _3394 = -_2866;
    float _3396 = _3394 + 1.0;
    float _3398 = -_3374;
    float _3400 = fma(_1760, _3398, _3024);
    int _3402 = _3138 * _3134;
    int _3404 = _3402 + _3388;
    float _3406 = -_3392;
    float _3408 = fma(_2202, _3406, _2832);
    float _3410 = fma(_1912, _3396, _2840);
    float _3412 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3414 = _3360 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3416 = !_1544;
    int _3418 = _3416 ? _2510 : (-1);
    int _3420 = _3342 * _3380;
    out.m_72.x = _3408;
    out.m_72.y = _3410;
    out.m_72.z = _3400;
    out.m_72.w = _3364;
    float _3422 = -_2936;
    float _3424 = fma(_3414, _3382, _3422);
    float _3426 = _2684 * _2684;
    int _3428 = _3418 * _3362;
    int _3430 = _3428 + _3420;
    float _3432 = _3386 * _121;
    float _3434 = -_2948;
    float _3436 = _3434 + 1.0;
    float _3438 = fma(_2694, _2694, _3426);
    float _3440 = float(_3334);
    float _3442 = -_121;
    float _3444 = fma(_3442, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2884);
    float _3446 = float(_2610);
    float _3448 = fma(_2704, _2704, _3438);
    float _3450 = exp2(_3432);
    float _3452 = _3412 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3454 = !_3354;
    int _3456 = _3454 ? 0 : 1;
    float _3458 = _1236 + (-0.5);
    float _3460 = fma(_3452, _3440, _3444);
    float _3462 = _1226 + 0.5;
    float _3464 = -_3414;
    float _3466 = fma(_3464, _3458, _3424);
    bool _3468 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3470 = isnan(1.0);
    bool _3472 = _3468 || _3470;
    bool _3474 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3476 = _3472 || _3474;
    float _3478 = rsqrt(_3448);
    float _3480 = fma(_3452, _3462, _3460);
    float _3482 = fma(_1236, _3436, _3466);
    float _3484 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3486 = 1.0 + _3484;
    float _3488 = float(_3404);
    float _3490 = in.m_74.x;
    float _3492 = in.m_74.y;
    float _3494 = in.m_74.z;
    float _3496 = -_3060;
    float _3498 = fma(_1226, _3496, _3480);
    float _3500 = float(_3430);
    float _3502 = 1.0 / _3486;
    bool _3504 = !_3346;
    int _3506 = _3504 ? 0 : 1;
    out.m_76.x = _3488;
    bool _3508 = !_3350;
    int _3510 = _3508 ? 0 : 1;
    out.m_76.w = _3500;
    float _3512 = _2684 * _3478;
    float _3514 = _2694 * _3478;
    out.m_78.x = _3498;
    out.m_78.y = _3482;
    int _3516 = abs(_3506);
    if (_2802)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3518 = -_3512;
    float _3520 = fma(_3518, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2662);
    float _3522 = _2704 * _3478;
    float _3524 = -_3514;
    float _3526 = fma(_3524, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2680);
    float _3528 = float(_3516);
    float _3530 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3532 = _3520 + _3530;
    float _3534 = -_3522;
    float _3536 = fma(_3534, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2690);
    float _3538 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3540 = _3526 + _3538;
    float _3542 = -_3450;
    float _3544 = _3542 + 1.0;
    float _3546 = _3532 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _3548 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3550 = isnan(0.0);
    bool _3552 = _3548 || _3550;
    bool _3554 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3556 = _3552 || _3554;
    float _3558 = _3528 * _3446;
    float _3560 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3562 = _3536 + _3560;
    float _3564 = fma(_3540, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3546);
    float _3566 = _3556 ? _3544 : 0.0;
    float _3568 = _3558 * (-2.0);
    float _3570 = -_3512;
    float _3572 = fma(_3570, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2684);
    float _3574 = fma(_3562, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3564);
    float _3576 = -_3514;
    float _3578 = fma(_3576, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2694);
    float _3580 = fma(_3568, _3490, _3490);
    float _3582 = _3566;
    float _3584 = _3532;
    if (_3476)
    {
        float _3586 = _3566 * _3502;
        _131 = _3586;
    }
    float _3588 = _131;
    float _3590 = _3572 * _3572;
    bool _3592 = _3574 >= 0.0;
    float _3594 = fma(_2678, _3568, _2678);
    float _3596 = fma(_2626, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3580);
    int _3598 = _2790 ? 0 : 1;
    float _3600 = fma(_3578, _3578, _3590);
    float _3602 = -_3522;
    float _3604 = fma(_3602, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2704);
    float _3606 = fma(_3594, _3588, _3596);
    int _3608 = abs(_3510);
    int _3610 = ~_3598;
    int _3612 = _3610 + 1;
    int _3614 = _3612 + 1;
    float _3616 = fma(_3604, _3604, _3600);
    int _3618 = _3614;
    if (!_2778)
    {
        int _3620 = ~_3598;
        int _3622 = _3620 + 1;
        _3618 = _3622;
    }
    int _3624 = _3618;
    float _3626 = _3606 * 0.15915493667125701904296875;
    float _3628 = float(_2442);
    if (_3592)
    {
        out.m_55.x = 0.0;
    }
    if (_3592)
    {
        _3582 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3630 = _3582;
    float _3632 = sqrt(_3616);
    float _3634 = float(_3608);
    int _3636 = abs(_3456);
    int _3638 = as_type<int>(_3630);
    if (_3592)
    {
        float _3640 = _3630 * 5.0;
        _3638 = as_type<int>(_3640);
    }
    int _3642 = _3638;
    float _3644 = _3634 * _3628;
    float _3646 = _3626 * 6.283185482025146484375;
    float _3648 = sin(_3646);
    if (_3592)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10325 = as_type<float>(_3642);
        out.gl_Position.z = _10325;
    }
    float _3650 = float(_3624);
    float _3652 = float(_3636);
    if (_3592)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3654 = -_2662;
    float _3656 = _3654 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3658 = -_2680;
    float _3660 = _3658 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3662 = _3644 * (-2.0);
    float _3664 = -_2690;
    float _3666 = _3664 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3668 = _3656 * _3656;
    float _3670 = _3652 * _3650;
    float _3672 = fma(_3662, _3492, _3492);
    float _3674 = fma(_2698, _3662, _2698);
    float _3676 = fma(_3660, _3660, _3668);
    float _3678 = fma(_2632, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3672);
    float _3680 = _2620 + (-1.0);
    float _3682 = fma(_3666, _3666, _3676);
    float _3684 = _3670 * (-2.0);
    float _3686 = _996 + (-0.5);
    float _3688 = fma(_3680, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3690 = rsqrt(_3682);
    float _3692 = fma(_3684, _3494, _3494);
    float _3694 = fma(_3674, _3588, _3678);
    float _3696 = fma(_3688, _3684, _3688);
    float _3698 = _3478 * _3632;
    float _3700 = fma(_3686, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3692);
    float _3702 = _3694 * 0.15915493667125701904296875;
    float _3704 = _3626 * 6.283185482025146484375;
    float _3706 = cos(_3704);
    float _3708 = fma(_3696, _3588, _3700);
    float _3710 = _3708 * 0.15915493667125701904296875;
    float _3712 = _3660 * _3690;
    float _3714 = _3666 * _3690;
    float _3716 = _3656 * _3690;
    float _3718 = _3702 * 6.283185482025146484375;
    float _3720 = sin(_3718);
    float _3722 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3724 = _3712 * _3722;
    float _3726 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3728 = _3714 * _3726;
    float _3730 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3732 = _3716 * _3730;
    float _3734 = _583 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3736 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3738 = -_3724;
    float _3740 = fma(_3714, _3736, _3738);
    float _3742 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3744 = -_3728;
    float _3746 = fma(_3716, _3742, _3744);
    float _3748 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3750 = -_3732;
    float _3752 = fma(_3712, _3748, _3750);
    float _3754 = _3702 * 6.283185482025146484375;
    float _3756 = cos(_3754);
    float _3758 = _3740 * _3740;
    float _3760 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _3762 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3764 = fma(_3746, _3746, _3758);
    float _3766 = _3710 * 6.283185482025146484375;
    float _3768 = sin(_3766);
    float _3770 = fma(_3752, _3752, _3764);
    float _3772 = _581 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3774 = _3648 * _3720;
    float _3776 = _3706 * _3720;
    float _3778 = _3698 * _3772;
    float _3780 = _3710 * 6.283185482025146484375;
    float _3782 = cos(_3780);
    float _3784 = _3706 * _3756;
    float _3786 = _3760 * _3778;
    float _3788 = rsqrt(_3770);
    float _3790 = fma(_3768, _3784, _3774);
    float _3792 = fma(_3768, _3774, _3784);
    float _3794 = _3648 * _3756;
    float _3796 = -_3786;
    float _3798 = _3768 * _3796;
    float _3800 = -_3776;
    float _3802 = fma(_3768, _3794, _3800);
    float _3804 = _3706 * _3782;
    float _3806 = _3756 * _3782;
    float _3808 = _3648 * _3782;
    float _3810 = _3720 * _3782;
    float _3812 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _3814 = _3698 * _3734;
    float _3816 = _3804 * _3786;
    float _3818 = -_3794;
    float _3820 = fma(_3768, _3776, _3818);
    float _3822 = _3740 * _3788;
    float _3824 = _3812 * _3814;
    float _3826 = _3746 * _3788;
    float _3828 = _3698 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3830 = _3828 * 0.5;
    float _3832 = _3808 * _3786;
    float _3834 = fma(_3790, _3824, _3816);
    float _3836 = _3752 * _3788;
    float _3838 = _3714 * _3822;
    float _3840 = _3716 * _3826;
    float _3842 = fma(_3806, _3824, _3798);
    float _3844 = fma(_3820, _3830, _3834);
    float _3846 = -_3838;
    float _3848 = fma(_3716, _3836, _3846);
    float _3850 = -_3840;
    float _3852 = fma(_3712, _3822, _3850);
    float _3854 = fma(_3802, _3824, _3832);
    float _3856 = fma(_3810, _3830, _3842);
    float _3858 = _3848 * _3844;
    float _3860 = _3852 * _3844;
    float _3862 = fma(_3792, _3830, _3854);
    float _3864 = _3804 * _3848;
    float _3866 = fma(_3826, _3856, _3858);
    float _3868 = fma(_3836, _3856, _3860);
    float _3870 = _3804 * _3852;
    float _3872 = _3820 * _3848;
    float _3874 = fma(_3712, _3862, _3866);
    float _3876 = fma(_3714, _3862, _3868);
    float _3878 = _3820 * _3852;
    float _3880 = _3790 * _3852;
    float _3882 = _2680 + _3874;
    float _3884 = _2690 + _3876;
    float _3886 = _3712 * _3836;
    float _3888 = _3790 * _3848;
    float _3890 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3892 = _3882 + _3890;
    float _3894 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3896 = _3884 + _3894;
    float _3898 = -_3886;
    float _3900 = fma(_3714, _3826, _3898);
    float _3902 = -_3768;
    float _3904 = fma(_3902, _3836, _3870);
    float _3906 = _3892 * _3892;
    float _3908 = _3896 * _3896;
    float _3910 = _3804 * _3900;
    float _3912 = fma(_3806, _3826, _3888);
    float _3914 = fma(_3762, _3762, 1.0);
    float _3916 = _3906 + _3908;
    float _3918 = _3900 * _3844;
    float _3920 = _3790 * _3900;
    float _3922 = _3820 * _3900;
    float _3924 = sqrt(_3916);
    float _3926 = fma(_3822, _3856, _3918);
    float _3928 = fma(_3806, _3822, _3920);
    float _3930 = -_3768;
    float _3932 = fma(_3930, _3822, _3910);
    float _3934 = fma(_3810, _3822, _3922);
    float _3936 = fma(_3716, _3862, _3926);
    float _3938 = fma(_3806, _3836, _3880);
    float _3940 = -_3768;
    float _3942 = fma(_3940, _3826, _3864);
    float _3944 = rsqrt(_3914);
    float _3946 = _2662 + _3936;
    float _3948 = fma(_3810, _3826, _3872);
    float _3950 = fma(_3810, _3836, _3878);
    bool _3952 = _3924 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3954 = _3810;
    float _3956 = _3768;
    float _3958 = _3922;
    float _3960 = _3920;
    float _3962 = _3900;
    if (!_3952)
    {
        _3954 = _3908;
    }
    float _3964 = _3954;
    float _3966 = _3964;
    if (!_3952)
    {
        _3956 = _3906;
    }
    float _3968 = _3956;
    float _3970 = _3968;
    if (!_3952)
    {
        _3958 = _3882;
    }
    float _3972 = _3958;
    float _3974 = _3972;
    if (!_3952)
    {
        _3960 = _3884;
    }
    float _3976 = _3960;
    float _3978 = _3976;
    if (!_3952)
    {
        _3962 = _3946;
    }
    float _3980 = _3962;
    bool _3982 = !_3952;
    float _3984 = _3980;
    if (!_3982)
    {
        float _3986 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3988 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3990 = _3924 + _3988;
        float _3992 = _3946 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3994 = rsqrt(_3916);
        float _3996 = _3990 * _3986;
        float _3998 = _3996 * 0.15915493667125701904296875;
        float _4000 = _3998 * 6.283185482025146484375;
        float _4002 = sin(_4000);
        float _4004 = _3998 * 6.283185482025146484375;
        float _4006 = cos(_4004);
        float _4008 = fma(_4002, _3992, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4010 = _3994 * _4008;
        float _4012 = _4006 + (-1.0);
        float _4014 = fma(_3892, _4010, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4016 = fma(_3896, _4010, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _4018 = _4012 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4020 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _4022 = _4014 + _4020;
        float _4024 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _4026 = _4016 + _4024;
        float _4028 = fma(_3946, _4006, _4018);
        float _4030 = _4022 * _4022;
        float _4032 = _4026 * _4026;
        _3984 = _4028;
        _3970 = _4030;
        _3966 = _4032;
        _3978 = _4016;
        _3974 = _4014;
    }
    float _4034 = _3984;
    float _4036 = _3970;
    float _4038 = _3966;
    float _4040 = _3978;
    float _4042 = _3974;
    float _4044 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4046 = _4034 + _4044;
    float _4048 = fma(_3808, _3712, _3942);
    float _4050 = fma(_3808, _3716, _3932);
    float _4052 = fma(_3808, _3714, _3904);
    float _4054 = fma(_4046, _4046, _4036);
    float _4056 = fma(_3792, _3712, _3948);
    float _4058 = fma(_3792, _3716, _3934);
    float _4060 = fma(_3792, _3714, _3950);
    float _4062 = _4054 + _4038;
    float _4064 = _3762 * _3944;
    float _4066 = fma(_3802, _3712, _3912);
    float _4068 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4070 = _3762 * _4048;
    float _4072 = fma(_3802, _3716, _3928);
    float _4074 = fma(_3802, _3714, _3938);
    float _4076 = _3762 * _4050;
    float _4078 = _3762 * _4052;
    float _4080 = -_4056;
    float _4082 = _4064 * _4080;
    float _4084 = -_4058;
    float _4086 = _4064 * _4084;
    float _4088 = -_4060;
    float _4090 = _4064 * _4088;
    float _4092 = fma(_4068, _4066, _4070);
    float _4094 = sqrt(_4062);
    float _4096 = fma(_4068, _4072, _4076);
    float _4098 = fma(_4068, _4074, _4078);
    float _4100 = fma(_3944, _4048, _4082);
    float _4102 = fma(_3944, _4050, _4086);
    float _4104 = _4058 + _4096;
    float _4106 = fma(_3944, _4052, _4090);
    float _4108 = _4056 + _4092;
    float _4110 = _4060 + _4098;
    out.m_80.x = _4066;
    out.m_80.y = _4072;
    out.m_80.z = _4074;
    out.m_82.x = _4100;
    out.m_82.y = _4102;
    out.m_82.z = _4106;
    bool _4112 = _4094 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4114 = isnan(_4094);
    bool _4116 = _4112 || _4114;
    bool _4118 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4120 = _4116 || _4118;
    out.m_84.x = _4108;
    out.m_84.y = _4104;
    out.m_84.z = _4110;
    float _4122 = _4048;
    float _4124 = _4090;
    if (!_4120)
    {
        _4122 = 1.0;
    }
    float _4126 = _4122;
    bool _4128 = !_4120;
    float _4130 = _4126;
    if (!_4128)
    {
        bool _4132 = _4094 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4134 = isnan(_4094);
        bool _4136 = _4132 || _4134;
        bool _4138 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4140 = _4136 || _4138;
        if (!_4140)
        {
            float _4142 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4144 = _4094 + _4142;
            float _4146 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4148 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4146;
            float _4150 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4152 = _4150 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4154 = 1.0 / _4148;
            float _4156 = _4144 * _4154;
            float _4158 = fma(_4156, _4152, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4130 = _4158;
            _4160 = true;
        }
        else
        {
            bool _4162 = _4094 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4164 = isnan(_4094);
            bool _4166 = _4162 || _4164;
            bool _4168 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4170 = _4166 || _4168;
            if (!_4170)
            {
                float _4172 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4174 = _4094 + _4172;
                float _4176 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4178 = _4176 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4180 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4182 = _4180 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4184 = 1.0 / _4178;
                float _4186 = _4174 * _4184;
                float _4188 = fma(_4186, _4182, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4130 = _4188;
                _4160 = true;
            }
            else
            {
                _4130 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4160 = false;
    float _4190 = _4130;
    float _4192 = _3520 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4194 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4196 = _4034 + _4194;
    float _4198 = fma(_3526, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4192);
    float _4200 = fma(_4196, _4190, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _4202 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4204 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4206 = _4202 || _4204;
    bool _4208 = isnan(0.5);
    bool _4210 = _4206 || _4208;
    float _4212 = fma(_3536, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4198);
    float _4214 = _3520 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _4216 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4218 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4220 = _4216 || _4218;
    bool _4222 = isnan(0.5);
    bool _4224 = _4220 || _4222;
    float _4226 = _4212 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4228 = fma(_3526, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4214);
    float _4230 = 1.0 / _4226;
    float _4232 = fma(_3536, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4228);
    float _4234 = _4232 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4236 = _4234 + _4226;
    float _4238 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4240 = _4040 + _4238;
    float _4242 = -_3512;
    float _4244 = fma(_4242, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4200);
    float _4246 = _4236 * _4230;
    float _4248 = _4246 * 0.5;
    float _4250 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4252 = _4042 + _4250;
    float _4254 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4256 = fma(_4248, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4254);
    float _4258 = fma(_4252, _4190, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4260 = fma(_4240, _4190, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4262 = _4240;
    float _4264 = _4244;
    float _4266 = _4260;
    if (_4224)
    {
        _4262 = 1.0;
    }
    float _4268 = _4262;
    float _4270 = 1.0 / _4256;
    float _4272 = -_3514;
    float _4274 = fma(_4272, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4258);
    float _4276 = -_3522;
    float _4278 = fma(_4276, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4260);
    float _4280 = _4274;
    float _4282 = _4278;
    float _4284 = _4268;
    if (!_4210)
    {
        float _4286 = _3532 * _3532;
        float _4288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4290 = -_2690;
        float _4292 = _4290 + _4260;
        float _4294 = -_2662;
        float _4296 = _4294 + _4200;
        float _4298 = fma(_3540, _3540, _4286);
        float _4300 = -_2680;
        float _4302 = _4300 + _4258;
        float _4304 = fma(_3562, _3562, _4298);
        float _4306 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4308 = sqrt(_4304);
        float _4310 = 1.0 / _3698;
        float _4312 = _4306 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4314 = precise::min(_4308, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4316 = _4314 * _4288;
        float _4318 = _4316 * _4310;
        float _4320 = _4312 * _4318;
        float _4322 = _4292 * _4318;
        float _4324 = fma(_4296, _4320, _3520);
        float _4326 = fma(_4302, _4320, _3526);
        float _4328 = fma(_4312, _4322, _3536);
        _4264 = _4324;
        _4280 = _4326;
        _4282 = _4328;
        _3584 = _4308;
    }
    float _4330 = _4264;
    float _4332 = _4280;
    float _4334 = _4282;
    float _4336 = _3584;
    float _4338 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4340 = _4270 * _4338;
    if (!_4224)
    {
        float _4342 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4344 = _4342 * 0.15915493667125701904296875;
        float _4346 = _4344 * 6.283185482025146484375;
        float _4348 = cos(_4346);
        float _4350 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4352 = _4350 * 0.15915493667125701904296875;
        float _4354 = _4344 * 6.283185482025146484375;
        float _4356 = sin(_4354);
        float _4358 = 1.0 / _4348;
        float _4360 = _4352 * 6.283185482025146484375;
        float _4362 = cos(_4360);
        float _4364 = _4356 * _4358;
        float _4366 = _4352 * 6.283185482025146484375;
        float _4368 = sin(_4366);
        float _4370 = _4362 * _4364;
        float _4372 = 1.0 / _4370;
        float _4374 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4376 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4374;
        float _4378 = 1.0 / _4376;
        float _4380 = _4368 * _4372;
        float _4382 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4384 = fma(_4340, _4380, _4382);
        float _4386 = _4384 * _4378;
        float _4388 = precise::clamp(_4386, 0.0, 1.0);
        _4284 = _4388;
    }
    float _4390 = _4284;
    float _4392 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4394 = _4330 + _4392;
    float _4396 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4398 = _4332 + _4396;
    float _4400 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4402 = _4334 + _4400;
    float _4404 = _4394 * _4394;
    float _4406 = fma(_4398, _4398, _4404);
    float _4408 = fma(_4402, _4402, _4406);
    float _4410 = rsqrt(_4408);
    float _4412 = sqrt(_4408);
    float _4414 = _4410 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4416 = _4398 * _4414;
    float _4418 = _4402 * _4414;
    float _4420 = _4416 * _4416;
    float _4422 = _4418 * _4418;
    float _4424 = _4420 + _4422;
    float _4426 = sqrt(_4424);
    bool _4428 = _4426 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4430 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4432 = _4426 + _4430;
    float _4434 = _3540;
    float _4436 = _4432;
    float _4438 = _4394;
    float _4440 = _4416;
    if (_4428)
    {
        float _4442 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4434 = _4442;
    }
    float _4444 = _4434;
    float _4446 = _4444;
    if (_4428)
    {
        float _4448 = _4432 * _4444;
        _4436 = _4448;
    }
    float _4450 = _4436;
    if (_4428)
    {
        float _4452 = rsqrt(_4424);
        _4446 = _4452;
    }
    float _4454 = _4446;
    float _4456 = _4454;
    if (_4428)
    {
        float _4458 = _4450 * 0.15915493667125701904296875;
        _4266 = _4458;
    }
    float _4460 = _4266;
    float _4462 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4464 = _4402;
    if (_4428)
    {
        float _4466 = _4460 * 6.283185482025146484375;
        float _4468 = sin(_4466);
        _4464 = _4468;
    }
    float _4470 = _4464;
    float _4472 = precise::max(0.0, _4462);
    float _4474 = _4336;
    float _4476 = _4472;
    if (_4428)
    {
        float _4478 = _4460 * 6.283185482025146484375;
        float _4480 = cos(_4478);
        _4474 = _4480;
    }
    float _4482 = _4474;
    float _4484 = -_4414;
    float _4486 = -_4472;
    float _4488 = fma(_4394, _4484, _4486);
    if (_4428)
    {
        float _4490 = _4488 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4438 = _4490;
    }
    float _4492 = _4438;
    float _4494 = _4470;
    float _4496 = _4492;
    if (_4428)
    {
        float _4498 = fma(_4470, _4492, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4494 = _4498;
    }
    float _4500 = _4494;
    float _4502 = _4500;
    if (!_4428)
    {
        _4496 = _4488;
    }
    float _4504 = _4496;
    float _4506 = _4504;
    if (_4428)
    {
        float _4508 = _4454 * _4500;
        _4124 = _4508;
    }
    float _4510 = _4124;
    if (!_4428)
    {
        _4502 = _4420;
    }
    float _4512 = _4502;
    float _4514 = _4330 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4516 = _4512;
    float _4518 = _4482;
    if (_4428)
    {
        float _4520 = _4482 + (-1.0);
        _4476 = _4520;
    }
    float _4522 = _4476;
    float _4524 = _4522;
    if (_4428)
    {
        float _4526 = _4416 * _4510;
        _4440 = _4526;
    }
    float _4528 = _4440;
    float _4530 = fma(_3526, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4532 = _4330 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_4428)
    {
        float _4534 = _4522 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4456 = _4534;
    }
    float _4536 = _4456;
    if (!_4428)
    {
        _4524 = _4418;
    }
    float _4538 = _4524;
    float _4540 = _4538;
    if (_4428)
    {
        float _4542 = _4418 * _4510;
        _4540 = _4542;
    }
    float _4544 = _4540;
    if (_4428)
    {
        float _4546 = _4528 * _4528;
        _4516 = _4546;
    }
    float _4548 = _4516;
    if (_4428)
    {
        float _4550 = fma(_4488, _4482, _4536);
        _4506 = _4550;
    }
    float _4552 = _4506;
    if (!_4428)
    {
        _4518 = _4422;
    }
    float _4554 = _4518;
    float _4556 = _4554;
    if (_4428)
    {
        float _4558 = _4544 * _4544;
        _4556 = _4558;
    }
    float _4560 = _4556;
    float _4562 = fma(_4332, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4532);
    float _4564 = fma(_4552, _4552, _4548);
    float _4566 = _4330 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4568 = fma(_4334, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4562);
    float _4570 = _4564 + _4560;
    float _4572 = _4330 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4574 = fma(_4332, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4566);
    float _4576 = _4568 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4578 = rsqrt(_4570);
    float _4580 = fma(_4332, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4572);
    float _4582 = fma(_4332, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4514);
    float _4584 = fma(_4334, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4574);
    float _4586 = fma(_4334, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4580);
    float _4588 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4590 = fma(_4412, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4588);
    float _4592 = precise::clamp(_4590, 0.0, 1.0);
    float _4594 = fma(_4334, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4582);
    float _4596 = _4584 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4598 = _4586 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4600 = fma(_3536, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4602 = -_4592;
    float _4604 = _4602 + 1.0;
    float _4606 = _4594 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4608 = _4598 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4610 = floor(_4530);
    float _4612 = _4578 * _4528;
    float _4614 = fma(_4576, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4608);
    float _4616 = _4578 * _4552;
    float _4618 = _4578 * _4544;
    float _4620 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4614);
    float _4622 = abs(_4604);
    float _4624 = log2(_4622);
    float _4626 = fma(_4606, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4620);
    float _4628 = _4612 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4630 = -_4628;
    float _4632 = fma(_4616, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4630);
    float _4634 = floor(_4600);
    float _4636 = -_4610;
    float _4638 = _4530 + _4636;
    float _4640 = -_4618;
    float _4642 = fma(_4640, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4632);
    float _4644 = _4596 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4646 = fma(_4642, -0.5, 0.5);
    float _4648 = _4624 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4650 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4652 = fma(_4642, 0.5, 0.5);
    float _4654 = sqrt(_4646);
    float _4656 = -_4644;
    float _4658 = fma(_4656, _4650, 1.0);
    float _4660 = fma(_4652, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4662 = _4598 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4664 = fma(_4652, _4660, -0.212114393711090087890625);
    float _4666 = exp2(_4648);
    float _4668 = fma(_4576, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4662);
    float _4670 = -_4634;
    float _4672 = _4600 + _4670;
    float _4674 = fma(_4652, _4664, 1.570728778839111328125);
    float _4676 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4668);
    float _4678 = 1.0 / _4626;
    float _4680 = _4598 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4682 = fma(_4606, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4676);
    float _4684 = _4654 * 0.636619746685028076171875;
    float _4686 = fma(_4576, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4680);
    float _4688 = log2(_4658);
    float _4690 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4686);
    float _4692 = _4616 + 1.0;
    float _4694 = fma(_4606, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4690);
    float2 _12023 = float2(_4638, _4672);
    float _4696 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12023, float2(0.0), isnan(_12023)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12023, float2(0.0), isnan(_12023)), level(0.0)).x;
    float _4698 = -_4616;
    float _4700 = fma(_4666, _4692, _4698);
    float _4702 = _4682 * _4678;
    float _4704 = _4694 * _4678;
    float _4706 = -_4674;
    float _4708 = fma(_4684, _4706, 1.0);
    float _4710 = fma(_4700, 0.5, 0.5);
    float _4712 = fma(_4702, 0.5, 0.5);
    float _4714 = fma(_4704, -0.5, 0.5);
    float _4716 = _4688 * 0.693147182464599609375;
    float _4718 = _4716 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _12064 = float3(_4712, _4714, _4718);
    float _4720 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12064, float3(0.0), isnan(_12064)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12064, float3(0.0), isnan(_12064)), level(0.0)).x;
    float3 _12075 = float3(_4712, _4714, _4718);
    float4 _4723 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12075, float3(0.0), isnan(_12075)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12075, float3(0.0), isnan(_12075)), level(0.0)).xyzw;
    float _4725 = _4723.x;
    float _4727 = _4723.y;
    float _4729 = _4723.z;
    float _4731 = _4723.w;
    float2 _12091 = float2(_4708, _4710);
    float3 _4735 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12091, float2(0.0), isnan(_12091)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12091, float2(0.0), isnan(_12091)), level(0.0)).xyz;
    float _4737 = _4735.x;
    float _4739 = _4735.y;
    float _4741 = _4735.z;
    float _4743 = abs(_4340);
    float _4745 = log2(_4743);
    float _4747 = _4598 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _4749 = _4412 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4751 = isnan(_4412);
    bool _4753 = _4749 || _4751;
    bool _4755 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4757 = _4753 || _4755;
    float _4759 = fma(_4576, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4747);
    float _4761 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4759);
    float _4763 = _4624 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4765 = fma(_4606, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4761);
    float _4767 = _4682 + _4626;
    float _4769 = _4745 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4771 = exp2(_4763);
    out.gl_Position.x = _4682;
    out.gl_Position.y = _4694;
    out.gl_Position.z = _4765;
    out.gl_Position.w = _4626;
    float _4773 = exp2(_4769);
    float _4775 = -_4771;
    float _4777 = _4775 + 1.0;
    float _4779 = _4777 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4781 = fma(_4773, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4783 = precise::clamp(_4781, 0.0, 1.0);
    bool _4785 = _4340 <= 8000.0;
    bool _4787 = isnan(_4340);
    bool _4789 = _4785 || _4787;
    bool _4791 = isnan(8000.0);
    bool _4793 = _4789 || _4791;
    float _4795 = float(_4793);
    float _4797 = _4626 * 0.5;
    float _4799 = -_4779;
    float _4801 = _4799 + 1.0;
    float _4803 = fma(_4783, -2.0, 3.0);
    float _4805 = _4783 * _4783;
    float _4807 = _4805 * _4803;
    float _4809 = fma(_4694, -0.5, _4797);
    float _4811 = _4765 + _4626;
    float _4813 = -_4807;
    float _4815 = _4813 + 1.0;
    float _4817 = _4390 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4819 = _4811 * 0.5;
    float _4821 = _4694;
    float _4823 = _4801;
    if (!_4757)
    {
        _4821 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4825 = _4821;
    float _4827 = fma(_4815, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4807);
    float _4829 = _4767 * 0.5;
    float _4831 = in.m_86.x;
    float _4833 = _4795 * _4827;
    out.m_88.x = _4829;
    out.m_88.y = _4809;
    out.m_88.z = _4819;
    out.m_88.w = _4626;
    float _4835 = _4833 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4837 = -_4696;
    float _4839 = _4837 + 1.0;
    float _4841 = _4839 * _4835;
    float _4843 = precise::clamp(_4841, 0.0, 1.0);
    float _4845 = -_4843;
    float _4847 = fma(_4845, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4849 = _4847 * _4831;
    float _4851 = _4849 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4853 = _4779 * _4720;
    float _4855 = _4731 * _4801;
    float _4857 = _4825;
    float _4859 = _4825;
    if (!_4757)
    {
        _4823 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4861 = _4823;
    out.m_90.x = _4851;
    float _4863 = _4731 * _4853;
    float _4865 = _4741 * _4853;
    float _4867 = fma(_4737, _4863, _4725);
    float _4869 = fma(_4739, _4863, _4727);
    float _4871 = fma(_4731, _4865, _4729);
    float _4873 = _4863;
    float _4875 = _4861;
    float _4877 = _4861;
    if (!_4757)
    {
        _4873 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4879 = _4873;
    out.m_92.x = _4867;
    out.m_92.y = _4869;
    out.m_92.z = _4871;
    out.m_92.w = _4855;
    bool _4881 = !_4757;
    float _4883 = _4879;
    float _4885 = _4879;
    if (!_4881)
    {
        bool _4887 = _4412 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4889 = isnan(_4412);
        bool _4891 = _4887 || _4889;
        bool _4893 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4895 = _4891 || _4893;
        if (!_4895)
        {
            float _4897 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4899 = _4412 + _4897;
            float _4901 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4903 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4901;
            float _4905 = 1.0 / _4903;
            float _4907 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4909 = _4907 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4911 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4913 = _4911 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4915 = _4899 * _4905;
            float _4917 = precise::clamp(_4915, 0.0, 1.0);
            float _4919 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4921 = _4919 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4923 = fma(_4917, _4913, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4925 = fma(_4917, _4921, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4927 = fma(_4917, _4909, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _4877 = _4927;
            _4859 = _4925;
            _4885 = _4923;
            _4929 = true;
        }
        else
        {
            bool _4931 = _4412 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4933 = isnan(_4412);
            bool _4935 = _4931 || _4933;
            bool _4937 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4939 = _4935 || _4937;
            if (!_4939)
            {
                _4857 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4941 = _4857;
            _4859 = _4941;
            if (!_4939)
            {
                _4875 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4943 = _4875;
            _4877 = _4943;
            if (!_4939)
            {
                _4883 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4945 = _4883;
            bool _4947 = !_4939;
            _4885 = _4945;
            if (!_4947)
            {
                bool _4949 = _4412 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4951 = isnan(_4412);
                bool _4953 = _4949 || _4951;
                bool _4955 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4957 = _4953 || _4955;
                if (!_4957)
                {
                    float _4959 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4961 = _4412 + _4959;
                    float _4963 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4965 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4963;
                    float _4967 = 1.0 / _4965;
                    float _4969 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4971 = _4969 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4973 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4975 = _4973 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4977 = _4961 * _4967;
                    float _4979 = precise::clamp(_4977, 0.0, 1.0);
                    float _4981 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4983 = _4981 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4985 = fma(_4979, _4975, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4987 = fma(_4979, _4983, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4989 = fma(_4979, _4971, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _4877 = _4989;
                    _4859 = _4987;
                    _4885 = _4985;
                    _4929 = true;
                }
                else
                {
                    _4877 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4859 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4885 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4929 = false;
    float _4991 = _4877;
    float _4993 = _4859;
    float _4995 = _4885;
    float _4997 = _4817 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_94.x = 0.0;
    float _4999 = _4991 * 0.586610972881317138671875;
    bool _5001 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_55.x = _4997;
    float _5003 = fma(_4993, 0.298911988735198974609375, _4999);
    bool _5005 = _4390 > 0.0;
    bool _5007 = isnan(_4390);
    bool _5009 = _5005 || _5007;
    bool _5011 = isnan(0.0);
    bool _5013 = _5009 || _5011;
    float _5015 = fma(_4995, 0.114477999508380889892578125, _5003);
    float _5017 = -_5015;
    float _5019 = _5017 + _4993;
    float _5021 = -_5015;
    float _5023 = _5021 + _4991;
    float _5025 = -_5015;
    float _5027 = _5025 + _4995;
    float _5029 = fma(_5019, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5015);
    float _5031 = fma(_5023, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5015);
    float _5033 = fma(_5027, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5015);
    bool _5035 = !_5001;
    if (!_5035)
    {
        float _5037 = -_4330;
        float _5039 = _5037 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5041 = -_4332;
        float _5043 = _5041 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5045 = -_4334;
        float _5047 = _5045 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5049 = _5039 * _5039;
        float _5051 = fma(_5043, _5043, _5049);
        float _5053 = fma(_5047, _5047, _5051);
        float _5055 = sqrt(_5053);
        float _5057 = rsqrt(_5053);
        float _5059 = -_5055;
        float _5061 = _5059 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5063 = _5061 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5065 = precise::clamp(_5063, 0.0, 1.0);
        float _5067 = _5043 * _5057;
        float _5069 = _5039 * _5057;
        float _5071 = abs(_5065);
        float _5073 = log2(_5071);
        float _5075 = _5047 * _5057;
        float _5077 = _5067 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5079 = _4104 * _5069;
        float _5081 = -_5069;
        float _5083 = -_5077;
        float _5085 = fma(_5081, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5083);
        float _5087 = fma(_4108, _5067, _5079);
        float _5089 = -_5075;
        float _5091 = fma(_5089, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5085);
        float _5093 = fma(_4110, _5075, _5087);
        float _5095 = precise::clamp(_5093, 0.0, 1.0);
        float _5097 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5099 = _5091 + _5097;
        float _5101 = _5073 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5103 = _5099 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5105 = precise::clamp(_5103, 0.0, 1.0);
        float _5107 = exp2(_5101);
        float _5109 = _5107 * _5105;
        float _5111 = _5095 * _5109;
        float _5113 = _5111 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5115 = _5111 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5117 = _5111 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _5113;
        out.m_94.y = _5115;
        out.m_94.z = _5117;
    }
    out.m_96.x = _5029;
    out.m_96.y = _5031;
    out.m_96.z = _5033;
    if (_5013)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_55.x = 0.0;
    float _5119 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5119;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4929 = false;
    bool _4160 = false;
    bool _605 = false;
    bool _499 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_48.w;
    float _112 = in.m_50.w;
    float _114 = trunc(_110);
    int _117 = int(_114);
    float _119 = -_112;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _121;
    bool _125 = _117 >= 1;
    float _127 = 0.0;
    float _129 = as_type<float>(_117);
    float _131 = _121;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _127;
    if (!_125)
    {
        out.m_55.x = 0.0;
    }
    int _135 = 0;
    if (!_125)
    {
        float _137 = _133 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5188 = as_type<float>(_139);
        out.gl_Position.z = _5188;
    }
    if (!_125)
    {
        return out;
    }
    bool _143 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_112);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = float(_117);
    bool _155 = _121 >= _153;
    bool _157 = !_151;
    bool _159 = _155 || _157;
    float _161 = 1.0 / _153;
    if (_159)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _129;
    if (_159)
    {
        out.m_55.x = 0.0;
    }
    float _165 = _121 * _161;
    float _167 = _165;
    if (_159)
    {
        float _169 = _163 * 5.0;
        _141 = as_type<int>(_169);
    }
    int _171 = _141;
    out.m_53.x = _165;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5251 = as_type<float>(_171);
        out.gl_Position.z = _5251;
    }
    if (_159)
    {
        return out;
    }
    float _173 = as_type<float>(int(gl_VertexIndex));
    bool _175 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _177 = as_type<int>(_173) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_173) & 2;
    bool _183 = _181 != 0;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_175;
    float _211;
    if (!_193)
    {
        float _195 = in.m_60.x;
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _211 = _209;
        _213 = true;
    }
    else
    {
        _211 = _165;
    }
    _213 = false;
    float _215 = _211;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _219 = _215 + _217;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _227 = _225 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _229;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _235 = _233 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _237 = 1.0 / _223;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _239;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _245 = 1.0 / _231;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = _215 + _247;
    float _251 = 1.0 / _227;
    float _253 = _249 * _237;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = _215 + _255;
    bool _259 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _261 = isnan(_215);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    bool _271 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _273 = isnan(_215);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = 1.0 / _235;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _287 = _215 + _285;
    float _289 = _257 * _245;
    bool _291 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _293 = isnan(_215);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = 1.0 / _241;
    float _305 = _219 * _251;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _309 = _215 + _307;
    float _311 = -_301;
    float _313 = _311 + 1.0;
    float _315 = _287 * _283;
    float _317 = -_269;
    float _319 = _317 + 1.0;
    float _321 = _281 * _313;
    bool _323 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _325 = isnan(_215);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = _301 * _319;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _341;
    float _345 = _309 * _303;
    bool _347 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _349 = isnan(_215);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = -_281;
    float _361 = _359 + 1.0;
    float _363 = fma(_339, _253, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _365 = fma(_343, _253, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _367 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _369 = isnan(_215);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = _357 * _361;
    float _381 = -_357;
    float _383 = _381 + 1.0;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _393 = _333 * _383;
    float _395 = -_333;
    float _397 = _395 + 1.0;
    float _399 = -_377;
    float _401 = _399 + 1.0;
    float _403 = fma(_391, _305, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _405 = fma(_387, _305, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _407 = _377 * _397;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _413;
    float _417 = _363 * _407;
    float _419 = _365 * _407;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _425 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[143].x, _417);
    float _427 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[143].y, _419);
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _433 = fma(_411, _289, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _435 = fma(_403, _393, _425);
    float _437 = fma(_415, _289, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _439 = fma(_405, _393, _427);
    float _441 = fma(_423, _315, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _443;
    float _447 = fma(_433, _379, _435);
    float _449 = fma(_431, _315, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _451;
    float _455 = fma(_437, _379, _439);
    float _457 = fma(_445, _345, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _459 = fma(_441, _321, _447);
    float _461 = fma(_453, _345, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _463 = fma(_449, _321, _455);
    float _465 = fma(_457, _335, _459);
    float _467 = fma(_461, _335, _463);
    float _469 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[148].x, _465);
    float _471 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[148].y, _467);
    bool _473 = !_243;
    float _475 = _345;
    float _477 = _305;
    float _479 = _289;
    float _497;
    if (!_473)
    {
        float _481 = in.m_60.x;
        float _483 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _485 = _481 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _487 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _489 = _487 * _483;
        float _491 = floor(_489);
        float _493 = -_491;
        float _495 = _489 + _493;
        _497 = _495;
        _499 = true;
    }
    else
    {
        _497 = _165;
    }
    _499 = false;
    float _501 = _497;
    bool _503 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _505 = isnan(_501);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _519 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _521 = isnan(_501);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _537 = _501 + _535;
    float _539 = -_513;
    float _541 = _539 + 1.0;
    bool _543 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _545 = 1.0 / _517;
    float _547 = _529 * _541;
    float _549 = -_529;
    float _551 = _549 + 1.0;
    float _553 = _533 * _545;
    float _555 = fma(_553, _537, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _559 = _555 * _547;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _563 = _557 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _565 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[115].x, _559);
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _569 = _561 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _571 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[116].x, _565);
    float _573 = in.m_62.x;
    float _575 = in.m_62.y;
    float _577 = _567 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _579 = _571 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _577;
    out.m_64.y = _569;
    out.m_64.z = _563;
    out.m_64.w = _579;
    float _581 = _471 * _575;
    float _583 = _469 * _573;
    bool _585 = !_543;
    float _603;
    if (!_585)
    {
        float _587 = in.m_60.x;
        float _589 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _591 = _587 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _593 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _595 = _593 * _589;
        float _597 = floor(_595);
        float _599 = -_597;
        float _601 = _595 + _599;
        _603 = _601;
        _605 = true;
    }
    else
    {
        _603 = _165;
    }
    _605 = false;
    float _607 = _603;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _611 = _607 + _609;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _617 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _619 = isnan(_607);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _633 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _635 = isnan(_607);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _645;
    bool _649 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _651 = isnan(_607);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = 1.0 / _615;
    float _663 = -_627;
    float _665 = _663 + 1.0;
    bool _667 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _669 = 1.0 / _631;
    float _671 = _647 * _661;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _677 = -_659;
    float _679 = _677 + 1.0;
    float _681 = fma(_671, _611, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _683 = _643 * _665;
    float _685 = -_643;
    float _687 = _685 + 1.0;
    float _689 = _627 * _679;
    float _691 = _675 * _669;
    float _693 = _681 * _683;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _697 = _607 + _695;
    float _699 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[131].x, _693);
    float _701 = fma(_691, _697, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _705 = fma(_701, _689, _699);
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _709 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _713 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[133].x, _705);
    float _715 = _707 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _717 = _711 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _719 = _713 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_66.x = _709;
    out.m_66.y = _715;
    out.m_66.z = _717;
    out.m_66.w = _719;
    bool _721 = !_667;
    int _723 = as_type<int>(_717);
    if (!_721)
    {
        float _725 = in.m_60.x;
        float _727 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _729 = _725 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _731 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[14].x, _121);
        float _733 = _731 * _727;
        float _735 = floor(_733);
        float _737 = -_735;
        float _739 = _733 + _737;
        _167 = _739;
    }
    float _741 = _167;
    float _743 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _745 = int(_743);
    int _747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _749 = _747 != 0;
    float _751 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _753 = int(_751);
    float _755 = float(_745);
    float _757 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _759 = int(_757);
    float _761 = _699;
    if (_749)
    {
        float _763 = in.m_60.w;
        _761 = _763;
    }
    float _765 = _761;
    float _767 = float(_753);
    float _769 = 1.0 / _755;
    float _771 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _773 = int(_771);
    float _775 = float(uint(_759));
    float _777 = float(_759);
    int _779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _781 = _779 != 0;
    float _783 = _769 * _121;
    float _785 = 1.0 / _767;
    float _787 = float(_773);
    float _789 = 1.0 / _775;
    float _791 = _787;
    if (_781)
    {
        _475 = 1.0;
    }
    float _793 = _475;
    float _795 = _793;
    if (_781)
    {
        _477 = 1.0;
    }
    float _797 = _477;
    float _799 = _797;
    if (_781)
    {
        _723 = 0;
    }
    int _801 = _723;
    float _803 = trunc(_783);
    int _805 = int(_803);
    float _807 = _785 * _121;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _811 = _785;
    int _813 = _801;
    if (_781)
    {
        float _815 = in.m_60.x;
        float _817 = in.m_60.y;
        _809 = _815;
        _811 = _817;
    }
    float _819 = _809;
    float _821 = _811;
    float _823 = 1.0 / _787;
    int _825 = as_type<int>(_789) + (-2);
    int _827 = as_type<int>(_789);
    if (_781)
    {
        _827 = 0;
    }
    int _829 = _827;
    float _831 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _833 = int(_831);
    int _835 = _829;
    if (_749)
    {
        float _837 = _765 * 3.1415927410125732421875;
        _791 = _837;
    }
    float _839 = _791;
    int _841 = ~_759;
    int _843 = _841 + 1;
    if (_749)
    {
        float _845 = _839 * 0.15915493667125701904296875;
        _479 = _845;
    }
    float _847 = _479;
    float _849 = float(uint(_805));
    float _851 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _853 = int(_851);
    float _855 = _823 * _121;
    float _857 = as_type<float>(_825) * _849;
    float _859 = float(_805);
    float _861 = 0.0;
    float _863 = _859;
    float _865 = _819;
    float _867 = _821;
    if (_781)
    {
        _861 = _821;
    }
    float _869 = _861;
    bool _871 = _859 >= _777;
    bool _873 = isnan(_859);
    bool _875 = _871 || _873;
    bool _877 = isnan(_777);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    float _883 = trunc(_857);
    float _885 = precise::max(_883, 0.0);
    uint _888 = uint(_885);
    float _890 = float(uint(_833));
    float _892 = float(uint(_853));
    float _894 = 1.0 / _890;
    float _896 = trunc(_807);
    int _898 = int(_896);
    int _900 = _843 * int(_888);
    int _902 = _900 + _805;
    float _904 = trunc(_855);
    int _906 = int(_904);
    float _908 = _847;
    float _910 = _892;
    float _912 = _869;
    if (_749)
    {
        float _914 = _847 * 6.283185482025146484375;
        float _916 = sin(_914);
        _908 = _916;
    }
    float _918 = _908;
    float _920 = trunc(_881);
    int _922 = int(_920);
    float _924 = 1.0 / _892;
    if (_781)
    {
        _910 = _819;
    }
    float _926 = _910;
    float _928 = 0.0;
    float _930 = _926;
    if (_781)
    {
        _928 = _926;
    }
    float _932 = _928;
    float _934 = _932;
    if (_781)
    {
        _863 = _926;
    }
    float _936 = _863;
    float _938 = _936;
    if (!_781)
    {
        float _940 = in.m_60.x;
        float _942 = in.m_60.y;
        float _944 = in.m_60.z;
        float _946 = _940 * 3.1415927410125732421875;
        float _948 = _946 * 0.15915493667125701904296875;
        float _950 = _942 * 3.1415927410125732421875;
        float _952 = _950 * 0.15915493667125701904296875;
        float _954 = _948 * 6.283185482025146484375;
        float _956 = sin(_954);
        float _958 = _952 * 6.283185482025146484375;
        float _960 = sin(_958);
        _795 = 7.345489978790283203125;
        _865 = _940;
        _799 = 5.839270114898681640625;
        _938 = _944;
        _867 = _942;
        _930 = _942;
        _813 = 1;
        _835 = 2;
        _912 = _960;
        _934 = _956;
    }
    float _962 = _795;
    float _964 = _865;
    float _966 = _799;
    float _968 = _938;
    float _970 = _867;
    float _972 = _930;
    int _974 = _813;
    int _976 = _835;
    float _978 = _912;
    float _980 = _934;
    float _982 = float(uint(_902));
    float _984 = _962 * _964;
    int _986 = as_type<int>(_894) + (-2);
    float _988 = _966 * _968;
    float _990 = float(uint(_898));
    float _992 = as_type<float>(_825) * _982;
    float _994 = floor(_984);
    float _996 = in.m_60.z;
    float _998 = in.m_60.w;
    int _1000 = ~_759;
    int _1002 = _1000 + 1;
    float _1004 = as_type<float>(_986) * _990;
    int _1006 = as_type<int>(_924) + (-2);
    float _1008 = _970 + _964;
    float _1010 = float(uint(_906));
    float _1012 = _970 * 2.0;
    float _1014 = trunc(_992);
    float _1016 = precise::max(_1014, 0.0);
    uint _1018 = uint(_1016);
    int _1020 = ~_833;
    int _1022 = _1020 + 1;
    float _1024 = as_type<float>(_1006) * _1010;
    int _1026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1028 = _1026 != 0;
    bool _1030 = _759 == 0;
    float _1032 = trunc(_1004);
    float _1034 = precise::max(_1032, 0.0);
    uint _1036 = uint(_1034);
    float _1038 = -_994;
    float _1040 = _984 + _1038;
    float _1042 = 0.0;
    bool _1044 = _1028;
    if (!_749)
    {
        _1042 = _187;
    }
    float _1046 = _1042;
    float _1048 = _1040 * _777;
    bool _1050 = _970 > 0.5;
    int _1052 = int(_888) + int(_1018);
    float _1054 = trunc(_1024);
    float _1056 = precise::max(_1054, 0.0);
    uint _1058 = uint(_1056);
    bool _1060 = _998 > 0.5;
    bool _1062 = !_1028;
    int _1064 = _1062 ? 0 : 1;
    int _1066 = _1002 * _1052;
    int _1068 = _1066 + _805;
    float _1070 = _1046;
    if (_749)
    {
        bool _1072 = _918 > 0.5;
        _1044 = _1072;
    }
    bool _1074 = _1044;
    float _1076 = _962 * _972;
    int _1078 = _1022 * int(_1036);
    int _1080 = _1078 + _898;
    float _1082 = floor(_988);
    bool _1084 = uint(_1068) >= uint(_759);
    int _1086 = ~_853;
    int _1088 = _1086 + 1;
    float _1090 = float(uint(_1080));
    bool _1092 = !_1084;
    int _1094 = _1092 ? 0 : (-1);
    int _1096 = _1088 * int(_1058);
    int _1098 = _1096 + _906;
    int _1100 = abs(_1064);
    float _1102 = as_type<float>(_986) * _1090;
    int _1104 = ~_1052;
    int _1106 = _1104 + _1094;
    int _1108 = _1106 + 1;
    float _1110 = trunc(_1048);
    int _1112 = int(_1110);
    float _1114 = float(uint(_1098));
    int _1116 = ~_922;
    int _1118 = _1116 + 1;
    int _1120 = _1118 + 1;
    int _1122 = _759 * _1108;
    int _1124 = _1122 + _805;
    int _1126 = _759 + (-1);
    float _1128 = as_type<float>(_1006) * _1114;
    if (_749)
    {
        float _1130 = -_187;
        float _1132 = _1074 ? _1130 : _187;
        _1070 = _1132;
    }
    float _1134 = _1070;
    float _1136 = trunc(_1102);
    float _1138 = precise::max(_1136, 0.0);
    uint _1140 = uint(_1138);
    bool _1142 = !_1030;
    int _1144 = _1142 ? _1124 : (-1);
    float _1146 = -_1082;
    float _1148 = _988 + _1146;
    bool _1150 = _996 > 0.5;
    float _1152 = -_187;
    int _1154 = _1050 ? as_type<int>(_1152) : as_type<int>(_187);
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1158 = _1156 != 0;
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1162 = _1160 != 0;
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1166 = _1164 != 0;
    float _1168 = trunc(_1128);
    float _1170 = precise::max(_1168, 0.0);
    uint _1172 = uint(_1170);
    int _1174 = _1112 * _1100;
    int _1176 = _1174 + _805;
    int _1178 = int(_1060);
    int _1180 = _1150 ? 2 : 0;
    int _1182 = _1178 | _1180;
    int _1184 = _1074 ? 4 : 0;
    int _1186 = _1182 | _1184;
    int _1188 = _1158 ? 8 : 0;
    int _1190 = _1186 | _1188;
    int _1192 = _1162 ? 16 : 0;
    int _1194 = _1190 | _1192;
    int _1196 = _1166 ? 32 : 0;
    int _1198 = _1194 | _1196;
    int _1200 = _1050 ? 64 : 0;
    int _1202 = _1198 | _1200;
    int _1204 = _1202 & 64;
    float _1206 = -_191;
    int _1208 = _1060 ? as_type<int>(_1206) : as_type<int>(_191);
    float _1210 = float(_833);
    float _1212 = floor(_1076);
    int _1214 = int(_1036) + int(_1140);
    int _1216 = _1144 * _1120;
    float _1218 = -_191;
    int _1220 = _1150 ? as_type<int>(_1218) : as_type<int>(_191);
    float _1222 = _1148 * _1210;
    bool _1224 = !_1162;
    float _1226 = _1224 ? _187 : as_type<float>(_1154);
    int _1228 = _922 * _1126;
    int _1230 = _1228 + _1216;
    float _1232 = _161 * _121;
    bool _1234 = !_1166;
    float _1236 = _1234 ? _191 : as_type<float>(_1220);
    float _1238 = trunc(_1222);
    int _1240 = int(_1238);
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1244 = _1242 != 0;
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1248 = _1246 != 0;
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1252 = _1250 != 0;
    float _1254 = _777 * _1232;
    int _1256 = int(_1058) + int(_1172);
    int _1258 = ~_833;
    int _1260 = _1258 + 1;
    bool _1262 = !_1248;
    int _1264 = _1262 ? 0 : 1;
    float _1266 = trunc(_1254);
    int _1268 = int(_1266);
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1272 = _1270 != 0;
    int _1274 = _1260 * _1214;
    int _1276 = _1274 + _898;
    int _1278 = abs(_1264);
    float _1280 = -_1212;
    float _1282 = _1076 + _1280;
    bool _1284 = !_1244;
    int _1286 = _1284 ? 0 : 1;
    bool _1288 = !_1158;
    float _1290 = _1288 ? _191 : as_type<float>(_1208);
    int _1292 = _1230 * _1278;
    float _1294 = float(_898);
    bool _1296 = !_1252;
    int _1298 = _1296 ? 0 : 1;
    int _1300 = ~_853;
    int _1302 = _1300 + 1;
    int _1304 = abs(_1286);
    bool _1306 = !_1272;
    int _1308 = _1306 ? 0 : 1;
    int _1310 = _1302 * _1256;
    int _1312 = _1310 + _906;
    int _1314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1316 = _1314 != 0;
    int _1318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1320 = _1318 != 0;
    int _1322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1324 = _1322 != 0;
    int _1326 = _1268 * _1304;
    int _1328 = _1326 + _1292;
    bool _1330 = _1294 >= _1210;
    bool _1332 = isnan(_1294);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan(_1210);
    bool _1338 = _1334 || _1336;
    float _1340 = float(_1338);
    float _1342 = _1210 * _1232;
    int _1344 = abs(_1298);
    int _1346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1348 = _1346 != 0;
    int _1350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1352 = _1350 != 0;
    float _1354 = trunc(_1340);
    int _1356 = int(_1354);
    int _1358 = abs(_1308);
    int _1360 = _1176 * _1344;
    int _1362 = _1360 + _1328;
    bool _1364 = uint(_1276) >= uint(_833);
    bool _1366 = !_1316;
    int _1368 = _1366 ? 0 : 1;
    bool _1370 = _1204 != 0;
    float _1372 = trunc(_1342);
    int _1374 = int(_1372);
    bool _1376 = !_1348;
    int _1378 = _1376 ? 0 : 1;
    bool _1380 = !_1352;
    int _1382 = _1380 ? 0 : 1;
    bool _1384 = uint(_1312) >= uint(_853);
    int _1386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1388 = _1386 != 0;
    bool _1390 = !_1364;
    int _1392 = _1390 ? 0 : (-1);
    bool _1394 = !_1388;
    int _1396 = _1394 ? 0 : 1;
    int _1398 = _1112 * _1358;
    int _1400 = _1398 + _1362;
    bool _1402 = !_1384;
    int _1404 = _1402 ? 0 : (-1);
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1408 = _1406 != 0;
    int _1410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1412 = _1410 != 0;
    int _1414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1416 = _1414 != 0;
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1420 = _1418 != 0;
    int _1422 = ~_1214;
    int _1424 = _1422 + _1392;
    int _1426 = _1424 + 1;
    float _1428 = float(uint(_1400));
    bool _1430 = !_1412;
    int _1432 = _1430 ? 0 : 1;
    int _1434 = _833 * _1426;
    int _1436 = _1434 + _898;
    bool _1438 = _833 == 0;
    float _1440 = as_type<float>(_825) * _1428;
    int _1442 = ~_1356;
    int _1444 = _1442 + 1;
    int _1446 = _1444 + 1;
    bool _1448 = !_1438;
    int _1450 = _1448 ? _1436 : (-1);
    bool _1452 = !_1320;
    int _1454 = _1452 ? 0 : 1;
    int _1456 = _833 + (-1);
    int _1458 = _1450 * _1446;
    int _1460 = abs(_1454);
    bool _1462 = !_1324;
    int _1464 = _1462 ? 0 : 1;
    int _1466 = _1356 * _1456;
    int _1468 = _1466 + _1458;
    float _1470 = trunc(_1440);
    float _1472 = precise::max(_1470, 0.0);
    uint _1474 = uint(_1472);
    int _1476 = abs(_1368);
    float _1478 = float(_853);
    int _1480 = _1468 * _1460;
    float _1482 = float(_906);
    int _1484 = abs(_1378);
    int _1486 = _1374 * _1476;
    int _1488 = _1486 + _1480;
    int _1490 = abs(_1464);
    float _1492 = _1478 * _1232;
    bool _1494 = _1482 >= _1478;
    bool _1496 = isnan(_1482);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan(_1478);
    bool _1502 = _1498 || _1500;
    float _1504 = float(_1502);
    int _1506 = _1240 * _1484;
    int _1508 = _1506 + _898;
    float _1510 = _1282 * _1478;
    int _1512 = ~_759;
    int _1514 = _1512 + 1;
    float _1516 = trunc(_1492);
    int _1518 = int(_1516);
    int _1520 = abs(_1382);
    int _1522 = _1508 * _1490;
    int _1524 = _1522 + _1488;
    int _1526 = ~_1256;
    int _1528 = _1526 + _1404;
    int _1530 = _1528 + 1;
    int _1532 = _1514 * int(_1474);
    int _1534 = _1532 + _1400;
    bool _1536 = !_1408;
    int _1538 = _1536 ? 0 : 1;
    int _1540 = _1240 * _1520;
    int _1542 = _1540 + _1524;
    bool _1544 = _853 == 0;
    float _1546 = trunc(_1504);
    int _1548 = int(_1546);
    float _1550 = float(uint(_1534));
    int _1552 = _853 * _1530;
    int _1554 = _1552 + _906;
    float _1556 = float(uint(_1542));
    int _1558 = abs(_1396);
    float _1560 = as_type<float>(_825) * _1550;
    bool _1562 = !_1544;
    int _1564 = _1562 ? _1554 : (-1);
    float _1566 = as_type<float>(_986) * _1556;
    int _1568 = _853 + (-1);
    float _1570 = trunc(_1510);
    int _1572 = int(_1570);
    int _1574 = abs(_1432);
    int _1576 = ~_833;
    int _1578 = _1576 + 1;
    bool _1580 = _759 == 0;
    int _1582 = ~_1548;
    int _1584 = _1582 + 1;
    int _1586 = _1584 + 1;
    float _1588 = trunc(_1566);
    float _1590 = precise::max(_1588, 0.0);
    uint _1592 = uint(_1590);
    bool _1594 = _996 > 0.5;
    int _1596 = _1564 * _1586;
    float _1598 = trunc(_1560);
    float _1600 = precise::max(_1598, 0.0);
    uint _1602 = uint(_1600);
    int _1604 = _1548 * _1568;
    int _1606 = _1604 + _1596;
    int _1608 = _1572 * _1558;
    int _1610 = _1608 + _906;
    float _1612 = float(uint(_1176));
    int _1614 = _1606 * _1574;
    bool _1616 = !_1416;
    int _1618 = _1616 ? 0 : 1;
    int _1620 = _1578 * int(_1592);
    int _1622 = _1620 + _1542;
    float _1624 = as_type<float>(_825) * _1612;
    int _1626 = ~_759;
    int _1628 = _1626 + 1;
    int _1630 = abs(_1618);
    float _1632 = trunc(_1624);
    float _1634 = precise::max(_1632, 0.0);
    uint _1636 = uint(_1634);
    int _1638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1640 = _1638 != 0;
    int _1642 = int(_1474) + int(_1602);
    float _1644 = float(uint(_1622));
    int _1646 = abs(_1538);
    int _1648 = _1628 * _1642;
    int _1650 = _1648 + _1400;
    bool _1652 = !_1420;
    int _1654 = _1652 ? 0 : 1;
    float _1656 = as_type<float>(_986) * _1644;
    int _1658 = ~_759;
    int _1660 = _1658 + 1;
    int _1662 = _1518 * _1646;
    int _1664 = _1662 + _1614;
    float _1666 = trunc(_1656);
    float _1668 = precise::max(_1666, 0.0);
    uint _1670 = uint(_1668);
    int _1672 = abs(_1654);
    int _1674 = _1660 * int(_1636);
    int _1676 = _1674 + _1176;
    bool _1678 = uint(_1650) >= uint(_759);
    int _1680 = _1610 * _1630;
    int _1682 = _1680 + _1664;
    float _1684 = float(uint(_1676));
    float _1686 = as_type<float>(_1672);
    if (_1640)
    {
        float _1688 = in.m_60.x;
        _1686 = _1688;
    }
    float _1690 = _1686;
    bool _1692 = !_1678;
    int _1694 = _1692 ? 0 : (-1);
    int _1696 = _1572 * _1672;
    int _1698 = _1696 + _1682;
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1702 = _1700 != 0;
    float _1704 = as_type<float>(_825) * _1684;
    int _1706 = ~_1642;
    int _1708 = _1706 + _1694;
    int _1710 = _1708 + 1;
    float _1712 = float(uint(_1698));
    int _1714 = ~_853;
    int _1716 = _1714 + 1;
    int _1718 = _759 * _1710;
    int _1720 = _1718 + _1400;
    float _1722 = float(uint(_1508));
    float _1724 = as_type<float>(_1006) * _1712;
    float _1726 = -_187;
    int _1728 = _1594 ? as_type<int>(_1726) : as_type<int>(_187);
    float _1730 = trunc(_1704);
    float _1732 = precise::max(_1730, 0.0);
    uint _1734 = uint(_1732);
    bool _1736 = !_1580;
    int _1738 = _1736 ? _1720 : (-1);
    float _1740 = as_type<float>(_986) * _1722;
    int _1742 = int(_1592) + int(_1670);
    int _1744 = _1738 & 3;
    bool _1746 = _1744 != 0;
    int _1748 = ~_833;
    int _1750 = _1748 + 1;
    float _1752 = trunc(_1724);
    float _1754 = precise::max(_1752, 0.0);
    uint _1756 = uint(_1754);
    bool _1758 = !_1702;
    float _1760 = _1758 ? _187 : as_type<float>(_1728);
    float _1762 = _1722;
    if (_1640)
    {
        float _1764 = _1690 * 3.1415927410125732421875;
        _1762 = _1764;
    }
    float _1766 = _1762;
    int _1768 = _1750 * _1742;
    int _1770 = _1768 + _1542;
    bool _1772 = uint(_1744) > 1u;
    float _1774 = _1766;
    if (_1640)
    {
        float _1776 = _1766 * 0.15915493667125701904296875;
        _1774 = _1776;
    }
    float _1778 = _1774;
    float _1780 = -_191;
    int _1782 = _1370 ? as_type<int>(_1780) : as_type<int>(_191);
    float _1784 = trunc(_1740);
    float _1786 = precise::max(_1784, 0.0);
    uint _1788 = uint(_1786);
    int _1790 = _1738 & 3;
    bool _1792 = _1790 != 0;
    int _1794 = ~_833;
    int _1796 = _1794 + 1;
    int _1798 = _1792 ? 0 : 1;
    bool _1800 = uint(_1770) >= uint(_833);
    int _1802 = _1716 * int(_1756);
    int _1804 = _1802 + _1698;
    float _1806 = _1778;
    if (_1640)
    {
        float _1808 = _1778 * 6.283185482025146484375;
        float _1810 = sin(_1808);
        _1806 = _1810;
    }
    float _1812 = _1806;
    int _1814 = ~_1798;
    int _1816 = _1814 + 1;
    int _1818 = _1816 + 1;
    float _1820 = float(uint(_1804));
    int _1822 = _1818;
    if (!_1772)
    {
        int _1824 = ~_1798;
        int _1826 = _1824 + 1;
        _1822 = _1826;
    }
    int _1828 = _1822;
    int _1830 = _1796 * int(_1788);
    int _1832 = _1830 + _1508;
    bool _1834 = !_1800;
    int _1836 = _1834 ? 0 : (-1);
    float _1838 = as_type<float>(_1006) * _1820;
    bool _1840 = _1744 != 3;
    int _1842 = ~_1742;
    int _1844 = _1842 + _1836;
    int _1846 = _1844 + 1;
    bool _1848 = uint(_1744) >= 2u;
    float _1850 = trunc(_1838);
    float _1852 = precise::max(_1850, 0.0);
    uint _1854 = uint(_1852);
    int _1856 = _833 * _1846;
    int _1858 = _1856 + _1542;
    int _1860 = _1848 ? 0 : 1;
    float _1862 = float(uint(_1832));
    bool _1864 = !_1438;
    int _1866 = _1864 ? _1858 : (-1);
    int _1868 = ~_1860;
    int _1870 = _1868 + 1;
    int _1872 = _1870 + 1;
    float _1874 = as_type<float>(_986) * _1862;
    int _1876 = _1872;
    bool _1878 = _1840;
    if (_1840)
    {
        int _1880 = ~_1860;
        int _1882 = _1880 + 1;
        _1876 = _1882;
    }
    int _1884 = _1876;
    int _1886 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1888 = _1886 != 0;
    float _1890 = _1812;
    if (_1640)
    {
        bool _1892 = _1812 > 0.5;
        _1878 = _1892;
    }
    bool _1894 = _1878;
    int _1896 = _1866 & 3;
    bool _1898 = _1896 != 0;
    if (!_1640)
    {
        _1890 = _191;
    }
    float _1900 = _1890;
    float _1902 = _1900;
    if (_1640)
    {
        float _1904 = -_191;
        float _1906 = _1894 ? _1904 : _191;
        _1902 = _1906;
    }
    float _1908 = _1902;
    bool _1910 = !_1888;
    float _1912 = _1910 ? _191 : as_type<float>(_1782);
    int _1914 = ~_759;
    int _1916 = _1914 + 1;
    float _1918 = _1908 + (-0.5);
    int _1920 = ~_853;
    int _1922 = _1920 + 1;
    int _1924 = _1866 & 3;
    bool _1926 = _1924 != 0;
    bool _1928 = uint(_1896) > 1u;
    int _1930 = int(_1756) + int(_1854);
    int _1932 = int(_1636) + int(_1734);
    int _1934 = _1922 * _1930;
    int _1936 = _1934 + _1698;
    int _1938 = _1926 ? 0 : 1;
    float _1940 = trunc(_1874);
    float _1942 = precise::max(_1940, 0.0);
    uint _1944 = uint(_1942);
    int _1946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1948 = _1946 != 0;
    int _1950 = _1916 * _1932;
    int _1952 = _1950 + _1176;
    float _1954 = float(uint(_1610));
    bool _1956 = !_1948;
    int _1958 = _1956 ? 0 : 1;
    bool _1960 = uint(_1936) >= uint(_853);
    float _1962 = as_type<float>(_1006) * _1954;
    int _1964 = ~_1938;
    int _1966 = _1964 + 1;
    int _1968 = _1966 + 1;
    int _1970 = _1968;
    if (!_1928)
    {
        int _1972 = ~_1938;
        int _1974 = _1972 + 1;
        _1970 = _1974;
    }
    int _1976 = _1970;
    float _1978 = trunc(_1962);
    float _1980 = precise::max(_1978, 0.0);
    uint _1982 = uint(_1980);
    bool _1984 = uint(_1952) >= uint(_759);
    bool _1986 = !_1960;
    int _1988 = _1986 ? 0 : (-1);
    bool _1990 = _1896 != 3;
    bool _1992 = !_1984;
    int _1994 = _1992 ? 0 : (-1);
    bool _1996 = uint(_1896) >= 2u;
    int _1998 = ~_1930;
    int _2000 = _1998 + _1988;
    int _2002 = _2000 + 1;
    int _2004 = _1996 ? 0 : 1;
    int _2006 = ~_833;
    int _2008 = _2006 + 1;
    int _2010 = _853 * _2002;
    int _2012 = _2010 + _1698;
    int _2014 = int(_1788) + int(_1944);
    int _2016 = ~_853;
    int _2018 = _2016 + 1;
    int _2020 = ~_2004;
    int _2022 = _2020 + 1;
    int _2024 = _2022 + 1;
    int _2026 = _2008 * _2014;
    int _2028 = _2026 + _1508;
    int _2030 = _2024;
    if (_1990)
    {
        int _2032 = ~_2004;
        int _2034 = _2032 + 1;
        _2030 = _2034;
    }
    int _2036 = _2030;
    int _2038 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2040 = _2038 != 0;
    int _2042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2044 = _2042 != 0;
    bool _2046 = !_2040;
    int _2048 = _2046 ? 0 : 1;
    bool _2050 = uint(_2028) >= uint(_833);
    int _2052 = _2018 * int(_1982);
    int _2054 = _2052 + _1610;
    bool _2056 = !_1544;
    int _2058 = _2056 ? _2012 : (-1);
    bool _2060 = !_2050;
    int _2062 = _2060 ? 0 : (-1);
    int _2064 = _2058 & 3;
    bool _2066 = _2064 != 0;
    int _2068 = _2058 & 3;
    bool _2070 = _2068 != 0;
    float _2072 = float(uint(_2054));
    int _2074 = _2066 ? 0 : 1;
    bool _2076 = uint(_2068) > 1u;
    float _2078 = as_type<float>(_1006) * _2072;
    int _2080 = ~_2074;
    int _2082 = _2080 + 1;
    int _2084 = _2082 + 1;
    int _2086 = ~_853;
    int _2088 = _2086 + 1;
    float _2090 = trunc(_2078);
    float _2092 = precise::max(_2090, 0.0);
    uint _2094 = uint(_2092);
    float _2096 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2098 = _2096 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2100 = _2084;
    float _2102 = as_type<float>(_2036);
    if (!_2076)
    {
        int _2104 = ~_2074;
        int _2106 = _2104 + 1;
        _2100 = _2106;
    }
    int _2108 = _2100;
    float _2110 = 1.0 / _2098;
    bool _2112 = uint(_2068) >= 2u;
    float _2114 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2116 = _2114 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2118 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2120 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2118;
    int _2122 = _2112 ? 0 : 1;
    bool _2124 = _2068 != 3;
    float _2126 = 1.0 / _2116;
    int _2128 = int(_1982) + int(_2094);
    float _2130 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2132 = _2130 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _2134 = ~_2122;
    int _2136 = _2134 + 1;
    int _2138 = _2136 + 1;
    float _2140 = in.m_48.x;
    float _2142 = in.m_48.y;
    float _2144 = in.m_48.z;
    int _2146 = _2088 * _2128;
    int _2148 = _2146 + _1610;
    float _2150 = 1.0 / _2132;
    float _2152 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _2154 = ~_2014;
    int _2156 = _2154 + _2062;
    int _2158 = _2156 + 1;
    float _2160 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2162 = _2138;
    if (_2124)
    {
        int _2164 = ~_2122;
        int _2166 = _2164 + 1;
        _2162 = _2166;
    }
    int _2168 = _2162;
    float _2170 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2172 = _2170 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2174 = uint(_2148) >= uint(_853);
    bool _2176 = !_2174;
    int _2178 = _2176 ? 0 : (-1);
    float _2180 = 1.0 / _2172;
    bool _2182 = _964 > 0.5;
    float _2184 = -_187;
    int _2186 = _2182 ? as_type<int>(_2184) : as_type<int>(_187);
    int _2188 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2190 = _2188 != 0;
    float _2192 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2194 = _2192 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2196 = _2142 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2198 = _2142 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _2200 = !_2190;
    float _2202 = _2200 ? _187 : as_type<float>(_2186);
    float _2204 = 1.0 / _2194;
    bool _2206 = _974 != 1;
    float _2208 = _964 * 2.0;
    float _2210 = _2142 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2212 = fma(_2140, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2196);
    float _2214 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2216 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2214;
    float _2218 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2220 = _2218 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2222 = fma(_2140, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2198);
    float _2224 = floor(_2208);
    float _2226 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2228 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2226;
    float _2230 = fma(_2140, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2210);
    float _2232 = _2216 * _2150;
    float _2234 = _2228 * _2110;
    float _2236 = 0.0;
    if (!_2206)
    {
        _2236 = _970;
    }
    float _2238 = _2236;
    float _2240 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2242 = _2240 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2244 = 0.0;
    float _2246 = _2238;
    if (!_2206)
    {
        _2244 = _970;
    }
    float _2248 = _2244;
    float _2250 = _2220 * _2204;
    float _2252 = 0.0;
    float _2254 = _2248;
    if (!_2206)
    {
        _2252 = _996;
    }
    float _2256 = _2252;
    float _2258 = _2242 * _2126;
    float _2260 = 0.0;
    float _2262 = _2256;
    if (!_2206)
    {
        _2260 = _996;
    }
    float _2264 = _2260;
    float _2266 = _996 * 2.0;
    float _2268 = _2264;
    if (_2206)
    {
        _2246 = _964;
    }
    float _2270 = _2246;
    float _2272 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2274 = _2272 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    if (_2206)
    {
        _2254 = _964;
    }
    float _2276 = _2254;
    float _2278 = fma(_2144, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2222);
    if (_2206)
    {
        _2262 = _970;
    }
    float _2280 = _2262;
    float _2282 = floor(_2266);
    if (_2206)
    {
        _2268 = _970;
    }
    float _2284 = _2268;
    float _2286 = _2270 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2288 = _976 != 2;
    float _2290 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2292 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2290;
    float _2294 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2296 = _2294 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2298 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2300 = isnan(_741);
    bool _2302 = _2298 || _2300;
    bool _2304 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2306 = _2302 || _2304;
    float _2308 = float(_2306);
    float _2310 = 1.0 / _2274;
    float _2312 = _2292 * _2180;
    float _2314 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2316 = _2314 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2318 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2320 = isnan(_741);
    bool _2322 = _2318 || _2320;
    bool _2324 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2326 = _2322 || _2324;
    float _2328 = float(_2326);
    float _2330 = _2280 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2332 = !_2044;
    int _2334 = _2332 ? 0 : 1;
    float _2336 = 1.0 / _2316;
    float _2338 = 0.0;
    if (_2288)
    {
        _2338 = _964;
    }
    float _2340 = _2338;
    float _2342 = 0.0;
    float _2344 = _2340;
    if (_2288)
    {
        _2342 = _970;
    }
    float _2346 = _2342;
    float _2348 = _2346;
    if (!_2288)
    {
        _2344 = _996;
    }
    float _2350 = _2344;
    if (!_2288)
    {
        _2348 = _964;
    }
    float _2352 = _2348;
    float _2354 = _2296 * _2310;
    bool _2356 = _2224 >= 0.0;
    bool _2358 = isnan(_2224);
    bool _2360 = _2356 || _2358;
    bool _2362 = isnan(0.0);
    bool _2364 = _2360 || _2362;
    float _2366 = _2350 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _2368 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2370 = isnan(_741);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2376 = _2372 || _2374;
    float _2378 = float(_2376);
    float _2380 = _2352 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2382 = _2364 ? 0 : 1;
    bool _2384 = _2224 > 0.0;
    float _2386 = -_2308;
    float _2388 = _2386 + 1.0;
    float _2390 = _2120 * _2336;
    int _2392 = ~_2382;
    int _2394 = _2392 + 1;
    int _2396 = _2394 + 1;
    float _2398 = -_2378;
    float _2400 = _2398 + 1.0;
    float _2402 = _2378 * _2388;
    bool _2404 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2406 = isnan(_741);
    bool _2408 = _2404 || _2406;
    bool _2410 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2412 = _2408 || _2410;
    float _2414 = float(_2412);
    float _2416 = _2328 * _2400;
    float _2418 = -_2328;
    float _2420 = _2418 + 1.0;
    int _2422 = abs(_2036);
    float _2424 = -_2414;
    float _2426 = _2424 + 1.0;
    int _2428 = ~_2128;
    int _2430 = _2428 + _2178;
    int _2432 = _2430 + 1;
    float _2434 = _2414 * _2420;
    int _2436 = _2396;
    if (!_2384)
    {
        int _2438 = ~_2382;
        int _2440 = _2438 + 1;
        _2436 = _2440;
    }
    int _2442 = _2436;
    float _2444 = fma(_2144, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2212);
    bool _2446 = _2282 >= 0.0;
    bool _2448 = isnan(_2282);
    bool _2450 = _2446 || _2448;
    bool _2452 = isnan(0.0);
    bool _2454 = _2450 || _2452;
    float _2456 = fma(_2144, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2230);
    bool _2458 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2460 = isnan(_741);
    bool _2462 = _2458 || _2460;
    bool _2464 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2466 = _2462 || _2464;
    float _2468 = float(_2466);
    float _2470 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2472 = _741 + _2470;
    int _2474 = _2454 ? 0 : 1;
    float _2476 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2478 = _741 + _2476;
    bool _2480 = _2282 > 0.0;
    float _2482 = fma(_2234, _2472, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2484 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2486 = isnan(_741);
    bool _2488 = _2484 || _2486;
    bool _2490 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2492 = _2488 || _2490;
    float _2494 = float(_2492);
    float _2496 = fma(_2258, _2478, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2498 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2500 = _741 + _2498;
    int _2502 = ~_2422;
    int _2504 = _2502 + 1;
    int _2506 = _2504 + 1;
    int _2508 = _853 * _2432;
    int _2510 = _2508 + _1610;
    float _2512 = _2494 * _2426;
    float _2514 = -_2494;
    float _2516 = _2514 + 1.0;
    bool _2518 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2520 = isnan(_741);
    bool _2522 = _2518 || _2520;
    bool _2524 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2526 = _2522 || _2524;
    float _2528 = float(_2526);
    float _2530 = fma(_2250, _2500, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2532 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2152);
    float _2534 = _2468 * _2516;
    float _2536 = -_2468;
    float _2538 = _2536 + 1.0;
    bool _2540 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2542 = isnan(_741);
    bool _2544 = _2540 || _2542;
    bool _2546 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2548 = _2544 || _2546;
    float _2550 = float(_2548);
    float _2552 = -_2528;
    float _2554 = _2552 + 1.0;
    float _2556 = _970 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2558 = _2528 * _2538;
    float _2560 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2562 = _741 + _2560;
    float _2564 = _2550 * _2554;
    float _2566 = -_2550;
    float _2568 = _2566 + 1.0;
    float _2570 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2572 = _741 + _2570;
    float _2574 = fma(_2232, _2562, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2576 = _2482 * _2564;
    float _2578 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2580 = _741 + _2578;
    float _2582 = fma(_2312, _2572, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _2584 = ~_2474;
    int _2586 = _2584 + 1;
    int _2588 = _2586 + 1;
    float _2590 = fma(_2568, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2576);
    float _2592 = fma(_2354, _2580, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2594 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2596 = _741 + _2594;
    float _2598 = fma(_2496, _2558, _2590);
    float _2600 = _964 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2602 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2604 = _2588;
    if (!_2480)
    {
        int _2606 = ~_2474;
        int _2608 = _2606 + 1;
        _2604 = _2608;
    }
    int _2610 = _2604;
    float _2612 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2614 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2616 = fma(_2390, _2596, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2618 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2602);
    float _2620 = _964 + _996;
    float _2622 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2624 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2614);
    float _2626 = _964 + (-0.5);
    float _2628 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2612);
    float _2630 = _970 + _996;
    float _2632 = _970 + (-0.5);
    float _2634 = -_2622;
    float _2636 = fma(_2600, 2.0, _2634);
    float _2638 = fma(_2574, _2534, _2598);
    float _2640 = fma(_2556, -2.0, _2160);
    float _2642 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2644 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2646 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2642);
    float _2648 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2650 = _978 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2652 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2644);
    float _2654 = _980 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2656 = _1008 + (-1.0);
    float _2658 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2660 = fma(_2650, -2.0, _2648);
    float _2662 = _2444 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2664 = _1866 >> 31;
    float _2666 = -_2658;
    float _2668 = fma(_2654, 2.0, _2666);
    int _2670 = _833 * _2158;
    int _2672 = _2670 + _1508;
    float _2674 = fma(_2530, _2512, _2638);
    int _2676 = _2664 & 3;
    float _2678 = fma(_2656, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2680 = _2278 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2682 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2684 = _2662 + _2682;
    float _2686 = _2630 + (-1.0);
    int _2688 = _1866 + _2676;
    float _2690 = _2456 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2692 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2694 = _2680 + _2692;
    float _2696 = _2684 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2698 = fma(_2686, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _2700 = _2688 >> 2;
    float _2702 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2704 = _2690 + _2702;
    float _2706 = fma(_2694, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2696);
    bool _2708 = _1896 != 3;
    float _2710 = floor(_1012);
    int _2712 = _2700 << 4;
    int _2714 = _2712 + 656;
    float _2716 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2706);
    float _2718 = fma(_2582, _2434, _2674);
    uint _2720 = uint(int(uint(_2714) >> uint(2)));
    uint _2722 = uint(int(uint(int(_2720)) >> uint(2)));
    int _2724 = int(_2720) & 3;
    float _2726 = (*spvDescriptorSet0.vp_c9)._m0[int(_2722)][_2724];
    int _2728 = int(_2720) + 1;
    uint _2730 = uint(int(uint(_2728) >> uint(2)));
    int _2732 = _2728 & 3;
    float _2734 = (*spvDescriptorSet0.vp_c9)._m0[int(_2730)][_2732];
    float _2736 = _1134 + 0.5;
    float _2738 = -_121;
    float _2740 = fma(_2738, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2668);
    float _2742 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2660);
    bool _2744 = !_1438;
    int _2746 = _2744 ? _2672 : (-1);
    float _2748 = -_121;
    float _2750 = fma(_2748, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2636);
    float _2752 = fma(_2592, _2416, _2718);
    int _2754 = _2714 + 8;
    uint _2756 = uint(int(uint(_2754) >> uint(2)));
    uint _2758 = uint(int(uint(int(_2756)) >> uint(2)));
    int _2760 = int(_2756) & 3;
    float _2762 = (*spvDescriptorSet0.vp_c9)._m0[int(_2758)][_2760];
    int _2764 = int(_2756) + 1;
    uint _2766 = uint(int(uint(_2764) >> uint(2)));
    int _2768 = _2764 & 3;
    float _2770 = (*spvDescriptorSet0.vp_c9)._m0[int(_2766)][_2768];
    bool _2772 = !_1898;
    int _2774 = _2772 ? 0 : 1;
    float _2776 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2652);
    bool _2778 = _2710 > 0.0;
    float _2780 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2646);
    bool _2782 = _2710 >= 0.0;
    bool _2784 = isnan(_2710);
    bool _2786 = _2782 || _2784;
    bool _2788 = isnan(0.0);
    bool _2790 = _2786 || _2788;
    float _2792 = -_2776;
    float _2794 = _2792 + 1.0;
    bool _2796 = !_2708;
    int _2798 = _2796 ? 0 : (-1);
    float _2800 = fma(_2616, _2402, _2752);
    bool _2802 = _2716 >= 0.0;
    float _2804 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2806 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2808 = abs(_2798);
    float _2810 = fma(_2308, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2800);
    float _2812 = fma(_2276, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2804);
    float _2814 = fma(_2284, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2806);
    float _2816 = fma(_2736, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2740);
    float _2818 = _2202 + 0.5;
    float _2820 = -_1918;
    float _2822 = -_2742;
    float _2824 = fma(_2820, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2822);
    float _2826 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2640);
    float _2828 = _1912 + (-0.5);
    float _2830 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2832 = fma(_2818, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2750);
    int _2834 = abs(_1976);
    float _2836 = -_2828;
    float _2838 = -_2826;
    float _2840 = fma(_2836, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2838);
    float _2842 = -_2830;
    float _2844 = fma(_2286, 2.0, _2842);
    int _2846 = abs(_2774);
    float _2848 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2850 = int(_2848);
    int _2852 = ~_2834;
    int _2854 = _2852 + 1;
    int _2856 = _2854 + 1;
    float _2858 = -_121;
    float _2860 = fma(_2858, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2844);
    float _2862 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2814);
    float _2864 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2618);
    float _2866 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2628);
    if (_2802)
    {
        _2102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2868 = _2102;
    float _2870 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2872 = _2856 * as_type<int>(_2734);
    int _2874 = ~_2846;
    int _2876 = _2874 + 1;
    int _2878 = _2876 + 1;
    float _2880 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2882 = -_2870;
    float _2884 = fma(_2366, 2.0, _2882);
    int _2886 = abs(_2850);
    int _2888 = _2878 * as_type<int>(_2726);
    int _2890 = _2888 + _2872;
    int _2892 = as_type<int>(_2868);
    if (_2802)
    {
        float _2894 = _2868 * 5.0;
        _2892 = as_type<int>(_2894);
    }
    int _2896 = _2892;
    float _2898 = fma(_2380, -2.0, _2880);
    int _2900 = abs(_2048);
    int _2902 = _2506 * as_type<int>(_2762);
    int _2904 = _2902 + _2890;
    if (_2802)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9247 = as_type<float>(_2896);
        out.gl_Position.z = _9247;
    }
    float _2906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2908 = ~_2808;
    int _2910 = _2908 + 1;
    int _2912 = _2910 + 1;
    float _2914 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2916 = float(uint(_2850));
    float _2918 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2812);
    int _2920 = ~_2886;
    int _2922 = _2920 + 1;
    int _2924 = _2912 * as_type<int>(_2770);
    int _2926 = _2924 + _2904;
    float _2928 = float(uint(_2886));
    float _2930 = fma(_2330, -2.0, _2914);
    float _2932 = 1.0 / _2916;
    int _2934 = _1738 >> 31;
    float _2936 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2898);
    int _2938 = ~_2900;
    int _2940 = _2938 + 1;
    int _2942 = _2940 + 1;
    float _2944 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2930);
    int _2946 = _2934 & 3;
    float _2948 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2532);
    int _2950 = _2058 >> 31;
    float _2952 = 1.0 / _2928;
    int _2954 = _1738 + _2946;
    int _2956 = _2926 * _2942;
    int _2958 = _2950 & 3;
    float _2960 = _2906 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2962 = _2954 >> 2;
    int _2964 = _2746 * _2900;
    int _2966 = _2964 + _2956;
    int _2968 = _2058 + _2958;
    float _2970 = -_2794;
    float _2972 = fma(_2970, _1134, _2816);
    int _2974 = _2962 << 4;
    int _2976 = _2974 + 368;
    float _2978 = -_2780;
    float _2980 = _2978 + 1.0;
    int _2982 = _2968 >> 2;
    float _2984 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2986 = abs(_2966);
    uint _2988 = uint(int(uint(_2976) >> uint(2)));
    uint _2990 = uint(int(uint(int(_2988)) >> uint(2)));
    int _2992 = int(_2988) & 3;
    float _2994 = (*spvDescriptorSet0.vp_c9)._m0[int(_2990)][_2992];
    int _2996 = int(_2988) + 1;
    uint _2998 = uint(int(uint(_2996) >> uint(2)));
    int _3000 = _2996 & 3;
    float _3002 = (*spvDescriptorSet0.vp_c9)._m0[int(_2998)][_3000];
    int _3004 = as_type<int>(_2932) + (-2);
    float _3006 = fma(_2980, _1908, _2824);
    float _3008 = float(uint(_2966));
    float _3010 = _1760 + 0.5;
    int _3012 = as_type<int>(_2952) + (-2);
    float _3014 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2624);
    int _3016 = _2982 << 4;
    int _3018 = _3016 + 800;
    float _3020 = as_type<float>(_3004) * _3008;
    float _3022 = float(uint(_2986));
    float _3024 = fma(_2960, _3010, _2860);
    uint _3026 = uint(int(uint(_3018) >> uint(2)));
    uint _3028 = uint(int(uint(int(_3026)) >> uint(2)));
    int _3030 = int(_3026) & 3;
    float _3032 = (*spvDescriptorSet0.vp_c9)._m0[int(_3028)][_3030];
    int _3034 = int(_3026) + 1;
    uint _3036 = uint(int(uint(_3034) >> uint(2)));
    int _3038 = _3034 & 3;
    float _3040 = (*spvDescriptorSet0.vp_c9)._m0[int(_3036)][_3038];
    int _3042 = ~_2850;
    int _3044 = _3042 + 1;
    out.m_68.x = _2972;
    out.m_68.y = _3006;
    float _3046 = as_type<float>(_3012) * _3022;
    float _3048 = trunc(_3020);
    float _3050 = precise::max(_3048, 0.0);
    uint _3052 = uint(_3050);
    float _3054 = _1290 + (-0.5);
    float _3056 = _2984 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3058 = -_3014;
    float _3060 = _3058 + 1.0;
    int _3062 = ~_1932;
    int _3064 = _3062 + _1994;
    int _3066 = _3064 + 1;
    float _3068 = -_3056;
    float _3070 = -_2944;
    float _3072 = fma(_3068, _3054, _3070);
    bool _3074 = !_1746;
    int _3076 = _3074 ? 0 : 1;
    float _3078 = trunc(_3046);
    float _3080 = precise::max(_3078, 0.0);
    uint _3082 = uint(_3080);
    int _3084 = _2976 + 8;
    uint _3086 = uint(int(uint(_3084) >> uint(2)));
    uint _3088 = uint(int(uint(int(_3086)) >> uint(2)));
    int _3090 = int(_3086) & 3;
    float _3092 = (*spvDescriptorSet0.vp_c9)._m0[int(_3088)][_3090];
    int _3094 = int(_3086) + 1;
    uint _3096 = uint(int(uint(_3094) >> uint(2)));
    int _3098 = _3094 & 3;
    float _3100 = (*spvDescriptorSet0.vp_c9)._m0[int(_3096)][_3098];
    int _3102 = _759 * _3066;
    int _3104 = _3102 + _1176;
    int _3106 = abs(_3076);
    out.m_70.x = _2810;
    int _3108 = abs(_1884);
    bool _3110 = _759 == 0;
    int _3112 = _3044 * int(_3052);
    int _3114 = _3112 + _2966;
    int _3116 = _3018 + 8;
    uint _3118 = uint(int(uint(_3116) >> uint(2)));
    uint _3120 = uint(int(uint(int(_3118)) >> uint(2)));
    int _3122 = int(_3118) & 3;
    float _3124 = (*spvDescriptorSet0.vp_c9)._m0[int(_3120)][_3122];
    int _3126 = int(_3118) + 1;
    uint _3128 = uint(int(uint(_3126) >> uint(2)));
    int _3130 = _3126 & 3;
    float _3132 = (*spvDescriptorSet0.vp_c9)._m0[int(_3128)][_3130];
    int _3134 = abs(_1958);
    if (_2802)
    {
        out.m_55.x = 0.0;
    }
    bool _3136 = !_3110;
    int _3138 = _3136 ? _3104 : (-1);
    float _3140 = float(uint(_3114));
    int _3142 = _2922 * int(_3082);
    int _3144 = _3142 + _2986;
    int _3146 = abs(_1828);
    float _3148 = as_type<float>(_3004) * _3140;
    bool _3150 = !_2070;
    int _3152 = _3150 ? 0 : 1;
    float _3154 = float(uint(_3144));
    int _3156 = abs(_2108);
    float _3158 = as_type<float>(_3012) * _3154;
    float _3160 = trunc(_3148);
    float _3162 = precise::max(_3160, 0.0);
    uint _3164 = uint(_3162);
    int _3166 = ~_3156;
    int _3168 = _3166 + 1;
    int _3170 = _3168 + 1;
    int _3172 = ~_3146;
    int _3174 = _3172 + 1;
    int _3176 = _3174 + 1;
    bool _3178 = _1744 != 3;
    int _3180 = abs(_3152);
    float _3182 = trunc(_3158);
    float _3184 = precise::max(_3182, 0.0);
    uint _3186 = uint(_3184);
    int _3188 = _3176 * as_type<int>(_3002);
    int _3190 = _3170 * as_type<int>(_3040);
    int _3192 = ~_2850;
    int _3194 = _3192 + 1;
    int _3196 = ~_3106;
    int _3198 = _3196 + 1;
    int _3200 = _3198 + 1;
    int _3202 = ~_3180;
    int _3204 = _3202 + 1;
    int _3206 = _3204 + 1;
    int _3208 = int(_3052) + int(_3164);
    int _3210 = _3200 * as_type<int>(_2994);
    int _3212 = _3210 + _3188;
    int _3214 = _3206 * as_type<int>(_3032);
    int _3216 = _3214 + _3190;
    int _3218 = ~_2886;
    int _3220 = _3218 + 1;
    int _3222 = _3194 * _3208;
    int _3224 = _3222 + _2966;
    int _3226 = int(_3082) + int(_3186);
    bool _3228 = !_3178;
    int _3230 = _3228 ? 0 : (-1);
    int _3232 = ~_3108;
    int _3234 = _3232 + 1;
    int _3236 = _3234 + 1;
    int _3238 = _3220 * _3226;
    int _3240 = _3238 + _2986;
    bool _3242 = uint(_3224) >= uint(_2850);
    int _3244 = abs(_3230);
    int _3246 = _3236 * as_type<int>(_3092);
    int _3248 = _3246 + _3212;
    bool _3250 = !_3242;
    int _3252 = _3250 ? 0 : (-1);
    bool _3254 = uint(_3240) >= uint(_2886);
    int _3256 = _2966 ^ _2850;
    int _3258 = abs(_2168);
    int _3260 = ~_3244;
    int _3262 = _3260 + 1;
    int _3264 = _3262 + 1;
    bool _3266 = !_3254;
    int _3268 = _3266 ? 0 : (-1);
    uint _3270 = uint(int(uint(_3256) >> uint(31)));
    int _3272 = _3264 * as_type<int>(_3100);
    int _3274 = _3272 + _3248;
    bool _3276 = _2068 != 3;
    int _3278 = ~_3258;
    int _3280 = _3278 + 1;
    int _3282 = _3280 + 1;
    int _3284 = ~_3268;
    int _3286 = _3226 + _3284;
    int _3288 = _3286 + 1;
    int _3290 = ~int(_3270);
    int _3292 = _3290 + 1;
    int _3294 = _3282 * as_type<int>(_3124);
    int _3296 = _3294 + _3216;
    int _3298 = ~_3208;
    int _3300 = _3298 + _3252;
    int _3302 = _3300 + 1;
    bool _3304 = !_3276;
    int _3306 = _3304 ? 0 : (-1);
    int _3308 = _3288 ^ _3292;
    int _3310 = _2850 * _3302;
    int _3312 = _3310 + _2966;
    int _3314 = abs(_3306);
    bool _3316 = _2850 == 0;
    bool _3318 = _2850 == 0;
    int _3320 = ~_3292;
    int _3322 = _3320 + _3308;
    int _3324 = _3322 + 1;
    int _3326 = ~_3314;
    int _3328 = _3326 + 1;
    int _3330 = _3328 + 1;
    bool _3332 = !_3316;
    int _3334 = _3332 ? _3312 : (-1);
    bool _3336 = !_3318;
    int _3338 = _3336 ? _3324 : (-1);
    int _3340 = _3330 * as_type<int>(_3132);
    int _3342 = _3340 + _3296;
    int _3344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3346 = _3344 != 0;
    int _3348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3350 = _3348 != 0;
    int _3352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3354 = _3352 != 0;
    float _3356 = -_2862;
    float _3358 = _3356 + 1.0;
    float _3360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3362 = abs(_2334);
    float _3364 = fma(_1290, _3358, _3072);
    int _3366 = ~_3134;
    int _3368 = _3366 + 1;
    int _3370 = _3368 + 1;
    float _3372 = -_2918;
    float _3374 = _3372 + 1.0;
    int _3376 = ~_3362;
    int _3378 = _3376 + 1;
    int _3380 = _3378 + 1;
    float _3382 = float(_3338);
    float _3384 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3386 = log2(_3384);
    int _3388 = _3274 * _3370;
    float _3390 = -_2864;
    float _3392 = _3390 + 1.0;
    float _3394 = -_2866;
    float _3396 = _3394 + 1.0;
    float _3398 = -_3374;
    float _3400 = fma(_1760, _3398, _3024);
    int _3402 = _3138 * _3134;
    int _3404 = _3402 + _3388;
    float _3406 = -_3392;
    float _3408 = fma(_2202, _3406, _2832);
    float _3410 = fma(_1912, _3396, _2840);
    float _3412 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3414 = _3360 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3416 = !_1544;
    int _3418 = _3416 ? _2510 : (-1);
    int _3420 = _3342 * _3380;
    out.m_72.x = _3408;
    out.m_72.y = _3410;
    out.m_72.z = _3400;
    out.m_72.w = _3364;
    float _3422 = -_2936;
    float _3424 = fma(_3414, _3382, _3422);
    float _3426 = _2684 * _2684;
    int _3428 = _3418 * _3362;
    int _3430 = _3428 + _3420;
    float _3432 = _3386 * _121;
    float _3434 = -_2948;
    float _3436 = _3434 + 1.0;
    float _3438 = fma(_2694, _2694, _3426);
    float _3440 = float(_3334);
    float _3442 = -_121;
    float _3444 = fma(_3442, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2884);
    float _3446 = float(_2610);
    float _3448 = fma(_2704, _2704, _3438);
    float _3450 = exp2(_3432);
    float _3452 = _3412 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3454 = !_3354;
    int _3456 = _3454 ? 0 : 1;
    float _3458 = _1236 + (-0.5);
    float _3460 = fma(_3452, _3440, _3444);
    float _3462 = _1226 + 0.5;
    float _3464 = -_3414;
    float _3466 = fma(_3464, _3458, _3424);
    bool _3468 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3470 = isnan(1.0);
    bool _3472 = _3468 || _3470;
    bool _3474 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3476 = _3472 || _3474;
    float _3478 = rsqrt(_3448);
    float _3480 = fma(_3452, _3462, _3460);
    float _3482 = fma(_1236, _3436, _3466);
    float _3484 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3486 = 1.0 + _3484;
    float _3488 = float(_3404);
    float _3490 = in.m_74.x;
    float _3492 = in.m_74.y;
    float _3494 = in.m_74.z;
    float _3496 = -_3060;
    float _3498 = fma(_1226, _3496, _3480);
    float _3500 = float(_3430);
    float _3502 = 1.0 / _3486;
    bool _3504 = !_3346;
    int _3506 = _3504 ? 0 : 1;
    out.m_76.x = _3488;
    bool _3508 = !_3350;
    int _3510 = _3508 ? 0 : 1;
    out.m_76.w = _3500;
    float _3512 = _2684 * _3478;
    float _3514 = _2694 * _3478;
    out.m_78.x = _3498;
    out.m_78.y = _3482;
    int _3516 = abs(_3506);
    if (_2802)
    {
        return out;
    }
    float _3518 = -_3512;
    float _3520 = fma(_3518, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2662);
    float _3522 = _2704 * _3478;
    float _3524 = -_3514;
    float _3526 = fma(_3524, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2680);
    float _3528 = float(_3516);
    float _3530 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3532 = _3520 + _3530;
    float _3534 = -_3522;
    float _3536 = fma(_3534, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2690);
    float _3538 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3540 = _3526 + _3538;
    float _3542 = -_3450;
    float _3544 = _3542 + 1.0;
    float _3546 = _3532 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _3548 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3550 = isnan(0.0);
    bool _3552 = _3548 || _3550;
    bool _3554 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3556 = _3552 || _3554;
    float _3558 = _3528 * _3446;
    float _3560 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3562 = _3536 + _3560;
    float _3564 = fma(_3540, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3546);
    float _3566 = _3556 ? _3544 : 0.0;
    float _3568 = _3558 * (-2.0);
    float _3570 = -_3512;
    float _3572 = fma(_3570, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2684);
    float _3574 = fma(_3562, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3564);
    float _3576 = -_3514;
    float _3578 = fma(_3576, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2694);
    float _3580 = fma(_3568, _3490, _3490);
    float _3582 = _3566;
    float _3584 = _3532;
    if (_3476)
    {
        float _3586 = _3566 * _3502;
        _131 = _3586;
    }
    float _3588 = _131;
    float _3590 = _3572 * _3572;
    bool _3592 = _3574 >= 0.0;
    float _3594 = fma(_2678, _3568, _2678);
    float _3596 = fma(_2626, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3580);
    int _3598 = _2790 ? 0 : 1;
    float _3600 = fma(_3578, _3578, _3590);
    float _3602 = -_3522;
    float _3604 = fma(_3602, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2704);
    float _3606 = fma(_3594, _3588, _3596);
    int _3608 = abs(_3510);
    int _3610 = ~_3598;
    int _3612 = _3610 + 1;
    int _3614 = _3612 + 1;
    float _3616 = fma(_3604, _3604, _3600);
    int _3618 = _3614;
    if (!_2778)
    {
        int _3620 = ~_3598;
        int _3622 = _3620 + 1;
        _3618 = _3622;
    }
    int _3624 = _3618;
    float _3626 = _3606 * 0.15915493667125701904296875;
    float _3628 = float(_2442);
    if (_3592)
    {
        out.m_55.x = 0.0;
    }
    if (_3592)
    {
        _3582 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3630 = _3582;
    float _3632 = sqrt(_3616);
    float _3634 = float(_3608);
    int _3636 = abs(_3456);
    int _3638 = as_type<int>(_3630);
    if (_3592)
    {
        float _3640 = _3630 * 5.0;
        _3638 = as_type<int>(_3640);
    }
    int _3642 = _3638;
    float _3644 = _3634 * _3628;
    float _3646 = _3626 * 6.283185482025146484375;
    float _3648 = sin(_3646);
    if (_3592)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10325 = as_type<float>(_3642);
        out.gl_Position.z = _10325;
    }
    float _3650 = float(_3624);
    float _3652 = float(_3636);
    if (_3592)
    {
        return out;
    }
    float _3654 = -_2662;
    float _3656 = _3654 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3658 = -_2680;
    float _3660 = _3658 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3662 = _3644 * (-2.0);
    float _3664 = -_2690;
    float _3666 = _3664 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3668 = _3656 * _3656;
    float _3670 = _3652 * _3650;
    float _3672 = fma(_3662, _3492, _3492);
    float _3674 = fma(_2698, _3662, _2698);
    float _3676 = fma(_3660, _3660, _3668);
    float _3678 = fma(_2632, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3672);
    float _3680 = _2620 + (-1.0);
    float _3682 = fma(_3666, _3666, _3676);
    float _3684 = _3670 * (-2.0);
    float _3686 = _996 + (-0.5);
    float _3688 = fma(_3680, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3690 = rsqrt(_3682);
    float _3692 = fma(_3684, _3494, _3494);
    float _3694 = fma(_3674, _3588, _3678);
    float _3696 = fma(_3688, _3684, _3688);
    float _3698 = _3478 * _3632;
    float _3700 = fma(_3686, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3692);
    float _3702 = _3694 * 0.15915493667125701904296875;
    float _3704 = _3626 * 6.283185482025146484375;
    float _3706 = cos(_3704);
    float _3708 = fma(_3696, _3588, _3700);
    float _3710 = _3708 * 0.15915493667125701904296875;
    float _3712 = _3660 * _3690;
    float _3714 = _3666 * _3690;
    float _3716 = _3656 * _3690;
    float _3718 = _3702 * 6.283185482025146484375;
    float _3720 = sin(_3718);
    float _3722 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3724 = _3712 * _3722;
    float _3726 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3728 = _3714 * _3726;
    float _3730 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3732 = _3716 * _3730;
    float _3734 = _583 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3736 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3738 = -_3724;
    float _3740 = fma(_3714, _3736, _3738);
    float _3742 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3744 = -_3728;
    float _3746 = fma(_3716, _3742, _3744);
    float _3748 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3750 = -_3732;
    float _3752 = fma(_3712, _3748, _3750);
    float _3754 = _3702 * 6.283185482025146484375;
    float _3756 = cos(_3754);
    float _3758 = _3740 * _3740;
    float _3760 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _3762 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3764 = fma(_3746, _3746, _3758);
    float _3766 = _3710 * 6.283185482025146484375;
    float _3768 = sin(_3766);
    float _3770 = fma(_3752, _3752, _3764);
    float _3772 = _581 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3774 = _3648 * _3720;
    float _3776 = _3706 * _3720;
    float _3778 = _3698 * _3772;
    float _3780 = _3710 * 6.283185482025146484375;
    float _3782 = cos(_3780);
    float _3784 = _3706 * _3756;
    float _3786 = _3760 * _3778;
    float _3788 = rsqrt(_3770);
    float _3790 = fma(_3768, _3784, _3774);
    float _3792 = fma(_3768, _3774, _3784);
    float _3794 = _3648 * _3756;
    float _3796 = -_3786;
    float _3798 = _3768 * _3796;
    float _3800 = -_3776;
    float _3802 = fma(_3768, _3794, _3800);
    float _3804 = _3706 * _3782;
    float _3806 = _3756 * _3782;
    float _3808 = _3648 * _3782;
    float _3810 = _3720 * _3782;
    float _3812 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _3814 = _3698 * _3734;
    float _3816 = _3804 * _3786;
    float _3818 = -_3794;
    float _3820 = fma(_3768, _3776, _3818);
    float _3822 = _3740 * _3788;
    float _3824 = _3812 * _3814;
    float _3826 = _3746 * _3788;
    float _3828 = _3698 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3830 = _3828 * 0.5;
    float _3832 = _3808 * _3786;
    float _3834 = fma(_3790, _3824, _3816);
    float _3836 = _3752 * _3788;
    float _3838 = _3714 * _3822;
    float _3840 = _3716 * _3826;
    float _3842 = fma(_3806, _3824, _3798);
    float _3844 = fma(_3820, _3830, _3834);
    float _3846 = -_3838;
    float _3848 = fma(_3716, _3836, _3846);
    float _3850 = -_3840;
    float _3852 = fma(_3712, _3822, _3850);
    float _3854 = fma(_3802, _3824, _3832);
    float _3856 = fma(_3810, _3830, _3842);
    float _3858 = _3848 * _3844;
    float _3860 = _3852 * _3844;
    float _3862 = fma(_3792, _3830, _3854);
    float _3864 = _3804 * _3848;
    float _3866 = fma(_3826, _3856, _3858);
    float _3868 = fma(_3836, _3856, _3860);
    float _3870 = _3804 * _3852;
    float _3872 = _3820 * _3848;
    float _3874 = fma(_3712, _3862, _3866);
    float _3876 = fma(_3714, _3862, _3868);
    float _3878 = _3820 * _3852;
    float _3880 = _3790 * _3852;
    float _3882 = _2680 + _3874;
    float _3884 = _2690 + _3876;
    float _3886 = _3712 * _3836;
    float _3888 = _3790 * _3848;
    float _3890 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3892 = _3882 + _3890;
    float _3894 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3896 = _3884 + _3894;
    float _3898 = -_3886;
    float _3900 = fma(_3714, _3826, _3898);
    float _3902 = -_3768;
    float _3904 = fma(_3902, _3836, _3870);
    float _3906 = _3892 * _3892;
    float _3908 = _3896 * _3896;
    float _3910 = _3804 * _3900;
    float _3912 = fma(_3806, _3826, _3888);
    float _3914 = fma(_3762, _3762, 1.0);
    float _3916 = _3906 + _3908;
    float _3918 = _3900 * _3844;
    float _3920 = _3790 * _3900;
    float _3922 = _3820 * _3900;
    float _3924 = sqrt(_3916);
    float _3926 = fma(_3822, _3856, _3918);
    float _3928 = fma(_3806, _3822, _3920);
    float _3930 = -_3768;
    float _3932 = fma(_3930, _3822, _3910);
    float _3934 = fma(_3810, _3822, _3922);
    float _3936 = fma(_3716, _3862, _3926);
    float _3938 = fma(_3806, _3836, _3880);
    float _3940 = -_3768;
    float _3942 = fma(_3940, _3826, _3864);
    float _3944 = rsqrt(_3914);
    float _3946 = _2662 + _3936;
    float _3948 = fma(_3810, _3826, _3872);
    float _3950 = fma(_3810, _3836, _3878);
    bool _3952 = _3924 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3954 = _3810;
    float _3956 = _3768;
    float _3958 = _3922;
    float _3960 = _3920;
    float _3962 = _3900;
    if (!_3952)
    {
        _3954 = _3908;
    }
    float _3964 = _3954;
    float _3966 = _3964;
    if (!_3952)
    {
        _3956 = _3906;
    }
    float _3968 = _3956;
    float _3970 = _3968;
    if (!_3952)
    {
        _3958 = _3882;
    }
    float _3972 = _3958;
    float _3974 = _3972;
    if (!_3952)
    {
        _3960 = _3884;
    }
    float _3976 = _3960;
    float _3978 = _3976;
    if (!_3952)
    {
        _3962 = _3946;
    }
    float _3980 = _3962;
    bool _3982 = !_3952;
    float _3984 = _3980;
    if (!_3982)
    {
        float _3986 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3988 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3990 = _3924 + _3988;
        float _3992 = _3946 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3994 = rsqrt(_3916);
        float _3996 = _3990 * _3986;
        float _3998 = _3996 * 0.15915493667125701904296875;
        float _4000 = _3998 * 6.283185482025146484375;
        float _4002 = sin(_4000);
        float _4004 = _3998 * 6.283185482025146484375;
        float _4006 = cos(_4004);
        float _4008 = fma(_4002, _3992, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4010 = _3994 * _4008;
        float _4012 = _4006 + (-1.0);
        float _4014 = fma(_3892, _4010, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4016 = fma(_3896, _4010, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _4018 = _4012 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4020 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _4022 = _4014 + _4020;
        float _4024 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _4026 = _4016 + _4024;
        float _4028 = fma(_3946, _4006, _4018);
        float _4030 = _4022 * _4022;
        float _4032 = _4026 * _4026;
        _3984 = _4028;
        _3970 = _4030;
        _3966 = _4032;
        _3978 = _4016;
        _3974 = _4014;
    }
    float _4034 = _3984;
    float _4036 = _3970;
    float _4038 = _3966;
    float _4040 = _3978;
    float _4042 = _3974;
    float _4044 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4046 = _4034 + _4044;
    float _4048 = fma(_3808, _3712, _3942);
    float _4050 = fma(_3808, _3716, _3932);
    float _4052 = fma(_3808, _3714, _3904);
    float _4054 = fma(_4046, _4046, _4036);
    float _4056 = fma(_3792, _3712, _3948);
    float _4058 = fma(_3792, _3716, _3934);
    float _4060 = fma(_3792, _3714, _3950);
    float _4062 = _4054 + _4038;
    float _4064 = _3762 * _3944;
    float _4066 = fma(_3802, _3712, _3912);
    float _4068 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4070 = _3762 * _4048;
    float _4072 = fma(_3802, _3716, _3928);
    float _4074 = fma(_3802, _3714, _3938);
    float _4076 = _3762 * _4050;
    float _4078 = _3762 * _4052;
    float _4080 = -_4056;
    float _4082 = _4064 * _4080;
    float _4084 = -_4058;
    float _4086 = _4064 * _4084;
    float _4088 = -_4060;
    float _4090 = _4064 * _4088;
    float _4092 = fma(_4068, _4066, _4070);
    float _4094 = sqrt(_4062);
    float _4096 = fma(_4068, _4072, _4076);
    float _4098 = fma(_4068, _4074, _4078);
    float _4100 = fma(_3944, _4048, _4082);
    float _4102 = fma(_3944, _4050, _4086);
    float _4104 = _4058 + _4096;
    float _4106 = fma(_3944, _4052, _4090);
    float _4108 = _4056 + _4092;
    float _4110 = _4060 + _4098;
    out.m_80.x = _4066;
    out.m_80.y = _4072;
    out.m_80.z = _4074;
    out.m_82.x = _4100;
    out.m_82.y = _4102;
    out.m_82.z = _4106;
    bool _4112 = _4094 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4114 = isnan(_4094);
    bool _4116 = _4112 || _4114;
    bool _4118 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4120 = _4116 || _4118;
    out.m_84.x = _4108;
    out.m_84.y = _4104;
    out.m_84.z = _4110;
    float _4122 = _4048;
    float _4124 = _4090;
    if (!_4120)
    {
        _4122 = 1.0;
    }
    float _4126 = _4122;
    bool _4128 = !_4120;
    float _4130 = _4126;
    if (!_4128)
    {
        bool _4132 = _4094 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4134 = isnan(_4094);
        bool _4136 = _4132 || _4134;
        bool _4138 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4140 = _4136 || _4138;
        if (!_4140)
        {
            float _4142 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4144 = _4094 + _4142;
            float _4146 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4148 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4146;
            float _4150 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4152 = _4150 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4154 = 1.0 / _4148;
            float _4156 = _4144 * _4154;
            float _4158 = fma(_4156, _4152, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4130 = _4158;
            _4160 = true;
        }
        else
        {
            bool _4162 = _4094 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4164 = isnan(_4094);
            bool _4166 = _4162 || _4164;
            bool _4168 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4170 = _4166 || _4168;
            if (!_4170)
            {
                float _4172 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4174 = _4094 + _4172;
                float _4176 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4178 = _4176 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4180 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4182 = _4180 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4184 = 1.0 / _4178;
                float _4186 = _4174 * _4184;
                float _4188 = fma(_4186, _4182, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4130 = _4188;
                _4160 = true;
            }
            else
            {
                _4130 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4160 = false;
    float _4190 = _4130;
    float _4192 = _3520 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4194 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4196 = _4034 + _4194;
    float _4198 = fma(_3526, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4192);
    float _4200 = fma(_4196, _4190, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _4202 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4204 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4206 = _4202 || _4204;
    bool _4208 = isnan(0.5);
    bool _4210 = _4206 || _4208;
    float _4212 = fma(_3536, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4198);
    float _4214 = _3520 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _4216 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4218 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4220 = _4216 || _4218;
    bool _4222 = isnan(0.5);
    bool _4224 = _4220 || _4222;
    float _4226 = _4212 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4228 = fma(_3526, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4214);
    float _4230 = 1.0 / _4226;
    float _4232 = fma(_3536, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4228);
    float _4234 = _4232 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4236 = _4234 + _4226;
    float _4238 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4240 = _4040 + _4238;
    float _4242 = -_3512;
    float _4244 = fma(_4242, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4200);
    float _4246 = _4236 * _4230;
    float _4248 = _4246 * 0.5;
    float _4250 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4252 = _4042 + _4250;
    float _4254 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4256 = fma(_4248, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4254);
    float _4258 = fma(_4252, _4190, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4260 = fma(_4240, _4190, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4262 = _4240;
    float _4264 = _4244;
    float _4266 = _4260;
    if (_4224)
    {
        _4262 = 1.0;
    }
    float _4268 = _4262;
    float _4270 = 1.0 / _4256;
    float _4272 = -_3514;
    float _4274 = fma(_4272, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4258);
    float _4276 = -_3522;
    float _4278 = fma(_4276, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4260);
    float _4280 = _4274;
    float _4282 = _4278;
    float _4284 = _4268;
    if (!_4210)
    {
        float _4286 = _3532 * _3532;
        float _4288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4290 = -_2690;
        float _4292 = _4290 + _4260;
        float _4294 = -_2662;
        float _4296 = _4294 + _4200;
        float _4298 = fma(_3540, _3540, _4286);
        float _4300 = -_2680;
        float _4302 = _4300 + _4258;
        float _4304 = fma(_3562, _3562, _4298);
        float _4306 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4308 = sqrt(_4304);
        float _4310 = 1.0 / _3698;
        float _4312 = _4306 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4314 = precise::min(_4308, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4316 = _4314 * _4288;
        float _4318 = _4316 * _4310;
        float _4320 = _4312 * _4318;
        float _4322 = _4292 * _4318;
        float _4324 = fma(_4296, _4320, _3520);
        float _4326 = fma(_4302, _4320, _3526);
        float _4328 = fma(_4312, _4322, _3536);
        _4264 = _4324;
        _4280 = _4326;
        _4282 = _4328;
        _3584 = _4308;
    }
    float _4330 = _4264;
    float _4332 = _4280;
    float _4334 = _4282;
    float _4336 = _3584;
    float _4338 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4340 = _4270 * _4338;
    if (!_4224)
    {
        float _4342 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4344 = _4342 * 0.15915493667125701904296875;
        float _4346 = _4344 * 6.283185482025146484375;
        float _4348 = cos(_4346);
        float _4350 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4352 = _4350 * 0.15915493667125701904296875;
        float _4354 = _4344 * 6.283185482025146484375;
        float _4356 = sin(_4354);
        float _4358 = 1.0 / _4348;
        float _4360 = _4352 * 6.283185482025146484375;
        float _4362 = cos(_4360);
        float _4364 = _4356 * _4358;
        float _4366 = _4352 * 6.283185482025146484375;
        float _4368 = sin(_4366);
        float _4370 = _4362 * _4364;
        float _4372 = 1.0 / _4370;
        float _4374 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4376 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4374;
        float _4378 = 1.0 / _4376;
        float _4380 = _4368 * _4372;
        float _4382 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4384 = fma(_4340, _4380, _4382);
        float _4386 = _4384 * _4378;
        float _4388 = precise::clamp(_4386, 0.0, 1.0);
        _4284 = _4388;
    }
    float _4390 = _4284;
    float _4392 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4394 = _4330 + _4392;
    float _4396 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4398 = _4332 + _4396;
    float _4400 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4402 = _4334 + _4400;
    float _4404 = _4394 * _4394;
    float _4406 = fma(_4398, _4398, _4404);
    float _4408 = fma(_4402, _4402, _4406);
    float _4410 = rsqrt(_4408);
    float _4412 = sqrt(_4408);
    float _4414 = _4410 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4416 = _4398 * _4414;
    float _4418 = _4402 * _4414;
    float _4420 = _4416 * _4416;
    float _4422 = _4418 * _4418;
    float _4424 = _4420 + _4422;
    float _4426 = sqrt(_4424);
    bool _4428 = _4426 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4430 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4432 = _4426 + _4430;
    float _4434 = _3540;
    float _4436 = _4432;
    float _4438 = _4394;
    float _4440 = _4416;
    if (_4428)
    {
        float _4442 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4434 = _4442;
    }
    float _4444 = _4434;
    float _4446 = _4444;
    if (_4428)
    {
        float _4448 = _4432 * _4444;
        _4436 = _4448;
    }
    float _4450 = _4436;
    if (_4428)
    {
        float _4452 = rsqrt(_4424);
        _4446 = _4452;
    }
    float _4454 = _4446;
    float _4456 = _4454;
    if (_4428)
    {
        float _4458 = _4450 * 0.15915493667125701904296875;
        _4266 = _4458;
    }
    float _4460 = _4266;
    float _4462 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4464 = _4402;
    if (_4428)
    {
        float _4466 = _4460 * 6.283185482025146484375;
        float _4468 = sin(_4466);
        _4464 = _4468;
    }
    float _4470 = _4464;
    float _4472 = precise::max(0.0, _4462);
    float _4474 = _4336;
    float _4476 = _4472;
    if (_4428)
    {
        float _4478 = _4460 * 6.283185482025146484375;
        float _4480 = cos(_4478);
        _4474 = _4480;
    }
    float _4482 = _4474;
    float _4484 = -_4414;
    float _4486 = -_4472;
    float _4488 = fma(_4394, _4484, _4486);
    if (_4428)
    {
        float _4490 = _4488 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4438 = _4490;
    }
    float _4492 = _4438;
    float _4494 = _4470;
    float _4496 = _4492;
    if (_4428)
    {
        float _4498 = fma(_4470, _4492, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4494 = _4498;
    }
    float _4500 = _4494;
    float _4502 = _4500;
    if (!_4428)
    {
        _4496 = _4488;
    }
    float _4504 = _4496;
    float _4506 = _4504;
    if (_4428)
    {
        float _4508 = _4454 * _4500;
        _4124 = _4508;
    }
    float _4510 = _4124;
    if (!_4428)
    {
        _4502 = _4420;
    }
    float _4512 = _4502;
    float _4514 = _4330 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4516 = _4512;
    float _4518 = _4482;
    if (_4428)
    {
        float _4520 = _4482 + (-1.0);
        _4476 = _4520;
    }
    float _4522 = _4476;
    float _4524 = _4522;
    if (_4428)
    {
        float _4526 = _4416 * _4510;
        _4440 = _4526;
    }
    float _4528 = _4440;
    float _4530 = fma(_3526, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4532 = _4330 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_4428)
    {
        float _4534 = _4522 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4456 = _4534;
    }
    float _4536 = _4456;
    if (!_4428)
    {
        _4524 = _4418;
    }
    float _4538 = _4524;
    float _4540 = _4538;
    if (_4428)
    {
        float _4542 = _4418 * _4510;
        _4540 = _4542;
    }
    float _4544 = _4540;
    if (_4428)
    {
        float _4546 = _4528 * _4528;
        _4516 = _4546;
    }
    float _4548 = _4516;
    if (_4428)
    {
        float _4550 = fma(_4488, _4482, _4536);
        _4506 = _4550;
    }
    float _4552 = _4506;
    if (!_4428)
    {
        _4518 = _4422;
    }
    float _4554 = _4518;
    float _4556 = _4554;
    if (_4428)
    {
        float _4558 = _4544 * _4544;
        _4556 = _4558;
    }
    float _4560 = _4556;
    float _4562 = fma(_4332, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4532);
    float _4564 = fma(_4552, _4552, _4548);
    float _4566 = _4330 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4568 = fma(_4334, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4562);
    float _4570 = _4564 + _4560;
    float _4572 = _4330 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4574 = fma(_4332, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4566);
    float _4576 = _4568 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4578 = rsqrt(_4570);
    float _4580 = fma(_4332, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4572);
    float _4582 = fma(_4332, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4514);
    float _4584 = fma(_4334, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4574);
    float _4586 = fma(_4334, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4580);
    float _4588 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4590 = fma(_4412, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4588);
    float _4592 = precise::clamp(_4590, 0.0, 1.0);
    float _4594 = fma(_4334, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4582);
    float _4596 = _4584 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4598 = _4586 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4600 = fma(_3536, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4602 = -_4592;
    float _4604 = _4602 + 1.0;
    float _4606 = _4594 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4608 = _4598 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4610 = floor(_4530);
    float _4612 = _4578 * _4528;
    float _4614 = fma(_4576, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4608);
    float _4616 = _4578 * _4552;
    float _4618 = _4578 * _4544;
    float _4620 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4614);
    float _4622 = abs(_4604);
    float _4624 = log2(_4622);
    float _4626 = fma(_4606, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4620);
    float _4628 = _4612 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4630 = -_4628;
    float _4632 = fma(_4616, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4630);
    float _4634 = floor(_4600);
    float _4636 = -_4610;
    float _4638 = _4530 + _4636;
    float _4640 = -_4618;
    float _4642 = fma(_4640, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4632);
    float _4644 = _4596 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4646 = fma(_4642, -0.5, 0.5);
    float _4648 = _4624 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4650 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4652 = fma(_4642, 0.5, 0.5);
    float _4654 = sqrt(_4646);
    float _4656 = -_4644;
    float _4658 = fma(_4656, _4650, 1.0);
    float _4660 = fma(_4652, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4662 = _4598 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4664 = fma(_4652, _4660, -0.212114393711090087890625);
    float _4666 = exp2(_4648);
    float _4668 = fma(_4576, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4662);
    float _4670 = -_4634;
    float _4672 = _4600 + _4670;
    float _4674 = fma(_4652, _4664, 1.570728778839111328125);
    float _4676 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4668);
    float _4678 = 1.0 / _4626;
    float _4680 = _4598 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4682 = fma(_4606, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4676);
    float _4684 = _4654 * 0.636619746685028076171875;
    float _4686 = fma(_4576, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4680);
    float _4688 = log2(_4658);
    float _4690 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4686);
    float _4692 = _4616 + 1.0;
    float _4694 = fma(_4606, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4690);
    float2 _12023 = float2(_4638, _4672);
    float _4696 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12023, float2(0.0), isnan(_12023)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12023, float2(0.0), isnan(_12023)), level(0.0)).x;
    float _4698 = -_4616;
    float _4700 = fma(_4666, _4692, _4698);
    float _4702 = _4682 * _4678;
    float _4704 = _4694 * _4678;
    float _4706 = -_4674;
    float _4708 = fma(_4684, _4706, 1.0);
    float _4710 = fma(_4700, 0.5, 0.5);
    float _4712 = fma(_4702, 0.5, 0.5);
    float _4714 = fma(_4704, -0.5, 0.5);
    float _4716 = _4688 * 0.693147182464599609375;
    float _4718 = _4716 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _12064 = float3(_4712, _4714, _4718);
    float _4720 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12064, float3(0.0), isnan(_12064)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12064, float3(0.0), isnan(_12064)), level(0.0)).x;
    float3 _12075 = float3(_4712, _4714, _4718);
    float4 _4723 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12075, float3(0.0), isnan(_12075)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12075, float3(0.0), isnan(_12075)), level(0.0)).xyzw;
    float _4725 = _4723.x;
    float _4727 = _4723.y;
    float _4729 = _4723.z;
    float _4731 = _4723.w;
    float2 _12091 = float2(_4708, _4710);
    float3 _4735 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12091, float2(0.0), isnan(_12091)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12091, float2(0.0), isnan(_12091)), level(0.0)).xyz;
    float _4737 = _4735.x;
    float _4739 = _4735.y;
    float _4741 = _4735.z;
    float _4743 = abs(_4340);
    float _4745 = log2(_4743);
    float _4747 = _4598 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _4749 = _4412 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4751 = isnan(_4412);
    bool _4753 = _4749 || _4751;
    bool _4755 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4757 = _4753 || _4755;
    float _4759 = fma(_4576, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4747);
    float _4761 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4759);
    float _4763 = _4624 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4765 = fma(_4606, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4761);
    float _4767 = _4682 + _4626;
    float _4769 = _4745 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4771 = exp2(_4763);
    out.gl_Position.x = _4682;
    out.gl_Position.y = _4694;
    out.gl_Position.z = _4765;
    out.gl_Position.w = _4626;
    float _4773 = exp2(_4769);
    float _4775 = -_4771;
    float _4777 = _4775 + 1.0;
    float _4779 = _4777 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4781 = fma(_4773, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4783 = precise::clamp(_4781, 0.0, 1.0);
    bool _4785 = _4340 <= 8000.0;
    bool _4787 = isnan(_4340);
    bool _4789 = _4785 || _4787;
    bool _4791 = isnan(8000.0);
    bool _4793 = _4789 || _4791;
    float _4795 = float(_4793);
    float _4797 = _4626 * 0.5;
    float _4799 = -_4779;
    float _4801 = _4799 + 1.0;
    float _4803 = fma(_4783, -2.0, 3.0);
    float _4805 = _4783 * _4783;
    float _4807 = _4805 * _4803;
    float _4809 = fma(_4694, -0.5, _4797);
    float _4811 = _4765 + _4626;
    float _4813 = -_4807;
    float _4815 = _4813 + 1.0;
    float _4817 = _4390 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4819 = _4811 * 0.5;
    float _4821 = _4694;
    float _4823 = _4801;
    if (!_4757)
    {
        _4821 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4825 = _4821;
    float _4827 = fma(_4815, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4807);
    float _4829 = _4767 * 0.5;
    float _4831 = in.m_86.x;
    float _4833 = _4795 * _4827;
    out.m_88.x = _4829;
    out.m_88.y = _4809;
    out.m_88.z = _4819;
    out.m_88.w = _4626;
    float _4835 = _4833 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4837 = -_4696;
    float _4839 = _4837 + 1.0;
    float _4841 = _4839 * _4835;
    float _4843 = precise::clamp(_4841, 0.0, 1.0);
    float _4845 = -_4843;
    float _4847 = fma(_4845, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4849 = _4847 * _4831;
    float _4851 = _4849 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4853 = _4779 * _4720;
    float _4855 = _4731 * _4801;
    float _4857 = _4825;
    float _4859 = _4825;
    if (!_4757)
    {
        _4823 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4861 = _4823;
    out.m_90.x = _4851;
    float _4863 = _4731 * _4853;
    float _4865 = _4741 * _4853;
    float _4867 = fma(_4737, _4863, _4725);
    float _4869 = fma(_4739, _4863, _4727);
    float _4871 = fma(_4731, _4865, _4729);
    float _4873 = _4863;
    float _4875 = _4861;
    float _4877 = _4861;
    if (!_4757)
    {
        _4873 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4879 = _4873;
    out.m_92.x = _4867;
    out.m_92.y = _4869;
    out.m_92.z = _4871;
    out.m_92.w = _4855;
    bool _4881 = !_4757;
    float _4883 = _4879;
    float _4885 = _4879;
    if (!_4881)
    {
        bool _4887 = _4412 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4889 = isnan(_4412);
        bool _4891 = _4887 || _4889;
        bool _4893 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4895 = _4891 || _4893;
        if (!_4895)
        {
            float _4897 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4899 = _4412 + _4897;
            float _4901 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4903 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4901;
            float _4905 = 1.0 / _4903;
            float _4907 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4909 = _4907 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4911 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4913 = _4911 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4915 = _4899 * _4905;
            float _4917 = precise::clamp(_4915, 0.0, 1.0);
            float _4919 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4921 = _4919 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4923 = fma(_4917, _4913, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4925 = fma(_4917, _4921, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4927 = fma(_4917, _4909, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _4877 = _4927;
            _4859 = _4925;
            _4885 = _4923;
            _4929 = true;
        }
        else
        {
            bool _4931 = _4412 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4933 = isnan(_4412);
            bool _4935 = _4931 || _4933;
            bool _4937 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4939 = _4935 || _4937;
            if (!_4939)
            {
                _4857 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4941 = _4857;
            _4859 = _4941;
            if (!_4939)
            {
                _4875 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4943 = _4875;
            _4877 = _4943;
            if (!_4939)
            {
                _4883 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4945 = _4883;
            bool _4947 = !_4939;
            _4885 = _4945;
            if (!_4947)
            {
                bool _4949 = _4412 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4951 = isnan(_4412);
                bool _4953 = _4949 || _4951;
                bool _4955 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4957 = _4953 || _4955;
                if (!_4957)
                {
                    float _4959 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4961 = _4412 + _4959;
                    float _4963 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4965 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4963;
                    float _4967 = 1.0 / _4965;
                    float _4969 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4971 = _4969 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4973 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4975 = _4973 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4977 = _4961 * _4967;
                    float _4979 = precise::clamp(_4977, 0.0, 1.0);
                    float _4981 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4983 = _4981 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4985 = fma(_4979, _4975, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4987 = fma(_4979, _4983, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4989 = fma(_4979, _4971, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _4877 = _4989;
                    _4859 = _4987;
                    _4885 = _4985;
                    _4929 = true;
                }
                else
                {
                    _4877 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4859 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4885 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4929 = false;
    float _4991 = _4877;
    float _4993 = _4859;
    float _4995 = _4885;
    float _4997 = _4817 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_94.x = 0.0;
    float _4999 = _4991 * 0.586610972881317138671875;
    bool _5001 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_55.x = _4997;
    float _5003 = fma(_4993, 0.298911988735198974609375, _4999);
    bool _5005 = _4390 > 0.0;
    bool _5007 = isnan(_4390);
    bool _5009 = _5005 || _5007;
    bool _5011 = isnan(0.0);
    bool _5013 = _5009 || _5011;
    float _5015 = fma(_4995, 0.114477999508380889892578125, _5003);
    float _5017 = -_5015;
    float _5019 = _5017 + _4993;
    float _5021 = -_5015;
    float _5023 = _5021 + _4991;
    float _5025 = -_5015;
    float _5027 = _5025 + _4995;
    float _5029 = fma(_5019, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5015);
    float _5031 = fma(_5023, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5015);
    float _5033 = fma(_5027, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5015);
    bool _5035 = !_5001;
    if (!_5035)
    {
        float _5037 = -_4330;
        float _5039 = _5037 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5041 = -_4332;
        float _5043 = _5041 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5045 = -_4334;
        float _5047 = _5045 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5049 = _5039 * _5039;
        float _5051 = fma(_5043, _5043, _5049);
        float _5053 = fma(_5047, _5047, _5051);
        float _5055 = sqrt(_5053);
        float _5057 = rsqrt(_5053);
        float _5059 = -_5055;
        float _5061 = _5059 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5063 = _5061 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5065 = precise::clamp(_5063, 0.0, 1.0);
        float _5067 = _5043 * _5057;
        float _5069 = _5039 * _5057;
        float _5071 = abs(_5065);
        float _5073 = log2(_5071);
        float _5075 = _5047 * _5057;
        float _5077 = _5067 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5079 = _4104 * _5069;
        float _5081 = -_5069;
        float _5083 = -_5077;
        float _5085 = fma(_5081, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5083);
        float _5087 = fma(_4108, _5067, _5079);
        float _5089 = -_5075;
        float _5091 = fma(_5089, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5085);
        float _5093 = fma(_4110, _5075, _5087);
        float _5095 = precise::clamp(_5093, 0.0, 1.0);
        float _5097 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5099 = _5091 + _5097;
        float _5101 = _5073 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5103 = _5099 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5105 = precise::clamp(_5103, 0.0, 1.0);
        float _5107 = exp2(_5101);
        float _5109 = _5107 * _5105;
        float _5111 = _5095 * _5109;
        float _5113 = _5111 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5115 = _5111 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5117 = _5111 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _5113;
        out.m_94.y = _5115;
        out.m_94.z = _5117;
    }
    out.m_96.x = _5029;
    out.m_96.y = _5031;
    out.m_96.z = _5033;
    if (_5013)
    {
        return out;
    }
    out.m_55.x = 0.0;
    float _5119 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5119;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4929 = false;
    bool _4160 = false;
    bool _605 = false;
    bool _499 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_48.w;
    float _112 = in.m_50.w;
    float _114 = trunc(_110);
    int _117 = int(_114);
    float _119 = -_112;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _121;
    bool _125 = _117 >= 1;
    float _127 = 0.0;
    float _129 = as_type<float>(_117);
    float _131 = _121;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _127;
    if (!_125)
    {
        out.m_55.x = 0.0;
    }
    int _135 = 0;
    if (!_125)
    {
        float _137 = _133 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5188 = as_type<float>(_139);
        out.gl_Position.z = _5188;
    }
    if (!_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _143 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_112);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = float(_117);
    bool _155 = _121 >= _153;
    bool _157 = !_151;
    bool _159 = _155 || _157;
    float _161 = 1.0 / _153;
    if (_159)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _129;
    if (_159)
    {
        out.m_55.x = 0.0;
    }
    float _165 = _121 * _161;
    float _167 = _165;
    if (_159)
    {
        float _169 = _163 * 5.0;
        _141 = as_type<int>(_169);
    }
    int _171 = _141;
    out.m_53.x = _165;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5251 = as_type<float>(_171);
        out.gl_Position.z = _5251;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _173 = as_type<float>(int(gl_VertexIndex));
    bool _175 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _177 = as_type<int>(_173) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_173) & 2;
    bool _183 = _181 != 0;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_175;
    float _211;
    if (!_193)
    {
        float _195 = in.m_60.x;
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _211 = _209;
        _213 = true;
    }
    else
    {
        _211 = _165;
    }
    _213 = false;
    float _215 = _211;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _219 = _215 + _217;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _227 = _225 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _229;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _235 = _233 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _237 = 1.0 / _223;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _239;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _245 = 1.0 / _231;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = _215 + _247;
    float _251 = 1.0 / _227;
    float _253 = _249 * _237;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = _215 + _255;
    bool _259 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _261 = isnan(_215);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    bool _271 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _273 = isnan(_215);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = 1.0 / _235;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _287 = _215 + _285;
    float _289 = _257 * _245;
    bool _291 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _293 = isnan(_215);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = 1.0 / _241;
    float _305 = _219 * _251;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _309 = _215 + _307;
    float _311 = -_301;
    float _313 = _311 + 1.0;
    float _315 = _287 * _283;
    float _317 = -_269;
    float _319 = _317 + 1.0;
    float _321 = _281 * _313;
    bool _323 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _325 = isnan(_215);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = _301 * _319;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _341;
    float _345 = _309 * _303;
    bool _347 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _349 = isnan(_215);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = -_281;
    float _361 = _359 + 1.0;
    float _363 = fma(_339, _253, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _365 = fma(_343, _253, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _367 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _369 = isnan(_215);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = _357 * _361;
    float _381 = -_357;
    float _383 = _381 + 1.0;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _393 = _333 * _383;
    float _395 = -_333;
    float _397 = _395 + 1.0;
    float _399 = -_377;
    float _401 = _399 + 1.0;
    float _403 = fma(_391, _305, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _405 = fma(_387, _305, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _407 = _377 * _397;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _413;
    float _417 = _363 * _407;
    float _419 = _365 * _407;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _425 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[143].x, _417);
    float _427 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[143].y, _419);
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _433 = fma(_411, _289, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _435 = fma(_403, _393, _425);
    float _437 = fma(_415, _289, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _439 = fma(_405, _393, _427);
    float _441 = fma(_423, _315, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _443;
    float _447 = fma(_433, _379, _435);
    float _449 = fma(_431, _315, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _451;
    float _455 = fma(_437, _379, _439);
    float _457 = fma(_445, _345, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _459 = fma(_441, _321, _447);
    float _461 = fma(_453, _345, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _463 = fma(_449, _321, _455);
    float _465 = fma(_457, _335, _459);
    float _467 = fma(_461, _335, _463);
    float _469 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[148].x, _465);
    float _471 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[148].y, _467);
    bool _473 = !_243;
    float _475 = _345;
    float _477 = _305;
    float _479 = _289;
    float _497;
    if (!_473)
    {
        float _481 = in.m_60.x;
        float _483 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _485 = _481 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _487 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _489 = _487 * _483;
        float _491 = floor(_489);
        float _493 = -_491;
        float _495 = _489 + _493;
        _497 = _495;
        _499 = true;
    }
    else
    {
        _497 = _165;
    }
    _499 = false;
    float _501 = _497;
    bool _503 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _505 = isnan(_501);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _519 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _521 = isnan(_501);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _537 = _501 + _535;
    float _539 = -_513;
    float _541 = _539 + 1.0;
    bool _543 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _545 = 1.0 / _517;
    float _547 = _529 * _541;
    float _549 = -_529;
    float _551 = _549 + 1.0;
    float _553 = _533 * _545;
    float _555 = fma(_553, _537, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _559 = _555 * _547;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _563 = _557 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _565 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[115].x, _559);
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _569 = _561 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _571 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[116].x, _565);
    float _573 = in.m_62.x;
    float _575 = in.m_62.y;
    float _577 = _567 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _579 = _571 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _577;
    out.m_64.y = _569;
    out.m_64.z = _563;
    out.m_64.w = _579;
    float _581 = _471 * _575;
    float _583 = _469 * _573;
    bool _585 = !_543;
    float _603;
    if (!_585)
    {
        float _587 = in.m_60.x;
        float _589 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _591 = _587 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _593 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _595 = _593 * _589;
        float _597 = floor(_595);
        float _599 = -_597;
        float _601 = _595 + _599;
        _603 = _601;
        _605 = true;
    }
    else
    {
        _603 = _165;
    }
    _605 = false;
    float _607 = _603;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _611 = _607 + _609;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _617 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _619 = isnan(_607);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _633 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _635 = isnan(_607);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _645;
    bool _649 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _651 = isnan(_607);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = 1.0 / _615;
    float _663 = -_627;
    float _665 = _663 + 1.0;
    bool _667 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _669 = 1.0 / _631;
    float _671 = _647 * _661;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _677 = -_659;
    float _679 = _677 + 1.0;
    float _681 = fma(_671, _611, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _683 = _643 * _665;
    float _685 = -_643;
    float _687 = _685 + 1.0;
    float _689 = _627 * _679;
    float _691 = _675 * _669;
    float _693 = _681 * _683;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _697 = _607 + _695;
    float _699 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[131].x, _693);
    float _701 = fma(_691, _697, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _705 = fma(_701, _689, _699);
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _709 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _713 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[133].x, _705);
    float _715 = _707 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _717 = _711 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _719 = _713 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_66.x = _709;
    out.m_66.y = _715;
    out.m_66.z = _717;
    out.m_66.w = _719;
    bool _721 = !_667;
    int _723 = as_type<int>(_717);
    if (!_721)
    {
        float _725 = in.m_60.x;
        float _727 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _729 = _725 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _731 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[14].x, _121);
        float _733 = _731 * _727;
        float _735 = floor(_733);
        float _737 = -_735;
        float _739 = _733 + _737;
        _167 = _739;
    }
    float _741 = _167;
    float _743 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _745 = int(_743);
    int _747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _749 = _747 != 0;
    float _751 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _753 = int(_751);
    float _755 = float(_745);
    float _757 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _759 = int(_757);
    float _761 = _699;
    if (_749)
    {
        float _763 = in.m_60.w;
        _761 = _763;
    }
    float _765 = _761;
    float _767 = float(_753);
    float _769 = 1.0 / _755;
    float _771 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _773 = int(_771);
    float _775 = float(uint(_759));
    float _777 = float(_759);
    int _779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _781 = _779 != 0;
    float _783 = _769 * _121;
    float _785 = 1.0 / _767;
    float _787 = float(_773);
    float _789 = 1.0 / _775;
    float _791 = _787;
    if (_781)
    {
        _475 = 1.0;
    }
    float _793 = _475;
    float _795 = _793;
    if (_781)
    {
        _477 = 1.0;
    }
    float _797 = _477;
    float _799 = _797;
    if (_781)
    {
        _723 = 0;
    }
    int _801 = _723;
    float _803 = trunc(_783);
    int _805 = int(_803);
    float _807 = _785 * _121;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _811 = _785;
    int _813 = _801;
    if (_781)
    {
        float _815 = in.m_60.x;
        float _817 = in.m_60.y;
        _809 = _815;
        _811 = _817;
    }
    float _819 = _809;
    float _821 = _811;
    float _823 = 1.0 / _787;
    int _825 = as_type<int>(_789) + (-2);
    int _827 = as_type<int>(_789);
    if (_781)
    {
        _827 = 0;
    }
    int _829 = _827;
    float _831 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _833 = int(_831);
    int _835 = _829;
    if (_749)
    {
        float _837 = _765 * 3.1415927410125732421875;
        _791 = _837;
    }
    float _839 = _791;
    int _841 = ~_759;
    int _843 = _841 + 1;
    if (_749)
    {
        float _845 = _839 * 0.15915493667125701904296875;
        _479 = _845;
    }
    float _847 = _479;
    float _849 = float(uint(_805));
    float _851 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _853 = int(_851);
    float _855 = _823 * _121;
    float _857 = as_type<float>(_825) * _849;
    float _859 = float(_805);
    float _861 = 0.0;
    float _863 = _859;
    float _865 = _819;
    float _867 = _821;
    if (_781)
    {
        _861 = _821;
    }
    float _869 = _861;
    bool _871 = _859 >= _777;
    bool _873 = isnan(_859);
    bool _875 = _871 || _873;
    bool _877 = isnan(_777);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    float _883 = trunc(_857);
    float _885 = precise::max(_883, 0.0);
    uint _888 = uint(_885);
    float _890 = float(uint(_833));
    float _892 = float(uint(_853));
    float _894 = 1.0 / _890;
    float _896 = trunc(_807);
    int _898 = int(_896);
    int _900 = _843 * int(_888);
    int _902 = _900 + _805;
    float _904 = trunc(_855);
    int _906 = int(_904);
    float _908 = _847;
    float _910 = _892;
    float _912 = _869;
    if (_749)
    {
        float _914 = _847 * 6.283185482025146484375;
        float _916 = sin(_914);
        _908 = _916;
    }
    float _918 = _908;
    float _920 = trunc(_881);
    int _922 = int(_920);
    float _924 = 1.0 / _892;
    if (_781)
    {
        _910 = _819;
    }
    float _926 = _910;
    float _928 = 0.0;
    float _930 = _926;
    if (_781)
    {
        _928 = _926;
    }
    float _932 = _928;
    float _934 = _932;
    if (_781)
    {
        _863 = _926;
    }
    float _936 = _863;
    float _938 = _936;
    if (!_781)
    {
        float _940 = in.m_60.x;
        float _942 = in.m_60.y;
        float _944 = in.m_60.z;
        float _946 = _940 * 3.1415927410125732421875;
        float _948 = _946 * 0.15915493667125701904296875;
        float _950 = _942 * 3.1415927410125732421875;
        float _952 = _950 * 0.15915493667125701904296875;
        float _954 = _948 * 6.283185482025146484375;
        float _956 = sin(_954);
        float _958 = _952 * 6.283185482025146484375;
        float _960 = sin(_958);
        _795 = 7.345489978790283203125;
        _865 = _940;
        _799 = 5.839270114898681640625;
        _938 = _944;
        _867 = _942;
        _930 = _942;
        _813 = 1;
        _835 = 2;
        _912 = _960;
        _934 = _956;
    }
    float _962 = _795;
    float _964 = _865;
    float _966 = _799;
    float _968 = _938;
    float _970 = _867;
    float _972 = _930;
    int _974 = _813;
    int _976 = _835;
    float _978 = _912;
    float _980 = _934;
    float _982 = float(uint(_902));
    float _984 = _962 * _964;
    int _986 = as_type<int>(_894) + (-2);
    float _988 = _966 * _968;
    float _990 = float(uint(_898));
    float _992 = as_type<float>(_825) * _982;
    float _994 = floor(_984);
    float _996 = in.m_60.z;
    float _998 = in.m_60.w;
    int _1000 = ~_759;
    int _1002 = _1000 + 1;
    float _1004 = as_type<float>(_986) * _990;
    int _1006 = as_type<int>(_924) + (-2);
    float _1008 = _970 + _964;
    float _1010 = float(uint(_906));
    float _1012 = _970 * 2.0;
    float _1014 = trunc(_992);
    float _1016 = precise::max(_1014, 0.0);
    uint _1018 = uint(_1016);
    int _1020 = ~_833;
    int _1022 = _1020 + 1;
    float _1024 = as_type<float>(_1006) * _1010;
    int _1026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1028 = _1026 != 0;
    bool _1030 = _759 == 0;
    float _1032 = trunc(_1004);
    float _1034 = precise::max(_1032, 0.0);
    uint _1036 = uint(_1034);
    float _1038 = -_994;
    float _1040 = _984 + _1038;
    float _1042 = 0.0;
    bool _1044 = _1028;
    if (!_749)
    {
        _1042 = _187;
    }
    float _1046 = _1042;
    float _1048 = _1040 * _777;
    bool _1050 = _970 > 0.5;
    int _1052 = int(_888) + int(_1018);
    float _1054 = trunc(_1024);
    float _1056 = precise::max(_1054, 0.0);
    uint _1058 = uint(_1056);
    bool _1060 = _998 > 0.5;
    bool _1062 = !_1028;
    int _1064 = _1062 ? 0 : 1;
    int _1066 = _1002 * _1052;
    int _1068 = _1066 + _805;
    float _1070 = _1046;
    if (_749)
    {
        bool _1072 = _918 > 0.5;
        _1044 = _1072;
    }
    bool _1074 = _1044;
    float _1076 = _962 * _972;
    int _1078 = _1022 * int(_1036);
    int _1080 = _1078 + _898;
    float _1082 = floor(_988);
    bool _1084 = uint(_1068) >= uint(_759);
    int _1086 = ~_853;
    int _1088 = _1086 + 1;
    float _1090 = float(uint(_1080));
    bool _1092 = !_1084;
    int _1094 = _1092 ? 0 : (-1);
    int _1096 = _1088 * int(_1058);
    int _1098 = _1096 + _906;
    int _1100 = abs(_1064);
    float _1102 = as_type<float>(_986) * _1090;
    int _1104 = ~_1052;
    int _1106 = _1104 + _1094;
    int _1108 = _1106 + 1;
    float _1110 = trunc(_1048);
    int _1112 = int(_1110);
    float _1114 = float(uint(_1098));
    int _1116 = ~_922;
    int _1118 = _1116 + 1;
    int _1120 = _1118 + 1;
    int _1122 = _759 * _1108;
    int _1124 = _1122 + _805;
    int _1126 = _759 + (-1);
    float _1128 = as_type<float>(_1006) * _1114;
    if (_749)
    {
        float _1130 = -_187;
        float _1132 = _1074 ? _1130 : _187;
        _1070 = _1132;
    }
    float _1134 = _1070;
    float _1136 = trunc(_1102);
    float _1138 = precise::max(_1136, 0.0);
    uint _1140 = uint(_1138);
    bool _1142 = !_1030;
    int _1144 = _1142 ? _1124 : (-1);
    float _1146 = -_1082;
    float _1148 = _988 + _1146;
    bool _1150 = _996 > 0.5;
    float _1152 = -_187;
    int _1154 = _1050 ? as_type<int>(_1152) : as_type<int>(_187);
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1158 = _1156 != 0;
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1162 = _1160 != 0;
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1166 = _1164 != 0;
    float _1168 = trunc(_1128);
    float _1170 = precise::max(_1168, 0.0);
    uint _1172 = uint(_1170);
    int _1174 = _1112 * _1100;
    int _1176 = _1174 + _805;
    int _1178 = int(_1060);
    int _1180 = _1150 ? 2 : 0;
    int _1182 = _1178 | _1180;
    int _1184 = _1074 ? 4 : 0;
    int _1186 = _1182 | _1184;
    int _1188 = _1158 ? 8 : 0;
    int _1190 = _1186 | _1188;
    int _1192 = _1162 ? 16 : 0;
    int _1194 = _1190 | _1192;
    int _1196 = _1166 ? 32 : 0;
    int _1198 = _1194 | _1196;
    int _1200 = _1050 ? 64 : 0;
    int _1202 = _1198 | _1200;
    int _1204 = _1202 & 64;
    float _1206 = -_191;
    int _1208 = _1060 ? as_type<int>(_1206) : as_type<int>(_191);
    float _1210 = float(_833);
    float _1212 = floor(_1076);
    int _1214 = int(_1036) + int(_1140);
    int _1216 = _1144 * _1120;
    float _1218 = -_191;
    int _1220 = _1150 ? as_type<int>(_1218) : as_type<int>(_191);
    float _1222 = _1148 * _1210;
    bool _1224 = !_1162;
    float _1226 = _1224 ? _187 : as_type<float>(_1154);
    int _1228 = _922 * _1126;
    int _1230 = _1228 + _1216;
    float _1232 = _161 * _121;
    bool _1234 = !_1166;
    float _1236 = _1234 ? _191 : as_type<float>(_1220);
    float _1238 = trunc(_1222);
    int _1240 = int(_1238);
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1244 = _1242 != 0;
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1248 = _1246 != 0;
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1252 = _1250 != 0;
    float _1254 = _777 * _1232;
    int _1256 = int(_1058) + int(_1172);
    int _1258 = ~_833;
    int _1260 = _1258 + 1;
    bool _1262 = !_1248;
    int _1264 = _1262 ? 0 : 1;
    float _1266 = trunc(_1254);
    int _1268 = int(_1266);
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1272 = _1270 != 0;
    int _1274 = _1260 * _1214;
    int _1276 = _1274 + _898;
    int _1278 = abs(_1264);
    float _1280 = -_1212;
    float _1282 = _1076 + _1280;
    bool _1284 = !_1244;
    int _1286 = _1284 ? 0 : 1;
    bool _1288 = !_1158;
    float _1290 = _1288 ? _191 : as_type<float>(_1208);
    int _1292 = _1230 * _1278;
    float _1294 = float(_898);
    bool _1296 = !_1252;
    int _1298 = _1296 ? 0 : 1;
    int _1300 = ~_853;
    int _1302 = _1300 + 1;
    int _1304 = abs(_1286);
    bool _1306 = !_1272;
    int _1308 = _1306 ? 0 : 1;
    int _1310 = _1302 * _1256;
    int _1312 = _1310 + _906;
    int _1314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1316 = _1314 != 0;
    int _1318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1320 = _1318 != 0;
    int _1322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1324 = _1322 != 0;
    int _1326 = _1268 * _1304;
    int _1328 = _1326 + _1292;
    bool _1330 = _1294 >= _1210;
    bool _1332 = isnan(_1294);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan(_1210);
    bool _1338 = _1334 || _1336;
    float _1340 = float(_1338);
    float _1342 = _1210 * _1232;
    int _1344 = abs(_1298);
    int _1346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1348 = _1346 != 0;
    int _1350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1352 = _1350 != 0;
    float _1354 = trunc(_1340);
    int _1356 = int(_1354);
    int _1358 = abs(_1308);
    int _1360 = _1176 * _1344;
    int _1362 = _1360 + _1328;
    bool _1364 = uint(_1276) >= uint(_833);
    bool _1366 = !_1316;
    int _1368 = _1366 ? 0 : 1;
    bool _1370 = _1204 != 0;
    float _1372 = trunc(_1342);
    int _1374 = int(_1372);
    bool _1376 = !_1348;
    int _1378 = _1376 ? 0 : 1;
    bool _1380 = !_1352;
    int _1382 = _1380 ? 0 : 1;
    bool _1384 = uint(_1312) >= uint(_853);
    int _1386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1388 = _1386 != 0;
    bool _1390 = !_1364;
    int _1392 = _1390 ? 0 : (-1);
    bool _1394 = !_1388;
    int _1396 = _1394 ? 0 : 1;
    int _1398 = _1112 * _1358;
    int _1400 = _1398 + _1362;
    bool _1402 = !_1384;
    int _1404 = _1402 ? 0 : (-1);
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1408 = _1406 != 0;
    int _1410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1412 = _1410 != 0;
    int _1414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1416 = _1414 != 0;
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1420 = _1418 != 0;
    int _1422 = ~_1214;
    int _1424 = _1422 + _1392;
    int _1426 = _1424 + 1;
    float _1428 = float(uint(_1400));
    bool _1430 = !_1412;
    int _1432 = _1430 ? 0 : 1;
    int _1434 = _833 * _1426;
    int _1436 = _1434 + _898;
    bool _1438 = _833 == 0;
    float _1440 = as_type<float>(_825) * _1428;
    int _1442 = ~_1356;
    int _1444 = _1442 + 1;
    int _1446 = _1444 + 1;
    bool _1448 = !_1438;
    int _1450 = _1448 ? _1436 : (-1);
    bool _1452 = !_1320;
    int _1454 = _1452 ? 0 : 1;
    int _1456 = _833 + (-1);
    int _1458 = _1450 * _1446;
    int _1460 = abs(_1454);
    bool _1462 = !_1324;
    int _1464 = _1462 ? 0 : 1;
    int _1466 = _1356 * _1456;
    int _1468 = _1466 + _1458;
    float _1470 = trunc(_1440);
    float _1472 = precise::max(_1470, 0.0);
    uint _1474 = uint(_1472);
    int _1476 = abs(_1368);
    float _1478 = float(_853);
    int _1480 = _1468 * _1460;
    float _1482 = float(_906);
    int _1484 = abs(_1378);
    int _1486 = _1374 * _1476;
    int _1488 = _1486 + _1480;
    int _1490 = abs(_1464);
    float _1492 = _1478 * _1232;
    bool _1494 = _1482 >= _1478;
    bool _1496 = isnan(_1482);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan(_1478);
    bool _1502 = _1498 || _1500;
    float _1504 = float(_1502);
    int _1506 = _1240 * _1484;
    int _1508 = _1506 + _898;
    float _1510 = _1282 * _1478;
    int _1512 = ~_759;
    int _1514 = _1512 + 1;
    float _1516 = trunc(_1492);
    int _1518 = int(_1516);
    int _1520 = abs(_1382);
    int _1522 = _1508 * _1490;
    int _1524 = _1522 + _1488;
    int _1526 = ~_1256;
    int _1528 = _1526 + _1404;
    int _1530 = _1528 + 1;
    int _1532 = _1514 * int(_1474);
    int _1534 = _1532 + _1400;
    bool _1536 = !_1408;
    int _1538 = _1536 ? 0 : 1;
    int _1540 = _1240 * _1520;
    int _1542 = _1540 + _1524;
    bool _1544 = _853 == 0;
    float _1546 = trunc(_1504);
    int _1548 = int(_1546);
    float _1550 = float(uint(_1534));
    int _1552 = _853 * _1530;
    int _1554 = _1552 + _906;
    float _1556 = float(uint(_1542));
    int _1558 = abs(_1396);
    float _1560 = as_type<float>(_825) * _1550;
    bool _1562 = !_1544;
    int _1564 = _1562 ? _1554 : (-1);
    float _1566 = as_type<float>(_986) * _1556;
    int _1568 = _853 + (-1);
    float _1570 = trunc(_1510);
    int _1572 = int(_1570);
    int _1574 = abs(_1432);
    int _1576 = ~_833;
    int _1578 = _1576 + 1;
    bool _1580 = _759 == 0;
    int _1582 = ~_1548;
    int _1584 = _1582 + 1;
    int _1586 = _1584 + 1;
    float _1588 = trunc(_1566);
    float _1590 = precise::max(_1588, 0.0);
    uint _1592 = uint(_1590);
    bool _1594 = _996 > 0.5;
    int _1596 = _1564 * _1586;
    float _1598 = trunc(_1560);
    float _1600 = precise::max(_1598, 0.0);
    uint _1602 = uint(_1600);
    int _1604 = _1548 * _1568;
    int _1606 = _1604 + _1596;
    int _1608 = _1572 * _1558;
    int _1610 = _1608 + _906;
    float _1612 = float(uint(_1176));
    int _1614 = _1606 * _1574;
    bool _1616 = !_1416;
    int _1618 = _1616 ? 0 : 1;
    int _1620 = _1578 * int(_1592);
    int _1622 = _1620 + _1542;
    float _1624 = as_type<float>(_825) * _1612;
    int _1626 = ~_759;
    int _1628 = _1626 + 1;
    int _1630 = abs(_1618);
    float _1632 = trunc(_1624);
    float _1634 = precise::max(_1632, 0.0);
    uint _1636 = uint(_1634);
    int _1638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1640 = _1638 != 0;
    int _1642 = int(_1474) + int(_1602);
    float _1644 = float(uint(_1622));
    int _1646 = abs(_1538);
    int _1648 = _1628 * _1642;
    int _1650 = _1648 + _1400;
    bool _1652 = !_1420;
    int _1654 = _1652 ? 0 : 1;
    float _1656 = as_type<float>(_986) * _1644;
    int _1658 = ~_759;
    int _1660 = _1658 + 1;
    int _1662 = _1518 * _1646;
    int _1664 = _1662 + _1614;
    float _1666 = trunc(_1656);
    float _1668 = precise::max(_1666, 0.0);
    uint _1670 = uint(_1668);
    int _1672 = abs(_1654);
    int _1674 = _1660 * int(_1636);
    int _1676 = _1674 + _1176;
    bool _1678 = uint(_1650) >= uint(_759);
    int _1680 = _1610 * _1630;
    int _1682 = _1680 + _1664;
    float _1684 = float(uint(_1676));
    float _1686 = as_type<float>(_1672);
    if (_1640)
    {
        float _1688 = in.m_60.x;
        _1686 = _1688;
    }
    float _1690 = _1686;
    bool _1692 = !_1678;
    int _1694 = _1692 ? 0 : (-1);
    int _1696 = _1572 * _1672;
    int _1698 = _1696 + _1682;
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1702 = _1700 != 0;
    float _1704 = as_type<float>(_825) * _1684;
    int _1706 = ~_1642;
    int _1708 = _1706 + _1694;
    int _1710 = _1708 + 1;
    float _1712 = float(uint(_1698));
    int _1714 = ~_853;
    int _1716 = _1714 + 1;
    int _1718 = _759 * _1710;
    int _1720 = _1718 + _1400;
    float _1722 = float(uint(_1508));
    float _1724 = as_type<float>(_1006) * _1712;
    float _1726 = -_187;
    int _1728 = _1594 ? as_type<int>(_1726) : as_type<int>(_187);
    float _1730 = trunc(_1704);
    float _1732 = precise::max(_1730, 0.0);
    uint _1734 = uint(_1732);
    bool _1736 = !_1580;
    int _1738 = _1736 ? _1720 : (-1);
    float _1740 = as_type<float>(_986) * _1722;
    int _1742 = int(_1592) + int(_1670);
    int _1744 = _1738 & 3;
    bool _1746 = _1744 != 0;
    int _1748 = ~_833;
    int _1750 = _1748 + 1;
    float _1752 = trunc(_1724);
    float _1754 = precise::max(_1752, 0.0);
    uint _1756 = uint(_1754);
    bool _1758 = !_1702;
    float _1760 = _1758 ? _187 : as_type<float>(_1728);
    float _1762 = _1722;
    if (_1640)
    {
        float _1764 = _1690 * 3.1415927410125732421875;
        _1762 = _1764;
    }
    float _1766 = _1762;
    int _1768 = _1750 * _1742;
    int _1770 = _1768 + _1542;
    bool _1772 = uint(_1744) > 1u;
    float _1774 = _1766;
    if (_1640)
    {
        float _1776 = _1766 * 0.15915493667125701904296875;
        _1774 = _1776;
    }
    float _1778 = _1774;
    float _1780 = -_191;
    int _1782 = _1370 ? as_type<int>(_1780) : as_type<int>(_191);
    float _1784 = trunc(_1740);
    float _1786 = precise::max(_1784, 0.0);
    uint _1788 = uint(_1786);
    int _1790 = _1738 & 3;
    bool _1792 = _1790 != 0;
    int _1794 = ~_833;
    int _1796 = _1794 + 1;
    int _1798 = _1792 ? 0 : 1;
    bool _1800 = uint(_1770) >= uint(_833);
    int _1802 = _1716 * int(_1756);
    int _1804 = _1802 + _1698;
    float _1806 = _1778;
    if (_1640)
    {
        float _1808 = _1778 * 6.283185482025146484375;
        float _1810 = sin(_1808);
        _1806 = _1810;
    }
    float _1812 = _1806;
    int _1814 = ~_1798;
    int _1816 = _1814 + 1;
    int _1818 = _1816 + 1;
    float _1820 = float(uint(_1804));
    int _1822 = _1818;
    if (!_1772)
    {
        int _1824 = ~_1798;
        int _1826 = _1824 + 1;
        _1822 = _1826;
    }
    int _1828 = _1822;
    int _1830 = _1796 * int(_1788);
    int _1832 = _1830 + _1508;
    bool _1834 = !_1800;
    int _1836 = _1834 ? 0 : (-1);
    float _1838 = as_type<float>(_1006) * _1820;
    bool _1840 = _1744 != 3;
    int _1842 = ~_1742;
    int _1844 = _1842 + _1836;
    int _1846 = _1844 + 1;
    bool _1848 = uint(_1744) >= 2u;
    float _1850 = trunc(_1838);
    float _1852 = precise::max(_1850, 0.0);
    uint _1854 = uint(_1852);
    int _1856 = _833 * _1846;
    int _1858 = _1856 + _1542;
    int _1860 = _1848 ? 0 : 1;
    float _1862 = float(uint(_1832));
    bool _1864 = !_1438;
    int _1866 = _1864 ? _1858 : (-1);
    int _1868 = ~_1860;
    int _1870 = _1868 + 1;
    int _1872 = _1870 + 1;
    float _1874 = as_type<float>(_986) * _1862;
    int _1876 = _1872;
    bool _1878 = _1840;
    if (_1840)
    {
        int _1880 = ~_1860;
        int _1882 = _1880 + 1;
        _1876 = _1882;
    }
    int _1884 = _1876;
    int _1886 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1888 = _1886 != 0;
    float _1890 = _1812;
    if (_1640)
    {
        bool _1892 = _1812 > 0.5;
        _1878 = _1892;
    }
    bool _1894 = _1878;
    int _1896 = _1866 & 3;
    bool _1898 = _1896 != 0;
    if (!_1640)
    {
        _1890 = _191;
    }
    float _1900 = _1890;
    float _1902 = _1900;
    if (_1640)
    {
        float _1904 = -_191;
        float _1906 = _1894 ? _1904 : _191;
        _1902 = _1906;
    }
    float _1908 = _1902;
    bool _1910 = !_1888;
    float _1912 = _1910 ? _191 : as_type<float>(_1782);
    int _1914 = ~_759;
    int _1916 = _1914 + 1;
    float _1918 = _1908 + (-0.5);
    int _1920 = ~_853;
    int _1922 = _1920 + 1;
    int _1924 = _1866 & 3;
    bool _1926 = _1924 != 0;
    bool _1928 = uint(_1896) > 1u;
    int _1930 = int(_1756) + int(_1854);
    int _1932 = int(_1636) + int(_1734);
    int _1934 = _1922 * _1930;
    int _1936 = _1934 + _1698;
    int _1938 = _1926 ? 0 : 1;
    float _1940 = trunc(_1874);
    float _1942 = precise::max(_1940, 0.0);
    uint _1944 = uint(_1942);
    int _1946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1948 = _1946 != 0;
    int _1950 = _1916 * _1932;
    int _1952 = _1950 + _1176;
    float _1954 = float(uint(_1610));
    bool _1956 = !_1948;
    int _1958 = _1956 ? 0 : 1;
    bool _1960 = uint(_1936) >= uint(_853);
    float _1962 = as_type<float>(_1006) * _1954;
    int _1964 = ~_1938;
    int _1966 = _1964 + 1;
    int _1968 = _1966 + 1;
    int _1970 = _1968;
    if (!_1928)
    {
        int _1972 = ~_1938;
        int _1974 = _1972 + 1;
        _1970 = _1974;
    }
    int _1976 = _1970;
    float _1978 = trunc(_1962);
    float _1980 = precise::max(_1978, 0.0);
    uint _1982 = uint(_1980);
    bool _1984 = uint(_1952) >= uint(_759);
    bool _1986 = !_1960;
    int _1988 = _1986 ? 0 : (-1);
    bool _1990 = _1896 != 3;
    bool _1992 = !_1984;
    int _1994 = _1992 ? 0 : (-1);
    bool _1996 = uint(_1896) >= 2u;
    int _1998 = ~_1930;
    int _2000 = _1998 + _1988;
    int _2002 = _2000 + 1;
    int _2004 = _1996 ? 0 : 1;
    int _2006 = ~_833;
    int _2008 = _2006 + 1;
    int _2010 = _853 * _2002;
    int _2012 = _2010 + _1698;
    int _2014 = int(_1788) + int(_1944);
    int _2016 = ~_853;
    int _2018 = _2016 + 1;
    int _2020 = ~_2004;
    int _2022 = _2020 + 1;
    int _2024 = _2022 + 1;
    int _2026 = _2008 * _2014;
    int _2028 = _2026 + _1508;
    int _2030 = _2024;
    if (_1990)
    {
        int _2032 = ~_2004;
        int _2034 = _2032 + 1;
        _2030 = _2034;
    }
    int _2036 = _2030;
    int _2038 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2040 = _2038 != 0;
    int _2042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2044 = _2042 != 0;
    bool _2046 = !_2040;
    int _2048 = _2046 ? 0 : 1;
    bool _2050 = uint(_2028) >= uint(_833);
    int _2052 = _2018 * int(_1982);
    int _2054 = _2052 + _1610;
    bool _2056 = !_1544;
    int _2058 = _2056 ? _2012 : (-1);
    bool _2060 = !_2050;
    int _2062 = _2060 ? 0 : (-1);
    int _2064 = _2058 & 3;
    bool _2066 = _2064 != 0;
    int _2068 = _2058 & 3;
    bool _2070 = _2068 != 0;
    float _2072 = float(uint(_2054));
    int _2074 = _2066 ? 0 : 1;
    bool _2076 = uint(_2068) > 1u;
    float _2078 = as_type<float>(_1006) * _2072;
    int _2080 = ~_2074;
    int _2082 = _2080 + 1;
    int _2084 = _2082 + 1;
    int _2086 = ~_853;
    int _2088 = _2086 + 1;
    float _2090 = trunc(_2078);
    float _2092 = precise::max(_2090, 0.0);
    uint _2094 = uint(_2092);
    float _2096 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2098 = _2096 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2100 = _2084;
    float _2102 = as_type<float>(_2036);
    if (!_2076)
    {
        int _2104 = ~_2074;
        int _2106 = _2104 + 1;
        _2100 = _2106;
    }
    int _2108 = _2100;
    float _2110 = 1.0 / _2098;
    bool _2112 = uint(_2068) >= 2u;
    float _2114 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2116 = _2114 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2118 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2120 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2118;
    int _2122 = _2112 ? 0 : 1;
    bool _2124 = _2068 != 3;
    float _2126 = 1.0 / _2116;
    int _2128 = int(_1982) + int(_2094);
    float _2130 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2132 = _2130 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _2134 = ~_2122;
    int _2136 = _2134 + 1;
    int _2138 = _2136 + 1;
    float _2140 = in.m_48.x;
    float _2142 = in.m_48.y;
    float _2144 = in.m_48.z;
    int _2146 = _2088 * _2128;
    int _2148 = _2146 + _1610;
    float _2150 = 1.0 / _2132;
    float _2152 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _2154 = ~_2014;
    int _2156 = _2154 + _2062;
    int _2158 = _2156 + 1;
    float _2160 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2162 = _2138;
    if (_2124)
    {
        int _2164 = ~_2122;
        int _2166 = _2164 + 1;
        _2162 = _2166;
    }
    int _2168 = _2162;
    float _2170 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2172 = _2170 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2174 = uint(_2148) >= uint(_853);
    bool _2176 = !_2174;
    int _2178 = _2176 ? 0 : (-1);
    float _2180 = 1.0 / _2172;
    bool _2182 = _964 > 0.5;
    float _2184 = -_187;
    int _2186 = _2182 ? as_type<int>(_2184) : as_type<int>(_187);
    int _2188 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2190 = _2188 != 0;
    float _2192 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2194 = _2192 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2196 = _2142 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2198 = _2142 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _2200 = !_2190;
    float _2202 = _2200 ? _187 : as_type<float>(_2186);
    float _2204 = 1.0 / _2194;
    bool _2206 = _974 != 1;
    float _2208 = _964 * 2.0;
    float _2210 = _2142 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2212 = fma(_2140, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2196);
    float _2214 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2216 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2214;
    float _2218 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2220 = _2218 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2222 = fma(_2140, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2198);
    float _2224 = floor(_2208);
    float _2226 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2228 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2226;
    float _2230 = fma(_2140, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2210);
    float _2232 = _2216 * _2150;
    float _2234 = _2228 * _2110;
    float _2236 = 0.0;
    if (!_2206)
    {
        _2236 = _970;
    }
    float _2238 = _2236;
    float _2240 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2242 = _2240 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2244 = 0.0;
    float _2246 = _2238;
    if (!_2206)
    {
        _2244 = _970;
    }
    float _2248 = _2244;
    float _2250 = _2220 * _2204;
    float _2252 = 0.0;
    float _2254 = _2248;
    if (!_2206)
    {
        _2252 = _996;
    }
    float _2256 = _2252;
    float _2258 = _2242 * _2126;
    float _2260 = 0.0;
    float _2262 = _2256;
    if (!_2206)
    {
        _2260 = _996;
    }
    float _2264 = _2260;
    float _2266 = _996 * 2.0;
    float _2268 = _2264;
    if (_2206)
    {
        _2246 = _964;
    }
    float _2270 = _2246;
    float _2272 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2274 = _2272 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    if (_2206)
    {
        _2254 = _964;
    }
    float _2276 = _2254;
    float _2278 = fma(_2144, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2222);
    if (_2206)
    {
        _2262 = _970;
    }
    float _2280 = _2262;
    float _2282 = floor(_2266);
    if (_2206)
    {
        _2268 = _970;
    }
    float _2284 = _2268;
    float _2286 = _2270 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2288 = _976 != 2;
    float _2290 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2292 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2290;
    float _2294 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2296 = _2294 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2298 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2300 = isnan(_741);
    bool _2302 = _2298 || _2300;
    bool _2304 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2306 = _2302 || _2304;
    float _2308 = float(_2306);
    float _2310 = 1.0 / _2274;
    float _2312 = _2292 * _2180;
    float _2314 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2316 = _2314 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2318 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2320 = isnan(_741);
    bool _2322 = _2318 || _2320;
    bool _2324 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2326 = _2322 || _2324;
    float _2328 = float(_2326);
    float _2330 = _2280 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2332 = !_2044;
    int _2334 = _2332 ? 0 : 1;
    float _2336 = 1.0 / _2316;
    float _2338 = 0.0;
    if (_2288)
    {
        _2338 = _964;
    }
    float _2340 = _2338;
    float _2342 = 0.0;
    float _2344 = _2340;
    if (_2288)
    {
        _2342 = _970;
    }
    float _2346 = _2342;
    float _2348 = _2346;
    if (!_2288)
    {
        _2344 = _996;
    }
    float _2350 = _2344;
    if (!_2288)
    {
        _2348 = _964;
    }
    float _2352 = _2348;
    float _2354 = _2296 * _2310;
    bool _2356 = _2224 >= 0.0;
    bool _2358 = isnan(_2224);
    bool _2360 = _2356 || _2358;
    bool _2362 = isnan(0.0);
    bool _2364 = _2360 || _2362;
    float _2366 = _2350 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _2368 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2370 = isnan(_741);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2376 = _2372 || _2374;
    float _2378 = float(_2376);
    float _2380 = _2352 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2382 = _2364 ? 0 : 1;
    bool _2384 = _2224 > 0.0;
    float _2386 = -_2308;
    float _2388 = _2386 + 1.0;
    float _2390 = _2120 * _2336;
    int _2392 = ~_2382;
    int _2394 = _2392 + 1;
    int _2396 = _2394 + 1;
    float _2398 = -_2378;
    float _2400 = _2398 + 1.0;
    float _2402 = _2378 * _2388;
    bool _2404 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2406 = isnan(_741);
    bool _2408 = _2404 || _2406;
    bool _2410 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2412 = _2408 || _2410;
    float _2414 = float(_2412);
    float _2416 = _2328 * _2400;
    float _2418 = -_2328;
    float _2420 = _2418 + 1.0;
    int _2422 = abs(_2036);
    float _2424 = -_2414;
    float _2426 = _2424 + 1.0;
    int _2428 = ~_2128;
    int _2430 = _2428 + _2178;
    int _2432 = _2430 + 1;
    float _2434 = _2414 * _2420;
    int _2436 = _2396;
    if (!_2384)
    {
        int _2438 = ~_2382;
        int _2440 = _2438 + 1;
        _2436 = _2440;
    }
    int _2442 = _2436;
    float _2444 = fma(_2144, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2212);
    bool _2446 = _2282 >= 0.0;
    bool _2448 = isnan(_2282);
    bool _2450 = _2446 || _2448;
    bool _2452 = isnan(0.0);
    bool _2454 = _2450 || _2452;
    float _2456 = fma(_2144, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2230);
    bool _2458 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2460 = isnan(_741);
    bool _2462 = _2458 || _2460;
    bool _2464 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2466 = _2462 || _2464;
    float _2468 = float(_2466);
    float _2470 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2472 = _741 + _2470;
    int _2474 = _2454 ? 0 : 1;
    float _2476 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2478 = _741 + _2476;
    bool _2480 = _2282 > 0.0;
    float _2482 = fma(_2234, _2472, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2484 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2486 = isnan(_741);
    bool _2488 = _2484 || _2486;
    bool _2490 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2492 = _2488 || _2490;
    float _2494 = float(_2492);
    float _2496 = fma(_2258, _2478, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2498 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2500 = _741 + _2498;
    int _2502 = ~_2422;
    int _2504 = _2502 + 1;
    int _2506 = _2504 + 1;
    int _2508 = _853 * _2432;
    int _2510 = _2508 + _1610;
    float _2512 = _2494 * _2426;
    float _2514 = -_2494;
    float _2516 = _2514 + 1.0;
    bool _2518 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2520 = isnan(_741);
    bool _2522 = _2518 || _2520;
    bool _2524 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2526 = _2522 || _2524;
    float _2528 = float(_2526);
    float _2530 = fma(_2250, _2500, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2532 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2152);
    float _2534 = _2468 * _2516;
    float _2536 = -_2468;
    float _2538 = _2536 + 1.0;
    bool _2540 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2542 = isnan(_741);
    bool _2544 = _2540 || _2542;
    bool _2546 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2548 = _2544 || _2546;
    float _2550 = float(_2548);
    float _2552 = -_2528;
    float _2554 = _2552 + 1.0;
    float _2556 = _970 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2558 = _2528 * _2538;
    float _2560 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2562 = _741 + _2560;
    float _2564 = _2550 * _2554;
    float _2566 = -_2550;
    float _2568 = _2566 + 1.0;
    float _2570 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2572 = _741 + _2570;
    float _2574 = fma(_2232, _2562, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2576 = _2482 * _2564;
    float _2578 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2580 = _741 + _2578;
    float _2582 = fma(_2312, _2572, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _2584 = ~_2474;
    int _2586 = _2584 + 1;
    int _2588 = _2586 + 1;
    float _2590 = fma(_2568, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2576);
    float _2592 = fma(_2354, _2580, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2594 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2596 = _741 + _2594;
    float _2598 = fma(_2496, _2558, _2590);
    float _2600 = _964 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2602 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2604 = _2588;
    if (!_2480)
    {
        int _2606 = ~_2474;
        int _2608 = _2606 + 1;
        _2604 = _2608;
    }
    int _2610 = _2604;
    float _2612 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2614 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2616 = fma(_2390, _2596, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2618 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2602);
    float _2620 = _964 + _996;
    float _2622 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2624 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2614);
    float _2626 = _964 + (-0.5);
    float _2628 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2612);
    float _2630 = _970 + _996;
    float _2632 = _970 + (-0.5);
    float _2634 = -_2622;
    float _2636 = fma(_2600, 2.0, _2634);
    float _2638 = fma(_2574, _2534, _2598);
    float _2640 = fma(_2556, -2.0, _2160);
    float _2642 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2644 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2646 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2642);
    float _2648 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2650 = _978 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2652 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2644);
    float _2654 = _980 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2656 = _1008 + (-1.0);
    float _2658 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2660 = fma(_2650, -2.0, _2648);
    float _2662 = _2444 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2664 = _1866 >> 31;
    float _2666 = -_2658;
    float _2668 = fma(_2654, 2.0, _2666);
    int _2670 = _833 * _2158;
    int _2672 = _2670 + _1508;
    float _2674 = fma(_2530, _2512, _2638);
    int _2676 = _2664 & 3;
    float _2678 = fma(_2656, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2680 = _2278 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2682 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2684 = _2662 + _2682;
    float _2686 = _2630 + (-1.0);
    int _2688 = _1866 + _2676;
    float _2690 = _2456 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2692 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2694 = _2680 + _2692;
    float _2696 = _2684 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2698 = fma(_2686, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _2700 = _2688 >> 2;
    float _2702 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2704 = _2690 + _2702;
    float _2706 = fma(_2694, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2696);
    bool _2708 = _1896 != 3;
    float _2710 = floor(_1012);
    int _2712 = _2700 << 4;
    int _2714 = _2712 + 656;
    float _2716 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2706);
    float _2718 = fma(_2582, _2434, _2674);
    uint _2720 = uint(int(uint(_2714) >> uint(2)));
    uint _2722 = uint(int(uint(int(_2720)) >> uint(2)));
    int _2724 = int(_2720) & 3;
    float _2726 = (*spvDescriptorSet0.vp_c9)._m0[int(_2722)][_2724];
    int _2728 = int(_2720) + 1;
    uint _2730 = uint(int(uint(_2728) >> uint(2)));
    int _2732 = _2728 & 3;
    float _2734 = (*spvDescriptorSet0.vp_c9)._m0[int(_2730)][_2732];
    float _2736 = _1134 + 0.5;
    float _2738 = -_121;
    float _2740 = fma(_2738, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2668);
    float _2742 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2660);
    bool _2744 = !_1438;
    int _2746 = _2744 ? _2672 : (-1);
    float _2748 = -_121;
    float _2750 = fma(_2748, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2636);
    float _2752 = fma(_2592, _2416, _2718);
    int _2754 = _2714 + 8;
    uint _2756 = uint(int(uint(_2754) >> uint(2)));
    uint _2758 = uint(int(uint(int(_2756)) >> uint(2)));
    int _2760 = int(_2756) & 3;
    float _2762 = (*spvDescriptorSet0.vp_c9)._m0[int(_2758)][_2760];
    int _2764 = int(_2756) + 1;
    uint _2766 = uint(int(uint(_2764) >> uint(2)));
    int _2768 = _2764 & 3;
    float _2770 = (*spvDescriptorSet0.vp_c9)._m0[int(_2766)][_2768];
    bool _2772 = !_1898;
    int _2774 = _2772 ? 0 : 1;
    float _2776 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2652);
    bool _2778 = _2710 > 0.0;
    float _2780 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2646);
    bool _2782 = _2710 >= 0.0;
    bool _2784 = isnan(_2710);
    bool _2786 = _2782 || _2784;
    bool _2788 = isnan(0.0);
    bool _2790 = _2786 || _2788;
    float _2792 = -_2776;
    float _2794 = _2792 + 1.0;
    bool _2796 = !_2708;
    int _2798 = _2796 ? 0 : (-1);
    float _2800 = fma(_2616, _2402, _2752);
    bool _2802 = _2716 >= 0.0;
    float _2804 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2806 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2808 = abs(_2798);
    float _2810 = fma(_2308, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2800);
    float _2812 = fma(_2276, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2804);
    float _2814 = fma(_2284, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2806);
    float _2816 = fma(_2736, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2740);
    float _2818 = _2202 + 0.5;
    float _2820 = -_1918;
    float _2822 = -_2742;
    float _2824 = fma(_2820, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2822);
    float _2826 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2640);
    float _2828 = _1912 + (-0.5);
    float _2830 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2832 = fma(_2818, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2750);
    int _2834 = abs(_1976);
    float _2836 = -_2828;
    float _2838 = -_2826;
    float _2840 = fma(_2836, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2838);
    float _2842 = -_2830;
    float _2844 = fma(_2286, 2.0, _2842);
    int _2846 = abs(_2774);
    float _2848 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2850 = int(_2848);
    int _2852 = ~_2834;
    int _2854 = _2852 + 1;
    int _2856 = _2854 + 1;
    float _2858 = -_121;
    float _2860 = fma(_2858, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2844);
    float _2862 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2814);
    float _2864 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2618);
    float _2866 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2628);
    if (_2802)
    {
        _2102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2868 = _2102;
    float _2870 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2872 = _2856 * as_type<int>(_2734);
    int _2874 = ~_2846;
    int _2876 = _2874 + 1;
    int _2878 = _2876 + 1;
    float _2880 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2882 = -_2870;
    float _2884 = fma(_2366, 2.0, _2882);
    int _2886 = abs(_2850);
    int _2888 = _2878 * as_type<int>(_2726);
    int _2890 = _2888 + _2872;
    int _2892 = as_type<int>(_2868);
    if (_2802)
    {
        float _2894 = _2868 * 5.0;
        _2892 = as_type<int>(_2894);
    }
    int _2896 = _2892;
    float _2898 = fma(_2380, -2.0, _2880);
    int _2900 = abs(_2048);
    int _2902 = _2506 * as_type<int>(_2762);
    int _2904 = _2902 + _2890;
    if (_2802)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9247 = as_type<float>(_2896);
        out.gl_Position.z = _9247;
    }
    float _2906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2908 = ~_2808;
    int _2910 = _2908 + 1;
    int _2912 = _2910 + 1;
    float _2914 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2916 = float(uint(_2850));
    float _2918 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2812);
    int _2920 = ~_2886;
    int _2922 = _2920 + 1;
    int _2924 = _2912 * as_type<int>(_2770);
    int _2926 = _2924 + _2904;
    float _2928 = float(uint(_2886));
    float _2930 = fma(_2330, -2.0, _2914);
    float _2932 = 1.0 / _2916;
    int _2934 = _1738 >> 31;
    float _2936 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2898);
    int _2938 = ~_2900;
    int _2940 = _2938 + 1;
    int _2942 = _2940 + 1;
    float _2944 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2930);
    int _2946 = _2934 & 3;
    float _2948 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2532);
    int _2950 = _2058 >> 31;
    float _2952 = 1.0 / _2928;
    int _2954 = _1738 + _2946;
    int _2956 = _2926 * _2942;
    int _2958 = _2950 & 3;
    float _2960 = _2906 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2962 = _2954 >> 2;
    int _2964 = _2746 * _2900;
    int _2966 = _2964 + _2956;
    int _2968 = _2058 + _2958;
    float _2970 = -_2794;
    float _2972 = fma(_2970, _1134, _2816);
    int _2974 = _2962 << 4;
    int _2976 = _2974 + 368;
    float _2978 = -_2780;
    float _2980 = _2978 + 1.0;
    int _2982 = _2968 >> 2;
    float _2984 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2986 = abs(_2966);
    uint _2988 = uint(int(uint(_2976) >> uint(2)));
    uint _2990 = uint(int(uint(int(_2988)) >> uint(2)));
    int _2992 = int(_2988) & 3;
    float _2994 = (*spvDescriptorSet0.vp_c9)._m0[int(_2990)][_2992];
    int _2996 = int(_2988) + 1;
    uint _2998 = uint(int(uint(_2996) >> uint(2)));
    int _3000 = _2996 & 3;
    float _3002 = (*spvDescriptorSet0.vp_c9)._m0[int(_2998)][_3000];
    int _3004 = as_type<int>(_2932) + (-2);
    float _3006 = fma(_2980, _1908, _2824);
    float _3008 = float(uint(_2966));
    float _3010 = _1760 + 0.5;
    int _3012 = as_type<int>(_2952) + (-2);
    float _3014 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2624);
    int _3016 = _2982 << 4;
    int _3018 = _3016 + 800;
    float _3020 = as_type<float>(_3004) * _3008;
    float _3022 = float(uint(_2986));
    float _3024 = fma(_2960, _3010, _2860);
    uint _3026 = uint(int(uint(_3018) >> uint(2)));
    uint _3028 = uint(int(uint(int(_3026)) >> uint(2)));
    int _3030 = int(_3026) & 3;
    float _3032 = (*spvDescriptorSet0.vp_c9)._m0[int(_3028)][_3030];
    int _3034 = int(_3026) + 1;
    uint _3036 = uint(int(uint(_3034) >> uint(2)));
    int _3038 = _3034 & 3;
    float _3040 = (*spvDescriptorSet0.vp_c9)._m0[int(_3036)][_3038];
    int _3042 = ~_2850;
    int _3044 = _3042 + 1;
    out.m_68.x = _2972;
    out.m_68.y = _3006;
    float _3046 = as_type<float>(_3012) * _3022;
    float _3048 = trunc(_3020);
    float _3050 = precise::max(_3048, 0.0);
    uint _3052 = uint(_3050);
    float _3054 = _1290 + (-0.5);
    float _3056 = _2984 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3058 = -_3014;
    float _3060 = _3058 + 1.0;
    int _3062 = ~_1932;
    int _3064 = _3062 + _1994;
    int _3066 = _3064 + 1;
    float _3068 = -_3056;
    float _3070 = -_2944;
    float _3072 = fma(_3068, _3054, _3070);
    bool _3074 = !_1746;
    int _3076 = _3074 ? 0 : 1;
    float _3078 = trunc(_3046);
    float _3080 = precise::max(_3078, 0.0);
    uint _3082 = uint(_3080);
    int _3084 = _2976 + 8;
    uint _3086 = uint(int(uint(_3084) >> uint(2)));
    uint _3088 = uint(int(uint(int(_3086)) >> uint(2)));
    int _3090 = int(_3086) & 3;
    float _3092 = (*spvDescriptorSet0.vp_c9)._m0[int(_3088)][_3090];
    int _3094 = int(_3086) + 1;
    uint _3096 = uint(int(uint(_3094) >> uint(2)));
    int _3098 = _3094 & 3;
    float _3100 = (*spvDescriptorSet0.vp_c9)._m0[int(_3096)][_3098];
    int _3102 = _759 * _3066;
    int _3104 = _3102 + _1176;
    int _3106 = abs(_3076);
    out.m_70.x = _2810;
    int _3108 = abs(_1884);
    bool _3110 = _759 == 0;
    int _3112 = _3044 * int(_3052);
    int _3114 = _3112 + _2966;
    int _3116 = _3018 + 8;
    uint _3118 = uint(int(uint(_3116) >> uint(2)));
    uint _3120 = uint(int(uint(int(_3118)) >> uint(2)));
    int _3122 = int(_3118) & 3;
    float _3124 = (*spvDescriptorSet0.vp_c9)._m0[int(_3120)][_3122];
    int _3126 = int(_3118) + 1;
    uint _3128 = uint(int(uint(_3126) >> uint(2)));
    int _3130 = _3126 & 3;
    float _3132 = (*spvDescriptorSet0.vp_c9)._m0[int(_3128)][_3130];
    int _3134 = abs(_1958);
    if (_2802)
    {
        out.m_55.x = 0.0;
    }
    bool _3136 = !_3110;
    int _3138 = _3136 ? _3104 : (-1);
    float _3140 = float(uint(_3114));
    int _3142 = _2922 * int(_3082);
    int _3144 = _3142 + _2986;
    int _3146 = abs(_1828);
    float _3148 = as_type<float>(_3004) * _3140;
    bool _3150 = !_2070;
    int _3152 = _3150 ? 0 : 1;
    float _3154 = float(uint(_3144));
    int _3156 = abs(_2108);
    float _3158 = as_type<float>(_3012) * _3154;
    float _3160 = trunc(_3148);
    float _3162 = precise::max(_3160, 0.0);
    uint _3164 = uint(_3162);
    int _3166 = ~_3156;
    int _3168 = _3166 + 1;
    int _3170 = _3168 + 1;
    int _3172 = ~_3146;
    int _3174 = _3172 + 1;
    int _3176 = _3174 + 1;
    bool _3178 = _1744 != 3;
    int _3180 = abs(_3152);
    float _3182 = trunc(_3158);
    float _3184 = precise::max(_3182, 0.0);
    uint _3186 = uint(_3184);
    int _3188 = _3176 * as_type<int>(_3002);
    int _3190 = _3170 * as_type<int>(_3040);
    int _3192 = ~_2850;
    int _3194 = _3192 + 1;
    int _3196 = ~_3106;
    int _3198 = _3196 + 1;
    int _3200 = _3198 + 1;
    int _3202 = ~_3180;
    int _3204 = _3202 + 1;
    int _3206 = _3204 + 1;
    int _3208 = int(_3052) + int(_3164);
    int _3210 = _3200 * as_type<int>(_2994);
    int _3212 = _3210 + _3188;
    int _3214 = _3206 * as_type<int>(_3032);
    int _3216 = _3214 + _3190;
    int _3218 = ~_2886;
    int _3220 = _3218 + 1;
    int _3222 = _3194 * _3208;
    int _3224 = _3222 + _2966;
    int _3226 = int(_3082) + int(_3186);
    bool _3228 = !_3178;
    int _3230 = _3228 ? 0 : (-1);
    int _3232 = ~_3108;
    int _3234 = _3232 + 1;
    int _3236 = _3234 + 1;
    int _3238 = _3220 * _3226;
    int _3240 = _3238 + _2986;
    bool _3242 = uint(_3224) >= uint(_2850);
    int _3244 = abs(_3230);
    int _3246 = _3236 * as_type<int>(_3092);
    int _3248 = _3246 + _3212;
    bool _3250 = !_3242;
    int _3252 = _3250 ? 0 : (-1);
    bool _3254 = uint(_3240) >= uint(_2886);
    int _3256 = _2966 ^ _2850;
    int _3258 = abs(_2168);
    int _3260 = ~_3244;
    int _3262 = _3260 + 1;
    int _3264 = _3262 + 1;
    bool _3266 = !_3254;
    int _3268 = _3266 ? 0 : (-1);
    uint _3270 = uint(int(uint(_3256) >> uint(31)));
    int _3272 = _3264 * as_type<int>(_3100);
    int _3274 = _3272 + _3248;
    bool _3276 = _2068 != 3;
    int _3278 = ~_3258;
    int _3280 = _3278 + 1;
    int _3282 = _3280 + 1;
    int _3284 = ~_3268;
    int _3286 = _3226 + _3284;
    int _3288 = _3286 + 1;
    int _3290 = ~int(_3270);
    int _3292 = _3290 + 1;
    int _3294 = _3282 * as_type<int>(_3124);
    int _3296 = _3294 + _3216;
    int _3298 = ~_3208;
    int _3300 = _3298 + _3252;
    int _3302 = _3300 + 1;
    bool _3304 = !_3276;
    int _3306 = _3304 ? 0 : (-1);
    int _3308 = _3288 ^ _3292;
    int _3310 = _2850 * _3302;
    int _3312 = _3310 + _2966;
    int _3314 = abs(_3306);
    bool _3316 = _2850 == 0;
    bool _3318 = _2850 == 0;
    int _3320 = ~_3292;
    int _3322 = _3320 + _3308;
    int _3324 = _3322 + 1;
    int _3326 = ~_3314;
    int _3328 = _3326 + 1;
    int _3330 = _3328 + 1;
    bool _3332 = !_3316;
    int _3334 = _3332 ? _3312 : (-1);
    bool _3336 = !_3318;
    int _3338 = _3336 ? _3324 : (-1);
    int _3340 = _3330 * as_type<int>(_3132);
    int _3342 = _3340 + _3296;
    int _3344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3346 = _3344 != 0;
    int _3348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3350 = _3348 != 0;
    int _3352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3354 = _3352 != 0;
    float _3356 = -_2862;
    float _3358 = _3356 + 1.0;
    float _3360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3362 = abs(_2334);
    float _3364 = fma(_1290, _3358, _3072);
    int _3366 = ~_3134;
    int _3368 = _3366 + 1;
    int _3370 = _3368 + 1;
    float _3372 = -_2918;
    float _3374 = _3372 + 1.0;
    int _3376 = ~_3362;
    int _3378 = _3376 + 1;
    int _3380 = _3378 + 1;
    float _3382 = float(_3338);
    float _3384 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3386 = log2(_3384);
    int _3388 = _3274 * _3370;
    float _3390 = -_2864;
    float _3392 = _3390 + 1.0;
    float _3394 = -_2866;
    float _3396 = _3394 + 1.0;
    float _3398 = -_3374;
    float _3400 = fma(_1760, _3398, _3024);
    int _3402 = _3138 * _3134;
    int _3404 = _3402 + _3388;
    float _3406 = -_3392;
    float _3408 = fma(_2202, _3406, _2832);
    float _3410 = fma(_1912, _3396, _2840);
    float _3412 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3414 = _3360 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3416 = !_1544;
    int _3418 = _3416 ? _2510 : (-1);
    int _3420 = _3342 * _3380;
    out.m_72.x = _3408;
    out.m_72.y = _3410;
    out.m_72.z = _3400;
    out.m_72.w = _3364;
    float _3422 = -_2936;
    float _3424 = fma(_3414, _3382, _3422);
    float _3426 = _2684 * _2684;
    int _3428 = _3418 * _3362;
    int _3430 = _3428 + _3420;
    float _3432 = _3386 * _121;
    float _3434 = -_2948;
    float _3436 = _3434 + 1.0;
    float _3438 = fma(_2694, _2694, _3426);
    float _3440 = float(_3334);
    float _3442 = -_121;
    float _3444 = fma(_3442, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2884);
    float _3446 = float(_2610);
    float _3448 = fma(_2704, _2704, _3438);
    float _3450 = exp2(_3432);
    float _3452 = _3412 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3454 = !_3354;
    int _3456 = _3454 ? 0 : 1;
    float _3458 = _1236 + (-0.5);
    float _3460 = fma(_3452, _3440, _3444);
    float _3462 = _1226 + 0.5;
    float _3464 = -_3414;
    float _3466 = fma(_3464, _3458, _3424);
    bool _3468 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3470 = isnan(1.0);
    bool _3472 = _3468 || _3470;
    bool _3474 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3476 = _3472 || _3474;
    float _3478 = rsqrt(_3448);
    float _3480 = fma(_3452, _3462, _3460);
    float _3482 = fma(_1236, _3436, _3466);
    float _3484 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3486 = 1.0 + _3484;
    float _3488 = float(_3404);
    float _3490 = in.m_74.x;
    float _3492 = in.m_74.y;
    float _3494 = in.m_74.z;
    float _3496 = -_3060;
    float _3498 = fma(_1226, _3496, _3480);
    float _3500 = float(_3430);
    float _3502 = 1.0 / _3486;
    bool _3504 = !_3346;
    int _3506 = _3504 ? 0 : 1;
    out.m_76.x = _3488;
    bool _3508 = !_3350;
    int _3510 = _3508 ? 0 : 1;
    out.m_76.w = _3500;
    float _3512 = _2684 * _3478;
    float _3514 = _2694 * _3478;
    out.m_78.x = _3498;
    out.m_78.y = _3482;
    int _3516 = abs(_3506);
    if (_2802)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3518 = -_3512;
    float _3520 = fma(_3518, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2662);
    float _3522 = _2704 * _3478;
    float _3524 = -_3514;
    float _3526 = fma(_3524, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2680);
    float _3528 = float(_3516);
    float _3530 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3532 = _3520 + _3530;
    float _3534 = -_3522;
    float _3536 = fma(_3534, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2690);
    float _3538 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3540 = _3526 + _3538;
    float _3542 = -_3450;
    float _3544 = _3542 + 1.0;
    float _3546 = _3532 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _3548 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3550 = isnan(0.0);
    bool _3552 = _3548 || _3550;
    bool _3554 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3556 = _3552 || _3554;
    float _3558 = _3528 * _3446;
    float _3560 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3562 = _3536 + _3560;
    float _3564 = fma(_3540, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3546);
    float _3566 = _3556 ? _3544 : 0.0;
    float _3568 = _3558 * (-2.0);
    float _3570 = -_3512;
    float _3572 = fma(_3570, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2684);
    float _3574 = fma(_3562, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3564);
    float _3576 = -_3514;
    float _3578 = fma(_3576, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2694);
    float _3580 = fma(_3568, _3490, _3490);
    float _3582 = _3566;
    float _3584 = _3532;
    if (_3476)
    {
        float _3586 = _3566 * _3502;
        _131 = _3586;
    }
    float _3588 = _131;
    float _3590 = _3572 * _3572;
    bool _3592 = _3574 >= 0.0;
    float _3594 = fma(_2678, _3568, _2678);
    float _3596 = fma(_2626, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3580);
    int _3598 = _2790 ? 0 : 1;
    float _3600 = fma(_3578, _3578, _3590);
    float _3602 = -_3522;
    float _3604 = fma(_3602, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2704);
    float _3606 = fma(_3594, _3588, _3596);
    int _3608 = abs(_3510);
    int _3610 = ~_3598;
    int _3612 = _3610 + 1;
    int _3614 = _3612 + 1;
    float _3616 = fma(_3604, _3604, _3600);
    int _3618 = _3614;
    if (!_2778)
    {
        int _3620 = ~_3598;
        int _3622 = _3620 + 1;
        _3618 = _3622;
    }
    int _3624 = _3618;
    float _3626 = _3606 * 0.15915493667125701904296875;
    float _3628 = float(_2442);
    if (_3592)
    {
        out.m_55.x = 0.0;
    }
    if (_3592)
    {
        _3582 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3630 = _3582;
    float _3632 = sqrt(_3616);
    float _3634 = float(_3608);
    int _3636 = abs(_3456);
    int _3638 = as_type<int>(_3630);
    if (_3592)
    {
        float _3640 = _3630 * 5.0;
        _3638 = as_type<int>(_3640);
    }
    int _3642 = _3638;
    float _3644 = _3634 * _3628;
    float _3646 = _3626 * 6.283185482025146484375;
    float _3648 = sin(_3646);
    if (_3592)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10325 = as_type<float>(_3642);
        out.gl_Position.z = _10325;
    }
    float _3650 = float(_3624);
    float _3652 = float(_3636);
    if (_3592)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3654 = -_2662;
    float _3656 = _3654 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3658 = -_2680;
    float _3660 = _3658 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3662 = _3644 * (-2.0);
    float _3664 = -_2690;
    float _3666 = _3664 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3668 = _3656 * _3656;
    float _3670 = _3652 * _3650;
    float _3672 = fma(_3662, _3492, _3492);
    float _3674 = fma(_2698, _3662, _2698);
    float _3676 = fma(_3660, _3660, _3668);
    float _3678 = fma(_2632, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3672);
    float _3680 = _2620 + (-1.0);
    float _3682 = fma(_3666, _3666, _3676);
    float _3684 = _3670 * (-2.0);
    float _3686 = _996 + (-0.5);
    float _3688 = fma(_3680, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3690 = rsqrt(_3682);
    float _3692 = fma(_3684, _3494, _3494);
    float _3694 = fma(_3674, _3588, _3678);
    float _3696 = fma(_3688, _3684, _3688);
    float _3698 = _3478 * _3632;
    float _3700 = fma(_3686, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3692);
    float _3702 = _3694 * 0.15915493667125701904296875;
    float _3704 = _3626 * 6.283185482025146484375;
    float _3706 = cos(_3704);
    float _3708 = fma(_3696, _3588, _3700);
    float _3710 = _3708 * 0.15915493667125701904296875;
    float _3712 = _3660 * _3690;
    float _3714 = _3666 * _3690;
    float _3716 = _3656 * _3690;
    float _3718 = _3702 * 6.283185482025146484375;
    float _3720 = sin(_3718);
    float _3722 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3724 = _3712 * _3722;
    float _3726 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3728 = _3714 * _3726;
    float _3730 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3732 = _3716 * _3730;
    float _3734 = _583 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3736 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3738 = -_3724;
    float _3740 = fma(_3714, _3736, _3738);
    float _3742 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3744 = -_3728;
    float _3746 = fma(_3716, _3742, _3744);
    float _3748 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3750 = -_3732;
    float _3752 = fma(_3712, _3748, _3750);
    float _3754 = _3702 * 6.283185482025146484375;
    float _3756 = cos(_3754);
    float _3758 = _3740 * _3740;
    float _3760 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _3762 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3764 = fma(_3746, _3746, _3758);
    float _3766 = _3710 * 6.283185482025146484375;
    float _3768 = sin(_3766);
    float _3770 = fma(_3752, _3752, _3764);
    float _3772 = _581 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3774 = _3648 * _3720;
    float _3776 = _3706 * _3720;
    float _3778 = _3698 * _3772;
    float _3780 = _3710 * 6.283185482025146484375;
    float _3782 = cos(_3780);
    float _3784 = _3706 * _3756;
    float _3786 = _3760 * _3778;
    float _3788 = rsqrt(_3770);
    float _3790 = fma(_3768, _3784, _3774);
    float _3792 = fma(_3768, _3774, _3784);
    float _3794 = _3648 * _3756;
    float _3796 = -_3786;
    float _3798 = _3768 * _3796;
    float _3800 = -_3776;
    float _3802 = fma(_3768, _3794, _3800);
    float _3804 = _3706 * _3782;
    float _3806 = _3756 * _3782;
    float _3808 = _3648 * _3782;
    float _3810 = _3720 * _3782;
    float _3812 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _3814 = _3698 * _3734;
    float _3816 = _3804 * _3786;
    float _3818 = -_3794;
    float _3820 = fma(_3768, _3776, _3818);
    float _3822 = _3740 * _3788;
    float _3824 = _3812 * _3814;
    float _3826 = _3746 * _3788;
    float _3828 = _3698 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3830 = _3828 * 0.5;
    float _3832 = _3808 * _3786;
    float _3834 = fma(_3790, _3824, _3816);
    float _3836 = _3752 * _3788;
    float _3838 = _3714 * _3822;
    float _3840 = _3716 * _3826;
    float _3842 = fma(_3806, _3824, _3798);
    float _3844 = fma(_3820, _3830, _3834);
    float _3846 = -_3838;
    float _3848 = fma(_3716, _3836, _3846);
    float _3850 = -_3840;
    float _3852 = fma(_3712, _3822, _3850);
    float _3854 = fma(_3802, _3824, _3832);
    float _3856 = fma(_3810, _3830, _3842);
    float _3858 = _3848 * _3844;
    float _3860 = _3852 * _3844;
    float _3862 = fma(_3792, _3830, _3854);
    float _3864 = _3804 * _3848;
    float _3866 = fma(_3826, _3856, _3858);
    float _3868 = fma(_3836, _3856, _3860);
    float _3870 = _3804 * _3852;
    float _3872 = _3820 * _3848;
    float _3874 = fma(_3712, _3862, _3866);
    float _3876 = fma(_3714, _3862, _3868);
    float _3878 = _3820 * _3852;
    float _3880 = _3790 * _3852;
    float _3882 = _2680 + _3874;
    float _3884 = _2690 + _3876;
    float _3886 = _3712 * _3836;
    float _3888 = _3790 * _3848;
    float _3890 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3892 = _3882 + _3890;
    float _3894 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3896 = _3884 + _3894;
    float _3898 = -_3886;
    float _3900 = fma(_3714, _3826, _3898);
    float _3902 = -_3768;
    float _3904 = fma(_3902, _3836, _3870);
    float _3906 = _3892 * _3892;
    float _3908 = _3896 * _3896;
    float _3910 = _3804 * _3900;
    float _3912 = fma(_3806, _3826, _3888);
    float _3914 = fma(_3762, _3762, 1.0);
    float _3916 = _3906 + _3908;
    float _3918 = _3900 * _3844;
    float _3920 = _3790 * _3900;
    float _3922 = _3820 * _3900;
    float _3924 = sqrt(_3916);
    float _3926 = fma(_3822, _3856, _3918);
    float _3928 = fma(_3806, _3822, _3920);
    float _3930 = -_3768;
    float _3932 = fma(_3930, _3822, _3910);
    float _3934 = fma(_3810, _3822, _3922);
    float _3936 = fma(_3716, _3862, _3926);
    float _3938 = fma(_3806, _3836, _3880);
    float _3940 = -_3768;
    float _3942 = fma(_3940, _3826, _3864);
    float _3944 = rsqrt(_3914);
    float _3946 = _2662 + _3936;
    float _3948 = fma(_3810, _3826, _3872);
    float _3950 = fma(_3810, _3836, _3878);
    bool _3952 = _3924 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3954 = _3810;
    float _3956 = _3768;
    float _3958 = _3922;
    float _3960 = _3920;
    float _3962 = _3900;
    if (!_3952)
    {
        _3954 = _3908;
    }
    float _3964 = _3954;
    float _3966 = _3964;
    if (!_3952)
    {
        _3956 = _3906;
    }
    float _3968 = _3956;
    float _3970 = _3968;
    if (!_3952)
    {
        _3958 = _3882;
    }
    float _3972 = _3958;
    float _3974 = _3972;
    if (!_3952)
    {
        _3960 = _3884;
    }
    float _3976 = _3960;
    float _3978 = _3976;
    if (!_3952)
    {
        _3962 = _3946;
    }
    float _3980 = _3962;
    bool _3982 = !_3952;
    float _3984 = _3980;
    if (!_3982)
    {
        float _3986 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3988 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3990 = _3924 + _3988;
        float _3992 = _3946 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3994 = rsqrt(_3916);
        float _3996 = _3990 * _3986;
        float _3998 = _3996 * 0.15915493667125701904296875;
        float _4000 = _3998 * 6.283185482025146484375;
        float _4002 = sin(_4000);
        float _4004 = _3998 * 6.283185482025146484375;
        float _4006 = cos(_4004);
        float _4008 = fma(_4002, _3992, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4010 = _3994 * _4008;
        float _4012 = _4006 + (-1.0);
        float _4014 = fma(_3892, _4010, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4016 = fma(_3896, _4010, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _4018 = _4012 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4020 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _4022 = _4014 + _4020;
        float _4024 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _4026 = _4016 + _4024;
        float _4028 = fma(_3946, _4006, _4018);
        float _4030 = _4022 * _4022;
        float _4032 = _4026 * _4026;
        _3984 = _4028;
        _3970 = _4030;
        _3966 = _4032;
        _3978 = _4016;
        _3974 = _4014;
    }
    float _4034 = _3984;
    float _4036 = _3970;
    float _4038 = _3966;
    float _4040 = _3978;
    float _4042 = _3974;
    float _4044 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4046 = _4034 + _4044;
    float _4048 = fma(_3808, _3712, _3942);
    float _4050 = fma(_3808, _3716, _3932);
    float _4052 = fma(_3808, _3714, _3904);
    float _4054 = fma(_4046, _4046, _4036);
    float _4056 = fma(_3792, _3712, _3948);
    float _4058 = fma(_3792, _3716, _3934);
    float _4060 = fma(_3792, _3714, _3950);
    float _4062 = _4054 + _4038;
    float _4064 = _3762 * _3944;
    float _4066 = fma(_3802, _3712, _3912);
    float _4068 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4070 = _3762 * _4048;
    float _4072 = fma(_3802, _3716, _3928);
    float _4074 = fma(_3802, _3714, _3938);
    float _4076 = _3762 * _4050;
    float _4078 = _3762 * _4052;
    float _4080 = -_4056;
    float _4082 = _4064 * _4080;
    float _4084 = -_4058;
    float _4086 = _4064 * _4084;
    float _4088 = -_4060;
    float _4090 = _4064 * _4088;
    float _4092 = fma(_4068, _4066, _4070);
    float _4094 = sqrt(_4062);
    float _4096 = fma(_4068, _4072, _4076);
    float _4098 = fma(_4068, _4074, _4078);
    float _4100 = fma(_3944, _4048, _4082);
    float _4102 = fma(_3944, _4050, _4086);
    float _4104 = _4058 + _4096;
    float _4106 = fma(_3944, _4052, _4090);
    float _4108 = _4056 + _4092;
    float _4110 = _4060 + _4098;
    out.m_80.x = _4066;
    out.m_80.y = _4072;
    out.m_80.z = _4074;
    out.m_82.x = _4100;
    out.m_82.y = _4102;
    out.m_82.z = _4106;
    bool _4112 = _4094 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4114 = isnan(_4094);
    bool _4116 = _4112 || _4114;
    bool _4118 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4120 = _4116 || _4118;
    out.m_84.x = _4108;
    out.m_84.y = _4104;
    out.m_84.z = _4110;
    float _4122 = _4048;
    float _4124 = _4090;
    if (!_4120)
    {
        _4122 = 1.0;
    }
    float _4126 = _4122;
    bool _4128 = !_4120;
    float _4130 = _4126;
    if (!_4128)
    {
        bool _4132 = _4094 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4134 = isnan(_4094);
        bool _4136 = _4132 || _4134;
        bool _4138 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4140 = _4136 || _4138;
        if (!_4140)
        {
            float _4142 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4144 = _4094 + _4142;
            float _4146 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4148 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4146;
            float _4150 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4152 = _4150 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4154 = 1.0 / _4148;
            float _4156 = _4144 * _4154;
            float _4158 = fma(_4156, _4152, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4130 = _4158;
            _4160 = true;
        }
        else
        {
            bool _4162 = _4094 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4164 = isnan(_4094);
            bool _4166 = _4162 || _4164;
            bool _4168 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4170 = _4166 || _4168;
            if (!_4170)
            {
                float _4172 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4174 = _4094 + _4172;
                float _4176 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4178 = _4176 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4180 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4182 = _4180 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4184 = 1.0 / _4178;
                float _4186 = _4174 * _4184;
                float _4188 = fma(_4186, _4182, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4130 = _4188;
                _4160 = true;
            }
            else
            {
                _4130 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4160 = false;
    float _4190 = _4130;
    float _4192 = _3520 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4194 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4196 = _4034 + _4194;
    float _4198 = fma(_3526, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4192);
    float _4200 = fma(_4196, _4190, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _4202 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4204 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4206 = _4202 || _4204;
    bool _4208 = isnan(0.5);
    bool _4210 = _4206 || _4208;
    float _4212 = fma(_3536, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4198);
    float _4214 = _3520 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _4216 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4218 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4220 = _4216 || _4218;
    bool _4222 = isnan(0.5);
    bool _4224 = _4220 || _4222;
    float _4226 = _4212 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4228 = fma(_3526, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4214);
    float _4230 = 1.0 / _4226;
    float _4232 = fma(_3536, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4228);
    float _4234 = _4232 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4236 = _4234 + _4226;
    float _4238 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4240 = _4040 + _4238;
    float _4242 = -_3512;
    float _4244 = fma(_4242, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4200);
    float _4246 = _4236 * _4230;
    float _4248 = _4246 * 0.5;
    float _4250 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4252 = _4042 + _4250;
    float _4254 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4256 = fma(_4248, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4254);
    float _4258 = fma(_4252, _4190, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4260 = fma(_4240, _4190, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4262 = _4240;
    float _4264 = _4244;
    float _4266 = _4260;
    if (_4224)
    {
        _4262 = 1.0;
    }
    float _4268 = _4262;
    float _4270 = 1.0 / _4256;
    float _4272 = -_3514;
    float _4274 = fma(_4272, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4258);
    float _4276 = -_3522;
    float _4278 = fma(_4276, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4260);
    float _4280 = _4274;
    float _4282 = _4278;
    float _4284 = _4268;
    if (!_4210)
    {
        float _4286 = _3532 * _3532;
        float _4288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4290 = -_2690;
        float _4292 = _4290 + _4260;
        float _4294 = -_2662;
        float _4296 = _4294 + _4200;
        float _4298 = fma(_3540, _3540, _4286);
        float _4300 = -_2680;
        float _4302 = _4300 + _4258;
        float _4304 = fma(_3562, _3562, _4298);
        float _4306 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4308 = sqrt(_4304);
        float _4310 = 1.0 / _3698;
        float _4312 = _4306 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4314 = precise::min(_4308, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4316 = _4314 * _4288;
        float _4318 = _4316 * _4310;
        float _4320 = _4312 * _4318;
        float _4322 = _4292 * _4318;
        float _4324 = fma(_4296, _4320, _3520);
        float _4326 = fma(_4302, _4320, _3526);
        float _4328 = fma(_4312, _4322, _3536);
        _4264 = _4324;
        _4280 = _4326;
        _4282 = _4328;
        _3584 = _4308;
    }
    float _4330 = _4264;
    float _4332 = _4280;
    float _4334 = _4282;
    float _4336 = _3584;
    float _4338 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4340 = _4270 * _4338;
    if (!_4224)
    {
        float _4342 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4344 = _4342 * 0.15915493667125701904296875;
        float _4346 = _4344 * 6.283185482025146484375;
        float _4348 = cos(_4346);
        float _4350 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4352 = _4350 * 0.15915493667125701904296875;
        float _4354 = _4344 * 6.283185482025146484375;
        float _4356 = sin(_4354);
        float _4358 = 1.0 / _4348;
        float _4360 = _4352 * 6.283185482025146484375;
        float _4362 = cos(_4360);
        float _4364 = _4356 * _4358;
        float _4366 = _4352 * 6.283185482025146484375;
        float _4368 = sin(_4366);
        float _4370 = _4362 * _4364;
        float _4372 = 1.0 / _4370;
        float _4374 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4376 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4374;
        float _4378 = 1.0 / _4376;
        float _4380 = _4368 * _4372;
        float _4382 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4384 = fma(_4340, _4380, _4382);
        float _4386 = _4384 * _4378;
        float _4388 = precise::clamp(_4386, 0.0, 1.0);
        _4284 = _4388;
    }
    float _4390 = _4284;
    float _4392 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4394 = _4330 + _4392;
    float _4396 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4398 = _4332 + _4396;
    float _4400 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4402 = _4334 + _4400;
    float _4404 = _4394 * _4394;
    float _4406 = fma(_4398, _4398, _4404);
    float _4408 = fma(_4402, _4402, _4406);
    float _4410 = rsqrt(_4408);
    float _4412 = sqrt(_4408);
    float _4414 = _4410 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4416 = _4398 * _4414;
    float _4418 = _4402 * _4414;
    float _4420 = _4416 * _4416;
    float _4422 = _4418 * _4418;
    float _4424 = _4420 + _4422;
    float _4426 = sqrt(_4424);
    bool _4428 = _4426 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4430 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4432 = _4426 + _4430;
    float _4434 = _3540;
    float _4436 = _4432;
    float _4438 = _4394;
    float _4440 = _4416;
    if (_4428)
    {
        float _4442 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4434 = _4442;
    }
    float _4444 = _4434;
    float _4446 = _4444;
    if (_4428)
    {
        float _4448 = _4432 * _4444;
        _4436 = _4448;
    }
    float _4450 = _4436;
    if (_4428)
    {
        float _4452 = rsqrt(_4424);
        _4446 = _4452;
    }
    float _4454 = _4446;
    float _4456 = _4454;
    if (_4428)
    {
        float _4458 = _4450 * 0.15915493667125701904296875;
        _4266 = _4458;
    }
    float _4460 = _4266;
    float _4462 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4464 = _4402;
    if (_4428)
    {
        float _4466 = _4460 * 6.283185482025146484375;
        float _4468 = sin(_4466);
        _4464 = _4468;
    }
    float _4470 = _4464;
    float _4472 = precise::max(0.0, _4462);
    float _4474 = _4336;
    float _4476 = _4472;
    if (_4428)
    {
        float _4478 = _4460 * 6.283185482025146484375;
        float _4480 = cos(_4478);
        _4474 = _4480;
    }
    float _4482 = _4474;
    float _4484 = -_4414;
    float _4486 = -_4472;
    float _4488 = fma(_4394, _4484, _4486);
    if (_4428)
    {
        float _4490 = _4488 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4438 = _4490;
    }
    float _4492 = _4438;
    float _4494 = _4470;
    float _4496 = _4492;
    if (_4428)
    {
        float _4498 = fma(_4470, _4492, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4494 = _4498;
    }
    float _4500 = _4494;
    float _4502 = _4500;
    if (!_4428)
    {
        _4496 = _4488;
    }
    float _4504 = _4496;
    float _4506 = _4504;
    if (_4428)
    {
        float _4508 = _4454 * _4500;
        _4124 = _4508;
    }
    float _4510 = _4124;
    if (!_4428)
    {
        _4502 = _4420;
    }
    float _4512 = _4502;
    float _4514 = _4330 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4516 = _4512;
    float _4518 = _4482;
    if (_4428)
    {
        float _4520 = _4482 + (-1.0);
        _4476 = _4520;
    }
    float _4522 = _4476;
    float _4524 = _4522;
    if (_4428)
    {
        float _4526 = _4416 * _4510;
        _4440 = _4526;
    }
    float _4528 = _4440;
    float _4530 = fma(_3526, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4532 = _4330 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_4428)
    {
        float _4534 = _4522 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4456 = _4534;
    }
    float _4536 = _4456;
    if (!_4428)
    {
        _4524 = _4418;
    }
    float _4538 = _4524;
    float _4540 = _4538;
    if (_4428)
    {
        float _4542 = _4418 * _4510;
        _4540 = _4542;
    }
    float _4544 = _4540;
    if (_4428)
    {
        float _4546 = _4528 * _4528;
        _4516 = _4546;
    }
    float _4548 = _4516;
    if (_4428)
    {
        float _4550 = fma(_4488, _4482, _4536);
        _4506 = _4550;
    }
    float _4552 = _4506;
    if (!_4428)
    {
        _4518 = _4422;
    }
    float _4554 = _4518;
    float _4556 = _4554;
    if (_4428)
    {
        float _4558 = _4544 * _4544;
        _4556 = _4558;
    }
    float _4560 = _4556;
    float _4562 = fma(_4332, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4532);
    float _4564 = fma(_4552, _4552, _4548);
    float _4566 = _4330 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4568 = fma(_4334, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4562);
    float _4570 = _4564 + _4560;
    float _4572 = _4330 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4574 = fma(_4332, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4566);
    float _4576 = _4568 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4578 = rsqrt(_4570);
    float _4580 = fma(_4332, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4572);
    float _4582 = fma(_4332, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4514);
    float _4584 = fma(_4334, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4574);
    float _4586 = fma(_4334, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4580);
    float _4588 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4590 = fma(_4412, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4588);
    float _4592 = precise::clamp(_4590, 0.0, 1.0);
    float _4594 = fma(_4334, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4582);
    float _4596 = _4584 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4598 = _4586 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4600 = fma(_3536, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4602 = -_4592;
    float _4604 = _4602 + 1.0;
    float _4606 = _4594 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4608 = _4598 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4610 = floor(_4530);
    float _4612 = _4578 * _4528;
    float _4614 = fma(_4576, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4608);
    float _4616 = _4578 * _4552;
    float _4618 = _4578 * _4544;
    float _4620 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4614);
    float _4622 = abs(_4604);
    float _4624 = log2(_4622);
    float _4626 = fma(_4606, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4620);
    float _4628 = _4612 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4630 = -_4628;
    float _4632 = fma(_4616, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4630);
    float _4634 = floor(_4600);
    float _4636 = -_4610;
    float _4638 = _4530 + _4636;
    float _4640 = -_4618;
    float _4642 = fma(_4640, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4632);
    float _4644 = _4596 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4646 = fma(_4642, -0.5, 0.5);
    float _4648 = _4624 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4650 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4652 = fma(_4642, 0.5, 0.5);
    float _4654 = sqrt(_4646);
    float _4656 = -_4644;
    float _4658 = fma(_4656, _4650, 1.0);
    float _4660 = fma(_4652, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4662 = _4598 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4664 = fma(_4652, _4660, -0.212114393711090087890625);
    float _4666 = exp2(_4648);
    float _4668 = fma(_4576, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4662);
    float _4670 = -_4634;
    float _4672 = _4600 + _4670;
    float _4674 = fma(_4652, _4664, 1.570728778839111328125);
    float _4676 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4668);
    float _4678 = 1.0 / _4626;
    float _4680 = _4598 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4682 = fma(_4606, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4676);
    float _4684 = _4654 * 0.636619746685028076171875;
    float _4686 = fma(_4576, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4680);
    float _4688 = log2(_4658);
    float _4690 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4686);
    float _4692 = _4616 + 1.0;
    float _4694 = fma(_4606, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4690);
    float2 _12023 = float2(_4638, _4672);
    float _4696 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12023, float2(0.0), isnan(_12023)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12023, float2(0.0), isnan(_12023)), level(0.0)).x;
    float _4698 = -_4616;
    float _4700 = fma(_4666, _4692, _4698);
    float _4702 = _4682 * _4678;
    float _4704 = _4694 * _4678;
    float _4706 = -_4674;
    float _4708 = fma(_4684, _4706, 1.0);
    float _4710 = fma(_4700, 0.5, 0.5);
    float _4712 = fma(_4702, 0.5, 0.5);
    float _4714 = fma(_4704, -0.5, 0.5);
    float _4716 = _4688 * 0.693147182464599609375;
    float _4718 = _4716 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _12064 = float3(_4712, _4714, _4718);
    float _4720 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12064, float3(0.0), isnan(_12064)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12064, float3(0.0), isnan(_12064)), level(0.0)).x;
    float3 _12075 = float3(_4712, _4714, _4718);
    float4 _4723 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12075, float3(0.0), isnan(_12075)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12075, float3(0.0), isnan(_12075)), level(0.0)).xyzw;
    float _4725 = _4723.x;
    float _4727 = _4723.y;
    float _4729 = _4723.z;
    float _4731 = _4723.w;
    float2 _12091 = float2(_4708, _4710);
    float3 _4735 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12091, float2(0.0), isnan(_12091)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12091, float2(0.0), isnan(_12091)), level(0.0)).xyz;
    float _4737 = _4735.x;
    float _4739 = _4735.y;
    float _4741 = _4735.z;
    float _4743 = abs(_4340);
    float _4745 = log2(_4743);
    float _4747 = _4598 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _4749 = _4412 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4751 = isnan(_4412);
    bool _4753 = _4749 || _4751;
    bool _4755 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4757 = _4753 || _4755;
    float _4759 = fma(_4576, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4747);
    float _4761 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4759);
    float _4763 = _4624 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4765 = fma(_4606, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4761);
    float _4767 = _4682 + _4626;
    float _4769 = _4745 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4771 = exp2(_4763);
    out.gl_Position.x = _4682;
    out.gl_Position.y = _4694;
    out.gl_Position.z = _4765;
    out.gl_Position.w = _4626;
    float _4773 = exp2(_4769);
    float _4775 = -_4771;
    float _4777 = _4775 + 1.0;
    float _4779 = _4777 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4781 = fma(_4773, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4783 = precise::clamp(_4781, 0.0, 1.0);
    bool _4785 = _4340 <= 8000.0;
    bool _4787 = isnan(_4340);
    bool _4789 = _4785 || _4787;
    bool _4791 = isnan(8000.0);
    bool _4793 = _4789 || _4791;
    float _4795 = float(_4793);
    float _4797 = _4626 * 0.5;
    float _4799 = -_4779;
    float _4801 = _4799 + 1.0;
    float _4803 = fma(_4783, -2.0, 3.0);
    float _4805 = _4783 * _4783;
    float _4807 = _4805 * _4803;
    float _4809 = fma(_4694, -0.5, _4797);
    float _4811 = _4765 + _4626;
    float _4813 = -_4807;
    float _4815 = _4813 + 1.0;
    float _4817 = _4390 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4819 = _4811 * 0.5;
    float _4821 = _4694;
    float _4823 = _4801;
    if (!_4757)
    {
        _4821 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4825 = _4821;
    float _4827 = fma(_4815, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4807);
    float _4829 = _4767 * 0.5;
    float _4831 = in.m_86.x;
    float _4833 = _4795 * _4827;
    out.m_88.x = _4829;
    out.m_88.y = _4809;
    out.m_88.z = _4819;
    out.m_88.w = _4626;
    float _4835 = _4833 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4837 = -_4696;
    float _4839 = _4837 + 1.0;
    float _4841 = _4839 * _4835;
    float _4843 = precise::clamp(_4841, 0.0, 1.0);
    float _4845 = -_4843;
    float _4847 = fma(_4845, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4849 = _4847 * _4831;
    float _4851 = _4849 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4853 = _4779 * _4720;
    float _4855 = _4731 * _4801;
    float _4857 = _4825;
    float _4859 = _4825;
    if (!_4757)
    {
        _4823 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4861 = _4823;
    out.m_90.x = _4851;
    float _4863 = _4731 * _4853;
    float _4865 = _4741 * _4853;
    float _4867 = fma(_4737, _4863, _4725);
    float _4869 = fma(_4739, _4863, _4727);
    float _4871 = fma(_4731, _4865, _4729);
    float _4873 = _4863;
    float _4875 = _4861;
    float _4877 = _4861;
    if (!_4757)
    {
        _4873 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4879 = _4873;
    out.m_92.x = _4867;
    out.m_92.y = _4869;
    out.m_92.z = _4871;
    out.m_92.w = _4855;
    bool _4881 = !_4757;
    float _4883 = _4879;
    float _4885 = _4879;
    if (!_4881)
    {
        bool _4887 = _4412 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4889 = isnan(_4412);
        bool _4891 = _4887 || _4889;
        bool _4893 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4895 = _4891 || _4893;
        if (!_4895)
        {
            float _4897 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4899 = _4412 + _4897;
            float _4901 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4903 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4901;
            float _4905 = 1.0 / _4903;
            float _4907 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4909 = _4907 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4911 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4913 = _4911 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4915 = _4899 * _4905;
            float _4917 = precise::clamp(_4915, 0.0, 1.0);
            float _4919 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4921 = _4919 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4923 = fma(_4917, _4913, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4925 = fma(_4917, _4921, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4927 = fma(_4917, _4909, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _4877 = _4927;
            _4859 = _4925;
            _4885 = _4923;
            _4929 = true;
        }
        else
        {
            bool _4931 = _4412 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4933 = isnan(_4412);
            bool _4935 = _4931 || _4933;
            bool _4937 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4939 = _4935 || _4937;
            if (!_4939)
            {
                _4857 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4941 = _4857;
            _4859 = _4941;
            if (!_4939)
            {
                _4875 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4943 = _4875;
            _4877 = _4943;
            if (!_4939)
            {
                _4883 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4945 = _4883;
            bool _4947 = !_4939;
            _4885 = _4945;
            if (!_4947)
            {
                bool _4949 = _4412 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4951 = isnan(_4412);
                bool _4953 = _4949 || _4951;
                bool _4955 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4957 = _4953 || _4955;
                if (!_4957)
                {
                    float _4959 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4961 = _4412 + _4959;
                    float _4963 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4965 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4963;
                    float _4967 = 1.0 / _4965;
                    float _4969 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4971 = _4969 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4973 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4975 = _4973 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4977 = _4961 * _4967;
                    float _4979 = precise::clamp(_4977, 0.0, 1.0);
                    float _4981 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4983 = _4981 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4985 = fma(_4979, _4975, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4987 = fma(_4979, _4983, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4989 = fma(_4979, _4971, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _4877 = _4989;
                    _4859 = _4987;
                    _4885 = _4985;
                    _4929 = true;
                }
                else
                {
                    _4877 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4859 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4885 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4929 = false;
    float _4991 = _4877;
    float _4993 = _4859;
    float _4995 = _4885;
    float _4997 = _4817 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_94.x = 0.0;
    float _4999 = _4991 * 0.586610972881317138671875;
    bool _5001 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_55.x = _4997;
    float _5003 = fma(_4993, 0.298911988735198974609375, _4999);
    bool _5005 = _4390 > 0.0;
    bool _5007 = isnan(_4390);
    bool _5009 = _5005 || _5007;
    bool _5011 = isnan(0.0);
    bool _5013 = _5009 || _5011;
    float _5015 = fma(_4995, 0.114477999508380889892578125, _5003);
    float _5017 = -_5015;
    float _5019 = _5017 + _4993;
    float _5021 = -_5015;
    float _5023 = _5021 + _4991;
    float _5025 = -_5015;
    float _5027 = _5025 + _4995;
    float _5029 = fma(_5019, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5015);
    float _5031 = fma(_5023, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5015);
    float _5033 = fma(_5027, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5015);
    bool _5035 = !_5001;
    if (!_5035)
    {
        float _5037 = -_4330;
        float _5039 = _5037 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5041 = -_4332;
        float _5043 = _5041 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5045 = -_4334;
        float _5047 = _5045 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5049 = _5039 * _5039;
        float _5051 = fma(_5043, _5043, _5049);
        float _5053 = fma(_5047, _5047, _5051);
        float _5055 = sqrt(_5053);
        float _5057 = rsqrt(_5053);
        float _5059 = -_5055;
        float _5061 = _5059 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5063 = _5061 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5065 = precise::clamp(_5063, 0.0, 1.0);
        float _5067 = _5043 * _5057;
        float _5069 = _5039 * _5057;
        float _5071 = abs(_5065);
        float _5073 = log2(_5071);
        float _5075 = _5047 * _5057;
        float _5077 = _5067 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5079 = _4104 * _5069;
        float _5081 = -_5069;
        float _5083 = -_5077;
        float _5085 = fma(_5081, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5083);
        float _5087 = fma(_4108, _5067, _5079);
        float _5089 = -_5075;
        float _5091 = fma(_5089, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5085);
        float _5093 = fma(_4110, _5075, _5087);
        float _5095 = precise::clamp(_5093, 0.0, 1.0);
        float _5097 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5099 = _5091 + _5097;
        float _5101 = _5073 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5103 = _5099 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5105 = precise::clamp(_5103, 0.0, 1.0);
        float _5107 = exp2(_5101);
        float _5109 = _5107 * _5105;
        float _5111 = _5095 * _5109;
        float _5113 = _5111 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5115 = _5111 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5117 = _5111 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _5113;
        out.m_94.y = _5115;
        out.m_94.z = _5117;
    }
    out.m_96.x = _5029;
    out.m_96.y = _5031;
    out.m_96.z = _5033;
    if (_5013)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_55.x = 0.0;
    float _5119 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5119;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

