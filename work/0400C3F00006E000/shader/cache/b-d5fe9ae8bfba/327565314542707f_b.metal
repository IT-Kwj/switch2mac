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
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_60 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_76 [[user(locn3)]];
    float4 m_84 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_68 [[user(locn6)]];
    float4 m_62 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_82 [[user(locn10)]];
    float4 m_80 [[user(locn11)]];
    float4 m_78 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_70 [[attribute(0)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_56 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2182 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    float _111 = as_type<float>(_103);
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _109;
    if (!_107)
    {
        out.m_49.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _113 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2482 = as_type<float>(_119);
        out.gl_Position.z = _2482;
    }
    if (!_107)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = in.m_51.w;
    bool _125 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_123);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    float _135 = -_123;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _139 = _137;
    if (_133)
    {
        float _141 = float(_103);
        _111 = _141;
    }
    float _143 = _111;
    bool _145 = _137 >= _143;
    bool _147 = !_133;
    bool _149 = _145 || _147;
    float _151 = _143;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _151;
    if (_149)
    {
        out.m_49.x = 0.0;
    }
    if (_149)
    {
        float _155 = _153 * 5.0;
        _121 = as_type<int>(_155);
    }
    int _157 = _121;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2552 = as_type<float>(_157);
        out.gl_Position.z = _2552;
    }
    if (_149)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _163 = _137 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _165 = in.m_56.x;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _169 = _167 != 0;
    float _171 = in.m_56.z;
    float _173 = in.m_56.w;
    float _175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _177 = _137 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _179 = in.m_56.y;
    float _181 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _183 = in.m_46.x;
    float _185 = in.m_46.y;
    float _187 = in.m_46.z;
    float _189 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _191 = log2(_189);
    float _193 = _163 * _161;
    float _195 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _197 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _199 = as_type<int>(_159) & 1;
    bool _201 = _199 != 0;
    int _203 = as_type<int>(_159) & 2;
    bool _205 = _203 != 0;
    float _207 = _177 * _175;
    float _209 = _175;
    if (!_169)
    {
        float _211 = in.m_56.z;
        _209 = _211;
    }
    float _213 = _209;
    float _215 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _217 = _165 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _219 = _171 * 2.0;
    float _221 = _191 * _137;
    bool _223 = _173 > 0.5;
    float _225 = -_181;
    float _227 = fma(_217, 2.0, _225);
    float _229 = _179 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _231 = exp2(_221);
    float _233 = 0.0;
    float _235 = _229;
    float _237 = _183;
    float _239 = _185;
    if (!_169)
    {
        _233 = _179;
    }
    float _241 = _233;
    float _243 = _185 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _245 = fma(_229, -2.0, _197);
    float _247 = _241;
    if (_169)
    {
        _235 = _165;
    }
    float _249 = _235;
    float _251 = _185 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _253 = _249;
    if (!_169)
    {
        _253 = _171;
    }
    float _255 = _253;
    float _257 = _185 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _259 = floor(_219);
    if (_169)
    {
        _247 = _165;
    }
    float _261 = _247;
    float _263 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[4].x, _243);
    float _265 = _255 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _267 = int(_201);
    int _269 = _205 ? 2 : 0;
    int _271 = _267 | _269;
    int _273 = _223 ? 4 : 0;
    int _275 = _271 | _273;
    int _277 = _169 ? 8 : 0;
    int _279 = _275 | _277;
    int _281 = false ? 16 : 0;
    int _283 = _279 | _281;
    int _285 = false ? 32 : 0;
    int _287 = _283 | _285;
    int _289 = false ? 64 : 0;
    int _291 = _287 | _289;
    int _293 = _291 & 4;
    float _295 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[5].x, _251);
    float _297 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[83].z, _215);
    float _299 = -_195;
    float _301 = fma(_265, 2.0, _299);
    float _303 = _261 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _305 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[6].x, _257);
    if (_169)
    {
        _237 = _171;
    }
    float _307 = _237;
    float _309 = -_231;
    float _311 = _309 + 1.0;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _315 = _307;
    if (_169)
    {
        _239 = _179;
    }
    float _317 = _239;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _321 = _259 > 0.0;
    float _323 = -_313;
    float _325 = fma(_303, 2.0, _323);
    bool _327 = _259 >= 0.0;
    bool _329 = isnan(_259);
    bool _331 = _327 || _329;
    bool _333 = isnan(0.0);
    bool _335 = _331 || _333;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _339 = _259;
    float _341 = _213;
    float _343 = _317;
    if (!_169)
    {
        _339 = _213;
    }
    float _345 = _339;
    float _347 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _245);
    float _349 = _345;
    if (_169)
    {
        _349 = _179;
    }
    float _351 = _349;
    float _353 = _165 * 2.0;
    if (_169)
    {
        _341 = _179;
    }
    float _355 = _341;
    float _357 = -_137;
    float _359 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[76].x, _227);
    if (!_169)
    {
        _343 = _165;
    }
    float _361 = _343;
    float _363 = _351 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_169)
    {
        _315 = _179;
    }
    float _365 = _315;
    float _367 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[83].w, _319);
    bool _369 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _371 = isnan(0.0);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _377 = _373 || _375;
    float _379 = _361 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _381 = fma(_363, -2.0, _337);
    float _383 = -_137;
    float _385 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[86].x, _301);
    float _387 = -_137;
    float _389 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[81].x, _325);
    float _391 = _377 ? _311 : 0.0;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    bool _395 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _397 = isnan(1.0);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _403 = _399 || _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _407 = 1.0 + _405;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _411 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[89].z, _393);
    float _413 = 1.0 / _407;
    float _415 = fma(_379, -2.0, _409);
    float _417 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _297);
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _425 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[88].z, _419);
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _429 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[78].w, _421);
    float _431 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[78].z, _423);
    float _433 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _425);
    float _435 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[88].w, _427);
    float _437 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _429);
    float _439 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _431);
    float _441 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _367);
    float _443 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _435);
    float _445 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[89].x, _411);
    float _447 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _381);
    float _449 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _415);
    if (_403)
    {
        float _451 = _391 * _413;
        _139 = _451;
    }
    float _453 = _139;
    float _455 = floor(_353);
    bool _457 = !_201;
    float _459 = _457 ? (-0.5) : 0.5;
    float _461 = _179 * 2.0;
    float _463 = fma(_187, (*spvDescriptorSet0.vp_c10)._m0[5].z, _295);
    bool _465 = _293 != 0;
    float _467 = fma(_187, (*spvDescriptorSet0.vp_c10)._m0[4].z, _263);
    int _469 = _335 ? 0 : 1;
    float _471 = floor(_461);
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _475 = _473 != 0;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _479 = _477 != 0;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _483 = _481 != 0;
    float _485 = _463 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _487 = _179 > 0.5;
    float _489 = fma(_187, (*spvDescriptorSet0.vp_c10)._m0[6].z, _305);
    float _491 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _493 = _485 + _491;
    float _495 = -_459;
    int _497 = _487 ? as_type<int>(_495) : as_type<int>(_459);
    float _499 = _489 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _501 = !_205;
    float _503 = _501 ? (-0.5) : 0.5;
    float _505 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    int _507 = ~_469;
    int _509 = _507 + 1;
    int _511 = _509 + 1;
    float _513 = _493 * _493;
    int _515 = _511;
    if (!_321)
    {
        int _517 = ~_469;
        int _519 = _517 + 1;
        _515 = _519;
    }
    int _521 = _515;
    float _523 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _525 = _499 + _523;
    bool _527 = !_479;
    float _529 = _527 ? _459 : as_type<float>(_497);
    float _531 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _533 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _535 = precise::max(_531, _533);
    bool _537 = _455 > 0.0;
    bool _539 = _455 >= 0.0;
    bool _541 = isnan(_455);
    bool _543 = _539 || _541;
    bool _545 = isnan(0.0);
    bool _547 = _543 || _545;
    float _549 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].x, _193);
    float _551 = -_503;
    int _553 = _465 ? as_type<int>(_551) : as_type<int>(_503);
    bool _555 = _535 >= 16.0;
    float _557 = floor(_549);
    bool _559 = !_475;
    float _561 = _559 ? _503 : as_type<float>(_553);
    float _563 = _179 + _171;
    bool _565 = _471 > 0.0;
    bool _567 = _471 >= 0.0;
    bool _569 = isnan(_471);
    bool _571 = _567 || _569;
    bool _573 = isnan(0.0);
    bool _575 = _571 || _573;
    float _577 = _165 + _171;
    float _579 = _563 + (-1.0);
    float _581 = _577 + (-1.0);
    int _583 = _575 ? 0 : 1;
    bool _585 = _171 > 0.5;
    float _587 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _589 = _165 + _179;
    float _591 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _593 = ~_583;
    int _595 = _593 + 1;
    int _597 = _595 + 1;
    float _599 = -_557;
    float _601 = _549 + _599;
    int _603 = _597;
    if (!_565)
    {
        int _605 = ~_583;
        int _607 = _605 + 1;
        _603 = _607;
    }
    int _609 = _603;
    float _611 = _589 + (-1.0);
    float _613 = _549 * 6.283185482025146484375;
    float _615 = -_503;
    int _617 = _585 ? as_type<int>(_615) : as_type<int>(_503);
    float _619 = _613 * 0.15915493667125701904296875;
    int _621 = _547 ? 0 : 1;
    float _623 = _467 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _627 = _625 != 0;
    int _629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _631 = _629 != 0;
    float _633 = _619 * 6.283185482025146484375;
    float _635 = cos(_633);
    float _637 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _639 = _623 + _637;
    bool _641 = !_483;
    float _643 = _641 ? _503 : as_type<float>(_617);
    int _645 = ~_621;
    int _647 = _645 + 1;
    int _649 = _647 + 1;
    float _651 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    int _653 = _649;
    float _655 = as_type<float>(_609);
    float _657 = _623;
    if (!_537)
    {
        int _659 = ~_621;
        int _661 = _659 + 1;
        _653 = _661;
    }
    int _663 = _653;
    float _665 = fma(_639, _639, _513);
    int _667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _669 = _667 != 0;
    int _671 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _673 = _671 != 0;
    int _675 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _677 = _675 != 0;
    float _679 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].y, _207);
    float _681 = _555 ? _505 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _683 = fma(_525, _525, _665);
    float _685 = floor(_679);
    float _687 = _555 ? _651 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _689 = abs(_681);
    bool _691 = _689 != 0.0;
    bool _693 = isnan(_689);
    bool _695 = _691 || _693;
    bool _697 = isnan(0.0);
    bool _699 = _695 || _697;
    float _701 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _703 = !_627;
    int _705 = _703 ? 0 : 1;
    bool _707 = !_669;
    int _709 = _707 ? 0 : 1;
    float _711 = abs(_687);
    bool _713 = _711 == 0.0;
    bool _715 = !_699;
    bool _717 = _713 && _715;
    int _719 = abs(_709);
    float _721 = rsqrt(_683);
    float _723 = abs(_687);
    bool _725 = _723 == 0.0;
    bool _727 = !_677;
    int _729 = _727 ? 0 : 1;
    bool _731 = _601 < 0.5;
    float _733 = float(_731);
    float _735 = -_601;
    float _737 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _739 = !_631;
    int _741 = _739 ? 0 : 1;
    float _743 = fma(_635, 0.5, 0.5);
    int _745 = abs(_729);
    float _747 = -_733;
    float _749 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _751 = _631;
    int _753 = as_type<int>(_683);
    if (_717)
    {
        bool _755 = as_type<int>(_687) >= 0;
        _751 = _755;
    }
    bool _757 = _751;
    float _759 = float(_521);
    float _761 = -_743;
    float _763 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _765 = float(_719);
    float _767 = _493 * _721;
    int _769 = _757 ? (-1) : 0;
    if (_717)
    {
        int _771 = _757 ? 0 : 1078530011;
        _753 = _771;
    }
    int _773 = _753;
    float _775 = _765 * _759;
    float _777 = float(_609);
    bool _779 = !_673;
    int _781 = _779 ? 0 : 1;
    float _783 = float(_745);
    int _785 = _773;
    if (_717)
    {
        int _787 = int(0x80000000) & as_type<int>(_681);
        int _789 = _773 | _787;
        _655 = as_type<float>(_789);
    }
    float _791 = _655;
    bool _793 = !_699;
    bool _795 = _793 && _725;
    float _797 = _791;
    float _799 = _791;
    if (!_795)
    {
        float _801 = abs(_681);
        bool _803 = _801 != as_type<float>(0x7f800000u /* inf */);
        bool _805 = isnan(_801);
        bool _807 = _803 || _805;
        bool _809 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _811 = _807 || _809;
        float _813 = abs(_687);
        bool _815 = _813 == as_type<float>(0x7f800000u /* inf */);
        float _817 = abs(_687);
        bool _819 = _817 == as_type<float>(0x7f800000u /* inf */);
        bool _821 = !_811;
        bool _823 = _819 && _821;
        if (_823)
        {
            bool _825 = as_type<int>(_687) >= 0;
            _769 = _825 ? (-1) : 0;
        }
        int _827 = _769;
        if (_823)
        {
            _785 = 1075235812;
        }
        int _829 = _785;
        int _831 = _829;
        if (_823)
        {
            int _833 = ~_827;
            int _835 = (_833 != 0) ? _829 : 1061752795;
            _831 = _835;
        }
        int _837 = _831;
        if (_823)
        {
            int _839 = int(0x80000000) & as_type<int>(_681);
            int _841 = _837 | _839;
            _797 = as_type<float>(_841);
        }
        float _843 = _797;
        bool _845 = !_811;
        bool _847 = _845 && _815;
        _799 = _843;
        if (!_847)
        {
            float _849 = abs(_681);
            float _851 = abs(_687);
            float _853 = precise::max(_849, _851);
            float _855 = abs(_681);
            float _857 = abs(_687);
            float _859 = precise::min(_855, _857);
            float _861 = 1.0 / _853;
            float _863 = abs(_681);
            float _865 = abs(_687);
            bool _867 = _863 > _865;
            bool _869 = as_type<int>(_687) >= 0;
            float _871 = _859 * _861;
            float _873 = abs(_681);
            float _875 = abs(_687);
            float _877 = _873 + _875;
            int _879 = as_type<int>(_681) & int(0x80000000);
            float _881 = _871 * _871;
            bool _883 = _877 > as_type<float>(0x7f800000u /* inf */);
            bool _885 = isnan(_877);
            bool _887 = _883 || _885;
            bool _889 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _891 = _887 || _889;
            float _893 = _881 + 11.33538818359375;
            float _895 = fma(_881, _893, 28.84246826171875);
            float _897 = fma(_881, _895, 19.6966705322265625);
            float _899 = fma(_881, -0.82336294651031494140625, -5.674867153167724609375);
            float _901 = fma(_881, _899, -6.565555095672607421875);
            float _903 = 1.0 / _897;
            float _905 = _881 * _901;
            float _907 = _871 * _905;
            float _909 = fma(_907, _903, _871);
            float _911 = _909;
            _799 = _877;
            if (_867)
            {
                float _913 = -_909;
                float _915 = _913 + 1.57079637050628662109375;
                _911 = _915;
            }
            float _917 = _911;
            int _919 = as_type<int>(_917);
            if (!_869)
            {
                float _921 = -_917;
                float _923 = _921 + 3.1415927410125732421875;
                _919 = as_type<int>(_923);
            }
            int _925 = _919;
            if (!_891)
            {
                int _927 = _879 | _925;
                _799 = as_type<float>(_927);
            }
        }
    }
    float _929 = _799;
    float _931 = _639 * _721;
    float _933 = -_767;
    float _935 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[18].w, _493);
    float _937 = -_685;
    float _939 = _679 + _937;
    float _941 = _783 * _777;
    float _943 = -_931;
    float _945 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[18].w, _639);
    float _947 = _935 * _935;
    float _949 = _679 * 6.283185482025146484375;
    int _951 = abs(_781);
    float _953 = _775 * (-2.0);
    float _955 = fma(_945, _945, _947);
    float _957 = _949 * 0.15915493667125701904296875;
    float _959 = float(_663);
    float _961 = fma(_701, _953, _701);
    float _963 = float(_951);
    float _965 = _941 * (-2.0);
    float _967 = _165 + (-0.5);
    float _969 = _525 * _721;
    int _971 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _973 = _971 != 0;
    float _975 = _963 * _959;
    float _977 = fma(_587, _965, _587);
    float _979 = _967 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _981 = _179 + (-0.5);
    float _983 = _975 * (-2.0);
    float _985 = -_969;
    float _987 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[18].w, _525);
    float _989 = fma(_961, _453, _979);
    float _991 = _981 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _993 = fma(_591, _983, _591);
    bool _995 = !_973;
    int _997 = _995 ? 0 : 1;
    float _999 = _957 * 6.283185482025146484375;
    float _1001 = cos(_999);
    float _1003 = fma(_987, _987, _955);
    float _1005 = _989 * 0.15915493667125701904296875;
    float _1007 = fma(_993, _453, _991);
    int _1009 = abs(_997);
    float _1011 = _171 + (-0.5);
    float _1013 = in.m_58.x;
    float _1015 = in.m_58.y;
    float _1017 = _1007 + _929;
    float _1019 = _1011 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    int _1021 = abs(_705);
    float _1023 = sqrt(_1003);
    bool _1025 = _939 < 0.5;
    float _1027 = float(_1025);
    float _1029 = fma(_977, _453, _1019);
    int _1031 = abs(_741);
    float _1033 = -_939;
    float _1035 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _1037 = fma(_1001, 0.5, 0.5);
    float _1039 = float(_1021);
    float _1041 = -_1027;
    float _1043 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _1045 = float(_1009);
    float _1047 = -_1037;
    float _1049 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _1051 = _1005 * 6.283185482025146484375;
    float _1053 = sin(_1051);
    float _1055 = abs(_1035);
    float _1057 = _1039 * _1055;
    float _1059 = _1029 * 0.15915493667125701904296875;
    float _1061 = fma(_1045, _1049, _1057);
    float _1063 = _721 * _1023;
    float _1065 = _1005 * 6.283185482025146484375;
    float _1067 = cos(_1065);
    float _1069 = _1015 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1071 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1073 = _1059 * 6.283185482025146484375;
    float _1075 = cos(_1073);
    float _1077 = _1017 * 0.15915493667125701904296875;
    float _1079 = abs(_737);
    float _1081 = _1039 * _1079;
    float _1083 = float(_1031);
    float _1085 = fma(_1045, _763, _1081);
    float _1087 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _503);
    float _1089 = abs(_1043);
    float _1091 = fma(_1083, _1089, _1061);
    float _1093 = _1077 * 6.283185482025146484375;
    float _1095 = sin(_1093);
    float _1097 = abs(_749);
    float _1099 = fma(_1083, _1097, _1085);
    float _1101 = _1091 * _1069;
    float _1103 = _1099 * _1071;
    float _1105 = _1101 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1107 = _1077 * 6.283185482025146484375;
    float _1109 = cos(_1107);
    float _1111 = _1103 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1113 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _459);
    float _1115 = _1063 * _1105;
    float _1117 = _1053 * _1075;
    float _1119 = _1063 * _1111;
    float _1121 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1123 = _1121 * 0.5;
    float _1125 = _1115 * _1087;
    float _1127 = _1059 * 6.283185482025146484375;
    float _1129 = sin(_1127);
    float _1131 = _1067 * _1095;
    float _1133 = _1053 * _1095;
    float _1135 = _1119 * _1113;
    float _1137 = _1117 * _1125;
    float _1139 = _1053 * _1109;
    float _1141 = _1067 * _1109;
    float _1143 = _1109 * _1075;
    float _1145 = _1067 * _1075;
    float _1147 = -_1131;
    float _1149 = fma(_1129, _1139, _1147);
    float _1151 = -_1125;
    float _1153 = _1129 * _1151;
    float _1155 = fma(_1129, _1133, _1141);
    float _1157 = fma(_1129, _1141, _1133);
    float _1159 = fma(_1149, _1135, _1137);
    float _1161 = _1095 * _1075;
    float _1163 = fma(_1143, _1135, _1153);
    float _1165 = _1145 * _1125;
    float _1167 = fma(_1155, _1123, _1159);
    float _1169 = -_1139;
    float _1171 = fma(_1129, _1131, _1169);
    float _1173 = fma(_1161, _1123, _1163);
    float _1175 = fma(_1157, _1135, _1165);
    float _1177 = _499 + _1167;
    float _1179 = _623 + _1173;
    float _1181 = fma(_1171, _1123, _1175);
    float _1183 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1185 = _1177 + _1183;
    float _1187 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1189 = _1179 + _1187;
    float _1191 = _485 + _1181;
    float _1193 = _1185 * _1185;
    float _1195 = fma(_1189, _1189, _1193);
    float _1197 = sqrt(_1195);
    bool _1199 = _1197 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1201 = _1181;
    float _1203 = _1175;
    float _1205 = _1139;
    float _1207 = _931;
    float _1209 = _969;
    float _1211 = _1077;
    float _1213 = _1057;
    if (!_1199)
    {
        _1201 = _1179;
    }
    float _1215 = _1201;
    float _1217 = _1215;
    if (!_1199)
    {
        _1203 = _1177;
    }
    float _1219 = _1203;
    float _1221 = _1219;
    if (!_1199)
    {
        _1205 = _1191;
    }
    float _1223 = _1205;
    bool _1225 = !_1199;
    float _1227 = _1223;
    if (!_1225)
    {
        float _1229 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1231 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1233 = _1197 + _1231;
        float _1235 = rsqrt(_1195);
        float _1237 = _1233 * _1229;
        float _1239 = _1191 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1241 = _1237 * 0.15915493667125701904296875;
        float _1243 = _1241 * 6.283185482025146484375;
        float _1245 = sin(_1243);
        float _1247 = _1241 * 6.283185482025146484375;
        float _1249 = cos(_1247);
        float _1251 = fma(_1245, _1239, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1253 = _1235 * _1251;
        float _1255 = _1249 + (-1.0);
        float _1257 = fma(_1189, _1253, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1259 = fma(_1185, _1253, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1261 = _1255 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1263 = fma(_1191, _1249, _1261);
        _1227 = _1263;
        _1217 = _1257;
        _1221 = _1259;
    }
    float _1265 = _1227;
    float _1267 = _1217;
    float _1269 = _1221;
    float _1271 = -_767;
    float _1273 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1265);
    float _1275 = -_931;
    float _1277 = fma(_1275, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1267);
    float _1279 = -_969;
    float _1281 = fma(_1279, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1269);
    float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1285 = _1273 + _1283;
    float _1287 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1289 = _1277 + _1287;
    float _1291 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1293 = _1281 + _1291;
    float _1295 = -_931;
    float _1297 = fma(_1295, (*spvDescriptorSet0.vp_c9)._m0[18].w, _623);
    float _1299 = _1285 * _1285;
    float _1301 = -_969;
    float _1303 = fma(_1301, (*spvDescriptorSet0.vp_c9)._m0[18].w, _499);
    float _1305 = fma(_1289, _1289, _1299);
    float _1307 = fma(_1293, _1293, _1305);
    float _1309 = rsqrt(_1307);
    float _1311 = sqrt(_1307);
    float _1313 = _1309 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1315 = _1289 * _1313;
    float _1317 = _1293 * _1313;
    float _1319 = _1315 * _1315;
    float _1321 = _1317 * _1317;
    float _1323 = _1319 + _1321;
    float _1325 = sqrt(_1323);
    bool _1327 = _1325 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1329 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1331 = _1325 + _1329;
    float _1333 = _775;
    float _1335 = _1331;
    float _1337 = _1285;
    float _1339 = _1319;
    float _1341 = _1321;
    if (_1327)
    {
        float _1343 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1333 = _1343;
    }
    float _1345 = _1333;
    if (!_1327)
    {
        _1207 = _1315;
    }
    float _1347 = _1207;
    float _1349 = _1347;
    if (!_1327)
    {
        _1209 = _1317;
    }
    float _1351 = _1209;
    float _1353 = _1351;
    if (_1327)
    {
        float _1355 = rsqrt(_1323);
        _1211 = _1355;
    }
    float _1357 = _1211;
    if (_1327)
    {
        float _1359 = _1331 * _1345;
        _1335 = _1359;
    }
    float _1361 = _1335;
    if (_1327)
    {
        float _1363 = _1361 * 0.15915493667125701904296875;
        _1213 = _1363;
    }
    float _1365 = _1213;
    float _1367 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1369 = _1123;
    if (_1327)
    {
        float _1371 = _1365 * 6.283185482025146484375;
        float _1373 = sin(_1371);
        _1369 = _1373;
    }
    float _1375 = _1369;
    float _1377 = precise::max(0.0, _1367);
    float _1379 = -_1313;
    float _1381 = -_1377;
    float _1383 = fma(_1285, _1379, _1381);
    float _1385 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    if (_1327)
    {
        float _1387 = _1365 * 6.283185482025146484375;
        float _1389 = cos(_1387);
        _1385 = _1389;
    }
    float _1391 = _1385;
    float _1393 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1327)
    {
        float _1395 = _1383 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1337 = _1395;
    }
    float _1397 = _1337;
    float _1399 = _1375;
    if (_1327)
    {
        float _1401 = fma(_1375, _1397, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1399 = _1401;
    }
    float _1403 = _1399;
    float _1405 = fma(_1297, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1407 = _1403;
    if (!_1327)
    {
        _1393 = _1383;
    }
    float _1409 = _1393;
    float _1411 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1413 = _1409;
    if (_1327)
    {
        float _1415 = _1357 * _1403;
        _1407 = _1415;
    }
    float _1417 = _1407;
    float _1419 = floor(_1405);
    float _1421 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1411);
    if (_1327)
    {
        float _1423 = _1391 + (-1.0);
        _657 = _1423;
    }
    float _1425 = _657;
    float _1427 = _1425;
    if (_1327)
    {
        float _1429 = _1315 * _1417;
        _1349 = _1429;
    }
    float _1431 = _1349;
    if (_1327)
    {
        float _1433 = _1317 * _1417;
        _1353 = _1433;
    }
    float _1435 = _1353;
    float _1437 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1327)
    {
        float _1439 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1427 = _1439;
    }
    float _1441 = _1427;
    if (_1327)
    {
        float _1443 = _1431 * _1431;
        _1339 = _1443;
    }
    float _1445 = _1339;
    if (_1327)
    {
        float _1447 = _1435 * _1435;
        _1341 = _1447;
    }
    float _1449 = _1341;
    float _1451 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1437);
    if (_1327)
    {
        float _1453 = fma(_1383, _1391, _1441);
        _1413 = _1453;
    }
    float _1455 = _1413;
    float _1457 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1459 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1461 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1451);
    float _1463 = fma(_1455, _1455, _1445);
    float _1465 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1457);
    float _1467 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1459);
    float _1469 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1471 = fma(_1311, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1469);
    float _1473 = precise::clamp(_1471, 0.0, 1.0);
    float _1475 = _1463 + _1449;
    float _1477 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1421);
    float _1479 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1465);
    float _1481 = _1461 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1483 = -_1473;
    float _1485 = _1483 + 1.0;
    float _1487 = rsqrt(_1475);
    float _1489 = _1477 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1491 = _1479 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1493 = _1481 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1495 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1497 = _1489 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1499 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1467);
    float _1501 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1493);
    float _1503 = abs(_1485);
    float _1505 = log2(_1503);
    float _1507 = -_1497;
    float _1509 = fma(_1507, _1495, 1.0);
    float _1511 = _1499 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1513 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1501);
    float _1515 = _1487 * _1431;
    float _1517 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1513);
    float _1519 = _1487 * _1455;
    float _1521 = fma(_1303, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1523 = _1515 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1525 = _1487 * _1435;
    float _1527 = 1.0 / _1517;
    float _1529 = _1481 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1531 = -_1523;
    float _1533 = fma(_1519, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1531);
    float _1535 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1537 = -_1419;
    float _1539 = _1405 + _1537;
    float _1541 = _1481 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1543 = -_1525;
    float _1545 = fma(_1543, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1533);
    float _1547 = floor(_1521);
    float _1549 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1541);
    float _1551 = fma(_1545, -0.5, 0.5);
    float _1553 = fma(_1545, 0.5, 0.5);
    float _1555 = _1519 + 1.0;
    float _1557 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1549);
    float _1559 = exp2(_1535);
    float _1561 = sqrt(_1551);
    float _1563 = -_1547;
    float _1565 = _1521 + _1563;
    float _1567 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1529);
    float _1569 = fma(_1553, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1571 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1567);
    float _1573 = fma(_1553, _1569, -0.212114393711090087890625);
    float _1575 = log2(_1509);
    float _1577 = -_1519;
    float _1579 = fma(_1559, _1555, _1577);
    float _1581 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1557);
    float _1583 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1571);
    float _1585 = fma(_1553, _1573, 1.570728778839111328125);
    float _1587 = _1581 * _1527;
    float _1589 = _1583 * _1527;
    float _1591 = _1561 * 0.636619746685028076171875;
    float _1593 = fma(_1587, 0.5, 0.5);
    float _1595 = fma(_1589, -0.5, 0.5);
    float _1597 = -_1585;
    float _1599 = fma(_1591, _1597, 1.0);
    float _1601 = fma(_1579, 0.5, 0.5);
    float _1603 = _1575 * 0.693147182464599609375;
    float2 _4811 = float2(_1539, _1565);
    float _1605 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4811, float2(0.0), isnan(_4811)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4811, float2(0.0), isnan(_4811)), level(0.0)).x;
    float _1607 = _1603 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _4826 = float3(_1593, _1595, _1607);
    float _1609 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4826, float3(0.0), isnan(_4826)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4826, float3(0.0), isnan(_4826)), level(0.0)).x;
    float3 _4837 = float3(_1593, _1595, _1607);
    float4 _1612 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4837, float3(0.0), isnan(_4837)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4837, float3(0.0), isnan(_4837)), level(0.0)).xyzw;
    float _1614 = _1612.x;
    float _1616 = _1612.y;
    float _1618 = _1612.z;
    float _1620 = _1612.w;
    float2 _4853 = float2(_1599, _1601);
    float3 _1624 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4853, float2(0.0), isnan(_4853)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4853, float2(0.0), isnan(_4853)), level(0.0)).xyz;
    float _1626 = _1624.x;
    float _1628 = _1624.y;
    float _1630 = _1624.z;
    float _1632 = -_767;
    float _1634 = fma(_1632, (*spvDescriptorSet0.vp_c9)._m0[18].w, _485);
    float _1636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1638 = _165 > 0.5;
    float _1640 = -_437;
    float _1642 = _1640 + 1.0;
    float _1644 = _1634 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1648 = _1646 != 0;
    float _1650 = -_417;
    float _1652 = _1650 + 1.0;
    float _1654 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1644);
    float _1656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1658 = -_439;
    float _1660 = _1658 + 1.0;
    float _1662 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1654);
    float _1664 = _1634 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1666 = -_459;
    int _1668 = _1638 ? as_type<int>(_1666) : as_type<int>(_459);
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1672 = _1662 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1674 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1664);
    float _1676 = _1636 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1678 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1680 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1674);
    bool _1682 = !_1648;
    float _1684 = _1682 ? _459 : as_type<float>(_1668);
    float _1686 = _1670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1688 = _179 > 0.5;
    float _1690 = _1680 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1692 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1694 = 1.0 / _1672;
    float _1696 = _1684 + 0.5;
    float _1698 = _1690 + _1672;
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1702 = _1700 != 0;
    float _1704 = _1692 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1706 = fma(_1676, _1696, _359);
    float _1708 = -_503;
    int _1710 = _1688 ? as_type<int>(_1708) : as_type<int>(_503);
    float _1712 = -_441;
    float _1714 = _1712 + 1.0;
    int _1716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1718 = _1716 != 0;
    float _1720 = _445 * (-0.15915493667125701904296875);
    float _1722 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1724 = !_1702;
    float _1726 = _1724 ? _503 : as_type<float>(_1710);
    float _1728 = _1678 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1730 = -_1660;
    float _1732 = fma(_1684, _1730, _1706);
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1736 = _1698 * _1694;
    float _1738 = _1736 * 0.5;
    float _1740 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1742 = _1720 * 6.283185482025146484375;
    float _1744 = sin(_1742);
    float _1746 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1748 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1746);
    float _1750 = -_459;
    int _1752 = _585 ? as_type<int>(_1750) : as_type<int>(_459);
    float _1754 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1756 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1758 = isnan(0.5);
    bool _1760 = _1756 || _1758;
    bool _1762 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1764 = _1760 || _1762;
    bool _1766 = !_1718;
    float _1768 = _1766 ? _459 : as_type<float>(_1752);
    float _1770 = _1754 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1772 = 1.0 / _1748;
    float _1774 = _1722 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1776 = _459 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_60.x = _1770;
    out.m_60.y = _1704;
    out.m_60.z = _1686;
    out.m_60.w = _1734;
    float _1778 = _1720 * 6.283185482025146484375;
    float _1780 = cos(_1778);
    float _1782 = _643 * _1744;
    float _1784 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1786 = _1656 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1788 = _1726 + (-0.5);
    float _1790 = _1768 + 0.5;
    float _1792 = -_1786;
    float _1794 = -_347;
    float _1796 = fma(_1792, _1788, _1794);
    float _1798 = fma(_1728, _1790, _389);
    float _1800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1804 = _1772 * _1802;
    float _1806 = _643 * _1780;
    float _1808 = -_1782;
    float _1810 = fma(_529, _1780, _1808);
    float _1812 = _561 + (-0.5);
    float _1814 = fma(_1726, _1642, _1796);
    float _1816 = fma(_529, _1744, _1806);
    float _1818 = _1810 + 0.5;
    float _1820 = abs(_1804);
    float _1822 = log2(_1820);
    float _1824 = _1784 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1826 = _1816 + (-0.5);
    float _1828 = fma(_1774, _1818, _385);
    float _1830 = -_433;
    float _1832 = _1830 + 1.0;
    float _1834 = -_1824;
    float _1836 = -_449;
    float _1838 = fma(_1834, _1826, _1836);
    float _1840 = -_503;
    float _1842 = _1840 + 0.5;
    float _1844 = _1800 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1846 = -_1832;
    float _1848 = fma(_1810, _1846, _1828);
    float _1850 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1852 = -_1844;
    float _1854 = -_447;
    float _1856 = fma(_1852, _1812, _1854);
    out.m_62.y = _1842;
    float _1858 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1860 = _1822 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1864 = _1850 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1866 = fma(_561, _1714, _1856);
    float _1868 = _503 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1870 = exp2(_1860);
    float _1872 = _1862 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1874 = _1858 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1876 = -_443;
    float _1878 = _1876 + 1.0;
    float _1880 = -_1652;
    float _1882 = fma(_1768, _1880, _1798);
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1886 = _1117 * _1868;
    float _1888 = fma(_1816, _1878, _1838);
    out.m_64.x = _1732;
    out.m_64.y = _1814;
    out.m_64.z = _1882;
    out.m_64.w = _1866;
    float _1890 = exp2(_1740);
    bool _1892 = _1804 <= 8000.0;
    bool _1894 = isnan(_1804);
    bool _1896 = _1892 || _1894;
    bool _1898 = isnan(8000.0);
    bool _1900 = _1896 || _1898;
    float _1902 = float(_1900);
    out.m_66.x = _1864;
    out.m_66.y = _1872;
    out.m_66.z = _1874;
    out.m_66.w = _1884;
    float _1904 = fma(_1149, _1776, _1886);
    float _1906 = -_1868;
    float _1908 = _1129 * _1906;
    float _1910 = fma(_1870, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1912 = precise::clamp(_1910, 0.0, 1.0);
    out.m_68.x = _1848;
    out.m_68.y = _1888;
    float _1914 = _1145 * _1868;
    float _1916 = in.m_70.x;
    float _1918 = _1517 * 0.5;
    float _1920 = fma(_1143, _1776, _1908);
    float _1922 = fma(_1157, _1776, _1914);
    float _1924 = fma(_1912, -2.0, 3.0);
    float _1926 = _1912 * _1912;
    float _1928 = _1481 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1930 = _1926 * _1924;
    float _1932 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1928);
    float _1934 = _1581 + _1517;
    float _1936 = -_1930;
    float _1938 = _1936 + 1.0;
    float _1940 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1932);
    float _1942 = _1934 * 0.5;
    float _1944 = fma(_1938, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1930);
    float _1946 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1940);
    float _1948 = fma(_1583, -0.5, _1918);
    float _1950 = _1902 * _1944;
    float _1952 = _1946 + _1517;
    float _1954 = _1902;
    float _1956 = _1517;
    float _1958 = _1946;
    float _1960 = _1948;
    float _1962 = _1942;
    if (_1764)
    {
        _1954 = 1.0;
    }
    float _1964 = _1954;
    float _1966 = _1952 * 0.5;
    float _1968 = _1964;
    if (!_1764)
    {
        float _1970 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1972 = _1970 * 0.15915493667125701904296875;
        float _1974 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1976 = _1972 * 6.283185482025146484375;
        float _1978 = cos(_1976);
        float _1980 = _1974 * 0.15915493667125701904296875;
        float _1982 = _1972 * 6.283185482025146484375;
        float _1984 = sin(_1982);
        float _1986 = 1.0 / _1978;
        float _1988 = _1980 * 6.283185482025146484375;
        float _1990 = cos(_1988);
        float _1992 = _1984 * _1986;
        float _1994 = _1980 * 6.283185482025146484375;
        float _1996 = sin(_1994);
        float _1998 = _1990 * _1992;
        float _2000 = 1.0 / _1998;
        float _2002 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2004 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2002;
        float _2006 = 1.0 / _2004;
        float _2008 = _1996 * _2000;
        float _2010 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2012 = fma(_1804, _2008, _2010);
        float _2014 = _2012 * _2006;
        float _2016 = precise::clamp(_2014, 0.0, 1.0);
        _1968 = _2016;
    }
    float _2018 = _1968;
    float _2020 = -_1890;
    float _2022 = _2020 + 1.0;
    float _2024 = _1950 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2026 = -_1605;
    float _2028 = _2026 + 1.0;
    float _2030 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1581;
    out.gl_Position.y = _1583;
    out.gl_Position.z = _1946;
    out.gl_Position.w = _1517;
    float _2032 = _2028 * _2024;
    float _2034 = precise::clamp(_2032, 0.0, 1.0);
    float _2036 = _1161 + _1920;
    float _2038 = _2030 * _1609;
    float _2040 = -_2030;
    float _2042 = _2040 + 1.0;
    float _2044 = _1171 + _1922;
    float _2046 = _1155 + _1904;
    float _2048 = _1630 * _2038;
    out.m_72.x = _1277;
    out.m_72.y = _1273;
    out.m_72.z = _1281;
    bool _2050 = _1311 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2052 = isnan(_1311);
    bool _2054 = _2050 || _2052;
    bool _2056 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2058 = _2054 || _2056;
    out.m_74.x = _2036;
    out.m_74.y = _2044;
    out.m_74.z = _2046;
    float _2060 = _1620 * _2038;
    float _2062 = -_2034;
    float _2064 = fma(_2062, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2066 = _1620 * _2042;
    float _2068 = fma(_1620, _2048, _1618);
    float _2070 = fma(_1626, _2060, _1614);
    float _2072 = fma(_1628, _2060, _1616);
    float _2074 = _2064 * _1916;
    out.m_76.x = _1942;
    out.m_76.y = _1948;
    out.m_76.z = _1966;
    out.m_76.w = _1517;
    float _2076 = _2060;
    if (!_2058)
    {
        _1956 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2078 = _1956;
    float _2080 = _2074 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_78.x = _2070;
    out.m_78.y = _2072;
    out.m_78.z = _2068;
    out.m_78.w = _2066;
    float _2082 = _2080;
    float _2084 = _2078;
    float _2086 = _2078;
    if (!_2058)
    {
        _1958 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2088 = _1958;
    float _2090 = _2088;
    float _2092 = _2088;
    if (!_2058)
    {
        _2076 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2094 = _2076;
    out.m_80.x = _2080;
    float _2096 = _2018 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2098 = _2094;
    float _2100 = _2094;
    if (!_2058)
    {
        _1960 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2102 = _1960;
    float _2104 = _2102;
    float _2106 = _2102;
    if (!_2058)
    {
        _1962 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2108 = _1962;
    float _2110 = _2108;
    float _2112 = _2108;
    if (!_2058)
    {
        _2082 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2114 = _2082;
    bool _2116 = !_2058;
    float _2118 = _2114;
    float _2120 = _2114;
    if (!_2116)
    {
        bool _2122 = _1311 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2124 = isnan(_1311);
        bool _2126 = _2122 || _2124;
        bool _2128 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2130 = _2126 || _2128;
        if (!_2130)
        {
            float _2132 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2134 = _1311 + _2132;
            float _2136 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2138 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2136;
            float _2140 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2142 = _2140 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2144 = 1.0 / _2138;
            float _2146 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2148 = _2146 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2150 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2152 = _2150 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2154 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2156 = _2154 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2158 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2160 = _2158 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2162 = _2134 * _2144;
            float _2164 = precise::clamp(_2162, 0.0, 1.0);
            float _2166 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2168 = _2166 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2170 = fma(_2164, _2142, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2172 = fma(_2164, _2168, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2174 = fma(_2164, _2148, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2176 = fma(_2164, _2152, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2178 = fma(_2164, _2156, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2180 = fma(_2164, _2160, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2112 = _2174;
            _2100 = _2178;
            _2106 = _2170;
            _2092 = _2176;
            _2086 = _2172;
            _2120 = _2180;
            _2182 = true;
        }
        else
        {
            bool _2184 = _1311 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2186 = isnan(_1311);
            bool _2188 = _2184 || _2186;
            bool _2190 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2192 = _2188 || _2190;
            if (!_2192)
            {
                _2104 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2194 = _2104;
            _2106 = _2194;
            if (!_2192)
            {
                _2110 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2196 = _2110;
            _2112 = _2196;
            if (!_2192)
            {
                _2084 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2198 = _2084;
            _2086 = _2198;
            if (!_2192)
            {
                _2090 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2200 = _2090;
            _2092 = _2200;
            if (!_2192)
            {
                _2098 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2202 = _2098;
            _2100 = _2202;
            if (!_2192)
            {
                _2118 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2204 = _2118;
            bool _2206 = !_2192;
            _2120 = _2204;
            if (!_2206)
            {
                bool _2208 = _1311 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2210 = isnan(_1311);
                bool _2212 = _2208 || _2210;
                bool _2214 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2216 = _2212 || _2214;
                if (!_2216)
                {
                    float _2218 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2220 = _1311 + _2218;
                    float _2222 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2224 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2222;
                    float _2226 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2228 = _2226 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2230 = 1.0 / _2224;
                    float _2232 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2234 = _2232 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2236 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2238 = _2236 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2240 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2242 = _2240 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2244 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2246 = _2244 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2248 = _2220 * _2230;
                    float _2250 = precise::clamp(_2248, 0.0, 1.0);
                    float _2252 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2254 = _2252 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2256 = fma(_2250, _2228, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2258 = fma(_2250, _2254, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2260 = fma(_2250, _2234, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2262 = fma(_2250, _2238, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2264 = fma(_2250, _2242, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2266 = fma(_2250, _2246, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2112 = _2260;
                    _2100 = _2264;
                    _2106 = _2256;
                    _2092 = _2262;
                    _2086 = _2258;
                    _2120 = _2266;
                    _2182 = true;
                }
                else
                {
                    _2112 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2100 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2106 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2092 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2086 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2120 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2182 = false;
    float _2268 = _2112;
    float _2270 = _2100;
    float _2272 = _2106;
    float _2274 = _2092;
    float _2276 = _2086;
    float _2278 = _2120;
    float _2280 = _2096 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2282 = fma(_2044, -0.5, 0.5);
    float _2284 = precise::clamp(_2282, 0.0, 1.0);
    float _2286 = -_2268;
    float _2288 = _2286 + _2270;
    float _2290 = -_2272;
    float _2292 = _2290 + _2274;
    out.m_82.x = 0.0;
    float _2294 = fma(_2284, _2288, _2268);
    float _2296 = -_2276;
    float _2298 = _2296 + _2278;
    float _2300 = fma(_2284, _2292, _2272);
    float _2302 = _2294 * 0.586610972881317138671875;
    bool _2304 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2306 = fma(_2284, _2298, _2276);
    out.m_49.x = _2280;
    float _2308 = fma(_2300, 0.298911988735198974609375, _2302);
    bool _2310 = _2018 > 0.0;
    bool _2312 = isnan(_2018);
    bool _2314 = _2310 || _2312;
    bool _2316 = isnan(0.0);
    bool _2318 = _2314 || _2316;
    float _2320 = fma(_2306, 0.114477999508380889892578125, _2308);
    float _2322 = -_2320;
    float _2324 = _2300 + _2322;
    float _2326 = -_2320;
    float _2328 = _2294 + _2326;
    float _2330 = -_2320;
    float _2332 = _2306 + _2330;
    float _2334 = fma(_2324, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2320);
    float _2336 = fma(_2328, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2320);
    float _2338 = fma(_2332, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2320);
    bool _2340 = !_2304;
    if (!_2340)
    {
        float _2342 = -_1273;
        float _2344 = _2342 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2346 = -_1277;
        float _2348 = _2346 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2350 = -_1281;
        float _2352 = _2350 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2354 = _2344 * _2344;
        float _2356 = fma(_2348, _2348, _2354);
        float _2358 = fma(_2352, _2352, _2356);
        float _2360 = sqrt(_2358);
        float _2362 = rsqrt(_2358);
        float _2364 = -_2360;
        float _2366 = _2364 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2368 = _2366 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2370 = precise::clamp(_2368, 0.0, 1.0);
        float _2372 = _2348 * _2362;
        float _2374 = _2344 * _2362;
        float _2376 = abs(_2370);
        float _2378 = log2(_2376);
        float _2380 = _2352 * _2362;
        float _2382 = _2372 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2384 = _2044 * _2374;
        float _2386 = -_2374;
        float _2388 = -_2382;
        float _2390 = fma(_2386, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2388);
        float _2392 = fma(_2036, _2372, _2384);
        float _2394 = -_2380;
        float _2396 = fma(_2394, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2390);
        float _2398 = fma(_2046, _2380, _2392);
        float _2400 = precise::clamp(_2398, 0.0, 1.0);
        float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2404 = _2396 + _2402;
        float _2406 = _2378 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2408 = _2404 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2410 = precise::clamp(_2408, 0.0, 1.0);
        float _2412 = exp2(_2406);
        float _2414 = _2412 * _2410;
        float _2416 = _2400 * _2414;
        float _2418 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2420 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2422 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2418;
        out.m_82.y = _2420;
        out.m_82.z = _2422;
    }
    out.m_84.x = _2334;
    out.m_84.y = _2336;
    out.m_84.z = _2338;
    if (_2318)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2424 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2424;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2182 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    float _111 = as_type<float>(_103);
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _109;
    if (!_107)
    {
        out.m_49.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _113 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2482 = as_type<float>(_119);
        out.gl_Position.z = _2482;
    }
    if (!_107)
    {
        return out;
    }
    float _123 = in.m_51.w;
    bool _125 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_123);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    float _135 = -_123;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _139 = _137;
    if (_133)
    {
        float _141 = float(_103);
        _111 = _141;
    }
    float _143 = _111;
    bool _145 = _137 >= _143;
    bool _147 = !_133;
    bool _149 = _145 || _147;
    float _151 = _143;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _151;
    if (_149)
    {
        out.m_49.x = 0.0;
    }
    if (_149)
    {
        float _155 = _153 * 5.0;
        _121 = as_type<int>(_155);
    }
    int _157 = _121;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2552 = as_type<float>(_157);
        out.gl_Position.z = _2552;
    }
    if (_149)
    {
        return out;
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _163 = _137 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _165 = in.m_56.x;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _169 = _167 != 0;
    float _171 = in.m_56.z;
    float _173 = in.m_56.w;
    float _175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _177 = _137 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _179 = in.m_56.y;
    float _181 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _183 = in.m_46.x;
    float _185 = in.m_46.y;
    float _187 = in.m_46.z;
    float _189 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _191 = log2(_189);
    float _193 = _163 * _161;
    float _195 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _197 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _199 = as_type<int>(_159) & 1;
    bool _201 = _199 != 0;
    int _203 = as_type<int>(_159) & 2;
    bool _205 = _203 != 0;
    float _207 = _177 * _175;
    float _209 = _175;
    if (!_169)
    {
        float _211 = in.m_56.z;
        _209 = _211;
    }
    float _213 = _209;
    float _215 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _217 = _165 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _219 = _171 * 2.0;
    float _221 = _191 * _137;
    bool _223 = _173 > 0.5;
    float _225 = -_181;
    float _227 = fma(_217, 2.0, _225);
    float _229 = _179 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _231 = exp2(_221);
    float _233 = 0.0;
    float _235 = _229;
    float _237 = _183;
    float _239 = _185;
    if (!_169)
    {
        _233 = _179;
    }
    float _241 = _233;
    float _243 = _185 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _245 = fma(_229, -2.0, _197);
    float _247 = _241;
    if (_169)
    {
        _235 = _165;
    }
    float _249 = _235;
    float _251 = _185 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _253 = _249;
    if (!_169)
    {
        _253 = _171;
    }
    float _255 = _253;
    float _257 = _185 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _259 = floor(_219);
    if (_169)
    {
        _247 = _165;
    }
    float _261 = _247;
    float _263 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[4].x, _243);
    float _265 = _255 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _267 = int(_201);
    int _269 = _205 ? 2 : 0;
    int _271 = _267 | _269;
    int _273 = _223 ? 4 : 0;
    int _275 = _271 | _273;
    int _277 = _169 ? 8 : 0;
    int _279 = _275 | _277;
    int _281 = false ? 16 : 0;
    int _283 = _279 | _281;
    int _285 = false ? 32 : 0;
    int _287 = _283 | _285;
    int _289 = false ? 64 : 0;
    int _291 = _287 | _289;
    int _293 = _291 & 4;
    float _295 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[5].x, _251);
    float _297 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[83].z, _215);
    float _299 = -_195;
    float _301 = fma(_265, 2.0, _299);
    float _303 = _261 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _305 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[6].x, _257);
    if (_169)
    {
        _237 = _171;
    }
    float _307 = _237;
    float _309 = -_231;
    float _311 = _309 + 1.0;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _315 = _307;
    if (_169)
    {
        _239 = _179;
    }
    float _317 = _239;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _321 = _259 > 0.0;
    float _323 = -_313;
    float _325 = fma(_303, 2.0, _323);
    bool _327 = _259 >= 0.0;
    bool _329 = isnan(_259);
    bool _331 = _327 || _329;
    bool _333 = isnan(0.0);
    bool _335 = _331 || _333;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _339 = _259;
    float _341 = _213;
    float _343 = _317;
    if (!_169)
    {
        _339 = _213;
    }
    float _345 = _339;
    float _347 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _245);
    float _349 = _345;
    if (_169)
    {
        _349 = _179;
    }
    float _351 = _349;
    float _353 = _165 * 2.0;
    if (_169)
    {
        _341 = _179;
    }
    float _355 = _341;
    float _357 = -_137;
    float _359 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[76].x, _227);
    if (!_169)
    {
        _343 = _165;
    }
    float _361 = _343;
    float _363 = _351 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_169)
    {
        _315 = _179;
    }
    float _365 = _315;
    float _367 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[83].w, _319);
    bool _369 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _371 = isnan(0.0);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _377 = _373 || _375;
    float _379 = _361 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _381 = fma(_363, -2.0, _337);
    float _383 = -_137;
    float _385 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[86].x, _301);
    float _387 = -_137;
    float _389 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[81].x, _325);
    float _391 = _377 ? _311 : 0.0;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    bool _395 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _397 = isnan(1.0);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _403 = _399 || _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _407 = 1.0 + _405;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _411 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[89].z, _393);
    float _413 = 1.0 / _407;
    float _415 = fma(_379, -2.0, _409);
    float _417 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _297);
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _425 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[88].z, _419);
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _429 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[78].w, _421);
    float _431 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[78].z, _423);
    float _433 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _425);
    float _435 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[88].w, _427);
    float _437 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _429);
    float _439 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _431);
    float _441 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _367);
    float _443 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _435);
    float _445 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[89].x, _411);
    float _447 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _381);
    float _449 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _415);
    if (_403)
    {
        float _451 = _391 * _413;
        _139 = _451;
    }
    float _453 = _139;
    float _455 = floor(_353);
    bool _457 = !_201;
    float _459 = _457 ? (-0.5) : 0.5;
    float _461 = _179 * 2.0;
    float _463 = fma(_187, (*spvDescriptorSet0.vp_c10)._m0[5].z, _295);
    bool _465 = _293 != 0;
    float _467 = fma(_187, (*spvDescriptorSet0.vp_c10)._m0[4].z, _263);
    int _469 = _335 ? 0 : 1;
    float _471 = floor(_461);
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _475 = _473 != 0;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _479 = _477 != 0;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _483 = _481 != 0;
    float _485 = _463 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _487 = _179 > 0.5;
    float _489 = fma(_187, (*spvDescriptorSet0.vp_c10)._m0[6].z, _305);
    float _491 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _493 = _485 + _491;
    float _495 = -_459;
    int _497 = _487 ? as_type<int>(_495) : as_type<int>(_459);
    float _499 = _489 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _501 = !_205;
    float _503 = _501 ? (-0.5) : 0.5;
    float _505 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    int _507 = ~_469;
    int _509 = _507 + 1;
    int _511 = _509 + 1;
    float _513 = _493 * _493;
    int _515 = _511;
    if (!_321)
    {
        int _517 = ~_469;
        int _519 = _517 + 1;
        _515 = _519;
    }
    int _521 = _515;
    float _523 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _525 = _499 + _523;
    bool _527 = !_479;
    float _529 = _527 ? _459 : as_type<float>(_497);
    float _531 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _533 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _535 = precise::max(_531, _533);
    bool _537 = _455 > 0.0;
    bool _539 = _455 >= 0.0;
    bool _541 = isnan(_455);
    bool _543 = _539 || _541;
    bool _545 = isnan(0.0);
    bool _547 = _543 || _545;
    float _549 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].x, _193);
    float _551 = -_503;
    int _553 = _465 ? as_type<int>(_551) : as_type<int>(_503);
    bool _555 = _535 >= 16.0;
    float _557 = floor(_549);
    bool _559 = !_475;
    float _561 = _559 ? _503 : as_type<float>(_553);
    float _563 = _179 + _171;
    bool _565 = _471 > 0.0;
    bool _567 = _471 >= 0.0;
    bool _569 = isnan(_471);
    bool _571 = _567 || _569;
    bool _573 = isnan(0.0);
    bool _575 = _571 || _573;
    float _577 = _165 + _171;
    float _579 = _563 + (-1.0);
    float _581 = _577 + (-1.0);
    int _583 = _575 ? 0 : 1;
    bool _585 = _171 > 0.5;
    float _587 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _589 = _165 + _179;
    float _591 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _593 = ~_583;
    int _595 = _593 + 1;
    int _597 = _595 + 1;
    float _599 = -_557;
    float _601 = _549 + _599;
    int _603 = _597;
    if (!_565)
    {
        int _605 = ~_583;
        int _607 = _605 + 1;
        _603 = _607;
    }
    int _609 = _603;
    float _611 = _589 + (-1.0);
    float _613 = _549 * 6.283185482025146484375;
    float _615 = -_503;
    int _617 = _585 ? as_type<int>(_615) : as_type<int>(_503);
    float _619 = _613 * 0.15915493667125701904296875;
    int _621 = _547 ? 0 : 1;
    float _623 = _467 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _627 = _625 != 0;
    int _629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _631 = _629 != 0;
    float _633 = _619 * 6.283185482025146484375;
    float _635 = cos(_633);
    float _637 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _639 = _623 + _637;
    bool _641 = !_483;
    float _643 = _641 ? _503 : as_type<float>(_617);
    int _645 = ~_621;
    int _647 = _645 + 1;
    int _649 = _647 + 1;
    float _651 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    int _653 = _649;
    float _655 = as_type<float>(_609);
    float _657 = _623;
    if (!_537)
    {
        int _659 = ~_621;
        int _661 = _659 + 1;
        _653 = _661;
    }
    int _663 = _653;
    float _665 = fma(_639, _639, _513);
    int _667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _669 = _667 != 0;
    int _671 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _673 = _671 != 0;
    int _675 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _677 = _675 != 0;
    float _679 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].y, _207);
    float _681 = _555 ? _505 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _683 = fma(_525, _525, _665);
    float _685 = floor(_679);
    float _687 = _555 ? _651 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _689 = abs(_681);
    bool _691 = _689 != 0.0;
    bool _693 = isnan(_689);
    bool _695 = _691 || _693;
    bool _697 = isnan(0.0);
    bool _699 = _695 || _697;
    float _701 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _703 = !_627;
    int _705 = _703 ? 0 : 1;
    bool _707 = !_669;
    int _709 = _707 ? 0 : 1;
    float _711 = abs(_687);
    bool _713 = _711 == 0.0;
    bool _715 = !_699;
    bool _717 = _713 && _715;
    int _719 = abs(_709);
    float _721 = rsqrt(_683);
    float _723 = abs(_687);
    bool _725 = _723 == 0.0;
    bool _727 = !_677;
    int _729 = _727 ? 0 : 1;
    bool _731 = _601 < 0.5;
    float _733 = float(_731);
    float _735 = -_601;
    float _737 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _739 = !_631;
    int _741 = _739 ? 0 : 1;
    float _743 = fma(_635, 0.5, 0.5);
    int _745 = abs(_729);
    float _747 = -_733;
    float _749 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _751 = _631;
    int _753 = as_type<int>(_683);
    if (_717)
    {
        bool _755 = as_type<int>(_687) >= 0;
        _751 = _755;
    }
    bool _757 = _751;
    float _759 = float(_521);
    float _761 = -_743;
    float _763 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _765 = float(_719);
    float _767 = _493 * _721;
    int _769 = _757 ? (-1) : 0;
    if (_717)
    {
        int _771 = _757 ? 0 : 1078530011;
        _753 = _771;
    }
    int _773 = _753;
    float _775 = _765 * _759;
    float _777 = float(_609);
    bool _779 = !_673;
    int _781 = _779 ? 0 : 1;
    float _783 = float(_745);
    int _785 = _773;
    if (_717)
    {
        int _787 = int(0x80000000) & as_type<int>(_681);
        int _789 = _773 | _787;
        _655 = as_type<float>(_789);
    }
    float _791 = _655;
    bool _793 = !_699;
    bool _795 = _793 && _725;
    float _797 = _791;
    float _799 = _791;
    if (!_795)
    {
        float _801 = abs(_681);
        bool _803 = _801 != as_type<float>(0x7f800000u /* inf */);
        bool _805 = isnan(_801);
        bool _807 = _803 || _805;
        bool _809 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _811 = _807 || _809;
        float _813 = abs(_687);
        bool _815 = _813 == as_type<float>(0x7f800000u /* inf */);
        float _817 = abs(_687);
        bool _819 = _817 == as_type<float>(0x7f800000u /* inf */);
        bool _821 = !_811;
        bool _823 = _819 && _821;
        if (_823)
        {
            bool _825 = as_type<int>(_687) >= 0;
            _769 = _825 ? (-1) : 0;
        }
        int _827 = _769;
        if (_823)
        {
            _785 = 1075235812;
        }
        int _829 = _785;
        int _831 = _829;
        if (_823)
        {
            int _833 = ~_827;
            int _835 = (_833 != 0) ? _829 : 1061752795;
            _831 = _835;
        }
        int _837 = _831;
        if (_823)
        {
            int _839 = int(0x80000000) & as_type<int>(_681);
            int _841 = _837 | _839;
            _797 = as_type<float>(_841);
        }
        float _843 = _797;
        bool _845 = !_811;
        bool _847 = _845 && _815;
        _799 = _843;
        if (!_847)
        {
            float _849 = abs(_681);
            float _851 = abs(_687);
            float _853 = precise::max(_849, _851);
            float _855 = abs(_681);
            float _857 = abs(_687);
            float _859 = precise::min(_855, _857);
            float _861 = 1.0 / _853;
            float _863 = abs(_681);
            float _865 = abs(_687);
            bool _867 = _863 > _865;
            bool _869 = as_type<int>(_687) >= 0;
            float _871 = _859 * _861;
            float _873 = abs(_681);
            float _875 = abs(_687);
            float _877 = _873 + _875;
            int _879 = as_type<int>(_681) & int(0x80000000);
            float _881 = _871 * _871;
            bool _883 = _877 > as_type<float>(0x7f800000u /* inf */);
            bool _885 = isnan(_877);
            bool _887 = _883 || _885;
            bool _889 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _891 = _887 || _889;
            float _893 = _881 + 11.33538818359375;
            float _895 = fma(_881, _893, 28.84246826171875);
            float _897 = fma(_881, _895, 19.6966705322265625);
            float _899 = fma(_881, -0.82336294651031494140625, -5.674867153167724609375);
            float _901 = fma(_881, _899, -6.565555095672607421875);
            float _903 = 1.0 / _897;
            float _905 = _881 * _901;
            float _907 = _871 * _905;
            float _909 = fma(_907, _903, _871);
            float _911 = _909;
            _799 = _877;
            if (_867)
            {
                float _913 = -_909;
                float _915 = _913 + 1.57079637050628662109375;
                _911 = _915;
            }
            float _917 = _911;
            int _919 = as_type<int>(_917);
            if (!_869)
            {
                float _921 = -_917;
                float _923 = _921 + 3.1415927410125732421875;
                _919 = as_type<int>(_923);
            }
            int _925 = _919;
            if (!_891)
            {
                int _927 = _879 | _925;
                _799 = as_type<float>(_927);
            }
        }
    }
    float _929 = _799;
    float _931 = _639 * _721;
    float _933 = -_767;
    float _935 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[18].w, _493);
    float _937 = -_685;
    float _939 = _679 + _937;
    float _941 = _783 * _777;
    float _943 = -_931;
    float _945 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[18].w, _639);
    float _947 = _935 * _935;
    float _949 = _679 * 6.283185482025146484375;
    int _951 = abs(_781);
    float _953 = _775 * (-2.0);
    float _955 = fma(_945, _945, _947);
    float _957 = _949 * 0.15915493667125701904296875;
    float _959 = float(_663);
    float _961 = fma(_701, _953, _701);
    float _963 = float(_951);
    float _965 = _941 * (-2.0);
    float _967 = _165 + (-0.5);
    float _969 = _525 * _721;
    int _971 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _973 = _971 != 0;
    float _975 = _963 * _959;
    float _977 = fma(_587, _965, _587);
    float _979 = _967 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _981 = _179 + (-0.5);
    float _983 = _975 * (-2.0);
    float _985 = -_969;
    float _987 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[18].w, _525);
    float _989 = fma(_961, _453, _979);
    float _991 = _981 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _993 = fma(_591, _983, _591);
    bool _995 = !_973;
    int _997 = _995 ? 0 : 1;
    float _999 = _957 * 6.283185482025146484375;
    float _1001 = cos(_999);
    float _1003 = fma(_987, _987, _955);
    float _1005 = _989 * 0.15915493667125701904296875;
    float _1007 = fma(_993, _453, _991);
    int _1009 = abs(_997);
    float _1011 = _171 + (-0.5);
    float _1013 = in.m_58.x;
    float _1015 = in.m_58.y;
    float _1017 = _1007 + _929;
    float _1019 = _1011 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    int _1021 = abs(_705);
    float _1023 = sqrt(_1003);
    bool _1025 = _939 < 0.5;
    float _1027 = float(_1025);
    float _1029 = fma(_977, _453, _1019);
    int _1031 = abs(_741);
    float _1033 = -_939;
    float _1035 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _1037 = fma(_1001, 0.5, 0.5);
    float _1039 = float(_1021);
    float _1041 = -_1027;
    float _1043 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _1045 = float(_1009);
    float _1047 = -_1037;
    float _1049 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _1051 = _1005 * 6.283185482025146484375;
    float _1053 = sin(_1051);
    float _1055 = abs(_1035);
    float _1057 = _1039 * _1055;
    float _1059 = _1029 * 0.15915493667125701904296875;
    float _1061 = fma(_1045, _1049, _1057);
    float _1063 = _721 * _1023;
    float _1065 = _1005 * 6.283185482025146484375;
    float _1067 = cos(_1065);
    float _1069 = _1015 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1071 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1073 = _1059 * 6.283185482025146484375;
    float _1075 = cos(_1073);
    float _1077 = _1017 * 0.15915493667125701904296875;
    float _1079 = abs(_737);
    float _1081 = _1039 * _1079;
    float _1083 = float(_1031);
    float _1085 = fma(_1045, _763, _1081);
    float _1087 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _503);
    float _1089 = abs(_1043);
    float _1091 = fma(_1083, _1089, _1061);
    float _1093 = _1077 * 6.283185482025146484375;
    float _1095 = sin(_1093);
    float _1097 = abs(_749);
    float _1099 = fma(_1083, _1097, _1085);
    float _1101 = _1091 * _1069;
    float _1103 = _1099 * _1071;
    float _1105 = _1101 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1107 = _1077 * 6.283185482025146484375;
    float _1109 = cos(_1107);
    float _1111 = _1103 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1113 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _459);
    float _1115 = _1063 * _1105;
    float _1117 = _1053 * _1075;
    float _1119 = _1063 * _1111;
    float _1121 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1123 = _1121 * 0.5;
    float _1125 = _1115 * _1087;
    float _1127 = _1059 * 6.283185482025146484375;
    float _1129 = sin(_1127);
    float _1131 = _1067 * _1095;
    float _1133 = _1053 * _1095;
    float _1135 = _1119 * _1113;
    float _1137 = _1117 * _1125;
    float _1139 = _1053 * _1109;
    float _1141 = _1067 * _1109;
    float _1143 = _1109 * _1075;
    float _1145 = _1067 * _1075;
    float _1147 = -_1131;
    float _1149 = fma(_1129, _1139, _1147);
    float _1151 = -_1125;
    float _1153 = _1129 * _1151;
    float _1155 = fma(_1129, _1133, _1141);
    float _1157 = fma(_1129, _1141, _1133);
    float _1159 = fma(_1149, _1135, _1137);
    float _1161 = _1095 * _1075;
    float _1163 = fma(_1143, _1135, _1153);
    float _1165 = _1145 * _1125;
    float _1167 = fma(_1155, _1123, _1159);
    float _1169 = -_1139;
    float _1171 = fma(_1129, _1131, _1169);
    float _1173 = fma(_1161, _1123, _1163);
    float _1175 = fma(_1157, _1135, _1165);
    float _1177 = _499 + _1167;
    float _1179 = _623 + _1173;
    float _1181 = fma(_1171, _1123, _1175);
    float _1183 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1185 = _1177 + _1183;
    float _1187 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1189 = _1179 + _1187;
    float _1191 = _485 + _1181;
    float _1193 = _1185 * _1185;
    float _1195 = fma(_1189, _1189, _1193);
    float _1197 = sqrt(_1195);
    bool _1199 = _1197 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1201 = _1181;
    float _1203 = _1175;
    float _1205 = _1139;
    float _1207 = _931;
    float _1209 = _969;
    float _1211 = _1077;
    float _1213 = _1057;
    if (!_1199)
    {
        _1201 = _1179;
    }
    float _1215 = _1201;
    float _1217 = _1215;
    if (!_1199)
    {
        _1203 = _1177;
    }
    float _1219 = _1203;
    float _1221 = _1219;
    if (!_1199)
    {
        _1205 = _1191;
    }
    float _1223 = _1205;
    bool _1225 = !_1199;
    float _1227 = _1223;
    if (!_1225)
    {
        float _1229 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1231 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1233 = _1197 + _1231;
        float _1235 = rsqrt(_1195);
        float _1237 = _1233 * _1229;
        float _1239 = _1191 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1241 = _1237 * 0.15915493667125701904296875;
        float _1243 = _1241 * 6.283185482025146484375;
        float _1245 = sin(_1243);
        float _1247 = _1241 * 6.283185482025146484375;
        float _1249 = cos(_1247);
        float _1251 = fma(_1245, _1239, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1253 = _1235 * _1251;
        float _1255 = _1249 + (-1.0);
        float _1257 = fma(_1189, _1253, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1259 = fma(_1185, _1253, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1261 = _1255 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1263 = fma(_1191, _1249, _1261);
        _1227 = _1263;
        _1217 = _1257;
        _1221 = _1259;
    }
    float _1265 = _1227;
    float _1267 = _1217;
    float _1269 = _1221;
    float _1271 = -_767;
    float _1273 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1265);
    float _1275 = -_931;
    float _1277 = fma(_1275, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1267);
    float _1279 = -_969;
    float _1281 = fma(_1279, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1269);
    float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1285 = _1273 + _1283;
    float _1287 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1289 = _1277 + _1287;
    float _1291 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1293 = _1281 + _1291;
    float _1295 = -_931;
    float _1297 = fma(_1295, (*spvDescriptorSet0.vp_c9)._m0[18].w, _623);
    float _1299 = _1285 * _1285;
    float _1301 = -_969;
    float _1303 = fma(_1301, (*spvDescriptorSet0.vp_c9)._m0[18].w, _499);
    float _1305 = fma(_1289, _1289, _1299);
    float _1307 = fma(_1293, _1293, _1305);
    float _1309 = rsqrt(_1307);
    float _1311 = sqrt(_1307);
    float _1313 = _1309 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1315 = _1289 * _1313;
    float _1317 = _1293 * _1313;
    float _1319 = _1315 * _1315;
    float _1321 = _1317 * _1317;
    float _1323 = _1319 + _1321;
    float _1325 = sqrt(_1323);
    bool _1327 = _1325 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1329 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1331 = _1325 + _1329;
    float _1333 = _775;
    float _1335 = _1331;
    float _1337 = _1285;
    float _1339 = _1319;
    float _1341 = _1321;
    if (_1327)
    {
        float _1343 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1333 = _1343;
    }
    float _1345 = _1333;
    if (!_1327)
    {
        _1207 = _1315;
    }
    float _1347 = _1207;
    float _1349 = _1347;
    if (!_1327)
    {
        _1209 = _1317;
    }
    float _1351 = _1209;
    float _1353 = _1351;
    if (_1327)
    {
        float _1355 = rsqrt(_1323);
        _1211 = _1355;
    }
    float _1357 = _1211;
    if (_1327)
    {
        float _1359 = _1331 * _1345;
        _1335 = _1359;
    }
    float _1361 = _1335;
    if (_1327)
    {
        float _1363 = _1361 * 0.15915493667125701904296875;
        _1213 = _1363;
    }
    float _1365 = _1213;
    float _1367 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1369 = _1123;
    if (_1327)
    {
        float _1371 = _1365 * 6.283185482025146484375;
        float _1373 = sin(_1371);
        _1369 = _1373;
    }
    float _1375 = _1369;
    float _1377 = precise::max(0.0, _1367);
    float _1379 = -_1313;
    float _1381 = -_1377;
    float _1383 = fma(_1285, _1379, _1381);
    float _1385 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    if (_1327)
    {
        float _1387 = _1365 * 6.283185482025146484375;
        float _1389 = cos(_1387);
        _1385 = _1389;
    }
    float _1391 = _1385;
    float _1393 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1327)
    {
        float _1395 = _1383 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1337 = _1395;
    }
    float _1397 = _1337;
    float _1399 = _1375;
    if (_1327)
    {
        float _1401 = fma(_1375, _1397, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1399 = _1401;
    }
    float _1403 = _1399;
    float _1405 = fma(_1297, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1407 = _1403;
    if (!_1327)
    {
        _1393 = _1383;
    }
    float _1409 = _1393;
    float _1411 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1413 = _1409;
    if (_1327)
    {
        float _1415 = _1357 * _1403;
        _1407 = _1415;
    }
    float _1417 = _1407;
    float _1419 = floor(_1405);
    float _1421 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1411);
    if (_1327)
    {
        float _1423 = _1391 + (-1.0);
        _657 = _1423;
    }
    float _1425 = _657;
    float _1427 = _1425;
    if (_1327)
    {
        float _1429 = _1315 * _1417;
        _1349 = _1429;
    }
    float _1431 = _1349;
    if (_1327)
    {
        float _1433 = _1317 * _1417;
        _1353 = _1433;
    }
    float _1435 = _1353;
    float _1437 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1327)
    {
        float _1439 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1427 = _1439;
    }
    float _1441 = _1427;
    if (_1327)
    {
        float _1443 = _1431 * _1431;
        _1339 = _1443;
    }
    float _1445 = _1339;
    if (_1327)
    {
        float _1447 = _1435 * _1435;
        _1341 = _1447;
    }
    float _1449 = _1341;
    float _1451 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1437);
    if (_1327)
    {
        float _1453 = fma(_1383, _1391, _1441);
        _1413 = _1453;
    }
    float _1455 = _1413;
    float _1457 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1459 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1461 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1451);
    float _1463 = fma(_1455, _1455, _1445);
    float _1465 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1457);
    float _1467 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1459);
    float _1469 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1471 = fma(_1311, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1469);
    float _1473 = precise::clamp(_1471, 0.0, 1.0);
    float _1475 = _1463 + _1449;
    float _1477 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1421);
    float _1479 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1465);
    float _1481 = _1461 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1483 = -_1473;
    float _1485 = _1483 + 1.0;
    float _1487 = rsqrt(_1475);
    float _1489 = _1477 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1491 = _1479 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1493 = _1481 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1495 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1497 = _1489 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1499 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1467);
    float _1501 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1493);
    float _1503 = abs(_1485);
    float _1505 = log2(_1503);
    float _1507 = -_1497;
    float _1509 = fma(_1507, _1495, 1.0);
    float _1511 = _1499 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1513 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1501);
    float _1515 = _1487 * _1431;
    float _1517 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1513);
    float _1519 = _1487 * _1455;
    float _1521 = fma(_1303, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1523 = _1515 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1525 = _1487 * _1435;
    float _1527 = 1.0 / _1517;
    float _1529 = _1481 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1531 = -_1523;
    float _1533 = fma(_1519, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1531);
    float _1535 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1537 = -_1419;
    float _1539 = _1405 + _1537;
    float _1541 = _1481 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1543 = -_1525;
    float _1545 = fma(_1543, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1533);
    float _1547 = floor(_1521);
    float _1549 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1541);
    float _1551 = fma(_1545, -0.5, 0.5);
    float _1553 = fma(_1545, 0.5, 0.5);
    float _1555 = _1519 + 1.0;
    float _1557 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1549);
    float _1559 = exp2(_1535);
    float _1561 = sqrt(_1551);
    float _1563 = -_1547;
    float _1565 = _1521 + _1563;
    float _1567 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1529);
    float _1569 = fma(_1553, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1571 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1567);
    float _1573 = fma(_1553, _1569, -0.212114393711090087890625);
    float _1575 = log2(_1509);
    float _1577 = -_1519;
    float _1579 = fma(_1559, _1555, _1577);
    float _1581 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1557);
    float _1583 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1571);
    float _1585 = fma(_1553, _1573, 1.570728778839111328125);
    float _1587 = _1581 * _1527;
    float _1589 = _1583 * _1527;
    float _1591 = _1561 * 0.636619746685028076171875;
    float _1593 = fma(_1587, 0.5, 0.5);
    float _1595 = fma(_1589, -0.5, 0.5);
    float _1597 = -_1585;
    float _1599 = fma(_1591, _1597, 1.0);
    float _1601 = fma(_1579, 0.5, 0.5);
    float _1603 = _1575 * 0.693147182464599609375;
    float2 _4811 = float2(_1539, _1565);
    float _1605 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4811, float2(0.0), isnan(_4811)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4811, float2(0.0), isnan(_4811)), level(0.0)).x;
    float _1607 = _1603 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _4826 = float3(_1593, _1595, _1607);
    float _1609 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4826, float3(0.0), isnan(_4826)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4826, float3(0.0), isnan(_4826)), level(0.0)).x;
    float3 _4837 = float3(_1593, _1595, _1607);
    float4 _1612 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4837, float3(0.0), isnan(_4837)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4837, float3(0.0), isnan(_4837)), level(0.0)).xyzw;
    float _1614 = _1612.x;
    float _1616 = _1612.y;
    float _1618 = _1612.z;
    float _1620 = _1612.w;
    float2 _4853 = float2(_1599, _1601);
    float3 _1624 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4853, float2(0.0), isnan(_4853)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4853, float2(0.0), isnan(_4853)), level(0.0)).xyz;
    float _1626 = _1624.x;
    float _1628 = _1624.y;
    float _1630 = _1624.z;
    float _1632 = -_767;
    float _1634 = fma(_1632, (*spvDescriptorSet0.vp_c9)._m0[18].w, _485);
    float _1636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1638 = _165 > 0.5;
    float _1640 = -_437;
    float _1642 = _1640 + 1.0;
    float _1644 = _1634 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1648 = _1646 != 0;
    float _1650 = -_417;
    float _1652 = _1650 + 1.0;
    float _1654 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1644);
    float _1656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1658 = -_439;
    float _1660 = _1658 + 1.0;
    float _1662 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1654);
    float _1664 = _1634 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1666 = -_459;
    int _1668 = _1638 ? as_type<int>(_1666) : as_type<int>(_459);
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1672 = _1662 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1674 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1664);
    float _1676 = _1636 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1678 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1680 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1674);
    bool _1682 = !_1648;
    float _1684 = _1682 ? _459 : as_type<float>(_1668);
    float _1686 = _1670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1688 = _179 > 0.5;
    float _1690 = _1680 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1692 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1694 = 1.0 / _1672;
    float _1696 = _1684 + 0.5;
    float _1698 = _1690 + _1672;
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1702 = _1700 != 0;
    float _1704 = _1692 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1706 = fma(_1676, _1696, _359);
    float _1708 = -_503;
    int _1710 = _1688 ? as_type<int>(_1708) : as_type<int>(_503);
    float _1712 = -_441;
    float _1714 = _1712 + 1.0;
    int _1716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1718 = _1716 != 0;
    float _1720 = _445 * (-0.15915493667125701904296875);
    float _1722 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1724 = !_1702;
    float _1726 = _1724 ? _503 : as_type<float>(_1710);
    float _1728 = _1678 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1730 = -_1660;
    float _1732 = fma(_1684, _1730, _1706);
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1736 = _1698 * _1694;
    float _1738 = _1736 * 0.5;
    float _1740 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1742 = _1720 * 6.283185482025146484375;
    float _1744 = sin(_1742);
    float _1746 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1748 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1746);
    float _1750 = -_459;
    int _1752 = _585 ? as_type<int>(_1750) : as_type<int>(_459);
    float _1754 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1756 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1758 = isnan(0.5);
    bool _1760 = _1756 || _1758;
    bool _1762 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1764 = _1760 || _1762;
    bool _1766 = !_1718;
    float _1768 = _1766 ? _459 : as_type<float>(_1752);
    float _1770 = _1754 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1772 = 1.0 / _1748;
    float _1774 = _1722 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1776 = _459 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_60.x = _1770;
    out.m_60.y = _1704;
    out.m_60.z = _1686;
    out.m_60.w = _1734;
    float _1778 = _1720 * 6.283185482025146484375;
    float _1780 = cos(_1778);
    float _1782 = _643 * _1744;
    float _1784 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1786 = _1656 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1788 = _1726 + (-0.5);
    float _1790 = _1768 + 0.5;
    float _1792 = -_1786;
    float _1794 = -_347;
    float _1796 = fma(_1792, _1788, _1794);
    float _1798 = fma(_1728, _1790, _389);
    float _1800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1804 = _1772 * _1802;
    float _1806 = _643 * _1780;
    float _1808 = -_1782;
    float _1810 = fma(_529, _1780, _1808);
    float _1812 = _561 + (-0.5);
    float _1814 = fma(_1726, _1642, _1796);
    float _1816 = fma(_529, _1744, _1806);
    float _1818 = _1810 + 0.5;
    float _1820 = abs(_1804);
    float _1822 = log2(_1820);
    float _1824 = _1784 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1826 = _1816 + (-0.5);
    float _1828 = fma(_1774, _1818, _385);
    float _1830 = -_433;
    float _1832 = _1830 + 1.0;
    float _1834 = -_1824;
    float _1836 = -_449;
    float _1838 = fma(_1834, _1826, _1836);
    float _1840 = -_503;
    float _1842 = _1840 + 0.5;
    float _1844 = _1800 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1846 = -_1832;
    float _1848 = fma(_1810, _1846, _1828);
    float _1850 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1852 = -_1844;
    float _1854 = -_447;
    float _1856 = fma(_1852, _1812, _1854);
    out.m_62.y = _1842;
    float _1858 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1860 = _1822 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1864 = _1850 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1866 = fma(_561, _1714, _1856);
    float _1868 = _503 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1870 = exp2(_1860);
    float _1872 = _1862 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1874 = _1858 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1876 = -_443;
    float _1878 = _1876 + 1.0;
    float _1880 = -_1652;
    float _1882 = fma(_1768, _1880, _1798);
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1886 = _1117 * _1868;
    float _1888 = fma(_1816, _1878, _1838);
    out.m_64.x = _1732;
    out.m_64.y = _1814;
    out.m_64.z = _1882;
    out.m_64.w = _1866;
    float _1890 = exp2(_1740);
    bool _1892 = _1804 <= 8000.0;
    bool _1894 = isnan(_1804);
    bool _1896 = _1892 || _1894;
    bool _1898 = isnan(8000.0);
    bool _1900 = _1896 || _1898;
    float _1902 = float(_1900);
    out.m_66.x = _1864;
    out.m_66.y = _1872;
    out.m_66.z = _1874;
    out.m_66.w = _1884;
    float _1904 = fma(_1149, _1776, _1886);
    float _1906 = -_1868;
    float _1908 = _1129 * _1906;
    float _1910 = fma(_1870, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1912 = precise::clamp(_1910, 0.0, 1.0);
    out.m_68.x = _1848;
    out.m_68.y = _1888;
    float _1914 = _1145 * _1868;
    float _1916 = in.m_70.x;
    float _1918 = _1517 * 0.5;
    float _1920 = fma(_1143, _1776, _1908);
    float _1922 = fma(_1157, _1776, _1914);
    float _1924 = fma(_1912, -2.0, 3.0);
    float _1926 = _1912 * _1912;
    float _1928 = _1481 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1930 = _1926 * _1924;
    float _1932 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1928);
    float _1934 = _1581 + _1517;
    float _1936 = -_1930;
    float _1938 = _1936 + 1.0;
    float _1940 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1932);
    float _1942 = _1934 * 0.5;
    float _1944 = fma(_1938, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1930);
    float _1946 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1940);
    float _1948 = fma(_1583, -0.5, _1918);
    float _1950 = _1902 * _1944;
    float _1952 = _1946 + _1517;
    float _1954 = _1902;
    float _1956 = _1517;
    float _1958 = _1946;
    float _1960 = _1948;
    float _1962 = _1942;
    if (_1764)
    {
        _1954 = 1.0;
    }
    float _1964 = _1954;
    float _1966 = _1952 * 0.5;
    float _1968 = _1964;
    if (!_1764)
    {
        float _1970 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1972 = _1970 * 0.15915493667125701904296875;
        float _1974 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1976 = _1972 * 6.283185482025146484375;
        float _1978 = cos(_1976);
        float _1980 = _1974 * 0.15915493667125701904296875;
        float _1982 = _1972 * 6.283185482025146484375;
        float _1984 = sin(_1982);
        float _1986 = 1.0 / _1978;
        float _1988 = _1980 * 6.283185482025146484375;
        float _1990 = cos(_1988);
        float _1992 = _1984 * _1986;
        float _1994 = _1980 * 6.283185482025146484375;
        float _1996 = sin(_1994);
        float _1998 = _1990 * _1992;
        float _2000 = 1.0 / _1998;
        float _2002 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2004 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2002;
        float _2006 = 1.0 / _2004;
        float _2008 = _1996 * _2000;
        float _2010 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2012 = fma(_1804, _2008, _2010);
        float _2014 = _2012 * _2006;
        float _2016 = precise::clamp(_2014, 0.0, 1.0);
        _1968 = _2016;
    }
    float _2018 = _1968;
    float _2020 = -_1890;
    float _2022 = _2020 + 1.0;
    float _2024 = _1950 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2026 = -_1605;
    float _2028 = _2026 + 1.0;
    float _2030 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1581;
    out.gl_Position.y = _1583;
    out.gl_Position.z = _1946;
    out.gl_Position.w = _1517;
    float _2032 = _2028 * _2024;
    float _2034 = precise::clamp(_2032, 0.0, 1.0);
    float _2036 = _1161 + _1920;
    float _2038 = _2030 * _1609;
    float _2040 = -_2030;
    float _2042 = _2040 + 1.0;
    float _2044 = _1171 + _1922;
    float _2046 = _1155 + _1904;
    float _2048 = _1630 * _2038;
    out.m_72.x = _1277;
    out.m_72.y = _1273;
    out.m_72.z = _1281;
    bool _2050 = _1311 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2052 = isnan(_1311);
    bool _2054 = _2050 || _2052;
    bool _2056 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2058 = _2054 || _2056;
    out.m_74.x = _2036;
    out.m_74.y = _2044;
    out.m_74.z = _2046;
    float _2060 = _1620 * _2038;
    float _2062 = -_2034;
    float _2064 = fma(_2062, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2066 = _1620 * _2042;
    float _2068 = fma(_1620, _2048, _1618);
    float _2070 = fma(_1626, _2060, _1614);
    float _2072 = fma(_1628, _2060, _1616);
    float _2074 = _2064 * _1916;
    out.m_76.x = _1942;
    out.m_76.y = _1948;
    out.m_76.z = _1966;
    out.m_76.w = _1517;
    float _2076 = _2060;
    if (!_2058)
    {
        _1956 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2078 = _1956;
    float _2080 = _2074 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_78.x = _2070;
    out.m_78.y = _2072;
    out.m_78.z = _2068;
    out.m_78.w = _2066;
    float _2082 = _2080;
    float _2084 = _2078;
    float _2086 = _2078;
    if (!_2058)
    {
        _1958 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2088 = _1958;
    float _2090 = _2088;
    float _2092 = _2088;
    if (!_2058)
    {
        _2076 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2094 = _2076;
    out.m_80.x = _2080;
    float _2096 = _2018 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2098 = _2094;
    float _2100 = _2094;
    if (!_2058)
    {
        _1960 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2102 = _1960;
    float _2104 = _2102;
    float _2106 = _2102;
    if (!_2058)
    {
        _1962 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2108 = _1962;
    float _2110 = _2108;
    float _2112 = _2108;
    if (!_2058)
    {
        _2082 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2114 = _2082;
    bool _2116 = !_2058;
    float _2118 = _2114;
    float _2120 = _2114;
    if (!_2116)
    {
        bool _2122 = _1311 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2124 = isnan(_1311);
        bool _2126 = _2122 || _2124;
        bool _2128 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2130 = _2126 || _2128;
        if (!_2130)
        {
            float _2132 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2134 = _1311 + _2132;
            float _2136 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2138 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2136;
            float _2140 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2142 = _2140 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2144 = 1.0 / _2138;
            float _2146 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2148 = _2146 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2150 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2152 = _2150 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2154 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2156 = _2154 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2158 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2160 = _2158 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2162 = _2134 * _2144;
            float _2164 = precise::clamp(_2162, 0.0, 1.0);
            float _2166 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2168 = _2166 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2170 = fma(_2164, _2142, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2172 = fma(_2164, _2168, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2174 = fma(_2164, _2148, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2176 = fma(_2164, _2152, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2178 = fma(_2164, _2156, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2180 = fma(_2164, _2160, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2112 = _2174;
            _2100 = _2178;
            _2106 = _2170;
            _2092 = _2176;
            _2086 = _2172;
            _2120 = _2180;
            _2182 = true;
        }
        else
        {
            bool _2184 = _1311 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2186 = isnan(_1311);
            bool _2188 = _2184 || _2186;
            bool _2190 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2192 = _2188 || _2190;
            if (!_2192)
            {
                _2104 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2194 = _2104;
            _2106 = _2194;
            if (!_2192)
            {
                _2110 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2196 = _2110;
            _2112 = _2196;
            if (!_2192)
            {
                _2084 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2198 = _2084;
            _2086 = _2198;
            if (!_2192)
            {
                _2090 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2200 = _2090;
            _2092 = _2200;
            if (!_2192)
            {
                _2098 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2202 = _2098;
            _2100 = _2202;
            if (!_2192)
            {
                _2118 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2204 = _2118;
            bool _2206 = !_2192;
            _2120 = _2204;
            if (!_2206)
            {
                bool _2208 = _1311 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2210 = isnan(_1311);
                bool _2212 = _2208 || _2210;
                bool _2214 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2216 = _2212 || _2214;
                if (!_2216)
                {
                    float _2218 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2220 = _1311 + _2218;
                    float _2222 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2224 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2222;
                    float _2226 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2228 = _2226 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2230 = 1.0 / _2224;
                    float _2232 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2234 = _2232 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2236 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2238 = _2236 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2240 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2242 = _2240 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2244 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2246 = _2244 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2248 = _2220 * _2230;
                    float _2250 = precise::clamp(_2248, 0.0, 1.0);
                    float _2252 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2254 = _2252 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2256 = fma(_2250, _2228, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2258 = fma(_2250, _2254, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2260 = fma(_2250, _2234, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2262 = fma(_2250, _2238, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2264 = fma(_2250, _2242, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2266 = fma(_2250, _2246, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2112 = _2260;
                    _2100 = _2264;
                    _2106 = _2256;
                    _2092 = _2262;
                    _2086 = _2258;
                    _2120 = _2266;
                    _2182 = true;
                }
                else
                {
                    _2112 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2100 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2106 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2092 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2086 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2120 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2182 = false;
    float _2268 = _2112;
    float _2270 = _2100;
    float _2272 = _2106;
    float _2274 = _2092;
    float _2276 = _2086;
    float _2278 = _2120;
    float _2280 = _2096 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2282 = fma(_2044, -0.5, 0.5);
    float _2284 = precise::clamp(_2282, 0.0, 1.0);
    float _2286 = -_2268;
    float _2288 = _2286 + _2270;
    float _2290 = -_2272;
    float _2292 = _2290 + _2274;
    out.m_82.x = 0.0;
    float _2294 = fma(_2284, _2288, _2268);
    float _2296 = -_2276;
    float _2298 = _2296 + _2278;
    float _2300 = fma(_2284, _2292, _2272);
    float _2302 = _2294 * 0.586610972881317138671875;
    bool _2304 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2306 = fma(_2284, _2298, _2276);
    out.m_49.x = _2280;
    float _2308 = fma(_2300, 0.298911988735198974609375, _2302);
    bool _2310 = _2018 > 0.0;
    bool _2312 = isnan(_2018);
    bool _2314 = _2310 || _2312;
    bool _2316 = isnan(0.0);
    bool _2318 = _2314 || _2316;
    float _2320 = fma(_2306, 0.114477999508380889892578125, _2308);
    float _2322 = -_2320;
    float _2324 = _2300 + _2322;
    float _2326 = -_2320;
    float _2328 = _2294 + _2326;
    float _2330 = -_2320;
    float _2332 = _2306 + _2330;
    float _2334 = fma(_2324, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2320);
    float _2336 = fma(_2328, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2320);
    float _2338 = fma(_2332, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2320);
    bool _2340 = !_2304;
    if (!_2340)
    {
        float _2342 = -_1273;
        float _2344 = _2342 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2346 = -_1277;
        float _2348 = _2346 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2350 = -_1281;
        float _2352 = _2350 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2354 = _2344 * _2344;
        float _2356 = fma(_2348, _2348, _2354);
        float _2358 = fma(_2352, _2352, _2356);
        float _2360 = sqrt(_2358);
        float _2362 = rsqrt(_2358);
        float _2364 = -_2360;
        float _2366 = _2364 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2368 = _2366 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2370 = precise::clamp(_2368, 0.0, 1.0);
        float _2372 = _2348 * _2362;
        float _2374 = _2344 * _2362;
        float _2376 = abs(_2370);
        float _2378 = log2(_2376);
        float _2380 = _2352 * _2362;
        float _2382 = _2372 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2384 = _2044 * _2374;
        float _2386 = -_2374;
        float _2388 = -_2382;
        float _2390 = fma(_2386, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2388);
        float _2392 = fma(_2036, _2372, _2384);
        float _2394 = -_2380;
        float _2396 = fma(_2394, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2390);
        float _2398 = fma(_2046, _2380, _2392);
        float _2400 = precise::clamp(_2398, 0.0, 1.0);
        float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2404 = _2396 + _2402;
        float _2406 = _2378 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2408 = _2404 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2410 = precise::clamp(_2408, 0.0, 1.0);
        float _2412 = exp2(_2406);
        float _2414 = _2412 * _2410;
        float _2416 = _2400 * _2414;
        float _2418 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2420 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2422 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2418;
        out.m_82.y = _2420;
        out.m_82.z = _2422;
    }
    out.m_84.x = _2334;
    out.m_84.y = _2336;
    out.m_84.z = _2338;
    if (_2318)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2424 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2424;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2182 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    float _111 = as_type<float>(_103);
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _109;
    if (!_107)
    {
        out.m_49.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _113 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2482 = as_type<float>(_119);
        out.gl_Position.z = _2482;
    }
    if (!_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = in.m_51.w;
    bool _125 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_123);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    float _135 = -_123;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _139 = _137;
    if (_133)
    {
        float _141 = float(_103);
        _111 = _141;
    }
    float _143 = _111;
    bool _145 = _137 >= _143;
    bool _147 = !_133;
    bool _149 = _145 || _147;
    float _151 = _143;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _151;
    if (_149)
    {
        out.m_49.x = 0.0;
    }
    if (_149)
    {
        float _155 = _153 * 5.0;
        _121 = as_type<int>(_155);
    }
    int _157 = _121;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2552 = as_type<float>(_157);
        out.gl_Position.z = _2552;
    }
    if (_149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _163 = _137 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _165 = in.m_56.x;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _169 = _167 != 0;
    float _171 = in.m_56.z;
    float _173 = in.m_56.w;
    float _175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _177 = _137 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _179 = in.m_56.y;
    float _181 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _183 = in.m_46.x;
    float _185 = in.m_46.y;
    float _187 = in.m_46.z;
    float _189 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _191 = log2(_189);
    float _193 = _163 * _161;
    float _195 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _197 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _199 = as_type<int>(_159) & 1;
    bool _201 = _199 != 0;
    int _203 = as_type<int>(_159) & 2;
    bool _205 = _203 != 0;
    float _207 = _177 * _175;
    float _209 = _175;
    if (!_169)
    {
        float _211 = in.m_56.z;
        _209 = _211;
    }
    float _213 = _209;
    float _215 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _217 = _165 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _219 = _171 * 2.0;
    float _221 = _191 * _137;
    bool _223 = _173 > 0.5;
    float _225 = -_181;
    float _227 = fma(_217, 2.0, _225);
    float _229 = _179 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _231 = exp2(_221);
    float _233 = 0.0;
    float _235 = _229;
    float _237 = _183;
    float _239 = _185;
    if (!_169)
    {
        _233 = _179;
    }
    float _241 = _233;
    float _243 = _185 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _245 = fma(_229, -2.0, _197);
    float _247 = _241;
    if (_169)
    {
        _235 = _165;
    }
    float _249 = _235;
    float _251 = _185 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _253 = _249;
    if (!_169)
    {
        _253 = _171;
    }
    float _255 = _253;
    float _257 = _185 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _259 = floor(_219);
    if (_169)
    {
        _247 = _165;
    }
    float _261 = _247;
    float _263 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[4].x, _243);
    float _265 = _255 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _267 = int(_201);
    int _269 = _205 ? 2 : 0;
    int _271 = _267 | _269;
    int _273 = _223 ? 4 : 0;
    int _275 = _271 | _273;
    int _277 = _169 ? 8 : 0;
    int _279 = _275 | _277;
    int _281 = false ? 16 : 0;
    int _283 = _279 | _281;
    int _285 = false ? 32 : 0;
    int _287 = _283 | _285;
    int _289 = false ? 64 : 0;
    int _291 = _287 | _289;
    int _293 = _291 & 4;
    float _295 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[5].x, _251);
    float _297 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[83].z, _215);
    float _299 = -_195;
    float _301 = fma(_265, 2.0, _299);
    float _303 = _261 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _305 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[6].x, _257);
    if (_169)
    {
        _237 = _171;
    }
    float _307 = _237;
    float _309 = -_231;
    float _311 = _309 + 1.0;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _315 = _307;
    if (_169)
    {
        _239 = _179;
    }
    float _317 = _239;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _321 = _259 > 0.0;
    float _323 = -_313;
    float _325 = fma(_303, 2.0, _323);
    bool _327 = _259 >= 0.0;
    bool _329 = isnan(_259);
    bool _331 = _327 || _329;
    bool _333 = isnan(0.0);
    bool _335 = _331 || _333;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _339 = _259;
    float _341 = _213;
    float _343 = _317;
    if (!_169)
    {
        _339 = _213;
    }
    float _345 = _339;
    float _347 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _245);
    float _349 = _345;
    if (_169)
    {
        _349 = _179;
    }
    float _351 = _349;
    float _353 = _165 * 2.0;
    if (_169)
    {
        _341 = _179;
    }
    float _355 = _341;
    float _357 = -_137;
    float _359 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[76].x, _227);
    if (!_169)
    {
        _343 = _165;
    }
    float _361 = _343;
    float _363 = _351 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_169)
    {
        _315 = _179;
    }
    float _365 = _315;
    float _367 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[83].w, _319);
    bool _369 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _371 = isnan(0.0);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _377 = _373 || _375;
    float _379 = _361 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _381 = fma(_363, -2.0, _337);
    float _383 = -_137;
    float _385 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[86].x, _301);
    float _387 = -_137;
    float _389 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[81].x, _325);
    float _391 = _377 ? _311 : 0.0;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    bool _395 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _397 = isnan(1.0);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _403 = _399 || _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _407 = 1.0 + _405;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _411 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[89].z, _393);
    float _413 = 1.0 / _407;
    float _415 = fma(_379, -2.0, _409);
    float _417 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _297);
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _425 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[88].z, _419);
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _429 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[78].w, _421);
    float _431 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[78].z, _423);
    float _433 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _425);
    float _435 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[88].w, _427);
    float _437 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _429);
    float _439 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _431);
    float _441 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _367);
    float _443 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _435);
    float _445 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[89].x, _411);
    float _447 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _381);
    float _449 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _415);
    if (_403)
    {
        float _451 = _391 * _413;
        _139 = _451;
    }
    float _453 = _139;
    float _455 = floor(_353);
    bool _457 = !_201;
    float _459 = _457 ? (-0.5) : 0.5;
    float _461 = _179 * 2.0;
    float _463 = fma(_187, (*spvDescriptorSet0.vp_c10)._m0[5].z, _295);
    bool _465 = _293 != 0;
    float _467 = fma(_187, (*spvDescriptorSet0.vp_c10)._m0[4].z, _263);
    int _469 = _335 ? 0 : 1;
    float _471 = floor(_461);
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _475 = _473 != 0;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _479 = _477 != 0;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _483 = _481 != 0;
    float _485 = _463 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _487 = _179 > 0.5;
    float _489 = fma(_187, (*spvDescriptorSet0.vp_c10)._m0[6].z, _305);
    float _491 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _493 = _485 + _491;
    float _495 = -_459;
    int _497 = _487 ? as_type<int>(_495) : as_type<int>(_459);
    float _499 = _489 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _501 = !_205;
    float _503 = _501 ? (-0.5) : 0.5;
    float _505 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    int _507 = ~_469;
    int _509 = _507 + 1;
    int _511 = _509 + 1;
    float _513 = _493 * _493;
    int _515 = _511;
    if (!_321)
    {
        int _517 = ~_469;
        int _519 = _517 + 1;
        _515 = _519;
    }
    int _521 = _515;
    float _523 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _525 = _499 + _523;
    bool _527 = !_479;
    float _529 = _527 ? _459 : as_type<float>(_497);
    float _531 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _533 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _535 = precise::max(_531, _533);
    bool _537 = _455 > 0.0;
    bool _539 = _455 >= 0.0;
    bool _541 = isnan(_455);
    bool _543 = _539 || _541;
    bool _545 = isnan(0.0);
    bool _547 = _543 || _545;
    float _549 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].x, _193);
    float _551 = -_503;
    int _553 = _465 ? as_type<int>(_551) : as_type<int>(_503);
    bool _555 = _535 >= 16.0;
    float _557 = floor(_549);
    bool _559 = !_475;
    float _561 = _559 ? _503 : as_type<float>(_553);
    float _563 = _179 + _171;
    bool _565 = _471 > 0.0;
    bool _567 = _471 >= 0.0;
    bool _569 = isnan(_471);
    bool _571 = _567 || _569;
    bool _573 = isnan(0.0);
    bool _575 = _571 || _573;
    float _577 = _165 + _171;
    float _579 = _563 + (-1.0);
    float _581 = _577 + (-1.0);
    int _583 = _575 ? 0 : 1;
    bool _585 = _171 > 0.5;
    float _587 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _589 = _165 + _179;
    float _591 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _593 = ~_583;
    int _595 = _593 + 1;
    int _597 = _595 + 1;
    float _599 = -_557;
    float _601 = _549 + _599;
    int _603 = _597;
    if (!_565)
    {
        int _605 = ~_583;
        int _607 = _605 + 1;
        _603 = _607;
    }
    int _609 = _603;
    float _611 = _589 + (-1.0);
    float _613 = _549 * 6.283185482025146484375;
    float _615 = -_503;
    int _617 = _585 ? as_type<int>(_615) : as_type<int>(_503);
    float _619 = _613 * 0.15915493667125701904296875;
    int _621 = _547 ? 0 : 1;
    float _623 = _467 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _627 = _625 != 0;
    int _629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _631 = _629 != 0;
    float _633 = _619 * 6.283185482025146484375;
    float _635 = cos(_633);
    float _637 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _639 = _623 + _637;
    bool _641 = !_483;
    float _643 = _641 ? _503 : as_type<float>(_617);
    int _645 = ~_621;
    int _647 = _645 + 1;
    int _649 = _647 + 1;
    float _651 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    int _653 = _649;
    float _655 = as_type<float>(_609);
    float _657 = _623;
    if (!_537)
    {
        int _659 = ~_621;
        int _661 = _659 + 1;
        _653 = _661;
    }
    int _663 = _653;
    float _665 = fma(_639, _639, _513);
    int _667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _669 = _667 != 0;
    int _671 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _673 = _671 != 0;
    int _675 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _677 = _675 != 0;
    float _679 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].y, _207);
    float _681 = _555 ? _505 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _683 = fma(_525, _525, _665);
    float _685 = floor(_679);
    float _687 = _555 ? _651 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _689 = abs(_681);
    bool _691 = _689 != 0.0;
    bool _693 = isnan(_689);
    bool _695 = _691 || _693;
    bool _697 = isnan(0.0);
    bool _699 = _695 || _697;
    float _701 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _703 = !_627;
    int _705 = _703 ? 0 : 1;
    bool _707 = !_669;
    int _709 = _707 ? 0 : 1;
    float _711 = abs(_687);
    bool _713 = _711 == 0.0;
    bool _715 = !_699;
    bool _717 = _713 && _715;
    int _719 = abs(_709);
    float _721 = rsqrt(_683);
    float _723 = abs(_687);
    bool _725 = _723 == 0.0;
    bool _727 = !_677;
    int _729 = _727 ? 0 : 1;
    bool _731 = _601 < 0.5;
    float _733 = float(_731);
    float _735 = -_601;
    float _737 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _739 = !_631;
    int _741 = _739 ? 0 : 1;
    float _743 = fma(_635, 0.5, 0.5);
    int _745 = abs(_729);
    float _747 = -_733;
    float _749 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _751 = _631;
    int _753 = as_type<int>(_683);
    if (_717)
    {
        bool _755 = as_type<int>(_687) >= 0;
        _751 = _755;
    }
    bool _757 = _751;
    float _759 = float(_521);
    float _761 = -_743;
    float _763 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _765 = float(_719);
    float _767 = _493 * _721;
    int _769 = _757 ? (-1) : 0;
    if (_717)
    {
        int _771 = _757 ? 0 : 1078530011;
        _753 = _771;
    }
    int _773 = _753;
    float _775 = _765 * _759;
    float _777 = float(_609);
    bool _779 = !_673;
    int _781 = _779 ? 0 : 1;
    float _783 = float(_745);
    int _785 = _773;
    if (_717)
    {
        int _787 = int(0x80000000) & as_type<int>(_681);
        int _789 = _773 | _787;
        _655 = as_type<float>(_789);
    }
    float _791 = _655;
    bool _793 = !_699;
    bool _795 = _793 && _725;
    float _797 = _791;
    float _799 = _791;
    if (!_795)
    {
        float _801 = abs(_681);
        bool _803 = _801 != as_type<float>(0x7f800000u /* inf */);
        bool _805 = isnan(_801);
        bool _807 = _803 || _805;
        bool _809 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _811 = _807 || _809;
        float _813 = abs(_687);
        bool _815 = _813 == as_type<float>(0x7f800000u /* inf */);
        float _817 = abs(_687);
        bool _819 = _817 == as_type<float>(0x7f800000u /* inf */);
        bool _821 = !_811;
        bool _823 = _819 && _821;
        if (_823)
        {
            bool _825 = as_type<int>(_687) >= 0;
            _769 = _825 ? (-1) : 0;
        }
        int _827 = _769;
        if (_823)
        {
            _785 = 1075235812;
        }
        int _829 = _785;
        int _831 = _829;
        if (_823)
        {
            int _833 = ~_827;
            int _835 = (_833 != 0) ? _829 : 1061752795;
            _831 = _835;
        }
        int _837 = _831;
        if (_823)
        {
            int _839 = int(0x80000000) & as_type<int>(_681);
            int _841 = _837 | _839;
            _797 = as_type<float>(_841);
        }
        float _843 = _797;
        bool _845 = !_811;
        bool _847 = _845 && _815;
        _799 = _843;
        if (!_847)
        {
            float _849 = abs(_681);
            float _851 = abs(_687);
            float _853 = precise::max(_849, _851);
            float _855 = abs(_681);
            float _857 = abs(_687);
            float _859 = precise::min(_855, _857);
            float _861 = 1.0 / _853;
            float _863 = abs(_681);
            float _865 = abs(_687);
            bool _867 = _863 > _865;
            bool _869 = as_type<int>(_687) >= 0;
            float _871 = _859 * _861;
            float _873 = abs(_681);
            float _875 = abs(_687);
            float _877 = _873 + _875;
            int _879 = as_type<int>(_681) & int(0x80000000);
            float _881 = _871 * _871;
            bool _883 = _877 > as_type<float>(0x7f800000u /* inf */);
            bool _885 = isnan(_877);
            bool _887 = _883 || _885;
            bool _889 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _891 = _887 || _889;
            float _893 = _881 + 11.33538818359375;
            float _895 = fma(_881, _893, 28.84246826171875);
            float _897 = fma(_881, _895, 19.6966705322265625);
            float _899 = fma(_881, -0.82336294651031494140625, -5.674867153167724609375);
            float _901 = fma(_881, _899, -6.565555095672607421875);
            float _903 = 1.0 / _897;
            float _905 = _881 * _901;
            float _907 = _871 * _905;
            float _909 = fma(_907, _903, _871);
            float _911 = _909;
            _799 = _877;
            if (_867)
            {
                float _913 = -_909;
                float _915 = _913 + 1.57079637050628662109375;
                _911 = _915;
            }
            float _917 = _911;
            int _919 = as_type<int>(_917);
            if (!_869)
            {
                float _921 = -_917;
                float _923 = _921 + 3.1415927410125732421875;
                _919 = as_type<int>(_923);
            }
            int _925 = _919;
            if (!_891)
            {
                int _927 = _879 | _925;
                _799 = as_type<float>(_927);
            }
        }
    }
    float _929 = _799;
    float _931 = _639 * _721;
    float _933 = -_767;
    float _935 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[18].w, _493);
    float _937 = -_685;
    float _939 = _679 + _937;
    float _941 = _783 * _777;
    float _943 = -_931;
    float _945 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[18].w, _639);
    float _947 = _935 * _935;
    float _949 = _679 * 6.283185482025146484375;
    int _951 = abs(_781);
    float _953 = _775 * (-2.0);
    float _955 = fma(_945, _945, _947);
    float _957 = _949 * 0.15915493667125701904296875;
    float _959 = float(_663);
    float _961 = fma(_701, _953, _701);
    float _963 = float(_951);
    float _965 = _941 * (-2.0);
    float _967 = _165 + (-0.5);
    float _969 = _525 * _721;
    int _971 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _973 = _971 != 0;
    float _975 = _963 * _959;
    float _977 = fma(_587, _965, _587);
    float _979 = _967 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _981 = _179 + (-0.5);
    float _983 = _975 * (-2.0);
    float _985 = -_969;
    float _987 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[18].w, _525);
    float _989 = fma(_961, _453, _979);
    float _991 = _981 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _993 = fma(_591, _983, _591);
    bool _995 = !_973;
    int _997 = _995 ? 0 : 1;
    float _999 = _957 * 6.283185482025146484375;
    float _1001 = cos(_999);
    float _1003 = fma(_987, _987, _955);
    float _1005 = _989 * 0.15915493667125701904296875;
    float _1007 = fma(_993, _453, _991);
    int _1009 = abs(_997);
    float _1011 = _171 + (-0.5);
    float _1013 = in.m_58.x;
    float _1015 = in.m_58.y;
    float _1017 = _1007 + _929;
    float _1019 = _1011 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    int _1021 = abs(_705);
    float _1023 = sqrt(_1003);
    bool _1025 = _939 < 0.5;
    float _1027 = float(_1025);
    float _1029 = fma(_977, _453, _1019);
    int _1031 = abs(_741);
    float _1033 = -_939;
    float _1035 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _1037 = fma(_1001, 0.5, 0.5);
    float _1039 = float(_1021);
    float _1041 = -_1027;
    float _1043 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _1045 = float(_1009);
    float _1047 = -_1037;
    float _1049 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _1051 = _1005 * 6.283185482025146484375;
    float _1053 = sin(_1051);
    float _1055 = abs(_1035);
    float _1057 = _1039 * _1055;
    float _1059 = _1029 * 0.15915493667125701904296875;
    float _1061 = fma(_1045, _1049, _1057);
    float _1063 = _721 * _1023;
    float _1065 = _1005 * 6.283185482025146484375;
    float _1067 = cos(_1065);
    float _1069 = _1015 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1071 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1073 = _1059 * 6.283185482025146484375;
    float _1075 = cos(_1073);
    float _1077 = _1017 * 0.15915493667125701904296875;
    float _1079 = abs(_737);
    float _1081 = _1039 * _1079;
    float _1083 = float(_1031);
    float _1085 = fma(_1045, _763, _1081);
    float _1087 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _503);
    float _1089 = abs(_1043);
    float _1091 = fma(_1083, _1089, _1061);
    float _1093 = _1077 * 6.283185482025146484375;
    float _1095 = sin(_1093);
    float _1097 = abs(_749);
    float _1099 = fma(_1083, _1097, _1085);
    float _1101 = _1091 * _1069;
    float _1103 = _1099 * _1071;
    float _1105 = _1101 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1107 = _1077 * 6.283185482025146484375;
    float _1109 = cos(_1107);
    float _1111 = _1103 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1113 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _459);
    float _1115 = _1063 * _1105;
    float _1117 = _1053 * _1075;
    float _1119 = _1063 * _1111;
    float _1121 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1123 = _1121 * 0.5;
    float _1125 = _1115 * _1087;
    float _1127 = _1059 * 6.283185482025146484375;
    float _1129 = sin(_1127);
    float _1131 = _1067 * _1095;
    float _1133 = _1053 * _1095;
    float _1135 = _1119 * _1113;
    float _1137 = _1117 * _1125;
    float _1139 = _1053 * _1109;
    float _1141 = _1067 * _1109;
    float _1143 = _1109 * _1075;
    float _1145 = _1067 * _1075;
    float _1147 = -_1131;
    float _1149 = fma(_1129, _1139, _1147);
    float _1151 = -_1125;
    float _1153 = _1129 * _1151;
    float _1155 = fma(_1129, _1133, _1141);
    float _1157 = fma(_1129, _1141, _1133);
    float _1159 = fma(_1149, _1135, _1137);
    float _1161 = _1095 * _1075;
    float _1163 = fma(_1143, _1135, _1153);
    float _1165 = _1145 * _1125;
    float _1167 = fma(_1155, _1123, _1159);
    float _1169 = -_1139;
    float _1171 = fma(_1129, _1131, _1169);
    float _1173 = fma(_1161, _1123, _1163);
    float _1175 = fma(_1157, _1135, _1165);
    float _1177 = _499 + _1167;
    float _1179 = _623 + _1173;
    float _1181 = fma(_1171, _1123, _1175);
    float _1183 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1185 = _1177 + _1183;
    float _1187 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1189 = _1179 + _1187;
    float _1191 = _485 + _1181;
    float _1193 = _1185 * _1185;
    float _1195 = fma(_1189, _1189, _1193);
    float _1197 = sqrt(_1195);
    bool _1199 = _1197 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1201 = _1181;
    float _1203 = _1175;
    float _1205 = _1139;
    float _1207 = _931;
    float _1209 = _969;
    float _1211 = _1077;
    float _1213 = _1057;
    if (!_1199)
    {
        _1201 = _1179;
    }
    float _1215 = _1201;
    float _1217 = _1215;
    if (!_1199)
    {
        _1203 = _1177;
    }
    float _1219 = _1203;
    float _1221 = _1219;
    if (!_1199)
    {
        _1205 = _1191;
    }
    float _1223 = _1205;
    bool _1225 = !_1199;
    float _1227 = _1223;
    if (!_1225)
    {
        float _1229 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1231 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1233 = _1197 + _1231;
        float _1235 = rsqrt(_1195);
        float _1237 = _1233 * _1229;
        float _1239 = _1191 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1241 = _1237 * 0.15915493667125701904296875;
        float _1243 = _1241 * 6.283185482025146484375;
        float _1245 = sin(_1243);
        float _1247 = _1241 * 6.283185482025146484375;
        float _1249 = cos(_1247);
        float _1251 = fma(_1245, _1239, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1253 = _1235 * _1251;
        float _1255 = _1249 + (-1.0);
        float _1257 = fma(_1189, _1253, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1259 = fma(_1185, _1253, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1261 = _1255 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1263 = fma(_1191, _1249, _1261);
        _1227 = _1263;
        _1217 = _1257;
        _1221 = _1259;
    }
    float _1265 = _1227;
    float _1267 = _1217;
    float _1269 = _1221;
    float _1271 = -_767;
    float _1273 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1265);
    float _1275 = -_931;
    float _1277 = fma(_1275, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1267);
    float _1279 = -_969;
    float _1281 = fma(_1279, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1269);
    float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1285 = _1273 + _1283;
    float _1287 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1289 = _1277 + _1287;
    float _1291 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1293 = _1281 + _1291;
    float _1295 = -_931;
    float _1297 = fma(_1295, (*spvDescriptorSet0.vp_c9)._m0[18].w, _623);
    float _1299 = _1285 * _1285;
    float _1301 = -_969;
    float _1303 = fma(_1301, (*spvDescriptorSet0.vp_c9)._m0[18].w, _499);
    float _1305 = fma(_1289, _1289, _1299);
    float _1307 = fma(_1293, _1293, _1305);
    float _1309 = rsqrt(_1307);
    float _1311 = sqrt(_1307);
    float _1313 = _1309 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1315 = _1289 * _1313;
    float _1317 = _1293 * _1313;
    float _1319 = _1315 * _1315;
    float _1321 = _1317 * _1317;
    float _1323 = _1319 + _1321;
    float _1325 = sqrt(_1323);
    bool _1327 = _1325 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1329 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1331 = _1325 + _1329;
    float _1333 = _775;
    float _1335 = _1331;
    float _1337 = _1285;
    float _1339 = _1319;
    float _1341 = _1321;
    if (_1327)
    {
        float _1343 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1333 = _1343;
    }
    float _1345 = _1333;
    if (!_1327)
    {
        _1207 = _1315;
    }
    float _1347 = _1207;
    float _1349 = _1347;
    if (!_1327)
    {
        _1209 = _1317;
    }
    float _1351 = _1209;
    float _1353 = _1351;
    if (_1327)
    {
        float _1355 = rsqrt(_1323);
        _1211 = _1355;
    }
    float _1357 = _1211;
    if (_1327)
    {
        float _1359 = _1331 * _1345;
        _1335 = _1359;
    }
    float _1361 = _1335;
    if (_1327)
    {
        float _1363 = _1361 * 0.15915493667125701904296875;
        _1213 = _1363;
    }
    float _1365 = _1213;
    float _1367 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1369 = _1123;
    if (_1327)
    {
        float _1371 = _1365 * 6.283185482025146484375;
        float _1373 = sin(_1371);
        _1369 = _1373;
    }
    float _1375 = _1369;
    float _1377 = precise::max(0.0, _1367);
    float _1379 = -_1313;
    float _1381 = -_1377;
    float _1383 = fma(_1285, _1379, _1381);
    float _1385 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    if (_1327)
    {
        float _1387 = _1365 * 6.283185482025146484375;
        float _1389 = cos(_1387);
        _1385 = _1389;
    }
    float _1391 = _1385;
    float _1393 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1327)
    {
        float _1395 = _1383 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1337 = _1395;
    }
    float _1397 = _1337;
    float _1399 = _1375;
    if (_1327)
    {
        float _1401 = fma(_1375, _1397, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1399 = _1401;
    }
    float _1403 = _1399;
    float _1405 = fma(_1297, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1407 = _1403;
    if (!_1327)
    {
        _1393 = _1383;
    }
    float _1409 = _1393;
    float _1411 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1413 = _1409;
    if (_1327)
    {
        float _1415 = _1357 * _1403;
        _1407 = _1415;
    }
    float _1417 = _1407;
    float _1419 = floor(_1405);
    float _1421 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1411);
    if (_1327)
    {
        float _1423 = _1391 + (-1.0);
        _657 = _1423;
    }
    float _1425 = _657;
    float _1427 = _1425;
    if (_1327)
    {
        float _1429 = _1315 * _1417;
        _1349 = _1429;
    }
    float _1431 = _1349;
    if (_1327)
    {
        float _1433 = _1317 * _1417;
        _1353 = _1433;
    }
    float _1435 = _1353;
    float _1437 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1327)
    {
        float _1439 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1427 = _1439;
    }
    float _1441 = _1427;
    if (_1327)
    {
        float _1443 = _1431 * _1431;
        _1339 = _1443;
    }
    float _1445 = _1339;
    if (_1327)
    {
        float _1447 = _1435 * _1435;
        _1341 = _1447;
    }
    float _1449 = _1341;
    float _1451 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1437);
    if (_1327)
    {
        float _1453 = fma(_1383, _1391, _1441);
        _1413 = _1453;
    }
    float _1455 = _1413;
    float _1457 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1459 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1461 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1451);
    float _1463 = fma(_1455, _1455, _1445);
    float _1465 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1457);
    float _1467 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1459);
    float _1469 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1471 = fma(_1311, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1469);
    float _1473 = precise::clamp(_1471, 0.0, 1.0);
    float _1475 = _1463 + _1449;
    float _1477 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1421);
    float _1479 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1465);
    float _1481 = _1461 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1483 = -_1473;
    float _1485 = _1483 + 1.0;
    float _1487 = rsqrt(_1475);
    float _1489 = _1477 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1491 = _1479 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1493 = _1481 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1495 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1497 = _1489 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1499 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1467);
    float _1501 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1493);
    float _1503 = abs(_1485);
    float _1505 = log2(_1503);
    float _1507 = -_1497;
    float _1509 = fma(_1507, _1495, 1.0);
    float _1511 = _1499 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1513 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1501);
    float _1515 = _1487 * _1431;
    float _1517 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1513);
    float _1519 = _1487 * _1455;
    float _1521 = fma(_1303, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1523 = _1515 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1525 = _1487 * _1435;
    float _1527 = 1.0 / _1517;
    float _1529 = _1481 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1531 = -_1523;
    float _1533 = fma(_1519, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1531);
    float _1535 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1537 = -_1419;
    float _1539 = _1405 + _1537;
    float _1541 = _1481 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1543 = -_1525;
    float _1545 = fma(_1543, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1533);
    float _1547 = floor(_1521);
    float _1549 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1541);
    float _1551 = fma(_1545, -0.5, 0.5);
    float _1553 = fma(_1545, 0.5, 0.5);
    float _1555 = _1519 + 1.0;
    float _1557 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1549);
    float _1559 = exp2(_1535);
    float _1561 = sqrt(_1551);
    float _1563 = -_1547;
    float _1565 = _1521 + _1563;
    float _1567 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1529);
    float _1569 = fma(_1553, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1571 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1567);
    float _1573 = fma(_1553, _1569, -0.212114393711090087890625);
    float _1575 = log2(_1509);
    float _1577 = -_1519;
    float _1579 = fma(_1559, _1555, _1577);
    float _1581 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1557);
    float _1583 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1571);
    float _1585 = fma(_1553, _1573, 1.570728778839111328125);
    float _1587 = _1581 * _1527;
    float _1589 = _1583 * _1527;
    float _1591 = _1561 * 0.636619746685028076171875;
    float _1593 = fma(_1587, 0.5, 0.5);
    float _1595 = fma(_1589, -0.5, 0.5);
    float _1597 = -_1585;
    float _1599 = fma(_1591, _1597, 1.0);
    float _1601 = fma(_1579, 0.5, 0.5);
    float _1603 = _1575 * 0.693147182464599609375;
    float2 _4811 = float2(_1539, _1565);
    float _1605 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4811, float2(0.0), isnan(_4811)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4811, float2(0.0), isnan(_4811)), level(0.0)).x;
    float _1607 = _1603 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _4826 = float3(_1593, _1595, _1607);
    float _1609 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4826, float3(0.0), isnan(_4826)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4826, float3(0.0), isnan(_4826)), level(0.0)).x;
    float3 _4837 = float3(_1593, _1595, _1607);
    float4 _1612 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4837, float3(0.0), isnan(_4837)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4837, float3(0.0), isnan(_4837)), level(0.0)).xyzw;
    float _1614 = _1612.x;
    float _1616 = _1612.y;
    float _1618 = _1612.z;
    float _1620 = _1612.w;
    float2 _4853 = float2(_1599, _1601);
    float3 _1624 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4853, float2(0.0), isnan(_4853)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4853, float2(0.0), isnan(_4853)), level(0.0)).xyz;
    float _1626 = _1624.x;
    float _1628 = _1624.y;
    float _1630 = _1624.z;
    float _1632 = -_767;
    float _1634 = fma(_1632, (*spvDescriptorSet0.vp_c9)._m0[18].w, _485);
    float _1636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1638 = _165 > 0.5;
    float _1640 = -_437;
    float _1642 = _1640 + 1.0;
    float _1644 = _1634 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1648 = _1646 != 0;
    float _1650 = -_417;
    float _1652 = _1650 + 1.0;
    float _1654 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1644);
    float _1656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1658 = -_439;
    float _1660 = _1658 + 1.0;
    float _1662 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1654);
    float _1664 = _1634 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1666 = -_459;
    int _1668 = _1638 ? as_type<int>(_1666) : as_type<int>(_459);
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1672 = _1662 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1674 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1664);
    float _1676 = _1636 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1678 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1680 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1674);
    bool _1682 = !_1648;
    float _1684 = _1682 ? _459 : as_type<float>(_1668);
    float _1686 = _1670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1688 = _179 > 0.5;
    float _1690 = _1680 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1692 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1694 = 1.0 / _1672;
    float _1696 = _1684 + 0.5;
    float _1698 = _1690 + _1672;
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1702 = _1700 != 0;
    float _1704 = _1692 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1706 = fma(_1676, _1696, _359);
    float _1708 = -_503;
    int _1710 = _1688 ? as_type<int>(_1708) : as_type<int>(_503);
    float _1712 = -_441;
    float _1714 = _1712 + 1.0;
    int _1716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1718 = _1716 != 0;
    float _1720 = _445 * (-0.15915493667125701904296875);
    float _1722 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1724 = !_1702;
    float _1726 = _1724 ? _503 : as_type<float>(_1710);
    float _1728 = _1678 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1730 = -_1660;
    float _1732 = fma(_1684, _1730, _1706);
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1736 = _1698 * _1694;
    float _1738 = _1736 * 0.5;
    float _1740 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1742 = _1720 * 6.283185482025146484375;
    float _1744 = sin(_1742);
    float _1746 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1748 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1746);
    float _1750 = -_459;
    int _1752 = _585 ? as_type<int>(_1750) : as_type<int>(_459);
    float _1754 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1756 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1758 = isnan(0.5);
    bool _1760 = _1756 || _1758;
    bool _1762 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1764 = _1760 || _1762;
    bool _1766 = !_1718;
    float _1768 = _1766 ? _459 : as_type<float>(_1752);
    float _1770 = _1754 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1772 = 1.0 / _1748;
    float _1774 = _1722 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1776 = _459 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_60.x = _1770;
    out.m_60.y = _1704;
    out.m_60.z = _1686;
    out.m_60.w = _1734;
    float _1778 = _1720 * 6.283185482025146484375;
    float _1780 = cos(_1778);
    float _1782 = _643 * _1744;
    float _1784 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1786 = _1656 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1788 = _1726 + (-0.5);
    float _1790 = _1768 + 0.5;
    float _1792 = -_1786;
    float _1794 = -_347;
    float _1796 = fma(_1792, _1788, _1794);
    float _1798 = fma(_1728, _1790, _389);
    float _1800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1804 = _1772 * _1802;
    float _1806 = _643 * _1780;
    float _1808 = -_1782;
    float _1810 = fma(_529, _1780, _1808);
    float _1812 = _561 + (-0.5);
    float _1814 = fma(_1726, _1642, _1796);
    float _1816 = fma(_529, _1744, _1806);
    float _1818 = _1810 + 0.5;
    float _1820 = abs(_1804);
    float _1822 = log2(_1820);
    float _1824 = _1784 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1826 = _1816 + (-0.5);
    float _1828 = fma(_1774, _1818, _385);
    float _1830 = -_433;
    float _1832 = _1830 + 1.0;
    float _1834 = -_1824;
    float _1836 = -_449;
    float _1838 = fma(_1834, _1826, _1836);
    float _1840 = -_503;
    float _1842 = _1840 + 0.5;
    float _1844 = _1800 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1846 = -_1832;
    float _1848 = fma(_1810, _1846, _1828);
    float _1850 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1852 = -_1844;
    float _1854 = -_447;
    float _1856 = fma(_1852, _1812, _1854);
    out.m_62.y = _1842;
    float _1858 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1860 = _1822 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1864 = _1850 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1866 = fma(_561, _1714, _1856);
    float _1868 = _503 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1870 = exp2(_1860);
    float _1872 = _1862 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1874 = _1858 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1876 = -_443;
    float _1878 = _1876 + 1.0;
    float _1880 = -_1652;
    float _1882 = fma(_1768, _1880, _1798);
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1886 = _1117 * _1868;
    float _1888 = fma(_1816, _1878, _1838);
    out.m_64.x = _1732;
    out.m_64.y = _1814;
    out.m_64.z = _1882;
    out.m_64.w = _1866;
    float _1890 = exp2(_1740);
    bool _1892 = _1804 <= 8000.0;
    bool _1894 = isnan(_1804);
    bool _1896 = _1892 || _1894;
    bool _1898 = isnan(8000.0);
    bool _1900 = _1896 || _1898;
    float _1902 = float(_1900);
    out.m_66.x = _1864;
    out.m_66.y = _1872;
    out.m_66.z = _1874;
    out.m_66.w = _1884;
    float _1904 = fma(_1149, _1776, _1886);
    float _1906 = -_1868;
    float _1908 = _1129 * _1906;
    float _1910 = fma(_1870, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1912 = precise::clamp(_1910, 0.0, 1.0);
    out.m_68.x = _1848;
    out.m_68.y = _1888;
    float _1914 = _1145 * _1868;
    float _1916 = in.m_70.x;
    float _1918 = _1517 * 0.5;
    float _1920 = fma(_1143, _1776, _1908);
    float _1922 = fma(_1157, _1776, _1914);
    float _1924 = fma(_1912, -2.0, 3.0);
    float _1926 = _1912 * _1912;
    float _1928 = _1481 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1930 = _1926 * _1924;
    float _1932 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1928);
    float _1934 = _1581 + _1517;
    float _1936 = -_1930;
    float _1938 = _1936 + 1.0;
    float _1940 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1932);
    float _1942 = _1934 * 0.5;
    float _1944 = fma(_1938, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1930);
    float _1946 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1940);
    float _1948 = fma(_1583, -0.5, _1918);
    float _1950 = _1902 * _1944;
    float _1952 = _1946 + _1517;
    float _1954 = _1902;
    float _1956 = _1517;
    float _1958 = _1946;
    float _1960 = _1948;
    float _1962 = _1942;
    if (_1764)
    {
        _1954 = 1.0;
    }
    float _1964 = _1954;
    float _1966 = _1952 * 0.5;
    float _1968 = _1964;
    if (!_1764)
    {
        float _1970 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1972 = _1970 * 0.15915493667125701904296875;
        float _1974 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1976 = _1972 * 6.283185482025146484375;
        float _1978 = cos(_1976);
        float _1980 = _1974 * 0.15915493667125701904296875;
        float _1982 = _1972 * 6.283185482025146484375;
        float _1984 = sin(_1982);
        float _1986 = 1.0 / _1978;
        float _1988 = _1980 * 6.283185482025146484375;
        float _1990 = cos(_1988);
        float _1992 = _1984 * _1986;
        float _1994 = _1980 * 6.283185482025146484375;
        float _1996 = sin(_1994);
        float _1998 = _1990 * _1992;
        float _2000 = 1.0 / _1998;
        float _2002 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2004 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2002;
        float _2006 = 1.0 / _2004;
        float _2008 = _1996 * _2000;
        float _2010 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2012 = fma(_1804, _2008, _2010);
        float _2014 = _2012 * _2006;
        float _2016 = precise::clamp(_2014, 0.0, 1.0);
        _1968 = _2016;
    }
    float _2018 = _1968;
    float _2020 = -_1890;
    float _2022 = _2020 + 1.0;
    float _2024 = _1950 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2026 = -_1605;
    float _2028 = _2026 + 1.0;
    float _2030 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1581;
    out.gl_Position.y = _1583;
    out.gl_Position.z = _1946;
    out.gl_Position.w = _1517;
    float _2032 = _2028 * _2024;
    float _2034 = precise::clamp(_2032, 0.0, 1.0);
    float _2036 = _1161 + _1920;
    float _2038 = _2030 * _1609;
    float _2040 = -_2030;
    float _2042 = _2040 + 1.0;
    float _2044 = _1171 + _1922;
    float _2046 = _1155 + _1904;
    float _2048 = _1630 * _2038;
    out.m_72.x = _1277;
    out.m_72.y = _1273;
    out.m_72.z = _1281;
    bool _2050 = _1311 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2052 = isnan(_1311);
    bool _2054 = _2050 || _2052;
    bool _2056 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2058 = _2054 || _2056;
    out.m_74.x = _2036;
    out.m_74.y = _2044;
    out.m_74.z = _2046;
    float _2060 = _1620 * _2038;
    float _2062 = -_2034;
    float _2064 = fma(_2062, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2066 = _1620 * _2042;
    float _2068 = fma(_1620, _2048, _1618);
    float _2070 = fma(_1626, _2060, _1614);
    float _2072 = fma(_1628, _2060, _1616);
    float _2074 = _2064 * _1916;
    out.m_76.x = _1942;
    out.m_76.y = _1948;
    out.m_76.z = _1966;
    out.m_76.w = _1517;
    float _2076 = _2060;
    if (!_2058)
    {
        _1956 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2078 = _1956;
    float _2080 = _2074 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_78.x = _2070;
    out.m_78.y = _2072;
    out.m_78.z = _2068;
    out.m_78.w = _2066;
    float _2082 = _2080;
    float _2084 = _2078;
    float _2086 = _2078;
    if (!_2058)
    {
        _1958 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2088 = _1958;
    float _2090 = _2088;
    float _2092 = _2088;
    if (!_2058)
    {
        _2076 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2094 = _2076;
    out.m_80.x = _2080;
    float _2096 = _2018 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2098 = _2094;
    float _2100 = _2094;
    if (!_2058)
    {
        _1960 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2102 = _1960;
    float _2104 = _2102;
    float _2106 = _2102;
    if (!_2058)
    {
        _1962 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2108 = _1962;
    float _2110 = _2108;
    float _2112 = _2108;
    if (!_2058)
    {
        _2082 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2114 = _2082;
    bool _2116 = !_2058;
    float _2118 = _2114;
    float _2120 = _2114;
    if (!_2116)
    {
        bool _2122 = _1311 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2124 = isnan(_1311);
        bool _2126 = _2122 || _2124;
        bool _2128 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2130 = _2126 || _2128;
        if (!_2130)
        {
            float _2132 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2134 = _1311 + _2132;
            float _2136 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2138 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2136;
            float _2140 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2142 = _2140 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2144 = 1.0 / _2138;
            float _2146 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2148 = _2146 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2150 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2152 = _2150 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2154 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2156 = _2154 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2158 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2160 = _2158 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2162 = _2134 * _2144;
            float _2164 = precise::clamp(_2162, 0.0, 1.0);
            float _2166 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2168 = _2166 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2170 = fma(_2164, _2142, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2172 = fma(_2164, _2168, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2174 = fma(_2164, _2148, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2176 = fma(_2164, _2152, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2178 = fma(_2164, _2156, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2180 = fma(_2164, _2160, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2112 = _2174;
            _2100 = _2178;
            _2106 = _2170;
            _2092 = _2176;
            _2086 = _2172;
            _2120 = _2180;
            _2182 = true;
        }
        else
        {
            bool _2184 = _1311 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2186 = isnan(_1311);
            bool _2188 = _2184 || _2186;
            bool _2190 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2192 = _2188 || _2190;
            if (!_2192)
            {
                _2104 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2194 = _2104;
            _2106 = _2194;
            if (!_2192)
            {
                _2110 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2196 = _2110;
            _2112 = _2196;
            if (!_2192)
            {
                _2084 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2198 = _2084;
            _2086 = _2198;
            if (!_2192)
            {
                _2090 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2200 = _2090;
            _2092 = _2200;
            if (!_2192)
            {
                _2098 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2202 = _2098;
            _2100 = _2202;
            if (!_2192)
            {
                _2118 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2204 = _2118;
            bool _2206 = !_2192;
            _2120 = _2204;
            if (!_2206)
            {
                bool _2208 = _1311 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2210 = isnan(_1311);
                bool _2212 = _2208 || _2210;
                bool _2214 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2216 = _2212 || _2214;
                if (!_2216)
                {
                    float _2218 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2220 = _1311 + _2218;
                    float _2222 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2224 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2222;
                    float _2226 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2228 = _2226 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2230 = 1.0 / _2224;
                    float _2232 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2234 = _2232 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2236 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2238 = _2236 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2240 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2242 = _2240 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2244 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2246 = _2244 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2248 = _2220 * _2230;
                    float _2250 = precise::clamp(_2248, 0.0, 1.0);
                    float _2252 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2254 = _2252 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2256 = fma(_2250, _2228, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2258 = fma(_2250, _2254, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2260 = fma(_2250, _2234, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2262 = fma(_2250, _2238, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2264 = fma(_2250, _2242, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2266 = fma(_2250, _2246, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2112 = _2260;
                    _2100 = _2264;
                    _2106 = _2256;
                    _2092 = _2262;
                    _2086 = _2258;
                    _2120 = _2266;
                    _2182 = true;
                }
                else
                {
                    _2112 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2100 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2106 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2092 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2086 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2120 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2182 = false;
    float _2268 = _2112;
    float _2270 = _2100;
    float _2272 = _2106;
    float _2274 = _2092;
    float _2276 = _2086;
    float _2278 = _2120;
    float _2280 = _2096 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2282 = fma(_2044, -0.5, 0.5);
    float _2284 = precise::clamp(_2282, 0.0, 1.0);
    float _2286 = -_2268;
    float _2288 = _2286 + _2270;
    float _2290 = -_2272;
    float _2292 = _2290 + _2274;
    out.m_82.x = 0.0;
    float _2294 = fma(_2284, _2288, _2268);
    float _2296 = -_2276;
    float _2298 = _2296 + _2278;
    float _2300 = fma(_2284, _2292, _2272);
    float _2302 = _2294 * 0.586610972881317138671875;
    bool _2304 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2306 = fma(_2284, _2298, _2276);
    out.m_49.x = _2280;
    float _2308 = fma(_2300, 0.298911988735198974609375, _2302);
    bool _2310 = _2018 > 0.0;
    bool _2312 = isnan(_2018);
    bool _2314 = _2310 || _2312;
    bool _2316 = isnan(0.0);
    bool _2318 = _2314 || _2316;
    float _2320 = fma(_2306, 0.114477999508380889892578125, _2308);
    float _2322 = -_2320;
    float _2324 = _2300 + _2322;
    float _2326 = -_2320;
    float _2328 = _2294 + _2326;
    float _2330 = -_2320;
    float _2332 = _2306 + _2330;
    float _2334 = fma(_2324, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2320);
    float _2336 = fma(_2328, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2320);
    float _2338 = fma(_2332, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2320);
    bool _2340 = !_2304;
    if (!_2340)
    {
        float _2342 = -_1273;
        float _2344 = _2342 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2346 = -_1277;
        float _2348 = _2346 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2350 = -_1281;
        float _2352 = _2350 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2354 = _2344 * _2344;
        float _2356 = fma(_2348, _2348, _2354);
        float _2358 = fma(_2352, _2352, _2356);
        float _2360 = sqrt(_2358);
        float _2362 = rsqrt(_2358);
        float _2364 = -_2360;
        float _2366 = _2364 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2368 = _2366 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2370 = precise::clamp(_2368, 0.0, 1.0);
        float _2372 = _2348 * _2362;
        float _2374 = _2344 * _2362;
        float _2376 = abs(_2370);
        float _2378 = log2(_2376);
        float _2380 = _2352 * _2362;
        float _2382 = _2372 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2384 = _2044 * _2374;
        float _2386 = -_2374;
        float _2388 = -_2382;
        float _2390 = fma(_2386, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2388);
        float _2392 = fma(_2036, _2372, _2384);
        float _2394 = -_2380;
        float _2396 = fma(_2394, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2390);
        float _2398 = fma(_2046, _2380, _2392);
        float _2400 = precise::clamp(_2398, 0.0, 1.0);
        float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2404 = _2396 + _2402;
        float _2406 = _2378 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2408 = _2404 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2410 = precise::clamp(_2408, 0.0, 1.0);
        float _2412 = exp2(_2406);
        float _2414 = _2412 * _2410;
        float _2416 = _2400 * _2414;
        float _2418 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2420 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2422 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2418;
        out.m_82.y = _2420;
        out.m_82.z = _2422;
    }
    out.m_84.x = _2334;
    out.m_84.y = _2336;
    out.m_84.z = _2338;
    if (_2318)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2424 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2424;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

