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
    float4 m_78 [[user(locn3)]];
    float4 m_86 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_76 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_68 [[attribute(0)]];
    float4 m_64 [[attribute(1)]];
    float4 m_66 [[attribute(3)]];
    float4 m_50 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_60 [[attribute(7)]];
    float4 m_62 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1606 = false;
    bool _733 = false;
    bool _199 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_50.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    if (!_109)
    {
        out.m_53.x = 0.0;
    }
    int _115 = 0;
    if (!_109)
    {
        float _117 = _113 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1904 = as_type<float>(_119);
        out.gl_Position.z = _1904;
    }
    if (!_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = in.m_55.w;
    bool _125 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_123);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    float _135 = -_123;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _139 = 0.0;
    if (_133)
    {
        float _141 = float(_105);
        _139 = _141;
    }
    float _143 = _139;
    bool _145 = _137 >= _143;
    bool _147 = !_133;
    bool _149 = _145 || _147;
    float _151 = 0.0;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _151;
    if (_149)
    {
        out.m_53.x = 0.0;
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
        float _1972 = as_type<float>(_157);
        out.gl_Position.z = _1972;
    }
    if (_149)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    bool _161 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _163 = as_type<int>(_159) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_159) & 2;
    bool _169 = _167 != 0;
    bool _171 = !_165;
    float _173 = _171 ? (-0.5) : 0.5;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_161;
    float _197;
    if (!_179)
    {
        float _181 = in.m_60.x;
        float _183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _187 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _189 = _187 * _183;
        float _191 = floor(_189);
        float _193 = -_191;
        float _195 = _189 + _193;
        _197 = _195;
        _199 = true;
    }
    else
    {
        float _201 = float(_105);
        float _203 = 1.0 / _201;
        float _205 = _137 * _203;
        _197 = _205;
    }
    _199 = false;
    float _207 = _197;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _211 = _207 + _209;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _215 = _207 + _213;
    bool _217 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _219 = isnan(_207);
    bool _221 = _217 || _219;
    bool _223 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _225 = _221 || _223;
    float _227 = float(_225);
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _229;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _235 = _233 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _237;
    bool _241 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _243 = isnan(_207);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -_227;
    float _255 = _253 + 1.0;
    float _257 = 1.0 / _235;
    float _259 = _251 * _255;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _261;
    float _265 = 1.0 / _231;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _267;
    float _271 = 1.0 / _239;
    float _273 = _211 * _265;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _277 = _207 + _275;
    bool _279 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _281 = isnan(_207);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = _277 * _257;
    float _293 = -_251;
    float _295 = _293 + 1.0;
    float _297 = _215 * _271;
    bool _299 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _301 = isnan(_207);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = _289 * _295;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _321 = -_289;
    float _323 = _321 + 1.0;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _329;
    float _333 = fma(_319, _291, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _335 = _309 * _323;
    float _337 = fma(_327, _291, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _339 = fma(_331, _273, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _341 = in.m_62.x;
    float _343 = in.m_62.y;
    float _345 = fma(_315, _273, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _347 = -_309;
    float _349 = _347 + 1.0;
    float _351 = _339 * _335;
    float _353 = fma(_263, _297, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _355 = _345 * _335;
    float _357 = fma(_269, _297, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _359 = in.m_50.x;
    float _361 = in.m_50.y;
    float _363 = in.m_50.z;
    float _365 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].y, _351);
    float _367 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].x, _355);
    float _369 = in.m_64.x;
    float _371 = in.m_64.y;
    float _373 = in.m_64.z;
    float _375 = in.m_64.w;
    float _377 = fma(_337, _311, _365);
    float _379 = fma(_333, _311, _367);
    float _381 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _173);
    float _383 = in.m_66.x;
    float _385 = in.m_66.y;
    float _387 = in.m_66.z;
    float _389 = in.m_66.w;
    float _391 = fma(_353, _259, _377);
    float _393 = fma(_357, _259, _379);
    float _395 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[146].y, _391);
    float _397 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[146].x, _393);
    float _399 = _395 * _343;
    float _401 = _397 * _341;
    float _403 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _177);
    float _405 = _399 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _407 = _401 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _409 = _405 * _403;
    float _411 = _407 * _381;
    float _413 = _361 * _371;
    float _415 = _409 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _417 = fma(_359, _369, _413);
    float _419 = _361 * _385;
    float _421 = _409 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _423 = fma(_411, (*spvDescriptorSet0.vp_c8)._m0[26].x, _415);
    float _425 = fma(_363, _373, _417);
    float _427 = fma(_359, _383, _419);
    float _429 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _431 = fma(_411, (*spvDescriptorSet0.vp_c8)._m0[24].x, _421);
    float _433 = _425 + _375;
    float _435 = fma(_363, _387, _427);
    float _437 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[26].z, _423);
    float _439 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[24].z, _431);
    float _441 = in.m_60.x;
    float _443 = in.m_60.y;
    float _445 = _435 + _389;
    float _447 = _437 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _449 = _439 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _451 = in.m_68.y;
    float _453 = _445 + _447;
    float _455 = _433 + _449;
    float _457 = _409 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _459 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _461 = _453 + _459;
    float _463 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _465 = _455 + _463;
    float _467 = fma(_411, (*spvDescriptorSet0.vp_c8)._m0[25].x, _457);
    float _469 = _461 * _461;
    float _471 = _465 * _465;
    float _473 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[25].z, _467);
    int _475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _477 = _475 != 0;
    float _479 = _471 + _469;
    float _481 = _473 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _485 = _483 != 0;
    float _487 = sqrt(_479);
    bool _489 = _443 > 0.5;
    bool _491 = _441 > 0.5;
    float _493 = _361 + _451;
    float _495 = -_177;
    int _497 = _489 ? as_type<int>(_495) : as_type<int>(_177);
    float _499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _501 = _493 + _481;
    bool _503 = _487 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _505 = _481;
    float _507 = _361;
    float _509 = _473;
    float _511 = _471;
    float _513 = _455;
    float _515 = _493;
    float _517 = _259;
    if (!_503)
    {
        _505 = _471;
    }
    float _519 = _505;
    float _521 = _519;
    if (!_503)
    {
        _507 = _469;
    }
    float _523 = _507;
    float _525 = _523;
    if (!_503)
    {
        _509 = _453;
    }
    float _527 = _509;
    float _529 = _527;
    if (!_503)
    {
        _511 = _501;
    }
    float _531 = _511;
    bool _533 = !_503;
    float _535 = _531;
    if (!_533)
    {
        float _537 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _539 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _541 = _487 + _539;
        float _543 = _501 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _545 = rsqrt(_479);
        float _547 = _541 * _537;
        float _549 = _547 * 0.15915493667125701904296875;
        float _551 = _549 * 6.283185482025146484375;
        float _553 = sin(_551);
        float _555 = _549 * 6.283185482025146484375;
        float _557 = cos(_555);
        float _559 = fma(_553, _543, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _561 = _545 * _559;
        float _563 = _557 + (-1.0);
        float _565 = fma(_465, _561, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _567 = fma(_461, _561, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _569 = _563 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _571 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _573 = _565 + _571;
        float _575 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _577 = _567 + _575;
        float _579 = fma(_501, _557, _569);
        float _581 = _573 * _573;
        float _583 = _577 * _577;
        _535 = _579;
        _521 = _581;
        _525 = _583;
        _513 = _565;
        _529 = _567;
    }
    float _585 = _535;
    float _587 = _521;
    float _589 = _525;
    float _591 = _513;
    float _593 = _529;
    float _595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _597 = -_173;
    int _599 = _491 ? as_type<int>(_597) : as_type<int>(_173);
    float _601 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _603 = _585 + _601;
    bool _605 = !_485;
    float _607 = _605 ? _177 : as_type<float>(_497);
    float _609 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _611 = !_477;
    float _613 = _611 ? _173 : as_type<float>(_599);
    float _615 = fma(_603, _603, _587);
    float _617 = _173 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _619 = -_607;
    float _621 = _619 + 0.5;
    float _623 = _609 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _625 = _609 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _627 = _609 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _629 = _613 + 0.5;
    float _631 = _621 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _633 = _615 + _589;
    float _635 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[24].x, _623);
    float _637 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[25].x, _625);
    float _639 = _629 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _641 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[26].x, _627);
    float _643 = _631 * _595;
    float _645 = _639 * _499;
    float _647 = sqrt(_633);
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _659 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _663 = _651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _667 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _671 = _657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _635 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _677 = _637 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _679 = _641 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_70.x = _659;
    out.m_70.y = _663;
    out.m_70.z = _667;
    out.m_70.w = _665;
    bool _681 = _647 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _683 = isnan(_647);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _689 = _685 || _687;
    out.m_72.x = _669;
    out.m_72.y = _671;
    out.m_72.z = _673;
    out.m_74.x = _645;
    out.m_74.y = _643;
    out.m_76.x = _675;
    out.m_76.y = _677;
    out.m_76.z = _679;
    float _691 = _641;
    float _693 = _673;
    float _695 = _669;
    float _697 = _593;
    if (!_689)
    {
        _691 = 1.0;
    }
    float _699 = _691;
    bool _701 = !_689;
    float _703 = _699;
    if (!_701)
    {
        bool _705 = _647 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _707 = isnan(_647);
        bool _709 = _705 || _707;
        bool _711 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _713 = _709 || _711;
        if (!_713)
        {
            float _715 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _717 = _647 + _715;
            float _719 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _721 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _719;
            float _723 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _725 = _723 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _727 = 1.0 / _721;
            float _729 = _717 * _727;
            float _731 = fma(_729, _725, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _703 = _731;
            _733 = true;
        }
        else
        {
            bool _735 = _647 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _737 = isnan(_647);
            bool _739 = _735 || _737;
            bool _741 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _743 = _739 || _741;
            if (!_743)
            {
                float _745 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _747 = _647 + _745;
                float _749 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _751 = _749 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _753 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _755 = _753 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _757 = 1.0 / _751;
                float _759 = _747 * _757;
                float _761 = fma(_759, _755, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _703 = _761;
                _733 = true;
            }
            else
            {
                _703 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _733 = false;
    float _763 = _703;
    float _765 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _767 = _591 + _765;
    float _769 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _771 = _593 + _769;
    float _773 = fma(_767, _763, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _775 = fma(_771, _763, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _777 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _779 = _773 + _777;
    float _781 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _783 = _775 + _781;
    float _785 = fma(_779, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _787 = fma(_783, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _3034 = float2(_785, _787);
    float _789 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_3034, float2(0.0), isnan(_3034)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_3034, float2(0.0), isnan(_3034)), level(0.0)).x;
    float _791 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _793 = _585 + _791;
    bool _795 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _797 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _799 = _795 || _797;
    bool _801 = isnan(0.5);
    bool _803 = _799 || _801;
    float _805 = fma(_793, _763, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _807 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _809 = _763;
    float _811 = (*spvDescriptorSet0.vp_c15)._m0[630].z;
    float _813 = _773;
    if (!_803)
    {
        float _815 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _817 = _433 + _815;
        _809 = _817;
    }
    float _819 = _809;
    float _821 = _819;
    if (!_803)
    {
        float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        _693 = _823;
    }
    float _825 = _693;
    float _827 = _787;
    if (!_803)
    {
        float _829 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        _827 = _829;
    }
    float _831 = _827;
    float _833 = _831;
    if (!_803)
    {
        float _835 = _831 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        _833 = _835;
    }
    float _837 = _833;
    float _839 = fma(_789, 100.0, _493);
    float _841 = _789;
    float _843 = _837;
    if (!_803)
    {
        float _845 = -_493;
        float _847 = _845 + _805;
        _515 = _847;
    }
    float _849 = _515;
    float _851 = fma(_789, 100.0, _805);
    float _853 = _851;
    float _855 = _849;
    if (!_803)
    {
        float _857 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _859 = _839 + _857;
        _811 = _859;
    }
    float _861 = _811;
    float _863 = _861;
    if (!_803)
    {
        float _865 = _861 * _861;
        _695 = _865;
    }
    float _867 = _695;
    float _869 = _867;
    if (!_803)
    {
        float _871 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _873 = _445 + _871;
        _863 = _873;
    }
    float _875 = _863;
    if (!_803)
    {
        float _877 = fma(_819, _819, _867);
        _869 = _877;
    }
    float _879 = _869;
    float _881 = _879;
    if (!_803)
    {
        float _883 = fma(_875, _875, _879);
        _881 = _883;
    }
    float _885 = _881;
    float _887 = _885;
    if (!_803)
    {
        float _889 = sqrt(_885);
        _887 = _889;
    }
    float _891 = _887;
    if (!_803)
    {
        float _893 = precise::min(_891, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        _821 = _893;
    }
    float _895 = _821;
    float _897 = _895;
    if (!_803)
    {
        float _899 = _895 * _825;
        _841 = _899;
    }
    float _901 = _841;
    float _903 = _901;
    if (_803)
    {
        _897 = _851;
    }
    float _905 = _897;
    float _907 = _905;
    if (!_803)
    {
        float _909 = _837 * _901;
        _853 = _909;
    }
    float _911 = _853;
    if (!_803)
    {
        float _913 = -_433;
        float _915 = _913 + _773;
        _843 = _915;
    }
    float _917 = _843;
    if (!_803)
    {
        float _919 = -_445;
        float _921 = _919 + _775;
        _903 = _921;
    }
    float _923 = _903;
    if (!_803)
    {
        float _925 = fma(_849, _911, _839);
        _907 = _925;
    }
    float _927 = _907;
    if (!_803)
    {
        float _929 = fma(_917, _911, _433);
        _813 = _929;
    }
    float _931 = _813;
    if (_803)
    {
        _855 = _775;
    }
    float _933 = _855;
    float _935 = _933;
    if (!_803)
    {
        float _937 = fma(_923, _911, _445);
        _935 = _937;
    }
    float _939 = _935;
    float _941 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _943 = _927 + _941;
    float _945 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _947 = _931 + _945;
    float _949 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _951 = _939 + _949;
    float _953 = _943 * _943;
    float _955 = fma(_947, _947, _953);
    float _957 = fma(_951, _951, _955);
    float _959 = rsqrt(_957);
    float _961 = sqrt(_957);
    float _963 = _959 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _965 = _947 * _963;
    float _967 = _951 * _963;
    float _969 = _965 * _965;
    float _971 = _967 * _967;
    float _973 = _969 + _971;
    float _975 = sqrt(_973);
    bool _977 = _975 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _979 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _981 = _975 + _979;
    float _983 = _951;
    float _985 = _973;
    float _987 = _981;
    float _989 = _943;
    float _991 = _967;
    if (_977)
    {
        float _993 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _983 = _993;
    }
    float _995 = _983;
    if (_977)
    {
        float _997 = rsqrt(_973);
        _985 = _997;
    }
    float _999 = _985;
    if (_977)
    {
        float _1001 = _981 * _995;
        _987 = _1001;
    }
    float _1003 = _987;
    if (_977)
    {
        float _1005 = _1003 * 0.15915493667125701904296875;
        _697 = _1005;
    }
    float _1007 = _697;
    float _1009 = _959;
    float _1011 = _1007;
    if (_977)
    {
        float _1013 = _1007 * 6.283185482025146484375;
        float _1015 = sin(_1013);
        _1009 = _1015;
    }
    float _1017 = _1009;
    float _1019 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1021 = precise::max(0.0, _1019);
    float _1023 = _825;
    float _1025 = _1021;
    if (_977)
    {
        float _1027 = _1007 * 6.283185482025146484375;
        float _1029 = cos(_1027);
        _1023 = _1029;
    }
    float _1031 = _1023;
    float _1033 = -_963;
    float _1035 = -_1021;
    float _1037 = fma(_943, _1033, _1035);
    float _1039 = _1037;
    if (!_977)
    {
        _989 = _965;
    }
    float _1041 = _989;
    float _1043 = fma(_433, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1045 = _1041;
    if (_977)
    {
        float _1047 = _1037 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1025 = _1047;
    }
    float _1049 = _1025;
    float _1051 = floor(_1043);
    float _1053 = _1017;
    float _1055 = _1049;
    if (_977)
    {
        float _1057 = fma(_1017, _1049, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1053 = _1057;
    }
    float _1059 = _1053;
    float _1061 = _1059;
    if (_977)
    {
        float _1063 = _1031 + (-1.0);
        _1055 = _1063;
    }
    float _1065 = _1055;
    float _1067 = _1065;
    if (_977)
    {
        float _1069 = _999 * _1059;
        _517 = _1069;
    }
    float _1071 = _517;
    if (!_977)
    {
        _1061 = _969;
    }
    float _1073 = _1061;
    float _1075 = _927 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1077 = _1073;
    if (_977)
    {
        float _1079 = _1065 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1011 = _1079;
    }
    float _1081 = _1011;
    if (_977)
    {
        float _1083 = _965 * _1071;
        _1045 = _1083;
    }
    float _1085 = _1045;
    if (_977)
    {
        float _1087 = _967 * _1071;
        _991 = _1087;
    }
    float _1089 = _991;
    if (!_977)
    {
        _1067 = _971;
    }
    float _1091 = _1067;
    float _1093 = _1091;
    if (_977)
    {
        float _1095 = fma(_1037, _1031, _1081);
        _1039 = _1095;
    }
    float _1097 = _1039;
    if (_977)
    {
        float _1099 = _1085 * _1085;
        _1077 = _1099;
    }
    float _1101 = _1077;
    if (_977)
    {
        float _1103 = _1089 * _1089;
        _1093 = _1103;
    }
    float _1105 = _1093;
    float _1107 = _927 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1109 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1075);
    float _1111 = fma(_1097, _1097, _1101);
    float _1113 = _927 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1115 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1107);
    float _1117 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1109);
    float _1119 = _1111 + _1105;
    float _1121 = _927 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1123 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1115);
    float _1125 = rsqrt(_1119);
    float _1127 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1121);
    float _1129 = _1123 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1131 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1113);
    float _1133 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1135 = fma(_961, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1133);
    float _1137 = precise::clamp(_1135, 0.0, 1.0);
    float _1139 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1127);
    float _1141 = _1117 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1143 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1145 = -_1137;
    float _1147 = _1145 + 1.0;
    float _1149 = _1139 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1151 = _1141 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1153 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1131);
    float _1155 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1143);
    float _1157 = -_1151;
    float _1159 = fma(_1157, _807, 1.0);
    float _1161 = _1153 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1163 = abs(_1147);
    float _1165 = log2(_1163);
    float _1167 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1155);
    float _1169 = _1125 * _1085;
    float _1171 = fma(_445, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1173 = _1125 * _1089;
    float _1175 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1167);
    float _1177 = _1125 * _1097;
    float _1179 = _1169 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1181 = floor(_1171);
    float _1183 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1185 = -_1179;
    float _1187 = fma(_1177, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1185);
    float _1189 = -_1173;
    float _1191 = fma(_1189, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1187);
    float _1193 = _1165 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1195 = -_1051;
    float _1197 = _1043 + _1195;
    float _1199 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1201 = fma(_1191, -0.5, 0.5);
    float _1203 = log2(_1159);
    float _1205 = fma(_1191, 0.5, 0.5);
    float _1207 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1199);
    float _1209 = -_1181;
    float _1211 = _1171 + _1209;
    float _1213 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1183);
    float _1215 = fma(_1205, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1217 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1207);
    float _1219 = 1.0 / _1175;
    float _1221 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1213);
    float _1223 = fma(_1205, _1215, -0.212114393711090087890625);
    float _1225 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1217);
    float _1227 = _1177 + 1.0;
    float _1229 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1221);
    float _1231 = fma(_1205, _1223, 1.570728778839111328125);
    float _1233 = exp2(_1193);
    float _1235 = _1203 * 0.693147182464599609375;
    float _1237 = sqrt(_1201);
    float _1239 = _1225 * _1219;
    float _1241 = _1229 * _1219;
    float _1243 = _1235 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1245 = fma(_1239, 0.5, 0.5);
    float _1247 = fma(_1241, -0.5, 0.5);
    float _1249 = -_1177;
    float _1251 = fma(_1233, _1227, _1249);
    float2 _3826 = float2(_1197, _1211);
    float _1253 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3826, float2(0.0), isnan(_3826)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3826, float2(0.0), isnan(_3826)), level(0.0)).x;
    float3 _3835 = float3(_1245, _1247, _1243);
    float _1255 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3835, float3(0.0), isnan(_3835)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3835, float3(0.0), isnan(_3835)), level(0.0)).x;
    float3 _3846 = float3(_1245, _1247, _1243);
    float4 _1258 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3846, float3(0.0), isnan(_3846)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3846, float3(0.0), isnan(_3846)), level(0.0)).xyzw;
    float _1260 = _1258.x;
    float _1262 = _1258.y;
    float _1264 = _1258.z;
    float _1266 = _1258.w;
    float _1268 = fma(_1251, 0.5, 0.5);
    float _1270 = _1237 * 0.636619746685028076171875;
    float _1272 = -_1231;
    float _1274 = fma(_1270, _1272, 1.0);
    float2 _3872 = float2(_1274, _1268);
    float3 _1278 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3872, float2(0.0), isnan(_3872)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3872, float2(0.0), isnan(_3872)), level(0.0)).xyz;
    float _1280 = _1278.x;
    float _1282 = _1278.y;
    float _1284 = _1278.z;
    float _1286 = _839 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1288 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1290 = _1165 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1292 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1286);
    float _1294 = _839 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1296 = fma(_445, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1292);
    float _1298 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1294);
    float _1300 = _1296 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1302 = fma(_445, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1298);
    float _1304 = 1.0 / _1300;
    float _1306 = _1302 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1308 = _1306 + _1300;
    float _1310 = exp2(_1290);
    float _1312 = _1308 * _1304;
    float _1314 = _1312 * 0.5;
    float _1316 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1318 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1316);
    float _1320 = 1.0 / _1318;
    float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1324 = _1320 * _1322;
    float _1326 = abs(_1324);
    float _1328 = log2(_1326);
    bool _1330 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan(0.5);
    bool _1338 = _1334 || _1336;
    float _1340 = _1328 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1342 = exp2(_1340);
    float _1344 = fma(_1342, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1346 = precise::clamp(_1344, 0.0, 1.0);
    bool _1348 = _1324 <= 8000.0;
    bool _1350 = isnan(_1324);
    bool _1352 = _1348 || _1350;
    bool _1354 = isnan(8000.0);
    bool _1356 = _1352 || _1354;
    float _1358 = float(_1356);
    float _1360 = fma(_1346, -2.0, 3.0);
    float _1362 = _1346 * _1346;
    float _1364 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1288);
    float _1366 = in.m_68.x;
    float _1368 = _1362 * _1360;
    float _1370 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1364);
    float _1372 = -_1368;
    float _1374 = _1372 + 1.0;
    float _1376 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1370);
    float _1378 = fma(_1374, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1368);
    float _1380 = _1376 + _1175;
    float _1382 = _1374;
    float _1384 = _1175;
    float _1386 = _1376;
    float _1388 = _1229;
    if (_1338)
    {
        _1382 = 1.0;
    }
    float _1390 = _1382;
    float _1392 = _1358 * _1378;
    float _1394 = _1380 * 0.5;
    float _1396 = _1390;
    float _1398 = _1394;
    float _1400 = _1225;
    if (!_1338)
    {
        float _1402 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1404 = _1402 * 0.15915493667125701904296875;
        float _1406 = _1404 * 6.283185482025146484375;
        float _1408 = cos(_1406);
        float _1410 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1412 = _1410 * 0.15915493667125701904296875;
        float _1414 = _1404 * 6.283185482025146484375;
        float _1416 = sin(_1414);
        float _1418 = 1.0 / _1408;
        float _1420 = _1412 * 6.283185482025146484375;
        float _1422 = cos(_1420);
        float _1424 = _1416 * _1418;
        float _1426 = _1412 * 6.283185482025146484375;
        float _1428 = sin(_1426);
        float _1430 = _1422 * _1424;
        float _1432 = 1.0 / _1430;
        float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1436 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1434;
        float _1438 = 1.0 / _1436;
        float _1440 = _1428 * _1432;
        float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1444 = fma(_1324, _1440, _1442);
        float _1446 = _1444 * _1438;
        float _1448 = precise::clamp(_1446, 0.0, 1.0);
        _1396 = _1448;
    }
    float _1450 = _1396;
    float _1452 = -_1310;
    float _1454 = _1452 + 1.0;
    float _1456 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1458 = -_1253;
    float _1460 = _1458 + 1.0;
    float _1462 = _1454 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1464 = _961 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1466 = isnan(_961);
    bool _1468 = _1464 || _1466;
    bool _1470 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1472 = _1468 || _1470;
    float _1474 = _1460 * _1456;
    float _1476 = precise::clamp(_1474, 0.0, 1.0);
    float _1478 = _1462 * _1255;
    float _1480 = -_1462;
    float _1482 = _1480 + 1.0;
    float _1484 = -_1476;
    float _1486 = fma(_1484, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.gl_Position.x = _1225;
    out.gl_Position.y = _1229;
    out.gl_Position.z = _1376;
    out.gl_Position.w = _1175;
    float _1488 = _1266 * _1478;
    float _1490 = _1284 * _1478;
    float _1492 = _1486 * _1366;
    float _1494 = _1266 * _1482;
    float _1496 = fma(_1280, _1488, _1260);
    float _1498 = fma(_1282, _1488, _1262);
    float _1500 = _1492 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1502 = fma(_1266, _1490, _1264);
    out.m_78.z = _1394;
    out.m_78.w = _1175;
    float _1504 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1506 = _1476;
    if (!_1472)
    {
        _1506 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1508 = _1506;
    out.m_80.x = _1500;
    float _1510 = _1508;
    float _1512 = _1508;
    if (!_1472)
    {
        _1384 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1514 = _1384;
    float _1516 = _1514;
    float _1518 = _1514;
    if (!_1472)
    {
        _1386 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1520 = _1386;
    out.m_82.x = _1496;
    out.m_82.y = _1498;
    out.m_82.z = _1502;
    out.m_82.w = _1494;
    float _1522 = _1520;
    float _1524 = _1520;
    if (!_1472)
    {
        _1388 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1526 = _1388;
    float _1528 = _1526;
    float _1530 = _1526;
    if (!_1472)
    {
        _1398 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1532 = _1398;
    float _1534 = _1532;
    float _1536 = _1532;
    if (!_1472)
    {
        _1400 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1538 = _1400;
    bool _1540 = !_1472;
    float _1542 = _1538;
    float _1544 = _1538;
    if (!_1540)
    {
        bool _1546 = _961 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1548 = isnan(_961);
        bool _1550 = _1546 || _1548;
        bool _1552 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1554 = _1550 || _1552;
        if (!_1554)
        {
            float _1556 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1558 = _961 + _1556;
            float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1562 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1560;
            float _1564 = 1.0 / _1562;
            float _1566 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1568 = _1566 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1570 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1572 = _1570 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1574 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1576 = _1574 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1578 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1580 = _1578 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1582 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1584 = _1582 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1586 = _1558 * _1564;
            float _1588 = precise::clamp(_1586, 0.0, 1.0);
            float _1590 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1592 = _1590 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1594 = fma(_1588, _1568, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1596 = fma(_1588, _1592, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1598 = fma(_1588, _1572, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1600 = fma(_1588, _1576, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1602 = fma(_1588, _1580, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1604 = fma(_1588, _1584, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1536 = _1596;
            _1530 = _1602;
            _1512 = _1594;
            _1524 = _1600;
            _1518 = _1598;
            _1544 = _1604;
            _1606 = true;
        }
        else
        {
            bool _1608 = _961 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1610 = isnan(_961);
            bool _1612 = _1608 || _1610;
            bool _1614 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1616 = _1612 || _1614;
            if (!_1616)
            {
                _1510 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1618 = _1510;
            _1512 = _1618;
            if (!_1616)
            {
                _1534 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1620 = _1534;
            _1536 = _1620;
            if (!_1616)
            {
                _1516 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1622 = _1516;
            _1518 = _1622;
            if (!_1616)
            {
                _1522 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1624 = _1522;
            _1524 = _1624;
            if (!_1616)
            {
                _1528 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1626 = _1528;
            _1530 = _1626;
            if (!_1616)
            {
                _1542 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1628 = _1542;
            bool _1630 = !_1616;
            _1544 = _1628;
            if (!_1630)
            {
                bool _1632 = _961 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1634 = isnan(_961);
                bool _1636 = _1632 || _1634;
                bool _1638 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1640 = _1636 || _1638;
                if (!_1640)
                {
                    float _1642 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1644 = _961 + _1642;
                    float _1646 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1648 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1646;
                    float _1650 = 1.0 / _1648;
                    float _1652 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1654 = _1652 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1656 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1658 = _1656 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1660 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1662 = _1660 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1664 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1666 = _1664 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1668 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1670 = _1668 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1672 = _1644 * _1650;
                    float _1674 = precise::clamp(_1672, 0.0, 1.0);
                    float _1676 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1678 = _1676 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1680 = fma(_1674, _1654, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1682 = fma(_1674, _1678, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1684 = fma(_1674, _1658, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1686 = fma(_1674, _1662, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1688 = fma(_1674, _1666, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1690 = fma(_1674, _1670, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1536 = _1682;
                    _1530 = _1688;
                    _1512 = _1680;
                    _1524 = _1686;
                    _1518 = _1684;
                    _1544 = _1690;
                    _1606 = true;
                }
                else
                {
                    _1536 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1530 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1512 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1524 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1518 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1544 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1606 = false;
    float _1692 = _1536;
    float _1694 = _1530;
    float _1696 = _1512;
    float _1698 = _1524;
    float _1700 = _1518;
    float _1702 = _1544;
    float _1704 = fma(_677, -0.5, 0.5);
    float _1706 = precise::clamp(_1704, 0.0, 1.0);
    float _1708 = -_1692;
    float _1710 = _1708 + _1694;
    float _1712 = _1504 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1714 = -_1696;
    float _1716 = _1714 + _1698;
    out.m_84.x = 0.0;
    float _1718 = fma(_1706, _1710, _1692);
    float _1720 = fma(_1706, _1716, _1696);
    out.m_53.x = _1712;
    float _1722 = -_1700;
    float _1724 = _1722 + _1702;
    float _1726 = _1718 * 0.586610972881317138671875;
    bool _1728 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1730 = fma(_1706, _1724, _1700);
    float _1732 = fma(_1720, 0.298911988735198974609375, _1726);
    bool _1734 = _1450 > 0.0;
    bool _1736 = isnan(_1450);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan(0.0);
    bool _1742 = _1738 || _1740;
    float _1744 = fma(_1730, 0.114477999508380889892578125, _1732);
    float _1746 = -_1744;
    float _1748 = _1720 + _1746;
    float _1750 = -_1744;
    float _1752 = _1718 + _1750;
    float _1754 = -_1744;
    float _1756 = _1730 + _1754;
    float _1758 = fma(_1748, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1744);
    float _1760 = fma(_1752, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1744);
    float _1762 = fma(_1756, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1744);
    bool _1764 = !_1728;
    if (!_1764)
    {
        float _1766 = -_927;
        float _1768 = _1766 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1770 = -_931;
        float _1772 = _1770 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1774 = -_939;
        float _1776 = _1774 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1778 = _1768 * _1768;
        float _1780 = fma(_1772, _1772, _1778);
        float _1782 = fma(_1776, _1776, _1780);
        float _1784 = sqrt(_1782);
        float _1786 = rsqrt(_1782);
        float _1788 = -_1784;
        float _1790 = _1788 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1792 = _1790 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1794 = precise::clamp(_1792, 0.0, 1.0);
        float _1796 = _1772 * _1786;
        float _1798 = _1768 * _1786;
        float _1800 = abs(_1794);
        float _1802 = log2(_1800);
        float _1804 = _1776 * _1786;
        float _1806 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1808 = _677 * _1798;
        float _1810 = -_1798;
        float _1812 = -_1806;
        float _1814 = fma(_1810, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1812);
        float _1816 = fma(_675, _1796, _1808);
        float _1818 = -_1804;
        float _1820 = fma(_1818, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1814);
        float _1822 = fma(_679, _1804, _1816);
        float _1824 = precise::clamp(_1822, 0.0, 1.0);
        float _1826 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1828 = _1820 + _1826;
        float _1830 = _1802 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1832 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1834 = precise::clamp(_1832, 0.0, 1.0);
        float _1836 = exp2(_1830);
        float _1838 = _1836 * _1834;
        float _1840 = _1824 * _1838;
        float _1842 = _1840 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1844 = _1840 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1846 = _1840 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _1842;
        out.m_84.y = _1844;
        out.m_84.z = _1846;
    }
    out.m_86.x = _1758;
    out.m_86.y = _1760;
    out.m_86.z = _1762;
    if (_1742)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _1848 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1848;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1606 = false;
    bool _733 = false;
    bool _199 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_50.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    if (!_109)
    {
        out.m_53.x = 0.0;
    }
    int _115 = 0;
    if (!_109)
    {
        float _117 = _113 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1904 = as_type<float>(_119);
        out.gl_Position.z = _1904;
    }
    if (!_109)
    {
        return out;
    }
    float _123 = in.m_55.w;
    bool _125 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_123);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    float _135 = -_123;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _139 = 0.0;
    if (_133)
    {
        float _141 = float(_105);
        _139 = _141;
    }
    float _143 = _139;
    bool _145 = _137 >= _143;
    bool _147 = !_133;
    bool _149 = _145 || _147;
    float _151 = 0.0;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _151;
    if (_149)
    {
        out.m_53.x = 0.0;
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
        float _1972 = as_type<float>(_157);
        out.gl_Position.z = _1972;
    }
    if (_149)
    {
        return out;
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    bool _161 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _163 = as_type<int>(_159) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_159) & 2;
    bool _169 = _167 != 0;
    bool _171 = !_165;
    float _173 = _171 ? (-0.5) : 0.5;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_161;
    float _197;
    if (!_179)
    {
        float _181 = in.m_60.x;
        float _183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _187 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _189 = _187 * _183;
        float _191 = floor(_189);
        float _193 = -_191;
        float _195 = _189 + _193;
        _197 = _195;
        _199 = true;
    }
    else
    {
        float _201 = float(_105);
        float _203 = 1.0 / _201;
        float _205 = _137 * _203;
        _197 = _205;
    }
    _199 = false;
    float _207 = _197;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _211 = _207 + _209;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _215 = _207 + _213;
    bool _217 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _219 = isnan(_207);
    bool _221 = _217 || _219;
    bool _223 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _225 = _221 || _223;
    float _227 = float(_225);
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _229;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _235 = _233 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _237;
    bool _241 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _243 = isnan(_207);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -_227;
    float _255 = _253 + 1.0;
    float _257 = 1.0 / _235;
    float _259 = _251 * _255;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _261;
    float _265 = 1.0 / _231;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _267;
    float _271 = 1.0 / _239;
    float _273 = _211 * _265;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _277 = _207 + _275;
    bool _279 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _281 = isnan(_207);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = _277 * _257;
    float _293 = -_251;
    float _295 = _293 + 1.0;
    float _297 = _215 * _271;
    bool _299 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _301 = isnan(_207);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = _289 * _295;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _321 = -_289;
    float _323 = _321 + 1.0;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _329;
    float _333 = fma(_319, _291, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _335 = _309 * _323;
    float _337 = fma(_327, _291, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _339 = fma(_331, _273, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _341 = in.m_62.x;
    float _343 = in.m_62.y;
    float _345 = fma(_315, _273, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _347 = -_309;
    float _349 = _347 + 1.0;
    float _351 = _339 * _335;
    float _353 = fma(_263, _297, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _355 = _345 * _335;
    float _357 = fma(_269, _297, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _359 = in.m_50.x;
    float _361 = in.m_50.y;
    float _363 = in.m_50.z;
    float _365 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].y, _351);
    float _367 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].x, _355);
    float _369 = in.m_64.x;
    float _371 = in.m_64.y;
    float _373 = in.m_64.z;
    float _375 = in.m_64.w;
    float _377 = fma(_337, _311, _365);
    float _379 = fma(_333, _311, _367);
    float _381 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _173);
    float _383 = in.m_66.x;
    float _385 = in.m_66.y;
    float _387 = in.m_66.z;
    float _389 = in.m_66.w;
    float _391 = fma(_353, _259, _377);
    float _393 = fma(_357, _259, _379);
    float _395 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[146].y, _391);
    float _397 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[146].x, _393);
    float _399 = _395 * _343;
    float _401 = _397 * _341;
    float _403 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _177);
    float _405 = _399 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _407 = _401 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _409 = _405 * _403;
    float _411 = _407 * _381;
    float _413 = _361 * _371;
    float _415 = _409 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _417 = fma(_359, _369, _413);
    float _419 = _361 * _385;
    float _421 = _409 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _423 = fma(_411, (*spvDescriptorSet0.vp_c8)._m0[26].x, _415);
    float _425 = fma(_363, _373, _417);
    float _427 = fma(_359, _383, _419);
    float _429 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _431 = fma(_411, (*spvDescriptorSet0.vp_c8)._m0[24].x, _421);
    float _433 = _425 + _375;
    float _435 = fma(_363, _387, _427);
    float _437 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[26].z, _423);
    float _439 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[24].z, _431);
    float _441 = in.m_60.x;
    float _443 = in.m_60.y;
    float _445 = _435 + _389;
    float _447 = _437 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _449 = _439 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _451 = in.m_68.y;
    float _453 = _445 + _447;
    float _455 = _433 + _449;
    float _457 = _409 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _459 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _461 = _453 + _459;
    float _463 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _465 = _455 + _463;
    float _467 = fma(_411, (*spvDescriptorSet0.vp_c8)._m0[25].x, _457);
    float _469 = _461 * _461;
    float _471 = _465 * _465;
    float _473 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[25].z, _467);
    int _475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _477 = _475 != 0;
    float _479 = _471 + _469;
    float _481 = _473 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _485 = _483 != 0;
    float _487 = sqrt(_479);
    bool _489 = _443 > 0.5;
    bool _491 = _441 > 0.5;
    float _493 = _361 + _451;
    float _495 = -_177;
    int _497 = _489 ? as_type<int>(_495) : as_type<int>(_177);
    float _499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _501 = _493 + _481;
    bool _503 = _487 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _505 = _481;
    float _507 = _361;
    float _509 = _473;
    float _511 = _471;
    float _513 = _455;
    float _515 = _493;
    float _517 = _259;
    if (!_503)
    {
        _505 = _471;
    }
    float _519 = _505;
    float _521 = _519;
    if (!_503)
    {
        _507 = _469;
    }
    float _523 = _507;
    float _525 = _523;
    if (!_503)
    {
        _509 = _453;
    }
    float _527 = _509;
    float _529 = _527;
    if (!_503)
    {
        _511 = _501;
    }
    float _531 = _511;
    bool _533 = !_503;
    float _535 = _531;
    if (!_533)
    {
        float _537 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _539 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _541 = _487 + _539;
        float _543 = _501 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _545 = rsqrt(_479);
        float _547 = _541 * _537;
        float _549 = _547 * 0.15915493667125701904296875;
        float _551 = _549 * 6.283185482025146484375;
        float _553 = sin(_551);
        float _555 = _549 * 6.283185482025146484375;
        float _557 = cos(_555);
        float _559 = fma(_553, _543, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _561 = _545 * _559;
        float _563 = _557 + (-1.0);
        float _565 = fma(_465, _561, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _567 = fma(_461, _561, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _569 = _563 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _571 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _573 = _565 + _571;
        float _575 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _577 = _567 + _575;
        float _579 = fma(_501, _557, _569);
        float _581 = _573 * _573;
        float _583 = _577 * _577;
        _535 = _579;
        _521 = _581;
        _525 = _583;
        _513 = _565;
        _529 = _567;
    }
    float _585 = _535;
    float _587 = _521;
    float _589 = _525;
    float _591 = _513;
    float _593 = _529;
    float _595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _597 = -_173;
    int _599 = _491 ? as_type<int>(_597) : as_type<int>(_173);
    float _601 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _603 = _585 + _601;
    bool _605 = !_485;
    float _607 = _605 ? _177 : as_type<float>(_497);
    float _609 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _611 = !_477;
    float _613 = _611 ? _173 : as_type<float>(_599);
    float _615 = fma(_603, _603, _587);
    float _617 = _173 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _619 = -_607;
    float _621 = _619 + 0.5;
    float _623 = _609 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _625 = _609 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _627 = _609 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _629 = _613 + 0.5;
    float _631 = _621 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _633 = _615 + _589;
    float _635 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[24].x, _623);
    float _637 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[25].x, _625);
    float _639 = _629 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _641 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[26].x, _627);
    float _643 = _631 * _595;
    float _645 = _639 * _499;
    float _647 = sqrt(_633);
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _659 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _663 = _651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _667 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _671 = _657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _635 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _677 = _637 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _679 = _641 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_70.x = _659;
    out.m_70.y = _663;
    out.m_70.z = _667;
    out.m_70.w = _665;
    bool _681 = _647 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _683 = isnan(_647);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _689 = _685 || _687;
    out.m_72.x = _669;
    out.m_72.y = _671;
    out.m_72.z = _673;
    out.m_74.x = _645;
    out.m_74.y = _643;
    out.m_76.x = _675;
    out.m_76.y = _677;
    out.m_76.z = _679;
    float _691 = _641;
    float _693 = _673;
    float _695 = _669;
    float _697 = _593;
    if (!_689)
    {
        _691 = 1.0;
    }
    float _699 = _691;
    bool _701 = !_689;
    float _703 = _699;
    if (!_701)
    {
        bool _705 = _647 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _707 = isnan(_647);
        bool _709 = _705 || _707;
        bool _711 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _713 = _709 || _711;
        if (!_713)
        {
            float _715 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _717 = _647 + _715;
            float _719 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _721 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _719;
            float _723 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _725 = _723 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _727 = 1.0 / _721;
            float _729 = _717 * _727;
            float _731 = fma(_729, _725, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _703 = _731;
            _733 = true;
        }
        else
        {
            bool _735 = _647 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _737 = isnan(_647);
            bool _739 = _735 || _737;
            bool _741 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _743 = _739 || _741;
            if (!_743)
            {
                float _745 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _747 = _647 + _745;
                float _749 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _751 = _749 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _753 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _755 = _753 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _757 = 1.0 / _751;
                float _759 = _747 * _757;
                float _761 = fma(_759, _755, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _703 = _761;
                _733 = true;
            }
            else
            {
                _703 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _733 = false;
    float _763 = _703;
    float _765 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _767 = _591 + _765;
    float _769 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _771 = _593 + _769;
    float _773 = fma(_767, _763, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _775 = fma(_771, _763, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _777 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _779 = _773 + _777;
    float _781 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _783 = _775 + _781;
    float _785 = fma(_779, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _787 = fma(_783, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _3034 = float2(_785, _787);
    float _789 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_3034, float2(0.0), isnan(_3034)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_3034, float2(0.0), isnan(_3034)), level(0.0)).x;
    float _791 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _793 = _585 + _791;
    bool _795 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _797 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _799 = _795 || _797;
    bool _801 = isnan(0.5);
    bool _803 = _799 || _801;
    float _805 = fma(_793, _763, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _807 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _809 = _763;
    float _811 = (*spvDescriptorSet0.vp_c15)._m0[630].z;
    float _813 = _773;
    if (!_803)
    {
        float _815 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _817 = _433 + _815;
        _809 = _817;
    }
    float _819 = _809;
    float _821 = _819;
    if (!_803)
    {
        float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        _693 = _823;
    }
    float _825 = _693;
    float _827 = _787;
    if (!_803)
    {
        float _829 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        _827 = _829;
    }
    float _831 = _827;
    float _833 = _831;
    if (!_803)
    {
        float _835 = _831 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        _833 = _835;
    }
    float _837 = _833;
    float _839 = fma(_789, 100.0, _493);
    float _841 = _789;
    float _843 = _837;
    if (!_803)
    {
        float _845 = -_493;
        float _847 = _845 + _805;
        _515 = _847;
    }
    float _849 = _515;
    float _851 = fma(_789, 100.0, _805);
    float _853 = _851;
    float _855 = _849;
    if (!_803)
    {
        float _857 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _859 = _839 + _857;
        _811 = _859;
    }
    float _861 = _811;
    float _863 = _861;
    if (!_803)
    {
        float _865 = _861 * _861;
        _695 = _865;
    }
    float _867 = _695;
    float _869 = _867;
    if (!_803)
    {
        float _871 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _873 = _445 + _871;
        _863 = _873;
    }
    float _875 = _863;
    if (!_803)
    {
        float _877 = fma(_819, _819, _867);
        _869 = _877;
    }
    float _879 = _869;
    float _881 = _879;
    if (!_803)
    {
        float _883 = fma(_875, _875, _879);
        _881 = _883;
    }
    float _885 = _881;
    float _887 = _885;
    if (!_803)
    {
        float _889 = sqrt(_885);
        _887 = _889;
    }
    float _891 = _887;
    if (!_803)
    {
        float _893 = precise::min(_891, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        _821 = _893;
    }
    float _895 = _821;
    float _897 = _895;
    if (!_803)
    {
        float _899 = _895 * _825;
        _841 = _899;
    }
    float _901 = _841;
    float _903 = _901;
    if (_803)
    {
        _897 = _851;
    }
    float _905 = _897;
    float _907 = _905;
    if (!_803)
    {
        float _909 = _837 * _901;
        _853 = _909;
    }
    float _911 = _853;
    if (!_803)
    {
        float _913 = -_433;
        float _915 = _913 + _773;
        _843 = _915;
    }
    float _917 = _843;
    if (!_803)
    {
        float _919 = -_445;
        float _921 = _919 + _775;
        _903 = _921;
    }
    float _923 = _903;
    if (!_803)
    {
        float _925 = fma(_849, _911, _839);
        _907 = _925;
    }
    float _927 = _907;
    if (!_803)
    {
        float _929 = fma(_917, _911, _433);
        _813 = _929;
    }
    float _931 = _813;
    if (_803)
    {
        _855 = _775;
    }
    float _933 = _855;
    float _935 = _933;
    if (!_803)
    {
        float _937 = fma(_923, _911, _445);
        _935 = _937;
    }
    float _939 = _935;
    float _941 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _943 = _927 + _941;
    float _945 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _947 = _931 + _945;
    float _949 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _951 = _939 + _949;
    float _953 = _943 * _943;
    float _955 = fma(_947, _947, _953);
    float _957 = fma(_951, _951, _955);
    float _959 = rsqrt(_957);
    float _961 = sqrt(_957);
    float _963 = _959 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _965 = _947 * _963;
    float _967 = _951 * _963;
    float _969 = _965 * _965;
    float _971 = _967 * _967;
    float _973 = _969 + _971;
    float _975 = sqrt(_973);
    bool _977 = _975 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _979 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _981 = _975 + _979;
    float _983 = _951;
    float _985 = _973;
    float _987 = _981;
    float _989 = _943;
    float _991 = _967;
    if (_977)
    {
        float _993 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _983 = _993;
    }
    float _995 = _983;
    if (_977)
    {
        float _997 = rsqrt(_973);
        _985 = _997;
    }
    float _999 = _985;
    if (_977)
    {
        float _1001 = _981 * _995;
        _987 = _1001;
    }
    float _1003 = _987;
    if (_977)
    {
        float _1005 = _1003 * 0.15915493667125701904296875;
        _697 = _1005;
    }
    float _1007 = _697;
    float _1009 = _959;
    float _1011 = _1007;
    if (_977)
    {
        float _1013 = _1007 * 6.283185482025146484375;
        float _1015 = sin(_1013);
        _1009 = _1015;
    }
    float _1017 = _1009;
    float _1019 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1021 = precise::max(0.0, _1019);
    float _1023 = _825;
    float _1025 = _1021;
    if (_977)
    {
        float _1027 = _1007 * 6.283185482025146484375;
        float _1029 = cos(_1027);
        _1023 = _1029;
    }
    float _1031 = _1023;
    float _1033 = -_963;
    float _1035 = -_1021;
    float _1037 = fma(_943, _1033, _1035);
    float _1039 = _1037;
    if (!_977)
    {
        _989 = _965;
    }
    float _1041 = _989;
    float _1043 = fma(_433, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1045 = _1041;
    if (_977)
    {
        float _1047 = _1037 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1025 = _1047;
    }
    float _1049 = _1025;
    float _1051 = floor(_1043);
    float _1053 = _1017;
    float _1055 = _1049;
    if (_977)
    {
        float _1057 = fma(_1017, _1049, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1053 = _1057;
    }
    float _1059 = _1053;
    float _1061 = _1059;
    if (_977)
    {
        float _1063 = _1031 + (-1.0);
        _1055 = _1063;
    }
    float _1065 = _1055;
    float _1067 = _1065;
    if (_977)
    {
        float _1069 = _999 * _1059;
        _517 = _1069;
    }
    float _1071 = _517;
    if (!_977)
    {
        _1061 = _969;
    }
    float _1073 = _1061;
    float _1075 = _927 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1077 = _1073;
    if (_977)
    {
        float _1079 = _1065 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1011 = _1079;
    }
    float _1081 = _1011;
    if (_977)
    {
        float _1083 = _965 * _1071;
        _1045 = _1083;
    }
    float _1085 = _1045;
    if (_977)
    {
        float _1087 = _967 * _1071;
        _991 = _1087;
    }
    float _1089 = _991;
    if (!_977)
    {
        _1067 = _971;
    }
    float _1091 = _1067;
    float _1093 = _1091;
    if (_977)
    {
        float _1095 = fma(_1037, _1031, _1081);
        _1039 = _1095;
    }
    float _1097 = _1039;
    if (_977)
    {
        float _1099 = _1085 * _1085;
        _1077 = _1099;
    }
    float _1101 = _1077;
    if (_977)
    {
        float _1103 = _1089 * _1089;
        _1093 = _1103;
    }
    float _1105 = _1093;
    float _1107 = _927 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1109 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1075);
    float _1111 = fma(_1097, _1097, _1101);
    float _1113 = _927 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1115 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1107);
    float _1117 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1109);
    float _1119 = _1111 + _1105;
    float _1121 = _927 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1123 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1115);
    float _1125 = rsqrt(_1119);
    float _1127 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1121);
    float _1129 = _1123 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1131 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1113);
    float _1133 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1135 = fma(_961, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1133);
    float _1137 = precise::clamp(_1135, 0.0, 1.0);
    float _1139 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1127);
    float _1141 = _1117 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1143 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1145 = -_1137;
    float _1147 = _1145 + 1.0;
    float _1149 = _1139 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1151 = _1141 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1153 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1131);
    float _1155 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1143);
    float _1157 = -_1151;
    float _1159 = fma(_1157, _807, 1.0);
    float _1161 = _1153 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1163 = abs(_1147);
    float _1165 = log2(_1163);
    float _1167 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1155);
    float _1169 = _1125 * _1085;
    float _1171 = fma(_445, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1173 = _1125 * _1089;
    float _1175 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1167);
    float _1177 = _1125 * _1097;
    float _1179 = _1169 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1181 = floor(_1171);
    float _1183 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1185 = -_1179;
    float _1187 = fma(_1177, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1185);
    float _1189 = -_1173;
    float _1191 = fma(_1189, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1187);
    float _1193 = _1165 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1195 = -_1051;
    float _1197 = _1043 + _1195;
    float _1199 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1201 = fma(_1191, -0.5, 0.5);
    float _1203 = log2(_1159);
    float _1205 = fma(_1191, 0.5, 0.5);
    float _1207 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1199);
    float _1209 = -_1181;
    float _1211 = _1171 + _1209;
    float _1213 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1183);
    float _1215 = fma(_1205, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1217 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1207);
    float _1219 = 1.0 / _1175;
    float _1221 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1213);
    float _1223 = fma(_1205, _1215, -0.212114393711090087890625);
    float _1225 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1217);
    float _1227 = _1177 + 1.0;
    float _1229 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1221);
    float _1231 = fma(_1205, _1223, 1.570728778839111328125);
    float _1233 = exp2(_1193);
    float _1235 = _1203 * 0.693147182464599609375;
    float _1237 = sqrt(_1201);
    float _1239 = _1225 * _1219;
    float _1241 = _1229 * _1219;
    float _1243 = _1235 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1245 = fma(_1239, 0.5, 0.5);
    float _1247 = fma(_1241, -0.5, 0.5);
    float _1249 = -_1177;
    float _1251 = fma(_1233, _1227, _1249);
    float2 _3826 = float2(_1197, _1211);
    float _1253 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3826, float2(0.0), isnan(_3826)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3826, float2(0.0), isnan(_3826)), level(0.0)).x;
    float3 _3835 = float3(_1245, _1247, _1243);
    float _1255 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3835, float3(0.0), isnan(_3835)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3835, float3(0.0), isnan(_3835)), level(0.0)).x;
    float3 _3846 = float3(_1245, _1247, _1243);
    float4 _1258 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3846, float3(0.0), isnan(_3846)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3846, float3(0.0), isnan(_3846)), level(0.0)).xyzw;
    float _1260 = _1258.x;
    float _1262 = _1258.y;
    float _1264 = _1258.z;
    float _1266 = _1258.w;
    float _1268 = fma(_1251, 0.5, 0.5);
    float _1270 = _1237 * 0.636619746685028076171875;
    float _1272 = -_1231;
    float _1274 = fma(_1270, _1272, 1.0);
    float2 _3872 = float2(_1274, _1268);
    float3 _1278 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3872, float2(0.0), isnan(_3872)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3872, float2(0.0), isnan(_3872)), level(0.0)).xyz;
    float _1280 = _1278.x;
    float _1282 = _1278.y;
    float _1284 = _1278.z;
    float _1286 = _839 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1288 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1290 = _1165 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1292 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1286);
    float _1294 = _839 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1296 = fma(_445, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1292);
    float _1298 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1294);
    float _1300 = _1296 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1302 = fma(_445, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1298);
    float _1304 = 1.0 / _1300;
    float _1306 = _1302 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1308 = _1306 + _1300;
    float _1310 = exp2(_1290);
    float _1312 = _1308 * _1304;
    float _1314 = _1312 * 0.5;
    float _1316 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1318 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1316);
    float _1320 = 1.0 / _1318;
    float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1324 = _1320 * _1322;
    float _1326 = abs(_1324);
    float _1328 = log2(_1326);
    bool _1330 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan(0.5);
    bool _1338 = _1334 || _1336;
    float _1340 = _1328 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1342 = exp2(_1340);
    float _1344 = fma(_1342, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1346 = precise::clamp(_1344, 0.0, 1.0);
    bool _1348 = _1324 <= 8000.0;
    bool _1350 = isnan(_1324);
    bool _1352 = _1348 || _1350;
    bool _1354 = isnan(8000.0);
    bool _1356 = _1352 || _1354;
    float _1358 = float(_1356);
    float _1360 = fma(_1346, -2.0, 3.0);
    float _1362 = _1346 * _1346;
    float _1364 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1288);
    float _1366 = in.m_68.x;
    float _1368 = _1362 * _1360;
    float _1370 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1364);
    float _1372 = -_1368;
    float _1374 = _1372 + 1.0;
    float _1376 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1370);
    float _1378 = fma(_1374, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1368);
    float _1380 = _1376 + _1175;
    float _1382 = _1374;
    float _1384 = _1175;
    float _1386 = _1376;
    float _1388 = _1229;
    if (_1338)
    {
        _1382 = 1.0;
    }
    float _1390 = _1382;
    float _1392 = _1358 * _1378;
    float _1394 = _1380 * 0.5;
    float _1396 = _1390;
    float _1398 = _1394;
    float _1400 = _1225;
    if (!_1338)
    {
        float _1402 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1404 = _1402 * 0.15915493667125701904296875;
        float _1406 = _1404 * 6.283185482025146484375;
        float _1408 = cos(_1406);
        float _1410 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1412 = _1410 * 0.15915493667125701904296875;
        float _1414 = _1404 * 6.283185482025146484375;
        float _1416 = sin(_1414);
        float _1418 = 1.0 / _1408;
        float _1420 = _1412 * 6.283185482025146484375;
        float _1422 = cos(_1420);
        float _1424 = _1416 * _1418;
        float _1426 = _1412 * 6.283185482025146484375;
        float _1428 = sin(_1426);
        float _1430 = _1422 * _1424;
        float _1432 = 1.0 / _1430;
        float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1436 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1434;
        float _1438 = 1.0 / _1436;
        float _1440 = _1428 * _1432;
        float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1444 = fma(_1324, _1440, _1442);
        float _1446 = _1444 * _1438;
        float _1448 = precise::clamp(_1446, 0.0, 1.0);
        _1396 = _1448;
    }
    float _1450 = _1396;
    float _1452 = -_1310;
    float _1454 = _1452 + 1.0;
    float _1456 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1458 = -_1253;
    float _1460 = _1458 + 1.0;
    float _1462 = _1454 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1464 = _961 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1466 = isnan(_961);
    bool _1468 = _1464 || _1466;
    bool _1470 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1472 = _1468 || _1470;
    float _1474 = _1460 * _1456;
    float _1476 = precise::clamp(_1474, 0.0, 1.0);
    float _1478 = _1462 * _1255;
    float _1480 = -_1462;
    float _1482 = _1480 + 1.0;
    float _1484 = -_1476;
    float _1486 = fma(_1484, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.gl_Position.x = _1225;
    out.gl_Position.y = _1229;
    out.gl_Position.z = _1376;
    out.gl_Position.w = _1175;
    float _1488 = _1266 * _1478;
    float _1490 = _1284 * _1478;
    float _1492 = _1486 * _1366;
    float _1494 = _1266 * _1482;
    float _1496 = fma(_1280, _1488, _1260);
    float _1498 = fma(_1282, _1488, _1262);
    float _1500 = _1492 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1502 = fma(_1266, _1490, _1264);
    out.m_78.z = _1394;
    out.m_78.w = _1175;
    float _1504 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1506 = _1476;
    if (!_1472)
    {
        _1506 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1508 = _1506;
    out.m_80.x = _1500;
    float _1510 = _1508;
    float _1512 = _1508;
    if (!_1472)
    {
        _1384 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1514 = _1384;
    float _1516 = _1514;
    float _1518 = _1514;
    if (!_1472)
    {
        _1386 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1520 = _1386;
    out.m_82.x = _1496;
    out.m_82.y = _1498;
    out.m_82.z = _1502;
    out.m_82.w = _1494;
    float _1522 = _1520;
    float _1524 = _1520;
    if (!_1472)
    {
        _1388 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1526 = _1388;
    float _1528 = _1526;
    float _1530 = _1526;
    if (!_1472)
    {
        _1398 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1532 = _1398;
    float _1534 = _1532;
    float _1536 = _1532;
    if (!_1472)
    {
        _1400 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1538 = _1400;
    bool _1540 = !_1472;
    float _1542 = _1538;
    float _1544 = _1538;
    if (!_1540)
    {
        bool _1546 = _961 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1548 = isnan(_961);
        bool _1550 = _1546 || _1548;
        bool _1552 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1554 = _1550 || _1552;
        if (!_1554)
        {
            float _1556 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1558 = _961 + _1556;
            float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1562 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1560;
            float _1564 = 1.0 / _1562;
            float _1566 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1568 = _1566 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1570 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1572 = _1570 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1574 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1576 = _1574 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1578 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1580 = _1578 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1582 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1584 = _1582 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1586 = _1558 * _1564;
            float _1588 = precise::clamp(_1586, 0.0, 1.0);
            float _1590 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1592 = _1590 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1594 = fma(_1588, _1568, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1596 = fma(_1588, _1592, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1598 = fma(_1588, _1572, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1600 = fma(_1588, _1576, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1602 = fma(_1588, _1580, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1604 = fma(_1588, _1584, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1536 = _1596;
            _1530 = _1602;
            _1512 = _1594;
            _1524 = _1600;
            _1518 = _1598;
            _1544 = _1604;
            _1606 = true;
        }
        else
        {
            bool _1608 = _961 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1610 = isnan(_961);
            bool _1612 = _1608 || _1610;
            bool _1614 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1616 = _1612 || _1614;
            if (!_1616)
            {
                _1510 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1618 = _1510;
            _1512 = _1618;
            if (!_1616)
            {
                _1534 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1620 = _1534;
            _1536 = _1620;
            if (!_1616)
            {
                _1516 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1622 = _1516;
            _1518 = _1622;
            if (!_1616)
            {
                _1522 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1624 = _1522;
            _1524 = _1624;
            if (!_1616)
            {
                _1528 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1626 = _1528;
            _1530 = _1626;
            if (!_1616)
            {
                _1542 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1628 = _1542;
            bool _1630 = !_1616;
            _1544 = _1628;
            if (!_1630)
            {
                bool _1632 = _961 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1634 = isnan(_961);
                bool _1636 = _1632 || _1634;
                bool _1638 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1640 = _1636 || _1638;
                if (!_1640)
                {
                    float _1642 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1644 = _961 + _1642;
                    float _1646 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1648 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1646;
                    float _1650 = 1.0 / _1648;
                    float _1652 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1654 = _1652 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1656 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1658 = _1656 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1660 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1662 = _1660 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1664 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1666 = _1664 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1668 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1670 = _1668 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1672 = _1644 * _1650;
                    float _1674 = precise::clamp(_1672, 0.0, 1.0);
                    float _1676 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1678 = _1676 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1680 = fma(_1674, _1654, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1682 = fma(_1674, _1678, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1684 = fma(_1674, _1658, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1686 = fma(_1674, _1662, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1688 = fma(_1674, _1666, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1690 = fma(_1674, _1670, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1536 = _1682;
                    _1530 = _1688;
                    _1512 = _1680;
                    _1524 = _1686;
                    _1518 = _1684;
                    _1544 = _1690;
                    _1606 = true;
                }
                else
                {
                    _1536 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1530 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1512 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1524 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1518 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1544 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1606 = false;
    float _1692 = _1536;
    float _1694 = _1530;
    float _1696 = _1512;
    float _1698 = _1524;
    float _1700 = _1518;
    float _1702 = _1544;
    float _1704 = fma(_677, -0.5, 0.5);
    float _1706 = precise::clamp(_1704, 0.0, 1.0);
    float _1708 = -_1692;
    float _1710 = _1708 + _1694;
    float _1712 = _1504 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1714 = -_1696;
    float _1716 = _1714 + _1698;
    out.m_84.x = 0.0;
    float _1718 = fma(_1706, _1710, _1692);
    float _1720 = fma(_1706, _1716, _1696);
    out.m_53.x = _1712;
    float _1722 = -_1700;
    float _1724 = _1722 + _1702;
    float _1726 = _1718 * 0.586610972881317138671875;
    bool _1728 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1730 = fma(_1706, _1724, _1700);
    float _1732 = fma(_1720, 0.298911988735198974609375, _1726);
    bool _1734 = _1450 > 0.0;
    bool _1736 = isnan(_1450);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan(0.0);
    bool _1742 = _1738 || _1740;
    float _1744 = fma(_1730, 0.114477999508380889892578125, _1732);
    float _1746 = -_1744;
    float _1748 = _1720 + _1746;
    float _1750 = -_1744;
    float _1752 = _1718 + _1750;
    float _1754 = -_1744;
    float _1756 = _1730 + _1754;
    float _1758 = fma(_1748, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1744);
    float _1760 = fma(_1752, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1744);
    float _1762 = fma(_1756, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1744);
    bool _1764 = !_1728;
    if (!_1764)
    {
        float _1766 = -_927;
        float _1768 = _1766 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1770 = -_931;
        float _1772 = _1770 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1774 = -_939;
        float _1776 = _1774 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1778 = _1768 * _1768;
        float _1780 = fma(_1772, _1772, _1778);
        float _1782 = fma(_1776, _1776, _1780);
        float _1784 = sqrt(_1782);
        float _1786 = rsqrt(_1782);
        float _1788 = -_1784;
        float _1790 = _1788 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1792 = _1790 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1794 = precise::clamp(_1792, 0.0, 1.0);
        float _1796 = _1772 * _1786;
        float _1798 = _1768 * _1786;
        float _1800 = abs(_1794);
        float _1802 = log2(_1800);
        float _1804 = _1776 * _1786;
        float _1806 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1808 = _677 * _1798;
        float _1810 = -_1798;
        float _1812 = -_1806;
        float _1814 = fma(_1810, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1812);
        float _1816 = fma(_675, _1796, _1808);
        float _1818 = -_1804;
        float _1820 = fma(_1818, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1814);
        float _1822 = fma(_679, _1804, _1816);
        float _1824 = precise::clamp(_1822, 0.0, 1.0);
        float _1826 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1828 = _1820 + _1826;
        float _1830 = _1802 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1832 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1834 = precise::clamp(_1832, 0.0, 1.0);
        float _1836 = exp2(_1830);
        float _1838 = _1836 * _1834;
        float _1840 = _1824 * _1838;
        float _1842 = _1840 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1844 = _1840 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1846 = _1840 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _1842;
        out.m_84.y = _1844;
        out.m_84.z = _1846;
    }
    out.m_86.x = _1758;
    out.m_86.y = _1760;
    out.m_86.z = _1762;
    if (_1742)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _1848 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1848;
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
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1606 = false;
    bool _733 = false;
    bool _199 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_50.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    if (!_109)
    {
        out.m_53.x = 0.0;
    }
    int _115 = 0;
    if (!_109)
    {
        float _117 = _113 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1904 = as_type<float>(_119);
        out.gl_Position.z = _1904;
    }
    if (!_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = in.m_55.w;
    bool _125 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_123);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    float _135 = -_123;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _139 = 0.0;
    if (_133)
    {
        float _141 = float(_105);
        _139 = _141;
    }
    float _143 = _139;
    bool _145 = _137 >= _143;
    bool _147 = !_133;
    bool _149 = _145 || _147;
    float _151 = 0.0;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _151;
    if (_149)
    {
        out.m_53.x = 0.0;
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
        float _1972 = as_type<float>(_157);
        out.gl_Position.z = _1972;
    }
    if (_149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    bool _161 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _163 = as_type<int>(_159) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_159) & 2;
    bool _169 = _167 != 0;
    bool _171 = !_165;
    float _173 = _171 ? (-0.5) : 0.5;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_161;
    float _197;
    if (!_179)
    {
        float _181 = in.m_60.x;
        float _183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _187 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _189 = _187 * _183;
        float _191 = floor(_189);
        float _193 = -_191;
        float _195 = _189 + _193;
        _197 = _195;
        _199 = true;
    }
    else
    {
        float _201 = float(_105);
        float _203 = 1.0 / _201;
        float _205 = _137 * _203;
        _197 = _205;
    }
    _199 = false;
    float _207 = _197;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _211 = _207 + _209;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _215 = _207 + _213;
    bool _217 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _219 = isnan(_207);
    bool _221 = _217 || _219;
    bool _223 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _225 = _221 || _223;
    float _227 = float(_225);
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _229;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _235 = _233 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _237;
    bool _241 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _243 = isnan(_207);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -_227;
    float _255 = _253 + 1.0;
    float _257 = 1.0 / _235;
    float _259 = _251 * _255;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _261;
    float _265 = 1.0 / _231;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _267;
    float _271 = 1.0 / _239;
    float _273 = _211 * _265;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _277 = _207 + _275;
    bool _279 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _281 = isnan(_207);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = _277 * _257;
    float _293 = -_251;
    float _295 = _293 + 1.0;
    float _297 = _215 * _271;
    bool _299 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _301 = isnan(_207);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = _289 * _295;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _321 = -_289;
    float _323 = _321 + 1.0;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _329;
    float _333 = fma(_319, _291, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _335 = _309 * _323;
    float _337 = fma(_327, _291, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _339 = fma(_331, _273, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _341 = in.m_62.x;
    float _343 = in.m_62.y;
    float _345 = fma(_315, _273, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _347 = -_309;
    float _349 = _347 + 1.0;
    float _351 = _339 * _335;
    float _353 = fma(_263, _297, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _355 = _345 * _335;
    float _357 = fma(_269, _297, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _359 = in.m_50.x;
    float _361 = in.m_50.y;
    float _363 = in.m_50.z;
    float _365 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].y, _351);
    float _367 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].x, _355);
    float _369 = in.m_64.x;
    float _371 = in.m_64.y;
    float _373 = in.m_64.z;
    float _375 = in.m_64.w;
    float _377 = fma(_337, _311, _365);
    float _379 = fma(_333, _311, _367);
    float _381 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _173);
    float _383 = in.m_66.x;
    float _385 = in.m_66.y;
    float _387 = in.m_66.z;
    float _389 = in.m_66.w;
    float _391 = fma(_353, _259, _377);
    float _393 = fma(_357, _259, _379);
    float _395 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[146].y, _391);
    float _397 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[146].x, _393);
    float _399 = _395 * _343;
    float _401 = _397 * _341;
    float _403 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _177);
    float _405 = _399 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _407 = _401 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _409 = _405 * _403;
    float _411 = _407 * _381;
    float _413 = _361 * _371;
    float _415 = _409 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _417 = fma(_359, _369, _413);
    float _419 = _361 * _385;
    float _421 = _409 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _423 = fma(_411, (*spvDescriptorSet0.vp_c8)._m0[26].x, _415);
    float _425 = fma(_363, _373, _417);
    float _427 = fma(_359, _383, _419);
    float _429 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _431 = fma(_411, (*spvDescriptorSet0.vp_c8)._m0[24].x, _421);
    float _433 = _425 + _375;
    float _435 = fma(_363, _387, _427);
    float _437 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[26].z, _423);
    float _439 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[24].z, _431);
    float _441 = in.m_60.x;
    float _443 = in.m_60.y;
    float _445 = _435 + _389;
    float _447 = _437 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _449 = _439 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _451 = in.m_68.y;
    float _453 = _445 + _447;
    float _455 = _433 + _449;
    float _457 = _409 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _459 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _461 = _453 + _459;
    float _463 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _465 = _455 + _463;
    float _467 = fma(_411, (*spvDescriptorSet0.vp_c8)._m0[25].x, _457);
    float _469 = _461 * _461;
    float _471 = _465 * _465;
    float _473 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[25].z, _467);
    int _475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _477 = _475 != 0;
    float _479 = _471 + _469;
    float _481 = _473 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _485 = _483 != 0;
    float _487 = sqrt(_479);
    bool _489 = _443 > 0.5;
    bool _491 = _441 > 0.5;
    float _493 = _361 + _451;
    float _495 = -_177;
    int _497 = _489 ? as_type<int>(_495) : as_type<int>(_177);
    float _499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _501 = _493 + _481;
    bool _503 = _487 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _505 = _481;
    float _507 = _361;
    float _509 = _473;
    float _511 = _471;
    float _513 = _455;
    float _515 = _493;
    float _517 = _259;
    if (!_503)
    {
        _505 = _471;
    }
    float _519 = _505;
    float _521 = _519;
    if (!_503)
    {
        _507 = _469;
    }
    float _523 = _507;
    float _525 = _523;
    if (!_503)
    {
        _509 = _453;
    }
    float _527 = _509;
    float _529 = _527;
    if (!_503)
    {
        _511 = _501;
    }
    float _531 = _511;
    bool _533 = !_503;
    float _535 = _531;
    if (!_533)
    {
        float _537 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _539 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _541 = _487 + _539;
        float _543 = _501 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _545 = rsqrt(_479);
        float _547 = _541 * _537;
        float _549 = _547 * 0.15915493667125701904296875;
        float _551 = _549 * 6.283185482025146484375;
        float _553 = sin(_551);
        float _555 = _549 * 6.283185482025146484375;
        float _557 = cos(_555);
        float _559 = fma(_553, _543, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _561 = _545 * _559;
        float _563 = _557 + (-1.0);
        float _565 = fma(_465, _561, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _567 = fma(_461, _561, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _569 = _563 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _571 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _573 = _565 + _571;
        float _575 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _577 = _567 + _575;
        float _579 = fma(_501, _557, _569);
        float _581 = _573 * _573;
        float _583 = _577 * _577;
        _535 = _579;
        _521 = _581;
        _525 = _583;
        _513 = _565;
        _529 = _567;
    }
    float _585 = _535;
    float _587 = _521;
    float _589 = _525;
    float _591 = _513;
    float _593 = _529;
    float _595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _597 = -_173;
    int _599 = _491 ? as_type<int>(_597) : as_type<int>(_173);
    float _601 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _603 = _585 + _601;
    bool _605 = !_485;
    float _607 = _605 ? _177 : as_type<float>(_497);
    float _609 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _611 = !_477;
    float _613 = _611 ? _173 : as_type<float>(_599);
    float _615 = fma(_603, _603, _587);
    float _617 = _173 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _619 = -_607;
    float _621 = _619 + 0.5;
    float _623 = _609 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _625 = _609 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _627 = _609 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _629 = _613 + 0.5;
    float _631 = _621 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _633 = _615 + _589;
    float _635 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[24].x, _623);
    float _637 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[25].x, _625);
    float _639 = _629 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _641 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[26].x, _627);
    float _643 = _631 * _595;
    float _645 = _639 * _499;
    float _647 = sqrt(_633);
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _659 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _663 = _651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _667 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _671 = _657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _635 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _677 = _637 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _679 = _641 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_70.x = _659;
    out.m_70.y = _663;
    out.m_70.z = _667;
    out.m_70.w = _665;
    bool _681 = _647 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _683 = isnan(_647);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _689 = _685 || _687;
    out.m_72.x = _669;
    out.m_72.y = _671;
    out.m_72.z = _673;
    out.m_74.x = _645;
    out.m_74.y = _643;
    out.m_76.x = _675;
    out.m_76.y = _677;
    out.m_76.z = _679;
    float _691 = _641;
    float _693 = _673;
    float _695 = _669;
    float _697 = _593;
    if (!_689)
    {
        _691 = 1.0;
    }
    float _699 = _691;
    bool _701 = !_689;
    float _703 = _699;
    if (!_701)
    {
        bool _705 = _647 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _707 = isnan(_647);
        bool _709 = _705 || _707;
        bool _711 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _713 = _709 || _711;
        if (!_713)
        {
            float _715 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _717 = _647 + _715;
            float _719 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _721 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _719;
            float _723 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _725 = _723 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _727 = 1.0 / _721;
            float _729 = _717 * _727;
            float _731 = fma(_729, _725, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _703 = _731;
            _733 = true;
        }
        else
        {
            bool _735 = _647 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _737 = isnan(_647);
            bool _739 = _735 || _737;
            bool _741 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _743 = _739 || _741;
            if (!_743)
            {
                float _745 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _747 = _647 + _745;
                float _749 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _751 = _749 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _753 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _755 = _753 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _757 = 1.0 / _751;
                float _759 = _747 * _757;
                float _761 = fma(_759, _755, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _703 = _761;
                _733 = true;
            }
            else
            {
                _703 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _733 = false;
    float _763 = _703;
    float _765 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _767 = _591 + _765;
    float _769 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _771 = _593 + _769;
    float _773 = fma(_767, _763, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _775 = fma(_771, _763, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _777 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _779 = _773 + _777;
    float _781 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _783 = _775 + _781;
    float _785 = fma(_779, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _787 = fma(_783, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _3034 = float2(_785, _787);
    float _789 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_3034, float2(0.0), isnan(_3034)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_3034, float2(0.0), isnan(_3034)), level(0.0)).x;
    float _791 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _793 = _585 + _791;
    bool _795 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _797 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _799 = _795 || _797;
    bool _801 = isnan(0.5);
    bool _803 = _799 || _801;
    float _805 = fma(_793, _763, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _807 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _809 = _763;
    float _811 = (*spvDescriptorSet0.vp_c15)._m0[630].z;
    float _813 = _773;
    if (!_803)
    {
        float _815 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _817 = _433 + _815;
        _809 = _817;
    }
    float _819 = _809;
    float _821 = _819;
    if (!_803)
    {
        float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        _693 = _823;
    }
    float _825 = _693;
    float _827 = _787;
    if (!_803)
    {
        float _829 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        _827 = _829;
    }
    float _831 = _827;
    float _833 = _831;
    if (!_803)
    {
        float _835 = _831 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        _833 = _835;
    }
    float _837 = _833;
    float _839 = fma(_789, 100.0, _493);
    float _841 = _789;
    float _843 = _837;
    if (!_803)
    {
        float _845 = -_493;
        float _847 = _845 + _805;
        _515 = _847;
    }
    float _849 = _515;
    float _851 = fma(_789, 100.0, _805);
    float _853 = _851;
    float _855 = _849;
    if (!_803)
    {
        float _857 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _859 = _839 + _857;
        _811 = _859;
    }
    float _861 = _811;
    float _863 = _861;
    if (!_803)
    {
        float _865 = _861 * _861;
        _695 = _865;
    }
    float _867 = _695;
    float _869 = _867;
    if (!_803)
    {
        float _871 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _873 = _445 + _871;
        _863 = _873;
    }
    float _875 = _863;
    if (!_803)
    {
        float _877 = fma(_819, _819, _867);
        _869 = _877;
    }
    float _879 = _869;
    float _881 = _879;
    if (!_803)
    {
        float _883 = fma(_875, _875, _879);
        _881 = _883;
    }
    float _885 = _881;
    float _887 = _885;
    if (!_803)
    {
        float _889 = sqrt(_885);
        _887 = _889;
    }
    float _891 = _887;
    if (!_803)
    {
        float _893 = precise::min(_891, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        _821 = _893;
    }
    float _895 = _821;
    float _897 = _895;
    if (!_803)
    {
        float _899 = _895 * _825;
        _841 = _899;
    }
    float _901 = _841;
    float _903 = _901;
    if (_803)
    {
        _897 = _851;
    }
    float _905 = _897;
    float _907 = _905;
    if (!_803)
    {
        float _909 = _837 * _901;
        _853 = _909;
    }
    float _911 = _853;
    if (!_803)
    {
        float _913 = -_433;
        float _915 = _913 + _773;
        _843 = _915;
    }
    float _917 = _843;
    if (!_803)
    {
        float _919 = -_445;
        float _921 = _919 + _775;
        _903 = _921;
    }
    float _923 = _903;
    if (!_803)
    {
        float _925 = fma(_849, _911, _839);
        _907 = _925;
    }
    float _927 = _907;
    if (!_803)
    {
        float _929 = fma(_917, _911, _433);
        _813 = _929;
    }
    float _931 = _813;
    if (_803)
    {
        _855 = _775;
    }
    float _933 = _855;
    float _935 = _933;
    if (!_803)
    {
        float _937 = fma(_923, _911, _445);
        _935 = _937;
    }
    float _939 = _935;
    float _941 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _943 = _927 + _941;
    float _945 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _947 = _931 + _945;
    float _949 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _951 = _939 + _949;
    float _953 = _943 * _943;
    float _955 = fma(_947, _947, _953);
    float _957 = fma(_951, _951, _955);
    float _959 = rsqrt(_957);
    float _961 = sqrt(_957);
    float _963 = _959 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _965 = _947 * _963;
    float _967 = _951 * _963;
    float _969 = _965 * _965;
    float _971 = _967 * _967;
    float _973 = _969 + _971;
    float _975 = sqrt(_973);
    bool _977 = _975 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _979 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _981 = _975 + _979;
    float _983 = _951;
    float _985 = _973;
    float _987 = _981;
    float _989 = _943;
    float _991 = _967;
    if (_977)
    {
        float _993 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _983 = _993;
    }
    float _995 = _983;
    if (_977)
    {
        float _997 = rsqrt(_973);
        _985 = _997;
    }
    float _999 = _985;
    if (_977)
    {
        float _1001 = _981 * _995;
        _987 = _1001;
    }
    float _1003 = _987;
    if (_977)
    {
        float _1005 = _1003 * 0.15915493667125701904296875;
        _697 = _1005;
    }
    float _1007 = _697;
    float _1009 = _959;
    float _1011 = _1007;
    if (_977)
    {
        float _1013 = _1007 * 6.283185482025146484375;
        float _1015 = sin(_1013);
        _1009 = _1015;
    }
    float _1017 = _1009;
    float _1019 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1021 = precise::max(0.0, _1019);
    float _1023 = _825;
    float _1025 = _1021;
    if (_977)
    {
        float _1027 = _1007 * 6.283185482025146484375;
        float _1029 = cos(_1027);
        _1023 = _1029;
    }
    float _1031 = _1023;
    float _1033 = -_963;
    float _1035 = -_1021;
    float _1037 = fma(_943, _1033, _1035);
    float _1039 = _1037;
    if (!_977)
    {
        _989 = _965;
    }
    float _1041 = _989;
    float _1043 = fma(_433, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1045 = _1041;
    if (_977)
    {
        float _1047 = _1037 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1025 = _1047;
    }
    float _1049 = _1025;
    float _1051 = floor(_1043);
    float _1053 = _1017;
    float _1055 = _1049;
    if (_977)
    {
        float _1057 = fma(_1017, _1049, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1053 = _1057;
    }
    float _1059 = _1053;
    float _1061 = _1059;
    if (_977)
    {
        float _1063 = _1031 + (-1.0);
        _1055 = _1063;
    }
    float _1065 = _1055;
    float _1067 = _1065;
    if (_977)
    {
        float _1069 = _999 * _1059;
        _517 = _1069;
    }
    float _1071 = _517;
    if (!_977)
    {
        _1061 = _969;
    }
    float _1073 = _1061;
    float _1075 = _927 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1077 = _1073;
    if (_977)
    {
        float _1079 = _1065 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1011 = _1079;
    }
    float _1081 = _1011;
    if (_977)
    {
        float _1083 = _965 * _1071;
        _1045 = _1083;
    }
    float _1085 = _1045;
    if (_977)
    {
        float _1087 = _967 * _1071;
        _991 = _1087;
    }
    float _1089 = _991;
    if (!_977)
    {
        _1067 = _971;
    }
    float _1091 = _1067;
    float _1093 = _1091;
    if (_977)
    {
        float _1095 = fma(_1037, _1031, _1081);
        _1039 = _1095;
    }
    float _1097 = _1039;
    if (_977)
    {
        float _1099 = _1085 * _1085;
        _1077 = _1099;
    }
    float _1101 = _1077;
    if (_977)
    {
        float _1103 = _1089 * _1089;
        _1093 = _1103;
    }
    float _1105 = _1093;
    float _1107 = _927 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1109 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1075);
    float _1111 = fma(_1097, _1097, _1101);
    float _1113 = _927 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1115 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1107);
    float _1117 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1109);
    float _1119 = _1111 + _1105;
    float _1121 = _927 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1123 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1115);
    float _1125 = rsqrt(_1119);
    float _1127 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1121);
    float _1129 = _1123 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1131 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1113);
    float _1133 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1135 = fma(_961, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1133);
    float _1137 = precise::clamp(_1135, 0.0, 1.0);
    float _1139 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1127);
    float _1141 = _1117 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1143 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1145 = -_1137;
    float _1147 = _1145 + 1.0;
    float _1149 = _1139 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1151 = _1141 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1153 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1131);
    float _1155 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1143);
    float _1157 = -_1151;
    float _1159 = fma(_1157, _807, 1.0);
    float _1161 = _1153 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1163 = abs(_1147);
    float _1165 = log2(_1163);
    float _1167 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1155);
    float _1169 = _1125 * _1085;
    float _1171 = fma(_445, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1173 = _1125 * _1089;
    float _1175 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1167);
    float _1177 = _1125 * _1097;
    float _1179 = _1169 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1181 = floor(_1171);
    float _1183 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1185 = -_1179;
    float _1187 = fma(_1177, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1185);
    float _1189 = -_1173;
    float _1191 = fma(_1189, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1187);
    float _1193 = _1165 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1195 = -_1051;
    float _1197 = _1043 + _1195;
    float _1199 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1201 = fma(_1191, -0.5, 0.5);
    float _1203 = log2(_1159);
    float _1205 = fma(_1191, 0.5, 0.5);
    float _1207 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1199);
    float _1209 = -_1181;
    float _1211 = _1171 + _1209;
    float _1213 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1183);
    float _1215 = fma(_1205, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1217 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1207);
    float _1219 = 1.0 / _1175;
    float _1221 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1213);
    float _1223 = fma(_1205, _1215, -0.212114393711090087890625);
    float _1225 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1217);
    float _1227 = _1177 + 1.0;
    float _1229 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1221);
    float _1231 = fma(_1205, _1223, 1.570728778839111328125);
    float _1233 = exp2(_1193);
    float _1235 = _1203 * 0.693147182464599609375;
    float _1237 = sqrt(_1201);
    float _1239 = _1225 * _1219;
    float _1241 = _1229 * _1219;
    float _1243 = _1235 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1245 = fma(_1239, 0.5, 0.5);
    float _1247 = fma(_1241, -0.5, 0.5);
    float _1249 = -_1177;
    float _1251 = fma(_1233, _1227, _1249);
    float2 _3826 = float2(_1197, _1211);
    float _1253 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3826, float2(0.0), isnan(_3826)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3826, float2(0.0), isnan(_3826)), level(0.0)).x;
    float3 _3835 = float3(_1245, _1247, _1243);
    float _1255 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3835, float3(0.0), isnan(_3835)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3835, float3(0.0), isnan(_3835)), level(0.0)).x;
    float3 _3846 = float3(_1245, _1247, _1243);
    float4 _1258 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3846, float3(0.0), isnan(_3846)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3846, float3(0.0), isnan(_3846)), level(0.0)).xyzw;
    float _1260 = _1258.x;
    float _1262 = _1258.y;
    float _1264 = _1258.z;
    float _1266 = _1258.w;
    float _1268 = fma(_1251, 0.5, 0.5);
    float _1270 = _1237 * 0.636619746685028076171875;
    float _1272 = -_1231;
    float _1274 = fma(_1270, _1272, 1.0);
    float2 _3872 = float2(_1274, _1268);
    float3 _1278 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3872, float2(0.0), isnan(_3872)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3872, float2(0.0), isnan(_3872)), level(0.0)).xyz;
    float _1280 = _1278.x;
    float _1282 = _1278.y;
    float _1284 = _1278.z;
    float _1286 = _839 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1288 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1290 = _1165 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1292 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1286);
    float _1294 = _839 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1296 = fma(_445, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1292);
    float _1298 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1294);
    float _1300 = _1296 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1302 = fma(_445, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1298);
    float _1304 = 1.0 / _1300;
    float _1306 = _1302 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1308 = _1306 + _1300;
    float _1310 = exp2(_1290);
    float _1312 = _1308 * _1304;
    float _1314 = _1312 * 0.5;
    float _1316 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1318 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1316);
    float _1320 = 1.0 / _1318;
    float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1324 = _1320 * _1322;
    float _1326 = abs(_1324);
    float _1328 = log2(_1326);
    bool _1330 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan(0.5);
    bool _1338 = _1334 || _1336;
    float _1340 = _1328 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1342 = exp2(_1340);
    float _1344 = fma(_1342, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1346 = precise::clamp(_1344, 0.0, 1.0);
    bool _1348 = _1324 <= 8000.0;
    bool _1350 = isnan(_1324);
    bool _1352 = _1348 || _1350;
    bool _1354 = isnan(8000.0);
    bool _1356 = _1352 || _1354;
    float _1358 = float(_1356);
    float _1360 = fma(_1346, -2.0, 3.0);
    float _1362 = _1346 * _1346;
    float _1364 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1288);
    float _1366 = in.m_68.x;
    float _1368 = _1362 * _1360;
    float _1370 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1364);
    float _1372 = -_1368;
    float _1374 = _1372 + 1.0;
    float _1376 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1370);
    float _1378 = fma(_1374, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1368);
    float _1380 = _1376 + _1175;
    float _1382 = _1374;
    float _1384 = _1175;
    float _1386 = _1376;
    float _1388 = _1229;
    if (_1338)
    {
        _1382 = 1.0;
    }
    float _1390 = _1382;
    float _1392 = _1358 * _1378;
    float _1394 = _1380 * 0.5;
    float _1396 = _1390;
    float _1398 = _1394;
    float _1400 = _1225;
    if (!_1338)
    {
        float _1402 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1404 = _1402 * 0.15915493667125701904296875;
        float _1406 = _1404 * 6.283185482025146484375;
        float _1408 = cos(_1406);
        float _1410 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1412 = _1410 * 0.15915493667125701904296875;
        float _1414 = _1404 * 6.283185482025146484375;
        float _1416 = sin(_1414);
        float _1418 = 1.0 / _1408;
        float _1420 = _1412 * 6.283185482025146484375;
        float _1422 = cos(_1420);
        float _1424 = _1416 * _1418;
        float _1426 = _1412 * 6.283185482025146484375;
        float _1428 = sin(_1426);
        float _1430 = _1422 * _1424;
        float _1432 = 1.0 / _1430;
        float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1436 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1434;
        float _1438 = 1.0 / _1436;
        float _1440 = _1428 * _1432;
        float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1444 = fma(_1324, _1440, _1442);
        float _1446 = _1444 * _1438;
        float _1448 = precise::clamp(_1446, 0.0, 1.0);
        _1396 = _1448;
    }
    float _1450 = _1396;
    float _1452 = -_1310;
    float _1454 = _1452 + 1.0;
    float _1456 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1458 = -_1253;
    float _1460 = _1458 + 1.0;
    float _1462 = _1454 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1464 = _961 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1466 = isnan(_961);
    bool _1468 = _1464 || _1466;
    bool _1470 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1472 = _1468 || _1470;
    float _1474 = _1460 * _1456;
    float _1476 = precise::clamp(_1474, 0.0, 1.0);
    float _1478 = _1462 * _1255;
    float _1480 = -_1462;
    float _1482 = _1480 + 1.0;
    float _1484 = -_1476;
    float _1486 = fma(_1484, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.gl_Position.x = _1225;
    out.gl_Position.y = _1229;
    out.gl_Position.z = _1376;
    out.gl_Position.w = _1175;
    float _1488 = _1266 * _1478;
    float _1490 = _1284 * _1478;
    float _1492 = _1486 * _1366;
    float _1494 = _1266 * _1482;
    float _1496 = fma(_1280, _1488, _1260);
    float _1498 = fma(_1282, _1488, _1262);
    float _1500 = _1492 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1502 = fma(_1266, _1490, _1264);
    out.m_78.z = _1394;
    out.m_78.w = _1175;
    float _1504 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1506 = _1476;
    if (!_1472)
    {
        _1506 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1508 = _1506;
    out.m_80.x = _1500;
    float _1510 = _1508;
    float _1512 = _1508;
    if (!_1472)
    {
        _1384 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1514 = _1384;
    float _1516 = _1514;
    float _1518 = _1514;
    if (!_1472)
    {
        _1386 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1520 = _1386;
    out.m_82.x = _1496;
    out.m_82.y = _1498;
    out.m_82.z = _1502;
    out.m_82.w = _1494;
    float _1522 = _1520;
    float _1524 = _1520;
    if (!_1472)
    {
        _1388 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1526 = _1388;
    float _1528 = _1526;
    float _1530 = _1526;
    if (!_1472)
    {
        _1398 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1532 = _1398;
    float _1534 = _1532;
    float _1536 = _1532;
    if (!_1472)
    {
        _1400 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1538 = _1400;
    bool _1540 = !_1472;
    float _1542 = _1538;
    float _1544 = _1538;
    if (!_1540)
    {
        bool _1546 = _961 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1548 = isnan(_961);
        bool _1550 = _1546 || _1548;
        bool _1552 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1554 = _1550 || _1552;
        if (!_1554)
        {
            float _1556 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1558 = _961 + _1556;
            float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1562 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1560;
            float _1564 = 1.0 / _1562;
            float _1566 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1568 = _1566 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1570 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1572 = _1570 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1574 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1576 = _1574 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1578 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1580 = _1578 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1582 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1584 = _1582 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1586 = _1558 * _1564;
            float _1588 = precise::clamp(_1586, 0.0, 1.0);
            float _1590 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1592 = _1590 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1594 = fma(_1588, _1568, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1596 = fma(_1588, _1592, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1598 = fma(_1588, _1572, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1600 = fma(_1588, _1576, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1602 = fma(_1588, _1580, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1604 = fma(_1588, _1584, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1536 = _1596;
            _1530 = _1602;
            _1512 = _1594;
            _1524 = _1600;
            _1518 = _1598;
            _1544 = _1604;
            _1606 = true;
        }
        else
        {
            bool _1608 = _961 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1610 = isnan(_961);
            bool _1612 = _1608 || _1610;
            bool _1614 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1616 = _1612 || _1614;
            if (!_1616)
            {
                _1510 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1618 = _1510;
            _1512 = _1618;
            if (!_1616)
            {
                _1534 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1620 = _1534;
            _1536 = _1620;
            if (!_1616)
            {
                _1516 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1622 = _1516;
            _1518 = _1622;
            if (!_1616)
            {
                _1522 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1624 = _1522;
            _1524 = _1624;
            if (!_1616)
            {
                _1528 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1626 = _1528;
            _1530 = _1626;
            if (!_1616)
            {
                _1542 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1628 = _1542;
            bool _1630 = !_1616;
            _1544 = _1628;
            if (!_1630)
            {
                bool _1632 = _961 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1634 = isnan(_961);
                bool _1636 = _1632 || _1634;
                bool _1638 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1640 = _1636 || _1638;
                if (!_1640)
                {
                    float _1642 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1644 = _961 + _1642;
                    float _1646 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1648 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1646;
                    float _1650 = 1.0 / _1648;
                    float _1652 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1654 = _1652 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1656 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1658 = _1656 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1660 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1662 = _1660 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1664 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1666 = _1664 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1668 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1670 = _1668 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1672 = _1644 * _1650;
                    float _1674 = precise::clamp(_1672, 0.0, 1.0);
                    float _1676 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1678 = _1676 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1680 = fma(_1674, _1654, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1682 = fma(_1674, _1678, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1684 = fma(_1674, _1658, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1686 = fma(_1674, _1662, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1688 = fma(_1674, _1666, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1690 = fma(_1674, _1670, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1536 = _1682;
                    _1530 = _1688;
                    _1512 = _1680;
                    _1524 = _1686;
                    _1518 = _1684;
                    _1544 = _1690;
                    _1606 = true;
                }
                else
                {
                    _1536 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1530 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1512 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1524 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1518 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1544 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1606 = false;
    float _1692 = _1536;
    float _1694 = _1530;
    float _1696 = _1512;
    float _1698 = _1524;
    float _1700 = _1518;
    float _1702 = _1544;
    float _1704 = fma(_677, -0.5, 0.5);
    float _1706 = precise::clamp(_1704, 0.0, 1.0);
    float _1708 = -_1692;
    float _1710 = _1708 + _1694;
    float _1712 = _1504 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1714 = -_1696;
    float _1716 = _1714 + _1698;
    out.m_84.x = 0.0;
    float _1718 = fma(_1706, _1710, _1692);
    float _1720 = fma(_1706, _1716, _1696);
    out.m_53.x = _1712;
    float _1722 = -_1700;
    float _1724 = _1722 + _1702;
    float _1726 = _1718 * 0.586610972881317138671875;
    bool _1728 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1730 = fma(_1706, _1724, _1700);
    float _1732 = fma(_1720, 0.298911988735198974609375, _1726);
    bool _1734 = _1450 > 0.0;
    bool _1736 = isnan(_1450);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan(0.0);
    bool _1742 = _1738 || _1740;
    float _1744 = fma(_1730, 0.114477999508380889892578125, _1732);
    float _1746 = -_1744;
    float _1748 = _1720 + _1746;
    float _1750 = -_1744;
    float _1752 = _1718 + _1750;
    float _1754 = -_1744;
    float _1756 = _1730 + _1754;
    float _1758 = fma(_1748, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1744);
    float _1760 = fma(_1752, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1744);
    float _1762 = fma(_1756, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1744);
    bool _1764 = !_1728;
    if (!_1764)
    {
        float _1766 = -_927;
        float _1768 = _1766 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1770 = -_931;
        float _1772 = _1770 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1774 = -_939;
        float _1776 = _1774 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1778 = _1768 * _1768;
        float _1780 = fma(_1772, _1772, _1778);
        float _1782 = fma(_1776, _1776, _1780);
        float _1784 = sqrt(_1782);
        float _1786 = rsqrt(_1782);
        float _1788 = -_1784;
        float _1790 = _1788 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1792 = _1790 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1794 = precise::clamp(_1792, 0.0, 1.0);
        float _1796 = _1772 * _1786;
        float _1798 = _1768 * _1786;
        float _1800 = abs(_1794);
        float _1802 = log2(_1800);
        float _1804 = _1776 * _1786;
        float _1806 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1808 = _677 * _1798;
        float _1810 = -_1798;
        float _1812 = -_1806;
        float _1814 = fma(_1810, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1812);
        float _1816 = fma(_675, _1796, _1808);
        float _1818 = -_1804;
        float _1820 = fma(_1818, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1814);
        float _1822 = fma(_679, _1804, _1816);
        float _1824 = precise::clamp(_1822, 0.0, 1.0);
        float _1826 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1828 = _1820 + _1826;
        float _1830 = _1802 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1832 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1834 = precise::clamp(_1832, 0.0, 1.0);
        float _1836 = exp2(_1830);
        float _1838 = _1836 * _1834;
        float _1840 = _1824 * _1838;
        float _1842 = _1840 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1844 = _1840 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1846 = _1840 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _1842;
        out.m_84.y = _1844;
        out.m_84.z = _1846;
    }
    out.m_86.x = _1758;
    out.m_86.y = _1760;
    out.m_86.z = _1762;
    if (_1742)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _1848 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1848;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

