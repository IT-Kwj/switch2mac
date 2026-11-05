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
    texture2d<float> vp_t_tcb_28 [[id(7)]];
    sampler vp_t_tcb_28Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_28Smplr_w [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_70 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_74 [[user(locn2)]];
    float4 m_82 [[user(locn3)]];
    float4 m_90 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_76 [[user(locn6)]];
    float4 m_78 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_68 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 m_86 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_66 [[attribute(0)]];
    float4 m_57 [[attribute(2)]];
    float4 m_50 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_64 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1812 = false;
    bool _809 = false;
    bool _211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_50.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (!_113)
    {
        out.m_53.x = 0.0;
    }
    int _119 = 0;
    if (!_113)
    {
        float _121 = _117 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2116 = as_type<float>(_123);
        out.gl_Position.z = _2116;
    }
    if (!_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_55.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = 0.0;
    if (_137)
    {
        float _145 = float(_109);
        _143 = _145;
    }
    float _147 = _143;
    bool _149 = _141 >= _147;
    bool _151 = !_137;
    bool _153 = _149 || _151;
    float _155 = 0.0;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_53.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2184 = as_type<float>(_161);
        out.gl_Position.z = _2184;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _163 = in.m_57.x;
    float _165 = in.m_57.y;
    float _167 = in.m_57.z;
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _171 = _165 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _173 = _165 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _175 = _165 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _177 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].x, _171);
    float _179 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _181 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].x, _175);
    float _183 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].z, _177);
    float _185 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].z, _179);
    float _187 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].z, _181);
    bool _189 = !_169;
    float _191 = _187;
    float _209;
    if (!_189)
    {
        float _193 = in.m_59.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        float _213 = float(_109);
        float _215 = 1.0 / _213;
        float _217 = _141 * _215;
        _209 = _217;
    }
    _211 = false;
    float _219 = _209;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _223 = _219 + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = _219 + _225;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _231 = _219 + _229;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _239 = _237 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _241;
    bool _245 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _247 = isnan(_219);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = as_type<float>(int(gl_VertexIndex));
    bool _259 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _261 = isnan(_219);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    float _271 = 1.0 / _235;
    float _273 = 1.0 / _239;
    float _275 = 1.0 / _243;
    float _277 = _227 * _271;
    float _279 = -_255;
    float _281 = _279 + 1.0;
    int _283 = as_type<int>(_257) & 1;
    bool _285 = _283 != 0;
    int _287 = as_type<int>(_257) & 2;
    bool _289 = _287 != 0;
    float _291 = _223 * _273;
    bool _293 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _295 = isnan(_219);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = in.m_59.x;
    float _307 = in.m_59.y;
    float _309 = in.m_59.z;
    float _311 = in.m_59.w;
    bool _313 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _315 = isnan(_219);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = _231 * _275;
    float _327 = -_323;
    float _329 = _327 + 1.0;
    float _331 = _323 * _281;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _341 = _303 * _329;
    float _343 = -_303;
    float _345 = _343 + 1.0;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _355 = fma(_339, _291, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _357 = fma(_335, _277, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _359 = _269 * _345;
    float _361 = fma(_349, _277, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _363 = in.m_64.x;
    float _365 = in.m_64.y;
    float _367 = fma(_353, _291, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _369 = _357 * _359;
    float _371 = -_269;
    float _373 = _371 + 1.0;
    float _375 = _361 * _359;
    bool _377 = _307 > 0.5;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _379;
    float _383 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].x, _369);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _385;
    float _389 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].y, _375);
    float _391 = in.m_50.x;
    float _393 = in.m_50.y;
    float _395 = in.m_50.z;
    float _397 = fma(_381, _325, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _399 = fma(_387, _325, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _401 = fma(_367, _341, _389);
    float _403 = fma(_355, _341, _383);
    float _405 = fma(_399, _331, _401);
    float _407 = fma(_397, _331, _403);
    bool _409 = !_289;
    float _411 = _409 ? (-0.5) : 0.5;
    float _413 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[146].y, _405);
    float _415 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[146].x, _407);
    bool _417 = !_285;
    float _419 = _417 ? (-0.5) : 0.5;
    float _421 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _411);
    float _423 = _413 * _365;
    float _425 = _415 * _363;
    float _427 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _419);
    float _429 = _423 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _431 = _425 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _433 = _429 * _421;
    float _435 = _431 * _427;
    float _437 = _393 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _439 = _393 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _441 = _433 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _443 = _433 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _445 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].x, _437);
    float _447 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].x, _439);
    float _449 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _451 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[24].x, _441);
    float _453 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[26].x, _443);
    float _455 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].z, _445);
    float _457 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].z, _447);
    float _459 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[24].z, _451);
    float _461 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[26].z, _453);
    float _463 = _455 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _465 = _457 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _467 = _459 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _469 = _461 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _471 = _433 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _473 = _463 + _467;
    float _475 = _465 + _469;
    float _477 = in.m_66.y;
    float _479 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _481 = _473 + _479;
    float _483 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _485 = _475 + _483;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _489 = _487 != 0;
    float _491 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[25].x, _471);
    float _493 = _481 * _481;
    float _495 = _485 * _485;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _499 = _497 != 0;
    float _501 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[25].z, _491);
    int _503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _505 = _503 != 0;
    float _507 = _493 + _495;
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _511 = _509 != 0;
    float _513 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _515 = -_411;
    int _517 = _377 ? as_type<int>(_515) : as_type<int>(_411);
    out.m_68.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_68.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_68.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    bool _519 = _311 > 0.5;
    bool _521 = _305 > 0.5;
    float _523 = sqrt(_507);
    float _525 = _393 + _477;
    float _527 = _501 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _529 = !_499;
    float _531 = _529 ? _411 : as_type<float>(_517);
    float _533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _535 = -_411;
    int _537 = _519 ? as_type<int>(_535) : as_type<int>(_411);
    float _539 = _525 + _527;
    bool _541 = _309 > 0.5;
    bool _543 = !_511;
    float _545 = _543 ? _411 : as_type<float>(_537);
    float _547 = _411 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _549 = -_419;
    int _551 = _521 ? as_type<int>(_549) : as_type<int>(_419);
    float _553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _555 = _523 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _557 = -_419;
    int _559 = _541 ? as_type<int>(_557) : as_type<int>(_419);
    float _561 = _527;
    float _563 = _435;
    float _565 = _493;
    float _567 = _473;
    float _569 = _475;
    float _571 = _463;
    if (!_555)
    {
        _561 = _493;
    }
    float _573 = _561;
    float _575 = _573;
    if (!_555)
    {
        _563 = _495;
    }
    float _577 = _563;
    float _579 = _577;
    if (!_555)
    {
        _565 = _539;
    }
    float _581 = _565;
    bool _583 = !_555;
    float _585 = _581;
    if (!_583)
    {
        float _587 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _589 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _591 = _523 + _589;
        float _593 = _539 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _595 = rsqrt(_507);
        float _597 = _591 * _587;
        float _599 = _597 * 0.15915493667125701904296875;
        float _601 = _599 * 6.283185482025146484375;
        float _603 = sin(_601);
        float _605 = _599 * 6.283185482025146484375;
        float _607 = cos(_605);
        float _609 = fma(_603, _593, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _611 = _595 * _609;
        float _613 = _607 + (-1.0);
        float _615 = fma(_481, _611, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _617 = fma(_485, _611, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _619 = _613 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _621 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _623 = _615 + _621;
        float _625 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _627 = _617 + _625;
        float _629 = fma(_539, _607, _619);
        float _631 = _623 * _623;
        float _633 = _627 * _627;
        _585 = _629;
        _575 = _631;
        _579 = _633;
        _567 = _615;
        _569 = _617;
    }
    float _635 = _585;
    float _637 = _575;
    float _639 = _579;
    float _641 = _567;
    float _643 = _569;
    float _645 = fma(_547, _547, 1.0);
    bool _647 = !_489;
    float _649 = _647 ? _419 : as_type<float>(_551);
    float _651 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _653 = _635 + _651;
    bool _655 = !_505;
    float _657 = _655 ? _419 : as_type<float>(_559);
    float _659 = rsqrt(_645);
    float _661 = _419 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _663 = _649 + 0.5;
    float _665 = fma(_653, _653, _637);
    float _667 = _657 + 0.5;
    float _669 = _547 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _671 = _663 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _673 = _547 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _675 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _677 = _547 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _679 = _671 * _513;
    float _681 = _667 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _683 = -_531;
    float _685 = _683 + 0.5;
    float _687 = -_545;
    float _689 = _687 + 0.5;
    float _691 = _665 + _639;
    float _693 = _681 * _553;
    float _695 = _547 * _659;
    float _697 = _685 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _699 = _689 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _701 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[24].x, _669);
    float _703 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _705 = _695 * _703;
    float _707 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _709 = _695 * _707;
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _713 = _695 * _711;
    float _715 = _697 * _533;
    float _717 = _699 * _675;
    float _719 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[24].y, _705);
    float _721 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[25].x, _673);
    float _723 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[25].y, _709);
    float _725 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[26].y, _713);
    float _727 = sqrt(_691);
    float _729 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[26].x, _677);
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _741 = _731 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _745 = _733 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _749 = _735 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _751 = _737 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _753 = _739 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _755 = _743 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _757 = _701 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _759 = _721 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _761 = _729 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_70.x = _741;
    out.m_70.y = _745;
    out.m_70.z = _749;
    out.m_70.w = _747;
    bool _763 = _727 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _765 = isnan(_727);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _771 = _767 || _769;
    out.m_72.x = _751;
    out.m_72.y = _753;
    out.m_72.z = _755;
    out.m_74.x = _679;
    out.m_74.y = _715;
    out.m_74.z = _693;
    out.m_74.w = _717;
    out.m_76.x = _719;
    out.m_76.y = _723;
    out.m_76.z = _725;
    float _773 = _677;
    if (!_771)
    {
        _773 = 1.0;
    }
    float _775 = _773;
    out.m_78.x = _757;
    out.m_78.y = _759;
    out.m_78.z = _761;
    bool _777 = !_771;
    float _779 = _775;
    if (!_777)
    {
        bool _781 = _727 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _783 = isnan(_727);
        bool _785 = _781 || _783;
        bool _787 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _789 = _785 || _787;
        if (!_789)
        {
            float _791 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _793 = _727 + _791;
            float _795 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _797 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _795;
            float _799 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _801 = _799 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _803 = 1.0 / _797;
            float _805 = _793 * _803;
            float _807 = fma(_805, _801, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _779 = _807;
            _809 = true;
        }
        else
        {
            bool _811 = _727 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _813 = isnan(_727);
            bool _815 = _811 || _813;
            bool _817 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _819 = _815 || _817;
            if (!_819)
            {
                float _821 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _823 = _727 + _821;
                float _825 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _827 = _825 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _829 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _831 = _829 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _833 = 1.0 / _827;
                float _835 = _823 * _833;
                float _837 = fma(_835, _831, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _779 = _837;
                _809 = true;
            }
            else
            {
                _779 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _809 = false;
    float _839 = _779;
    float _841 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _843 = _641 + _841;
    float _845 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _847 = _643 + _845;
    float _849 = fma(_843, _839, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _851 = fma(_847, _839, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _853 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _855 = _849 + _853;
    float _857 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _859 = _851 + _857;
    float _861 = fma(_855, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _863 = fma(_859, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _3417 = float2(_861, _863);
    float _865 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_3417, float2(0.0), isnan(_3417)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_3417, float2(0.0), isnan(_3417)), level(0.0)).x;
    float _867 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _869 = _635 + _867;
    float _871 = -_463;
    float _873 = _871 + _849;
    float _875 = -_465;
    float _877 = _875 + _851;
    float _879 = fma(_869, _839, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _881 = fma(_865, 100.0, _525);
    float _883 = -_525;
    float _885 = _883 + _879;
    float _887 = fma(_865, 100.0, _879);
    float _889 = _881 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _891 = _885 * _885;
    float _893 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[11].x, _889);
    float _895 = fma(_873, _873, _891);
    float _897 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[11].z, _893);
    float _899 = fma(_877, _877, _895);
    float _901 = _897 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _903 = _881 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _905 = sqrt(_899);
    float _907 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[10].x, _903);
    float _909 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[10].z, _907);
    float _911 = 1.0 / _901;
    float _913 = _909 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _915 = _913 + _901;
    bool _917 = _905 > 0.0;
    bool _919 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _921 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _923 = _919 || _921;
    bool _925 = isnan(0.5);
    bool _927 = _923 || _925;
    float _929 = _915 * _911;
    float _931 = _929 * 0.5;
    float _933 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _935 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[30].w, _933);
    float _937 = _865;
    float _939 = _901;
    float _941 = _849;
    float _943 = _877;
    float _945 = _911;
    float _947 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _949 = _851;
    float _951 = _839;
    if (!_917)
    {
        _937 = _851;
    }
    float _953 = _937;
    bool _955 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _957 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _959 = _955 || _957;
    bool _961 = isnan(0.5);
    bool _963 = _959 || _961;
    float _965 = 1.0 / _935;
    float _967 = _953;
    if (!_917)
    {
        _939 = _887;
    }
    float _969 = _939;
    bool _971 = !_917;
    float _973 = _969;
    float _975 = _969;
    if (!_971)
    {
        float _977 = _185 * _185;
        float _979 = fma(_183, _183, _977);
        float _981 = rsqrt(_899);
        float _983 = fma(_187, _187, _979);
        float _985 = sqrt(_983);
        float _987 = _873 * _981;
        float _989 = _885 * _981;
        float _991 = _877 * _981;
        bool _993 = _985 > 0.0;
        float _995 = _981;
        _947 = _983;
        if (!_993)
        {
            _973 = _887;
        }
        float _997 = _973;
        _975 = _997;
        if (!_993)
        {
            _995 = _851;
        }
        float _999 = _995;
        bool _1001 = !_993;
        _967 = _999;
        if (!_1001)
        {
            float _1003 = rsqrt(_983);
            float _1005 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1007 = _185 * _1003;
            float _1009 = _183 * _1003;
            float _1011 = _187 * _1003;
            float _1013 = _989 * _1007;
            float _1015 = fma(_987, _1009, _1013);
            float _1017 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1019 = fma(_991, _1011, _1015);
            float _1021 = _1019 * _1017;
            float _1023 = fma(_183, _1021, _849);
            float _1025 = fma(_185, _1021, _887);
            float _1027 = fma(_187, _1021, _851);
            _975 = _1025;
            _941 = _1023;
            _967 = _1027;
            _943 = _1005;
            _945 = _1017;
        }
    }
    float _1029 = _975;
    float _1031 = _941;
    float _1033 = _967;
    float _1035 = _943;
    float _1037 = _945;
    float _1039 = _947;
    float _1041 = _1039;
    float _1043 = _1031;
    float _1045 = _1033;
    float _1047 = _1029;
    if (_963)
    {
        _1041 = 1.0;
    }
    float _1049 = _1041;
    float _1051 = _1049;
    if (_927)
    {
        _949 = _1029;
    }
    float _1053 = _949;
    float _1055 = _1053;
    if (!_927)
    {
        float _1057 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1059 = _881 + _1057;
        float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1063 = _463 + _1061;
        float _1065 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1067 = -_463;
        float _1069 = _1067 + _1031;
        float _1071 = _1059 * _1059;
        float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1075 = _465 + _1073;
        float _1077 = -_465;
        float _1079 = _1077 + _1033;
        float _1081 = fma(_1063, _1063, _1071);
        float _1083 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1085 = fma(_1075, _1075, _1081);
        float _1087 = sqrt(_1085);
        float _1089 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1091 = precise::min(_1087, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1093 = _1091 * _1083;
        float _1095 = -_881;
        float _1097 = _1095 + _1029;
        float _1099 = _1089 * _1093;
        float _1101 = fma(_1097, _1099, _881);
        float _1103 = fma(_1069, _1099, _463);
        float _1105 = fma(_1079, _1099, _465);
        _1055 = _1101;
        _1043 = _1103;
        _1045 = _1105;
        _191 = _1093;
    }
    float _1107 = _1055;
    float _1109 = _1043;
    float _1111 = _1045;
    float _1113 = _191;
    float _1115 = _1113;
    if (_963)
    {
        _1115 = 1.0;
    }
    float _1117 = _1115;
    float _1119 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1121 = _965 * _1119;
    float _1123 = _1117;
    if (!_963)
    {
        float _1125 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1127 = _1125 * 0.15915493667125701904296875;
        float _1129 = _1127 * 6.283185482025146484375;
        float _1131 = cos(_1129);
        float _1133 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1135 = _1133 * 0.15915493667125701904296875;
        float _1137 = _1127 * 6.283185482025146484375;
        float _1139 = sin(_1137);
        float _1141 = 1.0 / _1131;
        float _1143 = _1135 * 6.283185482025146484375;
        float _1145 = cos(_1143);
        float _1147 = _1139 * _1141;
        float _1149 = _1135 * 6.283185482025146484375;
        float _1151 = sin(_1149);
        float _1153 = _1145 * _1147;
        float _1155 = 1.0 / _1153;
        float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1159 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1157;
        float _1161 = 1.0 / _1159;
        float _1163 = _1151 * _1155;
        float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1167 = fma(_1121, _1163, _1165);
        float _1169 = _1167 * _1161;
        float _1171 = precise::clamp(_1169, 0.0, 1.0);
        _1047 = _1127;
        _1051 = _1171;
    }
    float _1173 = _1047;
    float _1175 = _1051;
    float _1177 = _1173;
    if (!_963)
    {
        float _1179 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1181 = _1179 * 0.15915493667125701904296875;
        float _1183 = _1181 * 6.283185482025146484375;
        float _1185 = cos(_1183);
        float _1187 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1189 = _1187 * 0.15915493667125701904296875;
        float _1191 = _1181 * 6.283185482025146484375;
        float _1193 = sin(_1191);
        float _1195 = 1.0 / _1185;
        float _1197 = _1189 * 6.283185482025146484375;
        float _1199 = cos(_1197);
        float _1201 = _1193 * _1195;
        float _1203 = _1189 * 6.283185482025146484375;
        float _1205 = sin(_1203);
        float _1207 = _1199 * _1201;
        float _1209 = 1.0 / _1207;
        float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1213 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1211;
        float _1215 = 1.0 / _1213;
        float _1217 = _1205 * _1209;
        float _1219 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1221 = fma(_1121, _1217, _1219);
        float _1223 = _1221 * _1215;
        float _1225 = precise::clamp(_1223, 0.0, 1.0);
        float _1227 = -_1225;
        float _1229 = _1227 + 1.0;
        _1177 = _1207;
        _1123 = _1229;
    }
    float _1231 = _1177;
    float _1233 = _1123;
    float _1235 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1237 = _1107 + _1235;
    float _1239 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1241 = _1109 + _1239;
    float _1243 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1245 = _1111 + _1243;
    float _1247 = _1237 * _1237;
    float _1249 = fma(_1241, _1241, _1247);
    float _1251 = fma(_1245, _1245, _1249);
    float _1253 = rsqrt(_1251);
    float _1255 = _1253 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1257 = _1241 * _1255;
    float _1259 = _1245 * _1255;
    float _1261 = _1257 * _1257;
    float _1263 = _1259 * _1259;
    float _1265 = _1261 + _1263;
    float _1267 = sqrt(_1265);
    bool _1269 = _1267 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1271 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1273 = _1267 + _1271;
    float _1275 = _1035;
    float _1277 = _1253;
    float _1279 = _1273;
    float _1281 = _1231;
    float _1283 = _1237;
    if (_1269)
    {
        float _1285 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1275 = _1285;
    }
    float _1287 = _1275;
    if (_1269)
    {
        float _1289 = rsqrt(_1265);
        _1277 = _1289;
    }
    float _1291 = _1277;
    float _1293 = _1287;
    if (_1269)
    {
        float _1295 = _1273 * _1287;
        _1279 = _1295;
    }
    float _1297 = _1279;
    if (_1269)
    {
        float _1299 = _1297 * 0.15915493667125701904296875;
        _1281 = _1299;
    }
    float _1301 = _1281;
    float _1303 = _1245;
    float _1305 = _1301;
    if (_1269)
    {
        float _1307 = _1301 * 6.283185482025146484375;
        float _1309 = sin(_1307);
        _1303 = _1309;
    }
    float _1311 = _1303;
    float _1313 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1315 = precise::max(0.0, _1313);
    float _1317 = _1037;
    if (_1269)
    {
        float _1319 = _1301 * 6.283185482025146484375;
        float _1321 = cos(_1319);
        _1317 = _1321;
    }
    float _1323 = _1317;
    float _1325 = -_1255;
    float _1327 = -_1315;
    float _1329 = fma(_1237, _1325, _1327);
    float _1331 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1269)
    {
        float _1333 = _1329 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1283 = _1333;
    }
    float _1335 = _1283;
    float _1337 = _1335;
    if (!_1269)
    {
        _1305 = _1329;
    }
    float _1339 = _1305;
    float _1341 = fma(_463, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1343 = _1339;
    if (!_1269)
    {
        _571 = _1263;
    }
    float _1345 = _571;
    float _1347 = _1311;
    float _1349 = _1345;
    if (_1269)
    {
        float _1351 = fma(_1311, _1335, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1293 = _1351;
    }
    float _1353 = _1293;
    float _1355 = _1353;
    if (!_1269)
    {
        _1347 = _1259;
    }
    float _1357 = _1347;
    float _1359 = _1357;
    if (_1269)
    {
        float _1361 = _1323 + (-1.0);
        _1337 = _1361;
    }
    float _1363 = _1337;
    float _1365 = _1363;
    if (_1269)
    {
        float _1367 = _1291 * _1353;
        _951 = _1367;
    }
    float _1369 = _951;
    if (!_1269)
    {
        _1355 = _1257;
    }
    float _1371 = _1355;
    float _1373 = sqrt(_1251);
    float _1375 = _1371;
    if (_1269)
    {
        float _1377 = _1363 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1331 = _1377;
    }
    float _1379 = _1331;
    if (_1269)
    {
        float _1381 = _1257 * _1369;
        _1375 = _1381;
    }
    float _1383 = _1375;
    if (!_1269)
    {
        _1365 = _1261;
    }
    float _1385 = _1365;
    float _1387 = _1385;
    if (_1269)
    {
        float _1389 = _1259 * _1369;
        _1359 = _1389;
    }
    float _1391 = _1359;
    if (_1269)
    {
        float _1393 = fma(_1329, _1323, _1379);
        _1343 = _1393;
    }
    float _1395 = _1343;
    if (_1269)
    {
        float _1397 = _1383 * _1383;
        _1387 = _1397;
    }
    float _1399 = _1387;
    float _1401 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1269)
    {
        float _1403 = _1391 * _1391;
        _1349 = _1403;
    }
    float _1405 = _1349;
    float _1407 = fma(_1395, _1395, _1399);
    float _1409 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1401);
    float _1411 = floor(_1341);
    float _1413 = _1407 + _1405;
    float _1415 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1409);
    float _1417 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1419 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1421 = fma(_1373, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1419);
    float _1423 = precise::clamp(_1421, 0.0, 1.0);
    float _1425 = _1415 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1427 = rsqrt(_1413);
    float _1429 = -_1423;
    float _1431 = _1429 + 1.0;
    float _1433 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1435 = fma(_465, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1437 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1439 = -_1433;
    float _1441 = fma(_1439, _1417, 1.0);
    float _1443 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1445 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1437);
    float _1447 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1449 = abs(_1431);
    float _1451 = log2(_1449);
    float _1453 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1443);
    float _1455 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1445);
    float _1457 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1447);
    float _1459 = -_1411;
    float _1461 = _1341 + _1459;
    float _1463 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1453);
    float _1465 = _1427 * _1383;
    float _1467 = _1427 * _1395;
    float _1469 = _1427 * _1391;
    float _1471 = _1463 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1473 = _1465 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1475 = _1455 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1477 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1457);
    float _1479 = floor(_1435);
    float _1481 = -_1473;
    float _1483 = fma(_1467, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1481);
    float _1485 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1487 = _1451 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1489 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1491 = -_1469;
    float _1493 = fma(_1491, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1483);
    float _1495 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1485);
    float _1497 = log2(_1441);
    float _1499 = fma(_1493, -0.5, 0.5);
    float _1501 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1495);
    float _1503 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1489);
    float _1505 = exp2(_1487);
    float _1507 = _1477 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1509 = -_1479;
    float _1511 = _1435 + _1509;
    float _1513 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1501);
    float _1515 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1517 = sqrt(_1499);
    float _1519 = fma(_1493, 0.5, 0.5);
    float _1521 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1515);
    float _1523 = _1467 + 1.0;
    float _1525 = _1497 * 0.693147182464599609375;
    float _1527 = fma(_1519, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1529 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1521);
    float _1531 = 1.0 / _1513;
    float _1533 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1503);
    float _1535 = fma(_1519, _1527, -0.212114393711090087890625);
    float _1537 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1529);
    float2 _4467 = float2(_1461, _1511);
    float _1539 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4467, float2(0.0), isnan(_4467)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4467, float2(0.0), isnan(_4467)), level(0.0)).x;
    float _1541 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1533);
    float _1543 = fma(_1519, _1535, 1.570728778839111328125);
    float _1545 = -_1467;
    float _1547 = fma(_1505, _1523, _1545);
    float _1549 = _1517 * 0.636619746685028076171875;
    float _1551 = -_1543;
    float _1553 = fma(_1549, _1551, 1.0);
    float _1555 = fma(_1547, 0.5, 0.5);
    float _1557 = _1541 * _1531;
    float _1559 = _1537 * _1531;
    float _1561 = _1525 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1563 = fma(_1557, 0.5, 0.5);
    float _1565 = fma(_1559, -0.5, 0.5);
    float3 _4515 = float3(_1563, _1565, _1561);
    float _1567 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4515, float3(0.0), isnan(_4515)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4515, float3(0.0), isnan(_4515)), level(0.0)).x;
    float3 _4526 = float3(_1563, _1565, _1561);
    float4 _1570 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4526, float3(0.0), isnan(_4526)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4526, float3(0.0), isnan(_4526)), level(0.0)).xyzw;
    float _1572 = _1570.x;
    float _1574 = _1570.y;
    float _1576 = _1570.z;
    float _1578 = _1570.w;
    float2 _4542 = float2(_1553, _1555);
    float3 _1582 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4542, float2(0.0), isnan(_4542)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4542, float2(0.0), isnan(_4542)), level(0.0)).xyz;
    float _1584 = _1582.x;
    float _1586 = _1582.y;
    float _1588 = _1582.z;
    float _1590 = abs(_1121);
    float _1592 = log2(_1590);
    float _1594 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_80.x = _1109;
    out.m_80.y = _1107;
    out.m_80.z = _1111;
    bool _1596 = _1373 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1598 = isnan(_1373);
    bool _1600 = _1596 || _1598;
    bool _1602 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1604 = _1600 || _1602;
    float _1606 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1594);
    float _1608 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1606);
    float _1610 = in.m_66.x;
    float _1612 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1608);
    float _1614 = _1592 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1616 = exp2(_1614);
    float _1618 = fma(_1616, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1620 = precise::clamp(_1618, 0.0, 1.0);
    float _1622 = fma(_1620, -2.0, 3.0);
    float _1624 = _1620 * _1620;
    float _1626 = _1624 * _1622;
    float _1628 = _1451 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1630 = _1121 <= 8000.0;
    bool _1632 = isnan(_1121);
    bool _1634 = _1630 || _1632;
    bool _1636 = isnan(8000.0);
    bool _1638 = _1634 || _1636;
    float _1640 = float(_1638);
    float _1642 = -_1626;
    float _1644 = _1642 + 1.0;
    float _1646 = exp2(_1628);
    float _1648 = fma(_1644, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1626);
    float _1650 = _1612 + _1513;
    out.gl_Position.x = _1541;
    out.gl_Position.y = _1537;
    out.gl_Position.z = _1612;
    out.gl_Position.w = _1513;
    float _1652 = _1640 * _1648;
    float _1654 = _1650 * 0.5;
    float _1656 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_82.z = _1654;
    out.m_82.w = _1513;
    float _1658 = -_1646;
    float _1660 = _1658 + 1.0;
    float _1662 = _1513;
    float _1664 = _1612;
    float _1666 = _1537;
    float _1668 = _1541;
    if (!_1604)
    {
        _1662 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1670 = _1662;
    float _1672 = _1670;
    float _1674 = _1670;
    if (!_1604)
    {
        _1664 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1676 = _1664;
    float _1678 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1680 = _1676;
    float _1682 = _1676;
    if (!_1604)
    {
        _1666 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1684 = _1666;
    float _1686 = _1684;
    float _1688 = _1684;
    if (!_1604)
    {
        _1668 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1690 = _1668;
    float _1692 = -_1539;
    float _1694 = _1692 + 1.0;
    float _1696 = _1694 * _1656;
    float _1698 = precise::clamp(_1696, 0.0, 1.0);
    float _1700 = -_1698;
    float _1702 = fma(_1700, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1704 = _1702 * _1610;
    float _1706 = _1704 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1708 = _1678 * _1567;
    float _1710 = -_1678;
    float _1712 = _1710 + 1.0;
    out.m_84.x = _1706;
    float _1714 = _1578 * _1708;
    float _1716 = _1588 * _1708;
    float _1718 = _1578 * _1712;
    float _1720 = fma(_1584, _1714, _1572);
    float _1722 = fma(_1586, _1714, _1574);
    float _1724 = fma(_1578, _1716, _1576);
    float _1726 = _1175 * _1233;
    float _1728 = _1572;
    float _1730 = _1726;
    float _1732 = _1690;
    float _1734 = _1690;
    if (!_1604)
    {
        _1728 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1736 = _1728;
    out.m_86.x = _1720;
    out.m_86.y = _1722;
    out.m_86.z = _1724;
    out.m_86.w = _1718;
    float _1738 = _1726 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1740 = _1736;
    float _1742 = _1736;
    if (!_1604)
    {
        _1730 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1744 = _1730;
    bool _1746 = !_1604;
    float _1748 = _1744;
    float _1750 = _1744;
    if (!_1746)
    {
        bool _1752 = _1373 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1754 = isnan(_1373);
        bool _1756 = _1752 || _1754;
        bool _1758 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1760 = _1756 || _1758;
        if (!_1760)
        {
            float _1762 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1764 = _1373 + _1762;
            float _1766 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1768 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1766;
            float _1770 = 1.0 / _1768;
            float _1772 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1774 = _1772 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1776 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1778 = _1776 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1780 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1782 = _1780 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1784 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1786 = _1784 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1788 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1790 = _1788 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1792 = _1764 * _1770;
            float _1794 = precise::clamp(_1792, 0.0, 1.0);
            float _1796 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1798 = _1796 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1800 = fma(_1794, _1774, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1802 = fma(_1794, _1798, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1804 = fma(_1794, _1778, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1806 = fma(_1794, _1782, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1808 = fma(_1794, _1786, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1810 = fma(_1794, _1790, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1674 = _1802;
            _1734 = _1808;
            _1742 = _1800;
            _1688 = _1806;
            _1682 = _1804;
            _1750 = _1810;
            _1812 = true;
        }
        else
        {
            bool _1814 = _1373 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1816 = isnan(_1373);
            bool _1818 = _1814 || _1816;
            bool _1820 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1822 = _1818 || _1820;
            if (!_1822)
            {
                _1740 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1824 = _1740;
            _1742 = _1824;
            if (!_1822)
            {
                _1672 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1826 = _1672;
            _1674 = _1826;
            if (!_1822)
            {
                _1680 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1828 = _1680;
            _1682 = _1828;
            if (!_1822)
            {
                _1686 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1830 = _1686;
            _1688 = _1830;
            if (!_1822)
            {
                _1732 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1832 = _1732;
            _1734 = _1832;
            if (!_1822)
            {
                _1748 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1834 = _1748;
            bool _1836 = !_1822;
            _1750 = _1834;
            if (!_1836)
            {
                bool _1838 = _1373 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1840 = isnan(_1373);
                bool _1842 = _1838 || _1840;
                bool _1844 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1846 = _1842 || _1844;
                if (!_1846)
                {
                    float _1848 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1850 = _1373 + _1848;
                    float _1852 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1854 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1852;
                    float _1856 = 1.0 / _1854;
                    float _1858 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1860 = _1858 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1862 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1864 = _1862 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1866 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1868 = _1866 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1872 = _1870 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1874 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1876 = _1874 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1878 = _1850 * _1856;
                    float _1880 = precise::clamp(_1878, 0.0, 1.0);
                    float _1882 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1884 = _1882 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1886 = fma(_1880, _1860, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1888 = fma(_1880, _1884, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1890 = fma(_1880, _1864, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1892 = fma(_1880, _1868, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1894 = fma(_1880, _1872, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1896 = fma(_1880, _1876, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1674 = _1888;
                    _1734 = _1894;
                    _1742 = _1886;
                    _1688 = _1892;
                    _1682 = _1890;
                    _1750 = _1896;
                    _1812 = true;
                }
                else
                {
                    _1674 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1734 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1742 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1688 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1682 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1750 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1812 = false;
    float _1898 = _1674;
    float _1900 = _1734;
    float _1902 = _1742;
    float _1904 = _1688;
    float _1906 = _1682;
    float _1908 = _1750;
    float _1910 = fma(_759, -0.5, 0.5);
    float _1912 = precise::clamp(_1910, 0.0, 1.0);
    float _1914 = -_1898;
    float _1916 = _1914 + _1900;
    float _1918 = _1738 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1920 = -_1902;
    float _1922 = _1920 + _1904;
    out.m_88.x = 0.0;
    float _1924 = fma(_1912, _1916, _1898);
    float _1926 = fma(_1912, _1922, _1902);
    out.m_53.x = _1918;
    float _1928 = -_1906;
    float _1930 = _1928 + _1908;
    float _1932 = _1924 * 0.586610972881317138671875;
    bool _1934 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1936 = fma(_1912, _1930, _1906);
    float _1938 = fma(_1926, 0.298911988735198974609375, _1932);
    bool _1940 = _1175 > 0.0;
    bool _1942 = isnan(_1175);
    bool _1944 = _1940 || _1942;
    bool _1946 = isnan(0.0);
    bool _1948 = _1944 || _1946;
    float _1950 = fma(_1936, 0.114477999508380889892578125, _1938);
    bool _1952 = _1233 <= 0.0;
    bool _1954 = !_1948;
    bool _1956 = _1952 || _1954;
    float _1958 = -_1950;
    float _1960 = _1926 + _1958;
    float _1962 = -_1950;
    float _1964 = _1924 + _1962;
    float _1966 = -_1950;
    float _1968 = _1936 + _1966;
    float _1970 = fma(_1960, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1950);
    float _1972 = fma(_1964, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1950);
    float _1974 = fma(_1968, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1950);
    bool _1976 = !_1934;
    if (!_1976)
    {
        float _1978 = -_1107;
        float _1980 = _1978 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1982 = -_1109;
        float _1984 = _1982 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1986 = -_1111;
        float _1988 = _1986 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1990 = _1980 * _1980;
        float _1992 = fma(_1984, _1984, _1990);
        float _1994 = fma(_1988, _1988, _1992);
        float _1996 = sqrt(_1994);
        float _1998 = rsqrt(_1994);
        float _2000 = -_1996;
        float _2002 = _2000 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2004 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2006 = precise::clamp(_2004, 0.0, 1.0);
        float _2008 = _1984 * _1998;
        float _2010 = _1980 * _1998;
        float _2012 = abs(_2006);
        float _2014 = log2(_2012);
        float _2016 = _1988 * _1998;
        float _2018 = _2008 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2020 = _759 * _2010;
        float _2022 = -_2010;
        float _2024 = -_2018;
        float _2026 = fma(_2022, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2024);
        float _2028 = fma(_757, _2008, _2020);
        float _2030 = -_2016;
        float _2032 = fma(_2030, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2026);
        float _2034 = fma(_761, _2016, _2028);
        float _2036 = precise::clamp(_2034, 0.0, 1.0);
        float _2038 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2040 = _2032 + _2038;
        float _2042 = _2014 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2044 = _2040 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2046 = precise::clamp(_2044, 0.0, 1.0);
        float _2048 = exp2(_2042);
        float _2050 = _2048 * _2046;
        float _2052 = _2036 * _2050;
        float _2054 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2056 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2058 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _2054;
        out.m_88.y = _2056;
        out.m_88.z = _2058;
    }
    out.m_90.x = _1970;
    out.m_90.y = _1972;
    out.m_90.z = _1974;
    if (!_1956)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2060 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2060;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1812 = false;
    bool _809 = false;
    bool _211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_50.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (!_113)
    {
        out.m_53.x = 0.0;
    }
    int _119 = 0;
    if (!_113)
    {
        float _121 = _117 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2116 = as_type<float>(_123);
        out.gl_Position.z = _2116;
    }
    if (!_113)
    {
        return out;
    }
    float _127 = in.m_55.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = 0.0;
    if (_137)
    {
        float _145 = float(_109);
        _143 = _145;
    }
    float _147 = _143;
    bool _149 = _141 >= _147;
    bool _151 = !_137;
    bool _153 = _149 || _151;
    float _155 = 0.0;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_53.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2184 = as_type<float>(_161);
        out.gl_Position.z = _2184;
    }
    if (_153)
    {
        return out;
    }
    float _163 = in.m_57.x;
    float _165 = in.m_57.y;
    float _167 = in.m_57.z;
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _171 = _165 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _173 = _165 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _175 = _165 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _177 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].x, _171);
    float _179 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _181 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].x, _175);
    float _183 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].z, _177);
    float _185 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].z, _179);
    float _187 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].z, _181);
    bool _189 = !_169;
    float _191 = _187;
    float _209;
    if (!_189)
    {
        float _193 = in.m_59.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        float _213 = float(_109);
        float _215 = 1.0 / _213;
        float _217 = _141 * _215;
        _209 = _217;
    }
    _211 = false;
    float _219 = _209;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _223 = _219 + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = _219 + _225;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _231 = _219 + _229;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _239 = _237 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _241;
    bool _245 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _247 = isnan(_219);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = as_type<float>(int(gl_VertexIndex));
    bool _259 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _261 = isnan(_219);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    float _271 = 1.0 / _235;
    float _273 = 1.0 / _239;
    float _275 = 1.0 / _243;
    float _277 = _227 * _271;
    float _279 = -_255;
    float _281 = _279 + 1.0;
    int _283 = as_type<int>(_257) & 1;
    bool _285 = _283 != 0;
    int _287 = as_type<int>(_257) & 2;
    bool _289 = _287 != 0;
    float _291 = _223 * _273;
    bool _293 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _295 = isnan(_219);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = in.m_59.x;
    float _307 = in.m_59.y;
    float _309 = in.m_59.z;
    float _311 = in.m_59.w;
    bool _313 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _315 = isnan(_219);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = _231 * _275;
    float _327 = -_323;
    float _329 = _327 + 1.0;
    float _331 = _323 * _281;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _341 = _303 * _329;
    float _343 = -_303;
    float _345 = _343 + 1.0;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _355 = fma(_339, _291, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _357 = fma(_335, _277, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _359 = _269 * _345;
    float _361 = fma(_349, _277, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _363 = in.m_64.x;
    float _365 = in.m_64.y;
    float _367 = fma(_353, _291, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _369 = _357 * _359;
    float _371 = -_269;
    float _373 = _371 + 1.0;
    float _375 = _361 * _359;
    bool _377 = _307 > 0.5;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _379;
    float _383 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].x, _369);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _385;
    float _389 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].y, _375);
    float _391 = in.m_50.x;
    float _393 = in.m_50.y;
    float _395 = in.m_50.z;
    float _397 = fma(_381, _325, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _399 = fma(_387, _325, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _401 = fma(_367, _341, _389);
    float _403 = fma(_355, _341, _383);
    float _405 = fma(_399, _331, _401);
    float _407 = fma(_397, _331, _403);
    bool _409 = !_289;
    float _411 = _409 ? (-0.5) : 0.5;
    float _413 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[146].y, _405);
    float _415 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[146].x, _407);
    bool _417 = !_285;
    float _419 = _417 ? (-0.5) : 0.5;
    float _421 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _411);
    float _423 = _413 * _365;
    float _425 = _415 * _363;
    float _427 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _419);
    float _429 = _423 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _431 = _425 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _433 = _429 * _421;
    float _435 = _431 * _427;
    float _437 = _393 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _439 = _393 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _441 = _433 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _443 = _433 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _445 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].x, _437);
    float _447 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].x, _439);
    float _449 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _451 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[24].x, _441);
    float _453 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[26].x, _443);
    float _455 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].z, _445);
    float _457 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].z, _447);
    float _459 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[24].z, _451);
    float _461 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[26].z, _453);
    float _463 = _455 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _465 = _457 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _467 = _459 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _469 = _461 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _471 = _433 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _473 = _463 + _467;
    float _475 = _465 + _469;
    float _477 = in.m_66.y;
    float _479 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _481 = _473 + _479;
    float _483 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _485 = _475 + _483;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _489 = _487 != 0;
    float _491 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[25].x, _471);
    float _493 = _481 * _481;
    float _495 = _485 * _485;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _499 = _497 != 0;
    float _501 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[25].z, _491);
    int _503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _505 = _503 != 0;
    float _507 = _493 + _495;
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _511 = _509 != 0;
    float _513 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _515 = -_411;
    int _517 = _377 ? as_type<int>(_515) : as_type<int>(_411);
    out.m_68.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_68.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_68.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    bool _519 = _311 > 0.5;
    bool _521 = _305 > 0.5;
    float _523 = sqrt(_507);
    float _525 = _393 + _477;
    float _527 = _501 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _529 = !_499;
    float _531 = _529 ? _411 : as_type<float>(_517);
    float _533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _535 = -_411;
    int _537 = _519 ? as_type<int>(_535) : as_type<int>(_411);
    float _539 = _525 + _527;
    bool _541 = _309 > 0.5;
    bool _543 = !_511;
    float _545 = _543 ? _411 : as_type<float>(_537);
    float _547 = _411 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _549 = -_419;
    int _551 = _521 ? as_type<int>(_549) : as_type<int>(_419);
    float _553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _555 = _523 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _557 = -_419;
    int _559 = _541 ? as_type<int>(_557) : as_type<int>(_419);
    float _561 = _527;
    float _563 = _435;
    float _565 = _493;
    float _567 = _473;
    float _569 = _475;
    float _571 = _463;
    if (!_555)
    {
        _561 = _493;
    }
    float _573 = _561;
    float _575 = _573;
    if (!_555)
    {
        _563 = _495;
    }
    float _577 = _563;
    float _579 = _577;
    if (!_555)
    {
        _565 = _539;
    }
    float _581 = _565;
    bool _583 = !_555;
    float _585 = _581;
    if (!_583)
    {
        float _587 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _589 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _591 = _523 + _589;
        float _593 = _539 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _595 = rsqrt(_507);
        float _597 = _591 * _587;
        float _599 = _597 * 0.15915493667125701904296875;
        float _601 = _599 * 6.283185482025146484375;
        float _603 = sin(_601);
        float _605 = _599 * 6.283185482025146484375;
        float _607 = cos(_605);
        float _609 = fma(_603, _593, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _611 = _595 * _609;
        float _613 = _607 + (-1.0);
        float _615 = fma(_481, _611, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _617 = fma(_485, _611, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _619 = _613 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _621 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _623 = _615 + _621;
        float _625 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _627 = _617 + _625;
        float _629 = fma(_539, _607, _619);
        float _631 = _623 * _623;
        float _633 = _627 * _627;
        _585 = _629;
        _575 = _631;
        _579 = _633;
        _567 = _615;
        _569 = _617;
    }
    float _635 = _585;
    float _637 = _575;
    float _639 = _579;
    float _641 = _567;
    float _643 = _569;
    float _645 = fma(_547, _547, 1.0);
    bool _647 = !_489;
    float _649 = _647 ? _419 : as_type<float>(_551);
    float _651 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _653 = _635 + _651;
    bool _655 = !_505;
    float _657 = _655 ? _419 : as_type<float>(_559);
    float _659 = rsqrt(_645);
    float _661 = _419 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _663 = _649 + 0.5;
    float _665 = fma(_653, _653, _637);
    float _667 = _657 + 0.5;
    float _669 = _547 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _671 = _663 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _673 = _547 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _675 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _677 = _547 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _679 = _671 * _513;
    float _681 = _667 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _683 = -_531;
    float _685 = _683 + 0.5;
    float _687 = -_545;
    float _689 = _687 + 0.5;
    float _691 = _665 + _639;
    float _693 = _681 * _553;
    float _695 = _547 * _659;
    float _697 = _685 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _699 = _689 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _701 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[24].x, _669);
    float _703 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _705 = _695 * _703;
    float _707 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _709 = _695 * _707;
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _713 = _695 * _711;
    float _715 = _697 * _533;
    float _717 = _699 * _675;
    float _719 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[24].y, _705);
    float _721 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[25].x, _673);
    float _723 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[25].y, _709);
    float _725 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[26].y, _713);
    float _727 = sqrt(_691);
    float _729 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[26].x, _677);
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _741 = _731 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _745 = _733 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _749 = _735 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _751 = _737 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _753 = _739 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _755 = _743 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _757 = _701 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _759 = _721 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _761 = _729 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_70.x = _741;
    out.m_70.y = _745;
    out.m_70.z = _749;
    out.m_70.w = _747;
    bool _763 = _727 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _765 = isnan(_727);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _771 = _767 || _769;
    out.m_72.x = _751;
    out.m_72.y = _753;
    out.m_72.z = _755;
    out.m_74.x = _679;
    out.m_74.y = _715;
    out.m_74.z = _693;
    out.m_74.w = _717;
    out.m_76.x = _719;
    out.m_76.y = _723;
    out.m_76.z = _725;
    float _773 = _677;
    if (!_771)
    {
        _773 = 1.0;
    }
    float _775 = _773;
    out.m_78.x = _757;
    out.m_78.y = _759;
    out.m_78.z = _761;
    bool _777 = !_771;
    float _779 = _775;
    if (!_777)
    {
        bool _781 = _727 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _783 = isnan(_727);
        bool _785 = _781 || _783;
        bool _787 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _789 = _785 || _787;
        if (!_789)
        {
            float _791 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _793 = _727 + _791;
            float _795 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _797 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _795;
            float _799 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _801 = _799 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _803 = 1.0 / _797;
            float _805 = _793 * _803;
            float _807 = fma(_805, _801, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _779 = _807;
            _809 = true;
        }
        else
        {
            bool _811 = _727 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _813 = isnan(_727);
            bool _815 = _811 || _813;
            bool _817 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _819 = _815 || _817;
            if (!_819)
            {
                float _821 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _823 = _727 + _821;
                float _825 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _827 = _825 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _829 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _831 = _829 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _833 = 1.0 / _827;
                float _835 = _823 * _833;
                float _837 = fma(_835, _831, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _779 = _837;
                _809 = true;
            }
            else
            {
                _779 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _809 = false;
    float _839 = _779;
    float _841 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _843 = _641 + _841;
    float _845 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _847 = _643 + _845;
    float _849 = fma(_843, _839, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _851 = fma(_847, _839, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _853 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _855 = _849 + _853;
    float _857 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _859 = _851 + _857;
    float _861 = fma(_855, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _863 = fma(_859, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _3417 = float2(_861, _863);
    float _865 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_3417, float2(0.0), isnan(_3417)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_3417, float2(0.0), isnan(_3417)), level(0.0)).x;
    float _867 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _869 = _635 + _867;
    float _871 = -_463;
    float _873 = _871 + _849;
    float _875 = -_465;
    float _877 = _875 + _851;
    float _879 = fma(_869, _839, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _881 = fma(_865, 100.0, _525);
    float _883 = -_525;
    float _885 = _883 + _879;
    float _887 = fma(_865, 100.0, _879);
    float _889 = _881 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _891 = _885 * _885;
    float _893 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[11].x, _889);
    float _895 = fma(_873, _873, _891);
    float _897 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[11].z, _893);
    float _899 = fma(_877, _877, _895);
    float _901 = _897 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _903 = _881 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _905 = sqrt(_899);
    float _907 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[10].x, _903);
    float _909 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[10].z, _907);
    float _911 = 1.0 / _901;
    float _913 = _909 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _915 = _913 + _901;
    bool _917 = _905 > 0.0;
    bool _919 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _921 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _923 = _919 || _921;
    bool _925 = isnan(0.5);
    bool _927 = _923 || _925;
    float _929 = _915 * _911;
    float _931 = _929 * 0.5;
    float _933 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _935 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[30].w, _933);
    float _937 = _865;
    float _939 = _901;
    float _941 = _849;
    float _943 = _877;
    float _945 = _911;
    float _947 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _949 = _851;
    float _951 = _839;
    if (!_917)
    {
        _937 = _851;
    }
    float _953 = _937;
    bool _955 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _957 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _959 = _955 || _957;
    bool _961 = isnan(0.5);
    bool _963 = _959 || _961;
    float _965 = 1.0 / _935;
    float _967 = _953;
    if (!_917)
    {
        _939 = _887;
    }
    float _969 = _939;
    bool _971 = !_917;
    float _973 = _969;
    float _975 = _969;
    if (!_971)
    {
        float _977 = _185 * _185;
        float _979 = fma(_183, _183, _977);
        float _981 = rsqrt(_899);
        float _983 = fma(_187, _187, _979);
        float _985 = sqrt(_983);
        float _987 = _873 * _981;
        float _989 = _885 * _981;
        float _991 = _877 * _981;
        bool _993 = _985 > 0.0;
        float _995 = _981;
        _947 = _983;
        if (!_993)
        {
            _973 = _887;
        }
        float _997 = _973;
        _975 = _997;
        if (!_993)
        {
            _995 = _851;
        }
        float _999 = _995;
        bool _1001 = !_993;
        _967 = _999;
        if (!_1001)
        {
            float _1003 = rsqrt(_983);
            float _1005 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1007 = _185 * _1003;
            float _1009 = _183 * _1003;
            float _1011 = _187 * _1003;
            float _1013 = _989 * _1007;
            float _1015 = fma(_987, _1009, _1013);
            float _1017 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1019 = fma(_991, _1011, _1015);
            float _1021 = _1019 * _1017;
            float _1023 = fma(_183, _1021, _849);
            float _1025 = fma(_185, _1021, _887);
            float _1027 = fma(_187, _1021, _851);
            _975 = _1025;
            _941 = _1023;
            _967 = _1027;
            _943 = _1005;
            _945 = _1017;
        }
    }
    float _1029 = _975;
    float _1031 = _941;
    float _1033 = _967;
    float _1035 = _943;
    float _1037 = _945;
    float _1039 = _947;
    float _1041 = _1039;
    float _1043 = _1031;
    float _1045 = _1033;
    float _1047 = _1029;
    if (_963)
    {
        _1041 = 1.0;
    }
    float _1049 = _1041;
    float _1051 = _1049;
    if (_927)
    {
        _949 = _1029;
    }
    float _1053 = _949;
    float _1055 = _1053;
    if (!_927)
    {
        float _1057 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1059 = _881 + _1057;
        float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1063 = _463 + _1061;
        float _1065 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1067 = -_463;
        float _1069 = _1067 + _1031;
        float _1071 = _1059 * _1059;
        float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1075 = _465 + _1073;
        float _1077 = -_465;
        float _1079 = _1077 + _1033;
        float _1081 = fma(_1063, _1063, _1071);
        float _1083 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1085 = fma(_1075, _1075, _1081);
        float _1087 = sqrt(_1085);
        float _1089 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1091 = precise::min(_1087, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1093 = _1091 * _1083;
        float _1095 = -_881;
        float _1097 = _1095 + _1029;
        float _1099 = _1089 * _1093;
        float _1101 = fma(_1097, _1099, _881);
        float _1103 = fma(_1069, _1099, _463);
        float _1105 = fma(_1079, _1099, _465);
        _1055 = _1101;
        _1043 = _1103;
        _1045 = _1105;
        _191 = _1093;
    }
    float _1107 = _1055;
    float _1109 = _1043;
    float _1111 = _1045;
    float _1113 = _191;
    float _1115 = _1113;
    if (_963)
    {
        _1115 = 1.0;
    }
    float _1117 = _1115;
    float _1119 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1121 = _965 * _1119;
    float _1123 = _1117;
    if (!_963)
    {
        float _1125 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1127 = _1125 * 0.15915493667125701904296875;
        float _1129 = _1127 * 6.283185482025146484375;
        float _1131 = cos(_1129);
        float _1133 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1135 = _1133 * 0.15915493667125701904296875;
        float _1137 = _1127 * 6.283185482025146484375;
        float _1139 = sin(_1137);
        float _1141 = 1.0 / _1131;
        float _1143 = _1135 * 6.283185482025146484375;
        float _1145 = cos(_1143);
        float _1147 = _1139 * _1141;
        float _1149 = _1135 * 6.283185482025146484375;
        float _1151 = sin(_1149);
        float _1153 = _1145 * _1147;
        float _1155 = 1.0 / _1153;
        float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1159 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1157;
        float _1161 = 1.0 / _1159;
        float _1163 = _1151 * _1155;
        float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1167 = fma(_1121, _1163, _1165);
        float _1169 = _1167 * _1161;
        float _1171 = precise::clamp(_1169, 0.0, 1.0);
        _1047 = _1127;
        _1051 = _1171;
    }
    float _1173 = _1047;
    float _1175 = _1051;
    float _1177 = _1173;
    if (!_963)
    {
        float _1179 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1181 = _1179 * 0.15915493667125701904296875;
        float _1183 = _1181 * 6.283185482025146484375;
        float _1185 = cos(_1183);
        float _1187 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1189 = _1187 * 0.15915493667125701904296875;
        float _1191 = _1181 * 6.283185482025146484375;
        float _1193 = sin(_1191);
        float _1195 = 1.0 / _1185;
        float _1197 = _1189 * 6.283185482025146484375;
        float _1199 = cos(_1197);
        float _1201 = _1193 * _1195;
        float _1203 = _1189 * 6.283185482025146484375;
        float _1205 = sin(_1203);
        float _1207 = _1199 * _1201;
        float _1209 = 1.0 / _1207;
        float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1213 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1211;
        float _1215 = 1.0 / _1213;
        float _1217 = _1205 * _1209;
        float _1219 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1221 = fma(_1121, _1217, _1219);
        float _1223 = _1221 * _1215;
        float _1225 = precise::clamp(_1223, 0.0, 1.0);
        float _1227 = -_1225;
        float _1229 = _1227 + 1.0;
        _1177 = _1207;
        _1123 = _1229;
    }
    float _1231 = _1177;
    float _1233 = _1123;
    float _1235 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1237 = _1107 + _1235;
    float _1239 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1241 = _1109 + _1239;
    float _1243 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1245 = _1111 + _1243;
    float _1247 = _1237 * _1237;
    float _1249 = fma(_1241, _1241, _1247);
    float _1251 = fma(_1245, _1245, _1249);
    float _1253 = rsqrt(_1251);
    float _1255 = _1253 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1257 = _1241 * _1255;
    float _1259 = _1245 * _1255;
    float _1261 = _1257 * _1257;
    float _1263 = _1259 * _1259;
    float _1265 = _1261 + _1263;
    float _1267 = sqrt(_1265);
    bool _1269 = _1267 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1271 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1273 = _1267 + _1271;
    float _1275 = _1035;
    float _1277 = _1253;
    float _1279 = _1273;
    float _1281 = _1231;
    float _1283 = _1237;
    if (_1269)
    {
        float _1285 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1275 = _1285;
    }
    float _1287 = _1275;
    if (_1269)
    {
        float _1289 = rsqrt(_1265);
        _1277 = _1289;
    }
    float _1291 = _1277;
    float _1293 = _1287;
    if (_1269)
    {
        float _1295 = _1273 * _1287;
        _1279 = _1295;
    }
    float _1297 = _1279;
    if (_1269)
    {
        float _1299 = _1297 * 0.15915493667125701904296875;
        _1281 = _1299;
    }
    float _1301 = _1281;
    float _1303 = _1245;
    float _1305 = _1301;
    if (_1269)
    {
        float _1307 = _1301 * 6.283185482025146484375;
        float _1309 = sin(_1307);
        _1303 = _1309;
    }
    float _1311 = _1303;
    float _1313 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1315 = precise::max(0.0, _1313);
    float _1317 = _1037;
    if (_1269)
    {
        float _1319 = _1301 * 6.283185482025146484375;
        float _1321 = cos(_1319);
        _1317 = _1321;
    }
    float _1323 = _1317;
    float _1325 = -_1255;
    float _1327 = -_1315;
    float _1329 = fma(_1237, _1325, _1327);
    float _1331 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1269)
    {
        float _1333 = _1329 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1283 = _1333;
    }
    float _1335 = _1283;
    float _1337 = _1335;
    if (!_1269)
    {
        _1305 = _1329;
    }
    float _1339 = _1305;
    float _1341 = fma(_463, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1343 = _1339;
    if (!_1269)
    {
        _571 = _1263;
    }
    float _1345 = _571;
    float _1347 = _1311;
    float _1349 = _1345;
    if (_1269)
    {
        float _1351 = fma(_1311, _1335, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1293 = _1351;
    }
    float _1353 = _1293;
    float _1355 = _1353;
    if (!_1269)
    {
        _1347 = _1259;
    }
    float _1357 = _1347;
    float _1359 = _1357;
    if (_1269)
    {
        float _1361 = _1323 + (-1.0);
        _1337 = _1361;
    }
    float _1363 = _1337;
    float _1365 = _1363;
    if (_1269)
    {
        float _1367 = _1291 * _1353;
        _951 = _1367;
    }
    float _1369 = _951;
    if (!_1269)
    {
        _1355 = _1257;
    }
    float _1371 = _1355;
    float _1373 = sqrt(_1251);
    float _1375 = _1371;
    if (_1269)
    {
        float _1377 = _1363 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1331 = _1377;
    }
    float _1379 = _1331;
    if (_1269)
    {
        float _1381 = _1257 * _1369;
        _1375 = _1381;
    }
    float _1383 = _1375;
    if (!_1269)
    {
        _1365 = _1261;
    }
    float _1385 = _1365;
    float _1387 = _1385;
    if (_1269)
    {
        float _1389 = _1259 * _1369;
        _1359 = _1389;
    }
    float _1391 = _1359;
    if (_1269)
    {
        float _1393 = fma(_1329, _1323, _1379);
        _1343 = _1393;
    }
    float _1395 = _1343;
    if (_1269)
    {
        float _1397 = _1383 * _1383;
        _1387 = _1397;
    }
    float _1399 = _1387;
    float _1401 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1269)
    {
        float _1403 = _1391 * _1391;
        _1349 = _1403;
    }
    float _1405 = _1349;
    float _1407 = fma(_1395, _1395, _1399);
    float _1409 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1401);
    float _1411 = floor(_1341);
    float _1413 = _1407 + _1405;
    float _1415 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1409);
    float _1417 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1419 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1421 = fma(_1373, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1419);
    float _1423 = precise::clamp(_1421, 0.0, 1.0);
    float _1425 = _1415 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1427 = rsqrt(_1413);
    float _1429 = -_1423;
    float _1431 = _1429 + 1.0;
    float _1433 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1435 = fma(_465, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1437 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1439 = -_1433;
    float _1441 = fma(_1439, _1417, 1.0);
    float _1443 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1445 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1437);
    float _1447 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1449 = abs(_1431);
    float _1451 = log2(_1449);
    float _1453 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1443);
    float _1455 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1445);
    float _1457 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1447);
    float _1459 = -_1411;
    float _1461 = _1341 + _1459;
    float _1463 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1453);
    float _1465 = _1427 * _1383;
    float _1467 = _1427 * _1395;
    float _1469 = _1427 * _1391;
    float _1471 = _1463 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1473 = _1465 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1475 = _1455 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1477 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1457);
    float _1479 = floor(_1435);
    float _1481 = -_1473;
    float _1483 = fma(_1467, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1481);
    float _1485 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1487 = _1451 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1489 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1491 = -_1469;
    float _1493 = fma(_1491, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1483);
    float _1495 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1485);
    float _1497 = log2(_1441);
    float _1499 = fma(_1493, -0.5, 0.5);
    float _1501 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1495);
    float _1503 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1489);
    float _1505 = exp2(_1487);
    float _1507 = _1477 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1509 = -_1479;
    float _1511 = _1435 + _1509;
    float _1513 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1501);
    float _1515 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1517 = sqrt(_1499);
    float _1519 = fma(_1493, 0.5, 0.5);
    float _1521 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1515);
    float _1523 = _1467 + 1.0;
    float _1525 = _1497 * 0.693147182464599609375;
    float _1527 = fma(_1519, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1529 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1521);
    float _1531 = 1.0 / _1513;
    float _1533 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1503);
    float _1535 = fma(_1519, _1527, -0.212114393711090087890625);
    float _1537 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1529);
    float2 _4467 = float2(_1461, _1511);
    float _1539 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4467, float2(0.0), isnan(_4467)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4467, float2(0.0), isnan(_4467)), level(0.0)).x;
    float _1541 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1533);
    float _1543 = fma(_1519, _1535, 1.570728778839111328125);
    float _1545 = -_1467;
    float _1547 = fma(_1505, _1523, _1545);
    float _1549 = _1517 * 0.636619746685028076171875;
    float _1551 = -_1543;
    float _1553 = fma(_1549, _1551, 1.0);
    float _1555 = fma(_1547, 0.5, 0.5);
    float _1557 = _1541 * _1531;
    float _1559 = _1537 * _1531;
    float _1561 = _1525 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1563 = fma(_1557, 0.5, 0.5);
    float _1565 = fma(_1559, -0.5, 0.5);
    float3 _4515 = float3(_1563, _1565, _1561);
    float _1567 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4515, float3(0.0), isnan(_4515)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4515, float3(0.0), isnan(_4515)), level(0.0)).x;
    float3 _4526 = float3(_1563, _1565, _1561);
    float4 _1570 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4526, float3(0.0), isnan(_4526)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4526, float3(0.0), isnan(_4526)), level(0.0)).xyzw;
    float _1572 = _1570.x;
    float _1574 = _1570.y;
    float _1576 = _1570.z;
    float _1578 = _1570.w;
    float2 _4542 = float2(_1553, _1555);
    float3 _1582 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4542, float2(0.0), isnan(_4542)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4542, float2(0.0), isnan(_4542)), level(0.0)).xyz;
    float _1584 = _1582.x;
    float _1586 = _1582.y;
    float _1588 = _1582.z;
    float _1590 = abs(_1121);
    float _1592 = log2(_1590);
    float _1594 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_80.x = _1109;
    out.m_80.y = _1107;
    out.m_80.z = _1111;
    bool _1596 = _1373 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1598 = isnan(_1373);
    bool _1600 = _1596 || _1598;
    bool _1602 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1604 = _1600 || _1602;
    float _1606 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1594);
    float _1608 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1606);
    float _1610 = in.m_66.x;
    float _1612 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1608);
    float _1614 = _1592 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1616 = exp2(_1614);
    float _1618 = fma(_1616, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1620 = precise::clamp(_1618, 0.0, 1.0);
    float _1622 = fma(_1620, -2.0, 3.0);
    float _1624 = _1620 * _1620;
    float _1626 = _1624 * _1622;
    float _1628 = _1451 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1630 = _1121 <= 8000.0;
    bool _1632 = isnan(_1121);
    bool _1634 = _1630 || _1632;
    bool _1636 = isnan(8000.0);
    bool _1638 = _1634 || _1636;
    float _1640 = float(_1638);
    float _1642 = -_1626;
    float _1644 = _1642 + 1.0;
    float _1646 = exp2(_1628);
    float _1648 = fma(_1644, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1626);
    float _1650 = _1612 + _1513;
    out.gl_Position.x = _1541;
    out.gl_Position.y = _1537;
    out.gl_Position.z = _1612;
    out.gl_Position.w = _1513;
    float _1652 = _1640 * _1648;
    float _1654 = _1650 * 0.5;
    float _1656 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_82.z = _1654;
    out.m_82.w = _1513;
    float _1658 = -_1646;
    float _1660 = _1658 + 1.0;
    float _1662 = _1513;
    float _1664 = _1612;
    float _1666 = _1537;
    float _1668 = _1541;
    if (!_1604)
    {
        _1662 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1670 = _1662;
    float _1672 = _1670;
    float _1674 = _1670;
    if (!_1604)
    {
        _1664 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1676 = _1664;
    float _1678 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1680 = _1676;
    float _1682 = _1676;
    if (!_1604)
    {
        _1666 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1684 = _1666;
    float _1686 = _1684;
    float _1688 = _1684;
    if (!_1604)
    {
        _1668 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1690 = _1668;
    float _1692 = -_1539;
    float _1694 = _1692 + 1.0;
    float _1696 = _1694 * _1656;
    float _1698 = precise::clamp(_1696, 0.0, 1.0);
    float _1700 = -_1698;
    float _1702 = fma(_1700, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1704 = _1702 * _1610;
    float _1706 = _1704 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1708 = _1678 * _1567;
    float _1710 = -_1678;
    float _1712 = _1710 + 1.0;
    out.m_84.x = _1706;
    float _1714 = _1578 * _1708;
    float _1716 = _1588 * _1708;
    float _1718 = _1578 * _1712;
    float _1720 = fma(_1584, _1714, _1572);
    float _1722 = fma(_1586, _1714, _1574);
    float _1724 = fma(_1578, _1716, _1576);
    float _1726 = _1175 * _1233;
    float _1728 = _1572;
    float _1730 = _1726;
    float _1732 = _1690;
    float _1734 = _1690;
    if (!_1604)
    {
        _1728 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1736 = _1728;
    out.m_86.x = _1720;
    out.m_86.y = _1722;
    out.m_86.z = _1724;
    out.m_86.w = _1718;
    float _1738 = _1726 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1740 = _1736;
    float _1742 = _1736;
    if (!_1604)
    {
        _1730 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1744 = _1730;
    bool _1746 = !_1604;
    float _1748 = _1744;
    float _1750 = _1744;
    if (!_1746)
    {
        bool _1752 = _1373 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1754 = isnan(_1373);
        bool _1756 = _1752 || _1754;
        bool _1758 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1760 = _1756 || _1758;
        if (!_1760)
        {
            float _1762 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1764 = _1373 + _1762;
            float _1766 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1768 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1766;
            float _1770 = 1.0 / _1768;
            float _1772 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1774 = _1772 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1776 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1778 = _1776 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1780 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1782 = _1780 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1784 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1786 = _1784 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1788 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1790 = _1788 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1792 = _1764 * _1770;
            float _1794 = precise::clamp(_1792, 0.0, 1.0);
            float _1796 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1798 = _1796 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1800 = fma(_1794, _1774, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1802 = fma(_1794, _1798, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1804 = fma(_1794, _1778, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1806 = fma(_1794, _1782, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1808 = fma(_1794, _1786, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1810 = fma(_1794, _1790, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1674 = _1802;
            _1734 = _1808;
            _1742 = _1800;
            _1688 = _1806;
            _1682 = _1804;
            _1750 = _1810;
            _1812 = true;
        }
        else
        {
            bool _1814 = _1373 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1816 = isnan(_1373);
            bool _1818 = _1814 || _1816;
            bool _1820 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1822 = _1818 || _1820;
            if (!_1822)
            {
                _1740 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1824 = _1740;
            _1742 = _1824;
            if (!_1822)
            {
                _1672 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1826 = _1672;
            _1674 = _1826;
            if (!_1822)
            {
                _1680 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1828 = _1680;
            _1682 = _1828;
            if (!_1822)
            {
                _1686 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1830 = _1686;
            _1688 = _1830;
            if (!_1822)
            {
                _1732 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1832 = _1732;
            _1734 = _1832;
            if (!_1822)
            {
                _1748 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1834 = _1748;
            bool _1836 = !_1822;
            _1750 = _1834;
            if (!_1836)
            {
                bool _1838 = _1373 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1840 = isnan(_1373);
                bool _1842 = _1838 || _1840;
                bool _1844 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1846 = _1842 || _1844;
                if (!_1846)
                {
                    float _1848 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1850 = _1373 + _1848;
                    float _1852 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1854 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1852;
                    float _1856 = 1.0 / _1854;
                    float _1858 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1860 = _1858 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1862 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1864 = _1862 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1866 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1868 = _1866 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1872 = _1870 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1874 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1876 = _1874 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1878 = _1850 * _1856;
                    float _1880 = precise::clamp(_1878, 0.0, 1.0);
                    float _1882 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1884 = _1882 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1886 = fma(_1880, _1860, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1888 = fma(_1880, _1884, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1890 = fma(_1880, _1864, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1892 = fma(_1880, _1868, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1894 = fma(_1880, _1872, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1896 = fma(_1880, _1876, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1674 = _1888;
                    _1734 = _1894;
                    _1742 = _1886;
                    _1688 = _1892;
                    _1682 = _1890;
                    _1750 = _1896;
                    _1812 = true;
                }
                else
                {
                    _1674 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1734 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1742 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1688 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1682 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1750 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1812 = false;
    float _1898 = _1674;
    float _1900 = _1734;
    float _1902 = _1742;
    float _1904 = _1688;
    float _1906 = _1682;
    float _1908 = _1750;
    float _1910 = fma(_759, -0.5, 0.5);
    float _1912 = precise::clamp(_1910, 0.0, 1.0);
    float _1914 = -_1898;
    float _1916 = _1914 + _1900;
    float _1918 = _1738 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1920 = -_1902;
    float _1922 = _1920 + _1904;
    out.m_88.x = 0.0;
    float _1924 = fma(_1912, _1916, _1898);
    float _1926 = fma(_1912, _1922, _1902);
    out.m_53.x = _1918;
    float _1928 = -_1906;
    float _1930 = _1928 + _1908;
    float _1932 = _1924 * 0.586610972881317138671875;
    bool _1934 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1936 = fma(_1912, _1930, _1906);
    float _1938 = fma(_1926, 0.298911988735198974609375, _1932);
    bool _1940 = _1175 > 0.0;
    bool _1942 = isnan(_1175);
    bool _1944 = _1940 || _1942;
    bool _1946 = isnan(0.0);
    bool _1948 = _1944 || _1946;
    float _1950 = fma(_1936, 0.114477999508380889892578125, _1938);
    bool _1952 = _1233 <= 0.0;
    bool _1954 = !_1948;
    bool _1956 = _1952 || _1954;
    float _1958 = -_1950;
    float _1960 = _1926 + _1958;
    float _1962 = -_1950;
    float _1964 = _1924 + _1962;
    float _1966 = -_1950;
    float _1968 = _1936 + _1966;
    float _1970 = fma(_1960, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1950);
    float _1972 = fma(_1964, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1950);
    float _1974 = fma(_1968, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1950);
    bool _1976 = !_1934;
    if (!_1976)
    {
        float _1978 = -_1107;
        float _1980 = _1978 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1982 = -_1109;
        float _1984 = _1982 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1986 = -_1111;
        float _1988 = _1986 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1990 = _1980 * _1980;
        float _1992 = fma(_1984, _1984, _1990);
        float _1994 = fma(_1988, _1988, _1992);
        float _1996 = sqrt(_1994);
        float _1998 = rsqrt(_1994);
        float _2000 = -_1996;
        float _2002 = _2000 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2004 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2006 = precise::clamp(_2004, 0.0, 1.0);
        float _2008 = _1984 * _1998;
        float _2010 = _1980 * _1998;
        float _2012 = abs(_2006);
        float _2014 = log2(_2012);
        float _2016 = _1988 * _1998;
        float _2018 = _2008 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2020 = _759 * _2010;
        float _2022 = -_2010;
        float _2024 = -_2018;
        float _2026 = fma(_2022, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2024);
        float _2028 = fma(_757, _2008, _2020);
        float _2030 = -_2016;
        float _2032 = fma(_2030, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2026);
        float _2034 = fma(_761, _2016, _2028);
        float _2036 = precise::clamp(_2034, 0.0, 1.0);
        float _2038 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2040 = _2032 + _2038;
        float _2042 = _2014 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2044 = _2040 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2046 = precise::clamp(_2044, 0.0, 1.0);
        float _2048 = exp2(_2042);
        float _2050 = _2048 * _2046;
        float _2052 = _2036 * _2050;
        float _2054 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2056 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2058 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _2054;
        out.m_88.y = _2056;
        out.m_88.z = _2058;
    }
    out.m_90.x = _1970;
    out.m_90.y = _1972;
    out.m_90.z = _1974;
    if (!_1956)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2060 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2060;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1812 = false;
    bool _809 = false;
    bool _211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_50.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (!_113)
    {
        out.m_53.x = 0.0;
    }
    int _119 = 0;
    if (!_113)
    {
        float _121 = _117 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2116 = as_type<float>(_123);
        out.gl_Position.z = _2116;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_55.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = 0.0;
    if (_137)
    {
        float _145 = float(_109);
        _143 = _145;
    }
    float _147 = _143;
    bool _149 = _141 >= _147;
    bool _151 = !_137;
    bool _153 = _149 || _151;
    float _155 = 0.0;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_53.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2184 = as_type<float>(_161);
        out.gl_Position.z = _2184;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _163 = in.m_57.x;
    float _165 = in.m_57.y;
    float _167 = in.m_57.z;
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _171 = _165 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _173 = _165 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _175 = _165 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _177 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].x, _171);
    float _179 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _181 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].x, _175);
    float _183 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].z, _177);
    float _185 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].z, _179);
    float _187 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].z, _181);
    bool _189 = !_169;
    float _191 = _187;
    float _209;
    if (!_189)
    {
        float _193 = in.m_59.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        float _213 = float(_109);
        float _215 = 1.0 / _213;
        float _217 = _141 * _215;
        _209 = _217;
    }
    _211 = false;
    float _219 = _209;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _223 = _219 + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = _219 + _225;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _231 = _219 + _229;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _239 = _237 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _241;
    bool _245 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _247 = isnan(_219);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = as_type<float>(int(gl_VertexIndex));
    bool _259 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _261 = isnan(_219);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    float _271 = 1.0 / _235;
    float _273 = 1.0 / _239;
    float _275 = 1.0 / _243;
    float _277 = _227 * _271;
    float _279 = -_255;
    float _281 = _279 + 1.0;
    int _283 = as_type<int>(_257) & 1;
    bool _285 = _283 != 0;
    int _287 = as_type<int>(_257) & 2;
    bool _289 = _287 != 0;
    float _291 = _223 * _273;
    bool _293 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _295 = isnan(_219);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = in.m_59.x;
    float _307 = in.m_59.y;
    float _309 = in.m_59.z;
    float _311 = in.m_59.w;
    bool _313 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _315 = isnan(_219);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = _231 * _275;
    float _327 = -_323;
    float _329 = _327 + 1.0;
    float _331 = _323 * _281;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _341 = _303 * _329;
    float _343 = -_303;
    float _345 = _343 + 1.0;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _355 = fma(_339, _291, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _357 = fma(_335, _277, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _359 = _269 * _345;
    float _361 = fma(_349, _277, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _363 = in.m_64.x;
    float _365 = in.m_64.y;
    float _367 = fma(_353, _291, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _369 = _357 * _359;
    float _371 = -_269;
    float _373 = _371 + 1.0;
    float _375 = _361 * _359;
    bool _377 = _307 > 0.5;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _379;
    float _383 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].x, _369);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _385;
    float _389 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].y, _375);
    float _391 = in.m_50.x;
    float _393 = in.m_50.y;
    float _395 = in.m_50.z;
    float _397 = fma(_381, _325, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _399 = fma(_387, _325, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _401 = fma(_367, _341, _389);
    float _403 = fma(_355, _341, _383);
    float _405 = fma(_399, _331, _401);
    float _407 = fma(_397, _331, _403);
    bool _409 = !_289;
    float _411 = _409 ? (-0.5) : 0.5;
    float _413 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[146].y, _405);
    float _415 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[146].x, _407);
    bool _417 = !_285;
    float _419 = _417 ? (-0.5) : 0.5;
    float _421 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _411);
    float _423 = _413 * _365;
    float _425 = _415 * _363;
    float _427 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _419);
    float _429 = _423 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _431 = _425 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _433 = _429 * _421;
    float _435 = _431 * _427;
    float _437 = _393 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _439 = _393 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _441 = _433 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _443 = _433 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _445 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].x, _437);
    float _447 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].x, _439);
    float _449 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _451 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[24].x, _441);
    float _453 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[26].x, _443);
    float _455 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].z, _445);
    float _457 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].z, _447);
    float _459 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[24].z, _451);
    float _461 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[26].z, _453);
    float _463 = _455 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _465 = _457 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _467 = _459 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _469 = _461 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _471 = _433 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _473 = _463 + _467;
    float _475 = _465 + _469;
    float _477 = in.m_66.y;
    float _479 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _481 = _473 + _479;
    float _483 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _485 = _475 + _483;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _489 = _487 != 0;
    float _491 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[25].x, _471);
    float _493 = _481 * _481;
    float _495 = _485 * _485;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _499 = _497 != 0;
    float _501 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[25].z, _491);
    int _503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _505 = _503 != 0;
    float _507 = _493 + _495;
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _511 = _509 != 0;
    float _513 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _515 = -_411;
    int _517 = _377 ? as_type<int>(_515) : as_type<int>(_411);
    out.m_68.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_68.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_68.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    bool _519 = _311 > 0.5;
    bool _521 = _305 > 0.5;
    float _523 = sqrt(_507);
    float _525 = _393 + _477;
    float _527 = _501 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _529 = !_499;
    float _531 = _529 ? _411 : as_type<float>(_517);
    float _533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _535 = -_411;
    int _537 = _519 ? as_type<int>(_535) : as_type<int>(_411);
    float _539 = _525 + _527;
    bool _541 = _309 > 0.5;
    bool _543 = !_511;
    float _545 = _543 ? _411 : as_type<float>(_537);
    float _547 = _411 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _549 = -_419;
    int _551 = _521 ? as_type<int>(_549) : as_type<int>(_419);
    float _553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _555 = _523 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _557 = -_419;
    int _559 = _541 ? as_type<int>(_557) : as_type<int>(_419);
    float _561 = _527;
    float _563 = _435;
    float _565 = _493;
    float _567 = _473;
    float _569 = _475;
    float _571 = _463;
    if (!_555)
    {
        _561 = _493;
    }
    float _573 = _561;
    float _575 = _573;
    if (!_555)
    {
        _563 = _495;
    }
    float _577 = _563;
    float _579 = _577;
    if (!_555)
    {
        _565 = _539;
    }
    float _581 = _565;
    bool _583 = !_555;
    float _585 = _581;
    if (!_583)
    {
        float _587 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _589 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _591 = _523 + _589;
        float _593 = _539 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _595 = rsqrt(_507);
        float _597 = _591 * _587;
        float _599 = _597 * 0.15915493667125701904296875;
        float _601 = _599 * 6.283185482025146484375;
        float _603 = sin(_601);
        float _605 = _599 * 6.283185482025146484375;
        float _607 = cos(_605);
        float _609 = fma(_603, _593, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _611 = _595 * _609;
        float _613 = _607 + (-1.0);
        float _615 = fma(_481, _611, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _617 = fma(_485, _611, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _619 = _613 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _621 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _623 = _615 + _621;
        float _625 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _627 = _617 + _625;
        float _629 = fma(_539, _607, _619);
        float _631 = _623 * _623;
        float _633 = _627 * _627;
        _585 = _629;
        _575 = _631;
        _579 = _633;
        _567 = _615;
        _569 = _617;
    }
    float _635 = _585;
    float _637 = _575;
    float _639 = _579;
    float _641 = _567;
    float _643 = _569;
    float _645 = fma(_547, _547, 1.0);
    bool _647 = !_489;
    float _649 = _647 ? _419 : as_type<float>(_551);
    float _651 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _653 = _635 + _651;
    bool _655 = !_505;
    float _657 = _655 ? _419 : as_type<float>(_559);
    float _659 = rsqrt(_645);
    float _661 = _419 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _663 = _649 + 0.5;
    float _665 = fma(_653, _653, _637);
    float _667 = _657 + 0.5;
    float _669 = _547 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _671 = _663 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _673 = _547 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _675 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _677 = _547 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _679 = _671 * _513;
    float _681 = _667 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _683 = -_531;
    float _685 = _683 + 0.5;
    float _687 = -_545;
    float _689 = _687 + 0.5;
    float _691 = _665 + _639;
    float _693 = _681 * _553;
    float _695 = _547 * _659;
    float _697 = _685 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _699 = _689 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _701 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[24].x, _669);
    float _703 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _705 = _695 * _703;
    float _707 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _709 = _695 * _707;
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _713 = _695 * _711;
    float _715 = _697 * _533;
    float _717 = _699 * _675;
    float _719 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[24].y, _705);
    float _721 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[25].x, _673);
    float _723 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[25].y, _709);
    float _725 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[26].y, _713);
    float _727 = sqrt(_691);
    float _729 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[26].x, _677);
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _741 = _731 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _745 = _733 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _749 = _735 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _751 = _737 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _753 = _739 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _755 = _743 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _757 = _701 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _759 = _721 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _761 = _729 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_70.x = _741;
    out.m_70.y = _745;
    out.m_70.z = _749;
    out.m_70.w = _747;
    bool _763 = _727 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _765 = isnan(_727);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _771 = _767 || _769;
    out.m_72.x = _751;
    out.m_72.y = _753;
    out.m_72.z = _755;
    out.m_74.x = _679;
    out.m_74.y = _715;
    out.m_74.z = _693;
    out.m_74.w = _717;
    out.m_76.x = _719;
    out.m_76.y = _723;
    out.m_76.z = _725;
    float _773 = _677;
    if (!_771)
    {
        _773 = 1.0;
    }
    float _775 = _773;
    out.m_78.x = _757;
    out.m_78.y = _759;
    out.m_78.z = _761;
    bool _777 = !_771;
    float _779 = _775;
    if (!_777)
    {
        bool _781 = _727 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _783 = isnan(_727);
        bool _785 = _781 || _783;
        bool _787 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _789 = _785 || _787;
        if (!_789)
        {
            float _791 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _793 = _727 + _791;
            float _795 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _797 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _795;
            float _799 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _801 = _799 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _803 = 1.0 / _797;
            float _805 = _793 * _803;
            float _807 = fma(_805, _801, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _779 = _807;
            _809 = true;
        }
        else
        {
            bool _811 = _727 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _813 = isnan(_727);
            bool _815 = _811 || _813;
            bool _817 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _819 = _815 || _817;
            if (!_819)
            {
                float _821 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _823 = _727 + _821;
                float _825 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _827 = _825 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _829 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _831 = _829 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _833 = 1.0 / _827;
                float _835 = _823 * _833;
                float _837 = fma(_835, _831, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _779 = _837;
                _809 = true;
            }
            else
            {
                _779 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _809 = false;
    float _839 = _779;
    float _841 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _843 = _641 + _841;
    float _845 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _847 = _643 + _845;
    float _849 = fma(_843, _839, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _851 = fma(_847, _839, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _853 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _855 = _849 + _853;
    float _857 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _859 = _851 + _857;
    float _861 = fma(_855, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _863 = fma(_859, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _3417 = float2(_861, _863);
    float _865 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_3417, float2(0.0), isnan(_3417)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_3417, float2(0.0), isnan(_3417)), level(0.0)).x;
    float _867 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _869 = _635 + _867;
    float _871 = -_463;
    float _873 = _871 + _849;
    float _875 = -_465;
    float _877 = _875 + _851;
    float _879 = fma(_869, _839, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _881 = fma(_865, 100.0, _525);
    float _883 = -_525;
    float _885 = _883 + _879;
    float _887 = fma(_865, 100.0, _879);
    float _889 = _881 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _891 = _885 * _885;
    float _893 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[11].x, _889);
    float _895 = fma(_873, _873, _891);
    float _897 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[11].z, _893);
    float _899 = fma(_877, _877, _895);
    float _901 = _897 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _903 = _881 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _905 = sqrt(_899);
    float _907 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[10].x, _903);
    float _909 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[10].z, _907);
    float _911 = 1.0 / _901;
    float _913 = _909 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _915 = _913 + _901;
    bool _917 = _905 > 0.0;
    bool _919 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _921 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _923 = _919 || _921;
    bool _925 = isnan(0.5);
    bool _927 = _923 || _925;
    float _929 = _915 * _911;
    float _931 = _929 * 0.5;
    float _933 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _935 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[30].w, _933);
    float _937 = _865;
    float _939 = _901;
    float _941 = _849;
    float _943 = _877;
    float _945 = _911;
    float _947 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _949 = _851;
    float _951 = _839;
    if (!_917)
    {
        _937 = _851;
    }
    float _953 = _937;
    bool _955 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _957 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _959 = _955 || _957;
    bool _961 = isnan(0.5);
    bool _963 = _959 || _961;
    float _965 = 1.0 / _935;
    float _967 = _953;
    if (!_917)
    {
        _939 = _887;
    }
    float _969 = _939;
    bool _971 = !_917;
    float _973 = _969;
    float _975 = _969;
    if (!_971)
    {
        float _977 = _185 * _185;
        float _979 = fma(_183, _183, _977);
        float _981 = rsqrt(_899);
        float _983 = fma(_187, _187, _979);
        float _985 = sqrt(_983);
        float _987 = _873 * _981;
        float _989 = _885 * _981;
        float _991 = _877 * _981;
        bool _993 = _985 > 0.0;
        float _995 = _981;
        _947 = _983;
        if (!_993)
        {
            _973 = _887;
        }
        float _997 = _973;
        _975 = _997;
        if (!_993)
        {
            _995 = _851;
        }
        float _999 = _995;
        bool _1001 = !_993;
        _967 = _999;
        if (!_1001)
        {
            float _1003 = rsqrt(_983);
            float _1005 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1007 = _185 * _1003;
            float _1009 = _183 * _1003;
            float _1011 = _187 * _1003;
            float _1013 = _989 * _1007;
            float _1015 = fma(_987, _1009, _1013);
            float _1017 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1019 = fma(_991, _1011, _1015);
            float _1021 = _1019 * _1017;
            float _1023 = fma(_183, _1021, _849);
            float _1025 = fma(_185, _1021, _887);
            float _1027 = fma(_187, _1021, _851);
            _975 = _1025;
            _941 = _1023;
            _967 = _1027;
            _943 = _1005;
            _945 = _1017;
        }
    }
    float _1029 = _975;
    float _1031 = _941;
    float _1033 = _967;
    float _1035 = _943;
    float _1037 = _945;
    float _1039 = _947;
    float _1041 = _1039;
    float _1043 = _1031;
    float _1045 = _1033;
    float _1047 = _1029;
    if (_963)
    {
        _1041 = 1.0;
    }
    float _1049 = _1041;
    float _1051 = _1049;
    if (_927)
    {
        _949 = _1029;
    }
    float _1053 = _949;
    float _1055 = _1053;
    if (!_927)
    {
        float _1057 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1059 = _881 + _1057;
        float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1063 = _463 + _1061;
        float _1065 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1067 = -_463;
        float _1069 = _1067 + _1031;
        float _1071 = _1059 * _1059;
        float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1075 = _465 + _1073;
        float _1077 = -_465;
        float _1079 = _1077 + _1033;
        float _1081 = fma(_1063, _1063, _1071);
        float _1083 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1085 = fma(_1075, _1075, _1081);
        float _1087 = sqrt(_1085);
        float _1089 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1091 = precise::min(_1087, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1093 = _1091 * _1083;
        float _1095 = -_881;
        float _1097 = _1095 + _1029;
        float _1099 = _1089 * _1093;
        float _1101 = fma(_1097, _1099, _881);
        float _1103 = fma(_1069, _1099, _463);
        float _1105 = fma(_1079, _1099, _465);
        _1055 = _1101;
        _1043 = _1103;
        _1045 = _1105;
        _191 = _1093;
    }
    float _1107 = _1055;
    float _1109 = _1043;
    float _1111 = _1045;
    float _1113 = _191;
    float _1115 = _1113;
    if (_963)
    {
        _1115 = 1.0;
    }
    float _1117 = _1115;
    float _1119 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1121 = _965 * _1119;
    float _1123 = _1117;
    if (!_963)
    {
        float _1125 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1127 = _1125 * 0.15915493667125701904296875;
        float _1129 = _1127 * 6.283185482025146484375;
        float _1131 = cos(_1129);
        float _1133 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1135 = _1133 * 0.15915493667125701904296875;
        float _1137 = _1127 * 6.283185482025146484375;
        float _1139 = sin(_1137);
        float _1141 = 1.0 / _1131;
        float _1143 = _1135 * 6.283185482025146484375;
        float _1145 = cos(_1143);
        float _1147 = _1139 * _1141;
        float _1149 = _1135 * 6.283185482025146484375;
        float _1151 = sin(_1149);
        float _1153 = _1145 * _1147;
        float _1155 = 1.0 / _1153;
        float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1159 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1157;
        float _1161 = 1.0 / _1159;
        float _1163 = _1151 * _1155;
        float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1167 = fma(_1121, _1163, _1165);
        float _1169 = _1167 * _1161;
        float _1171 = precise::clamp(_1169, 0.0, 1.0);
        _1047 = _1127;
        _1051 = _1171;
    }
    float _1173 = _1047;
    float _1175 = _1051;
    float _1177 = _1173;
    if (!_963)
    {
        float _1179 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1181 = _1179 * 0.15915493667125701904296875;
        float _1183 = _1181 * 6.283185482025146484375;
        float _1185 = cos(_1183);
        float _1187 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1189 = _1187 * 0.15915493667125701904296875;
        float _1191 = _1181 * 6.283185482025146484375;
        float _1193 = sin(_1191);
        float _1195 = 1.0 / _1185;
        float _1197 = _1189 * 6.283185482025146484375;
        float _1199 = cos(_1197);
        float _1201 = _1193 * _1195;
        float _1203 = _1189 * 6.283185482025146484375;
        float _1205 = sin(_1203);
        float _1207 = _1199 * _1201;
        float _1209 = 1.0 / _1207;
        float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1213 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1211;
        float _1215 = 1.0 / _1213;
        float _1217 = _1205 * _1209;
        float _1219 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1221 = fma(_1121, _1217, _1219);
        float _1223 = _1221 * _1215;
        float _1225 = precise::clamp(_1223, 0.0, 1.0);
        float _1227 = -_1225;
        float _1229 = _1227 + 1.0;
        _1177 = _1207;
        _1123 = _1229;
    }
    float _1231 = _1177;
    float _1233 = _1123;
    float _1235 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1237 = _1107 + _1235;
    float _1239 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1241 = _1109 + _1239;
    float _1243 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1245 = _1111 + _1243;
    float _1247 = _1237 * _1237;
    float _1249 = fma(_1241, _1241, _1247);
    float _1251 = fma(_1245, _1245, _1249);
    float _1253 = rsqrt(_1251);
    float _1255 = _1253 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1257 = _1241 * _1255;
    float _1259 = _1245 * _1255;
    float _1261 = _1257 * _1257;
    float _1263 = _1259 * _1259;
    float _1265 = _1261 + _1263;
    float _1267 = sqrt(_1265);
    bool _1269 = _1267 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1271 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1273 = _1267 + _1271;
    float _1275 = _1035;
    float _1277 = _1253;
    float _1279 = _1273;
    float _1281 = _1231;
    float _1283 = _1237;
    if (_1269)
    {
        float _1285 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1275 = _1285;
    }
    float _1287 = _1275;
    if (_1269)
    {
        float _1289 = rsqrt(_1265);
        _1277 = _1289;
    }
    float _1291 = _1277;
    float _1293 = _1287;
    if (_1269)
    {
        float _1295 = _1273 * _1287;
        _1279 = _1295;
    }
    float _1297 = _1279;
    if (_1269)
    {
        float _1299 = _1297 * 0.15915493667125701904296875;
        _1281 = _1299;
    }
    float _1301 = _1281;
    float _1303 = _1245;
    float _1305 = _1301;
    if (_1269)
    {
        float _1307 = _1301 * 6.283185482025146484375;
        float _1309 = sin(_1307);
        _1303 = _1309;
    }
    float _1311 = _1303;
    float _1313 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1315 = precise::max(0.0, _1313);
    float _1317 = _1037;
    if (_1269)
    {
        float _1319 = _1301 * 6.283185482025146484375;
        float _1321 = cos(_1319);
        _1317 = _1321;
    }
    float _1323 = _1317;
    float _1325 = -_1255;
    float _1327 = -_1315;
    float _1329 = fma(_1237, _1325, _1327);
    float _1331 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1269)
    {
        float _1333 = _1329 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1283 = _1333;
    }
    float _1335 = _1283;
    float _1337 = _1335;
    if (!_1269)
    {
        _1305 = _1329;
    }
    float _1339 = _1305;
    float _1341 = fma(_463, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1343 = _1339;
    if (!_1269)
    {
        _571 = _1263;
    }
    float _1345 = _571;
    float _1347 = _1311;
    float _1349 = _1345;
    if (_1269)
    {
        float _1351 = fma(_1311, _1335, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1293 = _1351;
    }
    float _1353 = _1293;
    float _1355 = _1353;
    if (!_1269)
    {
        _1347 = _1259;
    }
    float _1357 = _1347;
    float _1359 = _1357;
    if (_1269)
    {
        float _1361 = _1323 + (-1.0);
        _1337 = _1361;
    }
    float _1363 = _1337;
    float _1365 = _1363;
    if (_1269)
    {
        float _1367 = _1291 * _1353;
        _951 = _1367;
    }
    float _1369 = _951;
    if (!_1269)
    {
        _1355 = _1257;
    }
    float _1371 = _1355;
    float _1373 = sqrt(_1251);
    float _1375 = _1371;
    if (_1269)
    {
        float _1377 = _1363 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1331 = _1377;
    }
    float _1379 = _1331;
    if (_1269)
    {
        float _1381 = _1257 * _1369;
        _1375 = _1381;
    }
    float _1383 = _1375;
    if (!_1269)
    {
        _1365 = _1261;
    }
    float _1385 = _1365;
    float _1387 = _1385;
    if (_1269)
    {
        float _1389 = _1259 * _1369;
        _1359 = _1389;
    }
    float _1391 = _1359;
    if (_1269)
    {
        float _1393 = fma(_1329, _1323, _1379);
        _1343 = _1393;
    }
    float _1395 = _1343;
    if (_1269)
    {
        float _1397 = _1383 * _1383;
        _1387 = _1397;
    }
    float _1399 = _1387;
    float _1401 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1269)
    {
        float _1403 = _1391 * _1391;
        _1349 = _1403;
    }
    float _1405 = _1349;
    float _1407 = fma(_1395, _1395, _1399);
    float _1409 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1401);
    float _1411 = floor(_1341);
    float _1413 = _1407 + _1405;
    float _1415 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1409);
    float _1417 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1419 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1421 = fma(_1373, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1419);
    float _1423 = precise::clamp(_1421, 0.0, 1.0);
    float _1425 = _1415 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1427 = rsqrt(_1413);
    float _1429 = -_1423;
    float _1431 = _1429 + 1.0;
    float _1433 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1435 = fma(_465, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1437 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1439 = -_1433;
    float _1441 = fma(_1439, _1417, 1.0);
    float _1443 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1445 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1437);
    float _1447 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1449 = abs(_1431);
    float _1451 = log2(_1449);
    float _1453 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1443);
    float _1455 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1445);
    float _1457 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1447);
    float _1459 = -_1411;
    float _1461 = _1341 + _1459;
    float _1463 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1453);
    float _1465 = _1427 * _1383;
    float _1467 = _1427 * _1395;
    float _1469 = _1427 * _1391;
    float _1471 = _1463 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1473 = _1465 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1475 = _1455 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1477 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1457);
    float _1479 = floor(_1435);
    float _1481 = -_1473;
    float _1483 = fma(_1467, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1481);
    float _1485 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1487 = _1451 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1489 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1491 = -_1469;
    float _1493 = fma(_1491, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1483);
    float _1495 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1485);
    float _1497 = log2(_1441);
    float _1499 = fma(_1493, -0.5, 0.5);
    float _1501 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1495);
    float _1503 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1489);
    float _1505 = exp2(_1487);
    float _1507 = _1477 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1509 = -_1479;
    float _1511 = _1435 + _1509;
    float _1513 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1501);
    float _1515 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1517 = sqrt(_1499);
    float _1519 = fma(_1493, 0.5, 0.5);
    float _1521 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1515);
    float _1523 = _1467 + 1.0;
    float _1525 = _1497 * 0.693147182464599609375;
    float _1527 = fma(_1519, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1529 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1521);
    float _1531 = 1.0 / _1513;
    float _1533 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1503);
    float _1535 = fma(_1519, _1527, -0.212114393711090087890625);
    float _1537 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1529);
    float2 _4467 = float2(_1461, _1511);
    float _1539 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4467, float2(0.0), isnan(_4467)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4467, float2(0.0), isnan(_4467)), level(0.0)).x;
    float _1541 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1533);
    float _1543 = fma(_1519, _1535, 1.570728778839111328125);
    float _1545 = -_1467;
    float _1547 = fma(_1505, _1523, _1545);
    float _1549 = _1517 * 0.636619746685028076171875;
    float _1551 = -_1543;
    float _1553 = fma(_1549, _1551, 1.0);
    float _1555 = fma(_1547, 0.5, 0.5);
    float _1557 = _1541 * _1531;
    float _1559 = _1537 * _1531;
    float _1561 = _1525 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1563 = fma(_1557, 0.5, 0.5);
    float _1565 = fma(_1559, -0.5, 0.5);
    float3 _4515 = float3(_1563, _1565, _1561);
    float _1567 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4515, float3(0.0), isnan(_4515)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4515, float3(0.0), isnan(_4515)), level(0.0)).x;
    float3 _4526 = float3(_1563, _1565, _1561);
    float4 _1570 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4526, float3(0.0), isnan(_4526)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4526, float3(0.0), isnan(_4526)), level(0.0)).xyzw;
    float _1572 = _1570.x;
    float _1574 = _1570.y;
    float _1576 = _1570.z;
    float _1578 = _1570.w;
    float2 _4542 = float2(_1553, _1555);
    float3 _1582 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4542, float2(0.0), isnan(_4542)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4542, float2(0.0), isnan(_4542)), level(0.0)).xyz;
    float _1584 = _1582.x;
    float _1586 = _1582.y;
    float _1588 = _1582.z;
    float _1590 = abs(_1121);
    float _1592 = log2(_1590);
    float _1594 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_80.x = _1109;
    out.m_80.y = _1107;
    out.m_80.z = _1111;
    bool _1596 = _1373 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1598 = isnan(_1373);
    bool _1600 = _1596 || _1598;
    bool _1602 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1604 = _1600 || _1602;
    float _1606 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1594);
    float _1608 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1606);
    float _1610 = in.m_66.x;
    float _1612 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1608);
    float _1614 = _1592 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1616 = exp2(_1614);
    float _1618 = fma(_1616, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1620 = precise::clamp(_1618, 0.0, 1.0);
    float _1622 = fma(_1620, -2.0, 3.0);
    float _1624 = _1620 * _1620;
    float _1626 = _1624 * _1622;
    float _1628 = _1451 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1630 = _1121 <= 8000.0;
    bool _1632 = isnan(_1121);
    bool _1634 = _1630 || _1632;
    bool _1636 = isnan(8000.0);
    bool _1638 = _1634 || _1636;
    float _1640 = float(_1638);
    float _1642 = -_1626;
    float _1644 = _1642 + 1.0;
    float _1646 = exp2(_1628);
    float _1648 = fma(_1644, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1626);
    float _1650 = _1612 + _1513;
    out.gl_Position.x = _1541;
    out.gl_Position.y = _1537;
    out.gl_Position.z = _1612;
    out.gl_Position.w = _1513;
    float _1652 = _1640 * _1648;
    float _1654 = _1650 * 0.5;
    float _1656 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_82.z = _1654;
    out.m_82.w = _1513;
    float _1658 = -_1646;
    float _1660 = _1658 + 1.0;
    float _1662 = _1513;
    float _1664 = _1612;
    float _1666 = _1537;
    float _1668 = _1541;
    if (!_1604)
    {
        _1662 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1670 = _1662;
    float _1672 = _1670;
    float _1674 = _1670;
    if (!_1604)
    {
        _1664 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1676 = _1664;
    float _1678 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1680 = _1676;
    float _1682 = _1676;
    if (!_1604)
    {
        _1666 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1684 = _1666;
    float _1686 = _1684;
    float _1688 = _1684;
    if (!_1604)
    {
        _1668 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1690 = _1668;
    float _1692 = -_1539;
    float _1694 = _1692 + 1.0;
    float _1696 = _1694 * _1656;
    float _1698 = precise::clamp(_1696, 0.0, 1.0);
    float _1700 = -_1698;
    float _1702 = fma(_1700, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1704 = _1702 * _1610;
    float _1706 = _1704 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1708 = _1678 * _1567;
    float _1710 = -_1678;
    float _1712 = _1710 + 1.0;
    out.m_84.x = _1706;
    float _1714 = _1578 * _1708;
    float _1716 = _1588 * _1708;
    float _1718 = _1578 * _1712;
    float _1720 = fma(_1584, _1714, _1572);
    float _1722 = fma(_1586, _1714, _1574);
    float _1724 = fma(_1578, _1716, _1576);
    float _1726 = _1175 * _1233;
    float _1728 = _1572;
    float _1730 = _1726;
    float _1732 = _1690;
    float _1734 = _1690;
    if (!_1604)
    {
        _1728 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1736 = _1728;
    out.m_86.x = _1720;
    out.m_86.y = _1722;
    out.m_86.z = _1724;
    out.m_86.w = _1718;
    float _1738 = _1726 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1740 = _1736;
    float _1742 = _1736;
    if (!_1604)
    {
        _1730 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1744 = _1730;
    bool _1746 = !_1604;
    float _1748 = _1744;
    float _1750 = _1744;
    if (!_1746)
    {
        bool _1752 = _1373 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1754 = isnan(_1373);
        bool _1756 = _1752 || _1754;
        bool _1758 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1760 = _1756 || _1758;
        if (!_1760)
        {
            float _1762 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1764 = _1373 + _1762;
            float _1766 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1768 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1766;
            float _1770 = 1.0 / _1768;
            float _1772 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1774 = _1772 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1776 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1778 = _1776 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1780 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1782 = _1780 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1784 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1786 = _1784 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1788 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1790 = _1788 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1792 = _1764 * _1770;
            float _1794 = precise::clamp(_1792, 0.0, 1.0);
            float _1796 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1798 = _1796 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1800 = fma(_1794, _1774, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1802 = fma(_1794, _1798, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1804 = fma(_1794, _1778, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1806 = fma(_1794, _1782, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1808 = fma(_1794, _1786, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1810 = fma(_1794, _1790, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1674 = _1802;
            _1734 = _1808;
            _1742 = _1800;
            _1688 = _1806;
            _1682 = _1804;
            _1750 = _1810;
            _1812 = true;
        }
        else
        {
            bool _1814 = _1373 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1816 = isnan(_1373);
            bool _1818 = _1814 || _1816;
            bool _1820 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1822 = _1818 || _1820;
            if (!_1822)
            {
                _1740 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1824 = _1740;
            _1742 = _1824;
            if (!_1822)
            {
                _1672 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1826 = _1672;
            _1674 = _1826;
            if (!_1822)
            {
                _1680 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1828 = _1680;
            _1682 = _1828;
            if (!_1822)
            {
                _1686 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1830 = _1686;
            _1688 = _1830;
            if (!_1822)
            {
                _1732 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1832 = _1732;
            _1734 = _1832;
            if (!_1822)
            {
                _1748 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1834 = _1748;
            bool _1836 = !_1822;
            _1750 = _1834;
            if (!_1836)
            {
                bool _1838 = _1373 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1840 = isnan(_1373);
                bool _1842 = _1838 || _1840;
                bool _1844 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1846 = _1842 || _1844;
                if (!_1846)
                {
                    float _1848 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1850 = _1373 + _1848;
                    float _1852 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1854 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1852;
                    float _1856 = 1.0 / _1854;
                    float _1858 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1860 = _1858 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1862 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1864 = _1862 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1866 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1868 = _1866 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1872 = _1870 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1874 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1876 = _1874 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1878 = _1850 * _1856;
                    float _1880 = precise::clamp(_1878, 0.0, 1.0);
                    float _1882 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1884 = _1882 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1886 = fma(_1880, _1860, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1888 = fma(_1880, _1884, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1890 = fma(_1880, _1864, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1892 = fma(_1880, _1868, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1894 = fma(_1880, _1872, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1896 = fma(_1880, _1876, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1674 = _1888;
                    _1734 = _1894;
                    _1742 = _1886;
                    _1688 = _1892;
                    _1682 = _1890;
                    _1750 = _1896;
                    _1812 = true;
                }
                else
                {
                    _1674 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1734 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1742 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1688 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1682 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1750 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1812 = false;
    float _1898 = _1674;
    float _1900 = _1734;
    float _1902 = _1742;
    float _1904 = _1688;
    float _1906 = _1682;
    float _1908 = _1750;
    float _1910 = fma(_759, -0.5, 0.5);
    float _1912 = precise::clamp(_1910, 0.0, 1.0);
    float _1914 = -_1898;
    float _1916 = _1914 + _1900;
    float _1918 = _1738 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1920 = -_1902;
    float _1922 = _1920 + _1904;
    out.m_88.x = 0.0;
    float _1924 = fma(_1912, _1916, _1898);
    float _1926 = fma(_1912, _1922, _1902);
    out.m_53.x = _1918;
    float _1928 = -_1906;
    float _1930 = _1928 + _1908;
    float _1932 = _1924 * 0.586610972881317138671875;
    bool _1934 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1936 = fma(_1912, _1930, _1906);
    float _1938 = fma(_1926, 0.298911988735198974609375, _1932);
    bool _1940 = _1175 > 0.0;
    bool _1942 = isnan(_1175);
    bool _1944 = _1940 || _1942;
    bool _1946 = isnan(0.0);
    bool _1948 = _1944 || _1946;
    float _1950 = fma(_1936, 0.114477999508380889892578125, _1938);
    bool _1952 = _1233 <= 0.0;
    bool _1954 = !_1948;
    bool _1956 = _1952 || _1954;
    float _1958 = -_1950;
    float _1960 = _1926 + _1958;
    float _1962 = -_1950;
    float _1964 = _1924 + _1962;
    float _1966 = -_1950;
    float _1968 = _1936 + _1966;
    float _1970 = fma(_1960, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1950);
    float _1972 = fma(_1964, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1950);
    float _1974 = fma(_1968, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1950);
    bool _1976 = !_1934;
    if (!_1976)
    {
        float _1978 = -_1107;
        float _1980 = _1978 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1982 = -_1109;
        float _1984 = _1982 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1986 = -_1111;
        float _1988 = _1986 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1990 = _1980 * _1980;
        float _1992 = fma(_1984, _1984, _1990);
        float _1994 = fma(_1988, _1988, _1992);
        float _1996 = sqrt(_1994);
        float _1998 = rsqrt(_1994);
        float _2000 = -_1996;
        float _2002 = _2000 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2004 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2006 = precise::clamp(_2004, 0.0, 1.0);
        float _2008 = _1984 * _1998;
        float _2010 = _1980 * _1998;
        float _2012 = abs(_2006);
        float _2014 = log2(_2012);
        float _2016 = _1988 * _1998;
        float _2018 = _2008 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2020 = _759 * _2010;
        float _2022 = -_2010;
        float _2024 = -_2018;
        float _2026 = fma(_2022, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2024);
        float _2028 = fma(_757, _2008, _2020);
        float _2030 = -_2016;
        float _2032 = fma(_2030, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2026);
        float _2034 = fma(_761, _2016, _2028);
        float _2036 = precise::clamp(_2034, 0.0, 1.0);
        float _2038 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2040 = _2032 + _2038;
        float _2042 = _2014 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2044 = _2040 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2046 = precise::clamp(_2044, 0.0, 1.0);
        float _2048 = exp2(_2042);
        float _2050 = _2048 * _2046;
        float _2052 = _2036 * _2050;
        float _2054 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2056 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2058 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _2054;
        out.m_88.y = _2056;
        out.m_88.z = _2058;
    }
    out.m_90.x = _1970;
    out.m_90.y = _1972;
    out.m_90.z = _1974;
    if (!_1956)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2060 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2060;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

